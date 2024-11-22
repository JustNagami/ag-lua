return {
	Play114282001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 114282001
		arg_1_1.duration_ = 5.736999999999

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play114282002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = 0.5

			if var_4_0 < arg_1_1.time_ and arg_1_1.time_ <= var_4_0 + arg_4_0 then
				arg_1_1.fswbg_:SetActive(true)
				arg_1_1.dialog_:SetActive(false)

				arg_1_1.fswtw_.percent = 0

				local var_4_1 = arg_1_1:GetWordFromCfg(114282001)
				local var_4_2 = arg_1_1:FormatText(var_4_1.content)

				arg_1_1.fswt_.text = var_4_2

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.fswt_)

				arg_1_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_1_1.fswtw_:SetDirty()

				arg_1_1.typewritterCharCountI18N = 0

				arg_1_1:ShowNextGo(false)
			end

			local var_4_3 = 0.516666666666667

			if var_4_3 < arg_1_1.time_ and arg_1_1.time_ <= var_4_3 + arg_4_0 then
				arg_1_1.var_.oldValueTypewriter = arg_1_1.fswtw_.percent

				arg_1_1:ShowNextGo(false)
			end

			local var_4_4 = 24
			local var_4_5 = 1.6
			local var_4_6 = arg_1_1:GetWordFromCfg(114282001)
			local var_4_7 = arg_1_1:FormatText(var_4_6.content)
			local var_4_8, var_4_9 = arg_1_1:GetPercentByPara(var_4_7, 1)

			if var_4_3 < arg_1_1.time_ and arg_1_1.time_ <= var_4_3 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				local var_4_10 = var_4_4 <= 0 and var_4_5 or var_4_5 * ((var_4_9 - arg_1_1.typewritterCharCountI18N) / var_4_4)

				if var_4_10 > 0 and var_4_5 < var_4_10 then
					arg_1_1.talkMaxDuration = var_4_10

					if var_4_10 + var_4_3 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_10 + var_4_3
					end
				end
			end

			local var_4_11 = 1.6
			local var_4_12 = math.max(var_4_11, arg_1_1.talkMaxDuration)

			if var_4_3 <= arg_1_1.time_ and arg_1_1.time_ < var_4_3 + var_4_12 then
				local var_4_13 = (arg_1_1.time_ - var_4_3) / var_4_12

				arg_1_1.fswtw_.percent = Mathf.Lerp(arg_1_1.var_.oldValueTypewriter, var_4_8, var_4_13)
				arg_1_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_1_1.fswtw_:SetDirty()
			end

			if arg_1_1.time_ >= var_4_3 + var_4_12 and arg_1_1.time_ < var_4_3 + var_4_12 + arg_4_0 then
				arg_1_1.fswtw_.percent = var_4_8

				arg_1_1.fswtw_:SetDirty()
				arg_1_1:ShowNextGo(true)

				arg_1_1.typewritterCharCountI18N = var_4_9
			end

			local var_4_14 = 0

			if var_4_14 < arg_1_1.time_ and arg_1_1.time_ <= var_4_14 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = true

				arg_1_1:SetGaussion(false)
			end

			local var_4_15 = 2

			if var_4_14 <= arg_1_1.time_ and arg_1_1.time_ < var_4_14 + var_4_15 then
				local var_4_16 = (arg_1_1.time_ - var_4_14) / var_4_15
				local var_4_17 = Color.New(0, 0, 0)

				var_4_17.a = Mathf.Lerp(1, 0, var_4_16)
				arg_1_1.mask_.color = var_4_17
			end

			if arg_1_1.time_ >= var_4_14 + var_4_15 and arg_1_1.time_ < var_4_14 + var_4_15 + arg_4_0 then
				local var_4_18 = Color.New(0, 0, 0)
				local var_4_19 = 0

				arg_1_1.mask_.enabled = false
				var_4_18.a = var_4_19
				arg_1_1.mask_.color = var_4_18
			end

			local var_4_20 = 0
			local var_4_21 = 1

			if var_4_20 < arg_1_1.time_ and arg_1_1.time_ <= var_4_20 + arg_4_0 then
				local var_4_22 = "play"
				local var_4_23 = "music"

				arg_1_1:AudioAction(var_4_22, var_4_23, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_24 = 0.5
			local var_4_25 = 5.237
			local var_4_26 = manager.audio:GetVoiceLength("story_v_out_114282", "114282001", "story_v_out_114282.awb") / 1000

			if var_4_26 > 0 and var_4_25 < var_4_26 and var_4_26 + var_4_24 > arg_1_1.duration_ then
				local var_4_27 = var_4_26

				arg_1_1.duration_ = var_4_26 + var_4_24
			end

			if var_4_24 < arg_1_1.time_ and arg_1_1.time_ <= var_4_24 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "voice"

				arg_1_1:AudioAction(var_4_28, var_4_29, "story_v_out_114282", "114282001", "story_v_out_114282.awb")
			end
		end
	end,
	Play114282002 = function(arg_5_0, arg_5_1)
		arg_5_1.time_ = 0
		arg_5_1.frameCnt_ = 0
		arg_5_1.state_ = "playing"
		arg_5_1.curTalkId_ = 114282002
		arg_5_1.duration_ = 3.781999999999

		SetActive(arg_5_1.tipsGo_, false)

		function arg_5_1.onSingleLineFinish_()
			arg_5_1.onSingleLineUpdate_ = nil
			arg_5_1.onSingleLineFinish_ = nil
			arg_5_1.state_ = "waiting"
		end

		function arg_5_1.playNext_(arg_7_0)
			if arg_7_0 == 1 then
				arg_5_0:Play114282003(arg_5_1)
			end
		end

		function arg_5_1.onSingleLineUpdate_(arg_8_0)
			local var_8_0 = 0

			if var_8_0 < arg_5_1.time_ and arg_5_1.time_ <= var_8_0 + arg_8_0 then
				arg_5_1.var_.oldValueTypewriter = arg_5_1.fswtw_.percent

				arg_5_1:ShowNextGo(false)
			end

			local var_8_1 = 18
			local var_8_2 = 1.2
			local var_8_3 = arg_5_1:GetWordFromCfg(114282001)
			local var_8_4 = arg_5_1:FormatText(var_8_3.content)
			local var_8_5, var_8_6 = arg_5_1:GetPercentByPara(var_8_4, 2)

			if var_8_0 < arg_5_1.time_ and arg_5_1.time_ <= var_8_0 + arg_8_0 then
				arg_5_1.talkMaxDuration = 0

				local var_8_7 = var_8_1 <= 0 and var_8_2 or var_8_2 * ((var_8_6 - arg_5_1.typewritterCharCountI18N) / var_8_1)

				if var_8_7 > 0 and var_8_2 < var_8_7 then
					arg_5_1.talkMaxDuration = var_8_7

					if var_8_7 + var_8_0 > arg_5_1.duration_ then
						arg_5_1.duration_ = var_8_7 + var_8_0
					end
				end
			end

			local var_8_8 = 1.2
			local var_8_9 = math.max(var_8_8, arg_5_1.talkMaxDuration)

			if var_8_0 <= arg_5_1.time_ and arg_5_1.time_ < var_8_0 + var_8_9 then
				local var_8_10 = (arg_5_1.time_ - var_8_0) / var_8_9

				arg_5_1.fswtw_.percent = Mathf.Lerp(arg_5_1.var_.oldValueTypewriter, var_8_5, var_8_10)
				arg_5_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_5_1.fswtw_:SetDirty()
			end

			if arg_5_1.time_ >= var_8_0 + var_8_9 and arg_5_1.time_ < var_8_0 + var_8_9 + arg_8_0 then
				arg_5_1.fswtw_.percent = var_8_5

				arg_5_1.fswtw_:SetDirty()
				arg_5_1:ShowNextGo(true)

				arg_5_1.typewritterCharCountI18N = var_8_6
			end

			local var_8_11 = 0
			local var_8_12 = 3.782
			local var_8_13 = manager.audio:GetVoiceLength("story_v_out_114282", "114282002", "story_v_out_114282.awb") / 1000

			if var_8_13 > 0 and var_8_12 < var_8_13 and var_8_13 + var_8_11 > arg_5_1.duration_ then
				local var_8_14 = var_8_13

				arg_5_1.duration_ = var_8_13 + var_8_11
			end

			if var_8_11 < arg_5_1.time_ and arg_5_1.time_ <= var_8_11 + arg_8_0 then
				local var_8_15 = "play"
				local var_8_16 = "voice"

				arg_5_1:AudioAction(var_8_15, var_8_16, "story_v_out_114282", "114282002", "story_v_out_114282.awb")
			end
		end
	end,
	Play114282003 = function(arg_9_0, arg_9_1)
		arg_9_1.time_ = 0
		arg_9_1.frameCnt_ = 0
		arg_9_1.state_ = "playing"
		arg_9_1.curTalkId_ = 114282003
		arg_9_1.duration_ = 0.999999999999

		SetActive(arg_9_1.tipsGo_, false)

		function arg_9_1.onSingleLineFinish_()
			arg_9_1.onSingleLineUpdate_ = nil
			arg_9_1.onSingleLineFinish_ = nil
			arg_9_1.state_ = "waiting"
		end

		function arg_9_1.playNext_(arg_11_0)
			if arg_11_0 == 1 then
				arg_9_0:Play114282004(arg_9_1)
			end
		end

		function arg_9_1.onSingleLineUpdate_(arg_12_0)
			local var_12_0 = 0

			if var_12_0 < arg_9_1.time_ and arg_9_1.time_ <= var_12_0 + arg_12_0 then
				arg_9_1.var_.oldValueTypewriter = arg_9_1.fswtw_.percent

				arg_9_1:ShowNextGo(false)
			end

			local var_12_1 = 10
			local var_12_2 = 0.666666666666667
			local var_12_3 = arg_9_1:GetWordFromCfg(114282001)
			local var_12_4 = arg_9_1:FormatText(var_12_3.content)
			local var_12_5, var_12_6 = arg_9_1:GetPercentByPara(var_12_4, 3)

			if var_12_0 < arg_9_1.time_ and arg_9_1.time_ <= var_12_0 + arg_12_0 then
				arg_9_1.talkMaxDuration = 0

				local var_12_7 = var_12_1 <= 0 and var_12_2 or var_12_2 * ((var_12_6 - arg_9_1.typewritterCharCountI18N) / var_12_1)

				if var_12_7 > 0 and var_12_2 < var_12_7 then
					arg_9_1.talkMaxDuration = var_12_7

					if var_12_7 + var_12_0 > arg_9_1.duration_ then
						arg_9_1.duration_ = var_12_7 + var_12_0
					end
				end
			end

			local var_12_8 = 0.666666666666667
			local var_12_9 = math.max(var_12_8, arg_9_1.talkMaxDuration)

			if var_12_0 <= arg_9_1.time_ and arg_9_1.time_ < var_12_0 + var_12_9 then
				local var_12_10 = (arg_9_1.time_ - var_12_0) / var_12_9

				arg_9_1.fswtw_.percent = Mathf.Lerp(arg_9_1.var_.oldValueTypewriter, var_12_5, var_12_10)
				arg_9_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_9_1.fswtw_:SetDirty()
			end

			if arg_9_1.time_ >= var_12_0 + var_12_9 and arg_9_1.time_ < var_12_0 + var_12_9 + arg_12_0 then
				arg_9_1.fswtw_.percent = var_12_5

				arg_9_1.fswtw_:SetDirty()
				arg_9_1:ShowNextGo(true)

				arg_9_1.typewritterCharCountI18N = var_12_6
			end

			local var_12_11 = 0
			local var_12_12 = 0.803
			local var_12_13 = manager.audio:GetVoiceLength("story_v_out_114282", "114282003", "story_v_out_114282.awb") / 1000

			if var_12_13 > 0 and var_12_12 < var_12_13 and var_12_13 + var_12_11 > arg_9_1.duration_ then
				local var_12_14 = var_12_13

				arg_9_1.duration_ = var_12_13 + var_12_11
			end

			if var_12_11 < arg_9_1.time_ and arg_9_1.time_ <= var_12_11 + arg_12_0 then
				local var_12_15 = "play"
				local var_12_16 = "voice"

				arg_9_1:AudioAction(var_12_15, var_12_16, "story_v_out_114282", "114282003", "story_v_out_114282.awb")
			end
		end
	end,
	Play114282004 = function(arg_13_0, arg_13_1)
		arg_13_1.time_ = 0
		arg_13_1.frameCnt_ = 0
		arg_13_1.state_ = "playing"
		arg_13_1.curTalkId_ = 114282004
		arg_13_1.duration_ = 1.647999999999

		SetActive(arg_13_1.tipsGo_, false)

		function arg_13_1.onSingleLineFinish_()
			arg_13_1.onSingleLineUpdate_ = nil
			arg_13_1.onSingleLineFinish_ = nil
			arg_13_1.state_ = "waiting"
		end

		function arg_13_1.playNext_(arg_15_0)
			if arg_15_0 == 1 then
				arg_13_0:Play114282005(arg_13_1)
			end
		end

		function arg_13_1.onSingleLineUpdate_(arg_16_0)
			local var_16_0 = 0

			if var_16_0 < arg_13_1.time_ and arg_13_1.time_ <= var_16_0 + arg_16_0 then
				arg_13_1.var_.oldValueTypewriter = arg_13_1.fswtw_.percent

				arg_13_1:ShowNextGo(false)
			end

			local var_16_1 = 13
			local var_16_2 = 0.866666666666667
			local var_16_3 = arg_13_1:GetWordFromCfg(114282001)
			local var_16_4 = arg_13_1:FormatText(var_16_3.content)
			local var_16_5, var_16_6 = arg_13_1:GetPercentByPara(var_16_4, 4)

			if var_16_0 < arg_13_1.time_ and arg_13_1.time_ <= var_16_0 + arg_16_0 then
				arg_13_1.talkMaxDuration = 0

				local var_16_7 = var_16_1 <= 0 and var_16_2 or var_16_2 * ((var_16_6 - arg_13_1.typewritterCharCountI18N) / var_16_1)

				if var_16_7 > 0 and var_16_2 < var_16_7 then
					arg_13_1.talkMaxDuration = var_16_7

					if var_16_7 + var_16_0 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_7 + var_16_0
					end
				end
			end

			local var_16_8 = 0.866666666666667
			local var_16_9 = math.max(var_16_8, arg_13_1.talkMaxDuration)

			if var_16_0 <= arg_13_1.time_ and arg_13_1.time_ < var_16_0 + var_16_9 then
				local var_16_10 = (arg_13_1.time_ - var_16_0) / var_16_9

				arg_13_1.fswtw_.percent = Mathf.Lerp(arg_13_1.var_.oldValueTypewriter, var_16_5, var_16_10)
				arg_13_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_13_1.fswtw_:SetDirty()
			end

			if arg_13_1.time_ >= var_16_0 + var_16_9 and arg_13_1.time_ < var_16_0 + var_16_9 + arg_16_0 then
				arg_13_1.fswtw_.percent = var_16_5

				arg_13_1.fswtw_:SetDirty()
				arg_13_1:ShowNextGo(true)

				arg_13_1.typewritterCharCountI18N = var_16_6
			end

			local var_16_11 = 0
			local var_16_12 = 1.648
			local var_16_13 = manager.audio:GetVoiceLength("story_v_out_114282", "114282004", "story_v_out_114282.awb") / 1000

			if var_16_13 > 0 and var_16_12 < var_16_13 and var_16_13 + var_16_11 > arg_13_1.duration_ then
				local var_16_14 = var_16_13

				arg_13_1.duration_ = var_16_13 + var_16_11
			end

			if var_16_11 < arg_13_1.time_ and arg_13_1.time_ <= var_16_11 + arg_16_0 then
				local var_16_15 = "play"
				local var_16_16 = "voice"

				arg_13_1:AudioAction(var_16_15, var_16_16, "story_v_out_114282", "114282004", "story_v_out_114282.awb")
			end
		end
	end,
	Play114282005 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 114282005
		arg_17_1.duration_ = 3.199999999999

		SetActive(arg_17_1.tipsGo_, false)

		function arg_17_1.onSingleLineFinish_()
			arg_17_1.onSingleLineUpdate_ = nil
			arg_17_1.onSingleLineFinish_ = nil
			arg_17_1.state_ = "waiting"
		end

		function arg_17_1.playNext_(arg_19_0)
			if arg_19_0 == 1 then
				arg_17_0:Play114282006(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = 0

			if var_20_0 < arg_17_1.time_ and arg_17_1.time_ <= var_20_0 + arg_20_0 then
				arg_17_1.var_.oldValueTypewriter = arg_17_1.fswtw_.percent

				arg_17_1:ShowNextGo(false)
			end

			local var_20_1 = 48
			local var_20_2 = 3.2
			local var_20_3 = arg_17_1:GetWordFromCfg(114282001)
			local var_20_4 = arg_17_1:FormatText(var_20_3.content)
			local var_20_5, var_20_6 = arg_17_1:GetPercentByPara(var_20_4, 5)

			if var_20_0 < arg_17_1.time_ and arg_17_1.time_ <= var_20_0 + arg_20_0 then
				arg_17_1.talkMaxDuration = 0

				local var_20_7 = var_20_1 <= 0 and var_20_2 or var_20_2 * ((var_20_6 - arg_17_1.typewritterCharCountI18N) / var_20_1)

				if var_20_7 > 0 and var_20_2 < var_20_7 then
					arg_17_1.talkMaxDuration = var_20_7

					if var_20_7 + var_20_0 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_7 + var_20_0
					end
				end
			end

			local var_20_8 = 3.2
			local var_20_9 = math.max(var_20_8, arg_17_1.talkMaxDuration)

			if var_20_0 <= arg_17_1.time_ and arg_17_1.time_ < var_20_0 + var_20_9 then
				local var_20_10 = (arg_17_1.time_ - var_20_0) / var_20_9

				arg_17_1.fswtw_.percent = Mathf.Lerp(arg_17_1.var_.oldValueTypewriter, var_20_5, var_20_10)
				arg_17_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_17_1.fswtw_:SetDirty()
			end

			if arg_17_1.time_ >= var_20_0 + var_20_9 and arg_17_1.time_ < var_20_0 + var_20_9 + arg_20_0 then
				arg_17_1.fswtw_.percent = var_20_5

				arg_17_1.fswtw_:SetDirty()
				arg_17_1:ShowNextGo(true)

				arg_17_1.typewritterCharCountI18N = var_20_6
			end
		end
	end,
	Play114282006 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 114282006
		arg_21_1.duration_ = 8.486999999999

		SetActive(arg_21_1.tipsGo_, false)

		function arg_21_1.onSingleLineFinish_()
			arg_21_1.onSingleLineUpdate_ = nil
			arg_21_1.onSingleLineFinish_ = nil
			arg_21_1.state_ = "waiting"
		end

		function arg_21_1.playNext_(arg_23_0)
			if arg_23_0 == 1 then
				arg_21_0:Play114282007(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = 0

			if var_24_0 < arg_21_1.time_ and arg_21_1.time_ <= var_24_0 + arg_24_0 then
				arg_21_1.var_.oldValueTypewriter = arg_21_1.fswtw_.percent

				arg_21_1:ShowNextGo(false)
			end

			local var_24_1 = 30
			local var_24_2 = 2
			local var_24_3 = arg_21_1:GetWordFromCfg(114282001)
			local var_24_4 = arg_21_1:FormatText(var_24_3.content)
			local var_24_5, var_24_6 = arg_21_1:GetPercentByPara(var_24_4, 6)

			if var_24_0 < arg_21_1.time_ and arg_21_1.time_ <= var_24_0 + arg_24_0 then
				arg_21_1.talkMaxDuration = 0

				local var_24_7 = var_24_1 <= 0 and var_24_2 or var_24_2 * ((var_24_6 - arg_21_1.typewritterCharCountI18N) / var_24_1)

				if var_24_7 > 0 and var_24_2 < var_24_7 then
					arg_21_1.talkMaxDuration = var_24_7

					if var_24_7 + var_24_0 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_7 + var_24_0
					end
				end
			end

			local var_24_8 = 2
			local var_24_9 = math.max(var_24_8, arg_21_1.talkMaxDuration)

			if var_24_0 <= arg_21_1.time_ and arg_21_1.time_ < var_24_0 + var_24_9 then
				local var_24_10 = (arg_21_1.time_ - var_24_0) / var_24_9

				arg_21_1.fswtw_.percent = Mathf.Lerp(arg_21_1.var_.oldValueTypewriter, var_24_5, var_24_10)
				arg_21_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_21_1.fswtw_:SetDirty()
			end

			if arg_21_1.time_ >= var_24_0 + var_24_9 and arg_21_1.time_ < var_24_0 + var_24_9 + arg_24_0 then
				arg_21_1.fswtw_.percent = var_24_5

				arg_21_1.fswtw_:SetDirty()
				arg_21_1:ShowNextGo(true)

				arg_21_1.typewritterCharCountI18N = var_24_6
			end

			local var_24_11 = 0
			local var_24_12 = 8.487
			local var_24_13 = manager.audio:GetVoiceLength("story_v_out_114282", "114282006", "story_v_out_114282.awb") / 1000

			if var_24_13 > 0 and var_24_12 < var_24_13 and var_24_13 + var_24_11 > arg_21_1.duration_ then
				local var_24_14 = var_24_13

				arg_21_1.duration_ = var_24_13 + var_24_11
			end

			if var_24_11 < arg_21_1.time_ and arg_21_1.time_ <= var_24_11 + arg_24_0 then
				local var_24_15 = "play"
				local var_24_16 = "voice"

				arg_21_1:AudioAction(var_24_15, var_24_16, "story_v_out_114282", "114282006", "story_v_out_114282.awb")
			end
		end
	end,
	Play114282007 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 114282007
		arg_25_1.duration_ = 0.999999999999

		SetActive(arg_25_1.tipsGo_, false)

		function arg_25_1.onSingleLineFinish_()
			arg_25_1.onSingleLineUpdate_ = nil
			arg_25_1.onSingleLineFinish_ = nil
			arg_25_1.state_ = "waiting"
		end

		function arg_25_1.playNext_(arg_27_0)
			if arg_27_0 == 1 then
				arg_25_0:Play114282008(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = 0

			if var_28_0 < arg_25_1.time_ and arg_25_1.time_ <= var_28_0 + arg_28_0 then
				arg_25_1.var_.oldValueTypewriter = arg_25_1.fswtw_.percent

				arg_25_1:ShowNextGo(false)
			end

			local var_28_1 = 11
			local var_28_2 = 0.733333333333333
			local var_28_3 = arg_25_1:GetWordFromCfg(114282001)
			local var_28_4 = arg_25_1:FormatText(var_28_3.content)
			local var_28_5, var_28_6 = arg_25_1:GetPercentByPara(var_28_4, 7)

			if var_28_0 < arg_25_1.time_ and arg_25_1.time_ <= var_28_0 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0

				local var_28_7 = var_28_1 <= 0 and var_28_2 or var_28_2 * ((var_28_6 - arg_25_1.typewritterCharCountI18N) / var_28_1)

				if var_28_7 > 0 and var_28_2 < var_28_7 then
					arg_25_1.talkMaxDuration = var_28_7

					if var_28_7 + var_28_0 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_7 + var_28_0
					end
				end
			end

			local var_28_8 = 0.733333333333333
			local var_28_9 = math.max(var_28_8, arg_25_1.talkMaxDuration)

			if var_28_0 <= arg_25_1.time_ and arg_25_1.time_ < var_28_0 + var_28_9 then
				local var_28_10 = (arg_25_1.time_ - var_28_0) / var_28_9

				arg_25_1.fswtw_.percent = Mathf.Lerp(arg_25_1.var_.oldValueTypewriter, var_28_5, var_28_10)
				arg_25_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_25_1.fswtw_:SetDirty()
			end

			if arg_25_1.time_ >= var_28_0 + var_28_9 and arg_25_1.time_ < var_28_0 + var_28_9 + arg_28_0 then
				arg_25_1.fswtw_.percent = var_28_5

				arg_25_1.fswtw_:SetDirty()
				arg_25_1:ShowNextGo(true)

				arg_25_1.typewritterCharCountI18N = var_28_6
			end

			local var_28_11 = 0
			local var_28_12 = 0.767
			local var_28_13 = manager.audio:GetVoiceLength("story_v_out_114282", "114282007", "story_v_out_114282.awb") / 1000

			if var_28_13 > 0 and var_28_12 < var_28_13 and var_28_13 + var_28_11 > arg_25_1.duration_ then
				local var_28_14 = var_28_13

				arg_25_1.duration_ = var_28_13 + var_28_11
			end

			if var_28_11 < arg_25_1.time_ and arg_25_1.time_ <= var_28_11 + arg_28_0 then
				local var_28_15 = "play"
				local var_28_16 = "voice"

				arg_25_1:AudioAction(var_28_15, var_28_16, "story_v_out_114282", "114282007", "story_v_out_114282.awb")
			end
		end
	end,
	Play114282008 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 114282008
		arg_29_1.duration_ = 2.394999999999

		SetActive(arg_29_1.tipsGo_, false)

		function arg_29_1.onSingleLineFinish_()
			arg_29_1.onSingleLineUpdate_ = nil
			arg_29_1.onSingleLineFinish_ = nil
			arg_29_1.state_ = "waiting"
		end

		function arg_29_1.playNext_(arg_31_0)
			if arg_31_0 == 1 then
				arg_29_0:Play114282009(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = 0

			if var_32_0 < arg_29_1.time_ and arg_29_1.time_ <= var_32_0 + arg_32_0 then
				arg_29_1.var_.oldValueTypewriter = arg_29_1.fswtw_.percent

				arg_29_1:ShowNextGo(false)
			end

			local var_32_1 = 0
			local var_32_2 = 0
			local var_32_3 = arg_29_1:GetWordFromCfg(114282001)
			local var_32_4 = arg_29_1:FormatText(var_32_3.content)
			local var_32_5, var_32_6 = arg_29_1:GetPercentByPara(var_32_4, 7)

			if var_32_0 < arg_29_1.time_ and arg_29_1.time_ <= var_32_0 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0

				local var_32_7 = var_32_1 <= 0 and var_32_2 or var_32_2 * ((var_32_6 - arg_29_1.typewritterCharCountI18N) / var_32_1)

				if var_32_7 > 0 and var_32_2 < var_32_7 then
					arg_29_1.talkMaxDuration = var_32_7

					if var_32_7 + var_32_0 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_7 + var_32_0
					end
				end
			end

			local var_32_8 = 0
			local var_32_9 = math.max(var_32_8, arg_29_1.talkMaxDuration)

			if var_32_0 <= arg_29_1.time_ and arg_29_1.time_ < var_32_0 + var_32_9 then
				local var_32_10 = (arg_29_1.time_ - var_32_0) / var_32_9

				arg_29_1.fswtw_.percent = Mathf.Lerp(arg_29_1.var_.oldValueTypewriter, var_32_5, var_32_10)
				arg_29_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_29_1.fswtw_:SetDirty()
			end

			if arg_29_1.time_ >= var_32_0 + var_32_9 and arg_29_1.time_ < var_32_0 + var_32_9 + arg_32_0 then
				arg_29_1.fswtw_.percent = var_32_5

				arg_29_1.fswtw_:SetDirty()
				arg_29_1:ShowNextGo(true)

				arg_29_1.typewritterCharCountI18N = var_32_6
			end

			local var_32_11 = 0

			if var_32_11 < arg_29_1.time_ and arg_29_1.time_ <= var_32_11 + arg_32_0 then
				arg_29_1.fswbg_:SetActive(true)
				arg_29_1.dialog_:SetActive(false)

				arg_29_1.fswtw_.percent = 0

				local var_32_12 = arg_29_1:GetWordFromCfg(114282008)
				local var_32_13 = arg_29_1:FormatText(var_32_12.content)

				arg_29_1.fswt_.text = var_32_13

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.fswt_)

				arg_29_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_29_1.fswtw_:SetDirty()

				arg_29_1.typewritterCharCountI18N = 0

				arg_29_1:ShowNextGo(false)
			end

			local var_32_14 = 0.0166666666666667

			if var_32_14 < arg_29_1.time_ and arg_29_1.time_ <= var_32_14 + arg_32_0 then
				arg_29_1.var_.oldValueTypewriter = arg_29_1.fswtw_.percent

				arg_29_1:ShowNextGo(false)
			end

			local var_32_15 = 16
			local var_32_16 = 1.06666666666667
			local var_32_17 = arg_29_1:GetWordFromCfg(114282008)
			local var_32_18 = arg_29_1:FormatText(var_32_17.content)
			local var_32_19, var_32_20 = arg_29_1:GetPercentByPara(var_32_18, 1)

			if var_32_14 < arg_29_1.time_ and arg_29_1.time_ <= var_32_14 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0

				local var_32_21 = var_32_15 <= 0 and var_32_16 or var_32_16 * ((var_32_20 - arg_29_1.typewritterCharCountI18N) / var_32_15)

				if var_32_21 > 0 and var_32_16 < var_32_21 then
					arg_29_1.talkMaxDuration = var_32_21

					if var_32_21 + var_32_14 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_21 + var_32_14
					end
				end
			end

			local var_32_22 = 1.06666666666667
			local var_32_23 = math.max(var_32_22, arg_29_1.talkMaxDuration)

			if var_32_14 <= arg_29_1.time_ and arg_29_1.time_ < var_32_14 + var_32_23 then
				local var_32_24 = (arg_29_1.time_ - var_32_14) / var_32_23

				arg_29_1.fswtw_.percent = Mathf.Lerp(arg_29_1.var_.oldValueTypewriter, var_32_19, var_32_24)
				arg_29_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_29_1.fswtw_:SetDirty()
			end

			if arg_29_1.time_ >= var_32_14 + var_32_23 and arg_29_1.time_ < var_32_14 + var_32_23 + arg_32_0 then
				arg_29_1.fswtw_.percent = var_32_19

				arg_29_1.fswtw_:SetDirty()
				arg_29_1:ShowNextGo(true)

				arg_29_1.typewritterCharCountI18N = var_32_20
			end

			local var_32_25 = 0
			local var_32_26 = 2.395
			local var_32_27 = manager.audio:GetVoiceLength("story_v_out_114282", "114282008", "story_v_out_114282.awb") / 1000

			if var_32_27 > 0 and var_32_26 < var_32_27 and var_32_27 + var_32_25 > arg_29_1.duration_ then
				local var_32_28 = var_32_27

				arg_29_1.duration_ = var_32_27 + var_32_25
			end

			if var_32_25 < arg_29_1.time_ and arg_29_1.time_ <= var_32_25 + arg_32_0 then
				local var_32_29 = "play"
				local var_32_30 = "voice"

				arg_29_1:AudioAction(var_32_29, var_32_30, "story_v_out_114282", "114282008", "story_v_out_114282.awb")
			end
		end
	end,
	Play114282009 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 114282009
		arg_33_1.duration_ = 4.926999999999

		SetActive(arg_33_1.tipsGo_, false)

		function arg_33_1.onSingleLineFinish_()
			arg_33_1.onSingleLineUpdate_ = nil
			arg_33_1.onSingleLineFinish_ = nil
			arg_33_1.state_ = "waiting"
		end

		function arg_33_1.playNext_(arg_35_0)
			if arg_35_0 == 1 then
				arg_33_0:Play114282010(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = 0

			if var_36_0 < arg_33_1.time_ and arg_33_1.time_ <= var_36_0 + arg_36_0 then
				arg_33_1.var_.oldValueTypewriter = arg_33_1.fswtw_.percent

				arg_33_1:ShowNextGo(false)
			end

			local var_36_1 = 29
			local var_36_2 = 1.93333333333333
			local var_36_3 = arg_33_1:GetWordFromCfg(114282008)
			local var_36_4 = arg_33_1:FormatText(var_36_3.content)
			local var_36_5, var_36_6 = arg_33_1:GetPercentByPara(var_36_4, 2)

			if var_36_0 < arg_33_1.time_ and arg_33_1.time_ <= var_36_0 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0

				local var_36_7 = var_36_1 <= 0 and var_36_2 or var_36_2 * ((var_36_6 - arg_33_1.typewritterCharCountI18N) / var_36_1)

				if var_36_7 > 0 and var_36_2 < var_36_7 then
					arg_33_1.talkMaxDuration = var_36_7

					if var_36_7 + var_36_0 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_7 + var_36_0
					end
				end
			end

			local var_36_8 = 1.93333333333333
			local var_36_9 = math.max(var_36_8, arg_33_1.talkMaxDuration)

			if var_36_0 <= arg_33_1.time_ and arg_33_1.time_ < var_36_0 + var_36_9 then
				local var_36_10 = (arg_33_1.time_ - var_36_0) / var_36_9

				arg_33_1.fswtw_.percent = Mathf.Lerp(arg_33_1.var_.oldValueTypewriter, var_36_5, var_36_10)
				arg_33_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_33_1.fswtw_:SetDirty()
			end

			if arg_33_1.time_ >= var_36_0 + var_36_9 and arg_33_1.time_ < var_36_0 + var_36_9 + arg_36_0 then
				arg_33_1.fswtw_.percent = var_36_5

				arg_33_1.fswtw_:SetDirty()
				arg_33_1:ShowNextGo(true)

				arg_33_1.typewritterCharCountI18N = var_36_6
			end

			local var_36_11 = 0
			local var_36_12 = 4.927
			local var_36_13 = manager.audio:GetVoiceLength("story_v_out_114282", "114282009", "story_v_out_114282.awb") / 1000

			if var_36_13 > 0 and var_36_12 < var_36_13 and var_36_13 + var_36_11 > arg_33_1.duration_ then
				local var_36_14 = var_36_13

				arg_33_1.duration_ = var_36_13 + var_36_11
			end

			if var_36_11 < arg_33_1.time_ and arg_33_1.time_ <= var_36_11 + arg_36_0 then
				local var_36_15 = "play"
				local var_36_16 = "voice"

				arg_33_1:AudioAction(var_36_15, var_36_16, "story_v_out_114282", "114282009", "story_v_out_114282.awb")
			end
		end
	end,
	Play114282010 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 114282010
		arg_37_1.duration_ = 13.003999999999

		SetActive(arg_37_1.tipsGo_, false)

		function arg_37_1.onSingleLineFinish_()
			arg_37_1.onSingleLineUpdate_ = nil
			arg_37_1.onSingleLineFinish_ = nil
			arg_37_1.state_ = "waiting"
		end

		function arg_37_1.playNext_(arg_39_0)
			if arg_39_0 == 1 then
				arg_37_0:Play114282011(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = 0

			if var_40_0 < arg_37_1.time_ and arg_37_1.time_ <= var_40_0 + arg_40_0 then
				arg_37_1.var_.oldValueTypewriter = arg_37_1.fswtw_.percent

				arg_37_1:ShowNextGo(false)
			end

			local var_40_1 = 59
			local var_40_2 = 3.93333333333333
			local var_40_3 = arg_37_1:GetWordFromCfg(114282008)
			local var_40_4 = arg_37_1:FormatText(var_40_3.content)
			local var_40_5, var_40_6 = arg_37_1:GetPercentByPara(var_40_4, 3)

			if var_40_0 < arg_37_1.time_ and arg_37_1.time_ <= var_40_0 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0

				local var_40_7 = var_40_1 <= 0 and var_40_2 or var_40_2 * ((var_40_6 - arg_37_1.typewritterCharCountI18N) / var_40_1)

				if var_40_7 > 0 and var_40_2 < var_40_7 then
					arg_37_1.talkMaxDuration = var_40_7

					if var_40_7 + var_40_0 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_7 + var_40_0
					end
				end
			end

			local var_40_8 = 3.93333333333333
			local var_40_9 = math.max(var_40_8, arg_37_1.talkMaxDuration)

			if var_40_0 <= arg_37_1.time_ and arg_37_1.time_ < var_40_0 + var_40_9 then
				local var_40_10 = (arg_37_1.time_ - var_40_0) / var_40_9

				arg_37_1.fswtw_.percent = Mathf.Lerp(arg_37_1.var_.oldValueTypewriter, var_40_5, var_40_10)
				arg_37_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_37_1.fswtw_:SetDirty()
			end

			if arg_37_1.time_ >= var_40_0 + var_40_9 and arg_37_1.time_ < var_40_0 + var_40_9 + arg_40_0 then
				arg_37_1.fswtw_.percent = var_40_5

				arg_37_1.fswtw_:SetDirty()
				arg_37_1:ShowNextGo(true)

				arg_37_1.typewritterCharCountI18N = var_40_6
			end

			local var_40_11 = 0
			local var_40_12 = 13.004
			local var_40_13 = manager.audio:GetVoiceLength("story_v_out_114282", "114282010", "story_v_out_114282.awb") / 1000

			if var_40_13 > 0 and var_40_12 < var_40_13 and var_40_13 + var_40_11 > arg_37_1.duration_ then
				local var_40_14 = var_40_13

				arg_37_1.duration_ = var_40_13 + var_40_11
			end

			if var_40_11 < arg_37_1.time_ and arg_37_1.time_ <= var_40_11 + arg_40_0 then
				local var_40_15 = "play"
				local var_40_16 = "voice"

				arg_37_1:AudioAction(var_40_15, var_40_16, "story_v_out_114282", "114282010", "story_v_out_114282.awb")
			end
		end
	end,
	Play114282011 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 114282011
		arg_41_1.duration_ = 2.209999999999

		SetActive(arg_41_1.tipsGo_, false)

		function arg_41_1.onSingleLineFinish_()
			arg_41_1.onSingleLineUpdate_ = nil
			arg_41_1.onSingleLineFinish_ = nil
			arg_41_1.state_ = "waiting"
		end

		function arg_41_1.playNext_(arg_43_0)
			if arg_43_0 == 1 then
				arg_41_0:Play114282012(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = 0

			if var_44_0 < arg_41_1.time_ and arg_41_1.time_ <= var_44_0 + arg_44_0 then
				arg_41_1.var_.oldValueTypewriter = arg_41_1.fswtw_.percent

				arg_41_1:ShowNextGo(false)
			end

			local var_44_1 = 18
			local var_44_2 = 1.2
			local var_44_3 = arg_41_1:GetWordFromCfg(114282008)
			local var_44_4 = arg_41_1:FormatText(var_44_3.content)
			local var_44_5, var_44_6 = arg_41_1:GetPercentByPara(var_44_4, 4)

			if var_44_0 < arg_41_1.time_ and arg_41_1.time_ <= var_44_0 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0

				local var_44_7 = var_44_1 <= 0 and var_44_2 or var_44_2 * ((var_44_6 - arg_41_1.typewritterCharCountI18N) / var_44_1)

				if var_44_7 > 0 and var_44_2 < var_44_7 then
					arg_41_1.talkMaxDuration = var_44_7

					if var_44_7 + var_44_0 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_7 + var_44_0
					end
				end
			end

			local var_44_8 = 1.2
			local var_44_9 = math.max(var_44_8, arg_41_1.talkMaxDuration)

			if var_44_0 <= arg_41_1.time_ and arg_41_1.time_ < var_44_0 + var_44_9 then
				local var_44_10 = (arg_41_1.time_ - var_44_0) / var_44_9

				arg_41_1.fswtw_.percent = Mathf.Lerp(arg_41_1.var_.oldValueTypewriter, var_44_5, var_44_10)
				arg_41_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_41_1.fswtw_:SetDirty()
			end

			if arg_41_1.time_ >= var_44_0 + var_44_9 and arg_41_1.time_ < var_44_0 + var_44_9 + arg_44_0 then
				arg_41_1.fswtw_.percent = var_44_5

				arg_41_1.fswtw_:SetDirty()
				arg_41_1:ShowNextGo(true)

				arg_41_1.typewritterCharCountI18N = var_44_6
			end

			local var_44_11 = 0
			local var_44_12 = 2.21
			local var_44_13 = manager.audio:GetVoiceLength("story_v_out_114282", "114282011", "story_v_out_114282.awb") / 1000

			if var_44_13 > 0 and var_44_12 < var_44_13 and var_44_13 + var_44_11 > arg_41_1.duration_ then
				local var_44_14 = var_44_13

				arg_41_1.duration_ = var_44_13 + var_44_11
			end

			if var_44_11 < arg_41_1.time_ and arg_41_1.time_ <= var_44_11 + arg_44_0 then
				local var_44_15 = "play"
				local var_44_16 = "voice"

				arg_41_1:AudioAction(var_44_15, var_44_16, "story_v_out_114282", "114282011", "story_v_out_114282.awb")
			end
		end
	end,
	Play114282012 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 114282012
		arg_45_1.duration_ = 15.626999999999

		SetActive(arg_45_1.tipsGo_, false)

		function arg_45_1.onSingleLineFinish_()
			arg_45_1.onSingleLineUpdate_ = nil
			arg_45_1.onSingleLineFinish_ = nil
			arg_45_1.state_ = "waiting"
		end

		function arg_45_1.playNext_(arg_47_0)
			if arg_47_0 == 1 then
				arg_45_0:Play114282013(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = 0

			if var_48_0 < arg_45_1.time_ and arg_45_1.time_ <= var_48_0 + arg_48_0 then
				arg_45_1.var_.oldValueTypewriter = arg_45_1.fswtw_.percent

				arg_45_1:ShowNextGo(false)
			end

			local var_48_1 = 67
			local var_48_2 = 4.4
			local var_48_3 = arg_45_1:GetWordFromCfg(114282008)
			local var_48_4 = arg_45_1:FormatText(var_48_3.content)
			local var_48_5, var_48_6 = arg_45_1:GetPercentByPara(var_48_4, 5)

			if var_48_0 < arg_45_1.time_ and arg_45_1.time_ <= var_48_0 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0

				local var_48_7 = var_48_1 <= 0 and var_48_2 or var_48_2 * ((var_48_6 - arg_45_1.typewritterCharCountI18N) / var_48_1)

				if var_48_7 > 0 and var_48_2 < var_48_7 then
					arg_45_1.talkMaxDuration = var_48_7

					if var_48_7 + var_48_0 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_7 + var_48_0
					end
				end
			end

			local var_48_8 = 4.4
			local var_48_9 = math.max(var_48_8, arg_45_1.talkMaxDuration)

			if var_48_0 <= arg_45_1.time_ and arg_45_1.time_ < var_48_0 + var_48_9 then
				local var_48_10 = (arg_45_1.time_ - var_48_0) / var_48_9

				arg_45_1.fswtw_.percent = Mathf.Lerp(arg_45_1.var_.oldValueTypewriter, var_48_5, var_48_10)
				arg_45_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_45_1.fswtw_:SetDirty()
			end

			if arg_45_1.time_ >= var_48_0 + var_48_9 and arg_45_1.time_ < var_48_0 + var_48_9 + arg_48_0 then
				arg_45_1.fswtw_.percent = var_48_5

				arg_45_1.fswtw_:SetDirty()
				arg_45_1:ShowNextGo(true)

				arg_45_1.typewritterCharCountI18N = var_48_6
			end

			local var_48_11 = 0
			local var_48_12 = 15.627
			local var_48_13 = manager.audio:GetVoiceLength("story_v_out_114282", "114282012", "story_v_out_114282.awb") / 1000

			if var_48_13 > 0 and var_48_12 < var_48_13 and var_48_13 + var_48_11 > arg_45_1.duration_ then
				local var_48_14 = var_48_13

				arg_45_1.duration_ = var_48_13 + var_48_11
			end

			if var_48_11 < arg_45_1.time_ and arg_45_1.time_ <= var_48_11 + arg_48_0 then
				local var_48_15 = "play"
				local var_48_16 = "voice"

				arg_45_1:AudioAction(var_48_15, var_48_16, "story_v_out_114282", "114282012", "story_v_out_114282.awb")
			end
		end
	end,
	Play114282013 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 114282013
		arg_49_1.duration_ = 2.149999999999

		SetActive(arg_49_1.tipsGo_, false)

		function arg_49_1.onSingleLineFinish_()
			arg_49_1.onSingleLineUpdate_ = nil
			arg_49_1.onSingleLineFinish_ = nil
			arg_49_1.state_ = "waiting"
		end

		function arg_49_1.playNext_(arg_51_0)
			if arg_51_0 == 1 then
				arg_49_0:Play114282014(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = 0

			if var_52_0 < arg_49_1.time_ and arg_49_1.time_ <= var_52_0 + arg_52_0 then
				arg_49_1.fswbg_:SetActive(true)
				arg_49_1.dialog_:SetActive(false)

				arg_49_1.fswtw_.percent = 0

				local var_52_1 = arg_49_1:GetWordFromCfg(114282013)
				local var_52_2 = arg_49_1:FormatText(var_52_1.content)

				arg_49_1.fswt_.text = var_52_2

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.fswt_)

				arg_49_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_49_1.fswtw_:SetDirty()

				arg_49_1.typewritterCharCountI18N = 0

				arg_49_1:ShowNextGo(false)
			end

			local var_52_3 = 0.0166666666666667

			if var_52_3 < arg_49_1.time_ and arg_49_1.time_ <= var_52_3 + arg_52_0 then
				arg_49_1.var_.oldValueTypewriter = arg_49_1.fswtw_.percent

				arg_49_1:ShowNextGo(false)
			end

			local var_52_4 = 32
			local var_52_5 = 2.13333333333333
			local var_52_6 = arg_49_1:GetWordFromCfg(114282013)
			local var_52_7 = arg_49_1:FormatText(var_52_6.content)
			local var_52_8, var_52_9 = arg_49_1:GetPercentByPara(var_52_7, 1)

			if var_52_3 < arg_49_1.time_ and arg_49_1.time_ <= var_52_3 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0

				local var_52_10 = var_52_4 <= 0 and var_52_5 or var_52_5 * ((var_52_9 - arg_49_1.typewritterCharCountI18N) / var_52_4)

				if var_52_10 > 0 and var_52_5 < var_52_10 then
					arg_49_1.talkMaxDuration = var_52_10

					if var_52_10 + var_52_3 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_10 + var_52_3
					end
				end
			end

			local var_52_11 = 2.13333333333333
			local var_52_12 = math.max(var_52_11, arg_49_1.talkMaxDuration)

			if var_52_3 <= arg_49_1.time_ and arg_49_1.time_ < var_52_3 + var_52_12 then
				local var_52_13 = (arg_49_1.time_ - var_52_3) / var_52_12

				arg_49_1.fswtw_.percent = Mathf.Lerp(arg_49_1.var_.oldValueTypewriter, var_52_8, var_52_13)
				arg_49_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_49_1.fswtw_:SetDirty()
			end

			if arg_49_1.time_ >= var_52_3 + var_52_12 and arg_49_1.time_ < var_52_3 + var_52_12 + arg_52_0 then
				arg_49_1.fswtw_.percent = var_52_8

				arg_49_1.fswtw_:SetDirty()
				arg_49_1:ShowNextGo(true)

				arg_49_1.typewritterCharCountI18N = var_52_9
			end
		end
	end,
	Play114282014 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 114282014
		arg_53_1.duration_ = 4.926999999999

		SetActive(arg_53_1.tipsGo_, false)

		function arg_53_1.onSingleLineFinish_()
			arg_53_1.onSingleLineUpdate_ = nil
			arg_53_1.onSingleLineFinish_ = nil
			arg_53_1.state_ = "waiting"
		end

		function arg_53_1.playNext_(arg_55_0)
			if arg_55_0 == 1 then
				arg_53_0:Play114282015(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = 0

			if var_56_0 < arg_53_1.time_ and arg_53_1.time_ <= var_56_0 + arg_56_0 then
				arg_53_1.var_.oldValueTypewriter = arg_53_1.fswtw_.percent

				arg_53_1:ShowNextGo(false)
			end

			local var_56_1 = 11
			local var_56_2 = 0.733333333333333
			local var_56_3 = arg_53_1:GetWordFromCfg(114282013)
			local var_56_4 = arg_53_1:FormatText(var_56_3.content)
			local var_56_5, var_56_6 = arg_53_1:GetPercentByPara(var_56_4, 2)

			if var_56_0 < arg_53_1.time_ and arg_53_1.time_ <= var_56_0 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0

				local var_56_7 = var_56_1 <= 0 and var_56_2 or var_56_2 * ((var_56_6 - arg_53_1.typewritterCharCountI18N) / var_56_1)

				if var_56_7 > 0 and var_56_2 < var_56_7 then
					arg_53_1.talkMaxDuration = var_56_7

					if var_56_7 + var_56_0 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_7 + var_56_0
					end
				end
			end

			local var_56_8 = 0.733333333333333
			local var_56_9 = math.max(var_56_8, arg_53_1.talkMaxDuration)

			if var_56_0 <= arg_53_1.time_ and arg_53_1.time_ < var_56_0 + var_56_9 then
				local var_56_10 = (arg_53_1.time_ - var_56_0) / var_56_9

				arg_53_1.fswtw_.percent = Mathf.Lerp(arg_53_1.var_.oldValueTypewriter, var_56_5, var_56_10)
				arg_53_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_53_1.fswtw_:SetDirty()
			end

			if arg_53_1.time_ >= var_56_0 + var_56_9 and arg_53_1.time_ < var_56_0 + var_56_9 + arg_56_0 then
				arg_53_1.fswtw_.percent = var_56_5

				arg_53_1.fswtw_:SetDirty()
				arg_53_1:ShowNextGo(true)

				arg_53_1.typewritterCharCountI18N = var_56_6
			end

			local var_56_11 = 0
			local var_56_12 = 4.927
			local var_56_13 = manager.audio:GetVoiceLength("story_v_out_114282", "114282014", "story_v_out_114282.awb") / 1000

			if var_56_13 > 0 and var_56_12 < var_56_13 and var_56_13 + var_56_11 > arg_53_1.duration_ then
				local var_56_14 = var_56_13

				arg_53_1.duration_ = var_56_13 + var_56_11
			end

			if var_56_11 < arg_53_1.time_ and arg_53_1.time_ <= var_56_11 + arg_56_0 then
				local var_56_15 = "play"
				local var_56_16 = "voice"

				arg_53_1:AudioAction(var_56_15, var_56_16, "story_v_out_114282", "114282014", "story_v_out_114282.awb")
			end
		end
	end,
	Play114282015 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 114282015
		arg_57_1.duration_ = 2.466666666666

		SetActive(arg_57_1.tipsGo_, false)

		function arg_57_1.onSingleLineFinish_()
			arg_57_1.onSingleLineUpdate_ = nil
			arg_57_1.onSingleLineFinish_ = nil
			arg_57_1.state_ = "waiting"
		end

		function arg_57_1.playNext_(arg_59_0)
			if arg_59_0 == 1 then
				arg_57_0:Play114282016(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = 0

			if var_60_0 < arg_57_1.time_ and arg_57_1.time_ <= var_60_0 + arg_60_0 then
				arg_57_1.var_.oldValueTypewriter = arg_57_1.fswtw_.percent

				arg_57_1:ShowNextGo(false)
			end

			local var_60_1 = 37
			local var_60_2 = 2.46666666666667
			local var_60_3 = arg_57_1:GetWordFromCfg(114282013)
			local var_60_4 = arg_57_1:FormatText(var_60_3.content)
			local var_60_5, var_60_6 = arg_57_1:GetPercentByPara(var_60_4, 3)

			if var_60_0 < arg_57_1.time_ and arg_57_1.time_ <= var_60_0 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0

				local var_60_7 = var_60_1 <= 0 and var_60_2 or var_60_2 * ((var_60_6 - arg_57_1.typewritterCharCountI18N) / var_60_1)

				if var_60_7 > 0 and var_60_2 < var_60_7 then
					arg_57_1.talkMaxDuration = var_60_7

					if var_60_7 + var_60_0 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_7 + var_60_0
					end
				end
			end

			local var_60_8 = 2.46666666666667
			local var_60_9 = math.max(var_60_8, arg_57_1.talkMaxDuration)

			if var_60_0 <= arg_57_1.time_ and arg_57_1.time_ < var_60_0 + var_60_9 then
				local var_60_10 = (arg_57_1.time_ - var_60_0) / var_60_9

				arg_57_1.fswtw_.percent = Mathf.Lerp(arg_57_1.var_.oldValueTypewriter, var_60_5, var_60_10)
				arg_57_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_57_1.fswtw_:SetDirty()
			end

			if arg_57_1.time_ >= var_60_0 + var_60_9 and arg_57_1.time_ < var_60_0 + var_60_9 + arg_60_0 then
				arg_57_1.fswtw_.percent = var_60_5

				arg_57_1.fswtw_:SetDirty()
				arg_57_1:ShowNextGo(true)

				arg_57_1.typewritterCharCountI18N = var_60_6
			end
		end
	end,
	Play114282016 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 114282016
		arg_61_1.duration_ = 2.533333333332

		SetActive(arg_61_1.tipsGo_, false)

		function arg_61_1.onSingleLineFinish_()
			arg_61_1.onSingleLineUpdate_ = nil
			arg_61_1.onSingleLineFinish_ = nil
			arg_61_1.state_ = "waiting"
		end

		function arg_61_1.playNext_(arg_63_0)
			if arg_63_0 == 1 then
				arg_61_0:Play114282017(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = 0

			if var_64_0 < arg_61_1.time_ and arg_61_1.time_ <= var_64_0 + arg_64_0 then
				arg_61_1.var_.oldValueTypewriter = arg_61_1.fswtw_.percent

				arg_61_1:ShowNextGo(false)
			end

			local var_64_1 = 38
			local var_64_2 = 2.53333333333333
			local var_64_3 = arg_61_1:GetWordFromCfg(114282013)
			local var_64_4 = arg_61_1:FormatText(var_64_3.content)
			local var_64_5, var_64_6 = arg_61_1:GetPercentByPara(var_64_4, 4)

			if var_64_0 < arg_61_1.time_ and arg_61_1.time_ <= var_64_0 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0

				local var_64_7 = var_64_1 <= 0 and var_64_2 or var_64_2 * ((var_64_6 - arg_61_1.typewritterCharCountI18N) / var_64_1)

				if var_64_7 > 0 and var_64_2 < var_64_7 then
					arg_61_1.talkMaxDuration = var_64_7

					if var_64_7 + var_64_0 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_7 + var_64_0
					end
				end
			end

			local var_64_8 = 2.53333333333333
			local var_64_9 = math.max(var_64_8, arg_61_1.talkMaxDuration)

			if var_64_0 <= arg_61_1.time_ and arg_61_1.time_ < var_64_0 + var_64_9 then
				local var_64_10 = (arg_61_1.time_ - var_64_0) / var_64_9

				arg_61_1.fswtw_.percent = Mathf.Lerp(arg_61_1.var_.oldValueTypewriter, var_64_5, var_64_10)
				arg_61_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_61_1.fswtw_:SetDirty()
			end

			if arg_61_1.time_ >= var_64_0 + var_64_9 and arg_61_1.time_ < var_64_0 + var_64_9 + arg_64_0 then
				arg_61_1.fswtw_.percent = var_64_5

				arg_61_1.fswtw_:SetDirty()
				arg_61_1:ShowNextGo(true)

				arg_61_1.typewritterCharCountI18N = var_64_6
			end
		end
	end,
	Play114282017 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 114282017
		arg_65_1.duration_ = 3.933333333332

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play114282018(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = 0

			if var_68_0 < arg_65_1.time_ and arg_65_1.time_ <= var_68_0 + arg_68_0 then
				arg_65_1.var_.oldValueTypewriter = arg_65_1.fswtw_.percent

				arg_65_1:ShowNextGo(false)
			end

			local var_68_1 = 59
			local var_68_2 = 3.93333333333333
			local var_68_3 = arg_65_1:GetWordFromCfg(114282013)
			local var_68_4 = arg_65_1:FormatText(var_68_3.content)
			local var_68_5, var_68_6 = arg_65_1:GetPercentByPara(var_68_4, 5)

			if var_68_0 < arg_65_1.time_ and arg_65_1.time_ <= var_68_0 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0

				local var_68_7 = var_68_1 <= 0 and var_68_2 or var_68_2 * ((var_68_6 - arg_65_1.typewritterCharCountI18N) / var_68_1)

				if var_68_7 > 0 and var_68_2 < var_68_7 then
					arg_65_1.talkMaxDuration = var_68_7

					if var_68_7 + var_68_0 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_7 + var_68_0
					end
				end
			end

			local var_68_8 = 3.93333333333333
			local var_68_9 = math.max(var_68_8, arg_65_1.talkMaxDuration)

			if var_68_0 <= arg_65_1.time_ and arg_65_1.time_ < var_68_0 + var_68_9 then
				local var_68_10 = (arg_65_1.time_ - var_68_0) / var_68_9

				arg_65_1.fswtw_.percent = Mathf.Lerp(arg_65_1.var_.oldValueTypewriter, var_68_5, var_68_10)
				arg_65_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_65_1.fswtw_:SetDirty()
			end

			if arg_65_1.time_ >= var_68_0 + var_68_9 and arg_65_1.time_ < var_68_0 + var_68_9 + arg_68_0 then
				arg_65_1.fswtw_.percent = var_68_5

				arg_65_1.fswtw_:SetDirty()
				arg_65_1:ShowNextGo(true)

				arg_65_1.typewritterCharCountI18N = var_68_6
			end
		end
	end,
	Play114282018 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 114282018
		arg_69_1.duration_ = 14.119999999999

		SetActive(arg_69_1.tipsGo_, false)

		function arg_69_1.onSingleLineFinish_()
			arg_69_1.onSingleLineUpdate_ = nil
			arg_69_1.onSingleLineFinish_ = nil
			arg_69_1.state_ = "waiting"
		end

		function arg_69_1.playNext_(arg_71_0)
			if arg_71_0 == 1 then
				arg_69_0:Play114282019(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = 0

			if var_72_0 < arg_69_1.time_ and arg_69_1.time_ <= var_72_0 + arg_72_0 then
				arg_69_1.var_.oldValueTypewriter = arg_69_1.fswtw_.percent

				arg_69_1:ShowNextGo(false)
			end

			local var_72_1 = 55
			local var_72_2 = 3.66666666666667
			local var_72_3 = arg_69_1:GetWordFromCfg(114282013)
			local var_72_4 = arg_69_1:FormatText(var_72_3.content)
			local var_72_5, var_72_6 = arg_69_1:GetPercentByPara(var_72_4, 6)

			if var_72_0 < arg_69_1.time_ and arg_69_1.time_ <= var_72_0 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0

				local var_72_7 = var_72_1 <= 0 and var_72_2 or var_72_2 * ((var_72_6 - arg_69_1.typewritterCharCountI18N) / var_72_1)

				if var_72_7 > 0 and var_72_2 < var_72_7 then
					arg_69_1.talkMaxDuration = var_72_7

					if var_72_7 + var_72_0 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_7 + var_72_0
					end
				end
			end

			local var_72_8 = 3.66666666666667
			local var_72_9 = math.max(var_72_8, arg_69_1.talkMaxDuration)

			if var_72_0 <= arg_69_1.time_ and arg_69_1.time_ < var_72_0 + var_72_9 then
				local var_72_10 = (arg_69_1.time_ - var_72_0) / var_72_9

				arg_69_1.fswtw_.percent = Mathf.Lerp(arg_69_1.var_.oldValueTypewriter, var_72_5, var_72_10)
				arg_69_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_69_1.fswtw_:SetDirty()
			end

			if arg_69_1.time_ >= var_72_0 + var_72_9 and arg_69_1.time_ < var_72_0 + var_72_9 + arg_72_0 then
				arg_69_1.fswtw_.percent = var_72_5

				arg_69_1.fswtw_:SetDirty()
				arg_69_1:ShowNextGo(true)

				arg_69_1.typewritterCharCountI18N = var_72_6
			end

			local var_72_11 = 0
			local var_72_12 = 14.12
			local var_72_13 = manager.audio:GetVoiceLength("story_v_out_114282", "114282018", "story_v_out_114282.awb") / 1000

			if var_72_13 > 0 and var_72_12 < var_72_13 and var_72_13 + var_72_11 > arg_69_1.duration_ then
				local var_72_14 = var_72_13

				arg_69_1.duration_ = var_72_13 + var_72_11
			end

			if var_72_11 < arg_69_1.time_ and arg_69_1.time_ <= var_72_11 + arg_72_0 then
				local var_72_15 = "play"
				local var_72_16 = "voice"

				arg_69_1:AudioAction(var_72_15, var_72_16, "story_v_out_114282", "114282018", "story_v_out_114282.awb")
			end
		end
	end,
	Play114282019 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 114282019
		arg_73_1.duration_ = 5.025999999999

		SetActive(arg_73_1.tipsGo_, false)

		function arg_73_1.onSingleLineFinish_()
			arg_73_1.onSingleLineUpdate_ = nil
			arg_73_1.onSingleLineFinish_ = nil
			arg_73_1.state_ = "waiting"
		end

		function arg_73_1.playNext_(arg_75_0)
			if arg_75_0 == 1 then
				arg_73_0:Play114282020(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = 0

			if var_76_0 < arg_73_1.time_ and arg_73_1.time_ <= var_76_0 + arg_76_0 then
				arg_73_1.var_.oldValueTypewriter = arg_73_1.fswtw_.percent

				arg_73_1:ShowNextGo(false)
			end

			local var_76_1 = 26
			local var_76_2 = 1.73333333333333
			local var_76_3 = arg_73_1:GetWordFromCfg(114282013)
			local var_76_4 = arg_73_1:FormatText(var_76_3.content)
			local var_76_5, var_76_6 = arg_73_1:GetPercentByPara(var_76_4, 7)

			if var_76_0 < arg_73_1.time_ and arg_73_1.time_ <= var_76_0 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0

				local var_76_7 = var_76_1 <= 0 and var_76_2 or var_76_2 * ((var_76_6 - arg_73_1.typewritterCharCountI18N) / var_76_1)

				if var_76_7 > 0 and var_76_2 < var_76_7 then
					arg_73_1.talkMaxDuration = var_76_7

					if var_76_7 + var_76_0 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_7 + var_76_0
					end
				end
			end

			local var_76_8 = 1.73333333333333
			local var_76_9 = math.max(var_76_8, arg_73_1.talkMaxDuration)

			if var_76_0 <= arg_73_1.time_ and arg_73_1.time_ < var_76_0 + var_76_9 then
				local var_76_10 = (arg_73_1.time_ - var_76_0) / var_76_9

				arg_73_1.fswtw_.percent = Mathf.Lerp(arg_73_1.var_.oldValueTypewriter, var_76_5, var_76_10)
				arg_73_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_73_1.fswtw_:SetDirty()
			end

			if arg_73_1.time_ >= var_76_0 + var_76_9 and arg_73_1.time_ < var_76_0 + var_76_9 + arg_76_0 then
				arg_73_1.fswtw_.percent = var_76_5

				arg_73_1.fswtw_:SetDirty()
				arg_73_1:ShowNextGo(true)

				arg_73_1.typewritterCharCountI18N = var_76_6
			end

			local var_76_11 = 0
			local var_76_12 = 5.026
			local var_76_13 = manager.audio:GetVoiceLength("story_v_out_114282", "114282019", "story_v_out_114282.awb") / 1000

			if var_76_13 > 0 and var_76_12 < var_76_13 and var_76_13 + var_76_11 > arg_73_1.duration_ then
				local var_76_14 = var_76_13

				arg_73_1.duration_ = var_76_13 + var_76_11
			end

			if var_76_11 < arg_73_1.time_ and arg_73_1.time_ <= var_76_11 + arg_76_0 then
				local var_76_15 = "play"
				local var_76_16 = "voice"

				arg_73_1:AudioAction(var_76_15, var_76_16, "story_v_out_114282", "114282019", "story_v_out_114282.awb")
			end
		end
	end,
	Play114282020 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 114282020
		arg_77_1.duration_ = 6.7

		local var_77_0 = {
			ja = 6.633,
			ko = 6.3,
			zh = 6.7,
			en = 6.266
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
				arg_77_0:Play114282021(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = "10023"

			if arg_77_1.actors_[var_80_0] == nil then
				local var_80_1 = Object.Instantiate(arg_77_1.imageGo_, arg_77_1.canvasGo_.transform)

				var_80_1.transform:SetSiblingIndex(1)

				var_80_1.name = var_80_0

				local var_80_2 = var_80_1:GetComponent(typeof(Image))

				var_80_2.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. var_80_0)

				var_80_2:SetNativeSize()

				var_80_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_77_1.actors_[var_80_0] = var_80_1
			end

			local var_80_3 = arg_77_1.actors_["10023"].transform
			local var_80_4 = 3.8

			if var_80_4 < arg_77_1.time_ and arg_77_1.time_ <= var_80_4 + arg_80_0 then
				arg_77_1.var_.moveOldPos10023 = var_80_3.localPosition
				var_80_3.localScale = Vector3.New(1, 1, 1)

				arg_77_1:CheckSpriteTmpPos("10023", 2)
			end

			local var_80_5 = 0.001

			if var_80_4 <= arg_77_1.time_ and arg_77_1.time_ < var_80_4 + var_80_5 then
				local var_80_6 = (arg_77_1.time_ - var_80_4) / var_80_5
				local var_80_7 = Vector3.New(-390, -350, -180)

				var_80_3.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos10023, var_80_7, var_80_6)
			end

			if arg_77_1.time_ >= var_80_4 + var_80_5 and arg_77_1.time_ < var_80_4 + var_80_5 + arg_80_0 then
				var_80_3.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_80_8 = arg_77_1.actors_["10023"]
			local var_80_9 = 3.8

			if var_80_9 < arg_77_1.time_ and arg_77_1.time_ <= var_80_9 + arg_80_0 then
				local var_80_10 = var_80_8:GetComponent("Image")

				if var_80_10 then
					arg_77_1.var_.highlightMatValue10023 = var_80_10
				end
			end

			local var_80_11 = 0.034

			if var_80_9 <= arg_77_1.time_ and arg_77_1.time_ < var_80_9 + var_80_11 then
				local var_80_12 = (arg_77_1.time_ - var_80_9) / var_80_11

				if arg_77_1.var_.highlightMatValue10023 then
					local var_80_13 = Mathf.Lerp(0.5, 1, var_80_12)
					local var_80_14 = arg_77_1.var_.highlightMatValue10023
					local var_80_15 = var_80_14.color

					var_80_15.r = var_80_13
					var_80_15.g = var_80_13
					var_80_15.b = var_80_13
					var_80_14.color = var_80_15
				end
			end

			if arg_77_1.time_ >= var_80_9 + var_80_11 and arg_77_1.time_ < var_80_9 + var_80_11 + arg_80_0 and arg_77_1.var_.highlightMatValue10023 then
				local var_80_16 = 1

				var_80_8.transform:SetSiblingIndex(1)

				local var_80_17 = arg_77_1.var_.highlightMatValue10023
				local var_80_18 = var_80_17.color

				var_80_18.r = var_80_16
				var_80_18.g = var_80_16
				var_80_18.b = var_80_16
				var_80_17.color = var_80_18
			end

			local var_80_19 = 1.98333333333333

			if var_80_19 < arg_77_1.time_ and arg_77_1.time_ <= var_80_19 + arg_80_0 then
				arg_77_1.fswbg_:SetActive(false)
				arg_77_1.dialog_:SetActive(true)
				arg_77_1:ShowNextGo(false)
			end

			local var_80_20 = arg_77_1.actors_["10023"]
			local var_80_21 = 3.8

			if var_80_21 < arg_77_1.time_ and arg_77_1.time_ <= var_80_21 + arg_80_0 then
				local var_80_22 = var_80_20:GetComponent("Image")

				if var_80_22 then
					arg_77_1.var_.alphaMatValue10023 = var_80_22
					arg_77_1.var_.alphaOldValue10023 = var_80_22.color.a
				end

				arg_77_1.var_.alphaOldValue10023 = 0
			end

			local var_80_23 = 0.5

			if var_80_21 <= arg_77_1.time_ and arg_77_1.time_ < var_80_21 + var_80_23 then
				local var_80_24 = (arg_77_1.time_ - var_80_21) / var_80_23
				local var_80_25 = Mathf.Lerp(arg_77_1.var_.alphaOldValue10023, 1, var_80_24)

				if arg_77_1.var_.alphaMatValue10023 then
					local var_80_26 = arg_77_1.var_.alphaMatValue10023.color

					var_80_26.a = var_80_25
					arg_77_1.var_.alphaMatValue10023.color = var_80_26
				end
			end

			if arg_77_1.time_ >= var_80_21 + var_80_23 and arg_77_1.time_ < var_80_21 + var_80_23 + arg_80_0 and arg_77_1.var_.alphaMatValue10023 then
				local var_80_27 = arg_77_1.var_.alphaMatValue10023
				local var_80_28 = var_80_27.color

				var_80_28.a = 1
				var_80_27.color = var_80_28
			end

			local var_80_29 = 0

			if var_80_29 < arg_77_1.time_ and arg_77_1.time_ <= var_80_29 + arg_80_0 then
				arg_77_1.mask_.enabled = true
				arg_77_1.mask_.raycastTarget = true

				arg_77_1:SetGaussion(false)
			end

			local var_80_30 = 2

			if var_80_29 <= arg_77_1.time_ and arg_77_1.time_ < var_80_29 + var_80_30 then
				local var_80_31 = (arg_77_1.time_ - var_80_29) / var_80_30
				local var_80_32 = Color.New(0, 0, 0)

				var_80_32.a = Mathf.Lerp(0, 1, var_80_31)
				arg_77_1.mask_.color = var_80_32
			end

			if arg_77_1.time_ >= var_80_29 + var_80_30 and arg_77_1.time_ < var_80_29 + var_80_30 + arg_80_0 then
				local var_80_33 = Color.New(0, 0, 0)

				var_80_33.a = 1
				arg_77_1.mask_.color = var_80_33
			end

			local var_80_34 = 2

			if var_80_34 < arg_77_1.time_ and arg_77_1.time_ <= var_80_34 + arg_80_0 then
				arg_77_1.mask_.enabled = true
				arg_77_1.mask_.raycastTarget = true

				arg_77_1:SetGaussion(false)
			end

			local var_80_35 = 2

			if var_80_34 <= arg_77_1.time_ and arg_77_1.time_ < var_80_34 + var_80_35 then
				local var_80_36 = (arg_77_1.time_ - var_80_34) / var_80_35
				local var_80_37 = Color.New(0, 0, 0)

				var_80_37.a = Mathf.Lerp(1, 0, var_80_36)
				arg_77_1.mask_.color = var_80_37
			end

			if arg_77_1.time_ >= var_80_34 + var_80_35 and arg_77_1.time_ < var_80_34 + var_80_35 + arg_80_0 then
				local var_80_38 = Color.New(0, 0, 0)
				local var_80_39 = 0

				arg_77_1.mask_.enabled = false
				var_80_38.a = var_80_39
				arg_77_1.mask_.color = var_80_38
			end

			local var_80_40 = "F04"

			if arg_77_1.bgs_[var_80_40] == nil then
				local var_80_41 = Object.Instantiate(arg_77_1.paintGo_)

				var_80_41:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_80_40)
				var_80_41.name = var_80_40
				var_80_41.transform.parent = arg_77_1.stage_.transform
				var_80_41.transform.localPosition = Vector3.New(0, 100, 0)
				arg_77_1.bgs_[var_80_40] = var_80_41
			end

			local var_80_42 = 2

			if var_80_42 < arg_77_1.time_ and arg_77_1.time_ <= var_80_42 + arg_80_0 then
				local var_80_43 = manager.ui.mainCamera.transform.localPosition
				local var_80_44 = Vector3.New(0, 0, 10) + Vector3.New(var_80_43.x, var_80_43.y, 0)
				local var_80_45 = arg_77_1.bgs_.F04

				var_80_45.transform.localPosition = var_80_44
				var_80_45.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_80_46 = var_80_45:GetComponent("SpriteRenderer")

				if var_80_46 and var_80_46.sprite then
					local var_80_47 = (var_80_45.transform.localPosition - var_80_43).z
					local var_80_48 = manager.ui.mainCameraCom_
					local var_80_49 = 2 * var_80_47 * Mathf.Tan(var_80_48.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_80_50 = var_80_49 * var_80_48.aspect
					local var_80_51 = var_80_46.sprite.bounds.size.x
					local var_80_52 = var_80_46.sprite.bounds.size.y
					local var_80_53 = var_80_50 / var_80_51
					local var_80_54 = var_80_49 / var_80_52
					local var_80_55 = var_80_54 < var_80_53 and var_80_53 or var_80_54

					var_80_45.transform.localScale = Vector3.New(var_80_55, var_80_55, 0)
				end

				for iter_80_0, iter_80_1 in pairs(arg_77_1.bgs_) do
					if iter_80_0 ~= "F04" then
						iter_80_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_80_56 = 2
			local var_80_57 = 2.63333333333333

			if var_80_56 < arg_77_1.time_ and arg_77_1.time_ <= var_80_56 + arg_80_0 then
				local var_80_58 = "play"
				local var_80_59 = "music"

				arg_77_1:AudioAction(var_80_58, var_80_59, "bgm_activity_1_3_story_outdoor", "bgm_activity_1_3_story_outdoor", "bgm_activity_1_3_story_outdoor.awb")
			end

			if arg_77_1.frameCnt_ <= 1 then
				arg_77_1.dialog_:SetActive(false)
			end

			local var_80_60 = 4
			local var_80_61 = 0.225

			if var_80_60 < arg_77_1.time_ and arg_77_1.time_ <= var_80_60 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0

				arg_77_1.dialog_:SetActive(true)

				local var_80_62 = LeanTween.value(arg_77_1.dialog_, 0, 1, 0.3)

				var_80_62:setOnUpdate(LuaHelper.FloatAction(function(arg_81_0)
					arg_77_1.dialogCg_.alpha = arg_81_0
				end))
				var_80_62:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_77_1.dialog_)
					var_80_62:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_77_1.duration_ = arg_77_1.duration_ + 0.3

				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_63 = arg_77_1:FormatText(StoryNameCfg[259].name)

				arg_77_1.leftNameTxt_.text = var_80_63

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_64 = arg_77_1:GetWordFromCfg(114282020)
				local var_80_65 = arg_77_1:FormatText(var_80_64.content)

				arg_77_1.text_.text = var_80_65

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_66 = 9
				local var_80_67 = utf8.len(var_80_65)
				local var_80_68 = var_80_66 <= 0 and var_80_61 or var_80_61 * (var_80_67 / var_80_66)

				if var_80_68 > 0 and var_80_61 < var_80_68 then
					arg_77_1.talkMaxDuration = var_80_68
					var_80_60 = var_80_60 + 0.3

					if var_80_68 + var_80_60 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_68 + var_80_60
					end
				end

				arg_77_1.text_.text = var_80_65
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114282", "114282020", "story_v_out_114282.awb") ~= 0 then
					local var_80_69 = manager.audio:GetVoiceLength("story_v_out_114282", "114282020", "story_v_out_114282.awb") / 1000

					if var_80_69 + var_80_60 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_69 + var_80_60
					end

					if var_80_64.prefab_name ~= "" and arg_77_1.actors_[var_80_64.prefab_name] ~= nil then
						local var_80_70 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_64.prefab_name].transform, "story_v_out_114282", "114282020", "story_v_out_114282.awb")

						arg_77_1:RecordAudio("114282020", var_80_70)
						arg_77_1:RecordAudio("114282020", var_80_70)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_114282", "114282020", "story_v_out_114282.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_114282", "114282020", "story_v_out_114282.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_71 = var_80_60 + 0.3
			local var_80_72 = math.max(var_80_61, arg_77_1.talkMaxDuration)

			if var_80_71 <= arg_77_1.time_ and arg_77_1.time_ < var_80_71 + var_80_72 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_71) / var_80_72

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_71 + var_80_72 and arg_77_1.time_ < var_80_71 + var_80_72 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play114282021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 114282021
		arg_83_1.duration_ = 1.633

		local var_83_0 = {
			ja = 1.5,
			ko = 1.3,
			zh = 1.633,
			en = 1.066
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
				arg_83_0:Play114282022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = "10022"

			if arg_83_1.actors_[var_86_0] == nil then
				local var_86_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_86_0), arg_83_1.canvasGo_.transform)

				var_86_1.transform:SetSiblingIndex(1)

				var_86_1.name = var_86_0
				var_86_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_83_1.actors_[var_86_0] = var_86_1
			end

			local var_86_2 = arg_83_1.actors_["10022"]
			local var_86_3 = 0

			if var_86_3 < arg_83_1.time_ and arg_83_1.time_ <= var_86_3 + arg_86_0 then
				local var_86_4 = var_86_2:GetComponentInChildren(typeof(CanvasGroup))

				if var_86_4 then
					arg_83_1.var_.alphaOldValue10022 = var_86_4.alpha
					arg_83_1.var_.characterEffect10022 = var_86_4
				end

				arg_83_1.var_.alphaOldValue10022 = 0
			end

			local var_86_5 = 0.5

			if var_86_3 <= arg_83_1.time_ and arg_83_1.time_ < var_86_3 + var_86_5 then
				local var_86_6 = (arg_83_1.time_ - var_86_3) / var_86_5
				local var_86_7 = Mathf.Lerp(arg_83_1.var_.alphaOldValue10022, 1, var_86_6)

				if arg_83_1.var_.characterEffect10022 then
					arg_83_1.var_.characterEffect10022.alpha = var_86_7
				end
			end

			if arg_83_1.time_ >= var_86_3 + var_86_5 and arg_83_1.time_ < var_86_3 + var_86_5 + arg_86_0 and arg_83_1.var_.characterEffect10022 then
				arg_83_1.var_.characterEffect10022.alpha = 1
			end

			local var_86_8 = arg_83_1.actors_["10023"].transform
			local var_86_9 = 0

			if var_86_9 < arg_83_1.time_ and arg_83_1.time_ <= var_86_9 + arg_86_0 then
				arg_83_1.var_.moveOldPos10023 = var_86_8.localPosition
				var_86_8.localScale = Vector3.New(1, 1, 1)

				arg_83_1:CheckSpriteTmpPos("10023", 7)
			end

			local var_86_10 = 0.001

			if var_86_9 <= arg_83_1.time_ and arg_83_1.time_ < var_86_9 + var_86_10 then
				local var_86_11 = (arg_83_1.time_ - var_86_9) / var_86_10
				local var_86_12 = Vector3.New(0, -2000, -180)

				var_86_8.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos10023, var_86_12, var_86_11)
			end

			if arg_83_1.time_ >= var_86_9 + var_86_10 and arg_83_1.time_ < var_86_9 + var_86_10 + arg_86_0 then
				var_86_8.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_86_13 = arg_83_1.actors_["10022"].transform
			local var_86_14 = 0

			if var_86_14 < arg_83_1.time_ and arg_83_1.time_ <= var_86_14 + arg_86_0 then
				arg_83_1.var_.moveOldPos10022 = var_86_13.localPosition
				var_86_13.localScale = Vector3.New(1, 1, 1)

				arg_83_1:CheckSpriteTmpPos("10022", 2)

				local var_86_15 = var_86_13.childCount

				for iter_86_0 = 0, var_86_15 - 1 do
					local var_86_16 = var_86_13:GetChild(iter_86_0)

					if var_86_16.name == "split_6" or not string.find(var_86_16.name, "split") then
						var_86_16.gameObject:SetActive(true)
					else
						var_86_16.gameObject:SetActive(false)
					end
				end
			end

			local var_86_17 = 0.001

			if var_86_14 <= arg_83_1.time_ and arg_83_1.time_ < var_86_14 + var_86_17 then
				local var_86_18 = (arg_83_1.time_ - var_86_14) / var_86_17
				local var_86_19 = Vector3.New(-390, -350, -180)

				var_86_13.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos10022, var_86_19, var_86_18)
			end

			if arg_83_1.time_ >= var_86_14 + var_86_17 and arg_83_1.time_ < var_86_14 + var_86_17 + arg_86_0 then
				var_86_13.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_86_20 = "10017"

			if arg_83_1.actors_[var_86_20] == nil then
				local var_86_21 = Object.Instantiate(arg_83_1.imageGo_, arg_83_1.canvasGo_.transform)

				var_86_21.transform:SetSiblingIndex(1)

				var_86_21.name = var_86_20

				local var_86_22 = var_86_21:GetComponent(typeof(Image))

				var_86_22.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. var_86_20)

				var_86_22:SetNativeSize()

				var_86_21.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_83_1.actors_[var_86_20] = var_86_21
			end

			local var_86_23 = arg_83_1.actors_["10017"].transform
			local var_86_24 = 0

			if var_86_24 < arg_83_1.time_ and arg_83_1.time_ <= var_86_24 + arg_86_0 then
				arg_83_1.var_.moveOldPos10017 = var_86_23.localPosition
				var_86_23.localScale = Vector3.New(1, 1, 1)

				arg_83_1:CheckSpriteTmpPos("10017", 4)
			end

			local var_86_25 = 0.001

			if var_86_24 <= arg_83_1.time_ and arg_83_1.time_ < var_86_24 + var_86_25 then
				local var_86_26 = (arg_83_1.time_ - var_86_24) / var_86_25
				local var_86_27 = Vector3.New(390, -350, -180)

				var_86_23.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos10017, var_86_27, var_86_26)
			end

			if arg_83_1.time_ >= var_86_24 + var_86_25 and arg_83_1.time_ < var_86_24 + var_86_25 + arg_86_0 then
				var_86_23.localPosition = Vector3.New(390, -350, -180)
			end

			local var_86_28 = arg_83_1.actors_["10022"]
			local var_86_29 = 0

			if var_86_29 < arg_83_1.time_ and arg_83_1.time_ <= var_86_29 + arg_86_0 and arg_83_1.var_.actorSpriteComps10022 == nil then
				arg_83_1.var_.actorSpriteComps10022 = var_86_28:GetComponentsInChildren(typeof(Image), true)
			end

			local var_86_30 = 0.034

			if var_86_29 <= arg_83_1.time_ and arg_83_1.time_ < var_86_29 + var_86_30 then
				local var_86_31 = (arg_83_1.time_ - var_86_29) / var_86_30

				if arg_83_1.var_.actorSpriteComps10022 then
					for iter_86_1, iter_86_2 in pairs(arg_83_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_86_2 then
							local var_86_32 = Mathf.Lerp(iter_86_2.color.r, 1, var_86_31)

							iter_86_2.color = Color.New(var_86_32, var_86_32, var_86_32)
						end
					end
				end
			end

			if arg_83_1.time_ >= var_86_29 + var_86_30 and arg_83_1.time_ < var_86_29 + var_86_30 + arg_86_0 and arg_83_1.var_.actorSpriteComps10022 then
				local var_86_33 = 1

				for iter_86_3, iter_86_4 in pairs(arg_83_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_86_4 then
						iter_86_4.color = Color.New(var_86_33, var_86_33, var_86_33)
					end
				end

				arg_83_1.var_.actorSpriteComps10022 = nil
			end

			local var_86_34 = arg_83_1.actors_["10017"]
			local var_86_35 = 0

			if var_86_35 < arg_83_1.time_ and arg_83_1.time_ <= var_86_35 + arg_86_0 then
				local var_86_36 = var_86_34:GetComponent("Image")

				if var_86_36 then
					arg_83_1.var_.highlightMatValue10017 = var_86_36
				end
			end

			local var_86_37 = 0.034

			if var_86_35 <= arg_83_1.time_ and arg_83_1.time_ < var_86_35 + var_86_37 then
				local var_86_38 = (arg_83_1.time_ - var_86_35) / var_86_37

				if arg_83_1.var_.highlightMatValue10017 then
					local var_86_39 = Mathf.Lerp(1, 0.5, var_86_38)
					local var_86_40 = arg_83_1.var_.highlightMatValue10017
					local var_86_41 = var_86_40.color

					var_86_41.r = var_86_39
					var_86_41.g = var_86_39
					var_86_41.b = var_86_39
					var_86_40.color = var_86_41
				end
			end

			if arg_83_1.time_ >= var_86_35 + var_86_37 and arg_83_1.time_ < var_86_35 + var_86_37 + arg_86_0 and arg_83_1.var_.highlightMatValue10017 then
				local var_86_42 = 0.5
				local var_86_43 = arg_83_1.var_.highlightMatValue10017
				local var_86_44 = var_86_43.color

				var_86_44.r = var_86_42
				var_86_44.g = var_86_42
				var_86_44.b = var_86_42
				var_86_43.color = var_86_44
			end

			local var_86_45 = arg_83_1.actors_["10017"]
			local var_86_46 = 0

			if var_86_46 < arg_83_1.time_ and arg_83_1.time_ <= var_86_46 + arg_86_0 then
				local var_86_47 = var_86_45:GetComponent("Image")

				if var_86_47 then
					arg_83_1.var_.alphaMatValue10017 = var_86_47
					arg_83_1.var_.alphaOldValue10017 = var_86_47.color.a
				end

				arg_83_1.var_.alphaOldValue10017 = 0
			end

			local var_86_48 = 0.5

			if var_86_46 <= arg_83_1.time_ and arg_83_1.time_ < var_86_46 + var_86_48 then
				local var_86_49 = (arg_83_1.time_ - var_86_46) / var_86_48
				local var_86_50 = Mathf.Lerp(arg_83_1.var_.alphaOldValue10017, 1, var_86_49)

				if arg_83_1.var_.alphaMatValue10017 then
					local var_86_51 = arg_83_1.var_.alphaMatValue10017.color

					var_86_51.a = var_86_50
					arg_83_1.var_.alphaMatValue10017.color = var_86_51
				end
			end

			if arg_83_1.time_ >= var_86_46 + var_86_48 and arg_83_1.time_ < var_86_46 + var_86_48 + arg_86_0 and arg_83_1.var_.alphaMatValue10017 then
				local var_86_52 = arg_83_1.var_.alphaMatValue10017
				local var_86_53 = var_86_52.color

				var_86_53.a = 1
				var_86_52.color = var_86_53
			end

			local var_86_54 = 0
			local var_86_55 = 0.075

			if var_86_54 < arg_83_1.time_ and arg_83_1.time_ <= var_86_54 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_56 = arg_83_1:FormatText(StoryNameCfg[235].name)

				arg_83_1.leftNameTxt_.text = var_86_56

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_57 = arg_83_1:GetWordFromCfg(114282021)
				local var_86_58 = arg_83_1:FormatText(var_86_57.content)

				arg_83_1.text_.text = var_86_58

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_59 = 3
				local var_86_60 = utf8.len(var_86_58)
				local var_86_61 = var_86_59 <= 0 and var_86_55 or var_86_55 * (var_86_60 / var_86_59)

				if var_86_61 > 0 and var_86_55 < var_86_61 then
					arg_83_1.talkMaxDuration = var_86_61

					if var_86_61 + var_86_54 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_61 + var_86_54
					end
				end

				arg_83_1.text_.text = var_86_58
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114282", "114282021", "story_v_out_114282.awb") ~= 0 then
					local var_86_62 = manager.audio:GetVoiceLength("story_v_out_114282", "114282021", "story_v_out_114282.awb") / 1000

					if var_86_62 + var_86_54 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_62 + var_86_54
					end

					if var_86_57.prefab_name ~= "" and arg_83_1.actors_[var_86_57.prefab_name] ~= nil then
						local var_86_63 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_57.prefab_name].transform, "story_v_out_114282", "114282021", "story_v_out_114282.awb")

						arg_83_1:RecordAudio("114282021", var_86_63)
						arg_83_1:RecordAudio("114282021", var_86_63)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_114282", "114282021", "story_v_out_114282.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_114282", "114282021", "story_v_out_114282.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_64 = math.max(var_86_55, arg_83_1.talkMaxDuration)

			if var_86_54 <= arg_83_1.time_ and arg_83_1.time_ < var_86_54 + var_86_64 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_54) / var_86_64

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_54 + var_86_64 and arg_83_1.time_ < var_86_54 + var_86_64 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play114282022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 114282022
		arg_87_1.duration_ = 1.8

		local var_87_0 = {
			ja = 1.8,
			ko = 1.466,
			zh = 1.633,
			en = 1.5
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
				arg_87_0:Play114282023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["10022"]
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 and arg_87_1.var_.actorSpriteComps10022 == nil then
				arg_87_1.var_.actorSpriteComps10022 = var_90_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_90_2 = 0.034

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2

				if arg_87_1.var_.actorSpriteComps10022 then
					for iter_90_0, iter_90_1 in pairs(arg_87_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_90_1 then
							local var_90_4 = Mathf.Lerp(iter_90_1.color.r, 0.5, var_90_3)

							iter_90_1.color = Color.New(var_90_4, var_90_4, var_90_4)
						end
					end
				end
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 and arg_87_1.var_.actorSpriteComps10022 then
				local var_90_5 = 0.5

				for iter_90_2, iter_90_3 in pairs(arg_87_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_90_3 then
						iter_90_3.color = Color.New(var_90_5, var_90_5, var_90_5)
					end
				end

				arg_87_1.var_.actorSpriteComps10022 = nil
			end

			local var_90_6 = arg_87_1.actors_["10017"]
			local var_90_7 = 0

			if var_90_7 < arg_87_1.time_ and arg_87_1.time_ <= var_90_7 + arg_90_0 then
				local var_90_8 = var_90_6:GetComponent("Image")

				if var_90_8 then
					arg_87_1.var_.highlightMatValue10017 = var_90_8
				end
			end

			local var_90_9 = 0.034

			if var_90_7 <= arg_87_1.time_ and arg_87_1.time_ < var_90_7 + var_90_9 then
				local var_90_10 = (arg_87_1.time_ - var_90_7) / var_90_9

				if arg_87_1.var_.highlightMatValue10017 then
					local var_90_11 = Mathf.Lerp(0.5, 1, var_90_10)
					local var_90_12 = arg_87_1.var_.highlightMatValue10017
					local var_90_13 = var_90_12.color

					var_90_13.r = var_90_11
					var_90_13.g = var_90_11
					var_90_13.b = var_90_11
					var_90_12.color = var_90_13
				end
			end

			if arg_87_1.time_ >= var_90_7 + var_90_9 and arg_87_1.time_ < var_90_7 + var_90_9 + arg_90_0 and arg_87_1.var_.highlightMatValue10017 then
				local var_90_14 = 1

				var_90_6.transform:SetSiblingIndex(1)

				local var_90_15 = arg_87_1.var_.highlightMatValue10017
				local var_90_16 = var_90_15.color

				var_90_16.r = var_90_14
				var_90_16.g = var_90_14
				var_90_16.b = var_90_14
				var_90_15.color = var_90_16
			end

			local var_90_17 = 0
			local var_90_18 = 0.175

			if var_90_17 < arg_87_1.time_ and arg_87_1.time_ <= var_90_17 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_19 = arg_87_1:FormatText(StoryNameCfg[255].name)

				arg_87_1.leftNameTxt_.text = var_90_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_20 = arg_87_1:GetWordFromCfg(114282022)
				local var_90_21 = arg_87_1:FormatText(var_90_20.content)

				arg_87_1.text_.text = var_90_21

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_22 = 7
				local var_90_23 = utf8.len(var_90_21)
				local var_90_24 = var_90_22 <= 0 and var_90_18 or var_90_18 * (var_90_23 / var_90_22)

				if var_90_24 > 0 and var_90_18 < var_90_24 then
					arg_87_1.talkMaxDuration = var_90_24

					if var_90_24 + var_90_17 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_24 + var_90_17
					end
				end

				arg_87_1.text_.text = var_90_21
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114282", "114282022", "story_v_out_114282.awb") ~= 0 then
					local var_90_25 = manager.audio:GetVoiceLength("story_v_out_114282", "114282022", "story_v_out_114282.awb") / 1000

					if var_90_25 + var_90_17 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_25 + var_90_17
					end

					if var_90_20.prefab_name ~= "" and arg_87_1.actors_[var_90_20.prefab_name] ~= nil then
						local var_90_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_20.prefab_name].transform, "story_v_out_114282", "114282022", "story_v_out_114282.awb")

						arg_87_1:RecordAudio("114282022", var_90_26)
						arg_87_1:RecordAudio("114282022", var_90_26)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_114282", "114282022", "story_v_out_114282.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_114282", "114282022", "story_v_out_114282.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_27 = math.max(var_90_18, arg_87_1.talkMaxDuration)

			if var_90_17 <= arg_87_1.time_ and arg_87_1.time_ < var_90_17 + var_90_27 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_17) / var_90_27

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_17 + var_90_27 and arg_87_1.time_ < var_90_17 + var_90_27 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play114282023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 114282023
		arg_91_1.duration_ = 5

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play114282024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["10017"]
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				local var_94_2 = var_94_0:GetComponent("Image")

				if var_94_2 then
					arg_91_1.var_.highlightMatValue10017 = var_94_2
				end
			end

			local var_94_3 = 0.034

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_3 then
				local var_94_4 = (arg_91_1.time_ - var_94_1) / var_94_3

				if arg_91_1.var_.highlightMatValue10017 then
					local var_94_5 = Mathf.Lerp(1, 0.5, var_94_4)
					local var_94_6 = arg_91_1.var_.highlightMatValue10017
					local var_94_7 = var_94_6.color

					var_94_7.r = var_94_5
					var_94_7.g = var_94_5
					var_94_7.b = var_94_5
					var_94_6.color = var_94_7
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_3 and arg_91_1.time_ < var_94_1 + var_94_3 + arg_94_0 and arg_91_1.var_.highlightMatValue10017 then
				local var_94_8 = 0.5
				local var_94_9 = arg_91_1.var_.highlightMatValue10017
				local var_94_10 = var_94_9.color

				var_94_10.r = var_94_8
				var_94_10.g = var_94_8
				var_94_10.b = var_94_8
				var_94_9.color = var_94_10
			end

			local var_94_11 = arg_91_1.actors_["10022"]
			local var_94_12 = 0

			if var_94_12 < arg_91_1.time_ and arg_91_1.time_ <= var_94_12 + arg_94_0 then
				local var_94_13 = var_94_11:GetComponentInChildren(typeof(CanvasGroup))

				if var_94_13 then
					arg_91_1.var_.alphaOldValue10022 = var_94_13.alpha
					arg_91_1.var_.characterEffect10022 = var_94_13
				end

				arg_91_1.var_.alphaOldValue10022 = 1
			end

			local var_94_14 = 0.5

			if var_94_12 <= arg_91_1.time_ and arg_91_1.time_ < var_94_12 + var_94_14 then
				local var_94_15 = (arg_91_1.time_ - var_94_12) / var_94_14
				local var_94_16 = Mathf.Lerp(arg_91_1.var_.alphaOldValue10022, 0, var_94_15)

				if arg_91_1.var_.characterEffect10022 then
					arg_91_1.var_.characterEffect10022.alpha = var_94_16
				end
			end

			if arg_91_1.time_ >= var_94_12 + var_94_14 and arg_91_1.time_ < var_94_12 + var_94_14 + arg_94_0 and arg_91_1.var_.characterEffect10022 then
				arg_91_1.var_.characterEffect10022.alpha = 0
			end

			local var_94_17 = arg_91_1.actors_["10017"]
			local var_94_18 = 0

			if var_94_18 < arg_91_1.time_ and arg_91_1.time_ <= var_94_18 + arg_94_0 then
				local var_94_19 = var_94_17:GetComponent("Image")

				if var_94_19 then
					arg_91_1.var_.alphaMatValue10017 = var_94_19
					arg_91_1.var_.alphaOldValue10017 = var_94_19.color.a
				end

				arg_91_1.var_.alphaOldValue10017 = 1
			end

			local var_94_20 = 0.5

			if var_94_18 <= arg_91_1.time_ and arg_91_1.time_ < var_94_18 + var_94_20 then
				local var_94_21 = (arg_91_1.time_ - var_94_18) / var_94_20
				local var_94_22 = Mathf.Lerp(arg_91_1.var_.alphaOldValue10017, 0, var_94_21)

				if arg_91_1.var_.alphaMatValue10017 then
					local var_94_23 = arg_91_1.var_.alphaMatValue10017.color

					var_94_23.a = var_94_22
					arg_91_1.var_.alphaMatValue10017.color = var_94_23
				end
			end

			if arg_91_1.time_ >= var_94_18 + var_94_20 and arg_91_1.time_ < var_94_18 + var_94_20 + arg_94_0 and arg_91_1.var_.alphaMatValue10017 then
				local var_94_24 = arg_91_1.var_.alphaMatValue10017
				local var_94_25 = var_94_24.color

				var_94_25.a = 0
				var_94_24.color = var_94_25
			end

			local var_94_26 = 0
			local var_94_27 = 1.05

			if var_94_26 < arg_91_1.time_ and arg_91_1.time_ <= var_94_26 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, false)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_28 = arg_91_1:GetWordFromCfg(114282023)
				local var_94_29 = arg_91_1:FormatText(var_94_28.content)

				arg_91_1.text_.text = var_94_29

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_30 = 42
				local var_94_31 = utf8.len(var_94_29)
				local var_94_32 = var_94_30 <= 0 and var_94_27 or var_94_27 * (var_94_31 / var_94_30)

				if var_94_32 > 0 and var_94_27 < var_94_32 then
					arg_91_1.talkMaxDuration = var_94_32

					if var_94_32 + var_94_26 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_32 + var_94_26
					end
				end

				arg_91_1.text_.text = var_94_29
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)
				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_33 = math.max(var_94_27, arg_91_1.talkMaxDuration)

			if var_94_26 <= arg_91_1.time_ and arg_91_1.time_ < var_94_26 + var_94_33 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_26) / var_94_33

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_26 + var_94_33 and arg_91_1.time_ < var_94_26 + var_94_33 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play114282024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 114282024
		arg_95_1.duration_ = 3.766

		local var_95_0 = {
			ja = 3.766,
			ko = 2.833,
			zh = 3.333,
			en = 2.9
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
				arg_95_0:Play114282025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["10023"]
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				local var_98_2 = var_98_0:GetComponent("Image")

				if var_98_2 then
					arg_95_1.var_.alphaMatValue10023 = var_98_2
					arg_95_1.var_.alphaOldValue10023 = var_98_2.color.a
				end

				arg_95_1.var_.alphaOldValue10023 = 0
			end

			local var_98_3 = 0.5

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_3 then
				local var_98_4 = (arg_95_1.time_ - var_98_1) / var_98_3
				local var_98_5 = Mathf.Lerp(arg_95_1.var_.alphaOldValue10023, 1, var_98_4)

				if arg_95_1.var_.alphaMatValue10023 then
					local var_98_6 = arg_95_1.var_.alphaMatValue10023.color

					var_98_6.a = var_98_5
					arg_95_1.var_.alphaMatValue10023.color = var_98_6
				end
			end

			if arg_95_1.time_ >= var_98_1 + var_98_3 and arg_95_1.time_ < var_98_1 + var_98_3 + arg_98_0 and arg_95_1.var_.alphaMatValue10023 then
				local var_98_7 = arg_95_1.var_.alphaMatValue10023
				local var_98_8 = var_98_7.color

				var_98_8.a = 1
				var_98_7.color = var_98_8
			end

			local var_98_9 = arg_95_1.actors_["10023"].transform
			local var_98_10 = 0

			if var_98_10 < arg_95_1.time_ and arg_95_1.time_ <= var_98_10 + arg_98_0 then
				arg_95_1.var_.moveOldPos10023 = var_98_9.localPosition
				var_98_9.localScale = Vector3.New(1, 1, 1)

				arg_95_1:CheckSpriteTmpPos("10023", 2)
			end

			local var_98_11 = 0.001

			if var_98_10 <= arg_95_1.time_ and arg_95_1.time_ < var_98_10 + var_98_11 then
				local var_98_12 = (arg_95_1.time_ - var_98_10) / var_98_11
				local var_98_13 = Vector3.New(-390, -350, -180)

				var_98_9.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos10023, var_98_13, var_98_12)
			end

			if arg_95_1.time_ >= var_98_10 + var_98_11 and arg_95_1.time_ < var_98_10 + var_98_11 + arg_98_0 then
				var_98_9.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_98_14 = arg_95_1.actors_["10023"]
			local var_98_15 = 0

			if var_98_15 < arg_95_1.time_ and arg_95_1.time_ <= var_98_15 + arg_98_0 then
				local var_98_16 = var_98_14:GetComponent("Image")

				if var_98_16 then
					arg_95_1.var_.highlightMatValue10023 = var_98_16
				end
			end

			local var_98_17 = 0.034

			if var_98_15 <= arg_95_1.time_ and arg_95_1.time_ < var_98_15 + var_98_17 then
				local var_98_18 = (arg_95_1.time_ - var_98_15) / var_98_17

				if arg_95_1.var_.highlightMatValue10023 then
					local var_98_19 = Mathf.Lerp(0.5, 1, var_98_18)
					local var_98_20 = arg_95_1.var_.highlightMatValue10023
					local var_98_21 = var_98_20.color

					var_98_21.r = var_98_19
					var_98_21.g = var_98_19
					var_98_21.b = var_98_19
					var_98_20.color = var_98_21
				end
			end

			if arg_95_1.time_ >= var_98_15 + var_98_17 and arg_95_1.time_ < var_98_15 + var_98_17 + arg_98_0 and arg_95_1.var_.highlightMatValue10023 then
				local var_98_22 = 1

				var_98_14.transform:SetSiblingIndex(1)

				local var_98_23 = arg_95_1.var_.highlightMatValue10023
				local var_98_24 = var_98_23.color

				var_98_24.r = var_98_22
				var_98_24.g = var_98_22
				var_98_24.b = var_98_22
				var_98_23.color = var_98_24
			end

			local var_98_25 = 0
			local var_98_26 = 0.325

			if var_98_25 < arg_95_1.time_ and arg_95_1.time_ <= var_98_25 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_27 = arg_95_1:FormatText(StoryNameCfg[259].name)

				arg_95_1.leftNameTxt_.text = var_98_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_28 = arg_95_1:GetWordFromCfg(114282024)
				local var_98_29 = arg_95_1:FormatText(var_98_28.content)

				arg_95_1.text_.text = var_98_29

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_30 = 13
				local var_98_31 = utf8.len(var_98_29)
				local var_98_32 = var_98_30 <= 0 and var_98_26 or var_98_26 * (var_98_31 / var_98_30)

				if var_98_32 > 0 and var_98_26 < var_98_32 then
					arg_95_1.talkMaxDuration = var_98_32

					if var_98_32 + var_98_25 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_32 + var_98_25
					end
				end

				arg_95_1.text_.text = var_98_29
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114282", "114282024", "story_v_out_114282.awb") ~= 0 then
					local var_98_33 = manager.audio:GetVoiceLength("story_v_out_114282", "114282024", "story_v_out_114282.awb") / 1000

					if var_98_33 + var_98_25 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_33 + var_98_25
					end

					if var_98_28.prefab_name ~= "" and arg_95_1.actors_[var_98_28.prefab_name] ~= nil then
						local var_98_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_28.prefab_name].transform, "story_v_out_114282", "114282024", "story_v_out_114282.awb")

						arg_95_1:RecordAudio("114282024", var_98_34)
						arg_95_1:RecordAudio("114282024", var_98_34)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_114282", "114282024", "story_v_out_114282.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_114282", "114282024", "story_v_out_114282.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_35 = math.max(var_98_26, arg_95_1.talkMaxDuration)

			if var_98_25 <= arg_95_1.time_ and arg_95_1.time_ < var_98_25 + var_98_35 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_25) / var_98_35

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_25 + var_98_35 and arg_95_1.time_ < var_98_25 + var_98_35 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play114282025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 114282025
		arg_99_1.duration_ = 9.433

		local var_99_0 = {
			ja = 8.666,
			ko = 6.733,
			zh = 6.3,
			en = 9.433
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
				arg_99_0:Play114282026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["10017"].transform
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1.var_.moveOldPos10017 = var_102_0.localPosition
				var_102_0.localScale = Vector3.New(1, 1, 1)

				arg_99_1:CheckSpriteTmpPos("10017", 4)
			end

			local var_102_2 = 0.001

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2
				local var_102_4 = Vector3.New(390, -350, -180)

				var_102_0.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos10017, var_102_4, var_102_3)
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 then
				var_102_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_102_5 = arg_99_1.actors_["10023"]
			local var_102_6 = 0

			if var_102_6 < arg_99_1.time_ and arg_99_1.time_ <= var_102_6 + arg_102_0 then
				local var_102_7 = var_102_5:GetComponent("Image")

				if var_102_7 then
					arg_99_1.var_.highlightMatValue10023 = var_102_7
				end
			end

			local var_102_8 = 0.034

			if var_102_6 <= arg_99_1.time_ and arg_99_1.time_ < var_102_6 + var_102_8 then
				local var_102_9 = (arg_99_1.time_ - var_102_6) / var_102_8

				if arg_99_1.var_.highlightMatValue10023 then
					local var_102_10 = Mathf.Lerp(1, 0.5, var_102_9)
					local var_102_11 = arg_99_1.var_.highlightMatValue10023
					local var_102_12 = var_102_11.color

					var_102_12.r = var_102_10
					var_102_12.g = var_102_10
					var_102_12.b = var_102_10
					var_102_11.color = var_102_12
				end
			end

			if arg_99_1.time_ >= var_102_6 + var_102_8 and arg_99_1.time_ < var_102_6 + var_102_8 + arg_102_0 and arg_99_1.var_.highlightMatValue10023 then
				local var_102_13 = 0.5
				local var_102_14 = arg_99_1.var_.highlightMatValue10023
				local var_102_15 = var_102_14.color

				var_102_15.r = var_102_13
				var_102_15.g = var_102_13
				var_102_15.b = var_102_13
				var_102_14.color = var_102_15
			end

			local var_102_16 = arg_99_1.actors_["10017"]
			local var_102_17 = 0

			if var_102_17 < arg_99_1.time_ and arg_99_1.time_ <= var_102_17 + arg_102_0 then
				local var_102_18 = var_102_16:GetComponent("Image")

				if var_102_18 then
					arg_99_1.var_.highlightMatValue10017 = var_102_18
				end
			end

			local var_102_19 = 0.034

			if var_102_17 <= arg_99_1.time_ and arg_99_1.time_ < var_102_17 + var_102_19 then
				local var_102_20 = (arg_99_1.time_ - var_102_17) / var_102_19

				if arg_99_1.var_.highlightMatValue10017 then
					local var_102_21 = Mathf.Lerp(0.5, 1, var_102_20)
					local var_102_22 = arg_99_1.var_.highlightMatValue10017
					local var_102_23 = var_102_22.color

					var_102_23.r = var_102_21
					var_102_23.g = var_102_21
					var_102_23.b = var_102_21
					var_102_22.color = var_102_23
				end
			end

			if arg_99_1.time_ >= var_102_17 + var_102_19 and arg_99_1.time_ < var_102_17 + var_102_19 + arg_102_0 and arg_99_1.var_.highlightMatValue10017 then
				local var_102_24 = 1

				var_102_16.transform:SetSiblingIndex(1)

				local var_102_25 = arg_99_1.var_.highlightMatValue10017
				local var_102_26 = var_102_25.color

				var_102_26.r = var_102_24
				var_102_26.g = var_102_24
				var_102_26.b = var_102_24
				var_102_25.color = var_102_26
			end

			local var_102_27 = arg_99_1.actors_["10017"]
			local var_102_28 = 0

			if var_102_28 < arg_99_1.time_ and arg_99_1.time_ <= var_102_28 + arg_102_0 then
				local var_102_29 = var_102_27:GetComponent("Image")

				if var_102_29 then
					arg_99_1.var_.alphaMatValue10017 = var_102_29
					arg_99_1.var_.alphaOldValue10017 = var_102_29.color.a
				end

				arg_99_1.var_.alphaOldValue10017 = 0
			end

			local var_102_30 = 0.5

			if var_102_28 <= arg_99_1.time_ and arg_99_1.time_ < var_102_28 + var_102_30 then
				local var_102_31 = (arg_99_1.time_ - var_102_28) / var_102_30
				local var_102_32 = Mathf.Lerp(arg_99_1.var_.alphaOldValue10017, 1, var_102_31)

				if arg_99_1.var_.alphaMatValue10017 then
					local var_102_33 = arg_99_1.var_.alphaMatValue10017.color

					var_102_33.a = var_102_32
					arg_99_1.var_.alphaMatValue10017.color = var_102_33
				end
			end

			if arg_99_1.time_ >= var_102_28 + var_102_30 and arg_99_1.time_ < var_102_28 + var_102_30 + arg_102_0 and arg_99_1.var_.alphaMatValue10017 then
				local var_102_34 = arg_99_1.var_.alphaMatValue10017
				local var_102_35 = var_102_34.color

				var_102_35.a = 1
				var_102_34.color = var_102_35
			end

			local var_102_36 = 0
			local var_102_37 = 0.825

			if var_102_36 < arg_99_1.time_ and arg_99_1.time_ <= var_102_36 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_38 = arg_99_1:FormatText(StoryNameCfg[255].name)

				arg_99_1.leftNameTxt_.text = var_102_38

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_39 = arg_99_1:GetWordFromCfg(114282025)
				local var_102_40 = arg_99_1:FormatText(var_102_39.content)

				arg_99_1.text_.text = var_102_40

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_41 = 33
				local var_102_42 = utf8.len(var_102_40)
				local var_102_43 = var_102_41 <= 0 and var_102_37 or var_102_37 * (var_102_42 / var_102_41)

				if var_102_43 > 0 and var_102_37 < var_102_43 then
					arg_99_1.talkMaxDuration = var_102_43

					if var_102_43 + var_102_36 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_43 + var_102_36
					end
				end

				arg_99_1.text_.text = var_102_40
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114282", "114282025", "story_v_out_114282.awb") ~= 0 then
					local var_102_44 = manager.audio:GetVoiceLength("story_v_out_114282", "114282025", "story_v_out_114282.awb") / 1000

					if var_102_44 + var_102_36 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_44 + var_102_36
					end

					if var_102_39.prefab_name ~= "" and arg_99_1.actors_[var_102_39.prefab_name] ~= nil then
						local var_102_45 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_39.prefab_name].transform, "story_v_out_114282", "114282025", "story_v_out_114282.awb")

						arg_99_1:RecordAudio("114282025", var_102_45)
						arg_99_1:RecordAudio("114282025", var_102_45)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_114282", "114282025", "story_v_out_114282.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_114282", "114282025", "story_v_out_114282.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_46 = math.max(var_102_37, arg_99_1.talkMaxDuration)

			if var_102_36 <= arg_99_1.time_ and arg_99_1.time_ < var_102_36 + var_102_46 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_36) / var_102_46

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_36 + var_102_46 and arg_99_1.time_ < var_102_36 + var_102_46 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play114282026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 114282026
		arg_103_1.duration_ = 7.966

		local var_103_0 = {
			ja = 5.266,
			ko = 7.4,
			zh = 6.233,
			en = 7.966
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
				arg_103_0:Play114282027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["10023"]
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				local var_106_2 = var_106_0:GetComponent("Image")

				if var_106_2 then
					arg_103_1.var_.highlightMatValue10023 = var_106_2
				end
			end

			local var_106_3 = 0.034

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_3 then
				local var_106_4 = (arg_103_1.time_ - var_106_1) / var_106_3

				if arg_103_1.var_.highlightMatValue10023 then
					local var_106_5 = Mathf.Lerp(0.5, 1, var_106_4)
					local var_106_6 = arg_103_1.var_.highlightMatValue10023
					local var_106_7 = var_106_6.color

					var_106_7.r = var_106_5
					var_106_7.g = var_106_5
					var_106_7.b = var_106_5
					var_106_6.color = var_106_7
				end
			end

			if arg_103_1.time_ >= var_106_1 + var_106_3 and arg_103_1.time_ < var_106_1 + var_106_3 + arg_106_0 and arg_103_1.var_.highlightMatValue10023 then
				local var_106_8 = 1

				var_106_0.transform:SetSiblingIndex(1)

				local var_106_9 = arg_103_1.var_.highlightMatValue10023
				local var_106_10 = var_106_9.color

				var_106_10.r = var_106_8
				var_106_10.g = var_106_8
				var_106_10.b = var_106_8
				var_106_9.color = var_106_10
			end

			local var_106_11 = arg_103_1.actors_["10017"]
			local var_106_12 = 0

			if var_106_12 < arg_103_1.time_ and arg_103_1.time_ <= var_106_12 + arg_106_0 then
				local var_106_13 = var_106_11:GetComponent("Image")

				if var_106_13 then
					arg_103_1.var_.highlightMatValue10017 = var_106_13
				end
			end

			local var_106_14 = 0.034

			if var_106_12 <= arg_103_1.time_ and arg_103_1.time_ < var_106_12 + var_106_14 then
				local var_106_15 = (arg_103_1.time_ - var_106_12) / var_106_14

				if arg_103_1.var_.highlightMatValue10017 then
					local var_106_16 = Mathf.Lerp(1, 0.5, var_106_15)
					local var_106_17 = arg_103_1.var_.highlightMatValue10017
					local var_106_18 = var_106_17.color

					var_106_18.r = var_106_16
					var_106_18.g = var_106_16
					var_106_18.b = var_106_16
					var_106_17.color = var_106_18
				end
			end

			if arg_103_1.time_ >= var_106_12 + var_106_14 and arg_103_1.time_ < var_106_12 + var_106_14 + arg_106_0 and arg_103_1.var_.highlightMatValue10017 then
				local var_106_19 = 0.5
				local var_106_20 = arg_103_1.var_.highlightMatValue10017
				local var_106_21 = var_106_20.color

				var_106_21.r = var_106_19
				var_106_21.g = var_106_19
				var_106_21.b = var_106_19
				var_106_20.color = var_106_21
			end

			local var_106_22 = 0
			local var_106_23 = 0.6

			if var_106_22 < arg_103_1.time_ and arg_103_1.time_ <= var_106_22 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_24 = arg_103_1:FormatText(StoryNameCfg[259].name)

				arg_103_1.leftNameTxt_.text = var_106_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_25 = arg_103_1:GetWordFromCfg(114282026)
				local var_106_26 = arg_103_1:FormatText(var_106_25.content)

				arg_103_1.text_.text = var_106_26

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_27 = 24
				local var_106_28 = utf8.len(var_106_26)
				local var_106_29 = var_106_27 <= 0 and var_106_23 or var_106_23 * (var_106_28 / var_106_27)

				if var_106_29 > 0 and var_106_23 < var_106_29 then
					arg_103_1.talkMaxDuration = var_106_29

					if var_106_29 + var_106_22 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_29 + var_106_22
					end
				end

				arg_103_1.text_.text = var_106_26
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114282", "114282026", "story_v_out_114282.awb") ~= 0 then
					local var_106_30 = manager.audio:GetVoiceLength("story_v_out_114282", "114282026", "story_v_out_114282.awb") / 1000

					if var_106_30 + var_106_22 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_30 + var_106_22
					end

					if var_106_25.prefab_name ~= "" and arg_103_1.actors_[var_106_25.prefab_name] ~= nil then
						local var_106_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_25.prefab_name].transform, "story_v_out_114282", "114282026", "story_v_out_114282.awb")

						arg_103_1:RecordAudio("114282026", var_106_31)
						arg_103_1:RecordAudio("114282026", var_106_31)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_114282", "114282026", "story_v_out_114282.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_114282", "114282026", "story_v_out_114282.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_32 = math.max(var_106_23, arg_103_1.talkMaxDuration)

			if var_106_22 <= arg_103_1.time_ and arg_103_1.time_ < var_106_22 + var_106_32 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_22) / var_106_32

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_22 + var_106_32 and arg_103_1.time_ < var_106_22 + var_106_32 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play114282027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 114282027
		arg_107_1.duration_ = 5.633

		local var_107_0 = {
			ja = 1.733,
			ko = 5.633,
			zh = 4.4,
			en = 5.566
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
				arg_107_0:Play114282028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["10023"]
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 then
				local var_110_2 = var_110_0:GetComponent("Image")

				if var_110_2 then
					arg_107_1.var_.highlightMatValue10023 = var_110_2
				end
			end

			local var_110_3 = 0.034

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_3 then
				local var_110_4 = (arg_107_1.time_ - var_110_1) / var_110_3

				if arg_107_1.var_.highlightMatValue10023 then
					local var_110_5 = Mathf.Lerp(1, 0.5, var_110_4)
					local var_110_6 = arg_107_1.var_.highlightMatValue10023
					local var_110_7 = var_110_6.color

					var_110_7.r = var_110_5
					var_110_7.g = var_110_5
					var_110_7.b = var_110_5
					var_110_6.color = var_110_7
				end
			end

			if arg_107_1.time_ >= var_110_1 + var_110_3 and arg_107_1.time_ < var_110_1 + var_110_3 + arg_110_0 and arg_107_1.var_.highlightMatValue10023 then
				local var_110_8 = 0.5
				local var_110_9 = arg_107_1.var_.highlightMatValue10023
				local var_110_10 = var_110_9.color

				var_110_10.r = var_110_8
				var_110_10.g = var_110_8
				var_110_10.b = var_110_8
				var_110_9.color = var_110_10
			end

			local var_110_11 = arg_107_1.actors_["10017"]
			local var_110_12 = 0

			if var_110_12 < arg_107_1.time_ and arg_107_1.time_ <= var_110_12 + arg_110_0 then
				local var_110_13 = var_110_11:GetComponent("Image")

				if var_110_13 then
					arg_107_1.var_.highlightMatValue10017 = var_110_13
				end
			end

			local var_110_14 = 0.034

			if var_110_12 <= arg_107_1.time_ and arg_107_1.time_ < var_110_12 + var_110_14 then
				local var_110_15 = (arg_107_1.time_ - var_110_12) / var_110_14

				if arg_107_1.var_.highlightMatValue10017 then
					local var_110_16 = Mathf.Lerp(0.5, 1, var_110_15)
					local var_110_17 = arg_107_1.var_.highlightMatValue10017
					local var_110_18 = var_110_17.color

					var_110_18.r = var_110_16
					var_110_18.g = var_110_16
					var_110_18.b = var_110_16
					var_110_17.color = var_110_18
				end
			end

			if arg_107_1.time_ >= var_110_12 + var_110_14 and arg_107_1.time_ < var_110_12 + var_110_14 + arg_110_0 and arg_107_1.var_.highlightMatValue10017 then
				local var_110_19 = 1

				var_110_11.transform:SetSiblingIndex(1)

				local var_110_20 = arg_107_1.var_.highlightMatValue10017
				local var_110_21 = var_110_20.color

				var_110_21.r = var_110_19
				var_110_21.g = var_110_19
				var_110_21.b = var_110_19
				var_110_20.color = var_110_21
			end

			local var_110_22 = 0
			local var_110_23 = 0.475

			if var_110_22 < arg_107_1.time_ and arg_107_1.time_ <= var_110_22 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_24 = arg_107_1:FormatText(StoryNameCfg[255].name)

				arg_107_1.leftNameTxt_.text = var_110_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_25 = arg_107_1:GetWordFromCfg(114282027)
				local var_110_26 = arg_107_1:FormatText(var_110_25.content)

				arg_107_1.text_.text = var_110_26

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_27 = 19
				local var_110_28 = utf8.len(var_110_26)
				local var_110_29 = var_110_27 <= 0 and var_110_23 or var_110_23 * (var_110_28 / var_110_27)

				if var_110_29 > 0 and var_110_23 < var_110_29 then
					arg_107_1.talkMaxDuration = var_110_29

					if var_110_29 + var_110_22 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_29 + var_110_22
					end
				end

				arg_107_1.text_.text = var_110_26
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114282", "114282027", "story_v_out_114282.awb") ~= 0 then
					local var_110_30 = manager.audio:GetVoiceLength("story_v_out_114282", "114282027", "story_v_out_114282.awb") / 1000

					if var_110_30 + var_110_22 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_30 + var_110_22
					end

					if var_110_25.prefab_name ~= "" and arg_107_1.actors_[var_110_25.prefab_name] ~= nil then
						local var_110_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_25.prefab_name].transform, "story_v_out_114282", "114282027", "story_v_out_114282.awb")

						arg_107_1:RecordAudio("114282027", var_110_31)
						arg_107_1:RecordAudio("114282027", var_110_31)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_114282", "114282027", "story_v_out_114282.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_114282", "114282027", "story_v_out_114282.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_32 = math.max(var_110_23, arg_107_1.talkMaxDuration)

			if var_110_22 <= arg_107_1.time_ and arg_107_1.time_ < var_110_22 + var_110_32 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_22) / var_110_32

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_22 + var_110_32 and arg_107_1.time_ < var_110_22 + var_110_32 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play114282028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 114282028
		arg_111_1.duration_ = 13.2

		local var_111_0 = {
			ja = 13.2,
			ko = 9.8,
			zh = 8.833,
			en = 8.6
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
				arg_111_0:Play114282029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["10023"]
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 then
				local var_114_2 = var_114_0:GetComponent("Image")

				if var_114_2 then
					arg_111_1.var_.highlightMatValue10023 = var_114_2
				end
			end

			local var_114_3 = 0.034

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_3 then
				local var_114_4 = (arg_111_1.time_ - var_114_1) / var_114_3

				if arg_111_1.var_.highlightMatValue10023 then
					local var_114_5 = Mathf.Lerp(0.5, 1, var_114_4)
					local var_114_6 = arg_111_1.var_.highlightMatValue10023
					local var_114_7 = var_114_6.color

					var_114_7.r = var_114_5
					var_114_7.g = var_114_5
					var_114_7.b = var_114_5
					var_114_6.color = var_114_7
				end
			end

			if arg_111_1.time_ >= var_114_1 + var_114_3 and arg_111_1.time_ < var_114_1 + var_114_3 + arg_114_0 and arg_111_1.var_.highlightMatValue10023 then
				local var_114_8 = 1

				var_114_0.transform:SetSiblingIndex(1)

				local var_114_9 = arg_111_1.var_.highlightMatValue10023
				local var_114_10 = var_114_9.color

				var_114_10.r = var_114_8
				var_114_10.g = var_114_8
				var_114_10.b = var_114_8
				var_114_9.color = var_114_10
			end

			local var_114_11 = arg_111_1.actors_["10017"]
			local var_114_12 = 0

			if var_114_12 < arg_111_1.time_ and arg_111_1.time_ <= var_114_12 + arg_114_0 then
				local var_114_13 = var_114_11:GetComponent("Image")

				if var_114_13 then
					arg_111_1.var_.highlightMatValue10017 = var_114_13
				end
			end

			local var_114_14 = 0.034

			if var_114_12 <= arg_111_1.time_ and arg_111_1.time_ < var_114_12 + var_114_14 then
				local var_114_15 = (arg_111_1.time_ - var_114_12) / var_114_14

				if arg_111_1.var_.highlightMatValue10017 then
					local var_114_16 = Mathf.Lerp(1, 0.5, var_114_15)
					local var_114_17 = arg_111_1.var_.highlightMatValue10017
					local var_114_18 = var_114_17.color

					var_114_18.r = var_114_16
					var_114_18.g = var_114_16
					var_114_18.b = var_114_16
					var_114_17.color = var_114_18
				end
			end

			if arg_111_1.time_ >= var_114_12 + var_114_14 and arg_111_1.time_ < var_114_12 + var_114_14 + arg_114_0 and arg_111_1.var_.highlightMatValue10017 then
				local var_114_19 = 0.5
				local var_114_20 = arg_111_1.var_.highlightMatValue10017
				local var_114_21 = var_114_20.color

				var_114_21.r = var_114_19
				var_114_21.g = var_114_19
				var_114_21.b = var_114_19
				var_114_20.color = var_114_21
			end

			local var_114_22 = 0
			local var_114_23 = 0.975

			if var_114_22 < arg_111_1.time_ and arg_111_1.time_ <= var_114_22 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_24 = arg_111_1:FormatText(StoryNameCfg[259].name)

				arg_111_1.leftNameTxt_.text = var_114_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_25 = arg_111_1:GetWordFromCfg(114282028)
				local var_114_26 = arg_111_1:FormatText(var_114_25.content)

				arg_111_1.text_.text = var_114_26

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_27 = 39
				local var_114_28 = utf8.len(var_114_26)
				local var_114_29 = var_114_27 <= 0 and var_114_23 or var_114_23 * (var_114_28 / var_114_27)

				if var_114_29 > 0 and var_114_23 < var_114_29 then
					arg_111_1.talkMaxDuration = var_114_29

					if var_114_29 + var_114_22 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_29 + var_114_22
					end
				end

				arg_111_1.text_.text = var_114_26
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114282", "114282028", "story_v_out_114282.awb") ~= 0 then
					local var_114_30 = manager.audio:GetVoiceLength("story_v_out_114282", "114282028", "story_v_out_114282.awb") / 1000

					if var_114_30 + var_114_22 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_30 + var_114_22
					end

					if var_114_25.prefab_name ~= "" and arg_111_1.actors_[var_114_25.prefab_name] ~= nil then
						local var_114_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_25.prefab_name].transform, "story_v_out_114282", "114282028", "story_v_out_114282.awb")

						arg_111_1:RecordAudio("114282028", var_114_31)
						arg_111_1:RecordAudio("114282028", var_114_31)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_114282", "114282028", "story_v_out_114282.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_114282", "114282028", "story_v_out_114282.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_32 = math.max(var_114_23, arg_111_1.talkMaxDuration)

			if var_114_22 <= arg_111_1.time_ and arg_111_1.time_ < var_114_22 + var_114_32 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_22) / var_114_32

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_22 + var_114_32 and arg_111_1.time_ < var_114_22 + var_114_32 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play114282029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 114282029
		arg_115_1.duration_ = 9.866

		local var_115_0 = {
			ja = 5,
			ko = 6.366,
			zh = 7.6,
			en = 9.866
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
				arg_115_0:Play114282030(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["10023"]
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 then
				local var_118_2 = var_118_0:GetComponent("Image")

				if var_118_2 then
					arg_115_1.var_.highlightMatValue10023 = var_118_2
				end
			end

			local var_118_3 = 0.034

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_3 then
				local var_118_4 = (arg_115_1.time_ - var_118_1) / var_118_3

				if arg_115_1.var_.highlightMatValue10023 then
					local var_118_5 = Mathf.Lerp(1, 0.5, var_118_4)
					local var_118_6 = arg_115_1.var_.highlightMatValue10023
					local var_118_7 = var_118_6.color

					var_118_7.r = var_118_5
					var_118_7.g = var_118_5
					var_118_7.b = var_118_5
					var_118_6.color = var_118_7
				end
			end

			if arg_115_1.time_ >= var_118_1 + var_118_3 and arg_115_1.time_ < var_118_1 + var_118_3 + arg_118_0 and arg_115_1.var_.highlightMatValue10023 then
				local var_118_8 = 0.5
				local var_118_9 = arg_115_1.var_.highlightMatValue10023
				local var_118_10 = var_118_9.color

				var_118_10.r = var_118_8
				var_118_10.g = var_118_8
				var_118_10.b = var_118_8
				var_118_9.color = var_118_10
			end

			local var_118_11 = arg_115_1.actors_["10017"]
			local var_118_12 = 0

			if var_118_12 < arg_115_1.time_ and arg_115_1.time_ <= var_118_12 + arg_118_0 then
				local var_118_13 = var_118_11:GetComponent("Image")

				if var_118_13 then
					arg_115_1.var_.highlightMatValue10017 = var_118_13
				end
			end

			local var_118_14 = 0.034

			if var_118_12 <= arg_115_1.time_ and arg_115_1.time_ < var_118_12 + var_118_14 then
				local var_118_15 = (arg_115_1.time_ - var_118_12) / var_118_14

				if arg_115_1.var_.highlightMatValue10017 then
					local var_118_16 = Mathf.Lerp(0.5, 1, var_118_15)
					local var_118_17 = arg_115_1.var_.highlightMatValue10017
					local var_118_18 = var_118_17.color

					var_118_18.r = var_118_16
					var_118_18.g = var_118_16
					var_118_18.b = var_118_16
					var_118_17.color = var_118_18
				end
			end

			if arg_115_1.time_ >= var_118_12 + var_118_14 and arg_115_1.time_ < var_118_12 + var_118_14 + arg_118_0 and arg_115_1.var_.highlightMatValue10017 then
				local var_118_19 = 1

				var_118_11.transform:SetSiblingIndex(1)

				local var_118_20 = arg_115_1.var_.highlightMatValue10017
				local var_118_21 = var_118_20.color

				var_118_21.r = var_118_19
				var_118_21.g = var_118_19
				var_118_21.b = var_118_19
				var_118_20.color = var_118_21
			end

			local var_118_22 = 0
			local var_118_23 = 0.5

			if var_118_22 < arg_115_1.time_ and arg_115_1.time_ <= var_118_22 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_24 = arg_115_1:FormatText(StoryNameCfg[255].name)

				arg_115_1.leftNameTxt_.text = var_118_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_25 = arg_115_1:GetWordFromCfg(114282029)
				local var_118_26 = arg_115_1:FormatText(var_118_25.content)

				arg_115_1.text_.text = var_118_26

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_27 = 20
				local var_118_28 = utf8.len(var_118_26)
				local var_118_29 = var_118_27 <= 0 and var_118_23 or var_118_23 * (var_118_28 / var_118_27)

				if var_118_29 > 0 and var_118_23 < var_118_29 then
					arg_115_1.talkMaxDuration = var_118_29

					if var_118_29 + var_118_22 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_29 + var_118_22
					end
				end

				arg_115_1.text_.text = var_118_26
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114282", "114282029", "story_v_out_114282.awb") ~= 0 then
					local var_118_30 = manager.audio:GetVoiceLength("story_v_out_114282", "114282029", "story_v_out_114282.awb") / 1000

					if var_118_30 + var_118_22 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_30 + var_118_22
					end

					if var_118_25.prefab_name ~= "" and arg_115_1.actors_[var_118_25.prefab_name] ~= nil then
						local var_118_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_25.prefab_name].transform, "story_v_out_114282", "114282029", "story_v_out_114282.awb")

						arg_115_1:RecordAudio("114282029", var_118_31)
						arg_115_1:RecordAudio("114282029", var_118_31)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_114282", "114282029", "story_v_out_114282.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_114282", "114282029", "story_v_out_114282.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_32 = math.max(var_118_23, arg_115_1.talkMaxDuration)

			if var_118_22 <= arg_115_1.time_ and arg_115_1.time_ < var_118_22 + var_118_32 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_22) / var_118_32

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_22 + var_118_32 and arg_115_1.time_ < var_118_22 + var_118_32 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play114282030 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 114282030
		arg_119_1.duration_ = 3.4

		local var_119_0 = {
			ja = 1.4,
			ko = 2.1,
			zh = 3.4,
			en = 3.066
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
				arg_119_0:Play114282031(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0
			local var_122_1 = 0.25

			if var_122_0 < arg_119_1.time_ and arg_119_1.time_ <= var_122_0 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_2 = arg_119_1:FormatText(StoryNameCfg[255].name)

				arg_119_1.leftNameTxt_.text = var_122_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_3 = arg_119_1:GetWordFromCfg(114282030)
				local var_122_4 = arg_119_1:FormatText(var_122_3.content)

				arg_119_1.text_.text = var_122_4

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_5 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_114282", "114282030", "story_v_out_114282.awb") ~= 0 then
					local var_122_8 = manager.audio:GetVoiceLength("story_v_out_114282", "114282030", "story_v_out_114282.awb") / 1000

					if var_122_8 + var_122_0 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_8 + var_122_0
					end

					if var_122_3.prefab_name ~= "" and arg_119_1.actors_[var_122_3.prefab_name] ~= nil then
						local var_122_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_3.prefab_name].transform, "story_v_out_114282", "114282030", "story_v_out_114282.awb")

						arg_119_1:RecordAudio("114282030", var_122_9)
						arg_119_1:RecordAudio("114282030", var_122_9)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_114282", "114282030", "story_v_out_114282.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_114282", "114282030", "story_v_out_114282.awb")
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
	Play114282031 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 114282031
		arg_123_1.duration_ = 5

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play114282032(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["10017"]
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 then
				local var_126_2 = var_126_0:GetComponent("Image")

				if var_126_2 then
					arg_123_1.var_.alphaMatValue10017 = var_126_2
					arg_123_1.var_.alphaOldValue10017 = var_126_2.color.a
				end

				arg_123_1.var_.alphaOldValue10017 = 1
			end

			local var_126_3 = 0.5

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_3 then
				local var_126_4 = (arg_123_1.time_ - var_126_1) / var_126_3
				local var_126_5 = Mathf.Lerp(arg_123_1.var_.alphaOldValue10017, 0, var_126_4)

				if arg_123_1.var_.alphaMatValue10017 then
					local var_126_6 = arg_123_1.var_.alphaMatValue10017.color

					var_126_6.a = var_126_5
					arg_123_1.var_.alphaMatValue10017.color = var_126_6
				end
			end

			if arg_123_1.time_ >= var_126_1 + var_126_3 and arg_123_1.time_ < var_126_1 + var_126_3 + arg_126_0 and arg_123_1.var_.alphaMatValue10017 then
				local var_126_7 = arg_123_1.var_.alphaMatValue10017
				local var_126_8 = var_126_7.color

				var_126_8.a = 0
				var_126_7.color = var_126_8
			end

			local var_126_9 = arg_123_1.actors_["10023"]
			local var_126_10 = 0

			if var_126_10 < arg_123_1.time_ and arg_123_1.time_ <= var_126_10 + arg_126_0 then
				local var_126_11 = var_126_9:GetComponent("Image")

				if var_126_11 then
					arg_123_1.var_.alphaMatValue10023 = var_126_11
					arg_123_1.var_.alphaOldValue10023 = var_126_11.color.a
				end

				arg_123_1.var_.alphaOldValue10023 = 1
			end

			local var_126_12 = 0.5

			if var_126_10 <= arg_123_1.time_ and arg_123_1.time_ < var_126_10 + var_126_12 then
				local var_126_13 = (arg_123_1.time_ - var_126_10) / var_126_12
				local var_126_14 = Mathf.Lerp(arg_123_1.var_.alphaOldValue10023, 0, var_126_13)

				if arg_123_1.var_.alphaMatValue10023 then
					local var_126_15 = arg_123_1.var_.alphaMatValue10023.color

					var_126_15.a = var_126_14
					arg_123_1.var_.alphaMatValue10023.color = var_126_15
				end
			end

			if arg_123_1.time_ >= var_126_10 + var_126_12 and arg_123_1.time_ < var_126_10 + var_126_12 + arg_126_0 and arg_123_1.var_.alphaMatValue10023 then
				local var_126_16 = arg_123_1.var_.alphaMatValue10023
				local var_126_17 = var_126_16.color

				var_126_17.a = 0
				var_126_16.color = var_126_17
			end

			local var_126_18 = 0
			local var_126_19 = 0.95

			if var_126_18 < arg_123_1.time_ and arg_123_1.time_ <= var_126_18 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, false)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_20 = arg_123_1:GetWordFromCfg(114282031)
				local var_126_21 = arg_123_1:FormatText(var_126_20.content)

				arg_123_1.text_.text = var_126_21

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_22 = 38
				local var_126_23 = utf8.len(var_126_21)
				local var_126_24 = var_126_22 <= 0 and var_126_19 or var_126_19 * (var_126_23 / var_126_22)

				if var_126_24 > 0 and var_126_19 < var_126_24 then
					arg_123_1.talkMaxDuration = var_126_24

					if var_126_24 + var_126_18 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_24 + var_126_18
					end
				end

				arg_123_1.text_.text = var_126_21
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)
				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_25 = math.max(var_126_19, arg_123_1.talkMaxDuration)

			if var_126_18 <= arg_123_1.time_ and arg_123_1.time_ < var_126_18 + var_126_25 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_18) / var_126_25

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_18 + var_126_25 and arg_123_1.time_ < var_126_18 + var_126_25 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play114282032 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 114282032
		arg_127_1.duration_ = 1.1

		local var_127_0 = {
			ja = 1.1,
			ko = 1.033,
			zh = 0.999999999999,
			en = 0.999999999999
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
				arg_127_0:Play114282033(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["10022"].transform
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 then
				arg_127_1.var_.moveOldPos10022 = var_130_0.localPosition
				var_130_0.localScale = Vector3.New(1, 1, 1)

				arg_127_1:CheckSpriteTmpPos("10022", 2)

				local var_130_2 = var_130_0.childCount

				for iter_130_0 = 0, var_130_2 - 1 do
					local var_130_3 = var_130_0:GetChild(iter_130_0)

					if var_130_3.name == "split_6" or not string.find(var_130_3.name, "split") then
						var_130_3.gameObject:SetActive(true)
					else
						var_130_3.gameObject:SetActive(false)
					end
				end
			end

			local var_130_4 = 0.001

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_4 then
				local var_130_5 = (arg_127_1.time_ - var_130_1) / var_130_4
				local var_130_6 = Vector3.New(-390, -350, -180)

				var_130_0.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos10022, var_130_6, var_130_5)
			end

			if arg_127_1.time_ >= var_130_1 + var_130_4 and arg_127_1.time_ < var_130_1 + var_130_4 + arg_130_0 then
				var_130_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_130_7 = arg_127_1.actors_["10022"]
			local var_130_8 = 0

			if var_130_8 < arg_127_1.time_ and arg_127_1.time_ <= var_130_8 + arg_130_0 and arg_127_1.var_.actorSpriteComps10022 == nil then
				arg_127_1.var_.actorSpriteComps10022 = var_130_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_130_9 = 0.034

			if var_130_8 <= arg_127_1.time_ and arg_127_1.time_ < var_130_8 + var_130_9 then
				local var_130_10 = (arg_127_1.time_ - var_130_8) / var_130_9

				if arg_127_1.var_.actorSpriteComps10022 then
					for iter_130_1, iter_130_2 in pairs(arg_127_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_130_2 then
							local var_130_11 = Mathf.Lerp(iter_130_2.color.r, 1, var_130_10)

							iter_130_2.color = Color.New(var_130_11, var_130_11, var_130_11)
						end
					end
				end
			end

			if arg_127_1.time_ >= var_130_8 + var_130_9 and arg_127_1.time_ < var_130_8 + var_130_9 + arg_130_0 and arg_127_1.var_.actorSpriteComps10022 then
				local var_130_12 = 1

				for iter_130_3, iter_130_4 in pairs(arg_127_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_130_4 then
						iter_130_4.color = Color.New(var_130_12, var_130_12, var_130_12)
					end
				end

				arg_127_1.var_.actorSpriteComps10022 = nil
			end

			local var_130_13 = arg_127_1.actors_["10022"]
			local var_130_14 = 0

			if var_130_14 < arg_127_1.time_ and arg_127_1.time_ <= var_130_14 + arg_130_0 then
				local var_130_15 = var_130_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_130_15 then
					arg_127_1.var_.alphaOldValue10022 = var_130_15.alpha
					arg_127_1.var_.characterEffect10022 = var_130_15
				end

				arg_127_1.var_.alphaOldValue10022 = 0
			end

			local var_130_16 = 0.5

			if var_130_14 <= arg_127_1.time_ and arg_127_1.time_ < var_130_14 + var_130_16 then
				local var_130_17 = (arg_127_1.time_ - var_130_14) / var_130_16
				local var_130_18 = Mathf.Lerp(arg_127_1.var_.alphaOldValue10022, 1, var_130_17)

				if arg_127_1.var_.characterEffect10022 then
					arg_127_1.var_.characterEffect10022.alpha = var_130_18
				end
			end

			if arg_127_1.time_ >= var_130_14 + var_130_16 and arg_127_1.time_ < var_130_14 + var_130_16 + arg_130_0 and arg_127_1.var_.characterEffect10022 then
				arg_127_1.var_.characterEffect10022.alpha = 1
			end

			local var_130_19 = 0
			local var_130_20 = 0.1

			if var_130_19 < arg_127_1.time_ and arg_127_1.time_ <= var_130_19 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_21 = arg_127_1:FormatText(StoryNameCfg[235].name)

				arg_127_1.leftNameTxt_.text = var_130_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_22 = arg_127_1:GetWordFromCfg(114282032)
				local var_130_23 = arg_127_1:FormatText(var_130_22.content)

				arg_127_1.text_.text = var_130_23

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_24 = 4
				local var_130_25 = utf8.len(var_130_23)
				local var_130_26 = var_130_24 <= 0 and var_130_20 or var_130_20 * (var_130_25 / var_130_24)

				if var_130_26 > 0 and var_130_20 < var_130_26 then
					arg_127_1.talkMaxDuration = var_130_26

					if var_130_26 + var_130_19 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_26 + var_130_19
					end
				end

				arg_127_1.text_.text = var_130_23
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114282", "114282032", "story_v_out_114282.awb") ~= 0 then
					local var_130_27 = manager.audio:GetVoiceLength("story_v_out_114282", "114282032", "story_v_out_114282.awb") / 1000

					if var_130_27 + var_130_19 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_27 + var_130_19
					end

					if var_130_22.prefab_name ~= "" and arg_127_1.actors_[var_130_22.prefab_name] ~= nil then
						local var_130_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_22.prefab_name].transform, "story_v_out_114282", "114282032", "story_v_out_114282.awb")

						arg_127_1:RecordAudio("114282032", var_130_28)
						arg_127_1:RecordAudio("114282032", var_130_28)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_114282", "114282032", "story_v_out_114282.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_114282", "114282032", "story_v_out_114282.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_29 = math.max(var_130_20, arg_127_1.talkMaxDuration)

			if var_130_19 <= arg_127_1.time_ and arg_127_1.time_ < var_130_19 + var_130_29 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_19) / var_130_29

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_19 + var_130_29 and arg_127_1.time_ < var_130_19 + var_130_29 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play114282033 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 114282033
		arg_131_1.duration_ = 3.3

		local var_131_0 = {
			ja = 2.366,
			ko = 1.6,
			zh = 3.3,
			en = 1.433
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
				arg_131_0:Play114282034(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["10017"].transform
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 then
				arg_131_1.var_.moveOldPos10017 = var_134_0.localPosition
				var_134_0.localScale = Vector3.New(1, 1, 1)

				arg_131_1:CheckSpriteTmpPos("10017", 4)
			end

			local var_134_2 = 0.001

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2
				local var_134_4 = Vector3.New(390, -350, -180)

				var_134_0.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos10017, var_134_4, var_134_3)
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 then
				var_134_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_134_5 = arg_131_1.actors_["10022"]
			local var_134_6 = 0

			if var_134_6 < arg_131_1.time_ and arg_131_1.time_ <= var_134_6 + arg_134_0 and arg_131_1.var_.actorSpriteComps10022 == nil then
				arg_131_1.var_.actorSpriteComps10022 = var_134_5:GetComponentsInChildren(typeof(Image), true)
			end

			local var_134_7 = 0.034

			if var_134_6 <= arg_131_1.time_ and arg_131_1.time_ < var_134_6 + var_134_7 then
				local var_134_8 = (arg_131_1.time_ - var_134_6) / var_134_7

				if arg_131_1.var_.actorSpriteComps10022 then
					for iter_134_0, iter_134_1 in pairs(arg_131_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_134_1 then
							local var_134_9 = Mathf.Lerp(iter_134_1.color.r, 0.5, var_134_8)

							iter_134_1.color = Color.New(var_134_9, var_134_9, var_134_9)
						end
					end
				end
			end

			if arg_131_1.time_ >= var_134_6 + var_134_7 and arg_131_1.time_ < var_134_6 + var_134_7 + arg_134_0 and arg_131_1.var_.actorSpriteComps10022 then
				local var_134_10 = 0.5

				for iter_134_2, iter_134_3 in pairs(arg_131_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_134_3 then
						iter_134_3.color = Color.New(var_134_10, var_134_10, var_134_10)
					end
				end

				arg_131_1.var_.actorSpriteComps10022 = nil
			end

			local var_134_11 = arg_131_1.actors_["10017"]
			local var_134_12 = 0

			if var_134_12 < arg_131_1.time_ and arg_131_1.time_ <= var_134_12 + arg_134_0 then
				local var_134_13 = var_134_11:GetComponent("Image")

				if var_134_13 then
					arg_131_1.var_.highlightMatValue10017 = var_134_13
				end
			end

			local var_134_14 = 0.034

			if var_134_12 <= arg_131_1.time_ and arg_131_1.time_ < var_134_12 + var_134_14 then
				local var_134_15 = (arg_131_1.time_ - var_134_12) / var_134_14

				if arg_131_1.var_.highlightMatValue10017 then
					local var_134_16 = Mathf.Lerp(0.5, 1, var_134_15)
					local var_134_17 = arg_131_1.var_.highlightMatValue10017
					local var_134_18 = var_134_17.color

					var_134_18.r = var_134_16
					var_134_18.g = var_134_16
					var_134_18.b = var_134_16
					var_134_17.color = var_134_18
				end
			end

			if arg_131_1.time_ >= var_134_12 + var_134_14 and arg_131_1.time_ < var_134_12 + var_134_14 + arg_134_0 and arg_131_1.var_.highlightMatValue10017 then
				local var_134_19 = 1

				var_134_11.transform:SetSiblingIndex(1)

				local var_134_20 = arg_131_1.var_.highlightMatValue10017
				local var_134_21 = var_134_20.color

				var_134_21.r = var_134_19
				var_134_21.g = var_134_19
				var_134_21.b = var_134_19
				var_134_20.color = var_134_21
			end

			local var_134_22 = arg_131_1.actors_["10017"]
			local var_134_23 = 0

			if var_134_23 < arg_131_1.time_ and arg_131_1.time_ <= var_134_23 + arg_134_0 then
				local var_134_24 = var_134_22:GetComponent("Image")

				if var_134_24 then
					arg_131_1.var_.alphaMatValue10017 = var_134_24
					arg_131_1.var_.alphaOldValue10017 = var_134_24.color.a
				end

				arg_131_1.var_.alphaOldValue10017 = 0
			end

			local var_134_25 = 0.5

			if var_134_23 <= arg_131_1.time_ and arg_131_1.time_ < var_134_23 + var_134_25 then
				local var_134_26 = (arg_131_1.time_ - var_134_23) / var_134_25
				local var_134_27 = Mathf.Lerp(arg_131_1.var_.alphaOldValue10017, 1, var_134_26)

				if arg_131_1.var_.alphaMatValue10017 then
					local var_134_28 = arg_131_1.var_.alphaMatValue10017.color

					var_134_28.a = var_134_27
					arg_131_1.var_.alphaMatValue10017.color = var_134_28
				end
			end

			if arg_131_1.time_ >= var_134_23 + var_134_25 and arg_131_1.time_ < var_134_23 + var_134_25 + arg_134_0 and arg_131_1.var_.alphaMatValue10017 then
				local var_134_29 = arg_131_1.var_.alphaMatValue10017
				local var_134_30 = var_134_29.color

				var_134_30.a = 1
				var_134_29.color = var_134_30
			end

			local var_134_31 = 0
			local var_134_32 = 0.125

			if var_134_31 < arg_131_1.time_ and arg_131_1.time_ <= var_134_31 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_33 = arg_131_1:FormatText(StoryNameCfg[255].name)

				arg_131_1.leftNameTxt_.text = var_134_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_34 = arg_131_1:GetWordFromCfg(114282033)
				local var_134_35 = arg_131_1:FormatText(var_134_34.content)

				arg_131_1.text_.text = var_134_35

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_36 = 5
				local var_134_37 = utf8.len(var_134_35)
				local var_134_38 = var_134_36 <= 0 and var_134_32 or var_134_32 * (var_134_37 / var_134_36)

				if var_134_38 > 0 and var_134_32 < var_134_38 then
					arg_131_1.talkMaxDuration = var_134_38

					if var_134_38 + var_134_31 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_38 + var_134_31
					end
				end

				arg_131_1.text_.text = var_134_35
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114282", "114282033", "story_v_out_114282.awb") ~= 0 then
					local var_134_39 = manager.audio:GetVoiceLength("story_v_out_114282", "114282033", "story_v_out_114282.awb") / 1000

					if var_134_39 + var_134_31 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_39 + var_134_31
					end

					if var_134_34.prefab_name ~= "" and arg_131_1.actors_[var_134_34.prefab_name] ~= nil then
						local var_134_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_34.prefab_name].transform, "story_v_out_114282", "114282033", "story_v_out_114282.awb")

						arg_131_1:RecordAudio("114282033", var_134_40)
						arg_131_1:RecordAudio("114282033", var_134_40)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_114282", "114282033", "story_v_out_114282.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_114282", "114282033", "story_v_out_114282.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_41 = math.max(var_134_32, arg_131_1.talkMaxDuration)

			if var_134_31 <= arg_131_1.time_ and arg_131_1.time_ < var_134_31 + var_134_41 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_31) / var_134_41

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_31 + var_134_41 and arg_131_1.time_ < var_134_31 + var_134_41 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play114282034 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 114282034
		arg_135_1.duration_ = 10.633

		local var_135_0 = {
			ja = 10.633,
			ko = 8.033,
			zh = 7.4,
			en = 7.5
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
				arg_135_0:Play114282035(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["10022"].transform
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 then
				arg_135_1.var_.moveOldPos10022 = var_138_0.localPosition
				var_138_0.localScale = Vector3.New(1, 1, 1)

				arg_135_1:CheckSpriteTmpPos("10022", 7)

				local var_138_2 = var_138_0.childCount

				for iter_138_0 = 0, var_138_2 - 1 do
					local var_138_3 = var_138_0:GetChild(iter_138_0)

					if var_138_3.name == "split_6" or not string.find(var_138_3.name, "split") then
						var_138_3.gameObject:SetActive(true)
					else
						var_138_3.gameObject:SetActive(false)
					end
				end
			end

			local var_138_4 = 0.001

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_4 then
				local var_138_5 = (arg_135_1.time_ - var_138_1) / var_138_4
				local var_138_6 = Vector3.New(0, -2000, -180)

				var_138_0.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos10022, var_138_6, var_138_5)
			end

			if arg_135_1.time_ >= var_138_1 + var_138_4 and arg_135_1.time_ < var_138_1 + var_138_4 + arg_138_0 then
				var_138_0.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_138_7 = arg_135_1.actors_["10017"].transform
			local var_138_8 = 0

			if var_138_8 < arg_135_1.time_ and arg_135_1.time_ <= var_138_8 + arg_138_0 then
				arg_135_1.var_.moveOldPos10017 = var_138_7.localPosition
				var_138_7.localScale = Vector3.New(1, 1, 1)

				arg_135_1:CheckSpriteTmpPos("10017", 7)
			end

			local var_138_9 = 0.001

			if var_138_8 <= arg_135_1.time_ and arg_135_1.time_ < var_138_8 + var_138_9 then
				local var_138_10 = (arg_135_1.time_ - var_138_8) / var_138_9
				local var_138_11 = Vector3.New(0, -2000, 500)

				var_138_7.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos10017, var_138_11, var_138_10)
			end

			if arg_135_1.time_ >= var_138_8 + var_138_9 and arg_135_1.time_ < var_138_8 + var_138_9 + arg_138_0 then
				var_138_7.localPosition = Vector3.New(0, -2000, 500)
			end

			local var_138_12 = 0
			local var_138_13 = 0.7

			if var_138_12 < arg_135_1.time_ and arg_135_1.time_ <= var_138_12 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_14 = arg_135_1:FormatText(StoryNameCfg[208].name)

				arg_135_1.leftNameTxt_.text = var_138_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, true)
				arg_135_1.iconController_:SetSelectedState("hero")

				arg_135_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10015")

				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_15 = arg_135_1:GetWordFromCfg(114282034)
				local var_138_16 = arg_135_1:FormatText(var_138_15.content)

				arg_135_1.text_.text = var_138_16

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_17 = 28
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

				if manager.audio:GetVoiceLength("story_v_out_114282", "114282034", "story_v_out_114282.awb") ~= 0 then
					local var_138_20 = manager.audio:GetVoiceLength("story_v_out_114282", "114282034", "story_v_out_114282.awb") / 1000

					if var_138_20 + var_138_12 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_20 + var_138_12
					end

					if var_138_15.prefab_name ~= "" and arg_135_1.actors_[var_138_15.prefab_name] ~= nil then
						local var_138_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_15.prefab_name].transform, "story_v_out_114282", "114282034", "story_v_out_114282.awb")

						arg_135_1:RecordAudio("114282034", var_138_21)
						arg_135_1:RecordAudio("114282034", var_138_21)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_114282", "114282034", "story_v_out_114282.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_114282", "114282034", "story_v_out_114282.awb")
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
	Play114282035 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 114282035
		arg_139_1.duration_ = 5

		SetActive(arg_139_1.tipsGo_, false)

		function arg_139_1.onSingleLineFinish_()
			arg_139_1.onSingleLineUpdate_ = nil
			arg_139_1.onSingleLineFinish_ = nil
			arg_139_1.state_ = "waiting"
		end

		function arg_139_1.playNext_(arg_141_0)
			if arg_141_0 == 1 then
				arg_139_0:Play114282036(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = 0
			local var_142_1 = 1.45

			if var_142_0 < arg_139_1.time_ and arg_139_1.time_ <= var_142_0 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, false)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_2 = arg_139_1:GetWordFromCfg(114282035)
				local var_142_3 = arg_139_1:FormatText(var_142_2.content)

				arg_139_1.text_.text = var_142_3

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_4 = 58
				local var_142_5 = utf8.len(var_142_3)
				local var_142_6 = var_142_4 <= 0 and var_142_1 or var_142_1 * (var_142_5 / var_142_4)

				if var_142_6 > 0 and var_142_1 < var_142_6 then
					arg_139_1.talkMaxDuration = var_142_6

					if var_142_6 + var_142_0 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_6 + var_142_0
					end
				end

				arg_139_1.text_.text = var_142_3
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)
				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_7 = math.max(var_142_1, arg_139_1.talkMaxDuration)

			if var_142_0 <= arg_139_1.time_ and arg_139_1.time_ < var_142_0 + var_142_7 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_0) / var_142_7

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_0 + var_142_7 and arg_139_1.time_ < var_142_0 + var_142_7 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play114282036 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 114282036
		arg_143_1.duration_ = 5

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play114282037(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = 0
			local var_146_1 = 1.4

			if var_146_0 < arg_143_1.time_ and arg_143_1.time_ <= var_146_0 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, false)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_2 = arg_143_1:GetWordFromCfg(114282036)
				local var_146_3 = arg_143_1:FormatText(var_146_2.content)

				arg_143_1.text_.text = var_146_3

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_4 = 56
				local var_146_5 = utf8.len(var_146_3)
				local var_146_6 = var_146_4 <= 0 and var_146_1 or var_146_1 * (var_146_5 / var_146_4)

				if var_146_6 > 0 and var_146_1 < var_146_6 then
					arg_143_1.talkMaxDuration = var_146_6

					if var_146_6 + var_146_0 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_6 + var_146_0
					end
				end

				arg_143_1.text_.text = var_146_3
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)
				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_7 = math.max(var_146_1, arg_143_1.talkMaxDuration)

			if var_146_0 <= arg_143_1.time_ and arg_143_1.time_ < var_146_0 + var_146_7 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_0) / var_146_7

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_0 + var_146_7 and arg_143_1.time_ < var_146_0 + var_146_7 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play114282037 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 114282037
		arg_147_1.duration_ = 6.033

		local var_147_0 = {
			ja = 6.033,
			ko = 4.7,
			zh = 4.833,
			en = 3.533
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
				arg_147_0:Play114282038(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["10022"]
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 then
				local var_150_2 = var_150_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_150_2 then
					arg_147_1.var_.alphaOldValue10022 = var_150_2.alpha
					arg_147_1.var_.characterEffect10022 = var_150_2
				end

				arg_147_1.var_.alphaOldValue10022 = 0
			end

			local var_150_3 = 0.5

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_3 then
				local var_150_4 = (arg_147_1.time_ - var_150_1) / var_150_3
				local var_150_5 = Mathf.Lerp(arg_147_1.var_.alphaOldValue10022, 1, var_150_4)

				if arg_147_1.var_.characterEffect10022 then
					arg_147_1.var_.characterEffect10022.alpha = var_150_5
				end
			end

			if arg_147_1.time_ >= var_150_1 + var_150_3 and arg_147_1.time_ < var_150_1 + var_150_3 + arg_150_0 and arg_147_1.var_.characterEffect10022 then
				arg_147_1.var_.characterEffect10022.alpha = 1
			end

			local var_150_6 = arg_147_1.actors_["10022"].transform
			local var_150_7 = 0

			if var_150_7 < arg_147_1.time_ and arg_147_1.time_ <= var_150_7 + arg_150_0 then
				arg_147_1.var_.moveOldPos10022 = var_150_6.localPosition
				var_150_6.localScale = Vector3.New(1, 1, 1)

				arg_147_1:CheckSpriteTmpPos("10022", 3)

				local var_150_8 = var_150_6.childCount

				for iter_150_0 = 0, var_150_8 - 1 do
					local var_150_9 = var_150_6:GetChild(iter_150_0)

					if var_150_9.name == "split_2" or not string.find(var_150_9.name, "split") then
						var_150_9.gameObject:SetActive(true)
					else
						var_150_9.gameObject:SetActive(false)
					end
				end
			end

			local var_150_10 = 0.001

			if var_150_7 <= arg_147_1.time_ and arg_147_1.time_ < var_150_7 + var_150_10 then
				local var_150_11 = (arg_147_1.time_ - var_150_7) / var_150_10
				local var_150_12 = Vector3.New(0, -350, -180)

				var_150_6.localPosition = Vector3.Lerp(arg_147_1.var_.moveOldPos10022, var_150_12, var_150_11)
			end

			if arg_147_1.time_ >= var_150_7 + var_150_10 and arg_147_1.time_ < var_150_7 + var_150_10 + arg_150_0 then
				var_150_6.localPosition = Vector3.New(0, -350, -180)
			end

			local var_150_13 = arg_147_1.actors_["10022"]
			local var_150_14 = 0

			if var_150_14 < arg_147_1.time_ and arg_147_1.time_ <= var_150_14 + arg_150_0 and arg_147_1.var_.actorSpriteComps10022 == nil then
				arg_147_1.var_.actorSpriteComps10022 = var_150_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_150_15 = 0.034

			if var_150_14 <= arg_147_1.time_ and arg_147_1.time_ < var_150_14 + var_150_15 then
				local var_150_16 = (arg_147_1.time_ - var_150_14) / var_150_15

				if arg_147_1.var_.actorSpriteComps10022 then
					for iter_150_1, iter_150_2 in pairs(arg_147_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_150_2 then
							local var_150_17 = Mathf.Lerp(iter_150_2.color.r, 1, var_150_16)

							iter_150_2.color = Color.New(var_150_17, var_150_17, var_150_17)
						end
					end
				end
			end

			if arg_147_1.time_ >= var_150_14 + var_150_15 and arg_147_1.time_ < var_150_14 + var_150_15 + arg_150_0 and arg_147_1.var_.actorSpriteComps10022 then
				local var_150_18 = 1

				for iter_150_3, iter_150_4 in pairs(arg_147_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_150_4 then
						iter_150_4.color = Color.New(var_150_18, var_150_18, var_150_18)
					end
				end

				arg_147_1.var_.actorSpriteComps10022 = nil
			end

			local var_150_19 = 0
			local var_150_20 = 0.425

			if var_150_19 < arg_147_1.time_ and arg_147_1.time_ <= var_150_19 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_21 = arg_147_1:FormatText(StoryNameCfg[235].name)

				arg_147_1.leftNameTxt_.text = var_150_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_22 = arg_147_1:GetWordFromCfg(114282037)
				local var_150_23 = arg_147_1:FormatText(var_150_22.content)

				arg_147_1.text_.text = var_150_23

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_24 = 17
				local var_150_25 = utf8.len(var_150_23)
				local var_150_26 = var_150_24 <= 0 and var_150_20 or var_150_20 * (var_150_25 / var_150_24)

				if var_150_26 > 0 and var_150_20 < var_150_26 then
					arg_147_1.talkMaxDuration = var_150_26

					if var_150_26 + var_150_19 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_26 + var_150_19
					end
				end

				arg_147_1.text_.text = var_150_23
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114282", "114282037", "story_v_out_114282.awb") ~= 0 then
					local var_150_27 = manager.audio:GetVoiceLength("story_v_out_114282", "114282037", "story_v_out_114282.awb") / 1000

					if var_150_27 + var_150_19 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_27 + var_150_19
					end

					if var_150_22.prefab_name ~= "" and arg_147_1.actors_[var_150_22.prefab_name] ~= nil then
						local var_150_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_22.prefab_name].transform, "story_v_out_114282", "114282037", "story_v_out_114282.awb")

						arg_147_1:RecordAudio("114282037", var_150_28)
						arg_147_1:RecordAudio("114282037", var_150_28)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_114282", "114282037", "story_v_out_114282.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_114282", "114282037", "story_v_out_114282.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_29 = math.max(var_150_20, arg_147_1.talkMaxDuration)

			if var_150_19 <= arg_147_1.time_ and arg_147_1.time_ < var_150_19 + var_150_29 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_19) / var_150_29

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_19 + var_150_29 and arg_147_1.time_ < var_150_19 + var_150_29 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play114282038 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 114282038
		arg_151_1.duration_ = 5

		SetActive(arg_151_1.tipsGo_, false)

		function arg_151_1.onSingleLineFinish_()
			arg_151_1.onSingleLineUpdate_ = nil
			arg_151_1.onSingleLineFinish_ = nil
			arg_151_1.state_ = "waiting"
		end

		function arg_151_1.playNext_(arg_153_0)
			if arg_153_0 == 1 then
				arg_151_0:Play114282039(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["10022"]
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 then
				local var_154_2 = var_154_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_154_2 then
					arg_151_1.var_.alphaOldValue10022 = var_154_2.alpha
					arg_151_1.var_.characterEffect10022 = var_154_2
				end

				arg_151_1.var_.alphaOldValue10022 = 1
			end

			local var_154_3 = 0.5

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_3 then
				local var_154_4 = (arg_151_1.time_ - var_154_1) / var_154_3
				local var_154_5 = Mathf.Lerp(arg_151_1.var_.alphaOldValue10022, 0, var_154_4)

				if arg_151_1.var_.characterEffect10022 then
					arg_151_1.var_.characterEffect10022.alpha = var_154_5
				end
			end

			if arg_151_1.time_ >= var_154_1 + var_154_3 and arg_151_1.time_ < var_154_1 + var_154_3 + arg_154_0 and arg_151_1.var_.characterEffect10022 then
				arg_151_1.var_.characterEffect10022.alpha = 0
			end

			local var_154_6 = 0
			local var_154_7 = 1.575

			if var_154_6 < arg_151_1.time_ and arg_151_1.time_ <= var_154_6 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, false)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_8 = arg_151_1:GetWordFromCfg(114282038)
				local var_154_9 = arg_151_1:FormatText(var_154_8.content)

				arg_151_1.text_.text = var_154_9

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_10 = 62
				local var_154_11 = utf8.len(var_154_9)
				local var_154_12 = var_154_10 <= 0 and var_154_7 or var_154_7 * (var_154_11 / var_154_10)

				if var_154_12 > 0 and var_154_7 < var_154_12 then
					arg_151_1.talkMaxDuration = var_154_12

					if var_154_12 + var_154_6 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_12 + var_154_6
					end
				end

				arg_151_1.text_.text = var_154_9
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)
				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_13 = math.max(var_154_7, arg_151_1.talkMaxDuration)

			if var_154_6 <= arg_151_1.time_ and arg_151_1.time_ < var_154_6 + var_154_13 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_6) / var_154_13

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_6 + var_154_13 and arg_151_1.time_ < var_154_6 + var_154_13 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play114282039 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 114282039
		arg_155_1.duration_ = 14.466

		local var_155_0 = {
			ja = 7.766,
			ko = 9.733,
			zh = 11.5,
			en = 14.466
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
				arg_155_0:Play114282040(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["10017"]
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 then
				local var_158_2 = var_158_0:GetComponent("Image")

				if var_158_2 then
					arg_155_1.var_.alphaMatValue10017 = var_158_2
					arg_155_1.var_.alphaOldValue10017 = var_158_2.color.a
				end

				arg_155_1.var_.alphaOldValue10017 = 0
			end

			local var_158_3 = 0.5

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_3 then
				local var_158_4 = (arg_155_1.time_ - var_158_1) / var_158_3
				local var_158_5 = Mathf.Lerp(arg_155_1.var_.alphaOldValue10017, 1, var_158_4)

				if arg_155_1.var_.alphaMatValue10017 then
					local var_158_6 = arg_155_1.var_.alphaMatValue10017.color

					var_158_6.a = var_158_5
					arg_155_1.var_.alphaMatValue10017.color = var_158_6
				end
			end

			if arg_155_1.time_ >= var_158_1 + var_158_3 and arg_155_1.time_ < var_158_1 + var_158_3 + arg_158_0 and arg_155_1.var_.alphaMatValue10017 then
				local var_158_7 = arg_155_1.var_.alphaMatValue10017
				local var_158_8 = var_158_7.color

				var_158_8.a = 1
				var_158_7.color = var_158_8
			end

			local var_158_9 = arg_155_1.actors_["10017"].transform
			local var_158_10 = 0

			if var_158_10 < arg_155_1.time_ and arg_155_1.time_ <= var_158_10 + arg_158_0 then
				arg_155_1.var_.moveOldPos10017 = var_158_9.localPosition
				var_158_9.localScale = Vector3.New(1, 1, 1)

				arg_155_1:CheckSpriteTmpPos("10017", 2)
			end

			local var_158_11 = 0.001

			if var_158_10 <= arg_155_1.time_ and arg_155_1.time_ < var_158_10 + var_158_11 then
				local var_158_12 = (arg_155_1.time_ - var_158_10) / var_158_11
				local var_158_13 = Vector3.New(-390, -350, -180)

				var_158_9.localPosition = Vector3.Lerp(arg_155_1.var_.moveOldPos10017, var_158_13, var_158_12)
			end

			if arg_155_1.time_ >= var_158_10 + var_158_11 and arg_155_1.time_ < var_158_10 + var_158_11 + arg_158_0 then
				var_158_9.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_158_14 = arg_155_1.actors_["10017"]
			local var_158_15 = 0

			if var_158_15 < arg_155_1.time_ and arg_155_1.time_ <= var_158_15 + arg_158_0 then
				local var_158_16 = var_158_14:GetComponent("Image")

				if var_158_16 then
					arg_155_1.var_.highlightMatValue10017 = var_158_16
				end
			end

			local var_158_17 = 0.034

			if var_158_15 <= arg_155_1.time_ and arg_155_1.time_ < var_158_15 + var_158_17 then
				local var_158_18 = (arg_155_1.time_ - var_158_15) / var_158_17

				if arg_155_1.var_.highlightMatValue10017 then
					local var_158_19 = Mathf.Lerp(0.5, 1, var_158_18)
					local var_158_20 = arg_155_1.var_.highlightMatValue10017
					local var_158_21 = var_158_20.color

					var_158_21.r = var_158_19
					var_158_21.g = var_158_19
					var_158_21.b = var_158_19
					var_158_20.color = var_158_21
				end
			end

			if arg_155_1.time_ >= var_158_15 + var_158_17 and arg_155_1.time_ < var_158_15 + var_158_17 + arg_158_0 and arg_155_1.var_.highlightMatValue10017 then
				local var_158_22 = 1

				var_158_14.transform:SetSiblingIndex(1)

				local var_158_23 = arg_155_1.var_.highlightMatValue10017
				local var_158_24 = var_158_23.color

				var_158_24.r = var_158_22
				var_158_24.g = var_158_22
				var_158_24.b = var_158_22
				var_158_23.color = var_158_24
			end

			local var_158_25 = 0
			local var_158_26 = 1.125

			if var_158_25 < arg_155_1.time_ and arg_155_1.time_ <= var_158_25 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_27 = arg_155_1:FormatText(StoryNameCfg[255].name)

				arg_155_1.leftNameTxt_.text = var_158_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_28 = arg_155_1:GetWordFromCfg(114282039)
				local var_158_29 = arg_155_1:FormatText(var_158_28.content)

				arg_155_1.text_.text = var_158_29

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_30 = 44
				local var_158_31 = utf8.len(var_158_29)
				local var_158_32 = var_158_30 <= 0 and var_158_26 or var_158_26 * (var_158_31 / var_158_30)

				if var_158_32 > 0 and var_158_26 < var_158_32 then
					arg_155_1.talkMaxDuration = var_158_32

					if var_158_32 + var_158_25 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_32 + var_158_25
					end
				end

				arg_155_1.text_.text = var_158_29
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114282", "114282039", "story_v_out_114282.awb") ~= 0 then
					local var_158_33 = manager.audio:GetVoiceLength("story_v_out_114282", "114282039", "story_v_out_114282.awb") / 1000

					if var_158_33 + var_158_25 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_33 + var_158_25
					end

					if var_158_28.prefab_name ~= "" and arg_155_1.actors_[var_158_28.prefab_name] ~= nil then
						local var_158_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_28.prefab_name].transform, "story_v_out_114282", "114282039", "story_v_out_114282.awb")

						arg_155_1:RecordAudio("114282039", var_158_34)
						arg_155_1:RecordAudio("114282039", var_158_34)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_114282", "114282039", "story_v_out_114282.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_114282", "114282039", "story_v_out_114282.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_35 = math.max(var_158_26, arg_155_1.talkMaxDuration)

			if var_158_25 <= arg_155_1.time_ and arg_155_1.time_ < var_158_25 + var_158_35 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_25) / var_158_35

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_25 + var_158_35 and arg_155_1.time_ < var_158_25 + var_158_35 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play114282040 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 114282040
		arg_159_1.duration_ = 5

		SetActive(arg_159_1.tipsGo_, false)

		function arg_159_1.onSingleLineFinish_()
			arg_159_1.onSingleLineUpdate_ = nil
			arg_159_1.onSingleLineFinish_ = nil
			arg_159_1.state_ = "waiting"
		end

		function arg_159_1.playNext_(arg_161_0)
			if arg_161_0 == 1 then
				arg_159_0:Play114282041(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = arg_159_1.actors_["10017"]
			local var_162_1 = 0

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 then
				local var_162_2 = var_162_0:GetComponent("Image")

				if var_162_2 then
					arg_159_1.var_.highlightMatValue10017 = var_162_2
				end
			end

			local var_162_3 = 0.034

			if var_162_1 <= arg_159_1.time_ and arg_159_1.time_ < var_162_1 + var_162_3 then
				local var_162_4 = (arg_159_1.time_ - var_162_1) / var_162_3

				if arg_159_1.var_.highlightMatValue10017 then
					local var_162_5 = Mathf.Lerp(1, 0.5, var_162_4)
					local var_162_6 = arg_159_1.var_.highlightMatValue10017
					local var_162_7 = var_162_6.color

					var_162_7.r = var_162_5
					var_162_7.g = var_162_5
					var_162_7.b = var_162_5
					var_162_6.color = var_162_7
				end
			end

			if arg_159_1.time_ >= var_162_1 + var_162_3 and arg_159_1.time_ < var_162_1 + var_162_3 + arg_162_0 and arg_159_1.var_.highlightMatValue10017 then
				local var_162_8 = 0.5
				local var_162_9 = arg_159_1.var_.highlightMatValue10017
				local var_162_10 = var_162_9.color

				var_162_10.r = var_162_8
				var_162_10.g = var_162_8
				var_162_10.b = var_162_8
				var_162_9.color = var_162_10
			end

			local var_162_11 = 0
			local var_162_12 = 1.05

			if var_162_11 < arg_159_1.time_ and arg_159_1.time_ <= var_162_11 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, false)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_13 = arg_159_1:GetWordFromCfg(114282040)
				local var_162_14 = arg_159_1:FormatText(var_162_13.content)

				arg_159_1.text_.text = var_162_14

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_15 = 42
				local var_162_16 = utf8.len(var_162_14)
				local var_162_17 = var_162_15 <= 0 and var_162_12 or var_162_12 * (var_162_16 / var_162_15)

				if var_162_17 > 0 and var_162_12 < var_162_17 then
					arg_159_1.talkMaxDuration = var_162_17

					if var_162_17 + var_162_11 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_17 + var_162_11
					end
				end

				arg_159_1.text_.text = var_162_14
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)
				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_18 = math.max(var_162_12, arg_159_1.talkMaxDuration)

			if var_162_11 <= arg_159_1.time_ and arg_159_1.time_ < var_162_11 + var_162_18 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_11) / var_162_18

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_11 + var_162_18 and arg_159_1.time_ < var_162_11 + var_162_18 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play114282041 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 114282041
		arg_163_1.duration_ = 10.733

		local var_163_0 = {
			ja = 10.733,
			ko = 5.366,
			zh = 6.166,
			en = 5.133
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
				arg_163_0:Play114282042(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = "10015"

			if arg_163_1.actors_[var_166_0] == nil then
				local var_166_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_166_0), arg_163_1.canvasGo_.transform)

				var_166_1.transform:SetSiblingIndex(1)

				var_166_1.name = var_166_0
				var_166_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_163_1.actors_[var_166_0] = var_166_1
			end

			local var_166_2 = arg_163_1.actors_["10015"]
			local var_166_3 = 0

			if var_166_3 < arg_163_1.time_ and arg_163_1.time_ <= var_166_3 + arg_166_0 then
				local var_166_4 = var_166_2:GetComponentInChildren(typeof(CanvasGroup))

				if var_166_4 then
					arg_163_1.var_.alphaOldValue10015 = var_166_4.alpha
					arg_163_1.var_.characterEffect10015 = var_166_4
				end

				arg_163_1.var_.alphaOldValue10015 = 0
			end

			local var_166_5 = 0.5

			if var_166_3 <= arg_163_1.time_ and arg_163_1.time_ < var_166_3 + var_166_5 then
				local var_166_6 = (arg_163_1.time_ - var_166_3) / var_166_5
				local var_166_7 = Mathf.Lerp(arg_163_1.var_.alphaOldValue10015, 1, var_166_6)

				if arg_163_1.var_.characterEffect10015 then
					arg_163_1.var_.characterEffect10015.alpha = var_166_7
				end
			end

			if arg_163_1.time_ >= var_166_3 + var_166_5 and arg_163_1.time_ < var_166_3 + var_166_5 + arg_166_0 and arg_163_1.var_.characterEffect10015 then
				arg_163_1.var_.characterEffect10015.alpha = 1
			end

			local var_166_8 = arg_163_1.actors_["10015"].transform
			local var_166_9 = 0

			if var_166_9 < arg_163_1.time_ and arg_163_1.time_ <= var_166_9 + arg_166_0 then
				arg_163_1.var_.moveOldPos10015 = var_166_8.localPosition
				var_166_8.localScale = Vector3.New(1, 1, 1)

				arg_163_1:CheckSpriteTmpPos("10015", 4)

				local var_166_10 = var_166_8.childCount

				for iter_166_0 = 0, var_166_10 - 1 do
					local var_166_11 = var_166_8:GetChild(iter_166_0)

					if var_166_11.name == "split_1" or not string.find(var_166_11.name, "split") then
						var_166_11.gameObject:SetActive(true)
					else
						var_166_11.gameObject:SetActive(false)
					end
				end
			end

			local var_166_12 = 0.001

			if var_166_9 <= arg_163_1.time_ and arg_163_1.time_ < var_166_9 + var_166_12 then
				local var_166_13 = (arg_163_1.time_ - var_166_9) / var_166_12
				local var_166_14 = Vector3.New(390, -350, -180)

				var_166_8.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos10015, var_166_14, var_166_13)
			end

			if arg_163_1.time_ >= var_166_9 + var_166_12 and arg_163_1.time_ < var_166_9 + var_166_12 + arg_166_0 then
				var_166_8.localPosition = Vector3.New(390, -350, -180)
			end

			local var_166_15 = arg_163_1.actors_["10015"]
			local var_166_16 = 0

			if var_166_16 < arg_163_1.time_ and arg_163_1.time_ <= var_166_16 + arg_166_0 and arg_163_1.var_.actorSpriteComps10015 == nil then
				arg_163_1.var_.actorSpriteComps10015 = var_166_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_166_17 = 0.034

			if var_166_16 <= arg_163_1.time_ and arg_163_1.time_ < var_166_16 + var_166_17 then
				local var_166_18 = (arg_163_1.time_ - var_166_16) / var_166_17

				if arg_163_1.var_.actorSpriteComps10015 then
					for iter_166_1, iter_166_2 in pairs(arg_163_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_166_2 then
							local var_166_19 = Mathf.Lerp(iter_166_2.color.r, 1, var_166_18)

							iter_166_2.color = Color.New(var_166_19, var_166_19, var_166_19)
						end
					end
				end
			end

			if arg_163_1.time_ >= var_166_16 + var_166_17 and arg_163_1.time_ < var_166_16 + var_166_17 + arg_166_0 and arg_163_1.var_.actorSpriteComps10015 then
				local var_166_20 = 1

				for iter_166_3, iter_166_4 in pairs(arg_163_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_166_4 then
						iter_166_4.color = Color.New(var_166_20, var_166_20, var_166_20)
					end
				end

				arg_163_1.var_.actorSpriteComps10015 = nil
			end

			local var_166_21 = 0
			local var_166_22 = 0.4

			if var_166_21 < arg_163_1.time_ and arg_163_1.time_ <= var_166_21 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_23 = arg_163_1:FormatText(StoryNameCfg[208].name)

				arg_163_1.leftNameTxt_.text = var_166_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_24 = arg_163_1:GetWordFromCfg(114282041)
				local var_166_25 = arg_163_1:FormatText(var_166_24.content)

				arg_163_1.text_.text = var_166_25

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_26 = 16
				local var_166_27 = utf8.len(var_166_25)
				local var_166_28 = var_166_26 <= 0 and var_166_22 or var_166_22 * (var_166_27 / var_166_26)

				if var_166_28 > 0 and var_166_22 < var_166_28 then
					arg_163_1.talkMaxDuration = var_166_28

					if var_166_28 + var_166_21 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_28 + var_166_21
					end
				end

				arg_163_1.text_.text = var_166_25
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114282", "114282041", "story_v_out_114282.awb") ~= 0 then
					local var_166_29 = manager.audio:GetVoiceLength("story_v_out_114282", "114282041", "story_v_out_114282.awb") / 1000

					if var_166_29 + var_166_21 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_29 + var_166_21
					end

					if var_166_24.prefab_name ~= "" and arg_163_1.actors_[var_166_24.prefab_name] ~= nil then
						local var_166_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_24.prefab_name].transform, "story_v_out_114282", "114282041", "story_v_out_114282.awb")

						arg_163_1:RecordAudio("114282041", var_166_30)
						arg_163_1:RecordAudio("114282041", var_166_30)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_114282", "114282041", "story_v_out_114282.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_114282", "114282041", "story_v_out_114282.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_31 = math.max(var_166_22, arg_163_1.talkMaxDuration)

			if var_166_21 <= arg_163_1.time_ and arg_163_1.time_ < var_166_21 + var_166_31 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_21) / var_166_31

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_21 + var_166_31 and arg_163_1.time_ < var_166_21 + var_166_31 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play114282042 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 114282042
		arg_167_1.duration_ = 2.166

		local var_167_0 = {
			ja = 2.166,
			ko = 1.033,
			zh = 1.3,
			en = 1.3
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
				arg_167_0:Play114282043(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["10017"]
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 then
				local var_170_2 = var_170_0:GetComponent("Image")

				if var_170_2 then
					arg_167_1.var_.highlightMatValue10017 = var_170_2
				end
			end

			local var_170_3 = 0.034

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_3 then
				local var_170_4 = (arg_167_1.time_ - var_170_1) / var_170_3

				if arg_167_1.var_.highlightMatValue10017 then
					local var_170_5 = Mathf.Lerp(0.5, 1, var_170_4)
					local var_170_6 = arg_167_1.var_.highlightMatValue10017
					local var_170_7 = var_170_6.color

					var_170_7.r = var_170_5
					var_170_7.g = var_170_5
					var_170_7.b = var_170_5
					var_170_6.color = var_170_7
				end
			end

			if arg_167_1.time_ >= var_170_1 + var_170_3 and arg_167_1.time_ < var_170_1 + var_170_3 + arg_170_0 and arg_167_1.var_.highlightMatValue10017 then
				local var_170_8 = 1

				var_170_0.transform:SetSiblingIndex(1)

				local var_170_9 = arg_167_1.var_.highlightMatValue10017
				local var_170_10 = var_170_9.color

				var_170_10.r = var_170_8
				var_170_10.g = var_170_8
				var_170_10.b = var_170_8
				var_170_9.color = var_170_10
			end

			local var_170_11 = arg_167_1.actors_["10015"]
			local var_170_12 = 0

			if var_170_12 < arg_167_1.time_ and arg_167_1.time_ <= var_170_12 + arg_170_0 and arg_167_1.var_.actorSpriteComps10015 == nil then
				arg_167_1.var_.actorSpriteComps10015 = var_170_11:GetComponentsInChildren(typeof(Image), true)
			end

			local var_170_13 = 0.034

			if var_170_12 <= arg_167_1.time_ and arg_167_1.time_ < var_170_12 + var_170_13 then
				local var_170_14 = (arg_167_1.time_ - var_170_12) / var_170_13

				if arg_167_1.var_.actorSpriteComps10015 then
					for iter_170_0, iter_170_1 in pairs(arg_167_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_170_1 then
							local var_170_15 = Mathf.Lerp(iter_170_1.color.r, 0.5, var_170_14)

							iter_170_1.color = Color.New(var_170_15, var_170_15, var_170_15)
						end
					end
				end
			end

			if arg_167_1.time_ >= var_170_12 + var_170_13 and arg_167_1.time_ < var_170_12 + var_170_13 + arg_170_0 and arg_167_1.var_.actorSpriteComps10015 then
				local var_170_16 = 0.5

				for iter_170_2, iter_170_3 in pairs(arg_167_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_170_3 then
						iter_170_3.color = Color.New(var_170_16, var_170_16, var_170_16)
					end
				end

				arg_167_1.var_.actorSpriteComps10015 = nil
			end

			local var_170_17 = 0
			local var_170_18 = 0.075

			if var_170_17 < arg_167_1.time_ and arg_167_1.time_ <= var_170_17 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_19 = arg_167_1:FormatText(StoryNameCfg[255].name)

				arg_167_1.leftNameTxt_.text = var_170_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_20 = arg_167_1:GetWordFromCfg(114282042)
				local var_170_21 = arg_167_1:FormatText(var_170_20.content)

				arg_167_1.text_.text = var_170_21

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_22 = 3
				local var_170_23 = utf8.len(var_170_21)
				local var_170_24 = var_170_22 <= 0 and var_170_18 or var_170_18 * (var_170_23 / var_170_22)

				if var_170_24 > 0 and var_170_18 < var_170_24 then
					arg_167_1.talkMaxDuration = var_170_24

					if var_170_24 + var_170_17 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_24 + var_170_17
					end
				end

				arg_167_1.text_.text = var_170_21
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114282", "114282042", "story_v_out_114282.awb") ~= 0 then
					local var_170_25 = manager.audio:GetVoiceLength("story_v_out_114282", "114282042", "story_v_out_114282.awb") / 1000

					if var_170_25 + var_170_17 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_25 + var_170_17
					end

					if var_170_20.prefab_name ~= "" and arg_167_1.actors_[var_170_20.prefab_name] ~= nil then
						local var_170_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_20.prefab_name].transform, "story_v_out_114282", "114282042", "story_v_out_114282.awb")

						arg_167_1:RecordAudio("114282042", var_170_26)
						arg_167_1:RecordAudio("114282042", var_170_26)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_114282", "114282042", "story_v_out_114282.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_114282", "114282042", "story_v_out_114282.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_27 = math.max(var_170_18, arg_167_1.talkMaxDuration)

			if var_170_17 <= arg_167_1.time_ and arg_167_1.time_ < var_170_17 + var_170_27 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_17) / var_170_27

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_17 + var_170_27 and arg_167_1.time_ < var_170_17 + var_170_27 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play114282043 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 114282043
		arg_171_1.duration_ = 4.766

		local var_171_0 = {
			ja = 4.766,
			ko = 4.333,
			zh = 3.766,
			en = 4.433
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
				arg_171_0:Play114282044(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["10015"]
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 and arg_171_1.var_.actorSpriteComps10015 == nil then
				arg_171_1.var_.actorSpriteComps10015 = var_174_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_174_2 = 0.034

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_2 then
				local var_174_3 = (arg_171_1.time_ - var_174_1) / var_174_2

				if arg_171_1.var_.actorSpriteComps10015 then
					for iter_174_0, iter_174_1 in pairs(arg_171_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_174_1 then
							local var_174_4 = Mathf.Lerp(iter_174_1.color.r, 1, var_174_3)

							iter_174_1.color = Color.New(var_174_4, var_174_4, var_174_4)
						end
					end
				end
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 and arg_171_1.var_.actorSpriteComps10015 then
				local var_174_5 = 1

				for iter_174_2, iter_174_3 in pairs(arg_171_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_174_3 then
						iter_174_3.color = Color.New(var_174_5, var_174_5, var_174_5)
					end
				end

				arg_171_1.var_.actorSpriteComps10015 = nil
			end

			local var_174_6 = arg_171_1.actors_["10017"]
			local var_174_7 = 0

			if var_174_7 < arg_171_1.time_ and arg_171_1.time_ <= var_174_7 + arg_174_0 then
				local var_174_8 = var_174_6:GetComponent("Image")

				if var_174_8 then
					arg_171_1.var_.highlightMatValue10017 = var_174_8
				end
			end

			local var_174_9 = 0.034

			if var_174_7 <= arg_171_1.time_ and arg_171_1.time_ < var_174_7 + var_174_9 then
				local var_174_10 = (arg_171_1.time_ - var_174_7) / var_174_9

				if arg_171_1.var_.highlightMatValue10017 then
					local var_174_11 = Mathf.Lerp(1, 0.5, var_174_10)
					local var_174_12 = arg_171_1.var_.highlightMatValue10017
					local var_174_13 = var_174_12.color

					var_174_13.r = var_174_11
					var_174_13.g = var_174_11
					var_174_13.b = var_174_11
					var_174_12.color = var_174_13
				end
			end

			if arg_171_1.time_ >= var_174_7 + var_174_9 and arg_171_1.time_ < var_174_7 + var_174_9 + arg_174_0 and arg_171_1.var_.highlightMatValue10017 then
				local var_174_14 = 0.5
				local var_174_15 = arg_171_1.var_.highlightMatValue10017
				local var_174_16 = var_174_15.color

				var_174_16.r = var_174_14
				var_174_16.g = var_174_14
				var_174_16.b = var_174_14
				var_174_15.color = var_174_16
			end

			local var_174_17 = 0
			local var_174_18 = 0.4

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

				local var_174_20 = arg_171_1:GetWordFromCfg(114282043)
				local var_174_21 = arg_171_1:FormatText(var_174_20.content)

				arg_171_1.text_.text = var_174_21

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_22 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_114282", "114282043", "story_v_out_114282.awb") ~= 0 then
					local var_174_25 = manager.audio:GetVoiceLength("story_v_out_114282", "114282043", "story_v_out_114282.awb") / 1000

					if var_174_25 + var_174_17 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_25 + var_174_17
					end

					if var_174_20.prefab_name ~= "" and arg_171_1.actors_[var_174_20.prefab_name] ~= nil then
						local var_174_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_20.prefab_name].transform, "story_v_out_114282", "114282043", "story_v_out_114282.awb")

						arg_171_1:RecordAudio("114282043", var_174_26)
						arg_171_1:RecordAudio("114282043", var_174_26)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_114282", "114282043", "story_v_out_114282.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_114282", "114282043", "story_v_out_114282.awb")
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
	Play114282044 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 114282044
		arg_175_1.duration_ = 5.7

		local var_175_0 = {
			ja = 3.5,
			ko = 4.6,
			zh = 5.066,
			en = 5.7
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
				arg_175_0:Play114282045(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["10017"]
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 then
				local var_178_2 = var_178_0:GetComponent("Image")

				if var_178_2 then
					arg_175_1.var_.highlightMatValue10017 = var_178_2
				end
			end

			local var_178_3 = 0.034

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_3 then
				local var_178_4 = (arg_175_1.time_ - var_178_1) / var_178_3

				if arg_175_1.var_.highlightMatValue10017 then
					local var_178_5 = Mathf.Lerp(0.5, 1, var_178_4)
					local var_178_6 = arg_175_1.var_.highlightMatValue10017
					local var_178_7 = var_178_6.color

					var_178_7.r = var_178_5
					var_178_7.g = var_178_5
					var_178_7.b = var_178_5
					var_178_6.color = var_178_7
				end
			end

			if arg_175_1.time_ >= var_178_1 + var_178_3 and arg_175_1.time_ < var_178_1 + var_178_3 + arg_178_0 and arg_175_1.var_.highlightMatValue10017 then
				local var_178_8 = 1

				var_178_0.transform:SetSiblingIndex(1)

				local var_178_9 = arg_175_1.var_.highlightMatValue10017
				local var_178_10 = var_178_9.color

				var_178_10.r = var_178_8
				var_178_10.g = var_178_8
				var_178_10.b = var_178_8
				var_178_9.color = var_178_10
			end

			local var_178_11 = arg_175_1.actors_["10015"]
			local var_178_12 = 0

			if var_178_12 < arg_175_1.time_ and arg_175_1.time_ <= var_178_12 + arg_178_0 and arg_175_1.var_.actorSpriteComps10015 == nil then
				arg_175_1.var_.actorSpriteComps10015 = var_178_11:GetComponentsInChildren(typeof(Image), true)
			end

			local var_178_13 = 0.034

			if var_178_12 <= arg_175_1.time_ and arg_175_1.time_ < var_178_12 + var_178_13 then
				local var_178_14 = (arg_175_1.time_ - var_178_12) / var_178_13

				if arg_175_1.var_.actorSpriteComps10015 then
					for iter_178_0, iter_178_1 in pairs(arg_175_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_178_1 then
							local var_178_15 = Mathf.Lerp(iter_178_1.color.r, 0.5, var_178_14)

							iter_178_1.color = Color.New(var_178_15, var_178_15, var_178_15)
						end
					end
				end
			end

			if arg_175_1.time_ >= var_178_12 + var_178_13 and arg_175_1.time_ < var_178_12 + var_178_13 + arg_178_0 and arg_175_1.var_.actorSpriteComps10015 then
				local var_178_16 = 0.5

				for iter_178_2, iter_178_3 in pairs(arg_175_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_178_3 then
						iter_178_3.color = Color.New(var_178_16, var_178_16, var_178_16)
					end
				end

				arg_175_1.var_.actorSpriteComps10015 = nil
			end

			local var_178_17 = 0
			local var_178_18 = 0.625

			if var_178_17 < arg_175_1.time_ and arg_175_1.time_ <= var_178_17 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_19 = arg_175_1:FormatText(StoryNameCfg[255].name)

				arg_175_1.leftNameTxt_.text = var_178_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_20 = arg_175_1:GetWordFromCfg(114282044)
				local var_178_21 = arg_175_1:FormatText(var_178_20.content)

				arg_175_1.text_.text = var_178_21

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_22 = 25
				local var_178_23 = utf8.len(var_178_21)
				local var_178_24 = var_178_22 <= 0 and var_178_18 or var_178_18 * (var_178_23 / var_178_22)

				if var_178_24 > 0 and var_178_18 < var_178_24 then
					arg_175_1.talkMaxDuration = var_178_24

					if var_178_24 + var_178_17 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_24 + var_178_17
					end
				end

				arg_175_1.text_.text = var_178_21
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114282", "114282044", "story_v_out_114282.awb") ~= 0 then
					local var_178_25 = manager.audio:GetVoiceLength("story_v_out_114282", "114282044", "story_v_out_114282.awb") / 1000

					if var_178_25 + var_178_17 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_25 + var_178_17
					end

					if var_178_20.prefab_name ~= "" and arg_175_1.actors_[var_178_20.prefab_name] ~= nil then
						local var_178_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_20.prefab_name].transform, "story_v_out_114282", "114282044", "story_v_out_114282.awb")

						arg_175_1:RecordAudio("114282044", var_178_26)
						arg_175_1:RecordAudio("114282044", var_178_26)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_114282", "114282044", "story_v_out_114282.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_114282", "114282044", "story_v_out_114282.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_27 = math.max(var_178_18, arg_175_1.talkMaxDuration)

			if var_178_17 <= arg_175_1.time_ and arg_175_1.time_ < var_178_17 + var_178_27 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_17) / var_178_27

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_17 + var_178_27 and arg_175_1.time_ < var_178_17 + var_178_27 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play114282045 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 114282045
		arg_179_1.duration_ = 10.766

		local var_179_0 = {
			ja = 10.766,
			ko = 8.6,
			zh = 7.766,
			en = 10.033
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
				arg_179_0:Play114282046(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["10023"].transform
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 then
				arg_179_1.var_.moveOldPos10023 = var_182_0.localPosition
				var_182_0.localScale = Vector3.New(1, 1, 1)

				arg_179_1:CheckSpriteTmpPos("10023", 2)
			end

			local var_182_2 = 0.001

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_2 then
				local var_182_3 = (arg_179_1.time_ - var_182_1) / var_182_2
				local var_182_4 = Vector3.New(-390, -350, -180)

				var_182_0.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos10023, var_182_4, var_182_3)
			end

			if arg_179_1.time_ >= var_182_1 + var_182_2 and arg_179_1.time_ < var_182_1 + var_182_2 + arg_182_0 then
				var_182_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_182_5 = arg_179_1.actors_["10023"]
			local var_182_6 = 0

			if var_182_6 < arg_179_1.time_ and arg_179_1.time_ <= var_182_6 + arg_182_0 then
				local var_182_7 = var_182_5:GetComponent("Image")

				if var_182_7 then
					arg_179_1.var_.highlightMatValue10023 = var_182_7
				end
			end

			local var_182_8 = 0.034

			if var_182_6 <= arg_179_1.time_ and arg_179_1.time_ < var_182_6 + var_182_8 then
				local var_182_9 = (arg_179_1.time_ - var_182_6) / var_182_8

				if arg_179_1.var_.highlightMatValue10023 then
					local var_182_10 = Mathf.Lerp(0.5, 1, var_182_9)
					local var_182_11 = arg_179_1.var_.highlightMatValue10023
					local var_182_12 = var_182_11.color

					var_182_12.r = var_182_10
					var_182_12.g = var_182_10
					var_182_12.b = var_182_10
					var_182_11.color = var_182_12
				end
			end

			if arg_179_1.time_ >= var_182_6 + var_182_8 and arg_179_1.time_ < var_182_6 + var_182_8 + arg_182_0 and arg_179_1.var_.highlightMatValue10023 then
				local var_182_13 = 1

				var_182_5.transform:SetSiblingIndex(1)

				local var_182_14 = arg_179_1.var_.highlightMatValue10023
				local var_182_15 = var_182_14.color

				var_182_15.r = var_182_13
				var_182_15.g = var_182_13
				var_182_15.b = var_182_13
				var_182_14.color = var_182_15
			end

			local var_182_16 = arg_179_1.actors_["10023"]
			local var_182_17 = 0

			if var_182_17 < arg_179_1.time_ and arg_179_1.time_ <= var_182_17 + arg_182_0 then
				local var_182_18 = var_182_16:GetComponent("Image")

				if var_182_18 then
					arg_179_1.var_.alphaMatValue10023 = var_182_18
					arg_179_1.var_.alphaOldValue10023 = var_182_18.color.a
				end

				arg_179_1.var_.alphaOldValue10023 = 0
			end

			local var_182_19 = 0.5

			if var_182_17 <= arg_179_1.time_ and arg_179_1.time_ < var_182_17 + var_182_19 then
				local var_182_20 = (arg_179_1.time_ - var_182_17) / var_182_19
				local var_182_21 = Mathf.Lerp(arg_179_1.var_.alphaOldValue10023, 1, var_182_20)

				if arg_179_1.var_.alphaMatValue10023 then
					local var_182_22 = arg_179_1.var_.alphaMatValue10023.color

					var_182_22.a = var_182_21
					arg_179_1.var_.alphaMatValue10023.color = var_182_22
				end
			end

			if arg_179_1.time_ >= var_182_17 + var_182_19 and arg_179_1.time_ < var_182_17 + var_182_19 + arg_182_0 and arg_179_1.var_.alphaMatValue10023 then
				local var_182_23 = arg_179_1.var_.alphaMatValue10023
				local var_182_24 = var_182_23.color

				var_182_24.a = 1
				var_182_23.color = var_182_24
			end

			local var_182_25 = 0
			local var_182_26 = 0.825

			if var_182_25 < arg_179_1.time_ and arg_179_1.time_ <= var_182_25 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_27 = arg_179_1:FormatText(StoryNameCfg[259].name)

				arg_179_1.leftNameTxt_.text = var_182_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_28 = arg_179_1:GetWordFromCfg(114282045)
				local var_182_29 = arg_179_1:FormatText(var_182_28.content)

				arg_179_1.text_.text = var_182_29

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_30 = 33
				local var_182_31 = utf8.len(var_182_29)
				local var_182_32 = var_182_30 <= 0 and var_182_26 or var_182_26 * (var_182_31 / var_182_30)

				if var_182_32 > 0 and var_182_26 < var_182_32 then
					arg_179_1.talkMaxDuration = var_182_32

					if var_182_32 + var_182_25 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_32 + var_182_25
					end
				end

				arg_179_1.text_.text = var_182_29
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114282", "114282045", "story_v_out_114282.awb") ~= 0 then
					local var_182_33 = manager.audio:GetVoiceLength("story_v_out_114282", "114282045", "story_v_out_114282.awb") / 1000

					if var_182_33 + var_182_25 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_33 + var_182_25
					end

					if var_182_28.prefab_name ~= "" and arg_179_1.actors_[var_182_28.prefab_name] ~= nil then
						local var_182_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_28.prefab_name].transform, "story_v_out_114282", "114282045", "story_v_out_114282.awb")

						arg_179_1:RecordAudio("114282045", var_182_34)
						arg_179_1:RecordAudio("114282045", var_182_34)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_114282", "114282045", "story_v_out_114282.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_114282", "114282045", "story_v_out_114282.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_35 = math.max(var_182_26, arg_179_1.talkMaxDuration)

			if var_182_25 <= arg_179_1.time_ and arg_179_1.time_ < var_182_25 + var_182_35 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_25) / var_182_35

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_25 + var_182_35 and arg_179_1.time_ < var_182_25 + var_182_35 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play114282046 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 114282046
		arg_183_1.duration_ = 12.433

		local var_183_0 = {
			ja = 12.433,
			ko = 5.133,
			zh = 4.633,
			en = 3.033
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
				arg_183_0:Play114282047(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["10015"]
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 and arg_183_1.var_.actorSpriteComps10015 == nil then
				arg_183_1.var_.actorSpriteComps10015 = var_186_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_186_2 = 0.034

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_2 then
				local var_186_3 = (arg_183_1.time_ - var_186_1) / var_186_2

				if arg_183_1.var_.actorSpriteComps10015 then
					for iter_186_0, iter_186_1 in pairs(arg_183_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_186_1 then
							local var_186_4 = Mathf.Lerp(iter_186_1.color.r, 1, var_186_3)

							iter_186_1.color = Color.New(var_186_4, var_186_4, var_186_4)
						end
					end
				end
			end

			if arg_183_1.time_ >= var_186_1 + var_186_2 and arg_183_1.time_ < var_186_1 + var_186_2 + arg_186_0 and arg_183_1.var_.actorSpriteComps10015 then
				local var_186_5 = 1

				for iter_186_2, iter_186_3 in pairs(arg_183_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_186_3 then
						iter_186_3.color = Color.New(var_186_5, var_186_5, var_186_5)
					end
				end

				arg_183_1.var_.actorSpriteComps10015 = nil
			end

			local var_186_6 = arg_183_1.actors_["10023"]
			local var_186_7 = 0

			if var_186_7 < arg_183_1.time_ and arg_183_1.time_ <= var_186_7 + arg_186_0 then
				local var_186_8 = var_186_6:GetComponent("Image")

				if var_186_8 then
					arg_183_1.var_.highlightMatValue10023 = var_186_8
				end
			end

			local var_186_9 = 0.034

			if var_186_7 <= arg_183_1.time_ and arg_183_1.time_ < var_186_7 + var_186_9 then
				local var_186_10 = (arg_183_1.time_ - var_186_7) / var_186_9

				if arg_183_1.var_.highlightMatValue10023 then
					local var_186_11 = Mathf.Lerp(1, 0.5, var_186_10)
					local var_186_12 = arg_183_1.var_.highlightMatValue10023
					local var_186_13 = var_186_12.color

					var_186_13.r = var_186_11
					var_186_13.g = var_186_11
					var_186_13.b = var_186_11
					var_186_12.color = var_186_13
				end
			end

			if arg_183_1.time_ >= var_186_7 + var_186_9 and arg_183_1.time_ < var_186_7 + var_186_9 + arg_186_0 and arg_183_1.var_.highlightMatValue10023 then
				local var_186_14 = 0.5
				local var_186_15 = arg_183_1.var_.highlightMatValue10023
				local var_186_16 = var_186_15.color

				var_186_16.r = var_186_14
				var_186_16.g = var_186_14
				var_186_16.b = var_186_14
				var_186_15.color = var_186_16
			end

			local var_186_17 = 0
			local var_186_18 = 0.425

			if var_186_17 < arg_183_1.time_ and arg_183_1.time_ <= var_186_17 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_19 = arg_183_1:FormatText(StoryNameCfg[208].name)

				arg_183_1.leftNameTxt_.text = var_186_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_20 = arg_183_1:GetWordFromCfg(114282046)
				local var_186_21 = arg_183_1:FormatText(var_186_20.content)

				arg_183_1.text_.text = var_186_21

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_22 = 17
				local var_186_23 = utf8.len(var_186_21)
				local var_186_24 = var_186_22 <= 0 and var_186_18 or var_186_18 * (var_186_23 / var_186_22)

				if var_186_24 > 0 and var_186_18 < var_186_24 then
					arg_183_1.talkMaxDuration = var_186_24

					if var_186_24 + var_186_17 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_24 + var_186_17
					end
				end

				arg_183_1.text_.text = var_186_21
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114282", "114282046", "story_v_out_114282.awb") ~= 0 then
					local var_186_25 = manager.audio:GetVoiceLength("story_v_out_114282", "114282046", "story_v_out_114282.awb") / 1000

					if var_186_25 + var_186_17 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_25 + var_186_17
					end

					if var_186_20.prefab_name ~= "" and arg_183_1.actors_[var_186_20.prefab_name] ~= nil then
						local var_186_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_20.prefab_name].transform, "story_v_out_114282", "114282046", "story_v_out_114282.awb")

						arg_183_1:RecordAudio("114282046", var_186_26)
						arg_183_1:RecordAudio("114282046", var_186_26)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_114282", "114282046", "story_v_out_114282.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_114282", "114282046", "story_v_out_114282.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_27 = math.max(var_186_18, arg_183_1.talkMaxDuration)

			if var_186_17 <= arg_183_1.time_ and arg_183_1.time_ < var_186_17 + var_186_27 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_17) / var_186_27

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_17 + var_186_27 and arg_183_1.time_ < var_186_17 + var_186_27 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play114282047 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 114282047
		arg_187_1.duration_ = 1.866

		local var_187_0 = {
			ja = 1.366,
			ko = 1.266,
			zh = 1.6,
			en = 1.866
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
				arg_187_0:Play114282048(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["10017"].transform
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 then
				arg_187_1.var_.moveOldPos10017 = var_190_0.localPosition
				var_190_0.localScale = Vector3.New(1, 1, 1)

				arg_187_1:CheckSpriteTmpPos("10017", 2)
			end

			local var_190_2 = 0.001

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_2 then
				local var_190_3 = (arg_187_1.time_ - var_190_1) / var_190_2
				local var_190_4 = Vector3.New(-390, -350, -180)

				var_190_0.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos10017, var_190_4, var_190_3)
			end

			if arg_187_1.time_ >= var_190_1 + var_190_2 and arg_187_1.time_ < var_190_1 + var_190_2 + arg_190_0 then
				var_190_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_190_5 = arg_187_1.actors_["10017"]
			local var_190_6 = 0

			if var_190_6 < arg_187_1.time_ and arg_187_1.time_ <= var_190_6 + arg_190_0 then
				local var_190_7 = var_190_5:GetComponent("Image")

				if var_190_7 then
					arg_187_1.var_.highlightMatValue10017 = var_190_7
				end
			end

			local var_190_8 = 0.034

			if var_190_6 <= arg_187_1.time_ and arg_187_1.time_ < var_190_6 + var_190_8 then
				local var_190_9 = (arg_187_1.time_ - var_190_6) / var_190_8

				if arg_187_1.var_.highlightMatValue10017 then
					local var_190_10 = Mathf.Lerp(0.5, 1, var_190_9)
					local var_190_11 = arg_187_1.var_.highlightMatValue10017
					local var_190_12 = var_190_11.color

					var_190_12.r = var_190_10
					var_190_12.g = var_190_10
					var_190_12.b = var_190_10
					var_190_11.color = var_190_12
				end
			end

			if arg_187_1.time_ >= var_190_6 + var_190_8 and arg_187_1.time_ < var_190_6 + var_190_8 + arg_190_0 and arg_187_1.var_.highlightMatValue10017 then
				local var_190_13 = 1

				var_190_5.transform:SetSiblingIndex(1)

				local var_190_14 = arg_187_1.var_.highlightMatValue10017
				local var_190_15 = var_190_14.color

				var_190_15.r = var_190_13
				var_190_15.g = var_190_13
				var_190_15.b = var_190_13
				var_190_14.color = var_190_15
			end

			local var_190_16 = arg_187_1.actors_["10015"]
			local var_190_17 = 0

			if var_190_17 < arg_187_1.time_ and arg_187_1.time_ <= var_190_17 + arg_190_0 and arg_187_1.var_.actorSpriteComps10015 == nil then
				arg_187_1.var_.actorSpriteComps10015 = var_190_16:GetComponentsInChildren(typeof(Image), true)
			end

			local var_190_18 = 0.034

			if var_190_17 <= arg_187_1.time_ and arg_187_1.time_ < var_190_17 + var_190_18 then
				local var_190_19 = (arg_187_1.time_ - var_190_17) / var_190_18

				if arg_187_1.var_.actorSpriteComps10015 then
					for iter_190_0, iter_190_1 in pairs(arg_187_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_190_1 then
							local var_190_20 = Mathf.Lerp(iter_190_1.color.r, 0.5, var_190_19)

							iter_190_1.color = Color.New(var_190_20, var_190_20, var_190_20)
						end
					end
				end
			end

			if arg_187_1.time_ >= var_190_17 + var_190_18 and arg_187_1.time_ < var_190_17 + var_190_18 + arg_190_0 and arg_187_1.var_.actorSpriteComps10015 then
				local var_190_21 = 0.5

				for iter_190_2, iter_190_3 in pairs(arg_187_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_190_3 then
						iter_190_3.color = Color.New(var_190_21, var_190_21, var_190_21)
					end
				end

				arg_187_1.var_.actorSpriteComps10015 = nil
			end

			local var_190_22 = arg_187_1.actors_["10017"]
			local var_190_23 = 0

			if var_190_23 < arg_187_1.time_ and arg_187_1.time_ <= var_190_23 + arg_190_0 then
				local var_190_24 = var_190_22:GetComponent("Image")

				if var_190_24 then
					arg_187_1.var_.alphaMatValue10017 = var_190_24
					arg_187_1.var_.alphaOldValue10017 = var_190_24.color.a
				end

				arg_187_1.var_.alphaOldValue10017 = 0
			end

			local var_190_25 = 0.5

			if var_190_23 <= arg_187_1.time_ and arg_187_1.time_ < var_190_23 + var_190_25 then
				local var_190_26 = (arg_187_1.time_ - var_190_23) / var_190_25
				local var_190_27 = Mathf.Lerp(arg_187_1.var_.alphaOldValue10017, 1, var_190_26)

				if arg_187_1.var_.alphaMatValue10017 then
					local var_190_28 = arg_187_1.var_.alphaMatValue10017.color

					var_190_28.a = var_190_27
					arg_187_1.var_.alphaMatValue10017.color = var_190_28
				end
			end

			if arg_187_1.time_ >= var_190_23 + var_190_25 and arg_187_1.time_ < var_190_23 + var_190_25 + arg_190_0 and arg_187_1.var_.alphaMatValue10017 then
				local var_190_29 = arg_187_1.var_.alphaMatValue10017
				local var_190_30 = var_190_29.color

				var_190_30.a = 1
				var_190_29.color = var_190_30
			end

			local var_190_31 = 0
			local var_190_32 = 0.05

			if var_190_31 < arg_187_1.time_ and arg_187_1.time_ <= var_190_31 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_33 = arg_187_1:FormatText(StoryNameCfg[255].name)

				arg_187_1.leftNameTxt_.text = var_190_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_34 = arg_187_1:GetWordFromCfg(114282047)
				local var_190_35 = arg_187_1:FormatText(var_190_34.content)

				arg_187_1.text_.text = var_190_35

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_36 = 2
				local var_190_37 = utf8.len(var_190_35)
				local var_190_38 = var_190_36 <= 0 and var_190_32 or var_190_32 * (var_190_37 / var_190_36)

				if var_190_38 > 0 and var_190_32 < var_190_38 then
					arg_187_1.talkMaxDuration = var_190_38

					if var_190_38 + var_190_31 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_38 + var_190_31
					end
				end

				arg_187_1.text_.text = var_190_35
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114282", "114282047", "story_v_out_114282.awb") ~= 0 then
					local var_190_39 = manager.audio:GetVoiceLength("story_v_out_114282", "114282047", "story_v_out_114282.awb") / 1000

					if var_190_39 + var_190_31 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_39 + var_190_31
					end

					if var_190_34.prefab_name ~= "" and arg_187_1.actors_[var_190_34.prefab_name] ~= nil then
						local var_190_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_34.prefab_name].transform, "story_v_out_114282", "114282047", "story_v_out_114282.awb")

						arg_187_1:RecordAudio("114282047", var_190_40)
						arg_187_1:RecordAudio("114282047", var_190_40)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_114282", "114282047", "story_v_out_114282.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_114282", "114282047", "story_v_out_114282.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_41 = math.max(var_190_32, arg_187_1.talkMaxDuration)

			if var_190_31 <= arg_187_1.time_ and arg_187_1.time_ < var_190_31 + var_190_41 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_31) / var_190_41

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_31 + var_190_41 and arg_187_1.time_ < var_190_31 + var_190_41 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play114282048 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 114282048
		arg_191_1.duration_ = 5

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play114282049(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["10017"]
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 then
				local var_194_2 = var_194_0:GetComponent("Image")

				if var_194_2 then
					arg_191_1.var_.highlightMatValue10017 = var_194_2
				end
			end

			local var_194_3 = 0.034

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_3 then
				local var_194_4 = (arg_191_1.time_ - var_194_1) / var_194_3

				if arg_191_1.var_.highlightMatValue10017 then
					local var_194_5 = Mathf.Lerp(1, 0.5, var_194_4)
					local var_194_6 = arg_191_1.var_.highlightMatValue10017
					local var_194_7 = var_194_6.color

					var_194_7.r = var_194_5
					var_194_7.g = var_194_5
					var_194_7.b = var_194_5
					var_194_6.color = var_194_7
				end
			end

			if arg_191_1.time_ >= var_194_1 + var_194_3 and arg_191_1.time_ < var_194_1 + var_194_3 + arg_194_0 and arg_191_1.var_.highlightMatValue10017 then
				local var_194_8 = 0.5
				local var_194_9 = arg_191_1.var_.highlightMatValue10017
				local var_194_10 = var_194_9.color

				var_194_10.r = var_194_8
				var_194_10.g = var_194_8
				var_194_10.b = var_194_8
				var_194_9.color = var_194_10
			end

			local var_194_11 = 0
			local var_194_12 = 0.775

			if var_194_11 < arg_191_1.time_ and arg_191_1.time_ <= var_194_11 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, false)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_13 = arg_191_1:GetWordFromCfg(114282048)
				local var_194_14 = arg_191_1:FormatText(var_194_13.content)

				arg_191_1.text_.text = var_194_14

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_15 = 31
				local var_194_16 = utf8.len(var_194_14)
				local var_194_17 = var_194_15 <= 0 and var_194_12 or var_194_12 * (var_194_16 / var_194_15)

				if var_194_17 > 0 and var_194_12 < var_194_17 then
					arg_191_1.talkMaxDuration = var_194_17

					if var_194_17 + var_194_11 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_17 + var_194_11
					end
				end

				arg_191_1.text_.text = var_194_14
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)
				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_18 = math.max(var_194_12, arg_191_1.talkMaxDuration)

			if var_194_11 <= arg_191_1.time_ and arg_191_1.time_ < var_194_11 + var_194_18 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_11) / var_194_18

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_11 + var_194_18 and arg_191_1.time_ < var_194_11 + var_194_18 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play114282049 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 114282049
		arg_195_1.duration_ = 11.333

		local var_195_0 = {
			ja = 9.2,
			ko = 10.9,
			zh = 7.933,
			en = 11.333
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
				arg_195_0:Play114282050(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["10017"]
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 then
				local var_198_2 = var_198_0:GetComponent("Image")

				if var_198_2 then
					arg_195_1.var_.highlightMatValue10017 = var_198_2
				end
			end

			local var_198_3 = 0.034

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_3 then
				local var_198_4 = (arg_195_1.time_ - var_198_1) / var_198_3

				if arg_195_1.var_.highlightMatValue10017 then
					local var_198_5 = Mathf.Lerp(0.5, 1, var_198_4)
					local var_198_6 = arg_195_1.var_.highlightMatValue10017
					local var_198_7 = var_198_6.color

					var_198_7.r = var_198_5
					var_198_7.g = var_198_5
					var_198_7.b = var_198_5
					var_198_6.color = var_198_7
				end
			end

			if arg_195_1.time_ >= var_198_1 + var_198_3 and arg_195_1.time_ < var_198_1 + var_198_3 + arg_198_0 and arg_195_1.var_.highlightMatValue10017 then
				local var_198_8 = 1

				var_198_0.transform:SetSiblingIndex(1)

				local var_198_9 = arg_195_1.var_.highlightMatValue10017
				local var_198_10 = var_198_9.color

				var_198_10.r = var_198_8
				var_198_10.g = var_198_8
				var_198_10.b = var_198_8
				var_198_9.color = var_198_10
			end

			local var_198_11 = 0
			local var_198_12 = 0.975

			if var_198_11 < arg_195_1.time_ and arg_195_1.time_ <= var_198_11 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_13 = arg_195_1:FormatText(StoryNameCfg[255].name)

				arg_195_1.leftNameTxt_.text = var_198_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_14 = arg_195_1:GetWordFromCfg(114282049)
				local var_198_15 = arg_195_1:FormatText(var_198_14.content)

				arg_195_1.text_.text = var_198_15

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_16 = 39
				local var_198_17 = utf8.len(var_198_15)
				local var_198_18 = var_198_16 <= 0 and var_198_12 or var_198_12 * (var_198_17 / var_198_16)

				if var_198_18 > 0 and var_198_12 < var_198_18 then
					arg_195_1.talkMaxDuration = var_198_18

					if var_198_18 + var_198_11 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_18 + var_198_11
					end
				end

				arg_195_1.text_.text = var_198_15
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114282", "114282049", "story_v_out_114282.awb") ~= 0 then
					local var_198_19 = manager.audio:GetVoiceLength("story_v_out_114282", "114282049", "story_v_out_114282.awb") / 1000

					if var_198_19 + var_198_11 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_19 + var_198_11
					end

					if var_198_14.prefab_name ~= "" and arg_195_1.actors_[var_198_14.prefab_name] ~= nil then
						local var_198_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_14.prefab_name].transform, "story_v_out_114282", "114282049", "story_v_out_114282.awb")

						arg_195_1:RecordAudio("114282049", var_198_20)
						arg_195_1:RecordAudio("114282049", var_198_20)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_114282", "114282049", "story_v_out_114282.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_114282", "114282049", "story_v_out_114282.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_21 = math.max(var_198_12, arg_195_1.talkMaxDuration)

			if var_198_11 <= arg_195_1.time_ and arg_195_1.time_ < var_198_11 + var_198_21 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_11) / var_198_21

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_11 + var_198_21 and arg_195_1.time_ < var_198_11 + var_198_21 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play114282050 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 114282050
		arg_199_1.duration_ = 2.966

		local var_199_0 = {
			ja = 2.833,
			ko = 2.966,
			zh = 2,
			en = 2.533
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
			arg_199_1.auto_ = false
		end

		function arg_199_1.playNext_(arg_201_0)
			arg_199_1.onStoryFinished_()
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["10015"]
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 and arg_199_1.var_.actorSpriteComps10015 == nil then
				arg_199_1.var_.actorSpriteComps10015 = var_202_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_202_2 = 0.034

			if var_202_1 <= arg_199_1.time_ and arg_199_1.time_ < var_202_1 + var_202_2 then
				local var_202_3 = (arg_199_1.time_ - var_202_1) / var_202_2

				if arg_199_1.var_.actorSpriteComps10015 then
					for iter_202_0, iter_202_1 in pairs(arg_199_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_202_1 then
							local var_202_4 = Mathf.Lerp(iter_202_1.color.r, 1, var_202_3)

							iter_202_1.color = Color.New(var_202_4, var_202_4, var_202_4)
						end
					end
				end
			end

			if arg_199_1.time_ >= var_202_1 + var_202_2 and arg_199_1.time_ < var_202_1 + var_202_2 + arg_202_0 and arg_199_1.var_.actorSpriteComps10015 then
				local var_202_5 = 1

				for iter_202_2, iter_202_3 in pairs(arg_199_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_202_3 then
						iter_202_3.color = Color.New(var_202_5, var_202_5, var_202_5)
					end
				end

				arg_199_1.var_.actorSpriteComps10015 = nil
			end

			local var_202_6 = arg_199_1.actors_["10017"]
			local var_202_7 = 0

			if var_202_7 < arg_199_1.time_ and arg_199_1.time_ <= var_202_7 + arg_202_0 then
				local var_202_8 = var_202_6:GetComponent("Image")

				if var_202_8 then
					arg_199_1.var_.highlightMatValue10017 = var_202_8
				end
			end

			local var_202_9 = 0.034

			if var_202_7 <= arg_199_1.time_ and arg_199_1.time_ < var_202_7 + var_202_9 then
				local var_202_10 = (arg_199_1.time_ - var_202_7) / var_202_9

				if arg_199_1.var_.highlightMatValue10017 then
					local var_202_11 = Mathf.Lerp(1, 0.5, var_202_10)
					local var_202_12 = arg_199_1.var_.highlightMatValue10017
					local var_202_13 = var_202_12.color

					var_202_13.r = var_202_11
					var_202_13.g = var_202_11
					var_202_13.b = var_202_11
					var_202_12.color = var_202_13
				end
			end

			if arg_199_1.time_ >= var_202_7 + var_202_9 and arg_199_1.time_ < var_202_7 + var_202_9 + arg_202_0 and arg_199_1.var_.highlightMatValue10017 then
				local var_202_14 = 0.5
				local var_202_15 = arg_199_1.var_.highlightMatValue10017
				local var_202_16 = var_202_15.color

				var_202_16.r = var_202_14
				var_202_16.g = var_202_14
				var_202_16.b = var_202_14
				var_202_15.color = var_202_16
			end

			local var_202_17 = arg_199_1.actors_["10015"].transform
			local var_202_18 = 0

			if var_202_18 < arg_199_1.time_ and arg_199_1.time_ <= var_202_18 + arg_202_0 then
				arg_199_1.var_.moveOldPos10015 = var_202_17.localPosition
				var_202_17.localScale = Vector3.New(1, 1, 1)

				arg_199_1:CheckSpriteTmpPos("10015", 4)

				local var_202_19 = var_202_17.childCount

				for iter_202_4 = 0, var_202_19 - 1 do
					local var_202_20 = var_202_17:GetChild(iter_202_4)

					if var_202_20.name == "split_5" or not string.find(var_202_20.name, "split") then
						var_202_20.gameObject:SetActive(true)
					else
						var_202_20.gameObject:SetActive(false)
					end
				end
			end

			local var_202_21 = 0.001

			if var_202_18 <= arg_199_1.time_ and arg_199_1.time_ < var_202_18 + var_202_21 then
				local var_202_22 = (arg_199_1.time_ - var_202_18) / var_202_21
				local var_202_23 = Vector3.New(390, -350, -180)

				var_202_17.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos10015, var_202_23, var_202_22)
			end

			if arg_199_1.time_ >= var_202_18 + var_202_21 and arg_199_1.time_ < var_202_18 + var_202_21 + arg_202_0 then
				var_202_17.localPosition = Vector3.New(390, -350, -180)
			end

			local var_202_24 = 0
			local var_202_25 = 0.15

			if var_202_24 < arg_199_1.time_ and arg_199_1.time_ <= var_202_24 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_26 = arg_199_1:FormatText(StoryNameCfg[208].name)

				arg_199_1.leftNameTxt_.text = var_202_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_27 = arg_199_1:GetWordFromCfg(114282050)
				local var_202_28 = arg_199_1:FormatText(var_202_27.content)

				arg_199_1.text_.text = var_202_28

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_29 = 6
				local var_202_30 = utf8.len(var_202_28)
				local var_202_31 = var_202_29 <= 0 and var_202_25 or var_202_25 * (var_202_30 / var_202_29)

				if var_202_31 > 0 and var_202_25 < var_202_31 then
					arg_199_1.talkMaxDuration = var_202_31

					if var_202_31 + var_202_24 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_31 + var_202_24
					end
				end

				arg_199_1.text_.text = var_202_28
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114282", "114282050", "story_v_out_114282.awb") ~= 0 then
					local var_202_32 = manager.audio:GetVoiceLength("story_v_out_114282", "114282050", "story_v_out_114282.awb") / 1000

					if var_202_32 + var_202_24 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_32 + var_202_24
					end

					if var_202_27.prefab_name ~= "" and arg_199_1.actors_[var_202_27.prefab_name] ~= nil then
						local var_202_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_27.prefab_name].transform, "story_v_out_114282", "114282050", "story_v_out_114282.awb")

						arg_199_1:RecordAudio("114282050", var_202_33)
						arg_199_1:RecordAudio("114282050", var_202_33)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_114282", "114282050", "story_v_out_114282.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_114282", "114282050", "story_v_out_114282.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_34 = math.max(var_202_25, arg_199_1.talkMaxDuration)

			if var_202_24 <= arg_199_1.time_ and arg_199_1.time_ < var_202_24 + var_202_34 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_24) / var_202_34

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_24 + var_202_34 and arg_199_1.time_ < var_202_24 + var_202_34 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/F04"
	},
	voices = {
		"story_v_out_114282.awb"
	}
}
