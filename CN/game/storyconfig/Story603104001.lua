﻿return {
	Play603104001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 603104001
		arg_1_1.duration_ = 5.33

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play603104002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "1094"

			if arg_1_1.actors_[var_4_0] == nil then
				local var_4_1 = Object.Instantiate(arg_1_1.imageGo_, arg_1_1.canvasGo_.transform)

				var_4_1.transform:SetSiblingIndex(1)

				var_4_1.name = var_4_0

				local var_4_2 = var_4_1:GetComponent(typeof(Image))

				var_4_2.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. "1094")

				var_4_2:SetNativeSize()

				var_4_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_1_1.actors_[var_4_0] = var_4_1
			end

			local var_4_3 = arg_1_1.actors_["1094"].transform
			local var_4_4 = 0.333333333333333

			if var_4_4 < arg_1_1.time_ and arg_1_1.time_ <= var_4_4 + arg_4_0 then
				arg_1_1.var_.moveOldPos1094 = var_4_3.localPosition
				var_4_3.localScale = Vector3.New(1, 1, 1)
			end

			local var_4_5 = 0.001

			if var_4_4 <= arg_1_1.time_ and arg_1_1.time_ < var_4_4 + var_4_5 then
				local var_4_6 = (arg_1_1.time_ - var_4_4) / var_4_5
				local var_4_7 = Vector3.New(0, -200, 1100)

				var_4_3.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1094, var_4_7, var_4_6)
			end

			if arg_1_1.time_ >= var_4_4 + var_4_5 and arg_1_1.time_ < var_4_4 + var_4_5 + arg_4_0 then
				var_4_3.localPosition = Vector3.New(0, -200, 1100)
			end

			local var_4_8 = arg_1_1.actors_["1094"]
			local var_4_9 = 0.333333333333333

			if var_4_9 < arg_1_1.time_ and arg_1_1.time_ <= var_4_9 + arg_4_0 and not isNil(var_4_8) then
				local var_4_10 = var_4_8:GetComponent("Image")

				if var_4_10 then
					arg_1_1.var_.highlightMatValue1094 = var_4_10
				end
			end

			local var_4_11 = 0.2

			if var_4_9 <= arg_1_1.time_ and arg_1_1.time_ < var_4_9 + var_4_11 and not isNil(var_4_8) then
				local var_4_12 = (arg_1_1.time_ - var_4_9) / var_4_11

				if arg_1_1.var_.highlightMatValue1094 then
					local var_4_13 = Mathf.Lerp(0.5, 1, var_4_12)
					local var_4_14 = arg_1_1.var_.highlightMatValue1094
					local var_4_15 = var_4_14.color

					var_4_15.r = var_4_13
					var_4_15.g = var_4_13
					var_4_15.b = var_4_13
					var_4_14.color = var_4_15
				end
			end

			if arg_1_1.time_ >= var_4_9 + var_4_11 and arg_1_1.time_ < var_4_9 + var_4_11 + arg_4_0 and not isNil(var_4_8) and arg_1_1.var_.highlightMatValue1094 then
				local var_4_16 = 1

				var_4_8.transform:SetSiblingIndex(1)

				local var_4_17 = arg_1_1.var_.highlightMatValue1094
				local var_4_18 = var_4_17.color

				var_4_18.r = var_4_16
				var_4_18.g = var_4_16
				var_4_18.b = var_4_16
				var_4_17.color = var_4_18
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_19 = 0.333333333333333
			local var_4_20 = 0.075

			if var_4_19 < arg_1_1.time_ and arg_1_1.time_ <= var_4_19 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_21 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_21:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_21:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_21:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_22 = arg_1_1:FormatText(StoryNameCfg[181].name)

				arg_1_1.leftNameTxt_.text = var_4_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_23 = arg_1_1:GetWordFromCfg(603104001)
				local var_4_24 = arg_1_1:FormatText(var_4_23.content)

				arg_1_1.text_.text = var_4_24

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_25 = 3
				local var_4_26 = utf8.len(var_4_24)
				local var_4_27 = var_4_25 <= 0 and var_4_20 or var_4_20 * (var_4_26 / var_4_25)

				if var_4_27 > 0 and var_4_20 < var_4_27 then
					arg_1_1.talkMaxDuration = var_4_27
					var_4_19 = var_4_19 + 0.3

					if var_4_27 + var_4_19 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_27 + var_4_19
					end
				end

				arg_1_1.text_.text = var_4_24
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_28 = var_4_19 + 0.3
			local var_4_29 = math.max(var_4_20, arg_1_1.talkMaxDuration)

			if var_4_28 <= arg_1_1.time_ and arg_1_1.time_ < var_4_28 + var_4_29 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_28) / var_4_29

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_28 + var_4_29 and arg_1_1.time_ < var_4_28 + var_4_29 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play603104002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 603104002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play603104003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = arg_7_1.actors_["1094"]
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 and not isNil(var_10_0) then
				local var_10_2 = var_10_0:GetComponent("Image")

				if var_10_2 then
					arg_7_1.var_.highlightMatValue1094 = var_10_2
				end
			end

			local var_10_3 = 0.2

			if var_10_1 <= arg_7_1.time_ and arg_7_1.time_ < var_10_1 + var_10_3 and not isNil(var_10_0) then
				local var_10_4 = (arg_7_1.time_ - var_10_1) / var_10_3

				if arg_7_1.var_.highlightMatValue1094 then
					local var_10_5 = Mathf.Lerp(1, 0.5, var_10_4)
					local var_10_6 = arg_7_1.var_.highlightMatValue1094
					local var_10_7 = var_10_6.color

					var_10_7.r = var_10_5
					var_10_7.g = var_10_5
					var_10_7.b = var_10_5
					var_10_6.color = var_10_7
				end
			end

			if arg_7_1.time_ >= var_10_1 + var_10_3 and arg_7_1.time_ < var_10_1 + var_10_3 + arg_10_0 and not isNil(var_10_0) and arg_7_1.var_.highlightMatValue1094 then
				local var_10_8 = 0.5
				local var_10_9 = arg_7_1.var_.highlightMatValue1094
				local var_10_10 = var_10_9.color

				var_10_10.r = var_10_8
				var_10_10.g = var_10_8
				var_10_10.b = var_10_8
				var_10_9.color = var_10_10
			end

			local var_10_11 = 0
			local var_10_12 = 0.45

			if var_10_11 < arg_7_1.time_ and arg_7_1.time_ <= var_10_11 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_13 = arg_7_1:FormatText(StoryNameCfg[177].name)

				arg_7_1.leftNameTxt_.text = var_10_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, true)
				arg_7_1.iconController_:SetSelectedState("hero")

				arg_7_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_ganglati")

				arg_7_1.callingController_:SetSelectedState("normal")

				arg_7_1.keyicon_.color = Color.New(1, 1, 1)
				arg_7_1.icon_.color = Color.New(1, 1, 1)

				local var_10_14 = arg_7_1:GetWordFromCfg(603104002)
				local var_10_15 = arg_7_1:FormatText(var_10_14.content)

				arg_7_1.text_.text = var_10_15

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_16 = 18
				local var_10_17 = utf8.len(var_10_15)
				local var_10_18 = var_10_16 <= 0 and var_10_12 or var_10_12 * (var_10_17 / var_10_16)

				if var_10_18 > 0 and var_10_12 < var_10_18 then
					arg_7_1.talkMaxDuration = var_10_18

					if var_10_18 + var_10_11 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_18 + var_10_11
					end
				end

				arg_7_1.text_.text = var_10_15
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)
				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_19 = math.max(var_10_12, arg_7_1.talkMaxDuration)

			if var_10_11 <= arg_7_1.time_ and arg_7_1.time_ < var_10_11 + var_10_19 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_11) / var_10_19

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_11 + var_10_19 and arg_7_1.time_ < var_10_11 + var_10_19 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play603104003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 603104003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play603104004(arg_11_1)
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

				local var_14_2 = arg_11_1:GetWordFromCfg(603104003)
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
	Play603104004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 603104004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play603104005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 0.55

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

				local var_18_2 = arg_15_1:GetWordFromCfg(603104004)
				local var_18_3 = arg_15_1:FormatText(var_18_2.content)

				arg_15_1.text_.text = var_18_3

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_4 = 22
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
	Play603104005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 603104005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play603104006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 0.3

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_2 = arg_19_1:FormatText(StoryNameCfg[7].name)

				arg_19_1.leftNameTxt_.text = var_22_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, true)
				arg_19_1.iconController_:SetSelectedState("hero")

				arg_19_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_admin")

				arg_19_1.callingController_:SetSelectedState("normal")

				arg_19_1.keyicon_.color = Color.New(1, 1, 1)
				arg_19_1.icon_.color = Color.New(1, 1, 1)

				local var_22_3 = arg_19_1:GetWordFromCfg(603104005)
				local var_22_4 = arg_19_1:FormatText(var_22_3.content)

				arg_19_1.text_.text = var_22_4

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_5 = 12
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
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_8 = math.max(var_22_1, arg_19_1.talkMaxDuration)

			if var_22_0 <= arg_19_1.time_ and arg_19_1.time_ < var_22_0 + var_22_8 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_0) / var_22_8

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_0 + var_22_8 and arg_19_1.time_ < var_22_0 + var_22_8 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play603104006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 603104006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
			arg_23_1.auto_ = false
		end

		function arg_23_1.playNext_(arg_25_0)
			arg_23_1.onStoryFinished_()
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1094"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and not isNil(var_26_0) then
				local var_26_2 = var_26_0:GetComponent("Image")

				if var_26_2 then
					arg_23_1.var_.highlightMatValue1094 = var_26_2
				end
			end

			local var_26_3 = 0.2

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_3 and not isNil(var_26_0) then
				local var_26_4 = (arg_23_1.time_ - var_26_1) / var_26_3

				if arg_23_1.var_.highlightMatValue1094 then
					local var_26_5 = Mathf.Lerp(0.5, 1, var_26_4)
					local var_26_6 = arg_23_1.var_.highlightMatValue1094
					local var_26_7 = var_26_6.color

					var_26_7.r = var_26_5
					var_26_7.g = var_26_5
					var_26_7.b = var_26_5
					var_26_6.color = var_26_7
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_3 and arg_23_1.time_ < var_26_1 + var_26_3 + arg_26_0 and not isNil(var_26_0) and arg_23_1.var_.highlightMatValue1094 then
				local var_26_8 = 1

				var_26_0.transform:SetSiblingIndex(1)

				local var_26_9 = arg_23_1.var_.highlightMatValue1094
				local var_26_10 = var_26_9.color

				var_26_10.r = var_26_8
				var_26_10.g = var_26_8
				var_26_10.b = var_26_8
				var_26_9.color = var_26_10
			end

			local var_26_11 = 0
			local var_26_12 = 0.275

			if var_26_11 < arg_23_1.time_ and arg_23_1.time_ <= var_26_11 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_13 = arg_23_1:FormatText(StoryNameCfg[181].name)

				arg_23_1.leftNameTxt_.text = var_26_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_14 = arg_23_1:GetWordFromCfg(603104006)
				local var_26_15 = arg_23_1:FormatText(var_26_14.content)

				arg_23_1.text_.text = var_26_15

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_16 = 11
				local var_26_17 = utf8.len(var_26_15)
				local var_26_18 = var_26_16 <= 0 and var_26_12 or var_26_12 * (var_26_17 / var_26_16)

				if var_26_18 > 0 and var_26_12 < var_26_18 then
					arg_23_1.talkMaxDuration = var_26_18

					if var_26_18 + var_26_11 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_18 + var_26_11
					end
				end

				arg_23_1.text_.text = var_26_15
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_19 = math.max(var_26_12, arg_23_1.talkMaxDuration)

			if var_26_11 <= arg_23_1.time_ and arg_23_1.time_ < var_26_11 + var_26_19 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_11) / var_26_19

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_11 + var_26_19 and arg_23_1.time_ < var_26_11 + var_26_19 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	assets = {},
	voices = {}
}
