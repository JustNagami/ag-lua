return {
	Play116381001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 116381001
		arg_1_1.duration_ = 10.450999999999

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play116381002(arg_1_1)
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

			local var_4_16 = 2

			if var_4_16 < arg_1_1.time_ and arg_1_1.time_ <= var_4_16 + arg_4_0 then
				arg_1_1.fswbg_:SetActive(true)
				arg_1_1.dialog_:SetActive(false)

				arg_1_1.fswtw_.percent = 0

				local var_4_17 = arg_1_1:GetWordFromCfg(116381001)
				local var_4_18 = arg_1_1:FormatText(var_4_17.content)

				arg_1_1.fswt_.text = var_4_18

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.fswt_)

				arg_1_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_1_1.fswtw_:SetDirty()

				arg_1_1.typewritterCharCountI18N = 0

				arg_1_1:ShowNextGo(false)
			end

			local var_4_19 = 2.01666666666667

			if var_4_19 < arg_1_1.time_ and arg_1_1.time_ <= var_4_19 + arg_4_0 then
				arg_1_1.var_.oldValueTypewriter = arg_1_1.fswtw_.percent

				arg_1_1:ShowNextGo(false)
			end

			local var_4_20 = 37
			local var_4_21 = 2.46666666666667
			local var_4_22 = arg_1_1:GetWordFromCfg(116381001)
			local var_4_23 = arg_1_1:FormatText(var_4_22.content)
			local var_4_24, var_4_25 = arg_1_1:GetPercentByPara(var_4_23, 1)

			if var_4_19 < arg_1_1.time_ and arg_1_1.time_ <= var_4_19 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				local var_4_26 = var_4_20 <= 0 and var_4_21 or var_4_21 * ((var_4_25 - arg_1_1.typewritterCharCountI18N) / var_4_20)

				if var_4_26 > 0 and var_4_21 < var_4_26 then
					arg_1_1.talkMaxDuration = var_4_26

					if var_4_26 + var_4_19 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_26 + var_4_19
					end
				end
			end

			local var_4_27 = 2.46666666666667
			local var_4_28 = math.max(var_4_27, arg_1_1.talkMaxDuration)

			if var_4_19 <= arg_1_1.time_ and arg_1_1.time_ < var_4_19 + var_4_28 then
				local var_4_29 = (arg_1_1.time_ - var_4_19) / var_4_28

				arg_1_1.fswtw_.percent = Mathf.Lerp(arg_1_1.var_.oldValueTypewriter, var_4_24, var_4_29)
				arg_1_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_1_1.fswtw_:SetDirty()
			end

			if arg_1_1.time_ >= var_4_19 + var_4_28 and arg_1_1.time_ < var_4_19 + var_4_28 + arg_4_0 then
				arg_1_1.fswtw_.percent = var_4_24

				arg_1_1.fswtw_:SetDirty()
				arg_1_1:ShowNextGo(true)

				arg_1_1.typewritterCharCountI18N = var_4_25
			end

			local var_4_30 = 2
			local var_4_31 = 8.451
			local var_4_32 = manager.audio:GetVoiceLength("story_v_out_116381", "116381001", "story_v_out_116381.awb") / 1000

			if var_4_32 > 0 and var_4_31 < var_4_32 and var_4_32 + var_4_30 > arg_1_1.duration_ then
				local var_4_33 = var_4_32

				arg_1_1.duration_ = var_4_32 + var_4_30
			end

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				local var_4_34 = "play"
				local var_4_35 = "voice"

				arg_1_1:AudioAction(var_4_34, var_4_35, "story_v_out_116381", "116381001", "story_v_out_116381.awb")
			end

			local var_4_36 = 0
			local var_4_37 = 0.266666666666667

			if var_4_36 < arg_1_1.time_ and arg_1_1.time_ <= var_4_36 + arg_4_0 then
				local var_4_38 = "play"
				local var_4_39 = "music"

				arg_1_1:AudioAction(var_4_38, var_4_39, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_40 = 2.2
			local var_4_41 = 0.6

			if var_4_40 < arg_1_1.time_ and arg_1_1.time_ <= var_4_40 + arg_4_0 then
				local var_4_42 = "play"
				local var_4_43 = "music"

				arg_1_1:AudioAction(var_4_42, var_4_43, "bgm_activity_1_6_story_story", "bgm_activity_1_6_story_story", "bgm_activity_1_6_story_story.awb")
			end

			local var_4_44 = 2.375
			local var_4_45 = 0.425

			if var_4_44 < arg_1_1.time_ and arg_1_1.time_ <= var_4_44 + arg_4_0 then
				local var_4_46 = "play"
				local var_4_47 = "music"

				arg_1_1:AudioAction(var_4_46, var_4_47, "bgm_activity_1_6_story_story", "story", "bgm_activity_1_6_story_story.awb")
			end

			local var_4_48 = 0

			if var_4_48 < arg_1_1.time_ and arg_1_1.time_ <= var_4_48 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = true

				arg_1_1:SetGaussion(false)
			end

			local var_4_49 = 2

			if var_4_48 <= arg_1_1.time_ and arg_1_1.time_ < var_4_48 + var_4_49 then
				local var_4_50 = (arg_1_1.time_ - var_4_48) / var_4_49
				local var_4_51 = Color.New(0, 0, 0)

				var_4_51.a = Mathf.Lerp(1, 0, var_4_50)
				arg_1_1.mask_.color = var_4_51
			end

			if arg_1_1.time_ >= var_4_48 + var_4_49 and arg_1_1.time_ < var_4_48 + var_4_49 + arg_4_0 then
				local var_4_52 = Color.New(0, 0, 0)
				local var_4_53 = 0

				arg_1_1.mask_.enabled = false
				var_4_52.a = var_4_53
				arg_1_1.mask_.color = var_4_52
			end

			local var_4_54 = 2

			if var_4_54 < arg_1_1.time_ and arg_1_1.time_ <= var_4_54 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_55 = 2.48333333333333

			if arg_1_1.time_ >= var_4_54 + var_4_55 and arg_1_1.time_ < var_4_54 + var_4_55 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381002 = function(arg_5_0, arg_5_1)
		arg_5_1.time_ = 0
		arg_5_1.frameCnt_ = 0
		arg_5_1.state_ = "playing"
		arg_5_1.curTalkId_ = 116381002
		arg_5_1.duration_ = 10.274999999999

		SetActive(arg_5_1.tipsGo_, false)

		function arg_5_1.onSingleLineFinish_()
			arg_5_1.onSingleLineUpdate_ = nil
			arg_5_1.onSingleLineFinish_ = nil
			arg_5_1.state_ = "waiting"
		end

		function arg_5_1.playNext_(arg_7_0)
			if arg_7_0 == 1 then
				arg_5_0:Play116381003(arg_5_1)
			end
		end

		function arg_5_1.onSingleLineUpdate_(arg_8_0)
			local var_8_0 = 0

			if var_8_0 < arg_5_1.time_ and arg_5_1.time_ <= var_8_0 + arg_8_0 then
				arg_5_1.var_.oldValueTypewriter = arg_5_1.fswtw_.percent

				arg_5_1:ShowNextGo(false)
			end

			local var_8_1 = 44
			local var_8_2 = 2.93333333333333
			local var_8_3 = arg_5_1:GetWordFromCfg(116381001)
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

			local var_8_8 = 2.93333333333333
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
			local var_8_12 = 10.275
			local var_8_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381002", "story_v_out_116381.awb") / 1000

			if var_8_13 > 0 and var_8_12 < var_8_13 and var_8_13 + var_8_11 > arg_5_1.duration_ then
				local var_8_14 = var_8_13

				arg_5_1.duration_ = var_8_13 + var_8_11
			end

			if var_8_11 < arg_5_1.time_ and arg_5_1.time_ <= var_8_11 + arg_8_0 then
				local var_8_15 = "play"
				local var_8_16 = "voice"

				arg_5_1:AudioAction(var_8_15, var_8_16, "story_v_out_116381", "116381002", "story_v_out_116381.awb")
			end

			local var_8_17 = 0

			if var_8_17 < arg_5_1.time_ and arg_5_1.time_ <= var_8_17 + arg_8_0 then
				arg_5_1.allBtn_.enabled = false
			end

			local var_8_18 = 2.93333333333333

			if arg_5_1.time_ >= var_8_17 + var_8_18 and arg_5_1.time_ < var_8_17 + var_8_18 + arg_8_0 then
				arg_5_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381003 = function(arg_9_0, arg_9_1)
		arg_9_1.time_ = 0
		arg_9_1.frameCnt_ = 0
		arg_9_1.state_ = "playing"
		arg_9_1.curTalkId_ = 116381003
		arg_9_1.duration_ = 13.779999999999

		SetActive(arg_9_1.tipsGo_, false)

		function arg_9_1.onSingleLineFinish_()
			arg_9_1.onSingleLineUpdate_ = nil
			arg_9_1.onSingleLineFinish_ = nil
			arg_9_1.state_ = "waiting"
		end

		function arg_9_1.playNext_(arg_11_0)
			if arg_11_0 == 1 then
				arg_9_0:Play116381004(arg_9_1)
			end
		end

		function arg_9_1.onSingleLineUpdate_(arg_12_0)
			local var_12_0 = 0

			if var_12_0 < arg_9_1.time_ and arg_9_1.time_ <= var_12_0 + arg_12_0 then
				arg_9_1.var_.oldValueTypewriter = arg_9_1.fswtw_.percent

				arg_9_1:ShowNextGo(false)
			end

			local var_12_1 = 62
			local var_12_2 = 4.13333333333333
			local var_12_3 = arg_9_1:GetWordFromCfg(116381001)
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

			local var_12_8 = 4.13333333333333
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
			local var_12_12 = 13.78
			local var_12_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381003", "story_v_out_116381.awb") / 1000

			if var_12_13 > 0 and var_12_12 < var_12_13 and var_12_13 + var_12_11 > arg_9_1.duration_ then
				local var_12_14 = var_12_13

				arg_9_1.duration_ = var_12_13 + var_12_11
			end

			if var_12_11 < arg_9_1.time_ and arg_9_1.time_ <= var_12_11 + arg_12_0 then
				local var_12_15 = "play"
				local var_12_16 = "voice"

				arg_9_1:AudioAction(var_12_15, var_12_16, "story_v_out_116381", "116381003", "story_v_out_116381.awb")
			end

			local var_12_17 = 0

			if var_12_17 < arg_9_1.time_ and arg_9_1.time_ <= var_12_17 + arg_12_0 then
				arg_9_1.allBtn_.enabled = false
			end

			local var_12_18 = 4.13333333333333

			if arg_9_1.time_ >= var_12_17 + var_12_18 and arg_9_1.time_ < var_12_17 + var_12_18 + arg_12_0 then
				arg_9_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381004 = function(arg_13_0, arg_13_1)
		arg_13_1.time_ = 0
		arg_13_1.frameCnt_ = 0
		arg_13_1.state_ = "playing"
		arg_13_1.curTalkId_ = 116381004
		arg_13_1.duration_ = 1.348999999999

		SetActive(arg_13_1.tipsGo_, false)

		function arg_13_1.onSingleLineFinish_()
			arg_13_1.onSingleLineUpdate_ = nil
			arg_13_1.onSingleLineFinish_ = nil
			arg_13_1.state_ = "waiting"
		end

		function arg_13_1.playNext_(arg_15_0)
			if arg_15_0 == 1 then
				arg_13_0:Play116381005(arg_13_1)
			end
		end

		function arg_13_1.onSingleLineUpdate_(arg_16_0)
			local var_16_0 = 0

			if var_16_0 < arg_13_1.time_ and arg_13_1.time_ <= var_16_0 + arg_16_0 then
				arg_13_1.var_.oldValueTypewriter = arg_13_1.fswtw_.percent

				arg_13_1:ShowNextGo(false)
			end

			local var_16_1 = 11
			local var_16_2 = 0.733333333333333
			local var_16_3 = arg_13_1:GetWordFromCfg(116381001)
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

			local var_16_8 = 0.733333333333333
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
			local var_16_12 = 1.349
			local var_16_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381004", "story_v_out_116381.awb") / 1000

			if var_16_13 > 0 and var_16_12 < var_16_13 and var_16_13 + var_16_11 > arg_13_1.duration_ then
				local var_16_14 = var_16_13

				arg_13_1.duration_ = var_16_13 + var_16_11
			end

			if var_16_11 < arg_13_1.time_ and arg_13_1.time_ <= var_16_11 + arg_16_0 then
				local var_16_15 = "play"
				local var_16_16 = "voice"

				arg_13_1:AudioAction(var_16_15, var_16_16, "story_v_out_116381", "116381004", "story_v_out_116381.awb")
			end

			local var_16_17 = 0

			if var_16_17 < arg_13_1.time_ and arg_13_1.time_ <= var_16_17 + arg_16_0 then
				arg_13_1.allBtn_.enabled = false
			end

			local var_16_18 = 0.733333333333333

			if arg_13_1.time_ >= var_16_17 + var_16_18 and arg_13_1.time_ < var_16_17 + var_16_18 + arg_16_0 then
				arg_13_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381005 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 116381005
		arg_17_1.duration_ = 4.216999999999

		SetActive(arg_17_1.tipsGo_, false)

		function arg_17_1.onSingleLineFinish_()
			arg_17_1.onSingleLineUpdate_ = nil
			arg_17_1.onSingleLineFinish_ = nil
			arg_17_1.state_ = "waiting"
		end

		function arg_17_1.playNext_(arg_19_0)
			if arg_19_0 == 1 then
				arg_17_0:Play116381006(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = 0

			if var_20_0 < arg_17_1.time_ and arg_17_1.time_ <= var_20_0 + arg_20_0 then
				arg_17_1.var_.oldValueTypewriter = arg_17_1.fswtw_.percent

				arg_17_1:ShowNextGo(false)
			end

			local var_20_1 = 23
			local var_20_2 = 1.53333333333333
			local var_20_3 = arg_17_1:GetWordFromCfg(116381001)
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

			local var_20_8 = 1.53333333333333
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
			local var_20_12 = 4.217
			local var_20_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381005", "story_v_out_116381.awb") / 1000

			if var_20_13 > 0 and var_20_12 < var_20_13 and var_20_13 + var_20_11 > arg_17_1.duration_ then
				local var_20_14 = var_20_13

				arg_17_1.duration_ = var_20_13 + var_20_11
			end

			if var_20_11 < arg_17_1.time_ and arg_17_1.time_ <= var_20_11 + arg_20_0 then
				local var_20_15 = "play"
				local var_20_16 = "voice"

				arg_17_1:AudioAction(var_20_15, var_20_16, "story_v_out_116381", "116381005", "story_v_out_116381.awb")
			end

			local var_20_17 = 0

			if var_20_17 < arg_17_1.time_ and arg_17_1.time_ <= var_20_17 + arg_20_0 then
				arg_17_1.allBtn_.enabled = false
			end

			local var_20_18 = 1.53333333333333

			if arg_17_1.time_ >= var_20_17 + var_20_18 and arg_17_1.time_ < var_20_17 + var_20_18 + arg_20_0 then
				arg_17_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381006 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 116381006
		arg_21_1.duration_ = 7.026999999999

		SetActive(arg_21_1.tipsGo_, false)

		function arg_21_1.onSingleLineFinish_()
			arg_21_1.onSingleLineUpdate_ = nil
			arg_21_1.onSingleLineFinish_ = nil
			arg_21_1.state_ = "waiting"
		end

		function arg_21_1.playNext_(arg_23_0)
			if arg_23_0 == 1 then
				arg_21_0:Play116381007(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = 0

			if var_24_0 < arg_21_1.time_ and arg_21_1.time_ <= var_24_0 + arg_24_0 then
				arg_21_1.var_.oldValueTypewriter = arg_21_1.fswtw_.percent

				arg_21_1:ShowNextGo(false)
			end

			local var_24_1 = 42
			local var_24_2 = 2.8
			local var_24_3 = arg_21_1:GetWordFromCfg(116381001)
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

			local var_24_8 = 2.8
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
			local var_24_12 = 7.027
			local var_24_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381006", "story_v_out_116381.awb") / 1000

			if var_24_13 > 0 and var_24_12 < var_24_13 and var_24_13 + var_24_11 > arg_21_1.duration_ then
				local var_24_14 = var_24_13

				arg_21_1.duration_ = var_24_13 + var_24_11
			end

			if var_24_11 < arg_21_1.time_ and arg_21_1.time_ <= var_24_11 + arg_24_0 then
				local var_24_15 = "play"
				local var_24_16 = "voice"

				arg_21_1:AudioAction(var_24_15, var_24_16, "story_v_out_116381", "116381006", "story_v_out_116381.awb")
			end

			local var_24_17 = 0

			if var_24_17 < arg_21_1.time_ and arg_21_1.time_ <= var_24_17 + arg_24_0 then
				arg_21_1.allBtn_.enabled = false
			end

			local var_24_18 = 2.8

			if arg_21_1.time_ >= var_24_17 + var_24_18 and arg_21_1.time_ < var_24_17 + var_24_18 + arg_24_0 then
				arg_21_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381007 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 116381007
		arg_25_1.duration_ = 10.286999999999

		SetActive(arg_25_1.tipsGo_, false)

		function arg_25_1.onSingleLineFinish_()
			arg_25_1.onSingleLineUpdate_ = nil
			arg_25_1.onSingleLineFinish_ = nil
			arg_25_1.state_ = "waiting"
		end

		function arg_25_1.playNext_(arg_27_0)
			if arg_27_0 == 1 then
				arg_25_0:Play116381008(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = 0

			if var_28_0 < arg_25_1.time_ and arg_25_1.time_ <= var_28_0 + arg_28_0 then
				arg_25_1.fswbg_:SetActive(true)
				arg_25_1.dialog_:SetActive(false)

				arg_25_1.fswtw_.percent = 0

				local var_28_1 = arg_25_1:GetWordFromCfg(116381007)
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

			local var_28_4 = 48
			local var_28_5 = 3.2
			local var_28_6 = arg_25_1:GetWordFromCfg(116381007)
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

			local var_28_11 = 3.2
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
			local var_28_15 = 10.287
			local var_28_16 = manager.audio:GetVoiceLength("story_v_out_116381", "116381007", "story_v_out_116381.awb") / 1000

			if var_28_16 > 0 and var_28_15 < var_28_16 and var_28_16 + var_28_14 > arg_25_1.duration_ then
				local var_28_17 = var_28_16

				arg_25_1.duration_ = var_28_16 + var_28_14
			end

			if var_28_14 < arg_25_1.time_ and arg_25_1.time_ <= var_28_14 + arg_28_0 then
				local var_28_18 = "play"
				local var_28_19 = "voice"

				arg_25_1:AudioAction(var_28_18, var_28_19, "story_v_out_116381", "116381007", "story_v_out_116381.awb")
			end

			local var_28_20 = 0

			if var_28_20 < arg_25_1.time_ and arg_25_1.time_ <= var_28_20 + arg_28_0 then
				arg_25_1.allBtn_.enabled = false
			end

			local var_28_21 = 3.21666666666667

			if arg_25_1.time_ >= var_28_20 + var_28_21 and arg_25_1.time_ < var_28_20 + var_28_21 + arg_28_0 then
				arg_25_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381008 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 116381008
		arg_29_1.duration_ = 7.653999999999

		SetActive(arg_29_1.tipsGo_, false)

		function arg_29_1.onSingleLineFinish_()
			arg_29_1.onSingleLineUpdate_ = nil
			arg_29_1.onSingleLineFinish_ = nil
			arg_29_1.state_ = "waiting"
		end

		function arg_29_1.playNext_(arg_31_0)
			if arg_31_0 == 1 then
				arg_29_0:Play116381009(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = 0

			if var_32_0 < arg_29_1.time_ and arg_29_1.time_ <= var_32_0 + arg_32_0 then
				arg_29_1.var_.oldValueTypewriter = arg_29_1.fswtw_.percent

				arg_29_1:ShowNextGo(false)
			end

			local var_32_1 = 27
			local var_32_2 = 1.8
			local var_32_3 = arg_29_1:GetWordFromCfg(116381007)
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

			local var_32_8 = 1.8
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
			local var_32_12 = 7.654
			local var_32_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381008", "story_v_out_116381.awb") / 1000

			if var_32_13 > 0 and var_32_12 < var_32_13 and var_32_13 + var_32_11 > arg_29_1.duration_ then
				local var_32_14 = var_32_13

				arg_29_1.duration_ = var_32_13 + var_32_11
			end

			if var_32_11 < arg_29_1.time_ and arg_29_1.time_ <= var_32_11 + arg_32_0 then
				local var_32_15 = "play"
				local var_32_16 = "voice"

				arg_29_1:AudioAction(var_32_15, var_32_16, "story_v_out_116381", "116381008", "story_v_out_116381.awb")
			end

			local var_32_17 = 0

			if var_32_17 < arg_29_1.time_ and arg_29_1.time_ <= var_32_17 + arg_32_0 then
				arg_29_1.allBtn_.enabled = false
			end

			local var_32_18 = 1.8

			if arg_29_1.time_ >= var_32_17 + var_32_18 and arg_29_1.time_ < var_32_17 + var_32_18 + arg_32_0 then
				arg_29_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381009 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 116381009
		arg_33_1.duration_ = 12.168999999999

		SetActive(arg_33_1.tipsGo_, false)

		function arg_33_1.onSingleLineFinish_()
			arg_33_1.onSingleLineUpdate_ = nil
			arg_33_1.onSingleLineFinish_ = nil
			arg_33_1.state_ = "waiting"
		end

		function arg_33_1.playNext_(arg_35_0)
			if arg_35_0 == 1 then
				arg_33_0:Play116381010(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = 0

			if var_36_0 < arg_33_1.time_ and arg_33_1.time_ <= var_36_0 + arg_36_0 then
				arg_33_1.var_.oldValueTypewriter = arg_33_1.fswtw_.percent

				arg_33_1:ShowNextGo(false)
			end

			local var_36_1 = 61
			local var_36_2 = 4.06666666666667
			local var_36_3 = arg_33_1:GetWordFromCfg(116381007)
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

			local var_36_8 = 4.06666666666667
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
			local var_36_12 = 12.169
			local var_36_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381009", "story_v_out_116381.awb") / 1000

			if var_36_13 > 0 and var_36_12 < var_36_13 and var_36_13 + var_36_11 > arg_33_1.duration_ then
				local var_36_14 = var_36_13

				arg_33_1.duration_ = var_36_13 + var_36_11
			end

			if var_36_11 < arg_33_1.time_ and arg_33_1.time_ <= var_36_11 + arg_36_0 then
				local var_36_15 = "play"
				local var_36_16 = "voice"

				arg_33_1:AudioAction(var_36_15, var_36_16, "story_v_out_116381", "116381009", "story_v_out_116381.awb")
			end

			local var_36_17 = 0

			if var_36_17 < arg_33_1.time_ and arg_33_1.time_ <= var_36_17 + arg_36_0 then
				arg_33_1.allBtn_.enabled = false
			end

			local var_36_18 = 4.06666666666667

			if arg_33_1.time_ >= var_36_17 + var_36_18 and arg_33_1.time_ < var_36_17 + var_36_18 + arg_36_0 then
				arg_33_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381010 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 116381010
		arg_37_1.duration_ = 9.973999999999

		SetActive(arg_37_1.tipsGo_, false)

		function arg_37_1.onSingleLineFinish_()
			arg_37_1.onSingleLineUpdate_ = nil
			arg_37_1.onSingleLineFinish_ = nil
			arg_37_1.state_ = "waiting"
		end

		function arg_37_1.playNext_(arg_39_0)
			if arg_39_0 == 1 then
				arg_37_0:Play116381011(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = 0

			if var_40_0 < arg_37_1.time_ and arg_37_1.time_ <= var_40_0 + arg_40_0 then
				arg_37_1.var_.oldValueTypewriter = arg_37_1.fswtw_.percent

				arg_37_1:ShowNextGo(false)
			end

			local var_40_1 = 31
			local var_40_2 = 2.06666666666667
			local var_40_3 = arg_37_1:GetWordFromCfg(116381007)
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

			local var_40_8 = 2.06666666666667
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
			local var_40_12 = 9.974
			local var_40_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381010", "story_v_out_116381.awb") / 1000

			if var_40_13 > 0 and var_40_12 < var_40_13 and var_40_13 + var_40_11 > arg_37_1.duration_ then
				local var_40_14 = var_40_13

				arg_37_1.duration_ = var_40_13 + var_40_11
			end

			if var_40_11 < arg_37_1.time_ and arg_37_1.time_ <= var_40_11 + arg_40_0 then
				local var_40_15 = "play"
				local var_40_16 = "voice"

				arg_37_1:AudioAction(var_40_15, var_40_16, "story_v_out_116381", "116381010", "story_v_out_116381.awb")
			end

			local var_40_17 = 0

			if var_40_17 < arg_37_1.time_ and arg_37_1.time_ <= var_40_17 + arg_40_0 then
				arg_37_1.allBtn_.enabled = false
			end

			local var_40_18 = 2.06666666666667

			if arg_37_1.time_ >= var_40_17 + var_40_18 and arg_37_1.time_ < var_40_17 + var_40_18 + arg_40_0 then
				arg_37_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381011 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 116381011
		arg_41_1.duration_ = 0.964999999999

		SetActive(arg_41_1.tipsGo_, false)

		function arg_41_1.onSingleLineFinish_()
			arg_41_1.onSingleLineUpdate_ = nil
			arg_41_1.onSingleLineFinish_ = nil
			arg_41_1.state_ = "waiting"
		end

		function arg_41_1.playNext_(arg_43_0)
			if arg_43_0 == 1 then
				arg_41_0:Play116381012(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = 0

			if var_44_0 < arg_41_1.time_ and arg_41_1.time_ <= var_44_0 + arg_44_0 then
				arg_41_1.var_.oldValueTypewriter = arg_41_1.fswtw_.percent

				arg_41_1:ShowNextGo(false)
			end

			local var_44_1 = 10
			local var_44_2 = 0.666666666666667
			local var_44_3 = arg_41_1:GetWordFromCfg(116381007)
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

			local var_44_8 = 0.666666666666667
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
			local var_44_12 = 0.965
			local var_44_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381011", "story_v_out_116381.awb") / 1000

			if var_44_13 > 0 and var_44_12 < var_44_13 and var_44_13 + var_44_11 > arg_41_1.duration_ then
				local var_44_14 = var_44_13

				arg_41_1.duration_ = var_44_13 + var_44_11
			end

			if var_44_11 < arg_41_1.time_ and arg_41_1.time_ <= var_44_11 + arg_44_0 then
				local var_44_15 = "play"
				local var_44_16 = "voice"

				arg_41_1:AudioAction(var_44_15, var_44_16, "story_v_out_116381", "116381011", "story_v_out_116381.awb")
			end

			local var_44_17 = 0

			if var_44_17 < arg_41_1.time_ and arg_41_1.time_ <= var_44_17 + arg_44_0 then
				arg_41_1.allBtn_.enabled = false
			end

			local var_44_18 = 0.666666666666667

			if arg_41_1.time_ >= var_44_17 + var_44_18 and arg_41_1.time_ < var_44_17 + var_44_18 + arg_44_0 then
				arg_41_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381012 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 116381012
		arg_45_1.duration_ = 9.533

		local var_45_0 = {
			zh = 8.2,
			ja = 9.533
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
				arg_45_0:Play116381013(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = "SK0107"

			if arg_45_1.bgs_[var_48_0] == nil then
				local var_48_1 = Object.Instantiate(arg_45_1.paintGo_)

				var_48_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_48_0)
				var_48_1.name = var_48_0
				var_48_1.transform.parent = arg_45_1.stage_.transform
				var_48_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_45_1.bgs_[var_48_0] = var_48_1
			end

			local var_48_2 = 2

			if var_48_2 < arg_45_1.time_ and arg_45_1.time_ <= var_48_2 + arg_48_0 then
				local var_48_3 = manager.ui.mainCamera.transform.localPosition
				local var_48_4 = Vector3.New(0, 0, 10) + Vector3.New(var_48_3.x, var_48_3.y, 0)
				local var_48_5 = arg_45_1.bgs_.SK0107

				var_48_5.transform.localPosition = var_48_4
				var_48_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_48_6 = var_48_5:GetComponent("SpriteRenderer")

				if var_48_6 and var_48_6.sprite then
					local var_48_7 = (var_48_5.transform.localPosition - var_48_3).z
					local var_48_8 = manager.ui.mainCameraCom_
					local var_48_9 = 2 * var_48_7 * Mathf.Tan(var_48_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_48_10 = var_48_9 * var_48_8.aspect
					local var_48_11 = var_48_6.sprite.bounds.size.x
					local var_48_12 = var_48_6.sprite.bounds.size.y
					local var_48_13 = var_48_10 / var_48_11
					local var_48_14 = var_48_9 / var_48_12
					local var_48_15 = var_48_14 < var_48_13 and var_48_13 or var_48_14

					var_48_5.transform.localScale = Vector3.New(var_48_15, var_48_15, 0)
				end

				for iter_48_0, iter_48_1 in pairs(arg_45_1.bgs_) do
					if iter_48_0 ~= "SK0107" then
						iter_48_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_48_16 = 0

			if var_48_16 < arg_45_1.time_ and arg_45_1.time_ <= var_48_16 + arg_48_0 then
				arg_45_1.mask_.enabled = true
				arg_45_1.mask_.raycastTarget = true

				arg_45_1:SetGaussion(false)
			end

			local var_48_17 = 2

			if var_48_16 <= arg_45_1.time_ and arg_45_1.time_ < var_48_16 + var_48_17 then
				local var_48_18 = (arg_45_1.time_ - var_48_16) / var_48_17
				local var_48_19 = Color.New(0, 0, 0)

				var_48_19.a = Mathf.Lerp(0, 1, var_48_18)
				arg_45_1.mask_.color = var_48_19
			end

			if arg_45_1.time_ >= var_48_16 + var_48_17 and arg_45_1.time_ < var_48_16 + var_48_17 + arg_48_0 then
				local var_48_20 = Color.New(0, 0, 0)

				var_48_20.a = 1
				arg_45_1.mask_.color = var_48_20
			end

			local var_48_21 = 2

			if var_48_21 < arg_45_1.time_ and arg_45_1.time_ <= var_48_21 + arg_48_0 then
				arg_45_1.mask_.enabled = true
				arg_45_1.mask_.raycastTarget = true

				arg_45_1:SetGaussion(false)
			end

			local var_48_22 = 2

			if var_48_21 <= arg_45_1.time_ and arg_45_1.time_ < var_48_21 + var_48_22 then
				local var_48_23 = (arg_45_1.time_ - var_48_21) / var_48_22
				local var_48_24 = Color.New(0, 0, 0)

				var_48_24.a = Mathf.Lerp(1, 0, var_48_23)
				arg_45_1.mask_.color = var_48_24
			end

			if arg_45_1.time_ >= var_48_21 + var_48_22 and arg_45_1.time_ < var_48_21 + var_48_22 + arg_48_0 then
				local var_48_25 = Color.New(0, 0, 0)
				local var_48_26 = 0

				arg_45_1.mask_.enabled = false
				var_48_25.a = var_48_26
				arg_45_1.mask_.color = var_48_25
			end

			local var_48_27 = 1.98333333333333

			if var_48_27 < arg_45_1.time_ and arg_45_1.time_ <= var_48_27 + arg_48_0 then
				arg_45_1.fswbg_:SetActive(false)
				arg_45_1.dialog_:SetActive(false)
				arg_45_1:ShowNextGo(false)
			end

			if arg_45_1.frameCnt_ <= 1 then
				arg_45_1.dialog_:SetActive(false)
			end

			local var_48_28 = 4
			local var_48_29 = 0.4

			if var_48_28 < arg_45_1.time_ and arg_45_1.time_ <= var_48_28 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0

				arg_45_1.dialog_:SetActive(true)

				local var_48_30 = LeanTween.value(arg_45_1.dialog_, 0, 1, 0.3)

				var_48_30:setOnUpdate(LuaHelper.FloatAction(function(arg_49_0)
					arg_45_1.dialogCg_.alpha = arg_49_0
				end))
				var_48_30:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_45_1.dialog_)
					var_48_30:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_45_1.duration_ = arg_45_1.duration_ + 0.3

				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_31 = arg_45_1:FormatText(StoryNameCfg[328].name)

				arg_45_1.leftNameTxt_.text = var_48_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, true)
				arg_45_1.iconController_:SetSelectedState("hero")

				arg_45_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10032")

				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_32 = arg_45_1:GetWordFromCfg(116381012)
				local var_48_33 = arg_45_1:FormatText(var_48_32.content)

				arg_45_1.text_.text = var_48_33

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_34 = 16
				local var_48_35 = utf8.len(var_48_33)
				local var_48_36 = var_48_34 <= 0 and var_48_29 or var_48_29 * (var_48_35 / var_48_34)

				if var_48_36 > 0 and var_48_29 < var_48_36 then
					arg_45_1.talkMaxDuration = var_48_36
					var_48_28 = var_48_28 + 0.3

					if var_48_36 + var_48_28 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_36 + var_48_28
					end
				end

				arg_45_1.text_.text = var_48_33
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116381", "116381012", "story_v_out_116381.awb") ~= 0 then
					local var_48_37 = manager.audio:GetVoiceLength("story_v_out_116381", "116381012", "story_v_out_116381.awb") / 1000

					if var_48_37 + var_48_28 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_37 + var_48_28
					end

					if var_48_32.prefab_name ~= "" and arg_45_1.actors_[var_48_32.prefab_name] ~= nil then
						local var_48_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_32.prefab_name].transform, "story_v_out_116381", "116381012", "story_v_out_116381.awb")

						arg_45_1:RecordAudio("116381012", var_48_38)
						arg_45_1:RecordAudio("116381012", var_48_38)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_out_116381", "116381012", "story_v_out_116381.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_out_116381", "116381012", "story_v_out_116381.awb")
				end

				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_39 = var_48_28 + 0.3
			local var_48_40 = math.max(var_48_29, arg_45_1.talkMaxDuration)

			if var_48_39 <= arg_45_1.time_ and arg_45_1.time_ < var_48_39 + var_48_40 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_39) / var_48_40

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_39 + var_48_40 and arg_45_1.time_ < var_48_39 + var_48_40 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play116381013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 116381013
		arg_51_1.duration_ = 15.2

		local var_51_0 = {
			zh = 11.366,
			ja = 15.2
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
				arg_51_0:Play116381014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = "SK0112"

			if arg_51_1.bgs_[var_54_0] == nil then
				local var_54_1 = Object.Instantiate(arg_51_1.paintGo_)

				var_54_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_54_0)
				var_54_1.name = var_54_0
				var_54_1.transform.parent = arg_51_1.stage_.transform
				var_54_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_51_1.bgs_[var_54_0] = var_54_1
			end

			local var_54_2 = 2

			if var_54_2 < arg_51_1.time_ and arg_51_1.time_ <= var_54_2 + arg_54_0 then
				local var_54_3 = manager.ui.mainCamera.transform.localPosition
				local var_54_4 = Vector3.New(0, 0, 10) + Vector3.New(var_54_3.x, var_54_3.y, 0)
				local var_54_5 = arg_51_1.bgs_.SK0112

				var_54_5.transform.localPosition = var_54_4
				var_54_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_54_6 = var_54_5:GetComponent("SpriteRenderer")

				if var_54_6 and var_54_6.sprite then
					local var_54_7 = (var_54_5.transform.localPosition - var_54_3).z
					local var_54_8 = manager.ui.mainCameraCom_
					local var_54_9 = 2 * var_54_7 * Mathf.Tan(var_54_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_54_10 = var_54_9 * var_54_8.aspect
					local var_54_11 = var_54_6.sprite.bounds.size.x
					local var_54_12 = var_54_6.sprite.bounds.size.y
					local var_54_13 = var_54_10 / var_54_11
					local var_54_14 = var_54_9 / var_54_12
					local var_54_15 = var_54_14 < var_54_13 and var_54_13 or var_54_14

					var_54_5.transform.localScale = Vector3.New(var_54_15, var_54_15, 0)
				end

				for iter_54_0, iter_54_1 in pairs(arg_51_1.bgs_) do
					if iter_54_0 ~= "SK0112" then
						iter_54_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_54_16 = 0

			if var_54_16 < arg_51_1.time_ and arg_51_1.time_ <= var_54_16 + arg_54_0 then
				arg_51_1.mask_.enabled = true
				arg_51_1.mask_.raycastTarget = true

				arg_51_1:SetGaussion(false)
			end

			local var_54_17 = 2

			if var_54_16 <= arg_51_1.time_ and arg_51_1.time_ < var_54_16 + var_54_17 then
				local var_54_18 = (arg_51_1.time_ - var_54_16) / var_54_17
				local var_54_19 = Color.New(0, 0, 0)

				var_54_19.a = Mathf.Lerp(0, 1, var_54_18)
				arg_51_1.mask_.color = var_54_19
			end

			if arg_51_1.time_ >= var_54_16 + var_54_17 and arg_51_1.time_ < var_54_16 + var_54_17 + arg_54_0 then
				local var_54_20 = Color.New(0, 0, 0)

				var_54_20.a = 1
				arg_51_1.mask_.color = var_54_20
			end

			local var_54_21 = 2

			if var_54_21 < arg_51_1.time_ and arg_51_1.time_ <= var_54_21 + arg_54_0 then
				arg_51_1.mask_.enabled = true
				arg_51_1.mask_.raycastTarget = true

				arg_51_1:SetGaussion(false)
			end

			local var_54_22 = 2

			if var_54_21 <= arg_51_1.time_ and arg_51_1.time_ < var_54_21 + var_54_22 then
				local var_54_23 = (arg_51_1.time_ - var_54_21) / var_54_22
				local var_54_24 = Color.New(0, 0, 0)

				var_54_24.a = Mathf.Lerp(1, 0, var_54_23)
				arg_51_1.mask_.color = var_54_24
			end

			if arg_51_1.time_ >= var_54_21 + var_54_22 and arg_51_1.time_ < var_54_21 + var_54_22 + arg_54_0 then
				local var_54_25 = Color.New(0, 0, 0)
				local var_54_26 = 0

				arg_51_1.mask_.enabled = false
				var_54_25.a = var_54_26
				arg_51_1.mask_.color = var_54_25
			end

			if arg_51_1.frameCnt_ <= 1 then
				arg_51_1.dialog_:SetActive(false)
			end

			local var_54_27 = 4
			local var_54_28 = 0.7

			if var_54_27 < arg_51_1.time_ and arg_51_1.time_ <= var_54_27 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0

				arg_51_1.dialog_:SetActive(true)

				local var_54_29 = LeanTween.value(arg_51_1.dialog_, 0, 1, 0.3)

				var_54_29:setOnUpdate(LuaHelper.FloatAction(function(arg_55_0)
					arg_51_1.dialogCg_.alpha = arg_55_0
				end))
				var_54_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_51_1.dialog_)
					var_54_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_51_1.duration_ = arg_51_1.duration_ + 0.3

				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_30 = arg_51_1:FormatText(StoryNameCfg[328].name)

				arg_51_1.leftNameTxt_.text = var_54_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, true)
				arg_51_1.iconController_:SetSelectedState("hero")

				arg_51_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10032")

				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_31 = arg_51_1:GetWordFromCfg(116381013)
				local var_54_32 = arg_51_1:FormatText(var_54_31.content)

				arg_51_1.text_.text = var_54_32

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_33 = 28
				local var_54_34 = utf8.len(var_54_32)
				local var_54_35 = var_54_33 <= 0 and var_54_28 or var_54_28 * (var_54_34 / var_54_33)

				if var_54_35 > 0 and var_54_28 < var_54_35 then
					arg_51_1.talkMaxDuration = var_54_35
					var_54_27 = var_54_27 + 0.3

					if var_54_35 + var_54_27 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_35 + var_54_27
					end
				end

				arg_51_1.text_.text = var_54_32
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116381", "116381013", "story_v_out_116381.awb") ~= 0 then
					local var_54_36 = manager.audio:GetVoiceLength("story_v_out_116381", "116381013", "story_v_out_116381.awb") / 1000

					if var_54_36 + var_54_27 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_36 + var_54_27
					end

					if var_54_31.prefab_name ~= "" and arg_51_1.actors_[var_54_31.prefab_name] ~= nil then
						local var_54_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_31.prefab_name].transform, "story_v_out_116381", "116381013", "story_v_out_116381.awb")

						arg_51_1:RecordAudio("116381013", var_54_37)
						arg_51_1:RecordAudio("116381013", var_54_37)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_116381", "116381013", "story_v_out_116381.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_116381", "116381013", "story_v_out_116381.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_38 = var_54_27 + 0.3
			local var_54_39 = math.max(var_54_28, arg_51_1.talkMaxDuration)

			if var_54_38 <= arg_51_1.time_ and arg_51_1.time_ < var_54_38 + var_54_39 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_38) / var_54_39

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_38 + var_54_39 and arg_51_1.time_ < var_54_38 + var_54_39 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play116381014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 116381014
		arg_57_1.duration_ = 8.833

		local var_57_0 = {
			zh = 8.833,
			ja = 7.933
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
				arg_57_0:Play116381015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = "SK0201"

			if arg_57_1.bgs_[var_60_0] == nil then
				local var_60_1 = Object.Instantiate(arg_57_1.paintGo_)

				var_60_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_60_0)
				var_60_1.name = var_60_0
				var_60_1.transform.parent = arg_57_1.stage_.transform
				var_60_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_57_1.bgs_[var_60_0] = var_60_1
			end

			local var_60_2 = 2

			if var_60_2 < arg_57_1.time_ and arg_57_1.time_ <= var_60_2 + arg_60_0 then
				local var_60_3 = manager.ui.mainCamera.transform.localPosition
				local var_60_4 = Vector3.New(0, 0, 10) + Vector3.New(var_60_3.x, var_60_3.y, 0)
				local var_60_5 = arg_57_1.bgs_.SK0201

				var_60_5.transform.localPosition = var_60_4
				var_60_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_60_6 = var_60_5:GetComponent("SpriteRenderer")

				if var_60_6 and var_60_6.sprite then
					local var_60_7 = (var_60_5.transform.localPosition - var_60_3).z
					local var_60_8 = manager.ui.mainCameraCom_
					local var_60_9 = 2 * var_60_7 * Mathf.Tan(var_60_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_60_10 = var_60_9 * var_60_8.aspect
					local var_60_11 = var_60_6.sprite.bounds.size.x
					local var_60_12 = var_60_6.sprite.bounds.size.y
					local var_60_13 = var_60_10 / var_60_11
					local var_60_14 = var_60_9 / var_60_12
					local var_60_15 = var_60_14 < var_60_13 and var_60_13 or var_60_14

					var_60_5.transform.localScale = Vector3.New(var_60_15, var_60_15, 0)
				end

				for iter_60_0, iter_60_1 in pairs(arg_57_1.bgs_) do
					if iter_60_0 ~= "SK0201" then
						iter_60_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_60_16 = 0

			if var_60_16 < arg_57_1.time_ and arg_57_1.time_ <= var_60_16 + arg_60_0 then
				arg_57_1.mask_.enabled = true
				arg_57_1.mask_.raycastTarget = true

				arg_57_1:SetGaussion(false)
			end

			local var_60_17 = 2

			if var_60_16 <= arg_57_1.time_ and arg_57_1.time_ < var_60_16 + var_60_17 then
				local var_60_18 = (arg_57_1.time_ - var_60_16) / var_60_17
				local var_60_19 = Color.New(0, 0, 0)

				var_60_19.a = Mathf.Lerp(0, 1, var_60_18)
				arg_57_1.mask_.color = var_60_19
			end

			if arg_57_1.time_ >= var_60_16 + var_60_17 and arg_57_1.time_ < var_60_16 + var_60_17 + arg_60_0 then
				local var_60_20 = Color.New(0, 0, 0)

				var_60_20.a = 1
				arg_57_1.mask_.color = var_60_20
			end

			local var_60_21 = 2

			if var_60_21 < arg_57_1.time_ and arg_57_1.time_ <= var_60_21 + arg_60_0 then
				arg_57_1.mask_.enabled = true
				arg_57_1.mask_.raycastTarget = true

				arg_57_1:SetGaussion(false)
			end

			local var_60_22 = 2

			if var_60_21 <= arg_57_1.time_ and arg_57_1.time_ < var_60_21 + var_60_22 then
				local var_60_23 = (arg_57_1.time_ - var_60_21) / var_60_22
				local var_60_24 = Color.New(0, 0, 0)

				var_60_24.a = Mathf.Lerp(1, 0, var_60_23)
				arg_57_1.mask_.color = var_60_24
			end

			if arg_57_1.time_ >= var_60_21 + var_60_22 and arg_57_1.time_ < var_60_21 + var_60_22 + arg_60_0 then
				local var_60_25 = Color.New(0, 0, 0)
				local var_60_26 = 0

				arg_57_1.mask_.enabled = false
				var_60_25.a = var_60_26
				arg_57_1.mask_.color = var_60_25
			end

			if arg_57_1.frameCnt_ <= 1 then
				arg_57_1.dialog_:SetActive(false)
			end

			local var_60_27 = 4
			local var_60_28 = 0.4

			if var_60_27 < arg_57_1.time_ and arg_57_1.time_ <= var_60_27 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0

				arg_57_1.dialog_:SetActive(true)

				local var_60_29 = LeanTween.value(arg_57_1.dialog_, 0, 1, 0.3)

				var_60_29:setOnUpdate(LuaHelper.FloatAction(function(arg_61_0)
					arg_57_1.dialogCg_.alpha = arg_61_0
				end))
				var_60_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_57_1.dialog_)
					var_60_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_57_1.duration_ = arg_57_1.duration_ + 0.3

				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_30 = arg_57_1:FormatText(StoryNameCfg[328].name)

				arg_57_1.leftNameTxt_.text = var_60_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, true)
				arg_57_1.iconController_:SetSelectedState("hero")

				arg_57_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10032")

				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_31 = arg_57_1:GetWordFromCfg(116381014)
				local var_60_32 = arg_57_1:FormatText(var_60_31.content)

				arg_57_1.text_.text = var_60_32

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_33 = 16
				local var_60_34 = utf8.len(var_60_32)
				local var_60_35 = var_60_33 <= 0 and var_60_28 or var_60_28 * (var_60_34 / var_60_33)

				if var_60_35 > 0 and var_60_28 < var_60_35 then
					arg_57_1.talkMaxDuration = var_60_35
					var_60_27 = var_60_27 + 0.3

					if var_60_35 + var_60_27 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_35 + var_60_27
					end
				end

				arg_57_1.text_.text = var_60_32
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116381", "116381014", "story_v_out_116381.awb") ~= 0 then
					local var_60_36 = manager.audio:GetVoiceLength("story_v_out_116381", "116381014", "story_v_out_116381.awb") / 1000

					if var_60_36 + var_60_27 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_36 + var_60_27
					end

					if var_60_31.prefab_name ~= "" and arg_57_1.actors_[var_60_31.prefab_name] ~= nil then
						local var_60_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_31.prefab_name].transform, "story_v_out_116381", "116381014", "story_v_out_116381.awb")

						arg_57_1:RecordAudio("116381014", var_60_37)
						arg_57_1:RecordAudio("116381014", var_60_37)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_116381", "116381014", "story_v_out_116381.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_116381", "116381014", "story_v_out_116381.awb")
				end

				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_38 = var_60_27 + 0.3
			local var_60_39 = math.max(var_60_28, arg_57_1.talkMaxDuration)

			if var_60_38 <= arg_57_1.time_ and arg_57_1.time_ < var_60_38 + var_60_39 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_38) / var_60_39

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_38 + var_60_39 and arg_57_1.time_ < var_60_38 + var_60_39 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play116381015 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 116381015
		arg_63_1.duration_ = 17.766666666666

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play116381016(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 2

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				local var_66_1 = manager.ui.mainCamera.transform.localPosition
				local var_66_2 = Vector3.New(0, 0, 10) + Vector3.New(var_66_1.x, var_66_1.y, 0)
				local var_66_3 = arg_63_1.bgs_.STblack

				var_66_3.transform.localPosition = var_66_2
				var_66_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_66_4 = var_66_3:GetComponent("SpriteRenderer")

				if var_66_4 and var_66_4.sprite then
					local var_66_5 = (var_66_3.transform.localPosition - var_66_1).z
					local var_66_6 = manager.ui.mainCameraCom_
					local var_66_7 = 2 * var_66_5 * Mathf.Tan(var_66_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_66_8 = var_66_7 * var_66_6.aspect
					local var_66_9 = var_66_4.sprite.bounds.size.x
					local var_66_10 = var_66_4.sprite.bounds.size.y
					local var_66_11 = var_66_8 / var_66_9
					local var_66_12 = var_66_7 / var_66_10
					local var_66_13 = var_66_12 < var_66_11 and var_66_11 or var_66_12

					var_66_3.transform.localScale = Vector3.New(var_66_13, var_66_13, 0)
				end

				for iter_66_0, iter_66_1 in pairs(arg_63_1.bgs_) do
					if iter_66_0 ~= "STblack" then
						iter_66_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_66_14 = 0

			if var_66_14 < arg_63_1.time_ and arg_63_1.time_ <= var_66_14 + arg_66_0 then
				arg_63_1.mask_.enabled = true
				arg_63_1.mask_.raycastTarget = true

				arg_63_1:SetGaussion(false)
			end

			local var_66_15 = 2

			if var_66_14 <= arg_63_1.time_ and arg_63_1.time_ < var_66_14 + var_66_15 then
				local var_66_16 = (arg_63_1.time_ - var_66_14) / var_66_15
				local var_66_17 = Color.New(0, 0, 0)

				var_66_17.a = Mathf.Lerp(0, 1, var_66_16)
				arg_63_1.mask_.color = var_66_17
			end

			if arg_63_1.time_ >= var_66_14 + var_66_15 and arg_63_1.time_ < var_66_14 + var_66_15 + arg_66_0 then
				local var_66_18 = Color.New(0, 0, 0)

				var_66_18.a = 1
				arg_63_1.mask_.color = var_66_18
			end

			local var_66_19 = 2

			if var_66_19 < arg_63_1.time_ and arg_63_1.time_ <= var_66_19 + arg_66_0 then
				arg_63_1.mask_.enabled = true
				arg_63_1.mask_.raycastTarget = true

				arg_63_1:SetGaussion(false)
			end

			local var_66_20 = 2

			if var_66_19 <= arg_63_1.time_ and arg_63_1.time_ < var_66_19 + var_66_20 then
				local var_66_21 = (arg_63_1.time_ - var_66_19) / var_66_20
				local var_66_22 = Color.New(0, 0, 0)

				var_66_22.a = Mathf.Lerp(1, 0, var_66_21)
				arg_63_1.mask_.color = var_66_22
			end

			if arg_63_1.time_ >= var_66_19 + var_66_20 and arg_63_1.time_ < var_66_19 + var_66_20 + arg_66_0 then
				local var_66_23 = Color.New(0, 0, 0)
				local var_66_24 = 0

				arg_63_1.mask_.enabled = false
				var_66_23.a = var_66_24
				arg_63_1.mask_.color = var_66_23
			end

			local var_66_25 = 4
			local var_66_26 = 12.868
			local var_66_27 = manager.audio:GetVoiceLength("story_v_out_116381", "116381015", "story_v_out_116381.awb") / 1000

			if var_66_27 > 0 and var_66_26 < var_66_27 and var_66_27 + var_66_25 > arg_63_1.duration_ then
				local var_66_28 = var_66_27

				arg_63_1.duration_ = var_66_27 + var_66_25
			end

			if var_66_25 < arg_63_1.time_ and arg_63_1.time_ <= var_66_25 + arg_66_0 then
				local var_66_29 = "play"
				local var_66_30 = "voice"

				arg_63_1:AudioAction(var_66_29, var_66_30, "story_v_out_116381", "116381015", "story_v_out_116381.awb")
			end

			local var_66_31 = 4

			if var_66_31 < arg_63_1.time_ and arg_63_1.time_ <= var_66_31 + arg_66_0 then
				arg_63_1.var_.oldValueTypewriter = arg_63_1.fswtw_.percent

				arg_63_1:ShowNextGo(false)
			end

			local var_66_32 = 48
			local var_66_33 = 3.53333333333333
			local var_66_34 = arg_63_1:GetWordFromCfg(116381007)
			local var_66_35 = arg_63_1:FormatText(var_66_34.content)
			local var_66_36, var_66_37 = arg_63_1:GetPercentByPara(var_66_35, 1)

			if var_66_31 < arg_63_1.time_ and arg_63_1.time_ <= var_66_31 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0

				local var_66_38 = var_66_32 <= 0 and var_66_33 or var_66_33 * ((var_66_37 - arg_63_1.typewritterCharCountI18N) / var_66_32)

				if var_66_38 > 0 and var_66_33 < var_66_38 then
					arg_63_1.talkMaxDuration = var_66_38

					if var_66_38 + var_66_31 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_38 + var_66_31
					end
				end
			end

			local var_66_39 = 3.53333333333333
			local var_66_40 = math.max(var_66_39, arg_63_1.talkMaxDuration)

			if var_66_31 <= arg_63_1.time_ and arg_63_1.time_ < var_66_31 + var_66_40 then
				local var_66_41 = (arg_63_1.time_ - var_66_31) / var_66_40

				arg_63_1.fswtw_.percent = Mathf.Lerp(arg_63_1.var_.oldValueTypewriter, var_66_36, var_66_41)
				arg_63_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_63_1.fswtw_:SetDirty()
			end

			if arg_63_1.time_ >= var_66_31 + var_66_40 and arg_63_1.time_ < var_66_31 + var_66_40 + arg_66_0 then
				arg_63_1.fswtw_.percent = var_66_36

				arg_63_1.fswtw_:SetDirty()
				arg_63_1:ShowNextGo(true)

				arg_63_1.typewritterCharCountI18N = var_66_37
			end

			local var_66_42 = 2

			if var_66_42 < arg_63_1.time_ and arg_63_1.time_ <= var_66_42 + arg_66_0 then
				arg_63_1.fswbg_:SetActive(true)
				arg_63_1.dialog_:SetActive(false)

				arg_63_1.fswtw_.percent = 0

				local var_66_43 = arg_63_1:GetWordFromCfg(116381015)
				local var_66_44 = arg_63_1:FormatText(var_66_43.content)

				arg_63_1.fswt_.text = var_66_44

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.fswt_)

				arg_63_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_63_1.fswtw_:SetDirty()

				arg_63_1.typewritterCharCountI18N = 0

				arg_63_1:ShowNextGo(false)
			end

			local var_66_45 = 4

			if var_66_45 < arg_63_1.time_ and arg_63_1.time_ <= var_66_45 + arg_66_0 then
				arg_63_1.allBtn_.enabled = false
			end

			local var_66_46 = 3.53333333333333

			if arg_63_1.time_ >= var_66_45 + var_66_46 and arg_63_1.time_ < var_66_45 + var_66_46 + arg_66_0 then
				arg_63_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381016 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 116381016
		arg_67_1.duration_ = 7.696999999999

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play116381017(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = 0

			if var_70_0 < arg_67_1.time_ and arg_67_1.time_ <= var_70_0 + arg_70_0 then
				arg_67_1.var_.oldValueTypewriter = arg_67_1.fswtw_.percent

				arg_67_1:ShowNextGo(false)
			end

			local var_70_1 = 93
			local var_70_2 = 2.66666666666667
			local var_70_3 = arg_67_1:GetWordFromCfg(116381015)
			local var_70_4 = arg_67_1:FormatText(var_70_3.content)
			local var_70_5, var_70_6 = arg_67_1:GetPercentByPara(var_70_4, 2)

			if var_70_0 < arg_67_1.time_ and arg_67_1.time_ <= var_70_0 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0

				local var_70_7 = var_70_1 <= 0 and var_70_2 or var_70_2 * ((var_70_6 - arg_67_1.typewritterCharCountI18N) / var_70_1)

				if var_70_7 > 0 and var_70_2 < var_70_7 then
					arg_67_1.talkMaxDuration = var_70_7

					if var_70_7 + var_70_0 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_7 + var_70_0
					end
				end
			end

			local var_70_8 = 2.66666666666667
			local var_70_9 = math.max(var_70_8, arg_67_1.talkMaxDuration)

			if var_70_0 <= arg_67_1.time_ and arg_67_1.time_ < var_70_0 + var_70_9 then
				local var_70_10 = (arg_67_1.time_ - var_70_0) / var_70_9

				arg_67_1.fswtw_.percent = Mathf.Lerp(arg_67_1.var_.oldValueTypewriter, var_70_5, var_70_10)
				arg_67_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_67_1.fswtw_:SetDirty()
			end

			if arg_67_1.time_ >= var_70_0 + var_70_9 and arg_67_1.time_ < var_70_0 + var_70_9 + arg_70_0 then
				arg_67_1.fswtw_.percent = var_70_5

				arg_67_1.fswtw_:SetDirty()
				arg_67_1:ShowNextGo(true)

				arg_67_1.typewritterCharCountI18N = var_70_6
			end

			local var_70_11 = 0
			local var_70_12 = 7.697
			local var_70_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381016", "story_v_out_116381.awb") / 1000

			if var_70_13 > 0 and var_70_12 < var_70_13 and var_70_13 + var_70_11 > arg_67_1.duration_ then
				local var_70_14 = var_70_13

				arg_67_1.duration_ = var_70_13 + var_70_11
			end

			if var_70_11 < arg_67_1.time_ and arg_67_1.time_ <= var_70_11 + arg_70_0 then
				local var_70_15 = "play"
				local var_70_16 = "voice"

				arg_67_1:AudioAction(var_70_15, var_70_16, "story_v_out_116381", "116381016", "story_v_out_116381.awb")
			end

			local var_70_17 = 0

			if var_70_17 < arg_67_1.time_ and arg_67_1.time_ <= var_70_17 + arg_70_0 then
				arg_67_1.allBtn_.enabled = false
			end

			local var_70_18 = 2.66666666666667

			if arg_67_1.time_ >= var_70_17 + var_70_18 and arg_67_1.time_ < var_70_17 + var_70_18 + arg_70_0 then
				arg_67_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381017 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 116381017
		arg_71_1.duration_ = 3.494999999999

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play116381018(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				arg_71_1.var_.oldValueTypewriter = arg_71_1.fswtw_.percent

				arg_71_1:ShowNextGo(false)
			end

			local var_74_1 = 12
			local var_74_2 = 0.8
			local var_74_3 = arg_71_1:GetWordFromCfg(116381015)
			local var_74_4 = arg_71_1:FormatText(var_74_3.content)
			local var_74_5, var_74_6 = arg_71_1:GetPercentByPara(var_74_4, 3)

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0

				local var_74_7 = var_74_1 <= 0 and var_74_2 or var_74_2 * ((var_74_6 - arg_71_1.typewritterCharCountI18N) / var_74_1)

				if var_74_7 > 0 and var_74_2 < var_74_7 then
					arg_71_1.talkMaxDuration = var_74_7

					if var_74_7 + var_74_0 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_7 + var_74_0
					end
				end
			end

			local var_74_8 = 0.8
			local var_74_9 = math.max(var_74_8, arg_71_1.talkMaxDuration)

			if var_74_0 <= arg_71_1.time_ and arg_71_1.time_ < var_74_0 + var_74_9 then
				local var_74_10 = (arg_71_1.time_ - var_74_0) / var_74_9

				arg_71_1.fswtw_.percent = Mathf.Lerp(arg_71_1.var_.oldValueTypewriter, var_74_5, var_74_10)
				arg_71_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_71_1.fswtw_:SetDirty()
			end

			if arg_71_1.time_ >= var_74_0 + var_74_9 and arg_71_1.time_ < var_74_0 + var_74_9 + arg_74_0 then
				arg_71_1.fswtw_.percent = var_74_5

				arg_71_1.fswtw_:SetDirty()
				arg_71_1:ShowNextGo(true)

				arg_71_1.typewritterCharCountI18N = var_74_6
			end

			local var_74_11 = 0
			local var_74_12 = 3.495
			local var_74_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381017", "story_v_out_116381.awb") / 1000

			if var_74_13 > 0 and var_74_12 < var_74_13 and var_74_13 + var_74_11 > arg_71_1.duration_ then
				local var_74_14 = var_74_13

				arg_71_1.duration_ = var_74_13 + var_74_11
			end

			if var_74_11 < arg_71_1.time_ and arg_71_1.time_ <= var_74_11 + arg_74_0 then
				local var_74_15 = "play"
				local var_74_16 = "voice"

				arg_71_1:AudioAction(var_74_15, var_74_16, "story_v_out_116381", "116381017", "story_v_out_116381.awb")
			end

			local var_74_17 = 0

			if var_74_17 < arg_71_1.time_ and arg_71_1.time_ <= var_74_17 + arg_74_0 then
				arg_71_1.allBtn_.enabled = false
			end

			local var_74_18 = 0.8

			if arg_71_1.time_ >= var_74_17 + var_74_18 and arg_71_1.time_ < var_74_17 + var_74_18 + arg_74_0 then
				arg_71_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381018 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 116381018
		arg_75_1.duration_ = 13.848999999999

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play116381019(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = 0

			if var_78_0 < arg_75_1.time_ and arg_75_1.time_ <= var_78_0 + arg_78_0 then
				arg_75_1.var_.oldValueTypewriter = arg_75_1.fswtw_.percent

				arg_75_1:ShowNextGo(false)
			end

			local var_78_1 = 64
			local var_78_2 = 4.26666666666667
			local var_78_3 = arg_75_1:GetWordFromCfg(116381015)
			local var_78_4 = arg_75_1:FormatText(var_78_3.content)
			local var_78_5, var_78_6 = arg_75_1:GetPercentByPara(var_78_4, 4)

			if var_78_0 < arg_75_1.time_ and arg_75_1.time_ <= var_78_0 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0

				local var_78_7 = var_78_1 <= 0 and var_78_2 or var_78_2 * ((var_78_6 - arg_75_1.typewritterCharCountI18N) / var_78_1)

				if var_78_7 > 0 and var_78_2 < var_78_7 then
					arg_75_1.talkMaxDuration = var_78_7

					if var_78_7 + var_78_0 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_7 + var_78_0
					end
				end
			end

			local var_78_8 = 4.26666666666667
			local var_78_9 = math.max(var_78_8, arg_75_1.talkMaxDuration)

			if var_78_0 <= arg_75_1.time_ and arg_75_1.time_ < var_78_0 + var_78_9 then
				local var_78_10 = (arg_75_1.time_ - var_78_0) / var_78_9

				arg_75_1.fswtw_.percent = Mathf.Lerp(arg_75_1.var_.oldValueTypewriter, var_78_5, var_78_10)
				arg_75_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_75_1.fswtw_:SetDirty()
			end

			if arg_75_1.time_ >= var_78_0 + var_78_9 and arg_75_1.time_ < var_78_0 + var_78_9 + arg_78_0 then
				arg_75_1.fswtw_.percent = var_78_5

				arg_75_1.fswtw_:SetDirty()
				arg_75_1:ShowNextGo(true)

				arg_75_1.typewritterCharCountI18N = var_78_6
			end

			local var_78_11 = 0
			local var_78_12 = 13.849
			local var_78_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381018", "story_v_out_116381.awb") / 1000

			if var_78_13 > 0 and var_78_12 < var_78_13 and var_78_13 + var_78_11 > arg_75_1.duration_ then
				local var_78_14 = var_78_13

				arg_75_1.duration_ = var_78_13 + var_78_11
			end

			if var_78_11 < arg_75_1.time_ and arg_75_1.time_ <= var_78_11 + arg_78_0 then
				local var_78_15 = "play"
				local var_78_16 = "voice"

				arg_75_1:AudioAction(var_78_15, var_78_16, "story_v_out_116381", "116381018", "story_v_out_116381.awb")
			end

			local var_78_17 = 0

			if var_78_17 < arg_75_1.time_ and arg_75_1.time_ <= var_78_17 + arg_78_0 then
				arg_75_1.allBtn_.enabled = false
			end

			local var_78_18 = 4.26666666666667

			if arg_75_1.time_ >= var_78_17 + var_78_18 and arg_75_1.time_ < var_78_17 + var_78_18 + arg_78_0 then
				arg_75_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381019 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 116381019
		arg_79_1.duration_ = 4.214999999999

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play116381020(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = 0

			if var_82_0 < arg_79_1.time_ and arg_79_1.time_ <= var_82_0 + arg_82_0 then
				arg_79_1.var_.oldValueTypewriter = arg_79_1.fswtw_.percent

				arg_79_1:ShowNextGo(false)
			end

			local var_82_1 = 15
			local var_82_2 = 1
			local var_82_3 = arg_79_1:GetWordFromCfg(116381015)
			local var_82_4 = arg_79_1:FormatText(var_82_3.content)
			local var_82_5, var_82_6 = arg_79_1:GetPercentByPara(var_82_4, 5)

			if var_82_0 < arg_79_1.time_ and arg_79_1.time_ <= var_82_0 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0

				local var_82_7 = var_82_1 <= 0 and var_82_2 or var_82_2 * ((var_82_6 - arg_79_1.typewritterCharCountI18N) / var_82_1)

				if var_82_7 > 0 and var_82_2 < var_82_7 then
					arg_79_1.talkMaxDuration = var_82_7

					if var_82_7 + var_82_0 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_7 + var_82_0
					end
				end
			end

			local var_82_8 = 1
			local var_82_9 = math.max(var_82_8, arg_79_1.talkMaxDuration)

			if var_82_0 <= arg_79_1.time_ and arg_79_1.time_ < var_82_0 + var_82_9 then
				local var_82_10 = (arg_79_1.time_ - var_82_0) / var_82_9

				arg_79_1.fswtw_.percent = Mathf.Lerp(arg_79_1.var_.oldValueTypewriter, var_82_5, var_82_10)
				arg_79_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_79_1.fswtw_:SetDirty()
			end

			if arg_79_1.time_ >= var_82_0 + var_82_9 and arg_79_1.time_ < var_82_0 + var_82_9 + arg_82_0 then
				arg_79_1.fswtw_.percent = var_82_5

				arg_79_1.fswtw_:SetDirty()
				arg_79_1:ShowNextGo(true)

				arg_79_1.typewritterCharCountI18N = var_82_6
			end

			local var_82_11 = 0
			local var_82_12 = 4.215
			local var_82_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381019", "story_v_out_116381.awb") / 1000

			if var_82_13 > 0 and var_82_12 < var_82_13 and var_82_13 + var_82_11 > arg_79_1.duration_ then
				local var_82_14 = var_82_13

				arg_79_1.duration_ = var_82_13 + var_82_11
			end

			if var_82_11 < arg_79_1.time_ and arg_79_1.time_ <= var_82_11 + arg_82_0 then
				local var_82_15 = "play"
				local var_82_16 = "voice"

				arg_79_1:AudioAction(var_82_15, var_82_16, "story_v_out_116381", "116381019", "story_v_out_116381.awb")
			end

			local var_82_17 = 0

			if var_82_17 < arg_79_1.time_ and arg_79_1.time_ <= var_82_17 + arg_82_0 then
				arg_79_1.allBtn_.enabled = false
			end

			local var_82_18 = 1

			if arg_79_1.time_ >= var_82_17 + var_82_18 and arg_79_1.time_ < var_82_17 + var_82_18 + arg_82_0 then
				arg_79_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381020 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 116381020
		arg_83_1.duration_ = 10.606999999999

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play116381021(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				arg_83_1.var_.oldValueTypewriter = arg_83_1.fswtw_.percent

				arg_83_1:ShowNextGo(false)
			end

			local var_86_1 = 49
			local var_86_2 = 3.26666666666667
			local var_86_3 = arg_83_1:GetWordFromCfg(116381015)
			local var_86_4 = arg_83_1:FormatText(var_86_3.content)
			local var_86_5, var_86_6 = arg_83_1:GetPercentByPara(var_86_4, 6)

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0

				local var_86_7 = var_86_1 <= 0 and var_86_2 or var_86_2 * ((var_86_6 - arg_83_1.typewritterCharCountI18N) / var_86_1)

				if var_86_7 > 0 and var_86_2 < var_86_7 then
					arg_83_1.talkMaxDuration = var_86_7

					if var_86_7 + var_86_0 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_7 + var_86_0
					end
				end
			end

			local var_86_8 = 3.26666666666667
			local var_86_9 = math.max(var_86_8, arg_83_1.talkMaxDuration)

			if var_86_0 <= arg_83_1.time_ and arg_83_1.time_ < var_86_0 + var_86_9 then
				local var_86_10 = (arg_83_1.time_ - var_86_0) / var_86_9

				arg_83_1.fswtw_.percent = Mathf.Lerp(arg_83_1.var_.oldValueTypewriter, var_86_5, var_86_10)
				arg_83_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_83_1.fswtw_:SetDirty()
			end

			if arg_83_1.time_ >= var_86_0 + var_86_9 and arg_83_1.time_ < var_86_0 + var_86_9 + arg_86_0 then
				arg_83_1.fswtw_.percent = var_86_5

				arg_83_1.fswtw_:SetDirty()
				arg_83_1:ShowNextGo(true)

				arg_83_1.typewritterCharCountI18N = var_86_6
			end

			local var_86_11 = 0
			local var_86_12 = 10.607
			local var_86_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381020", "story_v_out_116381.awb") / 1000

			if var_86_13 > 0 and var_86_12 < var_86_13 and var_86_13 + var_86_11 > arg_83_1.duration_ then
				local var_86_14 = var_86_13

				arg_83_1.duration_ = var_86_13 + var_86_11
			end

			if var_86_11 < arg_83_1.time_ and arg_83_1.time_ <= var_86_11 + arg_86_0 then
				local var_86_15 = "play"
				local var_86_16 = "voice"

				arg_83_1:AudioAction(var_86_15, var_86_16, "story_v_out_116381", "116381020", "story_v_out_116381.awb")
			end

			local var_86_17 = 0

			if var_86_17 < arg_83_1.time_ and arg_83_1.time_ <= var_86_17 + arg_86_0 then
				arg_83_1.allBtn_.enabled = false
			end

			local var_86_18 = 3.26666666666667

			if arg_83_1.time_ >= var_86_17 + var_86_18 and arg_83_1.time_ < var_86_17 + var_86_18 + arg_86_0 then
				arg_83_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 116381021
		arg_87_1.duration_ = 7.806999999999

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
		end

		function arg_87_1.playNext_(arg_89_0)
			if arg_89_0 == 1 then
				arg_87_0:Play116381022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 0

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				arg_87_1.var_.oldValueTypewriter = arg_87_1.fswtw_.percent

				arg_87_1:ShowNextGo(false)
			end

			local var_90_1 = 43
			local var_90_2 = 2.86666666666667
			local var_90_3 = arg_87_1:GetWordFromCfg(116381015)
			local var_90_4 = arg_87_1:FormatText(var_90_3.content)
			local var_90_5, var_90_6 = arg_87_1:GetPercentByPara(var_90_4, 7)

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0

				local var_90_7 = var_90_1 <= 0 and var_90_2 or var_90_2 * ((var_90_6 - arg_87_1.typewritterCharCountI18N) / var_90_1)

				if var_90_7 > 0 and var_90_2 < var_90_7 then
					arg_87_1.talkMaxDuration = var_90_7

					if var_90_7 + var_90_0 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_7 + var_90_0
					end
				end
			end

			local var_90_8 = 2.86666666666667
			local var_90_9 = math.max(var_90_8, arg_87_1.talkMaxDuration)

			if var_90_0 <= arg_87_1.time_ and arg_87_1.time_ < var_90_0 + var_90_9 then
				local var_90_10 = (arg_87_1.time_ - var_90_0) / var_90_9

				arg_87_1.fswtw_.percent = Mathf.Lerp(arg_87_1.var_.oldValueTypewriter, var_90_5, var_90_10)
				arg_87_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_87_1.fswtw_:SetDirty()
			end

			if arg_87_1.time_ >= var_90_0 + var_90_9 and arg_87_1.time_ < var_90_0 + var_90_9 + arg_90_0 then
				arg_87_1.fswtw_.percent = var_90_5

				arg_87_1.fswtw_:SetDirty()
				arg_87_1:ShowNextGo(true)

				arg_87_1.typewritterCharCountI18N = var_90_6
			end

			local var_90_11 = 0
			local var_90_12 = 7.807
			local var_90_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381021", "story_v_out_116381.awb") / 1000

			if var_90_13 > 0 and var_90_12 < var_90_13 and var_90_13 + var_90_11 > arg_87_1.duration_ then
				local var_90_14 = var_90_13

				arg_87_1.duration_ = var_90_13 + var_90_11
			end

			if var_90_11 < arg_87_1.time_ and arg_87_1.time_ <= var_90_11 + arg_90_0 then
				local var_90_15 = "play"
				local var_90_16 = "voice"

				arg_87_1:AudioAction(var_90_15, var_90_16, "story_v_out_116381", "116381021", "story_v_out_116381.awb")
			end

			local var_90_17 = 0

			if var_90_17 < arg_87_1.time_ and arg_87_1.time_ <= var_90_17 + arg_90_0 then
				arg_87_1.allBtn_.enabled = false
			end

			local var_90_18 = 2.86666666666667

			if arg_87_1.time_ >= var_90_17 + var_90_18 and arg_87_1.time_ < var_90_17 + var_90_18 + arg_90_0 then
				arg_87_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 116381022
		arg_91_1.duration_ = 20.4

		local var_91_0 = {
			zh = 15.7,
			ja = 20.4
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
				arg_91_0:Play116381023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = "SK0106"

			if arg_91_1.bgs_[var_94_0] == nil then
				local var_94_1 = Object.Instantiate(arg_91_1.paintGo_)

				var_94_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_94_0)
				var_94_1.name = var_94_0
				var_94_1.transform.parent = arg_91_1.stage_.transform
				var_94_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_91_1.bgs_[var_94_0] = var_94_1
			end

			local var_94_2 = 2

			if var_94_2 < arg_91_1.time_ and arg_91_1.time_ <= var_94_2 + arg_94_0 then
				local var_94_3 = manager.ui.mainCamera.transform.localPosition
				local var_94_4 = Vector3.New(0, 0, 10) + Vector3.New(var_94_3.x, var_94_3.y, 0)
				local var_94_5 = arg_91_1.bgs_.SK0106

				var_94_5.transform.localPosition = var_94_4
				var_94_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_94_6 = var_94_5:GetComponent("SpriteRenderer")

				if var_94_6 and var_94_6.sprite then
					local var_94_7 = (var_94_5.transform.localPosition - var_94_3).z
					local var_94_8 = manager.ui.mainCameraCom_
					local var_94_9 = 2 * var_94_7 * Mathf.Tan(var_94_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_94_10 = var_94_9 * var_94_8.aspect
					local var_94_11 = var_94_6.sprite.bounds.size.x
					local var_94_12 = var_94_6.sprite.bounds.size.y
					local var_94_13 = var_94_10 / var_94_11
					local var_94_14 = var_94_9 / var_94_12
					local var_94_15 = var_94_14 < var_94_13 and var_94_13 or var_94_14

					var_94_5.transform.localScale = Vector3.New(var_94_15, var_94_15, 0)
				end

				for iter_94_0, iter_94_1 in pairs(arg_91_1.bgs_) do
					if iter_94_0 ~= "SK0106" then
						iter_94_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_94_16 = 0

			if var_94_16 < arg_91_1.time_ and arg_91_1.time_ <= var_94_16 + arg_94_0 then
				arg_91_1.mask_.enabled = true
				arg_91_1.mask_.raycastTarget = true

				arg_91_1:SetGaussion(false)
			end

			local var_94_17 = 2

			if var_94_16 <= arg_91_1.time_ and arg_91_1.time_ < var_94_16 + var_94_17 then
				local var_94_18 = (arg_91_1.time_ - var_94_16) / var_94_17
				local var_94_19 = Color.New(0, 0, 0)

				var_94_19.a = Mathf.Lerp(0, 1, var_94_18)
				arg_91_1.mask_.color = var_94_19
			end

			if arg_91_1.time_ >= var_94_16 + var_94_17 and arg_91_1.time_ < var_94_16 + var_94_17 + arg_94_0 then
				local var_94_20 = Color.New(0, 0, 0)

				var_94_20.a = 1
				arg_91_1.mask_.color = var_94_20
			end

			local var_94_21 = 2

			if var_94_21 < arg_91_1.time_ and arg_91_1.time_ <= var_94_21 + arg_94_0 then
				arg_91_1.mask_.enabled = true
				arg_91_1.mask_.raycastTarget = true

				arg_91_1:SetGaussion(false)
			end

			local var_94_22 = 2

			if var_94_21 <= arg_91_1.time_ and arg_91_1.time_ < var_94_21 + var_94_22 then
				local var_94_23 = (arg_91_1.time_ - var_94_21) / var_94_22
				local var_94_24 = Color.New(0, 0, 0)

				var_94_24.a = Mathf.Lerp(1, 0, var_94_23)
				arg_91_1.mask_.color = var_94_24
			end

			if arg_91_1.time_ >= var_94_21 + var_94_22 and arg_91_1.time_ < var_94_21 + var_94_22 + arg_94_0 then
				local var_94_25 = Color.New(0, 0, 0)
				local var_94_26 = 0

				arg_91_1.mask_.enabled = false
				var_94_25.a = var_94_26
				arg_91_1.mask_.color = var_94_25
			end

			local var_94_27 = 2

			if var_94_27 < arg_91_1.time_ and arg_91_1.time_ <= var_94_27 + arg_94_0 then
				arg_91_1.fswbg_:SetActive(false)
				arg_91_1.dialog_:SetActive(false)
				arg_91_1:ShowNextGo(false)
			end

			local var_94_28 = 2

			if var_94_28 < arg_91_1.time_ and arg_91_1.time_ <= var_94_28 + arg_94_0 then
				arg_91_1.screenFilterGo_:SetActive(true)

				arg_91_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
			end

			local var_94_29 = 0.1

			if var_94_28 <= arg_91_1.time_ and arg_91_1.time_ < var_94_28 + var_94_29 then
				local var_94_30 = (arg_91_1.time_ - var_94_28) / var_94_29

				arg_91_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_94_30)
			end

			if arg_91_1.time_ >= var_94_28 + var_94_29 and arg_91_1.time_ < var_94_28 + var_94_29 + arg_94_0 then
				arg_91_1.screenFilterEffect_.weight = 1
			end

			if arg_91_1.frameCnt_ <= 1 then
				arg_91_1.dialog_:SetActive(false)
			end

			local var_94_31 = 4
			local var_94_32 = 0.875

			if var_94_31 < arg_91_1.time_ and arg_91_1.time_ <= var_94_31 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0

				arg_91_1.dialog_:SetActive(true)

				local var_94_33 = LeanTween.value(arg_91_1.dialog_, 0, 1, 0.3)

				var_94_33:setOnUpdate(LuaHelper.FloatAction(function(arg_95_0)
					arg_91_1.dialogCg_.alpha = arg_95_0
				end))
				var_94_33:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_91_1.dialog_)
					var_94_33:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_91_1.duration_ = arg_91_1.duration_ + 0.3

				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_34 = arg_91_1:FormatText(StoryNameCfg[328].name)

				arg_91_1.leftNameTxt_.text = var_94_34

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, true)
				arg_91_1.iconController_:SetSelectedState("hero")

				arg_91_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10032")

				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_35 = arg_91_1:GetWordFromCfg(116381022)
				local var_94_36 = arg_91_1:FormatText(var_94_35.content)

				arg_91_1.text_.text = var_94_36

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_37 = 35
				local var_94_38 = utf8.len(var_94_36)
				local var_94_39 = var_94_37 <= 0 and var_94_32 or var_94_32 * (var_94_38 / var_94_37)

				if var_94_39 > 0 and var_94_32 < var_94_39 then
					arg_91_1.talkMaxDuration = var_94_39
					var_94_31 = var_94_31 + 0.3

					if var_94_39 + var_94_31 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_39 + var_94_31
					end
				end

				arg_91_1.text_.text = var_94_36
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116381", "116381022", "story_v_out_116381.awb") ~= 0 then
					local var_94_40 = manager.audio:GetVoiceLength("story_v_out_116381", "116381022", "story_v_out_116381.awb") / 1000

					if var_94_40 + var_94_31 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_40 + var_94_31
					end

					if var_94_35.prefab_name ~= "" and arg_91_1.actors_[var_94_35.prefab_name] ~= nil then
						local var_94_41 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_35.prefab_name].transform, "story_v_out_116381", "116381022", "story_v_out_116381.awb")

						arg_91_1:RecordAudio("116381022", var_94_41)
						arg_91_1:RecordAudio("116381022", var_94_41)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_116381", "116381022", "story_v_out_116381.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_116381", "116381022", "story_v_out_116381.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_42 = var_94_31 + 0.3
			local var_94_43 = math.max(var_94_32, arg_91_1.talkMaxDuration)

			if var_94_42 <= arg_91_1.time_ and arg_91_1.time_ < var_94_42 + var_94_43 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_42) / var_94_43

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_42 + var_94_43 and arg_91_1.time_ < var_94_42 + var_94_43 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play116381023 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 116381023
		arg_97_1.duration_ = 15.733

		local var_97_0 = {
			zh = 12.1,
			ja = 15.733
		}
		local var_97_1 = manager.audio:GetLocalizationFlag()

		if var_97_0[var_97_1] ~= nil then
			arg_97_1.duration_ = var_97_0[var_97_1]
		end

		SetActive(arg_97_1.tipsGo_, false)

		function arg_97_1.onSingleLineFinish_()
			arg_97_1.onSingleLineUpdate_ = nil
			arg_97_1.onSingleLineFinish_ = nil
			arg_97_1.state_ = "waiting"
		end

		function arg_97_1.playNext_(arg_99_0)
			if arg_99_0 == 1 then
				arg_97_0:Play116381024(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = 0
			local var_100_1 = 1.15

			if var_100_0 < arg_97_1.time_ and arg_97_1.time_ <= var_100_0 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_2 = arg_97_1:FormatText(StoryNameCfg[328].name)

				arg_97_1.leftNameTxt_.text = var_100_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, true)
				arg_97_1.iconController_:SetSelectedState("hero")

				arg_97_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10032")

				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_3 = arg_97_1:GetWordFromCfg(116381023)
				local var_100_4 = arg_97_1:FormatText(var_100_3.content)

				arg_97_1.text_.text = var_100_4

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_5 = 46
				local var_100_6 = utf8.len(var_100_4)
				local var_100_7 = var_100_5 <= 0 and var_100_1 or var_100_1 * (var_100_6 / var_100_5)

				if var_100_7 > 0 and var_100_1 < var_100_7 then
					arg_97_1.talkMaxDuration = var_100_7

					if var_100_7 + var_100_0 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_7 + var_100_0
					end
				end

				arg_97_1.text_.text = var_100_4
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116381", "116381023", "story_v_out_116381.awb") ~= 0 then
					local var_100_8 = manager.audio:GetVoiceLength("story_v_out_116381", "116381023", "story_v_out_116381.awb") / 1000

					if var_100_8 + var_100_0 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_8 + var_100_0
					end

					if var_100_3.prefab_name ~= "" and arg_97_1.actors_[var_100_3.prefab_name] ~= nil then
						local var_100_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_3.prefab_name].transform, "story_v_out_116381", "116381023", "story_v_out_116381.awb")

						arg_97_1:RecordAudio("116381023", var_100_9)
						arg_97_1:RecordAudio("116381023", var_100_9)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_116381", "116381023", "story_v_out_116381.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_116381", "116381023", "story_v_out_116381.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_10 = math.max(var_100_1, arg_97_1.talkMaxDuration)

			if var_100_0 <= arg_97_1.time_ and arg_97_1.time_ < var_100_0 + var_100_10 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_0) / var_100_10

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_0 + var_100_10 and arg_97_1.time_ < var_100_0 + var_100_10 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play116381024 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 116381024
		arg_101_1.duration_ = 8.8

		local var_101_0 = {
			zh = 4.066,
			ja = 8.8
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
				arg_101_0:Play116381025(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = 0
			local var_104_1 = 0.375

			if var_104_0 < arg_101_1.time_ and arg_101_1.time_ <= var_104_0 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_2 = arg_101_1:FormatText(StoryNameCfg[328].name)

				arg_101_1.leftNameTxt_.text = var_104_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, true)
				arg_101_1.iconController_:SetSelectedState("hero")

				arg_101_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10032")

				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_3 = arg_101_1:GetWordFromCfg(116381024)
				local var_104_4 = arg_101_1:FormatText(var_104_3.content)

				arg_101_1.text_.text = var_104_4

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_5 = 15
				local var_104_6 = utf8.len(var_104_4)
				local var_104_7 = var_104_5 <= 0 and var_104_1 or var_104_1 * (var_104_6 / var_104_5)

				if var_104_7 > 0 and var_104_1 < var_104_7 then
					arg_101_1.talkMaxDuration = var_104_7

					if var_104_7 + var_104_0 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_7 + var_104_0
					end
				end

				arg_101_1.text_.text = var_104_4
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116381", "116381024", "story_v_out_116381.awb") ~= 0 then
					local var_104_8 = manager.audio:GetVoiceLength("story_v_out_116381", "116381024", "story_v_out_116381.awb") / 1000

					if var_104_8 + var_104_0 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_8 + var_104_0
					end

					if var_104_3.prefab_name ~= "" and arg_101_1.actors_[var_104_3.prefab_name] ~= nil then
						local var_104_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_3.prefab_name].transform, "story_v_out_116381", "116381024", "story_v_out_116381.awb")

						arg_101_1:RecordAudio("116381024", var_104_9)
						arg_101_1:RecordAudio("116381024", var_104_9)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_116381", "116381024", "story_v_out_116381.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_116381", "116381024", "story_v_out_116381.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_10 = math.max(var_104_1, arg_101_1.talkMaxDuration)

			if var_104_0 <= arg_101_1.time_ and arg_101_1.time_ < var_104_0 + var_104_10 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_0) / var_104_10

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_0 + var_104_10 and arg_101_1.time_ < var_104_0 + var_104_10 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play116381025 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 116381025
		arg_105_1.duration_ = 3.833

		local var_105_0 = {
			zh = 3.2,
			ja = 3.833
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
				arg_105_0:Play116381026(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = 0
			local var_108_1 = 0.35

			if var_108_0 < arg_105_1.time_ and arg_105_1.time_ <= var_108_0 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_2 = arg_105_1:FormatText(StoryNameCfg[337].name)

				arg_105_1.leftNameTxt_.text = var_108_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, true)
				arg_105_1.iconController_:SetSelectedState("hero")

				arg_105_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10046")

				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_3 = arg_105_1:GetWordFromCfg(116381025)
				local var_108_4 = arg_105_1:FormatText(var_108_3.content)

				arg_105_1.text_.text = var_108_4

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_5 = 13
				local var_108_6 = utf8.len(var_108_4)
				local var_108_7 = var_108_5 <= 0 and var_108_1 or var_108_1 * (var_108_6 / var_108_5)

				if var_108_7 > 0 and var_108_1 < var_108_7 then
					arg_105_1.talkMaxDuration = var_108_7

					if var_108_7 + var_108_0 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_7 + var_108_0
					end
				end

				arg_105_1.text_.text = var_108_4
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116381", "116381025", "story_v_out_116381.awb") ~= 0 then
					local var_108_8 = manager.audio:GetVoiceLength("story_v_out_116381", "116381025", "story_v_out_116381.awb") / 1000

					if var_108_8 + var_108_0 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_8 + var_108_0
					end

					if var_108_3.prefab_name ~= "" and arg_105_1.actors_[var_108_3.prefab_name] ~= nil then
						local var_108_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_3.prefab_name].transform, "story_v_out_116381", "116381025", "story_v_out_116381.awb")

						arg_105_1:RecordAudio("116381025", var_108_9)
						arg_105_1:RecordAudio("116381025", var_108_9)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_116381", "116381025", "story_v_out_116381.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_116381", "116381025", "story_v_out_116381.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_10 = math.max(var_108_1, arg_105_1.talkMaxDuration)

			if var_108_0 <= arg_105_1.time_ and arg_105_1.time_ < var_108_0 + var_108_10 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_0) / var_108_10

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_0 + var_108_10 and arg_105_1.time_ < var_108_0 + var_108_10 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play116381026 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 116381026
		arg_109_1.duration_ = 12.733

		local var_109_0 = {
			zh = 12.733,
			ja = 9.8
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
				arg_109_0:Play116381027(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = "SK0102"

			if arg_109_1.bgs_[var_112_0] == nil then
				local var_112_1 = Object.Instantiate(arg_109_1.paintGo_)

				var_112_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_112_0)
				var_112_1.name = var_112_0
				var_112_1.transform.parent = arg_109_1.stage_.transform
				var_112_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_109_1.bgs_[var_112_0] = var_112_1
			end

			local var_112_2 = 2

			if var_112_2 < arg_109_1.time_ and arg_109_1.time_ <= var_112_2 + arg_112_0 then
				local var_112_3 = manager.ui.mainCamera.transform.localPosition
				local var_112_4 = Vector3.New(0, 0, 10) + Vector3.New(var_112_3.x, var_112_3.y, 0)
				local var_112_5 = arg_109_1.bgs_.SK0102

				var_112_5.transform.localPosition = var_112_4
				var_112_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_112_6 = var_112_5:GetComponent("SpriteRenderer")

				if var_112_6 and var_112_6.sprite then
					local var_112_7 = (var_112_5.transform.localPosition - var_112_3).z
					local var_112_8 = manager.ui.mainCameraCom_
					local var_112_9 = 2 * var_112_7 * Mathf.Tan(var_112_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_112_10 = var_112_9 * var_112_8.aspect
					local var_112_11 = var_112_6.sprite.bounds.size.x
					local var_112_12 = var_112_6.sprite.bounds.size.y
					local var_112_13 = var_112_10 / var_112_11
					local var_112_14 = var_112_9 / var_112_12
					local var_112_15 = var_112_14 < var_112_13 and var_112_13 or var_112_14

					var_112_5.transform.localScale = Vector3.New(var_112_15, var_112_15, 0)
				end

				for iter_112_0, iter_112_1 in pairs(arg_109_1.bgs_) do
					if iter_112_0 ~= "SK0102" then
						iter_112_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_112_16 = 0

			if var_112_16 < arg_109_1.time_ and arg_109_1.time_ <= var_112_16 + arg_112_0 then
				arg_109_1.mask_.enabled = true
				arg_109_1.mask_.raycastTarget = true

				arg_109_1:SetGaussion(false)
			end

			local var_112_17 = 2

			if var_112_16 <= arg_109_1.time_ and arg_109_1.time_ < var_112_16 + var_112_17 then
				local var_112_18 = (arg_109_1.time_ - var_112_16) / var_112_17
				local var_112_19 = Color.New(0, 0, 0)

				var_112_19.a = Mathf.Lerp(0, 1, var_112_18)
				arg_109_1.mask_.color = var_112_19
			end

			if arg_109_1.time_ >= var_112_16 + var_112_17 and arg_109_1.time_ < var_112_16 + var_112_17 + arg_112_0 then
				local var_112_20 = Color.New(0, 0, 0)

				var_112_20.a = 1
				arg_109_1.mask_.color = var_112_20
			end

			local var_112_21 = 2

			if var_112_21 < arg_109_1.time_ and arg_109_1.time_ <= var_112_21 + arg_112_0 then
				arg_109_1.mask_.enabled = true
				arg_109_1.mask_.raycastTarget = true

				arg_109_1:SetGaussion(false)
			end

			local var_112_22 = 2

			if var_112_21 <= arg_109_1.time_ and arg_109_1.time_ < var_112_21 + var_112_22 then
				local var_112_23 = (arg_109_1.time_ - var_112_21) / var_112_22
				local var_112_24 = Color.New(0, 0, 0)

				var_112_24.a = Mathf.Lerp(1, 0, var_112_23)
				arg_109_1.mask_.color = var_112_24
			end

			if arg_109_1.time_ >= var_112_21 + var_112_22 and arg_109_1.time_ < var_112_21 + var_112_22 + arg_112_0 then
				local var_112_25 = Color.New(0, 0, 0)
				local var_112_26 = 0

				arg_109_1.mask_.enabled = false
				var_112_25.a = var_112_26
				arg_109_1.mask_.color = var_112_25
			end

			if arg_109_1.frameCnt_ <= 1 then
				arg_109_1.dialog_:SetActive(false)
			end

			local var_112_27 = 4
			local var_112_28 = 0.45

			if var_112_27 < arg_109_1.time_ and arg_109_1.time_ <= var_112_27 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0

				arg_109_1.dialog_:SetActive(true)

				local var_112_29 = LeanTween.value(arg_109_1.dialog_, 0, 1, 0.3)

				var_112_29:setOnUpdate(LuaHelper.FloatAction(function(arg_113_0)
					arg_109_1.dialogCg_.alpha = arg_113_0
				end))
				var_112_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_109_1.dialog_)
					var_112_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_109_1.duration_ = arg_109_1.duration_ + 0.3

				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_30 = arg_109_1:FormatText(StoryNameCfg[328].name)

				arg_109_1.leftNameTxt_.text = var_112_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, true)
				arg_109_1.iconController_:SetSelectedState("hero")

				arg_109_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10032")

				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_31 = arg_109_1:GetWordFromCfg(116381026)
				local var_112_32 = arg_109_1:FormatText(var_112_31.content)

				arg_109_1.text_.text = var_112_32

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_33 = 19
				local var_112_34 = utf8.len(var_112_32)
				local var_112_35 = var_112_33 <= 0 and var_112_28 or var_112_28 * (var_112_34 / var_112_33)

				if var_112_35 > 0 and var_112_28 < var_112_35 then
					arg_109_1.talkMaxDuration = var_112_35
					var_112_27 = var_112_27 + 0.3

					if var_112_35 + var_112_27 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_35 + var_112_27
					end
				end

				arg_109_1.text_.text = var_112_32
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116381", "116381026", "story_v_out_116381.awb") ~= 0 then
					local var_112_36 = manager.audio:GetVoiceLength("story_v_out_116381", "116381026", "story_v_out_116381.awb") / 1000

					if var_112_36 + var_112_27 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_36 + var_112_27
					end

					if var_112_31.prefab_name ~= "" and arg_109_1.actors_[var_112_31.prefab_name] ~= nil then
						local var_112_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_31.prefab_name].transform, "story_v_out_116381", "116381026", "story_v_out_116381.awb")

						arg_109_1:RecordAudio("116381026", var_112_37)
						arg_109_1:RecordAudio("116381026", var_112_37)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_116381", "116381026", "story_v_out_116381.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_116381", "116381026", "story_v_out_116381.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_38 = var_112_27 + 0.3
			local var_112_39 = math.max(var_112_28, arg_109_1.talkMaxDuration)

			if var_112_38 <= arg_109_1.time_ and arg_109_1.time_ < var_112_38 + var_112_39 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_38) / var_112_39

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_38 + var_112_39 and arg_109_1.time_ < var_112_38 + var_112_39 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play116381027 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 116381027
		arg_115_1.duration_ = 2.666

		local var_115_0 = {
			zh = 2.666,
			ja = 1.966
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
				arg_115_0:Play116381028(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = 0
			local var_118_1 = 0.2

			if var_118_0 < arg_115_1.time_ and arg_115_1.time_ <= var_118_0 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_2 = arg_115_1:FormatText(StoryNameCfg[337].name)

				arg_115_1.leftNameTxt_.text = var_118_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, true)
				arg_115_1.iconController_:SetSelectedState("hero")

				arg_115_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10046")

				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_3 = arg_115_1:GetWordFromCfg(116381027)
				local var_118_4 = arg_115_1:FormatText(var_118_3.content)

				arg_115_1.text_.text = var_118_4

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_5 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_116381", "116381027", "story_v_out_116381.awb") ~= 0 then
					local var_118_8 = manager.audio:GetVoiceLength("story_v_out_116381", "116381027", "story_v_out_116381.awb") / 1000

					if var_118_8 + var_118_0 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_8 + var_118_0
					end

					if var_118_3.prefab_name ~= "" and arg_115_1.actors_[var_118_3.prefab_name] ~= nil then
						local var_118_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_3.prefab_name].transform, "story_v_out_116381", "116381027", "story_v_out_116381.awb")

						arg_115_1:RecordAudio("116381027", var_118_9)
						arg_115_1:RecordAudio("116381027", var_118_9)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_116381", "116381027", "story_v_out_116381.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_116381", "116381027", "story_v_out_116381.awb")
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
	Play116381028 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 116381028
		arg_119_1.duration_ = 4.566

		local var_119_0 = {
			zh = 4.566,
			ja = 4.233
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
				arg_119_0:Play116381029(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0
			local var_122_1 = 0.175

			if var_122_0 < arg_119_1.time_ and arg_119_1.time_ <= var_122_0 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_2 = arg_119_1:FormatText(StoryNameCfg[328].name)

				arg_119_1.leftNameTxt_.text = var_122_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, true)
				arg_119_1.iconController_:SetSelectedState("hero")

				arg_119_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10032")

				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_3 = arg_119_1:GetWordFromCfg(116381028)
				local var_122_4 = arg_119_1:FormatText(var_122_3.content)

				arg_119_1.text_.text = var_122_4

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_5 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_116381", "116381028", "story_v_out_116381.awb") ~= 0 then
					local var_122_8 = manager.audio:GetVoiceLength("story_v_out_116381", "116381028", "story_v_out_116381.awb") / 1000

					if var_122_8 + var_122_0 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_8 + var_122_0
					end

					if var_122_3.prefab_name ~= "" and arg_119_1.actors_[var_122_3.prefab_name] ~= nil then
						local var_122_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_3.prefab_name].transform, "story_v_out_116381", "116381028", "story_v_out_116381.awb")

						arg_119_1:RecordAudio("116381028", var_122_9)
						arg_119_1:RecordAudio("116381028", var_122_9)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_116381", "116381028", "story_v_out_116381.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_116381", "116381028", "story_v_out_116381.awb")
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
	Play116381029 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 116381029
		arg_123_1.duration_ = 11.1

		local var_123_0 = {
			zh = 9.733,
			ja = 11.1
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
				arg_123_0:Play116381030(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = "I05f"

			if arg_123_1.bgs_[var_126_0] == nil then
				local var_126_1 = Object.Instantiate(arg_123_1.paintGo_)

				var_126_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_126_0)
				var_126_1.name = var_126_0
				var_126_1.transform.parent = arg_123_1.stage_.transform
				var_126_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_123_1.bgs_[var_126_0] = var_126_1
			end

			local var_126_2 = 2

			if var_126_2 < arg_123_1.time_ and arg_123_1.time_ <= var_126_2 + arg_126_0 then
				local var_126_3 = manager.ui.mainCamera.transform.localPosition
				local var_126_4 = Vector3.New(0, 0, 10) + Vector3.New(var_126_3.x, var_126_3.y, 0)
				local var_126_5 = arg_123_1.bgs_.I05f

				var_126_5.transform.localPosition = var_126_4
				var_126_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_126_6 = var_126_5:GetComponent("SpriteRenderer")

				if var_126_6 and var_126_6.sprite then
					local var_126_7 = (var_126_5.transform.localPosition - var_126_3).z
					local var_126_8 = manager.ui.mainCameraCom_
					local var_126_9 = 2 * var_126_7 * Mathf.Tan(var_126_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_126_10 = var_126_9 * var_126_8.aspect
					local var_126_11 = var_126_6.sprite.bounds.size.x
					local var_126_12 = var_126_6.sprite.bounds.size.y
					local var_126_13 = var_126_10 / var_126_11
					local var_126_14 = var_126_9 / var_126_12
					local var_126_15 = var_126_14 < var_126_13 and var_126_13 or var_126_14

					var_126_5.transform.localScale = Vector3.New(var_126_15, var_126_15, 0)
				end

				for iter_126_0, iter_126_1 in pairs(arg_123_1.bgs_) do
					if iter_126_0 ~= "I05f" then
						iter_126_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_126_16 = 0

			if var_126_16 < arg_123_1.time_ and arg_123_1.time_ <= var_126_16 + arg_126_0 then
				arg_123_1.mask_.enabled = true
				arg_123_1.mask_.raycastTarget = true

				arg_123_1:SetGaussion(false)
			end

			local var_126_17 = 2

			if var_126_16 <= arg_123_1.time_ and arg_123_1.time_ < var_126_16 + var_126_17 then
				local var_126_18 = (arg_123_1.time_ - var_126_16) / var_126_17
				local var_126_19 = Color.New(0, 0, 0)

				var_126_19.a = Mathf.Lerp(0, 1, var_126_18)
				arg_123_1.mask_.color = var_126_19
			end

			if arg_123_1.time_ >= var_126_16 + var_126_17 and arg_123_1.time_ < var_126_16 + var_126_17 + arg_126_0 then
				local var_126_20 = Color.New(0, 0, 0)

				var_126_20.a = 1
				arg_123_1.mask_.color = var_126_20
			end

			local var_126_21 = 2

			if var_126_21 < arg_123_1.time_ and arg_123_1.time_ <= var_126_21 + arg_126_0 then
				arg_123_1.mask_.enabled = true
				arg_123_1.mask_.raycastTarget = true

				arg_123_1:SetGaussion(false)
			end

			local var_126_22 = 2

			if var_126_21 <= arg_123_1.time_ and arg_123_1.time_ < var_126_21 + var_126_22 then
				local var_126_23 = (arg_123_1.time_ - var_126_21) / var_126_22
				local var_126_24 = Color.New(0, 0, 0)

				var_126_24.a = Mathf.Lerp(1, 0, var_126_23)
				arg_123_1.mask_.color = var_126_24
			end

			if arg_123_1.time_ >= var_126_21 + var_126_22 and arg_123_1.time_ < var_126_21 + var_126_22 + arg_126_0 then
				local var_126_25 = Color.New(0, 0, 0)
				local var_126_26 = 0

				arg_123_1.mask_.enabled = false
				var_126_25.a = var_126_26
				arg_123_1.mask_.color = var_126_25
			end

			local var_126_27 = "10024ui_story"

			if arg_123_1.actors_[var_126_27] == nil then
				local var_126_28 = Object.Instantiate(Asset.Load("Char/" .. var_126_27), arg_123_1.stage_.transform)

				var_126_28.name = var_126_27
				var_126_28.transform.localPosition = Vector3.New(0, 100, 0)
				arg_123_1.actors_[var_126_27] = var_126_28

				local var_126_29 = var_126_28:GetComponentInChildren(typeof(CharacterEffect))

				var_126_29.enabled = true

				local var_126_30 = GameObjectTools.GetOrAddComponent(var_126_28, typeof(DynamicBoneHelper))

				if var_126_30 then
					var_126_30:EnableDynamicBone(false)
				end

				arg_123_1:ShowWeapon(var_126_29.transform, false)

				arg_123_1.var_[var_126_27 .. "Animator"] = var_126_29.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_123_1.var_[var_126_27 .. "Animator"].applyRootMotion = true
				arg_123_1.var_[var_126_27 .. "LipSync"] = var_126_29.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_126_31 = 4

			if var_126_31 < arg_123_1.time_ and arg_123_1.time_ <= var_126_31 + arg_126_0 then
				arg_123_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/story10024/story10024action/10024action1_1")
			end

			local var_126_32 = 4

			if var_126_32 < arg_123_1.time_ and arg_123_1.time_ <= var_126_32 + arg_126_0 then
				arg_123_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_126_33 = arg_123_1.actors_["10024ui_story"]
			local var_126_34 = 4

			if var_126_34 < arg_123_1.time_ and arg_123_1.time_ <= var_126_34 + arg_126_0 and arg_123_1.var_.characterEffect10024ui_story == nil then
				arg_123_1.var_.characterEffect10024ui_story = var_126_33:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_35 = 0.2

			if var_126_34 <= arg_123_1.time_ and arg_123_1.time_ < var_126_34 + var_126_35 then
				local var_126_36 = (arg_123_1.time_ - var_126_34) / var_126_35

				if arg_123_1.var_.characterEffect10024ui_story then
					arg_123_1.var_.characterEffect10024ui_story.fillFlat = false
				end
			end

			if arg_123_1.time_ >= var_126_34 + var_126_35 and arg_123_1.time_ < var_126_34 + var_126_35 + arg_126_0 and arg_123_1.var_.characterEffect10024ui_story then
				arg_123_1.var_.characterEffect10024ui_story.fillFlat = false
			end

			local var_126_37 = "10025ui_story"

			if arg_123_1.actors_[var_126_37] == nil then
				local var_126_38 = Object.Instantiate(Asset.Load("Char/" .. var_126_37), arg_123_1.stage_.transform)

				var_126_38.name = var_126_37
				var_126_38.transform.localPosition = Vector3.New(0, 100, 0)
				arg_123_1.actors_[var_126_37] = var_126_38

				local var_126_39 = var_126_38:GetComponentInChildren(typeof(CharacterEffect))

				var_126_39.enabled = true

				local var_126_40 = GameObjectTools.GetOrAddComponent(var_126_38, typeof(DynamicBoneHelper))

				if var_126_40 then
					var_126_40:EnableDynamicBone(false)
				end

				arg_123_1:ShowWeapon(var_126_39.transform, false)

				arg_123_1.var_[var_126_37 .. "Animator"] = var_126_39.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_123_1.var_[var_126_37 .. "Animator"].applyRootMotion = true
				arg_123_1.var_[var_126_37 .. "LipSync"] = var_126_39.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_126_41 = arg_123_1.actors_["10025ui_story"]
			local var_126_42 = 2

			if var_126_42 < arg_123_1.time_ and arg_123_1.time_ <= var_126_42 + arg_126_0 and arg_123_1.var_.characterEffect10025ui_story == nil then
				arg_123_1.var_.characterEffect10025ui_story = var_126_41:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_43 = 0.2

			if var_126_42 <= arg_123_1.time_ and arg_123_1.time_ < var_126_42 + var_126_43 then
				local var_126_44 = (arg_123_1.time_ - var_126_42) / var_126_43

				if arg_123_1.var_.characterEffect10025ui_story then
					local var_126_45 = Mathf.Lerp(0, 0.5, var_126_44)

					arg_123_1.var_.characterEffect10025ui_story.fillFlat = true
					arg_123_1.var_.characterEffect10025ui_story.fillRatio = var_126_45
				end
			end

			if arg_123_1.time_ >= var_126_42 + var_126_43 and arg_123_1.time_ < var_126_42 + var_126_43 + arg_126_0 and arg_123_1.var_.characterEffect10025ui_story then
				local var_126_46 = 0.5

				arg_123_1.var_.characterEffect10025ui_story.fillFlat = true
				arg_123_1.var_.characterEffect10025ui_story.fillRatio = var_126_46
			end

			local var_126_47 = arg_123_1.actors_["10024ui_story"].transform
			local var_126_48 = 4

			if var_126_48 < arg_123_1.time_ and arg_123_1.time_ <= var_126_48 + arg_126_0 then
				arg_123_1.var_.moveOldPos10024ui_story = var_126_47.localPosition
			end

			local var_126_49 = 0.001

			if var_126_48 <= arg_123_1.time_ and arg_123_1.time_ < var_126_48 + var_126_49 then
				local var_126_50 = (arg_123_1.time_ - var_126_48) / var_126_49
				local var_126_51 = Vector3.New(-0.7, -1, -6)

				var_126_47.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos10024ui_story, var_126_51, var_126_50)

				local var_126_52 = manager.ui.mainCamera.transform.position - var_126_47.position

				var_126_47.forward = Vector3.New(var_126_52.x, var_126_52.y, var_126_52.z)

				local var_126_53 = var_126_47.localEulerAngles

				var_126_53.z = 0
				var_126_53.x = 0
				var_126_47.localEulerAngles = var_126_53
			end

			if arg_123_1.time_ >= var_126_48 + var_126_49 and arg_123_1.time_ < var_126_48 + var_126_49 + arg_126_0 then
				var_126_47.localPosition = Vector3.New(-0.7, -1, -6)

				local var_126_54 = manager.ui.mainCamera.transform.position - var_126_47.position

				var_126_47.forward = Vector3.New(var_126_54.x, var_126_54.y, var_126_54.z)

				local var_126_55 = var_126_47.localEulerAngles

				var_126_55.z = 0
				var_126_55.x = 0
				var_126_47.localEulerAngles = var_126_55
			end

			local var_126_56 = arg_123_1.actors_["10025ui_story"].transform
			local var_126_57 = 4

			if var_126_57 < arg_123_1.time_ and arg_123_1.time_ <= var_126_57 + arg_126_0 then
				arg_123_1.var_.moveOldPos10025ui_story = var_126_56.localPosition
			end

			local var_126_58 = 0.001

			if var_126_57 <= arg_123_1.time_ and arg_123_1.time_ < var_126_57 + var_126_58 then
				local var_126_59 = (arg_123_1.time_ - var_126_57) / var_126_58
				local var_126_60 = Vector3.New(0.7, -1.1, -5.9)

				var_126_56.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos10025ui_story, var_126_60, var_126_59)

				local var_126_61 = manager.ui.mainCamera.transform.position - var_126_56.position

				var_126_56.forward = Vector3.New(var_126_61.x, var_126_61.y, var_126_61.z)

				local var_126_62 = var_126_56.localEulerAngles

				var_126_62.z = 0
				var_126_62.x = 0
				var_126_56.localEulerAngles = var_126_62
			end

			if arg_123_1.time_ >= var_126_57 + var_126_58 and arg_123_1.time_ < var_126_57 + var_126_58 + arg_126_0 then
				var_126_56.localPosition = Vector3.New(0.7, -1.1, -5.9)

				local var_126_63 = manager.ui.mainCamera.transform.position - var_126_56.position

				var_126_56.forward = Vector3.New(var_126_63.x, var_126_63.y, var_126_63.z)

				local var_126_64 = var_126_56.localEulerAngles

				var_126_64.z = 0
				var_126_64.x = 0
				var_126_56.localEulerAngles = var_126_64
			end

			local var_126_65 = 0
			local var_126_66 = 0.266666666666667

			if var_126_65 < arg_123_1.time_ and arg_123_1.time_ <= var_126_65 + arg_126_0 then
				local var_126_67 = "play"
				local var_126_68 = "music"

				arg_123_1:AudioAction(var_126_67, var_126_68, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_126_69 = 0.4
			local var_126_70 = 0.6

			if var_126_69 < arg_123_1.time_ and arg_123_1.time_ <= var_126_69 + arg_126_0 then
				local var_126_71 = "play"
				local var_126_72 = "music"

				arg_123_1:AudioAction(var_126_71, var_126_72, "bgm_story_scheme", "bgm_story_scheme", "bgm_story_scheme.awb")
			end

			if arg_123_1.frameCnt_ <= 1 then
				arg_123_1.dialog_:SetActive(false)
			end

			local var_126_73 = 4
			local var_126_74 = 0.55

			if var_126_73 < arg_123_1.time_ and arg_123_1.time_ <= var_126_73 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0

				arg_123_1.dialog_:SetActive(true)

				local var_126_75 = LeanTween.value(arg_123_1.dialog_, 0, 1, 0.3)

				var_126_75:setOnUpdate(LuaHelper.FloatAction(function(arg_127_0)
					arg_123_1.dialogCg_.alpha = arg_127_0
				end))
				var_126_75:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_123_1.dialog_)
					var_126_75:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_123_1.duration_ = arg_123_1.duration_ + 0.3

				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_76 = arg_123_1:FormatText(StoryNameCfg[332].name)

				arg_123_1.leftNameTxt_.text = var_126_76

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_77 = arg_123_1:GetWordFromCfg(116381029)
				local var_126_78 = arg_123_1:FormatText(var_126_77.content)

				arg_123_1.text_.text = var_126_78

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_79 = 22
				local var_126_80 = utf8.len(var_126_78)
				local var_126_81 = var_126_79 <= 0 and var_126_74 or var_126_74 * (var_126_80 / var_126_79)

				if var_126_81 > 0 and var_126_74 < var_126_81 then
					arg_123_1.talkMaxDuration = var_126_81
					var_126_73 = var_126_73 + 0.3

					if var_126_81 + var_126_73 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_81 + var_126_73
					end
				end

				arg_123_1.text_.text = var_126_78
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116381", "116381029", "story_v_out_116381.awb") ~= 0 then
					local var_126_82 = manager.audio:GetVoiceLength("story_v_out_116381", "116381029", "story_v_out_116381.awb") / 1000

					if var_126_82 + var_126_73 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_82 + var_126_73
					end

					if var_126_77.prefab_name ~= "" and arg_123_1.actors_[var_126_77.prefab_name] ~= nil then
						local var_126_83 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_77.prefab_name].transform, "story_v_out_116381", "116381029", "story_v_out_116381.awb")

						arg_123_1:RecordAudio("116381029", var_126_83)
						arg_123_1:RecordAudio("116381029", var_126_83)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_116381", "116381029", "story_v_out_116381.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_116381", "116381029", "story_v_out_116381.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_84 = var_126_73 + 0.3
			local var_126_85 = math.max(var_126_74, arg_123_1.talkMaxDuration)

			if var_126_84 <= arg_123_1.time_ and arg_123_1.time_ < var_126_84 + var_126_85 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_84) / var_126_85

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_84 + var_126_85 and arg_123_1.time_ < var_126_84 + var_126_85 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play116381030 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 116381030
		arg_129_1.duration_ = 4.066

		local var_129_0 = {
			zh = 4.066,
			ja = 3.433
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
				arg_129_0:Play116381031(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = 0

			if var_132_0 < arg_129_1.time_ and arg_129_1.time_ <= var_132_0 + arg_132_0 then
				arg_129_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/story10024/story10024action/10024action1_1")
			end

			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 then
				arg_129_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_132_2 = arg_129_1.actors_["10024ui_story"].transform
			local var_132_3 = 0

			if var_132_3 < arg_129_1.time_ and arg_129_1.time_ <= var_132_3 + arg_132_0 then
				arg_129_1.var_.moveOldPos10024ui_story = var_132_2.localPosition
			end

			local var_132_4 = 0.001

			if var_132_3 <= arg_129_1.time_ and arg_129_1.time_ < var_132_3 + var_132_4 then
				local var_132_5 = (arg_129_1.time_ - var_132_3) / var_132_4
				local var_132_6 = Vector3.New(-0.7, -1, -6)

				var_132_2.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos10024ui_story, var_132_6, var_132_5)

				local var_132_7 = manager.ui.mainCamera.transform.position - var_132_2.position

				var_132_2.forward = Vector3.New(var_132_7.x, var_132_7.y, var_132_7.z)

				local var_132_8 = var_132_2.localEulerAngles

				var_132_8.z = 0
				var_132_8.x = 0
				var_132_2.localEulerAngles = var_132_8
			end

			if arg_129_1.time_ >= var_132_3 + var_132_4 and arg_129_1.time_ < var_132_3 + var_132_4 + arg_132_0 then
				var_132_2.localPosition = Vector3.New(-0.7, -1, -6)

				local var_132_9 = manager.ui.mainCamera.transform.position - var_132_2.position

				var_132_2.forward = Vector3.New(var_132_9.x, var_132_9.y, var_132_9.z)

				local var_132_10 = var_132_2.localEulerAngles

				var_132_10.z = 0
				var_132_10.x = 0
				var_132_2.localEulerAngles = var_132_10
			end

			local var_132_11 = arg_129_1.actors_["10025ui_story"].transform
			local var_132_12 = 0

			if var_132_12 < arg_129_1.time_ and arg_129_1.time_ <= var_132_12 + arg_132_0 then
				arg_129_1.var_.moveOldPos10025ui_story = var_132_11.localPosition
			end

			local var_132_13 = 0.001

			if var_132_12 <= arg_129_1.time_ and arg_129_1.time_ < var_132_12 + var_132_13 then
				local var_132_14 = (arg_129_1.time_ - var_132_12) / var_132_13
				local var_132_15 = Vector3.New(0.7, -1.1, -5.9)

				var_132_11.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos10025ui_story, var_132_15, var_132_14)

				local var_132_16 = manager.ui.mainCamera.transform.position - var_132_11.position

				var_132_11.forward = Vector3.New(var_132_16.x, var_132_16.y, var_132_16.z)

				local var_132_17 = var_132_11.localEulerAngles

				var_132_17.z = 0
				var_132_17.x = 0
				var_132_11.localEulerAngles = var_132_17
			end

			if arg_129_1.time_ >= var_132_12 + var_132_13 and arg_129_1.time_ < var_132_12 + var_132_13 + arg_132_0 then
				var_132_11.localPosition = Vector3.New(0.7, -1.1, -5.9)

				local var_132_18 = manager.ui.mainCamera.transform.position - var_132_11.position

				var_132_11.forward = Vector3.New(var_132_18.x, var_132_18.y, var_132_18.z)

				local var_132_19 = var_132_11.localEulerAngles

				var_132_19.z = 0
				var_132_19.x = 0
				var_132_11.localEulerAngles = var_132_19
			end

			local var_132_20 = 0
			local var_132_21 = 0.45

			if var_132_20 < arg_129_1.time_ and arg_129_1.time_ <= var_132_20 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_22 = arg_129_1:FormatText(StoryNameCfg[332].name)

				arg_129_1.leftNameTxt_.text = var_132_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_23 = arg_129_1:GetWordFromCfg(116381030)
				local var_132_24 = arg_129_1:FormatText(var_132_23.content)

				arg_129_1.text_.text = var_132_24

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_25 = 18
				local var_132_26 = utf8.len(var_132_24)
				local var_132_27 = var_132_25 <= 0 and var_132_21 or var_132_21 * (var_132_26 / var_132_25)

				if var_132_27 > 0 and var_132_21 < var_132_27 then
					arg_129_1.talkMaxDuration = var_132_27

					if var_132_27 + var_132_20 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_27 + var_132_20
					end
				end

				arg_129_1.text_.text = var_132_24
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116381", "116381030", "story_v_out_116381.awb") ~= 0 then
					local var_132_28 = manager.audio:GetVoiceLength("story_v_out_116381", "116381030", "story_v_out_116381.awb") / 1000

					if var_132_28 + var_132_20 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_28 + var_132_20
					end

					if var_132_23.prefab_name ~= "" and arg_129_1.actors_[var_132_23.prefab_name] ~= nil then
						local var_132_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_23.prefab_name].transform, "story_v_out_116381", "116381030", "story_v_out_116381.awb")

						arg_129_1:RecordAudio("116381030", var_132_29)
						arg_129_1:RecordAudio("116381030", var_132_29)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_116381", "116381030", "story_v_out_116381.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_116381", "116381030", "story_v_out_116381.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_30 = math.max(var_132_21, arg_129_1.talkMaxDuration)

			if var_132_20 <= arg_129_1.time_ and arg_129_1.time_ < var_132_20 + var_132_30 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_20) / var_132_30

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_20 + var_132_30 and arg_129_1.time_ < var_132_20 + var_132_30 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play116381031 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 116381031
		arg_133_1.duration_ = 4.333

		local var_133_0 = {
			zh = 4.333,
			ja = 2.866
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
				arg_133_0:Play116381032(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = 0

			if var_136_0 < arg_133_1.time_ and arg_133_1.time_ <= var_136_0 + arg_136_0 then
				arg_133_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action4_1")
			end

			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 then
				arg_133_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_136_2 = arg_133_1.actors_["10025ui_story"]
			local var_136_3 = 0

			if var_136_3 < arg_133_1.time_ and arg_133_1.time_ <= var_136_3 + arg_136_0 and arg_133_1.var_.characterEffect10025ui_story == nil then
				arg_133_1.var_.characterEffect10025ui_story = var_136_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_4 = 0.2

			if var_136_3 <= arg_133_1.time_ and arg_133_1.time_ < var_136_3 + var_136_4 then
				local var_136_5 = (arg_133_1.time_ - var_136_3) / var_136_4

				if arg_133_1.var_.characterEffect10025ui_story then
					arg_133_1.var_.characterEffect10025ui_story.fillFlat = false
				end
			end

			if arg_133_1.time_ >= var_136_3 + var_136_4 and arg_133_1.time_ < var_136_3 + var_136_4 + arg_136_0 and arg_133_1.var_.characterEffect10025ui_story then
				arg_133_1.var_.characterEffect10025ui_story.fillFlat = false
			end

			local var_136_6 = arg_133_1.actors_["10024ui_story"]
			local var_136_7 = 0

			if var_136_7 < arg_133_1.time_ and arg_133_1.time_ <= var_136_7 + arg_136_0 and arg_133_1.var_.characterEffect10024ui_story == nil then
				arg_133_1.var_.characterEffect10024ui_story = var_136_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_8 = 0.2

			if var_136_7 <= arg_133_1.time_ and arg_133_1.time_ < var_136_7 + var_136_8 then
				local var_136_9 = (arg_133_1.time_ - var_136_7) / var_136_8

				if arg_133_1.var_.characterEffect10024ui_story then
					local var_136_10 = Mathf.Lerp(0, 0.5, var_136_9)

					arg_133_1.var_.characterEffect10024ui_story.fillFlat = true
					arg_133_1.var_.characterEffect10024ui_story.fillRatio = var_136_10
				end
			end

			if arg_133_1.time_ >= var_136_7 + var_136_8 and arg_133_1.time_ < var_136_7 + var_136_8 + arg_136_0 and arg_133_1.var_.characterEffect10024ui_story then
				local var_136_11 = 0.5

				arg_133_1.var_.characterEffect10024ui_story.fillFlat = true
				arg_133_1.var_.characterEffect10024ui_story.fillRatio = var_136_11
			end

			local var_136_12 = 0
			local var_136_13 = 0.25

			if var_136_12 < arg_133_1.time_ and arg_133_1.time_ <= var_136_12 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_14 = arg_133_1:FormatText(StoryNameCfg[328].name)

				arg_133_1.leftNameTxt_.text = var_136_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_15 = arg_133_1:GetWordFromCfg(116381031)
				local var_136_16 = arg_133_1:FormatText(var_136_15.content)

				arg_133_1.text_.text = var_136_16

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_17 = 11
				local var_136_18 = utf8.len(var_136_16)
				local var_136_19 = var_136_17 <= 0 and var_136_13 or var_136_13 * (var_136_18 / var_136_17)

				if var_136_19 > 0 and var_136_13 < var_136_19 then
					arg_133_1.talkMaxDuration = var_136_19

					if var_136_19 + var_136_12 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_19 + var_136_12
					end
				end

				arg_133_1.text_.text = var_136_16
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116381", "116381031", "story_v_out_116381.awb") ~= 0 then
					local var_136_20 = manager.audio:GetVoiceLength("story_v_out_116381", "116381031", "story_v_out_116381.awb") / 1000

					if var_136_20 + var_136_12 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_20 + var_136_12
					end

					if var_136_15.prefab_name ~= "" and arg_133_1.actors_[var_136_15.prefab_name] ~= nil then
						local var_136_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_15.prefab_name].transform, "story_v_out_116381", "116381031", "story_v_out_116381.awb")

						arg_133_1:RecordAudio("116381031", var_136_21)
						arg_133_1:RecordAudio("116381031", var_136_21)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_116381", "116381031", "story_v_out_116381.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_116381", "116381031", "story_v_out_116381.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_22 = math.max(var_136_13, arg_133_1.talkMaxDuration)

			if var_136_12 <= arg_133_1.time_ and arg_133_1.time_ < var_136_12 + var_136_22 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_12) / var_136_22

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_12 + var_136_22 and arg_133_1.time_ < var_136_12 + var_136_22 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play116381032 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 116381032
		arg_137_1.duration_ = 6.766

		local var_137_0 = {
			zh = 6.766,
			ja = 4.033
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
				arg_137_0:Play116381033(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = 0

			if var_140_0 < arg_137_1.time_ and arg_137_1.time_ <= var_140_0 + arg_140_0 then
				arg_137_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/story10024/story10024action/10024action1_1")
			end

			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 then
				arg_137_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_140_2 = arg_137_1.actors_["10024ui_story"]
			local var_140_3 = 0

			if var_140_3 < arg_137_1.time_ and arg_137_1.time_ <= var_140_3 + arg_140_0 and arg_137_1.var_.characterEffect10024ui_story == nil then
				arg_137_1.var_.characterEffect10024ui_story = var_140_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_4 = 0.2

			if var_140_3 <= arg_137_1.time_ and arg_137_1.time_ < var_140_3 + var_140_4 then
				local var_140_5 = (arg_137_1.time_ - var_140_3) / var_140_4

				if arg_137_1.var_.characterEffect10024ui_story then
					arg_137_1.var_.characterEffect10024ui_story.fillFlat = false
				end
			end

			if arg_137_1.time_ >= var_140_3 + var_140_4 and arg_137_1.time_ < var_140_3 + var_140_4 + arg_140_0 and arg_137_1.var_.characterEffect10024ui_story then
				arg_137_1.var_.characterEffect10024ui_story.fillFlat = false
			end

			local var_140_6 = arg_137_1.actors_["10025ui_story"]
			local var_140_7 = 0

			if var_140_7 < arg_137_1.time_ and arg_137_1.time_ <= var_140_7 + arg_140_0 and arg_137_1.var_.characterEffect10025ui_story == nil then
				arg_137_1.var_.characterEffect10025ui_story = var_140_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_8 = 0.2

			if var_140_7 <= arg_137_1.time_ and arg_137_1.time_ < var_140_7 + var_140_8 then
				local var_140_9 = (arg_137_1.time_ - var_140_7) / var_140_8

				if arg_137_1.var_.characterEffect10025ui_story then
					local var_140_10 = Mathf.Lerp(0, 0.5, var_140_9)

					arg_137_1.var_.characterEffect10025ui_story.fillFlat = true
					arg_137_1.var_.characterEffect10025ui_story.fillRatio = var_140_10
				end
			end

			if arg_137_1.time_ >= var_140_7 + var_140_8 and arg_137_1.time_ < var_140_7 + var_140_8 + arg_140_0 and arg_137_1.var_.characterEffect10025ui_story then
				local var_140_11 = 0.5

				arg_137_1.var_.characterEffect10025ui_story.fillFlat = true
				arg_137_1.var_.characterEffect10025ui_story.fillRatio = var_140_11
			end

			local var_140_12 = 0
			local var_140_13 = 0.525

			if var_140_12 < arg_137_1.time_ and arg_137_1.time_ <= var_140_12 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_14 = arg_137_1:FormatText(StoryNameCfg[332].name)

				arg_137_1.leftNameTxt_.text = var_140_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_15 = arg_137_1:GetWordFromCfg(116381032)
				local var_140_16 = arg_137_1:FormatText(var_140_15.content)

				arg_137_1.text_.text = var_140_16

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_17 = 21
				local var_140_18 = utf8.len(var_140_16)
				local var_140_19 = var_140_17 <= 0 and var_140_13 or var_140_13 * (var_140_18 / var_140_17)

				if var_140_19 > 0 and var_140_13 < var_140_19 then
					arg_137_1.talkMaxDuration = var_140_19

					if var_140_19 + var_140_12 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_19 + var_140_12
					end
				end

				arg_137_1.text_.text = var_140_16
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116381", "116381032", "story_v_out_116381.awb") ~= 0 then
					local var_140_20 = manager.audio:GetVoiceLength("story_v_out_116381", "116381032", "story_v_out_116381.awb") / 1000

					if var_140_20 + var_140_12 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_20 + var_140_12
					end

					if var_140_15.prefab_name ~= "" and arg_137_1.actors_[var_140_15.prefab_name] ~= nil then
						local var_140_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_15.prefab_name].transform, "story_v_out_116381", "116381032", "story_v_out_116381.awb")

						arg_137_1:RecordAudio("116381032", var_140_21)
						arg_137_1:RecordAudio("116381032", var_140_21)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_116381", "116381032", "story_v_out_116381.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_116381", "116381032", "story_v_out_116381.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_22 = math.max(var_140_13, arg_137_1.talkMaxDuration)

			if var_140_12 <= arg_137_1.time_ and arg_137_1.time_ < var_140_12 + var_140_22 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_12) / var_140_22

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_12 + var_140_22 and arg_137_1.time_ < var_140_12 + var_140_22 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play116381033 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 116381033
		arg_141_1.duration_ = 2.266

		local var_141_0 = {
			zh = 2.266,
			ja = 1.999999999999
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
				arg_141_0:Play116381034(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = 0

			if var_144_0 < arg_141_1.time_ and arg_141_1.time_ <= var_144_0 + arg_144_0 then
				arg_141_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action4_2")
			end

			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 then
				arg_141_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_144_2 = arg_141_1.actors_["10024ui_story"]
			local var_144_3 = 0

			if var_144_3 < arg_141_1.time_ and arg_141_1.time_ <= var_144_3 + arg_144_0 and arg_141_1.var_.characterEffect10024ui_story == nil then
				arg_141_1.var_.characterEffect10024ui_story = var_144_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_4 = 0.2

			if var_144_3 <= arg_141_1.time_ and arg_141_1.time_ < var_144_3 + var_144_4 then
				local var_144_5 = (arg_141_1.time_ - var_144_3) / var_144_4

				if arg_141_1.var_.characterEffect10024ui_story then
					local var_144_6 = Mathf.Lerp(0, 0.5, var_144_5)

					arg_141_1.var_.characterEffect10024ui_story.fillFlat = true
					arg_141_1.var_.characterEffect10024ui_story.fillRatio = var_144_6
				end
			end

			if arg_141_1.time_ >= var_144_3 + var_144_4 and arg_141_1.time_ < var_144_3 + var_144_4 + arg_144_0 and arg_141_1.var_.characterEffect10024ui_story then
				local var_144_7 = 0.5

				arg_141_1.var_.characterEffect10024ui_story.fillFlat = true
				arg_141_1.var_.characterEffect10024ui_story.fillRatio = var_144_7
			end

			local var_144_8 = arg_141_1.actors_["10025ui_story"]
			local var_144_9 = 0

			if var_144_9 < arg_141_1.time_ and arg_141_1.time_ <= var_144_9 + arg_144_0 and arg_141_1.var_.characterEffect10025ui_story == nil then
				arg_141_1.var_.characterEffect10025ui_story = var_144_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_10 = 0.2

			if var_144_9 <= arg_141_1.time_ and arg_141_1.time_ < var_144_9 + var_144_10 then
				local var_144_11 = (arg_141_1.time_ - var_144_9) / var_144_10

				if arg_141_1.var_.characterEffect10025ui_story then
					arg_141_1.var_.characterEffect10025ui_story.fillFlat = false
				end
			end

			if arg_141_1.time_ >= var_144_9 + var_144_10 and arg_141_1.time_ < var_144_9 + var_144_10 + arg_144_0 and arg_141_1.var_.characterEffect10025ui_story then
				arg_141_1.var_.characterEffect10025ui_story.fillFlat = false
			end

			local var_144_12 = 0
			local var_144_13 = 0.125

			if var_144_12 < arg_141_1.time_ and arg_141_1.time_ <= var_144_12 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_14 = arg_141_1:FormatText(StoryNameCfg[328].name)

				arg_141_1.leftNameTxt_.text = var_144_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_15 = arg_141_1:GetWordFromCfg(116381033)
				local var_144_16 = arg_141_1:FormatText(var_144_15.content)

				arg_141_1.text_.text = var_144_16

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_17 = 5
				local var_144_18 = utf8.len(var_144_16)
				local var_144_19 = var_144_17 <= 0 and var_144_13 or var_144_13 * (var_144_18 / var_144_17)

				if var_144_19 > 0 and var_144_13 < var_144_19 then
					arg_141_1.talkMaxDuration = var_144_19

					if var_144_19 + var_144_12 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_19 + var_144_12
					end
				end

				arg_141_1.text_.text = var_144_16
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116381", "116381033", "story_v_out_116381.awb") ~= 0 then
					local var_144_20 = manager.audio:GetVoiceLength("story_v_out_116381", "116381033", "story_v_out_116381.awb") / 1000

					if var_144_20 + var_144_12 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_20 + var_144_12
					end

					if var_144_15.prefab_name ~= "" and arg_141_1.actors_[var_144_15.prefab_name] ~= nil then
						local var_144_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_15.prefab_name].transform, "story_v_out_116381", "116381033", "story_v_out_116381.awb")

						arg_141_1:RecordAudio("116381033", var_144_21)
						arg_141_1:RecordAudio("116381033", var_144_21)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_116381", "116381033", "story_v_out_116381.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_116381", "116381033", "story_v_out_116381.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_22 = math.max(var_144_13, arg_141_1.talkMaxDuration)

			if var_144_12 <= arg_141_1.time_ and arg_141_1.time_ < var_144_12 + var_144_22 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_12) / var_144_22

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_12 + var_144_22 and arg_141_1.time_ < var_144_12 + var_144_22 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play116381034 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 116381034
		arg_145_1.duration_ = 5

		SetActive(arg_145_1.tipsGo_, false)

		function arg_145_1.onSingleLineFinish_()
			arg_145_1.onSingleLineUpdate_ = nil
			arg_145_1.onSingleLineFinish_ = nil
			arg_145_1.state_ = "waiting"
		end

		function arg_145_1.playNext_(arg_147_0)
			if arg_147_0 == 1 then
				arg_145_0:Play116381035(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["10024ui_story"].transform
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 then
				arg_145_1.var_.moveOldPos10024ui_story = var_148_0.localPosition
			end

			local var_148_2 = 0.001

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_2 then
				local var_148_3 = (arg_145_1.time_ - var_148_1) / var_148_2
				local var_148_4 = Vector3.New(0, 100, 0)

				var_148_0.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPos10024ui_story, var_148_4, var_148_3)

				local var_148_5 = manager.ui.mainCamera.transform.position - var_148_0.position

				var_148_0.forward = Vector3.New(var_148_5.x, var_148_5.y, var_148_5.z)

				local var_148_6 = var_148_0.localEulerAngles

				var_148_6.z = 0
				var_148_6.x = 0
				var_148_0.localEulerAngles = var_148_6
			end

			if arg_145_1.time_ >= var_148_1 + var_148_2 and arg_145_1.time_ < var_148_1 + var_148_2 + arg_148_0 then
				var_148_0.localPosition = Vector3.New(0, 100, 0)

				local var_148_7 = manager.ui.mainCamera.transform.position - var_148_0.position

				var_148_0.forward = Vector3.New(var_148_7.x, var_148_7.y, var_148_7.z)

				local var_148_8 = var_148_0.localEulerAngles

				var_148_8.z = 0
				var_148_8.x = 0
				var_148_0.localEulerAngles = var_148_8
			end

			local var_148_9 = arg_145_1.actors_["10025ui_story"].transform
			local var_148_10 = 0

			if var_148_10 < arg_145_1.time_ and arg_145_1.time_ <= var_148_10 + arg_148_0 then
				arg_145_1.var_.moveOldPos10025ui_story = var_148_9.localPosition
			end

			local var_148_11 = 0.001

			if var_148_10 <= arg_145_1.time_ and arg_145_1.time_ < var_148_10 + var_148_11 then
				local var_148_12 = (arg_145_1.time_ - var_148_10) / var_148_11
				local var_148_13 = Vector3.New(0, 100, 0)

				var_148_9.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPos10025ui_story, var_148_13, var_148_12)

				local var_148_14 = manager.ui.mainCamera.transform.position - var_148_9.position

				var_148_9.forward = Vector3.New(var_148_14.x, var_148_14.y, var_148_14.z)

				local var_148_15 = var_148_9.localEulerAngles

				var_148_15.z = 0
				var_148_15.x = 0
				var_148_9.localEulerAngles = var_148_15
			end

			if arg_145_1.time_ >= var_148_10 + var_148_11 and arg_145_1.time_ < var_148_10 + var_148_11 + arg_148_0 then
				var_148_9.localPosition = Vector3.New(0, 100, 0)

				local var_148_16 = manager.ui.mainCamera.transform.position - var_148_9.position

				var_148_9.forward = Vector3.New(var_148_16.x, var_148_16.y, var_148_16.z)

				local var_148_17 = var_148_9.localEulerAngles

				var_148_17.z = 0
				var_148_17.x = 0
				var_148_9.localEulerAngles = var_148_17
			end

			local var_148_18 = 0
			local var_148_19 = 1.3

			if var_148_18 < arg_145_1.time_ and arg_145_1.time_ <= var_148_18 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, false)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_20 = arg_145_1:GetWordFromCfg(116381034)
				local var_148_21 = arg_145_1:FormatText(var_148_20.content)

				arg_145_1.text_.text = var_148_21

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_22 = 52
				local var_148_23 = utf8.len(var_148_21)
				local var_148_24 = var_148_22 <= 0 and var_148_19 or var_148_19 * (var_148_23 / var_148_22)

				if var_148_24 > 0 and var_148_19 < var_148_24 then
					arg_145_1.talkMaxDuration = var_148_24

					if var_148_24 + var_148_18 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_24 + var_148_18
					end
				end

				arg_145_1.text_.text = var_148_21
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)
				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_25 = math.max(var_148_19, arg_145_1.talkMaxDuration)

			if var_148_18 <= arg_145_1.time_ and arg_145_1.time_ < var_148_18 + var_148_25 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_18) / var_148_25

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_18 + var_148_25 and arg_145_1.time_ < var_148_18 + var_148_25 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play116381035 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 116381035
		arg_149_1.duration_ = 10.6

		local var_149_0 = {
			zh = 10.6,
			ja = 9.933
		}
		local var_149_1 = manager.audio:GetLocalizationFlag()

		if var_149_0[var_149_1] ~= nil then
			arg_149_1.duration_ = var_149_0[var_149_1]
		end

		SetActive(arg_149_1.tipsGo_, false)

		function arg_149_1.onSingleLineFinish_()
			arg_149_1.onSingleLineUpdate_ = nil
			arg_149_1.onSingleLineFinish_ = nil
			arg_149_1.state_ = "waiting"
		end

		function arg_149_1.playNext_(arg_151_0)
			if arg_151_0 == 1 then
				arg_149_0:Play116381036(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = 0
			local var_152_1 = 1.15

			if var_152_0 < arg_149_1.time_ and arg_149_1.time_ <= var_152_0 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_2 = arg_149_1:FormatText(StoryNameCfg[332].name)

				arg_149_1.leftNameTxt_.text = var_152_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, true)
				arg_149_1.iconController_:SetSelectedState("hero")

				arg_149_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10024")

				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_3 = arg_149_1:GetWordFromCfg(116381035)
				local var_152_4 = arg_149_1:FormatText(var_152_3.content)

				arg_149_1.text_.text = var_152_4

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_5 = 46
				local var_152_6 = utf8.len(var_152_4)
				local var_152_7 = var_152_5 <= 0 and var_152_1 or var_152_1 * (var_152_6 / var_152_5)

				if var_152_7 > 0 and var_152_1 < var_152_7 then
					arg_149_1.talkMaxDuration = var_152_7

					if var_152_7 + var_152_0 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_7 + var_152_0
					end
				end

				arg_149_1.text_.text = var_152_4
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116381", "116381035", "story_v_out_116381.awb") ~= 0 then
					local var_152_8 = manager.audio:GetVoiceLength("story_v_out_116381", "116381035", "story_v_out_116381.awb") / 1000

					if var_152_8 + var_152_0 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_8 + var_152_0
					end

					if var_152_3.prefab_name ~= "" and arg_149_1.actors_[var_152_3.prefab_name] ~= nil then
						local var_152_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_3.prefab_name].transform, "story_v_out_116381", "116381035", "story_v_out_116381.awb")

						arg_149_1:RecordAudio("116381035", var_152_9)
						arg_149_1:RecordAudio("116381035", var_152_9)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_116381", "116381035", "story_v_out_116381.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_116381", "116381035", "story_v_out_116381.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_10 = math.max(var_152_1, arg_149_1.talkMaxDuration)

			if var_152_0 <= arg_149_1.time_ and arg_149_1.time_ < var_152_0 + var_152_10 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_0) / var_152_10

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_0 + var_152_10 and arg_149_1.time_ < var_152_0 + var_152_10 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play116381036 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 116381036
		arg_153_1.duration_ = 5

		SetActive(arg_153_1.tipsGo_, false)

		function arg_153_1.onSingleLineFinish_()
			arg_153_1.onSingleLineUpdate_ = nil
			arg_153_1.onSingleLineFinish_ = nil
			arg_153_1.state_ = "waiting"
		end

		function arg_153_1.playNext_(arg_155_0)
			if arg_155_0 == 1 then
				arg_153_0:Play116381037(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = 0
			local var_156_1 = 0.5

			if var_156_0 < arg_153_1.time_ and arg_153_1.time_ <= var_156_0 + arg_156_0 then
				local var_156_2 = "play"
				local var_156_3 = "effect"

				arg_153_1:AudioAction(var_156_2, var_156_3, "se_story_16", "se_story_16_gun", "")
			end

			local var_156_4 = 0.333333333333333
			local var_156_5 = 0.5

			if var_156_4 < arg_153_1.time_ and arg_153_1.time_ <= var_156_4 + arg_156_0 then
				local var_156_6 = "play"
				local var_156_7 = "effect"

				arg_153_1:AudioAction(var_156_6, var_156_7, "se_story_16", "se_story_16_gun", "")
			end

			local var_156_8 = manager.ui.mainCamera.transform
			local var_156_9 = 0

			if var_156_9 < arg_153_1.time_ and arg_153_1.time_ <= var_156_9 + arg_156_0 then
				arg_153_1.var_.shakeOldPos = var_156_8.localPosition
			end

			local var_156_10 = 0.6

			if var_156_9 <= arg_153_1.time_ and arg_153_1.time_ < var_156_9 + var_156_10 then
				local var_156_11 = (arg_153_1.time_ - var_156_9) / 0.066
				local var_156_12, var_156_13 = math.modf(var_156_11)

				var_156_8.localPosition = Vector3.New(var_156_13 * 0.13, var_156_13 * 0.13, var_156_13 * 0.13) + arg_153_1.var_.shakeOldPos
			end

			if arg_153_1.time_ >= var_156_9 + var_156_10 and arg_153_1.time_ < var_156_9 + var_156_10 + arg_156_0 then
				var_156_8.localPosition = arg_153_1.var_.shakeOldPos
			end

			local var_156_14 = manager.ui.mainCamera.transform
			local var_156_15 = 0.7

			if var_156_15 < arg_153_1.time_ and arg_153_1.time_ <= var_156_15 + arg_156_0 then
				arg_153_1.var_.shakeOldPos = var_156_14.localPosition
			end

			local var_156_16 = 0.6

			if var_156_15 <= arg_153_1.time_ and arg_153_1.time_ < var_156_15 + var_156_16 then
				local var_156_17 = (arg_153_1.time_ - var_156_15) / 0.066
				local var_156_18, var_156_19 = math.modf(var_156_17)

				var_156_14.localPosition = Vector3.New(var_156_19 * 0.13, var_156_19 * 0.13, var_156_19 * 0.13) + arg_153_1.var_.shakeOldPos
			end

			if arg_153_1.time_ >= var_156_15 + var_156_16 and arg_153_1.time_ < var_156_15 + var_156_16 + arg_156_0 then
				var_156_14.localPosition = arg_153_1.var_.shakeOldPos
			end

			local var_156_20 = 0

			if var_156_20 < arg_153_1.time_ and arg_153_1.time_ <= var_156_20 + arg_156_0 then
				arg_153_1.allBtn_.enabled = false
			end

			local var_156_21 = 1.3

			if arg_153_1.time_ >= var_156_20 + var_156_21 and arg_153_1.time_ < var_156_20 + var_156_21 + arg_156_0 then
				arg_153_1.allBtn_.enabled = true
			end

			local var_156_22 = 0
			local var_156_23 = 0.1

			if var_156_22 < arg_153_1.time_ and arg_153_1.time_ <= var_156_22 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, false)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_24 = arg_153_1:GetWordFromCfg(116381036)
				local var_156_25 = arg_153_1:FormatText(var_156_24.content)

				arg_153_1.text_.text = var_156_25

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_26 = 4
				local var_156_27 = utf8.len(var_156_25)
				local var_156_28 = var_156_26 <= 0 and var_156_23 or var_156_23 * (var_156_27 / var_156_26)

				if var_156_28 > 0 and var_156_23 < var_156_28 then
					arg_153_1.talkMaxDuration = var_156_28

					if var_156_28 + var_156_22 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_28 + var_156_22
					end
				end

				arg_153_1.text_.text = var_156_25
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)
				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_29 = math.max(var_156_23, arg_153_1.talkMaxDuration)

			if var_156_22 <= arg_153_1.time_ and arg_153_1.time_ < var_156_22 + var_156_29 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_22) / var_156_29

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_22 + var_156_29 and arg_153_1.time_ < var_156_22 + var_156_29 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play116381037 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 116381037
		arg_157_1.duration_ = 5

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play116381038(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = 0
			local var_160_1 = 1

			if var_160_0 < arg_157_1.time_ and arg_157_1.time_ <= var_160_0 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, false)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_2 = arg_157_1:GetWordFromCfg(116381037)
				local var_160_3 = arg_157_1:FormatText(var_160_2.content)

				arg_157_1.text_.text = var_160_3

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_4 = 40
				local var_160_5 = utf8.len(var_160_3)
				local var_160_6 = var_160_4 <= 0 and var_160_1 or var_160_1 * (var_160_5 / var_160_4)

				if var_160_6 > 0 and var_160_1 < var_160_6 then
					arg_157_1.talkMaxDuration = var_160_6

					if var_160_6 + var_160_0 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_6 + var_160_0
					end
				end

				arg_157_1.text_.text = var_160_3
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)
				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_7 = math.max(var_160_1, arg_157_1.talkMaxDuration)

			if var_160_0 <= arg_157_1.time_ and arg_157_1.time_ < var_160_0 + var_160_7 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_0) / var_160_7

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_0 + var_160_7 and arg_157_1.time_ < var_160_0 + var_160_7 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play116381038 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 116381038
		arg_161_1.duration_ = 8.333

		local var_161_0 = {
			zh = 8.2,
			ja = 8.333
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
				arg_161_0:Play116381039(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["10024ui_story"].transform
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 then
				arg_161_1.var_.moveOldPos10024ui_story = var_164_0.localPosition
			end

			local var_164_2 = 0.001

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_2 then
				local var_164_3 = (arg_161_1.time_ - var_164_1) / var_164_2
				local var_164_4 = Vector3.New(0, -1, -6)

				var_164_0.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos10024ui_story, var_164_4, var_164_3)

				local var_164_5 = manager.ui.mainCamera.transform.position - var_164_0.position

				var_164_0.forward = Vector3.New(var_164_5.x, var_164_5.y, var_164_5.z)

				local var_164_6 = var_164_0.localEulerAngles

				var_164_6.z = 0
				var_164_6.x = 0
				var_164_0.localEulerAngles = var_164_6
			end

			if arg_161_1.time_ >= var_164_1 + var_164_2 and arg_161_1.time_ < var_164_1 + var_164_2 + arg_164_0 then
				var_164_0.localPosition = Vector3.New(0, -1, -6)

				local var_164_7 = manager.ui.mainCamera.transform.position - var_164_0.position

				var_164_0.forward = Vector3.New(var_164_7.x, var_164_7.y, var_164_7.z)

				local var_164_8 = var_164_0.localEulerAngles

				var_164_8.z = 0
				var_164_8.x = 0
				var_164_0.localEulerAngles = var_164_8
			end

			local var_164_9 = 0

			if var_164_9 < arg_161_1.time_ and arg_161_1.time_ <= var_164_9 + arg_164_0 then
				arg_161_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/story10024/story10024action/10024action6_1")
			end

			local var_164_10 = 0

			if var_164_10 < arg_161_1.time_ and arg_161_1.time_ <= var_164_10 + arg_164_0 then
				arg_161_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_164_11 = arg_161_1.actors_["10024ui_story"]
			local var_164_12 = 0

			if var_164_12 < arg_161_1.time_ and arg_161_1.time_ <= var_164_12 + arg_164_0 and arg_161_1.var_.characterEffect10024ui_story == nil then
				arg_161_1.var_.characterEffect10024ui_story = var_164_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_13 = 0.2

			if var_164_12 <= arg_161_1.time_ and arg_161_1.time_ < var_164_12 + var_164_13 then
				local var_164_14 = (arg_161_1.time_ - var_164_12) / var_164_13

				if arg_161_1.var_.characterEffect10024ui_story then
					arg_161_1.var_.characterEffect10024ui_story.fillFlat = false
				end
			end

			if arg_161_1.time_ >= var_164_12 + var_164_13 and arg_161_1.time_ < var_164_12 + var_164_13 + arg_164_0 and arg_161_1.var_.characterEffect10024ui_story then
				arg_161_1.var_.characterEffect10024ui_story.fillFlat = false
			end

			local var_164_15 = 0
			local var_164_16 = 0.7

			if var_164_15 < arg_161_1.time_ and arg_161_1.time_ <= var_164_15 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_17 = arg_161_1:FormatText(StoryNameCfg[332].name)

				arg_161_1.leftNameTxt_.text = var_164_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_18 = arg_161_1:GetWordFromCfg(116381038)
				local var_164_19 = arg_161_1:FormatText(var_164_18.content)

				arg_161_1.text_.text = var_164_19

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_20 = 28
				local var_164_21 = utf8.len(var_164_19)
				local var_164_22 = var_164_20 <= 0 and var_164_16 or var_164_16 * (var_164_21 / var_164_20)

				if var_164_22 > 0 and var_164_16 < var_164_22 then
					arg_161_1.talkMaxDuration = var_164_22

					if var_164_22 + var_164_15 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_22 + var_164_15
					end
				end

				arg_161_1.text_.text = var_164_19
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116381", "116381038", "story_v_out_116381.awb") ~= 0 then
					local var_164_23 = manager.audio:GetVoiceLength("story_v_out_116381", "116381038", "story_v_out_116381.awb") / 1000

					if var_164_23 + var_164_15 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_23 + var_164_15
					end

					if var_164_18.prefab_name ~= "" and arg_161_1.actors_[var_164_18.prefab_name] ~= nil then
						local var_164_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_18.prefab_name].transform, "story_v_out_116381", "116381038", "story_v_out_116381.awb")

						arg_161_1:RecordAudio("116381038", var_164_24)
						arg_161_1:RecordAudio("116381038", var_164_24)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_116381", "116381038", "story_v_out_116381.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_116381", "116381038", "story_v_out_116381.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_25 = math.max(var_164_16, arg_161_1.talkMaxDuration)

			if var_164_15 <= arg_161_1.time_ and arg_161_1.time_ < var_164_15 + var_164_25 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_15) / var_164_25

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_15 + var_164_25 and arg_161_1.time_ < var_164_15 + var_164_25 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play116381039 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 116381039
		arg_165_1.duration_ = 5.066

		local var_165_0 = {
			zh = 4.866,
			ja = 5.066
		}
		local var_165_1 = manager.audio:GetLocalizationFlag()

		if var_165_0[var_165_1] ~= nil then
			arg_165_1.duration_ = var_165_0[var_165_1]
		end

		SetActive(arg_165_1.tipsGo_, false)

		function arg_165_1.onSingleLineFinish_()
			arg_165_1.onSingleLineUpdate_ = nil
			arg_165_1.onSingleLineFinish_ = nil
			arg_165_1.state_ = "waiting"
		end

		function arg_165_1.playNext_(arg_167_0)
			if arg_167_0 == 1 then
				arg_165_0:Play116381040(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = 0

			if var_168_0 < arg_165_1.time_ and arg_165_1.time_ <= var_168_0 + arg_168_0 then
				arg_165_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/story10024/story10024actionlink/10024action462")
			end

			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 then
				arg_165_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_168_2 = 0
			local var_168_3 = 0.375

			if var_168_2 < arg_165_1.time_ and arg_165_1.time_ <= var_168_2 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_4 = arg_165_1:FormatText(StoryNameCfg[332].name)

				arg_165_1.leftNameTxt_.text = var_168_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_5 = arg_165_1:GetWordFromCfg(116381039)
				local var_168_6 = arg_165_1:FormatText(var_168_5.content)

				arg_165_1.text_.text = var_168_6

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_7 = 15
				local var_168_8 = utf8.len(var_168_6)
				local var_168_9 = var_168_7 <= 0 and var_168_3 or var_168_3 * (var_168_8 / var_168_7)

				if var_168_9 > 0 and var_168_3 < var_168_9 then
					arg_165_1.talkMaxDuration = var_168_9

					if var_168_9 + var_168_2 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_9 + var_168_2
					end
				end

				arg_165_1.text_.text = var_168_6
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116381", "116381039", "story_v_out_116381.awb") ~= 0 then
					local var_168_10 = manager.audio:GetVoiceLength("story_v_out_116381", "116381039", "story_v_out_116381.awb") / 1000

					if var_168_10 + var_168_2 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_10 + var_168_2
					end

					if var_168_5.prefab_name ~= "" and arg_165_1.actors_[var_168_5.prefab_name] ~= nil then
						local var_168_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_5.prefab_name].transform, "story_v_out_116381", "116381039", "story_v_out_116381.awb")

						arg_165_1:RecordAudio("116381039", var_168_11)
						arg_165_1:RecordAudio("116381039", var_168_11)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_116381", "116381039", "story_v_out_116381.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_116381", "116381039", "story_v_out_116381.awb")
				end

				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_12 = math.max(var_168_3, arg_165_1.talkMaxDuration)

			if var_168_2 <= arg_165_1.time_ and arg_165_1.time_ < var_168_2 + var_168_12 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_2) / var_168_12

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_2 + var_168_12 and arg_165_1.time_ < var_168_2 + var_168_12 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play116381040 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 116381040
		arg_169_1.duration_ = 5

		SetActive(arg_169_1.tipsGo_, false)

		function arg_169_1.onSingleLineFinish_()
			arg_169_1.onSingleLineUpdate_ = nil
			arg_169_1.onSingleLineFinish_ = nil
			arg_169_1.state_ = "waiting"
		end

		function arg_169_1.playNext_(arg_171_0)
			if arg_171_0 == 1 then
				arg_169_0:Play116381041(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["10024ui_story"].transform
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 then
				arg_169_1.var_.moveOldPos10024ui_story = var_172_0.localPosition
			end

			local var_172_2 = 0.001

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_2 then
				local var_172_3 = (arg_169_1.time_ - var_172_1) / var_172_2
				local var_172_4 = Vector3.New(0, 100, 0)

				var_172_0.localPosition = Vector3.Lerp(arg_169_1.var_.moveOldPos10024ui_story, var_172_4, var_172_3)

				local var_172_5 = manager.ui.mainCamera.transform.position - var_172_0.position

				var_172_0.forward = Vector3.New(var_172_5.x, var_172_5.y, var_172_5.z)

				local var_172_6 = var_172_0.localEulerAngles

				var_172_6.z = 0
				var_172_6.x = 0
				var_172_0.localEulerAngles = var_172_6
			end

			if arg_169_1.time_ >= var_172_1 + var_172_2 and arg_169_1.time_ < var_172_1 + var_172_2 + arg_172_0 then
				var_172_0.localPosition = Vector3.New(0, 100, 0)

				local var_172_7 = manager.ui.mainCamera.transform.position - var_172_0.position

				var_172_0.forward = Vector3.New(var_172_7.x, var_172_7.y, var_172_7.z)

				local var_172_8 = var_172_0.localEulerAngles

				var_172_8.z = 0
				var_172_8.x = 0
				var_172_0.localEulerAngles = var_172_8
			end

			local var_172_9 = 0
			local var_172_10 = 0.675

			if var_172_9 < arg_169_1.time_ and arg_169_1.time_ <= var_172_9 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, false)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_11 = arg_169_1:GetWordFromCfg(116381040)
				local var_172_12 = arg_169_1:FormatText(var_172_11.content)

				arg_169_1.text_.text = var_172_12

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_13 = 27
				local var_172_14 = utf8.len(var_172_12)
				local var_172_15 = var_172_13 <= 0 and var_172_10 or var_172_10 * (var_172_14 / var_172_13)

				if var_172_15 > 0 and var_172_10 < var_172_15 then
					arg_169_1.talkMaxDuration = var_172_15

					if var_172_15 + var_172_9 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_15 + var_172_9
					end
				end

				arg_169_1.text_.text = var_172_12
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)
				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_16 = math.max(var_172_10, arg_169_1.talkMaxDuration)

			if var_172_9 <= arg_169_1.time_ and arg_169_1.time_ < var_172_9 + var_172_16 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_9) / var_172_16

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_9 + var_172_16 and arg_169_1.time_ < var_172_9 + var_172_16 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play116381041 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 116381041
		arg_173_1.duration_ = 5

		SetActive(arg_173_1.tipsGo_, false)

		function arg_173_1.onSingleLineFinish_()
			arg_173_1.onSingleLineUpdate_ = nil
			arg_173_1.onSingleLineFinish_ = nil
			arg_173_1.state_ = "waiting"
		end

		function arg_173_1.playNext_(arg_175_0)
			if arg_175_0 == 1 then
				arg_173_0:Play116381042(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = 0
			local var_176_1 = 0.825

			if var_176_0 < arg_173_1.time_ and arg_173_1.time_ <= var_176_0 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, false)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_2 = arg_173_1:GetWordFromCfg(116381041)
				local var_176_3 = arg_173_1:FormatText(var_176_2.content)

				arg_173_1.text_.text = var_176_3

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_4 = 33
				local var_176_5 = utf8.len(var_176_3)
				local var_176_6 = var_176_4 <= 0 and var_176_1 or var_176_1 * (var_176_5 / var_176_4)

				if var_176_6 > 0 and var_176_1 < var_176_6 then
					arg_173_1.talkMaxDuration = var_176_6

					if var_176_6 + var_176_0 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_6 + var_176_0
					end
				end

				arg_173_1.text_.text = var_176_3
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)
				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_7 = math.max(var_176_1, arg_173_1.talkMaxDuration)

			if var_176_0 <= arg_173_1.time_ and arg_173_1.time_ < var_176_0 + var_176_7 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_0) / var_176_7

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_0 + var_176_7 and arg_173_1.time_ < var_176_0 + var_176_7 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play116381042 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 116381042
		arg_177_1.duration_ = 5

		SetActive(arg_177_1.tipsGo_, false)

		function arg_177_1.onSingleLineFinish_()
			arg_177_1.onSingleLineUpdate_ = nil
			arg_177_1.onSingleLineFinish_ = nil
			arg_177_1.state_ = "waiting"
		end

		function arg_177_1.playNext_(arg_179_0)
			if arg_179_0 == 1 then
				arg_177_0:Play116381043(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = 0
			local var_180_1 = 0.3

			if var_180_0 < arg_177_1.time_ and arg_177_1.time_ <= var_180_0 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, false)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_2 = arg_177_1:GetWordFromCfg(116381042)
				local var_180_3 = arg_177_1:FormatText(var_180_2.content)

				arg_177_1.text_.text = var_180_3

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_4 = 12
				local var_180_5 = utf8.len(var_180_3)
				local var_180_6 = var_180_4 <= 0 and var_180_1 or var_180_1 * (var_180_5 / var_180_4)

				if var_180_6 > 0 and var_180_1 < var_180_6 then
					arg_177_1.talkMaxDuration = var_180_6

					if var_180_6 + var_180_0 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_6 + var_180_0
					end
				end

				arg_177_1.text_.text = var_180_3
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)
				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_7 = math.max(var_180_1, arg_177_1.talkMaxDuration)

			if var_180_0 <= arg_177_1.time_ and arg_177_1.time_ < var_180_0 + var_180_7 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_0) / var_180_7

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_0 + var_180_7 and arg_177_1.time_ < var_180_0 + var_180_7 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play116381043 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 116381043
		arg_181_1.duration_ = 5

		SetActive(arg_181_1.tipsGo_, false)

		function arg_181_1.onSingleLineFinish_()
			arg_181_1.onSingleLineUpdate_ = nil
			arg_181_1.onSingleLineFinish_ = nil
			arg_181_1.state_ = "waiting"
		end

		function arg_181_1.playNext_(arg_183_0)
			if arg_183_0 == 1 then
				arg_181_0:Play116381044(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = 0
			local var_184_1 = 0.675

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

				local var_184_2 = arg_181_1:GetWordFromCfg(116381043)
				local var_184_3 = arg_181_1:FormatText(var_184_2.content)

				arg_181_1.text_.text = var_184_3

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_4 = 27
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
	Play116381044 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 116381044
		arg_185_1.duration_ = 5

		SetActive(arg_185_1.tipsGo_, false)

		function arg_185_1.onSingleLineFinish_()
			arg_185_1.onSingleLineUpdate_ = nil
			arg_185_1.onSingleLineFinish_ = nil
			arg_185_1.state_ = "waiting"
		end

		function arg_185_1.playNext_(arg_187_0)
			if arg_187_0 == 1 then
				arg_185_0:Play116381045(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = 0
			local var_188_1 = 0.8

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

				local var_188_2 = arg_185_1:GetWordFromCfg(116381044)
				local var_188_3 = arg_185_1:FormatText(var_188_2.content)

				arg_185_1.text_.text = var_188_3

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_4 = 32
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
	Play116381045 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 116381045
		arg_189_1.duration_ = 12.3

		local var_189_0 = {
			zh = 7.966,
			ja = 12.3
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
				arg_189_0:Play116381046(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = 0
			local var_192_1 = 0.775

			if var_192_0 < arg_189_1.time_ and arg_189_1.time_ <= var_192_0 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_2 = arg_189_1:FormatText(StoryNameCfg[332].name)

				arg_189_1.leftNameTxt_.text = var_192_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, true)
				arg_189_1.iconController_:SetSelectedState("hero")

				arg_189_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10024")

				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_3 = arg_189_1:GetWordFromCfg(116381045)
				local var_192_4 = arg_189_1:FormatText(var_192_3.content)

				arg_189_1.text_.text = var_192_4

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_5 = 30
				local var_192_6 = utf8.len(var_192_4)
				local var_192_7 = var_192_5 <= 0 and var_192_1 or var_192_1 * (var_192_6 / var_192_5)

				if var_192_7 > 0 and var_192_1 < var_192_7 then
					arg_189_1.talkMaxDuration = var_192_7

					if var_192_7 + var_192_0 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_7 + var_192_0
					end
				end

				arg_189_1.text_.text = var_192_4
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116381", "116381045", "story_v_out_116381.awb") ~= 0 then
					local var_192_8 = manager.audio:GetVoiceLength("story_v_out_116381", "116381045", "story_v_out_116381.awb") / 1000

					if var_192_8 + var_192_0 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_8 + var_192_0
					end

					if var_192_3.prefab_name ~= "" and arg_189_1.actors_[var_192_3.prefab_name] ~= nil then
						local var_192_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_3.prefab_name].transform, "story_v_out_116381", "116381045", "story_v_out_116381.awb")

						arg_189_1:RecordAudio("116381045", var_192_9)
						arg_189_1:RecordAudio("116381045", var_192_9)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_out_116381", "116381045", "story_v_out_116381.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_out_116381", "116381045", "story_v_out_116381.awb")
				end

				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_10 = math.max(var_192_1, arg_189_1.talkMaxDuration)

			if var_192_0 <= arg_189_1.time_ and arg_189_1.time_ < var_192_0 + var_192_10 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_0) / var_192_10

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_0 + var_192_10 and arg_189_1.time_ < var_192_0 + var_192_10 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play116381046 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 116381046
		arg_193_1.duration_ = 5

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
		end

		function arg_193_1.playNext_(arg_195_0)
			if arg_195_0 == 1 then
				arg_193_0:Play116381047(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = 0
			local var_196_1 = 0.675

			if var_196_0 < arg_193_1.time_ and arg_193_1.time_ <= var_196_0 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, false)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_2 = arg_193_1:GetWordFromCfg(116381046)
				local var_196_3 = arg_193_1:FormatText(var_196_2.content)

				arg_193_1.text_.text = var_196_3

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_4 = 27
				local var_196_5 = utf8.len(var_196_3)
				local var_196_6 = var_196_4 <= 0 and var_196_1 or var_196_1 * (var_196_5 / var_196_4)

				if var_196_6 > 0 and var_196_1 < var_196_6 then
					arg_193_1.talkMaxDuration = var_196_6

					if var_196_6 + var_196_0 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_6 + var_196_0
					end
				end

				arg_193_1.text_.text = var_196_3
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)
				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_7 = math.max(var_196_1, arg_193_1.talkMaxDuration)

			if var_196_0 <= arg_193_1.time_ and arg_193_1.time_ < var_196_0 + var_196_7 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_0) / var_196_7

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_0 + var_196_7 and arg_193_1.time_ < var_196_0 + var_196_7 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play116381047 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 116381047
		arg_197_1.duration_ = 7.1

		local var_197_0 = {
			zh = 4.166,
			ja = 7.1
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
				arg_197_0:Play116381048(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = manager.ui.mainCamera.transform
			local var_200_1 = 0

			if var_200_1 < arg_197_1.time_ and arg_197_1.time_ <= var_200_1 + arg_200_0 then
				arg_197_1.var_.shakeOldPos = var_200_0.localPosition
			end

			local var_200_2 = 0.6

			if var_200_1 <= arg_197_1.time_ and arg_197_1.time_ < var_200_1 + var_200_2 then
				local var_200_3 = (arg_197_1.time_ - var_200_1) / 0.066
				local var_200_4, var_200_5 = math.modf(var_200_3)

				var_200_0.localPosition = Vector3.New(var_200_5 * 0.13, var_200_5 * 0.13, var_200_5 * 0.13) + arg_197_1.var_.shakeOldPos
			end

			if arg_197_1.time_ >= var_200_1 + var_200_2 and arg_197_1.time_ < var_200_1 + var_200_2 + arg_200_0 then
				var_200_0.localPosition = arg_197_1.var_.shakeOldPos
			end

			local var_200_6 = 0

			if var_200_6 < arg_197_1.time_ and arg_197_1.time_ <= var_200_6 + arg_200_0 then
				arg_197_1.allBtn_.enabled = false
			end

			local var_200_7 = 0.6

			if arg_197_1.time_ >= var_200_6 + var_200_7 and arg_197_1.time_ < var_200_6 + var_200_7 + arg_200_0 then
				arg_197_1.allBtn_.enabled = true
			end

			local var_200_8 = 0
			local var_200_9 = 0.475

			if var_200_8 < arg_197_1.time_ and arg_197_1.time_ <= var_200_8 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_10 = arg_197_1:FormatText(StoryNameCfg[327].name)

				arg_197_1.leftNameTxt_.text = var_200_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, true)
				arg_197_1.iconController_:SetSelectedState("hero")

				arg_197_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1028")

				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_11 = arg_197_1:GetWordFromCfg(116381047)
				local var_200_12 = arg_197_1:FormatText(var_200_11.content)

				arg_197_1.text_.text = var_200_12

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_13 = 19
				local var_200_14 = utf8.len(var_200_12)
				local var_200_15 = var_200_13 <= 0 and var_200_9 or var_200_9 * (var_200_14 / var_200_13)

				if var_200_15 > 0 and var_200_9 < var_200_15 then
					arg_197_1.talkMaxDuration = var_200_15

					if var_200_15 + var_200_8 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_15 + var_200_8
					end
				end

				arg_197_1.text_.text = var_200_12
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116381", "116381047", "story_v_out_116381.awb") ~= 0 then
					local var_200_16 = manager.audio:GetVoiceLength("story_v_out_116381", "116381047", "story_v_out_116381.awb") / 1000

					if var_200_16 + var_200_8 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_16 + var_200_8
					end

					if var_200_11.prefab_name ~= "" and arg_197_1.actors_[var_200_11.prefab_name] ~= nil then
						local var_200_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_197_1.actors_[var_200_11.prefab_name].transform, "story_v_out_116381", "116381047", "story_v_out_116381.awb")

						arg_197_1:RecordAudio("116381047", var_200_17)
						arg_197_1:RecordAudio("116381047", var_200_17)
					else
						arg_197_1:AudioAction("play", "voice", "story_v_out_116381", "116381047", "story_v_out_116381.awb")
					end

					arg_197_1:RecordHistoryTalkVoice("story_v_out_116381", "116381047", "story_v_out_116381.awb")
				end

				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_18 = math.max(var_200_9, arg_197_1.talkMaxDuration)

			if var_200_8 <= arg_197_1.time_ and arg_197_1.time_ < var_200_8 + var_200_18 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_8) / var_200_18

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_8 + var_200_18 and arg_197_1.time_ < var_200_8 + var_200_18 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play116381048 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 116381048
		arg_201_1.duration_ = 3.233

		local var_201_0 = {
			zh = 3.2,
			ja = 3.233
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
				arg_201_0:Play116381049(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = arg_201_1.actors_["10024ui_story"].transform
			local var_204_1 = 0

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 then
				arg_201_1.var_.moveOldPos10024ui_story = var_204_0.localPosition
			end

			local var_204_2 = 0.001

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_2 then
				local var_204_3 = (arg_201_1.time_ - var_204_1) / var_204_2
				local var_204_4 = Vector3.New(0, -1, -6)

				var_204_0.localPosition = Vector3.Lerp(arg_201_1.var_.moveOldPos10024ui_story, var_204_4, var_204_3)

				local var_204_5 = manager.ui.mainCamera.transform.position - var_204_0.position

				var_204_0.forward = Vector3.New(var_204_5.x, var_204_5.y, var_204_5.z)

				local var_204_6 = var_204_0.localEulerAngles

				var_204_6.z = 0
				var_204_6.x = 0
				var_204_0.localEulerAngles = var_204_6
			end

			if arg_201_1.time_ >= var_204_1 + var_204_2 and arg_201_1.time_ < var_204_1 + var_204_2 + arg_204_0 then
				var_204_0.localPosition = Vector3.New(0, -1, -6)

				local var_204_7 = manager.ui.mainCamera.transform.position - var_204_0.position

				var_204_0.forward = Vector3.New(var_204_7.x, var_204_7.y, var_204_7.z)

				local var_204_8 = var_204_0.localEulerAngles

				var_204_8.z = 0
				var_204_8.x = 0
				var_204_0.localEulerAngles = var_204_8
			end

			local var_204_9 = 0

			if var_204_9 < arg_201_1.time_ and arg_201_1.time_ <= var_204_9 + arg_204_0 then
				arg_201_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/story10024/story10024action/10024action6_1")
			end

			local var_204_10 = 0

			if var_204_10 < arg_201_1.time_ and arg_201_1.time_ <= var_204_10 + arg_204_0 then
				arg_201_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_204_11 = arg_201_1.actors_["10024ui_story"]
			local var_204_12 = 0

			if var_204_12 < arg_201_1.time_ and arg_201_1.time_ <= var_204_12 + arg_204_0 and arg_201_1.var_.characterEffect10024ui_story == nil then
				arg_201_1.var_.characterEffect10024ui_story = var_204_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_13 = 0.2

			if var_204_12 <= arg_201_1.time_ and arg_201_1.time_ < var_204_12 + var_204_13 then
				local var_204_14 = (arg_201_1.time_ - var_204_12) / var_204_13

				if arg_201_1.var_.characterEffect10024ui_story then
					arg_201_1.var_.characterEffect10024ui_story.fillFlat = false
				end
			end

			if arg_201_1.time_ >= var_204_12 + var_204_13 and arg_201_1.time_ < var_204_12 + var_204_13 + arg_204_0 and arg_201_1.var_.characterEffect10024ui_story then
				arg_201_1.var_.characterEffect10024ui_story.fillFlat = false
			end

			local var_204_15 = 0
			local var_204_16 = 0.25

			if var_204_15 < arg_201_1.time_ and arg_201_1.time_ <= var_204_15 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_17 = arg_201_1:FormatText(StoryNameCfg[332].name)

				arg_201_1.leftNameTxt_.text = var_204_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_18 = arg_201_1:GetWordFromCfg(116381048)
				local var_204_19 = arg_201_1:FormatText(var_204_18.content)

				arg_201_1.text_.text = var_204_19

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_20 = 10
				local var_204_21 = utf8.len(var_204_19)
				local var_204_22 = var_204_20 <= 0 and var_204_16 or var_204_16 * (var_204_21 / var_204_20)

				if var_204_22 > 0 and var_204_16 < var_204_22 then
					arg_201_1.talkMaxDuration = var_204_22

					if var_204_22 + var_204_15 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_22 + var_204_15
					end
				end

				arg_201_1.text_.text = var_204_19
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116381", "116381048", "story_v_out_116381.awb") ~= 0 then
					local var_204_23 = manager.audio:GetVoiceLength("story_v_out_116381", "116381048", "story_v_out_116381.awb") / 1000

					if var_204_23 + var_204_15 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_23 + var_204_15
					end

					if var_204_18.prefab_name ~= "" and arg_201_1.actors_[var_204_18.prefab_name] ~= nil then
						local var_204_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_18.prefab_name].transform, "story_v_out_116381", "116381048", "story_v_out_116381.awb")

						arg_201_1:RecordAudio("116381048", var_204_24)
						arg_201_1:RecordAudio("116381048", var_204_24)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_out_116381", "116381048", "story_v_out_116381.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_out_116381", "116381048", "story_v_out_116381.awb")
				end

				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_25 = math.max(var_204_16, arg_201_1.talkMaxDuration)

			if var_204_15 <= arg_201_1.time_ and arg_201_1.time_ < var_204_15 + var_204_25 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_15) / var_204_25

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_15 + var_204_25 and arg_201_1.time_ < var_204_15 + var_204_25 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play116381049 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 116381049
		arg_205_1.duration_ = 2.8

		local var_205_0 = {
			zh = 2.2,
			ja = 2.8
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
				arg_205_0:Play116381050(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = arg_205_1.actors_["10024ui_story"].transform
			local var_208_1 = 0

			if var_208_1 < arg_205_1.time_ and arg_205_1.time_ <= var_208_1 + arg_208_0 then
				arg_205_1.var_.moveOldPos10024ui_story = var_208_0.localPosition
			end

			local var_208_2 = 0.001

			if var_208_1 <= arg_205_1.time_ and arg_205_1.time_ < var_208_1 + var_208_2 then
				local var_208_3 = (arg_205_1.time_ - var_208_1) / var_208_2
				local var_208_4 = Vector3.New(0, -1, -6)

				var_208_0.localPosition = Vector3.Lerp(arg_205_1.var_.moveOldPos10024ui_story, var_208_4, var_208_3)

				local var_208_5 = manager.ui.mainCamera.transform.position - var_208_0.position

				var_208_0.forward = Vector3.New(var_208_5.x, var_208_5.y, var_208_5.z)

				local var_208_6 = var_208_0.localEulerAngles

				var_208_6.z = 0
				var_208_6.x = 0
				var_208_0.localEulerAngles = var_208_6
			end

			if arg_205_1.time_ >= var_208_1 + var_208_2 and arg_205_1.time_ < var_208_1 + var_208_2 + arg_208_0 then
				var_208_0.localPosition = Vector3.New(0, -1, -6)

				local var_208_7 = manager.ui.mainCamera.transform.position - var_208_0.position

				var_208_0.forward = Vector3.New(var_208_7.x, var_208_7.y, var_208_7.z)

				local var_208_8 = var_208_0.localEulerAngles

				var_208_8.z = 0
				var_208_8.x = 0
				var_208_0.localEulerAngles = var_208_8
			end

			local var_208_9 = 0

			if var_208_9 < arg_205_1.time_ and arg_205_1.time_ <= var_208_9 + arg_208_0 then
				arg_205_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/story10024/story10024action/10024action6_2")
			end

			local var_208_10 = 0

			if var_208_10 < arg_205_1.time_ and arg_205_1.time_ <= var_208_10 + arg_208_0 then
				arg_205_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_208_11 = 0
			local var_208_12 = 0.15

			if var_208_11 < arg_205_1.time_ and arg_205_1.time_ <= var_208_11 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_13 = arg_205_1:FormatText(StoryNameCfg[332].name)

				arg_205_1.leftNameTxt_.text = var_208_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_14 = arg_205_1:GetWordFromCfg(116381049)
				local var_208_15 = arg_205_1:FormatText(var_208_14.content)

				arg_205_1.text_.text = var_208_15

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_16 = 6
				local var_208_17 = utf8.len(var_208_15)
				local var_208_18 = var_208_16 <= 0 and var_208_12 or var_208_12 * (var_208_17 / var_208_16)

				if var_208_18 > 0 and var_208_12 < var_208_18 then
					arg_205_1.talkMaxDuration = var_208_18

					if var_208_18 + var_208_11 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_18 + var_208_11
					end
				end

				arg_205_1.text_.text = var_208_15
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116381", "116381049", "story_v_out_116381.awb") ~= 0 then
					local var_208_19 = manager.audio:GetVoiceLength("story_v_out_116381", "116381049", "story_v_out_116381.awb") / 1000

					if var_208_19 + var_208_11 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_19 + var_208_11
					end

					if var_208_14.prefab_name ~= "" and arg_205_1.actors_[var_208_14.prefab_name] ~= nil then
						local var_208_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_14.prefab_name].transform, "story_v_out_116381", "116381049", "story_v_out_116381.awb")

						arg_205_1:RecordAudio("116381049", var_208_20)
						arg_205_1:RecordAudio("116381049", var_208_20)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_116381", "116381049", "story_v_out_116381.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_116381", "116381049", "story_v_out_116381.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_21 = math.max(var_208_12, arg_205_1.talkMaxDuration)

			if var_208_11 <= arg_205_1.time_ and arg_205_1.time_ < var_208_11 + var_208_21 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_11) / var_208_21

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_11 + var_208_21 and arg_205_1.time_ < var_208_11 + var_208_21 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play116381050 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 116381050
		arg_209_1.duration_ = 9.1

		local var_209_0 = {
			zh = 9.1,
			ja = 7.233
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
				arg_209_0:Play116381051(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = arg_209_1.actors_["10024ui_story"].transform
			local var_212_1 = 0

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 then
				arg_209_1.var_.moveOldPos10024ui_story = var_212_0.localPosition
			end

			local var_212_2 = 0.001

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_2 then
				local var_212_3 = (arg_209_1.time_ - var_212_1) / var_212_2
				local var_212_4 = Vector3.New(0, -1, -6)

				var_212_0.localPosition = Vector3.Lerp(arg_209_1.var_.moveOldPos10024ui_story, var_212_4, var_212_3)

				local var_212_5 = manager.ui.mainCamera.transform.position - var_212_0.position

				var_212_0.forward = Vector3.New(var_212_5.x, var_212_5.y, var_212_5.z)

				local var_212_6 = var_212_0.localEulerAngles

				var_212_6.z = 0
				var_212_6.x = 0
				var_212_0.localEulerAngles = var_212_6
			end

			if arg_209_1.time_ >= var_212_1 + var_212_2 and arg_209_1.time_ < var_212_1 + var_212_2 + arg_212_0 then
				var_212_0.localPosition = Vector3.New(0, -1, -6)

				local var_212_7 = manager.ui.mainCamera.transform.position - var_212_0.position

				var_212_0.forward = Vector3.New(var_212_7.x, var_212_7.y, var_212_7.z)

				local var_212_8 = var_212_0.localEulerAngles

				var_212_8.z = 0
				var_212_8.x = 0
				var_212_0.localEulerAngles = var_212_8
			end

			local var_212_9 = 0

			if var_212_9 < arg_209_1.time_ and arg_209_1.time_ <= var_212_9 + arg_212_0 then
				arg_209_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/story10024/story10024action/10024action1_1")
			end

			local var_212_10 = 0

			if var_212_10 < arg_209_1.time_ and arg_209_1.time_ <= var_212_10 + arg_212_0 then
				arg_209_1:PlayTimeline("10024ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0204cva")
			end

			local var_212_11 = 0
			local var_212_12 = 1.025

			if var_212_11 < arg_209_1.time_ and arg_209_1.time_ <= var_212_11 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_13 = arg_209_1:FormatText(StoryNameCfg[332].name)

				arg_209_1.leftNameTxt_.text = var_212_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_14 = arg_209_1:GetWordFromCfg(116381050)
				local var_212_15 = arg_209_1:FormatText(var_212_14.content)

				arg_209_1.text_.text = var_212_15

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_16 = 41
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

				if manager.audio:GetVoiceLength("story_v_out_116381", "116381050", "story_v_out_116381.awb") ~= 0 then
					local var_212_19 = manager.audio:GetVoiceLength("story_v_out_116381", "116381050", "story_v_out_116381.awb") / 1000

					if var_212_19 + var_212_11 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_19 + var_212_11
					end

					if var_212_14.prefab_name ~= "" and arg_209_1.actors_[var_212_14.prefab_name] ~= nil then
						local var_212_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_14.prefab_name].transform, "story_v_out_116381", "116381050", "story_v_out_116381.awb")

						arg_209_1:RecordAudio("116381050", var_212_20)
						arg_209_1:RecordAudio("116381050", var_212_20)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_out_116381", "116381050", "story_v_out_116381.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_out_116381", "116381050", "story_v_out_116381.awb")
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
	Play116381051 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 116381051
		arg_213_1.duration_ = 6.333

		local var_213_0 = {
			zh = 5.1,
			ja = 6.333
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
				arg_213_0:Play116381052(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["10024ui_story"].transform
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 then
				arg_213_1.var_.moveOldPos10024ui_story = var_216_0.localPosition
			end

			local var_216_2 = 0.001

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_2 then
				local var_216_3 = (arg_213_1.time_ - var_216_1) / var_216_2
				local var_216_4 = Vector3.New(0, 100, 0)

				var_216_0.localPosition = Vector3.Lerp(arg_213_1.var_.moveOldPos10024ui_story, var_216_4, var_216_3)

				local var_216_5 = manager.ui.mainCamera.transform.position - var_216_0.position

				var_216_0.forward = Vector3.New(var_216_5.x, var_216_5.y, var_216_5.z)

				local var_216_6 = var_216_0.localEulerAngles

				var_216_6.z = 0
				var_216_6.x = 0
				var_216_0.localEulerAngles = var_216_6
			end

			if arg_213_1.time_ >= var_216_1 + var_216_2 and arg_213_1.time_ < var_216_1 + var_216_2 + arg_216_0 then
				var_216_0.localPosition = Vector3.New(0, 100, 0)

				local var_216_7 = manager.ui.mainCamera.transform.position - var_216_0.position

				var_216_0.forward = Vector3.New(var_216_7.x, var_216_7.y, var_216_7.z)

				local var_216_8 = var_216_0.localEulerAngles

				var_216_8.z = 0
				var_216_8.x = 0
				var_216_0.localEulerAngles = var_216_8
			end

			local var_216_9 = 0
			local var_216_10 = 0.35

			if var_216_9 < arg_213_1.time_ and arg_213_1.time_ <= var_216_9 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, false)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_11 = arg_213_1:GetWordFromCfg(116381051)
				local var_216_12 = arg_213_1:FormatText(var_216_11.content)

				arg_213_1.text_.text = var_216_12

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_13 = 14
				local var_216_14 = utf8.len(var_216_12)
				local var_216_15 = var_216_13 <= 0 and var_216_10 or var_216_10 * (var_216_14 / var_216_13)

				if var_216_15 > 0 and var_216_10 < var_216_15 then
					arg_213_1.talkMaxDuration = var_216_15

					if var_216_15 + var_216_9 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_15 + var_216_9
					end
				end

				arg_213_1.text_.text = var_216_12
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116381", "116381051", "story_v_out_116381.awb") ~= 0 then
					local var_216_16 = manager.audio:GetVoiceLength("story_v_out_116381", "116381051", "story_v_out_116381.awb") / 1000

					if var_216_16 + var_216_9 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_16 + var_216_9
					end

					if var_216_11.prefab_name ~= "" and arg_213_1.actors_[var_216_11.prefab_name] ~= nil then
						local var_216_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_213_1.actors_[var_216_11.prefab_name].transform, "story_v_out_116381", "116381051", "story_v_out_116381.awb")

						arg_213_1:RecordAudio("116381051", var_216_17)
						arg_213_1:RecordAudio("116381051", var_216_17)
					else
						arg_213_1:AudioAction("play", "voice", "story_v_out_116381", "116381051", "story_v_out_116381.awb")
					end

					arg_213_1:RecordHistoryTalkVoice("story_v_out_116381", "116381051", "story_v_out_116381.awb")
				end

				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_18 = math.max(var_216_10, arg_213_1.talkMaxDuration)

			if var_216_9 <= arg_213_1.time_ and arg_213_1.time_ < var_216_9 + var_216_18 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_9) / var_216_18

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_9 + var_216_18 and arg_213_1.time_ < var_216_9 + var_216_18 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play116381052 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 116381052
		arg_217_1.duration_ = 9.833

		local var_217_0 = {
			zh = 9.833,
			ja = 5
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
				arg_217_0:Play116381053(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = 0
			local var_220_1 = 0.725

			if var_220_0 < arg_217_1.time_ and arg_217_1.time_ <= var_220_0 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, false)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_2 = arg_217_1:GetWordFromCfg(116381052)
				local var_220_3 = arg_217_1:FormatText(var_220_2.content)

				arg_217_1.text_.text = var_220_3

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_4 = 29
				local var_220_5 = utf8.len(var_220_3)
				local var_220_6 = var_220_4 <= 0 and var_220_1 or var_220_1 * (var_220_5 / var_220_4)

				if var_220_6 > 0 and var_220_1 < var_220_6 then
					arg_217_1.talkMaxDuration = var_220_6

					if var_220_6 + var_220_0 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_6 + var_220_0
					end
				end

				arg_217_1.text_.text = var_220_3
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116381", "116381052", "story_v_out_116381.awb") ~= 0 then
					local var_220_7 = manager.audio:GetVoiceLength("story_v_out_116381", "116381052", "story_v_out_116381.awb") / 1000

					if var_220_7 + var_220_0 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_7 + var_220_0
					end

					if var_220_2.prefab_name ~= "" and arg_217_1.actors_[var_220_2.prefab_name] ~= nil then
						local var_220_8 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_2.prefab_name].transform, "story_v_out_116381", "116381052", "story_v_out_116381.awb")

						arg_217_1:RecordAudio("116381052", var_220_8)
						arg_217_1:RecordAudio("116381052", var_220_8)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_out_116381", "116381052", "story_v_out_116381.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_out_116381", "116381052", "story_v_out_116381.awb")
				end

				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_9 = math.max(var_220_1, arg_217_1.talkMaxDuration)

			if var_220_0 <= arg_217_1.time_ and arg_217_1.time_ < var_220_0 + var_220_9 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_0) / var_220_9

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_0 + var_220_9 and arg_217_1.time_ < var_220_0 + var_220_9 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play116381053 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 116381053
		arg_221_1.duration_ = 5

		SetActive(arg_221_1.tipsGo_, false)

		function arg_221_1.onSingleLineFinish_()
			arg_221_1.onSingleLineUpdate_ = nil
			arg_221_1.onSingleLineFinish_ = nil
			arg_221_1.state_ = "waiting"
		end

		function arg_221_1.playNext_(arg_223_0)
			if arg_223_0 == 1 then
				arg_221_0:Play116381054(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = 0
			local var_224_1 = 1.025

			if var_224_0 < arg_221_1.time_ and arg_221_1.time_ <= var_224_0 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, false)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_2 = arg_221_1:GetWordFromCfg(116381053)
				local var_224_3 = arg_221_1:FormatText(var_224_2.content)

				arg_221_1.text_.text = var_224_3

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_4 = 41
				local var_224_5 = utf8.len(var_224_3)
				local var_224_6 = var_224_4 <= 0 and var_224_1 or var_224_1 * (var_224_5 / var_224_4)

				if var_224_6 > 0 and var_224_1 < var_224_6 then
					arg_221_1.talkMaxDuration = var_224_6

					if var_224_6 + var_224_0 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_6 + var_224_0
					end
				end

				arg_221_1.text_.text = var_224_3
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)
				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_7 = math.max(var_224_1, arg_221_1.talkMaxDuration)

			if var_224_0 <= arg_221_1.time_ and arg_221_1.time_ < var_224_0 + var_224_7 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_0) / var_224_7

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_0 + var_224_7 and arg_221_1.time_ < var_224_0 + var_224_7 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play116381054 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 116381054
		arg_225_1.duration_ = 5

		SetActive(arg_225_1.tipsGo_, false)

		function arg_225_1.onSingleLineFinish_()
			arg_225_1.onSingleLineUpdate_ = nil
			arg_225_1.onSingleLineFinish_ = nil
			arg_225_1.state_ = "waiting"
		end

		function arg_225_1.playNext_(arg_227_0)
			if arg_227_0 == 1 then
				arg_225_0:Play116381055(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = 0
			local var_228_1 = 0.275

			if var_228_0 < arg_225_1.time_ and arg_225_1.time_ <= var_228_0 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, false)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_2 = arg_225_1:GetWordFromCfg(116381054)
				local var_228_3 = arg_225_1:FormatText(var_228_2.content)

				arg_225_1.text_.text = var_228_3

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_4 = 11
				local var_228_5 = utf8.len(var_228_3)
				local var_228_6 = var_228_4 <= 0 and var_228_1 or var_228_1 * (var_228_5 / var_228_4)

				if var_228_6 > 0 and var_228_1 < var_228_6 then
					arg_225_1.talkMaxDuration = var_228_6

					if var_228_6 + var_228_0 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_6 + var_228_0
					end
				end

				arg_225_1.text_.text = var_228_3
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)
				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_7 = math.max(var_228_1, arg_225_1.talkMaxDuration)

			if var_228_0 <= arg_225_1.time_ and arg_225_1.time_ < var_228_0 + var_228_7 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_0) / var_228_7

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_0 + var_228_7 and arg_225_1.time_ < var_228_0 + var_228_7 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play116381055 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 116381055
		arg_229_1.duration_ = 5

		SetActive(arg_229_1.tipsGo_, false)

		function arg_229_1.onSingleLineFinish_()
			arg_229_1.onSingleLineUpdate_ = nil
			arg_229_1.onSingleLineFinish_ = nil
			arg_229_1.state_ = "waiting"
		end

		function arg_229_1.playNext_(arg_231_0)
			if arg_231_0 == 1 then
				arg_229_0:Play116381056(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = 0
			local var_232_1 = 0.1

			if var_232_0 < arg_229_1.time_ and arg_229_1.time_ <= var_232_0 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, false)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_2 = arg_229_1:GetWordFromCfg(116381055)
				local var_232_3 = arg_229_1:FormatText(var_232_2.content)

				arg_229_1.text_.text = var_232_3

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_4 = 4
				local var_232_5 = utf8.len(var_232_3)
				local var_232_6 = var_232_4 <= 0 and var_232_1 or var_232_1 * (var_232_5 / var_232_4)

				if var_232_6 > 0 and var_232_1 < var_232_6 then
					arg_229_1.talkMaxDuration = var_232_6

					if var_232_6 + var_232_0 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_6 + var_232_0
					end
				end

				arg_229_1.text_.text = var_232_3
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)
				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_7 = math.max(var_232_1, arg_229_1.talkMaxDuration)

			if var_232_0 <= arg_229_1.time_ and arg_229_1.time_ < var_232_0 + var_232_7 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_0) / var_232_7

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_0 + var_232_7 and arg_229_1.time_ < var_232_0 + var_232_7 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play116381056 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 116381056
		arg_233_1.duration_ = 5

		SetActive(arg_233_1.tipsGo_, false)

		function arg_233_1.onSingleLineFinish_()
			arg_233_1.onSingleLineUpdate_ = nil
			arg_233_1.onSingleLineFinish_ = nil
			arg_233_1.state_ = "waiting"
		end

		function arg_233_1.playNext_(arg_235_0)
			if arg_235_0 == 1 then
				arg_233_0:Play116381057(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = 0
			local var_236_1 = 0.175

			if var_236_0 < arg_233_1.time_ and arg_233_1.time_ <= var_236_0 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_2 = arg_233_1:FormatText(StoryNameCfg[344].name)

				arg_233_1.leftNameTxt_.text = var_236_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_3 = arg_233_1:GetWordFromCfg(116381056)
				local var_236_4 = arg_233_1:FormatText(var_236_3.content)

				arg_233_1.text_.text = var_236_4

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_5 = 7
				local var_236_6 = utf8.len(var_236_4)
				local var_236_7 = var_236_5 <= 0 and var_236_1 or var_236_1 * (var_236_6 / var_236_5)

				if var_236_7 > 0 and var_236_1 < var_236_7 then
					arg_233_1.talkMaxDuration = var_236_7

					if var_236_7 + var_236_0 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_7 + var_236_0
					end
				end

				arg_233_1.text_.text = var_236_4
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)
				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_8 = math.max(var_236_1, arg_233_1.talkMaxDuration)

			if var_236_0 <= arg_233_1.time_ and arg_233_1.time_ < var_236_0 + var_236_8 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_0) / var_236_8

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_0 + var_236_8 and arg_233_1.time_ < var_236_0 + var_236_8 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play116381057 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 116381057
		arg_237_1.duration_ = 5

		SetActive(arg_237_1.tipsGo_, false)

		function arg_237_1.onSingleLineFinish_()
			arg_237_1.onSingleLineUpdate_ = nil
			arg_237_1.onSingleLineFinish_ = nil
			arg_237_1.state_ = "waiting"
		end

		function arg_237_1.playNext_(arg_239_0)
			if arg_239_0 == 1 then
				arg_237_0:Play116381058(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = 0
			local var_240_1 = 1.05

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

				local var_240_2 = arg_237_1:GetWordFromCfg(116381057)
				local var_240_3 = arg_237_1:FormatText(var_240_2.content)

				arg_237_1.text_.text = var_240_3

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_4 = 42
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
	Play116381058 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 116381058
		arg_241_1.duration_ = 5

		SetActive(arg_241_1.tipsGo_, false)

		function arg_241_1.onSingleLineFinish_()
			arg_241_1.onSingleLineUpdate_ = nil
			arg_241_1.onSingleLineFinish_ = nil
			arg_241_1.state_ = "waiting"
		end

		function arg_241_1.playNext_(arg_243_0)
			if arg_243_0 == 1 then
				arg_241_0:Play116381059(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = 0
			local var_244_1 = 1.05

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

				local var_244_2 = arg_241_1:GetWordFromCfg(116381058)
				local var_244_3 = arg_241_1:FormatText(var_244_2.content)

				arg_241_1.text_.text = var_244_3

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_4 = 42
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
	Play116381059 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 116381059
		arg_245_1.duration_ = 8.866

		local var_245_0 = {
			zh = 8.3,
			ja = 8.866
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
				arg_245_0:Play116381060(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = 0
			local var_248_1 = 0.625

			if var_248_0 < arg_245_1.time_ and arg_245_1.time_ <= var_248_0 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_2 = arg_245_1:FormatText(StoryNameCfg[328].name)

				arg_245_1.leftNameTxt_.text = var_248_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, true)
				arg_245_1.iconController_:SetSelectedState("hero")

				arg_245_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10025")

				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_3 = arg_245_1:GetWordFromCfg(116381059)
				local var_248_4 = arg_245_1:FormatText(var_248_3.content)

				arg_245_1.text_.text = var_248_4

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_5 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_116381", "116381059", "story_v_out_116381.awb") ~= 0 then
					local var_248_8 = manager.audio:GetVoiceLength("story_v_out_116381", "116381059", "story_v_out_116381.awb") / 1000

					if var_248_8 + var_248_0 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_8 + var_248_0
					end

					if var_248_3.prefab_name ~= "" and arg_245_1.actors_[var_248_3.prefab_name] ~= nil then
						local var_248_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_245_1.actors_[var_248_3.prefab_name].transform, "story_v_out_116381", "116381059", "story_v_out_116381.awb")

						arg_245_1:RecordAudio("116381059", var_248_9)
						arg_245_1:RecordAudio("116381059", var_248_9)
					else
						arg_245_1:AudioAction("play", "voice", "story_v_out_116381", "116381059", "story_v_out_116381.awb")
					end

					arg_245_1:RecordHistoryTalkVoice("story_v_out_116381", "116381059", "story_v_out_116381.awb")
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
	Play116381060 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 116381060
		arg_249_1.duration_ = 5

		SetActive(arg_249_1.tipsGo_, false)

		function arg_249_1.onSingleLineFinish_()
			arg_249_1.onSingleLineUpdate_ = nil
			arg_249_1.onSingleLineFinish_ = nil
			arg_249_1.state_ = "waiting"
		end

		function arg_249_1.playNext_(arg_251_0)
			if arg_251_0 == 1 then
				arg_249_0:Play116381061(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = 0
			local var_252_1 = 0.2

			if var_252_0 < arg_249_1.time_ and arg_249_1.time_ <= var_252_0 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_2 = arg_249_1:FormatText(StoryNameCfg[344].name)

				arg_249_1.leftNameTxt_.text = var_252_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_3 = arg_249_1:GetWordFromCfg(116381060)
				local var_252_4 = arg_249_1:FormatText(var_252_3.content)

				arg_249_1.text_.text = var_252_4

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_5 = 8
				local var_252_6 = utf8.len(var_252_4)
				local var_252_7 = var_252_5 <= 0 and var_252_1 or var_252_1 * (var_252_6 / var_252_5)

				if var_252_7 > 0 and var_252_1 < var_252_7 then
					arg_249_1.talkMaxDuration = var_252_7

					if var_252_7 + var_252_0 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_7 + var_252_0
					end
				end

				arg_249_1.text_.text = var_252_4
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)
				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_8 = math.max(var_252_1, arg_249_1.talkMaxDuration)

			if var_252_0 <= arg_249_1.time_ and arg_249_1.time_ < var_252_0 + var_252_8 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_0) / var_252_8

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_0 + var_252_8 and arg_249_1.time_ < var_252_0 + var_252_8 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play116381061 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 116381061
		arg_253_1.duration_ = 7.333

		local var_253_0 = {
			zh = 3.866,
			ja = 7.333
		}
		local var_253_1 = manager.audio:GetLocalizationFlag()

		if var_253_0[var_253_1] ~= nil then
			arg_253_1.duration_ = var_253_0[var_253_1]
		end

		SetActive(arg_253_1.tipsGo_, false)

		function arg_253_1.onSingleLineFinish_()
			arg_253_1.onSingleLineUpdate_ = nil
			arg_253_1.onSingleLineFinish_ = nil
			arg_253_1.state_ = "waiting"
		end

		function arg_253_1.playNext_(arg_255_0)
			if arg_255_0 == 1 then
				arg_253_0:Play116381062(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = 0
			local var_256_1 = 0.325

			if var_256_0 < arg_253_1.time_ and arg_253_1.time_ <= var_256_0 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_2 = arg_253_1:FormatText(StoryNameCfg[328].name)

				arg_253_1.leftNameTxt_.text = var_256_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, true)
				arg_253_1.iconController_:SetSelectedState("hero")

				arg_253_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10025")

				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_3 = arg_253_1:GetWordFromCfg(116381061)
				local var_256_4 = arg_253_1:FormatText(var_256_3.content)

				arg_253_1.text_.text = var_256_4

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_5 = 13
				local var_256_6 = utf8.len(var_256_4)
				local var_256_7 = var_256_5 <= 0 and var_256_1 or var_256_1 * (var_256_6 / var_256_5)

				if var_256_7 > 0 and var_256_1 < var_256_7 then
					arg_253_1.talkMaxDuration = var_256_7

					if var_256_7 + var_256_0 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_7 + var_256_0
					end
				end

				arg_253_1.text_.text = var_256_4
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116381", "116381061", "story_v_out_116381.awb") ~= 0 then
					local var_256_8 = manager.audio:GetVoiceLength("story_v_out_116381", "116381061", "story_v_out_116381.awb") / 1000

					if var_256_8 + var_256_0 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_8 + var_256_0
					end

					if var_256_3.prefab_name ~= "" and arg_253_1.actors_[var_256_3.prefab_name] ~= nil then
						local var_256_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_253_1.actors_[var_256_3.prefab_name].transform, "story_v_out_116381", "116381061", "story_v_out_116381.awb")

						arg_253_1:RecordAudio("116381061", var_256_9)
						arg_253_1:RecordAudio("116381061", var_256_9)
					else
						arg_253_1:AudioAction("play", "voice", "story_v_out_116381", "116381061", "story_v_out_116381.awb")
					end

					arg_253_1:RecordHistoryTalkVoice("story_v_out_116381", "116381061", "story_v_out_116381.awb")
				end

				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_10 = math.max(var_256_1, arg_253_1.talkMaxDuration)

			if var_256_0 <= arg_253_1.time_ and arg_253_1.time_ < var_256_0 + var_256_10 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_0) / var_256_10

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_0 + var_256_10 and arg_253_1.time_ < var_256_0 + var_256_10 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play116381062 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 116381062
		arg_257_1.duration_ = 10.542999999999

		SetActive(arg_257_1.tipsGo_, false)

		function arg_257_1.onSingleLineFinish_()
			arg_257_1.onSingleLineUpdate_ = nil
			arg_257_1.onSingleLineFinish_ = nil
			arg_257_1.state_ = "waiting"
		end

		function arg_257_1.playNext_(arg_259_0)
			if arg_259_0 == 1 then
				arg_257_0:Play116381063(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = 2

			if var_260_0 < arg_257_1.time_ and arg_257_1.time_ <= var_260_0 + arg_260_0 then
				local var_260_1 = manager.ui.mainCamera.transform.localPosition
				local var_260_2 = Vector3.New(0, 0, 10) + Vector3.New(var_260_1.x, var_260_1.y, 0)
				local var_260_3 = arg_257_1.bgs_.STblack

				var_260_3.transform.localPosition = var_260_2
				var_260_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_260_4 = var_260_3:GetComponent("SpriteRenderer")

				if var_260_4 and var_260_4.sprite then
					local var_260_5 = (var_260_3.transform.localPosition - var_260_1).z
					local var_260_6 = manager.ui.mainCameraCom_
					local var_260_7 = 2 * var_260_5 * Mathf.Tan(var_260_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_260_8 = var_260_7 * var_260_6.aspect
					local var_260_9 = var_260_4.sprite.bounds.size.x
					local var_260_10 = var_260_4.sprite.bounds.size.y
					local var_260_11 = var_260_8 / var_260_9
					local var_260_12 = var_260_7 / var_260_10
					local var_260_13 = var_260_12 < var_260_11 and var_260_11 or var_260_12

					var_260_3.transform.localScale = Vector3.New(var_260_13, var_260_13, 0)
				end

				for iter_260_0, iter_260_1 in pairs(arg_257_1.bgs_) do
					if iter_260_0 ~= "STblack" then
						iter_260_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_260_14 = 2

			if var_260_14 < arg_257_1.time_ and arg_257_1.time_ <= var_260_14 + arg_260_0 then
				arg_257_1.fswbg_:SetActive(true)
				arg_257_1.dialog_:SetActive(false)

				arg_257_1.fswtw_.percent = 0

				local var_260_15 = arg_257_1:GetWordFromCfg(116381062)
				local var_260_16 = arg_257_1:FormatText(var_260_15.content)

				arg_257_1.fswt_.text = var_260_16

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.fswt_)

				arg_257_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_257_1.fswtw_:SetDirty()

				arg_257_1.typewritterCharCountI18N = 0

				arg_257_1:ShowNextGo(false)
			end

			local var_260_17 = 2.01666666666667

			if var_260_17 < arg_257_1.time_ and arg_257_1.time_ <= var_260_17 + arg_260_0 then
				arg_257_1.var_.oldValueTypewriter = arg_257_1.fswtw_.percent

				arg_257_1:ShowNextGo(false)
			end

			local var_260_18 = 44
			local var_260_19 = 2.93333333333333
			local var_260_20 = arg_257_1:GetWordFromCfg(116381062)
			local var_260_21 = arg_257_1:FormatText(var_260_20.content)
			local var_260_22, var_260_23 = arg_257_1:GetPercentByPara(var_260_21, 1)

			if var_260_17 < arg_257_1.time_ and arg_257_1.time_ <= var_260_17 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0

				local var_260_24 = var_260_18 <= 0 and var_260_19 or var_260_19 * ((var_260_23 - arg_257_1.typewritterCharCountI18N) / var_260_18)

				if var_260_24 > 0 and var_260_19 < var_260_24 then
					arg_257_1.talkMaxDuration = var_260_24

					if var_260_24 + var_260_17 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_24 + var_260_17
					end
				end
			end

			local var_260_25 = 2.93333333333333
			local var_260_26 = math.max(var_260_25, arg_257_1.talkMaxDuration)

			if var_260_17 <= arg_257_1.time_ and arg_257_1.time_ < var_260_17 + var_260_26 then
				local var_260_27 = (arg_257_1.time_ - var_260_17) / var_260_26

				arg_257_1.fswtw_.percent = Mathf.Lerp(arg_257_1.var_.oldValueTypewriter, var_260_22, var_260_27)
				arg_257_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_257_1.fswtw_:SetDirty()
			end

			if arg_257_1.time_ >= var_260_17 + var_260_26 and arg_257_1.time_ < var_260_17 + var_260_26 + arg_260_0 then
				arg_257_1.fswtw_.percent = var_260_22

				arg_257_1.fswtw_:SetDirty()
				arg_257_1:ShowNextGo(true)

				arg_257_1.typewritterCharCountI18N = var_260_23
			end

			local var_260_28 = 2
			local var_260_29 = 8.543
			local var_260_30 = manager.audio:GetVoiceLength("story_v_out_116381", "116381062", "story_v_out_116381.awb") / 1000

			if var_260_30 > 0 and var_260_29 < var_260_30 and var_260_30 + var_260_28 > arg_257_1.duration_ then
				local var_260_31 = var_260_30

				arg_257_1.duration_ = var_260_30 + var_260_28
			end

			if var_260_28 < arg_257_1.time_ and arg_257_1.time_ <= var_260_28 + arg_260_0 then
				local var_260_32 = "play"
				local var_260_33 = "voice"

				arg_257_1:AudioAction(var_260_32, var_260_33, "story_v_out_116381", "116381062", "story_v_out_116381.awb")
			end

			local var_260_34 = 2
			local var_260_35 = 0.266666666666667

			if var_260_34 < arg_257_1.time_ and arg_257_1.time_ <= var_260_34 + arg_260_0 then
				local var_260_36 = "play"
				local var_260_37 = "music"

				arg_257_1:AudioAction(var_260_36, var_260_37, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_260_38 = 2.4
			local var_260_39 = 0.6

			if var_260_38 < arg_257_1.time_ and arg_257_1.time_ <= var_260_38 + arg_260_0 then
				local var_260_40 = "play"
				local var_260_41 = "music"

				arg_257_1:AudioAction(var_260_40, var_260_41, "bgm_activity_1_6_story_story", "bgm_activity_1_6_story_story", "bgm_activity_1_6_story_story.awb")
			end

			local var_260_42 = 2.575
			local var_260_43 = 0.425

			if var_260_42 < arg_257_1.time_ and arg_257_1.time_ <= var_260_42 + arg_260_0 then
				local var_260_44 = "play"
				local var_260_45 = "music"

				arg_257_1:AudioAction(var_260_44, var_260_45, "bgm_activity_1_6_story_story", "corg", "bgm_activity_1_6_story_story.awb")
			end

			local var_260_46 = 0

			if var_260_46 < arg_257_1.time_ and arg_257_1.time_ <= var_260_46 + arg_260_0 then
				arg_257_1.mask_.enabled = true
				arg_257_1.mask_.raycastTarget = true

				arg_257_1:SetGaussion(false)
			end

			local var_260_47 = 2

			if var_260_46 <= arg_257_1.time_ and arg_257_1.time_ < var_260_46 + var_260_47 then
				local var_260_48 = (arg_257_1.time_ - var_260_46) / var_260_47
				local var_260_49 = Color.New(0, 0, 0)

				var_260_49.a = Mathf.Lerp(0, 1, var_260_48)
				arg_257_1.mask_.color = var_260_49
			end

			if arg_257_1.time_ >= var_260_46 + var_260_47 and arg_257_1.time_ < var_260_46 + var_260_47 + arg_260_0 then
				local var_260_50 = Color.New(0, 0, 0)

				var_260_50.a = 1
				arg_257_1.mask_.color = var_260_50
			end

			local var_260_51 = 2

			if var_260_51 < arg_257_1.time_ and arg_257_1.time_ <= var_260_51 + arg_260_0 then
				arg_257_1.mask_.enabled = true
				arg_257_1.mask_.raycastTarget = true

				arg_257_1:SetGaussion(false)
			end

			local var_260_52 = 2

			if var_260_51 <= arg_257_1.time_ and arg_257_1.time_ < var_260_51 + var_260_52 then
				local var_260_53 = (arg_257_1.time_ - var_260_51) / var_260_52
				local var_260_54 = Color.New(0, 0, 0)

				var_260_54.a = Mathf.Lerp(1, 0, var_260_53)
				arg_257_1.mask_.color = var_260_54
			end

			if arg_257_1.time_ >= var_260_51 + var_260_52 and arg_257_1.time_ < var_260_51 + var_260_52 + arg_260_0 then
				local var_260_55 = Color.New(0, 0, 0)
				local var_260_56 = 0

				arg_257_1.mask_.enabled = false
				var_260_55.a = var_260_56
				arg_257_1.mask_.color = var_260_55
			end

			local var_260_57 = 2

			if var_260_57 < arg_257_1.time_ and arg_257_1.time_ <= var_260_57 + arg_260_0 then
				arg_257_1.allBtn_.enabled = false
			end

			local var_260_58 = 2.95

			if arg_257_1.time_ >= var_260_57 + var_260_58 and arg_257_1.time_ < var_260_57 + var_260_58 + arg_260_0 then
				arg_257_1.allBtn_.enabled = true
			end

			local var_260_59 = 1.96666666666667

			if var_260_59 < arg_257_1.time_ and arg_257_1.time_ <= var_260_59 + arg_260_0 then
				arg_257_1.screenFilterGo_:SetActive(false)
			end

			local var_260_60 = 0.0333333333333332

			if var_260_59 <= arg_257_1.time_ and arg_257_1.time_ < var_260_59 + var_260_60 then
				local var_260_61 = (arg_257_1.time_ - var_260_59) / var_260_60

				arg_257_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_260_61)
			end

			if arg_257_1.time_ >= var_260_59 + var_260_60 and arg_257_1.time_ < var_260_59 + var_260_60 + arg_260_0 then
				arg_257_1.screenFilterEffect_.weight = 0
			end
		end
	end,
	Play116381063 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 116381063
		arg_261_1.duration_ = 8.081999999999

		SetActive(arg_261_1.tipsGo_, false)

		function arg_261_1.onSingleLineFinish_()
			arg_261_1.onSingleLineUpdate_ = nil
			arg_261_1.onSingleLineFinish_ = nil
			arg_261_1.state_ = "waiting"
		end

		function arg_261_1.playNext_(arg_263_0)
			if arg_263_0 == 1 then
				arg_261_0:Play116381064(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = 0

			if var_264_0 < arg_261_1.time_ and arg_261_1.time_ <= var_264_0 + arg_264_0 then
				arg_261_1.var_.oldValueTypewriter = arg_261_1.fswtw_.percent

				arg_261_1:ShowNextGo(false)
			end

			local var_264_1 = 26
			local var_264_2 = 1.73333333333333
			local var_264_3 = arg_261_1:GetWordFromCfg(116381062)
			local var_264_4 = arg_261_1:FormatText(var_264_3.content)
			local var_264_5, var_264_6 = arg_261_1:GetPercentByPara(var_264_4, 2)

			if var_264_0 < arg_261_1.time_ and arg_261_1.time_ <= var_264_0 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0

				local var_264_7 = var_264_1 <= 0 and var_264_2 or var_264_2 * ((var_264_6 - arg_261_1.typewritterCharCountI18N) / var_264_1)

				if var_264_7 > 0 and var_264_2 < var_264_7 then
					arg_261_1.talkMaxDuration = var_264_7

					if var_264_7 + var_264_0 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_7 + var_264_0
					end
				end
			end

			local var_264_8 = 1.73333333333333
			local var_264_9 = math.max(var_264_8, arg_261_1.talkMaxDuration)

			if var_264_0 <= arg_261_1.time_ and arg_261_1.time_ < var_264_0 + var_264_9 then
				local var_264_10 = (arg_261_1.time_ - var_264_0) / var_264_9

				arg_261_1.fswtw_.percent = Mathf.Lerp(arg_261_1.var_.oldValueTypewriter, var_264_5, var_264_10)
				arg_261_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_261_1.fswtw_:SetDirty()
			end

			if arg_261_1.time_ >= var_264_0 + var_264_9 and arg_261_1.time_ < var_264_0 + var_264_9 + arg_264_0 then
				arg_261_1.fswtw_.percent = var_264_5

				arg_261_1.fswtw_:SetDirty()
				arg_261_1:ShowNextGo(true)

				arg_261_1.typewritterCharCountI18N = var_264_6
			end

			local var_264_11 = 0
			local var_264_12 = 8.082
			local var_264_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381063", "story_v_out_116381.awb") / 1000

			if var_264_13 > 0 and var_264_12 < var_264_13 and var_264_13 + var_264_11 > arg_261_1.duration_ then
				local var_264_14 = var_264_13

				arg_261_1.duration_ = var_264_13 + var_264_11
			end

			if var_264_11 < arg_261_1.time_ and arg_261_1.time_ <= var_264_11 + arg_264_0 then
				local var_264_15 = "play"
				local var_264_16 = "voice"

				arg_261_1:AudioAction(var_264_15, var_264_16, "story_v_out_116381", "116381063", "story_v_out_116381.awb")
			end

			local var_264_17 = 0

			if var_264_17 < arg_261_1.time_ and arg_261_1.time_ <= var_264_17 + arg_264_0 then
				arg_261_1.allBtn_.enabled = false
			end

			local var_264_18 = 1.73333333333333

			if arg_261_1.time_ >= var_264_17 + var_264_18 and arg_261_1.time_ < var_264_17 + var_264_18 + arg_264_0 then
				arg_261_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381064 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 116381064
		arg_265_1.duration_ = 7.437999999999

		SetActive(arg_265_1.tipsGo_, false)

		function arg_265_1.onSingleLineFinish_()
			arg_265_1.onSingleLineUpdate_ = nil
			arg_265_1.onSingleLineFinish_ = nil
			arg_265_1.state_ = "waiting"
		end

		function arg_265_1.playNext_(arg_267_0)
			if arg_267_0 == 1 then
				arg_265_0:Play116381065(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = 0

			if var_268_0 < arg_265_1.time_ and arg_265_1.time_ <= var_268_0 + arg_268_0 then
				arg_265_1.var_.oldValueTypewriter = arg_265_1.fswtw_.percent

				arg_265_1:ShowNextGo(false)
			end

			local var_268_1 = 34
			local var_268_2 = 2.26666666666667
			local var_268_3 = arg_265_1:GetWordFromCfg(116381062)
			local var_268_4 = arg_265_1:FormatText(var_268_3.content)
			local var_268_5, var_268_6 = arg_265_1:GetPercentByPara(var_268_4, 3)

			if var_268_0 < arg_265_1.time_ and arg_265_1.time_ <= var_268_0 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0

				local var_268_7 = var_268_1 <= 0 and var_268_2 or var_268_2 * ((var_268_6 - arg_265_1.typewritterCharCountI18N) / var_268_1)

				if var_268_7 > 0 and var_268_2 < var_268_7 then
					arg_265_1.talkMaxDuration = var_268_7

					if var_268_7 + var_268_0 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_7 + var_268_0
					end
				end
			end

			local var_268_8 = 2.26666666666667
			local var_268_9 = math.max(var_268_8, arg_265_1.talkMaxDuration)

			if var_268_0 <= arg_265_1.time_ and arg_265_1.time_ < var_268_0 + var_268_9 then
				local var_268_10 = (arg_265_1.time_ - var_268_0) / var_268_9

				arg_265_1.fswtw_.percent = Mathf.Lerp(arg_265_1.var_.oldValueTypewriter, var_268_5, var_268_10)
				arg_265_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_265_1.fswtw_:SetDirty()
			end

			if arg_265_1.time_ >= var_268_0 + var_268_9 and arg_265_1.time_ < var_268_0 + var_268_9 + arg_268_0 then
				arg_265_1.fswtw_.percent = var_268_5

				arg_265_1.fswtw_:SetDirty()
				arg_265_1:ShowNextGo(true)

				arg_265_1.typewritterCharCountI18N = var_268_6
			end

			local var_268_11 = 0
			local var_268_12 = 7.438
			local var_268_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381064", "story_v_out_116381.awb") / 1000

			if var_268_13 > 0 and var_268_12 < var_268_13 and var_268_13 + var_268_11 > arg_265_1.duration_ then
				local var_268_14 = var_268_13

				arg_265_1.duration_ = var_268_13 + var_268_11
			end

			if var_268_11 < arg_265_1.time_ and arg_265_1.time_ <= var_268_11 + arg_268_0 then
				local var_268_15 = "play"
				local var_268_16 = "voice"

				arg_265_1:AudioAction(var_268_15, var_268_16, "story_v_out_116381", "116381064", "story_v_out_116381.awb")
			end

			local var_268_17 = 0

			if var_268_17 < arg_265_1.time_ and arg_265_1.time_ <= var_268_17 + arg_268_0 then
				arg_265_1.allBtn_.enabled = false
			end

			local var_268_18 = 2.26666666666667

			if arg_265_1.time_ >= var_268_17 + var_268_18 and arg_265_1.time_ < var_268_17 + var_268_18 + arg_268_0 then
				arg_265_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381065 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 116381065
		arg_269_1.duration_ = 5.846999999999

		SetActive(arg_269_1.tipsGo_, false)

		function arg_269_1.onSingleLineFinish_()
			arg_269_1.onSingleLineUpdate_ = nil
			arg_269_1.onSingleLineFinish_ = nil
			arg_269_1.state_ = "waiting"
		end

		function arg_269_1.playNext_(arg_271_0)
			if arg_271_0 == 1 then
				arg_269_0:Play116381066(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = 0

			if var_272_0 < arg_269_1.time_ and arg_269_1.time_ <= var_272_0 + arg_272_0 then
				arg_269_1.var_.oldValueTypewriter = arg_269_1.fswtw_.percent

				arg_269_1:ShowNextGo(false)
			end

			local var_272_1 = 26
			local var_272_2 = 1.73333333333333
			local var_272_3 = arg_269_1:GetWordFromCfg(116381062)
			local var_272_4 = arg_269_1:FormatText(var_272_3.content)
			local var_272_5, var_272_6 = arg_269_1:GetPercentByPara(var_272_4, 4)

			if var_272_0 < arg_269_1.time_ and arg_269_1.time_ <= var_272_0 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0

				local var_272_7 = var_272_1 <= 0 and var_272_2 or var_272_2 * ((var_272_6 - arg_269_1.typewritterCharCountI18N) / var_272_1)

				if var_272_7 > 0 and var_272_2 < var_272_7 then
					arg_269_1.talkMaxDuration = var_272_7

					if var_272_7 + var_272_0 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_7 + var_272_0
					end
				end
			end

			local var_272_8 = 1.73333333333333
			local var_272_9 = math.max(var_272_8, arg_269_1.talkMaxDuration)

			if var_272_0 <= arg_269_1.time_ and arg_269_1.time_ < var_272_0 + var_272_9 then
				local var_272_10 = (arg_269_1.time_ - var_272_0) / var_272_9

				arg_269_1.fswtw_.percent = Mathf.Lerp(arg_269_1.var_.oldValueTypewriter, var_272_5, var_272_10)
				arg_269_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_269_1.fswtw_:SetDirty()
			end

			if arg_269_1.time_ >= var_272_0 + var_272_9 and arg_269_1.time_ < var_272_0 + var_272_9 + arg_272_0 then
				arg_269_1.fswtw_.percent = var_272_5

				arg_269_1.fswtw_:SetDirty()
				arg_269_1:ShowNextGo(true)

				arg_269_1.typewritterCharCountI18N = var_272_6
			end

			local var_272_11 = 0
			local var_272_12 = 5.847
			local var_272_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381065", "story_v_out_116381.awb") / 1000

			if var_272_13 > 0 and var_272_12 < var_272_13 and var_272_13 + var_272_11 > arg_269_1.duration_ then
				local var_272_14 = var_272_13

				arg_269_1.duration_ = var_272_13 + var_272_11
			end

			if var_272_11 < arg_269_1.time_ and arg_269_1.time_ <= var_272_11 + arg_272_0 then
				local var_272_15 = "play"
				local var_272_16 = "voice"

				arg_269_1:AudioAction(var_272_15, var_272_16, "story_v_out_116381", "116381065", "story_v_out_116381.awb")
			end

			local var_272_17 = 0

			if var_272_17 < arg_269_1.time_ and arg_269_1.time_ <= var_272_17 + arg_272_0 then
				arg_269_1.allBtn_.enabled = false
			end

			local var_272_18 = 1.73333333333333

			if arg_269_1.time_ >= var_272_17 + var_272_18 and arg_269_1.time_ < var_272_17 + var_272_18 + arg_272_0 then
				arg_269_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381066 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 116381066
		arg_273_1.duration_ = 1.437999999999

		SetActive(arg_273_1.tipsGo_, false)

		function arg_273_1.onSingleLineFinish_()
			arg_273_1.onSingleLineUpdate_ = nil
			arg_273_1.onSingleLineFinish_ = nil
			arg_273_1.state_ = "waiting"
		end

		function arg_273_1.playNext_(arg_275_0)
			if arg_275_0 == 1 then
				arg_273_0:Play116381067(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = 0

			if var_276_0 < arg_273_1.time_ and arg_273_1.time_ <= var_276_0 + arg_276_0 then
				arg_273_1.var_.oldValueTypewriter = arg_273_1.fswtw_.percent

				arg_273_1:ShowNextGo(false)
			end

			local var_276_1 = 12
			local var_276_2 = 0.8
			local var_276_3 = arg_273_1:GetWordFromCfg(116381062)
			local var_276_4 = arg_273_1:FormatText(var_276_3.content)
			local var_276_5, var_276_6 = arg_273_1:GetPercentByPara(var_276_4, 5)

			if var_276_0 < arg_273_1.time_ and arg_273_1.time_ <= var_276_0 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0

				local var_276_7 = var_276_1 <= 0 and var_276_2 or var_276_2 * ((var_276_6 - arg_273_1.typewritterCharCountI18N) / var_276_1)

				if var_276_7 > 0 and var_276_2 < var_276_7 then
					arg_273_1.talkMaxDuration = var_276_7

					if var_276_7 + var_276_0 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_7 + var_276_0
					end
				end
			end

			local var_276_8 = 0.8
			local var_276_9 = math.max(var_276_8, arg_273_1.talkMaxDuration)

			if var_276_0 <= arg_273_1.time_ and arg_273_1.time_ < var_276_0 + var_276_9 then
				local var_276_10 = (arg_273_1.time_ - var_276_0) / var_276_9

				arg_273_1.fswtw_.percent = Mathf.Lerp(arg_273_1.var_.oldValueTypewriter, var_276_5, var_276_10)
				arg_273_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_273_1.fswtw_:SetDirty()
			end

			if arg_273_1.time_ >= var_276_0 + var_276_9 and arg_273_1.time_ < var_276_0 + var_276_9 + arg_276_0 then
				arg_273_1.fswtw_.percent = var_276_5

				arg_273_1.fswtw_:SetDirty()
				arg_273_1:ShowNextGo(true)

				arg_273_1.typewritterCharCountI18N = var_276_6
			end

			local var_276_11 = 0
			local var_276_12 = 1.438
			local var_276_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381066", "story_v_out_116381.awb") / 1000

			if var_276_13 > 0 and var_276_12 < var_276_13 and var_276_13 + var_276_11 > arg_273_1.duration_ then
				local var_276_14 = var_276_13

				arg_273_1.duration_ = var_276_13 + var_276_11
			end

			if var_276_11 < arg_273_1.time_ and arg_273_1.time_ <= var_276_11 + arg_276_0 then
				local var_276_15 = "play"
				local var_276_16 = "voice"

				arg_273_1:AudioAction(var_276_15, var_276_16, "story_v_out_116381", "116381066", "story_v_out_116381.awb")
			end

			local var_276_17 = 0

			if var_276_17 < arg_273_1.time_ and arg_273_1.time_ <= var_276_17 + arg_276_0 then
				arg_273_1.allBtn_.enabled = false
			end

			local var_276_18 = 0.8

			if arg_273_1.time_ >= var_276_17 + var_276_18 and arg_273_1.time_ < var_276_17 + var_276_18 + arg_276_0 then
				arg_273_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381067 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 116381067
		arg_277_1.duration_ = 7.734999999999

		SetActive(arg_277_1.tipsGo_, false)

		function arg_277_1.onSingleLineFinish_()
			arg_277_1.onSingleLineUpdate_ = nil
			arg_277_1.onSingleLineFinish_ = nil
			arg_277_1.state_ = "waiting"
		end

		function arg_277_1.playNext_(arg_279_0)
			if arg_279_0 == 1 then
				arg_277_0:Play116381068(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = 0

			if var_280_0 < arg_277_1.time_ and arg_277_1.time_ <= var_280_0 + arg_280_0 then
				arg_277_1.var_.oldValueTypewriter = arg_277_1.fswtw_.percent

				arg_277_1:ShowNextGo(false)
			end

			local var_280_1 = 36
			local var_280_2 = 2.4
			local var_280_3 = arg_277_1:GetWordFromCfg(116381062)
			local var_280_4 = arg_277_1:FormatText(var_280_3.content)
			local var_280_5, var_280_6 = arg_277_1:GetPercentByPara(var_280_4, 6)

			if var_280_0 < arg_277_1.time_ and arg_277_1.time_ <= var_280_0 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0

				local var_280_7 = var_280_1 <= 0 and var_280_2 or var_280_2 * ((var_280_6 - arg_277_1.typewritterCharCountI18N) / var_280_1)

				if var_280_7 > 0 and var_280_2 < var_280_7 then
					arg_277_1.talkMaxDuration = var_280_7

					if var_280_7 + var_280_0 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_7 + var_280_0
					end
				end
			end

			local var_280_8 = 2.4
			local var_280_9 = math.max(var_280_8, arg_277_1.talkMaxDuration)

			if var_280_0 <= arg_277_1.time_ and arg_277_1.time_ < var_280_0 + var_280_9 then
				local var_280_10 = (arg_277_1.time_ - var_280_0) / var_280_9

				arg_277_1.fswtw_.percent = Mathf.Lerp(arg_277_1.var_.oldValueTypewriter, var_280_5, var_280_10)
				arg_277_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_277_1.fswtw_:SetDirty()
			end

			if arg_277_1.time_ >= var_280_0 + var_280_9 and arg_277_1.time_ < var_280_0 + var_280_9 + arg_280_0 then
				arg_277_1.fswtw_.percent = var_280_5

				arg_277_1.fswtw_:SetDirty()
				arg_277_1:ShowNextGo(true)

				arg_277_1.typewritterCharCountI18N = var_280_6
			end

			local var_280_11 = 0
			local var_280_12 = 7.735
			local var_280_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381067", "story_v_out_116381.awb") / 1000

			if var_280_13 > 0 and var_280_12 < var_280_13 and var_280_13 + var_280_11 > arg_277_1.duration_ then
				local var_280_14 = var_280_13

				arg_277_1.duration_ = var_280_13 + var_280_11
			end

			if var_280_11 < arg_277_1.time_ and arg_277_1.time_ <= var_280_11 + arg_280_0 then
				local var_280_15 = "play"
				local var_280_16 = "voice"

				arg_277_1:AudioAction(var_280_15, var_280_16, "story_v_out_116381", "116381067", "story_v_out_116381.awb")
			end

			local var_280_17 = 0

			if var_280_17 < arg_277_1.time_ and arg_277_1.time_ <= var_280_17 + arg_280_0 then
				arg_277_1.allBtn_.enabled = false
			end

			local var_280_18 = 2.4

			if arg_277_1.time_ >= var_280_17 + var_280_18 and arg_277_1.time_ < var_280_17 + var_280_18 + arg_280_0 then
				arg_277_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381068 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 116381068
		arg_281_1.duration_ = 5.256999999999

		SetActive(arg_281_1.tipsGo_, false)

		function arg_281_1.onSingleLineFinish_()
			arg_281_1.onSingleLineUpdate_ = nil
			arg_281_1.onSingleLineFinish_ = nil
			arg_281_1.state_ = "waiting"
		end

		function arg_281_1.playNext_(arg_283_0)
			if arg_283_0 == 1 then
				arg_281_0:Play116381069(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = 0

			if var_284_0 < arg_281_1.time_ and arg_281_1.time_ <= var_284_0 + arg_284_0 then
				arg_281_1.fswbg_:SetActive(true)
				arg_281_1.dialog_:SetActive(false)

				arg_281_1.fswtw_.percent = 0

				local var_284_1 = arg_281_1:GetWordFromCfg(116381068)
				local var_284_2 = arg_281_1:FormatText(var_284_1.content)

				arg_281_1.fswt_.text = var_284_2

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.fswt_)

				arg_281_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_281_1.fswtw_:SetDirty()

				arg_281_1.typewritterCharCountI18N = 0

				arg_281_1:ShowNextGo(false)
			end

			local var_284_3 = 0.0166666666666667

			if var_284_3 < arg_281_1.time_ and arg_281_1.time_ <= var_284_3 + arg_284_0 then
				arg_281_1.var_.oldValueTypewriter = arg_281_1.fswtw_.percent

				arg_281_1:ShowNextGo(false)
			end

			local var_284_4 = 16
			local var_284_5 = 1.06666666666667
			local var_284_6 = arg_281_1:GetWordFromCfg(116381068)
			local var_284_7 = arg_281_1:FormatText(var_284_6.content)
			local var_284_8, var_284_9 = arg_281_1:GetPercentByPara(var_284_7, 1)

			if var_284_3 < arg_281_1.time_ and arg_281_1.time_ <= var_284_3 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0

				local var_284_10 = var_284_4 <= 0 and var_284_5 or var_284_5 * ((var_284_9 - arg_281_1.typewritterCharCountI18N) / var_284_4)

				if var_284_10 > 0 and var_284_5 < var_284_10 then
					arg_281_1.talkMaxDuration = var_284_10

					if var_284_10 + var_284_3 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_10 + var_284_3
					end
				end
			end

			local var_284_11 = 1.06666666666667
			local var_284_12 = math.max(var_284_11, arg_281_1.talkMaxDuration)

			if var_284_3 <= arg_281_1.time_ and arg_281_1.time_ < var_284_3 + var_284_12 then
				local var_284_13 = (arg_281_1.time_ - var_284_3) / var_284_12

				arg_281_1.fswtw_.percent = Mathf.Lerp(arg_281_1.var_.oldValueTypewriter, var_284_8, var_284_13)
				arg_281_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_281_1.fswtw_:SetDirty()
			end

			if arg_281_1.time_ >= var_284_3 + var_284_12 and arg_281_1.time_ < var_284_3 + var_284_12 + arg_284_0 then
				arg_281_1.fswtw_.percent = var_284_8

				arg_281_1.fswtw_:SetDirty()
				arg_281_1:ShowNextGo(true)

				arg_281_1.typewritterCharCountI18N = var_284_9
			end

			local var_284_14 = 0
			local var_284_15 = 5.257
			local var_284_16 = manager.audio:GetVoiceLength("story_v_out_116381", "116381068", "story_v_out_116381.awb") / 1000

			if var_284_16 > 0 and var_284_15 < var_284_16 and var_284_16 + var_284_14 > arg_281_1.duration_ then
				local var_284_17 = var_284_16

				arg_281_1.duration_ = var_284_16 + var_284_14
			end

			if var_284_14 < arg_281_1.time_ and arg_281_1.time_ <= var_284_14 + arg_284_0 then
				local var_284_18 = "play"
				local var_284_19 = "voice"

				arg_281_1:AudioAction(var_284_18, var_284_19, "story_v_out_116381", "116381068", "story_v_out_116381.awb")
			end

			local var_284_20 = 0

			if var_284_20 < arg_281_1.time_ and arg_281_1.time_ <= var_284_20 + arg_284_0 then
				arg_281_1.allBtn_.enabled = false
			end

			local var_284_21 = 1.08333333333333

			if arg_281_1.time_ >= var_284_20 + var_284_21 and arg_281_1.time_ < var_284_20 + var_284_21 + arg_284_0 then
				arg_281_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381069 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 116381069
		arg_285_1.duration_ = 0.749999999999

		SetActive(arg_285_1.tipsGo_, false)

		function arg_285_1.onSingleLineFinish_()
			arg_285_1.onSingleLineUpdate_ = nil
			arg_285_1.onSingleLineFinish_ = nil
			arg_285_1.state_ = "waiting"
		end

		function arg_285_1.playNext_(arg_287_0)
			if arg_287_0 == 1 then
				arg_285_0:Play116381070(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = 0

			if var_288_0 < arg_285_1.time_ and arg_285_1.time_ <= var_288_0 + arg_288_0 then
				arg_285_1.var_.oldValueTypewriter = arg_285_1.fswtw_.percent

				arg_285_1:ShowNextGo(false)
			end

			local var_288_1 = 7
			local var_288_2 = 0.466666666666667
			local var_288_3 = arg_285_1:GetWordFromCfg(116381068)
			local var_288_4 = arg_285_1:FormatText(var_288_3.content)
			local var_288_5, var_288_6 = arg_285_1:GetPercentByPara(var_288_4, 2)

			if var_288_0 < arg_285_1.time_ and arg_285_1.time_ <= var_288_0 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0

				local var_288_7 = var_288_1 <= 0 and var_288_2 or var_288_2 * ((var_288_6 - arg_285_1.typewritterCharCountI18N) / var_288_1)

				if var_288_7 > 0 and var_288_2 < var_288_7 then
					arg_285_1.talkMaxDuration = var_288_7

					if var_288_7 + var_288_0 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_7 + var_288_0
					end
				end
			end

			local var_288_8 = 0.466666666666667
			local var_288_9 = math.max(var_288_8, arg_285_1.talkMaxDuration)

			if var_288_0 <= arg_285_1.time_ and arg_285_1.time_ < var_288_0 + var_288_9 then
				local var_288_10 = (arg_285_1.time_ - var_288_0) / var_288_9

				arg_285_1.fswtw_.percent = Mathf.Lerp(arg_285_1.var_.oldValueTypewriter, var_288_5, var_288_10)
				arg_285_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_285_1.fswtw_:SetDirty()
			end

			if arg_285_1.time_ >= var_288_0 + var_288_9 and arg_285_1.time_ < var_288_0 + var_288_9 + arg_288_0 then
				arg_285_1.fswtw_.percent = var_288_5

				arg_285_1.fswtw_:SetDirty()
				arg_285_1:ShowNextGo(true)

				arg_285_1.typewritterCharCountI18N = var_288_6
			end

			local var_288_11 = 0
			local var_288_12 = 0.75
			local var_288_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381069", "story_v_out_116381.awb") / 1000

			if var_288_13 > 0 and var_288_12 < var_288_13 and var_288_13 + var_288_11 > arg_285_1.duration_ then
				local var_288_14 = var_288_13

				arg_285_1.duration_ = var_288_13 + var_288_11
			end

			if var_288_11 < arg_285_1.time_ and arg_285_1.time_ <= var_288_11 + arg_288_0 then
				local var_288_15 = "play"
				local var_288_16 = "voice"

				arg_285_1:AudioAction(var_288_15, var_288_16, "story_v_out_116381", "116381069", "story_v_out_116381.awb")
			end

			local var_288_17 = 0

			if var_288_17 < arg_285_1.time_ and arg_285_1.time_ <= var_288_17 + arg_288_0 then
				arg_285_1.allBtn_.enabled = false
			end

			local var_288_18 = 0.466666666666667

			if arg_285_1.time_ >= var_288_17 + var_288_18 and arg_285_1.time_ < var_288_17 + var_288_18 + arg_288_0 then
				arg_285_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381070 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 116381070
		arg_289_1.duration_ = 3.303999999999

		SetActive(arg_289_1.tipsGo_, false)

		function arg_289_1.onSingleLineFinish_()
			arg_289_1.onSingleLineUpdate_ = nil
			arg_289_1.onSingleLineFinish_ = nil
			arg_289_1.state_ = "waiting"
		end

		function arg_289_1.playNext_(arg_291_0)
			if arg_291_0 == 1 then
				arg_289_0:Play116381071(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = 0

			if var_292_0 < arg_289_1.time_ and arg_289_1.time_ <= var_292_0 + arg_292_0 then
				arg_289_1.var_.oldValueTypewriter = arg_289_1.fswtw_.percent

				arg_289_1:ShowNextGo(false)
			end

			local var_292_1 = 19
			local var_292_2 = 1.26666666666667
			local var_292_3 = arg_289_1:GetWordFromCfg(116381068)
			local var_292_4 = arg_289_1:FormatText(var_292_3.content)
			local var_292_5, var_292_6 = arg_289_1:GetPercentByPara(var_292_4, 3)

			if var_292_0 < arg_289_1.time_ and arg_289_1.time_ <= var_292_0 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0

				local var_292_7 = var_292_1 <= 0 and var_292_2 or var_292_2 * ((var_292_6 - arg_289_1.typewritterCharCountI18N) / var_292_1)

				if var_292_7 > 0 and var_292_2 < var_292_7 then
					arg_289_1.talkMaxDuration = var_292_7

					if var_292_7 + var_292_0 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_7 + var_292_0
					end
				end
			end

			local var_292_8 = 1.26666666666667
			local var_292_9 = math.max(var_292_8, arg_289_1.talkMaxDuration)

			if var_292_0 <= arg_289_1.time_ and arg_289_1.time_ < var_292_0 + var_292_9 then
				local var_292_10 = (arg_289_1.time_ - var_292_0) / var_292_9

				arg_289_1.fswtw_.percent = Mathf.Lerp(arg_289_1.var_.oldValueTypewriter, var_292_5, var_292_10)
				arg_289_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_289_1.fswtw_:SetDirty()
			end

			if arg_289_1.time_ >= var_292_0 + var_292_9 and arg_289_1.time_ < var_292_0 + var_292_9 + arg_292_0 then
				arg_289_1.fswtw_.percent = var_292_5

				arg_289_1.fswtw_:SetDirty()
				arg_289_1:ShowNextGo(true)

				arg_289_1.typewritterCharCountI18N = var_292_6
			end

			local var_292_11 = 0
			local var_292_12 = 3.304
			local var_292_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381070", "story_v_out_116381.awb") / 1000

			if var_292_13 > 0 and var_292_12 < var_292_13 and var_292_13 + var_292_11 > arg_289_1.duration_ then
				local var_292_14 = var_292_13

				arg_289_1.duration_ = var_292_13 + var_292_11
			end

			if var_292_11 < arg_289_1.time_ and arg_289_1.time_ <= var_292_11 + arg_292_0 then
				local var_292_15 = "play"
				local var_292_16 = "voice"

				arg_289_1:AudioAction(var_292_15, var_292_16, "story_v_out_116381", "116381070", "story_v_out_116381.awb")
			end

			local var_292_17 = 0

			if var_292_17 < arg_289_1.time_ and arg_289_1.time_ <= var_292_17 + arg_292_0 then
				arg_289_1.allBtn_.enabled = false
			end

			local var_292_18 = 1.26666666666667

			if arg_289_1.time_ >= var_292_17 + var_292_18 and arg_289_1.time_ < var_292_17 + var_292_18 + arg_292_0 then
				arg_289_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381071 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 116381071
		arg_293_1.duration_ = 10.213999999999

		SetActive(arg_293_1.tipsGo_, false)

		function arg_293_1.onSingleLineFinish_()
			arg_293_1.onSingleLineUpdate_ = nil
			arg_293_1.onSingleLineFinish_ = nil
			arg_293_1.state_ = "waiting"
		end

		function arg_293_1.playNext_(arg_295_0)
			if arg_295_0 == 1 then
				arg_293_0:Play116381072(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = 0

			if var_296_0 < arg_293_1.time_ and arg_293_1.time_ <= var_296_0 + arg_296_0 then
				arg_293_1.var_.oldValueTypewriter = arg_293_1.fswtw_.percent

				arg_293_1:ShowNextGo(false)
			end

			local var_296_1 = 48
			local var_296_2 = 3.2
			local var_296_3 = arg_293_1:GetWordFromCfg(116381068)
			local var_296_4 = arg_293_1:FormatText(var_296_3.content)
			local var_296_5, var_296_6 = arg_293_1:GetPercentByPara(var_296_4, 4)

			if var_296_0 < arg_293_1.time_ and arg_293_1.time_ <= var_296_0 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0

				local var_296_7 = var_296_1 <= 0 and var_296_2 or var_296_2 * ((var_296_6 - arg_293_1.typewritterCharCountI18N) / var_296_1)

				if var_296_7 > 0 and var_296_2 < var_296_7 then
					arg_293_1.talkMaxDuration = var_296_7

					if var_296_7 + var_296_0 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_7 + var_296_0
					end
				end
			end

			local var_296_8 = 3.2
			local var_296_9 = math.max(var_296_8, arg_293_1.talkMaxDuration)

			if var_296_0 <= arg_293_1.time_ and arg_293_1.time_ < var_296_0 + var_296_9 then
				local var_296_10 = (arg_293_1.time_ - var_296_0) / var_296_9

				arg_293_1.fswtw_.percent = Mathf.Lerp(arg_293_1.var_.oldValueTypewriter, var_296_5, var_296_10)
				arg_293_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_293_1.fswtw_:SetDirty()
			end

			if arg_293_1.time_ >= var_296_0 + var_296_9 and arg_293_1.time_ < var_296_0 + var_296_9 + arg_296_0 then
				arg_293_1.fswtw_.percent = var_296_5

				arg_293_1.fswtw_:SetDirty()
				arg_293_1:ShowNextGo(true)

				arg_293_1.typewritterCharCountI18N = var_296_6
			end

			local var_296_11 = 0
			local var_296_12 = 10.214
			local var_296_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381071", "story_v_out_116381.awb") / 1000

			if var_296_13 > 0 and var_296_12 < var_296_13 and var_296_13 + var_296_11 > arg_293_1.duration_ then
				local var_296_14 = var_296_13

				arg_293_1.duration_ = var_296_13 + var_296_11
			end

			if var_296_11 < arg_293_1.time_ and arg_293_1.time_ <= var_296_11 + arg_296_0 then
				local var_296_15 = "play"
				local var_296_16 = "voice"

				arg_293_1:AudioAction(var_296_15, var_296_16, "story_v_out_116381", "116381071", "story_v_out_116381.awb")
			end

			local var_296_17 = 0

			if var_296_17 < arg_293_1.time_ and arg_293_1.time_ <= var_296_17 + arg_296_0 then
				arg_293_1.allBtn_.enabled = false
			end

			local var_296_18 = 3.2

			if arg_293_1.time_ >= var_296_17 + var_296_18 and arg_293_1.time_ < var_296_17 + var_296_18 + arg_296_0 then
				arg_293_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381072 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 116381072
		arg_297_1.duration_ = 13.121999999999

		SetActive(arg_297_1.tipsGo_, false)

		function arg_297_1.onSingleLineFinish_()
			arg_297_1.onSingleLineUpdate_ = nil
			arg_297_1.onSingleLineFinish_ = nil
			arg_297_1.state_ = "waiting"
		end

		function arg_297_1.playNext_(arg_299_0)
			if arg_299_0 == 1 then
				arg_297_0:Play116381073(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = 0

			if var_300_0 < arg_297_1.time_ and arg_297_1.time_ <= var_300_0 + arg_300_0 then
				arg_297_1.var_.oldValueTypewriter = arg_297_1.fswtw_.percent

				arg_297_1:ShowNextGo(false)
			end

			local var_300_1 = 54
			local var_300_2 = 3.6
			local var_300_3 = arg_297_1:GetWordFromCfg(116381068)
			local var_300_4 = arg_297_1:FormatText(var_300_3.content)
			local var_300_5, var_300_6 = arg_297_1:GetPercentByPara(var_300_4, 5)

			if var_300_0 < arg_297_1.time_ and arg_297_1.time_ <= var_300_0 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0

				local var_300_7 = var_300_1 <= 0 and var_300_2 or var_300_2 * ((var_300_6 - arg_297_1.typewritterCharCountI18N) / var_300_1)

				if var_300_7 > 0 and var_300_2 < var_300_7 then
					arg_297_1.talkMaxDuration = var_300_7

					if var_300_7 + var_300_0 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_7 + var_300_0
					end
				end
			end

			local var_300_8 = 3.6
			local var_300_9 = math.max(var_300_8, arg_297_1.talkMaxDuration)

			if var_300_0 <= arg_297_1.time_ and arg_297_1.time_ < var_300_0 + var_300_9 then
				local var_300_10 = (arg_297_1.time_ - var_300_0) / var_300_9

				arg_297_1.fswtw_.percent = Mathf.Lerp(arg_297_1.var_.oldValueTypewriter, var_300_5, var_300_10)
				arg_297_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_297_1.fswtw_:SetDirty()
			end

			if arg_297_1.time_ >= var_300_0 + var_300_9 and arg_297_1.time_ < var_300_0 + var_300_9 + arg_300_0 then
				arg_297_1.fswtw_.percent = var_300_5

				arg_297_1.fswtw_:SetDirty()
				arg_297_1:ShowNextGo(true)

				arg_297_1.typewritterCharCountI18N = var_300_6
			end

			local var_300_11 = 0
			local var_300_12 = 13.122
			local var_300_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381072", "story_v_out_116381.awb") / 1000

			if var_300_13 > 0 and var_300_12 < var_300_13 and var_300_13 + var_300_11 > arg_297_1.duration_ then
				local var_300_14 = var_300_13

				arg_297_1.duration_ = var_300_13 + var_300_11
			end

			if var_300_11 < arg_297_1.time_ and arg_297_1.time_ <= var_300_11 + arg_300_0 then
				local var_300_15 = "play"
				local var_300_16 = "voice"

				arg_297_1:AudioAction(var_300_15, var_300_16, "story_v_out_116381", "116381072", "story_v_out_116381.awb")
			end

			local var_300_17 = 0

			if var_300_17 < arg_297_1.time_ and arg_297_1.time_ <= var_300_17 + arg_300_0 then
				arg_297_1.allBtn_.enabled = false
			end

			local var_300_18 = 3.6

			if arg_297_1.time_ >= var_300_17 + var_300_18 and arg_297_1.time_ < var_300_17 + var_300_18 + arg_300_0 then
				arg_297_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381073 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 116381073
		arg_301_1.duration_ = 11.522999999999

		SetActive(arg_301_1.tipsGo_, false)

		function arg_301_1.onSingleLineFinish_()
			arg_301_1.onSingleLineUpdate_ = nil
			arg_301_1.onSingleLineFinish_ = nil
			arg_301_1.state_ = "waiting"
		end

		function arg_301_1.playNext_(arg_303_0)
			if arg_303_0 == 1 then
				arg_301_0:Play116381074(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = 0

			if var_304_0 < arg_301_1.time_ and arg_301_1.time_ <= var_304_0 + arg_304_0 then
				arg_301_1.var_.oldValueTypewriter = arg_301_1.fswtw_.percent

				arg_301_1:ShowNextGo(false)
			end

			local var_304_1 = 54
			local var_304_2 = 3.6
			local var_304_3 = arg_301_1:GetWordFromCfg(116381068)
			local var_304_4 = arg_301_1:FormatText(var_304_3.content)
			local var_304_5, var_304_6 = arg_301_1:GetPercentByPara(var_304_4, 6)

			if var_304_0 < arg_301_1.time_ and arg_301_1.time_ <= var_304_0 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0

				local var_304_7 = var_304_1 <= 0 and var_304_2 or var_304_2 * ((var_304_6 - arg_301_1.typewritterCharCountI18N) / var_304_1)

				if var_304_7 > 0 and var_304_2 < var_304_7 then
					arg_301_1.talkMaxDuration = var_304_7

					if var_304_7 + var_304_0 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_7 + var_304_0
					end
				end
			end

			local var_304_8 = 3.6
			local var_304_9 = math.max(var_304_8, arg_301_1.talkMaxDuration)

			if var_304_0 <= arg_301_1.time_ and arg_301_1.time_ < var_304_0 + var_304_9 then
				local var_304_10 = (arg_301_1.time_ - var_304_0) / var_304_9

				arg_301_1.fswtw_.percent = Mathf.Lerp(arg_301_1.var_.oldValueTypewriter, var_304_5, var_304_10)
				arg_301_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_301_1.fswtw_:SetDirty()
			end

			if arg_301_1.time_ >= var_304_0 + var_304_9 and arg_301_1.time_ < var_304_0 + var_304_9 + arg_304_0 then
				arg_301_1.fswtw_.percent = var_304_5

				arg_301_1.fswtw_:SetDirty()
				arg_301_1:ShowNextGo(true)

				arg_301_1.typewritterCharCountI18N = var_304_6
			end

			local var_304_11 = 0
			local var_304_12 = 11.523
			local var_304_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381073", "story_v_out_116381.awb") / 1000

			if var_304_13 > 0 and var_304_12 < var_304_13 and var_304_13 + var_304_11 > arg_301_1.duration_ then
				local var_304_14 = var_304_13

				arg_301_1.duration_ = var_304_13 + var_304_11
			end

			if var_304_11 < arg_301_1.time_ and arg_301_1.time_ <= var_304_11 + arg_304_0 then
				local var_304_15 = "play"
				local var_304_16 = "voice"

				arg_301_1:AudioAction(var_304_15, var_304_16, "story_v_out_116381", "116381073", "story_v_out_116381.awb")
			end

			local var_304_17 = 0

			if var_304_17 < arg_301_1.time_ and arg_301_1.time_ <= var_304_17 + arg_304_0 then
				arg_301_1.allBtn_.enabled = false
			end

			local var_304_18 = 3.6

			if arg_301_1.time_ >= var_304_17 + var_304_18 and arg_301_1.time_ < var_304_17 + var_304_18 + arg_304_0 then
				arg_301_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381074 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 116381074
		arg_305_1.duration_ = 11.025999999999

		SetActive(arg_305_1.tipsGo_, false)

		function arg_305_1.onSingleLineFinish_()
			arg_305_1.onSingleLineUpdate_ = nil
			arg_305_1.onSingleLineFinish_ = nil
			arg_305_1.state_ = "waiting"
		end

		function arg_305_1.playNext_(arg_307_0)
			if arg_307_0 == 1 then
				arg_305_0:Play116381075(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = 0

			if var_308_0 < arg_305_1.time_ and arg_305_1.time_ <= var_308_0 + arg_308_0 then
				arg_305_1.fswbg_:SetActive(true)
				arg_305_1.dialog_:SetActive(false)

				arg_305_1.fswtw_.percent = 0

				local var_308_1 = arg_305_1:GetWordFromCfg(116381074)
				local var_308_2 = arg_305_1:FormatText(var_308_1.content)

				arg_305_1.fswt_.text = var_308_2

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.fswt_)

				arg_305_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_305_1.fswtw_:SetDirty()

				arg_305_1.typewritterCharCountI18N = 0

				arg_305_1:ShowNextGo(false)
			end

			local var_308_3 = 0.0166666666666667

			if var_308_3 < arg_305_1.time_ and arg_305_1.time_ <= var_308_3 + arg_308_0 then
				arg_305_1.var_.oldValueTypewriter = arg_305_1.fswtw_.percent

				arg_305_1:ShowNextGo(false)
			end

			local var_308_4 = 43
			local var_308_5 = 2.86666666666667
			local var_308_6 = arg_305_1:GetWordFromCfg(116381074)
			local var_308_7 = arg_305_1:FormatText(var_308_6.content)
			local var_308_8, var_308_9 = arg_305_1:GetPercentByPara(var_308_7, 1)

			if var_308_3 < arg_305_1.time_ and arg_305_1.time_ <= var_308_3 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0

				local var_308_10 = var_308_4 <= 0 and var_308_5 or var_308_5 * ((var_308_9 - arg_305_1.typewritterCharCountI18N) / var_308_4)

				if var_308_10 > 0 and var_308_5 < var_308_10 then
					arg_305_1.talkMaxDuration = var_308_10

					if var_308_10 + var_308_3 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_10 + var_308_3
					end
				end
			end

			local var_308_11 = 2.86666666666667
			local var_308_12 = math.max(var_308_11, arg_305_1.talkMaxDuration)

			if var_308_3 <= arg_305_1.time_ and arg_305_1.time_ < var_308_3 + var_308_12 then
				local var_308_13 = (arg_305_1.time_ - var_308_3) / var_308_12

				arg_305_1.fswtw_.percent = Mathf.Lerp(arg_305_1.var_.oldValueTypewriter, var_308_8, var_308_13)
				arg_305_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_305_1.fswtw_:SetDirty()
			end

			if arg_305_1.time_ >= var_308_3 + var_308_12 and arg_305_1.time_ < var_308_3 + var_308_12 + arg_308_0 then
				arg_305_1.fswtw_.percent = var_308_8

				arg_305_1.fswtw_:SetDirty()
				arg_305_1:ShowNextGo(true)

				arg_305_1.typewritterCharCountI18N = var_308_9
			end

			local var_308_14 = 0
			local var_308_15 = 11.026
			local var_308_16 = manager.audio:GetVoiceLength("story_v_out_116381", "116381074", "story_v_out_116381.awb") / 1000

			if var_308_16 > 0 and var_308_15 < var_308_16 and var_308_16 + var_308_14 > arg_305_1.duration_ then
				local var_308_17 = var_308_16

				arg_305_1.duration_ = var_308_16 + var_308_14
			end

			if var_308_14 < arg_305_1.time_ and arg_305_1.time_ <= var_308_14 + arg_308_0 then
				local var_308_18 = "play"
				local var_308_19 = "voice"

				arg_305_1:AudioAction(var_308_18, var_308_19, "story_v_out_116381", "116381074", "story_v_out_116381.awb")
			end

			local var_308_20 = 0

			if var_308_20 < arg_305_1.time_ and arg_305_1.time_ <= var_308_20 + arg_308_0 then
				arg_305_1.allBtn_.enabled = false
			end

			local var_308_21 = 2.88333333333333

			if arg_305_1.time_ >= var_308_20 + var_308_21 and arg_305_1.time_ < var_308_20 + var_308_21 + arg_308_0 then
				arg_305_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381075 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 116381075
		arg_309_1.duration_ = 11.273999999999

		SetActive(arg_309_1.tipsGo_, false)

		function arg_309_1.onSingleLineFinish_()
			arg_309_1.onSingleLineUpdate_ = nil
			arg_309_1.onSingleLineFinish_ = nil
			arg_309_1.state_ = "waiting"
		end

		function arg_309_1.playNext_(arg_311_0)
			if arg_311_0 == 1 then
				arg_309_0:Play116381076(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = 0

			if var_312_0 < arg_309_1.time_ and arg_309_1.time_ <= var_312_0 + arg_312_0 then
				arg_309_1.var_.oldValueTypewriter = arg_309_1.fswtw_.percent

				arg_309_1:ShowNextGo(false)
			end

			local var_312_1 = 58
			local var_312_2 = 3.86666666666667
			local var_312_3 = arg_309_1:GetWordFromCfg(116381074)
			local var_312_4 = arg_309_1:FormatText(var_312_3.content)
			local var_312_5, var_312_6 = arg_309_1:GetPercentByPara(var_312_4, 2)

			if var_312_0 < arg_309_1.time_ and arg_309_1.time_ <= var_312_0 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0

				local var_312_7 = var_312_1 <= 0 and var_312_2 or var_312_2 * ((var_312_6 - arg_309_1.typewritterCharCountI18N) / var_312_1)

				if var_312_7 > 0 and var_312_2 < var_312_7 then
					arg_309_1.talkMaxDuration = var_312_7

					if var_312_7 + var_312_0 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_7 + var_312_0
					end
				end
			end

			local var_312_8 = 3.86666666666667
			local var_312_9 = math.max(var_312_8, arg_309_1.talkMaxDuration)

			if var_312_0 <= arg_309_1.time_ and arg_309_1.time_ < var_312_0 + var_312_9 then
				local var_312_10 = (arg_309_1.time_ - var_312_0) / var_312_9

				arg_309_1.fswtw_.percent = Mathf.Lerp(arg_309_1.var_.oldValueTypewriter, var_312_5, var_312_10)
				arg_309_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_309_1.fswtw_:SetDirty()
			end

			if arg_309_1.time_ >= var_312_0 + var_312_9 and arg_309_1.time_ < var_312_0 + var_312_9 + arg_312_0 then
				arg_309_1.fswtw_.percent = var_312_5

				arg_309_1.fswtw_:SetDirty()
				arg_309_1:ShowNextGo(true)

				arg_309_1.typewritterCharCountI18N = var_312_6
			end

			local var_312_11 = 0
			local var_312_12 = 11.274
			local var_312_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381075", "story_v_out_116381.awb") / 1000

			if var_312_13 > 0 and var_312_12 < var_312_13 and var_312_13 + var_312_11 > arg_309_1.duration_ then
				local var_312_14 = var_312_13

				arg_309_1.duration_ = var_312_13 + var_312_11
			end

			if var_312_11 < arg_309_1.time_ and arg_309_1.time_ <= var_312_11 + arg_312_0 then
				local var_312_15 = "play"
				local var_312_16 = "voice"

				arg_309_1:AudioAction(var_312_15, var_312_16, "story_v_out_116381", "116381075", "story_v_out_116381.awb")
			end

			local var_312_17 = 0

			if var_312_17 < arg_309_1.time_ and arg_309_1.time_ <= var_312_17 + arg_312_0 then
				arg_309_1.allBtn_.enabled = false
			end

			local var_312_18 = 3.86666666666667

			if arg_309_1.time_ >= var_312_17 + var_312_18 and arg_309_1.time_ < var_312_17 + var_312_18 + arg_312_0 then
				arg_309_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381076 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 116381076
		arg_313_1.duration_ = 3.403999999999

		SetActive(arg_313_1.tipsGo_, false)

		function arg_313_1.onSingleLineFinish_()
			arg_313_1.onSingleLineUpdate_ = nil
			arg_313_1.onSingleLineFinish_ = nil
			arg_313_1.state_ = "waiting"
		end

		function arg_313_1.playNext_(arg_315_0)
			if arg_315_0 == 1 then
				arg_313_0:Play116381077(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = 0

			if var_316_0 < arg_313_1.time_ and arg_313_1.time_ <= var_316_0 + arg_316_0 then
				arg_313_1.var_.oldValueTypewriter = arg_313_1.fswtw_.percent

				arg_313_1:ShowNextGo(false)
			end

			local var_316_1 = 12
			local var_316_2 = 0.8
			local var_316_3 = arg_313_1:GetWordFromCfg(116381074)
			local var_316_4 = arg_313_1:FormatText(var_316_3.content)
			local var_316_5, var_316_6 = arg_313_1:GetPercentByPara(var_316_4, 3)

			if var_316_0 < arg_313_1.time_ and arg_313_1.time_ <= var_316_0 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0

				local var_316_7 = var_316_1 <= 0 and var_316_2 or var_316_2 * ((var_316_6 - arg_313_1.typewritterCharCountI18N) / var_316_1)

				if var_316_7 > 0 and var_316_2 < var_316_7 then
					arg_313_1.talkMaxDuration = var_316_7

					if var_316_7 + var_316_0 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_7 + var_316_0
					end
				end
			end

			local var_316_8 = 0.8
			local var_316_9 = math.max(var_316_8, arg_313_1.talkMaxDuration)

			if var_316_0 <= arg_313_1.time_ and arg_313_1.time_ < var_316_0 + var_316_9 then
				local var_316_10 = (arg_313_1.time_ - var_316_0) / var_316_9

				arg_313_1.fswtw_.percent = Mathf.Lerp(arg_313_1.var_.oldValueTypewriter, var_316_5, var_316_10)
				arg_313_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_313_1.fswtw_:SetDirty()
			end

			if arg_313_1.time_ >= var_316_0 + var_316_9 and arg_313_1.time_ < var_316_0 + var_316_9 + arg_316_0 then
				arg_313_1.fswtw_.percent = var_316_5

				arg_313_1.fswtw_:SetDirty()
				arg_313_1:ShowNextGo(true)

				arg_313_1.typewritterCharCountI18N = var_316_6
			end

			local var_316_11 = 0
			local var_316_12 = 3.404
			local var_316_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381076", "story_v_out_116381.awb") / 1000

			if var_316_13 > 0 and var_316_12 < var_316_13 and var_316_13 + var_316_11 > arg_313_1.duration_ then
				local var_316_14 = var_316_13

				arg_313_1.duration_ = var_316_13 + var_316_11
			end

			if var_316_11 < arg_313_1.time_ and arg_313_1.time_ <= var_316_11 + arg_316_0 then
				local var_316_15 = "play"
				local var_316_16 = "voice"

				arg_313_1:AudioAction(var_316_15, var_316_16, "story_v_out_116381", "116381076", "story_v_out_116381.awb")
			end

			local var_316_17 = 0

			if var_316_17 < arg_313_1.time_ and arg_313_1.time_ <= var_316_17 + arg_316_0 then
				arg_313_1.allBtn_.enabled = false
			end

			local var_316_18 = 0.8

			if arg_313_1.time_ >= var_316_17 + var_316_18 and arg_313_1.time_ < var_316_17 + var_316_18 + arg_316_0 then
				arg_313_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381077 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 116381077
		arg_317_1.duration_ = 8.781999999999

		SetActive(arg_317_1.tipsGo_, false)

		function arg_317_1.onSingleLineFinish_()
			arg_317_1.onSingleLineUpdate_ = nil
			arg_317_1.onSingleLineFinish_ = nil
			arg_317_1.state_ = "waiting"
		end

		function arg_317_1.playNext_(arg_319_0)
			if arg_319_0 == 1 then
				arg_317_0:Play116381078(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = 0

			if var_320_0 < arg_317_1.time_ and arg_317_1.time_ <= var_320_0 + arg_320_0 then
				arg_317_1.var_.oldValueTypewriter = arg_317_1.fswtw_.percent

				arg_317_1:ShowNextGo(false)
			end

			local var_320_1 = 45
			local var_320_2 = 3
			local var_320_3 = arg_317_1:GetWordFromCfg(116381074)
			local var_320_4 = arg_317_1:FormatText(var_320_3.content)
			local var_320_5, var_320_6 = arg_317_1:GetPercentByPara(var_320_4, 4)

			if var_320_0 < arg_317_1.time_ and arg_317_1.time_ <= var_320_0 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0

				local var_320_7 = var_320_1 <= 0 and var_320_2 or var_320_2 * ((var_320_6 - arg_317_1.typewritterCharCountI18N) / var_320_1)

				if var_320_7 > 0 and var_320_2 < var_320_7 then
					arg_317_1.talkMaxDuration = var_320_7

					if var_320_7 + var_320_0 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_7 + var_320_0
					end
				end
			end

			local var_320_8 = 3
			local var_320_9 = math.max(var_320_8, arg_317_1.talkMaxDuration)

			if var_320_0 <= arg_317_1.time_ and arg_317_1.time_ < var_320_0 + var_320_9 then
				local var_320_10 = (arg_317_1.time_ - var_320_0) / var_320_9

				arg_317_1.fswtw_.percent = Mathf.Lerp(arg_317_1.var_.oldValueTypewriter, var_320_5, var_320_10)
				arg_317_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_317_1.fswtw_:SetDirty()
			end

			if arg_317_1.time_ >= var_320_0 + var_320_9 and arg_317_1.time_ < var_320_0 + var_320_9 + arg_320_0 then
				arg_317_1.fswtw_.percent = var_320_5

				arg_317_1.fswtw_:SetDirty()
				arg_317_1:ShowNextGo(true)

				arg_317_1.typewritterCharCountI18N = var_320_6
			end

			local var_320_11 = 0
			local var_320_12 = 8.782
			local var_320_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381077", "story_v_out_116381.awb") / 1000

			if var_320_13 > 0 and var_320_12 < var_320_13 and var_320_13 + var_320_11 > arg_317_1.duration_ then
				local var_320_14 = var_320_13

				arg_317_1.duration_ = var_320_13 + var_320_11
			end

			if var_320_11 < arg_317_1.time_ and arg_317_1.time_ <= var_320_11 + arg_320_0 then
				local var_320_15 = "play"
				local var_320_16 = "voice"

				arg_317_1:AudioAction(var_320_15, var_320_16, "story_v_out_116381", "116381077", "story_v_out_116381.awb")
			end

			local var_320_17 = 0

			if var_320_17 < arg_317_1.time_ and arg_317_1.time_ <= var_320_17 + arg_320_0 then
				arg_317_1.allBtn_.enabled = false
			end

			local var_320_18 = 3

			if arg_317_1.time_ >= var_320_17 + var_320_18 and arg_317_1.time_ < var_320_17 + var_320_18 + arg_320_0 then
				arg_317_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381078 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 116381078
		arg_321_1.duration_ = 5.985999999999

		SetActive(arg_321_1.tipsGo_, false)

		function arg_321_1.onSingleLineFinish_()
			arg_321_1.onSingleLineUpdate_ = nil
			arg_321_1.onSingleLineFinish_ = nil
			arg_321_1.state_ = "waiting"
		end

		function arg_321_1.playNext_(arg_323_0)
			if arg_323_0 == 1 then
				arg_321_0:Play116381079(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = 0

			if var_324_0 < arg_321_1.time_ and arg_321_1.time_ <= var_324_0 + arg_324_0 then
				arg_321_1.var_.oldValueTypewriter = arg_321_1.fswtw_.percent

				arg_321_1:ShowNextGo(false)
			end

			local var_324_1 = 24
			local var_324_2 = 1.6
			local var_324_3 = arg_321_1:GetWordFromCfg(116381074)
			local var_324_4 = arg_321_1:FormatText(var_324_3.content)
			local var_324_5, var_324_6 = arg_321_1:GetPercentByPara(var_324_4, 5)

			if var_324_0 < arg_321_1.time_ and arg_321_1.time_ <= var_324_0 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0

				local var_324_7 = var_324_1 <= 0 and var_324_2 or var_324_2 * ((var_324_6 - arg_321_1.typewritterCharCountI18N) / var_324_1)

				if var_324_7 > 0 and var_324_2 < var_324_7 then
					arg_321_1.talkMaxDuration = var_324_7

					if var_324_7 + var_324_0 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_7 + var_324_0
					end
				end
			end

			local var_324_8 = 1.6
			local var_324_9 = math.max(var_324_8, arg_321_1.talkMaxDuration)

			if var_324_0 <= arg_321_1.time_ and arg_321_1.time_ < var_324_0 + var_324_9 then
				local var_324_10 = (arg_321_1.time_ - var_324_0) / var_324_9

				arg_321_1.fswtw_.percent = Mathf.Lerp(arg_321_1.var_.oldValueTypewriter, var_324_5, var_324_10)
				arg_321_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_321_1.fswtw_:SetDirty()
			end

			if arg_321_1.time_ >= var_324_0 + var_324_9 and arg_321_1.time_ < var_324_0 + var_324_9 + arg_324_0 then
				arg_321_1.fswtw_.percent = var_324_5

				arg_321_1.fswtw_:SetDirty()
				arg_321_1:ShowNextGo(true)

				arg_321_1.typewritterCharCountI18N = var_324_6
			end

			local var_324_11 = 0
			local var_324_12 = 5.986
			local var_324_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381078", "story_v_out_116381.awb") / 1000

			if var_324_13 > 0 and var_324_12 < var_324_13 and var_324_13 + var_324_11 > arg_321_1.duration_ then
				local var_324_14 = var_324_13

				arg_321_1.duration_ = var_324_13 + var_324_11
			end

			if var_324_11 < arg_321_1.time_ and arg_321_1.time_ <= var_324_11 + arg_324_0 then
				local var_324_15 = "play"
				local var_324_16 = "voice"

				arg_321_1:AudioAction(var_324_15, var_324_16, "story_v_out_116381", "116381078", "story_v_out_116381.awb")
			end

			local var_324_17 = 0

			if var_324_17 < arg_321_1.time_ and arg_321_1.time_ <= var_324_17 + arg_324_0 then
				arg_321_1.allBtn_.enabled = false
			end

			local var_324_18 = 1.6

			if arg_321_1.time_ >= var_324_17 + var_324_18 and arg_321_1.time_ < var_324_17 + var_324_18 + arg_324_0 then
				arg_321_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381079 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 116381079
		arg_325_1.duration_ = 13.092999999999

		SetActive(arg_325_1.tipsGo_, false)

		function arg_325_1.onSingleLineFinish_()
			arg_325_1.onSingleLineUpdate_ = nil
			arg_325_1.onSingleLineFinish_ = nil
			arg_325_1.state_ = "waiting"
		end

		function arg_325_1.playNext_(arg_327_0)
			if arg_327_0 == 1 then
				arg_325_0:Play116381080(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = 0

			if var_328_0 < arg_325_1.time_ and arg_325_1.time_ <= var_328_0 + arg_328_0 then
				arg_325_1.var_.oldValueTypewriter = arg_325_1.fswtw_.percent

				arg_325_1:ShowNextGo(false)
			end

			local var_328_1 = 57
			local var_328_2 = 3.8
			local var_328_3 = arg_325_1:GetWordFromCfg(116381074)
			local var_328_4 = arg_325_1:FormatText(var_328_3.content)
			local var_328_5, var_328_6 = arg_325_1:GetPercentByPara(var_328_4, 6)

			if var_328_0 < arg_325_1.time_ and arg_325_1.time_ <= var_328_0 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0

				local var_328_7 = var_328_1 <= 0 and var_328_2 or var_328_2 * ((var_328_6 - arg_325_1.typewritterCharCountI18N) / var_328_1)

				if var_328_7 > 0 and var_328_2 < var_328_7 then
					arg_325_1.talkMaxDuration = var_328_7

					if var_328_7 + var_328_0 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_7 + var_328_0
					end
				end
			end

			local var_328_8 = 3.8
			local var_328_9 = math.max(var_328_8, arg_325_1.talkMaxDuration)

			if var_328_0 <= arg_325_1.time_ and arg_325_1.time_ < var_328_0 + var_328_9 then
				local var_328_10 = (arg_325_1.time_ - var_328_0) / var_328_9

				arg_325_1.fswtw_.percent = Mathf.Lerp(arg_325_1.var_.oldValueTypewriter, var_328_5, var_328_10)
				arg_325_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_325_1.fswtw_:SetDirty()
			end

			if arg_325_1.time_ >= var_328_0 + var_328_9 and arg_325_1.time_ < var_328_0 + var_328_9 + arg_328_0 then
				arg_325_1.fswtw_.percent = var_328_5

				arg_325_1.fswtw_:SetDirty()
				arg_325_1:ShowNextGo(true)

				arg_325_1.typewritterCharCountI18N = var_328_6
			end

			local var_328_11 = 0
			local var_328_12 = 13.093
			local var_328_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381079", "story_v_out_116381.awb") / 1000

			if var_328_13 > 0 and var_328_12 < var_328_13 and var_328_13 + var_328_11 > arg_325_1.duration_ then
				local var_328_14 = var_328_13

				arg_325_1.duration_ = var_328_13 + var_328_11
			end

			if var_328_11 < arg_325_1.time_ and arg_325_1.time_ <= var_328_11 + arg_328_0 then
				local var_328_15 = "play"
				local var_328_16 = "voice"

				arg_325_1:AudioAction(var_328_15, var_328_16, "story_v_out_116381", "116381079", "story_v_out_116381.awb")
			end

			local var_328_17 = 0

			if var_328_17 < arg_325_1.time_ and arg_325_1.time_ <= var_328_17 + arg_328_0 then
				arg_325_1.allBtn_.enabled = false
			end

			local var_328_18 = 3.8

			if arg_325_1.time_ >= var_328_17 + var_328_18 and arg_325_1.time_ < var_328_17 + var_328_18 + arg_328_0 then
				arg_325_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381080 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 116381080
		arg_329_1.duration_ = 5.215999999999

		SetActive(arg_329_1.tipsGo_, false)

		function arg_329_1.onSingleLineFinish_()
			arg_329_1.onSingleLineUpdate_ = nil
			arg_329_1.onSingleLineFinish_ = nil
			arg_329_1.state_ = "waiting"
		end

		function arg_329_1.playNext_(arg_331_0)
			if arg_331_0 == 1 then
				arg_329_0:Play116381081(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = 0

			if var_332_0 < arg_329_1.time_ and arg_329_1.time_ <= var_332_0 + arg_332_0 then
				arg_329_1.fswbg_:SetActive(true)
				arg_329_1.dialog_:SetActive(false)

				arg_329_1.fswtw_.percent = 0

				local var_332_1 = arg_329_1:GetWordFromCfg(116381080)
				local var_332_2 = arg_329_1:FormatText(var_332_1.content)

				arg_329_1.fswt_.text = var_332_2

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.fswt_)

				arg_329_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_329_1.fswtw_:SetDirty()

				arg_329_1.typewritterCharCountI18N = 0

				arg_329_1:ShowNextGo(false)
			end

			local var_332_3 = 0.0166666666666667

			if var_332_3 < arg_329_1.time_ and arg_329_1.time_ <= var_332_3 + arg_332_0 then
				arg_329_1.var_.oldValueTypewriter = arg_329_1.fswtw_.percent

				arg_329_1:ShowNextGo(false)
			end

			local var_332_4 = 27
			local var_332_5 = 1.8
			local var_332_6 = arg_329_1:GetWordFromCfg(116381080)
			local var_332_7 = arg_329_1:FormatText(var_332_6.content)
			local var_332_8, var_332_9 = arg_329_1:GetPercentByPara(var_332_7, 1)

			if var_332_3 < arg_329_1.time_ and arg_329_1.time_ <= var_332_3 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0

				local var_332_10 = var_332_4 <= 0 and var_332_5 or var_332_5 * ((var_332_9 - arg_329_1.typewritterCharCountI18N) / var_332_4)

				if var_332_10 > 0 and var_332_5 < var_332_10 then
					arg_329_1.talkMaxDuration = var_332_10

					if var_332_10 + var_332_3 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_10 + var_332_3
					end
				end
			end

			local var_332_11 = 1.8
			local var_332_12 = math.max(var_332_11, arg_329_1.talkMaxDuration)

			if var_332_3 <= arg_329_1.time_ and arg_329_1.time_ < var_332_3 + var_332_12 then
				local var_332_13 = (arg_329_1.time_ - var_332_3) / var_332_12

				arg_329_1.fswtw_.percent = Mathf.Lerp(arg_329_1.var_.oldValueTypewriter, var_332_8, var_332_13)
				arg_329_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_329_1.fswtw_:SetDirty()
			end

			if arg_329_1.time_ >= var_332_3 + var_332_12 and arg_329_1.time_ < var_332_3 + var_332_12 + arg_332_0 then
				arg_329_1.fswtw_.percent = var_332_8

				arg_329_1.fswtw_:SetDirty()
				arg_329_1:ShowNextGo(true)

				arg_329_1.typewritterCharCountI18N = var_332_9
			end

			local var_332_14 = 0
			local var_332_15 = 5.216
			local var_332_16 = manager.audio:GetVoiceLength("story_v_out_116381", "116381080", "story_v_out_116381.awb") / 1000

			if var_332_16 > 0 and var_332_15 < var_332_16 and var_332_16 + var_332_14 > arg_329_1.duration_ then
				local var_332_17 = var_332_16

				arg_329_1.duration_ = var_332_16 + var_332_14
			end

			if var_332_14 < arg_329_1.time_ and arg_329_1.time_ <= var_332_14 + arg_332_0 then
				local var_332_18 = "play"
				local var_332_19 = "voice"

				arg_329_1:AudioAction(var_332_18, var_332_19, "story_v_out_116381", "116381080", "story_v_out_116381.awb")
			end

			local var_332_20 = 0

			if var_332_20 < arg_329_1.time_ and arg_329_1.time_ <= var_332_20 + arg_332_0 then
				arg_329_1.allBtn_.enabled = false
			end

			local var_332_21 = 1.81666666666667

			if arg_329_1.time_ >= var_332_20 + var_332_21 and arg_329_1.time_ < var_332_20 + var_332_21 + arg_332_0 then
				arg_329_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381081 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 116381081
		arg_333_1.duration_ = 5.710999999999

		SetActive(arg_333_1.tipsGo_, false)

		function arg_333_1.onSingleLineFinish_()
			arg_333_1.onSingleLineUpdate_ = nil
			arg_333_1.onSingleLineFinish_ = nil
			arg_333_1.state_ = "waiting"
		end

		function arg_333_1.playNext_(arg_335_0)
			if arg_335_0 == 1 then
				arg_333_0:Play116381082(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = 0

			if var_336_0 < arg_333_1.time_ and arg_333_1.time_ <= var_336_0 + arg_336_0 then
				arg_333_1.var_.oldValueTypewriter = arg_333_1.fswtw_.percent

				arg_333_1:ShowNextGo(false)
			end

			local var_336_1 = 25
			local var_336_2 = 1.66666666666667
			local var_336_3 = arg_333_1:GetWordFromCfg(116381080)
			local var_336_4 = arg_333_1:FormatText(var_336_3.content)
			local var_336_5, var_336_6 = arg_333_1:GetPercentByPara(var_336_4, 2)

			if var_336_0 < arg_333_1.time_ and arg_333_1.time_ <= var_336_0 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0

				local var_336_7 = var_336_1 <= 0 and var_336_2 or var_336_2 * ((var_336_6 - arg_333_1.typewritterCharCountI18N) / var_336_1)

				if var_336_7 > 0 and var_336_2 < var_336_7 then
					arg_333_1.talkMaxDuration = var_336_7

					if var_336_7 + var_336_0 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_7 + var_336_0
					end
				end
			end

			local var_336_8 = 1.66666666666667
			local var_336_9 = math.max(var_336_8, arg_333_1.talkMaxDuration)

			if var_336_0 <= arg_333_1.time_ and arg_333_1.time_ < var_336_0 + var_336_9 then
				local var_336_10 = (arg_333_1.time_ - var_336_0) / var_336_9

				arg_333_1.fswtw_.percent = Mathf.Lerp(arg_333_1.var_.oldValueTypewriter, var_336_5, var_336_10)
				arg_333_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_333_1.fswtw_:SetDirty()
			end

			if arg_333_1.time_ >= var_336_0 + var_336_9 and arg_333_1.time_ < var_336_0 + var_336_9 + arg_336_0 then
				arg_333_1.fswtw_.percent = var_336_5

				arg_333_1.fswtw_:SetDirty()
				arg_333_1:ShowNextGo(true)

				arg_333_1.typewritterCharCountI18N = var_336_6
			end

			local var_336_11 = 0
			local var_336_12 = 5.711
			local var_336_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381081", "story_v_out_116381.awb") / 1000

			if var_336_13 > 0 and var_336_12 < var_336_13 and var_336_13 + var_336_11 > arg_333_1.duration_ then
				local var_336_14 = var_336_13

				arg_333_1.duration_ = var_336_13 + var_336_11
			end

			if var_336_11 < arg_333_1.time_ and arg_333_1.time_ <= var_336_11 + arg_336_0 then
				local var_336_15 = "play"
				local var_336_16 = "voice"

				arg_333_1:AudioAction(var_336_15, var_336_16, "story_v_out_116381", "116381081", "story_v_out_116381.awb")
			end

			local var_336_17 = 0

			if var_336_17 < arg_333_1.time_ and arg_333_1.time_ <= var_336_17 + arg_336_0 then
				arg_333_1.allBtn_.enabled = false
			end

			local var_336_18 = 1.66666666666667

			if arg_333_1.time_ >= var_336_17 + var_336_18 and arg_333_1.time_ < var_336_17 + var_336_18 + arg_336_0 then
				arg_333_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381082 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 116381082
		arg_337_1.duration_ = 6.695999999999

		SetActive(arg_337_1.tipsGo_, false)

		function arg_337_1.onSingleLineFinish_()
			arg_337_1.onSingleLineUpdate_ = nil
			arg_337_1.onSingleLineFinish_ = nil
			arg_337_1.state_ = "waiting"
		end

		function arg_337_1.playNext_(arg_339_0)
			if arg_339_0 == 1 then
				arg_337_0:Play116381083(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = 0

			if var_340_0 < arg_337_1.time_ and arg_337_1.time_ <= var_340_0 + arg_340_0 then
				arg_337_1.var_.oldValueTypewriter = arg_337_1.fswtw_.percent

				arg_337_1:ShowNextGo(false)
			end

			local var_340_1 = 34
			local var_340_2 = 2.26666666666667
			local var_340_3 = arg_337_1:GetWordFromCfg(116381080)
			local var_340_4 = arg_337_1:FormatText(var_340_3.content)
			local var_340_5, var_340_6 = arg_337_1:GetPercentByPara(var_340_4, 3)

			if var_340_0 < arg_337_1.time_ and arg_337_1.time_ <= var_340_0 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0

				local var_340_7 = var_340_1 <= 0 and var_340_2 or var_340_2 * ((var_340_6 - arg_337_1.typewritterCharCountI18N) / var_340_1)

				if var_340_7 > 0 and var_340_2 < var_340_7 then
					arg_337_1.talkMaxDuration = var_340_7

					if var_340_7 + var_340_0 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_7 + var_340_0
					end
				end
			end

			local var_340_8 = 2.26666666666667
			local var_340_9 = math.max(var_340_8, arg_337_1.talkMaxDuration)

			if var_340_0 <= arg_337_1.time_ and arg_337_1.time_ < var_340_0 + var_340_9 then
				local var_340_10 = (arg_337_1.time_ - var_340_0) / var_340_9

				arg_337_1.fswtw_.percent = Mathf.Lerp(arg_337_1.var_.oldValueTypewriter, var_340_5, var_340_10)
				arg_337_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_337_1.fswtw_:SetDirty()
			end

			if arg_337_1.time_ >= var_340_0 + var_340_9 and arg_337_1.time_ < var_340_0 + var_340_9 + arg_340_0 then
				arg_337_1.fswtw_.percent = var_340_5

				arg_337_1.fswtw_:SetDirty()
				arg_337_1:ShowNextGo(true)

				arg_337_1.typewritterCharCountI18N = var_340_6
			end

			local var_340_11 = 0
			local var_340_12 = 6.696
			local var_340_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381082", "story_v_out_116381.awb") / 1000

			if var_340_13 > 0 and var_340_12 < var_340_13 and var_340_13 + var_340_11 > arg_337_1.duration_ then
				local var_340_14 = var_340_13

				arg_337_1.duration_ = var_340_13 + var_340_11
			end

			if var_340_11 < arg_337_1.time_ and arg_337_1.time_ <= var_340_11 + arg_340_0 then
				local var_340_15 = "play"
				local var_340_16 = "voice"

				arg_337_1:AudioAction(var_340_15, var_340_16, "story_v_out_116381", "116381082", "story_v_out_116381.awb")
			end

			local var_340_17 = 0

			if var_340_17 < arg_337_1.time_ and arg_337_1.time_ <= var_340_17 + arg_340_0 then
				arg_337_1.allBtn_.enabled = false
			end

			local var_340_18 = 2.26666666666667

			if arg_337_1.time_ >= var_340_17 + var_340_18 and arg_337_1.time_ < var_340_17 + var_340_18 + arg_340_0 then
				arg_337_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381083 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 116381083
		arg_341_1.duration_ = 8.797999999999

		SetActive(arg_341_1.tipsGo_, false)

		function arg_341_1.onSingleLineFinish_()
			arg_341_1.onSingleLineUpdate_ = nil
			arg_341_1.onSingleLineFinish_ = nil
			arg_341_1.state_ = "waiting"
		end

		function arg_341_1.playNext_(arg_343_0)
			if arg_343_0 == 1 then
				arg_341_0:Play116381084(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = 0

			if var_344_0 < arg_341_1.time_ and arg_341_1.time_ <= var_344_0 + arg_344_0 then
				arg_341_1.var_.oldValueTypewriter = arg_341_1.fswtw_.percent

				arg_341_1:ShowNextGo(false)
			end

			local var_344_1 = 43
			local var_344_2 = 2.86666666666667
			local var_344_3 = arg_341_1:GetWordFromCfg(116381080)
			local var_344_4 = arg_341_1:FormatText(var_344_3.content)
			local var_344_5, var_344_6 = arg_341_1:GetPercentByPara(var_344_4, 4)

			if var_344_0 < arg_341_1.time_ and arg_341_1.time_ <= var_344_0 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0

				local var_344_7 = var_344_1 <= 0 and var_344_2 or var_344_2 * ((var_344_6 - arg_341_1.typewritterCharCountI18N) / var_344_1)

				if var_344_7 > 0 and var_344_2 < var_344_7 then
					arg_341_1.talkMaxDuration = var_344_7

					if var_344_7 + var_344_0 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_7 + var_344_0
					end
				end
			end

			local var_344_8 = 2.86666666666667
			local var_344_9 = math.max(var_344_8, arg_341_1.talkMaxDuration)

			if var_344_0 <= arg_341_1.time_ and arg_341_1.time_ < var_344_0 + var_344_9 then
				local var_344_10 = (arg_341_1.time_ - var_344_0) / var_344_9

				arg_341_1.fswtw_.percent = Mathf.Lerp(arg_341_1.var_.oldValueTypewriter, var_344_5, var_344_10)
				arg_341_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_341_1.fswtw_:SetDirty()
			end

			if arg_341_1.time_ >= var_344_0 + var_344_9 and arg_341_1.time_ < var_344_0 + var_344_9 + arg_344_0 then
				arg_341_1.fswtw_.percent = var_344_5

				arg_341_1.fswtw_:SetDirty()
				arg_341_1:ShowNextGo(true)

				arg_341_1.typewritterCharCountI18N = var_344_6
			end

			local var_344_11 = 0
			local var_344_12 = 8.798
			local var_344_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381083", "story_v_out_116381.awb") / 1000

			if var_344_13 > 0 and var_344_12 < var_344_13 and var_344_13 + var_344_11 > arg_341_1.duration_ then
				local var_344_14 = var_344_13

				arg_341_1.duration_ = var_344_13 + var_344_11
			end

			if var_344_11 < arg_341_1.time_ and arg_341_1.time_ <= var_344_11 + arg_344_0 then
				local var_344_15 = "play"
				local var_344_16 = "voice"

				arg_341_1:AudioAction(var_344_15, var_344_16, "story_v_out_116381", "116381083", "story_v_out_116381.awb")
			end

			local var_344_17 = 0

			if var_344_17 < arg_341_1.time_ and arg_341_1.time_ <= var_344_17 + arg_344_0 then
				arg_341_1.allBtn_.enabled = false
			end

			local var_344_18 = 2.86666666666667

			if arg_341_1.time_ >= var_344_17 + var_344_18 and arg_341_1.time_ < var_344_17 + var_344_18 + arg_344_0 then
				arg_341_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381084 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 116381084
		arg_345_1.duration_ = 5.749999999999

		SetActive(arg_345_1.tipsGo_, false)

		function arg_345_1.onSingleLineFinish_()
			arg_345_1.onSingleLineUpdate_ = nil
			arg_345_1.onSingleLineFinish_ = nil
			arg_345_1.state_ = "waiting"
		end

		function arg_345_1.playNext_(arg_347_0)
			if arg_347_0 == 1 then
				arg_345_0:Play116381085(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = 0

			if var_348_0 < arg_345_1.time_ and arg_345_1.time_ <= var_348_0 + arg_348_0 then
				arg_345_1.var_.oldValueTypewriter = arg_345_1.fswtw_.percent

				arg_345_1:ShowNextGo(false)
			end

			local var_348_1 = 19
			local var_348_2 = 1.26666666666667
			local var_348_3 = arg_345_1:GetWordFromCfg(116381080)
			local var_348_4 = arg_345_1:FormatText(var_348_3.content)
			local var_348_5, var_348_6 = arg_345_1:GetPercentByPara(var_348_4, 5)

			if var_348_0 < arg_345_1.time_ and arg_345_1.time_ <= var_348_0 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0

				local var_348_7 = var_348_1 <= 0 and var_348_2 or var_348_2 * ((var_348_6 - arg_345_1.typewritterCharCountI18N) / var_348_1)

				if var_348_7 > 0 and var_348_2 < var_348_7 then
					arg_345_1.talkMaxDuration = var_348_7

					if var_348_7 + var_348_0 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_7 + var_348_0
					end
				end
			end

			local var_348_8 = 1.26666666666667
			local var_348_9 = math.max(var_348_8, arg_345_1.talkMaxDuration)

			if var_348_0 <= arg_345_1.time_ and arg_345_1.time_ < var_348_0 + var_348_9 then
				local var_348_10 = (arg_345_1.time_ - var_348_0) / var_348_9

				arg_345_1.fswtw_.percent = Mathf.Lerp(arg_345_1.var_.oldValueTypewriter, var_348_5, var_348_10)
				arg_345_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_345_1.fswtw_:SetDirty()
			end

			if arg_345_1.time_ >= var_348_0 + var_348_9 and arg_345_1.time_ < var_348_0 + var_348_9 + arg_348_0 then
				arg_345_1.fswtw_.percent = var_348_5

				arg_345_1.fswtw_:SetDirty()
				arg_345_1:ShowNextGo(true)

				arg_345_1.typewritterCharCountI18N = var_348_6
			end

			local var_348_11 = 0
			local var_348_12 = 5.75
			local var_348_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381084", "story_v_out_116381.awb") / 1000

			if var_348_13 > 0 and var_348_12 < var_348_13 and var_348_13 + var_348_11 > arg_345_1.duration_ then
				local var_348_14 = var_348_13

				arg_345_1.duration_ = var_348_13 + var_348_11
			end

			if var_348_11 < arg_345_1.time_ and arg_345_1.time_ <= var_348_11 + arg_348_0 then
				local var_348_15 = "play"
				local var_348_16 = "voice"

				arg_345_1:AudioAction(var_348_15, var_348_16, "story_v_out_116381", "116381084", "story_v_out_116381.awb")
			end

			local var_348_17 = 0

			if var_348_17 < arg_345_1.time_ and arg_345_1.time_ <= var_348_17 + arg_348_0 then
				arg_345_1.allBtn_.enabled = false
			end

			local var_348_18 = 1.33333333333333

			if arg_345_1.time_ >= var_348_17 + var_348_18 and arg_345_1.time_ < var_348_17 + var_348_18 + arg_348_0 then
				arg_345_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381085 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 116381085
		arg_349_1.duration_ = 10.581999999999

		SetActive(arg_349_1.tipsGo_, false)

		function arg_349_1.onSingleLineFinish_()
			arg_349_1.onSingleLineUpdate_ = nil
			arg_349_1.onSingleLineFinish_ = nil
			arg_349_1.state_ = "waiting"
		end

		function arg_349_1.playNext_(arg_351_0)
			if arg_351_0 == 1 then
				arg_349_0:Play116381086(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = 0

			if var_352_0 < arg_349_1.time_ and arg_349_1.time_ <= var_352_0 + arg_352_0 then
				arg_349_1.var_.oldValueTypewriter = arg_349_1.fswtw_.percent

				arg_349_1:ShowNextGo(false)
			end

			local var_352_1 = 51
			local var_352_2 = 3.26666666666667
			local var_352_3 = arg_349_1:GetWordFromCfg(116381080)
			local var_352_4 = arg_349_1:FormatText(var_352_3.content)
			local var_352_5, var_352_6 = arg_349_1:GetPercentByPara(var_352_4, 6)

			if var_352_0 < arg_349_1.time_ and arg_349_1.time_ <= var_352_0 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0

				local var_352_7 = var_352_1 <= 0 and var_352_2 or var_352_2 * ((var_352_6 - arg_349_1.typewritterCharCountI18N) / var_352_1)

				if var_352_7 > 0 and var_352_2 < var_352_7 then
					arg_349_1.talkMaxDuration = var_352_7

					if var_352_7 + var_352_0 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_7 + var_352_0
					end
				end
			end

			local var_352_8 = 3.26666666666667
			local var_352_9 = math.max(var_352_8, arg_349_1.talkMaxDuration)

			if var_352_0 <= arg_349_1.time_ and arg_349_1.time_ < var_352_0 + var_352_9 then
				local var_352_10 = (arg_349_1.time_ - var_352_0) / var_352_9

				arg_349_1.fswtw_.percent = Mathf.Lerp(arg_349_1.var_.oldValueTypewriter, var_352_5, var_352_10)
				arg_349_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_349_1.fswtw_:SetDirty()
			end

			if arg_349_1.time_ >= var_352_0 + var_352_9 and arg_349_1.time_ < var_352_0 + var_352_9 + arg_352_0 then
				arg_349_1.fswtw_.percent = var_352_5

				arg_349_1.fswtw_:SetDirty()
				arg_349_1:ShowNextGo(true)

				arg_349_1.typewritterCharCountI18N = var_352_6
			end

			local var_352_11 = 0
			local var_352_12 = 10.582
			local var_352_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381085", "story_v_out_116381.awb") / 1000

			if var_352_13 > 0 and var_352_12 < var_352_13 and var_352_13 + var_352_11 > arg_349_1.duration_ then
				local var_352_14 = var_352_13

				arg_349_1.duration_ = var_352_13 + var_352_11
			end

			if var_352_11 < arg_349_1.time_ and arg_349_1.time_ <= var_352_11 + arg_352_0 then
				local var_352_15 = "play"
				local var_352_16 = "voice"

				arg_349_1:AudioAction(var_352_15, var_352_16, "story_v_out_116381", "116381085", "story_v_out_116381.awb")
			end

			local var_352_17 = 0

			if var_352_17 < arg_349_1.time_ and arg_349_1.time_ <= var_352_17 + arg_352_0 then
				arg_349_1.allBtn_.enabled = false
			end

			local var_352_18 = 3.26666666666667

			if arg_349_1.time_ >= var_352_17 + var_352_18 and arg_349_1.time_ < var_352_17 + var_352_18 + arg_352_0 then
				arg_349_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381086 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 116381086
		arg_353_1.duration_ = 3.713999999999

		SetActive(arg_353_1.tipsGo_, false)

		function arg_353_1.onSingleLineFinish_()
			arg_353_1.onSingleLineUpdate_ = nil
			arg_353_1.onSingleLineFinish_ = nil
			arg_353_1.state_ = "waiting"
		end

		function arg_353_1.playNext_(arg_355_0)
			if arg_355_0 == 1 then
				arg_353_0:Play116381087(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = 0

			if var_356_0 < arg_353_1.time_ and arg_353_1.time_ <= var_356_0 + arg_356_0 then
				arg_353_1.fswbg_:SetActive(true)
				arg_353_1.dialog_:SetActive(false)

				arg_353_1.fswtw_.percent = 0

				local var_356_1 = arg_353_1:GetWordFromCfg(116381086)
				local var_356_2 = arg_353_1:FormatText(var_356_1.content)

				arg_353_1.fswt_.text = var_356_2

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.fswt_)

				arg_353_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_353_1.fswtw_:SetDirty()

				arg_353_1.typewritterCharCountI18N = 0

				arg_353_1:ShowNextGo(false)
			end

			local var_356_3 = 0.0166666666666667

			if var_356_3 < arg_353_1.time_ and arg_353_1.time_ <= var_356_3 + arg_356_0 then
				arg_353_1.var_.oldValueTypewriter = arg_353_1.fswtw_.percent

				arg_353_1:ShowNextGo(false)
			end

			local var_356_4 = 18
			local var_356_5 = 1.2
			local var_356_6 = arg_353_1:GetWordFromCfg(116381086)
			local var_356_7 = arg_353_1:FormatText(var_356_6.content)
			local var_356_8, var_356_9 = arg_353_1:GetPercentByPara(var_356_7, 1)

			if var_356_3 < arg_353_1.time_ and arg_353_1.time_ <= var_356_3 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0

				local var_356_10 = var_356_4 <= 0 and var_356_5 or var_356_5 * ((var_356_9 - arg_353_1.typewritterCharCountI18N) / var_356_4)

				if var_356_10 > 0 and var_356_5 < var_356_10 then
					arg_353_1.talkMaxDuration = var_356_10

					if var_356_10 + var_356_3 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_10 + var_356_3
					end
				end
			end

			local var_356_11 = 1.2
			local var_356_12 = math.max(var_356_11, arg_353_1.talkMaxDuration)

			if var_356_3 <= arg_353_1.time_ and arg_353_1.time_ < var_356_3 + var_356_12 then
				local var_356_13 = (arg_353_1.time_ - var_356_3) / var_356_12

				arg_353_1.fswtw_.percent = Mathf.Lerp(arg_353_1.var_.oldValueTypewriter, var_356_8, var_356_13)
				arg_353_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_353_1.fswtw_:SetDirty()
			end

			if arg_353_1.time_ >= var_356_3 + var_356_12 and arg_353_1.time_ < var_356_3 + var_356_12 + arg_356_0 then
				arg_353_1.fswtw_.percent = var_356_8

				arg_353_1.fswtw_:SetDirty()
				arg_353_1:ShowNextGo(true)

				arg_353_1.typewritterCharCountI18N = var_356_9
			end

			local var_356_14 = 0
			local var_356_15 = 3.714
			local var_356_16 = manager.audio:GetVoiceLength("story_v_out_116381", "116381086", "story_v_out_116381.awb") / 1000

			if var_356_16 > 0 and var_356_15 < var_356_16 and var_356_16 + var_356_14 > arg_353_1.duration_ then
				local var_356_17 = var_356_16

				arg_353_1.duration_ = var_356_16 + var_356_14
			end

			if var_356_14 < arg_353_1.time_ and arg_353_1.time_ <= var_356_14 + arg_356_0 then
				local var_356_18 = "play"
				local var_356_19 = "voice"

				arg_353_1:AudioAction(var_356_18, var_356_19, "story_v_out_116381", "116381086", "story_v_out_116381.awb")
			end

			local var_356_20 = 0

			if var_356_20 < arg_353_1.time_ and arg_353_1.time_ <= var_356_20 + arg_356_0 then
				arg_353_1.allBtn_.enabled = false
			end

			local var_356_21 = 1.21666666666667

			if arg_353_1.time_ >= var_356_20 + var_356_21 and arg_353_1.time_ < var_356_20 + var_356_21 + arg_356_0 then
				arg_353_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381087 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 116381087
		arg_357_1.duration_ = 6.922999999999

		SetActive(arg_357_1.tipsGo_, false)

		function arg_357_1.onSingleLineFinish_()
			arg_357_1.onSingleLineUpdate_ = nil
			arg_357_1.onSingleLineFinish_ = nil
			arg_357_1.state_ = "waiting"
		end

		function arg_357_1.playNext_(arg_359_0)
			if arg_359_0 == 1 then
				arg_357_0:Play116381088(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = 0

			if var_360_0 < arg_357_1.time_ and arg_357_1.time_ <= var_360_0 + arg_360_0 then
				arg_357_1.var_.oldValueTypewriter = arg_357_1.fswtw_.percent

				arg_357_1:ShowNextGo(false)
			end

			local var_360_1 = 36
			local var_360_2 = 2.4
			local var_360_3 = arg_357_1:GetWordFromCfg(116381086)
			local var_360_4 = arg_357_1:FormatText(var_360_3.content)
			local var_360_5, var_360_6 = arg_357_1:GetPercentByPara(var_360_4, 2)

			if var_360_0 < arg_357_1.time_ and arg_357_1.time_ <= var_360_0 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0

				local var_360_7 = var_360_1 <= 0 and var_360_2 or var_360_2 * ((var_360_6 - arg_357_1.typewritterCharCountI18N) / var_360_1)

				if var_360_7 > 0 and var_360_2 < var_360_7 then
					arg_357_1.talkMaxDuration = var_360_7

					if var_360_7 + var_360_0 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_7 + var_360_0
					end
				end
			end

			local var_360_8 = 2.4
			local var_360_9 = math.max(var_360_8, arg_357_1.talkMaxDuration)

			if var_360_0 <= arg_357_1.time_ and arg_357_1.time_ < var_360_0 + var_360_9 then
				local var_360_10 = (arg_357_1.time_ - var_360_0) / var_360_9

				arg_357_1.fswtw_.percent = Mathf.Lerp(arg_357_1.var_.oldValueTypewriter, var_360_5, var_360_10)
				arg_357_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_357_1.fswtw_:SetDirty()
			end

			if arg_357_1.time_ >= var_360_0 + var_360_9 and arg_357_1.time_ < var_360_0 + var_360_9 + arg_360_0 then
				arg_357_1.fswtw_.percent = var_360_5

				arg_357_1.fswtw_:SetDirty()
				arg_357_1:ShowNextGo(true)

				arg_357_1.typewritterCharCountI18N = var_360_6
			end

			local var_360_11 = 0
			local var_360_12 = 6.923
			local var_360_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381087", "story_v_out_116381.awb") / 1000

			if var_360_13 > 0 and var_360_12 < var_360_13 and var_360_13 + var_360_11 > arg_357_1.duration_ then
				local var_360_14 = var_360_13

				arg_357_1.duration_ = var_360_13 + var_360_11
			end

			if var_360_11 < arg_357_1.time_ and arg_357_1.time_ <= var_360_11 + arg_360_0 then
				local var_360_15 = "play"
				local var_360_16 = "voice"

				arg_357_1:AudioAction(var_360_15, var_360_16, "story_v_out_116381", "116381087", "story_v_out_116381.awb")
			end

			local var_360_17 = 0

			if var_360_17 < arg_357_1.time_ and arg_357_1.time_ <= var_360_17 + arg_360_0 then
				arg_357_1.allBtn_.enabled = false
			end

			local var_360_18 = 2.4

			if arg_357_1.time_ >= var_360_17 + var_360_18 and arg_357_1.time_ < var_360_17 + var_360_18 + arg_360_0 then
				arg_357_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381088 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 116381088
		arg_361_1.duration_ = 3.366666666666

		SetActive(arg_361_1.tipsGo_, false)

		function arg_361_1.onSingleLineFinish_()
			arg_361_1.onSingleLineUpdate_ = nil
			arg_361_1.onSingleLineFinish_ = nil
			arg_361_1.state_ = "waiting"
		end

		function arg_361_1.playNext_(arg_363_0)
			if arg_363_0 == 1 then
				arg_361_0:Play116381089(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = 0

			if var_364_0 < arg_361_1.time_ and arg_361_1.time_ <= var_364_0 + arg_364_0 then
				arg_361_1.var_.oldValueTypewriter = arg_361_1.fswtw_.percent

				arg_361_1:ShowNextGo(false)
			end

			local var_364_1 = 16
			local var_364_2 = 1.06666666666667
			local var_364_3 = arg_361_1:GetWordFromCfg(116381086)
			local var_364_4 = arg_361_1:FormatText(var_364_3.content)
			local var_364_5, var_364_6 = arg_361_1:GetPercentByPara(var_364_4, 3)

			if var_364_0 < arg_361_1.time_ and arg_361_1.time_ <= var_364_0 + arg_364_0 then
				arg_361_1.talkMaxDuration = 0

				local var_364_7 = var_364_1 <= 0 and var_364_2 or var_364_2 * ((var_364_6 - arg_361_1.typewritterCharCountI18N) / var_364_1)

				if var_364_7 > 0 and var_364_2 < var_364_7 then
					arg_361_1.talkMaxDuration = var_364_7

					if var_364_7 + var_364_0 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_7 + var_364_0
					end
				end
			end

			local var_364_8 = 1.06666666666667
			local var_364_9 = math.max(var_364_8, arg_361_1.talkMaxDuration)

			if var_364_0 <= arg_361_1.time_ and arg_361_1.time_ < var_364_0 + var_364_9 then
				local var_364_10 = (arg_361_1.time_ - var_364_0) / var_364_9

				arg_361_1.fswtw_.percent = Mathf.Lerp(arg_361_1.var_.oldValueTypewriter, var_364_5, var_364_10)
				arg_361_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_361_1.fswtw_:SetDirty()
			end

			if arg_361_1.time_ >= var_364_0 + var_364_9 and arg_361_1.time_ < var_364_0 + var_364_9 + arg_364_0 then
				arg_361_1.fswtw_.percent = var_364_5

				arg_361_1.fswtw_:SetDirty()
				arg_361_1:ShowNextGo(true)

				arg_361_1.typewritterCharCountI18N = var_364_6
			end

			local var_364_11 = 0
			local var_364_12 = 3.098
			local var_364_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381088", "story_v_out_116381.awb") / 1000

			if var_364_13 > 0 and var_364_12 < var_364_13 and var_364_13 + var_364_11 > arg_361_1.duration_ then
				local var_364_14 = var_364_13

				arg_361_1.duration_ = var_364_13 + var_364_11
			end

			if var_364_11 < arg_361_1.time_ and arg_361_1.time_ <= var_364_11 + arg_364_0 then
				local var_364_15 = "play"
				local var_364_16 = "voice"

				arg_361_1:AudioAction(var_364_15, var_364_16, "story_v_out_116381", "116381088", "story_v_out_116381.awb")
			end

			local var_364_17 = 0

			if var_364_17 < arg_361_1.time_ and arg_361_1.time_ <= var_364_17 + arg_364_0 then
				arg_361_1.allBtn_.enabled = false
			end

			local var_364_18 = 1.06666666666667

			if arg_361_1.time_ >= var_364_17 + var_364_18 and arg_361_1.time_ < var_364_17 + var_364_18 + arg_364_0 then
				arg_361_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381089 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 116381089
		arg_365_1.duration_ = 4.834999999999

		SetActive(arg_365_1.tipsGo_, false)

		function arg_365_1.onSingleLineFinish_()
			arg_365_1.onSingleLineUpdate_ = nil
			arg_365_1.onSingleLineFinish_ = nil
			arg_365_1.state_ = "waiting"
		end

		function arg_365_1.playNext_(arg_367_0)
			if arg_367_0 == 1 then
				arg_365_0:Play116381090(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = 0

			if var_368_0 < arg_365_1.time_ and arg_365_1.time_ <= var_368_0 + arg_368_0 then
				arg_365_1.var_.oldValueTypewriter = arg_365_1.fswtw_.percent

				arg_365_1:ShowNextGo(false)
			end

			local var_368_1 = 17
			local var_368_2 = 1.13333333333333
			local var_368_3 = arg_365_1:GetWordFromCfg(116381086)
			local var_368_4 = arg_365_1:FormatText(var_368_3.content)
			local var_368_5, var_368_6 = arg_365_1:GetPercentByPara(var_368_4, 4)

			if var_368_0 < arg_365_1.time_ and arg_365_1.time_ <= var_368_0 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0

				local var_368_7 = var_368_1 <= 0 and var_368_2 or var_368_2 * ((var_368_6 - arg_365_1.typewritterCharCountI18N) / var_368_1)

				if var_368_7 > 0 and var_368_2 < var_368_7 then
					arg_365_1.talkMaxDuration = var_368_7

					if var_368_7 + var_368_0 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_7 + var_368_0
					end
				end
			end

			local var_368_8 = 1.13333333333333
			local var_368_9 = math.max(var_368_8, arg_365_1.talkMaxDuration)

			if var_368_0 <= arg_365_1.time_ and arg_365_1.time_ < var_368_0 + var_368_9 then
				local var_368_10 = (arg_365_1.time_ - var_368_0) / var_368_9

				arg_365_1.fswtw_.percent = Mathf.Lerp(arg_365_1.var_.oldValueTypewriter, var_368_5, var_368_10)
				arg_365_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_365_1.fswtw_:SetDirty()
			end

			if arg_365_1.time_ >= var_368_0 + var_368_9 and arg_365_1.time_ < var_368_0 + var_368_9 + arg_368_0 then
				arg_365_1.fswtw_.percent = var_368_5

				arg_365_1.fswtw_:SetDirty()
				arg_365_1:ShowNextGo(true)

				arg_365_1.typewritterCharCountI18N = var_368_6
			end

			local var_368_11 = 0
			local var_368_12 = 4.835
			local var_368_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381089", "story_v_out_116381.awb") / 1000

			if var_368_13 > 0 and var_368_12 < var_368_13 and var_368_13 + var_368_11 > arg_365_1.duration_ then
				local var_368_14 = var_368_13

				arg_365_1.duration_ = var_368_13 + var_368_11
			end

			if var_368_11 < arg_365_1.time_ and arg_365_1.time_ <= var_368_11 + arg_368_0 then
				local var_368_15 = "play"
				local var_368_16 = "voice"

				arg_365_1:AudioAction(var_368_15, var_368_16, "story_v_out_116381", "116381089", "story_v_out_116381.awb")
			end

			local var_368_17 = 0

			if var_368_17 < arg_365_1.time_ and arg_365_1.time_ <= var_368_17 + arg_368_0 then
				arg_365_1.allBtn_.enabled = false
			end

			local var_368_18 = 1.13333333333333

			if arg_365_1.time_ >= var_368_17 + var_368_18 and arg_365_1.time_ < var_368_17 + var_368_18 + arg_368_0 then
				arg_365_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381090 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 116381090
		arg_369_1.duration_ = 6.233999999999

		SetActive(arg_369_1.tipsGo_, false)

		function arg_369_1.onSingleLineFinish_()
			arg_369_1.onSingleLineUpdate_ = nil
			arg_369_1.onSingleLineFinish_ = nil
			arg_369_1.state_ = "waiting"
		end

		function arg_369_1.playNext_(arg_371_0)
			if arg_371_0 == 1 then
				arg_369_0:Play116381091(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = 0

			if var_372_0 < arg_369_1.time_ and arg_369_1.time_ <= var_372_0 + arg_372_0 then
				arg_369_1.var_.oldValueTypewriter = arg_369_1.fswtw_.percent

				arg_369_1:ShowNextGo(false)
			end

			local var_372_1 = 22
			local var_372_2 = 1.46666666666667
			local var_372_3 = arg_369_1:GetWordFromCfg(116381086)
			local var_372_4 = arg_369_1:FormatText(var_372_3.content)
			local var_372_5, var_372_6 = arg_369_1:GetPercentByPara(var_372_4, 5)

			if var_372_0 < arg_369_1.time_ and arg_369_1.time_ <= var_372_0 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0

				local var_372_7 = var_372_1 <= 0 and var_372_2 or var_372_2 * ((var_372_6 - arg_369_1.typewritterCharCountI18N) / var_372_1)

				if var_372_7 > 0 and var_372_2 < var_372_7 then
					arg_369_1.talkMaxDuration = var_372_7

					if var_372_7 + var_372_0 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_7 + var_372_0
					end
				end
			end

			local var_372_8 = 1.46666666666667
			local var_372_9 = math.max(var_372_8, arg_369_1.talkMaxDuration)

			if var_372_0 <= arg_369_1.time_ and arg_369_1.time_ < var_372_0 + var_372_9 then
				local var_372_10 = (arg_369_1.time_ - var_372_0) / var_372_9

				arg_369_1.fswtw_.percent = Mathf.Lerp(arg_369_1.var_.oldValueTypewriter, var_372_5, var_372_10)
				arg_369_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_369_1.fswtw_:SetDirty()
			end

			if arg_369_1.time_ >= var_372_0 + var_372_9 and arg_369_1.time_ < var_372_0 + var_372_9 + arg_372_0 then
				arg_369_1.fswtw_.percent = var_372_5

				arg_369_1.fswtw_:SetDirty()
				arg_369_1:ShowNextGo(true)

				arg_369_1.typewritterCharCountI18N = var_372_6
			end

			local var_372_11 = 0
			local var_372_12 = 6.234
			local var_372_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381090", "story_v_out_116381.awb") / 1000

			if var_372_13 > 0 and var_372_12 < var_372_13 and var_372_13 + var_372_11 > arg_369_1.duration_ then
				local var_372_14 = var_372_13

				arg_369_1.duration_ = var_372_13 + var_372_11
			end

			if var_372_11 < arg_369_1.time_ and arg_369_1.time_ <= var_372_11 + arg_372_0 then
				local var_372_15 = "play"
				local var_372_16 = "voice"

				arg_369_1:AudioAction(var_372_15, var_372_16, "story_v_out_116381", "116381090", "story_v_out_116381.awb")
			end

			local var_372_17 = 0

			if var_372_17 < arg_369_1.time_ and arg_369_1.time_ <= var_372_17 + arg_372_0 then
				arg_369_1.allBtn_.enabled = false
			end

			local var_372_18 = 1.46666666666667

			if arg_369_1.time_ >= var_372_17 + var_372_18 and arg_369_1.time_ < var_372_17 + var_372_18 + arg_372_0 then
				arg_369_1.allBtn_.enabled = true
			end
		end
	end,
	Play116381091 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 116381091
		arg_373_1.duration_ = 3.033333333332

		SetActive(arg_373_1.tipsGo_, false)

		function arg_373_1.onSingleLineFinish_()
			arg_373_1.onSingleLineUpdate_ = nil
			arg_373_1.onSingleLineFinish_ = nil
			arg_373_1.state_ = "waiting"
			arg_373_1.auto_ = false
		end

		function arg_373_1.playNext_(arg_375_0)
			arg_373_1.onStoryFinished_()
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = 0

			if var_376_0 < arg_373_1.time_ and arg_373_1.time_ <= var_376_0 + arg_376_0 then
				arg_373_1.var_.oldValueTypewriter = arg_373_1.fswtw_.percent

				arg_373_1:ShowNextGo(false)
			end

			local var_376_1 = 11
			local var_376_2 = 0.733333333333333
			local var_376_3 = arg_373_1:GetWordFromCfg(116381086)
			local var_376_4 = arg_373_1:FormatText(var_376_3.content)
			local var_376_5, var_376_6 = arg_373_1:GetPercentByPara(var_376_4, 6)

			if var_376_0 < arg_373_1.time_ and arg_373_1.time_ <= var_376_0 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0

				local var_376_7 = var_376_1 <= 0 and var_376_2 or var_376_2 * ((var_376_6 - arg_373_1.typewritterCharCountI18N) / var_376_1)

				if var_376_7 > 0 and var_376_2 < var_376_7 then
					arg_373_1.talkMaxDuration = var_376_7

					if var_376_7 + var_376_0 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_7 + var_376_0
					end
				end
			end

			local var_376_8 = 0.733333333333333
			local var_376_9 = math.max(var_376_8, arg_373_1.talkMaxDuration)

			if var_376_0 <= arg_373_1.time_ and arg_373_1.time_ < var_376_0 + var_376_9 then
				local var_376_10 = (arg_373_1.time_ - var_376_0) / var_376_9

				arg_373_1.fswtw_.percent = Mathf.Lerp(arg_373_1.var_.oldValueTypewriter, var_376_5, var_376_10)
				arg_373_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_373_1.fswtw_:SetDirty()
			end

			if arg_373_1.time_ >= var_376_0 + var_376_9 and arg_373_1.time_ < var_376_0 + var_376_9 + arg_376_0 then
				arg_373_1.fswtw_.percent = var_376_5

				arg_373_1.fswtw_:SetDirty()
				arg_373_1:ShowNextGo(true)

				arg_373_1.typewritterCharCountI18N = var_376_6
			end

			local var_376_11 = 0
			local var_376_12 = 2.753
			local var_376_13 = manager.audio:GetVoiceLength("story_v_out_116381", "116381091", "story_v_out_116381.awb") / 1000

			if var_376_13 > 0 and var_376_12 < var_376_13 and var_376_13 + var_376_11 > arg_373_1.duration_ then
				local var_376_14 = var_376_13

				arg_373_1.duration_ = var_376_13 + var_376_11
			end

			if var_376_11 < arg_373_1.time_ and arg_373_1.time_ <= var_376_11 + arg_376_0 then
				local var_376_15 = "play"
				local var_376_16 = "voice"

				arg_373_1:AudioAction(var_376_15, var_376_16, "story_v_out_116381", "116381091", "story_v_out_116381.awb")
			end

			local var_376_17 = 0

			if var_376_17 < arg_373_1.time_ and arg_373_1.time_ <= var_376_17 + arg_376_0 then
				arg_373_1.allBtn_.enabled = false
			end

			local var_376_18 = 0.733333333333333

			if arg_373_1.time_ >= var_376_17 + var_376_18 and arg_373_1.time_ < var_376_17 + var_376_18 + arg_376_0 then
				arg_373_1.allBtn_.enabled = true
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/SK0107",
		"Assets/UIResources/UI_AB/TextureConfig/Background/SK0112",
		"Assets/UIResources/UI_AB/TextureConfig/Background/SK0201",
		"Assets/UIResources/UI_AB/TextureConfig/Background/SK0106",
		"Assets/UIResources/UI_AB/TextureConfig/Background/SK0102",
		"Assets/UIResources/UI_AB/TextureConfig/Background/I05f"
	},
	voices = {
		"story_v_out_116381.awb"
	}
}
