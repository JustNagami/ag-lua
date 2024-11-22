return {
	Play319271001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 319271001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play319271002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "I11i"

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
				local var_4_5 = arg_1_1.bgs_.I11i

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
					if iter_4_0 ~= "I11i" then
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

			local var_4_26 = 2
			local var_4_27 = 0.05

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

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_29 = arg_1_1:FormatText(StoryNameCfg[720].name)

				arg_1_1.leftNameTxt_.text = var_4_29

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, true)
				arg_1_1.iconController_:SetSelectedState("hero")

				arg_1_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_4041")

				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_30 = arg_1_1:GetWordFromCfg(319271001)
				local var_4_31 = arg_1_1:FormatText(var_4_30.content)

				arg_1_1.text_.text = var_4_31

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_32 = 2
				local var_4_33 = utf8.len(var_4_31)
				local var_4_34 = var_4_32 <= 0 and var_4_27 or var_4_27 * (var_4_33 / var_4_32)

				if var_4_34 > 0 and var_4_27 < var_4_34 then
					arg_1_1.talkMaxDuration = var_4_34
					var_4_26 = var_4_26 + 0.3

					if var_4_34 + var_4_26 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_34 + var_4_26
					end
				end

				arg_1_1.text_.text = var_4_31
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_35 = var_4_26 + 0.3
			local var_4_36 = math.max(var_4_27, arg_1_1.talkMaxDuration)

			if var_4_35 <= arg_1_1.time_ and arg_1_1.time_ < var_4_35 + var_4_36 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_35) / var_4_36

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_35 + var_4_36 and arg_1_1.time_ < var_4_35 + var_4_36 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play319271002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 319271002
		arg_7_1.duration_ = 7.13333333333333

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play319271003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1.mask_.enabled = true
				arg_7_1.mask_.raycastTarget = false

				arg_7_1:SetGaussion(false)
			end

			local var_10_1 = 1.16666666666667

			if var_10_0 <= arg_7_1.time_ and arg_7_1.time_ < var_10_0 + var_10_1 then
				local var_10_2 = (arg_7_1.time_ - var_10_0) / var_10_1
				local var_10_3 = Color.New(1, 1, 1)

				var_10_3.a = Mathf.Lerp(1, 0, var_10_2)
				arg_7_1.mask_.color = var_10_3
			end

			if arg_7_1.time_ >= var_10_0 + var_10_1 and arg_7_1.time_ < var_10_0 + var_10_1 + arg_10_0 then
				local var_10_4 = Color.New(1, 1, 1)
				local var_10_5 = 0

				arg_7_1.mask_.enabled = false
				var_10_4.a = var_10_5
				arg_7_1.mask_.color = var_10_4
			end

			local var_10_6 = manager.ui.mainCamera.transform
			local var_10_7 = 1

			if var_10_7 < arg_7_1.time_ and arg_7_1.time_ <= var_10_7 + arg_10_0 then
				local var_10_8 = arg_7_1.var_.effect119

				if not var_10_8 then
					var_10_8 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_error"))
					var_10_8.name = "119"
					arg_7_1.var_.effect119 = var_10_8
				end

				local var_10_9 = var_10_6:Find("")

				if var_10_9 then
					var_10_8.transform.parent = var_10_9
				else
					var_10_8.transform.parent = var_10_6
				end

				var_10_8.transform.localPosition = Vector3.New(0, 0, 0)
				var_10_8.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			if arg_7_1.frameCnt_ <= 1 then
				arg_7_1.dialog_:SetActive(false)
			end

			local var_10_10 = 2.13333333333333
			local var_10_11 = 1.3

			if var_10_10 < arg_7_1.time_ and arg_7_1.time_ <= var_10_10 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0

				arg_7_1.dialog_:SetActive(true)

				local var_10_12 = LeanTween.value(arg_7_1.dialog_, 0, 1, 0.3)

				var_10_12:setOnUpdate(LuaHelper.FloatAction(function(arg_11_0)
					arg_7_1.dialogCg_.alpha = arg_11_0
				end))
				var_10_12:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_7_1.dialog_)
					var_10_12:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_7_1.duration_ = arg_7_1.duration_ + 0.3

				SetActive(arg_7_1.leftNameGo_, false)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_13 = arg_7_1:GetWordFromCfg(319271002)
				local var_10_14 = arg_7_1:FormatText(var_10_13.content)

				arg_7_1.text_.text = var_10_14

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_15 = 52
				local var_10_16 = utf8.len(var_10_14)
				local var_10_17 = var_10_15 <= 0 and var_10_11 or var_10_11 * (var_10_16 / var_10_15)

				if var_10_17 > 0 and var_10_11 < var_10_17 then
					arg_7_1.talkMaxDuration = var_10_17
					var_10_10 = var_10_10 + 0.3

					if var_10_17 + var_10_10 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_17 + var_10_10
					end
				end

				arg_7_1.text_.text = var_10_14
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)
				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_18 = var_10_10 + 0.3
			local var_10_19 = math.max(var_10_11, arg_7_1.talkMaxDuration)

			if var_10_18 <= arg_7_1.time_ and arg_7_1.time_ < var_10_18 + var_10_19 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_18) / var_10_19

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_18 + var_10_19 and arg_7_1.time_ < var_10_18 + var_10_19 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play319271003 = function(arg_13_0, arg_13_1)
		arg_13_1.time_ = 0
		arg_13_1.frameCnt_ = 0
		arg_13_1.state_ = "playing"
		arg_13_1.curTalkId_ = 319271003
		arg_13_1.duration_ = 5

		SetActive(arg_13_1.tipsGo_, false)

		function arg_13_1.onSingleLineFinish_()
			arg_13_1.onSingleLineUpdate_ = nil
			arg_13_1.onSingleLineFinish_ = nil
			arg_13_1.state_ = "waiting"
		end

		function arg_13_1.playNext_(arg_15_0)
			if arg_15_0 == 1 then
				arg_13_0:Play319271004(arg_13_1)
			end
		end

		function arg_13_1.onSingleLineUpdate_(arg_16_0)
			local var_16_0 = manager.ui.mainCamera.transform
			local var_16_1 = 0

			if var_16_1 < arg_13_1.time_ and arg_13_1.time_ <= var_16_1 + arg_16_0 then
				local var_16_2 = arg_13_1.var_.effect119

				if var_16_2 then
					Object.Destroy(var_16_2)

					arg_13_1.var_.effect119 = nil
				end
			end

			local var_16_3 = 0
			local var_16_4 = 1.425

			if var_16_3 < arg_13_1.time_ and arg_13_1.time_ <= var_16_3 + arg_16_0 then
				arg_13_1.talkMaxDuration = 0
				arg_13_1.dialogCg_.alpha = 1

				arg_13_1.dialog_:SetActive(true)
				SetActive(arg_13_1.leftNameGo_, false)

				arg_13_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_13_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_13_1:RecordName(arg_13_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_13_1.iconTrs_.gameObject, false)
				arg_13_1.callingController_:SetSelectedState("normal")

				local var_16_5 = arg_13_1:GetWordFromCfg(319271003)
				local var_16_6 = arg_13_1:FormatText(var_16_5.content)

				arg_13_1.text_.text = var_16_6

				LuaForUtil.ClearLinePrefixSymbol(arg_13_1.text_)

				local var_16_7 = 57
				local var_16_8 = utf8.len(var_16_6)
				local var_16_9 = var_16_7 <= 0 and var_16_4 or var_16_4 * (var_16_8 / var_16_7)

				if var_16_9 > 0 and var_16_4 < var_16_9 then
					arg_13_1.talkMaxDuration = var_16_9

					if var_16_9 + var_16_3 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_9 + var_16_3
					end
				end

				arg_13_1.text_.text = var_16_6
				arg_13_1.typewritter.percent = 0

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(false)
				arg_13_1:RecordContent(arg_13_1.text_.text)
			end

			local var_16_10 = math.max(var_16_4, arg_13_1.talkMaxDuration)

			if var_16_3 <= arg_13_1.time_ and arg_13_1.time_ < var_16_3 + var_16_10 then
				arg_13_1.typewritter.percent = (arg_13_1.time_ - var_16_3) / var_16_10

				arg_13_1.typewritter:SetDirty()
			end

			if arg_13_1.time_ >= var_16_3 + var_16_10 and arg_13_1.time_ < var_16_3 + var_16_10 + arg_16_0 then
				arg_13_1.typewritter.percent = 1

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(true)
			end
		end
	end,
	Play319271004 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 319271004
		arg_17_1.duration_ = 5

		SetActive(arg_17_1.tipsGo_, false)

		function arg_17_1.onSingleLineFinish_()
			arg_17_1.onSingleLineUpdate_ = nil
			arg_17_1.onSingleLineFinish_ = nil
			arg_17_1.state_ = "waiting"
		end

		function arg_17_1.playNext_(arg_19_0)
			if arg_19_0 == 1 then
				arg_17_0:Play319271005(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = 0
			local var_20_1 = 1.8

			if var_20_0 < arg_17_1.time_ and arg_17_1.time_ <= var_20_0 + arg_20_0 then
				arg_17_1.talkMaxDuration = 0
				arg_17_1.dialogCg_.alpha = 1

				arg_17_1.dialog_:SetActive(true)
				SetActive(arg_17_1.leftNameGo_, false)

				arg_17_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_17_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_17_1:RecordName(arg_17_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_17_1.iconTrs_.gameObject, false)
				arg_17_1.callingController_:SetSelectedState("normal")

				local var_20_2 = arg_17_1:GetWordFromCfg(319271004)
				local var_20_3 = arg_17_1:FormatText(var_20_2.content)

				arg_17_1.text_.text = var_20_3

				LuaForUtil.ClearLinePrefixSymbol(arg_17_1.text_)

				local var_20_4 = 72
				local var_20_5 = utf8.len(var_20_3)
				local var_20_6 = var_20_4 <= 0 and var_20_1 or var_20_1 * (var_20_5 / var_20_4)

				if var_20_6 > 0 and var_20_1 < var_20_6 then
					arg_17_1.talkMaxDuration = var_20_6

					if var_20_6 + var_20_0 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_6 + var_20_0
					end
				end

				arg_17_1.text_.text = var_20_3
				arg_17_1.typewritter.percent = 0

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(false)
				arg_17_1:RecordContent(arg_17_1.text_.text)
			end

			local var_20_7 = math.max(var_20_1, arg_17_1.talkMaxDuration)

			if var_20_0 <= arg_17_1.time_ and arg_17_1.time_ < var_20_0 + var_20_7 then
				arg_17_1.typewritter.percent = (arg_17_1.time_ - var_20_0) / var_20_7

				arg_17_1.typewritter:SetDirty()
			end

			if arg_17_1.time_ >= var_20_0 + var_20_7 and arg_17_1.time_ < var_20_0 + var_20_7 + arg_20_0 then
				arg_17_1.typewritter.percent = 1

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(true)
			end
		end
	end,
	Play319271005 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 319271005
		arg_21_1.duration_ = 2.966

		local var_21_0 = {
			zh = 2.966,
			ja = 1.733
		}
		local var_21_1 = manager.audio:GetLocalizationFlag()

		if var_21_0[var_21_1] ~= nil then
			arg_21_1.duration_ = var_21_0[var_21_1]
		end

		SetActive(arg_21_1.tipsGo_, false)

		function arg_21_1.onSingleLineFinish_()
			arg_21_1.onSingleLineUpdate_ = nil
			arg_21_1.onSingleLineFinish_ = nil
			arg_21_1.state_ = "waiting"
		end

		function arg_21_1.playNext_(arg_23_0)
			if arg_23_0 == 1 then
				arg_21_0:Play319271006(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = 0
			local var_24_1 = 0.2

			if var_24_0 < arg_21_1.time_ and arg_21_1.time_ <= var_24_0 + arg_24_0 then
				local var_24_2 = "play"
				local var_24_3 = "music"

				arg_21_1:AudioAction(var_24_2, var_24_3, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_24_4 = 0.233333333333333
			local var_24_5 = 1

			if var_24_4 < arg_21_1.time_ and arg_21_1.time_ <= var_24_4 + arg_24_0 then
				local var_24_6 = "play"
				local var_24_7 = "music"

				arg_21_1:AudioAction(var_24_6, var_24_7, "bgm_activity_3_0_story_intense_argue", "bgm_activity_3_0_story_intense_argue", "bgm_activity_3_0_story_intense_argue.awb")
			end

			local var_24_8 = 0
			local var_24_9 = 0.275

			if var_24_8 < arg_21_1.time_ and arg_21_1.time_ <= var_24_8 + arg_24_0 then
				arg_21_1.talkMaxDuration = 0
				arg_21_1.dialogCg_.alpha = 1

				arg_21_1.dialog_:SetActive(true)
				SetActive(arg_21_1.leftNameGo_, true)

				local var_24_10 = arg_21_1:FormatText(StoryNameCfg[694].name)

				arg_21_1.leftNameTxt_.text = var_24_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_21_1.leftNameTxt_.transform)

				arg_21_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_21_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_21_1:RecordName(arg_21_1.leftNameTxt_.text)
				SetActive(arg_21_1.iconTrs_.gameObject, true)
				arg_21_1.iconController_:SetSelectedState("hero")

				arg_21_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10091")

				arg_21_1.callingController_:SetSelectedState("normal")

				local var_24_11 = arg_21_1:GetWordFromCfg(319271005)
				local var_24_12 = arg_21_1:FormatText(var_24_11.content)

				arg_21_1.text_.text = var_24_12

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_13 = 11
				local var_24_14 = utf8.len(var_24_12)
				local var_24_15 = var_24_13 <= 0 and var_24_9 or var_24_9 * (var_24_14 / var_24_13)

				if var_24_15 > 0 and var_24_9 < var_24_15 then
					arg_21_1.talkMaxDuration = var_24_15

					if var_24_15 + var_24_8 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_15 + var_24_8
					end
				end

				arg_21_1.text_.text = var_24_12
				arg_21_1.typewritter.percent = 0

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319271", "319271005", "story_v_out_319271.awb") ~= 0 then
					local var_24_16 = manager.audio:GetVoiceLength("story_v_out_319271", "319271005", "story_v_out_319271.awb") / 1000

					if var_24_16 + var_24_8 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_16 + var_24_8
					end

					if var_24_11.prefab_name ~= "" and arg_21_1.actors_[var_24_11.prefab_name] ~= nil then
						local var_24_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_21_1.actors_[var_24_11.prefab_name].transform, "story_v_out_319271", "319271005", "story_v_out_319271.awb")

						arg_21_1:RecordAudio("319271005", var_24_17)
						arg_21_1:RecordAudio("319271005", var_24_17)
					else
						arg_21_1:AudioAction("play", "voice", "story_v_out_319271", "319271005", "story_v_out_319271.awb")
					end

					arg_21_1:RecordHistoryTalkVoice("story_v_out_319271", "319271005", "story_v_out_319271.awb")
				end

				arg_21_1:RecordContent(arg_21_1.text_.text)
			end

			local var_24_18 = math.max(var_24_9, arg_21_1.talkMaxDuration)

			if var_24_8 <= arg_21_1.time_ and arg_21_1.time_ < var_24_8 + var_24_18 then
				arg_21_1.typewritter.percent = (arg_21_1.time_ - var_24_8) / var_24_18

				arg_21_1.typewritter:SetDirty()
			end

			if arg_21_1.time_ >= var_24_8 + var_24_18 and arg_21_1.time_ < var_24_8 + var_24_18 + arg_24_0 then
				arg_21_1.typewritter.percent = 1

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(true)
			end
		end
	end,
	Play319271006 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 319271006
		arg_25_1.duration_ = 5

		SetActive(arg_25_1.tipsGo_, false)

		function arg_25_1.onSingleLineFinish_()
			arg_25_1.onSingleLineUpdate_ = nil
			arg_25_1.onSingleLineFinish_ = nil
			arg_25_1.state_ = "waiting"
		end

		function arg_25_1.playNext_(arg_27_0)
			if arg_27_0 == 1 then
				arg_25_0:Play319271007(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = 0
			local var_28_1 = 1.1

			if var_28_0 < arg_25_1.time_ and arg_25_1.time_ <= var_28_0 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, false)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_2 = arg_25_1:GetWordFromCfg(319271006)
				local var_28_3 = arg_25_1:FormatText(var_28_2.content)

				arg_25_1.text_.text = var_28_3

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_4 = 44
				local var_28_5 = utf8.len(var_28_3)
				local var_28_6 = var_28_4 <= 0 and var_28_1 or var_28_1 * (var_28_5 / var_28_4)

				if var_28_6 > 0 and var_28_1 < var_28_6 then
					arg_25_1.talkMaxDuration = var_28_6

					if var_28_6 + var_28_0 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_6 + var_28_0
					end
				end

				arg_25_1.text_.text = var_28_3
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)
				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_7 = math.max(var_28_1, arg_25_1.talkMaxDuration)

			if var_28_0 <= arg_25_1.time_ and arg_25_1.time_ < var_28_0 + var_28_7 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_0) / var_28_7

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_0 + var_28_7 and arg_25_1.time_ < var_28_0 + var_28_7 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play319271007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 319271007
		arg_29_1.duration_ = 4.833

		local var_29_0 = {
			zh = 4.7,
			ja = 4.833
		}
		local var_29_1 = manager.audio:GetLocalizationFlag()

		if var_29_0[var_29_1] ~= nil then
			arg_29_1.duration_ = var_29_0[var_29_1]
		end

		SetActive(arg_29_1.tipsGo_, false)

		function arg_29_1.onSingleLineFinish_()
			arg_29_1.onSingleLineUpdate_ = nil
			arg_29_1.onSingleLineFinish_ = nil
			arg_29_1.state_ = "waiting"
		end

		function arg_29_1.playNext_(arg_31_0)
			if arg_31_0 == 1 then
				arg_29_0:Play319271008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = "1095ui_story"

			if arg_29_1.actors_[var_32_0] == nil then
				local var_32_1 = Object.Instantiate(Asset.Load("Char/" .. var_32_0), arg_29_1.stage_.transform)

				var_32_1.name = var_32_0
				var_32_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_29_1.actors_[var_32_0] = var_32_1

				local var_32_2 = var_32_1:GetComponentInChildren(typeof(CharacterEffect))

				var_32_2.enabled = true

				local var_32_3 = GameObjectTools.GetOrAddComponent(var_32_1, typeof(DynamicBoneHelper))

				if var_32_3 then
					var_32_3:EnableDynamicBone(false)
				end

				arg_29_1:ShowWeapon(var_32_2.transform, false)

				arg_29_1.var_[var_32_0 .. "Animator"] = var_32_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_29_1.var_[var_32_0 .. "Animator"].applyRootMotion = true
				arg_29_1.var_[var_32_0 .. "LipSync"] = var_32_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_32_4 = arg_29_1.actors_["1095ui_story"].transform
			local var_32_5 = 0

			if var_32_5 < arg_29_1.time_ and arg_29_1.time_ <= var_32_5 + arg_32_0 then
				arg_29_1.var_.moveOldPos1095ui_story = var_32_4.localPosition
			end

			local var_32_6 = 0.001

			if var_32_5 <= arg_29_1.time_ and arg_29_1.time_ < var_32_5 + var_32_6 then
				local var_32_7 = (arg_29_1.time_ - var_32_5) / var_32_6
				local var_32_8 = Vector3.New(0, -0.98, -6.1)

				var_32_4.localPosition = Vector3.Lerp(arg_29_1.var_.moveOldPos1095ui_story, var_32_8, var_32_7)

				local var_32_9 = manager.ui.mainCamera.transform.position - var_32_4.position

				var_32_4.forward = Vector3.New(var_32_9.x, var_32_9.y, var_32_9.z)

				local var_32_10 = var_32_4.localEulerAngles

				var_32_10.z = 0
				var_32_10.x = 0
				var_32_4.localEulerAngles = var_32_10
			end

			if arg_29_1.time_ >= var_32_5 + var_32_6 and arg_29_1.time_ < var_32_5 + var_32_6 + arg_32_0 then
				var_32_4.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_32_11 = manager.ui.mainCamera.transform.position - var_32_4.position

				var_32_4.forward = Vector3.New(var_32_11.x, var_32_11.y, var_32_11.z)

				local var_32_12 = var_32_4.localEulerAngles

				var_32_12.z = 0
				var_32_12.x = 0
				var_32_4.localEulerAngles = var_32_12
			end

			local var_32_13 = arg_29_1.actors_["1095ui_story"]
			local var_32_14 = 0

			if var_32_14 < arg_29_1.time_ and arg_29_1.time_ <= var_32_14 + arg_32_0 and arg_29_1.var_.characterEffect1095ui_story == nil then
				arg_29_1.var_.characterEffect1095ui_story = var_32_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_32_15 = 0.200000002980232

			if var_32_14 <= arg_29_1.time_ and arg_29_1.time_ < var_32_14 + var_32_15 then
				local var_32_16 = (arg_29_1.time_ - var_32_14) / var_32_15

				if arg_29_1.var_.characterEffect1095ui_story then
					arg_29_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_29_1.time_ >= var_32_14 + var_32_15 and arg_29_1.time_ < var_32_14 + var_32_15 + arg_32_0 and arg_29_1.var_.characterEffect1095ui_story then
				arg_29_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_32_17 = 0

			if var_32_17 < arg_29_1.time_ and arg_29_1.time_ <= var_32_17 + arg_32_0 then
				arg_29_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_32_18 = 0

			if var_32_18 < arg_29_1.time_ and arg_29_1.time_ <= var_32_18 + arg_32_0 then
				arg_29_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_32_19 = 0
			local var_32_20 = 0.55

			if var_32_19 < arg_29_1.time_ and arg_29_1.time_ <= var_32_19 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, true)

				local var_32_21 = arg_29_1:FormatText(StoryNameCfg[471].name)

				arg_29_1.leftNameTxt_.text = var_32_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_1.leftNameTxt_.transform)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1.leftNameTxt_.text)
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_22 = arg_29_1:GetWordFromCfg(319271007)
				local var_32_23 = arg_29_1:FormatText(var_32_22.content)

				arg_29_1.text_.text = var_32_23

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_24 = 22
				local var_32_25 = utf8.len(var_32_23)
				local var_32_26 = var_32_24 <= 0 and var_32_20 or var_32_20 * (var_32_25 / var_32_24)

				if var_32_26 > 0 and var_32_20 < var_32_26 then
					arg_29_1.talkMaxDuration = var_32_26

					if var_32_26 + var_32_19 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_26 + var_32_19
					end
				end

				arg_29_1.text_.text = var_32_23
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319271", "319271007", "story_v_out_319271.awb") ~= 0 then
					local var_32_27 = manager.audio:GetVoiceLength("story_v_out_319271", "319271007", "story_v_out_319271.awb") / 1000

					if var_32_27 + var_32_19 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_27 + var_32_19
					end

					if var_32_22.prefab_name ~= "" and arg_29_1.actors_[var_32_22.prefab_name] ~= nil then
						local var_32_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_29_1.actors_[var_32_22.prefab_name].transform, "story_v_out_319271", "319271007", "story_v_out_319271.awb")

						arg_29_1:RecordAudio("319271007", var_32_28)
						arg_29_1:RecordAudio("319271007", var_32_28)
					else
						arg_29_1:AudioAction("play", "voice", "story_v_out_319271", "319271007", "story_v_out_319271.awb")
					end

					arg_29_1:RecordHistoryTalkVoice("story_v_out_319271", "319271007", "story_v_out_319271.awb")
				end

				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_29 = math.max(var_32_20, arg_29_1.talkMaxDuration)

			if var_32_19 <= arg_29_1.time_ and arg_29_1.time_ < var_32_19 + var_32_29 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_19) / var_32_29

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_19 + var_32_29 and arg_29_1.time_ < var_32_19 + var_32_29 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play319271008 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 319271008
		arg_33_1.duration_ = 3.633

		local var_33_0 = {
			zh = 3.633,
			ja = 3.1
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
				arg_33_0:Play319271009(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = arg_33_1.actors_["1095ui_story"]
			local var_36_1 = 0

			if var_36_1 < arg_33_1.time_ and arg_33_1.time_ <= var_36_1 + arg_36_0 and arg_33_1.var_.characterEffect1095ui_story == nil then
				arg_33_1.var_.characterEffect1095ui_story = var_36_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_36_2 = 0.200000002980232

			if var_36_1 <= arg_33_1.time_ and arg_33_1.time_ < var_36_1 + var_36_2 then
				local var_36_3 = (arg_33_1.time_ - var_36_1) / var_36_2

				if arg_33_1.var_.characterEffect1095ui_story then
					local var_36_4 = Mathf.Lerp(0, 0.5, var_36_3)

					arg_33_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_33_1.var_.characterEffect1095ui_story.fillRatio = var_36_4
				end
			end

			if arg_33_1.time_ >= var_36_1 + var_36_2 and arg_33_1.time_ < var_36_1 + var_36_2 + arg_36_0 and arg_33_1.var_.characterEffect1095ui_story then
				local var_36_5 = 0.5

				arg_33_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_33_1.var_.characterEffect1095ui_story.fillRatio = var_36_5
			end

			local var_36_6 = 0
			local var_36_7 = 0.3

			if var_36_6 < arg_33_1.time_ and arg_33_1.time_ <= var_36_6 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, true)

				local var_36_8 = arg_33_1:FormatText(StoryNameCfg[694].name)

				arg_33_1.leftNameTxt_.text = var_36_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_33_1.leftNameTxt_.transform)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1.leftNameTxt_.text)
				SetActive(arg_33_1.iconTrs_.gameObject, true)
				arg_33_1.iconController_:SetSelectedState("hero")

				arg_33_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10091")

				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_9 = arg_33_1:GetWordFromCfg(319271008)
				local var_36_10 = arg_33_1:FormatText(var_36_9.content)

				arg_33_1.text_.text = var_36_10

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_11 = 12
				local var_36_12 = utf8.len(var_36_10)
				local var_36_13 = var_36_11 <= 0 and var_36_7 or var_36_7 * (var_36_12 / var_36_11)

				if var_36_13 > 0 and var_36_7 < var_36_13 then
					arg_33_1.talkMaxDuration = var_36_13

					if var_36_13 + var_36_6 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_13 + var_36_6
					end
				end

				arg_33_1.text_.text = var_36_10
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319271", "319271008", "story_v_out_319271.awb") ~= 0 then
					local var_36_14 = manager.audio:GetVoiceLength("story_v_out_319271", "319271008", "story_v_out_319271.awb") / 1000

					if var_36_14 + var_36_6 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_14 + var_36_6
					end

					if var_36_9.prefab_name ~= "" and arg_33_1.actors_[var_36_9.prefab_name] ~= nil then
						local var_36_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_33_1.actors_[var_36_9.prefab_name].transform, "story_v_out_319271", "319271008", "story_v_out_319271.awb")

						arg_33_1:RecordAudio("319271008", var_36_15)
						arg_33_1:RecordAudio("319271008", var_36_15)
					else
						arg_33_1:AudioAction("play", "voice", "story_v_out_319271", "319271008", "story_v_out_319271.awb")
					end

					arg_33_1:RecordHistoryTalkVoice("story_v_out_319271", "319271008", "story_v_out_319271.awb")
				end

				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_16 = math.max(var_36_7, arg_33_1.talkMaxDuration)

			if var_36_6 <= arg_33_1.time_ and arg_33_1.time_ < var_36_6 + var_36_16 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_6) / var_36_16

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_6 + var_36_16 and arg_33_1.time_ < var_36_6 + var_36_16 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play319271009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 319271009
		arg_37_1.duration_ = 7.7

		local var_37_0 = {
			zh = 3.933,
			ja = 7.7
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
				arg_37_0:Play319271010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = arg_37_1.actors_["1095ui_story"].transform
			local var_40_1 = 0

			if var_40_1 < arg_37_1.time_ and arg_37_1.time_ <= var_40_1 + arg_40_0 then
				arg_37_1.var_.moveOldPos1095ui_story = var_40_0.localPosition
			end

			local var_40_2 = 0.001

			if var_40_1 <= arg_37_1.time_ and arg_37_1.time_ < var_40_1 + var_40_2 then
				local var_40_3 = (arg_37_1.time_ - var_40_1) / var_40_2
				local var_40_4 = Vector3.New(0, -0.98, -6.1)

				var_40_0.localPosition = Vector3.Lerp(arg_37_1.var_.moveOldPos1095ui_story, var_40_4, var_40_3)

				local var_40_5 = manager.ui.mainCamera.transform.position - var_40_0.position

				var_40_0.forward = Vector3.New(var_40_5.x, var_40_5.y, var_40_5.z)

				local var_40_6 = var_40_0.localEulerAngles

				var_40_6.z = 0
				var_40_6.x = 0
				var_40_0.localEulerAngles = var_40_6
			end

			if arg_37_1.time_ >= var_40_1 + var_40_2 and arg_37_1.time_ < var_40_1 + var_40_2 + arg_40_0 then
				var_40_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_40_7 = manager.ui.mainCamera.transform.position - var_40_0.position

				var_40_0.forward = Vector3.New(var_40_7.x, var_40_7.y, var_40_7.z)

				local var_40_8 = var_40_0.localEulerAngles

				var_40_8.z = 0
				var_40_8.x = 0
				var_40_0.localEulerAngles = var_40_8
			end

			local var_40_9 = arg_37_1.actors_["1095ui_story"]
			local var_40_10 = 0

			if var_40_10 < arg_37_1.time_ and arg_37_1.time_ <= var_40_10 + arg_40_0 and arg_37_1.var_.characterEffect1095ui_story == nil then
				arg_37_1.var_.characterEffect1095ui_story = var_40_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_11 = 0.200000002980232

			if var_40_10 <= arg_37_1.time_ and arg_37_1.time_ < var_40_10 + var_40_11 then
				local var_40_12 = (arg_37_1.time_ - var_40_10) / var_40_11

				if arg_37_1.var_.characterEffect1095ui_story then
					arg_37_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_37_1.time_ >= var_40_10 + var_40_11 and arg_37_1.time_ < var_40_10 + var_40_11 + arg_40_0 and arg_37_1.var_.characterEffect1095ui_story then
				arg_37_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_40_13 = 0

			if var_40_13 < arg_37_1.time_ and arg_37_1.time_ <= var_40_13 + arg_40_0 then
				arg_37_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_1")
			end

			local var_40_14 = 0

			if var_40_14 < arg_37_1.time_ and arg_37_1.time_ <= var_40_14 + arg_40_0 then
				arg_37_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_40_15 = 0
			local var_40_16 = 0.55

			if var_40_15 < arg_37_1.time_ and arg_37_1.time_ <= var_40_15 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_17 = arg_37_1:FormatText(StoryNameCfg[471].name)

				arg_37_1.leftNameTxt_.text = var_40_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_18 = arg_37_1:GetWordFromCfg(319271009)
				local var_40_19 = arg_37_1:FormatText(var_40_18.content)

				arg_37_1.text_.text = var_40_19

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_20 = 22
				local var_40_21 = utf8.len(var_40_19)
				local var_40_22 = var_40_20 <= 0 and var_40_16 or var_40_16 * (var_40_21 / var_40_20)

				if var_40_22 > 0 and var_40_16 < var_40_22 then
					arg_37_1.talkMaxDuration = var_40_22

					if var_40_22 + var_40_15 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_22 + var_40_15
					end
				end

				arg_37_1.text_.text = var_40_19
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319271", "319271009", "story_v_out_319271.awb") ~= 0 then
					local var_40_23 = manager.audio:GetVoiceLength("story_v_out_319271", "319271009", "story_v_out_319271.awb") / 1000

					if var_40_23 + var_40_15 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_23 + var_40_15
					end

					if var_40_18.prefab_name ~= "" and arg_37_1.actors_[var_40_18.prefab_name] ~= nil then
						local var_40_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_37_1.actors_[var_40_18.prefab_name].transform, "story_v_out_319271", "319271009", "story_v_out_319271.awb")

						arg_37_1:RecordAudio("319271009", var_40_24)
						arg_37_1:RecordAudio("319271009", var_40_24)
					else
						arg_37_1:AudioAction("play", "voice", "story_v_out_319271", "319271009", "story_v_out_319271.awb")
					end

					arg_37_1:RecordHistoryTalkVoice("story_v_out_319271", "319271009", "story_v_out_319271.awb")
				end

				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_25 = math.max(var_40_16, arg_37_1.talkMaxDuration)

			if var_40_15 <= arg_37_1.time_ and arg_37_1.time_ < var_40_15 + var_40_25 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_15) / var_40_25

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_15 + var_40_25 and arg_37_1.time_ < var_40_15 + var_40_25 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play319271010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 319271010
		arg_41_1.duration_ = 6.233

		local var_41_0 = {
			zh = 3.7,
			ja = 6.233
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
				arg_41_0:Play319271011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = 0

			if var_44_0 < arg_41_1.time_ and arg_41_1.time_ <= var_44_0 + arg_44_0 then
				arg_41_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_44_1 = 0
			local var_44_2 = 0.4

			if var_44_1 < arg_41_1.time_ and arg_41_1.time_ <= var_44_1 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_3 = arg_41_1:FormatText(StoryNameCfg[471].name)

				arg_41_1.leftNameTxt_.text = var_44_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_4 = arg_41_1:GetWordFromCfg(319271010)
				local var_44_5 = arg_41_1:FormatText(var_44_4.content)

				arg_41_1.text_.text = var_44_5

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_6 = 16
				local var_44_7 = utf8.len(var_44_5)
				local var_44_8 = var_44_6 <= 0 and var_44_2 or var_44_2 * (var_44_7 / var_44_6)

				if var_44_8 > 0 and var_44_2 < var_44_8 then
					arg_41_1.talkMaxDuration = var_44_8

					if var_44_8 + var_44_1 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_8 + var_44_1
					end
				end

				arg_41_1.text_.text = var_44_5
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319271", "319271010", "story_v_out_319271.awb") ~= 0 then
					local var_44_9 = manager.audio:GetVoiceLength("story_v_out_319271", "319271010", "story_v_out_319271.awb") / 1000

					if var_44_9 + var_44_1 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_9 + var_44_1
					end

					if var_44_4.prefab_name ~= "" and arg_41_1.actors_[var_44_4.prefab_name] ~= nil then
						local var_44_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_4.prefab_name].transform, "story_v_out_319271", "319271010", "story_v_out_319271.awb")

						arg_41_1:RecordAudio("319271010", var_44_10)
						arg_41_1:RecordAudio("319271010", var_44_10)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_out_319271", "319271010", "story_v_out_319271.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_out_319271", "319271010", "story_v_out_319271.awb")
				end

				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_11 = math.max(var_44_2, arg_41_1.talkMaxDuration)

			if var_44_1 <= arg_41_1.time_ and arg_41_1.time_ < var_44_1 + var_44_11 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_1) / var_44_11

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_1 + var_44_11 and arg_41_1.time_ < var_44_1 + var_44_11 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play319271011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 319271011
		arg_45_1.duration_ = 3.1

		local var_45_0 = {
			zh = 2.366,
			ja = 3.1
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
				arg_45_0:Play319271012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = arg_45_1.actors_["1095ui_story"]
			local var_48_1 = 0

			if var_48_1 < arg_45_1.time_ and arg_45_1.time_ <= var_48_1 + arg_48_0 and arg_45_1.var_.characterEffect1095ui_story == nil then
				arg_45_1.var_.characterEffect1095ui_story = var_48_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_2 = 0.200000002980232

			if var_48_1 <= arg_45_1.time_ and arg_45_1.time_ < var_48_1 + var_48_2 then
				local var_48_3 = (arg_45_1.time_ - var_48_1) / var_48_2

				if arg_45_1.var_.characterEffect1095ui_story then
					local var_48_4 = Mathf.Lerp(0, 0.5, var_48_3)

					arg_45_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_45_1.var_.characterEffect1095ui_story.fillRatio = var_48_4
				end
			end

			if arg_45_1.time_ >= var_48_1 + var_48_2 and arg_45_1.time_ < var_48_1 + var_48_2 + arg_48_0 and arg_45_1.var_.characterEffect1095ui_story then
				local var_48_5 = 0.5

				arg_45_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_45_1.var_.characterEffect1095ui_story.fillRatio = var_48_5
			end

			local var_48_6 = 0
			local var_48_7 = 0.1

			if var_48_6 < arg_45_1.time_ and arg_45_1.time_ <= var_48_6 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_8 = arg_45_1:FormatText(StoryNameCfg[694].name)

				arg_45_1.leftNameTxt_.text = var_48_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, true)
				arg_45_1.iconController_:SetSelectedState("hero")

				arg_45_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10091")

				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_9 = arg_45_1:GetWordFromCfg(319271011)
				local var_48_10 = arg_45_1:FormatText(var_48_9.content)

				arg_45_1.text_.text = var_48_10

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_11 = 4
				local var_48_12 = utf8.len(var_48_10)
				local var_48_13 = var_48_11 <= 0 and var_48_7 or var_48_7 * (var_48_12 / var_48_11)

				if var_48_13 > 0 and var_48_7 < var_48_13 then
					arg_45_1.talkMaxDuration = var_48_13

					if var_48_13 + var_48_6 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_13 + var_48_6
					end
				end

				arg_45_1.text_.text = var_48_10
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319271", "319271011", "story_v_out_319271.awb") ~= 0 then
					local var_48_14 = manager.audio:GetVoiceLength("story_v_out_319271", "319271011", "story_v_out_319271.awb") / 1000

					if var_48_14 + var_48_6 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_14 + var_48_6
					end

					if var_48_9.prefab_name ~= "" and arg_45_1.actors_[var_48_9.prefab_name] ~= nil then
						local var_48_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_9.prefab_name].transform, "story_v_out_319271", "319271011", "story_v_out_319271.awb")

						arg_45_1:RecordAudio("319271011", var_48_15)
						arg_45_1:RecordAudio("319271011", var_48_15)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_out_319271", "319271011", "story_v_out_319271.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_out_319271", "319271011", "story_v_out_319271.awb")
				end

				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_16 = math.max(var_48_7, arg_45_1.talkMaxDuration)

			if var_48_6 <= arg_45_1.time_ and arg_45_1.time_ < var_48_6 + var_48_16 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_6) / var_48_16

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_6 + var_48_16 and arg_45_1.time_ < var_48_6 + var_48_16 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play319271012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 319271012
		arg_49_1.duration_ = 5

		SetActive(arg_49_1.tipsGo_, false)

		function arg_49_1.onSingleLineFinish_()
			arg_49_1.onSingleLineUpdate_ = nil
			arg_49_1.onSingleLineFinish_ = nil
			arg_49_1.state_ = "waiting"
		end

		function arg_49_1.playNext_(arg_51_0)
			if arg_51_0 == 1 then
				arg_49_0:Play319271013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = arg_49_1.actors_["1095ui_story"].transform
			local var_52_1 = 0

			if var_52_1 < arg_49_1.time_ and arg_49_1.time_ <= var_52_1 + arg_52_0 then
				arg_49_1.var_.moveOldPos1095ui_story = var_52_0.localPosition
			end

			local var_52_2 = 0.001

			if var_52_1 <= arg_49_1.time_ and arg_49_1.time_ < var_52_1 + var_52_2 then
				local var_52_3 = (arg_49_1.time_ - var_52_1) / var_52_2
				local var_52_4 = Vector3.New(0, 100, 0)

				var_52_0.localPosition = Vector3.Lerp(arg_49_1.var_.moveOldPos1095ui_story, var_52_4, var_52_3)

				local var_52_5 = manager.ui.mainCamera.transform.position - var_52_0.position

				var_52_0.forward = Vector3.New(var_52_5.x, var_52_5.y, var_52_5.z)

				local var_52_6 = var_52_0.localEulerAngles

				var_52_6.z = 0
				var_52_6.x = 0
				var_52_0.localEulerAngles = var_52_6
			end

			if arg_49_1.time_ >= var_52_1 + var_52_2 and arg_49_1.time_ < var_52_1 + var_52_2 + arg_52_0 then
				var_52_0.localPosition = Vector3.New(0, 100, 0)

				local var_52_7 = manager.ui.mainCamera.transform.position - var_52_0.position

				var_52_0.forward = Vector3.New(var_52_7.x, var_52_7.y, var_52_7.z)

				local var_52_8 = var_52_0.localEulerAngles

				var_52_8.z = 0
				var_52_8.x = 0
				var_52_0.localEulerAngles = var_52_8
			end

			local var_52_9 = 0
			local var_52_10 = 1.35

			if var_52_9 < arg_49_1.time_ and arg_49_1.time_ <= var_52_9 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, false)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_11 = arg_49_1:GetWordFromCfg(319271012)
				local var_52_12 = arg_49_1:FormatText(var_52_11.content)

				arg_49_1.text_.text = var_52_12

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_13 = 54
				local var_52_14 = utf8.len(var_52_12)
				local var_52_15 = var_52_13 <= 0 and var_52_10 or var_52_10 * (var_52_14 / var_52_13)

				if var_52_15 > 0 and var_52_10 < var_52_15 then
					arg_49_1.talkMaxDuration = var_52_15

					if var_52_15 + var_52_9 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_15 + var_52_9
					end
				end

				arg_49_1.text_.text = var_52_12
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)
				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_16 = math.max(var_52_10, arg_49_1.talkMaxDuration)

			if var_52_9 <= arg_49_1.time_ and arg_49_1.time_ < var_52_9 + var_52_16 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_9) / var_52_16

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_9 + var_52_16 and arg_49_1.time_ < var_52_9 + var_52_16 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play319271013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 319271013
		arg_53_1.duration_ = 4.333

		local var_53_0 = {
			zh = 3.933,
			ja = 4.333
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
				arg_53_0:Play319271014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = arg_53_1.actors_["1095ui_story"].transform
			local var_56_1 = 0

			if var_56_1 < arg_53_1.time_ and arg_53_1.time_ <= var_56_1 + arg_56_0 then
				arg_53_1.var_.moveOldPos1095ui_story = var_56_0.localPosition
			end

			local var_56_2 = 0.001

			if var_56_1 <= arg_53_1.time_ and arg_53_1.time_ < var_56_1 + var_56_2 then
				local var_56_3 = (arg_53_1.time_ - var_56_1) / var_56_2
				local var_56_4 = Vector3.New(0, -0.98, -6.1)

				var_56_0.localPosition = Vector3.Lerp(arg_53_1.var_.moveOldPos1095ui_story, var_56_4, var_56_3)

				local var_56_5 = manager.ui.mainCamera.transform.position - var_56_0.position

				var_56_0.forward = Vector3.New(var_56_5.x, var_56_5.y, var_56_5.z)

				local var_56_6 = var_56_0.localEulerAngles

				var_56_6.z = 0
				var_56_6.x = 0
				var_56_0.localEulerAngles = var_56_6
			end

			if arg_53_1.time_ >= var_56_1 + var_56_2 and arg_53_1.time_ < var_56_1 + var_56_2 + arg_56_0 then
				var_56_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_56_7 = manager.ui.mainCamera.transform.position - var_56_0.position

				var_56_0.forward = Vector3.New(var_56_7.x, var_56_7.y, var_56_7.z)

				local var_56_8 = var_56_0.localEulerAngles

				var_56_8.z = 0
				var_56_8.x = 0
				var_56_0.localEulerAngles = var_56_8
			end

			local var_56_9 = arg_53_1.actors_["1095ui_story"]
			local var_56_10 = 0

			if var_56_10 < arg_53_1.time_ and arg_53_1.time_ <= var_56_10 + arg_56_0 and arg_53_1.var_.characterEffect1095ui_story == nil then
				arg_53_1.var_.characterEffect1095ui_story = var_56_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_56_11 = 0.200000002980232

			if var_56_10 <= arg_53_1.time_ and arg_53_1.time_ < var_56_10 + var_56_11 then
				local var_56_12 = (arg_53_1.time_ - var_56_10) / var_56_11

				if arg_53_1.var_.characterEffect1095ui_story then
					arg_53_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_53_1.time_ >= var_56_10 + var_56_11 and arg_53_1.time_ < var_56_10 + var_56_11 + arg_56_0 and arg_53_1.var_.characterEffect1095ui_story then
				arg_53_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_56_13 = 0

			if var_56_13 < arg_53_1.time_ and arg_53_1.time_ <= var_56_13 + arg_56_0 then
				arg_53_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_2")
			end

			local var_56_14 = 0

			if var_56_14 < arg_53_1.time_ and arg_53_1.time_ <= var_56_14 + arg_56_0 then
				arg_53_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_56_15 = 0
			local var_56_16 = 0.475

			if var_56_15 < arg_53_1.time_ and arg_53_1.time_ <= var_56_15 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_17 = arg_53_1:FormatText(StoryNameCfg[471].name)

				arg_53_1.leftNameTxt_.text = var_56_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_18 = arg_53_1:GetWordFromCfg(319271013)
				local var_56_19 = arg_53_1:FormatText(var_56_18.content)

				arg_53_1.text_.text = var_56_19

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_20 = 19
				local var_56_21 = utf8.len(var_56_19)
				local var_56_22 = var_56_20 <= 0 and var_56_16 or var_56_16 * (var_56_21 / var_56_20)

				if var_56_22 > 0 and var_56_16 < var_56_22 then
					arg_53_1.talkMaxDuration = var_56_22

					if var_56_22 + var_56_15 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_22 + var_56_15
					end
				end

				arg_53_1.text_.text = var_56_19
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319271", "319271013", "story_v_out_319271.awb") ~= 0 then
					local var_56_23 = manager.audio:GetVoiceLength("story_v_out_319271", "319271013", "story_v_out_319271.awb") / 1000

					if var_56_23 + var_56_15 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_23 + var_56_15
					end

					if var_56_18.prefab_name ~= "" and arg_53_1.actors_[var_56_18.prefab_name] ~= nil then
						local var_56_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_53_1.actors_[var_56_18.prefab_name].transform, "story_v_out_319271", "319271013", "story_v_out_319271.awb")

						arg_53_1:RecordAudio("319271013", var_56_24)
						arg_53_1:RecordAudio("319271013", var_56_24)
					else
						arg_53_1:AudioAction("play", "voice", "story_v_out_319271", "319271013", "story_v_out_319271.awb")
					end

					arg_53_1:RecordHistoryTalkVoice("story_v_out_319271", "319271013", "story_v_out_319271.awb")
				end

				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_25 = math.max(var_56_16, arg_53_1.talkMaxDuration)

			if var_56_15 <= arg_53_1.time_ and arg_53_1.time_ < var_56_15 + var_56_25 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_15) / var_56_25

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_15 + var_56_25 and arg_53_1.time_ < var_56_15 + var_56_25 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play319271014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 319271014
		arg_57_1.duration_ = 1.999999999999

		SetActive(arg_57_1.tipsGo_, false)

		function arg_57_1.onSingleLineFinish_()
			arg_57_1.onSingleLineUpdate_ = nil
			arg_57_1.onSingleLineFinish_ = nil
			arg_57_1.state_ = "waiting"
		end

		function arg_57_1.playNext_(arg_59_0)
			if arg_59_0 == 1 then
				arg_57_0:Play319271015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = "10079ui_story"

			if arg_57_1.actors_[var_60_0] == nil then
				local var_60_1 = Object.Instantiate(Asset.Load("Char/" .. var_60_0), arg_57_1.stage_.transform)

				var_60_1.name = var_60_0
				var_60_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_57_1.actors_[var_60_0] = var_60_1

				local var_60_2 = var_60_1:GetComponentInChildren(typeof(CharacterEffect))

				var_60_2.enabled = true

				local var_60_3 = GameObjectTools.GetOrAddComponent(var_60_1, typeof(DynamicBoneHelper))

				if var_60_3 then
					var_60_3:EnableDynamicBone(false)
				end

				arg_57_1:ShowWeapon(var_60_2.transform, false)

				arg_57_1.var_[var_60_0 .. "Animator"] = var_60_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_57_1.var_[var_60_0 .. "Animator"].applyRootMotion = true
				arg_57_1.var_[var_60_0 .. "LipSync"] = var_60_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_60_4 = arg_57_1.actors_["10079ui_story"].transform
			local var_60_5 = 0

			if var_60_5 < arg_57_1.time_ and arg_57_1.time_ <= var_60_5 + arg_60_0 then
				arg_57_1.var_.moveOldPos10079ui_story = var_60_4.localPosition

				local var_60_6 = "10079ui_story"

				arg_57_1:ShowWeapon(arg_57_1.var_[var_60_6 .. "Animator"].transform, false)
			end

			local var_60_7 = 0.001

			if var_60_5 <= arg_57_1.time_ and arg_57_1.time_ < var_60_5 + var_60_7 then
				local var_60_8 = (arg_57_1.time_ - var_60_5) / var_60_7
				local var_60_9 = Vector3.New(0.7, -0.95, -6.05)

				var_60_4.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPos10079ui_story, var_60_9, var_60_8)

				local var_60_10 = manager.ui.mainCamera.transform.position - var_60_4.position

				var_60_4.forward = Vector3.New(var_60_10.x, var_60_10.y, var_60_10.z)

				local var_60_11 = var_60_4.localEulerAngles

				var_60_11.z = 0
				var_60_11.x = 0
				var_60_4.localEulerAngles = var_60_11
			end

			if arg_57_1.time_ >= var_60_5 + var_60_7 and arg_57_1.time_ < var_60_5 + var_60_7 + arg_60_0 then
				var_60_4.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_60_12 = manager.ui.mainCamera.transform.position - var_60_4.position

				var_60_4.forward = Vector3.New(var_60_12.x, var_60_12.y, var_60_12.z)

				local var_60_13 = var_60_4.localEulerAngles

				var_60_13.z = 0
				var_60_13.x = 0
				var_60_4.localEulerAngles = var_60_13
			end

			local var_60_14 = arg_57_1.actors_["10079ui_story"]
			local var_60_15 = 0

			if var_60_15 < arg_57_1.time_ and arg_57_1.time_ <= var_60_15 + arg_60_0 and arg_57_1.var_.characterEffect10079ui_story == nil then
				arg_57_1.var_.characterEffect10079ui_story = var_60_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_16 = 0.200000002980232

			if var_60_15 <= arg_57_1.time_ and arg_57_1.time_ < var_60_15 + var_60_16 then
				local var_60_17 = (arg_57_1.time_ - var_60_15) / var_60_16

				if arg_57_1.var_.characterEffect10079ui_story then
					arg_57_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_57_1.time_ >= var_60_15 + var_60_16 and arg_57_1.time_ < var_60_15 + var_60_16 + arg_60_0 and arg_57_1.var_.characterEffect10079ui_story then
				arg_57_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_60_18 = 0

			if var_60_18 < arg_57_1.time_ and arg_57_1.time_ <= var_60_18 + arg_60_0 then
				arg_57_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_60_19 = 0

			if var_60_19 < arg_57_1.time_ and arg_57_1.time_ <= var_60_19 + arg_60_0 then
				arg_57_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_60_20 = arg_57_1.actors_["1095ui_story"].transform
			local var_60_21 = 0

			if var_60_21 < arg_57_1.time_ and arg_57_1.time_ <= var_60_21 + arg_60_0 then
				arg_57_1.var_.moveOldPos1095ui_story = var_60_20.localPosition
			end

			local var_60_22 = 0.001

			if var_60_21 <= arg_57_1.time_ and arg_57_1.time_ < var_60_21 + var_60_22 then
				local var_60_23 = (arg_57_1.time_ - var_60_21) / var_60_22
				local var_60_24 = Vector3.New(-0.7, -0.98, -6.1)

				var_60_20.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPos1095ui_story, var_60_24, var_60_23)

				local var_60_25 = manager.ui.mainCamera.transform.position - var_60_20.position

				var_60_20.forward = Vector3.New(var_60_25.x, var_60_25.y, var_60_25.z)

				local var_60_26 = var_60_20.localEulerAngles

				var_60_26.z = 0
				var_60_26.x = 0
				var_60_20.localEulerAngles = var_60_26
			end

			if arg_57_1.time_ >= var_60_21 + var_60_22 and arg_57_1.time_ < var_60_21 + var_60_22 + arg_60_0 then
				var_60_20.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_60_27 = manager.ui.mainCamera.transform.position - var_60_20.position

				var_60_20.forward = Vector3.New(var_60_27.x, var_60_27.y, var_60_27.z)

				local var_60_28 = var_60_20.localEulerAngles

				var_60_28.z = 0
				var_60_28.x = 0
				var_60_20.localEulerAngles = var_60_28
			end

			local var_60_29 = arg_57_1.actors_["1095ui_story"]
			local var_60_30 = 0

			if var_60_30 < arg_57_1.time_ and arg_57_1.time_ <= var_60_30 + arg_60_0 and arg_57_1.var_.characterEffect1095ui_story == nil then
				arg_57_1.var_.characterEffect1095ui_story = var_60_29:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_31 = 0.200000002980232

			if var_60_30 <= arg_57_1.time_ and arg_57_1.time_ < var_60_30 + var_60_31 then
				local var_60_32 = (arg_57_1.time_ - var_60_30) / var_60_31

				if arg_57_1.var_.characterEffect1095ui_story then
					local var_60_33 = Mathf.Lerp(0, 0.5, var_60_32)

					arg_57_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_57_1.var_.characterEffect1095ui_story.fillRatio = var_60_33
				end
			end

			if arg_57_1.time_ >= var_60_30 + var_60_31 and arg_57_1.time_ < var_60_30 + var_60_31 + arg_60_0 and arg_57_1.var_.characterEffect1095ui_story then
				local var_60_34 = 0.5

				arg_57_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_57_1.var_.characterEffect1095ui_story.fillRatio = var_60_34
			end

			local var_60_35 = 0
			local var_60_36 = 0.1

			if var_60_35 < arg_57_1.time_ and arg_57_1.time_ <= var_60_35 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_37 = arg_57_1:FormatText(StoryNameCfg[6].name)

				arg_57_1.leftNameTxt_.text = var_60_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_38 = arg_57_1:GetWordFromCfg(319271014)
				local var_60_39 = arg_57_1:FormatText(var_60_38.content)

				arg_57_1.text_.text = var_60_39

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_40 = 4
				local var_60_41 = utf8.len(var_60_39)
				local var_60_42 = var_60_40 <= 0 and var_60_36 or var_60_36 * (var_60_41 / var_60_40)

				if var_60_42 > 0 and var_60_36 < var_60_42 then
					arg_57_1.talkMaxDuration = var_60_42

					if var_60_42 + var_60_35 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_42 + var_60_35
					end
				end

				arg_57_1.text_.text = var_60_39
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319271", "319271014", "story_v_out_319271.awb") ~= 0 then
					local var_60_43 = manager.audio:GetVoiceLength("story_v_out_319271", "319271014", "story_v_out_319271.awb") / 1000

					if var_60_43 + var_60_35 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_43 + var_60_35
					end

					if var_60_38.prefab_name ~= "" and arg_57_1.actors_[var_60_38.prefab_name] ~= nil then
						local var_60_44 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_38.prefab_name].transform, "story_v_out_319271", "319271014", "story_v_out_319271.awb")

						arg_57_1:RecordAudio("319271014", var_60_44)
						arg_57_1:RecordAudio("319271014", var_60_44)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_319271", "319271014", "story_v_out_319271.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_319271", "319271014", "story_v_out_319271.awb")
				end

				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_45 = math.max(var_60_36, arg_57_1.talkMaxDuration)

			if var_60_35 <= arg_57_1.time_ and arg_57_1.time_ < var_60_35 + var_60_45 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_35) / var_60_45

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_35 + var_60_45 and arg_57_1.time_ < var_60_35 + var_60_45 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play319271015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 319271015
		arg_61_1.duration_ = 7.066

		local var_61_0 = {
			zh = 7.066,
			ja = 6.433
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
				arg_61_0:Play319271016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = "4040ui_story"

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

			local var_64_4 = arg_61_1.actors_["4040ui_story"].transform
			local var_64_5 = 0

			if var_64_5 < arg_61_1.time_ and arg_61_1.time_ <= var_64_5 + arg_64_0 then
				arg_61_1.var_.moveOldPos4040ui_story = var_64_4.localPosition
			end

			local var_64_6 = 0.001

			if var_64_5 <= arg_61_1.time_ and arg_61_1.time_ < var_64_5 + var_64_6 then
				local var_64_7 = (arg_61_1.time_ - var_64_5) / var_64_6
				local var_64_8 = Vector3.New(0, -1.55, -5.5)

				var_64_4.localPosition = Vector3.Lerp(arg_61_1.var_.moveOldPos4040ui_story, var_64_8, var_64_7)

				local var_64_9 = manager.ui.mainCamera.transform.position - var_64_4.position

				var_64_4.forward = Vector3.New(var_64_9.x, var_64_9.y, var_64_9.z)

				local var_64_10 = var_64_4.localEulerAngles

				var_64_10.z = 0
				var_64_10.x = 0
				var_64_4.localEulerAngles = var_64_10
			end

			if arg_61_1.time_ >= var_64_5 + var_64_6 and arg_61_1.time_ < var_64_5 + var_64_6 + arg_64_0 then
				var_64_4.localPosition = Vector3.New(0, -1.55, -5.5)

				local var_64_11 = manager.ui.mainCamera.transform.position - var_64_4.position

				var_64_4.forward = Vector3.New(var_64_11.x, var_64_11.y, var_64_11.z)

				local var_64_12 = var_64_4.localEulerAngles

				var_64_12.z = 0
				var_64_12.x = 0
				var_64_4.localEulerAngles = var_64_12
			end

			local var_64_13 = arg_61_1.actors_["4040ui_story"]
			local var_64_14 = 0

			if var_64_14 < arg_61_1.time_ and arg_61_1.time_ <= var_64_14 + arg_64_0 and arg_61_1.var_.characterEffect4040ui_story == nil then
				arg_61_1.var_.characterEffect4040ui_story = var_64_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_15 = 0.200000002980232

			if var_64_14 <= arg_61_1.time_ and arg_61_1.time_ < var_64_14 + var_64_15 then
				local var_64_16 = (arg_61_1.time_ - var_64_14) / var_64_15

				if arg_61_1.var_.characterEffect4040ui_story then
					arg_61_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_61_1.time_ >= var_64_14 + var_64_15 and arg_61_1.time_ < var_64_14 + var_64_15 + arg_64_0 and arg_61_1.var_.characterEffect4040ui_story then
				arg_61_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_64_17 = 0

			if var_64_17 < arg_61_1.time_ and arg_61_1.time_ <= var_64_17 + arg_64_0 then
				arg_61_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action4_1")
			end

			local var_64_18 = 0

			if var_64_18 < arg_61_1.time_ and arg_61_1.time_ <= var_64_18 + arg_64_0 then
				arg_61_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_64_19 = arg_61_1.actors_["10079ui_story"].transform
			local var_64_20 = 0

			if var_64_20 < arg_61_1.time_ and arg_61_1.time_ <= var_64_20 + arg_64_0 then
				arg_61_1.var_.moveOldPos10079ui_story = var_64_19.localPosition
			end

			local var_64_21 = 0.001

			if var_64_20 <= arg_61_1.time_ and arg_61_1.time_ < var_64_20 + var_64_21 then
				local var_64_22 = (arg_61_1.time_ - var_64_20) / var_64_21
				local var_64_23 = Vector3.New(0, 100, 0)

				var_64_19.localPosition = Vector3.Lerp(arg_61_1.var_.moveOldPos10079ui_story, var_64_23, var_64_22)

				local var_64_24 = manager.ui.mainCamera.transform.position - var_64_19.position

				var_64_19.forward = Vector3.New(var_64_24.x, var_64_24.y, var_64_24.z)

				local var_64_25 = var_64_19.localEulerAngles

				var_64_25.z = 0
				var_64_25.x = 0
				var_64_19.localEulerAngles = var_64_25
			end

			if arg_61_1.time_ >= var_64_20 + var_64_21 and arg_61_1.time_ < var_64_20 + var_64_21 + arg_64_0 then
				var_64_19.localPosition = Vector3.New(0, 100, 0)

				local var_64_26 = manager.ui.mainCamera.transform.position - var_64_19.position

				var_64_19.forward = Vector3.New(var_64_26.x, var_64_26.y, var_64_26.z)

				local var_64_27 = var_64_19.localEulerAngles

				var_64_27.z = 0
				var_64_27.x = 0
				var_64_19.localEulerAngles = var_64_27
			end

			local var_64_28 = arg_61_1.actors_["10079ui_story"]
			local var_64_29 = 0

			if var_64_29 < arg_61_1.time_ and arg_61_1.time_ <= var_64_29 + arg_64_0 and arg_61_1.var_.characterEffect10079ui_story == nil then
				arg_61_1.var_.characterEffect10079ui_story = var_64_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_30 = 0.200000002980232

			if var_64_29 <= arg_61_1.time_ and arg_61_1.time_ < var_64_29 + var_64_30 then
				local var_64_31 = (arg_61_1.time_ - var_64_29) / var_64_30

				if arg_61_1.var_.characterEffect10079ui_story then
					local var_64_32 = Mathf.Lerp(0, 0.5, var_64_31)

					arg_61_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_61_1.var_.characterEffect10079ui_story.fillRatio = var_64_32
				end
			end

			if arg_61_1.time_ >= var_64_29 + var_64_30 and arg_61_1.time_ < var_64_29 + var_64_30 + arg_64_0 and arg_61_1.var_.characterEffect10079ui_story then
				local var_64_33 = 0.5

				arg_61_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_61_1.var_.characterEffect10079ui_story.fillRatio = var_64_33
			end

			local var_64_34 = arg_61_1.actors_["1095ui_story"].transform
			local var_64_35 = 0

			if var_64_35 < arg_61_1.time_ and arg_61_1.time_ <= var_64_35 + arg_64_0 then
				arg_61_1.var_.moveOldPos1095ui_story = var_64_34.localPosition
			end

			local var_64_36 = 0.001

			if var_64_35 <= arg_61_1.time_ and arg_61_1.time_ < var_64_35 + var_64_36 then
				local var_64_37 = (arg_61_1.time_ - var_64_35) / var_64_36
				local var_64_38 = Vector3.New(0, 100, 0)

				var_64_34.localPosition = Vector3.Lerp(arg_61_1.var_.moveOldPos1095ui_story, var_64_38, var_64_37)

				local var_64_39 = manager.ui.mainCamera.transform.position - var_64_34.position

				var_64_34.forward = Vector3.New(var_64_39.x, var_64_39.y, var_64_39.z)

				local var_64_40 = var_64_34.localEulerAngles

				var_64_40.z = 0
				var_64_40.x = 0
				var_64_34.localEulerAngles = var_64_40
			end

			if arg_61_1.time_ >= var_64_35 + var_64_36 and arg_61_1.time_ < var_64_35 + var_64_36 + arg_64_0 then
				var_64_34.localPosition = Vector3.New(0, 100, 0)

				local var_64_41 = manager.ui.mainCamera.transform.position - var_64_34.position

				var_64_34.forward = Vector3.New(var_64_41.x, var_64_41.y, var_64_41.z)

				local var_64_42 = var_64_34.localEulerAngles

				var_64_42.z = 0
				var_64_42.x = 0
				var_64_34.localEulerAngles = var_64_42
			end

			local var_64_43 = arg_61_1.actors_["1095ui_story"]
			local var_64_44 = 0

			if var_64_44 < arg_61_1.time_ and arg_61_1.time_ <= var_64_44 + arg_64_0 and arg_61_1.var_.characterEffect1095ui_story == nil then
				arg_61_1.var_.characterEffect1095ui_story = var_64_43:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_45 = 0.200000002980232

			if var_64_44 <= arg_61_1.time_ and arg_61_1.time_ < var_64_44 + var_64_45 then
				local var_64_46 = (arg_61_1.time_ - var_64_44) / var_64_45

				if arg_61_1.var_.characterEffect1095ui_story then
					local var_64_47 = Mathf.Lerp(0, 0.5, var_64_46)

					arg_61_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_61_1.var_.characterEffect1095ui_story.fillRatio = var_64_47
				end
			end

			if arg_61_1.time_ >= var_64_44 + var_64_45 and arg_61_1.time_ < var_64_44 + var_64_45 + arg_64_0 and arg_61_1.var_.characterEffect1095ui_story then
				local var_64_48 = 0.5

				arg_61_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_61_1.var_.characterEffect1095ui_story.fillRatio = var_64_48
			end

			local var_64_49 = 0
			local var_64_50 = 0.7

			if var_64_49 < arg_61_1.time_ and arg_61_1.time_ <= var_64_49 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_51 = arg_61_1:FormatText(StoryNameCfg[668].name)

				arg_61_1.leftNameTxt_.text = var_64_51

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_52 = arg_61_1:GetWordFromCfg(319271015)
				local var_64_53 = arg_61_1:FormatText(var_64_52.content)

				arg_61_1.text_.text = var_64_53

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_54 = 28
				local var_64_55 = utf8.len(var_64_53)
				local var_64_56 = var_64_54 <= 0 and var_64_50 or var_64_50 * (var_64_55 / var_64_54)

				if var_64_56 > 0 and var_64_50 < var_64_56 then
					arg_61_1.talkMaxDuration = var_64_56

					if var_64_56 + var_64_49 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_56 + var_64_49
					end
				end

				arg_61_1.text_.text = var_64_53
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319271", "319271015", "story_v_out_319271.awb") ~= 0 then
					local var_64_57 = manager.audio:GetVoiceLength("story_v_out_319271", "319271015", "story_v_out_319271.awb") / 1000

					if var_64_57 + var_64_49 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_57 + var_64_49
					end

					if var_64_52.prefab_name ~= "" and arg_61_1.actors_[var_64_52.prefab_name] ~= nil then
						local var_64_58 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_52.prefab_name].transform, "story_v_out_319271", "319271015", "story_v_out_319271.awb")

						arg_61_1:RecordAudio("319271015", var_64_58)
						arg_61_1:RecordAudio("319271015", var_64_58)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_319271", "319271015", "story_v_out_319271.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_319271", "319271015", "story_v_out_319271.awb")
				end

				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_59 = math.max(var_64_50, arg_61_1.talkMaxDuration)

			if var_64_49 <= arg_61_1.time_ and arg_61_1.time_ < var_64_49 + var_64_59 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_49) / var_64_59

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_49 + var_64_59 and arg_61_1.time_ < var_64_49 + var_64_59 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play319271016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 319271016
		arg_65_1.duration_ = 7.233

		local var_65_0 = {
			zh = 5.033,
			ja = 7.233
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
				arg_65_0:Play319271017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = 0
			local var_68_1 = 0.5

			if var_68_0 < arg_65_1.time_ and arg_65_1.time_ <= var_68_0 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_2 = arg_65_1:FormatText(StoryNameCfg[668].name)

				arg_65_1.leftNameTxt_.text = var_68_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_3 = arg_65_1:GetWordFromCfg(319271016)
				local var_68_4 = arg_65_1:FormatText(var_68_3.content)

				arg_65_1.text_.text = var_68_4

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_5 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_319271", "319271016", "story_v_out_319271.awb") ~= 0 then
					local var_68_8 = manager.audio:GetVoiceLength("story_v_out_319271", "319271016", "story_v_out_319271.awb") / 1000

					if var_68_8 + var_68_0 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_8 + var_68_0
					end

					if var_68_3.prefab_name ~= "" and arg_65_1.actors_[var_68_3.prefab_name] ~= nil then
						local var_68_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_3.prefab_name].transform, "story_v_out_319271", "319271016", "story_v_out_319271.awb")

						arg_65_1:RecordAudio("319271016", var_68_9)
						arg_65_1:RecordAudio("319271016", var_68_9)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_319271", "319271016", "story_v_out_319271.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_319271", "319271016", "story_v_out_319271.awb")
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
	Play319271017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 319271017
		arg_69_1.duration_ = 5.133

		local var_69_0 = {
			zh = 3.566,
			ja = 5.133
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
				arg_69_0:Play319271018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = arg_69_1.actors_["4040ui_story"]
			local var_72_1 = 0

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 and arg_69_1.var_.characterEffect4040ui_story == nil then
				arg_69_1.var_.characterEffect4040ui_story = var_72_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_2 = 0.200000002980232

			if var_72_1 <= arg_69_1.time_ and arg_69_1.time_ < var_72_1 + var_72_2 then
				local var_72_3 = (arg_69_1.time_ - var_72_1) / var_72_2

				if arg_69_1.var_.characterEffect4040ui_story then
					local var_72_4 = Mathf.Lerp(0, 0.5, var_72_3)

					arg_69_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_69_1.var_.characterEffect4040ui_story.fillRatio = var_72_4
				end
			end

			if arg_69_1.time_ >= var_72_1 + var_72_2 and arg_69_1.time_ < var_72_1 + var_72_2 + arg_72_0 and arg_69_1.var_.characterEffect4040ui_story then
				local var_72_5 = 0.5

				arg_69_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_69_1.var_.characterEffect4040ui_story.fillRatio = var_72_5
			end

			local var_72_6 = 0
			local var_72_7 = 0.475

			if var_72_6 < arg_69_1.time_ and arg_69_1.time_ <= var_72_6 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_8 = arg_69_1:FormatText(StoryNameCfg[721].name)

				arg_69_1.leftNameTxt_.text = var_72_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, true)
				arg_69_1.iconController_:SetSelectedState("hero")

				arg_69_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10090")

				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_9 = arg_69_1:GetWordFromCfg(319271017)
				local var_72_10 = arg_69_1:FormatText(var_72_9.content)

				arg_69_1.text_.text = var_72_10

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_11 = 19
				local var_72_12 = utf8.len(var_72_10)
				local var_72_13 = var_72_11 <= 0 and var_72_7 or var_72_7 * (var_72_12 / var_72_11)

				if var_72_13 > 0 and var_72_7 < var_72_13 then
					arg_69_1.talkMaxDuration = var_72_13

					if var_72_13 + var_72_6 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_13 + var_72_6
					end
				end

				arg_69_1.text_.text = var_72_10
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319271", "319271017", "story_v_out_319271.awb") ~= 0 then
					local var_72_14 = manager.audio:GetVoiceLength("story_v_out_319271", "319271017", "story_v_out_319271.awb") / 1000

					if var_72_14 + var_72_6 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_14 + var_72_6
					end

					if var_72_9.prefab_name ~= "" and arg_69_1.actors_[var_72_9.prefab_name] ~= nil then
						local var_72_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_9.prefab_name].transform, "story_v_out_319271", "319271017", "story_v_out_319271.awb")

						arg_69_1:RecordAudio("319271017", var_72_15)
						arg_69_1:RecordAudio("319271017", var_72_15)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_319271", "319271017", "story_v_out_319271.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_319271", "319271017", "story_v_out_319271.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_16 = math.max(var_72_7, arg_69_1.talkMaxDuration)

			if var_72_6 <= arg_69_1.time_ and arg_69_1.time_ < var_72_6 + var_72_16 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_6) / var_72_16

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_6 + var_72_16 and arg_69_1.time_ < var_72_6 + var_72_16 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play319271018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 319271018
		arg_73_1.duration_ = 7.533

		local var_73_0 = {
			zh = 6.166,
			ja = 7.533
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
				arg_73_0:Play319271019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["4040ui_story"]
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 and arg_73_1.var_.characterEffect4040ui_story == nil then
				arg_73_1.var_.characterEffect4040ui_story = var_76_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_2 = 0.200000002980232

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_2 then
				local var_76_3 = (arg_73_1.time_ - var_76_1) / var_76_2

				if arg_73_1.var_.characterEffect4040ui_story then
					arg_73_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_73_1.time_ >= var_76_1 + var_76_2 and arg_73_1.time_ < var_76_1 + var_76_2 + arg_76_0 and arg_73_1.var_.characterEffect4040ui_story then
				arg_73_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_76_4 = 0

			if var_76_4 < arg_73_1.time_ and arg_73_1.time_ <= var_76_4 + arg_76_0 then
				arg_73_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040actionlink/4040action447")
			end

			local var_76_5 = 0

			if var_76_5 < arg_73_1.time_ and arg_73_1.time_ <= var_76_5 + arg_76_0 then
				arg_73_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_76_6 = 0
			local var_76_7 = 0.575

			if var_76_6 < arg_73_1.time_ and arg_73_1.time_ <= var_76_6 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_8 = arg_73_1:FormatText(StoryNameCfg[668].name)

				arg_73_1.leftNameTxt_.text = var_76_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_9 = arg_73_1:GetWordFromCfg(319271018)
				local var_76_10 = arg_73_1:FormatText(var_76_9.content)

				arg_73_1.text_.text = var_76_10

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_11 = 23
				local var_76_12 = utf8.len(var_76_10)
				local var_76_13 = var_76_11 <= 0 and var_76_7 or var_76_7 * (var_76_12 / var_76_11)

				if var_76_13 > 0 and var_76_7 < var_76_13 then
					arg_73_1.talkMaxDuration = var_76_13

					if var_76_13 + var_76_6 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_13 + var_76_6
					end
				end

				arg_73_1.text_.text = var_76_10
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319271", "319271018", "story_v_out_319271.awb") ~= 0 then
					local var_76_14 = manager.audio:GetVoiceLength("story_v_out_319271", "319271018", "story_v_out_319271.awb") / 1000

					if var_76_14 + var_76_6 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_14 + var_76_6
					end

					if var_76_9.prefab_name ~= "" and arg_73_1.actors_[var_76_9.prefab_name] ~= nil then
						local var_76_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_9.prefab_name].transform, "story_v_out_319271", "319271018", "story_v_out_319271.awb")

						arg_73_1:RecordAudio("319271018", var_76_15)
						arg_73_1:RecordAudio("319271018", var_76_15)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_319271", "319271018", "story_v_out_319271.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_319271", "319271018", "story_v_out_319271.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_16 = math.max(var_76_7, arg_73_1.talkMaxDuration)

			if var_76_6 <= arg_73_1.time_ and arg_73_1.time_ < var_76_6 + var_76_16 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_6) / var_76_16

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_6 + var_76_16 and arg_73_1.time_ < var_76_6 + var_76_16 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play319271019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 319271019
		arg_77_1.duration_ = 5

		SetActive(arg_77_1.tipsGo_, false)

		function arg_77_1.onSingleLineFinish_()
			arg_77_1.onSingleLineUpdate_ = nil
			arg_77_1.onSingleLineFinish_ = nil
			arg_77_1.state_ = "waiting"
		end

		function arg_77_1.playNext_(arg_79_0)
			if arg_79_0 == 1 then
				arg_77_0:Play319271020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["4040ui_story"].transform
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 then
				arg_77_1.var_.moveOldPos4040ui_story = var_80_0.localPosition
			end

			local var_80_2 = 0.001

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2
				local var_80_4 = Vector3.New(0, 100, 0)

				var_80_0.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos4040ui_story, var_80_4, var_80_3)

				local var_80_5 = manager.ui.mainCamera.transform.position - var_80_0.position

				var_80_0.forward = Vector3.New(var_80_5.x, var_80_5.y, var_80_5.z)

				local var_80_6 = var_80_0.localEulerAngles

				var_80_6.z = 0
				var_80_6.x = 0
				var_80_0.localEulerAngles = var_80_6
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 then
				var_80_0.localPosition = Vector3.New(0, 100, 0)

				local var_80_7 = manager.ui.mainCamera.transform.position - var_80_0.position

				var_80_0.forward = Vector3.New(var_80_7.x, var_80_7.y, var_80_7.z)

				local var_80_8 = var_80_0.localEulerAngles

				var_80_8.z = 0
				var_80_8.x = 0
				var_80_0.localEulerAngles = var_80_8
			end

			local var_80_9 = 0
			local var_80_10 = 0.975

			if var_80_9 < arg_77_1.time_ and arg_77_1.time_ <= var_80_9 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, false)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_11 = arg_77_1:GetWordFromCfg(319271019)
				local var_80_12 = arg_77_1:FormatText(var_80_11.content)

				arg_77_1.text_.text = var_80_12

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_13 = 39
				local var_80_14 = utf8.len(var_80_12)
				local var_80_15 = var_80_13 <= 0 and var_80_10 or var_80_10 * (var_80_14 / var_80_13)

				if var_80_15 > 0 and var_80_10 < var_80_15 then
					arg_77_1.talkMaxDuration = var_80_15

					if var_80_15 + var_80_9 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_15 + var_80_9
					end
				end

				arg_77_1.text_.text = var_80_12
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)
				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_16 = math.max(var_80_10, arg_77_1.talkMaxDuration)

			if var_80_9 <= arg_77_1.time_ and arg_77_1.time_ < var_80_9 + var_80_16 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_9) / var_80_16

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_9 + var_80_16 and arg_77_1.time_ < var_80_9 + var_80_16 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play319271020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 319271020
		arg_81_1.duration_ = 5.8

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play319271021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = 0
			local var_84_1 = 1

			if var_84_0 < arg_81_1.time_ and arg_81_1.time_ <= var_84_0 + arg_84_0 then
				local var_84_2 = "play"
				local var_84_3 = "effect"

				arg_81_1:AudioAction(var_84_2, var_84_3, "se_story_15", "se_story_15_gun07", "")
			end

			local var_84_4 = 0
			local var_84_5 = 1

			if var_84_4 < arg_81_1.time_ and arg_81_1.time_ <= var_84_4 + arg_84_0 then
				local var_84_6 = "play"
				local var_84_7 = "effect"

				arg_81_1:AudioAction(var_84_6, var_84_7, "se_story_123_02", "se_story_123_02_cannon_loop", "")
			end

			local var_84_8 = manager.ui.mainCamera.transform
			local var_84_9 = 0.366666666666667

			if var_84_9 < arg_81_1.time_ and arg_81_1.time_ <= var_84_9 + arg_84_0 then
				local var_84_10 = arg_81_1.var_.effect110

				if not var_84_10 then
					var_84_10 = Object.Instantiate(Asset.Load("Effect/Scene/fx_ui_slash_01"))
					var_84_10.name = "110"
					arg_81_1.var_.effect110 = var_84_10
				end

				local var_84_11 = var_84_8:Find("")

				if var_84_11 then
					var_84_10.transform.parent = var_84_11
				else
					var_84_10.transform.parent = var_84_8
				end

				var_84_10.transform.localPosition = Vector3.New(0, 0, 0)
				var_84_10.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_84_12 = 0

			if var_84_12 < arg_81_1.time_ and arg_81_1.time_ <= var_84_12 + arg_84_0 then
				arg_81_1.mask_.enabled = true
				arg_81_1.mask_.raycastTarget = false

				arg_81_1:SetGaussion(false)
			end

			local var_84_13 = 0.2

			if var_84_12 <= arg_81_1.time_ and arg_81_1.time_ < var_84_12 + var_84_13 then
				local var_84_14 = (arg_81_1.time_ - var_84_12) / var_84_13
				local var_84_15 = Color.New(0.8679245, 0.1351015, 0.1351015)

				var_84_15.a = Mathf.Lerp(1, 0, var_84_14)
				arg_81_1.mask_.color = var_84_15
			end

			if arg_81_1.time_ >= var_84_12 + var_84_13 and arg_81_1.time_ < var_84_12 + var_84_13 + arg_84_0 then
				local var_84_16 = Color.New(0.8679245, 0.1351015, 0.1351015)
				local var_84_17 = 0

				arg_81_1.mask_.enabled = false
				var_84_16.a = var_84_17
				arg_81_1.mask_.color = var_84_16
			end

			local var_84_18 = 0.2

			if var_84_18 < arg_81_1.time_ and arg_81_1.time_ <= var_84_18 + arg_84_0 then
				arg_81_1.mask_.enabled = true
				arg_81_1.mask_.raycastTarget = false

				arg_81_1:SetGaussion(false)
			end

			local var_84_19 = 0.2

			if var_84_18 <= arg_81_1.time_ and arg_81_1.time_ < var_84_18 + var_84_19 then
				local var_84_20 = (arg_81_1.time_ - var_84_18) / var_84_19
				local var_84_21 = Color.New(0.8679245, 0.1351015, 0.1351015)

				var_84_21.a = Mathf.Lerp(1, 0, var_84_20)
				arg_81_1.mask_.color = var_84_21
			end

			if arg_81_1.time_ >= var_84_18 + var_84_19 and arg_81_1.time_ < var_84_18 + var_84_19 + arg_84_0 then
				local var_84_22 = Color.New(0.8679245, 0.1351015, 0.1351015)
				local var_84_23 = 0

				arg_81_1.mask_.enabled = false
				var_84_22.a = var_84_23
				arg_81_1.mask_.color = var_84_22
			end

			if arg_81_1.frameCnt_ <= 1 then
				arg_81_1.dialog_:SetActive(false)
			end

			local var_84_24 = 0.8
			local var_84_25 = 0.95

			if var_84_24 < arg_81_1.time_ and arg_81_1.time_ <= var_84_24 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0

				arg_81_1.dialog_:SetActive(true)

				local var_84_26 = LeanTween.value(arg_81_1.dialog_, 0, 1, 0.3)

				var_84_26:setOnUpdate(LuaHelper.FloatAction(function(arg_85_0)
					arg_81_1.dialogCg_.alpha = arg_85_0
				end))
				var_84_26:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_81_1.dialog_)
					var_84_26:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_81_1.duration_ = arg_81_1.duration_ + 0.3

				SetActive(arg_81_1.leftNameGo_, false)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_27 = arg_81_1:GetWordFromCfg(319271020)
				local var_84_28 = arg_81_1:FormatText(var_84_27.content)

				arg_81_1.text_.text = var_84_28

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_29 = 38
				local var_84_30 = utf8.len(var_84_28)
				local var_84_31 = var_84_29 <= 0 and var_84_25 or var_84_25 * (var_84_30 / var_84_29)

				if var_84_31 > 0 and var_84_25 < var_84_31 then
					arg_81_1.talkMaxDuration = var_84_31
					var_84_24 = var_84_24 + 0.3

					if var_84_31 + var_84_24 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_31 + var_84_24
					end
				end

				arg_81_1.text_.text = var_84_28
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)
				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_32 = var_84_24 + 0.3
			local var_84_33 = math.max(var_84_25, arg_81_1.talkMaxDuration)

			if var_84_32 <= arg_81_1.time_ and arg_81_1.time_ < var_84_32 + var_84_33 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_32) / var_84_33

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_32 + var_84_33 and arg_81_1.time_ < var_84_32 + var_84_33 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play319271021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 319271021
		arg_87_1.duration_ = 3.133

		local var_87_0 = {
			zh = 1.999999999999,
			ja = 3.133
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
				arg_87_0:Play319271022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["4040ui_story"].transform
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1.var_.moveOldPos4040ui_story = var_90_0.localPosition
			end

			local var_90_2 = 0.001

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2
				local var_90_4 = Vector3.New(0, -1.55, -5.5)

				var_90_0.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos4040ui_story, var_90_4, var_90_3)

				local var_90_5 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_5.x, var_90_5.y, var_90_5.z)

				local var_90_6 = var_90_0.localEulerAngles

				var_90_6.z = 0
				var_90_6.x = 0
				var_90_0.localEulerAngles = var_90_6
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 then
				var_90_0.localPosition = Vector3.New(0, -1.55, -5.5)

				local var_90_7 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_7.x, var_90_7.y, var_90_7.z)

				local var_90_8 = var_90_0.localEulerAngles

				var_90_8.z = 0
				var_90_8.x = 0
				var_90_0.localEulerAngles = var_90_8
			end

			local var_90_9 = arg_87_1.actors_["4040ui_story"]
			local var_90_10 = 0

			if var_90_10 < arg_87_1.time_ and arg_87_1.time_ <= var_90_10 + arg_90_0 and arg_87_1.var_.characterEffect4040ui_story == nil then
				arg_87_1.var_.characterEffect4040ui_story = var_90_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_11 = 0.200000002980232

			if var_90_10 <= arg_87_1.time_ and arg_87_1.time_ < var_90_10 + var_90_11 then
				local var_90_12 = (arg_87_1.time_ - var_90_10) / var_90_11

				if arg_87_1.var_.characterEffect4040ui_story then
					arg_87_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_10 + var_90_11 and arg_87_1.time_ < var_90_10 + var_90_11 + arg_90_0 and arg_87_1.var_.characterEffect4040ui_story then
				arg_87_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_90_13 = 0

			if var_90_13 < arg_87_1.time_ and arg_87_1.time_ <= var_90_13 + arg_90_0 then
				arg_87_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1303cva")
			end

			local var_90_14 = manager.ui.mainCamera.transform
			local var_90_15 = 0

			if var_90_15 < arg_87_1.time_ and arg_87_1.time_ <= var_90_15 + arg_90_0 then
				local var_90_16 = arg_87_1.var_.effect110

				if var_90_16 then
					Object.Destroy(var_90_16)

					arg_87_1.var_.effect110 = nil
				end
			end

			local var_90_17 = 0

			if var_90_17 < arg_87_1.time_ and arg_87_1.time_ <= var_90_17 + arg_90_0 then
				arg_87_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040actionlink/4040action476")
			end

			local var_90_18 = 0
			local var_90_19 = 0.1

			if var_90_18 < arg_87_1.time_ and arg_87_1.time_ <= var_90_18 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_20 = arg_87_1:FormatText(StoryNameCfg[668].name)

				arg_87_1.leftNameTxt_.text = var_90_20

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_21 = arg_87_1:GetWordFromCfg(319271021)
				local var_90_22 = arg_87_1:FormatText(var_90_21.content)

				arg_87_1.text_.text = var_90_22

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_23 = 4
				local var_90_24 = utf8.len(var_90_22)
				local var_90_25 = var_90_23 <= 0 and var_90_19 or var_90_19 * (var_90_24 / var_90_23)

				if var_90_25 > 0 and var_90_19 < var_90_25 then
					arg_87_1.talkMaxDuration = var_90_25

					if var_90_25 + var_90_18 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_25 + var_90_18
					end
				end

				arg_87_1.text_.text = var_90_22
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319271", "319271021", "story_v_out_319271.awb") ~= 0 then
					local var_90_26 = manager.audio:GetVoiceLength("story_v_out_319271", "319271021", "story_v_out_319271.awb") / 1000

					if var_90_26 + var_90_18 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_26 + var_90_18
					end

					if var_90_21.prefab_name ~= "" and arg_87_1.actors_[var_90_21.prefab_name] ~= nil then
						local var_90_27 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_21.prefab_name].transform, "story_v_out_319271", "319271021", "story_v_out_319271.awb")

						arg_87_1:RecordAudio("319271021", var_90_27)
						arg_87_1:RecordAudio("319271021", var_90_27)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_319271", "319271021", "story_v_out_319271.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_319271", "319271021", "story_v_out_319271.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_28 = math.max(var_90_19, arg_87_1.talkMaxDuration)

			if var_90_18 <= arg_87_1.time_ and arg_87_1.time_ < var_90_18 + var_90_28 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_18) / var_90_28

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_18 + var_90_28 and arg_87_1.time_ < var_90_18 + var_90_28 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play319271022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 319271022
		arg_91_1.duration_ = 5

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play319271023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["4040ui_story"]
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 and arg_91_1.var_.characterEffect4040ui_story == nil then
				arg_91_1.var_.characterEffect4040ui_story = var_94_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_2 = 0.2

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2

				if arg_91_1.var_.characterEffect4040ui_story then
					local var_94_4 = Mathf.Lerp(0, 0.5, var_94_3)

					arg_91_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_91_1.var_.characterEffect4040ui_story.fillRatio = var_94_4
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 and arg_91_1.var_.characterEffect4040ui_story then
				local var_94_5 = 0.5

				arg_91_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_91_1.var_.characterEffect4040ui_story.fillRatio = var_94_5
			end

			local var_94_6 = 0
			local var_94_7 = 1.15

			if var_94_6 < arg_91_1.time_ and arg_91_1.time_ <= var_94_6 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, false)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_8 = arg_91_1:GetWordFromCfg(319271022)
				local var_94_9 = arg_91_1:FormatText(var_94_8.content)

				arg_91_1.text_.text = var_94_9

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_10 = 46
				local var_94_11 = utf8.len(var_94_9)
				local var_94_12 = var_94_10 <= 0 and var_94_7 or var_94_7 * (var_94_11 / var_94_10)

				if var_94_12 > 0 and var_94_7 < var_94_12 then
					arg_91_1.talkMaxDuration = var_94_12

					if var_94_12 + var_94_6 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_12 + var_94_6
					end
				end

				arg_91_1.text_.text = var_94_9
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)
				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_13 = math.max(var_94_7, arg_91_1.talkMaxDuration)

			if var_94_6 <= arg_91_1.time_ and arg_91_1.time_ < var_94_6 + var_94_13 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_6) / var_94_13

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_6 + var_94_13 and arg_91_1.time_ < var_94_6 + var_94_13 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play319271023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 319271023
		arg_95_1.duration_ = 3.233

		local var_95_0 = {
			zh = 2.6,
			ja = 3.233
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
				arg_95_0:Play319271024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 0

			if var_98_0 < arg_95_1.time_ and arg_95_1.time_ <= var_98_0 + arg_98_0 then
				arg_95_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action6_2")
			end

			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				arg_95_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_98_2 = arg_95_1.actors_["4040ui_story"]
			local var_98_3 = 0

			if var_98_3 < arg_95_1.time_ and arg_95_1.time_ <= var_98_3 + arg_98_0 and arg_95_1.var_.characterEffect4040ui_story == nil then
				arg_95_1.var_.characterEffect4040ui_story = var_98_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_4 = 0.2

			if var_98_3 <= arg_95_1.time_ and arg_95_1.time_ < var_98_3 + var_98_4 then
				local var_98_5 = (arg_95_1.time_ - var_98_3) / var_98_4

				if arg_95_1.var_.characterEffect4040ui_story then
					arg_95_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_95_1.time_ >= var_98_3 + var_98_4 and arg_95_1.time_ < var_98_3 + var_98_4 + arg_98_0 and arg_95_1.var_.characterEffect4040ui_story then
				arg_95_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_98_6 = 0
			local var_98_7 = 0.225

			if var_98_6 < arg_95_1.time_ and arg_95_1.time_ <= var_98_6 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_8 = arg_95_1:FormatText(StoryNameCfg[668].name)

				arg_95_1.leftNameTxt_.text = var_98_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_9 = arg_95_1:GetWordFromCfg(319271023)
				local var_98_10 = arg_95_1:FormatText(var_98_9.content)

				arg_95_1.text_.text = var_98_10

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_11 = 9
				local var_98_12 = utf8.len(var_98_10)
				local var_98_13 = var_98_11 <= 0 and var_98_7 or var_98_7 * (var_98_12 / var_98_11)

				if var_98_13 > 0 and var_98_7 < var_98_13 then
					arg_95_1.talkMaxDuration = var_98_13

					if var_98_13 + var_98_6 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_13 + var_98_6
					end
				end

				arg_95_1.text_.text = var_98_10
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319271", "319271023", "story_v_out_319271.awb") ~= 0 then
					local var_98_14 = manager.audio:GetVoiceLength("story_v_out_319271", "319271023", "story_v_out_319271.awb") / 1000

					if var_98_14 + var_98_6 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_14 + var_98_6
					end

					if var_98_9.prefab_name ~= "" and arg_95_1.actors_[var_98_9.prefab_name] ~= nil then
						local var_98_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_9.prefab_name].transform, "story_v_out_319271", "319271023", "story_v_out_319271.awb")

						arg_95_1:RecordAudio("319271023", var_98_15)
						arg_95_1:RecordAudio("319271023", var_98_15)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_319271", "319271023", "story_v_out_319271.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_319271", "319271023", "story_v_out_319271.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_16 = math.max(var_98_7, arg_95_1.talkMaxDuration)

			if var_98_6 <= arg_95_1.time_ and arg_95_1.time_ < var_98_6 + var_98_16 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_6) / var_98_16

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_6 + var_98_16 and arg_95_1.time_ < var_98_6 + var_98_16 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play319271024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 319271024
		arg_99_1.duration_ = 7

		SetActive(arg_99_1.tipsGo_, false)

		function arg_99_1.onSingleLineFinish_()
			arg_99_1.onSingleLineUpdate_ = nil
			arg_99_1.onSingleLineFinish_ = nil
			arg_99_1.state_ = "waiting"
		end

		function arg_99_1.playNext_(arg_101_0)
			if arg_101_0 == 1 then
				arg_99_0:Play319271025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["4040ui_story"].transform
			local var_102_1 = 1

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1.var_.moveOldPos4040ui_story = var_102_0.localPosition
			end

			local var_102_2 = 0.001

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2
				local var_102_4 = Vector3.New(0, 100, 0)

				var_102_0.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos4040ui_story, var_102_4, var_102_3)

				local var_102_5 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_5.x, var_102_5.y, var_102_5.z)

				local var_102_6 = var_102_0.localEulerAngles

				var_102_6.z = 0
				var_102_6.x = 0
				var_102_0.localEulerAngles = var_102_6
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 then
				var_102_0.localPosition = Vector3.New(0, 100, 0)

				local var_102_7 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_7.x, var_102_7.y, var_102_7.z)

				local var_102_8 = var_102_0.localEulerAngles

				var_102_8.z = 0
				var_102_8.x = 0
				var_102_0.localEulerAngles = var_102_8
			end

			local var_102_9 = 0

			if var_102_9 < arg_99_1.time_ and arg_99_1.time_ <= var_102_9 + arg_102_0 then
				local var_102_10 = manager.ui.mainCamera.transform.localPosition
				local var_102_11 = Vector3.New(0, 0, 10) + Vector3.New(var_102_10.x, var_102_10.y, 0)
				local var_102_12 = arg_99_1.bgs_.I11i

				var_102_12.transform.localPosition = var_102_11
				var_102_12.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_102_13 = var_102_12:GetComponent("SpriteRenderer")

				if var_102_13 and var_102_13.sprite then
					local var_102_14 = (var_102_12.transform.localPosition - var_102_10).z
					local var_102_15 = manager.ui.mainCameraCom_
					local var_102_16 = 2 * var_102_14 * Mathf.Tan(var_102_15.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_102_17 = var_102_16 * var_102_15.aspect
					local var_102_18 = var_102_13.sprite.bounds.size.x
					local var_102_19 = var_102_13.sprite.bounds.size.y
					local var_102_20 = var_102_17 / var_102_18
					local var_102_21 = var_102_16 / var_102_19
					local var_102_22 = var_102_21 < var_102_20 and var_102_20 or var_102_21

					var_102_12.transform.localScale = Vector3.New(var_102_22, var_102_22, 0)
				end

				for iter_102_0, iter_102_1 in pairs(arg_99_1.bgs_) do
					if iter_102_0 ~= "I11i" then
						iter_102_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_102_23 = 1

			if var_102_23 < arg_99_1.time_ and arg_99_1.time_ <= var_102_23 + arg_102_0 then
				local var_102_24 = manager.ui.mainCamera.transform.localPosition
				local var_102_25 = Vector3.New(0, 0, 10) + Vector3.New(var_102_24.x, var_102_24.y, 0)
				local var_102_26 = arg_99_1.bgs_.I11i

				var_102_26.transform.localPosition = var_102_25
				var_102_26.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_102_27 = var_102_26:GetComponent("SpriteRenderer")

				if var_102_27 and var_102_27.sprite then
					local var_102_28 = (var_102_26.transform.localPosition - var_102_24).z
					local var_102_29 = manager.ui.mainCameraCom_
					local var_102_30 = 2 * var_102_28 * Mathf.Tan(var_102_29.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_102_31 = var_102_30 * var_102_29.aspect
					local var_102_32 = var_102_27.sprite.bounds.size.x
					local var_102_33 = var_102_27.sprite.bounds.size.y
					local var_102_34 = var_102_31 / var_102_32
					local var_102_35 = var_102_30 / var_102_33
					local var_102_36 = var_102_35 < var_102_34 and var_102_34 or var_102_35

					var_102_26.transform.localScale = Vector3.New(var_102_36, var_102_36, 0)
				end

				for iter_102_2, iter_102_3 in pairs(arg_99_1.bgs_) do
					if iter_102_2 ~= "I11i" then
						iter_102_3.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_102_37 = 0

			if var_102_37 < arg_99_1.time_ and arg_99_1.time_ <= var_102_37 + arg_102_0 then
				arg_99_1.mask_.enabled = true
				arg_99_1.mask_.raycastTarget = true

				arg_99_1:SetGaussion(false)
			end

			local var_102_38 = 1

			if var_102_37 <= arg_99_1.time_ and arg_99_1.time_ < var_102_37 + var_102_38 then
				local var_102_39 = (arg_99_1.time_ - var_102_37) / var_102_38
				local var_102_40 = Color.New(0, 0, 0)

				var_102_40.a = Mathf.Lerp(0, 1, var_102_39)
				arg_99_1.mask_.color = var_102_40
			end

			if arg_99_1.time_ >= var_102_37 + var_102_38 and arg_99_1.time_ < var_102_37 + var_102_38 + arg_102_0 then
				local var_102_41 = Color.New(0, 0, 0)

				var_102_41.a = 1
				arg_99_1.mask_.color = var_102_41
			end

			local var_102_42 = 1

			if var_102_42 < arg_99_1.time_ and arg_99_1.time_ <= var_102_42 + arg_102_0 then
				arg_99_1.mask_.enabled = true
				arg_99_1.mask_.raycastTarget = true

				arg_99_1:SetGaussion(false)
			end

			local var_102_43 = 1

			if var_102_42 <= arg_99_1.time_ and arg_99_1.time_ < var_102_42 + var_102_43 then
				local var_102_44 = (arg_99_1.time_ - var_102_42) / var_102_43
				local var_102_45 = Color.New(0, 0, 0)

				var_102_45.a = Mathf.Lerp(1, 0, var_102_44)
				arg_99_1.mask_.color = var_102_45
			end

			if arg_99_1.time_ >= var_102_42 + var_102_43 and arg_99_1.time_ < var_102_42 + var_102_43 + arg_102_0 then
				local var_102_46 = Color.New(0, 0, 0)
				local var_102_47 = 0

				arg_99_1.mask_.enabled = false
				var_102_46.a = var_102_47
				arg_99_1.mask_.color = var_102_46
			end

			if arg_99_1.frameCnt_ <= 1 then
				arg_99_1.dialog_:SetActive(false)
			end

			local var_102_48 = 2
			local var_102_49 = 1.325

			if var_102_48 < arg_99_1.time_ and arg_99_1.time_ <= var_102_48 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0

				arg_99_1.dialog_:SetActive(true)

				local var_102_50 = LeanTween.value(arg_99_1.dialog_, 0, 1, 0.3)

				var_102_50:setOnUpdate(LuaHelper.FloatAction(function(arg_103_0)
					arg_99_1.dialogCg_.alpha = arg_103_0
				end))
				var_102_50:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_99_1.dialog_)
					var_102_50:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_99_1.duration_ = arg_99_1.duration_ + 0.3

				SetActive(arg_99_1.leftNameGo_, false)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_51 = arg_99_1:GetWordFromCfg(319271024)
				local var_102_52 = arg_99_1:FormatText(var_102_51.content)

				arg_99_1.text_.text = var_102_52

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_53 = 53
				local var_102_54 = utf8.len(var_102_52)
				local var_102_55 = var_102_53 <= 0 and var_102_49 or var_102_49 * (var_102_54 / var_102_53)

				if var_102_55 > 0 and var_102_49 < var_102_55 then
					arg_99_1.talkMaxDuration = var_102_55
					var_102_48 = var_102_48 + 0.3

					if var_102_55 + var_102_48 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_55 + var_102_48
					end
				end

				arg_99_1.text_.text = var_102_52
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)
				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_56 = var_102_48 + 0.3
			local var_102_57 = math.max(var_102_49, arg_99_1.talkMaxDuration)

			if var_102_56 <= arg_99_1.time_ and arg_99_1.time_ < var_102_56 + var_102_57 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_56) / var_102_57

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_56 + var_102_57 and arg_99_1.time_ < var_102_56 + var_102_57 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play319271025 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 319271025
		arg_105_1.duration_ = 3.933

		local var_105_0 = {
			zh = 2.533,
			ja = 3.933
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
				arg_105_0:Play319271026(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = 0
			local var_108_1 = 0.2

			if var_108_0 < arg_105_1.time_ and arg_105_1.time_ <= var_108_0 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_2 = arg_105_1:FormatText(StoryNameCfg[721].name)

				arg_105_1.leftNameTxt_.text = var_108_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, true)
				arg_105_1.iconController_:SetSelectedState("hero")

				arg_105_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10090")

				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_3 = arg_105_1:GetWordFromCfg(319271025)
				local var_108_4 = arg_105_1:FormatText(var_108_3.content)

				arg_105_1.text_.text = var_108_4

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_5 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_319271", "319271025", "story_v_out_319271.awb") ~= 0 then
					local var_108_8 = manager.audio:GetVoiceLength("story_v_out_319271", "319271025", "story_v_out_319271.awb") / 1000

					if var_108_8 + var_108_0 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_8 + var_108_0
					end

					if var_108_3.prefab_name ~= "" and arg_105_1.actors_[var_108_3.prefab_name] ~= nil then
						local var_108_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_3.prefab_name].transform, "story_v_out_319271", "319271025", "story_v_out_319271.awb")

						arg_105_1:RecordAudio("319271025", var_108_9)
						arg_105_1:RecordAudio("319271025", var_108_9)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_319271", "319271025", "story_v_out_319271.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_319271", "319271025", "story_v_out_319271.awb")
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
	Play319271026 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 319271026
		arg_109_1.duration_ = 5

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play319271027(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 0
			local var_112_1 = 1.325

			if var_112_0 < arg_109_1.time_ and arg_109_1.time_ <= var_112_0 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, false)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_2 = arg_109_1:GetWordFromCfg(319271026)
				local var_112_3 = arg_109_1:FormatText(var_112_2.content)

				arg_109_1.text_.text = var_112_3

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_4 = 53
				local var_112_5 = utf8.len(var_112_3)
				local var_112_6 = var_112_4 <= 0 and var_112_1 or var_112_1 * (var_112_5 / var_112_4)

				if var_112_6 > 0 and var_112_1 < var_112_6 then
					arg_109_1.talkMaxDuration = var_112_6

					if var_112_6 + var_112_0 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_6 + var_112_0
					end
				end

				arg_109_1.text_.text = var_112_3
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)
				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_7 = math.max(var_112_1, arg_109_1.talkMaxDuration)

			if var_112_0 <= arg_109_1.time_ and arg_109_1.time_ < var_112_0 + var_112_7 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_0) / var_112_7

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_0 + var_112_7 and arg_109_1.time_ < var_112_0 + var_112_7 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play319271027 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 319271027
		arg_113_1.duration_ = 5

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play319271028(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0
			local var_116_1 = 1.025

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, false)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_2 = arg_113_1:GetWordFromCfg(319271027)
				local var_116_3 = arg_113_1:FormatText(var_116_2.content)

				arg_113_1.text_.text = var_116_3

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_4 = 41
				local var_116_5 = utf8.len(var_116_3)
				local var_116_6 = var_116_4 <= 0 and var_116_1 or var_116_1 * (var_116_5 / var_116_4)

				if var_116_6 > 0 and var_116_1 < var_116_6 then
					arg_113_1.talkMaxDuration = var_116_6

					if var_116_6 + var_116_0 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_6 + var_116_0
					end
				end

				arg_113_1.text_.text = var_116_3
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)
				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_7 = math.max(var_116_1, arg_113_1.talkMaxDuration)

			if var_116_0 <= arg_113_1.time_ and arg_113_1.time_ < var_116_0 + var_116_7 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_0) / var_116_7

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_0 + var_116_7 and arg_113_1.time_ < var_116_0 + var_116_7 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play319271028 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 319271028
		arg_117_1.duration_ = 6.4

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play319271029(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = 0
			local var_120_1 = 1

			if var_120_0 < arg_117_1.time_ and arg_117_1.time_ <= var_120_0 + arg_120_0 then
				local var_120_2 = "play"
				local var_120_3 = "effect"

				arg_117_1:AudioAction(var_120_2, var_120_3, "se_story_122_03", "se_story_122_03_swordlightbroken", "")
			end

			local var_120_4 = manager.ui.mainCamera.transform
			local var_120_5 = 0.4

			if var_120_5 < arg_117_1.time_ and arg_117_1.time_ <= var_120_5 + arg_120_0 then
				arg_117_1.var_.shakeOldPos = var_120_4.localPosition
			end

			local var_120_6 = 1.16666666666667

			if var_120_5 <= arg_117_1.time_ and arg_117_1.time_ < var_120_5 + var_120_6 then
				local var_120_7 = (arg_117_1.time_ - var_120_5) / 0.066
				local var_120_8, var_120_9 = math.modf(var_120_7)

				var_120_4.localPosition = Vector3.New(var_120_9 * 0.13, var_120_9 * 0.13, var_120_9 * 0.13) + arg_117_1.var_.shakeOldPos
			end

			if arg_117_1.time_ >= var_120_5 + var_120_6 and arg_117_1.time_ < var_120_5 + var_120_6 + arg_120_0 then
				var_120_4.localPosition = arg_117_1.var_.shakeOldPos
			end

			local var_120_10 = 0

			if var_120_10 < arg_117_1.time_ and arg_117_1.time_ <= var_120_10 + arg_120_0 then
				arg_117_1.mask_.enabled = true
				arg_117_1.mask_.raycastTarget = false

				arg_117_1:SetGaussion(false)
			end

			local var_120_11 = 0.733333333333333

			if var_120_10 <= arg_117_1.time_ and arg_117_1.time_ < var_120_10 + var_120_11 then
				local var_120_12 = (arg_117_1.time_ - var_120_10) / var_120_11
				local var_120_13 = Color.New(1, 1, 1)

				var_120_13.a = Mathf.Lerp(1, 0, var_120_12)
				arg_117_1.mask_.color = var_120_13
			end

			if arg_117_1.time_ >= var_120_10 + var_120_11 and arg_117_1.time_ < var_120_10 + var_120_11 + arg_120_0 then
				local var_120_14 = Color.New(1, 1, 1)
				local var_120_15 = 0

				arg_117_1.mask_.enabled = false
				var_120_14.a = var_120_15
				arg_117_1.mask_.color = var_120_14
			end

			if arg_117_1.frameCnt_ <= 1 then
				arg_117_1.dialog_:SetActive(false)
			end

			local var_120_16 = 1.4
			local var_120_17 = 1.4

			if var_120_16 < arg_117_1.time_ and arg_117_1.time_ <= var_120_16 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0

				arg_117_1.dialog_:SetActive(true)

				local var_120_18 = LeanTween.value(arg_117_1.dialog_, 0, 1, 0.3)

				var_120_18:setOnUpdate(LuaHelper.FloatAction(function(arg_121_0)
					arg_117_1.dialogCg_.alpha = arg_121_0
				end))
				var_120_18:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_117_1.dialog_)
					var_120_18:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_117_1.duration_ = arg_117_1.duration_ + 0.3

				SetActive(arg_117_1.leftNameGo_, false)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_19 = arg_117_1:GetWordFromCfg(319271028)
				local var_120_20 = arg_117_1:FormatText(var_120_19.content)

				arg_117_1.text_.text = var_120_20

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_21 = 56
				local var_120_22 = utf8.len(var_120_20)
				local var_120_23 = var_120_21 <= 0 and var_120_17 or var_120_17 * (var_120_22 / var_120_21)

				if var_120_23 > 0 and var_120_17 < var_120_23 then
					arg_117_1.talkMaxDuration = var_120_23
					var_120_16 = var_120_16 + 0.3

					if var_120_23 + var_120_16 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_23 + var_120_16
					end
				end

				arg_117_1.text_.text = var_120_20
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)
				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_24 = var_120_16 + 0.3
			local var_120_25 = math.max(var_120_17, arg_117_1.talkMaxDuration)

			if var_120_24 <= arg_117_1.time_ and arg_117_1.time_ < var_120_24 + var_120_25 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_24) / var_120_25

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_24 + var_120_25 and arg_117_1.time_ < var_120_24 + var_120_25 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play319271029 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 319271029
		arg_123_1.duration_ = 1.999999999999

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play319271030(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["4040ui_story"].transform
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 then
				arg_123_1.var_.moveOldPos4040ui_story = var_126_0.localPosition
			end

			local var_126_2 = 0.001

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2
				local var_126_4 = Vector3.New(0, -1.55, -5.5)

				var_126_0.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos4040ui_story, var_126_4, var_126_3)

				local var_126_5 = manager.ui.mainCamera.transform.position - var_126_0.position

				var_126_0.forward = Vector3.New(var_126_5.x, var_126_5.y, var_126_5.z)

				local var_126_6 = var_126_0.localEulerAngles

				var_126_6.z = 0
				var_126_6.x = 0
				var_126_0.localEulerAngles = var_126_6
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 then
				var_126_0.localPosition = Vector3.New(0, -1.55, -5.5)

				local var_126_7 = manager.ui.mainCamera.transform.position - var_126_0.position

				var_126_0.forward = Vector3.New(var_126_7.x, var_126_7.y, var_126_7.z)

				local var_126_8 = var_126_0.localEulerAngles

				var_126_8.z = 0
				var_126_8.x = 0
				var_126_0.localEulerAngles = var_126_8
			end

			local var_126_9 = arg_123_1.actors_["4040ui_story"]
			local var_126_10 = 0

			if var_126_10 < arg_123_1.time_ and arg_123_1.time_ <= var_126_10 + arg_126_0 and arg_123_1.var_.characterEffect4040ui_story == nil then
				arg_123_1.var_.characterEffect4040ui_story = var_126_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_11 = 0.200000002980232

			if var_126_10 <= arg_123_1.time_ and arg_123_1.time_ < var_126_10 + var_126_11 then
				local var_126_12 = (arg_123_1.time_ - var_126_10) / var_126_11

				if arg_123_1.var_.characterEffect4040ui_story then
					arg_123_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_123_1.time_ >= var_126_10 + var_126_11 and arg_123_1.time_ < var_126_10 + var_126_11 + arg_126_0 and arg_123_1.var_.characterEffect4040ui_story then
				arg_123_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_126_13 = 0

			if var_126_13 < arg_123_1.time_ and arg_123_1.time_ <= var_126_13 + arg_126_0 then
				arg_123_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action1_1")
			end

			local var_126_14 = 0

			if var_126_14 < arg_123_1.time_ and arg_123_1.time_ <= var_126_14 + arg_126_0 then
				arg_123_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_126_15 = 0
			local var_126_16 = 0.1

			if var_126_15 < arg_123_1.time_ and arg_123_1.time_ <= var_126_15 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_17 = arg_123_1:FormatText(StoryNameCfg[668].name)

				arg_123_1.leftNameTxt_.text = var_126_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_18 = arg_123_1:GetWordFromCfg(319271029)
				local var_126_19 = arg_123_1:FormatText(var_126_18.content)

				arg_123_1.text_.text = var_126_19

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_20 = 4
				local var_126_21 = utf8.len(var_126_19)
				local var_126_22 = var_126_20 <= 0 and var_126_16 or var_126_16 * (var_126_21 / var_126_20)

				if var_126_22 > 0 and var_126_16 < var_126_22 then
					arg_123_1.talkMaxDuration = var_126_22

					if var_126_22 + var_126_15 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_22 + var_126_15
					end
				end

				arg_123_1.text_.text = var_126_19
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319271", "319271029", "story_v_out_319271.awb") ~= 0 then
					local var_126_23 = manager.audio:GetVoiceLength("story_v_out_319271", "319271029", "story_v_out_319271.awb") / 1000

					if var_126_23 + var_126_15 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_23 + var_126_15
					end

					if var_126_18.prefab_name ~= "" and arg_123_1.actors_[var_126_18.prefab_name] ~= nil then
						local var_126_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_18.prefab_name].transform, "story_v_out_319271", "319271029", "story_v_out_319271.awb")

						arg_123_1:RecordAudio("319271029", var_126_24)
						arg_123_1:RecordAudio("319271029", var_126_24)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_319271", "319271029", "story_v_out_319271.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_319271", "319271029", "story_v_out_319271.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_25 = math.max(var_126_16, arg_123_1.talkMaxDuration)

			if var_126_15 <= arg_123_1.time_ and arg_123_1.time_ < var_126_15 + var_126_25 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_15) / var_126_25

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_15 + var_126_25 and arg_123_1.time_ < var_126_15 + var_126_25 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play319271030 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 319271030
		arg_127_1.duration_ = 2.233

		local var_127_0 = {
			zh = 1.866,
			ja = 2.233
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
				arg_127_0:Play319271031(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["4040ui_story"]
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 and arg_127_1.var_.characterEffect4040ui_story == nil then
				arg_127_1.var_.characterEffect4040ui_story = var_130_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_2 = 0.200000002980232

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / var_130_2

				if arg_127_1.var_.characterEffect4040ui_story then
					local var_130_4 = Mathf.Lerp(0, 0.5, var_130_3)

					arg_127_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_127_1.var_.characterEffect4040ui_story.fillRatio = var_130_4
				end
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 and arg_127_1.var_.characterEffect4040ui_story then
				local var_130_5 = 0.5

				arg_127_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_127_1.var_.characterEffect4040ui_story.fillRatio = var_130_5
			end

			local var_130_6 = arg_127_1.actors_["4040ui_story"].transform
			local var_130_7 = 0

			if var_130_7 < arg_127_1.time_ and arg_127_1.time_ <= var_130_7 + arg_130_0 then
				arg_127_1.var_.moveOldPos4040ui_story = var_130_6.localPosition
			end

			local var_130_8 = 0.001

			if var_130_7 <= arg_127_1.time_ and arg_127_1.time_ < var_130_7 + var_130_8 then
				local var_130_9 = (arg_127_1.time_ - var_130_7) / var_130_8
				local var_130_10 = Vector3.New(0, 100, 0)

				var_130_6.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos4040ui_story, var_130_10, var_130_9)

				local var_130_11 = manager.ui.mainCamera.transform.position - var_130_6.position

				var_130_6.forward = Vector3.New(var_130_11.x, var_130_11.y, var_130_11.z)

				local var_130_12 = var_130_6.localEulerAngles

				var_130_12.z = 0
				var_130_12.x = 0
				var_130_6.localEulerAngles = var_130_12
			end

			if arg_127_1.time_ >= var_130_7 + var_130_8 and arg_127_1.time_ < var_130_7 + var_130_8 + arg_130_0 then
				var_130_6.localPosition = Vector3.New(0, 100, 0)

				local var_130_13 = manager.ui.mainCamera.transform.position - var_130_6.position

				var_130_6.forward = Vector3.New(var_130_13.x, var_130_13.y, var_130_13.z)

				local var_130_14 = var_130_6.localEulerAngles

				var_130_14.z = 0
				var_130_14.x = 0
				var_130_6.localEulerAngles = var_130_14
			end

			local var_130_15 = 0
			local var_130_16 = 0.125

			if var_130_15 < arg_127_1.time_ and arg_127_1.time_ <= var_130_15 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_17 = arg_127_1:FormatText(StoryNameCfg[721].name)

				arg_127_1.leftNameTxt_.text = var_130_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, true)
				arg_127_1.iconController_:SetSelectedState("hero")

				arg_127_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10090")

				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_18 = arg_127_1:GetWordFromCfg(319271030)
				local var_130_19 = arg_127_1:FormatText(var_130_18.content)

				arg_127_1.text_.text = var_130_19

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_20 = 5
				local var_130_21 = utf8.len(var_130_19)
				local var_130_22 = var_130_20 <= 0 and var_130_16 or var_130_16 * (var_130_21 / var_130_20)

				if var_130_22 > 0 and var_130_16 < var_130_22 then
					arg_127_1.talkMaxDuration = var_130_22

					if var_130_22 + var_130_15 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_22 + var_130_15
					end
				end

				arg_127_1.text_.text = var_130_19
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319271", "319271030", "story_v_out_319271.awb") ~= 0 then
					local var_130_23 = manager.audio:GetVoiceLength("story_v_out_319271", "319271030", "story_v_out_319271.awb") / 1000

					if var_130_23 + var_130_15 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_23 + var_130_15
					end

					if var_130_18.prefab_name ~= "" and arg_127_1.actors_[var_130_18.prefab_name] ~= nil then
						local var_130_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_18.prefab_name].transform, "story_v_out_319271", "319271030", "story_v_out_319271.awb")

						arg_127_1:RecordAudio("319271030", var_130_24)
						arg_127_1:RecordAudio("319271030", var_130_24)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_319271", "319271030", "story_v_out_319271.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_319271", "319271030", "story_v_out_319271.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_25 = math.max(var_130_16, arg_127_1.talkMaxDuration)

			if var_130_15 <= arg_127_1.time_ and arg_127_1.time_ < var_130_15 + var_130_25 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_15) / var_130_25

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_15 + var_130_25 and arg_127_1.time_ < var_130_15 + var_130_25 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play319271031 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 319271031
		arg_131_1.duration_ = 5

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play319271032(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["4040ui_story"].transform
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 then
				arg_131_1.var_.moveOldPos4040ui_story = var_134_0.localPosition
			end

			local var_134_2 = 0.001

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2
				local var_134_4 = Vector3.New(0, 100, 0)

				var_134_0.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos4040ui_story, var_134_4, var_134_3)

				local var_134_5 = manager.ui.mainCamera.transform.position - var_134_0.position

				var_134_0.forward = Vector3.New(var_134_5.x, var_134_5.y, var_134_5.z)

				local var_134_6 = var_134_0.localEulerAngles

				var_134_6.z = 0
				var_134_6.x = 0
				var_134_0.localEulerAngles = var_134_6
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 then
				var_134_0.localPosition = Vector3.New(0, 100, 0)

				local var_134_7 = manager.ui.mainCamera.transform.position - var_134_0.position

				var_134_0.forward = Vector3.New(var_134_7.x, var_134_7.y, var_134_7.z)

				local var_134_8 = var_134_0.localEulerAngles

				var_134_8.z = 0
				var_134_8.x = 0
				var_134_0.localEulerAngles = var_134_8
			end

			local var_134_9 = 0
			local var_134_10 = 0.725

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

				local var_134_11 = arg_131_1:GetWordFromCfg(319271031)
				local var_134_12 = arg_131_1:FormatText(var_134_11.content)

				arg_131_1.text_.text = var_134_12

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_13 = 29
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
	Play319271032 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 319271032
		arg_135_1.duration_ = 5

		SetActive(arg_135_1.tipsGo_, false)

		function arg_135_1.onSingleLineFinish_()
			arg_135_1.onSingleLineUpdate_ = nil
			arg_135_1.onSingleLineFinish_ = nil
			arg_135_1.state_ = "waiting"
		end

		function arg_135_1.playNext_(arg_137_0)
			if arg_137_0 == 1 then
				arg_135_0:Play319271033(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = 0
			local var_138_1 = 1.25

			if var_138_0 < arg_135_1.time_ and arg_135_1.time_ <= var_138_0 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, false)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_2 = arg_135_1:GetWordFromCfg(319271032)
				local var_138_3 = arg_135_1:FormatText(var_138_2.content)

				arg_135_1.text_.text = var_138_3

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_4 = 50
				local var_138_5 = utf8.len(var_138_3)
				local var_138_6 = var_138_4 <= 0 and var_138_1 or var_138_1 * (var_138_5 / var_138_4)

				if var_138_6 > 0 and var_138_1 < var_138_6 then
					arg_135_1.talkMaxDuration = var_138_6

					if var_138_6 + var_138_0 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_6 + var_138_0
					end
				end

				arg_135_1.text_.text = var_138_3
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)
				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_7 = math.max(var_138_1, arg_135_1.talkMaxDuration)

			if var_138_0 <= arg_135_1.time_ and arg_135_1.time_ < var_138_0 + var_138_7 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_0) / var_138_7

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_0 + var_138_7 and arg_135_1.time_ < var_138_0 + var_138_7 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play319271033 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 319271033
		arg_139_1.duration_ = 7.233

		local var_139_0 = {
			zh = 7.233,
			ja = 5.3
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
				arg_139_0:Play319271034(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = 0
			local var_142_1 = 0.675

			if var_142_0 < arg_139_1.time_ and arg_139_1.time_ <= var_142_0 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_2 = arg_139_1:FormatText(StoryNameCfg[668].name)

				arg_139_1.leftNameTxt_.text = var_142_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, true)
				arg_139_1.iconController_:SetSelectedState("hero")

				arg_139_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_4040")

				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_3 = arg_139_1:GetWordFromCfg(319271033)
				local var_142_4 = arg_139_1:FormatText(var_142_3.content)

				arg_139_1.text_.text = var_142_4

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_5 = 27
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

				if manager.audio:GetVoiceLength("story_v_out_319271", "319271033", "story_v_out_319271.awb") ~= 0 then
					local var_142_8 = manager.audio:GetVoiceLength("story_v_out_319271", "319271033", "story_v_out_319271.awb") / 1000

					if var_142_8 + var_142_0 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_8 + var_142_0
					end

					if var_142_3.prefab_name ~= "" and arg_139_1.actors_[var_142_3.prefab_name] ~= nil then
						local var_142_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_3.prefab_name].transform, "story_v_out_319271", "319271033", "story_v_out_319271.awb")

						arg_139_1:RecordAudio("319271033", var_142_9)
						arg_139_1:RecordAudio("319271033", var_142_9)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_319271", "319271033", "story_v_out_319271.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_319271", "319271033", "story_v_out_319271.awb")
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
	Play319271034 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 319271034
		arg_143_1.duration_ = 4.7

		local var_143_0 = {
			zh = 4.7,
			ja = 3.166
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
				arg_143_0:Play319271035(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = 0
			local var_146_1 = 0.475

			if var_146_0 < arg_143_1.time_ and arg_143_1.time_ <= var_146_0 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_2 = arg_143_1:FormatText(StoryNameCfg[668].name)

				arg_143_1.leftNameTxt_.text = var_146_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, true)
				arg_143_1.iconController_:SetSelectedState("hero")

				arg_143_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_4040")

				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_3 = arg_143_1:GetWordFromCfg(319271034)
				local var_146_4 = arg_143_1:FormatText(var_146_3.content)

				arg_143_1.text_.text = var_146_4

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_5 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_319271", "319271034", "story_v_out_319271.awb") ~= 0 then
					local var_146_8 = manager.audio:GetVoiceLength("story_v_out_319271", "319271034", "story_v_out_319271.awb") / 1000

					if var_146_8 + var_146_0 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_8 + var_146_0
					end

					if var_146_3.prefab_name ~= "" and arg_143_1.actors_[var_146_3.prefab_name] ~= nil then
						local var_146_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_3.prefab_name].transform, "story_v_out_319271", "319271034", "story_v_out_319271.awb")

						arg_143_1:RecordAudio("319271034", var_146_9)
						arg_143_1:RecordAudio("319271034", var_146_9)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_319271", "319271034", "story_v_out_319271.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_319271", "319271034", "story_v_out_319271.awb")
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
	Play319271035 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 319271035
		arg_147_1.duration_ = 3.191

		SetActive(arg_147_1.tipsGo_, false)

		function arg_147_1.onSingleLineFinish_()
			arg_147_1.onSingleLineUpdate_ = nil
			arg_147_1.onSingleLineFinish_ = nil
			arg_147_1.state_ = "waiting"
		end

		function arg_147_1.playNext_(arg_149_0)
			if arg_149_0 == 1 then
				arg_147_0:Play319271036(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = 0

			if var_150_0 < arg_147_1.time_ and arg_147_1.time_ <= var_150_0 + arg_150_0 then
				local var_150_1 = manager.ui.mainCamera.transform.localPosition
				local var_150_2 = Vector3.New(0, 0, 10) + Vector3.New(var_150_1.x, var_150_1.y, 0)
				local var_150_3 = arg_147_1.bgs_.I11i

				var_150_3.transform.localPosition = var_150_2
				var_150_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_150_4 = var_150_3:GetComponent("SpriteRenderer")

				if var_150_4 and var_150_4.sprite then
					local var_150_5 = (var_150_3.transform.localPosition - var_150_1).z
					local var_150_6 = manager.ui.mainCameraCom_
					local var_150_7 = 2 * var_150_5 * Mathf.Tan(var_150_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_150_8 = var_150_7 * var_150_6.aspect
					local var_150_9 = var_150_4.sprite.bounds.size.x
					local var_150_10 = var_150_4.sprite.bounds.size.y
					local var_150_11 = var_150_8 / var_150_9
					local var_150_12 = var_150_7 / var_150_10
					local var_150_13 = var_150_12 < var_150_11 and var_150_11 or var_150_12

					var_150_3.transform.localScale = Vector3.New(var_150_13, var_150_13, 0)
				end

				for iter_150_0, iter_150_1 in pairs(arg_147_1.bgs_) do
					if iter_150_0 ~= "I11i" then
						iter_150_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_150_14 = "STblack"

			if arg_147_1.bgs_[var_150_14] == nil then
				local var_150_15 = Object.Instantiate(arg_147_1.paintGo_)

				var_150_15:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_150_14)
				var_150_15.name = var_150_14
				var_150_15.transform.parent = arg_147_1.stage_.transform
				var_150_15.transform.localPosition = Vector3.New(0, 100, 0)
				arg_147_1.bgs_[var_150_14] = var_150_15
			end

			local var_150_16 = 1

			if var_150_16 < arg_147_1.time_ and arg_147_1.time_ <= var_150_16 + arg_150_0 then
				local var_150_17 = manager.ui.mainCamera.transform.localPosition
				local var_150_18 = Vector3.New(0, 0, 10) + Vector3.New(var_150_17.x, var_150_17.y, 0)
				local var_150_19 = arg_147_1.bgs_.STblack

				var_150_19.transform.localPosition = var_150_18
				var_150_19.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_150_20 = var_150_19:GetComponent("SpriteRenderer")

				if var_150_20 and var_150_20.sprite then
					local var_150_21 = (var_150_19.transform.localPosition - var_150_17).z
					local var_150_22 = manager.ui.mainCameraCom_
					local var_150_23 = 2 * var_150_21 * Mathf.Tan(var_150_22.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_150_24 = var_150_23 * var_150_22.aspect
					local var_150_25 = var_150_20.sprite.bounds.size.x
					local var_150_26 = var_150_20.sprite.bounds.size.y
					local var_150_27 = var_150_24 / var_150_25
					local var_150_28 = var_150_23 / var_150_26
					local var_150_29 = var_150_28 < var_150_27 and var_150_27 or var_150_28

					var_150_19.transform.localScale = Vector3.New(var_150_29, var_150_29, 0)
				end

				for iter_150_2, iter_150_3 in pairs(arg_147_1.bgs_) do
					if iter_150_2 ~= "STblack" then
						iter_150_3.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_150_30 = 0

			if var_150_30 < arg_147_1.time_ and arg_147_1.time_ <= var_150_30 + arg_150_0 then
				arg_147_1.mask_.enabled = true
				arg_147_1.mask_.raycastTarget = true

				arg_147_1:SetGaussion(false)
			end

			local var_150_31 = 1

			if var_150_30 <= arg_147_1.time_ and arg_147_1.time_ < var_150_30 + var_150_31 then
				local var_150_32 = (arg_147_1.time_ - var_150_30) / var_150_31
				local var_150_33 = Color.New(0, 0, 0)

				var_150_33.a = Mathf.Lerp(0, 1, var_150_32)
				arg_147_1.mask_.color = var_150_33
			end

			if arg_147_1.time_ >= var_150_30 + var_150_31 and arg_147_1.time_ < var_150_30 + var_150_31 + arg_150_0 then
				local var_150_34 = Color.New(0, 0, 0)

				var_150_34.a = 1
				arg_147_1.mask_.color = var_150_34
			end

			local var_150_35 = 1

			if var_150_35 < arg_147_1.time_ and arg_147_1.time_ <= var_150_35 + arg_150_0 then
				arg_147_1.mask_.enabled = true
				arg_147_1.mask_.raycastTarget = true

				arg_147_1:SetGaussion(false)
			end

			local var_150_36 = 1

			if var_150_35 <= arg_147_1.time_ and arg_147_1.time_ < var_150_35 + var_150_36 then
				local var_150_37 = (arg_147_1.time_ - var_150_35) / var_150_36
				local var_150_38 = Color.New(0, 0, 0)

				var_150_38.a = Mathf.Lerp(1, 0, var_150_37)
				arg_147_1.mask_.color = var_150_38
			end

			if arg_147_1.time_ >= var_150_35 + var_150_36 and arg_147_1.time_ < var_150_35 + var_150_36 + arg_150_0 then
				local var_150_39 = Color.New(0, 0, 0)
				local var_150_40 = 0

				arg_147_1.mask_.enabled = false
				var_150_39.a = var_150_40
				arg_147_1.mask_.color = var_150_39
			end

			if arg_147_1.frameCnt_ <= 1 then
				arg_147_1.dialog_:SetActive(false)
			end

			local var_150_41 = 1.925
			local var_150_42 = 0.075

			if var_150_41 < arg_147_1.time_ and arg_147_1.time_ <= var_150_41 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0

				arg_147_1.dialog_:SetActive(true)

				local var_150_43 = LeanTween.value(arg_147_1.dialog_, 0, 1, 0.3)

				var_150_43:setOnUpdate(LuaHelper.FloatAction(function(arg_151_0)
					arg_147_1.dialogCg_.alpha = arg_151_0
				end))
				var_150_43:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_147_1.dialog_)
					var_150_43:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_147_1.duration_ = arg_147_1.duration_ + 0.3

				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_44 = arg_147_1:FormatText(StoryNameCfg[36].name)

				arg_147_1.leftNameTxt_.text = var_150_44

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, true)
				arg_147_1.iconController_:SetSelectedState("hero")

				arg_147_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadoww")

				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_45 = arg_147_1:GetWordFromCfg(319271035)
				local var_150_46 = arg_147_1:FormatText(var_150_45.content)

				arg_147_1.text_.text = var_150_46

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_47 = 3
				local var_150_48 = utf8.len(var_150_46)
				local var_150_49 = var_150_47 <= 0 and var_150_42 or var_150_42 * (var_150_48 / var_150_47)

				if var_150_49 > 0 and var_150_42 < var_150_49 then
					arg_147_1.talkMaxDuration = var_150_49
					var_150_41 = var_150_41 + 0.3

					if var_150_49 + var_150_41 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_49 + var_150_41
					end
				end

				arg_147_1.text_.text = var_150_46
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319271", "319271035", "story_v_out_319271.awb") ~= 0 then
					local var_150_50 = manager.audio:GetVoiceLength("story_v_out_319271", "319271035", "story_v_out_319271.awb") / 1000

					if var_150_50 + var_150_41 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_50 + var_150_41
					end

					if var_150_45.prefab_name ~= "" and arg_147_1.actors_[var_150_45.prefab_name] ~= nil then
						local var_150_51 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_45.prefab_name].transform, "story_v_out_319271", "319271035", "story_v_out_319271.awb")

						arg_147_1:RecordAudio("319271035", var_150_51)
						arg_147_1:RecordAudio("319271035", var_150_51)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_319271", "319271035", "story_v_out_319271.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_319271", "319271035", "story_v_out_319271.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_52 = var_150_41 + 0.3
			local var_150_53 = math.max(var_150_42, arg_147_1.talkMaxDuration)

			if var_150_52 <= arg_147_1.time_ and arg_147_1.time_ < var_150_52 + var_150_53 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_52) / var_150_53

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_52 + var_150_53 and arg_147_1.time_ < var_150_52 + var_150_53 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play319271036 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 319271036
		arg_153_1.duration_ = 5

		SetActive(arg_153_1.tipsGo_, false)

		function arg_153_1.onSingleLineFinish_()
			arg_153_1.onSingleLineUpdate_ = nil
			arg_153_1.onSingleLineFinish_ = nil
			arg_153_1.state_ = "waiting"
		end

		function arg_153_1.playNext_(arg_155_0)
			if arg_155_0 == 1 then
				arg_153_0:Play319271037(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = 0
			local var_156_1 = 1.275

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

				local var_156_2 = arg_153_1:GetWordFromCfg(319271036)
				local var_156_3 = arg_153_1:FormatText(var_156_2.content)

				arg_153_1.text_.text = var_156_3

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_4 = 51
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
	Play319271037 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 319271037
		arg_157_1.duration_ = 7.5

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play319271038(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = 0.266666666666667
			local var_160_1 = 0.733333333333333

			if var_160_0 < arg_157_1.time_ and arg_157_1.time_ <= var_160_0 + arg_160_0 then
				local var_160_2 = "play"
				local var_160_3 = "effect"

				arg_157_1:AudioAction(var_160_2, var_160_3, "se_story_1211", "se_story_1211_explosionfar", "")
			end

			local var_160_4 = 1.33333333333333

			if var_160_4 < arg_157_1.time_ and arg_157_1.time_ <= var_160_4 + arg_160_0 then
				local var_160_5 = manager.ui.mainCamera.transform.localPosition
				local var_160_6 = Vector3.New(0, 0, 10) + Vector3.New(var_160_5.x, var_160_5.y, 0)
				local var_160_7 = arg_157_1.bgs_.I11i

				var_160_7.transform.localPosition = var_160_6
				var_160_7.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_160_8 = var_160_7:GetComponent("SpriteRenderer")

				if var_160_8 and var_160_8.sprite then
					local var_160_9 = (var_160_7.transform.localPosition - var_160_5).z
					local var_160_10 = manager.ui.mainCameraCom_
					local var_160_11 = 2 * var_160_9 * Mathf.Tan(var_160_10.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_160_12 = var_160_11 * var_160_10.aspect
					local var_160_13 = var_160_8.sprite.bounds.size.x
					local var_160_14 = var_160_8.sprite.bounds.size.y
					local var_160_15 = var_160_12 / var_160_13
					local var_160_16 = var_160_11 / var_160_14
					local var_160_17 = var_160_16 < var_160_15 and var_160_15 or var_160_16

					var_160_7.transform.localScale = Vector3.New(var_160_17, var_160_17, 0)
				end

				for iter_160_0, iter_160_1 in pairs(arg_157_1.bgs_) do
					if iter_160_0 ~= "I11i" then
						iter_160_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_160_18 = 0

			if var_160_18 < arg_157_1.time_ and arg_157_1.time_ <= var_160_18 + arg_160_0 then
				arg_157_1.mask_.enabled = true
				arg_157_1.mask_.raycastTarget = true

				arg_157_1:SetGaussion(false)
			end

			local var_160_19 = 1.33333333333333

			if var_160_18 <= arg_157_1.time_ and arg_157_1.time_ < var_160_18 + var_160_19 then
				local var_160_20 = (arg_157_1.time_ - var_160_18) / var_160_19
				local var_160_21 = Color.New(0, 0, 0)

				var_160_21.a = Mathf.Lerp(0, 1, var_160_20)
				arg_157_1.mask_.color = var_160_21
			end

			if arg_157_1.time_ >= var_160_18 + var_160_19 and arg_157_1.time_ < var_160_18 + var_160_19 + arg_160_0 then
				local var_160_22 = Color.New(0, 0, 0)

				var_160_22.a = 1
				arg_157_1.mask_.color = var_160_22
			end

			local var_160_23 = 1.33333333333333

			if var_160_23 < arg_157_1.time_ and arg_157_1.time_ <= var_160_23 + arg_160_0 then
				arg_157_1.mask_.enabled = true
				arg_157_1.mask_.raycastTarget = true

				arg_157_1:SetGaussion(false)
			end

			local var_160_24 = 1.66666666666667

			if var_160_23 <= arg_157_1.time_ and arg_157_1.time_ < var_160_23 + var_160_24 then
				local var_160_25 = (arg_157_1.time_ - var_160_23) / var_160_24
				local var_160_26 = Color.New(0, 0, 0)

				var_160_26.a = Mathf.Lerp(1, 0, var_160_25)
				arg_157_1.mask_.color = var_160_26
			end

			if arg_157_1.time_ >= var_160_23 + var_160_24 and arg_157_1.time_ < var_160_23 + var_160_24 + arg_160_0 then
				local var_160_27 = Color.New(0, 0, 0)
				local var_160_28 = 0

				arg_157_1.mask_.enabled = false
				var_160_27.a = var_160_28
				arg_157_1.mask_.color = var_160_27
			end

			if arg_157_1.frameCnt_ <= 1 then
				arg_157_1.dialog_:SetActive(false)
			end

			local var_160_29 = 2.5
			local var_160_30 = 1.5

			if var_160_29 < arg_157_1.time_ and arg_157_1.time_ <= var_160_29 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0

				arg_157_1.dialog_:SetActive(true)

				local var_160_31 = LeanTween.value(arg_157_1.dialog_, 0, 1, 0.3)

				var_160_31:setOnUpdate(LuaHelper.FloatAction(function(arg_161_0)
					arg_157_1.dialogCg_.alpha = arg_161_0
				end))
				var_160_31:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_157_1.dialog_)
					var_160_31:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_157_1.duration_ = arg_157_1.duration_ + 0.3

				SetActive(arg_157_1.leftNameGo_, false)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_32 = arg_157_1:GetWordFromCfg(319271037)
				local var_160_33 = arg_157_1:FormatText(var_160_32.content)

				arg_157_1.text_.text = var_160_33

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_34 = 60
				local var_160_35 = utf8.len(var_160_33)
				local var_160_36 = var_160_34 <= 0 and var_160_30 or var_160_30 * (var_160_35 / var_160_34)

				if var_160_36 > 0 and var_160_30 < var_160_36 then
					arg_157_1.talkMaxDuration = var_160_36
					var_160_29 = var_160_29 + 0.3

					if var_160_36 + var_160_29 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_36 + var_160_29
					end
				end

				arg_157_1.text_.text = var_160_33
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)
				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_37 = var_160_29 + 0.3
			local var_160_38 = math.max(var_160_30, arg_157_1.talkMaxDuration)

			if var_160_37 <= arg_157_1.time_ and arg_157_1.time_ < var_160_37 + var_160_38 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_37) / var_160_38

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_37 + var_160_38 and arg_157_1.time_ < var_160_37 + var_160_38 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play319271038 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 319271038
		arg_163_1.duration_ = 5.633

		local var_163_0 = {
			zh = 5.633,
			ja = 4.333
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
				arg_163_0:Play319271039(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["4040ui_story"].transform
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 then
				arg_163_1.var_.moveOldPos4040ui_story = var_166_0.localPosition
			end

			local var_166_2 = 0.001

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_2 then
				local var_166_3 = (arg_163_1.time_ - var_166_1) / var_166_2
				local var_166_4 = Vector3.New(0, -1.55, -5.5)

				var_166_0.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos4040ui_story, var_166_4, var_166_3)

				local var_166_5 = manager.ui.mainCamera.transform.position - var_166_0.position

				var_166_0.forward = Vector3.New(var_166_5.x, var_166_5.y, var_166_5.z)

				local var_166_6 = var_166_0.localEulerAngles

				var_166_6.z = 0
				var_166_6.x = 0
				var_166_0.localEulerAngles = var_166_6
			end

			if arg_163_1.time_ >= var_166_1 + var_166_2 and arg_163_1.time_ < var_166_1 + var_166_2 + arg_166_0 then
				var_166_0.localPosition = Vector3.New(0, -1.55, -5.5)

				local var_166_7 = manager.ui.mainCamera.transform.position - var_166_0.position

				var_166_0.forward = Vector3.New(var_166_7.x, var_166_7.y, var_166_7.z)

				local var_166_8 = var_166_0.localEulerAngles

				var_166_8.z = 0
				var_166_8.x = 0
				var_166_0.localEulerAngles = var_166_8
			end

			local var_166_9 = arg_163_1.actors_["4040ui_story"]
			local var_166_10 = 0

			if var_166_10 < arg_163_1.time_ and arg_163_1.time_ <= var_166_10 + arg_166_0 and arg_163_1.var_.characterEffect4040ui_story == nil then
				arg_163_1.var_.characterEffect4040ui_story = var_166_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_11 = 0.200000002980232

			if var_166_10 <= arg_163_1.time_ and arg_163_1.time_ < var_166_10 + var_166_11 then
				local var_166_12 = (arg_163_1.time_ - var_166_10) / var_166_11

				if arg_163_1.var_.characterEffect4040ui_story then
					arg_163_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_163_1.time_ >= var_166_10 + var_166_11 and arg_163_1.time_ < var_166_10 + var_166_11 + arg_166_0 and arg_163_1.var_.characterEffect4040ui_story then
				arg_163_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_166_13 = 0

			if var_166_13 < arg_163_1.time_ and arg_163_1.time_ <= var_166_13 + arg_166_0 then
				arg_163_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action1_1")
			end

			local var_166_14 = 0

			if var_166_14 < arg_163_1.time_ and arg_163_1.time_ <= var_166_14 + arg_166_0 then
				arg_163_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_166_15 = 0
			local var_166_16 = 0.575

			if var_166_15 < arg_163_1.time_ and arg_163_1.time_ <= var_166_15 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_17 = arg_163_1:FormatText(StoryNameCfg[668].name)

				arg_163_1.leftNameTxt_.text = var_166_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_18 = arg_163_1:GetWordFromCfg(319271038)
				local var_166_19 = arg_163_1:FormatText(var_166_18.content)

				arg_163_1.text_.text = var_166_19

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_20 = 23
				local var_166_21 = utf8.len(var_166_19)
				local var_166_22 = var_166_20 <= 0 and var_166_16 or var_166_16 * (var_166_21 / var_166_20)

				if var_166_22 > 0 and var_166_16 < var_166_22 then
					arg_163_1.talkMaxDuration = var_166_22

					if var_166_22 + var_166_15 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_22 + var_166_15
					end
				end

				arg_163_1.text_.text = var_166_19
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319271", "319271038", "story_v_out_319271.awb") ~= 0 then
					local var_166_23 = manager.audio:GetVoiceLength("story_v_out_319271", "319271038", "story_v_out_319271.awb") / 1000

					if var_166_23 + var_166_15 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_23 + var_166_15
					end

					if var_166_18.prefab_name ~= "" and arg_163_1.actors_[var_166_18.prefab_name] ~= nil then
						local var_166_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_18.prefab_name].transform, "story_v_out_319271", "319271038", "story_v_out_319271.awb")

						arg_163_1:RecordAudio("319271038", var_166_24)
						arg_163_1:RecordAudio("319271038", var_166_24)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_319271", "319271038", "story_v_out_319271.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_319271", "319271038", "story_v_out_319271.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_25 = math.max(var_166_16, arg_163_1.talkMaxDuration)

			if var_166_15 <= arg_163_1.time_ and arg_163_1.time_ < var_166_15 + var_166_25 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_15) / var_166_25

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_15 + var_166_25 and arg_163_1.time_ < var_166_15 + var_166_25 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play319271039 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 319271039
		arg_167_1.duration_ = 8.23333333333333

		SetActive(arg_167_1.tipsGo_, false)

		function arg_167_1.onSingleLineFinish_()
			arg_167_1.onSingleLineUpdate_ = nil
			arg_167_1.onSingleLineFinish_ = nil
			arg_167_1.state_ = "waiting"
		end

		function arg_167_1.playNext_(arg_169_0)
			if arg_169_0 == 1 then
				arg_167_0:Play319271040(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = "ML0208"

			if arg_167_1.bgs_[var_170_0] == nil then
				local var_170_1 = Object.Instantiate(arg_167_1.paintGo_)

				var_170_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_170_0)
				var_170_1.name = var_170_0
				var_170_1.transform.parent = arg_167_1.stage_.transform
				var_170_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_167_1.bgs_[var_170_0] = var_170_1
			end

			local var_170_2 = 1.39933333148559

			if var_170_2 < arg_167_1.time_ and arg_167_1.time_ <= var_170_2 + arg_170_0 then
				local var_170_3 = manager.ui.mainCamera.transform.localPosition
				local var_170_4 = Vector3.New(0, 0, 10) + Vector3.New(var_170_3.x, var_170_3.y, 0)
				local var_170_5 = arg_167_1.bgs_.ML0208

				var_170_5.transform.localPosition = var_170_4
				var_170_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_170_6 = var_170_5:GetComponent("SpriteRenderer")

				if var_170_6 and var_170_6.sprite then
					local var_170_7 = (var_170_5.transform.localPosition - var_170_3).z
					local var_170_8 = manager.ui.mainCameraCom_
					local var_170_9 = 2 * var_170_7 * Mathf.Tan(var_170_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_170_10 = var_170_9 * var_170_8.aspect
					local var_170_11 = var_170_6.sprite.bounds.size.x
					local var_170_12 = var_170_6.sprite.bounds.size.y
					local var_170_13 = var_170_10 / var_170_11
					local var_170_14 = var_170_9 / var_170_12
					local var_170_15 = var_170_14 < var_170_13 and var_170_13 or var_170_14

					var_170_5.transform.localScale = Vector3.New(var_170_15, var_170_15, 0)
				end

				for iter_170_0, iter_170_1 in pairs(arg_167_1.bgs_) do
					if iter_170_0 ~= "ML0208" then
						iter_170_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_170_16 = 0

			if var_170_16 < arg_167_1.time_ and arg_167_1.time_ <= var_170_16 + arg_170_0 then
				arg_167_1.allBtn_.enabled = false
			end

			local var_170_17 = 0.3

			if arg_167_1.time_ >= var_170_16 + var_170_17 and arg_167_1.time_ < var_170_16 + var_170_17 + arg_170_0 then
				arg_167_1.allBtn_.enabled = true
			end

			local var_170_18 = 0

			if var_170_18 < arg_167_1.time_ and arg_167_1.time_ <= var_170_18 + arg_170_0 then
				arg_167_1.mask_.enabled = true
				arg_167_1.mask_.raycastTarget = true

				arg_167_1:SetGaussion(false)
			end

			local var_170_19 = 1.43333333333333

			if var_170_18 <= arg_167_1.time_ and arg_167_1.time_ < var_170_18 + var_170_19 then
				local var_170_20 = (arg_167_1.time_ - var_170_18) / var_170_19
				local var_170_21 = Color.New(0, 0, 0)

				var_170_21.a = Mathf.Lerp(0, 1, var_170_20)
				arg_167_1.mask_.color = var_170_21
			end

			if arg_167_1.time_ >= var_170_18 + var_170_19 and arg_167_1.time_ < var_170_18 + var_170_19 + arg_170_0 then
				local var_170_22 = Color.New(0, 0, 0)

				var_170_22.a = 1
				arg_167_1.mask_.color = var_170_22
			end

			local var_170_23 = 1.43333333333333

			if var_170_23 < arg_167_1.time_ and arg_167_1.time_ <= var_170_23 + arg_170_0 then
				arg_167_1.mask_.enabled = true
				arg_167_1.mask_.raycastTarget = true

				arg_167_1:SetGaussion(false)
			end

			local var_170_24 = 2

			if var_170_23 <= arg_167_1.time_ and arg_167_1.time_ < var_170_23 + var_170_24 then
				local var_170_25 = (arg_167_1.time_ - var_170_23) / var_170_24
				local var_170_26 = Color.New(0, 0, 0)

				var_170_26.a = Mathf.Lerp(1, 0, var_170_25)
				arg_167_1.mask_.color = var_170_26
			end

			if arg_167_1.time_ >= var_170_23 + var_170_24 and arg_167_1.time_ < var_170_23 + var_170_24 + arg_170_0 then
				local var_170_27 = Color.New(0, 0, 0)
				local var_170_28 = 0

				arg_167_1.mask_.enabled = false
				var_170_27.a = var_170_28
				arg_167_1.mask_.color = var_170_27
			end

			local var_170_29 = arg_167_1.actors_["4040ui_story"].transform
			local var_170_30 = 1.43333333333333

			if var_170_30 < arg_167_1.time_ and arg_167_1.time_ <= var_170_30 + arg_170_0 then
				arg_167_1.var_.moveOldPos4040ui_story = var_170_29.localPosition
			end

			local var_170_31 = 0.001

			if var_170_30 <= arg_167_1.time_ and arg_167_1.time_ < var_170_30 + var_170_31 then
				local var_170_32 = (arg_167_1.time_ - var_170_30) / var_170_31
				local var_170_33 = Vector3.New(0, 100, 0)

				var_170_29.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos4040ui_story, var_170_33, var_170_32)

				local var_170_34 = manager.ui.mainCamera.transform.position - var_170_29.position

				var_170_29.forward = Vector3.New(var_170_34.x, var_170_34.y, var_170_34.z)

				local var_170_35 = var_170_29.localEulerAngles

				var_170_35.z = 0
				var_170_35.x = 0
				var_170_29.localEulerAngles = var_170_35
			end

			if arg_167_1.time_ >= var_170_30 + var_170_31 and arg_167_1.time_ < var_170_30 + var_170_31 + arg_170_0 then
				var_170_29.localPosition = Vector3.New(0, 100, 0)

				local var_170_36 = manager.ui.mainCamera.transform.position - var_170_29.position

				var_170_29.forward = Vector3.New(var_170_36.x, var_170_36.y, var_170_36.z)

				local var_170_37 = var_170_29.localEulerAngles

				var_170_37.z = 0
				var_170_37.x = 0
				var_170_29.localEulerAngles = var_170_37
			end

			local var_170_38 = arg_167_1.actors_["4040ui_story"]
			local var_170_39 = 0

			if var_170_39 < arg_167_1.time_ and arg_167_1.time_ <= var_170_39 + arg_170_0 and arg_167_1.var_.characterEffect4040ui_story == nil then
				arg_167_1.var_.characterEffect4040ui_story = var_170_38:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_40 = 0.200000002980232

			if var_170_39 <= arg_167_1.time_ and arg_167_1.time_ < var_170_39 + var_170_40 then
				local var_170_41 = (arg_167_1.time_ - var_170_39) / var_170_40

				if arg_167_1.var_.characterEffect4040ui_story then
					local var_170_42 = Mathf.Lerp(0, 0.5, var_170_41)

					arg_167_1.var_.characterEffect4040ui_story.fillFlat = true
					arg_167_1.var_.characterEffect4040ui_story.fillRatio = var_170_42
				end
			end

			if arg_167_1.time_ >= var_170_39 + var_170_40 and arg_167_1.time_ < var_170_39 + var_170_40 + arg_170_0 and arg_167_1.var_.characterEffect4040ui_story then
				local var_170_43 = 0.5

				arg_167_1.var_.characterEffect4040ui_story.fillFlat = true
				arg_167_1.var_.characterEffect4040ui_story.fillRatio = var_170_43
			end

			local var_170_44 = 0
			local var_170_45 = 0.2

			if var_170_44 < arg_167_1.time_ and arg_167_1.time_ <= var_170_44 + arg_170_0 then
				local var_170_46 = "play"
				local var_170_47 = "music"

				arg_167_1:AudioAction(var_170_46, var_170_47, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_170_48 = 0.233333333333333
			local var_170_49 = 1

			if var_170_48 < arg_167_1.time_ and arg_167_1.time_ <= var_170_48 + arg_170_0 then
				local var_170_50 = "play"
				local var_170_51 = "music"

				arg_167_1:AudioAction(var_170_50, var_170_51, "bgm_activity_3_0_story_theme_piano_orc", "bgm_activity_3_0_story_theme_piano_orc", "bgm_activity_3_0_story_theme_piano_orc.awb")
			end

			local var_170_52 = arg_167_1.bgs_.ML0208.transform
			local var_170_53 = 1.46733333518108

			if var_170_53 < arg_167_1.time_ and arg_167_1.time_ <= var_170_53 + arg_170_0 then
				arg_167_1.var_.moveOldPosML0208 = var_170_52.localPosition
			end

			local var_170_54 = 2.13266666481892

			if var_170_53 <= arg_167_1.time_ and arg_167_1.time_ < var_170_53 + var_170_54 then
				local var_170_55 = (arg_167_1.time_ - var_170_53) / var_170_54
				local var_170_56 = Vector3.New(0, 1, 10)

				var_170_52.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPosML0208, var_170_56, var_170_55)
			end

			if arg_167_1.time_ >= var_170_53 + var_170_54 and arg_167_1.time_ < var_170_53 + var_170_54 + arg_170_0 then
				var_170_52.localPosition = Vector3.New(0, 1, 10)
			end

			local var_170_57 = arg_167_1.bgs_.ML0208.transform
			local var_170_58 = 1.43333333333333

			if var_170_58 < arg_167_1.time_ and arg_167_1.time_ <= var_170_58 + arg_170_0 then
				arg_167_1.var_.moveOldPosML0208 = var_170_57.localPosition
			end

			local var_170_59 = 0.001

			if var_170_58 <= arg_167_1.time_ and arg_167_1.time_ < var_170_58 + var_170_59 then
				local var_170_60 = (arg_167_1.time_ - var_170_58) / var_170_59
				local var_170_61 = Vector3.New(0, 1, 7.74)

				var_170_57.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPosML0208, var_170_61, var_170_60)
			end

			if arg_167_1.time_ >= var_170_58 + var_170_59 and arg_167_1.time_ < var_170_58 + var_170_59 + arg_170_0 then
				var_170_57.localPosition = Vector3.New(0, 1, 7.74)
			end

			if arg_167_1.frameCnt_ <= 1 then
				arg_167_1.dialog_:SetActive(false)
			end

			local var_170_62 = 3.23333333333333
			local var_170_63 = 1.275

			if var_170_62 < arg_167_1.time_ and arg_167_1.time_ <= var_170_62 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0

				arg_167_1.dialog_:SetActive(true)

				local var_170_64 = LeanTween.value(arg_167_1.dialog_, 0, 1, 0.3)

				var_170_64:setOnUpdate(LuaHelper.FloatAction(function(arg_171_0)
					arg_167_1.dialogCg_.alpha = arg_171_0
				end))
				var_170_64:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_167_1.dialog_)
					var_170_64:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_167_1.duration_ = arg_167_1.duration_ + 0.3

				SetActive(arg_167_1.leftNameGo_, false)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_65 = arg_167_1:GetWordFromCfg(319271039)
				local var_170_66 = arg_167_1:FormatText(var_170_65.content)

				arg_167_1.text_.text = var_170_66

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_67 = 51
				local var_170_68 = utf8.len(var_170_66)
				local var_170_69 = var_170_67 <= 0 and var_170_63 or var_170_63 * (var_170_68 / var_170_67)

				if var_170_69 > 0 and var_170_63 < var_170_69 then
					arg_167_1.talkMaxDuration = var_170_69
					var_170_62 = var_170_62 + 0.3

					if var_170_69 + var_170_62 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_69 + var_170_62
					end
				end

				arg_167_1.text_.text = var_170_66
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)
				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_70 = var_170_62 + 0.3
			local var_170_71 = math.max(var_170_63, arg_167_1.talkMaxDuration)

			if var_170_70 <= arg_167_1.time_ and arg_167_1.time_ < var_170_70 + var_170_71 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_70) / var_170_71

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_70 + var_170_71 and arg_167_1.time_ < var_170_70 + var_170_71 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play319271040 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 319271040
		arg_173_1.duration_ = 1.566

		local var_173_0 = {
			zh = 1.566,
			ja = 0.999999999999
		}
		local var_173_1 = manager.audio:GetLocalizationFlag()

		if var_173_0[var_173_1] ~= nil then
			arg_173_1.duration_ = var_173_0[var_173_1]
		end

		SetActive(arg_173_1.tipsGo_, false)

		function arg_173_1.onSingleLineFinish_()
			arg_173_1.onSingleLineUpdate_ = nil
			arg_173_1.onSingleLineFinish_ = nil
			arg_173_1.state_ = "waiting"
		end

		function arg_173_1.playNext_(arg_175_0)
			if arg_175_0 == 1 then
				arg_173_0:Play319271041(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = 0
			local var_176_1 = 0.125

			if var_176_0 < arg_173_1.time_ and arg_173_1.time_ <= var_176_0 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_2 = arg_173_1:FormatText(StoryNameCfg[471].name)

				arg_173_1.leftNameTxt_.text = var_176_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, true)
				arg_173_1.iconController_:SetSelectedState("hero")

				arg_173_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1095")

				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_3 = arg_173_1:GetWordFromCfg(319271040)
				local var_176_4 = arg_173_1:FormatText(var_176_3.content)

				arg_173_1.text_.text = var_176_4

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_5 = 5
				local var_176_6 = utf8.len(var_176_4)
				local var_176_7 = var_176_5 <= 0 and var_176_1 or var_176_1 * (var_176_6 / var_176_5)

				if var_176_7 > 0 and var_176_1 < var_176_7 then
					arg_173_1.talkMaxDuration = var_176_7

					if var_176_7 + var_176_0 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_7 + var_176_0
					end
				end

				arg_173_1.text_.text = var_176_4
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319271", "319271040", "story_v_out_319271.awb") ~= 0 then
					local var_176_8 = manager.audio:GetVoiceLength("story_v_out_319271", "319271040", "story_v_out_319271.awb") / 1000

					if var_176_8 + var_176_0 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_8 + var_176_0
					end

					if var_176_3.prefab_name ~= "" and arg_173_1.actors_[var_176_3.prefab_name] ~= nil then
						local var_176_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_3.prefab_name].transform, "story_v_out_319271", "319271040", "story_v_out_319271.awb")

						arg_173_1:RecordAudio("319271040", var_176_9)
						arg_173_1:RecordAudio("319271040", var_176_9)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_319271", "319271040", "story_v_out_319271.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_319271", "319271040", "story_v_out_319271.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_10 = math.max(var_176_1, arg_173_1.talkMaxDuration)

			if var_176_0 <= arg_173_1.time_ and arg_173_1.time_ < var_176_0 + var_176_10 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_0) / var_176_10

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_0 + var_176_10 and arg_173_1.time_ < var_176_0 + var_176_10 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play319271041 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 319271041
		arg_177_1.duration_ = 8.866

		local var_177_0 = {
			zh = 4.066,
			ja = 8.866
		}
		local var_177_1 = manager.audio:GetLocalizationFlag()

		if var_177_0[var_177_1] ~= nil then
			arg_177_1.duration_ = var_177_0[var_177_1]
		end

		SetActive(arg_177_1.tipsGo_, false)

		function arg_177_1.onSingleLineFinish_()
			arg_177_1.onSingleLineUpdate_ = nil
			arg_177_1.onSingleLineFinish_ = nil
			arg_177_1.state_ = "waiting"
		end

		function arg_177_1.playNext_(arg_179_0)
			if arg_179_0 == 1 then
				arg_177_0:Play319271042(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = 0
			local var_180_1 = 0.5

			if var_180_0 < arg_177_1.time_ and arg_177_1.time_ <= var_180_0 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_2 = arg_177_1:FormatText(StoryNameCfg[6].name)

				arg_177_1.leftNameTxt_.text = var_180_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_3 = arg_177_1:GetWordFromCfg(319271041)
				local var_180_4 = arg_177_1:FormatText(var_180_3.content)

				arg_177_1.text_.text = var_180_4

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_5 = 20
				local var_180_6 = utf8.len(var_180_4)
				local var_180_7 = var_180_5 <= 0 and var_180_1 or var_180_1 * (var_180_6 / var_180_5)

				if var_180_7 > 0 and var_180_1 < var_180_7 then
					arg_177_1.talkMaxDuration = var_180_7

					if var_180_7 + var_180_0 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_7 + var_180_0
					end
				end

				arg_177_1.text_.text = var_180_4
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319271", "319271041", "story_v_out_319271.awb") ~= 0 then
					local var_180_8 = manager.audio:GetVoiceLength("story_v_out_319271", "319271041", "story_v_out_319271.awb") / 1000

					if var_180_8 + var_180_0 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_8 + var_180_0
					end

					if var_180_3.prefab_name ~= "" and arg_177_1.actors_[var_180_3.prefab_name] ~= nil then
						local var_180_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_3.prefab_name].transform, "story_v_out_319271", "319271041", "story_v_out_319271.awb")

						arg_177_1:RecordAudio("319271041", var_180_9)
						arg_177_1:RecordAudio("319271041", var_180_9)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_out_319271", "319271041", "story_v_out_319271.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_out_319271", "319271041", "story_v_out_319271.awb")
				end

				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_10 = math.max(var_180_1, arg_177_1.talkMaxDuration)

			if var_180_0 <= arg_177_1.time_ and arg_177_1.time_ < var_180_0 + var_180_10 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_0) / var_180_10

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_0 + var_180_10 and arg_177_1.time_ < var_180_0 + var_180_10 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play319271042 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 319271042
		arg_181_1.duration_ = 8.7

		local var_181_0 = {
			zh = 3.9,
			ja = 8.7
		}
		local var_181_1 = manager.audio:GetLocalizationFlag()

		if var_181_0[var_181_1] ~= nil then
			arg_181_1.duration_ = var_181_0[var_181_1]
		end

		SetActive(arg_181_1.tipsGo_, false)

		function arg_181_1.onSingleLineFinish_()
			arg_181_1.onSingleLineUpdate_ = nil
			arg_181_1.onSingleLineFinish_ = nil
			arg_181_1.state_ = "waiting"
		end

		function arg_181_1.playNext_(arg_183_0)
			if arg_183_0 == 1 then
				arg_181_0:Play319271043(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = 0
			local var_184_1 = 0.475

			if var_184_0 < arg_181_1.time_ and arg_181_1.time_ <= var_184_0 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_2 = arg_181_1:FormatText(StoryNameCfg[471].name)

				arg_181_1.leftNameTxt_.text = var_184_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, true)
				arg_181_1.iconController_:SetSelectedState("hero")

				arg_181_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1095")

				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_3 = arg_181_1:GetWordFromCfg(319271042)
				local var_184_4 = arg_181_1:FormatText(var_184_3.content)

				arg_181_1.text_.text = var_184_4

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_5 = 19
				local var_184_6 = utf8.len(var_184_4)
				local var_184_7 = var_184_5 <= 0 and var_184_1 or var_184_1 * (var_184_6 / var_184_5)

				if var_184_7 > 0 and var_184_1 < var_184_7 then
					arg_181_1.talkMaxDuration = var_184_7

					if var_184_7 + var_184_0 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_7 + var_184_0
					end
				end

				arg_181_1.text_.text = var_184_4
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319271", "319271042", "story_v_out_319271.awb") ~= 0 then
					local var_184_8 = manager.audio:GetVoiceLength("story_v_out_319271", "319271042", "story_v_out_319271.awb") / 1000

					if var_184_8 + var_184_0 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_8 + var_184_0
					end

					if var_184_3.prefab_name ~= "" and arg_181_1.actors_[var_184_3.prefab_name] ~= nil then
						local var_184_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_181_1.actors_[var_184_3.prefab_name].transform, "story_v_out_319271", "319271042", "story_v_out_319271.awb")

						arg_181_1:RecordAudio("319271042", var_184_9)
						arg_181_1:RecordAudio("319271042", var_184_9)
					else
						arg_181_1:AudioAction("play", "voice", "story_v_out_319271", "319271042", "story_v_out_319271.awb")
					end

					arg_181_1:RecordHistoryTalkVoice("story_v_out_319271", "319271042", "story_v_out_319271.awb")
				end

				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_10 = math.max(var_184_1, arg_181_1.talkMaxDuration)

			if var_184_0 <= arg_181_1.time_ and arg_181_1.time_ < var_184_0 + var_184_10 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_0) / var_184_10

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_0 + var_184_10 and arg_181_1.time_ < var_184_0 + var_184_10 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play319271043 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 319271043
		arg_185_1.duration_ = 6.733

		local var_185_0 = {
			zh = 3.266,
			ja = 6.733
		}
		local var_185_1 = manager.audio:GetLocalizationFlag()

		if var_185_0[var_185_1] ~= nil then
			arg_185_1.duration_ = var_185_0[var_185_1]
		end

		SetActive(arg_185_1.tipsGo_, false)

		function arg_185_1.onSingleLineFinish_()
			arg_185_1.onSingleLineUpdate_ = nil
			arg_185_1.onSingleLineFinish_ = nil
			arg_185_1.state_ = "waiting"
		end

		function arg_185_1.playNext_(arg_187_0)
			if arg_187_0 == 1 then
				arg_185_0:Play319271044(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = 0
			local var_188_1 = 0.35

			if var_188_0 < arg_185_1.time_ and arg_185_1.time_ <= var_188_0 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_2 = arg_185_1:FormatText(StoryNameCfg[6].name)

				arg_185_1.leftNameTxt_.text = var_188_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_3 = arg_185_1:GetWordFromCfg(319271043)
				local var_188_4 = arg_185_1:FormatText(var_188_3.content)

				arg_185_1.text_.text = var_188_4

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_5 = 14
				local var_188_6 = utf8.len(var_188_4)
				local var_188_7 = var_188_5 <= 0 and var_188_1 or var_188_1 * (var_188_6 / var_188_5)

				if var_188_7 > 0 and var_188_1 < var_188_7 then
					arg_185_1.talkMaxDuration = var_188_7

					if var_188_7 + var_188_0 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_7 + var_188_0
					end
				end

				arg_185_1.text_.text = var_188_4
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319271", "319271043", "story_v_out_319271.awb") ~= 0 then
					local var_188_8 = manager.audio:GetVoiceLength("story_v_out_319271", "319271043", "story_v_out_319271.awb") / 1000

					if var_188_8 + var_188_0 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_8 + var_188_0
					end

					if var_188_3.prefab_name ~= "" and arg_185_1.actors_[var_188_3.prefab_name] ~= nil then
						local var_188_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_3.prefab_name].transform, "story_v_out_319271", "319271043", "story_v_out_319271.awb")

						arg_185_1:RecordAudio("319271043", var_188_9)
						arg_185_1:RecordAudio("319271043", var_188_9)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_319271", "319271043", "story_v_out_319271.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_319271", "319271043", "story_v_out_319271.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_10 = math.max(var_188_1, arg_185_1.talkMaxDuration)

			if var_188_0 <= arg_185_1.time_ and arg_185_1.time_ < var_188_0 + var_188_10 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_0) / var_188_10

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_0 + var_188_10 and arg_185_1.time_ < var_188_0 + var_188_10 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play319271044 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 319271044
		arg_189_1.duration_ = 7.7

		local var_189_0 = {
			zh = 5,
			ja = 7.7
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
				arg_189_0:Play319271045(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = 0
			local var_192_1 = 0.525

			if var_192_0 < arg_189_1.time_ and arg_189_1.time_ <= var_192_0 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_2 = arg_189_1:FormatText(StoryNameCfg[6].name)

				arg_189_1.leftNameTxt_.text = var_192_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_3 = arg_189_1:GetWordFromCfg(319271044)
				local var_192_4 = arg_189_1:FormatText(var_192_3.content)

				arg_189_1.text_.text = var_192_4

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_5 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_319271", "319271044", "story_v_out_319271.awb") ~= 0 then
					local var_192_8 = manager.audio:GetVoiceLength("story_v_out_319271", "319271044", "story_v_out_319271.awb") / 1000

					if var_192_8 + var_192_0 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_8 + var_192_0
					end

					if var_192_3.prefab_name ~= "" and arg_189_1.actors_[var_192_3.prefab_name] ~= nil then
						local var_192_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_3.prefab_name].transform, "story_v_out_319271", "319271044", "story_v_out_319271.awb")

						arg_189_1:RecordAudio("319271044", var_192_9)
						arg_189_1:RecordAudio("319271044", var_192_9)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_out_319271", "319271044", "story_v_out_319271.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_out_319271", "319271044", "story_v_out_319271.awb")
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
	Play319271045 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 319271045
		arg_193_1.duration_ = 3.433

		local var_193_0 = {
			zh = 1.7,
			ja = 3.433
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
				arg_193_0:Play319271046(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = 0
			local var_196_1 = 0.225

			if var_196_0 < arg_193_1.time_ and arg_193_1.time_ <= var_196_0 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_2 = arg_193_1:FormatText(StoryNameCfg[471].name)

				arg_193_1.leftNameTxt_.text = var_196_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, true)
				arg_193_1.iconController_:SetSelectedState("hero")

				arg_193_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1095")

				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_3 = arg_193_1:GetWordFromCfg(319271045)
				local var_196_4 = arg_193_1:FormatText(var_196_3.content)

				arg_193_1.text_.text = var_196_4

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_5 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_319271", "319271045", "story_v_out_319271.awb") ~= 0 then
					local var_196_8 = manager.audio:GetVoiceLength("story_v_out_319271", "319271045", "story_v_out_319271.awb") / 1000

					if var_196_8 + var_196_0 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_8 + var_196_0
					end

					if var_196_3.prefab_name ~= "" and arg_193_1.actors_[var_196_3.prefab_name] ~= nil then
						local var_196_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_193_1.actors_[var_196_3.prefab_name].transform, "story_v_out_319271", "319271045", "story_v_out_319271.awb")

						arg_193_1:RecordAudio("319271045", var_196_9)
						arg_193_1:RecordAudio("319271045", var_196_9)
					else
						arg_193_1:AudioAction("play", "voice", "story_v_out_319271", "319271045", "story_v_out_319271.awb")
					end

					arg_193_1:RecordHistoryTalkVoice("story_v_out_319271", "319271045", "story_v_out_319271.awb")
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
	Play319271046 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 319271046
		arg_197_1.duration_ = 4.833

		local var_197_0 = {
			zh = 4.833,
			ja = 2.766
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
				arg_197_0:Play319271047(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = 0
			local var_200_1 = 0.575

			if var_200_0 < arg_197_1.time_ and arg_197_1.time_ <= var_200_0 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_2 = arg_197_1:FormatText(StoryNameCfg[6].name)

				arg_197_1.leftNameTxt_.text = var_200_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_3 = arg_197_1:GetWordFromCfg(319271046)
				local var_200_4 = arg_197_1:FormatText(var_200_3.content)

				arg_197_1.text_.text = var_200_4

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_5 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_319271", "319271046", "story_v_out_319271.awb") ~= 0 then
					local var_200_8 = manager.audio:GetVoiceLength("story_v_out_319271", "319271046", "story_v_out_319271.awb") / 1000

					if var_200_8 + var_200_0 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_8 + var_200_0
					end

					if var_200_3.prefab_name ~= "" and arg_197_1.actors_[var_200_3.prefab_name] ~= nil then
						local var_200_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_197_1.actors_[var_200_3.prefab_name].transform, "story_v_out_319271", "319271046", "story_v_out_319271.awb")

						arg_197_1:RecordAudio("319271046", var_200_9)
						arg_197_1:RecordAudio("319271046", var_200_9)
					else
						arg_197_1:AudioAction("play", "voice", "story_v_out_319271", "319271046", "story_v_out_319271.awb")
					end

					arg_197_1:RecordHistoryTalkVoice("story_v_out_319271", "319271046", "story_v_out_319271.awb")
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
	Play319271047 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 319271047
		arg_201_1.duration_ = 4.666

		local var_201_0 = {
			zh = 2.033,
			ja = 4.666
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
				arg_201_0:Play319271048(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = 0
			local var_204_1 = 0.3

			if var_204_0 < arg_201_1.time_ and arg_201_1.time_ <= var_204_0 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_2 = arg_201_1:FormatText(StoryNameCfg[471].name)

				arg_201_1.leftNameTxt_.text = var_204_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, true)
				arg_201_1.iconController_:SetSelectedState("hero")

				arg_201_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1095")

				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_3 = arg_201_1:GetWordFromCfg(319271047)
				local var_204_4 = arg_201_1:FormatText(var_204_3.content)

				arg_201_1.text_.text = var_204_4

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_5 = 12
				local var_204_6 = utf8.len(var_204_4)
				local var_204_7 = var_204_5 <= 0 and var_204_1 or var_204_1 * (var_204_6 / var_204_5)

				if var_204_7 > 0 and var_204_1 < var_204_7 then
					arg_201_1.talkMaxDuration = var_204_7

					if var_204_7 + var_204_0 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_7 + var_204_0
					end
				end

				arg_201_1.text_.text = var_204_4
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319271", "319271047", "story_v_out_319271.awb") ~= 0 then
					local var_204_8 = manager.audio:GetVoiceLength("story_v_out_319271", "319271047", "story_v_out_319271.awb") / 1000

					if var_204_8 + var_204_0 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_8 + var_204_0
					end

					if var_204_3.prefab_name ~= "" and arg_201_1.actors_[var_204_3.prefab_name] ~= nil then
						local var_204_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_3.prefab_name].transform, "story_v_out_319271", "319271047", "story_v_out_319271.awb")

						arg_201_1:RecordAudio("319271047", var_204_9)
						arg_201_1:RecordAudio("319271047", var_204_9)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_out_319271", "319271047", "story_v_out_319271.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_out_319271", "319271047", "story_v_out_319271.awb")
				end

				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_10 = math.max(var_204_1, arg_201_1.talkMaxDuration)

			if var_204_0 <= arg_201_1.time_ and arg_201_1.time_ < var_204_0 + var_204_10 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_0) / var_204_10

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_0 + var_204_10 and arg_201_1.time_ < var_204_0 + var_204_10 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play319271048 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 319271048
		arg_205_1.duration_ = 10.8

		local var_205_0 = {
			zh = 5.466,
			ja = 10.8
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
				arg_205_0:Play319271049(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = 0
			local var_208_1 = 0.75

			if var_208_0 < arg_205_1.time_ and arg_205_1.time_ <= var_208_0 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_2 = arg_205_1:FormatText(StoryNameCfg[6].name)

				arg_205_1.leftNameTxt_.text = var_208_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_3 = arg_205_1:GetWordFromCfg(319271048)
				local var_208_4 = arg_205_1:FormatText(var_208_3.content)

				arg_205_1.text_.text = var_208_4

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_5 = 30
				local var_208_6 = utf8.len(var_208_4)
				local var_208_7 = var_208_5 <= 0 and var_208_1 or var_208_1 * (var_208_6 / var_208_5)

				if var_208_7 > 0 and var_208_1 < var_208_7 then
					arg_205_1.talkMaxDuration = var_208_7

					if var_208_7 + var_208_0 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_7 + var_208_0
					end
				end

				arg_205_1.text_.text = var_208_4
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319271", "319271048", "story_v_out_319271.awb") ~= 0 then
					local var_208_8 = manager.audio:GetVoiceLength("story_v_out_319271", "319271048", "story_v_out_319271.awb") / 1000

					if var_208_8 + var_208_0 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_8 + var_208_0
					end

					if var_208_3.prefab_name ~= "" and arg_205_1.actors_[var_208_3.prefab_name] ~= nil then
						local var_208_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_3.prefab_name].transform, "story_v_out_319271", "319271048", "story_v_out_319271.awb")

						arg_205_1:RecordAudio("319271048", var_208_9)
						arg_205_1:RecordAudio("319271048", var_208_9)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_319271", "319271048", "story_v_out_319271.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_319271", "319271048", "story_v_out_319271.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_10 = math.max(var_208_1, arg_205_1.talkMaxDuration)

			if var_208_0 <= arg_205_1.time_ and arg_205_1.time_ < var_208_0 + var_208_10 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_0) / var_208_10

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_0 + var_208_10 and arg_205_1.time_ < var_208_0 + var_208_10 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play319271049 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 319271049
		arg_209_1.duration_ = 6.2

		local var_209_0 = {
			zh = 6.2,
			ja = 2.066
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
				arg_209_0:Play319271050(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = 0
			local var_212_1 = 0.75

			if var_212_0 < arg_209_1.time_ and arg_209_1.time_ <= var_212_0 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_2 = arg_209_1:FormatText(StoryNameCfg[6].name)

				arg_209_1.leftNameTxt_.text = var_212_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_3 = arg_209_1:GetWordFromCfg(319271049)
				local var_212_4 = arg_209_1:FormatText(var_212_3.content)

				arg_209_1.text_.text = var_212_4

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_5 = 30
				local var_212_6 = utf8.len(var_212_4)
				local var_212_7 = var_212_5 <= 0 and var_212_1 or var_212_1 * (var_212_6 / var_212_5)

				if var_212_7 > 0 and var_212_1 < var_212_7 then
					arg_209_1.talkMaxDuration = var_212_7

					if var_212_7 + var_212_0 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_7 + var_212_0
					end
				end

				arg_209_1.text_.text = var_212_4
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319271", "319271049", "story_v_out_319271.awb") ~= 0 then
					local var_212_8 = manager.audio:GetVoiceLength("story_v_out_319271", "319271049", "story_v_out_319271.awb") / 1000

					if var_212_8 + var_212_0 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_8 + var_212_0
					end

					if var_212_3.prefab_name ~= "" and arg_209_1.actors_[var_212_3.prefab_name] ~= nil then
						local var_212_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_3.prefab_name].transform, "story_v_out_319271", "319271049", "story_v_out_319271.awb")

						arg_209_1:RecordAudio("319271049", var_212_9)
						arg_209_1:RecordAudio("319271049", var_212_9)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_out_319271", "319271049", "story_v_out_319271.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_out_319271", "319271049", "story_v_out_319271.awb")
				end

				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_10 = math.max(var_212_1, arg_209_1.talkMaxDuration)

			if var_212_0 <= arg_209_1.time_ and arg_209_1.time_ < var_212_0 + var_212_10 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_0) / var_212_10

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_0 + var_212_10 and arg_209_1.time_ < var_212_0 + var_212_10 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play319271050 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 319271050
		arg_213_1.duration_ = 5

		SetActive(arg_213_1.tipsGo_, false)

		function arg_213_1.onSingleLineFinish_()
			arg_213_1.onSingleLineUpdate_ = nil
			arg_213_1.onSingleLineFinish_ = nil
			arg_213_1.state_ = "waiting"
		end

		function arg_213_1.playNext_(arg_215_0)
			if arg_215_0 == 1 then
				arg_213_0:Play319271051(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = 0
			local var_216_1 = 0.825

			if var_216_0 < arg_213_1.time_ and arg_213_1.time_ <= var_216_0 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, false)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_2 = arg_213_1:GetWordFromCfg(319271050)
				local var_216_3 = arg_213_1:FormatText(var_216_2.content)

				arg_213_1.text_.text = var_216_3

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_4 = 33
				local var_216_5 = utf8.len(var_216_3)
				local var_216_6 = var_216_4 <= 0 and var_216_1 or var_216_1 * (var_216_5 / var_216_4)

				if var_216_6 > 0 and var_216_1 < var_216_6 then
					arg_213_1.talkMaxDuration = var_216_6

					if var_216_6 + var_216_0 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_6 + var_216_0
					end
				end

				arg_213_1.text_.text = var_216_3
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)
				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_7 = math.max(var_216_1, arg_213_1.talkMaxDuration)

			if var_216_0 <= arg_213_1.time_ and arg_213_1.time_ < var_216_0 + var_216_7 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_0) / var_216_7

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_0 + var_216_7 and arg_213_1.time_ < var_216_0 + var_216_7 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play319271051 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 319271051
		arg_217_1.duration_ = 5

		local var_217_0 = {
			zh = 5,
			ja = 1.4
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
				arg_217_0:Play319271052(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = 0
			local var_220_1 = 0.575

			if var_220_0 < arg_217_1.time_ and arg_217_1.time_ <= var_220_0 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_2 = arg_217_1:FormatText(StoryNameCfg[6].name)

				arg_217_1.leftNameTxt_.text = var_220_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_3 = arg_217_1:GetWordFromCfg(319271051)
				local var_220_4 = arg_217_1:FormatText(var_220_3.content)

				arg_217_1.text_.text = var_220_4

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_5 = 23
				local var_220_6 = utf8.len(var_220_4)
				local var_220_7 = var_220_5 <= 0 and var_220_1 or var_220_1 * (var_220_6 / var_220_5)

				if var_220_7 > 0 and var_220_1 < var_220_7 then
					arg_217_1.talkMaxDuration = var_220_7

					if var_220_7 + var_220_0 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_7 + var_220_0
					end
				end

				arg_217_1.text_.text = var_220_4
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319271", "319271051", "story_v_out_319271.awb") ~= 0 then
					local var_220_8 = manager.audio:GetVoiceLength("story_v_out_319271", "319271051", "story_v_out_319271.awb") / 1000

					if var_220_8 + var_220_0 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_8 + var_220_0
					end

					if var_220_3.prefab_name ~= "" and arg_217_1.actors_[var_220_3.prefab_name] ~= nil then
						local var_220_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_3.prefab_name].transform, "story_v_out_319271", "319271051", "story_v_out_319271.awb")

						arg_217_1:RecordAudio("319271051", var_220_9)
						arg_217_1:RecordAudio("319271051", var_220_9)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_out_319271", "319271051", "story_v_out_319271.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_out_319271", "319271051", "story_v_out_319271.awb")
				end

				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_10 = math.max(var_220_1, arg_217_1.talkMaxDuration)

			if var_220_0 <= arg_217_1.time_ and arg_217_1.time_ < var_220_0 + var_220_10 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_0) / var_220_10

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_0 + var_220_10 and arg_217_1.time_ < var_220_0 + var_220_10 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play319271052 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 319271052
		arg_221_1.duration_ = 7.6

		local var_221_0 = {
			zh = 6.633,
			ja = 7.6
		}
		local var_221_1 = manager.audio:GetLocalizationFlag()

		if var_221_0[var_221_1] ~= nil then
			arg_221_1.duration_ = var_221_0[var_221_1]
		end

		SetActive(arg_221_1.tipsGo_, false)

		function arg_221_1.onSingleLineFinish_()
			arg_221_1.onSingleLineUpdate_ = nil
			arg_221_1.onSingleLineFinish_ = nil
			arg_221_1.state_ = "waiting"
			arg_221_1.auto_ = false
		end

		function arg_221_1.playNext_(arg_223_0)
			arg_221_1.onStoryFinished_()
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = arg_221_1.bgs_.ML0208.transform
			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 then
				arg_221_1.var_.moveOldPosML0208 = var_224_0.localPosition
			end

			local var_224_2 = 0.001

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_2 then
				local var_224_3 = (arg_221_1.time_ - var_224_1) / var_224_2
				local var_224_4 = Vector3.New(0, 1, 10)

				var_224_0.localPosition = Vector3.Lerp(arg_221_1.var_.moveOldPosML0208, var_224_4, var_224_3)
			end

			if arg_221_1.time_ >= var_224_1 + var_224_2 and arg_221_1.time_ < var_224_1 + var_224_2 + arg_224_0 then
				var_224_0.localPosition = Vector3.New(0, 1, 10)
			end

			local var_224_5 = arg_221_1.bgs_.ML0208.transform
			local var_224_6 = 0.0166666666666667

			if var_224_6 < arg_221_1.time_ and arg_221_1.time_ <= var_224_6 + arg_224_0 then
				arg_221_1.var_.moveOldPosML0208 = var_224_5.localPosition
			end

			local var_224_7 = 2.11666666666667

			if var_224_6 <= arg_221_1.time_ and arg_221_1.time_ < var_224_6 + var_224_7 then
				local var_224_8 = (arg_221_1.time_ - var_224_6) / var_224_7
				local var_224_9 = Vector3.New(0, 0.86, 6.99)

				var_224_5.localPosition = Vector3.Lerp(arg_221_1.var_.moveOldPosML0208, var_224_9, var_224_8)
			end

			if arg_221_1.time_ >= var_224_6 + var_224_7 and arg_221_1.time_ < var_224_6 + var_224_7 + arg_224_0 then
				var_224_5.localPosition = Vector3.New(0, 0.86, 6.99)
			end

			if arg_221_1.frameCnt_ <= 1 then
				arg_221_1.dialog_:SetActive(false)
			end

			local var_224_10 = 1.3
			local var_224_11 = 0.55

			if var_224_10 < arg_221_1.time_ and arg_221_1.time_ <= var_224_10 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0

				arg_221_1.dialog_:SetActive(true)

				local var_224_12 = LeanTween.value(arg_221_1.dialog_, 0, 1, 0.3)

				var_224_12:setOnUpdate(LuaHelper.FloatAction(function(arg_225_0)
					arg_221_1.dialogCg_.alpha = arg_225_0
				end))
				var_224_12:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_221_1.dialog_)
					var_224_12:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_221_1.duration_ = arg_221_1.duration_ + 0.3

				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_13 = arg_221_1:FormatText(StoryNameCfg[6].name)

				arg_221_1.leftNameTxt_.text = var_224_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_14 = arg_221_1:GetWordFromCfg(319271052)
				local var_224_15 = arg_221_1:FormatText(var_224_14.content)

				arg_221_1.text_.text = var_224_15

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_16 = 22
				local var_224_17 = utf8.len(var_224_15)
				local var_224_18 = var_224_16 <= 0 and var_224_11 or var_224_11 * (var_224_17 / var_224_16)

				if var_224_18 > 0 and var_224_11 < var_224_18 then
					arg_221_1.talkMaxDuration = var_224_18
					var_224_10 = var_224_10 + 0.3

					if var_224_18 + var_224_10 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_18 + var_224_10
					end
				end

				arg_221_1.text_.text = var_224_15
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319271", "319271052", "story_v_out_319271.awb") ~= 0 then
					local var_224_19 = manager.audio:GetVoiceLength("story_v_out_319271", "319271052", "story_v_out_319271.awb") / 1000

					if var_224_19 + var_224_10 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_19 + var_224_10
					end

					if var_224_14.prefab_name ~= "" and arg_221_1.actors_[var_224_14.prefab_name] ~= nil then
						local var_224_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_14.prefab_name].transform, "story_v_out_319271", "319271052", "story_v_out_319271.awb")

						arg_221_1:RecordAudio("319271052", var_224_20)
						arg_221_1:RecordAudio("319271052", var_224_20)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_out_319271", "319271052", "story_v_out_319271.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_out_319271", "319271052", "story_v_out_319271.awb")
				end

				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_21 = var_224_10 + 0.3
			local var_224_22 = math.max(var_224_11, arg_221_1.talkMaxDuration)

			if var_224_21 <= arg_221_1.time_ and arg_221_1.time_ < var_224_21 + var_224_22 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_21) / var_224_22

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_21 + var_224_22 and arg_221_1.time_ < var_224_21 + var_224_22 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/I11i",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ML0208"
	},
	voices = {
		"story_v_out_319271.awb"
	}
}
