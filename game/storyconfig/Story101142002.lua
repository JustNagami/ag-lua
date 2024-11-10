return {
	Play114202001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 114202001
		arg_1_1.duration_ = 4.9

		local var_1_0 = {
			ja = 4.9,
			ko = 3.866
		}
		local var_1_1 = manager.audio:GetLocalizationFlag()

		if var_1_0[var_1_1] ~= nil then
			arg_1_1.duration_ = var_1_0[var_1_1]
		end

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play114202002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = 0

			if var_4_0 < arg_1_1.time_ and arg_1_1.time_ <= var_4_0 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = true

				arg_1_1:SetGaussion(false)
			end

			local var_4_1 = 2

			if var_4_0 <= arg_1_1.time_ and arg_1_1.time_ < var_4_0 + var_4_1 then
				local var_4_2 = (arg_1_1.time_ - var_4_0) / var_4_1
				local var_4_3 = Color.New(0, 0, 0)

				var_4_3.a = Mathf.Lerp(1, 0, var_4_2)
				arg_1_1.mask_.color = var_4_3
			end

			if arg_1_1.time_ >= var_4_0 + var_4_1 and arg_1_1.time_ < var_4_0 + var_4_1 + arg_4_0 then
				local var_4_4 = Color.New(0, 0, 0)
				local var_4_5 = 0

				arg_1_1.mask_.enabled = false
				var_4_4.a = var_4_5
				arg_1_1.mask_.color = var_4_4
			end

			local var_4_6 = "F04"

			if arg_1_1.bgs_[var_4_6] == nil then
				local var_4_7 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_7:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_6)
				var_4_7.name = var_4_6
				var_4_7.transform.parent = arg_1_1.stage_.transform
				var_4_7.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_6] = var_4_7
			end

			local var_4_8 = 0

			if var_4_8 < arg_1_1.time_ and arg_1_1.time_ <= var_4_8 + arg_4_0 then
				local var_4_9 = manager.ui.mainCamera.transform.localPosition
				local var_4_10 = Vector3.New(0, 0, 10) + Vector3.New(var_4_9.x, var_4_9.y, 0)
				local var_4_11 = arg_1_1.bgs_.F04

				var_4_11.transform.localPosition = var_4_10
				var_4_11.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_4_12 = var_4_11:GetComponent("SpriteRenderer")

				if var_4_12 and var_4_12.sprite then
					local var_4_13 = (var_4_11.transform.localPosition - var_4_9).z
					local var_4_14 = manager.ui.mainCameraCom_
					local var_4_15 = 2 * var_4_13 * Mathf.Tan(var_4_14.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_4_16 = var_4_15 * var_4_14.aspect
					local var_4_17 = var_4_12.sprite.bounds.size.x
					local var_4_18 = var_4_12.sprite.bounds.size.y
					local var_4_19 = var_4_16 / var_4_17
					local var_4_20 = var_4_15 / var_4_18
					local var_4_21 = var_4_20 < var_4_19 and var_4_19 or var_4_20

					var_4_11.transform.localScale = Vector3.New(var_4_21, var_4_21, 0)
				end

				for iter_4_0, iter_4_1 in pairs(arg_1_1.bgs_) do
					if iter_4_0 ~= "F04" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_22 = 0
			local var_4_23 = 1

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 2
			local var_4_27 = 0.333333333333333

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_1_3_story_battle", "bgm_activity_1_3_story_battle", "bgm_activity_1_3_story_battle.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 0.05

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_32 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_32:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_33 = arg_1_1:FormatText(StoryNameCfg[234].name)

				arg_1_1.leftNameTxt_.text = var_4_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_34 = arg_1_1:GetWordFromCfg(114202001)
				local var_4_35 = arg_1_1:FormatText(var_4_34.content)

				arg_1_1.text_.text = var_4_35

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_36 = 2
				local var_4_37 = utf8.len(var_4_35)
				local var_4_38 = var_4_36 <= 0 and var_4_31 or var_4_31 * (var_4_37 / var_4_36)

				if var_4_38 > 0 and var_4_31 < var_4_38 then
					arg_1_1.talkMaxDuration = var_4_38
					var_4_30 = var_4_30 + 0.3

					if var_4_38 + var_4_30 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_38 + var_4_30
					end
				end

				arg_1_1.text_.text = var_4_35
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114202", "114202001", "story_v_out_114202.awb") ~= 0 then
					local var_4_39 = manager.audio:GetVoiceLength("story_v_out_114202", "114202001", "story_v_out_114202.awb") / 1000

					if var_4_39 + var_4_30 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_39 + var_4_30
					end

					if var_4_34.prefab_name ~= "" and arg_1_1.actors_[var_4_34.prefab_name] ~= nil then
						local var_4_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_34.prefab_name].transform, "story_v_out_114202", "114202001", "story_v_out_114202.awb")

						arg_1_1:RecordAudio("114202001", var_4_40)
						arg_1_1:RecordAudio("114202001", var_4_40)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_114202", "114202001", "story_v_out_114202.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_114202", "114202001", "story_v_out_114202.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_41 = var_4_30 + 0.3
			local var_4_42 = math.max(var_4_31, arg_1_1.talkMaxDuration)

			if var_4_41 <= arg_1_1.time_ and arg_1_1.time_ < var_4_41 + var_4_42 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_41) / var_4_42

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_41 + var_4_42 and arg_1_1.time_ < var_4_41 + var_4_42 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play114202002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 114202002
		arg_7_1.duration_ = 3.2

		local var_7_0 = {
			ja = 3.2,
			ko = 1.933,
			zh = 1.433,
			en = 1.1
		}
		local var_7_1 = manager.audio:GetLocalizationFlag()

		if var_7_0[var_7_1] ~= nil then
			arg_7_1.duration_ = var_7_0[var_7_1]
		end

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play114202003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.15

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_2 = arg_7_1:FormatText(StoryNameCfg[209].name)

				arg_7_1.leftNameTxt_.text = var_10_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, true)
				arg_7_1.iconController_:SetSelectedState("hero")

				arg_7_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2050")

				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_3 = arg_7_1:GetWordFromCfg(114202002)
				local var_10_4 = arg_7_1:FormatText(var_10_3.content)

				arg_7_1.text_.text = var_10_4

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_5 = 6
				local var_10_6 = utf8.len(var_10_4)
				local var_10_7 = var_10_5 <= 0 and var_10_1 or var_10_1 * (var_10_6 / var_10_5)

				if var_10_7 > 0 and var_10_1 < var_10_7 then
					arg_7_1.talkMaxDuration = var_10_7

					if var_10_7 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_7 + var_10_0
					end
				end

				arg_7_1.text_.text = var_10_4
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114202", "114202002", "story_v_out_114202.awb") ~= 0 then
					local var_10_8 = manager.audio:GetVoiceLength("story_v_out_114202", "114202002", "story_v_out_114202.awb") / 1000

					if var_10_8 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_8 + var_10_0
					end

					if var_10_3.prefab_name ~= "" and arg_7_1.actors_[var_10_3.prefab_name] ~= nil then
						local var_10_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_3.prefab_name].transform, "story_v_out_114202", "114202002", "story_v_out_114202.awb")

						arg_7_1:RecordAudio("114202002", var_10_9)
						arg_7_1:RecordAudio("114202002", var_10_9)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_114202", "114202002", "story_v_out_114202.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_114202", "114202002", "story_v_out_114202.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_10 = math.max(var_10_1, arg_7_1.talkMaxDuration)

			if var_10_0 <= arg_7_1.time_ and arg_7_1.time_ < var_10_0 + var_10_10 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_0) / var_10_10

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_0 + var_10_10 and arg_7_1.time_ < var_10_0 + var_10_10 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play114202003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 114202003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play114202004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 0.95

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

				local var_14_2 = arg_11_1:GetWordFromCfg(114202003)
				local var_14_3 = arg_11_1:FormatText(var_14_2.content)

				arg_11_1.text_.text = var_14_3

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_4 = 38
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
	Play114202004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 114202004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play114202005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 0.65

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

				local var_18_2 = arg_15_1:GetWordFromCfg(114202004)
				local var_18_3 = arg_15_1:FormatText(var_18_2.content)

				arg_15_1.text_.text = var_18_3

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_4 = 26
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
	Play114202005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 114202005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play114202006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 1.25

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, false)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_2 = arg_19_1:GetWordFromCfg(114202005)
				local var_22_3 = arg_19_1:FormatText(var_22_2.content)

				arg_19_1.text_.text = var_22_3

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_4 = 50
				local var_22_5 = utf8.len(var_22_3)
				local var_22_6 = var_22_4 <= 0 and var_22_1 or var_22_1 * (var_22_5 / var_22_4)

				if var_22_6 > 0 and var_22_1 < var_22_6 then
					arg_19_1.talkMaxDuration = var_22_6

					if var_22_6 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_6 + var_22_0
					end
				end

				arg_19_1.text_.text = var_22_3
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_7 = math.max(var_22_1, arg_19_1.talkMaxDuration)

			if var_22_0 <= arg_19_1.time_ and arg_19_1.time_ < var_22_0 + var_22_7 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_0) / var_22_7

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_0 + var_22_7 and arg_19_1.time_ < var_22_0 + var_22_7 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play114202006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 114202006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play114202007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 0.65

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, false)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_2 = arg_23_1:GetWordFromCfg(114202006)
				local var_26_3 = arg_23_1:FormatText(var_26_2.content)

				arg_23_1.text_.text = var_26_3

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_4 = 26
				local var_26_5 = utf8.len(var_26_3)
				local var_26_6 = var_26_4 <= 0 and var_26_1 or var_26_1 * (var_26_5 / var_26_4)

				if var_26_6 > 0 and var_26_1 < var_26_6 then
					arg_23_1.talkMaxDuration = var_26_6

					if var_26_6 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_6 + var_26_0
					end
				end

				arg_23_1.text_.text = var_26_3
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_7 = math.max(var_26_1, arg_23_1.talkMaxDuration)

			if var_26_0 <= arg_23_1.time_ and arg_23_1.time_ < var_26_0 + var_26_7 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_0) / var_26_7

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_0 + var_26_7 and arg_23_1.time_ < var_26_0 + var_26_7 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play114202007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 114202007
		arg_27_1.duration_ = 4.533

		local var_27_0 = {
			ja = 2.6,
			ko = 1.833,
			zh = 1.766,
			en = 4.533
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
				arg_27_0:Play114202008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = "10017"

			if arg_27_1.actors_[var_30_0] == nil then
				local var_30_1 = Object.Instantiate(arg_27_1.imageGo_, arg_27_1.canvasGo_.transform)

				var_30_1.transform:SetSiblingIndex(1)

				var_30_1.name = var_30_0

				local var_30_2 = var_30_1:GetComponent(typeof(Image))

				var_30_2.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. var_30_0)

				var_30_2:SetNativeSize()

				var_30_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_27_1.actors_[var_30_0] = var_30_1
			end

			local var_30_3 = arg_27_1.actors_["10017"].transform
			local var_30_4 = 0

			if var_30_4 < arg_27_1.time_ and arg_27_1.time_ <= var_30_4 + arg_30_0 then
				arg_27_1.var_.moveOldPos10017 = var_30_3.localPosition
				var_30_3.localScale = Vector3.New(1, 1, 1)

				arg_27_1:CheckSpriteTmpPos("10017", 2)
			end

			local var_30_5 = 0.001

			if var_30_4 <= arg_27_1.time_ and arg_27_1.time_ < var_30_4 + var_30_5 then
				local var_30_6 = (arg_27_1.time_ - var_30_4) / var_30_5
				local var_30_7 = Vector3.New(-390, -350, -180)

				var_30_3.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos10017, var_30_7, var_30_6)
			end

			if arg_27_1.time_ >= var_30_4 + var_30_5 and arg_27_1.time_ < var_30_4 + var_30_5 + arg_30_0 then
				var_30_3.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_30_8 = arg_27_1.actors_["10017"]
			local var_30_9 = 0

			if var_30_9 < arg_27_1.time_ and arg_27_1.time_ <= var_30_9 + arg_30_0 then
				local var_30_10 = var_30_8:GetComponent("Image")

				if var_30_10 then
					arg_27_1.var_.highlightMatValue10017 = var_30_10
				end
			end

			local var_30_11 = 0.034

			if var_30_9 <= arg_27_1.time_ and arg_27_1.time_ < var_30_9 + var_30_11 then
				local var_30_12 = (arg_27_1.time_ - var_30_9) / var_30_11

				if arg_27_1.var_.highlightMatValue10017 then
					local var_30_13 = Mathf.Lerp(0.5, 1, var_30_12)
					local var_30_14 = arg_27_1.var_.highlightMatValue10017
					local var_30_15 = var_30_14.color

					var_30_15.r = var_30_13
					var_30_15.g = var_30_13
					var_30_15.b = var_30_13
					var_30_14.color = var_30_15
				end
			end

			if arg_27_1.time_ >= var_30_9 + var_30_11 and arg_27_1.time_ < var_30_9 + var_30_11 + arg_30_0 and arg_27_1.var_.highlightMatValue10017 then
				local var_30_16 = 1

				var_30_8.transform:SetSiblingIndex(1)

				local var_30_17 = arg_27_1.var_.highlightMatValue10017
				local var_30_18 = var_30_17.color

				var_30_18.r = var_30_16
				var_30_18.g = var_30_16
				var_30_18.b = var_30_16
				var_30_17.color = var_30_18
			end

			local var_30_19 = arg_27_1.actors_["10017"]
			local var_30_20 = 0

			if var_30_20 < arg_27_1.time_ and arg_27_1.time_ <= var_30_20 + arg_30_0 then
				local var_30_21 = var_30_19:GetComponent("Image")

				if var_30_21 then
					arg_27_1.var_.alphaMatValue10017 = var_30_21
					arg_27_1.var_.alphaOldValue10017 = var_30_21.color.a
				end

				arg_27_1.var_.alphaOldValue10017 = 0
			end

			local var_30_22 = 0.5

			if var_30_20 <= arg_27_1.time_ and arg_27_1.time_ < var_30_20 + var_30_22 then
				local var_30_23 = (arg_27_1.time_ - var_30_20) / var_30_22
				local var_30_24 = Mathf.Lerp(arg_27_1.var_.alphaOldValue10017, 1, var_30_23)

				if arg_27_1.var_.alphaMatValue10017 then
					local var_30_25 = arg_27_1.var_.alphaMatValue10017.color

					var_30_25.a = var_30_24
					arg_27_1.var_.alphaMatValue10017.color = var_30_25
				end
			end

			if arg_27_1.time_ >= var_30_20 + var_30_22 and arg_27_1.time_ < var_30_20 + var_30_22 + arg_30_0 and arg_27_1.var_.alphaMatValue10017 then
				local var_30_26 = arg_27_1.var_.alphaMatValue10017
				local var_30_27 = var_30_26.color

				var_30_27.a = 1
				var_30_26.color = var_30_27
			end

			local var_30_28 = 0
			local var_30_29 = 0.175

			if var_30_28 < arg_27_1.time_ and arg_27_1.time_ <= var_30_28 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_30 = arg_27_1:FormatText(StoryNameCfg[255].name)

				arg_27_1.leftNameTxt_.text = var_30_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_31 = arg_27_1:GetWordFromCfg(114202007)
				local var_30_32 = arg_27_1:FormatText(var_30_31.content)

				arg_27_1.text_.text = var_30_32

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_33 = 7
				local var_30_34 = utf8.len(var_30_32)
				local var_30_35 = var_30_33 <= 0 and var_30_29 or var_30_29 * (var_30_34 / var_30_33)

				if var_30_35 > 0 and var_30_29 < var_30_35 then
					arg_27_1.talkMaxDuration = var_30_35

					if var_30_35 + var_30_28 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_35 + var_30_28
					end
				end

				arg_27_1.text_.text = var_30_32
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114202", "114202007", "story_v_out_114202.awb") ~= 0 then
					local var_30_36 = manager.audio:GetVoiceLength("story_v_out_114202", "114202007", "story_v_out_114202.awb") / 1000

					if var_30_36 + var_30_28 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_36 + var_30_28
					end

					if var_30_31.prefab_name ~= "" and arg_27_1.actors_[var_30_31.prefab_name] ~= nil then
						local var_30_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_31.prefab_name].transform, "story_v_out_114202", "114202007", "story_v_out_114202.awb")

						arg_27_1:RecordAudio("114202007", var_30_37)
						arg_27_1:RecordAudio("114202007", var_30_37)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_114202", "114202007", "story_v_out_114202.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_114202", "114202007", "story_v_out_114202.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_38 = math.max(var_30_29, arg_27_1.talkMaxDuration)

			if var_30_28 <= arg_27_1.time_ and arg_27_1.time_ < var_30_28 + var_30_38 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_28) / var_30_38

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_28 + var_30_38 and arg_27_1.time_ < var_30_28 + var_30_38 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play114202008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 114202008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play114202009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["10017"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				local var_34_2 = var_34_0:GetComponent("Image")

				if var_34_2 then
					arg_31_1.var_.highlightMatValue10017 = var_34_2
				end
			end

			local var_34_3 = 0.5

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_3 then
				local var_34_4 = (arg_31_1.time_ - var_34_1) / var_34_3

				if arg_31_1.var_.highlightMatValue10017 then
					local var_34_5 = Mathf.Lerp(1, 0.5, var_34_4)
					local var_34_6 = arg_31_1.var_.highlightMatValue10017
					local var_34_7 = var_34_6.color

					var_34_7.r = var_34_5
					var_34_7.g = var_34_5
					var_34_7.b = var_34_5
					var_34_6.color = var_34_7
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_3 and arg_31_1.time_ < var_34_1 + var_34_3 + arg_34_0 and arg_31_1.var_.highlightMatValue10017 then
				local var_34_8 = 0.5
				local var_34_9 = arg_31_1.var_.highlightMatValue10017
				local var_34_10 = var_34_9.color

				var_34_10.r = var_34_8
				var_34_10.g = var_34_8
				var_34_10.b = var_34_8
				var_34_9.color = var_34_10
			end

			local var_34_11 = 0
			local var_34_12 = 1

			if var_34_11 < arg_31_1.time_ and arg_31_1.time_ <= var_34_11 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, false)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_13 = arg_31_1:GetWordFromCfg(114202008)
				local var_34_14 = arg_31_1:FormatText(var_34_13.content)

				arg_31_1.text_.text = var_34_14

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_15 = 40
				local var_34_16 = utf8.len(var_34_14)
				local var_34_17 = var_34_15 <= 0 and var_34_12 or var_34_12 * (var_34_16 / var_34_15)

				if var_34_17 > 0 and var_34_12 < var_34_17 then
					arg_31_1.talkMaxDuration = var_34_17

					if var_34_17 + var_34_11 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_17 + var_34_11
					end
				end

				arg_31_1.text_.text = var_34_14
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_18 = math.max(var_34_12, arg_31_1.talkMaxDuration)

			if var_34_11 <= arg_31_1.time_ and arg_31_1.time_ < var_34_11 + var_34_18 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_11) / var_34_18

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_11 + var_34_18 and arg_31_1.time_ < var_34_11 + var_34_18 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play114202009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 114202009
		arg_35_1.duration_ = 1.233

		local var_35_0 = {
			ja = 1.233,
			ko = 1.1,
			zh = 1.133,
			en = 1.2
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
				arg_35_0:Play114202010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = "10015"

			if arg_35_1.actors_[var_38_0] == nil then
				local var_38_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_38_0), arg_35_1.canvasGo_.transform)

				var_38_1.transform:SetSiblingIndex(1)

				var_38_1.name = var_38_0
				var_38_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_35_1.actors_[var_38_0] = var_38_1
			end

			local var_38_2 = arg_35_1.actors_["10015"].transform
			local var_38_3 = 0

			if var_38_3 < arg_35_1.time_ and arg_35_1.time_ <= var_38_3 + arg_38_0 then
				arg_35_1.var_.moveOldPos10015 = var_38_2.localPosition
				var_38_2.localScale = Vector3.New(1, 1, 1)

				arg_35_1:CheckSpriteTmpPos("10015", 4)

				local var_38_4 = var_38_2.childCount

				for iter_38_0 = 0, var_38_4 - 1 do
					local var_38_5 = var_38_2:GetChild(iter_38_0)

					if var_38_5.name == "split_1" or not string.find(var_38_5.name, "split") then
						var_38_5.gameObject:SetActive(true)
					else
						var_38_5.gameObject:SetActive(false)
					end
				end
			end

			local var_38_6 = 0.001

			if var_38_3 <= arg_35_1.time_ and arg_35_1.time_ < var_38_3 + var_38_6 then
				local var_38_7 = (arg_35_1.time_ - var_38_3) / var_38_6
				local var_38_8 = Vector3.New(390, -350, -180)

				var_38_2.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos10015, var_38_8, var_38_7)
			end

			if arg_35_1.time_ >= var_38_3 + var_38_6 and arg_35_1.time_ < var_38_3 + var_38_6 + arg_38_0 then
				var_38_2.localPosition = Vector3.New(390, -350, -180)
			end

			local var_38_9 = arg_35_1.actors_["10015"]
			local var_38_10 = 0

			if var_38_10 < arg_35_1.time_ and arg_35_1.time_ <= var_38_10 + arg_38_0 and arg_35_1.var_.actorSpriteComps10015 == nil then
				arg_35_1.var_.actorSpriteComps10015 = var_38_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_38_11 = 0.034

			if var_38_10 <= arg_35_1.time_ and arg_35_1.time_ < var_38_10 + var_38_11 then
				local var_38_12 = (arg_35_1.time_ - var_38_10) / var_38_11

				if arg_35_1.var_.actorSpriteComps10015 then
					for iter_38_1, iter_38_2 in pairs(arg_35_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_38_2 then
							local var_38_13 = Mathf.Lerp(iter_38_2.color.r, 1, var_38_12)

							iter_38_2.color = Color.New(var_38_13, var_38_13, var_38_13)
						end
					end
				end
			end

			if arg_35_1.time_ >= var_38_10 + var_38_11 and arg_35_1.time_ < var_38_10 + var_38_11 + arg_38_0 and arg_35_1.var_.actorSpriteComps10015 then
				local var_38_14 = 1

				for iter_38_3, iter_38_4 in pairs(arg_35_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_38_4 then
						iter_38_4.color = Color.New(var_38_14, var_38_14, var_38_14)
					end
				end

				arg_35_1.var_.actorSpriteComps10015 = nil
			end

			local var_38_15 = arg_35_1.actors_["10015"]
			local var_38_16 = 0

			if var_38_16 < arg_35_1.time_ and arg_35_1.time_ <= var_38_16 + arg_38_0 then
				local var_38_17 = var_38_15:GetComponentInChildren(typeof(CanvasGroup))

				if var_38_17 then
					arg_35_1.var_.alphaOldValue10015 = var_38_17.alpha
					arg_35_1.var_.characterEffect10015 = var_38_17
				end

				arg_35_1.var_.alphaOldValue10015 = 0
			end

			local var_38_18 = 0.5

			if var_38_16 <= arg_35_1.time_ and arg_35_1.time_ < var_38_16 + var_38_18 then
				local var_38_19 = (arg_35_1.time_ - var_38_16) / var_38_18
				local var_38_20 = Mathf.Lerp(arg_35_1.var_.alphaOldValue10015, 1, var_38_19)

				if arg_35_1.var_.characterEffect10015 then
					arg_35_1.var_.characterEffect10015.alpha = var_38_20
				end
			end

			if arg_35_1.time_ >= var_38_16 + var_38_18 and arg_35_1.time_ < var_38_16 + var_38_18 + arg_38_0 and arg_35_1.var_.characterEffect10015 then
				arg_35_1.var_.characterEffect10015.alpha = 1
			end

			local var_38_21 = 0
			local var_38_22 = 0.075

			if var_38_21 < arg_35_1.time_ and arg_35_1.time_ <= var_38_21 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_23 = arg_35_1:FormatText(StoryNameCfg[208].name)

				arg_35_1.leftNameTxt_.text = var_38_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_24 = arg_35_1:GetWordFromCfg(114202009)
				local var_38_25 = arg_35_1:FormatText(var_38_24.content)

				arg_35_1.text_.text = var_38_25

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_26 = 3
				local var_38_27 = utf8.len(var_38_25)
				local var_38_28 = var_38_26 <= 0 and var_38_22 or var_38_22 * (var_38_27 / var_38_26)

				if var_38_28 > 0 and var_38_22 < var_38_28 then
					arg_35_1.talkMaxDuration = var_38_28

					if var_38_28 + var_38_21 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_28 + var_38_21
					end
				end

				arg_35_1.text_.text = var_38_25
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114202", "114202009", "story_v_out_114202.awb") ~= 0 then
					local var_38_29 = manager.audio:GetVoiceLength("story_v_out_114202", "114202009", "story_v_out_114202.awb") / 1000

					if var_38_29 + var_38_21 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_29 + var_38_21
					end

					if var_38_24.prefab_name ~= "" and arg_35_1.actors_[var_38_24.prefab_name] ~= nil then
						local var_38_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_24.prefab_name].transform, "story_v_out_114202", "114202009", "story_v_out_114202.awb")

						arg_35_1:RecordAudio("114202009", var_38_30)
						arg_35_1:RecordAudio("114202009", var_38_30)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_114202", "114202009", "story_v_out_114202.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_114202", "114202009", "story_v_out_114202.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_31 = math.max(var_38_22, arg_35_1.talkMaxDuration)

			if var_38_21 <= arg_35_1.time_ and arg_35_1.time_ < var_38_21 + var_38_31 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_21) / var_38_31

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_21 + var_38_31 and arg_35_1.time_ < var_38_21 + var_38_31 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play114202010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 114202010
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play114202011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["10015"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.actorSpriteComps10015 == nil then
				arg_39_1.var_.actorSpriteComps10015 = var_42_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_42_2 = 0.034

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.actorSpriteComps10015 then
					for iter_42_0, iter_42_1 in pairs(arg_39_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_42_1 then
							local var_42_4 = Mathf.Lerp(iter_42_1.color.r, 0.5, var_42_3)

							iter_42_1.color = Color.New(var_42_4, var_42_4, var_42_4)
						end
					end
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.actorSpriteComps10015 then
				local var_42_5 = 0.5

				for iter_42_2, iter_42_3 in pairs(arg_39_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_42_3 then
						iter_42_3.color = Color.New(var_42_5, var_42_5, var_42_5)
					end
				end

				arg_39_1.var_.actorSpriteComps10015 = nil
			end

			local var_42_6 = 0
			local var_42_7 = 0.6

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

				local var_42_8 = arg_39_1:GetWordFromCfg(114202010)
				local var_42_9 = arg_39_1:FormatText(var_42_8.content)

				arg_39_1.text_.text = var_42_9

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_10 = 24
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
	Play114202011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 114202011
		arg_43_1.duration_ = 3.1

		local var_43_0 = {
			ja = 3.1,
			ko = 2.466,
			zh = 1.5,
			en = 1.466
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
				arg_43_0:Play114202012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["10015"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.actorSpriteComps10015 == nil then
				arg_43_1.var_.actorSpriteComps10015 = var_46_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_2 = 0.034

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.actorSpriteComps10015 then
					for iter_46_0, iter_46_1 in pairs(arg_43_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_46_1 then
							local var_46_4 = Mathf.Lerp(iter_46_1.color.r, 1, var_46_3)

							iter_46_1.color = Color.New(var_46_4, var_46_4, var_46_4)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.actorSpriteComps10015 then
				local var_46_5 = 1

				for iter_46_2, iter_46_3 in pairs(arg_43_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_46_3 then
						iter_46_3.color = Color.New(var_46_5, var_46_5, var_46_5)
					end
				end

				arg_43_1.var_.actorSpriteComps10015 = nil
			end

			local var_46_6 = arg_43_1.actors_["10015"].transform
			local var_46_7 = 0

			if var_46_7 < arg_43_1.time_ and arg_43_1.time_ <= var_46_7 + arg_46_0 then
				arg_43_1.var_.moveOldPos10015 = var_46_6.localPosition
				var_46_6.localScale = Vector3.New(1, 1, 1)

				arg_43_1:CheckSpriteTmpPos("10015", 4)

				local var_46_8 = var_46_6.childCount

				for iter_46_4 = 0, var_46_8 - 1 do
					local var_46_9 = var_46_6:GetChild(iter_46_4)

					if var_46_9.name == "split_2" or not string.find(var_46_9.name, "split") then
						var_46_9.gameObject:SetActive(true)
					else
						var_46_9.gameObject:SetActive(false)
					end
				end
			end

			local var_46_10 = 0.001

			if var_46_7 <= arg_43_1.time_ and arg_43_1.time_ < var_46_7 + var_46_10 then
				local var_46_11 = (arg_43_1.time_ - var_46_7) / var_46_10
				local var_46_12 = Vector3.New(390, -350, -180)

				var_46_6.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos10015, var_46_12, var_46_11)
			end

			if arg_43_1.time_ >= var_46_7 + var_46_10 and arg_43_1.time_ < var_46_7 + var_46_10 + arg_46_0 then
				var_46_6.localPosition = Vector3.New(390, -350, -180)
			end

			local var_46_13 = 0
			local var_46_14 = 0.15

			if var_46_13 < arg_43_1.time_ and arg_43_1.time_ <= var_46_13 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_15 = arg_43_1:FormatText(StoryNameCfg[208].name)

				arg_43_1.leftNameTxt_.text = var_46_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_16 = arg_43_1:GetWordFromCfg(114202011)
				local var_46_17 = arg_43_1:FormatText(var_46_16.content)

				arg_43_1.text_.text = var_46_17

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_18 = 6
				local var_46_19 = utf8.len(var_46_17)
				local var_46_20 = var_46_18 <= 0 and var_46_14 or var_46_14 * (var_46_19 / var_46_18)

				if var_46_20 > 0 and var_46_14 < var_46_20 then
					arg_43_1.talkMaxDuration = var_46_20

					if var_46_20 + var_46_13 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_20 + var_46_13
					end
				end

				arg_43_1.text_.text = var_46_17
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114202", "114202011", "story_v_out_114202.awb") ~= 0 then
					local var_46_21 = manager.audio:GetVoiceLength("story_v_out_114202", "114202011", "story_v_out_114202.awb") / 1000

					if var_46_21 + var_46_13 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_21 + var_46_13
					end

					if var_46_16.prefab_name ~= "" and arg_43_1.actors_[var_46_16.prefab_name] ~= nil then
						local var_46_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_16.prefab_name].transform, "story_v_out_114202", "114202011", "story_v_out_114202.awb")

						arg_43_1:RecordAudio("114202011", var_46_22)
						arg_43_1:RecordAudio("114202011", var_46_22)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_114202", "114202011", "story_v_out_114202.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_114202", "114202011", "story_v_out_114202.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_23 = math.max(var_46_14, arg_43_1.talkMaxDuration)

			if var_46_13 <= arg_43_1.time_ and arg_43_1.time_ < var_46_13 + var_46_23 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_13) / var_46_23

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_13 + var_46_23 and arg_43_1.time_ < var_46_13 + var_46_23 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play114202012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 114202012
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play114202013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["10015"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.actorSpriteComps10015 == nil then
				arg_47_1.var_.actorSpriteComps10015 = var_50_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_50_2 = 0.034

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.actorSpriteComps10015 then
					for iter_50_0, iter_50_1 in pairs(arg_47_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_50_1 then
							local var_50_4 = Mathf.Lerp(iter_50_1.color.r, 0.5, var_50_3)

							iter_50_1.color = Color.New(var_50_4, var_50_4, var_50_4)
						end
					end
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.actorSpriteComps10015 then
				local var_50_5 = 0.5

				for iter_50_2, iter_50_3 in pairs(arg_47_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_50_3 then
						iter_50_3.color = Color.New(var_50_5, var_50_5, var_50_5)
					end
				end

				arg_47_1.var_.actorSpriteComps10015 = nil
			end

			local var_50_6 = 0
			local var_50_7 = 0.625

			if var_50_6 < arg_47_1.time_ and arg_47_1.time_ <= var_50_6 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, false)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_8 = arg_47_1:GetWordFromCfg(114202012)
				local var_50_9 = arg_47_1:FormatText(var_50_8.content)

				arg_47_1.text_.text = var_50_9

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_10 = 25
				local var_50_11 = utf8.len(var_50_9)
				local var_50_12 = var_50_10 <= 0 and var_50_7 or var_50_7 * (var_50_11 / var_50_10)

				if var_50_12 > 0 and var_50_7 < var_50_12 then
					arg_47_1.talkMaxDuration = var_50_12

					if var_50_12 + var_50_6 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_12 + var_50_6
					end
				end

				arg_47_1.text_.text = var_50_9
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)
				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_13 = math.max(var_50_7, arg_47_1.talkMaxDuration)

			if var_50_6 <= arg_47_1.time_ and arg_47_1.time_ < var_50_6 + var_50_13 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_6) / var_50_13

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_6 + var_50_13 and arg_47_1.time_ < var_50_6 + var_50_13 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play114202013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 114202013
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play114202014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["10015"].transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPos10015 = var_54_0.localPosition
				var_54_0.localScale = Vector3.New(1, 1, 1)

				arg_51_1:CheckSpriteTmpPos("10015", 7)

				local var_54_2 = var_54_0.childCount

				for iter_54_0 = 0, var_54_2 - 1 do
					local var_54_3 = var_54_0:GetChild(iter_54_0)

					if var_54_3.name == "split_2" or not string.find(var_54_3.name, "split") then
						var_54_3.gameObject:SetActive(true)
					else
						var_54_3.gameObject:SetActive(false)
					end
				end
			end

			local var_54_4 = 0.001

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_4 then
				local var_54_5 = (arg_51_1.time_ - var_54_1) / var_54_4
				local var_54_6 = Vector3.New(0, -2000, -180)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos10015, var_54_6, var_54_5)
			end

			if arg_51_1.time_ >= var_54_1 + var_54_4 and arg_51_1.time_ < var_54_1 + var_54_4 + arg_54_0 then
				var_54_0.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_54_7 = arg_51_1.actors_["10015"].transform
			local var_54_8 = 0

			if var_54_8 < arg_51_1.time_ and arg_51_1.time_ <= var_54_8 + arg_54_0 then
				arg_51_1.var_.moveOldPos10015 = var_54_7.localPosition
				var_54_7.localScale = Vector3.New(1, 1, 1)

				arg_51_1:CheckSpriteTmpPos("10015", 3)

				local var_54_9 = var_54_7.childCount

				for iter_54_1 = 0, var_54_9 - 1 do
					local var_54_10 = var_54_7:GetChild(iter_54_1)

					if var_54_10.name == "split_1" or not string.find(var_54_10.name, "split") then
						var_54_10.gameObject:SetActive(true)
					else
						var_54_10.gameObject:SetActive(false)
					end
				end
			end

			local var_54_11 = 0.001

			if var_54_8 <= arg_51_1.time_ and arg_51_1.time_ < var_54_8 + var_54_11 then
				local var_54_12 = (arg_51_1.time_ - var_54_8) / var_54_11
				local var_54_13 = Vector3.New(0, -350, -180)

				var_54_7.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos10015, var_54_13, var_54_12)
			end

			if arg_51_1.time_ >= var_54_8 + var_54_11 and arg_51_1.time_ < var_54_8 + var_54_11 + arg_54_0 then
				var_54_7.localPosition = Vector3.New(0, -350, -180)
			end

			local var_54_14 = arg_51_1.actors_["10017"]
			local var_54_15 = 0

			if var_54_15 < arg_51_1.time_ and arg_51_1.time_ <= var_54_15 + arg_54_0 then
				local var_54_16 = var_54_14:GetComponent("Image")

				if var_54_16 then
					arg_51_1.var_.highlightMatValue10017 = var_54_16
				end
			end

			local var_54_17 = 0.034

			if var_54_15 <= arg_51_1.time_ and arg_51_1.time_ < var_54_15 + var_54_17 then
				local var_54_18 = (arg_51_1.time_ - var_54_15) / var_54_17

				if arg_51_1.var_.highlightMatValue10017 then
					local var_54_19 = Mathf.Lerp(1, 0.5, var_54_18)
					local var_54_20 = arg_51_1.var_.highlightMatValue10017
					local var_54_21 = var_54_20.color

					var_54_21.r = var_54_19
					var_54_21.g = var_54_19
					var_54_21.b = var_54_19
					var_54_20.color = var_54_21
				end
			end

			if arg_51_1.time_ >= var_54_15 + var_54_17 and arg_51_1.time_ < var_54_15 + var_54_17 + arg_54_0 and arg_51_1.var_.highlightMatValue10017 then
				local var_54_22 = 0.5
				local var_54_23 = arg_51_1.var_.highlightMatValue10017
				local var_54_24 = var_54_23.color

				var_54_24.r = var_54_22
				var_54_24.g = var_54_22
				var_54_24.b = var_54_22
				var_54_23.color = var_54_24
			end

			local var_54_25 = arg_51_1.actors_["10015"]
			local var_54_26 = 0

			if var_54_26 < arg_51_1.time_ and arg_51_1.time_ <= var_54_26 + arg_54_0 then
				local var_54_27 = var_54_25:GetComponentInChildren(typeof(CanvasGroup))

				if var_54_27 then
					arg_51_1.var_.alphaOldValue10015 = var_54_27.alpha
					arg_51_1.var_.characterEffect10015 = var_54_27
				end

				arg_51_1.var_.alphaOldValue10015 = 0
			end

			local var_54_28 = 0.5

			if var_54_26 <= arg_51_1.time_ and arg_51_1.time_ < var_54_26 + var_54_28 then
				local var_54_29 = (arg_51_1.time_ - var_54_26) / var_54_28
				local var_54_30 = Mathf.Lerp(arg_51_1.var_.alphaOldValue10015, 1, var_54_29)

				if arg_51_1.var_.characterEffect10015 then
					arg_51_1.var_.characterEffect10015.alpha = var_54_30
				end
			end

			if arg_51_1.time_ >= var_54_26 + var_54_28 and arg_51_1.time_ < var_54_26 + var_54_28 + arg_54_0 and arg_51_1.var_.characterEffect10015 then
				arg_51_1.var_.characterEffect10015.alpha = 1
			end

			local var_54_31 = arg_51_1.actors_["10017"].transform
			local var_54_32 = 0

			if var_54_32 < arg_51_1.time_ and arg_51_1.time_ <= var_54_32 + arg_54_0 then
				arg_51_1.var_.moveOldPos10017 = var_54_31.localPosition
				var_54_31.localScale = Vector3.New(1, 1, 1)

				arg_51_1:CheckSpriteTmpPos("10017", 7)
			end

			local var_54_33 = 0.001

			if var_54_32 <= arg_51_1.time_ and arg_51_1.time_ < var_54_32 + var_54_33 then
				local var_54_34 = (arg_51_1.time_ - var_54_32) / var_54_33
				local var_54_35 = Vector3.New(0, -2000, 300)

				var_54_31.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos10017, var_54_35, var_54_34)
			end

			if arg_51_1.time_ >= var_54_32 + var_54_33 and arg_51_1.time_ < var_54_32 + var_54_33 + arg_54_0 then
				var_54_31.localPosition = Vector3.New(0, -2000, 300)
			end

			local var_54_36 = arg_51_1.actors_["10015"]
			local var_54_37 = 0

			if var_54_37 < arg_51_1.time_ and arg_51_1.time_ <= var_54_37 + arg_54_0 and arg_51_1.var_.actorSpriteComps10015 == nil then
				arg_51_1.var_.actorSpriteComps10015 = var_54_36:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_38 = 0.034

			if var_54_37 <= arg_51_1.time_ and arg_51_1.time_ < var_54_37 + var_54_38 then
				local var_54_39 = (arg_51_1.time_ - var_54_37) / var_54_38

				if arg_51_1.var_.actorSpriteComps10015 then
					for iter_54_2, iter_54_3 in pairs(arg_51_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_54_3 then
							local var_54_40 = Mathf.Lerp(iter_54_3.color.r, 1, var_54_39)

							iter_54_3.color = Color.New(var_54_40, var_54_40, var_54_40)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_37 + var_54_38 and arg_51_1.time_ < var_54_37 + var_54_38 + arg_54_0 and arg_51_1.var_.actorSpriteComps10015 then
				local var_54_41 = 1

				for iter_54_4, iter_54_5 in pairs(arg_51_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_54_5 then
						iter_54_5.color = Color.New(var_54_41, var_54_41, var_54_41)
					end
				end

				arg_51_1.var_.actorSpriteComps10015 = nil
			end

			local var_54_42 = 0
			local var_54_43 = 0.675

			if var_54_42 < arg_51_1.time_ and arg_51_1.time_ <= var_54_42 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, false)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_44 = arg_51_1:GetWordFromCfg(114202013)
				local var_54_45 = arg_51_1:FormatText(var_54_44.content)

				arg_51_1.text_.text = var_54_45

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_46 = 27
				local var_54_47 = utf8.len(var_54_45)
				local var_54_48 = var_54_46 <= 0 and var_54_43 or var_54_43 * (var_54_47 / var_54_46)

				if var_54_48 > 0 and var_54_43 < var_54_48 then
					arg_51_1.talkMaxDuration = var_54_48

					if var_54_48 + var_54_42 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_48 + var_54_42
					end
				end

				arg_51_1.text_.text = var_54_45
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)
				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_49 = math.max(var_54_43, arg_51_1.talkMaxDuration)

			if var_54_42 <= arg_51_1.time_ and arg_51_1.time_ < var_54_42 + var_54_49 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_42) / var_54_49

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_42 + var_54_49 and arg_51_1.time_ < var_54_42 + var_54_49 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play114202014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 114202014
		arg_55_1.duration_ = 10.2

		local var_55_0 = {
			ja = 10.2,
			ko = 5.733,
			zh = 5.4,
			en = 6.833
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
				arg_55_0:Play114202015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["10015"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.actorSpriteComps10015 == nil then
				arg_55_1.var_.actorSpriteComps10015 = var_58_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_58_2 = 0.034

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.actorSpriteComps10015 then
					for iter_58_0, iter_58_1 in pairs(arg_55_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_58_1 then
							local var_58_4 = Mathf.Lerp(iter_58_1.color.r, 1, var_58_3)

							iter_58_1.color = Color.New(var_58_4, var_58_4, var_58_4)
						end
					end
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.actorSpriteComps10015 then
				local var_58_5 = 1

				for iter_58_2, iter_58_3 in pairs(arg_55_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_58_3 then
						iter_58_3.color = Color.New(var_58_5, var_58_5, var_58_5)
					end
				end

				arg_55_1.var_.actorSpriteComps10015 = nil
			end

			local var_58_6 = 0
			local var_58_7 = 0.7

			if var_58_6 < arg_55_1.time_ and arg_55_1.time_ <= var_58_6 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_8 = arg_55_1:FormatText(StoryNameCfg[208].name)

				arg_55_1.leftNameTxt_.text = var_58_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_9 = arg_55_1:GetWordFromCfg(114202014)
				local var_58_10 = arg_55_1:FormatText(var_58_9.content)

				arg_55_1.text_.text = var_58_10

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_11 = 27
				local var_58_12 = utf8.len(var_58_10)
				local var_58_13 = var_58_11 <= 0 and var_58_7 or var_58_7 * (var_58_12 / var_58_11)

				if var_58_13 > 0 and var_58_7 < var_58_13 then
					arg_55_1.talkMaxDuration = var_58_13

					if var_58_13 + var_58_6 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_13 + var_58_6
					end
				end

				arg_55_1.text_.text = var_58_10
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114202", "114202014", "story_v_out_114202.awb") ~= 0 then
					local var_58_14 = manager.audio:GetVoiceLength("story_v_out_114202", "114202014", "story_v_out_114202.awb") / 1000

					if var_58_14 + var_58_6 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_14 + var_58_6
					end

					if var_58_9.prefab_name ~= "" and arg_55_1.actors_[var_58_9.prefab_name] ~= nil then
						local var_58_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_9.prefab_name].transform, "story_v_out_114202", "114202014", "story_v_out_114202.awb")

						arg_55_1:RecordAudio("114202014", var_58_15)
						arg_55_1:RecordAudio("114202014", var_58_15)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_114202", "114202014", "story_v_out_114202.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_114202", "114202014", "story_v_out_114202.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_16 = math.max(var_58_7, arg_55_1.talkMaxDuration)

			if var_58_6 <= arg_55_1.time_ and arg_55_1.time_ < var_58_6 + var_58_16 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_6) / var_58_16

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_6 + var_58_16 and arg_55_1.time_ < var_58_6 + var_58_16 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play114202015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 114202015
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play114202016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["10015"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 then
				local var_62_2 = var_62_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_62_2 then
					arg_59_1.var_.alphaOldValue10015 = var_62_2.alpha
					arg_59_1.var_.characterEffect10015 = var_62_2
				end

				arg_59_1.var_.alphaOldValue10015 = 1
			end

			local var_62_3 = 0.5

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_3 then
				local var_62_4 = (arg_59_1.time_ - var_62_1) / var_62_3
				local var_62_5 = Mathf.Lerp(arg_59_1.var_.alphaOldValue10015, 0, var_62_4)

				if arg_59_1.var_.characterEffect10015 then
					arg_59_1.var_.characterEffect10015.alpha = var_62_5
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_3 and arg_59_1.time_ < var_62_1 + var_62_3 + arg_62_0 and arg_59_1.var_.characterEffect10015 then
				arg_59_1.var_.characterEffect10015.alpha = 0
			end

			local var_62_6 = 0
			local var_62_7 = 0.8

			if var_62_6 < arg_59_1.time_ and arg_59_1.time_ <= var_62_6 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, false)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_8 = arg_59_1:GetWordFromCfg(114202015)
				local var_62_9 = arg_59_1:FormatText(var_62_8.content)

				arg_59_1.text_.text = var_62_9

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_10 = 32
				local var_62_11 = utf8.len(var_62_9)
				local var_62_12 = var_62_10 <= 0 and var_62_7 or var_62_7 * (var_62_11 / var_62_10)

				if var_62_12 > 0 and var_62_7 < var_62_12 then
					arg_59_1.talkMaxDuration = var_62_12

					if var_62_12 + var_62_6 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_12 + var_62_6
					end
				end

				arg_59_1.text_.text = var_62_9
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)
				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_13 = math.max(var_62_7, arg_59_1.talkMaxDuration)

			if var_62_6 <= arg_59_1.time_ and arg_59_1.time_ < var_62_6 + var_62_13 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_6) / var_62_13

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_6 + var_62_13 and arg_59_1.time_ < var_62_6 + var_62_13 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play114202016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 114202016
		arg_63_1.duration_ = 5

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play114202017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 0
			local var_66_1 = 1.175

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, false)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_2 = arg_63_1:GetWordFromCfg(114202016)
				local var_66_3 = arg_63_1:FormatText(var_66_2.content)

				arg_63_1.text_.text = var_66_3

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_4 = 47
				local var_66_5 = utf8.len(var_66_3)
				local var_66_6 = var_66_4 <= 0 and var_66_1 or var_66_1 * (var_66_5 / var_66_4)

				if var_66_6 > 0 and var_66_1 < var_66_6 then
					arg_63_1.talkMaxDuration = var_66_6

					if var_66_6 + var_66_0 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_6 + var_66_0
					end
				end

				arg_63_1.text_.text = var_66_3
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)
				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_7 = math.max(var_66_1, arg_63_1.talkMaxDuration)

			if var_66_0 <= arg_63_1.time_ and arg_63_1.time_ < var_66_0 + var_66_7 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_0) / var_66_7

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_0 + var_66_7 and arg_63_1.time_ < var_66_0 + var_66_7 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play114202017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 114202017
		arg_67_1.duration_ = 8.999999999999

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play114202018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = "ST21"

			if arg_67_1.bgs_[var_70_0] == nil then
				local var_70_1 = Object.Instantiate(arg_67_1.paintGo_)

				var_70_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_70_0)
				var_70_1.name = var_70_0
				var_70_1.transform.parent = arg_67_1.stage_.transform
				var_70_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_67_1.bgs_[var_70_0] = var_70_1
			end

			local var_70_2 = 2

			if var_70_2 < arg_67_1.time_ and arg_67_1.time_ <= var_70_2 + arg_70_0 then
				local var_70_3 = manager.ui.mainCamera.transform.localPosition
				local var_70_4 = Vector3.New(0, 0, 10) + Vector3.New(var_70_3.x, var_70_3.y, 0)
				local var_70_5 = arg_67_1.bgs_.ST21

				var_70_5.transform.localPosition = var_70_4
				var_70_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_70_6 = var_70_5:GetComponent("SpriteRenderer")

				if var_70_6 and var_70_6.sprite then
					local var_70_7 = (var_70_5.transform.localPosition - var_70_3).z
					local var_70_8 = manager.ui.mainCameraCom_
					local var_70_9 = 2 * var_70_7 * Mathf.Tan(var_70_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_70_10 = var_70_9 * var_70_8.aspect
					local var_70_11 = var_70_6.sprite.bounds.size.x
					local var_70_12 = var_70_6.sprite.bounds.size.y
					local var_70_13 = var_70_10 / var_70_11
					local var_70_14 = var_70_9 / var_70_12
					local var_70_15 = var_70_14 < var_70_13 and var_70_13 or var_70_14

					var_70_5.transform.localScale = Vector3.New(var_70_15, var_70_15, 0)
				end

				for iter_70_0, iter_70_1 in pairs(arg_67_1.bgs_) do
					if iter_70_0 ~= "ST21" then
						iter_70_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_70_16 = 0

			if var_70_16 < arg_67_1.time_ and arg_67_1.time_ <= var_70_16 + arg_70_0 then
				arg_67_1.mask_.enabled = true
				arg_67_1.mask_.raycastTarget = true

				arg_67_1:SetGaussion(false)
			end

			local var_70_17 = 1.999999999999

			if var_70_16 <= arg_67_1.time_ and arg_67_1.time_ < var_70_16 + var_70_17 then
				local var_70_18 = (arg_67_1.time_ - var_70_16) / var_70_17
				local var_70_19 = Color.New(0, 0, 0)

				var_70_19.a = Mathf.Lerp(0, 1, var_70_18)
				arg_67_1.mask_.color = var_70_19
			end

			if arg_67_1.time_ >= var_70_16 + var_70_17 and arg_67_1.time_ < var_70_16 + var_70_17 + arg_70_0 then
				local var_70_20 = Color.New(0, 0, 0)

				var_70_20.a = 1
				arg_67_1.mask_.color = var_70_20
			end

			local var_70_21 = 1.999999999999

			if var_70_21 < arg_67_1.time_ and arg_67_1.time_ <= var_70_21 + arg_70_0 then
				arg_67_1.mask_.enabled = true
				arg_67_1.mask_.raycastTarget = true

				arg_67_1:SetGaussion(false)
			end

			local var_70_22 = 2

			if var_70_21 <= arg_67_1.time_ and arg_67_1.time_ < var_70_21 + var_70_22 then
				local var_70_23 = (arg_67_1.time_ - var_70_21) / var_70_22
				local var_70_24 = Color.New(0, 0, 0)

				var_70_24.a = Mathf.Lerp(1, 0, var_70_23)
				arg_67_1.mask_.color = var_70_24
			end

			if arg_67_1.time_ >= var_70_21 + var_70_22 and arg_67_1.time_ < var_70_21 + var_70_22 + arg_70_0 then
				local var_70_25 = Color.New(0, 0, 0)
				local var_70_26 = 0

				arg_67_1.mask_.enabled = false
				var_70_25.a = var_70_26
				arg_67_1.mask_.color = var_70_25
			end

			if arg_67_1.frameCnt_ <= 1 then
				arg_67_1.dialog_:SetActive(false)
			end

			local var_70_27 = 3.999999999999
			local var_70_28 = 0.175

			if var_70_27 < arg_67_1.time_ and arg_67_1.time_ <= var_70_27 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0

				arg_67_1.dialog_:SetActive(true)

				local var_70_29 = LeanTween.value(arg_67_1.dialog_, 0, 1, 0.3)

				var_70_29:setOnUpdate(LuaHelper.FloatAction(function(arg_71_0)
					arg_67_1.dialogCg_.alpha = arg_71_0
				end))
				var_70_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_67_1.dialog_)
					var_70_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_67_1.duration_ = arg_67_1.duration_ + 0.3

				SetActive(arg_67_1.leftNameGo_, false)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_30 = arg_67_1:GetWordFromCfg(114202017)
				local var_70_31 = arg_67_1:FormatText(var_70_30.content)

				arg_67_1.text_.text = var_70_31

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_32 = 7
				local var_70_33 = utf8.len(var_70_31)
				local var_70_34 = var_70_32 <= 0 and var_70_28 or var_70_28 * (var_70_33 / var_70_32)

				if var_70_34 > 0 and var_70_28 < var_70_34 then
					arg_67_1.talkMaxDuration = var_70_34
					var_70_27 = var_70_27 + 0.3

					if var_70_34 + var_70_27 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_34 + var_70_27
					end
				end

				arg_67_1.text_.text = var_70_31
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)
				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_35 = var_70_27 + 0.3
			local var_70_36 = math.max(var_70_28, arg_67_1.talkMaxDuration)

			if var_70_35 <= arg_67_1.time_ and arg_67_1.time_ < var_70_35 + var_70_36 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_35) / var_70_36

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_35 + var_70_36 and arg_67_1.time_ < var_70_35 + var_70_36 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play114202018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 114202018
		arg_73_1.duration_ = 6.533

		local var_73_0 = {
			ja = 6.533,
			ko = 5.766,
			zh = 3.866,
			en = 5.666
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
				arg_73_0:Play114202019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["10017"].transform
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 then
				arg_73_1.var_.moveOldPos10017 = var_76_0.localPosition
				var_76_0.localScale = Vector3.New(1, 1, 1)

				arg_73_1:CheckSpriteTmpPos("10017", 2)
			end

			local var_76_2 = 0.001

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_2 then
				local var_76_3 = (arg_73_1.time_ - var_76_1) / var_76_2
				local var_76_4 = Vector3.New(-390, -350, -180)

				var_76_0.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos10017, var_76_4, var_76_3)
			end

			if arg_73_1.time_ >= var_76_1 + var_76_2 and arg_73_1.time_ < var_76_1 + var_76_2 + arg_76_0 then
				var_76_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_76_5 = arg_73_1.actors_["10017"]
			local var_76_6 = 0

			if var_76_6 < arg_73_1.time_ and arg_73_1.time_ <= var_76_6 + arg_76_0 then
				local var_76_7 = var_76_5:GetComponent("Image")

				if var_76_7 then
					arg_73_1.var_.highlightMatValue10017 = var_76_7
				end
			end

			local var_76_8 = 0.034

			if var_76_6 <= arg_73_1.time_ and arg_73_1.time_ < var_76_6 + var_76_8 then
				local var_76_9 = (arg_73_1.time_ - var_76_6) / var_76_8

				if arg_73_1.var_.highlightMatValue10017 then
					local var_76_10 = Mathf.Lerp(0.5, 1, var_76_9)
					local var_76_11 = arg_73_1.var_.highlightMatValue10017
					local var_76_12 = var_76_11.color

					var_76_12.r = var_76_10
					var_76_12.g = var_76_10
					var_76_12.b = var_76_10
					var_76_11.color = var_76_12
				end
			end

			if arg_73_1.time_ >= var_76_6 + var_76_8 and arg_73_1.time_ < var_76_6 + var_76_8 + arg_76_0 and arg_73_1.var_.highlightMatValue10017 then
				local var_76_13 = 1

				var_76_5.transform:SetSiblingIndex(1)

				local var_76_14 = arg_73_1.var_.highlightMatValue10017
				local var_76_15 = var_76_14.color

				var_76_15.r = var_76_13
				var_76_15.g = var_76_13
				var_76_15.b = var_76_13
				var_76_14.color = var_76_15
			end

			local var_76_16 = arg_73_1.actors_["10017"]
			local var_76_17 = 0

			if var_76_17 < arg_73_1.time_ and arg_73_1.time_ <= var_76_17 + arg_76_0 then
				local var_76_18 = var_76_16:GetComponent("Image")

				if var_76_18 then
					arg_73_1.var_.alphaMatValue10017 = var_76_18
					arg_73_1.var_.alphaOldValue10017 = var_76_18.color.a
				end

				arg_73_1.var_.alphaOldValue10017 = 0
			end

			local var_76_19 = 0.5

			if var_76_17 <= arg_73_1.time_ and arg_73_1.time_ < var_76_17 + var_76_19 then
				local var_76_20 = (arg_73_1.time_ - var_76_17) / var_76_19
				local var_76_21 = Mathf.Lerp(arg_73_1.var_.alphaOldValue10017, 1, var_76_20)

				if arg_73_1.var_.alphaMatValue10017 then
					local var_76_22 = arg_73_1.var_.alphaMatValue10017.color

					var_76_22.a = var_76_21
					arg_73_1.var_.alphaMatValue10017.color = var_76_22
				end
			end

			if arg_73_1.time_ >= var_76_17 + var_76_19 and arg_73_1.time_ < var_76_17 + var_76_19 + arg_76_0 and arg_73_1.var_.alphaMatValue10017 then
				local var_76_23 = arg_73_1.var_.alphaMatValue10017
				local var_76_24 = var_76_23.color

				var_76_24.a = 1
				var_76_23.color = var_76_24
			end

			local var_76_25 = 0
			local var_76_26 = 0.4

			if var_76_25 < arg_73_1.time_ and arg_73_1.time_ <= var_76_25 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_27 = arg_73_1:FormatText(StoryNameCfg[255].name)

				arg_73_1.leftNameTxt_.text = var_76_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_28 = arg_73_1:GetWordFromCfg(114202018)
				local var_76_29 = arg_73_1:FormatText(var_76_28.content)

				arg_73_1.text_.text = var_76_29

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_30 = 16
				local var_76_31 = utf8.len(var_76_29)
				local var_76_32 = var_76_30 <= 0 and var_76_26 or var_76_26 * (var_76_31 / var_76_30)

				if var_76_32 > 0 and var_76_26 < var_76_32 then
					arg_73_1.talkMaxDuration = var_76_32

					if var_76_32 + var_76_25 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_32 + var_76_25
					end
				end

				arg_73_1.text_.text = var_76_29
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114202", "114202018", "story_v_out_114202.awb") ~= 0 then
					local var_76_33 = manager.audio:GetVoiceLength("story_v_out_114202", "114202018", "story_v_out_114202.awb") / 1000

					if var_76_33 + var_76_25 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_33 + var_76_25
					end

					if var_76_28.prefab_name ~= "" and arg_73_1.actors_[var_76_28.prefab_name] ~= nil then
						local var_76_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_28.prefab_name].transform, "story_v_out_114202", "114202018", "story_v_out_114202.awb")

						arg_73_1:RecordAudio("114202018", var_76_34)
						arg_73_1:RecordAudio("114202018", var_76_34)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_114202", "114202018", "story_v_out_114202.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_114202", "114202018", "story_v_out_114202.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_35 = math.max(var_76_26, arg_73_1.talkMaxDuration)

			if var_76_25 <= arg_73_1.time_ and arg_73_1.time_ < var_76_25 + var_76_35 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_25) / var_76_35

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_25 + var_76_35 and arg_73_1.time_ < var_76_25 + var_76_35 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play114202019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 114202019
		arg_77_1.duration_ = 7.433

		local var_77_0 = {
			ja = 6.833,
			ko = 7.433,
			zh = 5.033,
			en = 5.266
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
				arg_77_0:Play114202020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["10015"].transform
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 then
				arg_77_1.var_.moveOldPos10015 = var_80_0.localPosition
				var_80_0.localScale = Vector3.New(1, 1, 1)

				arg_77_1:CheckSpriteTmpPos("10015", 4)

				local var_80_2 = var_80_0.childCount

				for iter_80_0 = 0, var_80_2 - 1 do
					local var_80_3 = var_80_0:GetChild(iter_80_0)

					if var_80_3.name == "split_1" or not string.find(var_80_3.name, "split") then
						var_80_3.gameObject:SetActive(true)
					else
						var_80_3.gameObject:SetActive(false)
					end
				end
			end

			local var_80_4 = 0.001

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_4 then
				local var_80_5 = (arg_77_1.time_ - var_80_1) / var_80_4
				local var_80_6 = Vector3.New(390, -350, -180)

				var_80_0.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos10015, var_80_6, var_80_5)
			end

			if arg_77_1.time_ >= var_80_1 + var_80_4 and arg_77_1.time_ < var_80_1 + var_80_4 + arg_80_0 then
				var_80_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_80_7 = arg_77_1.actors_["10017"]
			local var_80_8 = 0

			if var_80_8 < arg_77_1.time_ and arg_77_1.time_ <= var_80_8 + arg_80_0 then
				local var_80_9 = var_80_7:GetComponent("Image")

				if var_80_9 then
					arg_77_1.var_.highlightMatValue10017 = var_80_9
				end
			end

			local var_80_10 = 0.034

			if var_80_8 <= arg_77_1.time_ and arg_77_1.time_ < var_80_8 + var_80_10 then
				local var_80_11 = (arg_77_1.time_ - var_80_8) / var_80_10

				if arg_77_1.var_.highlightMatValue10017 then
					local var_80_12 = Mathf.Lerp(1, 0.5, var_80_11)
					local var_80_13 = arg_77_1.var_.highlightMatValue10017
					local var_80_14 = var_80_13.color

					var_80_14.r = var_80_12
					var_80_14.g = var_80_12
					var_80_14.b = var_80_12
					var_80_13.color = var_80_14
				end
			end

			if arg_77_1.time_ >= var_80_8 + var_80_10 and arg_77_1.time_ < var_80_8 + var_80_10 + arg_80_0 and arg_77_1.var_.highlightMatValue10017 then
				local var_80_15 = 0.5
				local var_80_16 = arg_77_1.var_.highlightMatValue10017
				local var_80_17 = var_80_16.color

				var_80_17.r = var_80_15
				var_80_17.g = var_80_15
				var_80_17.b = var_80_15
				var_80_16.color = var_80_17
			end

			local var_80_18 = arg_77_1.actors_["10015"]
			local var_80_19 = 0

			if var_80_19 < arg_77_1.time_ and arg_77_1.time_ <= var_80_19 + arg_80_0 and arg_77_1.var_.actorSpriteComps10015 == nil then
				arg_77_1.var_.actorSpriteComps10015 = var_80_18:GetComponentsInChildren(typeof(Image), true)
			end

			local var_80_20 = 0.034

			if var_80_19 <= arg_77_1.time_ and arg_77_1.time_ < var_80_19 + var_80_20 then
				local var_80_21 = (arg_77_1.time_ - var_80_19) / var_80_20

				if arg_77_1.var_.actorSpriteComps10015 then
					for iter_80_1, iter_80_2 in pairs(arg_77_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_80_2 then
							local var_80_22 = Mathf.Lerp(iter_80_2.color.r, 1, var_80_21)

							iter_80_2.color = Color.New(var_80_22, var_80_22, var_80_22)
						end
					end
				end
			end

			if arg_77_1.time_ >= var_80_19 + var_80_20 and arg_77_1.time_ < var_80_19 + var_80_20 + arg_80_0 and arg_77_1.var_.actorSpriteComps10015 then
				local var_80_23 = 1

				for iter_80_3, iter_80_4 in pairs(arg_77_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_80_4 then
						iter_80_4.color = Color.New(var_80_23, var_80_23, var_80_23)
					end
				end

				arg_77_1.var_.actorSpriteComps10015 = nil
			end

			local var_80_24 = arg_77_1.actors_["10015"]
			local var_80_25 = 0

			if var_80_25 < arg_77_1.time_ and arg_77_1.time_ <= var_80_25 + arg_80_0 then
				local var_80_26 = var_80_24:GetComponentInChildren(typeof(CanvasGroup))

				if var_80_26 then
					arg_77_1.var_.alphaOldValue10015 = var_80_26.alpha
					arg_77_1.var_.characterEffect10015 = var_80_26
				end

				arg_77_1.var_.alphaOldValue10015 = 0
			end

			local var_80_27 = 0.5

			if var_80_25 <= arg_77_1.time_ and arg_77_1.time_ < var_80_25 + var_80_27 then
				local var_80_28 = (arg_77_1.time_ - var_80_25) / var_80_27
				local var_80_29 = Mathf.Lerp(arg_77_1.var_.alphaOldValue10015, 1, var_80_28)

				if arg_77_1.var_.characterEffect10015 then
					arg_77_1.var_.characterEffect10015.alpha = var_80_29
				end
			end

			if arg_77_1.time_ >= var_80_25 + var_80_27 and arg_77_1.time_ < var_80_25 + var_80_27 + arg_80_0 and arg_77_1.var_.characterEffect10015 then
				arg_77_1.var_.characterEffect10015.alpha = 1
			end

			local var_80_30 = 0
			local var_80_31 = 0.6

			if var_80_30 < arg_77_1.time_ and arg_77_1.time_ <= var_80_30 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_32 = arg_77_1:FormatText(StoryNameCfg[208].name)

				arg_77_1.leftNameTxt_.text = var_80_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_33 = arg_77_1:GetWordFromCfg(114202019)
				local var_80_34 = arg_77_1:FormatText(var_80_33.content)

				arg_77_1.text_.text = var_80_34

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_35 = 24
				local var_80_36 = utf8.len(var_80_34)
				local var_80_37 = var_80_35 <= 0 and var_80_31 or var_80_31 * (var_80_36 / var_80_35)

				if var_80_37 > 0 and var_80_31 < var_80_37 then
					arg_77_1.talkMaxDuration = var_80_37

					if var_80_37 + var_80_30 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_37 + var_80_30
					end
				end

				arg_77_1.text_.text = var_80_34
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114202", "114202019", "story_v_out_114202.awb") ~= 0 then
					local var_80_38 = manager.audio:GetVoiceLength("story_v_out_114202", "114202019", "story_v_out_114202.awb") / 1000

					if var_80_38 + var_80_30 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_38 + var_80_30
					end

					if var_80_33.prefab_name ~= "" and arg_77_1.actors_[var_80_33.prefab_name] ~= nil then
						local var_80_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_33.prefab_name].transform, "story_v_out_114202", "114202019", "story_v_out_114202.awb")

						arg_77_1:RecordAudio("114202019", var_80_39)
						arg_77_1:RecordAudio("114202019", var_80_39)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_114202", "114202019", "story_v_out_114202.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_114202", "114202019", "story_v_out_114202.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_40 = math.max(var_80_31, arg_77_1.talkMaxDuration)

			if var_80_30 <= arg_77_1.time_ and arg_77_1.time_ < var_80_30 + var_80_40 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_30) / var_80_40

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_30 + var_80_40 and arg_77_1.time_ < var_80_30 + var_80_40 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play114202020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 114202020
		arg_81_1.duration_ = 7.633

		local var_81_0 = {
			ja = 7.633,
			ko = 3.833,
			zh = 2.933,
			en = 4.3
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
				arg_81_0:Play114202021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["10017"]
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 then
				local var_84_2 = var_84_0:GetComponent("Image")

				if var_84_2 then
					arg_81_1.var_.highlightMatValue10017 = var_84_2
				end
			end

			local var_84_3 = 0.034

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_3 then
				local var_84_4 = (arg_81_1.time_ - var_84_1) / var_84_3

				if arg_81_1.var_.highlightMatValue10017 then
					local var_84_5 = Mathf.Lerp(0.5, 1, var_84_4)
					local var_84_6 = arg_81_1.var_.highlightMatValue10017
					local var_84_7 = var_84_6.color

					var_84_7.r = var_84_5
					var_84_7.g = var_84_5
					var_84_7.b = var_84_5
					var_84_6.color = var_84_7
				end
			end

			if arg_81_1.time_ >= var_84_1 + var_84_3 and arg_81_1.time_ < var_84_1 + var_84_3 + arg_84_0 and arg_81_1.var_.highlightMatValue10017 then
				local var_84_8 = 1

				var_84_0.transform:SetSiblingIndex(1)

				local var_84_9 = arg_81_1.var_.highlightMatValue10017
				local var_84_10 = var_84_9.color

				var_84_10.r = var_84_8
				var_84_10.g = var_84_8
				var_84_10.b = var_84_8
				var_84_9.color = var_84_10
			end

			local var_84_11 = arg_81_1.actors_["10015"]
			local var_84_12 = 0

			if var_84_12 < arg_81_1.time_ and arg_81_1.time_ <= var_84_12 + arg_84_0 and arg_81_1.var_.actorSpriteComps10015 == nil then
				arg_81_1.var_.actorSpriteComps10015 = var_84_11:GetComponentsInChildren(typeof(Image), true)
			end

			local var_84_13 = 0.034

			if var_84_12 <= arg_81_1.time_ and arg_81_1.time_ < var_84_12 + var_84_13 then
				local var_84_14 = (arg_81_1.time_ - var_84_12) / var_84_13

				if arg_81_1.var_.actorSpriteComps10015 then
					for iter_84_0, iter_84_1 in pairs(arg_81_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_84_1 then
							local var_84_15 = Mathf.Lerp(iter_84_1.color.r, 0.5, var_84_14)

							iter_84_1.color = Color.New(var_84_15, var_84_15, var_84_15)
						end
					end
				end
			end

			if arg_81_1.time_ >= var_84_12 + var_84_13 and arg_81_1.time_ < var_84_12 + var_84_13 + arg_84_0 and arg_81_1.var_.actorSpriteComps10015 then
				local var_84_16 = 0.5

				for iter_84_2, iter_84_3 in pairs(arg_81_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_84_3 then
						iter_84_3.color = Color.New(var_84_16, var_84_16, var_84_16)
					end
				end

				arg_81_1.var_.actorSpriteComps10015 = nil
			end

			local var_84_17 = 0
			local var_84_18 = 0.35

			if var_84_17 < arg_81_1.time_ and arg_81_1.time_ <= var_84_17 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_19 = arg_81_1:FormatText(StoryNameCfg[255].name)

				arg_81_1.leftNameTxt_.text = var_84_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_20 = arg_81_1:GetWordFromCfg(114202020)
				local var_84_21 = arg_81_1:FormatText(var_84_20.content)

				arg_81_1.text_.text = var_84_21

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_22 = 14
				local var_84_23 = utf8.len(var_84_21)
				local var_84_24 = var_84_22 <= 0 and var_84_18 or var_84_18 * (var_84_23 / var_84_22)

				if var_84_24 > 0 and var_84_18 < var_84_24 then
					arg_81_1.talkMaxDuration = var_84_24

					if var_84_24 + var_84_17 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_24 + var_84_17
					end
				end

				arg_81_1.text_.text = var_84_21
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114202", "114202020", "story_v_out_114202.awb") ~= 0 then
					local var_84_25 = manager.audio:GetVoiceLength("story_v_out_114202", "114202020", "story_v_out_114202.awb") / 1000

					if var_84_25 + var_84_17 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_25 + var_84_17
					end

					if var_84_20.prefab_name ~= "" and arg_81_1.actors_[var_84_20.prefab_name] ~= nil then
						local var_84_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_20.prefab_name].transform, "story_v_out_114202", "114202020", "story_v_out_114202.awb")

						arg_81_1:RecordAudio("114202020", var_84_26)
						arg_81_1:RecordAudio("114202020", var_84_26)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_114202", "114202020", "story_v_out_114202.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_114202", "114202020", "story_v_out_114202.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_27 = math.max(var_84_18, arg_81_1.talkMaxDuration)

			if var_84_17 <= arg_81_1.time_ and arg_81_1.time_ < var_84_17 + var_84_27 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_17) / var_84_27

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_17 + var_84_27 and arg_81_1.time_ < var_84_17 + var_84_27 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play114202021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 114202021
		arg_85_1.duration_ = 7.366

		local var_85_0 = {
			ja = 7.366,
			ko = 6.733,
			zh = 5.566,
			en = 5.9
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
				arg_85_0:Play114202022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = arg_85_1.actors_["10017"]
			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 then
				local var_88_2 = var_88_0:GetComponent("Image")

				if var_88_2 then
					arg_85_1.var_.highlightMatValue10017 = var_88_2
				end
			end

			local var_88_3 = 0.034

			if var_88_1 <= arg_85_1.time_ and arg_85_1.time_ < var_88_1 + var_88_3 then
				local var_88_4 = (arg_85_1.time_ - var_88_1) / var_88_3

				if arg_85_1.var_.highlightMatValue10017 then
					local var_88_5 = Mathf.Lerp(1, 0.5, var_88_4)
					local var_88_6 = arg_85_1.var_.highlightMatValue10017
					local var_88_7 = var_88_6.color

					var_88_7.r = var_88_5
					var_88_7.g = var_88_5
					var_88_7.b = var_88_5
					var_88_6.color = var_88_7
				end
			end

			if arg_85_1.time_ >= var_88_1 + var_88_3 and arg_85_1.time_ < var_88_1 + var_88_3 + arg_88_0 and arg_85_1.var_.highlightMatValue10017 then
				local var_88_8 = 0.5
				local var_88_9 = arg_85_1.var_.highlightMatValue10017
				local var_88_10 = var_88_9.color

				var_88_10.r = var_88_8
				var_88_10.g = var_88_8
				var_88_10.b = var_88_8
				var_88_9.color = var_88_10
			end

			local var_88_11 = arg_85_1.actors_["10015"]
			local var_88_12 = 0

			if var_88_12 < arg_85_1.time_ and arg_85_1.time_ <= var_88_12 + arg_88_0 and arg_85_1.var_.actorSpriteComps10015 == nil then
				arg_85_1.var_.actorSpriteComps10015 = var_88_11:GetComponentsInChildren(typeof(Image), true)
			end

			local var_88_13 = 0.034

			if var_88_12 <= arg_85_1.time_ and arg_85_1.time_ < var_88_12 + var_88_13 then
				local var_88_14 = (arg_85_1.time_ - var_88_12) / var_88_13

				if arg_85_1.var_.actorSpriteComps10015 then
					for iter_88_0, iter_88_1 in pairs(arg_85_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_88_1 then
							local var_88_15 = Mathf.Lerp(iter_88_1.color.r, 1, var_88_14)

							iter_88_1.color = Color.New(var_88_15, var_88_15, var_88_15)
						end
					end
				end
			end

			if arg_85_1.time_ >= var_88_12 + var_88_13 and arg_85_1.time_ < var_88_12 + var_88_13 + arg_88_0 and arg_85_1.var_.actorSpriteComps10015 then
				local var_88_16 = 1

				for iter_88_2, iter_88_3 in pairs(arg_85_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_88_3 then
						iter_88_3.color = Color.New(var_88_16, var_88_16, var_88_16)
					end
				end

				arg_85_1.var_.actorSpriteComps10015 = nil
			end

			local var_88_17 = 0
			local var_88_18 = 0.625

			if var_88_17 < arg_85_1.time_ and arg_85_1.time_ <= var_88_17 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_19 = arg_85_1:FormatText(StoryNameCfg[208].name)

				arg_85_1.leftNameTxt_.text = var_88_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_20 = arg_85_1:GetWordFromCfg(114202021)
				local var_88_21 = arg_85_1:FormatText(var_88_20.content)

				arg_85_1.text_.text = var_88_21

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_22 = 25
				local var_88_23 = utf8.len(var_88_21)
				local var_88_24 = var_88_22 <= 0 and var_88_18 or var_88_18 * (var_88_23 / var_88_22)

				if var_88_24 > 0 and var_88_18 < var_88_24 then
					arg_85_1.talkMaxDuration = var_88_24

					if var_88_24 + var_88_17 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_24 + var_88_17
					end
				end

				arg_85_1.text_.text = var_88_21
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114202", "114202021", "story_v_out_114202.awb") ~= 0 then
					local var_88_25 = manager.audio:GetVoiceLength("story_v_out_114202", "114202021", "story_v_out_114202.awb") / 1000

					if var_88_25 + var_88_17 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_25 + var_88_17
					end

					if var_88_20.prefab_name ~= "" and arg_85_1.actors_[var_88_20.prefab_name] ~= nil then
						local var_88_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_20.prefab_name].transform, "story_v_out_114202", "114202021", "story_v_out_114202.awb")

						arg_85_1:RecordAudio("114202021", var_88_26)
						arg_85_1:RecordAudio("114202021", var_88_26)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_114202", "114202021", "story_v_out_114202.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_114202", "114202021", "story_v_out_114202.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_27 = math.max(var_88_18, arg_85_1.talkMaxDuration)

			if var_88_17 <= arg_85_1.time_ and arg_85_1.time_ < var_88_17 + var_88_27 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_17) / var_88_27

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_17 + var_88_27 and arg_85_1.time_ < var_88_17 + var_88_27 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play114202022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 114202022
		arg_89_1.duration_ = 5

		SetActive(arg_89_1.tipsGo_, false)

		function arg_89_1.onSingleLineFinish_()
			arg_89_1.onSingleLineUpdate_ = nil
			arg_89_1.onSingleLineFinish_ = nil
			arg_89_1.state_ = "waiting"
		end

		function arg_89_1.playNext_(arg_91_0)
			if arg_91_0 == 1 then
				arg_89_0:Play114202023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["10015"]
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 and arg_89_1.var_.actorSpriteComps10015 == nil then
				arg_89_1.var_.actorSpriteComps10015 = var_92_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_92_2 = 0.034

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / var_92_2

				if arg_89_1.var_.actorSpriteComps10015 then
					for iter_92_0, iter_92_1 in pairs(arg_89_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_92_1 then
							local var_92_4 = Mathf.Lerp(iter_92_1.color.r, 0.5, var_92_3)

							iter_92_1.color = Color.New(var_92_4, var_92_4, var_92_4)
						end
					end
				end
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 and arg_89_1.var_.actorSpriteComps10015 then
				local var_92_5 = 0.5

				for iter_92_2, iter_92_3 in pairs(arg_89_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_92_3 then
						iter_92_3.color = Color.New(var_92_5, var_92_5, var_92_5)
					end
				end

				arg_89_1.var_.actorSpriteComps10015 = nil
			end

			local var_92_6 = 0
			local var_92_7 = 1.35

			if var_92_6 < arg_89_1.time_ and arg_89_1.time_ <= var_92_6 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, false)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_8 = arg_89_1:GetWordFromCfg(114202022)
				local var_92_9 = arg_89_1:FormatText(var_92_8.content)

				arg_89_1.text_.text = var_92_9

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_10 = 54
				local var_92_11 = utf8.len(var_92_9)
				local var_92_12 = var_92_10 <= 0 and var_92_7 or var_92_7 * (var_92_11 / var_92_10)

				if var_92_12 > 0 and var_92_7 < var_92_12 then
					arg_89_1.talkMaxDuration = var_92_12

					if var_92_12 + var_92_6 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_12 + var_92_6
					end
				end

				arg_89_1.text_.text = var_92_9
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)
				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_13 = math.max(var_92_7, arg_89_1.talkMaxDuration)

			if var_92_6 <= arg_89_1.time_ and arg_89_1.time_ < var_92_6 + var_92_13 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_6) / var_92_13

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_6 + var_92_13 and arg_89_1.time_ < var_92_6 + var_92_13 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play114202023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 114202023
		arg_93_1.duration_ = 5

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play114202024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = 0
			local var_96_1 = 0.875

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

				local var_96_2 = arg_93_1:GetWordFromCfg(114202023)
				local var_96_3 = arg_93_1:FormatText(var_96_2.content)

				arg_93_1.text_.text = var_96_3

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_4 = 35
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
	Play114202024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 114202024
		arg_97_1.duration_ = 5

		SetActive(arg_97_1.tipsGo_, false)

		function arg_97_1.onSingleLineFinish_()
			arg_97_1.onSingleLineUpdate_ = nil
			arg_97_1.onSingleLineFinish_ = nil
			arg_97_1.state_ = "waiting"
		end

		function arg_97_1.playNext_(arg_99_0)
			if arg_99_0 == 1 then
				arg_97_0:Play114202025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = 0
			local var_100_1 = 0.7

			if var_100_0 < arg_97_1.time_ and arg_97_1.time_ <= var_100_0 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, false)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_2 = arg_97_1:GetWordFromCfg(114202024)
				local var_100_3 = arg_97_1:FormatText(var_100_2.content)

				arg_97_1.text_.text = var_100_3

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_4 = 28
				local var_100_5 = utf8.len(var_100_3)
				local var_100_6 = var_100_4 <= 0 and var_100_1 or var_100_1 * (var_100_5 / var_100_4)

				if var_100_6 > 0 and var_100_1 < var_100_6 then
					arg_97_1.talkMaxDuration = var_100_6

					if var_100_6 + var_100_0 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_6 + var_100_0
					end
				end

				arg_97_1.text_.text = var_100_3
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)
				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_7 = math.max(var_100_1, arg_97_1.talkMaxDuration)

			if var_100_0 <= arg_97_1.time_ and arg_97_1.time_ < var_100_0 + var_100_7 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_0) / var_100_7

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_0 + var_100_7 and arg_97_1.time_ < var_100_0 + var_100_7 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play114202025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 114202025
		arg_101_1.duration_ = 5

		SetActive(arg_101_1.tipsGo_, false)

		function arg_101_1.onSingleLineFinish_()
			arg_101_1.onSingleLineUpdate_ = nil
			arg_101_1.onSingleLineFinish_ = nil
			arg_101_1.state_ = "waiting"
		end

		function arg_101_1.playNext_(arg_103_0)
			if arg_103_0 == 1 then
				arg_101_0:Play114202026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = 0
			local var_104_1 = 0.225

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

				local var_104_2 = arg_101_1:GetWordFromCfg(114202025)
				local var_104_3 = arg_101_1:FormatText(var_104_2.content)

				arg_101_1.text_.text = var_104_3

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_4 = 9
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
	Play114202026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 114202026
		arg_105_1.duration_ = 7.733

		local var_105_0 = {
			ja = 4.2,
			ko = 5.666,
			zh = 7.733,
			en = 5.333
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
				arg_105_0:Play114202027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["10017"]
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 then
				local var_108_2 = var_108_0:GetComponent("Image")

				if var_108_2 then
					arg_105_1.var_.highlightMatValue10017 = var_108_2
				end
			end

			local var_108_3 = 0.034

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_3 then
				local var_108_4 = (arg_105_1.time_ - var_108_1) / var_108_3

				if arg_105_1.var_.highlightMatValue10017 then
					local var_108_5 = Mathf.Lerp(0.5, 1, var_108_4)
					local var_108_6 = arg_105_1.var_.highlightMatValue10017
					local var_108_7 = var_108_6.color

					var_108_7.r = var_108_5
					var_108_7.g = var_108_5
					var_108_7.b = var_108_5
					var_108_6.color = var_108_7
				end
			end

			if arg_105_1.time_ >= var_108_1 + var_108_3 and arg_105_1.time_ < var_108_1 + var_108_3 + arg_108_0 and arg_105_1.var_.highlightMatValue10017 then
				local var_108_8 = 1

				var_108_0.transform:SetSiblingIndex(1)

				local var_108_9 = arg_105_1.var_.highlightMatValue10017
				local var_108_10 = var_108_9.color

				var_108_10.r = var_108_8
				var_108_10.g = var_108_8
				var_108_10.b = var_108_8
				var_108_9.color = var_108_10
			end

			local var_108_11 = 0
			local var_108_12 = 0.7

			if var_108_11 < arg_105_1.time_ and arg_105_1.time_ <= var_108_11 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_13 = arg_105_1:FormatText(StoryNameCfg[255].name)

				arg_105_1.leftNameTxt_.text = var_108_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_14 = arg_105_1:GetWordFromCfg(114202026)
				local var_108_15 = arg_105_1:FormatText(var_108_14.content)

				arg_105_1.text_.text = var_108_15

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_16 = 28
				local var_108_17 = utf8.len(var_108_15)
				local var_108_18 = var_108_16 <= 0 and var_108_12 or var_108_12 * (var_108_17 / var_108_16)

				if var_108_18 > 0 and var_108_12 < var_108_18 then
					arg_105_1.talkMaxDuration = var_108_18

					if var_108_18 + var_108_11 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_18 + var_108_11
					end
				end

				arg_105_1.text_.text = var_108_15
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114202", "114202026", "story_v_out_114202.awb") ~= 0 then
					local var_108_19 = manager.audio:GetVoiceLength("story_v_out_114202", "114202026", "story_v_out_114202.awb") / 1000

					if var_108_19 + var_108_11 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_19 + var_108_11
					end

					if var_108_14.prefab_name ~= "" and arg_105_1.actors_[var_108_14.prefab_name] ~= nil then
						local var_108_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_14.prefab_name].transform, "story_v_out_114202", "114202026", "story_v_out_114202.awb")

						arg_105_1:RecordAudio("114202026", var_108_20)
						arg_105_1:RecordAudio("114202026", var_108_20)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_114202", "114202026", "story_v_out_114202.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_114202", "114202026", "story_v_out_114202.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_21 = math.max(var_108_12, arg_105_1.talkMaxDuration)

			if var_108_11 <= arg_105_1.time_ and arg_105_1.time_ < var_108_11 + var_108_21 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_11) / var_108_21

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_11 + var_108_21 and arg_105_1.time_ < var_108_11 + var_108_21 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play114202027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 114202027
		arg_109_1.duration_ = 5.933

		local var_109_0 = {
			ja = 5.933,
			ko = 3.633,
			zh = 3.366,
			en = 3.8
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
				arg_109_0:Play114202028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 0
			local var_112_1 = 0.45

			if var_112_0 < arg_109_1.time_ and arg_109_1.time_ <= var_112_0 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_2 = arg_109_1:FormatText(StoryNameCfg[255].name)

				arg_109_1.leftNameTxt_.text = var_112_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_3 = arg_109_1:GetWordFromCfg(114202027)
				local var_112_4 = arg_109_1:FormatText(var_112_3.content)

				arg_109_1.text_.text = var_112_4

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_5 = 18
				local var_112_6 = utf8.len(var_112_4)
				local var_112_7 = var_112_5 <= 0 and var_112_1 or var_112_1 * (var_112_6 / var_112_5)

				if var_112_7 > 0 and var_112_1 < var_112_7 then
					arg_109_1.talkMaxDuration = var_112_7

					if var_112_7 + var_112_0 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_7 + var_112_0
					end
				end

				arg_109_1.text_.text = var_112_4
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114202", "114202027", "story_v_out_114202.awb") ~= 0 then
					local var_112_8 = manager.audio:GetVoiceLength("story_v_out_114202", "114202027", "story_v_out_114202.awb") / 1000

					if var_112_8 + var_112_0 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_8 + var_112_0
					end

					if var_112_3.prefab_name ~= "" and arg_109_1.actors_[var_112_3.prefab_name] ~= nil then
						local var_112_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_3.prefab_name].transform, "story_v_out_114202", "114202027", "story_v_out_114202.awb")

						arg_109_1:RecordAudio("114202027", var_112_9)
						arg_109_1:RecordAudio("114202027", var_112_9)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_114202", "114202027", "story_v_out_114202.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_114202", "114202027", "story_v_out_114202.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_10 = math.max(var_112_1, arg_109_1.talkMaxDuration)

			if var_112_0 <= arg_109_1.time_ and arg_109_1.time_ < var_112_0 + var_112_10 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_0) / var_112_10

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_0 + var_112_10 and arg_109_1.time_ < var_112_0 + var_112_10 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play114202028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 114202028
		arg_113_1.duration_ = 11.166

		local var_113_0 = {
			ja = 9.5,
			ko = 8.666,
			zh = 7.3,
			en = 11.166
		}
		local var_113_1 = manager.audio:GetLocalizationFlag()

		if var_113_0[var_113_1] ~= nil then
			arg_113_1.duration_ = var_113_0[var_113_1]
		end

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play114202029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0
			local var_116_1 = 0.85

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_2 = arg_113_1:FormatText(StoryNameCfg[255].name)

				arg_113_1.leftNameTxt_.text = var_116_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_3 = arg_113_1:GetWordFromCfg(114202028)
				local var_116_4 = arg_113_1:FormatText(var_116_3.content)

				arg_113_1.text_.text = var_116_4

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_5 = 34
				local var_116_6 = utf8.len(var_116_4)
				local var_116_7 = var_116_5 <= 0 and var_116_1 or var_116_1 * (var_116_6 / var_116_5)

				if var_116_7 > 0 and var_116_1 < var_116_7 then
					arg_113_1.talkMaxDuration = var_116_7

					if var_116_7 + var_116_0 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_7 + var_116_0
					end
				end

				arg_113_1.text_.text = var_116_4
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114202", "114202028", "story_v_out_114202.awb") ~= 0 then
					local var_116_8 = manager.audio:GetVoiceLength("story_v_out_114202", "114202028", "story_v_out_114202.awb") / 1000

					if var_116_8 + var_116_0 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_8 + var_116_0
					end

					if var_116_3.prefab_name ~= "" and arg_113_1.actors_[var_116_3.prefab_name] ~= nil then
						local var_116_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_3.prefab_name].transform, "story_v_out_114202", "114202028", "story_v_out_114202.awb")

						arg_113_1:RecordAudio("114202028", var_116_9)
						arg_113_1:RecordAudio("114202028", var_116_9)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_114202", "114202028", "story_v_out_114202.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_114202", "114202028", "story_v_out_114202.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_10 = math.max(var_116_1, arg_113_1.talkMaxDuration)

			if var_116_0 <= arg_113_1.time_ and arg_113_1.time_ < var_116_0 + var_116_10 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_0) / var_116_10

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_0 + var_116_10 and arg_113_1.time_ < var_116_0 + var_116_10 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play114202029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 114202029
		arg_117_1.duration_ = 10.6

		local var_117_0 = {
			ja = 8.666,
			ko = 8.9,
			zh = 9.166,
			en = 10.6
		}
		local var_117_1 = manager.audio:GetLocalizationFlag()

		if var_117_0[var_117_1] ~= nil then
			arg_117_1.duration_ = var_117_0[var_117_1]
		end

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play114202030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["10017"]
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 then
				local var_120_2 = var_120_0:GetComponent("Image")

				if var_120_2 then
					arg_117_1.var_.highlightMatValue10017 = var_120_2
				end
			end

			local var_120_3 = 0.034

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_3 then
				local var_120_4 = (arg_117_1.time_ - var_120_1) / var_120_3

				if arg_117_1.var_.highlightMatValue10017 then
					local var_120_5 = Mathf.Lerp(1, 0.5, var_120_4)
					local var_120_6 = arg_117_1.var_.highlightMatValue10017
					local var_120_7 = var_120_6.color

					var_120_7.r = var_120_5
					var_120_7.g = var_120_5
					var_120_7.b = var_120_5
					var_120_6.color = var_120_7
				end
			end

			if arg_117_1.time_ >= var_120_1 + var_120_3 and arg_117_1.time_ < var_120_1 + var_120_3 + arg_120_0 and arg_117_1.var_.highlightMatValue10017 then
				local var_120_8 = 0.5
				local var_120_9 = arg_117_1.var_.highlightMatValue10017
				local var_120_10 = var_120_9.color

				var_120_10.r = var_120_8
				var_120_10.g = var_120_8
				var_120_10.b = var_120_8
				var_120_9.color = var_120_10
			end

			local var_120_11 = arg_117_1.actors_["10015"]
			local var_120_12 = 0

			if var_120_12 < arg_117_1.time_ and arg_117_1.time_ <= var_120_12 + arg_120_0 and arg_117_1.var_.actorSpriteComps10015 == nil then
				arg_117_1.var_.actorSpriteComps10015 = var_120_11:GetComponentsInChildren(typeof(Image), true)
			end

			local var_120_13 = 0.034

			if var_120_12 <= arg_117_1.time_ and arg_117_1.time_ < var_120_12 + var_120_13 then
				local var_120_14 = (arg_117_1.time_ - var_120_12) / var_120_13

				if arg_117_1.var_.actorSpriteComps10015 then
					for iter_120_0, iter_120_1 in pairs(arg_117_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_120_1 then
							local var_120_15 = Mathf.Lerp(iter_120_1.color.r, 1, var_120_14)

							iter_120_1.color = Color.New(var_120_15, var_120_15, var_120_15)
						end
					end
				end
			end

			if arg_117_1.time_ >= var_120_12 + var_120_13 and arg_117_1.time_ < var_120_12 + var_120_13 + arg_120_0 and arg_117_1.var_.actorSpriteComps10015 then
				local var_120_16 = 1

				for iter_120_2, iter_120_3 in pairs(arg_117_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_120_3 then
						iter_120_3.color = Color.New(var_120_16, var_120_16, var_120_16)
					end
				end

				arg_117_1.var_.actorSpriteComps10015 = nil
			end

			local var_120_17 = 0
			local var_120_18 = 1.025

			if var_120_17 < arg_117_1.time_ and arg_117_1.time_ <= var_120_17 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_19 = arg_117_1:FormatText(StoryNameCfg[208].name)

				arg_117_1.leftNameTxt_.text = var_120_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_20 = arg_117_1:GetWordFromCfg(114202029)
				local var_120_21 = arg_117_1:FormatText(var_120_20.content)

				arg_117_1.text_.text = var_120_21

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_22 = 41
				local var_120_23 = utf8.len(var_120_21)
				local var_120_24 = var_120_22 <= 0 and var_120_18 or var_120_18 * (var_120_23 / var_120_22)

				if var_120_24 > 0 and var_120_18 < var_120_24 then
					arg_117_1.talkMaxDuration = var_120_24

					if var_120_24 + var_120_17 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_24 + var_120_17
					end
				end

				arg_117_1.text_.text = var_120_21
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114202", "114202029", "story_v_out_114202.awb") ~= 0 then
					local var_120_25 = manager.audio:GetVoiceLength("story_v_out_114202", "114202029", "story_v_out_114202.awb") / 1000

					if var_120_25 + var_120_17 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_25 + var_120_17
					end

					if var_120_20.prefab_name ~= "" and arg_117_1.actors_[var_120_20.prefab_name] ~= nil then
						local var_120_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_20.prefab_name].transform, "story_v_out_114202", "114202029", "story_v_out_114202.awb")

						arg_117_1:RecordAudio("114202029", var_120_26)
						arg_117_1:RecordAudio("114202029", var_120_26)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_114202", "114202029", "story_v_out_114202.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_114202", "114202029", "story_v_out_114202.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_27 = math.max(var_120_18, arg_117_1.talkMaxDuration)

			if var_120_17 <= arg_117_1.time_ and arg_117_1.time_ < var_120_17 + var_120_27 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_17) / var_120_27

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_17 + var_120_27 and arg_117_1.time_ < var_120_17 + var_120_27 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play114202030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 114202030
		arg_121_1.duration_ = 5

		SetActive(arg_121_1.tipsGo_, false)

		function arg_121_1.onSingleLineFinish_()
			arg_121_1.onSingleLineUpdate_ = nil
			arg_121_1.onSingleLineFinish_ = nil
			arg_121_1.state_ = "waiting"
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play114202031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["10015"]
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 then
				local var_124_2 = var_124_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_124_2 then
					arg_121_1.var_.alphaOldValue10015 = var_124_2.alpha
					arg_121_1.var_.characterEffect10015 = var_124_2
				end

				arg_121_1.var_.alphaOldValue10015 = 1
			end

			local var_124_3 = 0.5

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_3 then
				local var_124_4 = (arg_121_1.time_ - var_124_1) / var_124_3
				local var_124_5 = Mathf.Lerp(arg_121_1.var_.alphaOldValue10015, 0, var_124_4)

				if arg_121_1.var_.characterEffect10015 then
					arg_121_1.var_.characterEffect10015.alpha = var_124_5
				end
			end

			if arg_121_1.time_ >= var_124_1 + var_124_3 and arg_121_1.time_ < var_124_1 + var_124_3 + arg_124_0 and arg_121_1.var_.characterEffect10015 then
				arg_121_1.var_.characterEffect10015.alpha = 0
			end

			local var_124_6 = arg_121_1.actors_["10017"]
			local var_124_7 = 0

			if var_124_7 < arg_121_1.time_ and arg_121_1.time_ <= var_124_7 + arg_124_0 then
				local var_124_8 = var_124_6:GetComponent("Image")

				if var_124_8 then
					arg_121_1.var_.alphaMatValue10017 = var_124_8
					arg_121_1.var_.alphaOldValue10017 = var_124_8.color.a
				end

				arg_121_1.var_.alphaOldValue10017 = 1
			end

			local var_124_9 = 0.5

			if var_124_7 <= arg_121_1.time_ and arg_121_1.time_ < var_124_7 + var_124_9 then
				local var_124_10 = (arg_121_1.time_ - var_124_7) / var_124_9
				local var_124_11 = Mathf.Lerp(arg_121_1.var_.alphaOldValue10017, 0, var_124_10)

				if arg_121_1.var_.alphaMatValue10017 then
					local var_124_12 = arg_121_1.var_.alphaMatValue10017.color

					var_124_12.a = var_124_11
					arg_121_1.var_.alphaMatValue10017.color = var_124_12
				end
			end

			if arg_121_1.time_ >= var_124_7 + var_124_9 and arg_121_1.time_ < var_124_7 + var_124_9 + arg_124_0 and arg_121_1.var_.alphaMatValue10017 then
				local var_124_13 = arg_121_1.var_.alphaMatValue10017
				local var_124_14 = var_124_13.color

				var_124_14.a = 0
				var_124_13.color = var_124_14
			end

			local var_124_15 = 0
			local var_124_16 = 0.9

			if var_124_15 < arg_121_1.time_ and arg_121_1.time_ <= var_124_15 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, false)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_17 = arg_121_1:GetWordFromCfg(114202030)
				local var_124_18 = arg_121_1:FormatText(var_124_17.content)

				arg_121_1.text_.text = var_124_18

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_19 = 36
				local var_124_20 = utf8.len(var_124_18)
				local var_124_21 = var_124_19 <= 0 and var_124_16 or var_124_16 * (var_124_20 / var_124_19)

				if var_124_21 > 0 and var_124_16 < var_124_21 then
					arg_121_1.talkMaxDuration = var_124_21

					if var_124_21 + var_124_15 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_21 + var_124_15
					end
				end

				arg_121_1.text_.text = var_124_18
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)
				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_22 = math.max(var_124_16, arg_121_1.talkMaxDuration)

			if var_124_15 <= arg_121_1.time_ and arg_121_1.time_ < var_124_15 + var_124_22 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_15) / var_124_22

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_15 + var_124_22 and arg_121_1.time_ < var_124_15 + var_124_22 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play114202031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 114202031
		arg_125_1.duration_ = 5

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play114202032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = 0
			local var_128_1 = 0.7

			if var_128_0 < arg_125_1.time_ and arg_125_1.time_ <= var_128_0 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, false)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_2 = arg_125_1:GetWordFromCfg(114202031)
				local var_128_3 = arg_125_1:FormatText(var_128_2.content)

				arg_125_1.text_.text = var_128_3

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_4 = 28
				local var_128_5 = utf8.len(var_128_3)
				local var_128_6 = var_128_4 <= 0 and var_128_1 or var_128_1 * (var_128_5 / var_128_4)

				if var_128_6 > 0 and var_128_1 < var_128_6 then
					arg_125_1.talkMaxDuration = var_128_6

					if var_128_6 + var_128_0 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_6 + var_128_0
					end
				end

				arg_125_1.text_.text = var_128_3
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)
				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_7 = math.max(var_128_1, arg_125_1.talkMaxDuration)

			if var_128_0 <= arg_125_1.time_ and arg_125_1.time_ < var_128_0 + var_128_7 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_0) / var_128_7

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_0 + var_128_7 and arg_125_1.time_ < var_128_0 + var_128_7 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play114202032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 114202032
		arg_129_1.duration_ = 13.533

		local var_129_0 = {
			ja = 4.266,
			ko = 9.6,
			zh = 10.966,
			en = 13.533
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
				arg_129_0:Play114202033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["10017"].transform
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 then
				arg_129_1.var_.moveOldPos10017 = var_132_0.localPosition
				var_132_0.localScale = Vector3.New(1, 1, 1)

				arg_129_1:CheckSpriteTmpPos("10017", 2)
			end

			local var_132_2 = 0.001

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2
				local var_132_4 = Vector3.New(-390, -350, -180)

				var_132_0.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos10017, var_132_4, var_132_3)
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 then
				var_132_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_132_5 = arg_129_1.actors_["10017"]
			local var_132_6 = 0

			if var_132_6 < arg_129_1.time_ and arg_129_1.time_ <= var_132_6 + arg_132_0 then
				local var_132_7 = var_132_5:GetComponent("Image")

				if var_132_7 then
					arg_129_1.var_.highlightMatValue10017 = var_132_7
				end
			end

			local var_132_8 = 0.034

			if var_132_6 <= arg_129_1.time_ and arg_129_1.time_ < var_132_6 + var_132_8 then
				local var_132_9 = (arg_129_1.time_ - var_132_6) / var_132_8

				if arg_129_1.var_.highlightMatValue10017 then
					local var_132_10 = Mathf.Lerp(0.5, 1, var_132_9)
					local var_132_11 = arg_129_1.var_.highlightMatValue10017
					local var_132_12 = var_132_11.color

					var_132_12.r = var_132_10
					var_132_12.g = var_132_10
					var_132_12.b = var_132_10
					var_132_11.color = var_132_12
				end
			end

			if arg_129_1.time_ >= var_132_6 + var_132_8 and arg_129_1.time_ < var_132_6 + var_132_8 + arg_132_0 and arg_129_1.var_.highlightMatValue10017 then
				local var_132_13 = 1

				var_132_5.transform:SetSiblingIndex(1)

				local var_132_14 = arg_129_1.var_.highlightMatValue10017
				local var_132_15 = var_132_14.color

				var_132_15.r = var_132_13
				var_132_15.g = var_132_13
				var_132_15.b = var_132_13
				var_132_14.color = var_132_15
			end

			local var_132_16 = arg_129_1.actors_["10017"]
			local var_132_17 = 0

			if var_132_17 < arg_129_1.time_ and arg_129_1.time_ <= var_132_17 + arg_132_0 then
				local var_132_18 = var_132_16:GetComponent("Image")

				if var_132_18 then
					arg_129_1.var_.highlightMatValue10017 = var_132_18
				end
			end

			local var_132_19 = 0.2

			if var_132_17 <= arg_129_1.time_ and arg_129_1.time_ < var_132_17 + var_132_19 then
				local var_132_20 = (arg_129_1.time_ - var_132_17) / var_132_19

				if arg_129_1.var_.highlightMatValue10017 then
					local var_132_21 = Mathf.Lerp(0.5, 1, var_132_20)
					local var_132_22 = arg_129_1.var_.highlightMatValue10017
					local var_132_23 = var_132_22.color

					var_132_23.r = var_132_21
					var_132_23.g = var_132_21
					var_132_23.b = var_132_21
					var_132_22.color = var_132_23
				end
			end

			if arg_129_1.time_ >= var_132_17 + var_132_19 and arg_129_1.time_ < var_132_17 + var_132_19 + arg_132_0 and arg_129_1.var_.highlightMatValue10017 then
				local var_132_24 = 1

				var_132_16.transform:SetSiblingIndex(1)

				local var_132_25 = arg_129_1.var_.highlightMatValue10017
				local var_132_26 = var_132_25.color

				var_132_26.r = var_132_24
				var_132_26.g = var_132_24
				var_132_26.b = var_132_24
				var_132_25.color = var_132_26
			end

			local var_132_27 = arg_129_1.actors_["10017"]
			local var_132_28 = 0

			if var_132_28 < arg_129_1.time_ and arg_129_1.time_ <= var_132_28 + arg_132_0 then
				local var_132_29 = var_132_27:GetComponent("Image")

				if var_132_29 then
					arg_129_1.var_.alphaMatValue10017 = var_132_29
					arg_129_1.var_.alphaOldValue10017 = var_132_29.color.a
				end

				arg_129_1.var_.alphaOldValue10017 = 0
			end

			local var_132_30 = 0.5

			if var_132_28 <= arg_129_1.time_ and arg_129_1.time_ < var_132_28 + var_132_30 then
				local var_132_31 = (arg_129_1.time_ - var_132_28) / var_132_30
				local var_132_32 = Mathf.Lerp(arg_129_1.var_.alphaOldValue10017, 1, var_132_31)

				if arg_129_1.var_.alphaMatValue10017 then
					local var_132_33 = arg_129_1.var_.alphaMatValue10017.color

					var_132_33.a = var_132_32
					arg_129_1.var_.alphaMatValue10017.color = var_132_33
				end
			end

			if arg_129_1.time_ >= var_132_28 + var_132_30 and arg_129_1.time_ < var_132_28 + var_132_30 + arg_132_0 and arg_129_1.var_.alphaMatValue10017 then
				local var_132_34 = arg_129_1.var_.alphaMatValue10017
				local var_132_35 = var_132_34.color

				var_132_35.a = 1
				var_132_34.color = var_132_35
			end

			local var_132_36 = 0
			local var_132_37 = 1

			if var_132_36 < arg_129_1.time_ and arg_129_1.time_ <= var_132_36 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_38 = arg_129_1:FormatText(StoryNameCfg[255].name)

				arg_129_1.leftNameTxt_.text = var_132_38

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_39 = arg_129_1:GetWordFromCfg(114202032)
				local var_132_40 = arg_129_1:FormatText(var_132_39.content)

				arg_129_1.text_.text = var_132_40

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_41 = 40
				local var_132_42 = utf8.len(var_132_40)
				local var_132_43 = var_132_41 <= 0 and var_132_37 or var_132_37 * (var_132_42 / var_132_41)

				if var_132_43 > 0 and var_132_37 < var_132_43 then
					arg_129_1.talkMaxDuration = var_132_43

					if var_132_43 + var_132_36 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_43 + var_132_36
					end
				end

				arg_129_1.text_.text = var_132_40
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114202", "114202032", "story_v_out_114202.awb") ~= 0 then
					local var_132_44 = manager.audio:GetVoiceLength("story_v_out_114202", "114202032", "story_v_out_114202.awb") / 1000

					if var_132_44 + var_132_36 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_44 + var_132_36
					end

					if var_132_39.prefab_name ~= "" and arg_129_1.actors_[var_132_39.prefab_name] ~= nil then
						local var_132_45 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_39.prefab_name].transform, "story_v_out_114202", "114202032", "story_v_out_114202.awb")

						arg_129_1:RecordAudio("114202032", var_132_45)
						arg_129_1:RecordAudio("114202032", var_132_45)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_114202", "114202032", "story_v_out_114202.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_114202", "114202032", "story_v_out_114202.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_46 = math.max(var_132_37, arg_129_1.talkMaxDuration)

			if var_132_36 <= arg_129_1.time_ and arg_129_1.time_ < var_132_36 + var_132_46 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_36) / var_132_46

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_36 + var_132_46 and arg_129_1.time_ < var_132_36 + var_132_46 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play114202033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 114202033
		arg_133_1.duration_ = 3.6

		local var_133_0 = {
			ja = 2.2,
			ko = 2.733,
			zh = 1.7,
			en = 3.6
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
				arg_133_0:Play114202034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["10015"].transform
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 then
				arg_133_1.var_.moveOldPos10015 = var_136_0.localPosition
				var_136_0.localScale = Vector3.New(1, 1, 1)

				arg_133_1:CheckSpriteTmpPos("10015", 4)

				local var_136_2 = var_136_0.childCount

				for iter_136_0 = 0, var_136_2 - 1 do
					local var_136_3 = var_136_0:GetChild(iter_136_0)

					if var_136_3.name == "split_1" or not string.find(var_136_3.name, "split") then
						var_136_3.gameObject:SetActive(true)
					else
						var_136_3.gameObject:SetActive(false)
					end
				end
			end

			local var_136_4 = 0.001

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_4 then
				local var_136_5 = (arg_133_1.time_ - var_136_1) / var_136_4
				local var_136_6 = Vector3.New(390, -350, -180)

				var_136_0.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos10015, var_136_6, var_136_5)
			end

			if arg_133_1.time_ >= var_136_1 + var_136_4 and arg_133_1.time_ < var_136_1 + var_136_4 + arg_136_0 then
				var_136_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_136_7 = arg_133_1.actors_["10017"]
			local var_136_8 = 0

			if var_136_8 < arg_133_1.time_ and arg_133_1.time_ <= var_136_8 + arg_136_0 then
				local var_136_9 = var_136_7:GetComponent("Image")

				if var_136_9 then
					arg_133_1.var_.highlightMatValue10017 = var_136_9
				end
			end

			local var_136_10 = 0.034

			if var_136_8 <= arg_133_1.time_ and arg_133_1.time_ < var_136_8 + var_136_10 then
				local var_136_11 = (arg_133_1.time_ - var_136_8) / var_136_10

				if arg_133_1.var_.highlightMatValue10017 then
					local var_136_12 = Mathf.Lerp(1, 0.5, var_136_11)
					local var_136_13 = arg_133_1.var_.highlightMatValue10017
					local var_136_14 = var_136_13.color

					var_136_14.r = var_136_12
					var_136_14.g = var_136_12
					var_136_14.b = var_136_12
					var_136_13.color = var_136_14
				end
			end

			if arg_133_1.time_ >= var_136_8 + var_136_10 and arg_133_1.time_ < var_136_8 + var_136_10 + arg_136_0 and arg_133_1.var_.highlightMatValue10017 then
				local var_136_15 = 0.5
				local var_136_16 = arg_133_1.var_.highlightMatValue10017
				local var_136_17 = var_136_16.color

				var_136_17.r = var_136_15
				var_136_17.g = var_136_15
				var_136_17.b = var_136_15
				var_136_16.color = var_136_17
			end

			local var_136_18 = arg_133_1.actors_["10015"]
			local var_136_19 = 0

			if var_136_19 < arg_133_1.time_ and arg_133_1.time_ <= var_136_19 + arg_136_0 and arg_133_1.var_.actorSpriteComps10015 == nil then
				arg_133_1.var_.actorSpriteComps10015 = var_136_18:GetComponentsInChildren(typeof(Image), true)
			end

			local var_136_20 = 0.034

			if var_136_19 <= arg_133_1.time_ and arg_133_1.time_ < var_136_19 + var_136_20 then
				local var_136_21 = (arg_133_1.time_ - var_136_19) / var_136_20

				if arg_133_1.var_.actorSpriteComps10015 then
					for iter_136_1, iter_136_2 in pairs(arg_133_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_136_2 then
							local var_136_22 = Mathf.Lerp(iter_136_2.color.r, 1, var_136_21)

							iter_136_2.color = Color.New(var_136_22, var_136_22, var_136_22)
						end
					end
				end
			end

			if arg_133_1.time_ >= var_136_19 + var_136_20 and arg_133_1.time_ < var_136_19 + var_136_20 + arg_136_0 and arg_133_1.var_.actorSpriteComps10015 then
				local var_136_23 = 1

				for iter_136_3, iter_136_4 in pairs(arg_133_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_136_4 then
						iter_136_4.color = Color.New(var_136_23, var_136_23, var_136_23)
					end
				end

				arg_133_1.var_.actorSpriteComps10015 = nil
			end

			local var_136_24 = arg_133_1.actors_["10015"]
			local var_136_25 = 0

			if var_136_25 < arg_133_1.time_ and arg_133_1.time_ <= var_136_25 + arg_136_0 then
				local var_136_26 = var_136_24:GetComponentInChildren(typeof(CanvasGroup))

				if var_136_26 then
					arg_133_1.var_.alphaOldValue10015 = var_136_26.alpha
					arg_133_1.var_.characterEffect10015 = var_136_26
				end

				arg_133_1.var_.alphaOldValue10015 = 0
			end

			local var_136_27 = 0.5

			if var_136_25 <= arg_133_1.time_ and arg_133_1.time_ < var_136_25 + var_136_27 then
				local var_136_28 = (arg_133_1.time_ - var_136_25) / var_136_27
				local var_136_29 = Mathf.Lerp(arg_133_1.var_.alphaOldValue10015, 1, var_136_28)

				if arg_133_1.var_.characterEffect10015 then
					arg_133_1.var_.characterEffect10015.alpha = var_136_29
				end
			end

			if arg_133_1.time_ >= var_136_25 + var_136_27 and arg_133_1.time_ < var_136_25 + var_136_27 + arg_136_0 and arg_133_1.var_.characterEffect10015 then
				arg_133_1.var_.characterEffect10015.alpha = 1
			end

			local var_136_30 = 0
			local var_136_31 = 0.275

			if var_136_30 < arg_133_1.time_ and arg_133_1.time_ <= var_136_30 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_32 = arg_133_1:FormatText(StoryNameCfg[208].name)

				arg_133_1.leftNameTxt_.text = var_136_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_33 = arg_133_1:GetWordFromCfg(114202033)
				local var_136_34 = arg_133_1:FormatText(var_136_33.content)

				arg_133_1.text_.text = var_136_34

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_35 = 11
				local var_136_36 = utf8.len(var_136_34)
				local var_136_37 = var_136_35 <= 0 and var_136_31 or var_136_31 * (var_136_36 / var_136_35)

				if var_136_37 > 0 and var_136_31 < var_136_37 then
					arg_133_1.talkMaxDuration = var_136_37

					if var_136_37 + var_136_30 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_37 + var_136_30
					end
				end

				arg_133_1.text_.text = var_136_34
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114202", "114202033", "story_v_out_114202.awb") ~= 0 then
					local var_136_38 = manager.audio:GetVoiceLength("story_v_out_114202", "114202033", "story_v_out_114202.awb") / 1000

					if var_136_38 + var_136_30 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_38 + var_136_30
					end

					if var_136_33.prefab_name ~= "" and arg_133_1.actors_[var_136_33.prefab_name] ~= nil then
						local var_136_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_33.prefab_name].transform, "story_v_out_114202", "114202033", "story_v_out_114202.awb")

						arg_133_1:RecordAudio("114202033", var_136_39)
						arg_133_1:RecordAudio("114202033", var_136_39)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_114202", "114202033", "story_v_out_114202.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_114202", "114202033", "story_v_out_114202.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_40 = math.max(var_136_31, arg_133_1.talkMaxDuration)

			if var_136_30 <= arg_133_1.time_ and arg_133_1.time_ < var_136_30 + var_136_40 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_30) / var_136_40

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_30 + var_136_40 and arg_133_1.time_ < var_136_30 + var_136_40 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play114202034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 114202034
		arg_137_1.duration_ = 5

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play114202035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["10015"]
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 and arg_137_1.var_.actorSpriteComps10015 == nil then
				arg_137_1.var_.actorSpriteComps10015 = var_140_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_140_2 = 0.034

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2

				if arg_137_1.var_.actorSpriteComps10015 then
					for iter_140_0, iter_140_1 in pairs(arg_137_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_140_1 then
							local var_140_4 = Mathf.Lerp(iter_140_1.color.r, 0.5, var_140_3)

							iter_140_1.color = Color.New(var_140_4, var_140_4, var_140_4)
						end
					end
				end
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 and arg_137_1.var_.actorSpriteComps10015 then
				local var_140_5 = 0.5

				for iter_140_2, iter_140_3 in pairs(arg_137_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_140_3 then
						iter_140_3.color = Color.New(var_140_5, var_140_5, var_140_5)
					end
				end

				arg_137_1.var_.actorSpriteComps10015 = nil
			end

			local var_140_6 = 0
			local var_140_7 = 1.3

			if var_140_6 < arg_137_1.time_ and arg_137_1.time_ <= var_140_6 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, false)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_8 = arg_137_1:GetWordFromCfg(114202034)
				local var_140_9 = arg_137_1:FormatText(var_140_8.content)

				arg_137_1.text_.text = var_140_9

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_10 = 52
				local var_140_11 = utf8.len(var_140_9)
				local var_140_12 = var_140_10 <= 0 and var_140_7 or var_140_7 * (var_140_11 / var_140_10)

				if var_140_12 > 0 and var_140_7 < var_140_12 then
					arg_137_1.talkMaxDuration = var_140_12

					if var_140_12 + var_140_6 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_12 + var_140_6
					end
				end

				arg_137_1.text_.text = var_140_9
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)
				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_13 = math.max(var_140_7, arg_137_1.talkMaxDuration)

			if var_140_6 <= arg_137_1.time_ and arg_137_1.time_ < var_140_6 + var_140_13 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_6) / var_140_13

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_6 + var_140_13 and arg_137_1.time_ < var_140_6 + var_140_13 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play114202035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 114202035
		arg_141_1.duration_ = 2.033

		local var_141_0 = {
			ja = 0.999999999999,
			ko = 0.999999999999,
			zh = 2.033,
			en = 1.133
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
				arg_141_0:Play114202036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["10017"]
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 then
				local var_144_2 = var_144_0:GetComponent("Image")

				if var_144_2 then
					arg_141_1.var_.highlightMatValue10017 = var_144_2
				end
			end

			local var_144_3 = 0.034

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_3 then
				local var_144_4 = (arg_141_1.time_ - var_144_1) / var_144_3

				if arg_141_1.var_.highlightMatValue10017 then
					local var_144_5 = Mathf.Lerp(0.5, 1, var_144_4)
					local var_144_6 = arg_141_1.var_.highlightMatValue10017
					local var_144_7 = var_144_6.color

					var_144_7.r = var_144_5
					var_144_7.g = var_144_5
					var_144_7.b = var_144_5
					var_144_6.color = var_144_7
				end
			end

			if arg_141_1.time_ >= var_144_1 + var_144_3 and arg_141_1.time_ < var_144_1 + var_144_3 + arg_144_0 and arg_141_1.var_.highlightMatValue10017 then
				local var_144_8 = 1

				var_144_0.transform:SetSiblingIndex(1)

				local var_144_9 = arg_141_1.var_.highlightMatValue10017
				local var_144_10 = var_144_9.color

				var_144_10.r = var_144_8
				var_144_10.g = var_144_8
				var_144_10.b = var_144_8
				var_144_9.color = var_144_10
			end

			local var_144_11 = arg_141_1.actors_["10015"]
			local var_144_12 = 0

			if var_144_12 < arg_141_1.time_ and arg_141_1.time_ <= var_144_12 + arg_144_0 and arg_141_1.var_.actorSpriteComps10015 == nil then
				arg_141_1.var_.actorSpriteComps10015 = var_144_11:GetComponentsInChildren(typeof(Image), true)
			end

			local var_144_13 = 0.034

			if var_144_12 <= arg_141_1.time_ and arg_141_1.time_ < var_144_12 + var_144_13 then
				local var_144_14 = (arg_141_1.time_ - var_144_12) / var_144_13

				if arg_141_1.var_.actorSpriteComps10015 then
					for iter_144_0, iter_144_1 in pairs(arg_141_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_144_1 then
							local var_144_15 = Mathf.Lerp(iter_144_1.color.r, 0.5, var_144_14)

							iter_144_1.color = Color.New(var_144_15, var_144_15, var_144_15)
						end
					end
				end
			end

			if arg_141_1.time_ >= var_144_12 + var_144_13 and arg_141_1.time_ < var_144_12 + var_144_13 + arg_144_0 and arg_141_1.var_.actorSpriteComps10015 then
				local var_144_16 = 0.5

				for iter_144_2, iter_144_3 in pairs(arg_141_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_144_3 then
						iter_144_3.color = Color.New(var_144_16, var_144_16, var_144_16)
					end
				end

				arg_141_1.var_.actorSpriteComps10015 = nil
			end

			local var_144_17 = 0
			local var_144_18 = 0.075

			if var_144_17 < arg_141_1.time_ and arg_141_1.time_ <= var_144_17 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_19 = arg_141_1:FormatText(StoryNameCfg[255].name)

				arg_141_1.leftNameTxt_.text = var_144_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_20 = arg_141_1:GetWordFromCfg(114202035)
				local var_144_21 = arg_141_1:FormatText(var_144_20.content)

				arg_141_1.text_.text = var_144_21

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_22 = 3
				local var_144_23 = utf8.len(var_144_21)
				local var_144_24 = var_144_22 <= 0 and var_144_18 or var_144_18 * (var_144_23 / var_144_22)

				if var_144_24 > 0 and var_144_18 < var_144_24 then
					arg_141_1.talkMaxDuration = var_144_24

					if var_144_24 + var_144_17 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_24 + var_144_17
					end
				end

				arg_141_1.text_.text = var_144_21
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114202", "114202035", "story_v_out_114202.awb") ~= 0 then
					local var_144_25 = manager.audio:GetVoiceLength("story_v_out_114202", "114202035", "story_v_out_114202.awb") / 1000

					if var_144_25 + var_144_17 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_25 + var_144_17
					end

					if var_144_20.prefab_name ~= "" and arg_141_1.actors_[var_144_20.prefab_name] ~= nil then
						local var_144_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_20.prefab_name].transform, "story_v_out_114202", "114202035", "story_v_out_114202.awb")

						arg_141_1:RecordAudio("114202035", var_144_26)
						arg_141_1:RecordAudio("114202035", var_144_26)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_114202", "114202035", "story_v_out_114202.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_114202", "114202035", "story_v_out_114202.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_27 = math.max(var_144_18, arg_141_1.talkMaxDuration)

			if var_144_17 <= arg_141_1.time_ and arg_141_1.time_ < var_144_17 + var_144_27 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_17) / var_144_27

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_17 + var_144_27 and arg_141_1.time_ < var_144_17 + var_144_27 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play114202036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 114202036
		arg_145_1.duration_ = 5

		SetActive(arg_145_1.tipsGo_, false)

		function arg_145_1.onSingleLineFinish_()
			arg_145_1.onSingleLineUpdate_ = nil
			arg_145_1.onSingleLineFinish_ = nil
			arg_145_1.state_ = "waiting"
		end

		function arg_145_1.playNext_(arg_147_0)
			if arg_147_0 == 1 then
				arg_145_0:Play114202037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["10017"]
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 then
				local var_148_2 = var_148_0:GetComponent("Image")

				if var_148_2 then
					arg_145_1.var_.highlightMatValue10017 = var_148_2
				end
			end

			local var_148_3 = 0.034

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_3 then
				local var_148_4 = (arg_145_1.time_ - var_148_1) / var_148_3

				if arg_145_1.var_.highlightMatValue10017 then
					local var_148_5 = Mathf.Lerp(1, 0.5, var_148_4)
					local var_148_6 = arg_145_1.var_.highlightMatValue10017
					local var_148_7 = var_148_6.color

					var_148_7.r = var_148_5
					var_148_7.g = var_148_5
					var_148_7.b = var_148_5
					var_148_6.color = var_148_7
				end
			end

			if arg_145_1.time_ >= var_148_1 + var_148_3 and arg_145_1.time_ < var_148_1 + var_148_3 + arg_148_0 and arg_145_1.var_.highlightMatValue10017 then
				local var_148_8 = 0.5
				local var_148_9 = arg_145_1.var_.highlightMatValue10017
				local var_148_10 = var_148_9.color

				var_148_10.r = var_148_8
				var_148_10.g = var_148_8
				var_148_10.b = var_148_8
				var_148_9.color = var_148_10
			end

			local var_148_11 = 0
			local var_148_12 = 1.475

			if var_148_11 < arg_145_1.time_ and arg_145_1.time_ <= var_148_11 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, false)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_13 = arg_145_1:GetWordFromCfg(114202036)
				local var_148_14 = arg_145_1:FormatText(var_148_13.content)

				arg_145_1.text_.text = var_148_14

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_15 = 59
				local var_148_16 = utf8.len(var_148_14)
				local var_148_17 = var_148_15 <= 0 and var_148_12 or var_148_12 * (var_148_16 / var_148_15)

				if var_148_17 > 0 and var_148_12 < var_148_17 then
					arg_145_1.talkMaxDuration = var_148_17

					if var_148_17 + var_148_11 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_17 + var_148_11
					end
				end

				arg_145_1.text_.text = var_148_14
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)
				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_18 = math.max(var_148_12, arg_145_1.talkMaxDuration)

			if var_148_11 <= arg_145_1.time_ and arg_145_1.time_ < var_148_11 + var_148_18 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_11) / var_148_18

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_11 + var_148_18 and arg_145_1.time_ < var_148_11 + var_148_18 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play114202037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 114202037
		arg_149_1.duration_ = 10.6

		local var_149_0 = {
			ja = 7.5,
			ko = 10.3,
			zh = 8.9,
			en = 10.6
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
				arg_149_0:Play114202038(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["10017"]
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 then
				local var_152_2 = var_152_0:GetComponent("Image")

				if var_152_2 then
					arg_149_1.var_.highlightMatValue10017 = var_152_2
				end
			end

			local var_152_3 = 0.034

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_3 then
				local var_152_4 = (arg_149_1.time_ - var_152_1) / var_152_3

				if arg_149_1.var_.highlightMatValue10017 then
					local var_152_5 = Mathf.Lerp(0.5, 1, var_152_4)
					local var_152_6 = arg_149_1.var_.highlightMatValue10017
					local var_152_7 = var_152_6.color

					var_152_7.r = var_152_5
					var_152_7.g = var_152_5
					var_152_7.b = var_152_5
					var_152_6.color = var_152_7
				end
			end

			if arg_149_1.time_ >= var_152_1 + var_152_3 and arg_149_1.time_ < var_152_1 + var_152_3 + arg_152_0 and arg_149_1.var_.highlightMatValue10017 then
				local var_152_8 = 1

				var_152_0.transform:SetSiblingIndex(1)

				local var_152_9 = arg_149_1.var_.highlightMatValue10017
				local var_152_10 = var_152_9.color

				var_152_10.r = var_152_8
				var_152_10.g = var_152_8
				var_152_10.b = var_152_8
				var_152_9.color = var_152_10
			end

			local var_152_11 = 0
			local var_152_12 = 1

			if var_152_11 < arg_149_1.time_ and arg_149_1.time_ <= var_152_11 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_13 = arg_149_1:FormatText(StoryNameCfg[255].name)

				arg_149_1.leftNameTxt_.text = var_152_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_14 = arg_149_1:GetWordFromCfg(114202037)
				local var_152_15 = arg_149_1:FormatText(var_152_14.content)

				arg_149_1.text_.text = var_152_15

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_16 = 40
				local var_152_17 = utf8.len(var_152_15)
				local var_152_18 = var_152_16 <= 0 and var_152_12 or var_152_12 * (var_152_17 / var_152_16)

				if var_152_18 > 0 and var_152_12 < var_152_18 then
					arg_149_1.talkMaxDuration = var_152_18

					if var_152_18 + var_152_11 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_18 + var_152_11
					end
				end

				arg_149_1.text_.text = var_152_15
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114202", "114202037", "story_v_out_114202.awb") ~= 0 then
					local var_152_19 = manager.audio:GetVoiceLength("story_v_out_114202", "114202037", "story_v_out_114202.awb") / 1000

					if var_152_19 + var_152_11 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_19 + var_152_11
					end

					if var_152_14.prefab_name ~= "" and arg_149_1.actors_[var_152_14.prefab_name] ~= nil then
						local var_152_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_14.prefab_name].transform, "story_v_out_114202", "114202037", "story_v_out_114202.awb")

						arg_149_1:RecordAudio("114202037", var_152_20)
						arg_149_1:RecordAudio("114202037", var_152_20)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_114202", "114202037", "story_v_out_114202.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_114202", "114202037", "story_v_out_114202.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_21 = math.max(var_152_12, arg_149_1.talkMaxDuration)

			if var_152_11 <= arg_149_1.time_ and arg_149_1.time_ < var_152_11 + var_152_21 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_11) / var_152_21

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_11 + var_152_21 and arg_149_1.time_ < var_152_11 + var_152_21 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play114202038 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 114202038
		arg_153_1.duration_ = 14.033

		local var_153_0 = {
			ja = 10.466,
			ko = 12.3,
			zh = 10.966,
			en = 14.033
		}
		local var_153_1 = manager.audio:GetLocalizationFlag()

		if var_153_0[var_153_1] ~= nil then
			arg_153_1.duration_ = var_153_0[var_153_1]
		end

		SetActive(arg_153_1.tipsGo_, false)

		function arg_153_1.onSingleLineFinish_()
			arg_153_1.onSingleLineUpdate_ = nil
			arg_153_1.onSingleLineFinish_ = nil
			arg_153_1.state_ = "waiting"
		end

		function arg_153_1.playNext_(arg_155_0)
			if arg_155_0 == 1 then
				arg_153_0:Play114202039(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = 0
			local var_156_1 = 1.325

			if var_156_0 < arg_153_1.time_ and arg_153_1.time_ <= var_156_0 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_2 = arg_153_1:FormatText(StoryNameCfg[255].name)

				arg_153_1.leftNameTxt_.text = var_156_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_3 = arg_153_1:GetWordFromCfg(114202038)
				local var_156_4 = arg_153_1:FormatText(var_156_3.content)

				arg_153_1.text_.text = var_156_4

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_5 = 53
				local var_156_6 = utf8.len(var_156_4)
				local var_156_7 = var_156_5 <= 0 and var_156_1 or var_156_1 * (var_156_6 / var_156_5)

				if var_156_7 > 0 and var_156_1 < var_156_7 then
					arg_153_1.talkMaxDuration = var_156_7

					if var_156_7 + var_156_0 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_7 + var_156_0
					end
				end

				arg_153_1.text_.text = var_156_4
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114202", "114202038", "story_v_out_114202.awb") ~= 0 then
					local var_156_8 = manager.audio:GetVoiceLength("story_v_out_114202", "114202038", "story_v_out_114202.awb") / 1000

					if var_156_8 + var_156_0 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_8 + var_156_0
					end

					if var_156_3.prefab_name ~= "" and arg_153_1.actors_[var_156_3.prefab_name] ~= nil then
						local var_156_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_3.prefab_name].transform, "story_v_out_114202", "114202038", "story_v_out_114202.awb")

						arg_153_1:RecordAudio("114202038", var_156_9)
						arg_153_1:RecordAudio("114202038", var_156_9)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_114202", "114202038", "story_v_out_114202.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_114202", "114202038", "story_v_out_114202.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_10 = math.max(var_156_1, arg_153_1.talkMaxDuration)

			if var_156_0 <= arg_153_1.time_ and arg_153_1.time_ < var_156_0 + var_156_10 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_0) / var_156_10

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_0 + var_156_10 and arg_153_1.time_ < var_156_0 + var_156_10 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play114202039 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 114202039
		arg_157_1.duration_ = 12.4

		local var_157_0 = {
			ja = 9,
			ko = 10.233,
			zh = 12.4,
			en = 12.1
		}
		local var_157_1 = manager.audio:GetLocalizationFlag()

		if var_157_0[var_157_1] ~= nil then
			arg_157_1.duration_ = var_157_0[var_157_1]
		end

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play114202040(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = 0
			local var_160_1 = 1.225

			if var_160_0 < arg_157_1.time_ and arg_157_1.time_ <= var_160_0 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_2 = arg_157_1:FormatText(StoryNameCfg[255].name)

				arg_157_1.leftNameTxt_.text = var_160_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_3 = arg_157_1:GetWordFromCfg(114202039)
				local var_160_4 = arg_157_1:FormatText(var_160_3.content)

				arg_157_1.text_.text = var_160_4

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_5 = 49
				local var_160_6 = utf8.len(var_160_4)
				local var_160_7 = var_160_5 <= 0 and var_160_1 or var_160_1 * (var_160_6 / var_160_5)

				if var_160_7 > 0 and var_160_1 < var_160_7 then
					arg_157_1.talkMaxDuration = var_160_7

					if var_160_7 + var_160_0 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_7 + var_160_0
					end
				end

				arg_157_1.text_.text = var_160_4
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114202", "114202039", "story_v_out_114202.awb") ~= 0 then
					local var_160_8 = manager.audio:GetVoiceLength("story_v_out_114202", "114202039", "story_v_out_114202.awb") / 1000

					if var_160_8 + var_160_0 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_8 + var_160_0
					end

					if var_160_3.prefab_name ~= "" and arg_157_1.actors_[var_160_3.prefab_name] ~= nil then
						local var_160_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_3.prefab_name].transform, "story_v_out_114202", "114202039", "story_v_out_114202.awb")

						arg_157_1:RecordAudio("114202039", var_160_9)
						arg_157_1:RecordAudio("114202039", var_160_9)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_114202", "114202039", "story_v_out_114202.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_114202", "114202039", "story_v_out_114202.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_10 = math.max(var_160_1, arg_157_1.talkMaxDuration)

			if var_160_0 <= arg_157_1.time_ and arg_157_1.time_ < var_160_0 + var_160_10 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_0) / var_160_10

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_0 + var_160_10 and arg_157_1.time_ < var_160_0 + var_160_10 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play114202040 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 114202040
		arg_161_1.duration_ = 2.466

		local var_161_0 = {
			ja = 2.466,
			ko = 1.5,
			zh = 0.999999999999,
			en = 1.266
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
				arg_161_0:Play114202041(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["10017"]
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 then
				local var_164_2 = var_164_0:GetComponent("Image")

				if var_164_2 then
					arg_161_1.var_.highlightMatValue10017 = var_164_2
				end
			end

			local var_164_3 = 0.034

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_3 then
				local var_164_4 = (arg_161_1.time_ - var_164_1) / var_164_3

				if arg_161_1.var_.highlightMatValue10017 then
					local var_164_5 = Mathf.Lerp(1, 0.5, var_164_4)
					local var_164_6 = arg_161_1.var_.highlightMatValue10017
					local var_164_7 = var_164_6.color

					var_164_7.r = var_164_5
					var_164_7.g = var_164_5
					var_164_7.b = var_164_5
					var_164_6.color = var_164_7
				end
			end

			if arg_161_1.time_ >= var_164_1 + var_164_3 and arg_161_1.time_ < var_164_1 + var_164_3 + arg_164_0 and arg_161_1.var_.highlightMatValue10017 then
				local var_164_8 = 0.5
				local var_164_9 = arg_161_1.var_.highlightMatValue10017
				local var_164_10 = var_164_9.color

				var_164_10.r = var_164_8
				var_164_10.g = var_164_8
				var_164_10.b = var_164_8
				var_164_9.color = var_164_10
			end

			local var_164_11 = arg_161_1.actors_["10015"]
			local var_164_12 = 0

			if var_164_12 < arg_161_1.time_ and arg_161_1.time_ <= var_164_12 + arg_164_0 and arg_161_1.var_.actorSpriteComps10015 == nil then
				arg_161_1.var_.actorSpriteComps10015 = var_164_11:GetComponentsInChildren(typeof(Image), true)
			end

			local var_164_13 = 0.034

			if var_164_12 <= arg_161_1.time_ and arg_161_1.time_ < var_164_12 + var_164_13 then
				local var_164_14 = (arg_161_1.time_ - var_164_12) / var_164_13

				if arg_161_1.var_.actorSpriteComps10015 then
					for iter_164_0, iter_164_1 in pairs(arg_161_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_164_1 then
							local var_164_15 = Mathf.Lerp(iter_164_1.color.r, 1, var_164_14)

							iter_164_1.color = Color.New(var_164_15, var_164_15, var_164_15)
						end
					end
				end
			end

			if arg_161_1.time_ >= var_164_12 + var_164_13 and arg_161_1.time_ < var_164_12 + var_164_13 + arg_164_0 and arg_161_1.var_.actorSpriteComps10015 then
				local var_164_16 = 1

				for iter_164_2, iter_164_3 in pairs(arg_161_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_164_3 then
						iter_164_3.color = Color.New(var_164_16, var_164_16, var_164_16)
					end
				end

				arg_161_1.var_.actorSpriteComps10015 = nil
			end

			local var_164_17 = 0
			local var_164_18 = 0.05

			if var_164_17 < arg_161_1.time_ and arg_161_1.time_ <= var_164_17 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_19 = arg_161_1:FormatText(StoryNameCfg[208].name)

				arg_161_1.leftNameTxt_.text = var_164_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_20 = arg_161_1:GetWordFromCfg(114202040)
				local var_164_21 = arg_161_1:FormatText(var_164_20.content)

				arg_161_1.text_.text = var_164_21

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_22 = 2
				local var_164_23 = utf8.len(var_164_21)
				local var_164_24 = var_164_22 <= 0 and var_164_18 or var_164_18 * (var_164_23 / var_164_22)

				if var_164_24 > 0 and var_164_18 < var_164_24 then
					arg_161_1.talkMaxDuration = var_164_24

					if var_164_24 + var_164_17 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_24 + var_164_17
					end
				end

				arg_161_1.text_.text = var_164_21
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114202", "114202040", "story_v_out_114202.awb") ~= 0 then
					local var_164_25 = manager.audio:GetVoiceLength("story_v_out_114202", "114202040", "story_v_out_114202.awb") / 1000

					if var_164_25 + var_164_17 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_25 + var_164_17
					end

					if var_164_20.prefab_name ~= "" and arg_161_1.actors_[var_164_20.prefab_name] ~= nil then
						local var_164_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_20.prefab_name].transform, "story_v_out_114202", "114202040", "story_v_out_114202.awb")

						arg_161_1:RecordAudio("114202040", var_164_26)
						arg_161_1:RecordAudio("114202040", var_164_26)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_114202", "114202040", "story_v_out_114202.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_114202", "114202040", "story_v_out_114202.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_27 = math.max(var_164_18, arg_161_1.talkMaxDuration)

			if var_164_17 <= arg_161_1.time_ and arg_161_1.time_ < var_164_17 + var_164_27 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_17) / var_164_27

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_17 + var_164_27 and arg_161_1.time_ < var_164_17 + var_164_27 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play114202041 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 114202041
		arg_165_1.duration_ = 5

		SetActive(arg_165_1.tipsGo_, false)

		function arg_165_1.onSingleLineFinish_()
			arg_165_1.onSingleLineUpdate_ = nil
			arg_165_1.onSingleLineFinish_ = nil
			arg_165_1.state_ = "waiting"
		end

		function arg_165_1.playNext_(arg_167_0)
			if arg_167_0 == 1 then
				arg_165_0:Play114202042(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = arg_165_1.actors_["10015"]
			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 and arg_165_1.var_.actorSpriteComps10015 == nil then
				arg_165_1.var_.actorSpriteComps10015 = var_168_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_168_2 = 0.034

			if var_168_1 <= arg_165_1.time_ and arg_165_1.time_ < var_168_1 + var_168_2 then
				local var_168_3 = (arg_165_1.time_ - var_168_1) / var_168_2

				if arg_165_1.var_.actorSpriteComps10015 then
					for iter_168_0, iter_168_1 in pairs(arg_165_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_168_1 then
							local var_168_4 = Mathf.Lerp(iter_168_1.color.r, 0.5, var_168_3)

							iter_168_1.color = Color.New(var_168_4, var_168_4, var_168_4)
						end
					end
				end
			end

			if arg_165_1.time_ >= var_168_1 + var_168_2 and arg_165_1.time_ < var_168_1 + var_168_2 + arg_168_0 and arg_165_1.var_.actorSpriteComps10015 then
				local var_168_5 = 0.5

				for iter_168_2, iter_168_3 in pairs(arg_165_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_168_3 then
						iter_168_3.color = Color.New(var_168_5, var_168_5, var_168_5)
					end
				end

				arg_165_1.var_.actorSpriteComps10015 = nil
			end

			local var_168_6 = 0
			local var_168_7 = 1.65

			if var_168_6 < arg_165_1.time_ and arg_165_1.time_ <= var_168_6 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, false)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_8 = arg_165_1:GetWordFromCfg(114202041)
				local var_168_9 = arg_165_1:FormatText(var_168_8.content)

				arg_165_1.text_.text = var_168_9

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_10 = 66
				local var_168_11 = utf8.len(var_168_9)
				local var_168_12 = var_168_10 <= 0 and var_168_7 or var_168_7 * (var_168_11 / var_168_10)

				if var_168_12 > 0 and var_168_7 < var_168_12 then
					arg_165_1.talkMaxDuration = var_168_12

					if var_168_12 + var_168_6 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_12 + var_168_6
					end
				end

				arg_165_1.text_.text = var_168_9
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)
				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_13 = math.max(var_168_7, arg_165_1.talkMaxDuration)

			if var_168_6 <= arg_165_1.time_ and arg_165_1.time_ < var_168_6 + var_168_13 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_6) / var_168_13

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_6 + var_168_13 and arg_165_1.time_ < var_168_6 + var_168_13 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play114202042 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 114202042
		arg_169_1.duration_ = 15.3

		local var_169_0 = {
			ja = 8.266,
			ko = 12.366,
			zh = 11.7,
			en = 15.3
		}
		local var_169_1 = manager.audio:GetLocalizationFlag()

		if var_169_0[var_169_1] ~= nil then
			arg_169_1.duration_ = var_169_0[var_169_1]
		end

		SetActive(arg_169_1.tipsGo_, false)

		function arg_169_1.onSingleLineFinish_()
			arg_169_1.onSingleLineUpdate_ = nil
			arg_169_1.onSingleLineFinish_ = nil
			arg_169_1.state_ = "waiting"
		end

		function arg_169_1.playNext_(arg_171_0)
			if arg_171_0 == 1 then
				arg_169_0:Play114202043(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["10017"].transform
			local var_172_1 = 2

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 then
				arg_169_1.var_.moveOldPos10017 = var_172_0.localPosition
				var_172_0.localScale = Vector3.New(1, 1, 1)

				arg_169_1:CheckSpriteTmpPos("10017", 3)
			end

			local var_172_2 = 0.001

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_2 then
				local var_172_3 = (arg_169_1.time_ - var_172_1) / var_172_2
				local var_172_4 = Vector3.New(0, -350, -180)

				var_172_0.localPosition = Vector3.Lerp(arg_169_1.var_.moveOldPos10017, var_172_4, var_172_3)
			end

			if arg_169_1.time_ >= var_172_1 + var_172_2 and arg_169_1.time_ < var_172_1 + var_172_2 + arg_172_0 then
				var_172_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_172_5 = arg_169_1.actors_["10017"]
			local var_172_6 = 2

			if var_172_6 < arg_169_1.time_ and arg_169_1.time_ <= var_172_6 + arg_172_0 then
				local var_172_7 = var_172_5:GetComponent("Image")

				if var_172_7 then
					arg_169_1.var_.highlightMatValue10017 = var_172_7
				end
			end

			local var_172_8 = 0.034

			if var_172_6 <= arg_169_1.time_ and arg_169_1.time_ < var_172_6 + var_172_8 then
				local var_172_9 = (arg_169_1.time_ - var_172_6) / var_172_8

				if arg_169_1.var_.highlightMatValue10017 then
					local var_172_10 = Mathf.Lerp(0.5, 1, var_172_9)
					local var_172_11 = arg_169_1.var_.highlightMatValue10017
					local var_172_12 = var_172_11.color

					var_172_12.r = var_172_10
					var_172_12.g = var_172_10
					var_172_12.b = var_172_10
					var_172_11.color = var_172_12
				end
			end

			if arg_169_1.time_ >= var_172_6 + var_172_8 and arg_169_1.time_ < var_172_6 + var_172_8 + arg_172_0 and arg_169_1.var_.highlightMatValue10017 then
				local var_172_13 = 1

				var_172_5.transform:SetSiblingIndex(1)

				local var_172_14 = arg_169_1.var_.highlightMatValue10017
				local var_172_15 = var_172_14.color

				var_172_15.r = var_172_13
				var_172_15.g = var_172_13
				var_172_15.b = var_172_13
				var_172_14.color = var_172_15
			end

			local var_172_16 = 0

			if var_172_16 < arg_169_1.time_ and arg_169_1.time_ <= var_172_16 + arg_172_0 then
				arg_169_1.mask_.enabled = true
				arg_169_1.mask_.raycastTarget = true

				arg_169_1:SetGaussion(false)
			end

			local var_172_17 = 2

			if var_172_16 <= arg_169_1.time_ and arg_169_1.time_ < var_172_16 + var_172_17 then
				local var_172_18 = (arg_169_1.time_ - var_172_16) / var_172_17
				local var_172_19 = Color.New(1, 1, 1)

				var_172_19.a = Mathf.Lerp(1, 0, var_172_18)
				arg_169_1.mask_.color = var_172_19
			end

			if arg_169_1.time_ >= var_172_16 + var_172_17 and arg_169_1.time_ < var_172_16 + var_172_17 + arg_172_0 then
				local var_172_20 = Color.New(1, 1, 1)
				local var_172_21 = 0

				arg_169_1.mask_.enabled = false
				var_172_20.a = var_172_21
				arg_169_1.mask_.color = var_172_20
			end

			local var_172_22 = arg_169_1.actors_["10017"]
			local var_172_23 = 2

			if var_172_23 < arg_169_1.time_ and arg_169_1.time_ <= var_172_23 + arg_172_0 then
				local var_172_24 = var_172_22:GetComponent("Image")

				if var_172_24 then
					arg_169_1.var_.alphaMatValue10017 = var_172_24
					arg_169_1.var_.alphaOldValue10017 = var_172_24.color.a
				end

				arg_169_1.var_.alphaOldValue10017 = 0
			end

			local var_172_25 = 0.5

			if var_172_23 <= arg_169_1.time_ and arg_169_1.time_ < var_172_23 + var_172_25 then
				local var_172_26 = (arg_169_1.time_ - var_172_23) / var_172_25
				local var_172_27 = Mathf.Lerp(arg_169_1.var_.alphaOldValue10017, 1, var_172_26)

				if arg_169_1.var_.alphaMatValue10017 then
					local var_172_28 = arg_169_1.var_.alphaMatValue10017.color

					var_172_28.a = var_172_27
					arg_169_1.var_.alphaMatValue10017.color = var_172_28
				end
			end

			if arg_169_1.time_ >= var_172_23 + var_172_25 and arg_169_1.time_ < var_172_23 + var_172_25 + arg_172_0 and arg_169_1.var_.alphaMatValue10017 then
				local var_172_29 = arg_169_1.var_.alphaMatValue10017
				local var_172_30 = var_172_29.color

				var_172_30.a = 1
				var_172_29.color = var_172_30
			end

			local var_172_31 = arg_169_1.actors_["10017"].transform
			local var_172_32 = 0

			if var_172_32 < arg_169_1.time_ and arg_169_1.time_ <= var_172_32 + arg_172_0 then
				arg_169_1.var_.moveOldPos10017 = var_172_31.localPosition
				var_172_31.localScale = Vector3.New(1, 1, 1)

				arg_169_1:CheckSpriteTmpPos("10017", 7)
			end

			local var_172_33 = 0.001

			if var_172_32 <= arg_169_1.time_ and arg_169_1.time_ < var_172_32 + var_172_33 then
				local var_172_34 = (arg_169_1.time_ - var_172_32) / var_172_33
				local var_172_35 = Vector3.New(0, -2000, 300)

				var_172_31.localPosition = Vector3.Lerp(arg_169_1.var_.moveOldPos10017, var_172_35, var_172_34)
			end

			if arg_169_1.time_ >= var_172_32 + var_172_33 and arg_169_1.time_ < var_172_32 + var_172_33 + arg_172_0 then
				var_172_31.localPosition = Vector3.New(0, -2000, 300)
			end

			local var_172_36 = arg_169_1.actors_["10015"].transform
			local var_172_37 = 0

			if var_172_37 < arg_169_1.time_ and arg_169_1.time_ <= var_172_37 + arg_172_0 then
				arg_169_1.var_.moveOldPos10015 = var_172_36.localPosition
				var_172_36.localScale = Vector3.New(1, 1, 1)

				arg_169_1:CheckSpriteTmpPos("10015", 7)

				local var_172_38 = var_172_36.childCount

				for iter_172_0 = 0, var_172_38 - 1 do
					local var_172_39 = var_172_36:GetChild(iter_172_0)

					if var_172_39.name == "split_1" or not string.find(var_172_39.name, "split") then
						var_172_39.gameObject:SetActive(true)
					else
						var_172_39.gameObject:SetActive(false)
					end
				end
			end

			local var_172_40 = 0.001

			if var_172_37 <= arg_169_1.time_ and arg_169_1.time_ < var_172_37 + var_172_40 then
				local var_172_41 = (arg_169_1.time_ - var_172_37) / var_172_40
				local var_172_42 = Vector3.New(0, -2000, 300)

				var_172_36.localPosition = Vector3.Lerp(arg_169_1.var_.moveOldPos10015, var_172_42, var_172_41)
			end

			if arg_169_1.time_ >= var_172_37 + var_172_40 and arg_169_1.time_ < var_172_37 + var_172_40 + arg_172_0 then
				var_172_36.localPosition = Vector3.New(0, -2000, 300)
			end

			local var_172_43 = 0

			if var_172_43 < arg_169_1.time_ and arg_169_1.time_ <= var_172_43 + arg_172_0 then
				local var_172_44 = manager.ui.mainCamera.transform.localPosition
				local var_172_45 = Vector3.New(0, 0, 10) + Vector3.New(var_172_44.x, var_172_44.y, 0)
				local var_172_46 = arg_169_1.bgs_.F04

				var_172_46.transform.localPosition = var_172_45
				var_172_46.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_172_47 = var_172_46:GetComponent("SpriteRenderer")

				if var_172_47 and var_172_47.sprite then
					local var_172_48 = (var_172_46.transform.localPosition - var_172_44).z
					local var_172_49 = manager.ui.mainCameraCom_
					local var_172_50 = 2 * var_172_48 * Mathf.Tan(var_172_49.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_172_51 = var_172_50 * var_172_49.aspect
					local var_172_52 = var_172_47.sprite.bounds.size.x
					local var_172_53 = var_172_47.sprite.bounds.size.y
					local var_172_54 = var_172_51 / var_172_52
					local var_172_55 = var_172_50 / var_172_53
					local var_172_56 = var_172_55 < var_172_54 and var_172_54 or var_172_55

					var_172_46.transform.localScale = Vector3.New(var_172_56, var_172_56, 0)
				end

				for iter_172_1, iter_172_2 in pairs(arg_169_1.bgs_) do
					if iter_172_1 ~= "F04" then
						iter_172_2.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			if arg_169_1.frameCnt_ <= 1 then
				arg_169_1.dialog_:SetActive(false)
			end

			local var_172_57 = 2
			local var_172_58 = 1.125

			if var_172_57 < arg_169_1.time_ and arg_169_1.time_ <= var_172_57 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0

				arg_169_1.dialog_:SetActive(true)

				local var_172_59 = LeanTween.value(arg_169_1.dialog_, 0, 1, 0.3)

				var_172_59:setOnUpdate(LuaHelper.FloatAction(function(arg_173_0)
					arg_169_1.dialogCg_.alpha = arg_173_0
				end))
				var_172_59:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_169_1.dialog_)
					var_172_59:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_169_1.duration_ = arg_169_1.duration_ + 0.3

				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_60 = arg_169_1:FormatText(StoryNameCfg[255].name)

				arg_169_1.leftNameTxt_.text = var_172_60

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_61 = arg_169_1:GetWordFromCfg(114202042)
				local var_172_62 = arg_169_1:FormatText(var_172_61.content)

				arg_169_1.text_.text = var_172_62

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_63 = 45
				local var_172_64 = utf8.len(var_172_62)
				local var_172_65 = var_172_63 <= 0 and var_172_58 or var_172_58 * (var_172_64 / var_172_63)

				if var_172_65 > 0 and var_172_58 < var_172_65 then
					arg_169_1.talkMaxDuration = var_172_65
					var_172_57 = var_172_57 + 0.3

					if var_172_65 + var_172_57 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_65 + var_172_57
					end
				end

				arg_169_1.text_.text = var_172_62
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114202", "114202042", "story_v_out_114202.awb") ~= 0 then
					local var_172_66 = manager.audio:GetVoiceLength("story_v_out_114202", "114202042", "story_v_out_114202.awb") / 1000

					if var_172_66 + var_172_57 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_66 + var_172_57
					end

					if var_172_61.prefab_name ~= "" and arg_169_1.actors_[var_172_61.prefab_name] ~= nil then
						local var_172_67 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_61.prefab_name].transform, "story_v_out_114202", "114202042", "story_v_out_114202.awb")

						arg_169_1:RecordAudio("114202042", var_172_67)
						arg_169_1:RecordAudio("114202042", var_172_67)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_out_114202", "114202042", "story_v_out_114202.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_out_114202", "114202042", "story_v_out_114202.awb")
				end

				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_68 = var_172_57 + 0.3
			local var_172_69 = math.max(var_172_58, arg_169_1.talkMaxDuration)

			if var_172_68 <= arg_169_1.time_ and arg_169_1.time_ < var_172_68 + var_172_69 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_68) / var_172_69

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_68 + var_172_69 and arg_169_1.time_ < var_172_68 + var_172_69 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play114202043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 114202043
		arg_175_1.duration_ = 6.9

		local var_175_0 = {
			ja = 5.9,
			ko = 6.9,
			zh = 4.9,
			en = 5.466
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
				arg_175_0:Play114202044(arg_175_1)
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
					local var_178_5 = Mathf.Lerp(1, 0.5, var_178_4)
					local var_178_6 = arg_175_1.var_.highlightMatValue10017
					local var_178_7 = var_178_6.color

					var_178_7.r = var_178_5
					var_178_7.g = var_178_5
					var_178_7.b = var_178_5
					var_178_6.color = var_178_7
				end
			end

			if arg_175_1.time_ >= var_178_1 + var_178_3 and arg_175_1.time_ < var_178_1 + var_178_3 + arg_178_0 and arg_175_1.var_.highlightMatValue10017 then
				local var_178_8 = 0.5
				local var_178_9 = arg_175_1.var_.highlightMatValue10017
				local var_178_10 = var_178_9.color

				var_178_10.r = var_178_8
				var_178_10.g = var_178_8
				var_178_10.b = var_178_8
				var_178_9.color = var_178_10
			end

			local var_178_11 = 0
			local var_178_12 = 0.55

			if var_178_11 < arg_175_1.time_ and arg_175_1.time_ <= var_178_11 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_13 = arg_175_1:FormatText(StoryNameCfg[209].name)

				arg_175_1.leftNameTxt_.text = var_178_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, true)
				arg_175_1.iconController_:SetSelectedState("hero")

				arg_175_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2050")

				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_14 = arg_175_1:GetWordFromCfg(114202043)
				local var_178_15 = arg_175_1:FormatText(var_178_14.content)

				arg_175_1.text_.text = var_178_15

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_16 = 22
				local var_178_17 = utf8.len(var_178_15)
				local var_178_18 = var_178_16 <= 0 and var_178_12 or var_178_12 * (var_178_17 / var_178_16)

				if var_178_18 > 0 and var_178_12 < var_178_18 then
					arg_175_1.talkMaxDuration = var_178_18

					if var_178_18 + var_178_11 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_18 + var_178_11
					end
				end

				arg_175_1.text_.text = var_178_15
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114202", "114202043", "story_v_out_114202.awb") ~= 0 then
					local var_178_19 = manager.audio:GetVoiceLength("story_v_out_114202", "114202043", "story_v_out_114202.awb") / 1000

					if var_178_19 + var_178_11 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_19 + var_178_11
					end

					if var_178_14.prefab_name ~= "" and arg_175_1.actors_[var_178_14.prefab_name] ~= nil then
						local var_178_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_14.prefab_name].transform, "story_v_out_114202", "114202043", "story_v_out_114202.awb")

						arg_175_1:RecordAudio("114202043", var_178_20)
						arg_175_1:RecordAudio("114202043", var_178_20)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_114202", "114202043", "story_v_out_114202.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_114202", "114202043", "story_v_out_114202.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_21 = math.max(var_178_12, arg_175_1.talkMaxDuration)

			if var_178_11 <= arg_175_1.time_ and arg_175_1.time_ < var_178_11 + var_178_21 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_11) / var_178_21

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_11 + var_178_21 and arg_175_1.time_ < var_178_11 + var_178_21 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play114202044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 114202044
		arg_179_1.duration_ = 5.433

		local var_179_0 = {
			ja = 5.433,
			ko = 4.9,
			zh = 4.466,
			en = 4.566
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
				arg_179_0:Play114202045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["10017"]
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 then
				local var_182_2 = var_182_0:GetComponent("Image")

				if var_182_2 then
					arg_179_1.var_.highlightMatValue10017 = var_182_2
				end
			end

			local var_182_3 = 0.034

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_3 then
				local var_182_4 = (arg_179_1.time_ - var_182_1) / var_182_3

				if arg_179_1.var_.highlightMatValue10017 then
					local var_182_5 = Mathf.Lerp(0.5, 1, var_182_4)
					local var_182_6 = arg_179_1.var_.highlightMatValue10017
					local var_182_7 = var_182_6.color

					var_182_7.r = var_182_5
					var_182_7.g = var_182_5
					var_182_7.b = var_182_5
					var_182_6.color = var_182_7
				end
			end

			if arg_179_1.time_ >= var_182_1 + var_182_3 and arg_179_1.time_ < var_182_1 + var_182_3 + arg_182_0 and arg_179_1.var_.highlightMatValue10017 then
				local var_182_8 = 1

				var_182_0.transform:SetSiblingIndex(1)

				local var_182_9 = arg_179_1.var_.highlightMatValue10017
				local var_182_10 = var_182_9.color

				var_182_10.r = var_182_8
				var_182_10.g = var_182_8
				var_182_10.b = var_182_8
				var_182_9.color = var_182_10
			end

			local var_182_11 = 0
			local var_182_12 = 0.425

			if var_182_11 < arg_179_1.time_ and arg_179_1.time_ <= var_182_11 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_13 = arg_179_1:FormatText(StoryNameCfg[255].name)

				arg_179_1.leftNameTxt_.text = var_182_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_14 = arg_179_1:GetWordFromCfg(114202044)
				local var_182_15 = arg_179_1:FormatText(var_182_14.content)

				arg_179_1.text_.text = var_182_15

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_16 = 17
				local var_182_17 = utf8.len(var_182_15)
				local var_182_18 = var_182_16 <= 0 and var_182_12 or var_182_12 * (var_182_17 / var_182_16)

				if var_182_18 > 0 and var_182_12 < var_182_18 then
					arg_179_1.talkMaxDuration = var_182_18

					if var_182_18 + var_182_11 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_18 + var_182_11
					end
				end

				arg_179_1.text_.text = var_182_15
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114202", "114202044", "story_v_out_114202.awb") ~= 0 then
					local var_182_19 = manager.audio:GetVoiceLength("story_v_out_114202", "114202044", "story_v_out_114202.awb") / 1000

					if var_182_19 + var_182_11 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_19 + var_182_11
					end

					if var_182_14.prefab_name ~= "" and arg_179_1.actors_[var_182_14.prefab_name] ~= nil then
						local var_182_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_14.prefab_name].transform, "story_v_out_114202", "114202044", "story_v_out_114202.awb")

						arg_179_1:RecordAudio("114202044", var_182_20)
						arg_179_1:RecordAudio("114202044", var_182_20)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_114202", "114202044", "story_v_out_114202.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_114202", "114202044", "story_v_out_114202.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_21 = math.max(var_182_12, arg_179_1.talkMaxDuration)

			if var_182_11 <= arg_179_1.time_ and arg_179_1.time_ < var_182_11 + var_182_21 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_11) / var_182_21

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_11 + var_182_21 and arg_179_1.time_ < var_182_11 + var_182_21 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play114202045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 114202045
		arg_183_1.duration_ = 5

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play114202046(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["10017"]
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 then
				local var_186_2 = var_186_0:GetComponent("Image")

				if var_186_2 then
					arg_183_1.var_.alphaMatValue10017 = var_186_2
					arg_183_1.var_.alphaOldValue10017 = var_186_2.color.a
				end

				arg_183_1.var_.alphaOldValue10017 = 0
			end

			local var_186_3 = 0.5

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_3 then
				local var_186_4 = (arg_183_1.time_ - var_186_1) / var_186_3
				local var_186_5 = Mathf.Lerp(arg_183_1.var_.alphaOldValue10017, 1, var_186_4)

				if arg_183_1.var_.alphaMatValue10017 then
					local var_186_6 = arg_183_1.var_.alphaMatValue10017.color

					var_186_6.a = var_186_5
					arg_183_1.var_.alphaMatValue10017.color = var_186_6
				end
			end

			if arg_183_1.time_ >= var_186_1 + var_186_3 and arg_183_1.time_ < var_186_1 + var_186_3 + arg_186_0 and arg_183_1.var_.alphaMatValue10017 then
				local var_186_7 = arg_183_1.var_.alphaMatValue10017
				local var_186_8 = var_186_7.color

				var_186_8.a = 1
				var_186_7.color = var_186_8
			end

			local var_186_9 = 0
			local var_186_10 = 0.725

			if var_186_9 < arg_183_1.time_ and arg_183_1.time_ <= var_186_9 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, false)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_11 = arg_183_1:GetWordFromCfg(114202045)
				local var_186_12 = arg_183_1:FormatText(var_186_11.content)

				arg_183_1.text_.text = var_186_12

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_13 = 29
				local var_186_14 = utf8.len(var_186_12)
				local var_186_15 = var_186_13 <= 0 and var_186_10 or var_186_10 * (var_186_14 / var_186_13)

				if var_186_15 > 0 and var_186_10 < var_186_15 then
					arg_183_1.talkMaxDuration = var_186_15

					if var_186_15 + var_186_9 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_15 + var_186_9
					end
				end

				arg_183_1.text_.text = var_186_12
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)
				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_16 = math.max(var_186_10, arg_183_1.talkMaxDuration)

			if var_186_9 <= arg_183_1.time_ and arg_183_1.time_ < var_186_9 + var_186_16 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_9) / var_186_16

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_9 + var_186_16 and arg_183_1.time_ < var_186_9 + var_186_16 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play114202046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 114202046
		arg_187_1.duration_ = 17.2

		local var_187_0 = {
			ja = 4.133,
			ko = 11.333,
			zh = 11.166,
			en = 17.2
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
				arg_187_0:Play114202047(arg_187_1)
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

			local var_190_16 = arg_187_1.actors_["10017"]
			local var_190_17 = 0

			if var_190_17 < arg_187_1.time_ and arg_187_1.time_ <= var_190_17 + arg_190_0 then
				local var_190_18 = var_190_16:GetComponent("Image")

				if var_190_18 then
					arg_187_1.var_.alphaMatValue10017 = var_190_18
					arg_187_1.var_.alphaOldValue10017 = var_190_18.color.a
				end

				arg_187_1.var_.alphaOldValue10017 = 0
			end

			local var_190_19 = 0.5

			if var_190_17 <= arg_187_1.time_ and arg_187_1.time_ < var_190_17 + var_190_19 then
				local var_190_20 = (arg_187_1.time_ - var_190_17) / var_190_19
				local var_190_21 = Mathf.Lerp(arg_187_1.var_.alphaOldValue10017, 1, var_190_20)

				if arg_187_1.var_.alphaMatValue10017 then
					local var_190_22 = arg_187_1.var_.alphaMatValue10017.color

					var_190_22.a = var_190_21
					arg_187_1.var_.alphaMatValue10017.color = var_190_22
				end
			end

			if arg_187_1.time_ >= var_190_17 + var_190_19 and arg_187_1.time_ < var_190_17 + var_190_19 + arg_190_0 and arg_187_1.var_.alphaMatValue10017 then
				local var_190_23 = arg_187_1.var_.alphaMatValue10017
				local var_190_24 = var_190_23.color

				var_190_24.a = 1
				var_190_23.color = var_190_24
			end

			local var_190_25 = 0
			local var_190_26 = 1.1

			if var_190_25 < arg_187_1.time_ and arg_187_1.time_ <= var_190_25 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_27 = arg_187_1:FormatText(StoryNameCfg[255].name)

				arg_187_1.leftNameTxt_.text = var_190_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_28 = arg_187_1:GetWordFromCfg(114202046)
				local var_190_29 = arg_187_1:FormatText(var_190_28.content)

				arg_187_1.text_.text = var_190_29

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_30 = 44
				local var_190_31 = utf8.len(var_190_29)
				local var_190_32 = var_190_30 <= 0 and var_190_26 or var_190_26 * (var_190_31 / var_190_30)

				if var_190_32 > 0 and var_190_26 < var_190_32 then
					arg_187_1.talkMaxDuration = var_190_32

					if var_190_32 + var_190_25 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_32 + var_190_25
					end
				end

				arg_187_1.text_.text = var_190_29
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114202", "114202046", "story_v_out_114202.awb") ~= 0 then
					local var_190_33 = manager.audio:GetVoiceLength("story_v_out_114202", "114202046", "story_v_out_114202.awb") / 1000

					if var_190_33 + var_190_25 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_33 + var_190_25
					end

					if var_190_28.prefab_name ~= "" and arg_187_1.actors_[var_190_28.prefab_name] ~= nil then
						local var_190_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_28.prefab_name].transform, "story_v_out_114202", "114202046", "story_v_out_114202.awb")

						arg_187_1:RecordAudio("114202046", var_190_34)
						arg_187_1:RecordAudio("114202046", var_190_34)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_114202", "114202046", "story_v_out_114202.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_114202", "114202046", "story_v_out_114202.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_35 = math.max(var_190_26, arg_187_1.talkMaxDuration)

			if var_190_25 <= arg_187_1.time_ and arg_187_1.time_ < var_190_25 + var_190_35 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_25) / var_190_35

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_25 + var_190_35 and arg_187_1.time_ < var_190_25 + var_190_35 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play114202047 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 114202047
		arg_191_1.duration_ = 4.1

		local var_191_0 = {
			ja = 2.733,
			ko = 3.733,
			zh = 4.1,
			en = 3.266
		}
		local var_191_1 = manager.audio:GetLocalizationFlag()

		if var_191_0[var_191_1] ~= nil then
			arg_191_1.duration_ = var_191_0[var_191_1]
		end

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play114202048(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["10015"].transform
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 then
				arg_191_1.var_.moveOldPos10015 = var_194_0.localPosition
				var_194_0.localScale = Vector3.New(1, 1, 1)

				arg_191_1:CheckSpriteTmpPos("10015", 4)

				local var_194_2 = var_194_0.childCount

				for iter_194_0 = 0, var_194_2 - 1 do
					local var_194_3 = var_194_0:GetChild(iter_194_0)

					if var_194_3.name == "split_1" or not string.find(var_194_3.name, "split") then
						var_194_3.gameObject:SetActive(true)
					else
						var_194_3.gameObject:SetActive(false)
					end
				end
			end

			local var_194_4 = 0.001

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_4 then
				local var_194_5 = (arg_191_1.time_ - var_194_1) / var_194_4
				local var_194_6 = Vector3.New(390, -350, -180)

				var_194_0.localPosition = Vector3.Lerp(arg_191_1.var_.moveOldPos10015, var_194_6, var_194_5)
			end

			if arg_191_1.time_ >= var_194_1 + var_194_4 and arg_191_1.time_ < var_194_1 + var_194_4 + arg_194_0 then
				var_194_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_194_7 = arg_191_1.actors_["10017"]
			local var_194_8 = 0

			if var_194_8 < arg_191_1.time_ and arg_191_1.time_ <= var_194_8 + arg_194_0 then
				local var_194_9 = var_194_7:GetComponent("Image")

				if var_194_9 then
					arg_191_1.var_.highlightMatValue10017 = var_194_9
				end
			end

			local var_194_10 = 0.034

			if var_194_8 <= arg_191_1.time_ and arg_191_1.time_ < var_194_8 + var_194_10 then
				local var_194_11 = (arg_191_1.time_ - var_194_8) / var_194_10

				if arg_191_1.var_.highlightMatValue10017 then
					local var_194_12 = Mathf.Lerp(1, 0.5, var_194_11)
					local var_194_13 = arg_191_1.var_.highlightMatValue10017
					local var_194_14 = var_194_13.color

					var_194_14.r = var_194_12
					var_194_14.g = var_194_12
					var_194_14.b = var_194_12
					var_194_13.color = var_194_14
				end
			end

			if arg_191_1.time_ >= var_194_8 + var_194_10 and arg_191_1.time_ < var_194_8 + var_194_10 + arg_194_0 and arg_191_1.var_.highlightMatValue10017 then
				local var_194_15 = 0.5
				local var_194_16 = arg_191_1.var_.highlightMatValue10017
				local var_194_17 = var_194_16.color

				var_194_17.r = var_194_15
				var_194_17.g = var_194_15
				var_194_17.b = var_194_15
				var_194_16.color = var_194_17
			end

			local var_194_18 = arg_191_1.actors_["10015"]
			local var_194_19 = 0

			if var_194_19 < arg_191_1.time_ and arg_191_1.time_ <= var_194_19 + arg_194_0 and arg_191_1.var_.actorSpriteComps10015 == nil then
				arg_191_1.var_.actorSpriteComps10015 = var_194_18:GetComponentsInChildren(typeof(Image), true)
			end

			local var_194_20 = 0.034

			if var_194_19 <= arg_191_1.time_ and arg_191_1.time_ < var_194_19 + var_194_20 then
				local var_194_21 = (arg_191_1.time_ - var_194_19) / var_194_20

				if arg_191_1.var_.actorSpriteComps10015 then
					for iter_194_1, iter_194_2 in pairs(arg_191_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_194_2 then
							local var_194_22 = Mathf.Lerp(iter_194_2.color.r, 1, var_194_21)

							iter_194_2.color = Color.New(var_194_22, var_194_22, var_194_22)
						end
					end
				end
			end

			if arg_191_1.time_ >= var_194_19 + var_194_20 and arg_191_1.time_ < var_194_19 + var_194_20 + arg_194_0 and arg_191_1.var_.actorSpriteComps10015 then
				local var_194_23 = 1

				for iter_194_3, iter_194_4 in pairs(arg_191_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_194_4 then
						iter_194_4.color = Color.New(var_194_23, var_194_23, var_194_23)
					end
				end

				arg_191_1.var_.actorSpriteComps10015 = nil
			end

			local var_194_24 = arg_191_1.actors_["10015"]
			local var_194_25 = 0

			if var_194_25 < arg_191_1.time_ and arg_191_1.time_ <= var_194_25 + arg_194_0 then
				local var_194_26 = var_194_24:GetComponentInChildren(typeof(CanvasGroup))

				if var_194_26 then
					arg_191_1.var_.alphaOldValue10015 = var_194_26.alpha
					arg_191_1.var_.characterEffect10015 = var_194_26
				end

				arg_191_1.var_.alphaOldValue10015 = 0
			end

			local var_194_27 = 0.5

			if var_194_25 <= arg_191_1.time_ and arg_191_1.time_ < var_194_25 + var_194_27 then
				local var_194_28 = (arg_191_1.time_ - var_194_25) / var_194_27
				local var_194_29 = Mathf.Lerp(arg_191_1.var_.alphaOldValue10015, 1, var_194_28)

				if arg_191_1.var_.characterEffect10015 then
					arg_191_1.var_.characterEffect10015.alpha = var_194_29
				end
			end

			if arg_191_1.time_ >= var_194_25 + var_194_27 and arg_191_1.time_ < var_194_25 + var_194_27 + arg_194_0 and arg_191_1.var_.characterEffect10015 then
				arg_191_1.var_.characterEffect10015.alpha = 1
			end

			local var_194_30 = 0
			local var_194_31 = 0.375

			if var_194_30 < arg_191_1.time_ and arg_191_1.time_ <= var_194_30 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_32 = arg_191_1:FormatText(StoryNameCfg[208].name)

				arg_191_1.leftNameTxt_.text = var_194_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_33 = arg_191_1:GetWordFromCfg(114202047)
				local var_194_34 = arg_191_1:FormatText(var_194_33.content)

				arg_191_1.text_.text = var_194_34

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_35 = 15
				local var_194_36 = utf8.len(var_194_34)
				local var_194_37 = var_194_35 <= 0 and var_194_31 or var_194_31 * (var_194_36 / var_194_35)

				if var_194_37 > 0 and var_194_31 < var_194_37 then
					arg_191_1.talkMaxDuration = var_194_37

					if var_194_37 + var_194_30 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_37 + var_194_30
					end
				end

				arg_191_1.text_.text = var_194_34
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114202", "114202047", "story_v_out_114202.awb") ~= 0 then
					local var_194_38 = manager.audio:GetVoiceLength("story_v_out_114202", "114202047", "story_v_out_114202.awb") / 1000

					if var_194_38 + var_194_30 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_38 + var_194_30
					end

					if var_194_33.prefab_name ~= "" and arg_191_1.actors_[var_194_33.prefab_name] ~= nil then
						local var_194_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_33.prefab_name].transform, "story_v_out_114202", "114202047", "story_v_out_114202.awb")

						arg_191_1:RecordAudio("114202047", var_194_39)
						arg_191_1:RecordAudio("114202047", var_194_39)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_114202", "114202047", "story_v_out_114202.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_114202", "114202047", "story_v_out_114202.awb")
				end

				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_40 = math.max(var_194_31, arg_191_1.talkMaxDuration)

			if var_194_30 <= arg_191_1.time_ and arg_191_1.time_ < var_194_30 + var_194_40 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_30) / var_194_40

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_30 + var_194_40 and arg_191_1.time_ < var_194_30 + var_194_40 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play114202048 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 114202048
		arg_195_1.duration_ = 7.566

		local var_195_0 = {
			ja = 4.933,
			ko = 5.9,
			zh = 5.733,
			en = 7.566
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
				arg_195_0:Play114202049(arg_195_1)
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

			local var_198_11 = arg_195_1.actors_["10015"]
			local var_198_12 = 0

			if var_198_12 < arg_195_1.time_ and arg_195_1.time_ <= var_198_12 + arg_198_0 and arg_195_1.var_.actorSpriteComps10015 == nil then
				arg_195_1.var_.actorSpriteComps10015 = var_198_11:GetComponentsInChildren(typeof(Image), true)
			end

			local var_198_13 = 0.034

			if var_198_12 <= arg_195_1.time_ and arg_195_1.time_ < var_198_12 + var_198_13 then
				local var_198_14 = (arg_195_1.time_ - var_198_12) / var_198_13

				if arg_195_1.var_.actorSpriteComps10015 then
					for iter_198_0, iter_198_1 in pairs(arg_195_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_198_1 then
							local var_198_15 = Mathf.Lerp(iter_198_1.color.r, 0.5, var_198_14)

							iter_198_1.color = Color.New(var_198_15, var_198_15, var_198_15)
						end
					end
				end
			end

			if arg_195_1.time_ >= var_198_12 + var_198_13 and arg_195_1.time_ < var_198_12 + var_198_13 + arg_198_0 and arg_195_1.var_.actorSpriteComps10015 then
				local var_198_16 = 0.5

				for iter_198_2, iter_198_3 in pairs(arg_195_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_198_3 then
						iter_198_3.color = Color.New(var_198_16, var_198_16, var_198_16)
					end
				end

				arg_195_1.var_.actorSpriteComps10015 = nil
			end

			local var_198_17 = 0
			local var_198_18 = 0.6

			if var_198_17 < arg_195_1.time_ and arg_195_1.time_ <= var_198_17 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_19 = arg_195_1:FormatText(StoryNameCfg[255].name)

				arg_195_1.leftNameTxt_.text = var_198_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_20 = arg_195_1:GetWordFromCfg(114202048)
				local var_198_21 = arg_195_1:FormatText(var_198_20.content)

				arg_195_1.text_.text = var_198_21

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_22 = 24
				local var_198_23 = utf8.len(var_198_21)
				local var_198_24 = var_198_22 <= 0 and var_198_18 or var_198_18 * (var_198_23 / var_198_22)

				if var_198_24 > 0 and var_198_18 < var_198_24 then
					arg_195_1.talkMaxDuration = var_198_24

					if var_198_24 + var_198_17 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_24 + var_198_17
					end
				end

				arg_195_1.text_.text = var_198_21
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114202", "114202048", "story_v_out_114202.awb") ~= 0 then
					local var_198_25 = manager.audio:GetVoiceLength("story_v_out_114202", "114202048", "story_v_out_114202.awb") / 1000

					if var_198_25 + var_198_17 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_25 + var_198_17
					end

					if var_198_20.prefab_name ~= "" and arg_195_1.actors_[var_198_20.prefab_name] ~= nil then
						local var_198_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_20.prefab_name].transform, "story_v_out_114202", "114202048", "story_v_out_114202.awb")

						arg_195_1:RecordAudio("114202048", var_198_26)
						arg_195_1:RecordAudio("114202048", var_198_26)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_114202", "114202048", "story_v_out_114202.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_114202", "114202048", "story_v_out_114202.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_27 = math.max(var_198_18, arg_195_1.talkMaxDuration)

			if var_198_17 <= arg_195_1.time_ and arg_195_1.time_ < var_198_17 + var_198_27 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_17) / var_198_27

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_17 + var_198_27 and arg_195_1.time_ < var_198_17 + var_198_27 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play114202049 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 114202049
		arg_199_1.duration_ = 15.6

		local var_199_0 = {
			ja = 15.6,
			ko = 9.533,
			zh = 8.866,
			en = 8.7
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
		end

		function arg_199_1.playNext_(arg_201_0)
			if arg_201_0 == 1 then
				arg_199_0:Play114202050(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = 0
			local var_202_1 = 0.95

			if var_202_0 < arg_199_1.time_ and arg_199_1.time_ <= var_202_0 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_2 = arg_199_1:FormatText(StoryNameCfg[255].name)

				arg_199_1.leftNameTxt_.text = var_202_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_3 = arg_199_1:GetWordFromCfg(114202049)
				local var_202_4 = arg_199_1:FormatText(var_202_3.content)

				arg_199_1.text_.text = var_202_4

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_5 = 38
				local var_202_6 = utf8.len(var_202_4)
				local var_202_7 = var_202_5 <= 0 and var_202_1 or var_202_1 * (var_202_6 / var_202_5)

				if var_202_7 > 0 and var_202_1 < var_202_7 then
					arg_199_1.talkMaxDuration = var_202_7

					if var_202_7 + var_202_0 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_7 + var_202_0
					end
				end

				arg_199_1.text_.text = var_202_4
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114202", "114202049", "story_v_out_114202.awb") ~= 0 then
					local var_202_8 = manager.audio:GetVoiceLength("story_v_out_114202", "114202049", "story_v_out_114202.awb") / 1000

					if var_202_8 + var_202_0 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_8 + var_202_0
					end

					if var_202_3.prefab_name ~= "" and arg_199_1.actors_[var_202_3.prefab_name] ~= nil then
						local var_202_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_3.prefab_name].transform, "story_v_out_114202", "114202049", "story_v_out_114202.awb")

						arg_199_1:RecordAudio("114202049", var_202_9)
						arg_199_1:RecordAudio("114202049", var_202_9)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_114202", "114202049", "story_v_out_114202.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_114202", "114202049", "story_v_out_114202.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_10 = math.max(var_202_1, arg_199_1.talkMaxDuration)

			if var_202_0 <= arg_199_1.time_ and arg_199_1.time_ < var_202_0 + var_202_10 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_0) / var_202_10

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_0 + var_202_10 and arg_199_1.time_ < var_202_0 + var_202_10 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play114202050 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 114202050
		arg_203_1.duration_ = 2.333

		local var_203_0 = {
			ja = 2.333,
			ko = 2.266,
			zh = 1.4,
			en = 1.5
		}
		local var_203_1 = manager.audio:GetLocalizationFlag()

		if var_203_0[var_203_1] ~= nil then
			arg_203_1.duration_ = var_203_0[var_203_1]
		end

		SetActive(arg_203_1.tipsGo_, false)

		function arg_203_1.onSingleLineFinish_()
			arg_203_1.onSingleLineUpdate_ = nil
			arg_203_1.onSingleLineFinish_ = nil
			arg_203_1.state_ = "waiting"
			arg_203_1.auto_ = false
		end

		function arg_203_1.playNext_(arg_205_0)
			arg_203_1.onStoryFinished_()
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["10015"].transform
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 then
				arg_203_1.var_.moveOldPos10015 = var_206_0.localPosition
				var_206_0.localScale = Vector3.New(1, 1, 1)

				arg_203_1:CheckSpriteTmpPos("10015", 7)

				local var_206_2 = var_206_0.childCount

				for iter_206_0 = 0, var_206_2 - 1 do
					local var_206_3 = var_206_0:GetChild(iter_206_0)

					if var_206_3.name == "split_1" or not string.find(var_206_3.name, "split") then
						var_206_3.gameObject:SetActive(true)
					else
						var_206_3.gameObject:SetActive(false)
					end
				end
			end

			local var_206_4 = 0.001

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_4 then
				local var_206_5 = (arg_203_1.time_ - var_206_1) / var_206_4
				local var_206_6 = Vector3.New(0, -2000, 300)

				var_206_0.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos10015, var_206_6, var_206_5)
			end

			if arg_203_1.time_ >= var_206_1 + var_206_4 and arg_203_1.time_ < var_206_1 + var_206_4 + arg_206_0 then
				var_206_0.localPosition = Vector3.New(0, -2000, 300)
			end

			local var_206_7 = arg_203_1.actors_["10017"]
			local var_206_8 = 0

			if var_206_8 < arg_203_1.time_ and arg_203_1.time_ <= var_206_8 + arg_206_0 then
				local var_206_9 = var_206_7:GetComponent("Image")

				if var_206_9 then
					arg_203_1.var_.highlightMatValue10017 = var_206_9
				end
			end

			local var_206_10 = 0.034

			if var_206_8 <= arg_203_1.time_ and arg_203_1.time_ < var_206_8 + var_206_10 then
				local var_206_11 = (arg_203_1.time_ - var_206_8) / var_206_10

				if arg_203_1.var_.highlightMatValue10017 then
					local var_206_12 = Mathf.Lerp(1, 0.5, var_206_11)
					local var_206_13 = arg_203_1.var_.highlightMatValue10017
					local var_206_14 = var_206_13.color

					var_206_14.r = var_206_12
					var_206_14.g = var_206_12
					var_206_14.b = var_206_12
					var_206_13.color = var_206_14
				end
			end

			if arg_203_1.time_ >= var_206_8 + var_206_10 and arg_203_1.time_ < var_206_8 + var_206_10 + arg_206_0 and arg_203_1.var_.highlightMatValue10017 then
				local var_206_15 = 0.5
				local var_206_16 = arg_203_1.var_.highlightMatValue10017
				local var_206_17 = var_206_16.color

				var_206_17.r = var_206_15
				var_206_17.g = var_206_15
				var_206_17.b = var_206_15
				var_206_16.color = var_206_17
			end

			local var_206_18 = arg_203_1.actors_["10015"]
			local var_206_19 = 0

			if var_206_19 < arg_203_1.time_ and arg_203_1.time_ <= var_206_19 + arg_206_0 and arg_203_1.var_.actorSpriteComps10015 == nil then
				arg_203_1.var_.actorSpriteComps10015 = var_206_18:GetComponentsInChildren(typeof(Image), true)
			end

			local var_206_20 = 0.034

			if var_206_19 <= arg_203_1.time_ and arg_203_1.time_ < var_206_19 + var_206_20 then
				local var_206_21 = (arg_203_1.time_ - var_206_19) / var_206_20

				if arg_203_1.var_.actorSpriteComps10015 then
					for iter_206_1, iter_206_2 in pairs(arg_203_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_206_2 then
							local var_206_22 = Mathf.Lerp(iter_206_2.color.r, 1, var_206_21)

							iter_206_2.color = Color.New(var_206_22, var_206_22, var_206_22)
						end
					end
				end
			end

			if arg_203_1.time_ >= var_206_19 + var_206_20 and arg_203_1.time_ < var_206_19 + var_206_20 + arg_206_0 and arg_203_1.var_.actorSpriteComps10015 then
				local var_206_23 = 1

				for iter_206_3, iter_206_4 in pairs(arg_203_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_206_4 then
						iter_206_4.color = Color.New(var_206_23, var_206_23, var_206_23)
					end
				end

				arg_203_1.var_.actorSpriteComps10015 = nil
			end

			local var_206_24 = arg_203_1.actors_["10015"].transform
			local var_206_25 = 0

			if var_206_25 < arg_203_1.time_ and arg_203_1.time_ <= var_206_25 + arg_206_0 then
				arg_203_1.var_.moveOldPos10015 = var_206_24.localPosition
				var_206_24.localScale = Vector3.New(1, 1, 1)

				arg_203_1:CheckSpriteTmpPos("10015", 4)

				local var_206_26 = var_206_24.childCount

				for iter_206_5 = 0, var_206_26 - 1 do
					local var_206_27 = var_206_24:GetChild(iter_206_5)

					if var_206_27.name == "split_5" or not string.find(var_206_27.name, "split") then
						var_206_27.gameObject:SetActive(true)
					else
						var_206_27.gameObject:SetActive(false)
					end
				end
			end

			local var_206_28 = 0.001

			if var_206_25 <= arg_203_1.time_ and arg_203_1.time_ < var_206_25 + var_206_28 then
				local var_206_29 = (arg_203_1.time_ - var_206_25) / var_206_28
				local var_206_30 = Vector3.New(390, -350, -180)

				var_206_24.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos10015, var_206_30, var_206_29)
			end

			if arg_203_1.time_ >= var_206_25 + var_206_28 and arg_203_1.time_ < var_206_25 + var_206_28 + arg_206_0 then
				var_206_24.localPosition = Vector3.New(390, -350, -180)
			end

			local var_206_31 = 0
			local var_206_32 = 0.125

			if var_206_31 < arg_203_1.time_ and arg_203_1.time_ <= var_206_31 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_33 = arg_203_1:FormatText(StoryNameCfg[208].name)

				arg_203_1.leftNameTxt_.text = var_206_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_34 = arg_203_1:GetWordFromCfg(114202050)
				local var_206_35 = arg_203_1:FormatText(var_206_34.content)

				arg_203_1.text_.text = var_206_35

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_36 = 5
				local var_206_37 = utf8.len(var_206_35)
				local var_206_38 = var_206_36 <= 0 and var_206_32 or var_206_32 * (var_206_37 / var_206_36)

				if var_206_38 > 0 and var_206_32 < var_206_38 then
					arg_203_1.talkMaxDuration = var_206_38

					if var_206_38 + var_206_31 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_38 + var_206_31
					end
				end

				arg_203_1.text_.text = var_206_35
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114202", "114202050", "story_v_out_114202.awb") ~= 0 then
					local var_206_39 = manager.audio:GetVoiceLength("story_v_out_114202", "114202050", "story_v_out_114202.awb") / 1000

					if var_206_39 + var_206_31 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_39 + var_206_31
					end

					if var_206_34.prefab_name ~= "" and arg_203_1.actors_[var_206_34.prefab_name] ~= nil then
						local var_206_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_34.prefab_name].transform, "story_v_out_114202", "114202050", "story_v_out_114202.awb")

						arg_203_1:RecordAudio("114202050", var_206_40)
						arg_203_1:RecordAudio("114202050", var_206_40)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_114202", "114202050", "story_v_out_114202.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_114202", "114202050", "story_v_out_114202.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_41 = math.max(var_206_32, arg_203_1.talkMaxDuration)

			if var_206_31 <= arg_203_1.time_ and arg_203_1.time_ < var_206_31 + var_206_41 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_31) / var_206_41

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_31 + var_206_41 and arg_203_1.time_ < var_206_31 + var_206_41 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/F04",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST21"
	},
	voices = {
		"story_v_out_114202.awb"
	}
}
