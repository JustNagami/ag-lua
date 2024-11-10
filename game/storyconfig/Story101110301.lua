return {
	Play111031001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 111031001
		arg_1_1.duration_ = 1.999999999999

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play111031002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = 0

			if var_4_0 < arg_1_1.time_ and arg_1_1.time_ <= var_4_0 + arg_4_0 then
				arg_1_1.fswbg_:SetActive(true)
				arg_1_1.dialog_:SetActive(false)

				arg_1_1.fswtw_.percent = 0

				local var_4_1 = arg_1_1:GetWordFromCfg(111031001)
				local var_4_2 = arg_1_1:FormatText(var_4_1.content)

				arg_1_1.fswt_.text = var_4_2

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.fswt_)

				arg_1_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_1_1.fswtw_:SetDirty()

				arg_1_1.typewritterCharCountI18N = 0

				arg_1_1:ShowNextGo(false)
			end

			local var_4_3 = 0.2

			if var_4_3 < arg_1_1.time_ and arg_1_1.time_ <= var_4_3 + arg_4_0 then
				arg_1_1.var_.oldValueTypewriter = arg_1_1.fswtw_.percent

				arg_1_1:ShowNextGo(false)
			end

			local var_4_4 = 9
			local var_4_5 = 0.54
			local var_4_6 = arg_1_1:GetWordFromCfg(111031001)
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

			local var_4_11 = 0.54
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
			local var_4_15 = 1

			if var_4_14 < arg_1_1.time_ and arg_1_1.time_ <= var_4_14 + arg_4_0 then
				local var_4_16 = "play"
				local var_4_17 = "music"

				arg_1_1:AudioAction(var_4_16, var_4_17, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_18 = 0
			local var_4_19 = 1
			local var_4_20 = manager.audio:GetVoiceLength("story_v_out_111031", "111031001", "story_v_out_111031.awb") / 1000

			if var_4_20 > 0 and var_4_19 < var_4_20 and var_4_20 + var_4_18 > arg_1_1.duration_ then
				local var_4_21 = var_4_20

				arg_1_1.duration_ = var_4_20 + var_4_18
			end

			if var_4_18 < arg_1_1.time_ and arg_1_1.time_ <= var_4_18 + arg_4_0 then
				local var_4_22 = "play"
				local var_4_23 = "voice"

				arg_1_1:AudioAction(var_4_22, var_4_23, "story_v_out_111031", "111031001", "story_v_out_111031.awb")
			end
		end
	end,
	Play111031002 = function(arg_5_0, arg_5_1)
		arg_5_1.time_ = 0
		arg_5_1.frameCnt_ = 0
		arg_5_1.state_ = "playing"
		arg_5_1.curTalkId_ = 111031002
		arg_5_1.duration_ = 1.999999999999

		SetActive(arg_5_1.tipsGo_, false)

		function arg_5_1.onSingleLineFinish_()
			arg_5_1.onSingleLineUpdate_ = nil
			arg_5_1.onSingleLineFinish_ = nil
			arg_5_1.state_ = "waiting"
		end

		function arg_5_1.playNext_(arg_7_0)
			if arg_7_0 == 1 then
				arg_5_0:Play111031003(arg_5_1)
			end
		end

		function arg_5_1.onSingleLineUpdate_(arg_8_0)
			local var_8_0 = 0

			if var_8_0 < arg_5_1.time_ and arg_5_1.time_ <= var_8_0 + arg_8_0 then
				arg_5_1.var_.oldValueTypewriter = arg_5_1.fswtw_.percent

				arg_5_1:ShowNextGo(false)
			end

			local var_8_1 = 29
			local var_8_2 = 1.74
			local var_8_3 = arg_5_1:GetWordFromCfg(111031001)
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

			local var_8_8 = 1.74
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
			local var_8_12 = 1
			local var_8_13 = manager.audio:GetVoiceLength("story_v_out_111031", "111031002", "story_v_out_111031.awb") / 1000

			if var_8_13 > 0 and var_8_12 < var_8_13 and var_8_13 + var_8_11 > arg_5_1.duration_ then
				local var_8_14 = var_8_13

				arg_5_1.duration_ = var_8_13 + var_8_11
			end

			if var_8_11 < arg_5_1.time_ and arg_5_1.time_ <= var_8_11 + arg_8_0 then
				local var_8_15 = "play"
				local var_8_16 = "voice"

				arg_5_1:AudioAction(var_8_15, var_8_16, "story_v_out_111031", "111031002", "story_v_out_111031.awb")
			end
		end
	end,
	Play111031003 = function(arg_9_0, arg_9_1)
		arg_9_1.time_ = 0
		arg_9_1.frameCnt_ = 0
		arg_9_1.state_ = "playing"
		arg_9_1.curTalkId_ = 111031003
		arg_9_1.duration_ = 1.259999999999

		SetActive(arg_9_1.tipsGo_, false)

		function arg_9_1.onSingleLineFinish_()
			arg_9_1.onSingleLineUpdate_ = nil
			arg_9_1.onSingleLineFinish_ = nil
			arg_9_1.state_ = "waiting"
		end

		function arg_9_1.playNext_(arg_11_0)
			if arg_11_0 == 1 then
				arg_9_0:Play111031004(arg_9_1)
			end
		end

		function arg_9_1.onSingleLineUpdate_(arg_12_0)
			local var_12_0 = 0

			if var_12_0 < arg_9_1.time_ and arg_9_1.time_ <= var_12_0 + arg_12_0 then
				arg_9_1.var_.oldValueTypewriter = arg_9_1.fswtw_.percent

				arg_9_1:ShowNextGo(false)
			end

			local var_12_1 = 21
			local var_12_2 = 1.26
			local var_12_3 = arg_9_1:GetWordFromCfg(111031001)
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

			local var_12_8 = 1.26
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
			local var_12_12 = 1
			local var_12_13 = manager.audio:GetVoiceLength("story_v_out_111031", "111031003", "story_v_out_111031.awb") / 1000

			if var_12_13 > 0 and var_12_12 < var_12_13 and var_12_13 + var_12_11 > arg_9_1.duration_ then
				local var_12_14 = var_12_13

				arg_9_1.duration_ = var_12_13 + var_12_11
			end

			if var_12_11 < arg_9_1.time_ and arg_9_1.time_ <= var_12_11 + arg_12_0 then
				local var_12_15 = "play"
				local var_12_16 = "voice"

				arg_9_1:AudioAction(var_12_15, var_12_16, "story_v_out_111031", "111031003", "story_v_out_111031.awb")
			end
		end
	end,
	Play111031004 = function(arg_13_0, arg_13_1)
		arg_13_1.time_ = 0
		arg_13_1.frameCnt_ = 0
		arg_13_1.state_ = "playing"
		arg_13_1.curTalkId_ = 111031004
		arg_13_1.duration_ = 10.243999999999

		SetActive(arg_13_1.tipsGo_, false)

		function arg_13_1.onSingleLineFinish_()
			arg_13_1.onSingleLineUpdate_ = nil
			arg_13_1.onSingleLineFinish_ = nil
			arg_13_1.state_ = "waiting"
		end

		function arg_13_1.playNext_(arg_15_0)
			if arg_15_0 == 1 then
				arg_13_0:Play111031005(arg_13_1)
			end
		end

		function arg_13_1.onSingleLineUpdate_(arg_16_0)
			local var_16_0 = 0

			if var_16_0 < arg_13_1.time_ and arg_13_1.time_ <= var_16_0 + arg_16_0 then
				arg_13_1.var_.oldValueTypewriter = arg_13_1.fswtw_.percent

				arg_13_1:ShowNextGo(false)
			end

			local var_16_1 = 29
			local var_16_2 = 1.74
			local var_16_3 = arg_13_1:GetWordFromCfg(111031001)
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

			local var_16_8 = 1.74
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
			local var_16_12 = 10.244
			local var_16_13 = manager.audio:GetVoiceLength("story_v_out_111031", "111031004", "story_v_out_111031.awb") / 1000

			if var_16_13 > 0 and var_16_12 < var_16_13 and var_16_13 + var_16_11 > arg_13_1.duration_ then
				local var_16_14 = var_16_13

				arg_13_1.duration_ = var_16_13 + var_16_11
			end

			if var_16_11 < arg_13_1.time_ and arg_13_1.time_ <= var_16_11 + arg_16_0 then
				local var_16_15 = "play"
				local var_16_16 = "voice"

				arg_13_1:AudioAction(var_16_15, var_16_16, "story_v_out_111031", "111031004", "story_v_out_111031.awb")
			end
		end
	end,
	Play111031005 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 111031005
		arg_17_1.duration_ = 4.8

		local var_17_0 = {
			ja = 4.3,
			ko = 4.8,
			zh = 4.466,
			en = 3.566
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
				arg_17_0:Play111031006(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = "D05"

			if arg_17_1.bgs_[var_20_0] == nil then
				local var_20_1 = Object.Instantiate(arg_17_1.paintGo_)

				var_20_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_20_0)
				var_20_1.name = var_20_0
				var_20_1.transform.parent = arg_17_1.stage_.transform
				var_20_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_17_1.bgs_[var_20_0] = var_20_1
			end

			local var_20_2 = 0

			if var_20_2 < arg_17_1.time_ and arg_17_1.time_ <= var_20_2 + arg_20_0 then
				local var_20_3 = manager.ui.mainCamera.transform.localPosition
				local var_20_4 = Vector3.New(0, 0, 10) + Vector3.New(var_20_3.x, var_20_3.y, 0)
				local var_20_5 = arg_17_1.bgs_.D05

				var_20_5.transform.localPosition = var_20_4
				var_20_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_20_6 = var_20_5:GetComponent("SpriteRenderer")

				if var_20_6 and var_20_6.sprite then
					local var_20_7 = (var_20_5.transform.localPosition - var_20_3).z
					local var_20_8 = manager.ui.mainCameraCom_
					local var_20_9 = 2 * var_20_7 * Mathf.Tan(var_20_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_20_10 = var_20_9 * var_20_8.aspect
					local var_20_11 = var_20_6.sprite.bounds.size.x
					local var_20_12 = var_20_6.sprite.bounds.size.y
					local var_20_13 = var_20_10 / var_20_11
					local var_20_14 = var_20_9 / var_20_12
					local var_20_15 = var_20_14 < var_20_13 and var_20_13 or var_20_14

					var_20_5.transform.localScale = Vector3.New(var_20_15, var_20_15, 0)
				end

				for iter_20_0, iter_20_1 in pairs(arg_17_1.bgs_) do
					if iter_20_0 ~= "D05" then
						iter_20_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_20_16 = 0

			if var_20_16 < arg_17_1.time_ and arg_17_1.time_ <= var_20_16 + arg_20_0 then
				arg_17_1.fswbg_:SetActive(false)
				arg_17_1.dialog_:SetActive(true)
				arg_17_1:ShowNextGo(false)
			end

			local var_20_17 = arg_17_1.bgs_.D05
			local var_20_18 = 0

			if var_20_18 < arg_17_1.time_ and arg_17_1.time_ <= var_20_18 + arg_20_0 then
				local var_20_19 = var_20_17:GetComponent("SpriteRenderer")

				if var_20_19 then
					var_20_19.material = arg_17_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_20_20 = var_20_19.material
					local var_20_21 = var_20_20:GetColor("_Color")

					arg_17_1.var_.alphaOldValueD05 = var_20_21.a
					arg_17_1.var_.alphaMatValueD05 = var_20_20
				end

				arg_17_1.var_.alphaOldValueD05 = 0
			end

			local var_20_22 = 1.5

			if var_20_18 <= arg_17_1.time_ and arg_17_1.time_ < var_20_18 + var_20_22 then
				local var_20_23 = (arg_17_1.time_ - var_20_18) / var_20_22
				local var_20_24 = Mathf.Lerp(arg_17_1.var_.alphaOldValueD05, 1, var_20_23)

				if arg_17_1.var_.alphaMatValueD05 then
					local var_20_25 = arg_17_1.var_.alphaMatValueD05
					local var_20_26 = var_20_25:GetColor("_Color")

					var_20_26.a = var_20_24

					var_20_25:SetColor("_Color", var_20_26)
				end
			end

			if arg_17_1.time_ >= var_20_18 + var_20_22 and arg_17_1.time_ < var_20_18 + var_20_22 + arg_20_0 and arg_17_1.var_.alphaMatValueD05 then
				local var_20_27 = arg_17_1.var_.alphaMatValueD05
				local var_20_28 = var_20_27:GetColor("_Color")

				var_20_28.a = 1

				var_20_27:SetColor("_Color", var_20_28)
			end

			local var_20_29 = 0

			if var_20_29 < arg_17_1.time_ and arg_17_1.time_ <= var_20_29 + arg_20_0 then
				arg_17_1.allBtn_.enabled = false
			end

			local var_20_30 = 1.5

			if arg_17_1.time_ >= var_20_29 + var_20_30 and arg_17_1.time_ < var_20_29 + var_20_30 + arg_20_0 then
				arg_17_1.allBtn_.enabled = true
			end

			local var_20_31 = 0
			local var_20_32 = 1

			if var_20_31 < arg_17_1.time_ and arg_17_1.time_ <= var_20_31 + arg_20_0 then
				local var_20_33 = "play"
				local var_20_34 = "music"

				arg_17_1:AudioAction(var_20_33, var_20_34, "bgm_activity_1_1_hel_story", "bgm_activity_1_1_hel_story", "bgm_activity_1_1_hel_story.awb")
			end

			if arg_17_1.frameCnt_ <= 1 then
				arg_17_1.dialog_:SetActive(false)
			end

			local var_20_35 = 1.5
			local var_20_36 = 0.3

			if var_20_35 < arg_17_1.time_ and arg_17_1.time_ <= var_20_35 + arg_20_0 then
				arg_17_1.talkMaxDuration = 0

				arg_17_1.dialog_:SetActive(true)

				local var_20_37 = LeanTween.value(arg_17_1.dialog_, 0, 1, 0.3)

				var_20_37:setOnUpdate(LuaHelper.FloatAction(function(arg_21_0)
					arg_17_1.dialogCg_.alpha = arg_21_0
				end))
				var_20_37:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_17_1.dialog_)
					var_20_37:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_17_1.duration_ = arg_17_1.duration_ + 0.3

				SetActive(arg_17_1.leftNameGo_, true)

				local var_20_38 = arg_17_1:FormatText(StoryNameCfg[177].name)

				arg_17_1.leftNameTxt_.text = var_20_38

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_17_1.leftNameTxt_.transform)

				arg_17_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_17_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_17_1:RecordName(arg_17_1.leftNameTxt_.text)
				SetActive(arg_17_1.iconTrs_.gameObject, true)
				arg_17_1.iconController_:SetSelectedState("hero")

				arg_17_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_ganglati")

				arg_17_1.callingController_:SetSelectedState("normal")

				local var_20_39 = arg_17_1:GetWordFromCfg(111031005)
				local var_20_40 = arg_17_1:FormatText(var_20_39.content)

				arg_17_1.text_.text = var_20_40

				LuaForUtil.ClearLinePrefixSymbol(arg_17_1.text_)

				local var_20_41 = 12
				local var_20_42 = utf8.len(var_20_40)
				local var_20_43 = var_20_41 <= 0 and var_20_36 or var_20_36 * (var_20_42 / var_20_41)

				if var_20_43 > 0 and var_20_36 < var_20_43 then
					arg_17_1.talkMaxDuration = var_20_43
					var_20_35 = var_20_35 + 0.3

					if var_20_43 + var_20_35 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_43 + var_20_35
					end
				end

				arg_17_1.text_.text = var_20_40
				arg_17_1.typewritter.percent = 0

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111031", "111031005", "story_v_out_111031.awb") ~= 0 then
					local var_20_44 = manager.audio:GetVoiceLength("story_v_out_111031", "111031005", "story_v_out_111031.awb") / 1000

					if var_20_44 + var_20_35 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_44 + var_20_35
					end

					if var_20_39.prefab_name ~= "" and arg_17_1.actors_[var_20_39.prefab_name] ~= nil then
						local var_20_45 = LuaForUtil.PlayVoiceWithCriLipsync(arg_17_1.actors_[var_20_39.prefab_name].transform, "story_v_out_111031", "111031005", "story_v_out_111031.awb")

						arg_17_1:RecordAudio("111031005", var_20_45)
						arg_17_1:RecordAudio("111031005", var_20_45)
					else
						arg_17_1:AudioAction("play", "voice", "story_v_out_111031", "111031005", "story_v_out_111031.awb")
					end

					arg_17_1:RecordHistoryTalkVoice("story_v_out_111031", "111031005", "story_v_out_111031.awb")
				end

				arg_17_1:RecordContent(arg_17_1.text_.text)
			end

			local var_20_46 = var_20_35 + 0.3
			local var_20_47 = math.max(var_20_36, arg_17_1.talkMaxDuration)

			if var_20_46 <= arg_17_1.time_ and arg_17_1.time_ < var_20_46 + var_20_47 then
				arg_17_1.typewritter.percent = (arg_17_1.time_ - var_20_46) / var_20_47

				arg_17_1.typewritter:SetDirty()
			end

			if arg_17_1.time_ >= var_20_46 + var_20_47 and arg_17_1.time_ < var_20_46 + var_20_47 + arg_20_0 then
				arg_17_1.typewritter.percent = 1

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(true)
			end
		end
	end,
	Play111031006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 111031006
		arg_23_1.duration_ = 4.633

		local var_23_0 = {
			ja = 4.166,
			ko = 4.633,
			zh = 4.433,
			en = 4.5
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
				arg_23_0:Play111031007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 0.525

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_2 = arg_23_1:FormatText(StoryNameCfg[177].name)

				arg_23_1.leftNameTxt_.text = var_26_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, true)
				arg_23_1.iconController_:SetSelectedState("hero")

				arg_23_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_ganglati")

				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_3 = arg_23_1:GetWordFromCfg(111031006)
				local var_26_4 = arg_23_1:FormatText(var_26_3.content)

				arg_23_1.text_.text = var_26_4

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_5 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_111031", "111031006", "story_v_out_111031.awb") ~= 0 then
					local var_26_8 = manager.audio:GetVoiceLength("story_v_out_111031", "111031006", "story_v_out_111031.awb") / 1000

					if var_26_8 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_8 + var_26_0
					end

					if var_26_3.prefab_name ~= "" and arg_23_1.actors_[var_26_3.prefab_name] ~= nil then
						local var_26_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_3.prefab_name].transform, "story_v_out_111031", "111031006", "story_v_out_111031.awb")

						arg_23_1:RecordAudio("111031006", var_26_9)
						arg_23_1:RecordAudio("111031006", var_26_9)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_111031", "111031006", "story_v_out_111031.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_111031", "111031006", "story_v_out_111031.awb")
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
	Play111031007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 111031007
		arg_27_1.duration_ = 6.6

		local var_27_0 = {
			ja = 3.433,
			ko = 6.6,
			zh = 3.366,
			en = 3.766
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
				arg_27_0:Play111031008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0
			local var_30_1 = 0.725

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_2 = arg_27_1:FormatText(StoryNameCfg[177].name)

				arg_27_1.leftNameTxt_.text = var_30_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, true)
				arg_27_1.iconController_:SetSelectedState("hero")

				arg_27_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_ganglati")

				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_3 = arg_27_1:GetWordFromCfg(111031007)
				local var_30_4 = arg_27_1:FormatText(var_30_3.content)

				arg_27_1.text_.text = var_30_4

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_5 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_111031", "111031007", "story_v_out_111031.awb") ~= 0 then
					local var_30_8 = manager.audio:GetVoiceLength("story_v_out_111031", "111031007", "story_v_out_111031.awb") / 1000

					if var_30_8 + var_30_0 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_8 + var_30_0
					end

					if var_30_3.prefab_name ~= "" and arg_27_1.actors_[var_30_3.prefab_name] ~= nil then
						local var_30_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_3.prefab_name].transform, "story_v_out_111031", "111031007", "story_v_out_111031.awb")

						arg_27_1:RecordAudio("111031007", var_30_9)
						arg_27_1:RecordAudio("111031007", var_30_9)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_111031", "111031007", "story_v_out_111031.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_111031", "111031007", "story_v_out_111031.awb")
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
	Play111031008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 111031008
		arg_31_1.duration_ = 3.9

		local var_31_0 = {
			ja = 1.999999999999,
			ko = 2.333,
			zh = 3.9,
			en = 1.999999999999
		}
		local var_31_1 = manager.audio:GetLocalizationFlag()

		if var_31_0[var_31_1] ~= nil then
			arg_31_1.duration_ = var_31_0[var_31_1]
		end

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play111031009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = "1094ui_story"

			if arg_31_1.actors_[var_34_0] == nil then
				local var_34_1 = Object.Instantiate(Asset.Load("Char/" .. var_34_0), arg_31_1.stage_.transform)

				var_34_1.name = var_34_0
				var_34_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_31_1.actors_[var_34_0] = var_34_1

				local var_34_2 = var_34_1:GetComponentInChildren(typeof(CharacterEffect))

				var_34_2.enabled = true

				local var_34_3 = GameObjectTools.GetOrAddComponent(var_34_1, typeof(DynamicBoneHelper))

				if var_34_3 then
					var_34_3:EnableDynamicBone(false)
				end

				arg_31_1:ShowWeapon(var_34_2.transform, false)

				arg_31_1.var_[var_34_0 .. "Animator"] = var_34_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_31_1.var_[var_34_0 .. "Animator"].applyRootMotion = true
				arg_31_1.var_[var_34_0 .. "LipSync"] = var_34_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_34_4 = arg_31_1.actors_["1094ui_story"].transform
			local var_34_5 = 0

			if var_34_5 < arg_31_1.time_ and arg_31_1.time_ <= var_34_5 + arg_34_0 then
				arg_31_1.var_.moveOldPos1094ui_story = var_34_4.localPosition
			end

			local var_34_6 = 0.001

			if var_34_5 <= arg_31_1.time_ and arg_31_1.time_ < var_34_5 + var_34_6 then
				local var_34_7 = (arg_31_1.time_ - var_34_5) / var_34_6
				local var_34_8 = Vector3.New(0, -0.84, -6.1)

				var_34_4.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1094ui_story, var_34_8, var_34_7)

				local var_34_9 = manager.ui.mainCamera.transform.position - var_34_4.position

				var_34_4.forward = Vector3.New(var_34_9.x, var_34_9.y, var_34_9.z)

				local var_34_10 = var_34_4.localEulerAngles

				var_34_10.z = 0
				var_34_10.x = 0
				var_34_4.localEulerAngles = var_34_10
			end

			if arg_31_1.time_ >= var_34_5 + var_34_6 and arg_31_1.time_ < var_34_5 + var_34_6 + arg_34_0 then
				var_34_4.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_34_11 = manager.ui.mainCamera.transform.position - var_34_4.position

				var_34_4.forward = Vector3.New(var_34_11.x, var_34_11.y, var_34_11.z)

				local var_34_12 = var_34_4.localEulerAngles

				var_34_12.z = 0
				var_34_12.x = 0
				var_34_4.localEulerAngles = var_34_12
			end

			local var_34_13 = 0

			if var_34_13 < arg_31_1.time_ and arg_31_1.time_ <= var_34_13 + arg_34_0 then
				arg_31_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action3_1")
			end

			local var_34_14 = 0

			if var_34_14 < arg_31_1.time_ and arg_31_1.time_ <= var_34_14 + arg_34_0 then
				arg_31_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_34_15 = arg_31_1.actors_["1094ui_story"]
			local var_34_16 = 0

			if var_34_16 < arg_31_1.time_ and arg_31_1.time_ <= var_34_16 + arg_34_0 and arg_31_1.var_.characterEffect1094ui_story == nil then
				arg_31_1.var_.characterEffect1094ui_story = var_34_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_17 = 0.2

			if var_34_16 <= arg_31_1.time_ and arg_31_1.time_ < var_34_16 + var_34_17 then
				local var_34_18 = (arg_31_1.time_ - var_34_16) / var_34_17

				if arg_31_1.var_.characterEffect1094ui_story then
					arg_31_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_16 + var_34_17 and arg_31_1.time_ < var_34_16 + var_34_17 + arg_34_0 and arg_31_1.var_.characterEffect1094ui_story then
				arg_31_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_34_19 = 0
			local var_34_20 = 0.275

			if var_34_19 < arg_31_1.time_ and arg_31_1.time_ <= var_34_19 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_21 = arg_31_1:FormatText(StoryNameCfg[181].name)

				arg_31_1.leftNameTxt_.text = var_34_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_22 = arg_31_1:GetWordFromCfg(111031008)
				local var_34_23 = arg_31_1:FormatText(var_34_22.content)

				arg_31_1.text_.text = var_34_23

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_24 = 11
				local var_34_25 = utf8.len(var_34_23)
				local var_34_26 = var_34_24 <= 0 and var_34_20 or var_34_20 * (var_34_25 / var_34_24)

				if var_34_26 > 0 and var_34_20 < var_34_26 then
					arg_31_1.talkMaxDuration = var_34_26

					if var_34_26 + var_34_19 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_26 + var_34_19
					end
				end

				arg_31_1.text_.text = var_34_23
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111031", "111031008", "story_v_out_111031.awb") ~= 0 then
					local var_34_27 = manager.audio:GetVoiceLength("story_v_out_111031", "111031008", "story_v_out_111031.awb") / 1000

					if var_34_27 + var_34_19 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_27 + var_34_19
					end

					if var_34_22.prefab_name ~= "" and arg_31_1.actors_[var_34_22.prefab_name] ~= nil then
						local var_34_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_22.prefab_name].transform, "story_v_out_111031", "111031008", "story_v_out_111031.awb")

						arg_31_1:RecordAudio("111031008", var_34_28)
						arg_31_1:RecordAudio("111031008", var_34_28)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_111031", "111031008", "story_v_out_111031.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_111031", "111031008", "story_v_out_111031.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_29 = math.max(var_34_20, arg_31_1.talkMaxDuration)

			if var_34_19 <= arg_31_1.time_ and arg_31_1.time_ < var_34_19 + var_34_29 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_19) / var_34_29

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_19 + var_34_29 and arg_31_1.time_ < var_34_19 + var_34_29 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play111031009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 111031009
		arg_35_1.duration_ = 4

		local var_35_0 = {
			ja = 2.033,
			ko = 2,
			zh = 4,
			en = 1.999999999999
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
				arg_35_0:Play111031010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_38_1 = arg_35_1.actors_["1094ui_story"]
			local var_38_2 = 0

			if var_38_2 < arg_35_1.time_ and arg_35_1.time_ <= var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect1094ui_story == nil then
				arg_35_1.var_.characterEffect1094ui_story = var_38_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_3 = 0.2

			if var_38_2 <= arg_35_1.time_ and arg_35_1.time_ < var_38_2 + var_38_3 then
				local var_38_4 = (arg_35_1.time_ - var_38_2) / var_38_3

				if arg_35_1.var_.characterEffect1094ui_story then
					arg_35_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_2 + var_38_3 and arg_35_1.time_ < var_38_2 + var_38_3 + arg_38_0 and arg_35_1.var_.characterEffect1094ui_story then
				arg_35_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_38_5 = 0
			local var_38_6 = 0.25

			if var_38_5 < arg_35_1.time_ and arg_35_1.time_ <= var_38_5 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_7 = arg_35_1:FormatText(StoryNameCfg[181].name)

				arg_35_1.leftNameTxt_.text = var_38_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_8 = arg_35_1:GetWordFromCfg(111031009)
				local var_38_9 = arg_35_1:FormatText(var_38_8.content)

				arg_35_1.text_.text = var_38_9

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_10 = 10
				local var_38_11 = utf8.len(var_38_9)
				local var_38_12 = var_38_10 <= 0 and var_38_6 or var_38_6 * (var_38_11 / var_38_10)

				if var_38_12 > 0 and var_38_6 < var_38_12 then
					arg_35_1.talkMaxDuration = var_38_12

					if var_38_12 + var_38_5 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_12 + var_38_5
					end
				end

				arg_35_1.text_.text = var_38_9
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111031", "111031009", "story_v_out_111031.awb") ~= 0 then
					local var_38_13 = manager.audio:GetVoiceLength("story_v_out_111031", "111031009", "story_v_out_111031.awb") / 1000

					if var_38_13 + var_38_5 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_13 + var_38_5
					end

					if var_38_8.prefab_name ~= "" and arg_35_1.actors_[var_38_8.prefab_name] ~= nil then
						local var_38_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_8.prefab_name].transform, "story_v_out_111031", "111031009", "story_v_out_111031.awb")

						arg_35_1:RecordAudio("111031009", var_38_14)
						arg_35_1:RecordAudio("111031009", var_38_14)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_111031", "111031009", "story_v_out_111031.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_111031", "111031009", "story_v_out_111031.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_15 = math.max(var_38_6, arg_35_1.talkMaxDuration)

			if var_38_5 <= arg_35_1.time_ and arg_35_1.time_ < var_38_5 + var_38_15 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_5) / var_38_15

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_5 + var_38_15 and arg_35_1.time_ < var_38_5 + var_38_15 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play111031010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 111031010
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play111031011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1094ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect1094ui_story == nil then
				arg_39_1.var_.characterEffect1094ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.2

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect1094ui_story then
					local var_42_4 = Mathf.Lerp(0, 0.5, var_42_3)

					arg_39_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_39_1.var_.characterEffect1094ui_story.fillRatio = var_42_4
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect1094ui_story then
				local var_42_5 = 0.5

				arg_39_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_39_1.var_.characterEffect1094ui_story.fillRatio = var_42_5
			end

			local var_42_6 = 0
			local var_42_7 = 0.75

			if var_42_6 < arg_39_1.time_ and arg_39_1.time_ <= var_42_6 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, false)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_8 = arg_39_1:GetWordFromCfg(111031010)
				local var_42_9 = arg_39_1:FormatText(var_42_8.content)

				arg_39_1.text_.text = var_42_9

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_10 = 30
				local var_42_11 = utf8.len(var_42_9)
				local var_42_12 = var_42_10 <= 0 and var_42_7 or var_42_7 * (var_42_11 / var_42_10)

				if var_42_12 > 0 and var_42_7 < var_42_12 then
					arg_39_1.talkMaxDuration = var_42_12

					if var_42_12 + var_42_6 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_12 + var_42_6
					end
				end

				arg_39_1.text_.text = var_42_9
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)
				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_13 = math.max(var_42_7, arg_39_1.talkMaxDuration)

			if var_42_6 <= arg_39_1.time_ and arg_39_1.time_ < var_42_6 + var_42_13 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_6) / var_42_13

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_6 + var_42_13 and arg_39_1.time_ < var_42_6 + var_42_13 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play111031011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 111031011
		arg_43_1.duration_ = 1.999999999999

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play111031012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094actionlink/1094action435")
			end

			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_46_2 = arg_43_1.actors_["1094ui_story"]
			local var_46_3 = 0

			if var_46_3 < arg_43_1.time_ and arg_43_1.time_ <= var_46_3 + arg_46_0 and arg_43_1.var_.characterEffect1094ui_story == nil then
				arg_43_1.var_.characterEffect1094ui_story = var_46_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_4 = 0.2

			if var_46_3 <= arg_43_1.time_ and arg_43_1.time_ < var_46_3 + var_46_4 then
				local var_46_5 = (arg_43_1.time_ - var_46_3) / var_46_4

				if arg_43_1.var_.characterEffect1094ui_story then
					arg_43_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_3 + var_46_4 and arg_43_1.time_ < var_46_3 + var_46_4 + arg_46_0 and arg_43_1.var_.characterEffect1094ui_story then
				arg_43_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_46_6 = 0
			local var_46_7 = 0.15

			if var_46_6 < arg_43_1.time_ and arg_43_1.time_ <= var_46_6 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_8 = arg_43_1:FormatText(StoryNameCfg[181].name)

				arg_43_1.leftNameTxt_.text = var_46_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_9 = arg_43_1:GetWordFromCfg(111031011)
				local var_46_10 = arg_43_1:FormatText(var_46_9.content)

				arg_43_1.text_.text = var_46_10

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_11 = 6
				local var_46_12 = utf8.len(var_46_10)
				local var_46_13 = var_46_11 <= 0 and var_46_7 or var_46_7 * (var_46_12 / var_46_11)

				if var_46_13 > 0 and var_46_7 < var_46_13 then
					arg_43_1.talkMaxDuration = var_46_13

					if var_46_13 + var_46_6 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_13 + var_46_6
					end
				end

				arg_43_1.text_.text = var_46_10
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111031", "111031011", "story_v_out_111031.awb") ~= 0 then
					local var_46_14 = manager.audio:GetVoiceLength("story_v_out_111031", "111031011", "story_v_out_111031.awb") / 1000

					if var_46_14 + var_46_6 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_14 + var_46_6
					end

					if var_46_9.prefab_name ~= "" and arg_43_1.actors_[var_46_9.prefab_name] ~= nil then
						local var_46_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_9.prefab_name].transform, "story_v_out_111031", "111031011", "story_v_out_111031.awb")

						arg_43_1:RecordAudio("111031011", var_46_15)
						arg_43_1:RecordAudio("111031011", var_46_15)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_111031", "111031011", "story_v_out_111031.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_111031", "111031011", "story_v_out_111031.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_16 = math.max(var_46_7, arg_43_1.talkMaxDuration)

			if var_46_6 <= arg_43_1.time_ and arg_43_1.time_ < var_46_6 + var_46_16 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_6) / var_46_16

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_6 + var_46_16 and arg_43_1.time_ < var_46_6 + var_46_16 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play111031012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 111031012
		arg_47_1.duration_ = 7.266

		local var_47_0 = {
			ja = 7.266,
			ko = 6.366,
			zh = 6.133,
			en = 6.466
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
				arg_47_0:Play111031013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.bgs_.D05
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				local var_50_2 = var_50_0:GetComponent("SpriteRenderer")

				if var_50_2 then
					var_50_2.material = arg_47_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_50_3 = var_50_2.material
					local var_50_4 = var_50_3:GetColor("_Color")

					arg_47_1.var_.alphaOldValueD05 = var_50_4.a
					arg_47_1.var_.alphaMatValueD05 = var_50_3
				end

				arg_47_1.var_.alphaOldValueD05 = 1
			end

			local var_50_5 = 1

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_5 then
				local var_50_6 = (arg_47_1.time_ - var_50_1) / var_50_5
				local var_50_7 = Mathf.Lerp(arg_47_1.var_.alphaOldValueD05, 0, var_50_6)

				if arg_47_1.var_.alphaMatValueD05 then
					local var_50_8 = arg_47_1.var_.alphaMatValueD05
					local var_50_9 = var_50_8:GetColor("_Color")

					var_50_9.a = var_50_7

					var_50_8:SetColor("_Color", var_50_9)
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_5 and arg_47_1.time_ < var_50_1 + var_50_5 + arg_50_0 and arg_47_1.var_.alphaMatValueD05 then
				local var_50_10 = arg_47_1.var_.alphaMatValueD05
				local var_50_11 = var_50_10:GetColor("_Color")

				var_50_11.a = 0

				var_50_10:SetColor("_Color", var_50_11)
			end

			local var_50_12 = "D12b"

			if arg_47_1.bgs_[var_50_12] == nil then
				local var_50_13 = Object.Instantiate(arg_47_1.paintGo_)

				var_50_13:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_50_12)
				var_50_13.name = var_50_12
				var_50_13.transform.parent = arg_47_1.stage_.transform
				var_50_13.transform.localPosition = Vector3.New(0, 100, 0)
				arg_47_1.bgs_[var_50_12] = var_50_13
			end

			local var_50_14 = 1

			if var_50_14 < arg_47_1.time_ and arg_47_1.time_ <= var_50_14 + arg_50_0 then
				local var_50_15 = manager.ui.mainCamera.transform.localPosition
				local var_50_16 = Vector3.New(0, 0, 10) + Vector3.New(var_50_15.x, var_50_15.y, 0)
				local var_50_17 = arg_47_1.bgs_.D12b

				var_50_17.transform.localPosition = var_50_16
				var_50_17.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_50_18 = var_50_17:GetComponent("SpriteRenderer")

				if var_50_18 and var_50_18.sprite then
					local var_50_19 = (var_50_17.transform.localPosition - var_50_15).z
					local var_50_20 = manager.ui.mainCameraCom_
					local var_50_21 = 2 * var_50_19 * Mathf.Tan(var_50_20.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_50_22 = var_50_21 * var_50_20.aspect
					local var_50_23 = var_50_18.sprite.bounds.size.x
					local var_50_24 = var_50_18.sprite.bounds.size.y
					local var_50_25 = var_50_22 / var_50_23
					local var_50_26 = var_50_21 / var_50_24
					local var_50_27 = var_50_26 < var_50_25 and var_50_25 or var_50_26

					var_50_17.transform.localScale = Vector3.New(var_50_27, var_50_27, 0)
				end

				for iter_50_0, iter_50_1 in pairs(arg_47_1.bgs_) do
					if iter_50_0 ~= "D12b" then
						iter_50_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_50_28 = arg_47_1.bgs_.D12b
			local var_50_29 = 1

			if var_50_29 < arg_47_1.time_ and arg_47_1.time_ <= var_50_29 + arg_50_0 then
				local var_50_30 = var_50_28:GetComponent("SpriteRenderer")

				if var_50_30 then
					var_50_30.material = arg_47_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_50_31 = var_50_30.material
					local var_50_32 = var_50_31:GetColor("_Color")

					arg_47_1.var_.alphaOldValueD12b = var_50_32.a
					arg_47_1.var_.alphaMatValueD12b = var_50_31
				end

				arg_47_1.var_.alphaOldValueD12b = 0
			end

			local var_50_33 = 1

			if var_50_29 <= arg_47_1.time_ and arg_47_1.time_ < var_50_29 + var_50_33 then
				local var_50_34 = (arg_47_1.time_ - var_50_29) / var_50_33
				local var_50_35 = Mathf.Lerp(arg_47_1.var_.alphaOldValueD12b, 1, var_50_34)

				if arg_47_1.var_.alphaMatValueD12b then
					local var_50_36 = arg_47_1.var_.alphaMatValueD12b
					local var_50_37 = var_50_36:GetColor("_Color")

					var_50_37.a = var_50_35

					var_50_36:SetColor("_Color", var_50_37)
				end
			end

			if arg_47_1.time_ >= var_50_29 + var_50_33 and arg_47_1.time_ < var_50_29 + var_50_33 + arg_50_0 and arg_47_1.var_.alphaMatValueD12b then
				local var_50_38 = arg_47_1.var_.alphaMatValueD12b
				local var_50_39 = var_50_38:GetColor("_Color")

				var_50_39.a = 1

				var_50_38:SetColor("_Color", var_50_39)
			end

			local var_50_40 = arg_47_1.actors_["1094ui_story"].transform
			local var_50_41 = 0

			if var_50_41 < arg_47_1.time_ and arg_47_1.time_ <= var_50_41 + arg_50_0 then
				arg_47_1.var_.moveOldPos1094ui_story = var_50_40.localPosition
			end

			local var_50_42 = 0.001

			if var_50_41 <= arg_47_1.time_ and arg_47_1.time_ < var_50_41 + var_50_42 then
				local var_50_43 = (arg_47_1.time_ - var_50_41) / var_50_42
				local var_50_44 = Vector3.New(0, 100, 0)

				var_50_40.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1094ui_story, var_50_44, var_50_43)

				local var_50_45 = manager.ui.mainCamera.transform.position - var_50_40.position

				var_50_40.forward = Vector3.New(var_50_45.x, var_50_45.y, var_50_45.z)

				local var_50_46 = var_50_40.localEulerAngles

				var_50_46.z = 0
				var_50_46.x = 0
				var_50_40.localEulerAngles = var_50_46
			end

			if arg_47_1.time_ >= var_50_41 + var_50_42 and arg_47_1.time_ < var_50_41 + var_50_42 + arg_50_0 then
				var_50_40.localPosition = Vector3.New(0, 100, 0)

				local var_50_47 = manager.ui.mainCamera.transform.position - var_50_40.position

				var_50_40.forward = Vector3.New(var_50_47.x, var_50_47.y, var_50_47.z)

				local var_50_48 = var_50_40.localEulerAngles

				var_50_48.z = 0
				var_50_48.x = 0
				var_50_40.localEulerAngles = var_50_48
			end

			local var_50_49 = "1048ui_story"

			if arg_47_1.actors_[var_50_49] == nil then
				local var_50_50 = Object.Instantiate(Asset.Load("Char/" .. var_50_49), arg_47_1.stage_.transform)

				var_50_50.name = var_50_49
				var_50_50.transform.localPosition = Vector3.New(0, 100, 0)
				arg_47_1.actors_[var_50_49] = var_50_50

				local var_50_51 = var_50_50:GetComponentInChildren(typeof(CharacterEffect))

				var_50_51.enabled = true

				local var_50_52 = GameObjectTools.GetOrAddComponent(var_50_50, typeof(DynamicBoneHelper))

				if var_50_52 then
					var_50_52:EnableDynamicBone(false)
				end

				arg_47_1:ShowWeapon(var_50_51.transform, false)

				arg_47_1.var_[var_50_49 .. "Animator"] = var_50_51.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_47_1.var_[var_50_49 .. "Animator"].applyRootMotion = true
				arg_47_1.var_[var_50_49 .. "LipSync"] = var_50_51.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_50_53 = arg_47_1.actors_["1048ui_story"].transform
			local var_50_54 = 2.00066666666667

			if var_50_54 < arg_47_1.time_ and arg_47_1.time_ <= var_50_54 + arg_50_0 then
				arg_47_1.var_.moveOldPos1048ui_story = var_50_53.localPosition
			end

			local var_50_55 = 0.001

			if var_50_54 <= arg_47_1.time_ and arg_47_1.time_ < var_50_54 + var_50_55 then
				local var_50_56 = (arg_47_1.time_ - var_50_54) / var_50_55
				local var_50_57 = Vector3.New(-0.7, -0.8, -6.2)

				var_50_53.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1048ui_story, var_50_57, var_50_56)

				local var_50_58 = manager.ui.mainCamera.transform.position - var_50_53.position

				var_50_53.forward = Vector3.New(var_50_58.x, var_50_58.y, var_50_58.z)

				local var_50_59 = var_50_53.localEulerAngles

				var_50_59.z = 0
				var_50_59.x = 0
				var_50_53.localEulerAngles = var_50_59
			end

			if arg_47_1.time_ >= var_50_54 + var_50_55 and arg_47_1.time_ < var_50_54 + var_50_55 + arg_50_0 then
				var_50_53.localPosition = Vector3.New(-0.7, -0.8, -6.2)

				local var_50_60 = manager.ui.mainCamera.transform.position - var_50_53.position

				var_50_53.forward = Vector3.New(var_50_60.x, var_50_60.y, var_50_60.z)

				local var_50_61 = var_50_53.localEulerAngles

				var_50_61.z = 0
				var_50_61.x = 0
				var_50_53.localEulerAngles = var_50_61
			end

			local var_50_62 = 2.00066666666667

			if var_50_62 < arg_47_1.time_ and arg_47_1.time_ <= var_50_62 + arg_50_0 then
				arg_47_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action7_1")
			end

			local var_50_63 = 2

			if var_50_63 < arg_47_1.time_ and arg_47_1.time_ <= var_50_63 + arg_50_0 then
				arg_47_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_50_64 = arg_47_1.actors_["1048ui_story"]
			local var_50_65 = 2

			if var_50_65 < arg_47_1.time_ and arg_47_1.time_ <= var_50_65 + arg_50_0 and arg_47_1.var_.characterEffect1048ui_story == nil then
				arg_47_1.var_.characterEffect1048ui_story = var_50_64:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_66 = 0.2

			if var_50_65 <= arg_47_1.time_ and arg_47_1.time_ < var_50_65 + var_50_66 then
				local var_50_67 = (arg_47_1.time_ - var_50_65) / var_50_66

				if arg_47_1.var_.characterEffect1048ui_story then
					arg_47_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_65 + var_50_66 and arg_47_1.time_ < var_50_65 + var_50_66 + arg_50_0 and arg_47_1.var_.characterEffect1048ui_story then
				arg_47_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_50_68 = 0

			if var_50_68 < arg_47_1.time_ and arg_47_1.time_ <= var_50_68 + arg_50_0 then
				arg_47_1.allBtn_.enabled = false
			end

			local var_50_69 = 2

			if arg_47_1.time_ >= var_50_68 + var_50_69 and arg_47_1.time_ < var_50_68 + var_50_69 + arg_50_0 then
				arg_47_1.allBtn_.enabled = true
			end

			if arg_47_1.frameCnt_ <= 1 then
				arg_47_1.dialog_:SetActive(false)
			end

			local var_50_70 = 2
			local var_50_71 = 0.55

			if var_50_70 < arg_47_1.time_ and arg_47_1.time_ <= var_50_70 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0

				arg_47_1.dialog_:SetActive(true)

				local var_50_72 = LeanTween.value(arg_47_1.dialog_, 0, 1, 0.3)

				var_50_72:setOnUpdate(LuaHelper.FloatAction(function(arg_51_0)
					arg_47_1.dialogCg_.alpha = arg_51_0
				end))
				var_50_72:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_47_1.dialog_)
					var_50_72:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_47_1.duration_ = arg_47_1.duration_ + 0.3

				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_73 = arg_47_1:FormatText(StoryNameCfg[8].name)

				arg_47_1.leftNameTxt_.text = var_50_73

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_74 = arg_47_1:GetWordFromCfg(111031012)
				local var_50_75 = arg_47_1:FormatText(var_50_74.content)

				arg_47_1.text_.text = var_50_75

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_76 = 22
				local var_50_77 = utf8.len(var_50_75)
				local var_50_78 = var_50_76 <= 0 and var_50_71 or var_50_71 * (var_50_77 / var_50_76)

				if var_50_78 > 0 and var_50_71 < var_50_78 then
					arg_47_1.talkMaxDuration = var_50_78
					var_50_70 = var_50_70 + 0.3

					if var_50_78 + var_50_70 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_78 + var_50_70
					end
				end

				arg_47_1.text_.text = var_50_75
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111031", "111031012", "story_v_out_111031.awb") ~= 0 then
					local var_50_79 = manager.audio:GetVoiceLength("story_v_out_111031", "111031012", "story_v_out_111031.awb") / 1000

					if var_50_79 + var_50_70 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_79 + var_50_70
					end

					if var_50_74.prefab_name ~= "" and arg_47_1.actors_[var_50_74.prefab_name] ~= nil then
						local var_50_80 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_74.prefab_name].transform, "story_v_out_111031", "111031012", "story_v_out_111031.awb")

						arg_47_1:RecordAudio("111031012", var_50_80)
						arg_47_1:RecordAudio("111031012", var_50_80)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_111031", "111031012", "story_v_out_111031.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_111031", "111031012", "story_v_out_111031.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_81 = var_50_70 + 0.3
			local var_50_82 = math.max(var_50_71, arg_47_1.talkMaxDuration)

			if var_50_81 <= arg_47_1.time_ and arg_47_1.time_ < var_50_81 + var_50_82 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_81) / var_50_82

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_81 + var_50_82 and arg_47_1.time_ < var_50_81 + var_50_82 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play111031013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 111031013
		arg_53_1.duration_ = 5

		SetActive(arg_53_1.tipsGo_, false)

		function arg_53_1.onSingleLineFinish_()
			arg_53_1.onSingleLineUpdate_ = nil
			arg_53_1.onSingleLineFinish_ = nil
			arg_53_1.state_ = "waiting"
		end

		function arg_53_1.playNext_(arg_55_0)
			if arg_55_0 == 1 then
				arg_53_0:Play111031014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = arg_53_1.actors_["1048ui_story"]
			local var_56_1 = 0

			if var_56_1 < arg_53_1.time_ and arg_53_1.time_ <= var_56_1 + arg_56_0 and arg_53_1.var_.characterEffect1048ui_story == nil then
				arg_53_1.var_.characterEffect1048ui_story = var_56_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_56_2 = 0.2

			if var_56_1 <= arg_53_1.time_ and arg_53_1.time_ < var_56_1 + var_56_2 then
				local var_56_3 = (arg_53_1.time_ - var_56_1) / var_56_2

				if arg_53_1.var_.characterEffect1048ui_story then
					local var_56_4 = Mathf.Lerp(0, 0.5, var_56_3)

					arg_53_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_53_1.var_.characterEffect1048ui_story.fillRatio = var_56_4
				end
			end

			if arg_53_1.time_ >= var_56_1 + var_56_2 and arg_53_1.time_ < var_56_1 + var_56_2 + arg_56_0 and arg_53_1.var_.characterEffect1048ui_story then
				local var_56_5 = 0.5

				arg_53_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_53_1.var_.characterEffect1048ui_story.fillRatio = var_56_5
			end

			local var_56_6 = 0
			local var_56_7 = 1

			if var_56_6 < arg_53_1.time_ and arg_53_1.time_ <= var_56_6 + arg_56_0 then
				local var_56_8 = "play"
				local var_56_9 = "effect"

				arg_53_1:AudioAction(var_56_8, var_56_9, "se_story_activity_1_1", "se_story_activity_1_1_stone", "")
			end

			local var_56_10 = 0
			local var_56_11 = 1.025

			if var_56_10 < arg_53_1.time_ and arg_53_1.time_ <= var_56_10 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, false)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_12 = arg_53_1:GetWordFromCfg(111031013)
				local var_56_13 = arg_53_1:FormatText(var_56_12.content)

				arg_53_1.text_.text = var_56_13

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_14 = 41
				local var_56_15 = utf8.len(var_56_13)
				local var_56_16 = var_56_14 <= 0 and var_56_11 or var_56_11 * (var_56_15 / var_56_14)

				if var_56_16 > 0 and var_56_11 < var_56_16 then
					arg_53_1.talkMaxDuration = var_56_16

					if var_56_16 + var_56_10 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_16 + var_56_10
					end
				end

				arg_53_1.text_.text = var_56_13
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)
				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_17 = math.max(var_56_11, arg_53_1.talkMaxDuration)

			if var_56_10 <= arg_53_1.time_ and arg_53_1.time_ < var_56_10 + var_56_17 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_10) / var_56_17

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_10 + var_56_17 and arg_53_1.time_ < var_56_10 + var_56_17 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play111031014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 111031014
		arg_57_1.duration_ = 5

		SetActive(arg_57_1.tipsGo_, false)

		function arg_57_1.onSingleLineFinish_()
			arg_57_1.onSingleLineUpdate_ = nil
			arg_57_1.onSingleLineFinish_ = nil
			arg_57_1.state_ = "waiting"
		end

		function arg_57_1.playNext_(arg_59_0)
			if arg_59_0 == 1 then
				arg_57_0:Play111031015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = 0
			local var_60_1 = 1.15

			if var_60_0 < arg_57_1.time_ and arg_57_1.time_ <= var_60_0 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, false)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_2 = arg_57_1:GetWordFromCfg(111031014)
				local var_60_3 = arg_57_1:FormatText(var_60_2.content)

				arg_57_1.text_.text = var_60_3

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_4 = 46
				local var_60_5 = utf8.len(var_60_3)
				local var_60_6 = var_60_4 <= 0 and var_60_1 or var_60_1 * (var_60_5 / var_60_4)

				if var_60_6 > 0 and var_60_1 < var_60_6 then
					arg_57_1.talkMaxDuration = var_60_6

					if var_60_6 + var_60_0 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_6 + var_60_0
					end
				end

				arg_57_1.text_.text = var_60_3
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)
				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_7 = math.max(var_60_1, arg_57_1.talkMaxDuration)

			if var_60_0 <= arg_57_1.time_ and arg_57_1.time_ < var_60_0 + var_60_7 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_0) / var_60_7

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_0 + var_60_7 and arg_57_1.time_ < var_60_0 + var_60_7 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play111031015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 111031015
		arg_61_1.duration_ = 11.4

		local var_61_0 = {
			ja = 11.4,
			ko = 7.166,
			zh = 5.2,
			en = 6.7
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
				arg_61_0:Play111031016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = "1039ui_story"

			if arg_61_1.actors_[var_64_0] == nil then
				local var_64_1 = Object.Instantiate(Asset.Load("Char/" .. var_64_0), arg_61_1.stage_.transform)

				var_64_1.name = var_64_0
				var_64_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_61_1.actors_[var_64_0] = var_64_1

				local var_64_2 = var_64_1:GetComponentInChildren(typeof(CharacterEffect))

				var_64_2.enabled = true

				local var_64_3 = GameObjectTools.GetOrAddComponent(var_64_1, typeof(DynamicBoneHelper))

				if var_64_3 then
					var_64_3:EnableDynamicBone(false)
				end

				arg_61_1:ShowWeapon(var_64_2.transform, false)

				arg_61_1.var_[var_64_0 .. "Animator"] = var_64_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_61_1.var_[var_64_0 .. "Animator"].applyRootMotion = true
				arg_61_1.var_[var_64_0 .. "LipSync"] = var_64_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_64_4 = arg_61_1.actors_["1039ui_story"].transform
			local var_64_5 = 0

			if var_64_5 < arg_61_1.time_ and arg_61_1.time_ <= var_64_5 + arg_64_0 then
				arg_61_1.var_.moveOldPos1039ui_story = var_64_4.localPosition

				local var_64_6 = "1039ui_story"

				arg_61_1:ShowWeapon(arg_61_1.var_[var_64_6 .. "Animator"].transform, false)
			end

			local var_64_7 = 0.001

			if var_64_5 <= arg_61_1.time_ and arg_61_1.time_ < var_64_5 + var_64_7 then
				local var_64_8 = (arg_61_1.time_ - var_64_5) / var_64_7
				local var_64_9 = Vector3.New(0.7, -1.01, -5.9)

				var_64_4.localPosition = Vector3.Lerp(arg_61_1.var_.moveOldPos1039ui_story, var_64_9, var_64_8)

				local var_64_10 = manager.ui.mainCamera.transform.position - var_64_4.position

				var_64_4.forward = Vector3.New(var_64_10.x, var_64_10.y, var_64_10.z)

				local var_64_11 = var_64_4.localEulerAngles

				var_64_11.z = 0
				var_64_11.x = 0
				var_64_4.localEulerAngles = var_64_11
			end

			if arg_61_1.time_ >= var_64_5 + var_64_7 and arg_61_1.time_ < var_64_5 + var_64_7 + arg_64_0 then
				var_64_4.localPosition = Vector3.New(0.7, -1.01, -5.9)

				local var_64_12 = manager.ui.mainCamera.transform.position - var_64_4.position

				var_64_4.forward = Vector3.New(var_64_12.x, var_64_12.y, var_64_12.z)

				local var_64_13 = var_64_4.localEulerAngles

				var_64_13.z = 0
				var_64_13.x = 0
				var_64_4.localEulerAngles = var_64_13
			end

			local var_64_14 = 0

			if var_64_14 < arg_61_1.time_ and arg_61_1.time_ <= var_64_14 + arg_64_0 then
				arg_61_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action5_1")
			end

			local var_64_15 = 0

			if var_64_15 < arg_61_1.time_ and arg_61_1.time_ <= var_64_15 + arg_64_0 then
				arg_61_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_64_16 = arg_61_1.actors_["1039ui_story"]
			local var_64_17 = 0

			if var_64_17 < arg_61_1.time_ and arg_61_1.time_ <= var_64_17 + arg_64_0 and arg_61_1.var_.characterEffect1039ui_story == nil then
				arg_61_1.var_.characterEffect1039ui_story = var_64_16:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_18 = 0.2

			if var_64_17 <= arg_61_1.time_ and arg_61_1.time_ < var_64_17 + var_64_18 then
				local var_64_19 = (arg_61_1.time_ - var_64_17) / var_64_18

				if arg_61_1.var_.characterEffect1039ui_story then
					arg_61_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_61_1.time_ >= var_64_17 + var_64_18 and arg_61_1.time_ < var_64_17 + var_64_18 + arg_64_0 and arg_61_1.var_.characterEffect1039ui_story then
				arg_61_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_64_20 = 0
			local var_64_21 = 0.7

			if var_64_20 < arg_61_1.time_ and arg_61_1.time_ <= var_64_20 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_22 = arg_61_1:FormatText(StoryNameCfg[9].name)

				arg_61_1.leftNameTxt_.text = var_64_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_23 = arg_61_1:GetWordFromCfg(111031015)
				local var_64_24 = arg_61_1:FormatText(var_64_23.content)

				arg_61_1.text_.text = var_64_24

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_25 = 28
				local var_64_26 = utf8.len(var_64_24)
				local var_64_27 = var_64_25 <= 0 and var_64_21 or var_64_21 * (var_64_26 / var_64_25)

				if var_64_27 > 0 and var_64_21 < var_64_27 then
					arg_61_1.talkMaxDuration = var_64_27

					if var_64_27 + var_64_20 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_27 + var_64_20
					end
				end

				arg_61_1.text_.text = var_64_24
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111031", "111031015", "story_v_out_111031.awb") ~= 0 then
					local var_64_28 = manager.audio:GetVoiceLength("story_v_out_111031", "111031015", "story_v_out_111031.awb") / 1000

					if var_64_28 + var_64_20 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_28 + var_64_20
					end

					if var_64_23.prefab_name ~= "" and arg_61_1.actors_[var_64_23.prefab_name] ~= nil then
						local var_64_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_23.prefab_name].transform, "story_v_out_111031", "111031015", "story_v_out_111031.awb")

						arg_61_1:RecordAudio("111031015", var_64_29)
						arg_61_1:RecordAudio("111031015", var_64_29)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_111031", "111031015", "story_v_out_111031.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_111031", "111031015", "story_v_out_111031.awb")
				end

				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_30 = math.max(var_64_21, arg_61_1.talkMaxDuration)

			if var_64_20 <= arg_61_1.time_ and arg_61_1.time_ < var_64_20 + var_64_30 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_20) / var_64_30

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_20 + var_64_30 and arg_61_1.time_ < var_64_20 + var_64_30 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play111031016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 111031016
		arg_65_1.duration_ = 5

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play111031017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = 0
			local var_68_1 = 0.875

			if var_68_0 < arg_65_1.time_ and arg_65_1.time_ <= var_68_0 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_2 = arg_65_1:FormatText(StoryNameCfg[7].name)

				arg_65_1.leftNameTxt_.text = var_68_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_3 = arg_65_1:GetWordFromCfg(111031016)
				local var_68_4 = arg_65_1:FormatText(var_68_3.content)

				arg_65_1.text_.text = var_68_4

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_5 = 35
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
				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_8 = math.max(var_68_1, arg_65_1.talkMaxDuration)

			if var_68_0 <= arg_65_1.time_ and arg_65_1.time_ < var_68_0 + var_68_8 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_0) / var_68_8

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_0 + var_68_8 and arg_65_1.time_ < var_68_0 + var_68_8 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play111031017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 111031017
		arg_69_1.duration_ = 4.7

		local var_69_0 = {
			ja = 4.7,
			ko = 3.466,
			zh = 3.8,
			en = 4.033
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
				arg_69_0:Play111031018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = arg_69_1.actors_["1048ui_story"].transform
			local var_72_1 = 0

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 then
				arg_69_1.var_.moveOldPos1048ui_story = var_72_0.localPosition
			end

			local var_72_2 = 0.001

			if var_72_1 <= arg_69_1.time_ and arg_69_1.time_ < var_72_1 + var_72_2 then
				local var_72_3 = (arg_69_1.time_ - var_72_1) / var_72_2
				local var_72_4 = Vector3.New(0, 100, 0)

				var_72_0.localPosition = Vector3.Lerp(arg_69_1.var_.moveOldPos1048ui_story, var_72_4, var_72_3)

				local var_72_5 = manager.ui.mainCamera.transform.position - var_72_0.position

				var_72_0.forward = Vector3.New(var_72_5.x, var_72_5.y, var_72_5.z)

				local var_72_6 = var_72_0.localEulerAngles

				var_72_6.z = 0
				var_72_6.x = 0
				var_72_0.localEulerAngles = var_72_6
			end

			if arg_69_1.time_ >= var_72_1 + var_72_2 and arg_69_1.time_ < var_72_1 + var_72_2 + arg_72_0 then
				var_72_0.localPosition = Vector3.New(0, 100, 0)

				local var_72_7 = manager.ui.mainCamera.transform.position - var_72_0.position

				var_72_0.forward = Vector3.New(var_72_7.x, var_72_7.y, var_72_7.z)

				local var_72_8 = var_72_0.localEulerAngles

				var_72_8.z = 0
				var_72_8.x = 0
				var_72_0.localEulerAngles = var_72_8
			end

			local var_72_9 = "1084ui_story"

			if arg_69_1.actors_[var_72_9] == nil then
				local var_72_10 = Object.Instantiate(Asset.Load("Char/" .. var_72_9), arg_69_1.stage_.transform)

				var_72_10.name = var_72_9
				var_72_10.transform.localPosition = Vector3.New(0, 100, 0)
				arg_69_1.actors_[var_72_9] = var_72_10

				local var_72_11 = var_72_10:GetComponentInChildren(typeof(CharacterEffect))

				var_72_11.enabled = true

				local var_72_12 = GameObjectTools.GetOrAddComponent(var_72_10, typeof(DynamicBoneHelper))

				if var_72_12 then
					var_72_12:EnableDynamicBone(false)
				end

				arg_69_1:ShowWeapon(var_72_11.transform, false)

				arg_69_1.var_[var_72_9 .. "Animator"] = var_72_11.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_69_1.var_[var_72_9 .. "Animator"].applyRootMotion = true
				arg_69_1.var_[var_72_9 .. "LipSync"] = var_72_11.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_72_13 = arg_69_1.actors_["1084ui_story"].transform
			local var_72_14 = 0

			if var_72_14 < arg_69_1.time_ and arg_69_1.time_ <= var_72_14 + arg_72_0 then
				arg_69_1.var_.moveOldPos1084ui_story = var_72_13.localPosition
			end

			local var_72_15 = 0.001

			if var_72_14 <= arg_69_1.time_ and arg_69_1.time_ < var_72_14 + var_72_15 then
				local var_72_16 = (arg_69_1.time_ - var_72_14) / var_72_15
				local var_72_17 = Vector3.New(-0.7, -0.97, -6)

				var_72_13.localPosition = Vector3.Lerp(arg_69_1.var_.moveOldPos1084ui_story, var_72_17, var_72_16)

				local var_72_18 = manager.ui.mainCamera.transform.position - var_72_13.position

				var_72_13.forward = Vector3.New(var_72_18.x, var_72_18.y, var_72_18.z)

				local var_72_19 = var_72_13.localEulerAngles

				var_72_19.z = 0
				var_72_19.x = 0
				var_72_13.localEulerAngles = var_72_19
			end

			if arg_69_1.time_ >= var_72_14 + var_72_15 and arg_69_1.time_ < var_72_14 + var_72_15 + arg_72_0 then
				var_72_13.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_72_20 = manager.ui.mainCamera.transform.position - var_72_13.position

				var_72_13.forward = Vector3.New(var_72_20.x, var_72_20.y, var_72_20.z)

				local var_72_21 = var_72_13.localEulerAngles

				var_72_21.z = 0
				var_72_21.x = 0
				var_72_13.localEulerAngles = var_72_21
			end

			local var_72_22 = 0

			if var_72_22 < arg_69_1.time_ and arg_69_1.time_ <= var_72_22 + arg_72_0 then
				arg_69_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_72_23 = 0

			if var_72_23 < arg_69_1.time_ and arg_69_1.time_ <= var_72_23 + arg_72_0 then
				arg_69_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_72_24 = arg_69_1.actors_["1084ui_story"]
			local var_72_25 = 0

			if var_72_25 < arg_69_1.time_ and arg_69_1.time_ <= var_72_25 + arg_72_0 and arg_69_1.var_.characterEffect1084ui_story == nil then
				arg_69_1.var_.characterEffect1084ui_story = var_72_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_26 = 0.2

			if var_72_25 <= arg_69_1.time_ and arg_69_1.time_ < var_72_25 + var_72_26 then
				local var_72_27 = (arg_69_1.time_ - var_72_25) / var_72_26

				if arg_69_1.var_.characterEffect1084ui_story then
					arg_69_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_69_1.time_ >= var_72_25 + var_72_26 and arg_69_1.time_ < var_72_25 + var_72_26 + arg_72_0 and arg_69_1.var_.characterEffect1084ui_story then
				arg_69_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_72_28 = arg_69_1.actors_["1039ui_story"]
			local var_72_29 = 0

			if var_72_29 < arg_69_1.time_ and arg_69_1.time_ <= var_72_29 + arg_72_0 and arg_69_1.var_.characterEffect1039ui_story == nil then
				arg_69_1.var_.characterEffect1039ui_story = var_72_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_30 = 0.2

			if var_72_29 <= arg_69_1.time_ and arg_69_1.time_ < var_72_29 + var_72_30 then
				local var_72_31 = (arg_69_1.time_ - var_72_29) / var_72_30

				if arg_69_1.var_.characterEffect1039ui_story then
					local var_72_32 = Mathf.Lerp(0, 0.5, var_72_31)

					arg_69_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_69_1.var_.characterEffect1039ui_story.fillRatio = var_72_32
				end
			end

			if arg_69_1.time_ >= var_72_29 + var_72_30 and arg_69_1.time_ < var_72_29 + var_72_30 + arg_72_0 and arg_69_1.var_.characterEffect1039ui_story then
				local var_72_33 = 0.5

				arg_69_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_69_1.var_.characterEffect1039ui_story.fillRatio = var_72_33
			end

			local var_72_34 = 0
			local var_72_35 = 0.425

			if var_72_34 < arg_69_1.time_ and arg_69_1.time_ <= var_72_34 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_36 = arg_69_1:FormatText(StoryNameCfg[6].name)

				arg_69_1.leftNameTxt_.text = var_72_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_37 = arg_69_1:GetWordFromCfg(111031017)
				local var_72_38 = arg_69_1:FormatText(var_72_37.content)

				arg_69_1.text_.text = var_72_38

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_39 = 17
				local var_72_40 = utf8.len(var_72_38)
				local var_72_41 = var_72_39 <= 0 and var_72_35 or var_72_35 * (var_72_40 / var_72_39)

				if var_72_41 > 0 and var_72_35 < var_72_41 then
					arg_69_1.talkMaxDuration = var_72_41

					if var_72_41 + var_72_34 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_41 + var_72_34
					end
				end

				arg_69_1.text_.text = var_72_38
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111031", "111031017", "story_v_out_111031.awb") ~= 0 then
					local var_72_42 = manager.audio:GetVoiceLength("story_v_out_111031", "111031017", "story_v_out_111031.awb") / 1000

					if var_72_42 + var_72_34 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_42 + var_72_34
					end

					if var_72_37.prefab_name ~= "" and arg_69_1.actors_[var_72_37.prefab_name] ~= nil then
						local var_72_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_37.prefab_name].transform, "story_v_out_111031", "111031017", "story_v_out_111031.awb")

						arg_69_1:RecordAudio("111031017", var_72_43)
						arg_69_1:RecordAudio("111031017", var_72_43)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_111031", "111031017", "story_v_out_111031.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_111031", "111031017", "story_v_out_111031.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_44 = math.max(var_72_35, arg_69_1.talkMaxDuration)

			if var_72_34 <= arg_69_1.time_ and arg_69_1.time_ < var_72_34 + var_72_44 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_34) / var_72_44

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_34 + var_72_44 and arg_69_1.time_ < var_72_34 + var_72_44 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play111031018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 111031018
		arg_73_1.duration_ = 5

		SetActive(arg_73_1.tipsGo_, false)

		function arg_73_1.onSingleLineFinish_()
			arg_73_1.onSingleLineUpdate_ = nil
			arg_73_1.onSingleLineFinish_ = nil
			arg_73_1.state_ = "waiting"
		end

		function arg_73_1.playNext_(arg_75_0)
			if arg_75_0 == 1 then
				arg_73_0:Play111031019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["1084ui_story"]
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 and arg_73_1.var_.characterEffect1084ui_story == nil then
				arg_73_1.var_.characterEffect1084ui_story = var_76_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_2 = 0.2

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_2 then
				local var_76_3 = (arg_73_1.time_ - var_76_1) / var_76_2

				if arg_73_1.var_.characterEffect1084ui_story then
					local var_76_4 = Mathf.Lerp(0, 0.5, var_76_3)

					arg_73_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_73_1.var_.characterEffect1084ui_story.fillRatio = var_76_4
				end
			end

			if arg_73_1.time_ >= var_76_1 + var_76_2 and arg_73_1.time_ < var_76_1 + var_76_2 + arg_76_0 and arg_73_1.var_.characterEffect1084ui_story then
				local var_76_5 = 0.5

				arg_73_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_73_1.var_.characterEffect1084ui_story.fillRatio = var_76_5
			end

			local var_76_6 = 0
			local var_76_7 = 0.375

			if var_76_6 < arg_73_1.time_ and arg_73_1.time_ <= var_76_6 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, false)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_8 = arg_73_1:GetWordFromCfg(111031018)
				local var_76_9 = arg_73_1:FormatText(var_76_8.content)

				arg_73_1.text_.text = var_76_9

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_10 = 15
				local var_76_11 = utf8.len(var_76_9)
				local var_76_12 = var_76_10 <= 0 and var_76_7 or var_76_7 * (var_76_11 / var_76_10)

				if var_76_12 > 0 and var_76_7 < var_76_12 then
					arg_73_1.talkMaxDuration = var_76_12

					if var_76_12 + var_76_6 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_12 + var_76_6
					end
				end

				arg_73_1.text_.text = var_76_9
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)
				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_13 = math.max(var_76_7, arg_73_1.talkMaxDuration)

			if var_76_6 <= arg_73_1.time_ and arg_73_1.time_ < var_76_6 + var_76_13 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_6) / var_76_13

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_6 + var_76_13 and arg_73_1.time_ < var_76_6 + var_76_13 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play111031019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 111031019
		arg_77_1.duration_ = 1.3

		local var_77_0 = {
			ja = 0.999999999999,
			ko = 0.999999999999,
			zh = 1.3,
			en = 1.2
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
				arg_77_0:Play111031020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = 0
			local var_80_1 = 0.1

			if var_80_0 < arg_77_1.time_ and arg_77_1.time_ <= var_80_0 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_2 = arg_77_1:FormatText(StoryNameCfg[8].name)

				arg_77_1.leftNameTxt_.text = var_80_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, true)
				arg_77_1.iconController_:SetSelectedState("hero")

				arg_77_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1048")

				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_3 = arg_77_1:GetWordFromCfg(111031019)
				local var_80_4 = arg_77_1:FormatText(var_80_3.content)

				arg_77_1.text_.text = var_80_4

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_5 = 4
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

				if manager.audio:GetVoiceLength("story_v_out_111031", "111031019", "story_v_out_111031.awb") ~= 0 then
					local var_80_8 = manager.audio:GetVoiceLength("story_v_out_111031", "111031019", "story_v_out_111031.awb") / 1000

					if var_80_8 + var_80_0 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_8 + var_80_0
					end

					if var_80_3.prefab_name ~= "" and arg_77_1.actors_[var_80_3.prefab_name] ~= nil then
						local var_80_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_3.prefab_name].transform, "story_v_out_111031", "111031019", "story_v_out_111031.awb")

						arg_77_1:RecordAudio("111031019", var_80_9)
						arg_77_1:RecordAudio("111031019", var_80_9)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_111031", "111031019", "story_v_out_111031.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_111031", "111031019", "story_v_out_111031.awb")
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
	Play111031020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 111031020
		arg_81_1.duration_ = 2.566

		local var_81_0 = {
			ja = 2.233,
			ko = 2.066,
			zh = 2.466,
			en = 2.566
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
				arg_81_0:Play111031021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = 0

			if var_84_0 < arg_81_1.time_ and arg_81_1.time_ <= var_84_0 + arg_84_0 then
				arg_81_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action434")
			end

			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 then
				arg_81_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_84_2 = arg_81_1.actors_["1084ui_story"]
			local var_84_3 = 0

			if var_84_3 < arg_81_1.time_ and arg_81_1.time_ <= var_84_3 + arg_84_0 and arg_81_1.var_.characterEffect1084ui_story == nil then
				arg_81_1.var_.characterEffect1084ui_story = var_84_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_4 = 0.2

			if var_84_3 <= arg_81_1.time_ and arg_81_1.time_ < var_84_3 + var_84_4 then
				local var_84_5 = (arg_81_1.time_ - var_84_3) / var_84_4

				if arg_81_1.var_.characterEffect1084ui_story then
					arg_81_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_81_1.time_ >= var_84_3 + var_84_4 and arg_81_1.time_ < var_84_3 + var_84_4 + arg_84_0 and arg_81_1.var_.characterEffect1084ui_story then
				arg_81_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_84_6 = 0
			local var_84_7 = 0.2

			if var_84_6 < arg_81_1.time_ and arg_81_1.time_ <= var_84_6 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_8 = arg_81_1:FormatText(StoryNameCfg[6].name)

				arg_81_1.leftNameTxt_.text = var_84_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_9 = arg_81_1:GetWordFromCfg(111031020)
				local var_84_10 = arg_81_1:FormatText(var_84_9.content)

				arg_81_1.text_.text = var_84_10

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_11 = 8
				local var_84_12 = utf8.len(var_84_10)
				local var_84_13 = var_84_11 <= 0 and var_84_7 or var_84_7 * (var_84_12 / var_84_11)

				if var_84_13 > 0 and var_84_7 < var_84_13 then
					arg_81_1.talkMaxDuration = var_84_13

					if var_84_13 + var_84_6 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_13 + var_84_6
					end
				end

				arg_81_1.text_.text = var_84_10
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111031", "111031020", "story_v_out_111031.awb") ~= 0 then
					local var_84_14 = manager.audio:GetVoiceLength("story_v_out_111031", "111031020", "story_v_out_111031.awb") / 1000

					if var_84_14 + var_84_6 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_14 + var_84_6
					end

					if var_84_9.prefab_name ~= "" and arg_81_1.actors_[var_84_9.prefab_name] ~= nil then
						local var_84_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_9.prefab_name].transform, "story_v_out_111031", "111031020", "story_v_out_111031.awb")

						arg_81_1:RecordAudio("111031020", var_84_15)
						arg_81_1:RecordAudio("111031020", var_84_15)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_111031", "111031020", "story_v_out_111031.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_111031", "111031020", "story_v_out_111031.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_16 = math.max(var_84_7, arg_81_1.talkMaxDuration)

			if var_84_6 <= arg_81_1.time_ and arg_81_1.time_ < var_84_6 + var_84_16 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_6) / var_84_16

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_6 + var_84_16 and arg_81_1.time_ < var_84_6 + var_84_16 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play111031021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 111031021
		arg_85_1.duration_ = 2.433

		local var_85_0 = {
			ja = 2.433,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 1.999999999999
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
				arg_85_0:Play111031022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 0

			if var_88_0 < arg_85_1.time_ and arg_85_1.time_ <= var_88_0 + arg_88_0 then
				arg_85_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action453")
			end

			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 then
				arg_85_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_88_2 = arg_85_1.actors_["1039ui_story"]
			local var_88_3 = 0

			if var_88_3 < arg_85_1.time_ and arg_85_1.time_ <= var_88_3 + arg_88_0 and arg_85_1.var_.characterEffect1039ui_story == nil then
				arg_85_1.var_.characterEffect1039ui_story = var_88_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_4 = 0.2

			if var_88_3 <= arg_85_1.time_ and arg_85_1.time_ < var_88_3 + var_88_4 then
				local var_88_5 = (arg_85_1.time_ - var_88_3) / var_88_4

				if arg_85_1.var_.characterEffect1039ui_story then
					arg_85_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_85_1.time_ >= var_88_3 + var_88_4 and arg_85_1.time_ < var_88_3 + var_88_4 + arg_88_0 and arg_85_1.var_.characterEffect1039ui_story then
				arg_85_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_88_6 = arg_85_1.actors_["1084ui_story"]
			local var_88_7 = 0

			if var_88_7 < arg_85_1.time_ and arg_85_1.time_ <= var_88_7 + arg_88_0 and arg_85_1.var_.characterEffect1084ui_story == nil then
				arg_85_1.var_.characterEffect1084ui_story = var_88_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_8 = 0.2

			if var_88_7 <= arg_85_1.time_ and arg_85_1.time_ < var_88_7 + var_88_8 then
				local var_88_9 = (arg_85_1.time_ - var_88_7) / var_88_8

				if arg_85_1.var_.characterEffect1084ui_story then
					local var_88_10 = Mathf.Lerp(0, 0.5, var_88_9)

					arg_85_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_85_1.var_.characterEffect1084ui_story.fillRatio = var_88_10
				end
			end

			if arg_85_1.time_ >= var_88_7 + var_88_8 and arg_85_1.time_ < var_88_7 + var_88_8 + arg_88_0 and arg_85_1.var_.characterEffect1084ui_story then
				local var_88_11 = 0.5

				arg_85_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_85_1.var_.characterEffect1084ui_story.fillRatio = var_88_11
			end

			local var_88_12 = 0
			local var_88_13 = 0.075

			if var_88_12 < arg_85_1.time_ and arg_85_1.time_ <= var_88_12 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_14 = arg_85_1:FormatText(StoryNameCfg[9].name)

				arg_85_1.leftNameTxt_.text = var_88_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_15 = arg_85_1:GetWordFromCfg(111031021)
				local var_88_16 = arg_85_1:FormatText(var_88_15.content)

				arg_85_1.text_.text = var_88_16

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_17 = 3
				local var_88_18 = utf8.len(var_88_16)
				local var_88_19 = var_88_17 <= 0 and var_88_13 or var_88_13 * (var_88_18 / var_88_17)

				if var_88_19 > 0 and var_88_13 < var_88_19 then
					arg_85_1.talkMaxDuration = var_88_19

					if var_88_19 + var_88_12 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_19 + var_88_12
					end
				end

				arg_85_1.text_.text = var_88_16
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111031", "111031021", "story_v_out_111031.awb") ~= 0 then
					local var_88_20 = manager.audio:GetVoiceLength("story_v_out_111031", "111031021", "story_v_out_111031.awb") / 1000

					if var_88_20 + var_88_12 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_20 + var_88_12
					end

					if var_88_15.prefab_name ~= "" and arg_85_1.actors_[var_88_15.prefab_name] ~= nil then
						local var_88_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_15.prefab_name].transform, "story_v_out_111031", "111031021", "story_v_out_111031.awb")

						arg_85_1:RecordAudio("111031021", var_88_21)
						arg_85_1:RecordAudio("111031021", var_88_21)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_111031", "111031021", "story_v_out_111031.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_111031", "111031021", "story_v_out_111031.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_22 = math.max(var_88_13, arg_85_1.talkMaxDuration)

			if var_88_12 <= arg_85_1.time_ and arg_85_1.time_ < var_88_12 + var_88_22 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_12) / var_88_22

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_12 + var_88_22 and arg_85_1.time_ < var_88_12 + var_88_22 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play111031022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 111031022
		arg_89_1.duration_ = 6.5

		SetActive(arg_89_1.tipsGo_, false)

		function arg_89_1.onSingleLineFinish_()
			arg_89_1.onSingleLineUpdate_ = nil
			arg_89_1.onSingleLineFinish_ = nil
			arg_89_1.state_ = "waiting"
		end

		function arg_89_1.playNext_(arg_91_0)
			if arg_91_0 == 1 then
				arg_89_0:Play111031023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.bgs_.D12b.transform
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 then
				arg_89_1.var_.moveOldPosD12b = var_92_0.localPosition
				var_92_0.localScale = Vector3.New(1.2, 1.2, 1.2)
			end

			local var_92_2 = 1.5

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / var_92_2
				local var_92_4 = Vector3.New(0, 1, 10)

				var_92_0.localPosition = Vector3.Lerp(arg_89_1.var_.moveOldPosD12b, var_92_4, var_92_3)
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 then
				var_92_0.localPosition = Vector3.New(0, 1, 10)
			end

			local var_92_5 = arg_89_1.actors_["1084ui_story"].transform
			local var_92_6 = 0

			if var_92_6 < arg_89_1.time_ and arg_89_1.time_ <= var_92_6 + arg_92_0 then
				arg_89_1.var_.moveOldPos1084ui_story = var_92_5.localPosition
			end

			local var_92_7 = 0.001

			if var_92_6 <= arg_89_1.time_ and arg_89_1.time_ < var_92_6 + var_92_7 then
				local var_92_8 = (arg_89_1.time_ - var_92_6) / var_92_7
				local var_92_9 = Vector3.New(0, 100, 0)

				var_92_5.localPosition = Vector3.Lerp(arg_89_1.var_.moveOldPos1084ui_story, var_92_9, var_92_8)

				local var_92_10 = manager.ui.mainCamera.transform.position - var_92_5.position

				var_92_5.forward = Vector3.New(var_92_10.x, var_92_10.y, var_92_10.z)

				local var_92_11 = var_92_5.localEulerAngles

				var_92_11.z = 0
				var_92_11.x = 0
				var_92_5.localEulerAngles = var_92_11
			end

			if arg_89_1.time_ >= var_92_6 + var_92_7 and arg_89_1.time_ < var_92_6 + var_92_7 + arg_92_0 then
				var_92_5.localPosition = Vector3.New(0, 100, 0)

				local var_92_12 = manager.ui.mainCamera.transform.position - var_92_5.position

				var_92_5.forward = Vector3.New(var_92_12.x, var_92_12.y, var_92_12.z)

				local var_92_13 = var_92_5.localEulerAngles

				var_92_13.z = 0
				var_92_13.x = 0
				var_92_5.localEulerAngles = var_92_13
			end

			local var_92_14 = arg_89_1.actors_["1039ui_story"].transform
			local var_92_15 = 0

			if var_92_15 < arg_89_1.time_ and arg_89_1.time_ <= var_92_15 + arg_92_0 then
				arg_89_1.var_.moveOldPos1039ui_story = var_92_14.localPosition

				local var_92_16 = "1039ui_story"

				arg_89_1:ShowWeapon(arg_89_1.var_[var_92_16 .. "Animator"].transform, false)
			end

			local var_92_17 = 0.001

			if var_92_15 <= arg_89_1.time_ and arg_89_1.time_ < var_92_15 + var_92_17 then
				local var_92_18 = (arg_89_1.time_ - var_92_15) / var_92_17
				local var_92_19 = Vector3.New(0, 100, 0)

				var_92_14.localPosition = Vector3.Lerp(arg_89_1.var_.moveOldPos1039ui_story, var_92_19, var_92_18)

				local var_92_20 = manager.ui.mainCamera.transform.position - var_92_14.position

				var_92_14.forward = Vector3.New(var_92_20.x, var_92_20.y, var_92_20.z)

				local var_92_21 = var_92_14.localEulerAngles

				var_92_21.z = 0
				var_92_21.x = 0
				var_92_14.localEulerAngles = var_92_21
			end

			if arg_89_1.time_ >= var_92_15 + var_92_17 and arg_89_1.time_ < var_92_15 + var_92_17 + arg_92_0 then
				var_92_14.localPosition = Vector3.New(0, 100, 0)

				local var_92_22 = manager.ui.mainCamera.transform.position - var_92_14.position

				var_92_14.forward = Vector3.New(var_92_22.x, var_92_22.y, var_92_22.z)

				local var_92_23 = var_92_14.localEulerAngles

				var_92_23.z = 0
				var_92_23.x = 0
				var_92_14.localEulerAngles = var_92_23
			end

			if arg_89_1.frameCnt_ <= 1 then
				arg_89_1.dialog_:SetActive(false)
			end

			local var_92_24 = 1.5
			local var_92_25 = 0.75

			if var_92_24 < arg_89_1.time_ and arg_89_1.time_ <= var_92_24 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0

				arg_89_1.dialog_:SetActive(true)

				local var_92_26 = LeanTween.value(arg_89_1.dialog_, 0, 1, 0.3)

				var_92_26:setOnUpdate(LuaHelper.FloatAction(function(arg_93_0)
					arg_89_1.dialogCg_.alpha = arg_93_0
				end))
				var_92_26:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_89_1.dialog_)
					var_92_26:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_89_1.duration_ = arg_89_1.duration_ + 0.3

				SetActive(arg_89_1.leftNameGo_, false)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_27 = arg_89_1:GetWordFromCfg(111031022)
				local var_92_28 = arg_89_1:FormatText(var_92_27.content)

				arg_89_1.text_.text = var_92_28

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_29 = 30
				local var_92_30 = utf8.len(var_92_28)
				local var_92_31 = var_92_29 <= 0 and var_92_25 or var_92_25 * (var_92_30 / var_92_29)

				if var_92_31 > 0 and var_92_25 < var_92_31 then
					arg_89_1.talkMaxDuration = var_92_31
					var_92_24 = var_92_24 + 0.3

					if var_92_31 + var_92_24 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_31 + var_92_24
					end
				end

				arg_89_1.text_.text = var_92_28
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)
				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_32 = var_92_24 + 0.3
			local var_92_33 = math.max(var_92_25, arg_89_1.talkMaxDuration)

			if var_92_32 <= arg_89_1.time_ and arg_89_1.time_ < var_92_32 + var_92_33 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_32) / var_92_33

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_32 + var_92_33 and arg_89_1.time_ < var_92_32 + var_92_33 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play111031023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 111031023
		arg_95_1.duration_ = 5

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play111031024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 0
			local var_98_1 = 1.15

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

				local var_98_2 = arg_95_1:GetWordFromCfg(111031023)
				local var_98_3 = arg_95_1:FormatText(var_98_2.content)

				arg_95_1.text_.text = var_98_3

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_4 = 46
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
	Play111031024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 111031024
		arg_99_1.duration_ = 4.3

		local var_99_0 = {
			ja = 2.833,
			ko = 3.566,
			zh = 4.3,
			en = 2.733
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
				arg_99_0:Play111031025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = 0

			if var_102_0 < arg_99_1.time_ and arg_99_1.time_ <= var_102_0 + arg_102_0 then
				arg_99_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_102_1 = arg_99_1.actors_["1084ui_story"]
			local var_102_2 = 0

			if var_102_2 < arg_99_1.time_ and arg_99_1.time_ <= var_102_2 + arg_102_0 and arg_99_1.var_.characterEffect1084ui_story == nil then
				arg_99_1.var_.characterEffect1084ui_story = var_102_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_3 = 0.2

			if var_102_2 <= arg_99_1.time_ and arg_99_1.time_ < var_102_2 + var_102_3 then
				local var_102_4 = (arg_99_1.time_ - var_102_2) / var_102_3

				if arg_99_1.var_.characterEffect1084ui_story then
					arg_99_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_2 + var_102_3 and arg_99_1.time_ < var_102_2 + var_102_3 + arg_102_0 and arg_99_1.var_.characterEffect1084ui_story then
				arg_99_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_102_5 = arg_99_1.actors_["1084ui_story"].transform
			local var_102_6 = 0

			if var_102_6 < arg_99_1.time_ and arg_99_1.time_ <= var_102_6 + arg_102_0 then
				arg_99_1.var_.moveOldPos1084ui_story = var_102_5.localPosition
			end

			local var_102_7 = 0.001

			if var_102_6 <= arg_99_1.time_ and arg_99_1.time_ < var_102_6 + var_102_7 then
				local var_102_8 = (arg_99_1.time_ - var_102_6) / var_102_7
				local var_102_9 = Vector3.New(-0.7, -0.97, -6)

				var_102_5.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1084ui_story, var_102_9, var_102_8)

				local var_102_10 = manager.ui.mainCamera.transform.position - var_102_5.position

				var_102_5.forward = Vector3.New(var_102_10.x, var_102_10.y, var_102_10.z)

				local var_102_11 = var_102_5.localEulerAngles

				var_102_11.z = 0
				var_102_11.x = 0
				var_102_5.localEulerAngles = var_102_11
			end

			if arg_99_1.time_ >= var_102_6 + var_102_7 and arg_99_1.time_ < var_102_6 + var_102_7 + arg_102_0 then
				var_102_5.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_102_12 = manager.ui.mainCamera.transform.position - var_102_5.position

				var_102_5.forward = Vector3.New(var_102_12.x, var_102_12.y, var_102_12.z)

				local var_102_13 = var_102_5.localEulerAngles

				var_102_13.z = 0
				var_102_13.x = 0
				var_102_5.localEulerAngles = var_102_13
			end

			local var_102_14 = arg_99_1.actors_["1039ui_story"].transform
			local var_102_15 = 0

			if var_102_15 < arg_99_1.time_ and arg_99_1.time_ <= var_102_15 + arg_102_0 then
				arg_99_1.var_.moveOldPos1039ui_story = var_102_14.localPosition
			end

			local var_102_16 = 0.001

			if var_102_15 <= arg_99_1.time_ and arg_99_1.time_ < var_102_15 + var_102_16 then
				local var_102_17 = (arg_99_1.time_ - var_102_15) / var_102_16
				local var_102_18 = Vector3.New(0.7, -1.01, -5.9)

				var_102_14.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1039ui_story, var_102_18, var_102_17)

				local var_102_19 = manager.ui.mainCamera.transform.position - var_102_14.position

				var_102_14.forward = Vector3.New(var_102_19.x, var_102_19.y, var_102_19.z)

				local var_102_20 = var_102_14.localEulerAngles

				var_102_20.z = 0
				var_102_20.x = 0
				var_102_14.localEulerAngles = var_102_20
			end

			if arg_99_1.time_ >= var_102_15 + var_102_16 and arg_99_1.time_ < var_102_15 + var_102_16 + arg_102_0 then
				var_102_14.localPosition = Vector3.New(0.7, -1.01, -5.9)

				local var_102_21 = manager.ui.mainCamera.transform.position - var_102_14.position

				var_102_14.forward = Vector3.New(var_102_21.x, var_102_21.y, var_102_21.z)

				local var_102_22 = var_102_14.localEulerAngles

				var_102_22.z = 0
				var_102_22.x = 0
				var_102_14.localEulerAngles = var_102_22
			end

			local var_102_23 = 0
			local var_102_24 = 0.3

			if var_102_23 < arg_99_1.time_ and arg_99_1.time_ <= var_102_23 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_25 = arg_99_1:FormatText(StoryNameCfg[6].name)

				arg_99_1.leftNameTxt_.text = var_102_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_26 = arg_99_1:GetWordFromCfg(111031024)
				local var_102_27 = arg_99_1:FormatText(var_102_26.content)

				arg_99_1.text_.text = var_102_27

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_28 = 12
				local var_102_29 = utf8.len(var_102_27)
				local var_102_30 = var_102_28 <= 0 and var_102_24 or var_102_24 * (var_102_29 / var_102_28)

				if var_102_30 > 0 and var_102_24 < var_102_30 then
					arg_99_1.talkMaxDuration = var_102_30

					if var_102_30 + var_102_23 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_30 + var_102_23
					end
				end

				arg_99_1.text_.text = var_102_27
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111031", "111031024", "story_v_out_111031.awb") ~= 0 then
					local var_102_31 = manager.audio:GetVoiceLength("story_v_out_111031", "111031024", "story_v_out_111031.awb") / 1000

					if var_102_31 + var_102_23 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_31 + var_102_23
					end

					if var_102_26.prefab_name ~= "" and arg_99_1.actors_[var_102_26.prefab_name] ~= nil then
						local var_102_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_26.prefab_name].transform, "story_v_out_111031", "111031024", "story_v_out_111031.awb")

						arg_99_1:RecordAudio("111031024", var_102_32)
						arg_99_1:RecordAudio("111031024", var_102_32)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_111031", "111031024", "story_v_out_111031.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_111031", "111031024", "story_v_out_111031.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_33 = math.max(var_102_24, arg_99_1.talkMaxDuration)

			if var_102_23 <= arg_99_1.time_ and arg_99_1.time_ < var_102_23 + var_102_33 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_23) / var_102_33

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_23 + var_102_33 and arg_99_1.time_ < var_102_23 + var_102_33 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play111031025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 111031025
		arg_103_1.duration_ = 5

		local var_103_0 = {
			ja = 5,
			ko = 4.233,
			zh = 4.166,
			en = 2.733
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
				arg_103_0:Play111031026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = 0

			if var_106_0 < arg_103_1.time_ and arg_103_1.time_ <= var_106_0 + arg_106_0 then
				arg_103_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action435")
			end

			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2204cva")
			end

			local var_106_2 = arg_103_1.actors_["1039ui_story"]
			local var_106_3 = 0

			if var_106_3 < arg_103_1.time_ and arg_103_1.time_ <= var_106_3 + arg_106_0 and arg_103_1.var_.characterEffect1039ui_story == nil then
				arg_103_1.var_.characterEffect1039ui_story = var_106_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_4 = 0.2

			if var_106_3 <= arg_103_1.time_ and arg_103_1.time_ < var_106_3 + var_106_4 then
				local var_106_5 = (arg_103_1.time_ - var_106_3) / var_106_4

				if arg_103_1.var_.characterEffect1039ui_story then
					arg_103_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_103_1.time_ >= var_106_3 + var_106_4 and arg_103_1.time_ < var_106_3 + var_106_4 + arg_106_0 and arg_103_1.var_.characterEffect1039ui_story then
				arg_103_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_106_6 = arg_103_1.actors_["1084ui_story"]
			local var_106_7 = 0

			if var_106_7 < arg_103_1.time_ and arg_103_1.time_ <= var_106_7 + arg_106_0 and arg_103_1.var_.characterEffect1084ui_story == nil then
				arg_103_1.var_.characterEffect1084ui_story = var_106_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_8 = 0.2

			if var_106_7 <= arg_103_1.time_ and arg_103_1.time_ < var_106_7 + var_106_8 then
				local var_106_9 = (arg_103_1.time_ - var_106_7) / var_106_8

				if arg_103_1.var_.characterEffect1084ui_story then
					local var_106_10 = Mathf.Lerp(0, 0.5, var_106_9)

					arg_103_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_103_1.var_.characterEffect1084ui_story.fillRatio = var_106_10
				end
			end

			if arg_103_1.time_ >= var_106_7 + var_106_8 and arg_103_1.time_ < var_106_7 + var_106_8 + arg_106_0 and arg_103_1.var_.characterEffect1084ui_story then
				local var_106_11 = 0.5

				arg_103_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_103_1.var_.characterEffect1084ui_story.fillRatio = var_106_11
			end

			local var_106_12 = 0
			local var_106_13 = 0.45

			if var_106_12 < arg_103_1.time_ and arg_103_1.time_ <= var_106_12 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_14 = arg_103_1:FormatText(StoryNameCfg[9].name)

				arg_103_1.leftNameTxt_.text = var_106_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_15 = arg_103_1:GetWordFromCfg(111031025)
				local var_106_16 = arg_103_1:FormatText(var_106_15.content)

				arg_103_1.text_.text = var_106_16

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_17 = 18
				local var_106_18 = utf8.len(var_106_16)
				local var_106_19 = var_106_17 <= 0 and var_106_13 or var_106_13 * (var_106_18 / var_106_17)

				if var_106_19 > 0 and var_106_13 < var_106_19 then
					arg_103_1.talkMaxDuration = var_106_19

					if var_106_19 + var_106_12 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_19 + var_106_12
					end
				end

				arg_103_1.text_.text = var_106_16
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_111031", "111031025", "story_v_out_111031.awb") ~= 0 then
					local var_106_20 = manager.audio:GetVoiceLength("story_v_out_111031", "111031025", "story_v_out_111031.awb") / 1000

					if var_106_20 + var_106_12 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_20 + var_106_12
					end

					if var_106_15.prefab_name ~= "" and arg_103_1.actors_[var_106_15.prefab_name] ~= nil then
						local var_106_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_15.prefab_name].transform, "story_v_out_111031", "111031025", "story_v_out_111031.awb")

						arg_103_1:RecordAudio("111031025", var_106_21)
						arg_103_1:RecordAudio("111031025", var_106_21)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_111031", "111031025", "story_v_out_111031.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_111031", "111031025", "story_v_out_111031.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_22 = math.max(var_106_13, arg_103_1.talkMaxDuration)

			if var_106_12 <= arg_103_1.time_ and arg_103_1.time_ < var_106_12 + var_106_22 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_12) / var_106_22

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_12 + var_106_22 and arg_103_1.time_ < var_106_12 + var_106_22 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play111031026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 111031026
		arg_107_1.duration_ = 5

		SetActive(arg_107_1.tipsGo_, false)

		function arg_107_1.onSingleLineFinish_()
			arg_107_1.onSingleLineUpdate_ = nil
			arg_107_1.onSingleLineFinish_ = nil
			arg_107_1.state_ = "waiting"
			arg_107_1.auto_ = false
		end

		function arg_107_1.playNext_(arg_109_0)
			arg_107_1.onStoryFinished_()
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1039ui_story"]
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 and arg_107_1.var_.characterEffect1039ui_story == nil then
				arg_107_1.var_.characterEffect1039ui_story = var_110_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_2 = 0.2

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2

				if arg_107_1.var_.characterEffect1039ui_story then
					local var_110_4 = Mathf.Lerp(0, 0.5, var_110_3)

					arg_107_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_107_1.var_.characterEffect1039ui_story.fillRatio = var_110_4
				end
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 and arg_107_1.var_.characterEffect1039ui_story then
				local var_110_5 = 0.5

				arg_107_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_107_1.var_.characterEffect1039ui_story.fillRatio = var_110_5
			end

			local var_110_6 = 0
			local var_110_7 = 0.575

			if var_110_6 < arg_107_1.time_ and arg_107_1.time_ <= var_110_6 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_8 = arg_107_1:FormatText(StoryNameCfg[7].name)

				arg_107_1.leftNameTxt_.text = var_110_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_9 = arg_107_1:GetWordFromCfg(111031026)
				local var_110_10 = arg_107_1:FormatText(var_110_9.content)

				arg_107_1.text_.text = var_110_10

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_11 = 23
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
				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_14 = math.max(var_110_7, arg_107_1.talkMaxDuration)

			if var_110_6 <= arg_107_1.time_ and arg_107_1.time_ < var_110_6 + var_110_14 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_6) / var_110_14

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_6 + var_110_14 and arg_107_1.time_ < var_110_6 + var_110_14 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/D05",
		"Assets/UIResources/UI_AB/TextureConfig/Background/D12b"
	},
	voices = {
		"story_v_out_111031.awb"
	}
}
