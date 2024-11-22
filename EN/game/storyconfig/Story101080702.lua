return {
	Play108072001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 108072001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play108072002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "S0804"

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
				local var_4_5 = arg_1_1.bgs_.S0804

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
					if iter_4_0 ~= "S0804" then
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
			local var_4_23 = 1

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "bgm_story_scheme", "bgm_story_scheme", "bgm_story_scheme.awb")
			end

			local var_4_26 = 0

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_27 = 2

			if arg_1_1.time_ >= var_4_26 + var_4_27 and arg_1_1.time_ < var_4_26 + var_4_27 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_28 = 2
			local var_4_29 = 0.55

			if var_4_28 < arg_1_1.time_ and arg_1_1.time_ <= var_4_28 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_30 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_30:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_30:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_30:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_31 = arg_1_1:GetWordFromCfg(108072001)
				local var_4_32 = arg_1_1:FormatText(var_4_31.content)

				arg_1_1.text_.text = var_4_32

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_33 = 22
				local var_4_34 = utf8.len(var_4_32)
				local var_4_35 = var_4_33 <= 0 and var_4_29 or var_4_29 * (var_4_34 / var_4_33)

				if var_4_35 > 0 and var_4_29 < var_4_35 then
					arg_1_1.talkMaxDuration = var_4_35
					var_4_28 = var_4_28 + 0.3

					if var_4_35 + var_4_28 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_35 + var_4_28
					end
				end

				arg_1_1.text_.text = var_4_32
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_36 = var_4_28 + 0.3
			local var_4_37 = math.max(var_4_29, arg_1_1.talkMaxDuration)

			if var_4_36 <= arg_1_1.time_ and arg_1_1.time_ < var_4_36 + var_4_37 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_36) / var_4_37

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_36 + var_4_37 and arg_1_1.time_ < var_4_36 + var_4_37 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play108072002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 108072002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play108072003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.85

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

				local var_10_2 = arg_7_1:GetWordFromCfg(108072002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 34
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
	Play108072003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 108072003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play108072004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 0.725

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

				local var_14_2 = arg_11_1:GetWordFromCfg(108072003)
				local var_14_3 = arg_11_1:FormatText(var_14_2.content)

				arg_11_1.text_.text = var_14_3

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_4 = 29
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
	Play108072004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 108072004
		arg_15_1.duration_ = 6.200999999999

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play108072006(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 2

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.fswbg_:SetActive(true)
				arg_15_1.dialog_:SetActive(false)

				arg_15_1.fswtw_.percent = 0

				local var_18_1 = arg_15_1:GetWordFromCfg(108072004)
				local var_18_2 = arg_15_1:FormatText(var_18_1.content)

				arg_15_1.fswt_.text = var_18_2

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.fswt_)

				arg_15_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_15_1.fswtw_:SetDirty()

				arg_15_1.typewritterCharCountI18N = 0

				arg_15_1:ShowNextGo(false)
			end

			local var_18_3 = 2.01666666666667

			if var_18_3 < arg_15_1.time_ and arg_15_1.time_ <= var_18_3 + arg_18_0 then
				arg_15_1.var_.oldValueTypewriter = arg_15_1.fswtw_.percent

				arg_15_1:ShowNextGo(false)
			end

			local var_18_4 = 19
			local var_18_5 = 0.96
			local var_18_6 = arg_15_1:GetWordFromCfg(108072004)
			local var_18_7 = arg_15_1:FormatText(var_18_6.content)
			local var_18_8, var_18_9 = arg_15_1:GetPercentByPara(var_18_7, 1)

			if var_18_3 < arg_15_1.time_ and arg_15_1.time_ <= var_18_3 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0

				local var_18_10 = var_18_4 <= 0 and var_18_5 or var_18_5 * ((var_18_9 - arg_15_1.typewritterCharCountI18N) / var_18_4)

				if var_18_10 > 0 and var_18_5 < var_18_10 then
					arg_15_1.talkMaxDuration = var_18_10

					if var_18_10 + var_18_3 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_10 + var_18_3
					end
				end
			end

			local var_18_11 = 0.96
			local var_18_12 = math.max(var_18_11, arg_15_1.talkMaxDuration)

			if var_18_3 <= arg_15_1.time_ and arg_15_1.time_ < var_18_3 + var_18_12 then
				local var_18_13 = (arg_15_1.time_ - var_18_3) / var_18_12

				arg_15_1.fswtw_.percent = Mathf.Lerp(arg_15_1.var_.oldValueTypewriter, var_18_8, var_18_13)
				arg_15_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_15_1.fswtw_:SetDirty()
			end

			if arg_15_1.time_ >= var_18_3 + var_18_12 and arg_15_1.time_ < var_18_3 + var_18_12 + arg_18_0 then
				arg_15_1.fswtw_.percent = var_18_8

				arg_15_1.fswtw_:SetDirty()
				arg_15_1:ShowNextGo(true)

				arg_15_1.typewritterCharCountI18N = var_18_9
			end

			local var_18_14 = 2
			local var_18_15 = 4.201
			local var_18_16 = manager.audio:GetVoiceLength("story_v_out_108072", "108072004", "story_v_out_108072.awb") / 1000

			if var_18_16 > 0 and var_18_15 < var_18_16 and var_18_16 + var_18_14 > arg_15_1.duration_ then
				local var_18_17 = var_18_16

				arg_15_1.duration_ = var_18_16 + var_18_14
			end

			if var_18_14 < arg_15_1.time_ and arg_15_1.time_ <= var_18_14 + arg_18_0 then
				local var_18_18 = "play"
				local var_18_19 = "voice"

				arg_15_1:AudioAction(var_18_18, var_18_19, "story_v_out_108072", "108072004", "story_v_out_108072.awb")
			end

			local var_18_20 = 0

			if var_18_20 < arg_15_1.time_ and arg_15_1.time_ <= var_18_20 + arg_18_0 then
				arg_15_1.mask_.enabled = true
				arg_15_1.mask_.raycastTarget = true

				arg_15_1:SetGaussion(false)
			end

			local var_18_21 = 2

			if var_18_20 <= arg_15_1.time_ and arg_15_1.time_ < var_18_20 + var_18_21 then
				local var_18_22 = (arg_15_1.time_ - var_18_20) / var_18_21
				local var_18_23 = Color.New(0, 0, 0)

				var_18_23.a = Mathf.Lerp(0, 1, var_18_22)
				arg_15_1.mask_.color = var_18_23
			end

			if arg_15_1.time_ >= var_18_20 + var_18_21 and arg_15_1.time_ < var_18_20 + var_18_21 + arg_18_0 then
				local var_18_24 = Color.New(0, 0, 0)

				var_18_24.a = 1
				arg_15_1.mask_.color = var_18_24
			end

			local var_18_25 = 2

			if var_18_25 < arg_15_1.time_ and arg_15_1.time_ <= var_18_25 + arg_18_0 then
				arg_15_1.mask_.enabled = true
				arg_15_1.mask_.raycastTarget = true

				arg_15_1:SetGaussion(false)
			end

			local var_18_26 = 2

			if var_18_25 <= arg_15_1.time_ and arg_15_1.time_ < var_18_25 + var_18_26 then
				local var_18_27 = (arg_15_1.time_ - var_18_25) / var_18_26
				local var_18_28 = Color.New(0, 0, 0)

				var_18_28.a = Mathf.Lerp(1, 0, var_18_27)
				arg_15_1.mask_.color = var_18_28
			end

			if arg_15_1.time_ >= var_18_25 + var_18_26 and arg_15_1.time_ < var_18_25 + var_18_26 + arg_18_0 then
				local var_18_29 = Color.New(0, 0, 0)
				local var_18_30 = 0

				arg_15_1.mask_.enabled = false
				var_18_29.a = var_18_30
				arg_15_1.mask_.color = var_18_29
			end

			local var_18_31 = "S0809"

			if arg_15_1.bgs_[var_18_31] == nil then
				local var_18_32 = Object.Instantiate(arg_15_1.paintGo_)

				var_18_32:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_18_31)
				var_18_32.name = var_18_31
				var_18_32.transform.parent = arg_15_1.stage_.transform
				var_18_32.transform.localPosition = Vector3.New(0, 100, 0)
				arg_15_1.bgs_[var_18_31] = var_18_32
			end

			local var_18_33 = 2

			if var_18_33 < arg_15_1.time_ and arg_15_1.time_ <= var_18_33 + arg_18_0 then
				local var_18_34 = manager.ui.mainCamera.transform.localPosition
				local var_18_35 = Vector3.New(0, 0, 10) + Vector3.New(var_18_34.x, var_18_34.y, 0)
				local var_18_36 = arg_15_1.bgs_.S0809

				var_18_36.transform.localPosition = var_18_35
				var_18_36.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_18_37 = var_18_36:GetComponent("SpriteRenderer")

				if var_18_37 and var_18_37.sprite then
					local var_18_38 = (var_18_36.transform.localPosition - var_18_34).z
					local var_18_39 = manager.ui.mainCameraCom_
					local var_18_40 = 2 * var_18_38 * Mathf.Tan(var_18_39.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_18_41 = var_18_40 * var_18_39.aspect
					local var_18_42 = var_18_37.sprite.bounds.size.x
					local var_18_43 = var_18_37.sprite.bounds.size.y
					local var_18_44 = var_18_41 / var_18_42
					local var_18_45 = var_18_40 / var_18_43
					local var_18_46 = var_18_45 < var_18_44 and var_18_44 or var_18_45

					var_18_36.transform.localScale = Vector3.New(var_18_46, var_18_46, 0)
				end

				for iter_18_0, iter_18_1 in pairs(arg_15_1.bgs_) do
					if iter_18_0 ~= "S0809" then
						iter_18_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end
		end
	end,
	Play108072006 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 108072006
		arg_19_1.duration_ = 3.052999999999

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play108072007(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1.var_.oldValueTypewriter = arg_19_1.fswtw_.percent

				arg_19_1:ShowNextGo(false)
			end

			local var_22_1 = 13
			local var_22_2 = 0.66
			local var_22_3 = arg_19_1:GetWordFromCfg(108072004)
			local var_22_4 = arg_19_1:FormatText(var_22_3.content)
			local var_22_5, var_22_6 = arg_19_1:GetPercentByPara(var_22_4, 2)

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0

				local var_22_7 = var_22_1 <= 0 and var_22_2 or var_22_2 * ((var_22_6 - arg_19_1.typewritterCharCountI18N) / var_22_1)

				if var_22_7 > 0 and var_22_2 < var_22_7 then
					arg_19_1.talkMaxDuration = var_22_7

					if var_22_7 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_7 + var_22_0
					end
				end
			end

			local var_22_8 = 0.66
			local var_22_9 = math.max(var_22_8, arg_19_1.talkMaxDuration)

			if var_22_0 <= arg_19_1.time_ and arg_19_1.time_ < var_22_0 + var_22_9 then
				local var_22_10 = (arg_19_1.time_ - var_22_0) / var_22_9

				arg_19_1.fswtw_.percent = Mathf.Lerp(arg_19_1.var_.oldValueTypewriter, var_22_5, var_22_10)
				arg_19_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_19_1.fswtw_:SetDirty()
			end

			if arg_19_1.time_ >= var_22_0 + var_22_9 and arg_19_1.time_ < var_22_0 + var_22_9 + arg_22_0 then
				arg_19_1.fswtw_.percent = var_22_5

				arg_19_1.fswtw_:SetDirty()
				arg_19_1:ShowNextGo(true)

				arg_19_1.typewritterCharCountI18N = var_22_6
			end

			local var_22_11 = 0
			local var_22_12 = 3.053
			local var_22_13 = manager.audio:GetVoiceLength("story_v_out_108072", "108072006", "story_v_out_108072.awb") / 1000

			if var_22_13 > 0 and var_22_12 < var_22_13 and var_22_13 + var_22_11 > arg_19_1.duration_ then
				local var_22_14 = var_22_13

				arg_19_1.duration_ = var_22_13 + var_22_11
			end

			if var_22_11 < arg_19_1.time_ and arg_19_1.time_ <= var_22_11 + arg_22_0 then
				local var_22_15 = "play"
				local var_22_16 = "voice"

				arg_19_1:AudioAction(var_22_15, var_22_16, "story_v_out_108072", "108072006", "story_v_out_108072.awb")
			end
		end
	end,
	Play108072007 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 108072007
		arg_23_1.duration_ = 8.395999999999

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play108072008(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.var_.oldValueTypewriter = arg_23_1.fswtw_.percent

				arg_23_1:ShowNextGo(false)
			end

			local var_26_1 = 40
			local var_26_2 = 2.28
			local var_26_3 = arg_23_1:GetWordFromCfg(108072004)
			local var_26_4 = arg_23_1:FormatText(var_26_3.content)
			local var_26_5, var_26_6 = arg_23_1:GetPercentByPara(var_26_4, 3)

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0

				local var_26_7 = var_26_1 <= 0 and var_26_2 or var_26_2 * ((var_26_6 - arg_23_1.typewritterCharCountI18N) / var_26_1)

				if var_26_7 > 0 and var_26_2 < var_26_7 then
					arg_23_1.talkMaxDuration = var_26_7

					if var_26_7 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_7 + var_26_0
					end
				end
			end

			local var_26_8 = 2.28
			local var_26_9 = math.max(var_26_8, arg_23_1.talkMaxDuration)

			if var_26_0 <= arg_23_1.time_ and arg_23_1.time_ < var_26_0 + var_26_9 then
				local var_26_10 = (arg_23_1.time_ - var_26_0) / var_26_9

				arg_23_1.fswtw_.percent = Mathf.Lerp(arg_23_1.var_.oldValueTypewriter, var_26_5, var_26_10)
				arg_23_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_23_1.fswtw_:SetDirty()
			end

			if arg_23_1.time_ >= var_26_0 + var_26_9 and arg_23_1.time_ < var_26_0 + var_26_9 + arg_26_0 then
				arg_23_1.fswtw_.percent = var_26_5

				arg_23_1.fswtw_:SetDirty()
				arg_23_1:ShowNextGo(true)

				arg_23_1.typewritterCharCountI18N = var_26_6
			end

			local var_26_11 = 0
			local var_26_12 = 8.396
			local var_26_13 = manager.audio:GetVoiceLength("story_v_out_108072", "108072007", "story_v_out_108072.awb") / 1000

			if var_26_13 > 0 and var_26_12 < var_26_13 and var_26_13 + var_26_11 > arg_23_1.duration_ then
				local var_26_14 = var_26_13

				arg_23_1.duration_ = var_26_13 + var_26_11
			end

			if var_26_11 < arg_23_1.time_ and arg_23_1.time_ <= var_26_11 + arg_26_0 then
				local var_26_15 = "play"
				local var_26_16 = "voice"

				arg_23_1:AudioAction(var_26_15, var_26_16, "story_v_out_108072", "108072007", "story_v_out_108072.awb")
			end
		end
	end,
	Play108072008 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 108072008
		arg_27_1.duration_ = 5.865999999999

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play108072009(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				arg_27_1.var_.oldValueTypewriter = arg_27_1.fswtw_.percent

				arg_27_1:ShowNextGo(false)
			end

			local var_30_1 = 26
			local var_30_2 = 1.5
			local var_30_3 = arg_27_1:GetWordFromCfg(108072004)
			local var_30_4 = arg_27_1:FormatText(var_30_3.content)
			local var_30_5, var_30_6 = arg_27_1:GetPercentByPara(var_30_4, 4)

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0

				local var_30_7 = var_30_1 <= 0 and var_30_2 or var_30_2 * ((var_30_6 - arg_27_1.typewritterCharCountI18N) / var_30_1)

				if var_30_7 > 0 and var_30_2 < var_30_7 then
					arg_27_1.talkMaxDuration = var_30_7

					if var_30_7 + var_30_0 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_7 + var_30_0
					end
				end
			end

			local var_30_8 = 1.5
			local var_30_9 = math.max(var_30_8, arg_27_1.talkMaxDuration)

			if var_30_0 <= arg_27_1.time_ and arg_27_1.time_ < var_30_0 + var_30_9 then
				local var_30_10 = (arg_27_1.time_ - var_30_0) / var_30_9

				arg_27_1.fswtw_.percent = Mathf.Lerp(arg_27_1.var_.oldValueTypewriter, var_30_5, var_30_10)
				arg_27_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_27_1.fswtw_:SetDirty()
			end

			if arg_27_1.time_ >= var_30_0 + var_30_9 and arg_27_1.time_ < var_30_0 + var_30_9 + arg_30_0 then
				arg_27_1.fswtw_.percent = var_30_5

				arg_27_1.fswtw_:SetDirty()
				arg_27_1:ShowNextGo(true)

				arg_27_1.typewritterCharCountI18N = var_30_6
			end

			local var_30_11 = 0
			local var_30_12 = 5.866
			local var_30_13 = manager.audio:GetVoiceLength("story_v_out_108072", "108072008", "story_v_out_108072.awb") / 1000

			if var_30_13 > 0 and var_30_12 < var_30_13 and var_30_13 + var_30_11 > arg_27_1.duration_ then
				local var_30_14 = var_30_13

				arg_27_1.duration_ = var_30_13 + var_30_11
			end

			if var_30_11 < arg_27_1.time_ and arg_27_1.time_ <= var_30_11 + arg_30_0 then
				local var_30_15 = "play"
				local var_30_16 = "voice"

				arg_27_1:AudioAction(var_30_15, var_30_16, "story_v_out_108072", "108072008", "story_v_out_108072.awb")
			end
		end
	end,
	Play108072009 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 108072009
		arg_31_1.duration_ = 2.597999999999

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play108072010(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1.var_.oldValueTypewriter = arg_31_1.fswtw_.percent

				arg_31_1:ShowNextGo(false)
			end

			local var_34_1 = 15
			local var_34_2 = 0.72
			local var_34_3 = arg_31_1:GetWordFromCfg(108072004)
			local var_34_4 = arg_31_1:FormatText(var_34_3.content)
			local var_34_5, var_34_6 = arg_31_1:GetPercentByPara(var_34_4, 5)

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0

				local var_34_7 = var_34_1 <= 0 and var_34_2 or var_34_2 * ((var_34_6 - arg_31_1.typewritterCharCountI18N) / var_34_1)

				if var_34_7 > 0 and var_34_2 < var_34_7 then
					arg_31_1.talkMaxDuration = var_34_7

					if var_34_7 + var_34_0 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_7 + var_34_0
					end
				end
			end

			local var_34_8 = 0.72
			local var_34_9 = math.max(var_34_8, arg_31_1.talkMaxDuration)

			if var_34_0 <= arg_31_1.time_ and arg_31_1.time_ < var_34_0 + var_34_9 then
				local var_34_10 = (arg_31_1.time_ - var_34_0) / var_34_9

				arg_31_1.fswtw_.percent = Mathf.Lerp(arg_31_1.var_.oldValueTypewriter, var_34_5, var_34_10)
				arg_31_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_31_1.fswtw_:SetDirty()
			end

			if arg_31_1.time_ >= var_34_0 + var_34_9 and arg_31_1.time_ < var_34_0 + var_34_9 + arg_34_0 then
				arg_31_1.fswtw_.percent = var_34_5

				arg_31_1.fswtw_:SetDirty()
				arg_31_1:ShowNextGo(true)

				arg_31_1.typewritterCharCountI18N = var_34_6
			end

			local var_34_11 = 0
			local var_34_12 = 2.598
			local var_34_13 = manager.audio:GetVoiceLength("story_v_out_108072", "108072009", "story_v_out_108072.awb") / 1000

			if var_34_13 > 0 and var_34_12 < var_34_13 and var_34_13 + var_34_11 > arg_31_1.duration_ then
				local var_34_14 = var_34_13

				arg_31_1.duration_ = var_34_13 + var_34_11
			end

			if var_34_11 < arg_31_1.time_ and arg_31_1.time_ <= var_34_11 + arg_34_0 then
				local var_34_15 = "play"
				local var_34_16 = "voice"

				arg_31_1:AudioAction(var_34_15, var_34_16, "story_v_out_108072", "108072009", "story_v_out_108072.awb")
			end
		end
	end,
	Play108072010 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 108072010
		arg_35_1.duration_ = 13.990999999999

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play108072011(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1.var_.oldValueTypewriter = arg_35_1.fswtw_.percent

				arg_35_1:ShowNextGo(false)
			end

			local var_38_1 = 51
			local var_38_2 = 2.28
			local var_38_3 = arg_35_1:GetWordFromCfg(108072004)
			local var_38_4 = arg_35_1:FormatText(var_38_3.content)
			local var_38_5, var_38_6 = arg_35_1:GetPercentByPara(var_38_4, 6)

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0

				local var_38_7 = var_38_1 <= 0 and var_38_2 or var_38_2 * ((var_38_6 - arg_35_1.typewritterCharCountI18N) / var_38_1)

				if var_38_7 > 0 and var_38_2 < var_38_7 then
					arg_35_1.talkMaxDuration = var_38_7

					if var_38_7 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_7 + var_38_0
					end
				end
			end

			local var_38_8 = 2.28
			local var_38_9 = math.max(var_38_8, arg_35_1.talkMaxDuration)

			if var_38_0 <= arg_35_1.time_ and arg_35_1.time_ < var_38_0 + var_38_9 then
				local var_38_10 = (arg_35_1.time_ - var_38_0) / var_38_9

				arg_35_1.fswtw_.percent = Mathf.Lerp(arg_35_1.var_.oldValueTypewriter, var_38_5, var_38_10)
				arg_35_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_35_1.fswtw_:SetDirty()
			end

			if arg_35_1.time_ >= var_38_0 + var_38_9 and arg_35_1.time_ < var_38_0 + var_38_9 + arg_38_0 then
				arg_35_1.fswtw_.percent = var_38_5

				arg_35_1.fswtw_:SetDirty()
				arg_35_1:ShowNextGo(true)

				arg_35_1.typewritterCharCountI18N = var_38_6
			end

			local var_38_11 = 0
			local var_38_12 = 13.991
			local var_38_13 = manager.audio:GetVoiceLength("story_v_out_108072", "108072010", "story_v_out_108072.awb") / 1000

			if var_38_13 > 0 and var_38_12 < var_38_13 and var_38_13 + var_38_11 > arg_35_1.duration_ then
				local var_38_14 = var_38_13

				arg_35_1.duration_ = var_38_13 + var_38_11
			end

			if var_38_11 < arg_35_1.time_ and arg_35_1.time_ <= var_38_11 + arg_38_0 then
				local var_38_15 = "play"
				local var_38_16 = "voice"

				arg_35_1:AudioAction(var_38_15, var_38_16, "story_v_out_108072", "108072010", "story_v_out_108072.awb")
			end
		end
	end,
	Play108072011 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 108072011
		arg_39_1.duration_ = 7.976999999999

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play108072013(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				arg_39_1.fswbg_:SetActive(true)
				arg_39_1.dialog_:SetActive(false)

				arg_39_1.fswtw_.percent = 0

				local var_42_1 = arg_39_1:GetWordFromCfg(108072011)
				local var_42_2 = arg_39_1:FormatText(var_42_1.content)

				arg_39_1.fswt_.text = var_42_2

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.fswt_)

				arg_39_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_39_1.fswtw_:SetDirty()

				arg_39_1.typewritterCharCountI18N = 0

				arg_39_1:ShowNextGo(false)
			end

			local var_42_3 = 0.0166666666666667

			if var_42_3 < arg_39_1.time_ and arg_39_1.time_ <= var_42_3 + arg_42_0 then
				arg_39_1.var_.oldValueTypewriter = arg_39_1.fswtw_.percent

				arg_39_1:ShowNextGo(false)
			end

			local var_42_4 = 28
			local var_42_5 = 1.5
			local var_42_6 = arg_39_1:GetWordFromCfg(108072011)
			local var_42_7 = arg_39_1:FormatText(var_42_6.content)
			local var_42_8, var_42_9 = arg_39_1:GetPercentByPara(var_42_7, 1)

			if var_42_3 < arg_39_1.time_ and arg_39_1.time_ <= var_42_3 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0

				local var_42_10 = var_42_4 <= 0 and var_42_5 or var_42_5 * ((var_42_9 - arg_39_1.typewritterCharCountI18N) / var_42_4)

				if var_42_10 > 0 and var_42_5 < var_42_10 then
					arg_39_1.talkMaxDuration = var_42_10

					if var_42_10 + var_42_3 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_10 + var_42_3
					end
				end
			end

			local var_42_11 = 1.5
			local var_42_12 = math.max(var_42_11, arg_39_1.talkMaxDuration)

			if var_42_3 <= arg_39_1.time_ and arg_39_1.time_ < var_42_3 + var_42_12 then
				local var_42_13 = (arg_39_1.time_ - var_42_3) / var_42_12

				arg_39_1.fswtw_.percent = Mathf.Lerp(arg_39_1.var_.oldValueTypewriter, var_42_8, var_42_13)
				arg_39_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_39_1.fswtw_:SetDirty()
			end

			if arg_39_1.time_ >= var_42_3 + var_42_12 and arg_39_1.time_ < var_42_3 + var_42_12 + arg_42_0 then
				arg_39_1.fswtw_.percent = var_42_8

				arg_39_1.fswtw_:SetDirty()
				arg_39_1:ShowNextGo(true)

				arg_39_1.typewritterCharCountI18N = var_42_9
			end

			local var_42_14 = 0
			local var_42_15 = 7.977
			local var_42_16 = manager.audio:GetVoiceLength("story_v_out_108072", "108072011", "story_v_out_108072.awb") / 1000

			if var_42_16 > 0 and var_42_15 < var_42_16 and var_42_16 + var_42_14 > arg_39_1.duration_ then
				local var_42_17 = var_42_16

				arg_39_1.duration_ = var_42_16 + var_42_14
			end

			if var_42_14 < arg_39_1.time_ and arg_39_1.time_ <= var_42_14 + arg_42_0 then
				local var_42_18 = "play"
				local var_42_19 = "voice"

				arg_39_1:AudioAction(var_42_18, var_42_19, "story_v_out_108072", "108072011", "story_v_out_108072.awb")
			end
		end
	end,
	Play108072013 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 108072013
		arg_43_1.duration_ = 14.424999999999

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play108072014(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1.var_.oldValueTypewriter = arg_43_1.fswtw_.percent

				arg_43_1:ShowNextGo(false)
			end

			local var_46_1 = 40
			local var_46_2 = 2.22
			local var_46_3 = arg_43_1:GetWordFromCfg(108072011)
			local var_46_4 = arg_43_1:FormatText(var_46_3.content)
			local var_46_5, var_46_6 = arg_43_1:GetPercentByPara(var_46_4, 2)

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0

				local var_46_7 = var_46_1 <= 0 and var_46_2 or var_46_2 * ((var_46_6 - arg_43_1.typewritterCharCountI18N) / var_46_1)

				if var_46_7 > 0 and var_46_2 < var_46_7 then
					arg_43_1.talkMaxDuration = var_46_7

					if var_46_7 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_7 + var_46_0
					end
				end
			end

			local var_46_8 = 2.22
			local var_46_9 = math.max(var_46_8, arg_43_1.talkMaxDuration)

			if var_46_0 <= arg_43_1.time_ and arg_43_1.time_ < var_46_0 + var_46_9 then
				local var_46_10 = (arg_43_1.time_ - var_46_0) / var_46_9

				arg_43_1.fswtw_.percent = Mathf.Lerp(arg_43_1.var_.oldValueTypewriter, var_46_5, var_46_10)
				arg_43_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_43_1.fswtw_:SetDirty()
			end

			if arg_43_1.time_ >= var_46_0 + var_46_9 and arg_43_1.time_ < var_46_0 + var_46_9 + arg_46_0 then
				arg_43_1.fswtw_.percent = var_46_5

				arg_43_1.fswtw_:SetDirty()
				arg_43_1:ShowNextGo(true)

				arg_43_1.typewritterCharCountI18N = var_46_6
			end

			local var_46_11 = 0
			local var_46_12 = 14.425
			local var_46_13 = manager.audio:GetVoiceLength("story_v_out_108072", "108072013", "story_v_out_108072.awb") / 1000

			if var_46_13 > 0 and var_46_12 < var_46_13 and var_46_13 + var_46_11 > arg_43_1.duration_ then
				local var_46_14 = var_46_13

				arg_43_1.duration_ = var_46_13 + var_46_11
			end

			if var_46_11 < arg_43_1.time_ and arg_43_1.time_ <= var_46_11 + arg_46_0 then
				local var_46_15 = "play"
				local var_46_16 = "voice"

				arg_43_1:AudioAction(var_46_15, var_46_16, "story_v_out_108072", "108072013", "story_v_out_108072.awb")
			end
		end
	end,
	Play108072014 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 108072014
		arg_47_1.duration_ = 5.559999999999

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play108072015(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				arg_47_1.var_.oldValueTypewriter = arg_47_1.fswtw_.percent

				arg_47_1:ShowNextGo(false)
			end

			local var_50_1 = 20
			local var_50_2 = 1.08
			local var_50_3 = arg_47_1:GetWordFromCfg(108072011)
			local var_50_4 = arg_47_1:FormatText(var_50_3.content)
			local var_50_5, var_50_6 = arg_47_1:GetPercentByPara(var_50_4, 3)

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0

				local var_50_7 = var_50_1 <= 0 and var_50_2 or var_50_2 * ((var_50_6 - arg_47_1.typewritterCharCountI18N) / var_50_1)

				if var_50_7 > 0 and var_50_2 < var_50_7 then
					arg_47_1.talkMaxDuration = var_50_7

					if var_50_7 + var_50_0 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_7 + var_50_0
					end
				end
			end

			local var_50_8 = 1.08
			local var_50_9 = math.max(var_50_8, arg_47_1.talkMaxDuration)

			if var_50_0 <= arg_47_1.time_ and arg_47_1.time_ < var_50_0 + var_50_9 then
				local var_50_10 = (arg_47_1.time_ - var_50_0) / var_50_9

				arg_47_1.fswtw_.percent = Mathf.Lerp(arg_47_1.var_.oldValueTypewriter, var_50_5, var_50_10)
				arg_47_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_47_1.fswtw_:SetDirty()
			end

			if arg_47_1.time_ >= var_50_0 + var_50_9 and arg_47_1.time_ < var_50_0 + var_50_9 + arg_50_0 then
				arg_47_1.fswtw_.percent = var_50_5

				arg_47_1.fswtw_:SetDirty()
				arg_47_1:ShowNextGo(true)

				arg_47_1.typewritterCharCountI18N = var_50_6
			end

			local var_50_11 = 0
			local var_50_12 = 5.56
			local var_50_13 = manager.audio:GetVoiceLength("story_v_out_108072", "108072014", "story_v_out_108072.awb") / 1000

			if var_50_13 > 0 and var_50_12 < var_50_13 and var_50_13 + var_50_11 > arg_47_1.duration_ then
				local var_50_14 = var_50_13

				arg_47_1.duration_ = var_50_13 + var_50_11
			end

			if var_50_11 < arg_47_1.time_ and arg_47_1.time_ <= var_50_11 + arg_50_0 then
				local var_50_15 = "play"
				local var_50_16 = "voice"

				arg_47_1:AudioAction(var_50_15, var_50_16, "story_v_out_108072", "108072014", "story_v_out_108072.awb")
			end
		end
	end,
	Play108072015 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 108072015
		arg_51_1.duration_ = 10.189999999999

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play108072017(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1.var_.oldValueTypewriter = arg_51_1.fswtw_.percent

				arg_51_1:ShowNextGo(false)
			end

			local var_54_1 = 30
			local var_54_2 = 1.68
			local var_54_3 = arg_51_1:GetWordFromCfg(108072011)
			local var_54_4 = arg_51_1:FormatText(var_54_3.content)
			local var_54_5, var_54_6 = arg_51_1:GetPercentByPara(var_54_4, 4)

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0

				local var_54_7 = var_54_1 <= 0 and var_54_2 or var_54_2 * ((var_54_6 - arg_51_1.typewritterCharCountI18N) / var_54_1)

				if var_54_7 > 0 and var_54_2 < var_54_7 then
					arg_51_1.talkMaxDuration = var_54_7

					if var_54_7 + var_54_0 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_7 + var_54_0
					end
				end
			end

			local var_54_8 = 1.68
			local var_54_9 = math.max(var_54_8, arg_51_1.talkMaxDuration)

			if var_54_0 <= arg_51_1.time_ and arg_51_1.time_ < var_54_0 + var_54_9 then
				local var_54_10 = (arg_51_1.time_ - var_54_0) / var_54_9

				arg_51_1.fswtw_.percent = Mathf.Lerp(arg_51_1.var_.oldValueTypewriter, var_54_5, var_54_10)
				arg_51_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_51_1.fswtw_:SetDirty()
			end

			if arg_51_1.time_ >= var_54_0 + var_54_9 and arg_51_1.time_ < var_54_0 + var_54_9 + arg_54_0 then
				arg_51_1.fswtw_.percent = var_54_5

				arg_51_1.fswtw_:SetDirty()
				arg_51_1:ShowNextGo(true)

				arg_51_1.typewritterCharCountI18N = var_54_6
			end

			local var_54_11 = 0
			local var_54_12 = 10.19
			local var_54_13 = manager.audio:GetVoiceLength("story_v_out_108072", "108072015", "story_v_out_108072.awb") / 1000

			if var_54_13 > 0 and var_54_12 < var_54_13 and var_54_13 + var_54_11 > arg_51_1.duration_ then
				local var_54_14 = var_54_13

				arg_51_1.duration_ = var_54_13 + var_54_11
			end

			if var_54_11 < arg_51_1.time_ and arg_51_1.time_ <= var_54_11 + arg_54_0 then
				local var_54_15 = "play"
				local var_54_16 = "voice"

				arg_51_1:AudioAction(var_54_15, var_54_16, "story_v_out_108072", "108072015", "story_v_out_108072.awb")
			end
		end
	end,
	Play108072017 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 108072017
		arg_55_1.duration_ = 12.866

		local var_55_0 = {
			ja = 11.266,
			ko = 8.633,
			zh = 9.766,
			en = 12.866
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
				arg_55_0:Play108072018(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 2

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				local var_58_1 = manager.ui.mainCamera.transform.localPosition
				local var_58_2 = Vector3.New(0, 0, 10) + Vector3.New(var_58_1.x, var_58_1.y, 0)
				local var_58_3 = arg_55_1.bgs_.S0804

				var_58_3.transform.localPosition = var_58_2
				var_58_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_58_4 = var_58_3:GetComponent("SpriteRenderer")

				if var_58_4 and var_58_4.sprite then
					local var_58_5 = (var_58_3.transform.localPosition - var_58_1).z
					local var_58_6 = manager.ui.mainCameraCom_
					local var_58_7 = 2 * var_58_5 * Mathf.Tan(var_58_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_58_8 = var_58_7 * var_58_6.aspect
					local var_58_9 = var_58_4.sprite.bounds.size.x
					local var_58_10 = var_58_4.sprite.bounds.size.y
					local var_58_11 = var_58_8 / var_58_9
					local var_58_12 = var_58_7 / var_58_10
					local var_58_13 = var_58_12 < var_58_11 and var_58_11 or var_58_12

					var_58_3.transform.localScale = Vector3.New(var_58_13, var_58_13, 0)
				end

				for iter_58_0, iter_58_1 in pairs(arg_55_1.bgs_) do
					if iter_58_0 ~= "S0804" then
						iter_58_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_58_14 = 0

			if var_58_14 < arg_55_1.time_ and arg_55_1.time_ <= var_58_14 + arg_58_0 then
				arg_55_1.fswbg_:SetActive(false)
				arg_55_1.dialog_:SetActive(true)
				arg_55_1:ShowNextGo(false)
			end

			local var_58_15 = 0

			if var_58_15 < arg_55_1.time_ and arg_55_1.time_ <= var_58_15 + arg_58_0 then
				arg_55_1.mask_.enabled = true
				arg_55_1.mask_.raycastTarget = true

				arg_55_1:SetGaussion(false)
			end

			local var_58_16 = 2

			if var_58_15 <= arg_55_1.time_ and arg_55_1.time_ < var_58_15 + var_58_16 then
				local var_58_17 = (arg_55_1.time_ - var_58_15) / var_58_16
				local var_58_18 = Color.New(0, 0, 0)

				var_58_18.a = Mathf.Lerp(0, 1, var_58_17)
				arg_55_1.mask_.color = var_58_18
			end

			if arg_55_1.time_ >= var_58_15 + var_58_16 and arg_55_1.time_ < var_58_15 + var_58_16 + arg_58_0 then
				local var_58_19 = Color.New(0, 0, 0)

				var_58_19.a = 1
				arg_55_1.mask_.color = var_58_19
			end

			local var_58_20 = 2

			if var_58_20 < arg_55_1.time_ and arg_55_1.time_ <= var_58_20 + arg_58_0 then
				arg_55_1.mask_.enabled = true
				arg_55_1.mask_.raycastTarget = true

				arg_55_1:SetGaussion(false)
			end

			local var_58_21 = 2

			if var_58_20 <= arg_55_1.time_ and arg_55_1.time_ < var_58_20 + var_58_21 then
				local var_58_22 = (arg_55_1.time_ - var_58_20) / var_58_21
				local var_58_23 = Color.New(0, 0, 0)

				var_58_23.a = Mathf.Lerp(1, 0, var_58_22)
				arg_55_1.mask_.color = var_58_23
			end

			if arg_55_1.time_ >= var_58_20 + var_58_21 and arg_55_1.time_ < var_58_20 + var_58_21 + arg_58_0 then
				local var_58_24 = Color.New(0, 0, 0)
				local var_58_25 = 0

				arg_55_1.mask_.enabled = false
				var_58_24.a = var_58_25
				arg_55_1.mask_.color = var_58_24
			end

			if arg_55_1.frameCnt_ <= 1 then
				arg_55_1.dialog_:SetActive(false)
			end

			local var_58_26 = 4
			local var_58_27 = 0.225

			if var_58_26 < arg_55_1.time_ and arg_55_1.time_ <= var_58_26 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0

				arg_55_1.dialog_:SetActive(true)

				local var_58_28 = LeanTween.value(arg_55_1.dialog_, 0, 1, 0.3)

				var_58_28:setOnUpdate(LuaHelper.FloatAction(function(arg_59_0)
					arg_55_1.dialogCg_.alpha = arg_59_0
				end))
				var_58_28:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_55_1.dialog_)
					var_58_28:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_55_1.duration_ = arg_55_1.duration_ + 0.3

				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_29 = arg_55_1:FormatText(StoryNameCfg[96].name)

				arg_55_1.leftNameTxt_.text = var_58_29

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_30 = arg_55_1:GetWordFromCfg(108072017)
				local var_58_31 = arg_55_1:FormatText(var_58_30.content)

				arg_55_1.text_.text = var_58_31

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_32 = 9
				local var_58_33 = utf8.len(var_58_31)
				local var_58_34 = var_58_32 <= 0 and var_58_27 or var_58_27 * (var_58_33 / var_58_32)

				if var_58_34 > 0 and var_58_27 < var_58_34 then
					arg_55_1.talkMaxDuration = var_58_34
					var_58_26 = var_58_26 + 0.3

					if var_58_34 + var_58_26 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_34 + var_58_26
					end
				end

				arg_55_1.text_.text = var_58_31
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_108072", "108072017", "story_v_out_108072.awb") ~= 0 then
					local var_58_35 = manager.audio:GetVoiceLength("story_v_out_108072", "108072017", "story_v_out_108072.awb") / 1000

					if var_58_35 + var_58_26 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_35 + var_58_26
					end

					if var_58_30.prefab_name ~= "" and arg_55_1.actors_[var_58_30.prefab_name] ~= nil then
						local var_58_36 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_30.prefab_name].transform, "story_v_out_108072", "108072017", "story_v_out_108072.awb")

						arg_55_1:RecordAudio("108072017", var_58_36)
						arg_55_1:RecordAudio("108072017", var_58_36)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_108072", "108072017", "story_v_out_108072.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_108072", "108072017", "story_v_out_108072.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_37 = var_58_26 + 0.3
			local var_58_38 = math.max(var_58_27, arg_55_1.talkMaxDuration)

			if var_58_37 <= arg_55_1.time_ and arg_55_1.time_ < var_58_37 + var_58_38 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_37) / var_58_38

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_37 + var_58_38 and arg_55_1.time_ < var_58_37 + var_58_38 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play108072018 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 108072018
		arg_61_1.duration_ = 10.066

		local var_61_0 = {
			ja = 10.066,
			ko = 6.8,
			zh = 6.5,
			en = 7.6
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
				arg_61_0:Play108072019(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = 0
			local var_64_1 = 0.65

			if var_64_0 < arg_61_1.time_ and arg_61_1.time_ <= var_64_0 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_2 = arg_61_1:FormatText(StoryNameCfg[96].name)

				arg_61_1.leftNameTxt_.text = var_64_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_3 = arg_61_1:GetWordFromCfg(108072018)
				local var_64_4 = arg_61_1:FormatText(var_64_3.content)

				arg_61_1.text_.text = var_64_4

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_5 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_108072", "108072018", "story_v_out_108072.awb") ~= 0 then
					local var_64_8 = manager.audio:GetVoiceLength("story_v_out_108072", "108072018", "story_v_out_108072.awb") / 1000

					if var_64_8 + var_64_0 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_8 + var_64_0
					end

					if var_64_3.prefab_name ~= "" and arg_61_1.actors_[var_64_3.prefab_name] ~= nil then
						local var_64_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_3.prefab_name].transform, "story_v_out_108072", "108072018", "story_v_out_108072.awb")

						arg_61_1:RecordAudio("108072018", var_64_9)
						arg_61_1:RecordAudio("108072018", var_64_9)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_108072", "108072018", "story_v_out_108072.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_108072", "108072018", "story_v_out_108072.awb")
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
	Play108072019 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 108072019
		arg_65_1.duration_ = 6.333

		local var_65_0 = {
			ja = 5,
			ko = 5.5,
			zh = 6.333,
			en = 6.2
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
				arg_65_0:Play108072020(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = 0
			local var_68_1 = 0.55

			if var_68_0 < arg_65_1.time_ and arg_65_1.time_ <= var_68_0 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_2 = arg_65_1:FormatText(StoryNameCfg[74].name)

				arg_65_1.leftNameTxt_.text = var_68_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, true)
				arg_65_1.iconController_:SetSelectedState("hero")

				arg_65_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1050")

				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_3 = arg_65_1:GetWordFromCfg(108072019)
				local var_68_4 = arg_65_1:FormatText(var_68_3.content)

				arg_65_1.text_.text = var_68_4

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_5 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_108072", "108072019", "story_v_out_108072.awb") ~= 0 then
					local var_68_8 = manager.audio:GetVoiceLength("story_v_out_108072", "108072019", "story_v_out_108072.awb") / 1000

					if var_68_8 + var_68_0 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_8 + var_68_0
					end

					if var_68_3.prefab_name ~= "" and arg_65_1.actors_[var_68_3.prefab_name] ~= nil then
						local var_68_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_3.prefab_name].transform, "story_v_out_108072", "108072019", "story_v_out_108072.awb")

						arg_65_1:RecordAudio("108072019", var_68_9)
						arg_65_1:RecordAudio("108072019", var_68_9)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_108072", "108072019", "story_v_out_108072.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_108072", "108072019", "story_v_out_108072.awb")
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
	Play108072020 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 108072020
		arg_69_1.duration_ = 3.366

		local var_69_0 = {
			ja = 2.9,
			ko = 2.9,
			zh = 3.2,
			en = 3.366
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
				arg_69_0:Play108072021(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = 0
			local var_72_1 = 0.25

			if var_72_0 < arg_69_1.time_ and arg_69_1.time_ <= var_72_0 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_2 = arg_69_1:FormatText(StoryNameCfg[84].name)

				arg_69_1.leftNameTxt_.text = var_72_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, true)
				arg_69_1.iconController_:SetSelectedState("hero")

				arg_69_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1099")

				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_3 = arg_69_1:GetWordFromCfg(108072020)
				local var_72_4 = arg_69_1:FormatText(var_72_3.content)

				arg_69_1.text_.text = var_72_4

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_5 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_108072", "108072020", "story_v_out_108072.awb") ~= 0 then
					local var_72_8 = manager.audio:GetVoiceLength("story_v_out_108072", "108072020", "story_v_out_108072.awb") / 1000

					if var_72_8 + var_72_0 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_8 + var_72_0
					end

					if var_72_3.prefab_name ~= "" and arg_69_1.actors_[var_72_3.prefab_name] ~= nil then
						local var_72_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_3.prefab_name].transform, "story_v_out_108072", "108072020", "story_v_out_108072.awb")

						arg_69_1:RecordAudio("108072020", var_72_9)
						arg_69_1:RecordAudio("108072020", var_72_9)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_108072", "108072020", "story_v_out_108072.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_108072", "108072020", "story_v_out_108072.awb")
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
	Play108072021 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 108072021
		arg_73_1.duration_ = 9.8

		local var_73_0 = {
			ja = 8.866,
			ko = 6.5,
			zh = 9.8,
			en = 7
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
				arg_73_0:Play108072022(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = 0
			local var_76_1 = 0.675

			if var_76_0 < arg_73_1.time_ and arg_73_1.time_ <= var_76_0 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_2 = arg_73_1:FormatText(StoryNameCfg[96].name)

				arg_73_1.leftNameTxt_.text = var_76_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_3 = arg_73_1:GetWordFromCfg(108072021)
				local var_76_4 = arg_73_1:FormatText(var_76_3.content)

				arg_73_1.text_.text = var_76_4

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_5 = 27
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

				if manager.audio:GetVoiceLength("story_v_out_108072", "108072021", "story_v_out_108072.awb") ~= 0 then
					local var_76_8 = manager.audio:GetVoiceLength("story_v_out_108072", "108072021", "story_v_out_108072.awb") / 1000

					if var_76_8 + var_76_0 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_8 + var_76_0
					end

					if var_76_3.prefab_name ~= "" and arg_73_1.actors_[var_76_3.prefab_name] ~= nil then
						local var_76_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_3.prefab_name].transform, "story_v_out_108072", "108072021", "story_v_out_108072.awb")

						arg_73_1:RecordAudio("108072021", var_76_9)
						arg_73_1:RecordAudio("108072021", var_76_9)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_108072", "108072021", "story_v_out_108072.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_108072", "108072021", "story_v_out_108072.awb")
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
	Play108072022 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 108072022
		arg_77_1.duration_ = 19.3

		local var_77_0 = {
			ja = 19.3,
			ko = 10.333,
			zh = 15.9,
			en = 12.666
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
				arg_77_0:Play108072023(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = 0
			local var_80_1 = 1.075

			if var_80_0 < arg_77_1.time_ and arg_77_1.time_ <= var_80_0 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_2 = arg_77_1:FormatText(StoryNameCfg[96].name)

				arg_77_1.leftNameTxt_.text = var_80_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_3 = arg_77_1:GetWordFromCfg(108072022)
				local var_80_4 = arg_77_1:FormatText(var_80_3.content)

				arg_77_1.text_.text = var_80_4

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_5 = 39
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

				if manager.audio:GetVoiceLength("story_v_out_108072", "108072022", "story_v_out_108072.awb") ~= 0 then
					local var_80_8 = manager.audio:GetVoiceLength("story_v_out_108072", "108072022", "story_v_out_108072.awb") / 1000

					if var_80_8 + var_80_0 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_8 + var_80_0
					end

					if var_80_3.prefab_name ~= "" and arg_77_1.actors_[var_80_3.prefab_name] ~= nil then
						local var_80_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_3.prefab_name].transform, "story_v_out_108072", "108072022", "story_v_out_108072.awb")

						arg_77_1:RecordAudio("108072022", var_80_9)
						arg_77_1:RecordAudio("108072022", var_80_9)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_108072", "108072022", "story_v_out_108072.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_108072", "108072022", "story_v_out_108072.awb")
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
	Play108072023 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 108072023
		arg_81_1.duration_ = 8.733

		local var_81_0 = {
			ja = 8.2,
			ko = 7.4,
			zh = 7.7,
			en = 8.733
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
				arg_81_0:Play108072024(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = 0
			local var_84_1 = 0.3

			if var_84_0 < arg_81_1.time_ and arg_81_1.time_ <= var_84_0 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_2 = arg_81_1:FormatText(StoryNameCfg[96].name)

				arg_81_1.leftNameTxt_.text = var_84_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_3 = arg_81_1:GetWordFromCfg(108072023)
				local var_84_4 = arg_81_1:FormatText(var_84_3.content)

				arg_81_1.text_.text = var_84_4

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_5 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_108072", "108072023", "story_v_out_108072.awb") ~= 0 then
					local var_84_8 = manager.audio:GetVoiceLength("story_v_out_108072", "108072023", "story_v_out_108072.awb") / 1000

					if var_84_8 + var_84_0 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_8 + var_84_0
					end

					if var_84_3.prefab_name ~= "" and arg_81_1.actors_[var_84_3.prefab_name] ~= nil then
						local var_84_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_3.prefab_name].transform, "story_v_out_108072", "108072023", "story_v_out_108072.awb")

						arg_81_1:RecordAudio("108072023", var_84_9)
						arg_81_1:RecordAudio("108072023", var_84_9)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_108072", "108072023", "story_v_out_108072.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_108072", "108072023", "story_v_out_108072.awb")
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
	Play108072024 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 108072024
		arg_85_1.duration_ = 13.4

		local var_85_0 = {
			ja = 13.4,
			ko = 9.866,
			zh = 11.233,
			en = 8.6
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
				arg_85_0:Play108072025(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 0
			local var_88_1 = 0.425

			if var_88_0 < arg_85_1.time_ and arg_85_1.time_ <= var_88_0 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_2 = arg_85_1:FormatText(StoryNameCfg[96].name)

				arg_85_1.leftNameTxt_.text = var_88_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_3 = arg_85_1:GetWordFromCfg(108072024)
				local var_88_4 = arg_85_1:FormatText(var_88_3.content)

				arg_85_1.text_.text = var_88_4

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_5 = 17
				local var_88_6 = utf8.len(var_88_4)
				local var_88_7 = var_88_5 <= 0 and var_88_1 or var_88_1 * (var_88_6 / var_88_5)

				if var_88_7 > 0 and var_88_1 < var_88_7 then
					arg_85_1.talkMaxDuration = var_88_7

					if var_88_7 + var_88_0 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_7 + var_88_0
					end
				end

				arg_85_1.text_.text = var_88_4
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_108072", "108072024", "story_v_out_108072.awb") ~= 0 then
					local var_88_8 = manager.audio:GetVoiceLength("story_v_out_108072", "108072024", "story_v_out_108072.awb") / 1000

					if var_88_8 + var_88_0 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_8 + var_88_0
					end

					if var_88_3.prefab_name ~= "" and arg_85_1.actors_[var_88_3.prefab_name] ~= nil then
						local var_88_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_3.prefab_name].transform, "story_v_out_108072", "108072024", "story_v_out_108072.awb")

						arg_85_1:RecordAudio("108072024", var_88_9)
						arg_85_1:RecordAudio("108072024", var_88_9)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_108072", "108072024", "story_v_out_108072.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_108072", "108072024", "story_v_out_108072.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_10 = math.max(var_88_1, arg_85_1.talkMaxDuration)

			if var_88_0 <= arg_85_1.time_ and arg_85_1.time_ < var_88_0 + var_88_10 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_0) / var_88_10

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_0 + var_88_10 and arg_85_1.time_ < var_88_0 + var_88_10 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play108072025 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 108072025
		arg_89_1.duration_ = 2.866

		local var_89_0 = {
			ja = 1.333,
			ko = 2.866,
			zh = 1.4,
			en = 1.5
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
				arg_89_0:Play108072026(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = 0
			local var_92_1 = 0.05

			if var_92_0 < arg_89_1.time_ and arg_89_1.time_ <= var_92_0 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_2 = arg_89_1:FormatText(StoryNameCfg[96].name)

				arg_89_1.leftNameTxt_.text = var_92_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_3 = arg_89_1:GetWordFromCfg(108072025)
				local var_92_4 = arg_89_1:FormatText(var_92_3.content)

				arg_89_1.text_.text = var_92_4

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_5 = 2
				local var_92_6 = utf8.len(var_92_4)
				local var_92_7 = var_92_5 <= 0 and var_92_1 or var_92_1 * (var_92_6 / var_92_5)

				if var_92_7 > 0 and var_92_1 < var_92_7 then
					arg_89_1.talkMaxDuration = var_92_7

					if var_92_7 + var_92_0 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_7 + var_92_0
					end
				end

				arg_89_1.text_.text = var_92_4
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_108072", "108072025", "story_v_out_108072.awb") ~= 0 then
					local var_92_8 = manager.audio:GetVoiceLength("story_v_out_108072", "108072025", "story_v_out_108072.awb") / 1000

					if var_92_8 + var_92_0 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_8 + var_92_0
					end

					if var_92_3.prefab_name ~= "" and arg_89_1.actors_[var_92_3.prefab_name] ~= nil then
						local var_92_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_3.prefab_name].transform, "story_v_out_108072", "108072025", "story_v_out_108072.awb")

						arg_89_1:RecordAudio("108072025", var_92_9)
						arg_89_1:RecordAudio("108072025", var_92_9)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_108072", "108072025", "story_v_out_108072.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_108072", "108072025", "story_v_out_108072.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_10 = math.max(var_92_1, arg_89_1.talkMaxDuration)

			if var_92_0 <= arg_89_1.time_ and arg_89_1.time_ < var_92_0 + var_92_10 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_0) / var_92_10

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_0 + var_92_10 and arg_89_1.time_ < var_92_0 + var_92_10 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play108072026 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 108072026
		arg_93_1.duration_ = 5

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play108072027(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = 0
			local var_96_1 = 0.25

			if var_96_0 < arg_93_1.time_ and arg_93_1.time_ <= var_96_0 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, false)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_2 = arg_93_1:GetWordFromCfg(108072026)
				local var_96_3 = arg_93_1:FormatText(var_96_2.content)

				arg_93_1.text_.text = var_96_3

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_4 = 10
				local var_96_5 = utf8.len(var_96_3)
				local var_96_6 = var_96_4 <= 0 and var_96_1 or var_96_1 * (var_96_5 / var_96_4)

				if var_96_6 > 0 and var_96_1 < var_96_6 then
					arg_93_1.talkMaxDuration = var_96_6

					if var_96_6 + var_96_0 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_6 + var_96_0
					end
				end

				arg_93_1.text_.text = var_96_3
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)
				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_7 = math.max(var_96_1, arg_93_1.talkMaxDuration)

			if var_96_0 <= arg_93_1.time_ and arg_93_1.time_ < var_96_0 + var_96_7 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_0) / var_96_7

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_0 + var_96_7 and arg_93_1.time_ < var_96_0 + var_96_7 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play108072027 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 108072027
		arg_97_1.duration_ = 6.5

		SetActive(arg_97_1.tipsGo_, false)

		function arg_97_1.onSingleLineFinish_()
			arg_97_1.onSingleLineUpdate_ = nil
			arg_97_1.onSingleLineFinish_ = nil
			arg_97_1.state_ = "waiting"
		end

		function arg_97_1.playNext_(arg_99_0)
			if arg_99_0 == 1 then
				arg_97_0:Play108072028(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = "C04"

			if arg_97_1.bgs_[var_100_0] == nil then
				local var_100_1 = Object.Instantiate(arg_97_1.paintGo_)

				var_100_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_100_0)
				var_100_1.name = var_100_0
				var_100_1.transform.parent = arg_97_1.stage_.transform
				var_100_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_97_1.bgs_[var_100_0] = var_100_1
			end

			local var_100_2 = 1.5

			if var_100_2 < arg_97_1.time_ and arg_97_1.time_ <= var_100_2 + arg_100_0 then
				local var_100_3 = manager.ui.mainCamera.transform.localPosition
				local var_100_4 = Vector3.New(0, 0, 10) + Vector3.New(var_100_3.x, var_100_3.y, 0)
				local var_100_5 = arg_97_1.bgs_.C04

				var_100_5.transform.localPosition = var_100_4
				var_100_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_100_6 = var_100_5:GetComponent("SpriteRenderer")

				if var_100_6 and var_100_6.sprite then
					local var_100_7 = (var_100_5.transform.localPosition - var_100_3).z
					local var_100_8 = manager.ui.mainCameraCom_
					local var_100_9 = 2 * var_100_7 * Mathf.Tan(var_100_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_100_10 = var_100_9 * var_100_8.aspect
					local var_100_11 = var_100_6.sprite.bounds.size.x
					local var_100_12 = var_100_6.sprite.bounds.size.y
					local var_100_13 = var_100_10 / var_100_11
					local var_100_14 = var_100_9 / var_100_12
					local var_100_15 = var_100_14 < var_100_13 and var_100_13 or var_100_14

					var_100_5.transform.localScale = Vector3.New(var_100_15, var_100_15, 0)
				end

				for iter_100_0, iter_100_1 in pairs(arg_97_1.bgs_) do
					if iter_100_0 ~= "C04" then
						iter_100_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_100_16 = arg_97_1.bgs_.S0804
			local var_100_17 = 0

			if var_100_17 < arg_97_1.time_ and arg_97_1.time_ <= var_100_17 + arg_100_0 then
				local var_100_18 = var_100_16:GetComponent("SpriteRenderer")

				if var_100_18 then
					var_100_18.material = arg_97_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_100_19 = var_100_18.material
					local var_100_20 = var_100_19:GetColor("_Color")

					arg_97_1.var_.alphaOldValueS0804 = var_100_20.a
					arg_97_1.var_.alphaMatValueS0804 = var_100_19
				end

				arg_97_1.var_.alphaOldValueS0804 = 1
			end

			local var_100_21 = 1.5

			if var_100_17 <= arg_97_1.time_ and arg_97_1.time_ < var_100_17 + var_100_21 then
				local var_100_22 = (arg_97_1.time_ - var_100_17) / var_100_21
				local var_100_23 = Mathf.Lerp(arg_97_1.var_.alphaOldValueS0804, 0, var_100_22)

				if arg_97_1.var_.alphaMatValueS0804 then
					local var_100_24 = arg_97_1.var_.alphaMatValueS0804
					local var_100_25 = var_100_24:GetColor("_Color")

					var_100_25.a = var_100_23

					var_100_24:SetColor("_Color", var_100_25)
				end
			end

			if arg_97_1.time_ >= var_100_17 + var_100_21 and arg_97_1.time_ < var_100_17 + var_100_21 + arg_100_0 and arg_97_1.var_.alphaMatValueS0804 then
				local var_100_26 = arg_97_1.var_.alphaMatValueS0804
				local var_100_27 = var_100_26:GetColor("_Color")

				var_100_27.a = 0

				var_100_26:SetColor("_Color", var_100_27)
			end

			local var_100_28 = arg_97_1.bgs_.C04
			local var_100_29 = 1.5

			if var_100_29 < arg_97_1.time_ and arg_97_1.time_ <= var_100_29 + arg_100_0 then
				local var_100_30 = var_100_28:GetComponent("SpriteRenderer")

				if var_100_30 then
					var_100_30.material = arg_97_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_100_31 = var_100_30.material
					local var_100_32 = var_100_31:GetColor("_Color")

					arg_97_1.var_.alphaOldValueC04 = var_100_32.a
					arg_97_1.var_.alphaMatValueC04 = var_100_31
				end

				arg_97_1.var_.alphaOldValueC04 = 0
			end

			local var_100_33 = 1.5

			if var_100_29 <= arg_97_1.time_ and arg_97_1.time_ < var_100_29 + var_100_33 then
				local var_100_34 = (arg_97_1.time_ - var_100_29) / var_100_33
				local var_100_35 = Mathf.Lerp(arg_97_1.var_.alphaOldValueC04, 1, var_100_34)

				if arg_97_1.var_.alphaMatValueC04 then
					local var_100_36 = arg_97_1.var_.alphaMatValueC04
					local var_100_37 = var_100_36:GetColor("_Color")

					var_100_37.a = var_100_35

					var_100_36:SetColor("_Color", var_100_37)
				end
			end

			if arg_97_1.time_ >= var_100_29 + var_100_33 and arg_97_1.time_ < var_100_29 + var_100_33 + arg_100_0 and arg_97_1.var_.alphaMatValueC04 then
				local var_100_38 = arg_97_1.var_.alphaMatValueC04
				local var_100_39 = var_100_38:GetColor("_Color")

				var_100_39.a = 1

				var_100_38:SetColor("_Color", var_100_39)
			end

			local var_100_40 = 0

			if var_100_40 < arg_97_1.time_ and arg_97_1.time_ <= var_100_40 + arg_100_0 then
				arg_97_1.allBtn_.enabled = false
			end

			local var_100_41 = 1.5

			if arg_97_1.time_ >= var_100_40 + var_100_41 and arg_97_1.time_ < var_100_40 + var_100_41 + arg_100_0 then
				arg_97_1.allBtn_.enabled = true
			end

			local var_100_42 = 1.5
			local var_100_43 = 0.65

			if var_100_42 < arg_97_1.time_ and arg_97_1.time_ <= var_100_42 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, false)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_44 = arg_97_1:GetWordFromCfg(108072027)
				local var_100_45 = arg_97_1:FormatText(var_100_44.content)

				arg_97_1.text_.text = var_100_45

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_46 = 26
				local var_100_47 = utf8.len(var_100_45)
				local var_100_48 = var_100_46 <= 0 and var_100_43 or var_100_43 * (var_100_47 / var_100_46)

				if var_100_48 > 0 and var_100_43 < var_100_48 then
					arg_97_1.talkMaxDuration = var_100_48

					if var_100_48 + var_100_42 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_48 + var_100_42
					end
				end

				arg_97_1.text_.text = var_100_45
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)
				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_49 = math.max(var_100_43, arg_97_1.talkMaxDuration)

			if var_100_42 <= arg_97_1.time_ and arg_97_1.time_ < var_100_42 + var_100_49 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_42) / var_100_49

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_42 + var_100_49 and arg_97_1.time_ < var_100_42 + var_100_49 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play108072028 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 108072028
		arg_101_1.duration_ = 5

		SetActive(arg_101_1.tipsGo_, false)

		function arg_101_1.onSingleLineFinish_()
			arg_101_1.onSingleLineUpdate_ = nil
			arg_101_1.onSingleLineFinish_ = nil
			arg_101_1.state_ = "waiting"
		end

		function arg_101_1.playNext_(arg_103_0)
			if arg_103_0 == 1 then
				arg_101_0:Play108072029(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = 0
			local var_104_1 = 0.675

			if var_104_0 < arg_101_1.time_ and arg_101_1.time_ <= var_104_0 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, false)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_2 = arg_101_1:GetWordFromCfg(108072028)
				local var_104_3 = arg_101_1:FormatText(var_104_2.content)

				arg_101_1.text_.text = var_104_3

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_4 = 27
				local var_104_5 = utf8.len(var_104_3)
				local var_104_6 = var_104_4 <= 0 and var_104_1 or var_104_1 * (var_104_5 / var_104_4)

				if var_104_6 > 0 and var_104_1 < var_104_6 then
					arg_101_1.talkMaxDuration = var_104_6

					if var_104_6 + var_104_0 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_6 + var_104_0
					end
				end

				arg_101_1.text_.text = var_104_3
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)
				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_7 = math.max(var_104_1, arg_101_1.talkMaxDuration)

			if var_104_0 <= arg_101_1.time_ and arg_101_1.time_ < var_104_0 + var_104_7 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_0) / var_104_7

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_0 + var_104_7 and arg_101_1.time_ < var_104_0 + var_104_7 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play108072029 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 108072029
		arg_105_1.duration_ = 7.133

		local var_105_0 = {
			ja = 3.366,
			ko = 6.1,
			zh = 5.933,
			en = 7.133
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
				arg_105_0:Play108072030(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = "1099ui_story"

			if arg_105_1.actors_[var_108_0] == nil then
				local var_108_1 = Object.Instantiate(Asset.Load("Char/" .. var_108_0), arg_105_1.stage_.transform)

				var_108_1.name = var_108_0
				var_108_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_105_1.actors_[var_108_0] = var_108_1

				local var_108_2 = var_108_1:GetComponentInChildren(typeof(CharacterEffect))

				var_108_2.enabled = true

				local var_108_3 = GameObjectTools.GetOrAddComponent(var_108_1, typeof(DynamicBoneHelper))

				if var_108_3 then
					var_108_3:EnableDynamicBone(false)
				end

				arg_105_1:ShowWeapon(var_108_2.transform, false)

				arg_105_1.var_[var_108_0 .. "Animator"] = var_108_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_105_1.var_[var_108_0 .. "Animator"].applyRootMotion = true
				arg_105_1.var_[var_108_0 .. "LipSync"] = var_108_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_108_4 = arg_105_1.actors_["1099ui_story"].transform
			local var_108_5 = 0

			if var_108_5 < arg_105_1.time_ and arg_105_1.time_ <= var_108_5 + arg_108_0 then
				arg_105_1.var_.moveOldPos1099ui_story = var_108_4.localPosition
			end

			local var_108_6 = 0.001

			if var_108_5 <= arg_105_1.time_ and arg_105_1.time_ < var_108_5 + var_108_6 then
				local var_108_7 = (arg_105_1.time_ - var_108_5) / var_108_6
				local var_108_8 = Vector3.New(0, -1.08, -5.9)

				var_108_4.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos1099ui_story, var_108_8, var_108_7)

				local var_108_9 = manager.ui.mainCamera.transform.position - var_108_4.position

				var_108_4.forward = Vector3.New(var_108_9.x, var_108_9.y, var_108_9.z)

				local var_108_10 = var_108_4.localEulerAngles

				var_108_10.z = 0
				var_108_10.x = 0
				var_108_4.localEulerAngles = var_108_10
			end

			if arg_105_1.time_ >= var_108_5 + var_108_6 and arg_105_1.time_ < var_108_5 + var_108_6 + arg_108_0 then
				var_108_4.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_108_11 = manager.ui.mainCamera.transform.position - var_108_4.position

				var_108_4.forward = Vector3.New(var_108_11.x, var_108_11.y, var_108_11.z)

				local var_108_12 = var_108_4.localEulerAngles

				var_108_12.z = 0
				var_108_12.x = 0
				var_108_4.localEulerAngles = var_108_12
			end

			local var_108_13 = arg_105_1.actors_["1099ui_story"]
			local var_108_14 = 0

			if var_108_14 < arg_105_1.time_ and arg_105_1.time_ <= var_108_14 + arg_108_0 and arg_105_1.var_.characterEffect1099ui_story == nil then
				arg_105_1.var_.characterEffect1099ui_story = var_108_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_15 = 0.2

			if var_108_14 <= arg_105_1.time_ and arg_105_1.time_ < var_108_14 + var_108_15 then
				local var_108_16 = (arg_105_1.time_ - var_108_14) / var_108_15

				if arg_105_1.var_.characterEffect1099ui_story then
					arg_105_1.var_.characterEffect1099ui_story.fillFlat = false
				end
			end

			if arg_105_1.time_ >= var_108_14 + var_108_15 and arg_105_1.time_ < var_108_14 + var_108_15 + arg_108_0 and arg_105_1.var_.characterEffect1099ui_story then
				arg_105_1.var_.characterEffect1099ui_story.fillFlat = false
			end

			local var_108_17 = 0

			if var_108_17 < arg_105_1.time_ and arg_105_1.time_ <= var_108_17 + arg_108_0 then
				arg_105_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/1099/1099action/1099action4_1")
			end

			local var_108_18 = 0

			if var_108_18 < arg_105_1.time_ and arg_105_1.time_ <= var_108_18 + arg_108_0 then
				arg_105_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_108_19 = 0
			local var_108_20 = 0.725

			if var_108_19 < arg_105_1.time_ and arg_105_1.time_ <= var_108_19 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_21 = arg_105_1:FormatText(StoryNameCfg[84].name)

				arg_105_1.leftNameTxt_.text = var_108_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_22 = arg_105_1:GetWordFromCfg(108072029)
				local var_108_23 = arg_105_1:FormatText(var_108_22.content)

				arg_105_1.text_.text = var_108_23

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_24 = 29
				local var_108_25 = utf8.len(var_108_23)
				local var_108_26 = var_108_24 <= 0 and var_108_20 or var_108_20 * (var_108_25 / var_108_24)

				if var_108_26 > 0 and var_108_20 < var_108_26 then
					arg_105_1.talkMaxDuration = var_108_26

					if var_108_26 + var_108_19 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_26 + var_108_19
					end
				end

				arg_105_1.text_.text = var_108_23
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_108072", "108072029", "story_v_out_108072.awb") ~= 0 then
					local var_108_27 = manager.audio:GetVoiceLength("story_v_out_108072", "108072029", "story_v_out_108072.awb") / 1000

					if var_108_27 + var_108_19 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_27 + var_108_19
					end

					if var_108_22.prefab_name ~= "" and arg_105_1.actors_[var_108_22.prefab_name] ~= nil then
						local var_108_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_22.prefab_name].transform, "story_v_out_108072", "108072029", "story_v_out_108072.awb")

						arg_105_1:RecordAudio("108072029", var_108_28)
						arg_105_1:RecordAudio("108072029", var_108_28)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_108072", "108072029", "story_v_out_108072.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_108072", "108072029", "story_v_out_108072.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_29 = math.max(var_108_20, arg_105_1.talkMaxDuration)

			if var_108_19 <= arg_105_1.time_ and arg_105_1.time_ < var_108_19 + var_108_29 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_19) / var_108_29

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_19 + var_108_29 and arg_105_1.time_ < var_108_19 + var_108_29 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play108072030 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 108072030
		arg_109_1.duration_ = 11.933

		local var_109_0 = {
			ja = 11.933,
			ko = 3.733,
			zh = 5.3,
			en = 5.466
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
			arg_109_1.auto_ = false
		end

		function arg_109_1.playNext_(arg_111_0)
			arg_109_1.onStoryFinished_()
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 0

			if var_112_0 < arg_109_1.time_ and arg_109_1.time_ <= var_112_0 + arg_112_0 then
				arg_109_1:PlayTimeline("1099ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_112_1 = 0
			local var_112_2 = 0.5

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_3 = arg_109_1:FormatText(StoryNameCfg[84].name)

				arg_109_1.leftNameTxt_.text = var_112_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_4 = arg_109_1:GetWordFromCfg(108072030)
				local var_112_5 = arg_109_1:FormatText(var_112_4.content)

				arg_109_1.text_.text = var_112_5

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_6 = 20
				local var_112_7 = utf8.len(var_112_5)
				local var_112_8 = var_112_6 <= 0 and var_112_2 or var_112_2 * (var_112_7 / var_112_6)

				if var_112_8 > 0 and var_112_2 < var_112_8 then
					arg_109_1.talkMaxDuration = var_112_8

					if var_112_8 + var_112_1 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_8 + var_112_1
					end
				end

				arg_109_1.text_.text = var_112_5
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_108072", "108072030", "story_v_out_108072.awb") ~= 0 then
					local var_112_9 = manager.audio:GetVoiceLength("story_v_out_108072", "108072030", "story_v_out_108072.awb") / 1000

					if var_112_9 + var_112_1 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_9 + var_112_1
					end

					if var_112_4.prefab_name ~= "" and arg_109_1.actors_[var_112_4.prefab_name] ~= nil then
						local var_112_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_4.prefab_name].transform, "story_v_out_108072", "108072030", "story_v_out_108072.awb")

						arg_109_1:RecordAudio("108072030", var_112_10)
						arg_109_1:RecordAudio("108072030", var_112_10)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_108072", "108072030", "story_v_out_108072.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_108072", "108072030", "story_v_out_108072.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_11 = math.max(var_112_2, arg_109_1.talkMaxDuration)

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_11 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_1) / var_112_11

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_1 + var_112_11 and arg_109_1.time_ < var_112_1 + var_112_11 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/S0804",
		"Assets/UIResources/UI_AB/TextureConfig/Background/S0809",
		"Assets/UIResources/UI_AB/TextureConfig/Background/C04"
	},
	voices = {
		"story_v_out_108072.awb"
	}
}
