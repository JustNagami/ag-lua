return {
	Play110111001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 110111001
		arg_1_1.duration_ = 3.855999999999

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play110111002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = 0

			if var_4_0 < arg_1_1.time_ and arg_1_1.time_ <= var_4_0 + arg_4_0 then
				arg_1_1.fswbg_:SetActive(true)
				arg_1_1.dialog_:SetActive(false)

				arg_1_1.fswtw_.percent = 0

				local var_4_1 = arg_1_1:GetWordFromCfg(110111001)
				local var_4_2 = arg_1_1:FormatText(var_4_1.content)

				arg_1_1.fswt_.text = var_4_2

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.fswt_)

				arg_1_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_1_1.fswtw_:SetDirty()

				arg_1_1.typewritterCharCountI18N = 0

				arg_1_1:ShowNextGo(false)
			end

			local var_4_3 = 0.0166666666666667

			if var_4_3 < arg_1_1.time_ and arg_1_1.time_ <= var_4_3 + arg_4_0 then
				arg_1_1.var_.oldValueTypewriter = arg_1_1.fswtw_.percent

				arg_1_1:ShowNextGo(false)
			end

			local var_4_4 = 17
			local var_4_5 = 1.13333333333333
			local var_4_6 = arg_1_1:GetWordFromCfg(110111001)
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

			local var_4_11 = 1.13333333333333
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
			local var_4_15 = 3.856
			local var_4_16 = manager.audio:GetVoiceLength("story_v_out_110101", "110101001", "story_v_out_110101.awb") / 1000

			if var_4_16 > 0 and var_4_15 < var_4_16 and var_4_16 + var_4_14 > arg_1_1.duration_ then
				local var_4_17 = var_4_16

				arg_1_1.duration_ = var_4_16 + var_4_14
			end

			if var_4_14 < arg_1_1.time_ and arg_1_1.time_ <= var_4_14 + arg_4_0 then
				local var_4_18 = "play"
				local var_4_19 = "voice"

				arg_1_1:AudioAction(var_4_18, var_4_19, "story_v_out_110101", "110101001", "story_v_out_110101.awb")
			end

			local var_4_20 = 0
			local var_4_21 = 2.466
			local var_4_22 = manager.audio:GetVoiceLength("story_v_out_110111", "110111001", "story_v_out_110111.awb") / 1000

			if var_4_22 > 0 and var_4_21 < var_4_22 and var_4_22 + var_4_20 > arg_1_1.duration_ then
				local var_4_23 = var_4_22

				arg_1_1.duration_ = var_4_22 + var_4_20
			end

			if var_4_20 < arg_1_1.time_ and arg_1_1.time_ <= var_4_20 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "voice"

				arg_1_1:AudioAction(var_4_24, var_4_25, "story_v_out_110111", "110111001", "story_v_out_110111.awb")
			end

			local var_4_26 = 0
			local var_4_27 = 0.6

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_30 = 0.738461699336767
			local var_4_31 = 1

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				local var_4_32 = "play"
				local var_4_33 = "music"

				arg_1_1:AudioAction(var_4_32, var_4_33, "bgm_activity_1_0_1_osiris_ui", "bgm_activity_1_0_1_osiris_ui", "bgm_activity_1_0_1_osiris_ui.awb")
			end
		end
	end,
	Play110111002 = function(arg_5_0, arg_5_1)
		arg_5_1.time_ = 0
		arg_5_1.frameCnt_ = 0
		arg_5_1.state_ = "playing"
		arg_5_1.curTalkId_ = 110111002
		arg_5_1.duration_ = 3.353999999999

		SetActive(arg_5_1.tipsGo_, false)

		function arg_5_1.onSingleLineFinish_()
			arg_5_1.onSingleLineUpdate_ = nil
			arg_5_1.onSingleLineFinish_ = nil
			arg_5_1.state_ = "waiting"
		end

		function arg_5_1.playNext_(arg_7_0)
			if arg_7_0 == 1 then
				arg_5_0:Play110111003(arg_5_1)
			end
		end

		function arg_5_1.onSingleLineUpdate_(arg_8_0)
			local var_8_0 = 0

			if var_8_0 < arg_5_1.time_ and arg_5_1.time_ <= var_8_0 + arg_8_0 then
				arg_5_1.var_.oldValueTypewriter = arg_5_1.fswtw_.percent

				arg_5_1:ShowNextGo(false)
			end

			local var_8_1 = 22
			local var_8_2 = 1.46666666666667
			local var_8_3 = arg_5_1:GetWordFromCfg(110111001)
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

			local var_8_8 = 1.46666666666667
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
			local var_8_12 = 3.354
			local var_8_13 = manager.audio:GetVoiceLength("story_v_out_110111", "110111002", "story_v_out_110111.awb") / 1000

			if var_8_13 > 0 and var_8_12 < var_8_13 and var_8_13 + var_8_11 > arg_5_1.duration_ then
				local var_8_14 = var_8_13

				arg_5_1.duration_ = var_8_13 + var_8_11
			end

			if var_8_11 < arg_5_1.time_ and arg_5_1.time_ <= var_8_11 + arg_8_0 then
				local var_8_15 = "play"
				local var_8_16 = "voice"

				arg_5_1:AudioAction(var_8_15, var_8_16, "story_v_out_110111", "110111002", "story_v_out_110111.awb")
			end
		end
	end,
	Play110111003 = function(arg_9_0, arg_9_1)
		arg_9_1.time_ = 0
		arg_9_1.frameCnt_ = 0
		arg_9_1.state_ = "playing"
		arg_9_1.curTalkId_ = 110111003
		arg_9_1.duration_ = 5.243999999999

		SetActive(arg_9_1.tipsGo_, false)

		function arg_9_1.onSingleLineFinish_()
			arg_9_1.onSingleLineUpdate_ = nil
			arg_9_1.onSingleLineFinish_ = nil
			arg_9_1.state_ = "waiting"
		end

		function arg_9_1.playNext_(arg_11_0)
			if arg_11_0 == 1 then
				arg_9_0:Play110111004(arg_9_1)
			end
		end

		function arg_9_1.onSingleLineUpdate_(arg_12_0)
			local var_12_0 = 0

			if var_12_0 < arg_9_1.time_ and arg_9_1.time_ <= var_12_0 + arg_12_0 then
				arg_9_1.var_.oldValueTypewriter = arg_9_1.fswtw_.percent

				arg_9_1:ShowNextGo(false)
			end

			local var_12_1 = 31
			local var_12_2 = 2.06666666666667
			local var_12_3 = arg_9_1:GetWordFromCfg(110111001)
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

			local var_12_8 = 2.06666666666667
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
			local var_12_12 = 5.244
			local var_12_13 = manager.audio:GetVoiceLength("story_v_out_110111", "110111003", "story_v_out_110111.awb") / 1000

			if var_12_13 > 0 and var_12_12 < var_12_13 and var_12_13 + var_12_11 > arg_9_1.duration_ then
				local var_12_14 = var_12_13

				arg_9_1.duration_ = var_12_13 + var_12_11
			end

			if var_12_11 < arg_9_1.time_ and arg_9_1.time_ <= var_12_11 + arg_12_0 then
				local var_12_15 = "play"
				local var_12_16 = "voice"

				arg_9_1:AudioAction(var_12_15, var_12_16, "story_v_out_110111", "110111003", "story_v_out_110111.awb")
			end
		end
	end,
	Play110111004 = function(arg_13_0, arg_13_1)
		arg_13_1.time_ = 0
		arg_13_1.frameCnt_ = 0
		arg_13_1.state_ = "playing"
		arg_13_1.curTalkId_ = 110111004
		arg_13_1.duration_ = 0.799999999999

		SetActive(arg_13_1.tipsGo_, false)

		function arg_13_1.onSingleLineFinish_()
			arg_13_1.onSingleLineUpdate_ = nil
			arg_13_1.onSingleLineFinish_ = nil
			arg_13_1.state_ = "waiting"
		end

		function arg_13_1.playNext_(arg_15_0)
			if arg_15_0 == 1 then
				arg_13_0:Play110111005(arg_13_1)
			end
		end

		function arg_13_1.onSingleLineUpdate_(arg_16_0)
			local var_16_0 = 0

			if var_16_0 < arg_13_1.time_ and arg_13_1.time_ <= var_16_0 + arg_16_0 then
				arg_13_1.var_.oldValueTypewriter = arg_13_1.fswtw_.percent

				arg_13_1:ShowNextGo(false)
			end

			local var_16_1 = 9
			local var_16_2 = 0.6
			local var_16_3 = arg_13_1:GetWordFromCfg(110111001)
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

			local var_16_8 = 0.6
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
		end
	end,
	Play110111005 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 110111005
		arg_17_1.duration_ = 3.905999999999

		SetActive(arg_17_1.tipsGo_, false)

		function arg_17_1.onSingleLineFinish_()
			arg_17_1.onSingleLineUpdate_ = nil
			arg_17_1.onSingleLineFinish_ = nil
			arg_17_1.state_ = "waiting"
		end

		function arg_17_1.playNext_(arg_19_0)
			if arg_19_0 == 1 then
				arg_17_0:Play110111006(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = 0

			if var_20_0 < arg_17_1.time_ and arg_17_1.time_ <= var_20_0 + arg_20_0 then
				arg_17_1.var_.oldValueTypewriter = arg_17_1.fswtw_.percent

				arg_17_1:ShowNextGo(false)
			end

			local var_20_1 = 18
			local var_20_2 = 1.2
			local var_20_3 = arg_17_1:GetWordFromCfg(110111001)
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

			local var_20_8 = 1.2
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

			local var_20_11 = 0
			local var_20_12 = 3.906
			local var_20_13 = manager.audio:GetVoiceLength("story_v_out_110111", "110111005", "story_v_out_110111.awb") / 1000

			if var_20_13 > 0 and var_20_12 < var_20_13 and var_20_13 + var_20_11 > arg_17_1.duration_ then
				local var_20_14 = var_20_13

				arg_17_1.duration_ = var_20_13 + var_20_11
			end

			if var_20_11 < arg_17_1.time_ and arg_17_1.time_ <= var_20_11 + arg_20_0 then
				local var_20_15 = "play"
				local var_20_16 = "voice"

				arg_17_1:AudioAction(var_20_15, var_20_16, "story_v_out_110111", "110111005", "story_v_out_110111.awb")
			end
		end
	end,
	Play110111006 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 110111006
		arg_21_1.duration_ = 5.465999999999

		SetActive(arg_21_1.tipsGo_, false)

		function arg_21_1.onSingleLineFinish_()
			arg_21_1.onSingleLineUpdate_ = nil
			arg_21_1.onSingleLineFinish_ = nil
			arg_21_1.state_ = "waiting"
		end

		function arg_21_1.playNext_(arg_23_0)
			if arg_23_0 == 1 then
				arg_21_0:Play110111007(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = 0

			if var_24_0 < arg_21_1.time_ and arg_21_1.time_ <= var_24_0 + arg_24_0 then
				arg_21_1.var_.oldValueTypewriter = arg_21_1.fswtw_.percent

				arg_21_1:ShowNextGo(false)
			end

			local var_24_1 = 34
			local var_24_2 = 2.26666666666667
			local var_24_3 = arg_21_1:GetWordFromCfg(110111001)
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

			local var_24_8 = 2.26666666666667
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
			local var_24_12 = 5.466
			local var_24_13 = manager.audio:GetVoiceLength("story_v_out_110111", "110111006", "story_v_out_110111.awb") / 1000

			if var_24_13 > 0 and var_24_12 < var_24_13 and var_24_13 + var_24_11 > arg_21_1.duration_ then
				local var_24_14 = var_24_13

				arg_21_1.duration_ = var_24_13 + var_24_11
			end

			if var_24_11 < arg_21_1.time_ and arg_21_1.time_ <= var_24_11 + arg_24_0 then
				local var_24_15 = "play"
				local var_24_16 = "voice"

				arg_21_1:AudioAction(var_24_15, var_24_16, "story_v_out_110111", "110111006", "story_v_out_110111.awb")
			end
		end
	end,
	Play110111007 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 110111007
		arg_25_1.duration_ = 1.242999999999

		SetActive(arg_25_1.tipsGo_, false)

		function arg_25_1.onSingleLineFinish_()
			arg_25_1.onSingleLineUpdate_ = nil
			arg_25_1.onSingleLineFinish_ = nil
			arg_25_1.state_ = "waiting"
		end

		function arg_25_1.playNext_(arg_27_0)
			if arg_27_0 == 1 then
				arg_25_0:Play110111008(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = 0

			if var_28_0 < arg_25_1.time_ and arg_25_1.time_ <= var_28_0 + arg_28_0 then
				arg_25_1.fswbg_:SetActive(true)
				arg_25_1.dialog_:SetActive(false)

				arg_25_1.fswtw_.percent = 0

				local var_28_1 = arg_25_1:GetWordFromCfg(110111007)
				local var_28_2 = arg_25_1:FormatText(var_28_1.content)

				arg_25_1.fswt_.text = var_28_2

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.fswt_)

				arg_25_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_25_1.fswtw_:SetDirty()

				arg_25_1.typewritterCharCountI18N = 0

				arg_25_1:ShowNextGo(false)
			end

			local var_28_3 = 0.0166666666666667

			if var_28_3 < arg_25_1.time_ and arg_25_1.time_ <= var_28_3 + arg_28_0 then
				arg_25_1.var_.oldValueTypewriter = arg_25_1.fswtw_.percent

				arg_25_1:ShowNextGo(false)
			end

			local var_28_4 = 14
			local var_28_5 = 0.933333333333333
			local var_28_6 = arg_25_1:GetWordFromCfg(110111007)
			local var_28_7 = arg_25_1:FormatText(var_28_6.content)
			local var_28_8, var_28_9 = arg_25_1:GetPercentByPara(var_28_7, 1)

			if var_28_3 < arg_25_1.time_ and arg_25_1.time_ <= var_28_3 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0

				local var_28_10 = var_28_4 <= 0 and var_28_5 or var_28_5 * ((var_28_9 - arg_25_1.typewritterCharCountI18N) / var_28_4)

				if var_28_10 > 0 and var_28_5 < var_28_10 then
					arg_25_1.talkMaxDuration = var_28_10

					if var_28_10 + var_28_3 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_10 + var_28_3
					end
				end
			end

			local var_28_11 = 0.933333333333333
			local var_28_12 = math.max(var_28_11, arg_25_1.talkMaxDuration)

			if var_28_3 <= arg_25_1.time_ and arg_25_1.time_ < var_28_3 + var_28_12 then
				local var_28_13 = (arg_25_1.time_ - var_28_3) / var_28_12

				arg_25_1.fswtw_.percent = Mathf.Lerp(arg_25_1.var_.oldValueTypewriter, var_28_8, var_28_13)
				arg_25_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_25_1.fswtw_:SetDirty()
			end

			if arg_25_1.time_ >= var_28_3 + var_28_12 and arg_25_1.time_ < var_28_3 + var_28_12 + arg_28_0 then
				arg_25_1.fswtw_.percent = var_28_8

				arg_25_1.fswtw_:SetDirty()
				arg_25_1:ShowNextGo(true)

				arg_25_1.typewritterCharCountI18N = var_28_9
			end

			local var_28_14 = 0
			local var_28_15 = 1.243
			local var_28_16 = manager.audio:GetVoiceLength("story_v_out_110111", "110111007", "story_v_out_110111.awb") / 1000

			if var_28_16 > 0 and var_28_15 < var_28_16 and var_28_16 + var_28_14 > arg_25_1.duration_ then
				local var_28_17 = var_28_16

				arg_25_1.duration_ = var_28_16 + var_28_14
			end

			if var_28_14 < arg_25_1.time_ and arg_25_1.time_ <= var_28_14 + arg_28_0 then
				local var_28_18 = "play"
				local var_28_19 = "voice"

				arg_25_1:AudioAction(var_28_18, var_28_19, "story_v_out_110111", "110111007", "story_v_out_110111.awb")
			end
		end
	end,
	Play110111008 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 110111008
		arg_29_1.duration_ = 8.665999999999

		SetActive(arg_29_1.tipsGo_, false)

		function arg_29_1.onSingleLineFinish_()
			arg_29_1.onSingleLineUpdate_ = nil
			arg_29_1.onSingleLineFinish_ = nil
			arg_29_1.state_ = "waiting"
		end

		function arg_29_1.playNext_(arg_31_0)
			if arg_31_0 == 1 then
				arg_29_0:Play110111009(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = 0

			if var_32_0 < arg_29_1.time_ and arg_29_1.time_ <= var_32_0 + arg_32_0 then
				arg_29_1.var_.oldValueTypewriter = arg_29_1.fswtw_.percent

				arg_29_1:ShowNextGo(false)
			end

			local var_32_1 = 45
			local var_32_2 = 3
			local var_32_3 = arg_29_1:GetWordFromCfg(110111007)
			local var_32_4 = arg_29_1:FormatText(var_32_3.content)
			local var_32_5, var_32_6 = arg_29_1:GetPercentByPara(var_32_4, 2)

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

			local var_32_8 = 3
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
			local var_32_12 = 8.666
			local var_32_13 = manager.audio:GetVoiceLength("story_v_out_110111", "110111008", "story_v_out_110111.awb") / 1000

			if var_32_13 > 0 and var_32_12 < var_32_13 and var_32_13 + var_32_11 > arg_29_1.duration_ then
				local var_32_14 = var_32_13

				arg_29_1.duration_ = var_32_13 + var_32_11
			end

			if var_32_11 < arg_29_1.time_ and arg_29_1.time_ <= var_32_11 + arg_32_0 then
				local var_32_15 = "play"
				local var_32_16 = "voice"

				arg_29_1:AudioAction(var_32_15, var_32_16, "story_v_out_110111", "110111008", "story_v_out_110111.awb")
			end
		end
	end,
	Play110111009 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 110111009
		arg_33_1.duration_ = 5.122999999999

		SetActive(arg_33_1.tipsGo_, false)

		function arg_33_1.onSingleLineFinish_()
			arg_33_1.onSingleLineUpdate_ = nil
			arg_33_1.onSingleLineFinish_ = nil
			arg_33_1.state_ = "waiting"
		end

		function arg_33_1.playNext_(arg_35_0)
			if arg_35_0 == 1 then
				arg_33_0:Play110111010(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = 2.5

			if var_36_0 < arg_33_1.time_ and arg_33_1.time_ <= var_36_0 + arg_36_0 then
				arg_33_1.var_.oldValueTypewriter = arg_33_1.fswtw_.percent

				arg_33_1:ShowNextGo(false)
			end

			local var_36_1 = 19
			local var_36_2 = 1.26666666666667
			local var_36_3 = arg_33_1:GetWordFromCfg(110111007)
			local var_36_4 = arg_33_1:FormatText(var_36_3.content)
			local var_36_5, var_36_6 = arg_33_1:GetPercentByPara(var_36_4, 3)

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

			local var_36_8 = 1.26666666666667
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

			local var_36_11 = "OS0106"

			if arg_33_1.bgs_[var_36_11] == nil then
				local var_36_12 = Object.Instantiate(arg_33_1.paintGo_)

				var_36_12:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_36_11)
				var_36_12.name = var_36_11
				var_36_12.transform.parent = arg_33_1.stage_.transform
				var_36_12.transform.localPosition = Vector3.New(0, 100, 0)
				arg_33_1.bgs_[var_36_11] = var_36_12
			end

			local var_36_13 = 0.5

			if var_36_13 < arg_33_1.time_ and arg_33_1.time_ <= var_36_13 + arg_36_0 then
				local var_36_14 = manager.ui.mainCamera.transform.localPosition
				local var_36_15 = Vector3.New(0, 0, 10) + Vector3.New(var_36_14.x, var_36_14.y, 0)
				local var_36_16 = arg_33_1.bgs_.OS0106

				var_36_16.transform.localPosition = var_36_15
				var_36_16.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_36_17 = var_36_16:GetComponent("SpriteRenderer")

				if var_36_17 and var_36_17.sprite then
					local var_36_18 = (var_36_16.transform.localPosition - var_36_14).z
					local var_36_19 = manager.ui.mainCameraCom_
					local var_36_20 = 2 * var_36_18 * Mathf.Tan(var_36_19.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_36_21 = var_36_20 * var_36_19.aspect
					local var_36_22 = var_36_17.sprite.bounds.size.x
					local var_36_23 = var_36_17.sprite.bounds.size.y
					local var_36_24 = var_36_21 / var_36_22
					local var_36_25 = var_36_20 / var_36_23
					local var_36_26 = var_36_25 < var_36_24 and var_36_24 or var_36_25

					var_36_16.transform.localScale = Vector3.New(var_36_26, var_36_26, 0)
				end

				for iter_36_0, iter_36_1 in pairs(arg_33_1.bgs_) do
					if iter_36_0 ~= "OS0106" then
						iter_36_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_36_27 = arg_33_1.bgs_.OS0106
			local var_36_28 = 0.5

			if var_36_28 < arg_33_1.time_ and arg_33_1.time_ <= var_36_28 + arg_36_0 then
				local var_36_29 = var_36_27:GetComponent("SpriteRenderer")

				if var_36_29 then
					var_36_29.material = arg_33_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_36_30 = var_36_29.material
					local var_36_31 = var_36_30:GetColor("_Color")

					arg_33_1.var_.alphaOldValueOS0106 = var_36_31.a
					arg_33_1.var_.alphaMatValueOS0106 = var_36_30
				end

				arg_33_1.var_.alphaOldValueOS0106 = 0
			end

			local var_36_32 = 1.5

			if var_36_28 <= arg_33_1.time_ and arg_33_1.time_ < var_36_28 + var_36_32 then
				local var_36_33 = (arg_33_1.time_ - var_36_28) / var_36_32
				local var_36_34 = Mathf.Lerp(arg_33_1.var_.alphaOldValueOS0106, 1, var_36_33)

				if arg_33_1.var_.alphaMatValueOS0106 then
					local var_36_35 = arg_33_1.var_.alphaMatValueOS0106
					local var_36_36 = var_36_35:GetColor("_Color")

					var_36_36.a = var_36_34

					var_36_35:SetColor("_Color", var_36_36)
				end
			end

			if arg_33_1.time_ >= var_36_28 + var_36_32 and arg_33_1.time_ < var_36_28 + var_36_32 + arg_36_0 and arg_33_1.var_.alphaMatValueOS0106 then
				local var_36_37 = arg_33_1.var_.alphaMatValueOS0106
				local var_36_38 = var_36_37:GetColor("_Color")

				var_36_38.a = 1

				var_36_37:SetColor("_Color", var_36_38)
			end

			local var_36_39 = 2.5
			local var_36_40 = 2.623
			local var_36_41 = manager.audio:GetVoiceLength("story_v_out_110111", "110111009", "story_v_out_110111.awb") / 1000

			if var_36_41 > 0 and var_36_40 < var_36_41 and var_36_41 + var_36_39 > arg_33_1.duration_ then
				local var_36_42 = var_36_41

				arg_33_1.duration_ = var_36_41 + var_36_39
			end

			if var_36_39 < arg_33_1.time_ and arg_33_1.time_ <= var_36_39 + arg_36_0 then
				local var_36_43 = "play"
				local var_36_44 = "voice"

				arg_33_1:AudioAction(var_36_43, var_36_44, "story_v_out_110111", "110111009", "story_v_out_110111.awb")
			end
		end
	end,
	Play110111010 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 110111010
		arg_37_1.duration_ = 10.236999999999

		SetActive(arg_37_1.tipsGo_, false)

		function arg_37_1.onSingleLineFinish_()
			arg_37_1.onSingleLineUpdate_ = nil
			arg_37_1.onSingleLineFinish_ = nil
			arg_37_1.state_ = "waiting"
		end

		function arg_37_1.playNext_(arg_39_0)
			if arg_39_0 == 1 then
				arg_37_0:Play110111011(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = 0

			if var_40_0 < arg_37_1.time_ and arg_37_1.time_ <= var_40_0 + arg_40_0 then
				arg_37_1.var_.oldValueTypewriter = arg_37_1.fswtw_.percent

				arg_37_1:ShowNextGo(false)
			end

			local var_40_1 = 39
			local var_40_2 = 2.6
			local var_40_3 = arg_37_1:GetWordFromCfg(110111007)
			local var_40_4 = arg_37_1:FormatText(var_40_3.content)
			local var_40_5, var_40_6 = arg_37_1:GetPercentByPara(var_40_4, 4)

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

			local var_40_8 = 2.6
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
			local var_40_12 = 10.237
			local var_40_13 = manager.audio:GetVoiceLength("story_v_out_110111", "110111010", "story_v_out_110111.awb") / 1000

			if var_40_13 > 0 and var_40_12 < var_40_13 and var_40_13 + var_40_11 > arg_37_1.duration_ then
				local var_40_14 = var_40_13

				arg_37_1.duration_ = var_40_13 + var_40_11
			end

			if var_40_11 < arg_37_1.time_ and arg_37_1.time_ <= var_40_11 + arg_40_0 then
				local var_40_15 = "play"
				local var_40_16 = "voice"

				arg_37_1:AudioAction(var_40_15, var_40_16, "story_v_out_110111", "110111010", "story_v_out_110111.awb")
			end
		end
	end,
	Play110111011 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 110111011
		arg_41_1.duration_ = 4.455999999999

		SetActive(arg_41_1.tipsGo_, false)

		function arg_41_1.onSingleLineFinish_()
			arg_41_1.onSingleLineUpdate_ = nil
			arg_41_1.onSingleLineFinish_ = nil
			arg_41_1.state_ = "waiting"
		end

		function arg_41_1.playNext_(arg_43_0)
			if arg_43_0 == 1 then
				arg_41_0:Play110111012(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = 0

			if var_44_0 < arg_41_1.time_ and arg_41_1.time_ <= var_44_0 + arg_44_0 then
				arg_41_1.var_.oldValueTypewriter = arg_41_1.fswtw_.percent

				arg_41_1:ShowNextGo(false)
			end

			local var_44_1 = 25
			local var_44_2 = 1.66666666666667
			local var_44_3 = arg_41_1:GetWordFromCfg(110111007)
			local var_44_4 = arg_41_1:FormatText(var_44_3.content)
			local var_44_5, var_44_6 = arg_41_1:GetPercentByPara(var_44_4, 5)

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

			local var_44_8 = 1.66666666666667
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
			local var_44_12 = 4.456
			local var_44_13 = manager.audio:GetVoiceLength("story_v_out_110111", "110111011", "story_v_out_110111.awb") / 1000

			if var_44_13 > 0 and var_44_12 < var_44_13 and var_44_13 + var_44_11 > arg_41_1.duration_ then
				local var_44_14 = var_44_13

				arg_41_1.duration_ = var_44_13 + var_44_11
			end

			if var_44_11 < arg_41_1.time_ and arg_41_1.time_ <= var_44_11 + arg_44_0 then
				local var_44_15 = "play"
				local var_44_16 = "voice"

				arg_41_1:AudioAction(var_44_15, var_44_16, "story_v_out_110111", "110111011", "story_v_out_110111.awb")
			end
		end
	end,
	Play110111012 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 110111012
		arg_45_1.duration_ = 8.325999999999

		SetActive(arg_45_1.tipsGo_, false)

		function arg_45_1.onSingleLineFinish_()
			arg_45_1.onSingleLineUpdate_ = nil
			arg_45_1.onSingleLineFinish_ = nil
			arg_45_1.state_ = "waiting"
		end

		function arg_45_1.playNext_(arg_47_0)
			if arg_47_0 == 1 then
				arg_45_0:Play110111013(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = 0

			if var_48_0 < arg_45_1.time_ and arg_45_1.time_ <= var_48_0 + arg_48_0 then
				arg_45_1.var_.oldValueTypewriter = arg_45_1.fswtw_.percent

				arg_45_1:ShowNextGo(false)
			end

			local var_48_1 = 41
			local var_48_2 = 2.73333333333333
			local var_48_3 = arg_45_1:GetWordFromCfg(110111007)
			local var_48_4 = arg_45_1:FormatText(var_48_3.content)
			local var_48_5, var_48_6 = arg_45_1:GetPercentByPara(var_48_4, 6)

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

			local var_48_8 = 2.73333333333333
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
			local var_48_12 = 8.326
			local var_48_13 = manager.audio:GetVoiceLength("story_v_out_110111", "110111012", "story_v_out_110111.awb") / 1000

			if var_48_13 > 0 and var_48_12 < var_48_13 and var_48_13 + var_48_11 > arg_45_1.duration_ then
				local var_48_14 = var_48_13

				arg_45_1.duration_ = var_48_13 + var_48_11
			end

			if var_48_11 < arg_45_1.time_ and arg_45_1.time_ <= var_48_11 + arg_48_0 then
				local var_48_15 = "play"
				local var_48_16 = "voice"

				arg_45_1:AudioAction(var_48_15, var_48_16, "story_v_out_110111", "110111012", "story_v_out_110111.awb")
			end
		end
	end,
	Play110111013 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 110111013
		arg_49_1.duration_ = 0.799999999999

		SetActive(arg_49_1.tipsGo_, false)

		function arg_49_1.onSingleLineFinish_()
			arg_49_1.onSingleLineUpdate_ = nil
			arg_49_1.onSingleLineFinish_ = nil
			arg_49_1.state_ = "waiting"
		end

		function arg_49_1.playNext_(arg_51_0)
			if arg_51_0 == 1 then
				arg_49_0:Play110111014(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = 0

			if var_52_0 < arg_49_1.time_ and arg_49_1.time_ <= var_52_0 + arg_52_0 then
				arg_49_1.fswbg_:SetActive(true)
				arg_49_1.dialog_:SetActive(false)

				arg_49_1.fswtw_.percent = 0

				local var_52_1 = arg_49_1:GetWordFromCfg(110111013)
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

			local var_52_4 = 9
			local var_52_5 = 0.6
			local var_52_6 = arg_49_1:GetWordFromCfg(110111013)
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

			local var_52_11 = 0.6
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
	Play110111014 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 110111014
		arg_53_1.duration_ = 9.963999999999

		SetActive(arg_53_1.tipsGo_, false)

		function arg_53_1.onSingleLineFinish_()
			arg_53_1.onSingleLineUpdate_ = nil
			arg_53_1.onSingleLineFinish_ = nil
			arg_53_1.state_ = "waiting"
		end

		function arg_53_1.playNext_(arg_55_0)
			if arg_55_0 == 1 then
				arg_53_0:Play110111015(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = 0

			if var_56_0 < arg_53_1.time_ and arg_53_1.time_ <= var_56_0 + arg_56_0 then
				arg_53_1.var_.oldValueTypewriter = arg_53_1.fswtw_.percent

				arg_53_1:ShowNextGo(false)
			end

			local var_56_1 = 52
			local var_56_2 = 3.46666666666667
			local var_56_3 = arg_53_1:GetWordFromCfg(110111013)
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

			local var_56_8 = 3.46666666666667
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
			local var_56_12 = 9.964
			local var_56_13 = manager.audio:GetVoiceLength("story_v_out_110111", "110111014", "story_v_out_110111.awb") / 1000

			if var_56_13 > 0 and var_56_12 < var_56_13 and var_56_13 + var_56_11 > arg_53_1.duration_ then
				local var_56_14 = var_56_13

				arg_53_1.duration_ = var_56_13 + var_56_11
			end

			if var_56_11 < arg_53_1.time_ and arg_53_1.time_ <= var_56_11 + arg_56_0 then
				local var_56_15 = "play"
				local var_56_16 = "voice"

				arg_53_1:AudioAction(var_56_15, var_56_16, "story_v_out_110111", "110111014", "story_v_out_110111.awb")
			end
		end
	end,
	Play110111015 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 110111015
		arg_57_1.duration_ = 8.857999999999

		SetActive(arg_57_1.tipsGo_, false)

		function arg_57_1.onSingleLineFinish_()
			arg_57_1.onSingleLineUpdate_ = nil
			arg_57_1.onSingleLineFinish_ = nil
			arg_57_1.state_ = "waiting"
		end

		function arg_57_1.playNext_(arg_59_0)
			if arg_59_0 == 1 then
				arg_57_0:Play110111016(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = 0

			if var_60_0 < arg_57_1.time_ and arg_57_1.time_ <= var_60_0 + arg_60_0 then
				arg_57_1.var_.oldValueTypewriter = arg_57_1.fswtw_.percent

				arg_57_1:ShowNextGo(false)
			end

			local var_60_1 = 39
			local var_60_2 = 2.6
			local var_60_3 = arg_57_1:GetWordFromCfg(110111013)
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

			local var_60_8 = 2.6
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

			local var_60_11 = 0
			local var_60_12 = 8.858
			local var_60_13 = manager.audio:GetVoiceLength("story_v_out_110111", "110111015", "story_v_out_110111.awb") / 1000

			if var_60_13 > 0 and var_60_12 < var_60_13 and var_60_13 + var_60_11 > arg_57_1.duration_ then
				local var_60_14 = var_60_13

				arg_57_1.duration_ = var_60_13 + var_60_11
			end

			if var_60_11 < arg_57_1.time_ and arg_57_1.time_ <= var_60_11 + arg_60_0 then
				local var_60_15 = "play"
				local var_60_16 = "voice"

				arg_57_1:AudioAction(var_60_15, var_60_16, "story_v_out_110111", "110111015", "story_v_out_110111.awb")
			end
		end
	end,
	Play110111016 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 110111016
		arg_61_1.duration_ = 14.132999999999

		SetActive(arg_61_1.tipsGo_, false)

		function arg_61_1.onSingleLineFinish_()
			arg_61_1.onSingleLineUpdate_ = nil
			arg_61_1.onSingleLineFinish_ = nil
			arg_61_1.state_ = "waiting"
		end

		function arg_61_1.playNext_(arg_63_0)
			if arg_63_0 == 1 then
				arg_61_0:Play110111017(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = 0

			if var_64_0 < arg_61_1.time_ and arg_61_1.time_ <= var_64_0 + arg_64_0 then
				arg_61_1.var_.oldValueTypewriter = arg_61_1.fswtw_.percent

				arg_61_1:ShowNextGo(false)
			end

			local var_64_1 = 59
			local var_64_2 = 3.93333333333333
			local var_64_3 = arg_61_1:GetWordFromCfg(110111013)
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

			local var_64_8 = 3.93333333333333
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

			local var_64_11 = 0
			local var_64_12 = 14.133
			local var_64_13 = manager.audio:GetVoiceLength("story_v_out_110111", "110111016", "story_v_out_110111.awb") / 1000

			if var_64_13 > 0 and var_64_12 < var_64_13 and var_64_13 + var_64_11 > arg_61_1.duration_ then
				local var_64_14 = var_64_13

				arg_61_1.duration_ = var_64_13 + var_64_11
			end

			if var_64_11 < arg_61_1.time_ and arg_61_1.time_ <= var_64_11 + arg_64_0 then
				local var_64_15 = "play"
				local var_64_16 = "voice"

				arg_61_1:AudioAction(var_64_15, var_64_16, "story_v_out_110111", "110111016", "story_v_out_110111.awb")
			end
		end
	end,
	Play110111017 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 110111017
		arg_65_1.duration_ = 2.811999999999

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play110111018(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = 0

			if var_68_0 < arg_65_1.time_ and arg_65_1.time_ <= var_68_0 + arg_68_0 then
				arg_65_1.var_.oldValueTypewriter = arg_65_1.fswtw_.percent

				arg_65_1:ShowNextGo(false)
			end

			local var_68_1 = 19
			local var_68_2 = 1.26666666666667
			local var_68_3 = arg_65_1:GetWordFromCfg(110111013)
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

			local var_68_8 = 1.26666666666667
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

			local var_68_11 = 0
			local var_68_12 = 2.812
			local var_68_13 = manager.audio:GetVoiceLength("story_v_out_110111", "110111017", "story_v_out_110111.awb") / 1000

			if var_68_13 > 0 and var_68_12 < var_68_13 and var_68_13 + var_68_11 > arg_65_1.duration_ then
				local var_68_14 = var_68_13

				arg_65_1.duration_ = var_68_13 + var_68_11
			end

			if var_68_11 < arg_65_1.time_ and arg_65_1.time_ <= var_68_11 + arg_68_0 then
				local var_68_15 = "play"
				local var_68_16 = "voice"

				arg_65_1:AudioAction(var_68_15, var_68_16, "story_v_out_110111", "110111017", "story_v_out_110111.awb")
			end
		end
	end,
	Play110111018 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 110111018
		arg_69_1.duration_ = 5.983999999999

		SetActive(arg_69_1.tipsGo_, false)

		function arg_69_1.onSingleLineFinish_()
			arg_69_1.onSingleLineUpdate_ = nil
			arg_69_1.onSingleLineFinish_ = nil
			arg_69_1.state_ = "waiting"
			arg_69_1.auto_ = false
		end

		function arg_69_1.playNext_(arg_71_0)
			arg_69_1.onStoryFinished_()
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = 0

			if var_72_0 < arg_69_1.time_ and arg_69_1.time_ <= var_72_0 + arg_72_0 then
				arg_69_1.var_.oldValueTypewriter = arg_69_1.fswtw_.percent

				arg_69_1:ShowNextGo(false)
			end

			local var_72_1 = 22
			local var_72_2 = 1.46666666666667
			local var_72_3 = arg_69_1:GetWordFromCfg(110111013)
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

			local var_72_8 = 1.46666666666667
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
			local var_72_12 = 5.984
			local var_72_13 = manager.audio:GetVoiceLength("story_v_out_110111", "110111018", "story_v_out_110111.awb") / 1000

			if var_72_13 > 0 and var_72_12 < var_72_13 and var_72_13 + var_72_11 > arg_69_1.duration_ then
				local var_72_14 = var_72_13

				arg_69_1.duration_ = var_72_13 + var_72_11
			end

			if var_72_11 < arg_69_1.time_ and arg_69_1.time_ <= var_72_11 + arg_72_0 then
				local var_72_15 = "play"
				local var_72_16 = "voice"

				arg_69_1:AudioAction(var_72_15, var_72_16, "story_v_out_110111", "110111018", "story_v_out_110111.awb")
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/OS0106"
	},
	voices = {
		"story_v_out_110101.awb",
		"story_v_out_110111.awb"
	}
}
