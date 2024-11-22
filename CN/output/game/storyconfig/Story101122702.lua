return {
	Play112272001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 112272001
		arg_1_1.duration_ = 5

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play112272002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = 0
			local var_4_1 = 0.575

			if var_4_0 < arg_1_1.time_ and arg_1_1.time_ <= var_4_0 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_2 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_2:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_2:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_2:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_3 = arg_1_1:GetWordFromCfg(112272001)
				local var_4_4 = arg_1_1:FormatText(var_4_3.content)

				arg_1_1.text_.text = var_4_4

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_5 = 23
				local var_4_6 = utf8.len(var_4_4)
				local var_4_7 = var_4_5 <= 0 and var_4_1 or var_4_1 * (var_4_6 / var_4_5)

				if var_4_7 > 0 and var_4_1 < var_4_7 then
					arg_1_1.talkMaxDuration = var_4_7
					var_4_0 = var_4_0 + 0.3

					if var_4_7 + var_4_0 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_7 + var_4_0
					end
				end

				arg_1_1.text_.text = var_4_4
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_8 = var_4_0 + 0.3
			local var_4_9 = math.max(var_4_1, arg_1_1.talkMaxDuration)

			if var_4_8 <= arg_1_1.time_ and arg_1_1.time_ < var_4_8 + var_4_9 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_8) / var_4_9

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_8 + var_4_9 and arg_1_1.time_ < var_4_8 + var_4_9 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play112272002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 112272002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play112272003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.725

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

				local var_10_2 = arg_7_1:GetWordFromCfg(112272002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 29
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
	Play112272003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 112272003
		arg_11_1.duration_ = 5.2

		local var_11_0 = {
			ja = 5.2,
			ko = 3.566,
			zh = 3.233,
			en = 4.733
		}
		local var_11_1 = manager.audio:GetLocalizationFlag()

		if var_11_0[var_11_1] ~= nil then
			arg_11_1.duration_ = var_11_0[var_11_1]
		end

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play112272004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "1081_1"

			if arg_11_1.actors_[var_14_0] == nil then
				local var_14_1 = Object.Instantiate(arg_11_1.imageGo_, arg_11_1.canvasGo_.transform)

				var_14_1.transform:SetSiblingIndex(1)

				var_14_1.name = var_14_0

				local var_14_2 = var_14_1:GetComponent(typeof(Image))

				var_14_2.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. "1081_1")

				var_14_2:SetNativeSize()

				var_14_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_11_1.actors_[var_14_0] = var_14_1
			end

			local var_14_3 = arg_11_1.actors_["1081_1"].transform
			local var_14_4 = 0

			if var_14_4 < arg_11_1.time_ and arg_11_1.time_ <= var_14_4 + arg_14_0 then
				arg_11_1.var_.moveOldPos1081_1 = var_14_3.localPosition
				var_14_3.localScale = Vector3.New(1, 1, 1)
			end

			local var_14_5 = 0.001

			if var_14_4 <= arg_11_1.time_ and arg_11_1.time_ < var_14_4 + var_14_5 then
				local var_14_6 = (arg_11_1.time_ - var_14_4) / var_14_5
				local var_14_7 = Vector3.New(-500, -300, 0)

				var_14_3.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1081_1, var_14_7, var_14_6)
			end

			if arg_11_1.time_ >= var_14_4 + var_14_5 and arg_11_1.time_ < var_14_4 + var_14_5 + arg_14_0 then
				var_14_3.localPosition = Vector3.New(-500, -300, 0)
			end

			local var_14_8 = "1081"

			if arg_11_1.actors_[var_14_8] == nil then
				local var_14_9 = Object.Instantiate(arg_11_1.imageGo_, arg_11_1.canvasGo_.transform)

				var_14_9.transform:SetSiblingIndex(1)

				var_14_9.name = var_14_8

				local var_14_10 = var_14_9:GetComponent(typeof(Image))

				var_14_10.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. "1081")

				var_14_10:SetNativeSize()

				var_14_9.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_11_1.actors_[var_14_8] = var_14_9
			end

			local var_14_11 = arg_11_1.actors_["1081"]
			local var_14_12 = 0

			if var_14_12 < arg_11_1.time_ and arg_11_1.time_ <= var_14_12 + arg_14_0 and not isNil(var_14_11) then
				local var_14_13 = var_14_11:GetComponent("Image")

				if var_14_13 then
					arg_11_1.var_.highlightMatValue1081 = var_14_13
				end
			end

			local var_14_14 = 0.2

			if var_14_12 <= arg_11_1.time_ and arg_11_1.time_ < var_14_12 + var_14_14 and not isNil(var_14_11) then
				local var_14_15 = (arg_11_1.time_ - var_14_12) / var_14_14

				if arg_11_1.var_.highlightMatValue1081 then
					local var_14_16 = Mathf.Lerp(0.5, 1, var_14_15)
					local var_14_17 = arg_11_1.var_.highlightMatValue1081
					local var_14_18 = var_14_17.color

					var_14_18.r = var_14_16
					var_14_18.g = var_14_16
					var_14_18.b = var_14_16
					var_14_17.color = var_14_18
				end
			end

			if arg_11_1.time_ >= var_14_12 + var_14_14 and arg_11_1.time_ < var_14_12 + var_14_14 + arg_14_0 and not isNil(var_14_11) and arg_11_1.var_.highlightMatValue1081 then
				local var_14_19 = 1

				var_14_11.transform:SetSiblingIndex(1)

				local var_14_20 = arg_11_1.var_.highlightMatValue1081
				local var_14_21 = var_14_20.color

				var_14_21.r = var_14_19
				var_14_21.g = var_14_19
				var_14_21.b = var_14_19
				var_14_20.color = var_14_21
			end

			local var_14_22 = 0
			local var_14_23 = 0.25

			if var_14_22 < arg_11_1.time_ and arg_11_1.time_ <= var_14_22 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_24 = arg_11_1:FormatText(StoryNameCfg[202].name)

				arg_11_1.leftNameTxt_.text = var_14_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_25 = arg_11_1:GetWordFromCfg(112272003)
				local var_14_26 = arg_11_1:FormatText(var_14_25.content)

				arg_11_1.text_.text = var_14_26

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_27 = 10
				local var_14_28 = utf8.len(var_14_26)
				local var_14_29 = var_14_27 <= 0 and var_14_23 or var_14_23 * (var_14_28 / var_14_27)

				if var_14_29 > 0 and var_14_23 < var_14_29 then
					arg_11_1.talkMaxDuration = var_14_29

					if var_14_29 + var_14_22 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_29 + var_14_22
					end
				end

				arg_11_1.text_.text = var_14_26
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112272", "112272003", "story_v_out_112272.awb") ~= 0 then
					local var_14_30 = manager.audio:GetVoiceLength("story_v_out_112272", "112272003", "story_v_out_112272.awb") / 1000

					if var_14_30 + var_14_22 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_30 + var_14_22
					end

					if var_14_25.prefab_name ~= "" and arg_11_1.actors_[var_14_25.prefab_name] ~= nil then
						local var_14_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_25.prefab_name].transform, "story_v_out_112272", "112272003", "story_v_out_112272.awb")

						arg_11_1:RecordAudio("112272003", var_14_31)
						arg_11_1:RecordAudio("112272003", var_14_31)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_112272", "112272003", "story_v_out_112272.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_112272", "112272003", "story_v_out_112272.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_32 = math.max(var_14_23, arg_11_1.talkMaxDuration)

			if var_14_22 <= arg_11_1.time_ and arg_11_1.time_ < var_14_22 + var_14_32 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_22) / var_14_32

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_22 + var_14_32 and arg_11_1.time_ < var_14_22 + var_14_32 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play112272004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 112272004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play112272005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1081"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and not isNil(var_18_0) then
				local var_18_2 = var_18_0:GetComponent("Image")

				if var_18_2 then
					arg_15_1.var_.highlightMatValue1081 = var_18_2
				end
			end

			local var_18_3 = 0.2

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_3 and not isNil(var_18_0) then
				local var_18_4 = (arg_15_1.time_ - var_18_1) / var_18_3

				if arg_15_1.var_.highlightMatValue1081 then
					local var_18_5 = Mathf.Lerp(1, 0.5, var_18_4)
					local var_18_6 = arg_15_1.var_.highlightMatValue1081
					local var_18_7 = var_18_6.color

					var_18_7.r = var_18_5
					var_18_7.g = var_18_5
					var_18_7.b = var_18_5
					var_18_6.color = var_18_7
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_3 and arg_15_1.time_ < var_18_1 + var_18_3 + arg_18_0 and not isNil(var_18_0) and arg_15_1.var_.highlightMatValue1081 then
				local var_18_8 = 0.5
				local var_18_9 = arg_15_1.var_.highlightMatValue1081
				local var_18_10 = var_18_9.color

				var_18_10.r = var_18_8
				var_18_10.g = var_18_8
				var_18_10.b = var_18_8
				var_18_9.color = var_18_10
			end

			local var_18_11 = 0
			local var_18_12 = 0.175

			if var_18_11 < arg_15_1.time_ and arg_15_1.time_ <= var_18_11 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_13 = arg_15_1:FormatText(StoryNameCfg[7].name)

				arg_15_1.leftNameTxt_.text = var_18_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_14 = arg_15_1:GetWordFromCfg(112272004)
				local var_18_15 = arg_15_1:FormatText(var_18_14.content)

				arg_15_1.text_.text = var_18_15

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_16 = 7
				local var_18_17 = utf8.len(var_18_15)
				local var_18_18 = var_18_16 <= 0 and var_18_12 or var_18_12 * (var_18_17 / var_18_16)

				if var_18_18 > 0 and var_18_12 < var_18_18 then
					arg_15_1.talkMaxDuration = var_18_18

					if var_18_18 + var_18_11 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_18 + var_18_11
					end
				end

				arg_15_1.text_.text = var_18_15
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_19 = math.max(var_18_12, arg_15_1.talkMaxDuration)

			if var_18_11 <= arg_15_1.time_ and arg_15_1.time_ < var_18_11 + var_18_19 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_11) / var_18_19

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_11 + var_18_19 and arg_15_1.time_ < var_18_11 + var_18_19 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play112272005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 112272005
		arg_19_1.duration_ = 13.4

		local var_19_0 = {
			ja = 13.4,
			ko = 10.033,
			zh = 8.866,
			en = 11.933
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
				arg_19_0:Play112272006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1081"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and not isNil(var_22_0) then
				local var_22_2 = var_22_0:GetComponent("Image")

				if var_22_2 then
					arg_19_1.var_.highlightMatValue1081 = var_22_2
				end
			end

			local var_22_3 = 0.2

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_3 and not isNil(var_22_0) then
				local var_22_4 = (arg_19_1.time_ - var_22_1) / var_22_3

				if arg_19_1.var_.highlightMatValue1081 then
					local var_22_5 = Mathf.Lerp(0.5, 1, var_22_4)
					local var_22_6 = arg_19_1.var_.highlightMatValue1081
					local var_22_7 = var_22_6.color

					var_22_7.r = var_22_5
					var_22_7.g = var_22_5
					var_22_7.b = var_22_5
					var_22_6.color = var_22_7
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_3 and arg_19_1.time_ < var_22_1 + var_22_3 + arg_22_0 and not isNil(var_22_0) and arg_19_1.var_.highlightMatValue1081 then
				local var_22_8 = 1

				var_22_0.transform:SetSiblingIndex(1)

				local var_22_9 = arg_19_1.var_.highlightMatValue1081
				local var_22_10 = var_22_9.color

				var_22_10.r = var_22_8
				var_22_10.g = var_22_8
				var_22_10.b = var_22_8
				var_22_9.color = var_22_10
			end

			local var_22_11 = 0
			local var_22_12 = 1.2

			if var_22_11 < arg_19_1.time_ and arg_19_1.time_ <= var_22_11 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_13 = arg_19_1:FormatText(StoryNameCfg[202].name)

				arg_19_1.leftNameTxt_.text = var_22_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_14 = arg_19_1:GetWordFromCfg(112272005)
				local var_22_15 = arg_19_1:FormatText(var_22_14.content)

				arg_19_1.text_.text = var_22_15

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_16 = 48
				local var_22_17 = utf8.len(var_22_15)
				local var_22_18 = var_22_16 <= 0 and var_22_12 or var_22_12 * (var_22_17 / var_22_16)

				if var_22_18 > 0 and var_22_12 < var_22_18 then
					arg_19_1.talkMaxDuration = var_22_18

					if var_22_18 + var_22_11 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_18 + var_22_11
					end
				end

				arg_19_1.text_.text = var_22_15
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112272", "112272005", "story_v_out_112272.awb") ~= 0 then
					local var_22_19 = manager.audio:GetVoiceLength("story_v_out_112272", "112272005", "story_v_out_112272.awb") / 1000

					if var_22_19 + var_22_11 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_19 + var_22_11
					end

					if var_22_14.prefab_name ~= "" and arg_19_1.actors_[var_22_14.prefab_name] ~= nil then
						local var_22_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_14.prefab_name].transform, "story_v_out_112272", "112272005", "story_v_out_112272.awb")

						arg_19_1:RecordAudio("112272005", var_22_20)
						arg_19_1:RecordAudio("112272005", var_22_20)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_112272", "112272005", "story_v_out_112272.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_112272", "112272005", "story_v_out_112272.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_21 = math.max(var_22_12, arg_19_1.talkMaxDuration)

			if var_22_11 <= arg_19_1.time_ and arg_19_1.time_ < var_22_11 + var_22_21 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_11) / var_22_21

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_11 + var_22_21 and arg_19_1.time_ < var_22_11 + var_22_21 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play112272006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 112272006
		arg_23_1.duration_ = 4.17

		local var_23_0 = {
			ja = 4.166,
			ko = 3.133,
			zh = 2.233,
			en = 2.9
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
				arg_23_0:Play112272007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 0.35

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_2 = arg_23_1:FormatText(StoryNameCfg[202].name)

				arg_23_1.leftNameTxt_.text = var_26_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_3 = arg_23_1:GetWordFromCfg(112272006)
				local var_26_4 = arg_23_1:FormatText(var_26_3.content)

				arg_23_1.text_.text = var_26_4

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_5 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_112272", "112272006", "story_v_out_112272.awb") ~= 0 then
					local var_26_8 = manager.audio:GetVoiceLength("story_v_out_112272", "112272006", "story_v_out_112272.awb") / 1000

					if var_26_8 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_8 + var_26_0
					end

					if var_26_3.prefab_name ~= "" and arg_23_1.actors_[var_26_3.prefab_name] ~= nil then
						local var_26_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_3.prefab_name].transform, "story_v_out_112272", "112272006", "story_v_out_112272.awb")

						arg_23_1:RecordAudio("112272006", var_26_9)
						arg_23_1:RecordAudio("112272006", var_26_9)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_112272", "112272006", "story_v_out_112272.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_112272", "112272006", "story_v_out_112272.awb")
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
	Play112272007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 112272007
		arg_27_1.duration_ = 10.03

		local var_27_0 = {
			ja = 10.033,
			ko = 8.1,
			zh = 7.033,
			en = 7.366
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
				arg_27_0:Play112272008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1081_1"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos1081_1 = var_30_0.localPosition
				var_30_0.localScale = Vector3.New(1, 1, 1)
			end

			local var_30_2 = 0.001

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2
				local var_30_4 = Vector3.New(0, -2000, 0)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1081_1, var_30_4, var_30_3)
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_30_5 = "1084"

			if arg_27_1.actors_[var_30_5] == nil then
				local var_30_6 = Object.Instantiate(arg_27_1.imageGo_, arg_27_1.canvasGo_.transform)

				var_30_6.transform:SetSiblingIndex(1)

				var_30_6.name = var_30_5

				local var_30_7 = var_30_6:GetComponent(typeof(Image))

				var_30_7.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. "1084")

				var_30_7:SetNativeSize()

				var_30_6.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_27_1.actors_[var_30_5] = var_30_6
			end

			local var_30_8 = arg_27_1.actors_["1084"].transform
			local var_30_9 = 0

			if var_30_9 < arg_27_1.time_ and arg_27_1.time_ <= var_30_9 + arg_30_0 then
				arg_27_1.var_.moveOldPos1084 = var_30_8.localPosition
				var_30_8.localScale = Vector3.New(1, 1, 1)
			end

			local var_30_10 = 0.001

			if var_30_9 <= arg_27_1.time_ and arg_27_1.time_ < var_30_9 + var_30_10 then
				local var_30_11 = (arg_27_1.time_ - var_30_9) / var_30_10
				local var_30_12 = Vector3.New(0, -450, 0)

				var_30_8.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1084, var_30_12, var_30_11)
			end

			if arg_27_1.time_ >= var_30_9 + var_30_10 and arg_27_1.time_ < var_30_9 + var_30_10 + arg_30_0 then
				var_30_8.localPosition = Vector3.New(0, -450, 0)
			end

			local var_30_13 = arg_27_1.actors_["1084"]
			local var_30_14 = 0

			if var_30_14 < arg_27_1.time_ and arg_27_1.time_ <= var_30_14 + arg_30_0 and not isNil(var_30_13) then
				local var_30_15 = var_30_13:GetComponent("Image")

				if var_30_15 then
					arg_27_1.var_.highlightMatValue1084 = var_30_15
				end
			end

			local var_30_16 = 0.2

			if var_30_14 <= arg_27_1.time_ and arg_27_1.time_ < var_30_14 + var_30_16 and not isNil(var_30_13) then
				local var_30_17 = (arg_27_1.time_ - var_30_14) / var_30_16

				if arg_27_1.var_.highlightMatValue1084 then
					local var_30_18 = Mathf.Lerp(0.5, 1, var_30_17)
					local var_30_19 = arg_27_1.var_.highlightMatValue1084
					local var_30_20 = var_30_19.color

					var_30_20.r = var_30_18
					var_30_20.g = var_30_18
					var_30_20.b = var_30_18
					var_30_19.color = var_30_20
				end
			end

			if arg_27_1.time_ >= var_30_14 + var_30_16 and arg_27_1.time_ < var_30_14 + var_30_16 + arg_30_0 and not isNil(var_30_13) and arg_27_1.var_.highlightMatValue1084 then
				local var_30_21 = 1

				var_30_13.transform:SetSiblingIndex(1)

				local var_30_22 = arg_27_1.var_.highlightMatValue1084
				local var_30_23 = var_30_22.color

				var_30_23.r = var_30_21
				var_30_23.g = var_30_21
				var_30_23.b = var_30_21
				var_30_22.color = var_30_23
			end

			local var_30_24 = 0
			local var_30_25 = 0.8

			if var_30_24 < arg_27_1.time_ and arg_27_1.time_ <= var_30_24 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_26 = arg_27_1:FormatText(StoryNameCfg[6].name)

				arg_27_1.leftNameTxt_.text = var_30_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_27 = arg_27_1:GetWordFromCfg(112272007)
				local var_30_28 = arg_27_1:FormatText(var_30_27.content)

				arg_27_1.text_.text = var_30_28

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_29 = 32
				local var_30_30 = utf8.len(var_30_28)
				local var_30_31 = var_30_29 <= 0 and var_30_25 or var_30_25 * (var_30_30 / var_30_29)

				if var_30_31 > 0 and var_30_25 < var_30_31 then
					arg_27_1.talkMaxDuration = var_30_31

					if var_30_31 + var_30_24 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_31 + var_30_24
					end
				end

				arg_27_1.text_.text = var_30_28
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112272", "112272007", "story_v_out_112272.awb") ~= 0 then
					local var_30_32 = manager.audio:GetVoiceLength("story_v_out_112272", "112272007", "story_v_out_112272.awb") / 1000

					if var_30_32 + var_30_24 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_32 + var_30_24
					end

					if var_30_27.prefab_name ~= "" and arg_27_1.actors_[var_30_27.prefab_name] ~= nil then
						local var_30_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_27.prefab_name].transform, "story_v_out_112272", "112272007", "story_v_out_112272.awb")

						arg_27_1:RecordAudio("112272007", var_30_33)
						arg_27_1:RecordAudio("112272007", var_30_33)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_112272", "112272007", "story_v_out_112272.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_112272", "112272007", "story_v_out_112272.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_34 = math.max(var_30_25, arg_27_1.talkMaxDuration)

			if var_30_24 <= arg_27_1.time_ and arg_27_1.time_ < var_30_24 + var_30_34 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_24) / var_30_34

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_24 + var_30_34 and arg_27_1.time_ < var_30_24 + var_30_34 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play112272008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 112272008
		arg_31_1.duration_ = 6.77

		local var_31_0 = {
			ja = 5.733,
			ko = 5.5,
			zh = 6.766,
			en = 6.4
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
				arg_31_0:Play112272009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1084"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos1084 = var_34_0.localPosition
				var_34_0.localScale = Vector3.New(1, 1, 1)
			end

			local var_34_2 = 0.001

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2
				local var_34_4 = Vector3.New(0, -2000, 0)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1084, var_34_4, var_34_3)
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_34_5 = "1148"

			if arg_31_1.actors_[var_34_5] == nil then
				local var_34_6 = Object.Instantiate(arg_31_1.imageGo_, arg_31_1.canvasGo_.transform)

				var_34_6.transform:SetSiblingIndex(1)

				var_34_6.name = var_34_5

				local var_34_7 = var_34_6:GetComponent(typeof(Image))

				var_34_7.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. "1148")

				var_34_7:SetNativeSize()

				var_34_6.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_31_1.actors_[var_34_5] = var_34_6
			end

			local var_34_8 = arg_31_1.actors_["1148"].transform
			local var_34_9 = 0

			if var_34_9 < arg_31_1.time_ and arg_31_1.time_ <= var_34_9 + arg_34_0 then
				arg_31_1.var_.moveOldPos1148 = var_34_8.localPosition
				var_34_8.localScale = Vector3.New(1, 1, 1)
			end

			local var_34_10 = 0.001

			if var_34_9 <= arg_31_1.time_ and arg_31_1.time_ < var_34_9 + var_34_10 then
				local var_34_11 = (arg_31_1.time_ - var_34_9) / var_34_10
				local var_34_12 = Vector3.New(0, -550, 0)

				var_34_8.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1148, var_34_12, var_34_11)
			end

			if arg_31_1.time_ >= var_34_9 + var_34_10 and arg_31_1.time_ < var_34_9 + var_34_10 + arg_34_0 then
				var_34_8.localPosition = Vector3.New(0, -550, 0)
			end

			local var_34_13 = arg_31_1.actors_["1148"]
			local var_34_14 = 0

			if var_34_14 < arg_31_1.time_ and arg_31_1.time_ <= var_34_14 + arg_34_0 and not isNil(var_34_13) then
				local var_34_15 = var_34_13:GetComponent("Image")

				if var_34_15 then
					arg_31_1.var_.highlightMatValue1148 = var_34_15
				end
			end

			local var_34_16 = 0.2

			if var_34_14 <= arg_31_1.time_ and arg_31_1.time_ < var_34_14 + var_34_16 and not isNil(var_34_13) then
				local var_34_17 = (arg_31_1.time_ - var_34_14) / var_34_16

				if arg_31_1.var_.highlightMatValue1148 then
					local var_34_18 = Mathf.Lerp(0.5, 1, var_34_17)
					local var_34_19 = arg_31_1.var_.highlightMatValue1148
					local var_34_20 = var_34_19.color

					var_34_20.r = var_34_18
					var_34_20.g = var_34_18
					var_34_20.b = var_34_18
					var_34_19.color = var_34_20
				end
			end

			if arg_31_1.time_ >= var_34_14 + var_34_16 and arg_31_1.time_ < var_34_14 + var_34_16 + arg_34_0 and not isNil(var_34_13) and arg_31_1.var_.highlightMatValue1148 then
				local var_34_21 = 1

				var_34_13.transform:SetSiblingIndex(1)

				local var_34_22 = arg_31_1.var_.highlightMatValue1148
				local var_34_23 = var_34_22.color

				var_34_23.r = var_34_21
				var_34_23.g = var_34_21
				var_34_23.b = var_34_21
				var_34_22.color = var_34_23
			end

			local var_34_24 = 0
			local var_34_25 = 0.65

			if var_34_24 < arg_31_1.time_ and arg_31_1.time_ <= var_34_24 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_26 = arg_31_1:FormatText(StoryNameCfg[8].name)

				arg_31_1.leftNameTxt_.text = var_34_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_27 = arg_31_1:GetWordFromCfg(112272008)
				local var_34_28 = arg_31_1:FormatText(var_34_27.content)

				arg_31_1.text_.text = var_34_28

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_29 = 26
				local var_34_30 = utf8.len(var_34_28)
				local var_34_31 = var_34_29 <= 0 and var_34_25 or var_34_25 * (var_34_30 / var_34_29)

				if var_34_31 > 0 and var_34_25 < var_34_31 then
					arg_31_1.talkMaxDuration = var_34_31

					if var_34_31 + var_34_24 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_31 + var_34_24
					end
				end

				arg_31_1.text_.text = var_34_28
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112272", "112272008", "story_v_out_112272.awb") ~= 0 then
					local var_34_32 = manager.audio:GetVoiceLength("story_v_out_112272", "112272008", "story_v_out_112272.awb") / 1000

					if var_34_32 + var_34_24 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_32 + var_34_24
					end

					if var_34_27.prefab_name ~= "" and arg_31_1.actors_[var_34_27.prefab_name] ~= nil then
						local var_34_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_27.prefab_name].transform, "story_v_out_112272", "112272008", "story_v_out_112272.awb")

						arg_31_1:RecordAudio("112272008", var_34_33)
						arg_31_1:RecordAudio("112272008", var_34_33)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_112272", "112272008", "story_v_out_112272.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_112272", "112272008", "story_v_out_112272.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_34 = math.max(var_34_25, arg_31_1.talkMaxDuration)

			if var_34_24 <= arg_31_1.time_ and arg_31_1.time_ < var_34_24 + var_34_34 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_24) / var_34_34

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_24 + var_34_34 and arg_31_1.time_ < var_34_24 + var_34_34 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play112272009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 112272009
		arg_35_1.duration_ = 10.7

		local var_35_0 = {
			ja = 10.7,
			ko = 7.9,
			zh = 7.033,
			en = 9.666
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
				arg_35_0:Play112272010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 0.975

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_2 = arg_35_1:FormatText(StoryNameCfg[8].name)

				arg_35_1.leftNameTxt_.text = var_38_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_3 = arg_35_1:GetWordFromCfg(112272009)
				local var_38_4 = arg_35_1:FormatText(var_38_3.content)

				arg_35_1.text_.text = var_38_4

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_5 = 39
				local var_38_6 = utf8.len(var_38_4)
				local var_38_7 = var_38_5 <= 0 and var_38_1 or var_38_1 * (var_38_6 / var_38_5)

				if var_38_7 > 0 and var_38_1 < var_38_7 then
					arg_35_1.talkMaxDuration = var_38_7

					if var_38_7 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_7 + var_38_0
					end
				end

				arg_35_1.text_.text = var_38_4
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112272", "112272009", "story_v_out_112272.awb") ~= 0 then
					local var_38_8 = manager.audio:GetVoiceLength("story_v_out_112272", "112272009", "story_v_out_112272.awb") / 1000

					if var_38_8 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_8 + var_38_0
					end

					if var_38_3.prefab_name ~= "" and arg_35_1.actors_[var_38_3.prefab_name] ~= nil then
						local var_38_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_3.prefab_name].transform, "story_v_out_112272", "112272009", "story_v_out_112272.awb")

						arg_35_1:RecordAudio("112272009", var_38_9)
						arg_35_1:RecordAudio("112272009", var_38_9)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_112272", "112272009", "story_v_out_112272.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_112272", "112272009", "story_v_out_112272.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_10 = math.max(var_38_1, arg_35_1.talkMaxDuration)

			if var_38_0 <= arg_35_1.time_ and arg_35_1.time_ < var_38_0 + var_38_10 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_0) / var_38_10

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_0 + var_38_10 and arg_35_1.time_ < var_38_0 + var_38_10 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play112272010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 112272010
		arg_39_1.duration_ = 9.73

		local var_39_0 = {
			ja = 9.733,
			ko = 7,
			zh = 6.266,
			en = 8.6
		}
		local var_39_1 = manager.audio:GetLocalizationFlag()

		if var_39_0[var_39_1] ~= nil then
			arg_39_1.duration_ = var_39_0[var_39_1]
		end

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play112272011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1148"].transform
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1.var_.moveOldPos1148 = var_42_0.localPosition
				var_42_0.localScale = Vector3.New(1, 1, 1)
			end

			local var_42_2 = 0.001

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2
				local var_42_4 = Vector3.New(-600, -550, 0)

				var_42_0.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1148, var_42_4, var_42_3)
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 then
				var_42_0.localPosition = Vector3.New(-600, -550, 0)
			end

			local var_42_5 = "1027"

			if arg_39_1.actors_[var_42_5] == nil then
				local var_42_6 = Object.Instantiate(arg_39_1.imageGo_, arg_39_1.canvasGo_.transform)

				var_42_6.transform:SetSiblingIndex(1)

				var_42_6.name = var_42_5

				local var_42_7 = var_42_6:GetComponent(typeof(Image))

				var_42_7.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. "1027")

				var_42_7:SetNativeSize()

				var_42_6.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_39_1.actors_[var_42_5] = var_42_6
			end

			local var_42_8 = arg_39_1.actors_["1027"].transform
			local var_42_9 = 0

			if var_42_9 < arg_39_1.time_ and arg_39_1.time_ <= var_42_9 + arg_42_0 then
				arg_39_1.var_.moveOldPos1027 = var_42_8.localPosition
				var_42_8.localScale = Vector3.New(1, 1, 1)
			end

			local var_42_10 = 0.001

			if var_42_9 <= arg_39_1.time_ and arg_39_1.time_ < var_42_9 + var_42_10 then
				local var_42_11 = (arg_39_1.time_ - var_42_9) / var_42_10
				local var_42_12 = Vector3.New(500, -500, 0)

				var_42_8.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1027, var_42_12, var_42_11)
			end

			if arg_39_1.time_ >= var_42_9 + var_42_10 and arg_39_1.time_ < var_42_9 + var_42_10 + arg_42_0 then
				var_42_8.localPosition = Vector3.New(500, -500, 0)
			end

			local var_42_13 = arg_39_1.actors_["1027"]
			local var_42_14 = 0

			if var_42_14 < arg_39_1.time_ and arg_39_1.time_ <= var_42_14 + arg_42_0 and not isNil(var_42_13) then
				local var_42_15 = var_42_13:GetComponent("Image")

				if var_42_15 then
					arg_39_1.var_.highlightMatValue1027 = var_42_15
				end
			end

			local var_42_16 = 0.2

			if var_42_14 <= arg_39_1.time_ and arg_39_1.time_ < var_42_14 + var_42_16 and not isNil(var_42_13) then
				local var_42_17 = (arg_39_1.time_ - var_42_14) / var_42_16

				if arg_39_1.var_.highlightMatValue1027 then
					local var_42_18 = Mathf.Lerp(0.5, 1, var_42_17)
					local var_42_19 = arg_39_1.var_.highlightMatValue1027
					local var_42_20 = var_42_19.color

					var_42_20.r = var_42_18
					var_42_20.g = var_42_18
					var_42_20.b = var_42_18
					var_42_19.color = var_42_20
				end
			end

			if arg_39_1.time_ >= var_42_14 + var_42_16 and arg_39_1.time_ < var_42_14 + var_42_16 + arg_42_0 and not isNil(var_42_13) and arg_39_1.var_.highlightMatValue1027 then
				local var_42_21 = 1

				var_42_13.transform:SetSiblingIndex(1)

				local var_42_22 = arg_39_1.var_.highlightMatValue1027
				local var_42_23 = var_42_22.color

				var_42_23.r = var_42_21
				var_42_23.g = var_42_21
				var_42_23.b = var_42_21
				var_42_22.color = var_42_23
			end

			local var_42_24 = arg_39_1.actors_["1148"]
			local var_42_25 = 0

			if var_42_25 < arg_39_1.time_ and arg_39_1.time_ <= var_42_25 + arg_42_0 and not isNil(var_42_24) then
				local var_42_26 = var_42_24:GetComponent("Image")

				if var_42_26 then
					arg_39_1.var_.highlightMatValue1148 = var_42_26
				end
			end

			local var_42_27 = 0.2

			if var_42_25 <= arg_39_1.time_ and arg_39_1.time_ < var_42_25 + var_42_27 and not isNil(var_42_24) then
				local var_42_28 = (arg_39_1.time_ - var_42_25) / var_42_27

				if arg_39_1.var_.highlightMatValue1148 then
					local var_42_29 = Mathf.Lerp(1, 0.5, var_42_28)
					local var_42_30 = arg_39_1.var_.highlightMatValue1148
					local var_42_31 = var_42_30.color

					var_42_31.r = var_42_29
					var_42_31.g = var_42_29
					var_42_31.b = var_42_29
					var_42_30.color = var_42_31
				end
			end

			if arg_39_1.time_ >= var_42_25 + var_42_27 and arg_39_1.time_ < var_42_25 + var_42_27 + arg_42_0 and not isNil(var_42_24) and arg_39_1.var_.highlightMatValue1148 then
				local var_42_32 = 0.5
				local var_42_33 = arg_39_1.var_.highlightMatValue1148
				local var_42_34 = var_42_33.color

				var_42_34.r = var_42_32
				var_42_34.g = var_42_32
				var_42_34.b = var_42_32
				var_42_33.color = var_42_34
			end

			local var_42_35 = 0
			local var_42_36 = 0.8

			if var_42_35 < arg_39_1.time_ and arg_39_1.time_ <= var_42_35 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_37 = arg_39_1:FormatText(StoryNameCfg[56].name)

				arg_39_1.leftNameTxt_.text = var_42_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_38 = arg_39_1:GetWordFromCfg(112272010)
				local var_42_39 = arg_39_1:FormatText(var_42_38.content)

				arg_39_1.text_.text = var_42_39

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_40 = 32
				local var_42_41 = utf8.len(var_42_39)
				local var_42_42 = var_42_40 <= 0 and var_42_36 or var_42_36 * (var_42_41 / var_42_40)

				if var_42_42 > 0 and var_42_36 < var_42_42 then
					arg_39_1.talkMaxDuration = var_42_42

					if var_42_42 + var_42_35 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_42 + var_42_35
					end
				end

				arg_39_1.text_.text = var_42_39
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112272", "112272010", "story_v_out_112272.awb") ~= 0 then
					local var_42_43 = manager.audio:GetVoiceLength("story_v_out_112272", "112272010", "story_v_out_112272.awb") / 1000

					if var_42_43 + var_42_35 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_43 + var_42_35
					end

					if var_42_38.prefab_name ~= "" and arg_39_1.actors_[var_42_38.prefab_name] ~= nil then
						local var_42_44 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_38.prefab_name].transform, "story_v_out_112272", "112272010", "story_v_out_112272.awb")

						arg_39_1:RecordAudio("112272010", var_42_44)
						arg_39_1:RecordAudio("112272010", var_42_44)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_112272", "112272010", "story_v_out_112272.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_112272", "112272010", "story_v_out_112272.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_45 = math.max(var_42_36, arg_39_1.talkMaxDuration)

			if var_42_35 <= arg_39_1.time_ and arg_39_1.time_ < var_42_35 + var_42_45 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_35) / var_42_45

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_35 + var_42_45 and arg_39_1.time_ < var_42_35 + var_42_45 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play112272011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 112272011
		arg_43_1.duration_ = 8.67

		local var_43_0 = {
			ja = 8.666,
			ko = 6,
			zh = 7.4,
			en = 8.4
		}
		local var_43_1 = manager.audio:GetLocalizationFlag()

		if var_43_0[var_43_1] ~= nil then
			arg_43_1.duration_ = var_43_0[var_43_1]
		end

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play112272012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1027"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and not isNil(var_46_0) then
				local var_46_2 = var_46_0:GetComponent("Image")

				if var_46_2 then
					arg_43_1.var_.highlightMatValue1027 = var_46_2
				end
			end

			local var_46_3 = 0.2

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_3 and not isNil(var_46_0) then
				local var_46_4 = (arg_43_1.time_ - var_46_1) / var_46_3

				if arg_43_1.var_.highlightMatValue1027 then
					local var_46_5 = Mathf.Lerp(1, 0.5, var_46_4)
					local var_46_6 = arg_43_1.var_.highlightMatValue1027
					local var_46_7 = var_46_6.color

					var_46_7.r = var_46_5
					var_46_7.g = var_46_5
					var_46_7.b = var_46_5
					var_46_6.color = var_46_7
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_3 and arg_43_1.time_ < var_46_1 + var_46_3 + arg_46_0 and not isNil(var_46_0) and arg_43_1.var_.highlightMatValue1027 then
				local var_46_8 = 0.5
				local var_46_9 = arg_43_1.var_.highlightMatValue1027
				local var_46_10 = var_46_9.color

				var_46_10.r = var_46_8
				var_46_10.g = var_46_8
				var_46_10.b = var_46_8
				var_46_9.color = var_46_10
			end

			local var_46_11 = arg_43_1.actors_["1148"]
			local var_46_12 = 0

			if var_46_12 < arg_43_1.time_ and arg_43_1.time_ <= var_46_12 + arg_46_0 and not isNil(var_46_11) then
				local var_46_13 = var_46_11:GetComponent("Image")

				if var_46_13 then
					arg_43_1.var_.highlightMatValue1148 = var_46_13
				end
			end

			local var_46_14 = 0.2

			if var_46_12 <= arg_43_1.time_ and arg_43_1.time_ < var_46_12 + var_46_14 and not isNil(var_46_11) then
				local var_46_15 = (arg_43_1.time_ - var_46_12) / var_46_14

				if arg_43_1.var_.highlightMatValue1148 then
					local var_46_16 = Mathf.Lerp(0.5, 1, var_46_15)
					local var_46_17 = arg_43_1.var_.highlightMatValue1148
					local var_46_18 = var_46_17.color

					var_46_18.r = var_46_16
					var_46_18.g = var_46_16
					var_46_18.b = var_46_16
					var_46_17.color = var_46_18
				end
			end

			if arg_43_1.time_ >= var_46_12 + var_46_14 and arg_43_1.time_ < var_46_12 + var_46_14 + arg_46_0 and not isNil(var_46_11) and arg_43_1.var_.highlightMatValue1148 then
				local var_46_19 = 1

				var_46_11.transform:SetSiblingIndex(1)

				local var_46_20 = arg_43_1.var_.highlightMatValue1148
				local var_46_21 = var_46_20.color

				var_46_21.r = var_46_19
				var_46_21.g = var_46_19
				var_46_21.b = var_46_19
				var_46_20.color = var_46_21
			end

			local var_46_22 = 0
			local var_46_23 = 0.85

			if var_46_22 < arg_43_1.time_ and arg_43_1.time_ <= var_46_22 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_24 = arg_43_1:FormatText(StoryNameCfg[8].name)

				arg_43_1.leftNameTxt_.text = var_46_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_25 = arg_43_1:GetWordFromCfg(112272011)
				local var_46_26 = arg_43_1:FormatText(var_46_25.content)

				arg_43_1.text_.text = var_46_26

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_27 = 34
				local var_46_28 = utf8.len(var_46_26)
				local var_46_29 = var_46_27 <= 0 and var_46_23 or var_46_23 * (var_46_28 / var_46_27)

				if var_46_29 > 0 and var_46_23 < var_46_29 then
					arg_43_1.talkMaxDuration = var_46_29

					if var_46_29 + var_46_22 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_29 + var_46_22
					end
				end

				arg_43_1.text_.text = var_46_26
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112272", "112272011", "story_v_out_112272.awb") ~= 0 then
					local var_46_30 = manager.audio:GetVoiceLength("story_v_out_112272", "112272011", "story_v_out_112272.awb") / 1000

					if var_46_30 + var_46_22 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_30 + var_46_22
					end

					if var_46_25.prefab_name ~= "" and arg_43_1.actors_[var_46_25.prefab_name] ~= nil then
						local var_46_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_25.prefab_name].transform, "story_v_out_112272", "112272011", "story_v_out_112272.awb")

						arg_43_1:RecordAudio("112272011", var_46_31)
						arg_43_1:RecordAudio("112272011", var_46_31)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_112272", "112272011", "story_v_out_112272.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_112272", "112272011", "story_v_out_112272.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_32 = math.max(var_46_23, arg_43_1.talkMaxDuration)

			if var_46_22 <= arg_43_1.time_ and arg_43_1.time_ < var_46_22 + var_46_32 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_22) / var_46_32

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_22 + var_46_32 and arg_43_1.time_ < var_46_22 + var_46_32 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play112272012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 112272012
		arg_47_1.duration_ = 4.13

		local var_47_0 = {
			ja = 4.133,
			ko = 2.966,
			zh = 3.166,
			en = 2.666
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
				arg_47_0:Play112272013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0
			local var_50_1 = 0.3

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_2 = arg_47_1:FormatText(StoryNameCfg[8].name)

				arg_47_1.leftNameTxt_.text = var_50_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_3 = arg_47_1:GetWordFromCfg(112272012)
				local var_50_4 = arg_47_1:FormatText(var_50_3.content)

				arg_47_1.text_.text = var_50_4

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_5 = 12
				local var_50_6 = utf8.len(var_50_4)
				local var_50_7 = var_50_5 <= 0 and var_50_1 or var_50_1 * (var_50_6 / var_50_5)

				if var_50_7 > 0 and var_50_1 < var_50_7 then
					arg_47_1.talkMaxDuration = var_50_7

					if var_50_7 + var_50_0 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_7 + var_50_0
					end
				end

				arg_47_1.text_.text = var_50_4
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112272", "112272012", "story_v_out_112272.awb") ~= 0 then
					local var_50_8 = manager.audio:GetVoiceLength("story_v_out_112272", "112272012", "story_v_out_112272.awb") / 1000

					if var_50_8 + var_50_0 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_8 + var_50_0
					end

					if var_50_3.prefab_name ~= "" and arg_47_1.actors_[var_50_3.prefab_name] ~= nil then
						local var_50_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_3.prefab_name].transform, "story_v_out_112272", "112272012", "story_v_out_112272.awb")

						arg_47_1:RecordAudio("112272012", var_50_9)
						arg_47_1:RecordAudio("112272012", var_50_9)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_112272", "112272012", "story_v_out_112272.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_112272", "112272012", "story_v_out_112272.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_10 = math.max(var_50_1, arg_47_1.talkMaxDuration)

			if var_50_0 <= arg_47_1.time_ and arg_47_1.time_ < var_50_0 + var_50_10 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_0) / var_50_10

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_0 + var_50_10 and arg_47_1.time_ < var_50_0 + var_50_10 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play112272013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 112272013
		arg_51_1.duration_ = 4.23

		local var_51_0 = {
			ja = 4.233,
			ko = 2.733,
			zh = 3.833,
			en = 3.7
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
				arg_51_0:Play112272014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1027"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and not isNil(var_54_0) then
				local var_54_2 = var_54_0:GetComponent("Image")

				if var_54_2 then
					arg_51_1.var_.highlightMatValue1027 = var_54_2
				end
			end

			local var_54_3 = 0.2

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_3 and not isNil(var_54_0) then
				local var_54_4 = (arg_51_1.time_ - var_54_1) / var_54_3

				if arg_51_1.var_.highlightMatValue1027 then
					local var_54_5 = Mathf.Lerp(0.5, 1, var_54_4)
					local var_54_6 = arg_51_1.var_.highlightMatValue1027
					local var_54_7 = var_54_6.color

					var_54_7.r = var_54_5
					var_54_7.g = var_54_5
					var_54_7.b = var_54_5
					var_54_6.color = var_54_7
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_3 and arg_51_1.time_ < var_54_1 + var_54_3 + arg_54_0 and not isNil(var_54_0) and arg_51_1.var_.highlightMatValue1027 then
				local var_54_8 = 1

				var_54_0.transform:SetSiblingIndex(1)

				local var_54_9 = arg_51_1.var_.highlightMatValue1027
				local var_54_10 = var_54_9.color

				var_54_10.r = var_54_8
				var_54_10.g = var_54_8
				var_54_10.b = var_54_8
				var_54_9.color = var_54_10
			end

			local var_54_11 = arg_51_1.actors_["1148"]
			local var_54_12 = 0

			if var_54_12 < arg_51_1.time_ and arg_51_1.time_ <= var_54_12 + arg_54_0 and not isNil(var_54_11) then
				local var_54_13 = var_54_11:GetComponent("Image")

				if var_54_13 then
					arg_51_1.var_.highlightMatValue1148 = var_54_13
				end
			end

			local var_54_14 = 0.2

			if var_54_12 <= arg_51_1.time_ and arg_51_1.time_ < var_54_12 + var_54_14 and not isNil(var_54_11) then
				local var_54_15 = (arg_51_1.time_ - var_54_12) / var_54_14

				if arg_51_1.var_.highlightMatValue1148 then
					local var_54_16 = Mathf.Lerp(1, 0.5, var_54_15)
					local var_54_17 = arg_51_1.var_.highlightMatValue1148
					local var_54_18 = var_54_17.color

					var_54_18.r = var_54_16
					var_54_18.g = var_54_16
					var_54_18.b = var_54_16
					var_54_17.color = var_54_18
				end
			end

			if arg_51_1.time_ >= var_54_12 + var_54_14 and arg_51_1.time_ < var_54_12 + var_54_14 + arg_54_0 and not isNil(var_54_11) and arg_51_1.var_.highlightMatValue1148 then
				local var_54_19 = 0.5
				local var_54_20 = arg_51_1.var_.highlightMatValue1148
				local var_54_21 = var_54_20.color

				var_54_21.r = var_54_19
				var_54_21.g = var_54_19
				var_54_21.b = var_54_19
				var_54_20.color = var_54_21
			end

			local var_54_22 = 0
			local var_54_23 = 0.3

			if var_54_22 < arg_51_1.time_ and arg_51_1.time_ <= var_54_22 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_24 = arg_51_1:FormatText(StoryNameCfg[56].name)

				arg_51_1.leftNameTxt_.text = var_54_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_25 = arg_51_1:GetWordFromCfg(112272013)
				local var_54_26 = arg_51_1:FormatText(var_54_25.content)

				arg_51_1.text_.text = var_54_26

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_27 = 12
				local var_54_28 = utf8.len(var_54_26)
				local var_54_29 = var_54_27 <= 0 and var_54_23 or var_54_23 * (var_54_28 / var_54_27)

				if var_54_29 > 0 and var_54_23 < var_54_29 then
					arg_51_1.talkMaxDuration = var_54_29

					if var_54_29 + var_54_22 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_29 + var_54_22
					end
				end

				arg_51_1.text_.text = var_54_26
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112272", "112272013", "story_v_out_112272.awb") ~= 0 then
					local var_54_30 = manager.audio:GetVoiceLength("story_v_out_112272", "112272013", "story_v_out_112272.awb") / 1000

					if var_54_30 + var_54_22 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_30 + var_54_22
					end

					if var_54_25.prefab_name ~= "" and arg_51_1.actors_[var_54_25.prefab_name] ~= nil then
						local var_54_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_25.prefab_name].transform, "story_v_out_112272", "112272013", "story_v_out_112272.awb")

						arg_51_1:RecordAudio("112272013", var_54_31)
						arg_51_1:RecordAudio("112272013", var_54_31)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_112272", "112272013", "story_v_out_112272.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_112272", "112272013", "story_v_out_112272.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_32 = math.max(var_54_23, arg_51_1.talkMaxDuration)

			if var_54_22 <= arg_51_1.time_ and arg_51_1.time_ < var_54_22 + var_54_32 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_22) / var_54_32

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_22 + var_54_32 and arg_51_1.time_ < var_54_22 + var_54_32 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play112272014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 112272014
		arg_55_1.duration_ = 7.1

		local var_55_0 = {
			ja = 7.1,
			ko = 6.8,
			zh = 7.1,
			en = 6.166
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
				arg_55_0:Play112272015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 0.725

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_2 = arg_55_1:FormatText(StoryNameCfg[56].name)

				arg_55_1.leftNameTxt_.text = var_58_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_3 = arg_55_1:GetWordFromCfg(112272014)
				local var_58_4 = arg_55_1:FormatText(var_58_3.content)

				arg_55_1.text_.text = var_58_4

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_5 = 29
				local var_58_6 = utf8.len(var_58_4)
				local var_58_7 = var_58_5 <= 0 and var_58_1 or var_58_1 * (var_58_6 / var_58_5)

				if var_58_7 > 0 and var_58_1 < var_58_7 then
					arg_55_1.talkMaxDuration = var_58_7

					if var_58_7 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_7 + var_58_0
					end
				end

				arg_55_1.text_.text = var_58_4
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112272", "112272014", "story_v_out_112272.awb") ~= 0 then
					local var_58_8 = manager.audio:GetVoiceLength("story_v_out_112272", "112272014", "story_v_out_112272.awb") / 1000

					if var_58_8 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_8 + var_58_0
					end

					if var_58_3.prefab_name ~= "" and arg_55_1.actors_[var_58_3.prefab_name] ~= nil then
						local var_58_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_3.prefab_name].transform, "story_v_out_112272", "112272014", "story_v_out_112272.awb")

						arg_55_1:RecordAudio("112272014", var_58_9)
						arg_55_1:RecordAudio("112272014", var_58_9)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_112272", "112272014", "story_v_out_112272.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_112272", "112272014", "story_v_out_112272.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_10 = math.max(var_58_1, arg_55_1.talkMaxDuration)

			if var_58_0 <= arg_55_1.time_ and arg_55_1.time_ < var_58_0 + var_58_10 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_0) / var_58_10

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_0 + var_58_10 and arg_55_1.time_ < var_58_0 + var_58_10 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play112272015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 112272015
		arg_59_1.duration_ = 5.6

		local var_59_0 = {
			ja = 5.2,
			ko = 5.6,
			zh = 3.933,
			en = 5.366
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
				arg_59_0:Play112272016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1027"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and not isNil(var_62_0) then
				local var_62_2 = var_62_0:GetComponent("Image")

				if var_62_2 then
					arg_59_1.var_.highlightMatValue1027 = var_62_2
				end
			end

			local var_62_3 = 0.2

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_3 and not isNil(var_62_0) then
				local var_62_4 = (arg_59_1.time_ - var_62_1) / var_62_3

				if arg_59_1.var_.highlightMatValue1027 then
					local var_62_5 = Mathf.Lerp(1, 0.5, var_62_4)
					local var_62_6 = arg_59_1.var_.highlightMatValue1027
					local var_62_7 = var_62_6.color

					var_62_7.r = var_62_5
					var_62_7.g = var_62_5
					var_62_7.b = var_62_5
					var_62_6.color = var_62_7
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_3 and arg_59_1.time_ < var_62_1 + var_62_3 + arg_62_0 and not isNil(var_62_0) and arg_59_1.var_.highlightMatValue1027 then
				local var_62_8 = 0.5
				local var_62_9 = arg_59_1.var_.highlightMatValue1027
				local var_62_10 = var_62_9.color

				var_62_10.r = var_62_8
				var_62_10.g = var_62_8
				var_62_10.b = var_62_8
				var_62_9.color = var_62_10
			end

			local var_62_11 = arg_59_1.actors_["1148"]
			local var_62_12 = 0

			if var_62_12 < arg_59_1.time_ and arg_59_1.time_ <= var_62_12 + arg_62_0 and not isNil(var_62_11) then
				local var_62_13 = var_62_11:GetComponent("Image")

				if var_62_13 then
					arg_59_1.var_.highlightMatValue1148 = var_62_13
				end
			end

			local var_62_14 = 0.2

			if var_62_12 <= arg_59_1.time_ and arg_59_1.time_ < var_62_12 + var_62_14 and not isNil(var_62_11) then
				local var_62_15 = (arg_59_1.time_ - var_62_12) / var_62_14

				if arg_59_1.var_.highlightMatValue1148 then
					local var_62_16 = Mathf.Lerp(0.5, 1, var_62_15)
					local var_62_17 = arg_59_1.var_.highlightMatValue1148
					local var_62_18 = var_62_17.color

					var_62_18.r = var_62_16
					var_62_18.g = var_62_16
					var_62_18.b = var_62_16
					var_62_17.color = var_62_18
				end
			end

			if arg_59_1.time_ >= var_62_12 + var_62_14 and arg_59_1.time_ < var_62_12 + var_62_14 + arg_62_0 and not isNil(var_62_11) and arg_59_1.var_.highlightMatValue1148 then
				local var_62_19 = 1

				var_62_11.transform:SetSiblingIndex(1)

				local var_62_20 = arg_59_1.var_.highlightMatValue1148
				local var_62_21 = var_62_20.color

				var_62_21.r = var_62_19
				var_62_21.g = var_62_19
				var_62_21.b = var_62_19
				var_62_20.color = var_62_21
			end

			local var_62_22 = 0
			local var_62_23 = 0.425

			if var_62_22 < arg_59_1.time_ and arg_59_1.time_ <= var_62_22 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_24 = arg_59_1:FormatText(StoryNameCfg[8].name)

				arg_59_1.leftNameTxt_.text = var_62_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_25 = arg_59_1:GetWordFromCfg(112272015)
				local var_62_26 = arg_59_1:FormatText(var_62_25.content)

				arg_59_1.text_.text = var_62_26

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_27 = 17
				local var_62_28 = utf8.len(var_62_26)
				local var_62_29 = var_62_27 <= 0 and var_62_23 or var_62_23 * (var_62_28 / var_62_27)

				if var_62_29 > 0 and var_62_23 < var_62_29 then
					arg_59_1.talkMaxDuration = var_62_29

					if var_62_29 + var_62_22 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_29 + var_62_22
					end
				end

				arg_59_1.text_.text = var_62_26
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112272", "112272015", "story_v_out_112272.awb") ~= 0 then
					local var_62_30 = manager.audio:GetVoiceLength("story_v_out_112272", "112272015", "story_v_out_112272.awb") / 1000

					if var_62_30 + var_62_22 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_30 + var_62_22
					end

					if var_62_25.prefab_name ~= "" and arg_59_1.actors_[var_62_25.prefab_name] ~= nil then
						local var_62_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_25.prefab_name].transform, "story_v_out_112272", "112272015", "story_v_out_112272.awb")

						arg_59_1:RecordAudio("112272015", var_62_31)
						arg_59_1:RecordAudio("112272015", var_62_31)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_112272", "112272015", "story_v_out_112272.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_112272", "112272015", "story_v_out_112272.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_32 = math.max(var_62_23, arg_59_1.talkMaxDuration)

			if var_62_22 <= arg_59_1.time_ and arg_59_1.time_ < var_62_22 + var_62_32 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_22) / var_62_32

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_22 + var_62_32 and arg_59_1.time_ < var_62_22 + var_62_32 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play112272016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 112272016
		arg_63_1.duration_ = 5

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play112272017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1148"].transform
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				arg_63_1.var_.moveOldPos1148 = var_66_0.localPosition
				var_66_0.localScale = Vector3.New(1, 1, 1)
			end

			local var_66_2 = 0.001

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2
				local var_66_4 = Vector3.New(0, -2000, 0)

				var_66_0.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1148, var_66_4, var_66_3)
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 then
				var_66_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_66_5 = arg_63_1.actors_["1027"].transform
			local var_66_6 = 0

			if var_66_6 < arg_63_1.time_ and arg_63_1.time_ <= var_66_6 + arg_66_0 then
				arg_63_1.var_.moveOldPos1027 = var_66_5.localPosition
				var_66_5.localScale = Vector3.New(1, 1, 1)
			end

			local var_66_7 = 0.001

			if var_66_6 <= arg_63_1.time_ and arg_63_1.time_ < var_66_6 + var_66_7 then
				local var_66_8 = (arg_63_1.time_ - var_66_6) / var_66_7
				local var_66_9 = Vector3.New(0, -2000, 0)

				var_66_5.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1027, var_66_9, var_66_8)
			end

			if arg_63_1.time_ >= var_66_6 + var_66_7 and arg_63_1.time_ < var_66_6 + var_66_7 + arg_66_0 then
				var_66_5.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_66_10 = 0
			local var_66_11 = 1.175

			if var_66_10 < arg_63_1.time_ and arg_63_1.time_ <= var_66_10 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, false)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_12 = arg_63_1:GetWordFromCfg(112272016)
				local var_66_13 = arg_63_1:FormatText(var_66_12.content)

				arg_63_1.text_.text = var_66_13

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_14 = 47
				local var_66_15 = utf8.len(var_66_13)
				local var_66_16 = var_66_14 <= 0 and var_66_11 or var_66_11 * (var_66_15 / var_66_14)

				if var_66_16 > 0 and var_66_11 < var_66_16 then
					arg_63_1.talkMaxDuration = var_66_16

					if var_66_16 + var_66_10 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_16 + var_66_10
					end
				end

				arg_63_1.text_.text = var_66_13
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)
				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_17 = math.max(var_66_11, arg_63_1.talkMaxDuration)

			if var_66_10 <= arg_63_1.time_ and arg_63_1.time_ < var_66_10 + var_66_17 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_10) / var_66_17

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_10 + var_66_17 and arg_63_1.time_ < var_66_10 + var_66_17 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play112272017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 112272017
		arg_67_1.duration_ = 4.5

		local var_67_0 = {
			ja = 4.5,
			ko = 3.5,
			zh = 3,
			en = 3.833
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
				arg_67_0:Play112272018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = "1039"

			if arg_67_1.actors_[var_70_0] == nil then
				local var_70_1 = Object.Instantiate(arg_67_1.imageGo_, arg_67_1.canvasGo_.transform)

				var_70_1.transform:SetSiblingIndex(1)

				var_70_1.name = var_70_0

				local var_70_2 = var_70_1:GetComponent(typeof(Image))

				var_70_2.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. "1039")

				var_70_2:SetNativeSize()

				var_70_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_67_1.actors_[var_70_0] = var_70_1
			end

			local var_70_3 = arg_67_1.actors_["1039"].transform
			local var_70_4 = 0

			if var_70_4 < arg_67_1.time_ and arg_67_1.time_ <= var_70_4 + arg_70_0 then
				arg_67_1.var_.moveOldPos1039 = var_70_3.localPosition
				var_70_3.localScale = Vector3.New(1, 1, 1)
			end

			local var_70_5 = 0.001

			if var_70_4 <= arg_67_1.time_ and arg_67_1.time_ < var_70_4 + var_70_5 then
				local var_70_6 = (arg_67_1.time_ - var_70_4) / var_70_5
				local var_70_7 = Vector3.New(0, -450, 0)

				var_70_3.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1039, var_70_7, var_70_6)
			end

			if arg_67_1.time_ >= var_70_4 + var_70_5 and arg_67_1.time_ < var_70_4 + var_70_5 + arg_70_0 then
				var_70_3.localPosition = Vector3.New(0, -450, 0)
			end

			local var_70_8 = arg_67_1.actors_["1039"]
			local var_70_9 = 0

			if var_70_9 < arg_67_1.time_ and arg_67_1.time_ <= var_70_9 + arg_70_0 and not isNil(var_70_8) then
				local var_70_10 = var_70_8:GetComponent("Image")

				if var_70_10 then
					arg_67_1.var_.highlightMatValue1039 = var_70_10
				end
			end

			local var_70_11 = 0.2

			if var_70_9 <= arg_67_1.time_ and arg_67_1.time_ < var_70_9 + var_70_11 and not isNil(var_70_8) then
				local var_70_12 = (arg_67_1.time_ - var_70_9) / var_70_11

				if arg_67_1.var_.highlightMatValue1039 then
					local var_70_13 = Mathf.Lerp(0.5, 1, var_70_12)
					local var_70_14 = arg_67_1.var_.highlightMatValue1039
					local var_70_15 = var_70_14.color

					var_70_15.r = var_70_13
					var_70_15.g = var_70_13
					var_70_15.b = var_70_13
					var_70_14.color = var_70_15
				end
			end

			if arg_67_1.time_ >= var_70_9 + var_70_11 and arg_67_1.time_ < var_70_9 + var_70_11 + arg_70_0 and not isNil(var_70_8) and arg_67_1.var_.highlightMatValue1039 then
				local var_70_16 = 1

				var_70_8.transform:SetSiblingIndex(1)

				local var_70_17 = arg_67_1.var_.highlightMatValue1039
				local var_70_18 = var_70_17.color

				var_70_18.r = var_70_16
				var_70_18.g = var_70_16
				var_70_18.b = var_70_16
				var_70_17.color = var_70_18
			end

			local var_70_19 = 0
			local var_70_20 = 0.3

			if var_70_19 < arg_67_1.time_ and arg_67_1.time_ <= var_70_19 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_21 = arg_67_1:FormatText(StoryNameCfg[9].name)

				arg_67_1.leftNameTxt_.text = var_70_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_22 = arg_67_1:GetWordFromCfg(112272017)
				local var_70_23 = arg_67_1:FormatText(var_70_22.content)

				arg_67_1.text_.text = var_70_23

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_24 = 12
				local var_70_25 = utf8.len(var_70_23)
				local var_70_26 = var_70_24 <= 0 and var_70_20 or var_70_20 * (var_70_25 / var_70_24)

				if var_70_26 > 0 and var_70_20 < var_70_26 then
					arg_67_1.talkMaxDuration = var_70_26

					if var_70_26 + var_70_19 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_26 + var_70_19
					end
				end

				arg_67_1.text_.text = var_70_23
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112272", "112272017", "story_v_out_112272.awb") ~= 0 then
					local var_70_27 = manager.audio:GetVoiceLength("story_v_out_112272", "112272017", "story_v_out_112272.awb") / 1000

					if var_70_27 + var_70_19 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_27 + var_70_19
					end

					if var_70_22.prefab_name ~= "" and arg_67_1.actors_[var_70_22.prefab_name] ~= nil then
						local var_70_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_22.prefab_name].transform, "story_v_out_112272", "112272017", "story_v_out_112272.awb")

						arg_67_1:RecordAudio("112272017", var_70_28)
						arg_67_1:RecordAudio("112272017", var_70_28)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_112272", "112272017", "story_v_out_112272.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_112272", "112272017", "story_v_out_112272.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_29 = math.max(var_70_20, arg_67_1.talkMaxDuration)

			if var_70_19 <= arg_67_1.time_ and arg_67_1.time_ < var_70_19 + var_70_29 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_19) / var_70_29

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_19 + var_70_29 and arg_67_1.time_ < var_70_19 + var_70_29 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play112272018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 112272018
		arg_71_1.duration_ = 5

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play112272019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1039"]
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 and not isNil(var_74_0) then
				local var_74_2 = var_74_0:GetComponent("Image")

				if var_74_2 then
					arg_71_1.var_.highlightMatValue1039 = var_74_2
				end
			end

			local var_74_3 = 0.2

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_3 and not isNil(var_74_0) then
				local var_74_4 = (arg_71_1.time_ - var_74_1) / var_74_3

				if arg_71_1.var_.highlightMatValue1039 then
					local var_74_5 = Mathf.Lerp(1, 0.5, var_74_4)
					local var_74_6 = arg_71_1.var_.highlightMatValue1039
					local var_74_7 = var_74_6.color

					var_74_7.r = var_74_5
					var_74_7.g = var_74_5
					var_74_7.b = var_74_5
					var_74_6.color = var_74_7
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_3 and arg_71_1.time_ < var_74_1 + var_74_3 + arg_74_0 and not isNil(var_74_0) and arg_71_1.var_.highlightMatValue1039 then
				local var_74_8 = 0.5
				local var_74_9 = arg_71_1.var_.highlightMatValue1039
				local var_74_10 = var_74_9.color

				var_74_10.r = var_74_8
				var_74_10.g = var_74_8
				var_74_10.b = var_74_8
				var_74_9.color = var_74_10
			end

			local var_74_11 = 0
			local var_74_12 = 0.625

			if var_74_11 < arg_71_1.time_ and arg_71_1.time_ <= var_74_11 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_13 = arg_71_1:FormatText(StoryNameCfg[7].name)

				arg_71_1.leftNameTxt_.text = var_74_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_14 = arg_71_1:GetWordFromCfg(112272018)
				local var_74_15 = arg_71_1:FormatText(var_74_14.content)

				arg_71_1.text_.text = var_74_15

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_16 = 25
				local var_74_17 = utf8.len(var_74_15)
				local var_74_18 = var_74_16 <= 0 and var_74_12 or var_74_12 * (var_74_17 / var_74_16)

				if var_74_18 > 0 and var_74_12 < var_74_18 then
					arg_71_1.talkMaxDuration = var_74_18

					if var_74_18 + var_74_11 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_18 + var_74_11
					end
				end

				arg_71_1.text_.text = var_74_15
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)
				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_19 = math.max(var_74_12, arg_71_1.talkMaxDuration)

			if var_74_11 <= arg_71_1.time_ and arg_71_1.time_ < var_74_11 + var_74_19 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_11) / var_74_19

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_11 + var_74_19 and arg_71_1.time_ < var_74_11 + var_74_19 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play112272019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 112272019
		arg_75_1.duration_ = 5

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play112272020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = 0
			local var_78_1 = 0.875

			if var_78_0 < arg_75_1.time_ and arg_75_1.time_ <= var_78_0 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_2 = arg_75_1:FormatText(StoryNameCfg[7].name)

				arg_75_1.leftNameTxt_.text = var_78_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_3 = arg_75_1:GetWordFromCfg(112272019)
				local var_78_4 = arg_75_1:FormatText(var_78_3.content)

				arg_75_1.text_.text = var_78_4

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_5 = 35
				local var_78_6 = utf8.len(var_78_4)
				local var_78_7 = var_78_5 <= 0 and var_78_1 or var_78_1 * (var_78_6 / var_78_5)

				if var_78_7 > 0 and var_78_1 < var_78_7 then
					arg_75_1.talkMaxDuration = var_78_7

					if var_78_7 + var_78_0 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_7 + var_78_0
					end
				end

				arg_75_1.text_.text = var_78_4
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)
				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_8 = math.max(var_78_1, arg_75_1.talkMaxDuration)

			if var_78_0 <= arg_75_1.time_ and arg_75_1.time_ < var_78_0 + var_78_8 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_0) / var_78_8

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_0 + var_78_8 and arg_75_1.time_ < var_78_0 + var_78_8 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play112272020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 112272020
		arg_79_1.duration_ = 5

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play112272021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1039"].transform
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1.var_.moveOldPos1039 = var_82_0.localPosition
				var_82_0.localScale = Vector3.New(1, 1, 1)
			end

			local var_82_2 = 0.001

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2
				local var_82_4 = Vector3.New(0, -2000, 0)

				var_82_0.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1039, var_82_4, var_82_3)
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 then
				var_82_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_82_5 = 0
			local var_82_6 = 0.925

			if var_82_5 < arg_79_1.time_ and arg_79_1.time_ <= var_82_5 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, false)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_7 = arg_79_1:GetWordFromCfg(112272020)
				local var_82_8 = arg_79_1:FormatText(var_82_7.content)

				arg_79_1.text_.text = var_82_8

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_9 = 37
				local var_82_10 = utf8.len(var_82_8)
				local var_82_11 = var_82_9 <= 0 and var_82_6 or var_82_6 * (var_82_10 / var_82_9)

				if var_82_11 > 0 and var_82_6 < var_82_11 then
					arg_79_1.talkMaxDuration = var_82_11

					if var_82_11 + var_82_5 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_11 + var_82_5
					end
				end

				arg_79_1.text_.text = var_82_8
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)
				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_12 = math.max(var_82_6, arg_79_1.talkMaxDuration)

			if var_82_5 <= arg_79_1.time_ and arg_79_1.time_ < var_82_5 + var_82_12 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_5) / var_82_12

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_5 + var_82_12 and arg_79_1.time_ < var_82_5 + var_82_12 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play112272021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 112272021
		arg_83_1.duration_ = 5

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play112272022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0
			local var_86_1 = 0.125

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_2 = arg_83_1:FormatText(StoryNameCfg[7].name)

				arg_83_1.leftNameTxt_.text = var_86_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_3 = arg_83_1:GetWordFromCfg(112272021)
				local var_86_4 = arg_83_1:FormatText(var_86_3.content)

				arg_83_1.text_.text = var_86_4

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_5 = 5
				local var_86_6 = utf8.len(var_86_4)
				local var_86_7 = var_86_5 <= 0 and var_86_1 or var_86_1 * (var_86_6 / var_86_5)

				if var_86_7 > 0 and var_86_1 < var_86_7 then
					arg_83_1.talkMaxDuration = var_86_7

					if var_86_7 + var_86_0 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_7 + var_86_0
					end
				end

				arg_83_1.text_.text = var_86_4
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)
				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_8 = math.max(var_86_1, arg_83_1.talkMaxDuration)

			if var_86_0 <= arg_83_1.time_ and arg_83_1.time_ < var_86_0 + var_86_8 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_0) / var_86_8

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_0 + var_86_8 and arg_83_1.time_ < var_86_0 + var_86_8 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play112272022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 112272022
		arg_87_1.duration_ = 3.77

		local var_87_0 = {
			ja = 3.766,
			ko = 2.966,
			zh = 3.433,
			en = 2.333
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
				arg_87_0:Play112272023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1081_1"].transform
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1.var_.moveOldPos1081_1 = var_90_0.localPosition
				var_90_0.localScale = Vector3.New(1, 1, 1)
			end

			local var_90_2 = 0.001

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2
				local var_90_4 = Vector3.New(-500, -300, 0)

				var_90_0.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1081_1, var_90_4, var_90_3)
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 then
				var_90_0.localPosition = Vector3.New(-500, -300, 0)
			end

			local var_90_5 = arg_87_1.actors_["1081"]
			local var_90_6 = 0

			if var_90_6 < arg_87_1.time_ and arg_87_1.time_ <= var_90_6 + arg_90_0 and not isNil(var_90_5) then
				local var_90_7 = var_90_5:GetComponent("Image")

				if var_90_7 then
					arg_87_1.var_.highlightMatValue1081 = var_90_7
				end
			end

			local var_90_8 = 0.2

			if var_90_6 <= arg_87_1.time_ and arg_87_1.time_ < var_90_6 + var_90_8 and not isNil(var_90_5) then
				local var_90_9 = (arg_87_1.time_ - var_90_6) / var_90_8

				if arg_87_1.var_.highlightMatValue1081 then
					local var_90_10 = Mathf.Lerp(0.5, 1, var_90_9)
					local var_90_11 = arg_87_1.var_.highlightMatValue1081
					local var_90_12 = var_90_11.color

					var_90_12.r = var_90_10
					var_90_12.g = var_90_10
					var_90_12.b = var_90_10
					var_90_11.color = var_90_12
				end
			end

			if arg_87_1.time_ >= var_90_6 + var_90_8 and arg_87_1.time_ < var_90_6 + var_90_8 + arg_90_0 and not isNil(var_90_5) and arg_87_1.var_.highlightMatValue1081 then
				local var_90_13 = 1

				var_90_5.transform:SetSiblingIndex(1)

				local var_90_14 = arg_87_1.var_.highlightMatValue1081
				local var_90_15 = var_90_14.color

				var_90_15.r = var_90_13
				var_90_15.g = var_90_13
				var_90_15.b = var_90_13
				var_90_14.color = var_90_15
			end

			local var_90_16 = 0
			local var_90_17 = 0.375

			if var_90_16 < arg_87_1.time_ and arg_87_1.time_ <= var_90_16 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_18 = arg_87_1:FormatText(StoryNameCfg[202].name)

				arg_87_1.leftNameTxt_.text = var_90_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_19 = arg_87_1:GetWordFromCfg(112272022)
				local var_90_20 = arg_87_1:FormatText(var_90_19.content)

				arg_87_1.text_.text = var_90_20

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_21 = 15
				local var_90_22 = utf8.len(var_90_20)
				local var_90_23 = var_90_21 <= 0 and var_90_17 or var_90_17 * (var_90_22 / var_90_21)

				if var_90_23 > 0 and var_90_17 < var_90_23 then
					arg_87_1.talkMaxDuration = var_90_23

					if var_90_23 + var_90_16 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_23 + var_90_16
					end
				end

				arg_87_1.text_.text = var_90_20
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112272", "112272022", "story_v_out_112272.awb") ~= 0 then
					local var_90_24 = manager.audio:GetVoiceLength("story_v_out_112272", "112272022", "story_v_out_112272.awb") / 1000

					if var_90_24 + var_90_16 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_24 + var_90_16
					end

					if var_90_19.prefab_name ~= "" and arg_87_1.actors_[var_90_19.prefab_name] ~= nil then
						local var_90_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_19.prefab_name].transform, "story_v_out_112272", "112272022", "story_v_out_112272.awb")

						arg_87_1:RecordAudio("112272022", var_90_25)
						arg_87_1:RecordAudio("112272022", var_90_25)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_112272", "112272022", "story_v_out_112272.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_112272", "112272022", "story_v_out_112272.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_26 = math.max(var_90_17, arg_87_1.talkMaxDuration)

			if var_90_16 <= arg_87_1.time_ and arg_87_1.time_ < var_90_16 + var_90_26 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_16) / var_90_26

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_16 + var_90_26 and arg_87_1.time_ < var_90_16 + var_90_26 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play112272023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 112272023
		arg_91_1.duration_ = 5

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play112272024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1081_1"].transform
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				arg_91_1.var_.moveOldPos1081_1 = var_94_0.localPosition
				var_94_0.localScale = Vector3.New(1, 1, 1)
			end

			local var_94_2 = 0.001

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2
				local var_94_4 = Vector3.New(0, -2000, 0)

				var_94_0.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1081_1, var_94_4, var_94_3)
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 then
				var_94_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_94_5 = 0
			local var_94_6 = 1.05

			if var_94_5 < arg_91_1.time_ and arg_91_1.time_ <= var_94_5 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, false)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_7 = arg_91_1:GetWordFromCfg(112272023)
				local var_94_8 = arg_91_1:FormatText(var_94_7.content)

				arg_91_1.text_.text = var_94_8

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_9 = 42
				local var_94_10 = utf8.len(var_94_8)
				local var_94_11 = var_94_9 <= 0 and var_94_6 or var_94_6 * (var_94_10 / var_94_9)

				if var_94_11 > 0 and var_94_6 < var_94_11 then
					arg_91_1.talkMaxDuration = var_94_11

					if var_94_11 + var_94_5 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_11 + var_94_5
					end
				end

				arg_91_1.text_.text = var_94_8
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)
				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_12 = math.max(var_94_6, arg_91_1.talkMaxDuration)

			if var_94_5 <= arg_91_1.time_ and arg_91_1.time_ < var_94_5 + var_94_12 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_5) / var_94_12

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_5 + var_94_12 and arg_91_1.time_ < var_94_5 + var_94_12 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play112272024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 112272024
		arg_95_1.duration_ = 5

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play112272025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = "SA0202"

			if arg_95_1.actors_[var_98_0] == nil then
				local var_98_1 = Object.Instantiate(arg_95_1.imageGo_, arg_95_1.canvasGo_.transform)

				var_98_1.transform:SetSiblingIndex(1)

				var_98_1.name = var_98_0

				local var_98_2 = var_98_1:GetComponent(typeof(Image))

				var_98_2.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. "SA0202")

				var_98_2:SetNativeSize()

				var_98_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_95_1.actors_[var_98_0] = var_98_1
			end

			local var_98_3 = arg_95_1.actors_.SA0202.transform
			local var_98_4 = 0

			if var_98_4 < arg_95_1.time_ and arg_95_1.time_ <= var_98_4 + arg_98_0 then
				arg_95_1.var_.moveOldPosSA0202 = var_98_3.localPosition
				var_98_3.localScale = Vector3.New(1, 1, 1)
			end

			local var_98_5 = 0.001

			if var_98_4 <= arg_95_1.time_ and arg_95_1.time_ < var_98_4 + var_98_5 then
				local var_98_6 = (arg_95_1.time_ - var_98_4) / var_98_5
				local var_98_7 = Vector3.New(0, 0, -650)

				var_98_3.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPosSA0202, var_98_7, var_98_6)
			end

			if arg_95_1.time_ >= var_98_4 + var_98_5 and arg_95_1.time_ < var_98_4 + var_98_5 + arg_98_0 then
				var_98_3.localPosition = Vector3.New(0, 0, -650)
			end

			local var_98_8 = 0
			local var_98_9 = 1.35

			if var_98_8 < arg_95_1.time_ and arg_95_1.time_ <= var_98_8 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, false)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_10 = arg_95_1:GetWordFromCfg(112272024)
				local var_98_11 = arg_95_1:FormatText(var_98_10.content)

				arg_95_1.text_.text = var_98_11

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_12 = 54
				local var_98_13 = utf8.len(var_98_11)
				local var_98_14 = var_98_12 <= 0 and var_98_9 or var_98_9 * (var_98_13 / var_98_12)

				if var_98_14 > 0 and var_98_9 < var_98_14 then
					arg_95_1.talkMaxDuration = var_98_14

					if var_98_14 + var_98_8 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_14 + var_98_8
					end
				end

				arg_95_1.text_.text = var_98_11
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)
				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_15 = math.max(var_98_9, arg_95_1.talkMaxDuration)

			if var_98_8 <= arg_95_1.time_ and arg_95_1.time_ < var_98_8 + var_98_15 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_8) / var_98_15

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_8 + var_98_15 and arg_95_1.time_ < var_98_8 + var_98_15 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play112272025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 112272025
		arg_99_1.duration_ = 5

		SetActive(arg_99_1.tipsGo_, false)

		function arg_99_1.onSingleLineFinish_()
			arg_99_1.onSingleLineUpdate_ = nil
			arg_99_1.onSingleLineFinish_ = nil
			arg_99_1.state_ = "waiting"
		end

		function arg_99_1.playNext_(arg_101_0)
			if arg_101_0 == 1 then
				arg_99_0:Play112272026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = 0
			local var_102_1 = 1.25

			if var_102_0 < arg_99_1.time_ and arg_99_1.time_ <= var_102_0 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, false)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_2 = arg_99_1:GetWordFromCfg(112272025)
				local var_102_3 = arg_99_1:FormatText(var_102_2.content)

				arg_99_1.text_.text = var_102_3

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_4 = 50
				local var_102_5 = utf8.len(var_102_3)
				local var_102_6 = var_102_4 <= 0 and var_102_1 or var_102_1 * (var_102_5 / var_102_4)

				if var_102_6 > 0 and var_102_1 < var_102_6 then
					arg_99_1.talkMaxDuration = var_102_6

					if var_102_6 + var_102_0 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_6 + var_102_0
					end
				end

				arg_99_1.text_.text = var_102_3
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)
				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_7 = math.max(var_102_1, arg_99_1.talkMaxDuration)

			if var_102_0 <= arg_99_1.time_ and arg_99_1.time_ < var_102_0 + var_102_7 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_0) / var_102_7

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_0 + var_102_7 and arg_99_1.time_ < var_102_0 + var_102_7 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play112272026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 112272026
		arg_103_1.duration_ = 3.57

		local var_103_0 = {
			ja = 3.566,
			ko = 3.433,
			zh = 2.8,
			en = 2.5
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
				arg_103_0:Play112272027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = 0
			local var_106_1 = 0.2

			if var_106_0 < arg_103_1.time_ and arg_103_1.time_ <= var_106_0 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_2 = arg_103_1:FormatText(StoryNameCfg[8].name)

				arg_103_1.leftNameTxt_.text = var_106_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, true)
				arg_103_1.iconController_:SetSelectedState("hero")

				arg_103_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1148")

				arg_103_1.callingController_:SetSelectedState("normal")

				arg_103_1.keyicon_.color = Color.New(1, 1, 1)
				arg_103_1.icon_.color = Color.New(1, 1, 1)

				local var_106_3 = arg_103_1:GetWordFromCfg(112272026)
				local var_106_4 = arg_103_1:FormatText(var_106_3.content)

				arg_103_1.text_.text = var_106_4

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_5 = 8
				local var_106_6 = utf8.len(var_106_4)
				local var_106_7 = var_106_5 <= 0 and var_106_1 or var_106_1 * (var_106_6 / var_106_5)

				if var_106_7 > 0 and var_106_1 < var_106_7 then
					arg_103_1.talkMaxDuration = var_106_7

					if var_106_7 + var_106_0 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_7 + var_106_0
					end
				end

				arg_103_1.text_.text = var_106_4
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112272", "112272026", "story_v_out_112272.awb") ~= 0 then
					local var_106_8 = manager.audio:GetVoiceLength("story_v_out_112272", "112272026", "story_v_out_112272.awb") / 1000

					if var_106_8 + var_106_0 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_8 + var_106_0
					end

					if var_106_3.prefab_name ~= "" and arg_103_1.actors_[var_106_3.prefab_name] ~= nil then
						local var_106_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_3.prefab_name].transform, "story_v_out_112272", "112272026", "story_v_out_112272.awb")

						arg_103_1:RecordAudio("112272026", var_106_9)
						arg_103_1:RecordAudio("112272026", var_106_9)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_112272", "112272026", "story_v_out_112272.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_112272", "112272026", "story_v_out_112272.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_10 = math.max(var_106_1, arg_103_1.talkMaxDuration)

			if var_106_0 <= arg_103_1.time_ and arg_103_1.time_ < var_106_0 + var_106_10 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_0) / var_106_10

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_0 + var_106_10 and arg_103_1.time_ < var_106_0 + var_106_10 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play112272027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 112272027
		arg_107_1.duration_ = 6.73

		local var_107_0 = {
			ja = 5.366,
			ko = 4.866,
			zh = 5,
			en = 6.733
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
				arg_107_0:Play112272028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = 0
			local var_110_1 = 0.6

			if var_110_0 < arg_107_1.time_ and arg_107_1.time_ <= var_110_0 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_2 = arg_107_1:FormatText(StoryNameCfg[6].name)

				arg_107_1.leftNameTxt_.text = var_110_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, true)
				arg_107_1.iconController_:SetSelectedState("hero")

				arg_107_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1084")

				arg_107_1.callingController_:SetSelectedState("normal")

				arg_107_1.keyicon_.color = Color.New(1, 1, 1)
				arg_107_1.icon_.color = Color.New(1, 1, 1)

				local var_110_3 = arg_107_1:GetWordFromCfg(112272027)
				local var_110_4 = arg_107_1:FormatText(var_110_3.content)

				arg_107_1.text_.text = var_110_4

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_5 = 24
				local var_110_6 = utf8.len(var_110_4)
				local var_110_7 = var_110_5 <= 0 and var_110_1 or var_110_1 * (var_110_6 / var_110_5)

				if var_110_7 > 0 and var_110_1 < var_110_7 then
					arg_107_1.talkMaxDuration = var_110_7

					if var_110_7 + var_110_0 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_7 + var_110_0
					end
				end

				arg_107_1.text_.text = var_110_4
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112272", "112272027", "story_v_out_112272.awb") ~= 0 then
					local var_110_8 = manager.audio:GetVoiceLength("story_v_out_112272", "112272027", "story_v_out_112272.awb") / 1000

					if var_110_8 + var_110_0 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_8 + var_110_0
					end

					if var_110_3.prefab_name ~= "" and arg_107_1.actors_[var_110_3.prefab_name] ~= nil then
						local var_110_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_3.prefab_name].transform, "story_v_out_112272", "112272027", "story_v_out_112272.awb")

						arg_107_1:RecordAudio("112272027", var_110_9)
						arg_107_1:RecordAudio("112272027", var_110_9)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_112272", "112272027", "story_v_out_112272.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_112272", "112272027", "story_v_out_112272.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_10 = math.max(var_110_1, arg_107_1.talkMaxDuration)

			if var_110_0 <= arg_107_1.time_ and arg_107_1.time_ < var_110_0 + var_110_10 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_0) / var_110_10

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_0 + var_110_10 and arg_107_1.time_ < var_110_0 + var_110_10 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play112272028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 112272028
		arg_111_1.duration_ = 8.87

		local var_111_0 = {
			ja = 7.1,
			ko = 8.866,
			zh = 7.966,
			en = 6.733
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
				arg_111_0:Play112272029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = 0
			local var_114_1 = 0.95

			if var_114_0 < arg_111_1.time_ and arg_111_1.time_ <= var_114_0 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_2 = arg_111_1:FormatText(StoryNameCfg[202].name)

				arg_111_1.leftNameTxt_.text = var_114_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, true)
				arg_111_1.iconController_:SetSelectedState("hero")

				arg_111_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1081")

				arg_111_1.callingController_:SetSelectedState("normal")

				arg_111_1.keyicon_.color = Color.New(1, 1, 1)
				arg_111_1.icon_.color = Color.New(1, 1, 1)

				local var_114_3 = arg_111_1:GetWordFromCfg(112272028)
				local var_114_4 = arg_111_1:FormatText(var_114_3.content)

				arg_111_1.text_.text = var_114_4

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_5 = 38
				local var_114_6 = utf8.len(var_114_4)
				local var_114_7 = var_114_5 <= 0 and var_114_1 or var_114_1 * (var_114_6 / var_114_5)

				if var_114_7 > 0 and var_114_1 < var_114_7 then
					arg_111_1.talkMaxDuration = var_114_7

					if var_114_7 + var_114_0 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_7 + var_114_0
					end
				end

				arg_111_1.text_.text = var_114_4
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112272", "112272028", "story_v_out_112272.awb") ~= 0 then
					local var_114_8 = manager.audio:GetVoiceLength("story_v_out_112272", "112272028", "story_v_out_112272.awb") / 1000

					if var_114_8 + var_114_0 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_8 + var_114_0
					end

					if var_114_3.prefab_name ~= "" and arg_111_1.actors_[var_114_3.prefab_name] ~= nil then
						local var_114_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_3.prefab_name].transform, "story_v_out_112272", "112272028", "story_v_out_112272.awb")

						arg_111_1:RecordAudio("112272028", var_114_9)
						arg_111_1:RecordAudio("112272028", var_114_9)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_112272", "112272028", "story_v_out_112272.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_112272", "112272028", "story_v_out_112272.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_10 = math.max(var_114_1, arg_111_1.talkMaxDuration)

			if var_114_0 <= arg_111_1.time_ and arg_111_1.time_ < var_114_0 + var_114_10 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_0) / var_114_10

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_0 + var_114_10 and arg_111_1.time_ < var_114_0 + var_114_10 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play112272029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 112272029
		arg_115_1.duration_ = 5

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play112272030(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = 0
			local var_118_1 = 0.075

			if var_118_0 < arg_115_1.time_ and arg_115_1.time_ <= var_118_0 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_2 = arg_115_1:FormatText(StoryNameCfg[7].name)

				arg_115_1.leftNameTxt_.text = var_118_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_3 = arg_115_1:GetWordFromCfg(112272029)
				local var_118_4 = arg_115_1:FormatText(var_118_3.content)

				arg_115_1.text_.text = var_118_4

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_5 = 3
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
				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_8 = math.max(var_118_1, arg_115_1.talkMaxDuration)

			if var_118_0 <= arg_115_1.time_ and arg_115_1.time_ < var_118_0 + var_118_8 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_0) / var_118_8

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_0 + var_118_8 and arg_115_1.time_ < var_118_0 + var_118_8 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play112272030 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 112272030
		arg_119_1.duration_ = 5.67

		local var_119_0 = {
			ja = 4.833,
			ko = 5.666,
			zh = 5,
			en = 3
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
				arg_119_0:Play112272031(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0
			local var_122_1 = 0.725

			if var_122_0 < arg_119_1.time_ and arg_119_1.time_ <= var_122_0 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_2 = arg_119_1:FormatText(StoryNameCfg[202].name)

				arg_119_1.leftNameTxt_.text = var_122_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, true)
				arg_119_1.iconController_:SetSelectedState("hero")

				arg_119_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1081")

				arg_119_1.callingController_:SetSelectedState("normal")

				arg_119_1.keyicon_.color = Color.New(1, 1, 1)
				arg_119_1.icon_.color = Color.New(1, 1, 1)

				local var_122_3 = arg_119_1:GetWordFromCfg(112272030)
				local var_122_4 = arg_119_1:FormatText(var_122_3.content)

				arg_119_1.text_.text = var_122_4

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_5 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_112272", "112272030", "story_v_out_112272.awb") ~= 0 then
					local var_122_8 = manager.audio:GetVoiceLength("story_v_out_112272", "112272030", "story_v_out_112272.awb") / 1000

					if var_122_8 + var_122_0 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_8 + var_122_0
					end

					if var_122_3.prefab_name ~= "" and arg_119_1.actors_[var_122_3.prefab_name] ~= nil then
						local var_122_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_3.prefab_name].transform, "story_v_out_112272", "112272030", "story_v_out_112272.awb")

						arg_119_1:RecordAudio("112272030", var_122_9)
						arg_119_1:RecordAudio("112272030", var_122_9)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_112272", "112272030", "story_v_out_112272.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_112272", "112272030", "story_v_out_112272.awb")
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
	Play112272031 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 112272031
		arg_123_1.duration_ = 3.43

		local var_123_0 = {
			ja = 3.433,
			ko = 2.466,
			zh = 2.2,
			en = 2.2
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
				arg_123_0:Play112272032(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = 0
			local var_126_1 = 0.175

			if var_126_0 < arg_123_1.time_ and arg_123_1.time_ <= var_126_0 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_2 = arg_123_1:FormatText(StoryNameCfg[8].name)

				arg_123_1.leftNameTxt_.text = var_126_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, true)
				arg_123_1.iconController_:SetSelectedState("hero")

				arg_123_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1148")

				arg_123_1.callingController_:SetSelectedState("normal")

				arg_123_1.keyicon_.color = Color.New(1, 1, 1)
				arg_123_1.icon_.color = Color.New(1, 1, 1)

				local var_126_3 = arg_123_1:GetWordFromCfg(112272031)
				local var_126_4 = arg_123_1:FormatText(var_126_3.content)

				arg_123_1.text_.text = var_126_4

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_5 = 7
				local var_126_6 = utf8.len(var_126_4)
				local var_126_7 = var_126_5 <= 0 and var_126_1 or var_126_1 * (var_126_6 / var_126_5)

				if var_126_7 > 0 and var_126_1 < var_126_7 then
					arg_123_1.talkMaxDuration = var_126_7

					if var_126_7 + var_126_0 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_7 + var_126_0
					end
				end

				arg_123_1.text_.text = var_126_4
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112272", "112272031", "story_v_out_112272.awb") ~= 0 then
					local var_126_8 = manager.audio:GetVoiceLength("story_v_out_112272", "112272031", "story_v_out_112272.awb") / 1000

					if var_126_8 + var_126_0 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_8 + var_126_0
					end

					if var_126_3.prefab_name ~= "" and arg_123_1.actors_[var_126_3.prefab_name] ~= nil then
						local var_126_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_3.prefab_name].transform, "story_v_out_112272", "112272031", "story_v_out_112272.awb")

						arg_123_1:RecordAudio("112272031", var_126_9)
						arg_123_1:RecordAudio("112272031", var_126_9)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_112272", "112272031", "story_v_out_112272.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_112272", "112272031", "story_v_out_112272.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_10 = math.max(var_126_1, arg_123_1.talkMaxDuration)

			if var_126_0 <= arg_123_1.time_ and arg_123_1.time_ < var_126_0 + var_126_10 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_0) / var_126_10

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_0 + var_126_10 and arg_123_1.time_ < var_126_0 + var_126_10 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play112272032 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 112272032
		arg_127_1.duration_ = 7.93

		local var_127_0 = {
			ja = 7.933,
			ko = 5.833,
			zh = 5.233,
			en = 6.566
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
			arg_127_1.auto_ = false
		end

		function arg_127_1.playNext_(arg_129_0)
			arg_127_1.onStoryFinished_()
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = 0
			local var_130_1 = 0.625

			if var_130_0 < arg_127_1.time_ and arg_127_1.time_ <= var_130_0 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_2 = arg_127_1:FormatText(StoryNameCfg[202].name)

				arg_127_1.leftNameTxt_.text = var_130_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, true)
				arg_127_1.iconController_:SetSelectedState("hero")

				arg_127_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1081")

				arg_127_1.callingController_:SetSelectedState("normal")

				arg_127_1.keyicon_.color = Color.New(1, 1, 1)
				arg_127_1.icon_.color = Color.New(1, 1, 1)

				local var_130_3 = arg_127_1:GetWordFromCfg(112272032)
				local var_130_4 = arg_127_1:FormatText(var_130_3.content)

				arg_127_1.text_.text = var_130_4

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_5 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_112272", "112272032", "story_v_out_112272.awb") ~= 0 then
					local var_130_8 = manager.audio:GetVoiceLength("story_v_out_112272", "112272032", "story_v_out_112272.awb") / 1000

					if var_130_8 + var_130_0 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_8 + var_130_0
					end

					if var_130_3.prefab_name ~= "" and arg_127_1.actors_[var_130_3.prefab_name] ~= nil then
						local var_130_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_3.prefab_name].transform, "story_v_out_112272", "112272032", "story_v_out_112272.awb")

						arg_127_1:RecordAudio("112272032", var_130_9)
						arg_127_1:RecordAudio("112272032", var_130_9)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_112272", "112272032", "story_v_out_112272.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_112272", "112272032", "story_v_out_112272.awb")
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
	assets = {},
	voices = {
		"story_v_out_112272.awb"
	}
}
