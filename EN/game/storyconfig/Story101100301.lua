return {
	Play110031001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 110031001
		arg_1_1.duration_ = 4.262999999999

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play110031002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = 0

			if var_4_0 < arg_1_1.time_ and arg_1_1.time_ <= var_4_0 + arg_4_0 then
				arg_1_1.fswbg_:SetActive(true)
				arg_1_1.dialog_:SetActive(false)

				arg_1_1.fswtw_.percent = 0

				local var_4_1 = arg_1_1:GetWordFromCfg(110031001)
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

			local var_4_4 = 24
			local var_4_5 = 1.6
			local var_4_6 = arg_1_1:GetWordFromCfg(110031001)
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
			local var_4_15 = 4.263
			local var_4_16 = manager.audio:GetVoiceLength("story_v_out_110031", "110031001", "story_v_out_110031.awb") / 1000

			if var_4_16 > 0 and var_4_15 < var_4_16 and var_4_16 + var_4_14 > arg_1_1.duration_ then
				local var_4_17 = var_4_16

				arg_1_1.duration_ = var_4_16 + var_4_14
			end

			if var_4_14 < arg_1_1.time_ and arg_1_1.time_ <= var_4_14 + arg_4_0 then
				local var_4_18 = "play"
				local var_4_19 = "voice"

				arg_1_1:AudioAction(var_4_18, var_4_19, "story_v_out_110031", "110031001", "story_v_out_110031.awb")
			end

			local var_4_20 = 0
			local var_4_21 = 0.6

			if var_4_20 < arg_1_1.time_ and arg_1_1.time_ <= var_4_20 + arg_4_0 then
				local var_4_22 = "play"
				local var_4_23 = "music"

				arg_1_1:AudioAction(var_4_22, var_4_23, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_24 = 0.738461699336767
			local var_4_25 = 1

			if var_4_24 < arg_1_1.time_ and arg_1_1.time_ <= var_4_24 + arg_4_0 then
				local var_4_26 = "play"
				local var_4_27 = "music"

				arg_1_1:AudioAction(var_4_26, var_4_27, "bgm_activity_1_0_1_osiris_ui", "bgm_activity_1_0_1_osiris_ui", "bgm_activity_1_0_1_osiris_ui.awb")
			end
		end
	end,
	Play110031002 = function(arg_5_0, arg_5_1)
		arg_5_1.time_ = 0
		arg_5_1.frameCnt_ = 0
		arg_5_1.state_ = "playing"
		arg_5_1.curTalkId_ = 110031002
		arg_5_1.duration_ = 8.640999999999

		SetActive(arg_5_1.tipsGo_, false)

		function arg_5_1.onSingleLineFinish_()
			arg_5_1.onSingleLineUpdate_ = nil
			arg_5_1.onSingleLineFinish_ = nil
			arg_5_1.state_ = "waiting"
		end

		function arg_5_1.playNext_(arg_7_0)
			if arg_7_0 == 1 then
				arg_5_0:Play110031003(arg_5_1)
			end
		end

		function arg_5_1.onSingleLineUpdate_(arg_8_0)
			local var_8_0 = 0

			if var_8_0 < arg_5_1.time_ and arg_5_1.time_ <= var_8_0 + arg_8_0 then
				arg_5_1.var_.oldValueTypewriter = arg_5_1.fswtw_.percent

				arg_5_1:ShowNextGo(false)
			end

			local var_8_1 = 52
			local var_8_2 = 3.26666666666667
			local var_8_3 = arg_5_1:GetWordFromCfg(110031001)
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

			local var_8_8 = 3.26666666666667
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
			local var_8_12 = 8.641
			local var_8_13 = manager.audio:GetVoiceLength("story_v_out_110031", "110031002", "story_v_out_110031.awb") / 1000

			if var_8_13 > 0 and var_8_12 < var_8_13 and var_8_13 + var_8_11 > arg_5_1.duration_ then
				local var_8_14 = var_8_13

				arg_5_1.duration_ = var_8_13 + var_8_11
			end

			if var_8_11 < arg_5_1.time_ and arg_5_1.time_ <= var_8_11 + arg_8_0 then
				local var_8_15 = "play"
				local var_8_16 = "voice"

				arg_5_1:AudioAction(var_8_15, var_8_16, "story_v_out_110031", "110031002", "story_v_out_110031.awb")
			end
		end
	end,
	Play110031003 = function(arg_9_0, arg_9_1)
		arg_9_1.time_ = 0
		arg_9_1.frameCnt_ = 0
		arg_9_1.state_ = "playing"
		arg_9_1.curTalkId_ = 110031003
		arg_9_1.duration_ = 10.555999999999

		SetActive(arg_9_1.tipsGo_, false)

		function arg_9_1.onSingleLineFinish_()
			arg_9_1.onSingleLineUpdate_ = nil
			arg_9_1.onSingleLineFinish_ = nil
			arg_9_1.state_ = "waiting"
		end

		function arg_9_1.playNext_(arg_11_0)
			if arg_11_0 == 1 then
				arg_9_0:Play110031004(arg_9_1)
			end
		end

		function arg_9_1.onSingleLineUpdate_(arg_12_0)
			local var_12_0 = 0

			if var_12_0 < arg_9_1.time_ and arg_9_1.time_ <= var_12_0 + arg_12_0 then
				arg_9_1.var_.oldValueTypewriter = arg_9_1.fswtw_.percent

				arg_9_1:ShowNextGo(false)
			end

			local var_12_1 = 70
			local var_12_2 = 4.66666666666667
			local var_12_3 = arg_9_1:GetWordFromCfg(110031001)
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

			local var_12_8 = 4.66666666666667
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
			local var_12_12 = 10.556
			local var_12_13 = manager.audio:GetVoiceLength("story_v_out_110031", "110031003", "story_v_out_110031.awb") / 1000

			if var_12_13 > 0 and var_12_12 < var_12_13 and var_12_13 + var_12_11 > arg_9_1.duration_ then
				local var_12_14 = var_12_13

				arg_9_1.duration_ = var_12_13 + var_12_11
			end

			if var_12_11 < arg_9_1.time_ and arg_9_1.time_ <= var_12_11 + arg_12_0 then
				local var_12_15 = "play"
				local var_12_16 = "voice"

				arg_9_1:AudioAction(var_12_15, var_12_16, "story_v_out_110031", "110031003", "story_v_out_110031.awb")
			end
		end
	end,
	Play110031004 = function(arg_13_0, arg_13_1)
		arg_13_1.time_ = 0
		arg_13_1.frameCnt_ = 0
		arg_13_1.state_ = "playing"
		arg_13_1.curTalkId_ = 110031004
		arg_13_1.duration_ = 5.555999999999

		SetActive(arg_13_1.tipsGo_, false)

		function arg_13_1.onSingleLineFinish_()
			arg_13_1.onSingleLineUpdate_ = nil
			arg_13_1.onSingleLineFinish_ = nil
			arg_13_1.state_ = "waiting"
		end

		function arg_13_1.playNext_(arg_15_0)
			if arg_15_0 == 1 then
				arg_13_0:Play110031005(arg_13_1)
			end
		end

		function arg_13_1.onSingleLineUpdate_(arg_16_0)
			local var_16_0 = 0

			if var_16_0 < arg_13_1.time_ and arg_13_1.time_ <= var_16_0 + arg_16_0 then
				arg_13_1.var_.oldValueTypewriter = arg_13_1.fswtw_.percent

				arg_13_1:ShowNextGo(false)
			end

			local var_16_1 = 35
			local var_16_2 = 2.33333333333333
			local var_16_3 = arg_13_1:GetWordFromCfg(110031001)
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

			local var_16_8 = 2.33333333333333
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
			local var_16_12 = 5.556
			local var_16_13 = manager.audio:GetVoiceLength("story_v_out_110031", "110031004", "story_v_out_110031.awb") / 1000

			if var_16_13 > 0 and var_16_12 < var_16_13 and var_16_13 + var_16_11 > arg_13_1.duration_ then
				local var_16_14 = var_16_13

				arg_13_1.duration_ = var_16_13 + var_16_11
			end

			if var_16_11 < arg_13_1.time_ and arg_13_1.time_ <= var_16_11 + arg_16_0 then
				local var_16_15 = "play"
				local var_16_16 = "voice"

				arg_13_1:AudioAction(var_16_15, var_16_16, "story_v_out_110031", "110031004", "story_v_out_110031.awb")
			end
		end
	end,
	Play110031005 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 110031005
		arg_17_1.duration_ = 4.857999999999

		SetActive(arg_17_1.tipsGo_, false)

		function arg_17_1.onSingleLineFinish_()
			arg_17_1.onSingleLineUpdate_ = nil
			arg_17_1.onSingleLineFinish_ = nil
			arg_17_1.state_ = "waiting"
		end

		function arg_17_1.playNext_(arg_19_0)
			if arg_19_0 == 1 then
				arg_17_0:Play110031006(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = 0

			if var_20_0 < arg_17_1.time_ and arg_17_1.time_ <= var_20_0 + arg_20_0 then
				arg_17_1.var_.oldValueTypewriter = arg_17_1.fswtw_.percent

				arg_17_1:ShowNextGo(false)
			end

			local var_20_1 = 28
			local var_20_2 = 1.93333333333333
			local var_20_3 = arg_17_1:GetWordFromCfg(110031001)
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

			local var_20_8 = 1.93333333333333
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
			local var_20_12 = 4.858
			local var_20_13 = manager.audio:GetVoiceLength("story_v_out_110031", "110031005", "story_v_out_110031.awb") / 1000

			if var_20_13 > 0 and var_20_12 < var_20_13 and var_20_13 + var_20_11 > arg_17_1.duration_ then
				local var_20_14 = var_20_13

				arg_17_1.duration_ = var_20_13 + var_20_11
			end

			if var_20_11 < arg_17_1.time_ and arg_17_1.time_ <= var_20_11 + arg_20_0 then
				local var_20_15 = "play"
				local var_20_16 = "voice"

				arg_17_1:AudioAction(var_20_15, var_20_16, "story_v_out_110031", "110031005", "story_v_out_110031.awb")
			end
		end
	end,
	Play110031006 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 110031006
		arg_21_1.duration_ = 10.893999999999

		SetActive(arg_21_1.tipsGo_, false)

		function arg_21_1.onSingleLineFinish_()
			arg_21_1.onSingleLineUpdate_ = nil
			arg_21_1.onSingleLineFinish_ = nil
			arg_21_1.state_ = "waiting"
		end

		function arg_21_1.playNext_(arg_23_0)
			if arg_23_0 == 1 then
				arg_21_0:Play110031007(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = 0

			if var_24_0 < arg_21_1.time_ and arg_21_1.time_ <= var_24_0 + arg_24_0 then
				arg_21_1.fswbg_:SetActive(true)
				arg_21_1.dialog_:SetActive(false)

				arg_21_1.fswtw_.percent = 0

				local var_24_1 = arg_21_1:GetWordFromCfg(110031006)
				local var_24_2 = arg_21_1:FormatText(var_24_1.content)

				arg_21_1.fswt_.text = var_24_2

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.fswt_)

				arg_21_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_21_1.fswtw_:SetDirty()

				arg_21_1.typewritterCharCountI18N = 0

				arg_21_1:ShowNextGo(false)
			end

			local var_24_3 = 0.0166666666666667

			if var_24_3 < arg_21_1.time_ and arg_21_1.time_ <= var_24_3 + arg_24_0 then
				arg_21_1.var_.oldValueTypewriter = arg_21_1.fswtw_.percent

				arg_21_1:ShowNextGo(false)
			end

			local var_24_4 = 46
			local var_24_5 = 3.06666666666667
			local var_24_6 = arg_21_1:GetWordFromCfg(110031006)
			local var_24_7 = arg_21_1:FormatText(var_24_6.content)
			local var_24_8, var_24_9 = arg_21_1:GetPercentByPara(var_24_7, 1)

			if var_24_3 < arg_21_1.time_ and arg_21_1.time_ <= var_24_3 + arg_24_0 then
				arg_21_1.talkMaxDuration = 0

				local var_24_10 = var_24_4 <= 0 and var_24_5 or var_24_5 * ((var_24_9 - arg_21_1.typewritterCharCountI18N) / var_24_4)

				if var_24_10 > 0 and var_24_5 < var_24_10 then
					arg_21_1.talkMaxDuration = var_24_10

					if var_24_10 + var_24_3 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_10 + var_24_3
					end
				end
			end

			local var_24_11 = 3.06666666666667
			local var_24_12 = math.max(var_24_11, arg_21_1.talkMaxDuration)

			if var_24_3 <= arg_21_1.time_ and arg_21_1.time_ < var_24_3 + var_24_12 then
				local var_24_13 = (arg_21_1.time_ - var_24_3) / var_24_12

				arg_21_1.fswtw_.percent = Mathf.Lerp(arg_21_1.var_.oldValueTypewriter, var_24_8, var_24_13)
				arg_21_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_21_1.fswtw_:SetDirty()
			end

			if arg_21_1.time_ >= var_24_3 + var_24_12 and arg_21_1.time_ < var_24_3 + var_24_12 + arg_24_0 then
				arg_21_1.fswtw_.percent = var_24_8

				arg_21_1.fswtw_:SetDirty()
				arg_21_1:ShowNextGo(true)

				arg_21_1.typewritterCharCountI18N = var_24_9
			end

			local var_24_14 = 0
			local var_24_15 = 10.894
			local var_24_16 = manager.audio:GetVoiceLength("story_v_out_110031", "110031006", "story_v_out_110031.awb") / 1000

			if var_24_16 > 0 and var_24_15 < var_24_16 and var_24_16 + var_24_14 > arg_21_1.duration_ then
				local var_24_17 = var_24_16

				arg_21_1.duration_ = var_24_16 + var_24_14
			end

			if var_24_14 < arg_21_1.time_ and arg_21_1.time_ <= var_24_14 + arg_24_0 then
				local var_24_18 = "play"
				local var_24_19 = "voice"

				arg_21_1:AudioAction(var_24_18, var_24_19, "story_v_out_110031", "110031006", "story_v_out_110031.awb")
			end
		end
	end,
	Play110031007 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 110031007
		arg_25_1.duration_ = 4.207999999999

		SetActive(arg_25_1.tipsGo_, false)

		function arg_25_1.onSingleLineFinish_()
			arg_25_1.onSingleLineUpdate_ = nil
			arg_25_1.onSingleLineFinish_ = nil
			arg_25_1.state_ = "waiting"
		end

		function arg_25_1.playNext_(arg_27_0)
			if arg_27_0 == 1 then
				arg_25_0:Play110031008(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = 0

			if var_28_0 < arg_25_1.time_ and arg_25_1.time_ <= var_28_0 + arg_28_0 then
				arg_25_1.var_.oldValueTypewriter = arg_25_1.fswtw_.percent

				arg_25_1:ShowNextGo(false)
			end

			local var_28_1 = 25
			local var_28_2 = 1.66666666666667
			local var_28_3 = arg_25_1:GetWordFromCfg(110031006)
			local var_28_4 = arg_25_1:FormatText(var_28_3.content)
			local var_28_5, var_28_6 = arg_25_1:GetPercentByPara(var_28_4, 2)

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

			local var_28_8 = 1.66666666666667
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
			local var_28_12 = 4.208
			local var_28_13 = manager.audio:GetVoiceLength("story_v_out_110031", "110031007", "story_v_out_110031.awb") / 1000

			if var_28_13 > 0 and var_28_12 < var_28_13 and var_28_13 + var_28_11 > arg_25_1.duration_ then
				local var_28_14 = var_28_13

				arg_25_1.duration_ = var_28_13 + var_28_11
			end

			if var_28_11 < arg_25_1.time_ and arg_25_1.time_ <= var_28_11 + arg_28_0 then
				local var_28_15 = "play"
				local var_28_16 = "voice"

				arg_25_1:AudioAction(var_28_15, var_28_16, "story_v_out_110031", "110031007", "story_v_out_110031.awb")
			end
		end
	end,
	Play110031008 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 110031008
		arg_29_1.duration_ = 14.095999999999

		SetActive(arg_29_1.tipsGo_, false)

		function arg_29_1.onSingleLineFinish_()
			arg_29_1.onSingleLineUpdate_ = nil
			arg_29_1.onSingleLineFinish_ = nil
			arg_29_1.state_ = "waiting"
		end

		function arg_29_1.playNext_(arg_31_0)
			if arg_31_0 == 1 then
				arg_29_0:Play110031009(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = 0

			if var_32_0 < arg_29_1.time_ and arg_29_1.time_ <= var_32_0 + arg_32_0 then
				arg_29_1.var_.oldValueTypewriter = arg_29_1.fswtw_.percent

				arg_29_1:ShowNextGo(false)
			end

			local var_32_1 = 62
			local var_32_2 = 4.13333333333333
			local var_32_3 = arg_29_1:GetWordFromCfg(110031006)
			local var_32_4 = arg_29_1:FormatText(var_32_3.content)
			local var_32_5, var_32_6 = arg_29_1:GetPercentByPara(var_32_4, 3)

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

			local var_32_8 = 4.13333333333333
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
			local var_32_12 = 14.096
			local var_32_13 = manager.audio:GetVoiceLength("story_v_out_110031", "110031008", "story_v_out_110031.awb") / 1000

			if var_32_13 > 0 and var_32_12 < var_32_13 and var_32_13 + var_32_11 > arg_29_1.duration_ then
				local var_32_14 = var_32_13

				arg_29_1.duration_ = var_32_13 + var_32_11
			end

			if var_32_11 < arg_29_1.time_ and arg_29_1.time_ <= var_32_11 + arg_32_0 then
				local var_32_15 = "play"
				local var_32_16 = "voice"

				arg_29_1:AudioAction(var_32_15, var_32_16, "story_v_out_110031", "110031008", "story_v_out_110031.awb")
			end
		end
	end,
	Play110031009 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 110031009
		arg_33_1.duration_ = 14.788999999999

		SetActive(arg_33_1.tipsGo_, false)

		function arg_33_1.onSingleLineFinish_()
			arg_33_1.onSingleLineUpdate_ = nil
			arg_33_1.onSingleLineFinish_ = nil
			arg_33_1.state_ = "waiting"
			arg_33_1.auto_ = false
		end

		function arg_33_1.playNext_(arg_35_0)
			arg_33_1.onStoryFinished_()
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = 0

			if var_36_0 < arg_33_1.time_ and arg_33_1.time_ <= var_36_0 + arg_36_0 then
				arg_33_1.var_.oldValueTypewriter = arg_33_1.fswtw_.percent

				arg_33_1:ShowNextGo(false)
			end

			local var_36_1 = 56
			local var_36_2 = 3.73333333333333
			local var_36_3 = arg_33_1:GetWordFromCfg(110031006)
			local var_36_4 = arg_33_1:FormatText(var_36_3.content)
			local var_36_5, var_36_6 = arg_33_1:GetPercentByPara(var_36_4, 4)

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

			local var_36_8 = 3.73333333333333
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
			local var_36_12 = 14.789
			local var_36_13 = manager.audio:GetVoiceLength("story_v_out_110031", "110031009", "story_v_out_110031.awb") / 1000

			if var_36_13 > 0 and var_36_12 < var_36_13 and var_36_13 + var_36_11 > arg_33_1.duration_ then
				local var_36_14 = var_36_13

				arg_33_1.duration_ = var_36_13 + var_36_11
			end

			if var_36_11 < arg_33_1.time_ and arg_33_1.time_ <= var_36_11 + arg_36_0 then
				local var_36_15 = "play"
				local var_36_16 = "voice"

				arg_33_1:AudioAction(var_36_15, var_36_16, "story_v_out_110031", "110031009", "story_v_out_110031.awb")
			end
		end
	end,
	assets = {},
	voices = {
		"story_v_out_110031.awb"
	}
}
