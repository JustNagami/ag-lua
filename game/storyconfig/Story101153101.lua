return {
	Play115311001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 115311001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play115311002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST22a"

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
				local var_4_5 = arg_1_1.bgs_.ST22a

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
					if iter_4_0 ~= "ST22a" then
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
				local var_4_25 = "effect"

				arg_1_1:AudioAction(var_4_24, var_4_25, "se_story_activity_1_5_3", "se_story_activity_1_5_3_fireworks_loop", "")
			end

			local var_4_26 = 0
			local var_4_27 = 0.333333333333333

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_30 = 0.466666666666667
			local var_4_31 = 0.533333333333333

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				local var_4_32 = "play"
				local var_4_33 = "music"

				arg_1_1:AudioAction(var_4_32, var_4_33, "bgm_side_daily04", "bgm_side_daily04", "bgm_side_daily04.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_34 = 2
			local var_4_35 = 0.125

			if var_4_34 < arg_1_1.time_ and arg_1_1.time_ <= var_4_34 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_36 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_36:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_36:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_36:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_37 = arg_1_1:GetWordFromCfg(115311001)
				local var_4_38 = arg_1_1:FormatText(var_4_37.content)

				arg_1_1.text_.text = var_4_38

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_39 = 5
				local var_4_40 = utf8.len(var_4_38)
				local var_4_41 = var_4_39 <= 0 and var_4_35 or var_4_35 * (var_4_40 / var_4_39)

				if var_4_41 > 0 and var_4_35 < var_4_41 then
					arg_1_1.talkMaxDuration = var_4_41
					var_4_34 = var_4_34 + 0.3

					if var_4_41 + var_4_34 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_41 + var_4_34
					end
				end

				arg_1_1.text_.text = var_4_38
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_42 = var_4_34 + 0.3
			local var_4_43 = math.max(var_4_35, arg_1_1.talkMaxDuration)

			if var_4_42 <= arg_1_1.time_ and arg_1_1.time_ < var_4_42 + var_4_43 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_42) / var_4_43

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_42 + var_4_43 and arg_1_1.time_ < var_4_42 + var_4_43 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play115311002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 115311002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play115311003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 1.025

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

				local var_10_2 = arg_7_1:GetWordFromCfg(115311002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 41
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
	Play115311003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 115311003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play115311004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 1.225

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

				local var_14_2 = arg_11_1:GetWordFromCfg(115311003)
				local var_14_3 = arg_11_1:FormatText(var_14_2.content)

				arg_11_1.text_.text = var_14_3

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_4 = 49
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
	Play115311004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 115311004
		arg_15_1.duration_ = 11.366

		local var_15_0 = {
			ja = 9.933,
			ko = 10.533,
			zh = 8.933,
			en = 11.366
		}
		local var_15_1 = manager.audio:GetLocalizationFlag()

		if var_15_0[var_15_1] ~= nil then
			arg_15_1.duration_ = var_15_0[var_15_1]
		end

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play115311005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 0.625

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_2 = arg_15_1:FormatText(StoryNameCfg[224].name)

				arg_15_1.leftNameTxt_.text = var_18_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, true)
				arg_15_1.iconController_:SetSelectedState("hero")

				arg_15_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_clerkb")

				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_3 = arg_15_1:GetWordFromCfg(115311004)
				local var_18_4 = arg_15_1:FormatText(var_18_3.content)

				arg_15_1.text_.text = var_18_4

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_5 = 25
				local var_18_6 = utf8.len(var_18_4)
				local var_18_7 = var_18_5 <= 0 and var_18_1 or var_18_1 * (var_18_6 / var_18_5)

				if var_18_7 > 0 and var_18_1 < var_18_7 then
					arg_15_1.talkMaxDuration = var_18_7

					if var_18_7 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_7 + var_18_0
					end
				end

				arg_15_1.text_.text = var_18_4
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311004", "story_v_out_115311.awb") ~= 0 then
					local var_18_8 = manager.audio:GetVoiceLength("story_v_out_115311", "115311004", "story_v_out_115311.awb") / 1000

					if var_18_8 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_8 + var_18_0
					end

					if var_18_3.prefab_name ~= "" and arg_15_1.actors_[var_18_3.prefab_name] ~= nil then
						local var_18_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_3.prefab_name].transform, "story_v_out_115311", "115311004", "story_v_out_115311.awb")

						arg_15_1:RecordAudio("115311004", var_18_9)
						arg_15_1:RecordAudio("115311004", var_18_9)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_115311", "115311004", "story_v_out_115311.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_115311", "115311004", "story_v_out_115311.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_10 = math.max(var_18_1, arg_15_1.talkMaxDuration)

			if var_18_0 <= arg_15_1.time_ and arg_15_1.time_ < var_18_0 + var_18_10 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_0) / var_18_10

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_0 + var_18_10 and arg_15_1.time_ < var_18_0 + var_18_10 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play115311005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 115311005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play115311006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 1.05

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

				local var_22_2 = arg_19_1:GetWordFromCfg(115311005)
				local var_22_3 = arg_19_1:FormatText(var_22_2.content)

				arg_19_1.text_.text = var_22_3

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_4 = 42
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
	Play115311006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 115311006
		arg_23_1.duration_ = 9.2

		local var_23_0 = {
			ja = 7.766,
			ko = 8.2,
			zh = 7.066,
			en = 9.2
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
				arg_23_0:Play115311007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 0.85

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_2 = arg_23_1:FormatText(StoryNameCfg[104].name)

				arg_23_1.leftNameTxt_.text = var_26_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, true)
				arg_23_1.iconController_:SetSelectedState("hero")

				arg_23_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_woundedd")

				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_3 = arg_23_1:GetWordFromCfg(115311006)
				local var_26_4 = arg_23_1:FormatText(var_26_3.content)

				arg_23_1.text_.text = var_26_4

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_5 = 34
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

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311006", "story_v_out_115311.awb") ~= 0 then
					local var_26_8 = manager.audio:GetVoiceLength("story_v_out_115311", "115311006", "story_v_out_115311.awb") / 1000

					if var_26_8 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_8 + var_26_0
					end

					if var_26_3.prefab_name ~= "" and arg_23_1.actors_[var_26_3.prefab_name] ~= nil then
						local var_26_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_3.prefab_name].transform, "story_v_out_115311", "115311006", "story_v_out_115311.awb")

						arg_23_1:RecordAudio("115311006", var_26_9)
						arg_23_1:RecordAudio("115311006", var_26_9)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_115311", "115311006", "story_v_out_115311.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_115311", "115311006", "story_v_out_115311.awb")
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
	Play115311007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 115311007
		arg_27_1.duration_ = 6.866

		local var_27_0 = {
			ja = 6.6,
			ko = 6.7,
			zh = 5.4,
			en = 6.866
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
				arg_27_0:Play115311008(arg_27_1)
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

				local var_30_2 = arg_27_1:FormatText(StoryNameCfg[105].name)

				arg_27_1.leftNameTxt_.text = var_30_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, true)
				arg_27_1.iconController_:SetSelectedState("hero")

				arg_27_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_officeladyb")

				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_3 = arg_27_1:GetWordFromCfg(115311007)
				local var_30_4 = arg_27_1:FormatText(var_30_3.content)

				arg_27_1.text_.text = var_30_4

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_5 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311007", "story_v_out_115311.awb") ~= 0 then
					local var_30_8 = manager.audio:GetVoiceLength("story_v_out_115311", "115311007", "story_v_out_115311.awb") / 1000

					if var_30_8 + var_30_0 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_8 + var_30_0
					end

					if var_30_3.prefab_name ~= "" and arg_27_1.actors_[var_30_3.prefab_name] ~= nil then
						local var_30_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_3.prefab_name].transform, "story_v_out_115311", "115311007", "story_v_out_115311.awb")

						arg_27_1:RecordAudio("115311007", var_30_9)
						arg_27_1:RecordAudio("115311007", var_30_9)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_115311", "115311007", "story_v_out_115311.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_115311", "115311007", "story_v_out_115311.awb")
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
	Play115311008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 115311008
		arg_31_1.duration_ = 9.166

		local var_31_0 = {
			ja = 8.2,
			ko = 7.533,
			zh = 9.166,
			en = 8.3
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
				arg_31_0:Play115311009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 0.875

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_2 = arg_31_1:FormatText(StoryNameCfg[105].name)

				arg_31_1.leftNameTxt_.text = var_34_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, true)
				arg_31_1.iconController_:SetSelectedState("hero")

				arg_31_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_officeladyb")

				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_3 = arg_31_1:GetWordFromCfg(115311008)
				local var_34_4 = arg_31_1:FormatText(var_34_3.content)

				arg_31_1.text_.text = var_34_4

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_5 = 35
				local var_34_6 = utf8.len(var_34_4)
				local var_34_7 = var_34_5 <= 0 and var_34_1 or var_34_1 * (var_34_6 / var_34_5)

				if var_34_7 > 0 and var_34_1 < var_34_7 then
					arg_31_1.talkMaxDuration = var_34_7

					if var_34_7 + var_34_0 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_7 + var_34_0
					end
				end

				arg_31_1.text_.text = var_34_4
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311008", "story_v_out_115311.awb") ~= 0 then
					local var_34_8 = manager.audio:GetVoiceLength("story_v_out_115311", "115311008", "story_v_out_115311.awb") / 1000

					if var_34_8 + var_34_0 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_8 + var_34_0
					end

					if var_34_3.prefab_name ~= "" and arg_31_1.actors_[var_34_3.prefab_name] ~= nil then
						local var_34_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_3.prefab_name].transform, "story_v_out_115311", "115311008", "story_v_out_115311.awb")

						arg_31_1:RecordAudio("115311008", var_34_9)
						arg_31_1:RecordAudio("115311008", var_34_9)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_115311", "115311008", "story_v_out_115311.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_115311", "115311008", "story_v_out_115311.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_10 = math.max(var_34_1, arg_31_1.talkMaxDuration)

			if var_34_0 <= arg_31_1.time_ and arg_31_1.time_ < var_34_0 + var_34_10 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_0) / var_34_10

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_0 + var_34_10 and arg_31_1.time_ < var_34_0 + var_34_10 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play115311009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 115311009
		arg_35_1.duration_ = 9.533

		local var_35_0 = {
			ja = 9.3,
			ko = 9.533,
			zh = 9,
			en = 9.533
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
				arg_35_0:Play115311010(arg_35_1)
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

				local var_38_2 = arg_35_1:FormatText(StoryNameCfg[104].name)

				arg_35_1.leftNameTxt_.text = var_38_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, true)
				arg_35_1.iconController_:SetSelectedState("hero")

				arg_35_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_woundedd")

				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_3 = arg_35_1:GetWordFromCfg(115311009)
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

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311009", "story_v_out_115311.awb") ~= 0 then
					local var_38_8 = manager.audio:GetVoiceLength("story_v_out_115311", "115311009", "story_v_out_115311.awb") / 1000

					if var_38_8 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_8 + var_38_0
					end

					if var_38_3.prefab_name ~= "" and arg_35_1.actors_[var_38_3.prefab_name] ~= nil then
						local var_38_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_3.prefab_name].transform, "story_v_out_115311", "115311009", "story_v_out_115311.awb")

						arg_35_1:RecordAudio("115311009", var_38_9)
						arg_35_1:RecordAudio("115311009", var_38_9)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_115311", "115311009", "story_v_out_115311.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_115311", "115311009", "story_v_out_115311.awb")
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
	Play115311010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 115311010
		arg_39_1.duration_ = 11.4

		local var_39_0 = {
			ja = 8.7,
			ko = 10.766,
			zh = 8.8,
			en = 11.4
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
				arg_39_0:Play115311011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0
			local var_42_1 = 0.975

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_2 = arg_39_1:FormatText(StoryNameCfg[104].name)

				arg_39_1.leftNameTxt_.text = var_42_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, true)
				arg_39_1.iconController_:SetSelectedState("hero")

				arg_39_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_woundedd")

				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_3 = arg_39_1:GetWordFromCfg(115311010)
				local var_42_4 = arg_39_1:FormatText(var_42_3.content)

				arg_39_1.text_.text = var_42_4

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_5 = 39
				local var_42_6 = utf8.len(var_42_4)
				local var_42_7 = var_42_5 <= 0 and var_42_1 or var_42_1 * (var_42_6 / var_42_5)

				if var_42_7 > 0 and var_42_1 < var_42_7 then
					arg_39_1.talkMaxDuration = var_42_7

					if var_42_7 + var_42_0 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_7 + var_42_0
					end
				end

				arg_39_1.text_.text = var_42_4
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311010", "story_v_out_115311.awb") ~= 0 then
					local var_42_8 = manager.audio:GetVoiceLength("story_v_out_115311", "115311010", "story_v_out_115311.awb") / 1000

					if var_42_8 + var_42_0 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_8 + var_42_0
					end

					if var_42_3.prefab_name ~= "" and arg_39_1.actors_[var_42_3.prefab_name] ~= nil then
						local var_42_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_3.prefab_name].transform, "story_v_out_115311", "115311010", "story_v_out_115311.awb")

						arg_39_1:RecordAudio("115311010", var_42_9)
						arg_39_1:RecordAudio("115311010", var_42_9)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_115311", "115311010", "story_v_out_115311.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_115311", "115311010", "story_v_out_115311.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_10 = math.max(var_42_1, arg_39_1.talkMaxDuration)

			if var_42_0 <= arg_39_1.time_ and arg_39_1.time_ < var_42_0 + var_42_10 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_0) / var_42_10

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_0 + var_42_10 and arg_39_1.time_ < var_42_0 + var_42_10 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play115311011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 115311011
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play115311012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0
			local var_46_1 = 1.125

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, false)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_2 = arg_43_1:GetWordFromCfg(115311011)
				local var_46_3 = arg_43_1:FormatText(var_46_2.content)

				arg_43_1.text_.text = var_46_3

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_4 = 45
				local var_46_5 = utf8.len(var_46_3)
				local var_46_6 = var_46_4 <= 0 and var_46_1 or var_46_1 * (var_46_5 / var_46_4)

				if var_46_6 > 0 and var_46_1 < var_46_6 then
					arg_43_1.talkMaxDuration = var_46_6

					if var_46_6 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_6 + var_46_0
					end
				end

				arg_43_1.text_.text = var_46_3
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_7 = math.max(var_46_1, arg_43_1.talkMaxDuration)

			if var_46_0 <= arg_43_1.time_ and arg_43_1.time_ < var_46_0 + var_46_7 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_0) / var_46_7

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_0 + var_46_7 and arg_43_1.time_ < var_46_0 + var_46_7 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play115311012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 115311012
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play115311013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0
			local var_50_1 = 0.7

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, false)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_2 = arg_47_1:GetWordFromCfg(115311012)
				local var_50_3 = arg_47_1:FormatText(var_50_2.content)

				arg_47_1.text_.text = var_50_3

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_4 = 28
				local var_50_5 = utf8.len(var_50_3)
				local var_50_6 = var_50_4 <= 0 and var_50_1 or var_50_1 * (var_50_5 / var_50_4)

				if var_50_6 > 0 and var_50_1 < var_50_6 then
					arg_47_1.talkMaxDuration = var_50_6

					if var_50_6 + var_50_0 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_6 + var_50_0
					end
				end

				arg_47_1.text_.text = var_50_3
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)
				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_7 = math.max(var_50_1, arg_47_1.talkMaxDuration)

			if var_50_0 <= arg_47_1.time_ and arg_47_1.time_ < var_50_0 + var_50_7 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_0) / var_50_7

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_0 + var_50_7 and arg_47_1.time_ < var_50_0 + var_50_7 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play115311013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 115311013
		arg_51_1.duration_ = 4.566

		local var_51_0 = {
			ja = 3.5,
			ko = 4.566,
			zh = 3.7,
			en = 4.333
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
				arg_51_0:Play115311014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = manager.ui.mainCamera.transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.shakeOldPos = var_54_0.localPosition
			end

			local var_54_2 = 0.6

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / 0.066
				local var_54_4, var_54_5 = math.modf(var_54_3)

				var_54_0.localPosition = Vector3.New(var_54_5 * 0.13, var_54_5 * 0.13, var_54_5 * 0.13) + arg_51_1.var_.shakeOldPos
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 then
				var_54_0.localPosition = arg_51_1.var_.shakeOldPos
			end

			local var_54_6 = 0
			local var_54_7 = 1

			if var_54_6 < arg_51_1.time_ and arg_51_1.time_ <= var_54_6 + arg_54_0 then
				local var_54_8 = "stop"
				local var_54_9 = "effect"

				arg_51_1:AudioAction(var_54_8, var_54_9, "se_story_activity_1_5_3", "se_story_activity_1_5_3_fireworks_loop", "")
			end

			local var_54_10 = 0

			if var_54_10 < arg_51_1.time_ and arg_51_1.time_ <= var_54_10 + arg_54_0 then
				arg_51_1.allBtn_.enabled = false
			end

			local var_54_11 = 0.6

			if arg_51_1.time_ >= var_54_10 + var_54_11 and arg_51_1.time_ < var_54_10 + var_54_11 + arg_54_0 then
				arg_51_1.allBtn_.enabled = true
			end

			local var_54_12 = 0
			local var_54_13 = 0.375

			if var_54_12 < arg_51_1.time_ and arg_51_1.time_ <= var_54_12 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_14 = arg_51_1:FormatText(StoryNameCfg[306].name)

				arg_51_1.leftNameTxt_.text = var_54_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_15 = arg_51_1:GetWordFromCfg(115311013)
				local var_54_16 = arg_51_1:FormatText(var_54_15.content)

				arg_51_1.text_.text = var_54_16

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_17 = 15
				local var_54_18 = utf8.len(var_54_16)
				local var_54_19 = var_54_17 <= 0 and var_54_13 or var_54_13 * (var_54_18 / var_54_17)

				if var_54_19 > 0 and var_54_13 < var_54_19 then
					arg_51_1.talkMaxDuration = var_54_19

					if var_54_19 + var_54_12 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_19 + var_54_12
					end
				end

				arg_51_1.text_.text = var_54_16
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311013", "story_v_out_115311.awb") ~= 0 then
					local var_54_20 = manager.audio:GetVoiceLength("story_v_out_115311", "115311013", "story_v_out_115311.awb") / 1000

					if var_54_20 + var_54_12 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_20 + var_54_12
					end

					if var_54_15.prefab_name ~= "" and arg_51_1.actors_[var_54_15.prefab_name] ~= nil then
						local var_54_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_15.prefab_name].transform, "story_v_out_115311", "115311013", "story_v_out_115311.awb")

						arg_51_1:RecordAudio("115311013", var_54_21)
						arg_51_1:RecordAudio("115311013", var_54_21)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_115311", "115311013", "story_v_out_115311.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_115311", "115311013", "story_v_out_115311.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_22 = math.max(var_54_13, arg_51_1.talkMaxDuration)

			if var_54_12 <= arg_51_1.time_ and arg_51_1.time_ < var_54_12 + var_54_22 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_12) / var_54_22

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_12 + var_54_22 and arg_51_1.time_ < var_54_12 + var_54_22 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play115311014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 115311014
		arg_55_1.duration_ = 4.3

		local var_55_0 = {
			ja = 3.366,
			ko = 4.3,
			zh = 2.733,
			en = 3.8
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
				arg_55_0:Play115311015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = manager.ui.mainCamera.transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.shakeOldPos = var_58_0.localPosition
			end

			local var_58_2 = 0.6

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / 0.066
				local var_58_4, var_58_5 = math.modf(var_58_3)

				var_58_0.localPosition = Vector3.New(var_58_5 * 0.13, var_58_5 * 0.13, var_58_5 * 0.13) + arg_55_1.var_.shakeOldPos
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 then
				var_58_0.localPosition = arg_55_1.var_.shakeOldPos
			end

			local var_58_6 = 0

			if var_58_6 < arg_55_1.time_ and arg_55_1.time_ <= var_58_6 + arg_58_0 then
				arg_55_1.allBtn_.enabled = false
			end

			local var_58_7 = 0.6

			if arg_55_1.time_ >= var_58_6 + var_58_7 and arg_55_1.time_ < var_58_6 + var_58_7 + arg_58_0 then
				arg_55_1.allBtn_.enabled = true
			end

			local var_58_8 = 0
			local var_58_9 = 0.325

			if var_58_8 < arg_55_1.time_ and arg_55_1.time_ <= var_58_8 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_10 = arg_55_1:FormatText(StoryNameCfg[306].name)

				arg_55_1.leftNameTxt_.text = var_58_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_11 = arg_55_1:GetWordFromCfg(115311014)
				local var_58_12 = arg_55_1:FormatText(var_58_11.content)

				arg_55_1.text_.text = var_58_12

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_13 = 13
				local var_58_14 = utf8.len(var_58_12)
				local var_58_15 = var_58_13 <= 0 and var_58_9 or var_58_9 * (var_58_14 / var_58_13)

				if var_58_15 > 0 and var_58_9 < var_58_15 then
					arg_55_1.talkMaxDuration = var_58_15

					if var_58_15 + var_58_8 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_15 + var_58_8
					end
				end

				arg_55_1.text_.text = var_58_12
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311014", "story_v_out_115311.awb") ~= 0 then
					local var_58_16 = manager.audio:GetVoiceLength("story_v_out_115311", "115311014", "story_v_out_115311.awb") / 1000

					if var_58_16 + var_58_8 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_16 + var_58_8
					end

					if var_58_11.prefab_name ~= "" and arg_55_1.actors_[var_58_11.prefab_name] ~= nil then
						local var_58_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_11.prefab_name].transform, "story_v_out_115311", "115311014", "story_v_out_115311.awb")

						arg_55_1:RecordAudio("115311014", var_58_17)
						arg_55_1:RecordAudio("115311014", var_58_17)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_115311", "115311014", "story_v_out_115311.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_115311", "115311014", "story_v_out_115311.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_18 = math.max(var_58_9, arg_55_1.talkMaxDuration)

			if var_58_8 <= arg_55_1.time_ and arg_55_1.time_ < var_58_8 + var_58_18 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_8) / var_58_18

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_8 + var_58_18 and arg_55_1.time_ < var_58_8 + var_58_18 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play115311015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 115311015
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play115311016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 1.575

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, false)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_2 = arg_59_1:GetWordFromCfg(115311015)
				local var_62_3 = arg_59_1:FormatText(var_62_2.content)

				arg_59_1.text_.text = var_62_3

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_4 = 63
				local var_62_5 = utf8.len(var_62_3)
				local var_62_6 = var_62_4 <= 0 and var_62_1 or var_62_1 * (var_62_5 / var_62_4)

				if var_62_6 > 0 and var_62_1 < var_62_6 then
					arg_59_1.talkMaxDuration = var_62_6

					if var_62_6 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_6 + var_62_0
					end
				end

				arg_59_1.text_.text = var_62_3
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)
				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_7 = math.max(var_62_1, arg_59_1.talkMaxDuration)

			if var_62_0 <= arg_59_1.time_ and arg_59_1.time_ < var_62_0 + var_62_7 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_0) / var_62_7

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_0 + var_62_7 and arg_59_1.time_ < var_62_0 + var_62_7 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play115311016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 115311016
		arg_63_1.duration_ = 5

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play115311017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 0
			local var_66_1 = 0.575

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

				local var_66_2 = arg_63_1:GetWordFromCfg(115311016)
				local var_66_3 = arg_63_1:FormatText(var_66_2.content)

				arg_63_1.text_.text = var_66_3

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_4 = 23
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
	Play115311017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 115311017
		arg_67_1.duration_ = 5.266

		local var_67_0 = {
			ja = 5.266,
			ko = 4.2,
			zh = 5.1,
			en = 4.4
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
				arg_67_0:Play115311018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = 0
			local var_70_1 = 0.525

			if var_70_0 < arg_67_1.time_ and arg_67_1.time_ <= var_70_0 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_2 = arg_67_1:FormatText(StoryNameCfg[104].name)

				arg_67_1.leftNameTxt_.text = var_70_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, true)
				arg_67_1.iconController_:SetSelectedState("hero")

				arg_67_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_woundedd")

				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_3 = arg_67_1:GetWordFromCfg(115311017)
				local var_70_4 = arg_67_1:FormatText(var_70_3.content)

				arg_67_1.text_.text = var_70_4

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_5 = 21
				local var_70_6 = utf8.len(var_70_4)
				local var_70_7 = var_70_5 <= 0 and var_70_1 or var_70_1 * (var_70_6 / var_70_5)

				if var_70_7 > 0 and var_70_1 < var_70_7 then
					arg_67_1.talkMaxDuration = var_70_7

					if var_70_7 + var_70_0 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_7 + var_70_0
					end
				end

				arg_67_1.text_.text = var_70_4
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311017", "story_v_out_115311.awb") ~= 0 then
					local var_70_8 = manager.audio:GetVoiceLength("story_v_out_115311", "115311017", "story_v_out_115311.awb") / 1000

					if var_70_8 + var_70_0 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_8 + var_70_0
					end

					if var_70_3.prefab_name ~= "" and arg_67_1.actors_[var_70_3.prefab_name] ~= nil then
						local var_70_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_3.prefab_name].transform, "story_v_out_115311", "115311017", "story_v_out_115311.awb")

						arg_67_1:RecordAudio("115311017", var_70_9)
						arg_67_1:RecordAudio("115311017", var_70_9)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_115311", "115311017", "story_v_out_115311.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_115311", "115311017", "story_v_out_115311.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_10 = math.max(var_70_1, arg_67_1.talkMaxDuration)

			if var_70_0 <= arg_67_1.time_ and arg_67_1.time_ < var_70_0 + var_70_10 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_0) / var_70_10

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_0 + var_70_10 and arg_67_1.time_ < var_70_0 + var_70_10 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play115311018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 115311018
		arg_71_1.duration_ = 5

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play115311019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0
			local var_74_1 = 0.825

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, false)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_2 = arg_71_1:GetWordFromCfg(115311018)
				local var_74_3 = arg_71_1:FormatText(var_74_2.content)

				arg_71_1.text_.text = var_74_3

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_4 = 33
				local var_74_5 = utf8.len(var_74_3)
				local var_74_6 = var_74_4 <= 0 and var_74_1 or var_74_1 * (var_74_5 / var_74_4)

				if var_74_6 > 0 and var_74_1 < var_74_6 then
					arg_71_1.talkMaxDuration = var_74_6

					if var_74_6 + var_74_0 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_6 + var_74_0
					end
				end

				arg_71_1.text_.text = var_74_3
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)
				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_7 = math.max(var_74_1, arg_71_1.talkMaxDuration)

			if var_74_0 <= arg_71_1.time_ and arg_71_1.time_ < var_74_0 + var_74_7 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_0) / var_74_7

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_0 + var_74_7 and arg_71_1.time_ < var_74_0 + var_74_7 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play115311019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 115311019
		arg_75_1.duration_ = 3.3

		local var_75_0 = {
			ja = 3.3,
			ko = 2.2,
			zh = 2.166,
			en = 2.2
		}
		local var_75_1 = manager.audio:GetLocalizationFlag()

		if var_75_0[var_75_1] ~= nil then
			arg_75_1.duration_ = var_75_0[var_75_1]
		end

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play115311020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = "10030"

			if arg_75_1.actors_[var_78_0] == nil then
				local var_78_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_78_0), arg_75_1.canvasGo_.transform)

				var_78_1.transform:SetSiblingIndex(1)

				var_78_1.name = var_78_0
				var_78_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_75_1.actors_[var_78_0] = var_78_1
			end

			local var_78_2 = arg_75_1.actors_["10030"].transform
			local var_78_3 = 0

			if var_78_3 < arg_75_1.time_ and arg_75_1.time_ <= var_78_3 + arg_78_0 then
				arg_75_1.var_.moveOldPos10030 = var_78_2.localPosition
				var_78_2.localScale = Vector3.New(1, 1, 1)

				arg_75_1:CheckSpriteTmpPos("10030", 3)

				local var_78_4 = var_78_2.childCount

				for iter_78_0 = 0, var_78_4 - 1 do
					local var_78_5 = var_78_2:GetChild(iter_78_0)

					if var_78_5.name == "split_2" or not string.find(var_78_5.name, "split") then
						var_78_5.gameObject:SetActive(true)
					else
						var_78_5.gameObject:SetActive(false)
					end
				end
			end

			local var_78_6 = 0.001

			if var_78_3 <= arg_75_1.time_ and arg_75_1.time_ < var_78_3 + var_78_6 then
				local var_78_7 = (arg_75_1.time_ - var_78_3) / var_78_6
				local var_78_8 = Vector3.New(0, -390, 150)

				var_78_2.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos10030, var_78_8, var_78_7)
			end

			if arg_75_1.time_ >= var_78_3 + var_78_6 and arg_75_1.time_ < var_78_3 + var_78_6 + arg_78_0 then
				var_78_2.localPosition = Vector3.New(0, -390, 150)
			end

			local var_78_9 = arg_75_1.actors_["10030"]
			local var_78_10 = 0

			if var_78_10 < arg_75_1.time_ and arg_75_1.time_ <= var_78_10 + arg_78_0 then
				local var_78_11 = var_78_9:GetComponentInChildren(typeof(CanvasGroup))

				if var_78_11 then
					arg_75_1.var_.alphaOldValue10030 = var_78_11.alpha
					arg_75_1.var_.characterEffect10030 = var_78_11
				end

				arg_75_1.var_.alphaOldValue10030 = 0
			end

			local var_78_12 = 0.5

			if var_78_10 <= arg_75_1.time_ and arg_75_1.time_ < var_78_10 + var_78_12 then
				local var_78_13 = (arg_75_1.time_ - var_78_10) / var_78_12
				local var_78_14 = Mathf.Lerp(arg_75_1.var_.alphaOldValue10030, 1, var_78_13)

				if arg_75_1.var_.characterEffect10030 then
					arg_75_1.var_.characterEffect10030.alpha = var_78_14
				end
			end

			if arg_75_1.time_ >= var_78_10 + var_78_12 and arg_75_1.time_ < var_78_10 + var_78_12 + arg_78_0 and arg_75_1.var_.characterEffect10030 then
				arg_75_1.var_.characterEffect10030.alpha = 1
			end

			local var_78_15 = arg_75_1.actors_["10030"]
			local var_78_16 = 0

			if var_78_16 < arg_75_1.time_ and arg_75_1.time_ <= var_78_16 + arg_78_0 and arg_75_1.var_.actorSpriteComps10030 == nil then
				arg_75_1.var_.actorSpriteComps10030 = var_78_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_78_17 = 0.2

			if var_78_16 <= arg_75_1.time_ and arg_75_1.time_ < var_78_16 + var_78_17 then
				local var_78_18 = (arg_75_1.time_ - var_78_16) / var_78_17

				if arg_75_1.var_.actorSpriteComps10030 then
					for iter_78_1, iter_78_2 in pairs(arg_75_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_78_2 then
							local var_78_19 = Mathf.Lerp(iter_78_2.color.r, 1, var_78_18)

							iter_78_2.color = Color.New(var_78_19, var_78_19, var_78_19)
						end
					end
				end
			end

			if arg_75_1.time_ >= var_78_16 + var_78_17 and arg_75_1.time_ < var_78_16 + var_78_17 + arg_78_0 and arg_75_1.var_.actorSpriteComps10030 then
				local var_78_20 = 1

				for iter_78_3, iter_78_4 in pairs(arg_75_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_78_4 then
						iter_78_4.color = Color.New(var_78_20, var_78_20, var_78_20)
					end
				end

				arg_75_1.var_.actorSpriteComps10030 = nil
			end

			local var_78_21 = 0
			local var_78_22 = 0.175

			if var_78_21 < arg_75_1.time_ and arg_75_1.time_ <= var_78_21 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_23 = arg_75_1:FormatText(StoryNameCfg[309].name)

				arg_75_1.leftNameTxt_.text = var_78_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_24 = arg_75_1:GetWordFromCfg(115311019)
				local var_78_25 = arg_75_1:FormatText(var_78_24.content)

				arg_75_1.text_.text = var_78_25

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_26 = 7
				local var_78_27 = utf8.len(var_78_25)
				local var_78_28 = var_78_26 <= 0 and var_78_22 or var_78_22 * (var_78_27 / var_78_26)

				if var_78_28 > 0 and var_78_22 < var_78_28 then
					arg_75_1.talkMaxDuration = var_78_28

					if var_78_28 + var_78_21 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_28 + var_78_21
					end
				end

				arg_75_1.text_.text = var_78_25
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311019", "story_v_out_115311.awb") ~= 0 then
					local var_78_29 = manager.audio:GetVoiceLength("story_v_out_115311", "115311019", "story_v_out_115311.awb") / 1000

					if var_78_29 + var_78_21 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_29 + var_78_21
					end

					if var_78_24.prefab_name ~= "" and arg_75_1.actors_[var_78_24.prefab_name] ~= nil then
						local var_78_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_24.prefab_name].transform, "story_v_out_115311", "115311019", "story_v_out_115311.awb")

						arg_75_1:RecordAudio("115311019", var_78_30)
						arg_75_1:RecordAudio("115311019", var_78_30)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_115311", "115311019", "story_v_out_115311.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_115311", "115311019", "story_v_out_115311.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_31 = math.max(var_78_22, arg_75_1.talkMaxDuration)

			if var_78_21 <= arg_75_1.time_ and arg_75_1.time_ < var_78_21 + var_78_31 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_21) / var_78_31

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_21 + var_78_31 and arg_75_1.time_ < var_78_21 + var_78_31 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play115311020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 115311020
		arg_79_1.duration_ = 4.966

		local var_79_0 = {
			ja = 4.966,
			ko = 4.966,
			zh = 4.2,
			en = 4.933
		}
		local var_79_1 = manager.audio:GetLocalizationFlag()

		if var_79_0[var_79_1] ~= nil then
			arg_79_1.duration_ = var_79_0[var_79_1]
		end

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play115311021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["10030"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.actorSpriteComps10030 == nil then
				arg_79_1.var_.actorSpriteComps10030 = var_82_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_82_2 = 0.2

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.actorSpriteComps10030 then
					for iter_82_0, iter_82_1 in pairs(arg_79_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_82_1 then
							local var_82_4 = Mathf.Lerp(iter_82_1.color.r, 0.5, var_82_3)

							iter_82_1.color = Color.New(var_82_4, var_82_4, var_82_4)
						end
					end
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.actorSpriteComps10030 then
				local var_82_5 = 0.5

				for iter_82_2, iter_82_3 in pairs(arg_79_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_82_3 then
						iter_82_3.color = Color.New(var_82_5, var_82_5, var_82_5)
					end
				end

				arg_79_1.var_.actorSpriteComps10030 = nil
			end

			local var_82_6 = 0
			local var_82_7 = 0.525

			if var_82_6 < arg_79_1.time_ and arg_79_1.time_ <= var_82_6 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_8 = arg_79_1:FormatText(StoryNameCfg[104].name)

				arg_79_1.leftNameTxt_.text = var_82_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, true)
				arg_79_1.iconController_:SetSelectedState("hero")

				arg_79_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_woundedd")

				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_9 = arg_79_1:GetWordFromCfg(115311020)
				local var_82_10 = arg_79_1:FormatText(var_82_9.content)

				arg_79_1.text_.text = var_82_10

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_11 = 21
				local var_82_12 = utf8.len(var_82_10)
				local var_82_13 = var_82_11 <= 0 and var_82_7 or var_82_7 * (var_82_12 / var_82_11)

				if var_82_13 > 0 and var_82_7 < var_82_13 then
					arg_79_1.talkMaxDuration = var_82_13

					if var_82_13 + var_82_6 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_13 + var_82_6
					end
				end

				arg_79_1.text_.text = var_82_10
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311020", "story_v_out_115311.awb") ~= 0 then
					local var_82_14 = manager.audio:GetVoiceLength("story_v_out_115311", "115311020", "story_v_out_115311.awb") / 1000

					if var_82_14 + var_82_6 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_14 + var_82_6
					end

					if var_82_9.prefab_name ~= "" and arg_79_1.actors_[var_82_9.prefab_name] ~= nil then
						local var_82_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_9.prefab_name].transform, "story_v_out_115311", "115311020", "story_v_out_115311.awb")

						arg_79_1:RecordAudio("115311020", var_82_15)
						arg_79_1:RecordAudio("115311020", var_82_15)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_115311", "115311020", "story_v_out_115311.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_115311", "115311020", "story_v_out_115311.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_16 = math.max(var_82_7, arg_79_1.talkMaxDuration)

			if var_82_6 <= arg_79_1.time_ and arg_79_1.time_ < var_82_6 + var_82_16 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_6) / var_82_16

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_6 + var_82_16 and arg_79_1.time_ < var_82_6 + var_82_16 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play115311021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 115311021
		arg_83_1.duration_ = 2.366

		local var_83_0 = {
			ja = 1.6,
			ko = 1.866,
			zh = 2.366,
			en = 1.9
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
				arg_83_0:Play115311022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0
			local var_86_1 = 0.175

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_2 = arg_83_1:FormatText(StoryNameCfg[105].name)

				arg_83_1.leftNameTxt_.text = var_86_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, true)
				arg_83_1.iconController_:SetSelectedState("hero")

				arg_83_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_officeladyb")

				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_3 = arg_83_1:GetWordFromCfg(115311021)
				local var_86_4 = arg_83_1:FormatText(var_86_3.content)

				arg_83_1.text_.text = var_86_4

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_5 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311021", "story_v_out_115311.awb") ~= 0 then
					local var_86_8 = manager.audio:GetVoiceLength("story_v_out_115311", "115311021", "story_v_out_115311.awb") / 1000

					if var_86_8 + var_86_0 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_8 + var_86_0
					end

					if var_86_3.prefab_name ~= "" and arg_83_1.actors_[var_86_3.prefab_name] ~= nil then
						local var_86_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_3.prefab_name].transform, "story_v_out_115311", "115311021", "story_v_out_115311.awb")

						arg_83_1:RecordAudio("115311021", var_86_9)
						arg_83_1:RecordAudio("115311021", var_86_9)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_115311", "115311021", "story_v_out_115311.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_115311", "115311021", "story_v_out_115311.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_10 = math.max(var_86_1, arg_83_1.talkMaxDuration)

			if var_86_0 <= arg_83_1.time_ and arg_83_1.time_ < var_86_0 + var_86_10 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_0) / var_86_10

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_0 + var_86_10 and arg_83_1.time_ < var_86_0 + var_86_10 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play115311022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 115311022
		arg_87_1.duration_ = 4.4

		local var_87_0 = {
			ja = 3.866,
			ko = 3.9,
			zh = 4.4,
			en = 4.366
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
				arg_87_0:Play115311023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["10030"].transform
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1.var_.moveOldPos10030 = var_90_0.localPosition
				var_90_0.localScale = Vector3.New(1, 1, 1)

				arg_87_1:CheckSpriteTmpPos("10030", 3)

				local var_90_2 = var_90_0.childCount

				for iter_90_0 = 0, var_90_2 - 1 do
					local var_90_3 = var_90_0:GetChild(iter_90_0)

					if var_90_3.name == "split_3" or not string.find(var_90_3.name, "split") then
						var_90_3.gameObject:SetActive(true)
					else
						var_90_3.gameObject:SetActive(false)
					end
				end
			end

			local var_90_4 = 0.001

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_4 then
				local var_90_5 = (arg_87_1.time_ - var_90_1) / var_90_4
				local var_90_6 = Vector3.New(0, -390, 150)

				var_90_0.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos10030, var_90_6, var_90_5)
			end

			if arg_87_1.time_ >= var_90_1 + var_90_4 and arg_87_1.time_ < var_90_1 + var_90_4 + arg_90_0 then
				var_90_0.localPosition = Vector3.New(0, -390, 150)
			end

			local var_90_7 = arg_87_1.actors_["10030"]
			local var_90_8 = 0

			if var_90_8 < arg_87_1.time_ and arg_87_1.time_ <= var_90_8 + arg_90_0 and arg_87_1.var_.actorSpriteComps10030 == nil then
				arg_87_1.var_.actorSpriteComps10030 = var_90_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_90_9 = 0.2

			if var_90_8 <= arg_87_1.time_ and arg_87_1.time_ < var_90_8 + var_90_9 then
				local var_90_10 = (arg_87_1.time_ - var_90_8) / var_90_9

				if arg_87_1.var_.actorSpriteComps10030 then
					for iter_90_1, iter_90_2 in pairs(arg_87_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_90_2 then
							local var_90_11 = Mathf.Lerp(iter_90_2.color.r, 1, var_90_10)

							iter_90_2.color = Color.New(var_90_11, var_90_11, var_90_11)
						end
					end
				end
			end

			if arg_87_1.time_ >= var_90_8 + var_90_9 and arg_87_1.time_ < var_90_8 + var_90_9 + arg_90_0 and arg_87_1.var_.actorSpriteComps10030 then
				local var_90_12 = 1

				for iter_90_3, iter_90_4 in pairs(arg_87_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_90_4 then
						iter_90_4.color = Color.New(var_90_12, var_90_12, var_90_12)
					end
				end

				arg_87_1.var_.actorSpriteComps10030 = nil
			end

			local var_90_13 = 0
			local var_90_14 = 0.3

			if var_90_13 < arg_87_1.time_ and arg_87_1.time_ <= var_90_13 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_15 = arg_87_1:FormatText(StoryNameCfg[309].name)

				arg_87_1.leftNameTxt_.text = var_90_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_16 = arg_87_1:GetWordFromCfg(115311022)
				local var_90_17 = arg_87_1:FormatText(var_90_16.content)

				arg_87_1.text_.text = var_90_17

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_18 = 12
				local var_90_19 = utf8.len(var_90_17)
				local var_90_20 = var_90_18 <= 0 and var_90_14 or var_90_14 * (var_90_19 / var_90_18)

				if var_90_20 > 0 and var_90_14 < var_90_20 then
					arg_87_1.talkMaxDuration = var_90_20

					if var_90_20 + var_90_13 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_20 + var_90_13
					end
				end

				arg_87_1.text_.text = var_90_17
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311022", "story_v_out_115311.awb") ~= 0 then
					local var_90_21 = manager.audio:GetVoiceLength("story_v_out_115311", "115311022", "story_v_out_115311.awb") / 1000

					if var_90_21 + var_90_13 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_21 + var_90_13
					end

					if var_90_16.prefab_name ~= "" and arg_87_1.actors_[var_90_16.prefab_name] ~= nil then
						local var_90_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_16.prefab_name].transform, "story_v_out_115311", "115311022", "story_v_out_115311.awb")

						arg_87_1:RecordAudio("115311022", var_90_22)
						arg_87_1:RecordAudio("115311022", var_90_22)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_115311", "115311022", "story_v_out_115311.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_115311", "115311022", "story_v_out_115311.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_23 = math.max(var_90_14, arg_87_1.talkMaxDuration)

			if var_90_13 <= arg_87_1.time_ and arg_87_1.time_ < var_90_13 + var_90_23 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_13) / var_90_23

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_13 + var_90_23 and arg_87_1.time_ < var_90_13 + var_90_23 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play115311023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 115311023
		arg_91_1.duration_ = 5

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play115311024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["10030"]
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 and arg_91_1.var_.actorSpriteComps10030 == nil then
				arg_91_1.var_.actorSpriteComps10030 = var_94_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_94_2 = 0.2

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2

				if arg_91_1.var_.actorSpriteComps10030 then
					for iter_94_0, iter_94_1 in pairs(arg_91_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_94_1 then
							local var_94_4 = Mathf.Lerp(iter_94_1.color.r, 0.5, var_94_3)

							iter_94_1.color = Color.New(var_94_4, var_94_4, var_94_4)
						end
					end
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 and arg_91_1.var_.actorSpriteComps10030 then
				local var_94_5 = 0.5

				for iter_94_2, iter_94_3 in pairs(arg_91_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_94_3 then
						iter_94_3.color = Color.New(var_94_5, var_94_5, var_94_5)
					end
				end

				arg_91_1.var_.actorSpriteComps10030 = nil
			end

			local var_94_6 = 0
			local var_94_7 = 0.8

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

				local var_94_8 = arg_91_1:GetWordFromCfg(115311023)
				local var_94_9 = arg_91_1:FormatText(var_94_8.content)

				arg_91_1.text_.text = var_94_9

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_10 = 32
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
	Play115311024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 115311024
		arg_95_1.duration_ = 10.733

		local var_95_0 = {
			ja = 10.2,
			ko = 7.7,
			zh = 7.033,
			en = 10.733
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
				arg_95_0:Play115311025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["10030"].transform
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				arg_95_1.var_.moveOldPos10030 = var_98_0.localPosition
				var_98_0.localScale = Vector3.New(1, 1, 1)

				arg_95_1:CheckSpriteTmpPos("10030", 3)

				local var_98_2 = var_98_0.childCount

				for iter_98_0 = 0, var_98_2 - 1 do
					local var_98_3 = var_98_0:GetChild(iter_98_0)

					if var_98_3.name == "split_2" or not string.find(var_98_3.name, "split") then
						var_98_3.gameObject:SetActive(true)
					else
						var_98_3.gameObject:SetActive(false)
					end
				end
			end

			local var_98_4 = 0.001

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_4 then
				local var_98_5 = (arg_95_1.time_ - var_98_1) / var_98_4
				local var_98_6 = Vector3.New(0, -390, 150)

				var_98_0.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos10030, var_98_6, var_98_5)
			end

			if arg_95_1.time_ >= var_98_1 + var_98_4 and arg_95_1.time_ < var_98_1 + var_98_4 + arg_98_0 then
				var_98_0.localPosition = Vector3.New(0, -390, 150)
			end

			local var_98_7 = arg_95_1.actors_["10030"]
			local var_98_8 = 0

			if var_98_8 < arg_95_1.time_ and arg_95_1.time_ <= var_98_8 + arg_98_0 and arg_95_1.var_.actorSpriteComps10030 == nil then
				arg_95_1.var_.actorSpriteComps10030 = var_98_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_98_9 = 0.2

			if var_98_8 <= arg_95_1.time_ and arg_95_1.time_ < var_98_8 + var_98_9 then
				local var_98_10 = (arg_95_1.time_ - var_98_8) / var_98_9

				if arg_95_1.var_.actorSpriteComps10030 then
					for iter_98_1, iter_98_2 in pairs(arg_95_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_98_2 then
							local var_98_11 = Mathf.Lerp(iter_98_2.color.r, 1, var_98_10)

							iter_98_2.color = Color.New(var_98_11, var_98_11, var_98_11)
						end
					end
				end
			end

			if arg_95_1.time_ >= var_98_8 + var_98_9 and arg_95_1.time_ < var_98_8 + var_98_9 + arg_98_0 and arg_95_1.var_.actorSpriteComps10030 then
				local var_98_12 = 1

				for iter_98_3, iter_98_4 in pairs(arg_95_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_98_4 then
						iter_98_4.color = Color.New(var_98_12, var_98_12, var_98_12)
					end
				end

				arg_95_1.var_.actorSpriteComps10030 = nil
			end

			local var_98_13 = 0
			local var_98_14 = 0.75

			if var_98_13 < arg_95_1.time_ and arg_95_1.time_ <= var_98_13 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_15 = arg_95_1:FormatText(StoryNameCfg[309].name)

				arg_95_1.leftNameTxt_.text = var_98_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_16 = arg_95_1:GetWordFromCfg(115311024)
				local var_98_17 = arg_95_1:FormatText(var_98_16.content)

				arg_95_1.text_.text = var_98_17

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_18 = 29
				local var_98_19 = utf8.len(var_98_17)
				local var_98_20 = var_98_18 <= 0 and var_98_14 or var_98_14 * (var_98_19 / var_98_18)

				if var_98_20 > 0 and var_98_14 < var_98_20 then
					arg_95_1.talkMaxDuration = var_98_20

					if var_98_20 + var_98_13 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_20 + var_98_13
					end
				end

				arg_95_1.text_.text = var_98_17
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311024", "story_v_out_115311.awb") ~= 0 then
					local var_98_21 = manager.audio:GetVoiceLength("story_v_out_115311", "115311024", "story_v_out_115311.awb") / 1000

					if var_98_21 + var_98_13 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_21 + var_98_13
					end

					if var_98_16.prefab_name ~= "" and arg_95_1.actors_[var_98_16.prefab_name] ~= nil then
						local var_98_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_16.prefab_name].transform, "story_v_out_115311", "115311024", "story_v_out_115311.awb")

						arg_95_1:RecordAudio("115311024", var_98_22)
						arg_95_1:RecordAudio("115311024", var_98_22)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_115311", "115311024", "story_v_out_115311.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_115311", "115311024", "story_v_out_115311.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_23 = math.max(var_98_14, arg_95_1.talkMaxDuration)

			if var_98_13 <= arg_95_1.time_ and arg_95_1.time_ < var_98_13 + var_98_23 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_13) / var_98_23

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_13 + var_98_23 and arg_95_1.time_ < var_98_13 + var_98_23 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play115311025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 115311025
		arg_99_1.duration_ = 2.466

		local var_99_0 = {
			ja = 1.333,
			ko = 2.466,
			zh = 2.066,
			en = 2.1
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
				arg_99_0:Play115311026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["10030"]
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 and arg_99_1.var_.actorSpriteComps10030 == nil then
				arg_99_1.var_.actorSpriteComps10030 = var_102_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_102_2 = 0.2

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2

				if arg_99_1.var_.actorSpriteComps10030 then
					for iter_102_0, iter_102_1 in pairs(arg_99_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_102_1 then
							local var_102_4 = Mathf.Lerp(iter_102_1.color.r, 0.5, var_102_3)

							iter_102_1.color = Color.New(var_102_4, var_102_4, var_102_4)
						end
					end
				end
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 and arg_99_1.var_.actorSpriteComps10030 then
				local var_102_5 = 0.5

				for iter_102_2, iter_102_3 in pairs(arg_99_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_102_3 then
						iter_102_3.color = Color.New(var_102_5, var_102_5, var_102_5)
					end
				end

				arg_99_1.var_.actorSpriteComps10030 = nil
			end

			local var_102_6 = 0
			local var_102_7 = 0.275

			if var_102_6 < arg_99_1.time_ and arg_99_1.time_ <= var_102_6 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_8 = arg_99_1:FormatText(StoryNameCfg[105].name)

				arg_99_1.leftNameTxt_.text = var_102_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, true)
				arg_99_1.iconController_:SetSelectedState("hero")

				arg_99_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_officeladyb")

				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_9 = arg_99_1:GetWordFromCfg(115311025)
				local var_102_10 = arg_99_1:FormatText(var_102_9.content)

				arg_99_1.text_.text = var_102_10

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_11 = 11
				local var_102_12 = utf8.len(var_102_10)
				local var_102_13 = var_102_11 <= 0 and var_102_7 or var_102_7 * (var_102_12 / var_102_11)

				if var_102_13 > 0 and var_102_7 < var_102_13 then
					arg_99_1.talkMaxDuration = var_102_13

					if var_102_13 + var_102_6 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_13 + var_102_6
					end
				end

				arg_99_1.text_.text = var_102_10
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311025", "story_v_out_115311.awb") ~= 0 then
					local var_102_14 = manager.audio:GetVoiceLength("story_v_out_115311", "115311025", "story_v_out_115311.awb") / 1000

					if var_102_14 + var_102_6 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_14 + var_102_6
					end

					if var_102_9.prefab_name ~= "" and arg_99_1.actors_[var_102_9.prefab_name] ~= nil then
						local var_102_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_9.prefab_name].transform, "story_v_out_115311", "115311025", "story_v_out_115311.awb")

						arg_99_1:RecordAudio("115311025", var_102_15)
						arg_99_1:RecordAudio("115311025", var_102_15)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_115311", "115311025", "story_v_out_115311.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_115311", "115311025", "story_v_out_115311.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_16 = math.max(var_102_7, arg_99_1.talkMaxDuration)

			if var_102_6 <= arg_99_1.time_ and arg_99_1.time_ < var_102_6 + var_102_16 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_6) / var_102_16

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_6 + var_102_16 and arg_99_1.time_ < var_102_6 + var_102_16 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play115311026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 115311026
		arg_103_1.duration_ = 10.2

		local var_103_0 = {
			ja = 9.566,
			ko = 10.2,
			zh = 7.8,
			en = 9.866
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
				arg_103_0:Play115311027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = 0
			local var_106_1 = 1.025

			if var_106_0 < arg_103_1.time_ and arg_103_1.time_ <= var_106_0 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_2 = arg_103_1:FormatText(StoryNameCfg[105].name)

				arg_103_1.leftNameTxt_.text = var_106_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, true)
				arg_103_1.iconController_:SetSelectedState("hero")

				arg_103_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_officeladyb")

				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_3 = arg_103_1:GetWordFromCfg(115311026)
				local var_106_4 = arg_103_1:FormatText(var_106_3.content)

				arg_103_1.text_.text = var_106_4

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_5 = 41
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

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311026", "story_v_out_115311.awb") ~= 0 then
					local var_106_8 = manager.audio:GetVoiceLength("story_v_out_115311", "115311026", "story_v_out_115311.awb") / 1000

					if var_106_8 + var_106_0 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_8 + var_106_0
					end

					if var_106_3.prefab_name ~= "" and arg_103_1.actors_[var_106_3.prefab_name] ~= nil then
						local var_106_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_3.prefab_name].transform, "story_v_out_115311", "115311026", "story_v_out_115311.awb")

						arg_103_1:RecordAudio("115311026", var_106_9)
						arg_103_1:RecordAudio("115311026", var_106_9)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_115311", "115311026", "story_v_out_115311.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_115311", "115311026", "story_v_out_115311.awb")
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
	Play115311027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 115311027
		arg_107_1.duration_ = 8.933

		local var_107_0 = {
			ja = 8.933,
			ko = 7.033,
			zh = 5.233,
			en = 8.1
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
				arg_107_0:Play115311028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["10030"].transform
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 then
				arg_107_1.var_.moveOldPos10030 = var_110_0.localPosition
				var_110_0.localScale = Vector3.New(1, 1, 1)

				arg_107_1:CheckSpriteTmpPos("10030", 3)

				local var_110_2 = var_110_0.childCount

				for iter_110_0 = 0, var_110_2 - 1 do
					local var_110_3 = var_110_0:GetChild(iter_110_0)

					if var_110_3.name == "split_3" or not string.find(var_110_3.name, "split") then
						var_110_3.gameObject:SetActive(true)
					else
						var_110_3.gameObject:SetActive(false)
					end
				end
			end

			local var_110_4 = 0.001

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_4 then
				local var_110_5 = (arg_107_1.time_ - var_110_1) / var_110_4
				local var_110_6 = Vector3.New(0, -390, 150)

				var_110_0.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos10030, var_110_6, var_110_5)
			end

			if arg_107_1.time_ >= var_110_1 + var_110_4 and arg_107_1.time_ < var_110_1 + var_110_4 + arg_110_0 then
				var_110_0.localPosition = Vector3.New(0, -390, 150)
			end

			local var_110_7 = arg_107_1.actors_["10030"]
			local var_110_8 = 0

			if var_110_8 < arg_107_1.time_ and arg_107_1.time_ <= var_110_8 + arg_110_0 and arg_107_1.var_.actorSpriteComps10030 == nil then
				arg_107_1.var_.actorSpriteComps10030 = var_110_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_110_9 = 0.2

			if var_110_8 <= arg_107_1.time_ and arg_107_1.time_ < var_110_8 + var_110_9 then
				local var_110_10 = (arg_107_1.time_ - var_110_8) / var_110_9

				if arg_107_1.var_.actorSpriteComps10030 then
					for iter_110_1, iter_110_2 in pairs(arg_107_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_110_2 then
							local var_110_11 = Mathf.Lerp(iter_110_2.color.r, 1, var_110_10)

							iter_110_2.color = Color.New(var_110_11, var_110_11, var_110_11)
						end
					end
				end
			end

			if arg_107_1.time_ >= var_110_8 + var_110_9 and arg_107_1.time_ < var_110_8 + var_110_9 + arg_110_0 and arg_107_1.var_.actorSpriteComps10030 then
				local var_110_12 = 1

				for iter_110_3, iter_110_4 in pairs(arg_107_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_110_4 then
						iter_110_4.color = Color.New(var_110_12, var_110_12, var_110_12)
					end
				end

				arg_107_1.var_.actorSpriteComps10030 = nil
			end

			local var_110_13 = 0
			local var_110_14 = 0.5

			if var_110_13 < arg_107_1.time_ and arg_107_1.time_ <= var_110_13 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_15 = arg_107_1:FormatText(StoryNameCfg[309].name)

				arg_107_1.leftNameTxt_.text = var_110_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_16 = arg_107_1:GetWordFromCfg(115311027)
				local var_110_17 = arg_107_1:FormatText(var_110_16.content)

				arg_107_1.text_.text = var_110_17

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_18 = 20
				local var_110_19 = utf8.len(var_110_17)
				local var_110_20 = var_110_18 <= 0 and var_110_14 or var_110_14 * (var_110_19 / var_110_18)

				if var_110_20 > 0 and var_110_14 < var_110_20 then
					arg_107_1.talkMaxDuration = var_110_20

					if var_110_20 + var_110_13 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_20 + var_110_13
					end
				end

				arg_107_1.text_.text = var_110_17
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311027", "story_v_out_115311.awb") ~= 0 then
					local var_110_21 = manager.audio:GetVoiceLength("story_v_out_115311", "115311027", "story_v_out_115311.awb") / 1000

					if var_110_21 + var_110_13 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_21 + var_110_13
					end

					if var_110_16.prefab_name ~= "" and arg_107_1.actors_[var_110_16.prefab_name] ~= nil then
						local var_110_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_16.prefab_name].transform, "story_v_out_115311", "115311027", "story_v_out_115311.awb")

						arg_107_1:RecordAudio("115311027", var_110_22)
						arg_107_1:RecordAudio("115311027", var_110_22)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_115311", "115311027", "story_v_out_115311.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_115311", "115311027", "story_v_out_115311.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_23 = math.max(var_110_14, arg_107_1.talkMaxDuration)

			if var_110_13 <= arg_107_1.time_ and arg_107_1.time_ < var_110_13 + var_110_23 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_13) / var_110_23

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_13 + var_110_23 and arg_107_1.time_ < var_110_13 + var_110_23 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play115311028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 115311028
		arg_111_1.duration_ = 9.166

		local var_111_0 = {
			ja = 9.166,
			ko = 8.8,
			zh = 6,
			en = 9.033
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
				arg_111_0:Play115311029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["10030"]
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 and arg_111_1.var_.actorSpriteComps10030 == nil then
				arg_111_1.var_.actorSpriteComps10030 = var_114_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_114_2 = 0.2

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2

				if arg_111_1.var_.actorSpriteComps10030 then
					for iter_114_0, iter_114_1 in pairs(arg_111_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_114_1 then
							local var_114_4 = Mathf.Lerp(iter_114_1.color.r, 0.5, var_114_3)

							iter_114_1.color = Color.New(var_114_4, var_114_4, var_114_4)
						end
					end
				end
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 and arg_111_1.var_.actorSpriteComps10030 then
				local var_114_5 = 0.5

				for iter_114_2, iter_114_3 in pairs(arg_111_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_114_3 then
						iter_114_3.color = Color.New(var_114_5, var_114_5, var_114_5)
					end
				end

				arg_111_1.var_.actorSpriteComps10030 = nil
			end

			local var_114_6 = 0
			local var_114_7 = 0.825

			if var_114_6 < arg_111_1.time_ and arg_111_1.time_ <= var_114_6 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_8 = arg_111_1:FormatText(StoryNameCfg[104].name)

				arg_111_1.leftNameTxt_.text = var_114_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, true)
				arg_111_1.iconController_:SetSelectedState("hero")

				arg_111_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_woundedd")

				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_9 = arg_111_1:GetWordFromCfg(115311028)
				local var_114_10 = arg_111_1:FormatText(var_114_9.content)

				arg_111_1.text_.text = var_114_10

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_11 = 33
				local var_114_12 = utf8.len(var_114_10)
				local var_114_13 = var_114_11 <= 0 and var_114_7 or var_114_7 * (var_114_12 / var_114_11)

				if var_114_13 > 0 and var_114_7 < var_114_13 then
					arg_111_1.talkMaxDuration = var_114_13

					if var_114_13 + var_114_6 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_13 + var_114_6
					end
				end

				arg_111_1.text_.text = var_114_10
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311028", "story_v_out_115311.awb") ~= 0 then
					local var_114_14 = manager.audio:GetVoiceLength("story_v_out_115311", "115311028", "story_v_out_115311.awb") / 1000

					if var_114_14 + var_114_6 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_14 + var_114_6
					end

					if var_114_9.prefab_name ~= "" and arg_111_1.actors_[var_114_9.prefab_name] ~= nil then
						local var_114_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_9.prefab_name].transform, "story_v_out_115311", "115311028", "story_v_out_115311.awb")

						arg_111_1:RecordAudio("115311028", var_114_15)
						arg_111_1:RecordAudio("115311028", var_114_15)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_115311", "115311028", "story_v_out_115311.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_115311", "115311028", "story_v_out_115311.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_16 = math.max(var_114_7, arg_111_1.talkMaxDuration)

			if var_114_6 <= arg_111_1.time_ and arg_111_1.time_ < var_114_6 + var_114_16 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_6) / var_114_16

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_6 + var_114_16 and arg_111_1.time_ < var_114_6 + var_114_16 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play115311029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 115311029
		arg_115_1.duration_ = 5

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play115311030(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = 0
			local var_118_1 = 0.9

			if var_118_0 < arg_115_1.time_ and arg_115_1.time_ <= var_118_0 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, false)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_2 = arg_115_1:GetWordFromCfg(115311029)
				local var_118_3 = arg_115_1:FormatText(var_118_2.content)

				arg_115_1.text_.text = var_118_3

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_4 = 36
				local var_118_5 = utf8.len(var_118_3)
				local var_118_6 = var_118_4 <= 0 and var_118_1 or var_118_1 * (var_118_5 / var_118_4)

				if var_118_6 > 0 and var_118_1 < var_118_6 then
					arg_115_1.talkMaxDuration = var_118_6

					if var_118_6 + var_118_0 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_6 + var_118_0
					end
				end

				arg_115_1.text_.text = var_118_3
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)
				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_7 = math.max(var_118_1, arg_115_1.talkMaxDuration)

			if var_118_0 <= arg_115_1.time_ and arg_115_1.time_ < var_118_0 + var_118_7 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_0) / var_118_7

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_0 + var_118_7 and arg_115_1.time_ < var_118_0 + var_118_7 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play115311030 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 115311030
		arg_119_1.duration_ = 11.033

		local var_119_0 = {
			ja = 11.033,
			ko = 8,
			zh = 6.9,
			en = 7.433
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
				arg_119_0:Play115311031(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["10030"]
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 and arg_119_1.var_.actorSpriteComps10030 == nil then
				arg_119_1.var_.actorSpriteComps10030 = var_122_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_122_2 = 0.2

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2

				if arg_119_1.var_.actorSpriteComps10030 then
					for iter_122_0, iter_122_1 in pairs(arg_119_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_122_1 then
							local var_122_4 = Mathf.Lerp(iter_122_1.color.r, 1, var_122_3)

							iter_122_1.color = Color.New(var_122_4, var_122_4, var_122_4)
						end
					end
				end
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 and arg_119_1.var_.actorSpriteComps10030 then
				local var_122_5 = 1

				for iter_122_2, iter_122_3 in pairs(arg_119_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_122_3 then
						iter_122_3.color = Color.New(var_122_5, var_122_5, var_122_5)
					end
				end

				arg_119_1.var_.actorSpriteComps10030 = nil
			end

			local var_122_6 = 0
			local var_122_7 = 0.6

			if var_122_6 < arg_119_1.time_ and arg_119_1.time_ <= var_122_6 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_8 = arg_119_1:FormatText(StoryNameCfg[309].name)

				arg_119_1.leftNameTxt_.text = var_122_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_9 = arg_119_1:GetWordFromCfg(115311030)
				local var_122_10 = arg_119_1:FormatText(var_122_9.content)

				arg_119_1.text_.text = var_122_10

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_11 = 24
				local var_122_12 = utf8.len(var_122_10)
				local var_122_13 = var_122_11 <= 0 and var_122_7 or var_122_7 * (var_122_12 / var_122_11)

				if var_122_13 > 0 and var_122_7 < var_122_13 then
					arg_119_1.talkMaxDuration = var_122_13

					if var_122_13 + var_122_6 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_13 + var_122_6
					end
				end

				arg_119_1.text_.text = var_122_10
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311030", "story_v_out_115311.awb") ~= 0 then
					local var_122_14 = manager.audio:GetVoiceLength("story_v_out_115311", "115311030", "story_v_out_115311.awb") / 1000

					if var_122_14 + var_122_6 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_14 + var_122_6
					end

					if var_122_9.prefab_name ~= "" and arg_119_1.actors_[var_122_9.prefab_name] ~= nil then
						local var_122_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_9.prefab_name].transform, "story_v_out_115311", "115311030", "story_v_out_115311.awb")

						arg_119_1:RecordAudio("115311030", var_122_15)
						arg_119_1:RecordAudio("115311030", var_122_15)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_115311", "115311030", "story_v_out_115311.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_115311", "115311030", "story_v_out_115311.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_16 = math.max(var_122_7, arg_119_1.talkMaxDuration)

			if var_122_6 <= arg_119_1.time_ and arg_119_1.time_ < var_122_6 + var_122_16 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_6) / var_122_16

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_6 + var_122_16 and arg_119_1.time_ < var_122_6 + var_122_16 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play115311031 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 115311031
		arg_123_1.duration_ = 9.733

		local var_123_0 = {
			ja = 9.733,
			ko = 8.4,
			zh = 8.7,
			en = 9.4
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
				arg_123_0:Play115311032(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["10030"]
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 and arg_123_1.var_.actorSpriteComps10030 == nil then
				arg_123_1.var_.actorSpriteComps10030 = var_126_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_126_2 = 0.2

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2

				if arg_123_1.var_.actorSpriteComps10030 then
					for iter_126_0, iter_126_1 in pairs(arg_123_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_126_1 then
							local var_126_4 = Mathf.Lerp(iter_126_1.color.r, 0.5, var_126_3)

							iter_126_1.color = Color.New(var_126_4, var_126_4, var_126_4)
						end
					end
				end
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 and arg_123_1.var_.actorSpriteComps10030 then
				local var_126_5 = 0.5

				for iter_126_2, iter_126_3 in pairs(arg_123_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_126_3 then
						iter_126_3.color = Color.New(var_126_5, var_126_5, var_126_5)
					end
				end

				arg_123_1.var_.actorSpriteComps10030 = nil
			end

			local var_126_6 = 0
			local var_126_7 = 1.175

			if var_126_6 < arg_123_1.time_ and arg_123_1.time_ <= var_126_6 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_8 = arg_123_1:FormatText(StoryNameCfg[104].name)

				arg_123_1.leftNameTxt_.text = var_126_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, true)
				arg_123_1.iconController_:SetSelectedState("hero")

				arg_123_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_woundedd")

				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_9 = arg_123_1:GetWordFromCfg(115311031)
				local var_126_10 = arg_123_1:FormatText(var_126_9.content)

				arg_123_1.text_.text = var_126_10

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_11 = 47
				local var_126_12 = utf8.len(var_126_10)
				local var_126_13 = var_126_11 <= 0 and var_126_7 or var_126_7 * (var_126_12 / var_126_11)

				if var_126_13 > 0 and var_126_7 < var_126_13 then
					arg_123_1.talkMaxDuration = var_126_13

					if var_126_13 + var_126_6 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_13 + var_126_6
					end
				end

				arg_123_1.text_.text = var_126_10
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311031", "story_v_out_115311.awb") ~= 0 then
					local var_126_14 = manager.audio:GetVoiceLength("story_v_out_115311", "115311031", "story_v_out_115311.awb") / 1000

					if var_126_14 + var_126_6 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_14 + var_126_6
					end

					if var_126_9.prefab_name ~= "" and arg_123_1.actors_[var_126_9.prefab_name] ~= nil then
						local var_126_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_9.prefab_name].transform, "story_v_out_115311", "115311031", "story_v_out_115311.awb")

						arg_123_1:RecordAudio("115311031", var_126_15)
						arg_123_1:RecordAudio("115311031", var_126_15)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_115311", "115311031", "story_v_out_115311.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_115311", "115311031", "story_v_out_115311.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_16 = math.max(var_126_7, arg_123_1.talkMaxDuration)

			if var_126_6 <= arg_123_1.time_ and arg_123_1.time_ < var_126_6 + var_126_16 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_6) / var_126_16

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_6 + var_126_16 and arg_123_1.time_ < var_126_6 + var_126_16 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play115311032 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 115311032
		arg_127_1.duration_ = 6.266

		local var_127_0 = {
			ja = 6.266,
			ko = 3.633,
			zh = 3.666,
			en = 3.866
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
				arg_127_0:Play115311033(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = 0
			local var_130_1 = 0.525

			if var_130_0 < arg_127_1.time_ and arg_127_1.time_ <= var_130_0 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_2 = arg_127_1:FormatText(StoryNameCfg[104].name)

				arg_127_1.leftNameTxt_.text = var_130_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, true)
				arg_127_1.iconController_:SetSelectedState("hero")

				arg_127_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_woundedd")

				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_3 = arg_127_1:GetWordFromCfg(115311032)
				local var_130_4 = arg_127_1:FormatText(var_130_3.content)

				arg_127_1.text_.text = var_130_4

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_5 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311032", "story_v_out_115311.awb") ~= 0 then
					local var_130_8 = manager.audio:GetVoiceLength("story_v_out_115311", "115311032", "story_v_out_115311.awb") / 1000

					if var_130_8 + var_130_0 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_8 + var_130_0
					end

					if var_130_3.prefab_name ~= "" and arg_127_1.actors_[var_130_3.prefab_name] ~= nil then
						local var_130_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_3.prefab_name].transform, "story_v_out_115311", "115311032", "story_v_out_115311.awb")

						arg_127_1:RecordAudio("115311032", var_130_9)
						arg_127_1:RecordAudio("115311032", var_130_9)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_115311", "115311032", "story_v_out_115311.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_115311", "115311032", "story_v_out_115311.awb")
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
	Play115311033 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 115311033
		arg_131_1.duration_ = 9

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play115311034(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = "ST28a"

			if arg_131_1.bgs_[var_134_0] == nil then
				local var_134_1 = Object.Instantiate(arg_131_1.paintGo_)

				var_134_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_134_0)
				var_134_1.name = var_134_0
				var_134_1.transform.parent = arg_131_1.stage_.transform
				var_134_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_131_1.bgs_[var_134_0] = var_134_1
			end

			local var_134_2 = 2

			if var_134_2 < arg_131_1.time_ and arg_131_1.time_ <= var_134_2 + arg_134_0 then
				local var_134_3 = manager.ui.mainCamera.transform.localPosition
				local var_134_4 = Vector3.New(0, 0, 10) + Vector3.New(var_134_3.x, var_134_3.y, 0)
				local var_134_5 = arg_131_1.bgs_.ST28a

				var_134_5.transform.localPosition = var_134_4
				var_134_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_134_6 = var_134_5:GetComponent("SpriteRenderer")

				if var_134_6 and var_134_6.sprite then
					local var_134_7 = (var_134_5.transform.localPosition - var_134_3).z
					local var_134_8 = manager.ui.mainCameraCom_
					local var_134_9 = 2 * var_134_7 * Mathf.Tan(var_134_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_134_10 = var_134_9 * var_134_8.aspect
					local var_134_11 = var_134_6.sprite.bounds.size.x
					local var_134_12 = var_134_6.sprite.bounds.size.y
					local var_134_13 = var_134_10 / var_134_11
					local var_134_14 = var_134_9 / var_134_12
					local var_134_15 = var_134_14 < var_134_13 and var_134_13 or var_134_14

					var_134_5.transform.localScale = Vector3.New(var_134_15, var_134_15, 0)
				end

				for iter_134_0, iter_134_1 in pairs(arg_131_1.bgs_) do
					if iter_134_0 ~= "ST28a" then
						iter_134_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_134_16 = 2

			if var_134_16 < arg_131_1.time_ and arg_131_1.time_ <= var_134_16 + arg_134_0 then
				arg_131_1.mask_.enabled = true
				arg_131_1.mask_.raycastTarget = true

				arg_131_1:SetGaussion(false)
			end

			local var_134_17 = 2

			if var_134_16 <= arg_131_1.time_ and arg_131_1.time_ < var_134_16 + var_134_17 then
				local var_134_18 = (arg_131_1.time_ - var_134_16) / var_134_17
				local var_134_19 = Color.New(0, 0, 0)

				var_134_19.a = Mathf.Lerp(1, 0, var_134_18)
				arg_131_1.mask_.color = var_134_19
			end

			if arg_131_1.time_ >= var_134_16 + var_134_17 and arg_131_1.time_ < var_134_16 + var_134_17 + arg_134_0 then
				local var_134_20 = Color.New(0, 0, 0)
				local var_134_21 = 0

				arg_131_1.mask_.enabled = false
				var_134_20.a = var_134_21
				arg_131_1.mask_.color = var_134_20
			end

			local var_134_22 = 0

			if var_134_22 < arg_131_1.time_ and arg_131_1.time_ <= var_134_22 + arg_134_0 then
				arg_131_1.mask_.enabled = true
				arg_131_1.mask_.raycastTarget = true

				arg_131_1:SetGaussion(false)
			end

			local var_134_23 = 2

			if var_134_22 <= arg_131_1.time_ and arg_131_1.time_ < var_134_22 + var_134_23 then
				local var_134_24 = (arg_131_1.time_ - var_134_22) / var_134_23
				local var_134_25 = Color.New(0, 0, 0)

				var_134_25.a = Mathf.Lerp(0, 1, var_134_24)
				arg_131_1.mask_.color = var_134_25
			end

			if arg_131_1.time_ >= var_134_22 + var_134_23 and arg_131_1.time_ < var_134_22 + var_134_23 + arg_134_0 then
				local var_134_26 = Color.New(0, 0, 0)

				var_134_26.a = 1
				arg_131_1.mask_.color = var_134_26
			end

			local var_134_27 = arg_131_1.actors_["10030"].transform
			local var_134_28 = 1.966

			if var_134_28 < arg_131_1.time_ and arg_131_1.time_ <= var_134_28 + arg_134_0 then
				arg_131_1.var_.moveOldPos10030 = var_134_27.localPosition
				var_134_27.localScale = Vector3.New(1, 1, 1)

				arg_131_1:CheckSpriteTmpPos("10030", 7)

				local var_134_29 = var_134_27.childCount

				for iter_134_2 = 0, var_134_29 - 1 do
					local var_134_30 = var_134_27:GetChild(iter_134_2)

					if var_134_30.name == "split_3" or not string.find(var_134_30.name, "split") then
						var_134_30.gameObject:SetActive(true)
					else
						var_134_30.gameObject:SetActive(false)
					end
				end
			end

			local var_134_31 = 0.001

			if var_134_28 <= arg_131_1.time_ and arg_131_1.time_ < var_134_28 + var_134_31 then
				local var_134_32 = (arg_131_1.time_ - var_134_28) / var_134_31
				local var_134_33 = Vector3.New(0, -2000, -180)

				var_134_27.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos10030, var_134_33, var_134_32)
			end

			if arg_131_1.time_ >= var_134_28 + var_134_31 and arg_131_1.time_ < var_134_28 + var_134_31 + arg_134_0 then
				var_134_27.localPosition = Vector3.New(0, -2000, -180)
			end

			if arg_131_1.frameCnt_ <= 1 then
				arg_131_1.dialog_:SetActive(false)
			end

			local var_134_34 = 4
			local var_134_35 = 1.325

			if var_134_34 < arg_131_1.time_ and arg_131_1.time_ <= var_134_34 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0

				arg_131_1.dialog_:SetActive(true)

				local var_134_36 = LeanTween.value(arg_131_1.dialog_, 0, 1, 0.3)

				var_134_36:setOnUpdate(LuaHelper.FloatAction(function(arg_135_0)
					arg_131_1.dialogCg_.alpha = arg_135_0
				end))
				var_134_36:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_131_1.dialog_)
					var_134_36:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_131_1.duration_ = arg_131_1.duration_ + 0.3

				SetActive(arg_131_1.leftNameGo_, false)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_37 = arg_131_1:GetWordFromCfg(115311033)
				local var_134_38 = arg_131_1:FormatText(var_134_37.content)

				arg_131_1.text_.text = var_134_38

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_39 = 53
				local var_134_40 = utf8.len(var_134_38)
				local var_134_41 = var_134_39 <= 0 and var_134_35 or var_134_35 * (var_134_40 / var_134_39)

				if var_134_41 > 0 and var_134_35 < var_134_41 then
					arg_131_1.talkMaxDuration = var_134_41
					var_134_34 = var_134_34 + 0.3

					if var_134_41 + var_134_34 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_41 + var_134_34
					end
				end

				arg_131_1.text_.text = var_134_38
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)
				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_42 = var_134_34 + 0.3
			local var_134_43 = math.max(var_134_35, arg_131_1.talkMaxDuration)

			if var_134_42 <= arg_131_1.time_ and arg_131_1.time_ < var_134_42 + var_134_43 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_42) / var_134_43

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_42 + var_134_43 and arg_131_1.time_ < var_134_42 + var_134_43 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play115311034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 115311034
		arg_137_1.duration_ = 5

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play115311035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = 0
			local var_140_1 = 1.2

			if var_140_0 < arg_137_1.time_ and arg_137_1.time_ <= var_140_0 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, false)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_2 = arg_137_1:GetWordFromCfg(115311034)
				local var_140_3 = arg_137_1:FormatText(var_140_2.content)

				arg_137_1.text_.text = var_140_3

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_4 = 48
				local var_140_5 = utf8.len(var_140_3)
				local var_140_6 = var_140_4 <= 0 and var_140_1 or var_140_1 * (var_140_5 / var_140_4)

				if var_140_6 > 0 and var_140_1 < var_140_6 then
					arg_137_1.talkMaxDuration = var_140_6

					if var_140_6 + var_140_0 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_6 + var_140_0
					end
				end

				arg_137_1.text_.text = var_140_3
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)
				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_7 = math.max(var_140_1, arg_137_1.talkMaxDuration)

			if var_140_0 <= arg_137_1.time_ and arg_137_1.time_ < var_140_0 + var_140_7 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_0) / var_140_7

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_0 + var_140_7 and arg_137_1.time_ < var_140_0 + var_140_7 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play115311035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 115311035
		arg_141_1.duration_ = 5

		SetActive(arg_141_1.tipsGo_, false)

		function arg_141_1.onSingleLineFinish_()
			arg_141_1.onSingleLineUpdate_ = nil
			arg_141_1.onSingleLineFinish_ = nil
			arg_141_1.state_ = "waiting"
		end

		function arg_141_1.playNext_(arg_143_0)
			if arg_143_0 == 1 then
				arg_141_0:Play115311036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = 0
			local var_144_1 = 1.375

			if var_144_0 < arg_141_1.time_ and arg_141_1.time_ <= var_144_0 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, false)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_2 = arg_141_1:GetWordFromCfg(115311035)
				local var_144_3 = arg_141_1:FormatText(var_144_2.content)

				arg_141_1.text_.text = var_144_3

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_4 = 55
				local var_144_5 = utf8.len(var_144_3)
				local var_144_6 = var_144_4 <= 0 and var_144_1 or var_144_1 * (var_144_5 / var_144_4)

				if var_144_6 > 0 and var_144_1 < var_144_6 then
					arg_141_1.talkMaxDuration = var_144_6

					if var_144_6 + var_144_0 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_6 + var_144_0
					end
				end

				arg_141_1.text_.text = var_144_3
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)
				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_7 = math.max(var_144_1, arg_141_1.talkMaxDuration)

			if var_144_0 <= arg_141_1.time_ and arg_141_1.time_ < var_144_0 + var_144_7 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_0) / var_144_7

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_0 + var_144_7 and arg_141_1.time_ < var_144_0 + var_144_7 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play115311036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 115311036
		arg_145_1.duration_ = 11

		local var_145_0 = {
			ja = 7.2,
			ko = 7.3,
			zh = 7.466,
			en = 11
		}
		local var_145_1 = manager.audio:GetLocalizationFlag()

		if var_145_0[var_145_1] ~= nil then
			arg_145_1.duration_ = var_145_0[var_145_1]
		end

		SetActive(arg_145_1.tipsGo_, false)

		function arg_145_1.onSingleLineFinish_()
			arg_145_1.onSingleLineUpdate_ = nil
			arg_145_1.onSingleLineFinish_ = nil
			arg_145_1.state_ = "waiting"
		end

		function arg_145_1.playNext_(arg_147_0)
			if arg_147_0 == 1 then
				arg_145_0:Play115311037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = "10029"

			if arg_145_1.actors_[var_148_0] == nil then
				local var_148_1 = Object.Instantiate(arg_145_1.imageGo_, arg_145_1.canvasGo_.transform)

				var_148_1.transform:SetSiblingIndex(1)

				var_148_1.name = var_148_0

				local var_148_2 = var_148_1:GetComponent(typeof(Image))

				var_148_2.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. var_148_0)

				var_148_2:SetNativeSize()

				var_148_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_145_1.actors_[var_148_0] = var_148_1
			end

			local var_148_3 = arg_145_1.actors_["10029"].transform
			local var_148_4 = 0

			if var_148_4 < arg_145_1.time_ and arg_145_1.time_ <= var_148_4 + arg_148_0 then
				arg_145_1.var_.moveOldPos10029 = var_148_3.localPosition
				var_148_3.localScale = Vector3.New(1, 1, 1)

				arg_145_1:CheckSpriteTmpPos("10029", 2)
			end

			local var_148_5 = 0.001

			if var_148_4 <= arg_145_1.time_ and arg_145_1.time_ < var_148_4 + var_148_5 then
				local var_148_6 = (arg_145_1.time_ - var_148_4) / var_148_5
				local var_148_7 = Vector3.New(-390, -350, -180)

				var_148_3.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPos10029, var_148_7, var_148_6)
			end

			if arg_145_1.time_ >= var_148_4 + var_148_5 and arg_145_1.time_ < var_148_4 + var_148_5 + arg_148_0 then
				var_148_3.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_148_8 = arg_145_1.actors_["10029"]
			local var_148_9 = 0

			if var_148_9 < arg_145_1.time_ and arg_145_1.time_ <= var_148_9 + arg_148_0 then
				local var_148_10 = var_148_8:GetComponent("Image")

				if var_148_10 then
					arg_145_1.var_.alphaMatValue10029 = var_148_10
					arg_145_1.var_.alphaOldValue10029 = var_148_10.color.a
				end

				arg_145_1.var_.alphaOldValue10029 = 0
			end

			local var_148_11 = 0.5

			if var_148_9 <= arg_145_1.time_ and arg_145_1.time_ < var_148_9 + var_148_11 then
				local var_148_12 = (arg_145_1.time_ - var_148_9) / var_148_11
				local var_148_13 = Mathf.Lerp(arg_145_1.var_.alphaOldValue10029, 1, var_148_12)

				if arg_145_1.var_.alphaMatValue10029 then
					local var_148_14 = arg_145_1.var_.alphaMatValue10029.color

					var_148_14.a = var_148_13
					arg_145_1.var_.alphaMatValue10029.color = var_148_14
				end
			end

			if arg_145_1.time_ >= var_148_9 + var_148_11 and arg_145_1.time_ < var_148_9 + var_148_11 + arg_148_0 and arg_145_1.var_.alphaMatValue10029 then
				local var_148_15 = arg_145_1.var_.alphaMatValue10029
				local var_148_16 = var_148_15.color

				var_148_16.a = 1
				var_148_15.color = var_148_16
			end

			local var_148_17 = arg_145_1.actors_["10029"]
			local var_148_18 = 0

			if var_148_18 < arg_145_1.time_ and arg_145_1.time_ <= var_148_18 + arg_148_0 then
				local var_148_19 = var_148_17:GetComponent("Image")

				if var_148_19 then
					arg_145_1.var_.highlightMatValue10029 = var_148_19
				end
			end

			local var_148_20 = 0.2

			if var_148_18 <= arg_145_1.time_ and arg_145_1.time_ < var_148_18 + var_148_20 then
				local var_148_21 = (arg_145_1.time_ - var_148_18) / var_148_20

				if arg_145_1.var_.highlightMatValue10029 then
					local var_148_22 = Mathf.Lerp(0.5, 1, var_148_21)
					local var_148_23 = arg_145_1.var_.highlightMatValue10029
					local var_148_24 = var_148_23.color

					var_148_24.r = var_148_22
					var_148_24.g = var_148_22
					var_148_24.b = var_148_22
					var_148_23.color = var_148_24
				end
			end

			if arg_145_1.time_ >= var_148_18 + var_148_20 and arg_145_1.time_ < var_148_18 + var_148_20 + arg_148_0 and arg_145_1.var_.highlightMatValue10029 then
				local var_148_25 = 1

				var_148_17.transform:SetSiblingIndex(1)

				local var_148_26 = arg_145_1.var_.highlightMatValue10029
				local var_148_27 = var_148_26.color

				var_148_27.r = var_148_25
				var_148_27.g = var_148_25
				var_148_27.b = var_148_25
				var_148_26.color = var_148_27
			end

			local var_148_28 = 0
			local var_148_29 = 0.775

			if var_148_28 < arg_145_1.time_ and arg_145_1.time_ <= var_148_28 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_30 = arg_145_1:FormatText(StoryNameCfg[312].name)

				arg_145_1.leftNameTxt_.text = var_148_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_31 = arg_145_1:GetWordFromCfg(115311036)
				local var_148_32 = arg_145_1:FormatText(var_148_31.content)

				arg_145_1.text_.text = var_148_32

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_33 = 31
				local var_148_34 = utf8.len(var_148_32)
				local var_148_35 = var_148_33 <= 0 and var_148_29 or var_148_29 * (var_148_34 / var_148_33)

				if var_148_35 > 0 and var_148_29 < var_148_35 then
					arg_145_1.talkMaxDuration = var_148_35

					if var_148_35 + var_148_28 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_35 + var_148_28
					end
				end

				arg_145_1.text_.text = var_148_32
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311036", "story_v_out_115311.awb") ~= 0 then
					local var_148_36 = manager.audio:GetVoiceLength("story_v_out_115311", "115311036", "story_v_out_115311.awb") / 1000

					if var_148_36 + var_148_28 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_36 + var_148_28
					end

					if var_148_31.prefab_name ~= "" and arg_145_1.actors_[var_148_31.prefab_name] ~= nil then
						local var_148_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_31.prefab_name].transform, "story_v_out_115311", "115311036", "story_v_out_115311.awb")

						arg_145_1:RecordAudio("115311036", var_148_37)
						arg_145_1:RecordAudio("115311036", var_148_37)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_115311", "115311036", "story_v_out_115311.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_115311", "115311036", "story_v_out_115311.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_38 = math.max(var_148_29, arg_145_1.talkMaxDuration)

			if var_148_28 <= arg_145_1.time_ and arg_145_1.time_ < var_148_28 + var_148_38 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_28) / var_148_38

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_28 + var_148_38 and arg_145_1.time_ < var_148_28 + var_148_38 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play115311037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 115311037
		arg_149_1.duration_ = 8.566

		local var_149_0 = {
			ja = 8.566,
			ko = 4.9,
			zh = 4.8,
			en = 6.6
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
				arg_149_0:Play115311038(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = 0
			local var_152_1 = 0.6

			if var_152_0 < arg_149_1.time_ and arg_149_1.time_ <= var_152_0 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_2 = arg_149_1:FormatText(StoryNameCfg[312].name)

				arg_149_1.leftNameTxt_.text = var_152_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_3 = arg_149_1:GetWordFromCfg(115311037)
				local var_152_4 = arg_149_1:FormatText(var_152_3.content)

				arg_149_1.text_.text = var_152_4

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_5 = 24
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

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311037", "story_v_out_115311.awb") ~= 0 then
					local var_152_8 = manager.audio:GetVoiceLength("story_v_out_115311", "115311037", "story_v_out_115311.awb") / 1000

					if var_152_8 + var_152_0 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_8 + var_152_0
					end

					if var_152_3.prefab_name ~= "" and arg_149_1.actors_[var_152_3.prefab_name] ~= nil then
						local var_152_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_3.prefab_name].transform, "story_v_out_115311", "115311037", "story_v_out_115311.awb")

						arg_149_1:RecordAudio("115311037", var_152_9)
						arg_149_1:RecordAudio("115311037", var_152_9)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_115311", "115311037", "story_v_out_115311.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_115311", "115311037", "story_v_out_115311.awb")
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
	Play115311038 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 115311038
		arg_153_1.duration_ = 17.633

		local var_153_0 = {
			ja = 17.633,
			ko = 10.2,
			zh = 10.2,
			en = 10.5
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
				arg_153_0:Play115311039(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = "113801_1"

			if arg_153_1.actors_[var_156_0] == nil then
				local var_156_1 = Object.Instantiate(arg_153_1.imageGo_, arg_153_1.canvasGo_.transform)

				var_156_1.transform:SetSiblingIndex(1)

				var_156_1.name = var_156_0

				local var_156_2 = var_156_1:GetComponent(typeof(Image))

				var_156_2.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. var_156_0)

				var_156_2:SetNativeSize()

				var_156_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_153_1.actors_[var_156_0] = var_156_1
			end

			local var_156_3 = arg_153_1.actors_["113801_1"]
			local var_156_4 = 0

			if var_156_4 < arg_153_1.time_ and arg_153_1.time_ <= var_156_4 + arg_156_0 then
				local var_156_5 = var_156_3:GetComponent("Image")

				if var_156_5 then
					arg_153_1.var_.alphaMatValue113801_1 = var_156_5
					arg_153_1.var_.alphaOldValue113801_1 = var_156_5.color.a
				end

				arg_153_1.var_.alphaOldValue113801_1 = 0
			end

			local var_156_6 = 0.5

			if var_156_4 <= arg_153_1.time_ and arg_153_1.time_ < var_156_4 + var_156_6 then
				local var_156_7 = (arg_153_1.time_ - var_156_4) / var_156_6
				local var_156_8 = Mathf.Lerp(arg_153_1.var_.alphaOldValue113801_1, 1, var_156_7)

				if arg_153_1.var_.alphaMatValue113801_1 then
					local var_156_9 = arg_153_1.var_.alphaMatValue113801_1.color

					var_156_9.a = var_156_8
					arg_153_1.var_.alphaMatValue113801_1.color = var_156_9
				end
			end

			if arg_153_1.time_ >= var_156_4 + var_156_6 and arg_153_1.time_ < var_156_4 + var_156_6 + arg_156_0 and arg_153_1.var_.alphaMatValue113801_1 then
				local var_156_10 = arg_153_1.var_.alphaMatValue113801_1
				local var_156_11 = var_156_10.color

				var_156_11.a = 1
				var_156_10.color = var_156_11
			end

			local var_156_12 = arg_153_1.actors_["113801_1"]
			local var_156_13 = 0

			if var_156_13 < arg_153_1.time_ and arg_153_1.time_ <= var_156_13 + arg_156_0 then
				local var_156_14 = var_156_12:GetComponent("Image")

				if var_156_14 then
					arg_153_1.var_.highlightMatValue113801_1 = var_156_14
				end
			end

			local var_156_15 = 0.2

			if var_156_13 <= arg_153_1.time_ and arg_153_1.time_ < var_156_13 + var_156_15 then
				local var_156_16 = (arg_153_1.time_ - var_156_13) / var_156_15

				if arg_153_1.var_.highlightMatValue113801_1 then
					local var_156_17 = Mathf.Lerp(0.5, 1, var_156_16)
					local var_156_18 = arg_153_1.var_.highlightMatValue113801_1
					local var_156_19 = var_156_18.color

					var_156_19.r = var_156_17
					var_156_19.g = var_156_17
					var_156_19.b = var_156_17
					var_156_18.color = var_156_19
				end
			end

			if arg_153_1.time_ >= var_156_13 + var_156_15 and arg_153_1.time_ < var_156_13 + var_156_15 + arg_156_0 and arg_153_1.var_.highlightMatValue113801_1 then
				local var_156_20 = 1

				var_156_12.transform:SetSiblingIndex(1)

				local var_156_21 = arg_153_1.var_.highlightMatValue113801_1
				local var_156_22 = var_156_21.color

				var_156_22.r = var_156_20
				var_156_22.g = var_156_20
				var_156_22.b = var_156_20
				var_156_21.color = var_156_22
			end

			local var_156_23 = arg_153_1.actors_["113801_1"].transform
			local var_156_24 = 0

			if var_156_24 < arg_153_1.time_ and arg_153_1.time_ <= var_156_24 + arg_156_0 then
				arg_153_1.var_.moveOldPos113801_1 = var_156_23.localPosition
				var_156_23.localScale = Vector3.New(1, 1, 1)

				arg_153_1:CheckSpriteTmpPos("113801_1", 4)
			end

			local var_156_25 = 0.001

			if var_156_24 <= arg_153_1.time_ and arg_153_1.time_ < var_156_24 + var_156_25 then
				local var_156_26 = (arg_153_1.time_ - var_156_24) / var_156_25
				local var_156_27 = Vector3.New(390, -310, -370)

				var_156_23.localPosition = Vector3.Lerp(arg_153_1.var_.moveOldPos113801_1, var_156_27, var_156_26)
			end

			if arg_153_1.time_ >= var_156_24 + var_156_25 and arg_153_1.time_ < var_156_24 + var_156_25 + arg_156_0 then
				var_156_23.localPosition = Vector3.New(390, -310, -370)
			end

			local var_156_28 = arg_153_1.actors_["10029"]
			local var_156_29 = 0

			if var_156_29 < arg_153_1.time_ and arg_153_1.time_ <= var_156_29 + arg_156_0 then
				local var_156_30 = var_156_28:GetComponent("Image")

				if var_156_30 then
					arg_153_1.var_.highlightMatValue10029 = var_156_30
				end
			end

			local var_156_31 = 0.2

			if var_156_29 <= arg_153_1.time_ and arg_153_1.time_ < var_156_29 + var_156_31 then
				local var_156_32 = (arg_153_1.time_ - var_156_29) / var_156_31

				if arg_153_1.var_.highlightMatValue10029 then
					local var_156_33 = Mathf.Lerp(1, 0.5, var_156_32)
					local var_156_34 = arg_153_1.var_.highlightMatValue10029
					local var_156_35 = var_156_34.color

					var_156_35.r = var_156_33
					var_156_35.g = var_156_33
					var_156_35.b = var_156_33
					var_156_34.color = var_156_35
				end
			end

			if arg_153_1.time_ >= var_156_29 + var_156_31 and arg_153_1.time_ < var_156_29 + var_156_31 + arg_156_0 and arg_153_1.var_.highlightMatValue10029 then
				local var_156_36 = 0.5
				local var_156_37 = arg_153_1.var_.highlightMatValue10029
				local var_156_38 = var_156_37.color

				var_156_38.r = var_156_36
				var_156_38.g = var_156_36
				var_156_38.b = var_156_36
				var_156_37.color = var_156_38
			end

			local var_156_39 = 0
			local var_156_40 = 1

			if var_156_39 < arg_153_1.time_ and arg_153_1.time_ <= var_156_39 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_41 = arg_153_1:FormatText(StoryNameCfg[94].name)

				arg_153_1.leftNameTxt_.text = var_156_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_42 = arg_153_1:GetWordFromCfg(115311038)
				local var_156_43 = arg_153_1:FormatText(var_156_42.content)

				arg_153_1.text_.text = var_156_43

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_44 = 40
				local var_156_45 = utf8.len(var_156_43)
				local var_156_46 = var_156_44 <= 0 and var_156_40 or var_156_40 * (var_156_45 / var_156_44)

				if var_156_46 > 0 and var_156_40 < var_156_46 then
					arg_153_1.talkMaxDuration = var_156_46

					if var_156_46 + var_156_39 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_46 + var_156_39
					end
				end

				arg_153_1.text_.text = var_156_43
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311038", "story_v_out_115311.awb") ~= 0 then
					local var_156_47 = manager.audio:GetVoiceLength("story_v_out_115311", "115311038", "story_v_out_115311.awb") / 1000

					if var_156_47 + var_156_39 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_47 + var_156_39
					end

					if var_156_42.prefab_name ~= "" and arg_153_1.actors_[var_156_42.prefab_name] ~= nil then
						local var_156_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_42.prefab_name].transform, "story_v_out_115311", "115311038", "story_v_out_115311.awb")

						arg_153_1:RecordAudio("115311038", var_156_48)
						arg_153_1:RecordAudio("115311038", var_156_48)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_115311", "115311038", "story_v_out_115311.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_115311", "115311038", "story_v_out_115311.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_49 = math.max(var_156_40, arg_153_1.talkMaxDuration)

			if var_156_39 <= arg_153_1.time_ and arg_153_1.time_ < var_156_39 + var_156_49 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_39) / var_156_49

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_39 + var_156_49 and arg_153_1.time_ < var_156_39 + var_156_49 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play115311039 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 115311039
		arg_157_1.duration_ = 5

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play115311040(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["113801_1"]
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 then
				local var_160_2 = var_160_0:GetComponent("Image")

				if var_160_2 then
					arg_157_1.var_.highlightMatValue113801_1 = var_160_2
				end
			end

			local var_160_3 = 0.2

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_3 then
				local var_160_4 = (arg_157_1.time_ - var_160_1) / var_160_3

				if arg_157_1.var_.highlightMatValue113801_1 then
					local var_160_5 = Mathf.Lerp(1, 0.5, var_160_4)
					local var_160_6 = arg_157_1.var_.highlightMatValue113801_1
					local var_160_7 = var_160_6.color

					var_160_7.r = var_160_5
					var_160_7.g = var_160_5
					var_160_7.b = var_160_5
					var_160_6.color = var_160_7
				end
			end

			if arg_157_1.time_ >= var_160_1 + var_160_3 and arg_157_1.time_ < var_160_1 + var_160_3 + arg_160_0 and arg_157_1.var_.highlightMatValue113801_1 then
				local var_160_8 = 0.5
				local var_160_9 = arg_157_1.var_.highlightMatValue113801_1
				local var_160_10 = var_160_9.color

				var_160_10.r = var_160_8
				var_160_10.g = var_160_8
				var_160_10.b = var_160_8
				var_160_9.color = var_160_10
			end

			local var_160_11 = 0
			local var_160_12 = 1.325

			if var_160_11 < arg_157_1.time_ and arg_157_1.time_ <= var_160_11 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, false)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_13 = arg_157_1:GetWordFromCfg(115311039)
				local var_160_14 = arg_157_1:FormatText(var_160_13.content)

				arg_157_1.text_.text = var_160_14

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_15 = 53
				local var_160_16 = utf8.len(var_160_14)
				local var_160_17 = var_160_15 <= 0 and var_160_12 or var_160_12 * (var_160_16 / var_160_15)

				if var_160_17 > 0 and var_160_12 < var_160_17 then
					arg_157_1.talkMaxDuration = var_160_17

					if var_160_17 + var_160_11 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_17 + var_160_11
					end
				end

				arg_157_1.text_.text = var_160_14
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)
				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_18 = math.max(var_160_12, arg_157_1.talkMaxDuration)

			if var_160_11 <= arg_157_1.time_ and arg_157_1.time_ < var_160_11 + var_160_18 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_11) / var_160_18

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_11 + var_160_18 and arg_157_1.time_ < var_160_11 + var_160_18 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play115311040 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 115311040
		arg_161_1.duration_ = 5

		SetActive(arg_161_1.tipsGo_, false)

		function arg_161_1.onSingleLineFinish_()
			arg_161_1.onSingleLineUpdate_ = nil
			arg_161_1.onSingleLineFinish_ = nil
			arg_161_1.state_ = "waiting"
		end

		function arg_161_1.playNext_(arg_163_0)
			if arg_163_0 == 1 then
				arg_161_0:Play115311041(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = 0
			local var_164_1 = 1.15

			if var_164_0 < arg_161_1.time_ and arg_161_1.time_ <= var_164_0 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, false)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_2 = arg_161_1:GetWordFromCfg(115311040)
				local var_164_3 = arg_161_1:FormatText(var_164_2.content)

				arg_161_1.text_.text = var_164_3

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_4 = 46
				local var_164_5 = utf8.len(var_164_3)
				local var_164_6 = var_164_4 <= 0 and var_164_1 or var_164_1 * (var_164_5 / var_164_4)

				if var_164_6 > 0 and var_164_1 < var_164_6 then
					arg_161_1.talkMaxDuration = var_164_6

					if var_164_6 + var_164_0 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_6 + var_164_0
					end
				end

				arg_161_1.text_.text = var_164_3
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)
				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_7 = math.max(var_164_1, arg_161_1.talkMaxDuration)

			if var_164_0 <= arg_161_1.time_ and arg_161_1.time_ < var_164_0 + var_164_7 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_0) / var_164_7

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_0 + var_164_7 and arg_161_1.time_ < var_164_0 + var_164_7 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play115311041 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 115311041
		arg_165_1.duration_ = 13.9

		local var_165_0 = {
			ja = 13.9,
			ko = 12.2,
			zh = 12.033,
			en = 13
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
				arg_165_0:Play115311042(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = arg_165_1.actors_["10029"]
			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 then
				local var_168_2 = var_168_0:GetComponent("Image")

				if var_168_2 then
					arg_165_1.var_.highlightMatValue10029 = var_168_2
				end
			end

			local var_168_3 = 0.2

			if var_168_1 <= arg_165_1.time_ and arg_165_1.time_ < var_168_1 + var_168_3 then
				local var_168_4 = (arg_165_1.time_ - var_168_1) / var_168_3

				if arg_165_1.var_.highlightMatValue10029 then
					local var_168_5 = Mathf.Lerp(0.5, 1, var_168_4)
					local var_168_6 = arg_165_1.var_.highlightMatValue10029
					local var_168_7 = var_168_6.color

					var_168_7.r = var_168_5
					var_168_7.g = var_168_5
					var_168_7.b = var_168_5
					var_168_6.color = var_168_7
				end
			end

			if arg_165_1.time_ >= var_168_1 + var_168_3 and arg_165_1.time_ < var_168_1 + var_168_3 + arg_168_0 and arg_165_1.var_.highlightMatValue10029 then
				local var_168_8 = 1

				var_168_0.transform:SetSiblingIndex(1)

				local var_168_9 = arg_165_1.var_.highlightMatValue10029
				local var_168_10 = var_168_9.color

				var_168_10.r = var_168_8
				var_168_10.g = var_168_8
				var_168_10.b = var_168_8
				var_168_9.color = var_168_10
			end

			local var_168_11 = 0
			local var_168_12 = 1.2

			if var_168_11 < arg_165_1.time_ and arg_165_1.time_ <= var_168_11 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_13 = arg_165_1:FormatText(StoryNameCfg[312].name)

				arg_165_1.leftNameTxt_.text = var_168_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_14 = arg_165_1:GetWordFromCfg(115311041)
				local var_168_15 = arg_165_1:FormatText(var_168_14.content)

				arg_165_1.text_.text = var_168_15

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_16 = 48
				local var_168_17 = utf8.len(var_168_15)
				local var_168_18 = var_168_16 <= 0 and var_168_12 or var_168_12 * (var_168_17 / var_168_16)

				if var_168_18 > 0 and var_168_12 < var_168_18 then
					arg_165_1.talkMaxDuration = var_168_18

					if var_168_18 + var_168_11 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_18 + var_168_11
					end
				end

				arg_165_1.text_.text = var_168_15
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311041", "story_v_out_115311.awb") ~= 0 then
					local var_168_19 = manager.audio:GetVoiceLength("story_v_out_115311", "115311041", "story_v_out_115311.awb") / 1000

					if var_168_19 + var_168_11 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_19 + var_168_11
					end

					if var_168_14.prefab_name ~= "" and arg_165_1.actors_[var_168_14.prefab_name] ~= nil then
						local var_168_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_14.prefab_name].transform, "story_v_out_115311", "115311041", "story_v_out_115311.awb")

						arg_165_1:RecordAudio("115311041", var_168_20)
						arg_165_1:RecordAudio("115311041", var_168_20)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_115311", "115311041", "story_v_out_115311.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_115311", "115311041", "story_v_out_115311.awb")
				end

				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_21 = math.max(var_168_12, arg_165_1.talkMaxDuration)

			if var_168_11 <= arg_165_1.time_ and arg_165_1.time_ < var_168_11 + var_168_21 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_11) / var_168_21

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_11 + var_168_21 and arg_165_1.time_ < var_168_11 + var_168_21 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play115311042 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 115311042
		arg_169_1.duration_ = 14

		local var_169_0 = {
			ja = 14,
			ko = 12.633,
			zh = 11.466,
			en = 13.8
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
				arg_169_0:Play115311043(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = 0
			local var_172_1 = 1.2

			if var_172_0 < arg_169_1.time_ and arg_169_1.time_ <= var_172_0 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_2 = arg_169_1:FormatText(StoryNameCfg[312].name)

				arg_169_1.leftNameTxt_.text = var_172_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_3 = arg_169_1:GetWordFromCfg(115311042)
				local var_172_4 = arg_169_1:FormatText(var_172_3.content)

				arg_169_1.text_.text = var_172_4

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_5 = 48
				local var_172_6 = utf8.len(var_172_4)
				local var_172_7 = var_172_5 <= 0 and var_172_1 or var_172_1 * (var_172_6 / var_172_5)

				if var_172_7 > 0 and var_172_1 < var_172_7 then
					arg_169_1.talkMaxDuration = var_172_7

					if var_172_7 + var_172_0 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_7 + var_172_0
					end
				end

				arg_169_1.text_.text = var_172_4
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311042", "story_v_out_115311.awb") ~= 0 then
					local var_172_8 = manager.audio:GetVoiceLength("story_v_out_115311", "115311042", "story_v_out_115311.awb") / 1000

					if var_172_8 + var_172_0 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_8 + var_172_0
					end

					if var_172_3.prefab_name ~= "" and arg_169_1.actors_[var_172_3.prefab_name] ~= nil then
						local var_172_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_3.prefab_name].transform, "story_v_out_115311", "115311042", "story_v_out_115311.awb")

						arg_169_1:RecordAudio("115311042", var_172_9)
						arg_169_1:RecordAudio("115311042", var_172_9)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_out_115311", "115311042", "story_v_out_115311.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_out_115311", "115311042", "story_v_out_115311.awb")
				end

				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_10 = math.max(var_172_1, arg_169_1.talkMaxDuration)

			if var_172_0 <= arg_169_1.time_ and arg_169_1.time_ < var_172_0 + var_172_10 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_0) / var_172_10

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_0 + var_172_10 and arg_169_1.time_ < var_172_0 + var_172_10 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play115311043 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 115311043
		arg_173_1.duration_ = 5

		SetActive(arg_173_1.tipsGo_, false)

		function arg_173_1.onSingleLineFinish_()
			arg_173_1.onSingleLineUpdate_ = nil
			arg_173_1.onSingleLineFinish_ = nil
			arg_173_1.state_ = "waiting"
		end

		function arg_173_1.playNext_(arg_175_0)
			if arg_175_0 == 1 then
				arg_173_0:Play115311044(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.actors_["10029"]
			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 then
				local var_176_2 = var_176_0:GetComponent("Image")

				if var_176_2 then
					arg_173_1.var_.highlightMatValue10029 = var_176_2
				end
			end

			local var_176_3 = 0.2

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_3 then
				local var_176_4 = (arg_173_1.time_ - var_176_1) / var_176_3

				if arg_173_1.var_.highlightMatValue10029 then
					local var_176_5 = Mathf.Lerp(1, 0.5, var_176_4)
					local var_176_6 = arg_173_1.var_.highlightMatValue10029
					local var_176_7 = var_176_6.color

					var_176_7.r = var_176_5
					var_176_7.g = var_176_5
					var_176_7.b = var_176_5
					var_176_6.color = var_176_7
				end
			end

			if arg_173_1.time_ >= var_176_1 + var_176_3 and arg_173_1.time_ < var_176_1 + var_176_3 + arg_176_0 and arg_173_1.var_.highlightMatValue10029 then
				local var_176_8 = 0.5
				local var_176_9 = arg_173_1.var_.highlightMatValue10029
				local var_176_10 = var_176_9.color

				var_176_10.r = var_176_8
				var_176_10.g = var_176_8
				var_176_10.b = var_176_8
				var_176_9.color = var_176_10
			end

			local var_176_11 = 0
			local var_176_12 = 1.2

			if var_176_11 < arg_173_1.time_ and arg_173_1.time_ <= var_176_11 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, false)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_13 = arg_173_1:GetWordFromCfg(115311043)
				local var_176_14 = arg_173_1:FormatText(var_176_13.content)

				arg_173_1.text_.text = var_176_14

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_15 = 47
				local var_176_16 = utf8.len(var_176_14)
				local var_176_17 = var_176_15 <= 0 and var_176_12 or var_176_12 * (var_176_16 / var_176_15)

				if var_176_17 > 0 and var_176_12 < var_176_17 then
					arg_173_1.talkMaxDuration = var_176_17

					if var_176_17 + var_176_11 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_17 + var_176_11
					end
				end

				arg_173_1.text_.text = var_176_14
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)
				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_18 = math.max(var_176_12, arg_173_1.talkMaxDuration)

			if var_176_11 <= arg_173_1.time_ and arg_173_1.time_ < var_176_11 + var_176_18 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_11) / var_176_18

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_11 + var_176_18 and arg_173_1.time_ < var_176_11 + var_176_18 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play115311044 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 115311044
		arg_177_1.duration_ = 5

		SetActive(arg_177_1.tipsGo_, false)

		function arg_177_1.onSingleLineFinish_()
			arg_177_1.onSingleLineUpdate_ = nil
			arg_177_1.onSingleLineFinish_ = nil
			arg_177_1.state_ = "waiting"
		end

		function arg_177_1.playNext_(arg_179_0)
			if arg_179_0 == 1 then
				arg_177_0:Play115311045(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = 0
			local var_180_1 = 0.8

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

				local var_180_2 = arg_177_1:GetWordFromCfg(115311044)
				local var_180_3 = arg_177_1:FormatText(var_180_2.content)

				arg_177_1.text_.text = var_180_3

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_4 = 32
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
	Play115311045 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 115311045
		arg_181_1.duration_ = 11.866

		local var_181_0 = {
			ja = 11.866,
			ko = 8.066,
			zh = 8.633,
			en = 9.3
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
				arg_181_0:Play115311046(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = arg_181_1.actors_["113801_1"]
			local var_184_1 = 0

			if var_184_1 < arg_181_1.time_ and arg_181_1.time_ <= var_184_1 + arg_184_0 then
				local var_184_2 = var_184_0:GetComponent("Image")

				if var_184_2 then
					arg_181_1.var_.highlightMatValue113801_1 = var_184_2
				end
			end

			local var_184_3 = 0.2

			if var_184_1 <= arg_181_1.time_ and arg_181_1.time_ < var_184_1 + var_184_3 then
				local var_184_4 = (arg_181_1.time_ - var_184_1) / var_184_3

				if arg_181_1.var_.highlightMatValue113801_1 then
					local var_184_5 = Mathf.Lerp(0.5, 1, var_184_4)
					local var_184_6 = arg_181_1.var_.highlightMatValue113801_1
					local var_184_7 = var_184_6.color

					var_184_7.r = var_184_5
					var_184_7.g = var_184_5
					var_184_7.b = var_184_5
					var_184_6.color = var_184_7
				end
			end

			if arg_181_1.time_ >= var_184_1 + var_184_3 and arg_181_1.time_ < var_184_1 + var_184_3 + arg_184_0 and arg_181_1.var_.highlightMatValue113801_1 then
				local var_184_8 = 1

				var_184_0.transform:SetSiblingIndex(1)

				local var_184_9 = arg_181_1.var_.highlightMatValue113801_1
				local var_184_10 = var_184_9.color

				var_184_10.r = var_184_8
				var_184_10.g = var_184_8
				var_184_10.b = var_184_8
				var_184_9.color = var_184_10
			end

			local var_184_11 = 0
			local var_184_12 = 0.7

			if var_184_11 < arg_181_1.time_ and arg_181_1.time_ <= var_184_11 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_13 = arg_181_1:FormatText(StoryNameCfg[94].name)

				arg_181_1.leftNameTxt_.text = var_184_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_14 = arg_181_1:GetWordFromCfg(115311045)
				local var_184_15 = arg_181_1:FormatText(var_184_14.content)

				arg_181_1.text_.text = var_184_15

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_16 = 28
				local var_184_17 = utf8.len(var_184_15)
				local var_184_18 = var_184_16 <= 0 and var_184_12 or var_184_12 * (var_184_17 / var_184_16)

				if var_184_18 > 0 and var_184_12 < var_184_18 then
					arg_181_1.talkMaxDuration = var_184_18

					if var_184_18 + var_184_11 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_18 + var_184_11
					end
				end

				arg_181_1.text_.text = var_184_15
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311045", "story_v_out_115311.awb") ~= 0 then
					local var_184_19 = manager.audio:GetVoiceLength("story_v_out_115311", "115311045", "story_v_out_115311.awb") / 1000

					if var_184_19 + var_184_11 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_19 + var_184_11
					end

					if var_184_14.prefab_name ~= "" and arg_181_1.actors_[var_184_14.prefab_name] ~= nil then
						local var_184_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_181_1.actors_[var_184_14.prefab_name].transform, "story_v_out_115311", "115311045", "story_v_out_115311.awb")

						arg_181_1:RecordAudio("115311045", var_184_20)
						arg_181_1:RecordAudio("115311045", var_184_20)
					else
						arg_181_1:AudioAction("play", "voice", "story_v_out_115311", "115311045", "story_v_out_115311.awb")
					end

					arg_181_1:RecordHistoryTalkVoice("story_v_out_115311", "115311045", "story_v_out_115311.awb")
				end

				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_21 = math.max(var_184_12, arg_181_1.talkMaxDuration)

			if var_184_11 <= arg_181_1.time_ and arg_181_1.time_ < var_184_11 + var_184_21 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_11) / var_184_21

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_11 + var_184_21 and arg_181_1.time_ < var_184_11 + var_184_21 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play115311046 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 115311046
		arg_185_1.duration_ = 10.033

		local var_185_0 = {
			ja = 8.9,
			ko = 5.433,
			zh = 6.6,
			en = 10.033
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
				arg_185_0:Play115311047(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = arg_185_1.actors_["10029"]
			local var_188_1 = 0

			if var_188_1 < arg_185_1.time_ and arg_185_1.time_ <= var_188_1 + arg_188_0 then
				local var_188_2 = var_188_0:GetComponent("Image")

				if var_188_2 then
					arg_185_1.var_.highlightMatValue10029 = var_188_2
				end
			end

			local var_188_3 = 0.2

			if var_188_1 <= arg_185_1.time_ and arg_185_1.time_ < var_188_1 + var_188_3 then
				local var_188_4 = (arg_185_1.time_ - var_188_1) / var_188_3

				if arg_185_1.var_.highlightMatValue10029 then
					local var_188_5 = Mathf.Lerp(0.5, 1, var_188_4)
					local var_188_6 = arg_185_1.var_.highlightMatValue10029
					local var_188_7 = var_188_6.color

					var_188_7.r = var_188_5
					var_188_7.g = var_188_5
					var_188_7.b = var_188_5
					var_188_6.color = var_188_7
				end
			end

			if arg_185_1.time_ >= var_188_1 + var_188_3 and arg_185_1.time_ < var_188_1 + var_188_3 + arg_188_0 and arg_185_1.var_.highlightMatValue10029 then
				local var_188_8 = 1

				var_188_0.transform:SetSiblingIndex(1)

				local var_188_9 = arg_185_1.var_.highlightMatValue10029
				local var_188_10 = var_188_9.color

				var_188_10.r = var_188_8
				var_188_10.g = var_188_8
				var_188_10.b = var_188_8
				var_188_9.color = var_188_10
			end

			local var_188_11 = arg_185_1.actors_["113801_1"]
			local var_188_12 = 0

			if var_188_12 < arg_185_1.time_ and arg_185_1.time_ <= var_188_12 + arg_188_0 then
				local var_188_13 = var_188_11:GetComponent("Image")

				if var_188_13 then
					arg_185_1.var_.highlightMatValue113801_1 = var_188_13
				end
			end

			local var_188_14 = 0.2

			if var_188_12 <= arg_185_1.time_ and arg_185_1.time_ < var_188_12 + var_188_14 then
				local var_188_15 = (arg_185_1.time_ - var_188_12) / var_188_14

				if arg_185_1.var_.highlightMatValue113801_1 then
					local var_188_16 = Mathf.Lerp(1, 0.5, var_188_15)
					local var_188_17 = arg_185_1.var_.highlightMatValue113801_1
					local var_188_18 = var_188_17.color

					var_188_18.r = var_188_16
					var_188_18.g = var_188_16
					var_188_18.b = var_188_16
					var_188_17.color = var_188_18
				end
			end

			if arg_185_1.time_ >= var_188_12 + var_188_14 and arg_185_1.time_ < var_188_12 + var_188_14 + arg_188_0 and arg_185_1.var_.highlightMatValue113801_1 then
				local var_188_19 = 0.5
				local var_188_20 = arg_185_1.var_.highlightMatValue113801_1
				local var_188_21 = var_188_20.color

				var_188_21.r = var_188_19
				var_188_21.g = var_188_19
				var_188_21.b = var_188_19
				var_188_20.color = var_188_21
			end

			local var_188_22 = 0
			local var_188_23 = 0.625

			if var_188_22 < arg_185_1.time_ and arg_185_1.time_ <= var_188_22 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_24 = arg_185_1:FormatText(StoryNameCfg[312].name)

				arg_185_1.leftNameTxt_.text = var_188_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_25 = arg_185_1:GetWordFromCfg(115311046)
				local var_188_26 = arg_185_1:FormatText(var_188_25.content)

				arg_185_1.text_.text = var_188_26

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_27 = 25
				local var_188_28 = utf8.len(var_188_26)
				local var_188_29 = var_188_27 <= 0 and var_188_23 or var_188_23 * (var_188_28 / var_188_27)

				if var_188_29 > 0 and var_188_23 < var_188_29 then
					arg_185_1.talkMaxDuration = var_188_29

					if var_188_29 + var_188_22 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_29 + var_188_22
					end
				end

				arg_185_1.text_.text = var_188_26
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311046", "story_v_out_115311.awb") ~= 0 then
					local var_188_30 = manager.audio:GetVoiceLength("story_v_out_115311", "115311046", "story_v_out_115311.awb") / 1000

					if var_188_30 + var_188_22 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_30 + var_188_22
					end

					if var_188_25.prefab_name ~= "" and arg_185_1.actors_[var_188_25.prefab_name] ~= nil then
						local var_188_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_25.prefab_name].transform, "story_v_out_115311", "115311046", "story_v_out_115311.awb")

						arg_185_1:RecordAudio("115311046", var_188_31)
						arg_185_1:RecordAudio("115311046", var_188_31)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_115311", "115311046", "story_v_out_115311.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_115311", "115311046", "story_v_out_115311.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_32 = math.max(var_188_23, arg_185_1.talkMaxDuration)

			if var_188_22 <= arg_185_1.time_ and arg_185_1.time_ < var_188_22 + var_188_32 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_22) / var_188_32

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_22 + var_188_32 and arg_185_1.time_ < var_188_22 + var_188_32 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play115311047 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 115311047
		arg_189_1.duration_ = 5

		SetActive(arg_189_1.tipsGo_, false)

		function arg_189_1.onSingleLineFinish_()
			arg_189_1.onSingleLineUpdate_ = nil
			arg_189_1.onSingleLineFinish_ = nil
			arg_189_1.state_ = "waiting"
		end

		function arg_189_1.playNext_(arg_191_0)
			if arg_191_0 == 1 then
				arg_189_0:Play115311048(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = arg_189_1.actors_["10029"]
			local var_192_1 = 0

			if var_192_1 < arg_189_1.time_ and arg_189_1.time_ <= var_192_1 + arg_192_0 then
				local var_192_2 = var_192_0:GetComponent("Image")

				if var_192_2 then
					arg_189_1.var_.highlightMatValue10029 = var_192_2
				end
			end

			local var_192_3 = 0.2

			if var_192_1 <= arg_189_1.time_ and arg_189_1.time_ < var_192_1 + var_192_3 then
				local var_192_4 = (arg_189_1.time_ - var_192_1) / var_192_3

				if arg_189_1.var_.highlightMatValue10029 then
					local var_192_5 = Mathf.Lerp(1, 0.5, var_192_4)
					local var_192_6 = arg_189_1.var_.highlightMatValue10029
					local var_192_7 = var_192_6.color

					var_192_7.r = var_192_5
					var_192_7.g = var_192_5
					var_192_7.b = var_192_5
					var_192_6.color = var_192_7
				end
			end

			if arg_189_1.time_ >= var_192_1 + var_192_3 and arg_189_1.time_ < var_192_1 + var_192_3 + arg_192_0 and arg_189_1.var_.highlightMatValue10029 then
				local var_192_8 = 0.5
				local var_192_9 = arg_189_1.var_.highlightMatValue10029
				local var_192_10 = var_192_9.color

				var_192_10.r = var_192_8
				var_192_10.g = var_192_8
				var_192_10.b = var_192_8
				var_192_9.color = var_192_10
			end

			local var_192_11 = 0
			local var_192_12 = 1.525

			if var_192_11 < arg_189_1.time_ and arg_189_1.time_ <= var_192_11 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, false)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_13 = arg_189_1:GetWordFromCfg(115311047)
				local var_192_14 = arg_189_1:FormatText(var_192_13.content)

				arg_189_1.text_.text = var_192_14

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_15 = 61
				local var_192_16 = utf8.len(var_192_14)
				local var_192_17 = var_192_15 <= 0 and var_192_12 or var_192_12 * (var_192_16 / var_192_15)

				if var_192_17 > 0 and var_192_12 < var_192_17 then
					arg_189_1.talkMaxDuration = var_192_17

					if var_192_17 + var_192_11 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_17 + var_192_11
					end
				end

				arg_189_1.text_.text = var_192_14
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)
				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_18 = math.max(var_192_12, arg_189_1.talkMaxDuration)

			if var_192_11 <= arg_189_1.time_ and arg_189_1.time_ < var_192_11 + var_192_18 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_11) / var_192_18

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_11 + var_192_18 and arg_189_1.time_ < var_192_11 + var_192_18 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play115311048 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 115311048
		arg_193_1.duration_ = 5

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
		end

		function arg_193_1.playNext_(arg_195_0)
			if arg_195_0 == 1 then
				arg_193_0:Play115311049(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = 0
			local var_196_1 = 0.9

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

				local var_196_2 = arg_193_1:GetWordFromCfg(115311048)
				local var_196_3 = arg_193_1:FormatText(var_196_2.content)

				arg_193_1.text_.text = var_196_3

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_4 = 36
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
	Play115311049 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 115311049
		arg_197_1.duration_ = 14.133

		local var_197_0 = {
			ja = 14.133,
			ko = 9.466,
			zh = 9.233,
			en = 10.4
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
				arg_197_0:Play115311050(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = arg_197_1.actors_["113801_1"]
			local var_200_1 = 0

			if var_200_1 < arg_197_1.time_ and arg_197_1.time_ <= var_200_1 + arg_200_0 then
				local var_200_2 = var_200_0:GetComponent("Image")

				if var_200_2 then
					arg_197_1.var_.highlightMatValue113801_1 = var_200_2
				end
			end

			local var_200_3 = 0.2

			if var_200_1 <= arg_197_1.time_ and arg_197_1.time_ < var_200_1 + var_200_3 then
				local var_200_4 = (arg_197_1.time_ - var_200_1) / var_200_3

				if arg_197_1.var_.highlightMatValue113801_1 then
					local var_200_5 = Mathf.Lerp(0.5, 1, var_200_4)
					local var_200_6 = arg_197_1.var_.highlightMatValue113801_1
					local var_200_7 = var_200_6.color

					var_200_7.r = var_200_5
					var_200_7.g = var_200_5
					var_200_7.b = var_200_5
					var_200_6.color = var_200_7
				end
			end

			if arg_197_1.time_ >= var_200_1 + var_200_3 and arg_197_1.time_ < var_200_1 + var_200_3 + arg_200_0 and arg_197_1.var_.highlightMatValue113801_1 then
				local var_200_8 = 1

				var_200_0.transform:SetSiblingIndex(1)

				local var_200_9 = arg_197_1.var_.highlightMatValue113801_1
				local var_200_10 = var_200_9.color

				var_200_10.r = var_200_8
				var_200_10.g = var_200_8
				var_200_10.b = var_200_8
				var_200_9.color = var_200_10
			end

			local var_200_11 = 0
			local var_200_12 = 0.9

			if var_200_11 < arg_197_1.time_ and arg_197_1.time_ <= var_200_11 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_13 = arg_197_1:FormatText(StoryNameCfg[94].name)

				arg_197_1.leftNameTxt_.text = var_200_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_14 = arg_197_1:GetWordFromCfg(115311049)
				local var_200_15 = arg_197_1:FormatText(var_200_14.content)

				arg_197_1.text_.text = var_200_15

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_16 = 35
				local var_200_17 = utf8.len(var_200_15)
				local var_200_18 = var_200_16 <= 0 and var_200_12 or var_200_12 * (var_200_17 / var_200_16)

				if var_200_18 > 0 and var_200_12 < var_200_18 then
					arg_197_1.talkMaxDuration = var_200_18

					if var_200_18 + var_200_11 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_18 + var_200_11
					end
				end

				arg_197_1.text_.text = var_200_15
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311049", "story_v_out_115311.awb") ~= 0 then
					local var_200_19 = manager.audio:GetVoiceLength("story_v_out_115311", "115311049", "story_v_out_115311.awb") / 1000

					if var_200_19 + var_200_11 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_19 + var_200_11
					end

					if var_200_14.prefab_name ~= "" and arg_197_1.actors_[var_200_14.prefab_name] ~= nil then
						local var_200_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_197_1.actors_[var_200_14.prefab_name].transform, "story_v_out_115311", "115311049", "story_v_out_115311.awb")

						arg_197_1:RecordAudio("115311049", var_200_20)
						arg_197_1:RecordAudio("115311049", var_200_20)
					else
						arg_197_1:AudioAction("play", "voice", "story_v_out_115311", "115311049", "story_v_out_115311.awb")
					end

					arg_197_1:RecordHistoryTalkVoice("story_v_out_115311", "115311049", "story_v_out_115311.awb")
				end

				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_21 = math.max(var_200_12, arg_197_1.talkMaxDuration)

			if var_200_11 <= arg_197_1.time_ and arg_197_1.time_ < var_200_11 + var_200_21 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_11) / var_200_21

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_11 + var_200_21 and arg_197_1.time_ < var_200_11 + var_200_21 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play115311050 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 115311050
		arg_201_1.duration_ = 3.133

		local var_201_0 = {
			ja = 2.9,
			ko = 2.9,
			zh = 2.766,
			en = 3.133
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
				arg_201_0:Play115311051(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = arg_201_1.actors_["10029"]
			local var_204_1 = 0

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 then
				local var_204_2 = var_204_0:GetComponent("Image")

				if var_204_2 then
					arg_201_1.var_.highlightMatValue10029 = var_204_2
				end
			end

			local var_204_3 = 0.2

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_3 then
				local var_204_4 = (arg_201_1.time_ - var_204_1) / var_204_3

				if arg_201_1.var_.highlightMatValue10029 then
					local var_204_5 = Mathf.Lerp(0.5, 1, var_204_4)
					local var_204_6 = arg_201_1.var_.highlightMatValue10029
					local var_204_7 = var_204_6.color

					var_204_7.r = var_204_5
					var_204_7.g = var_204_5
					var_204_7.b = var_204_5
					var_204_6.color = var_204_7
				end
			end

			if arg_201_1.time_ >= var_204_1 + var_204_3 and arg_201_1.time_ < var_204_1 + var_204_3 + arg_204_0 and arg_201_1.var_.highlightMatValue10029 then
				local var_204_8 = 1

				var_204_0.transform:SetSiblingIndex(1)

				local var_204_9 = arg_201_1.var_.highlightMatValue10029
				local var_204_10 = var_204_9.color

				var_204_10.r = var_204_8
				var_204_10.g = var_204_8
				var_204_10.b = var_204_8
				var_204_9.color = var_204_10
			end

			local var_204_11 = arg_201_1.actors_["113801_1"]
			local var_204_12 = 0

			if var_204_12 < arg_201_1.time_ and arg_201_1.time_ <= var_204_12 + arg_204_0 then
				local var_204_13 = var_204_11:GetComponent("Image")

				if var_204_13 then
					arg_201_1.var_.highlightMatValue113801_1 = var_204_13
				end
			end

			local var_204_14 = 0.2

			if var_204_12 <= arg_201_1.time_ and arg_201_1.time_ < var_204_12 + var_204_14 then
				local var_204_15 = (arg_201_1.time_ - var_204_12) / var_204_14

				if arg_201_1.var_.highlightMatValue113801_1 then
					local var_204_16 = Mathf.Lerp(1, 0.5, var_204_15)
					local var_204_17 = arg_201_1.var_.highlightMatValue113801_1
					local var_204_18 = var_204_17.color

					var_204_18.r = var_204_16
					var_204_18.g = var_204_16
					var_204_18.b = var_204_16
					var_204_17.color = var_204_18
				end
			end

			if arg_201_1.time_ >= var_204_12 + var_204_14 and arg_201_1.time_ < var_204_12 + var_204_14 + arg_204_0 and arg_201_1.var_.highlightMatValue113801_1 then
				local var_204_19 = 0.5
				local var_204_20 = arg_201_1.var_.highlightMatValue113801_1
				local var_204_21 = var_204_20.color

				var_204_21.r = var_204_19
				var_204_21.g = var_204_19
				var_204_21.b = var_204_19
				var_204_20.color = var_204_21
			end

			local var_204_22 = 0
			local var_204_23 = 0.175

			if var_204_22 < arg_201_1.time_ and arg_201_1.time_ <= var_204_22 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_24 = arg_201_1:FormatText(StoryNameCfg[312].name)

				arg_201_1.leftNameTxt_.text = var_204_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_25 = arg_201_1:GetWordFromCfg(115311050)
				local var_204_26 = arg_201_1:FormatText(var_204_25.content)

				arg_201_1.text_.text = var_204_26

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_27 = 7
				local var_204_28 = utf8.len(var_204_26)
				local var_204_29 = var_204_27 <= 0 and var_204_23 or var_204_23 * (var_204_28 / var_204_27)

				if var_204_29 > 0 and var_204_23 < var_204_29 then
					arg_201_1.talkMaxDuration = var_204_29

					if var_204_29 + var_204_22 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_29 + var_204_22
					end
				end

				arg_201_1.text_.text = var_204_26
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311050", "story_v_out_115311.awb") ~= 0 then
					local var_204_30 = manager.audio:GetVoiceLength("story_v_out_115311", "115311050", "story_v_out_115311.awb") / 1000

					if var_204_30 + var_204_22 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_30 + var_204_22
					end

					if var_204_25.prefab_name ~= "" and arg_201_1.actors_[var_204_25.prefab_name] ~= nil then
						local var_204_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_25.prefab_name].transform, "story_v_out_115311", "115311050", "story_v_out_115311.awb")

						arg_201_1:RecordAudio("115311050", var_204_31)
						arg_201_1:RecordAudio("115311050", var_204_31)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_out_115311", "115311050", "story_v_out_115311.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_out_115311", "115311050", "story_v_out_115311.awb")
				end

				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_32 = math.max(var_204_23, arg_201_1.talkMaxDuration)

			if var_204_22 <= arg_201_1.time_ and arg_201_1.time_ < var_204_22 + var_204_32 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_22) / var_204_32

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_22 + var_204_32 and arg_201_1.time_ < var_204_22 + var_204_32 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play115311051 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 115311051
		arg_205_1.duration_ = 5

		SetActive(arg_205_1.tipsGo_, false)

		function arg_205_1.onSingleLineFinish_()
			arg_205_1.onSingleLineUpdate_ = nil
			arg_205_1.onSingleLineFinish_ = nil
			arg_205_1.state_ = "waiting"
		end

		function arg_205_1.playNext_(arg_207_0)
			if arg_207_0 == 1 then
				arg_205_0:Play115311052(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = arg_205_1.actors_["10029"]
			local var_208_1 = 0

			if var_208_1 < arg_205_1.time_ and arg_205_1.time_ <= var_208_1 + arg_208_0 then
				local var_208_2 = var_208_0:GetComponent("Image")

				if var_208_2 then
					arg_205_1.var_.alphaMatValue10029 = var_208_2
					arg_205_1.var_.alphaOldValue10029 = var_208_2.color.a
				end

				arg_205_1.var_.alphaOldValue10029 = 1
			end

			local var_208_3 = 0.5

			if var_208_1 <= arg_205_1.time_ and arg_205_1.time_ < var_208_1 + var_208_3 then
				local var_208_4 = (arg_205_1.time_ - var_208_1) / var_208_3
				local var_208_5 = Mathf.Lerp(arg_205_1.var_.alphaOldValue10029, 0, var_208_4)

				if arg_205_1.var_.alphaMatValue10029 then
					local var_208_6 = arg_205_1.var_.alphaMatValue10029.color

					var_208_6.a = var_208_5
					arg_205_1.var_.alphaMatValue10029.color = var_208_6
				end
			end

			if arg_205_1.time_ >= var_208_1 + var_208_3 and arg_205_1.time_ < var_208_1 + var_208_3 + arg_208_0 and arg_205_1.var_.alphaMatValue10029 then
				local var_208_7 = arg_205_1.var_.alphaMatValue10029
				local var_208_8 = var_208_7.color

				var_208_8.a = 0
				var_208_7.color = var_208_8
			end

			local var_208_9 = arg_205_1.actors_["113801_1"]
			local var_208_10 = 0

			if var_208_10 < arg_205_1.time_ and arg_205_1.time_ <= var_208_10 + arg_208_0 then
				local var_208_11 = var_208_9:GetComponent("Image")

				if var_208_11 then
					arg_205_1.var_.alphaMatValue113801_1 = var_208_11
					arg_205_1.var_.alphaOldValue113801_1 = var_208_11.color.a
				end

				arg_205_1.var_.alphaOldValue113801_1 = 1
			end

			local var_208_12 = 0.5

			if var_208_10 <= arg_205_1.time_ and arg_205_1.time_ < var_208_10 + var_208_12 then
				local var_208_13 = (arg_205_1.time_ - var_208_10) / var_208_12
				local var_208_14 = Mathf.Lerp(arg_205_1.var_.alphaOldValue113801_1, 0, var_208_13)

				if arg_205_1.var_.alphaMatValue113801_1 then
					local var_208_15 = arg_205_1.var_.alphaMatValue113801_1.color

					var_208_15.a = var_208_14
					arg_205_1.var_.alphaMatValue113801_1.color = var_208_15
				end
			end

			if arg_205_1.time_ >= var_208_10 + var_208_12 and arg_205_1.time_ < var_208_10 + var_208_12 + arg_208_0 and arg_205_1.var_.alphaMatValue113801_1 then
				local var_208_16 = arg_205_1.var_.alphaMatValue113801_1
				local var_208_17 = var_208_16.color

				var_208_17.a = 0
				var_208_16.color = var_208_17
			end

			local var_208_18 = 0
			local var_208_19 = 0.95

			if var_208_18 < arg_205_1.time_ and arg_205_1.time_ <= var_208_18 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, false)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_20 = arg_205_1:GetWordFromCfg(115311051)
				local var_208_21 = arg_205_1:FormatText(var_208_20.content)

				arg_205_1.text_.text = var_208_21

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_22 = 38
				local var_208_23 = utf8.len(var_208_21)
				local var_208_24 = var_208_22 <= 0 and var_208_19 or var_208_19 * (var_208_23 / var_208_22)

				if var_208_24 > 0 and var_208_19 < var_208_24 then
					arg_205_1.talkMaxDuration = var_208_24

					if var_208_24 + var_208_18 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_24 + var_208_18
					end
				end

				arg_205_1.text_.text = var_208_21
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)
				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_25 = math.max(var_208_19, arg_205_1.talkMaxDuration)

			if var_208_18 <= arg_205_1.time_ and arg_205_1.time_ < var_208_18 + var_208_25 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_18) / var_208_25

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_18 + var_208_25 and arg_205_1.time_ < var_208_18 + var_208_25 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play115311052 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 115311052
		arg_209_1.duration_ = 5

		SetActive(arg_209_1.tipsGo_, false)

		function arg_209_1.onSingleLineFinish_()
			arg_209_1.onSingleLineUpdate_ = nil
			arg_209_1.onSingleLineFinish_ = nil
			arg_209_1.state_ = "waiting"
		end

		function arg_209_1.playNext_(arg_211_0)
			if arg_211_0 == 1 then
				arg_209_0:Play115311053(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = 0
			local var_212_1 = 1.35

			if var_212_0 < arg_209_1.time_ and arg_209_1.time_ <= var_212_0 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, false)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_2 = arg_209_1:GetWordFromCfg(115311052)
				local var_212_3 = arg_209_1:FormatText(var_212_2.content)

				arg_209_1.text_.text = var_212_3

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_4 = 54
				local var_212_5 = utf8.len(var_212_3)
				local var_212_6 = var_212_4 <= 0 and var_212_1 or var_212_1 * (var_212_5 / var_212_4)

				if var_212_6 > 0 and var_212_1 < var_212_6 then
					arg_209_1.talkMaxDuration = var_212_6

					if var_212_6 + var_212_0 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_6 + var_212_0
					end
				end

				arg_209_1.text_.text = var_212_3
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)
				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_7 = math.max(var_212_1, arg_209_1.talkMaxDuration)

			if var_212_0 <= arg_209_1.time_ and arg_209_1.time_ < var_212_0 + var_212_7 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_0) / var_212_7

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_0 + var_212_7 and arg_209_1.time_ < var_212_0 + var_212_7 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play115311053 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 115311053
		arg_213_1.duration_ = 7.033

		local var_213_0 = {
			ja = 7.033,
			ko = 3.9,
			zh = 4.8,
			en = 6.333
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
				arg_213_0:Play115311054(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["10029"]
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 then
				local var_216_2 = var_216_0:GetComponent("Image")

				if var_216_2 then
					arg_213_1.var_.alphaMatValue10029 = var_216_2
					arg_213_1.var_.alphaOldValue10029 = var_216_2.color.a
				end

				arg_213_1.var_.alphaOldValue10029 = 0
			end

			local var_216_3 = 0.5

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_3 then
				local var_216_4 = (arg_213_1.time_ - var_216_1) / var_216_3
				local var_216_5 = Mathf.Lerp(arg_213_1.var_.alphaOldValue10029, 1, var_216_4)

				if arg_213_1.var_.alphaMatValue10029 then
					local var_216_6 = arg_213_1.var_.alphaMatValue10029.color

					var_216_6.a = var_216_5
					arg_213_1.var_.alphaMatValue10029.color = var_216_6
				end
			end

			if arg_213_1.time_ >= var_216_1 + var_216_3 and arg_213_1.time_ < var_216_1 + var_216_3 + arg_216_0 and arg_213_1.var_.alphaMatValue10029 then
				local var_216_7 = arg_213_1.var_.alphaMatValue10029
				local var_216_8 = var_216_7.color

				var_216_8.a = 1
				var_216_7.color = var_216_8
			end

			local var_216_9 = arg_213_1.actors_["113801_1"]
			local var_216_10 = 0

			if var_216_10 < arg_213_1.time_ and arg_213_1.time_ <= var_216_10 + arg_216_0 then
				local var_216_11 = var_216_9:GetComponent("Image")

				if var_216_11 then
					arg_213_1.var_.alphaMatValue113801_1 = var_216_11
					arg_213_1.var_.alphaOldValue113801_1 = var_216_11.color.a
				end

				arg_213_1.var_.alphaOldValue113801_1 = 0
			end

			local var_216_12 = 0.5

			if var_216_10 <= arg_213_1.time_ and arg_213_1.time_ < var_216_10 + var_216_12 then
				local var_216_13 = (arg_213_1.time_ - var_216_10) / var_216_12
				local var_216_14 = Mathf.Lerp(arg_213_1.var_.alphaOldValue113801_1, 1, var_216_13)

				if arg_213_1.var_.alphaMatValue113801_1 then
					local var_216_15 = arg_213_1.var_.alphaMatValue113801_1.color

					var_216_15.a = var_216_14
					arg_213_1.var_.alphaMatValue113801_1.color = var_216_15
				end
			end

			if arg_213_1.time_ >= var_216_10 + var_216_12 and arg_213_1.time_ < var_216_10 + var_216_12 + arg_216_0 and arg_213_1.var_.alphaMatValue113801_1 then
				local var_216_16 = arg_213_1.var_.alphaMatValue113801_1
				local var_216_17 = var_216_16.color

				var_216_17.a = 1
				var_216_16.color = var_216_17
			end

			local var_216_18 = arg_213_1.actors_["10029"]
			local var_216_19 = 0

			if var_216_19 < arg_213_1.time_ and arg_213_1.time_ <= var_216_19 + arg_216_0 then
				local var_216_20 = var_216_18:GetComponent("Image")

				if var_216_20 then
					arg_213_1.var_.highlightMatValue10029 = var_216_20
				end
			end

			local var_216_21 = 0.2

			if var_216_19 <= arg_213_1.time_ and arg_213_1.time_ < var_216_19 + var_216_21 then
				local var_216_22 = (arg_213_1.time_ - var_216_19) / var_216_21

				if arg_213_1.var_.highlightMatValue10029 then
					local var_216_23 = Mathf.Lerp(0.5, 1, var_216_22)
					local var_216_24 = arg_213_1.var_.highlightMatValue10029
					local var_216_25 = var_216_24.color

					var_216_25.r = var_216_23
					var_216_25.g = var_216_23
					var_216_25.b = var_216_23
					var_216_24.color = var_216_25
				end
			end

			if arg_213_1.time_ >= var_216_19 + var_216_21 and arg_213_1.time_ < var_216_19 + var_216_21 + arg_216_0 and arg_213_1.var_.highlightMatValue10029 then
				local var_216_26 = 1

				var_216_18.transform:SetSiblingIndex(1)

				local var_216_27 = arg_213_1.var_.highlightMatValue10029
				local var_216_28 = var_216_27.color

				var_216_28.r = var_216_26
				var_216_28.g = var_216_26
				var_216_28.b = var_216_26
				var_216_27.color = var_216_28
			end

			local var_216_29 = 0
			local var_216_30 = 0.425

			if var_216_29 < arg_213_1.time_ and arg_213_1.time_ <= var_216_29 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, true)

				local var_216_31 = arg_213_1:FormatText(StoryNameCfg[312].name)

				arg_213_1.leftNameTxt_.text = var_216_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_213_1.leftNameTxt_.transform)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1.leftNameTxt_.text)
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_32 = arg_213_1:GetWordFromCfg(115311053)
				local var_216_33 = arg_213_1:FormatText(var_216_32.content)

				arg_213_1.text_.text = var_216_33

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_34 = 17
				local var_216_35 = utf8.len(var_216_33)
				local var_216_36 = var_216_34 <= 0 and var_216_30 or var_216_30 * (var_216_35 / var_216_34)

				if var_216_36 > 0 and var_216_30 < var_216_36 then
					arg_213_1.talkMaxDuration = var_216_36

					if var_216_36 + var_216_29 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_36 + var_216_29
					end
				end

				arg_213_1.text_.text = var_216_33
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311053", "story_v_out_115311.awb") ~= 0 then
					local var_216_37 = manager.audio:GetVoiceLength("story_v_out_115311", "115311053", "story_v_out_115311.awb") / 1000

					if var_216_37 + var_216_29 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_37 + var_216_29
					end

					if var_216_32.prefab_name ~= "" and arg_213_1.actors_[var_216_32.prefab_name] ~= nil then
						local var_216_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_213_1.actors_[var_216_32.prefab_name].transform, "story_v_out_115311", "115311053", "story_v_out_115311.awb")

						arg_213_1:RecordAudio("115311053", var_216_38)
						arg_213_1:RecordAudio("115311053", var_216_38)
					else
						arg_213_1:AudioAction("play", "voice", "story_v_out_115311", "115311053", "story_v_out_115311.awb")
					end

					arg_213_1:RecordHistoryTalkVoice("story_v_out_115311", "115311053", "story_v_out_115311.awb")
				end

				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_39 = math.max(var_216_30, arg_213_1.talkMaxDuration)

			if var_216_29 <= arg_213_1.time_ and arg_213_1.time_ < var_216_29 + var_216_39 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_29) / var_216_39

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_29 + var_216_39 and arg_213_1.time_ < var_216_29 + var_216_39 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play115311054 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 115311054
		arg_217_1.duration_ = 10.5

		local var_217_0 = {
			ja = 10.5,
			ko = 8.5,
			zh = 7.133,
			en = 10.166
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
				arg_217_0:Play115311055(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = arg_217_1.actors_["10029"]
			local var_220_1 = 0

			if var_220_1 < arg_217_1.time_ and arg_217_1.time_ <= var_220_1 + arg_220_0 then
				local var_220_2 = var_220_0:GetComponent("Image")

				if var_220_2 then
					arg_217_1.var_.highlightMatValue10029 = var_220_2
				end
			end

			local var_220_3 = 0.2

			if var_220_1 <= arg_217_1.time_ and arg_217_1.time_ < var_220_1 + var_220_3 then
				local var_220_4 = (arg_217_1.time_ - var_220_1) / var_220_3

				if arg_217_1.var_.highlightMatValue10029 then
					local var_220_5 = Mathf.Lerp(1, 0.5, var_220_4)
					local var_220_6 = arg_217_1.var_.highlightMatValue10029
					local var_220_7 = var_220_6.color

					var_220_7.r = var_220_5
					var_220_7.g = var_220_5
					var_220_7.b = var_220_5
					var_220_6.color = var_220_7
				end
			end

			if arg_217_1.time_ >= var_220_1 + var_220_3 and arg_217_1.time_ < var_220_1 + var_220_3 + arg_220_0 and arg_217_1.var_.highlightMatValue10029 then
				local var_220_8 = 0.5
				local var_220_9 = arg_217_1.var_.highlightMatValue10029
				local var_220_10 = var_220_9.color

				var_220_10.r = var_220_8
				var_220_10.g = var_220_8
				var_220_10.b = var_220_8
				var_220_9.color = var_220_10
			end

			local var_220_11 = arg_217_1.actors_["113801_1"]
			local var_220_12 = 0

			if var_220_12 < arg_217_1.time_ and arg_217_1.time_ <= var_220_12 + arg_220_0 then
				local var_220_13 = var_220_11:GetComponent("Image")

				if var_220_13 then
					arg_217_1.var_.highlightMatValue113801_1 = var_220_13
				end
			end

			local var_220_14 = 0.2

			if var_220_12 <= arg_217_1.time_ and arg_217_1.time_ < var_220_12 + var_220_14 then
				local var_220_15 = (arg_217_1.time_ - var_220_12) / var_220_14

				if arg_217_1.var_.highlightMatValue113801_1 then
					local var_220_16 = Mathf.Lerp(0.5, 1, var_220_15)
					local var_220_17 = arg_217_1.var_.highlightMatValue113801_1
					local var_220_18 = var_220_17.color

					var_220_18.r = var_220_16
					var_220_18.g = var_220_16
					var_220_18.b = var_220_16
					var_220_17.color = var_220_18
				end
			end

			if arg_217_1.time_ >= var_220_12 + var_220_14 and arg_217_1.time_ < var_220_12 + var_220_14 + arg_220_0 and arg_217_1.var_.highlightMatValue113801_1 then
				local var_220_19 = 1

				var_220_11.transform:SetSiblingIndex(1)

				local var_220_20 = arg_217_1.var_.highlightMatValue113801_1
				local var_220_21 = var_220_20.color

				var_220_21.r = var_220_19
				var_220_21.g = var_220_19
				var_220_21.b = var_220_19
				var_220_20.color = var_220_21
			end

			local var_220_22 = 0
			local var_220_23 = 0.775

			if var_220_22 < arg_217_1.time_ and arg_217_1.time_ <= var_220_22 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_24 = arg_217_1:FormatText(StoryNameCfg[94].name)

				arg_217_1.leftNameTxt_.text = var_220_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_25 = arg_217_1:GetWordFromCfg(115311054)
				local var_220_26 = arg_217_1:FormatText(var_220_25.content)

				arg_217_1.text_.text = var_220_26

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_27 = 31
				local var_220_28 = utf8.len(var_220_26)
				local var_220_29 = var_220_27 <= 0 and var_220_23 or var_220_23 * (var_220_28 / var_220_27)

				if var_220_29 > 0 and var_220_23 < var_220_29 then
					arg_217_1.talkMaxDuration = var_220_29

					if var_220_29 + var_220_22 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_29 + var_220_22
					end
				end

				arg_217_1.text_.text = var_220_26
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311054", "story_v_out_115311.awb") ~= 0 then
					local var_220_30 = manager.audio:GetVoiceLength("story_v_out_115311", "115311054", "story_v_out_115311.awb") / 1000

					if var_220_30 + var_220_22 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_30 + var_220_22
					end

					if var_220_25.prefab_name ~= "" and arg_217_1.actors_[var_220_25.prefab_name] ~= nil then
						local var_220_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_25.prefab_name].transform, "story_v_out_115311", "115311054", "story_v_out_115311.awb")

						arg_217_1:RecordAudio("115311054", var_220_31)
						arg_217_1:RecordAudio("115311054", var_220_31)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_out_115311", "115311054", "story_v_out_115311.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_out_115311", "115311054", "story_v_out_115311.awb")
				end

				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_32 = math.max(var_220_23, arg_217_1.talkMaxDuration)

			if var_220_22 <= arg_217_1.time_ and arg_217_1.time_ < var_220_22 + var_220_32 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_22) / var_220_32

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_22 + var_220_32 and arg_217_1.time_ < var_220_22 + var_220_32 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play115311055 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 115311055
		arg_221_1.duration_ = 5

		SetActive(arg_221_1.tipsGo_, false)

		function arg_221_1.onSingleLineFinish_()
			arg_221_1.onSingleLineUpdate_ = nil
			arg_221_1.onSingleLineFinish_ = nil
			arg_221_1.state_ = "waiting"
		end

		function arg_221_1.playNext_(arg_223_0)
			if arg_223_0 == 1 then
				arg_221_0:Play115311056(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = arg_221_1.actors_["113801_1"]
			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 then
				local var_224_2 = var_224_0:GetComponent("Image")

				if var_224_2 then
					arg_221_1.var_.highlightMatValue113801_1 = var_224_2
				end
			end

			local var_224_3 = 0.2

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_3 then
				local var_224_4 = (arg_221_1.time_ - var_224_1) / var_224_3

				if arg_221_1.var_.highlightMatValue113801_1 then
					local var_224_5 = Mathf.Lerp(1, 0.5, var_224_4)
					local var_224_6 = arg_221_1.var_.highlightMatValue113801_1
					local var_224_7 = var_224_6.color

					var_224_7.r = var_224_5
					var_224_7.g = var_224_5
					var_224_7.b = var_224_5
					var_224_6.color = var_224_7
				end
			end

			if arg_221_1.time_ >= var_224_1 + var_224_3 and arg_221_1.time_ < var_224_1 + var_224_3 + arg_224_0 and arg_221_1.var_.highlightMatValue113801_1 then
				local var_224_8 = 0.5
				local var_224_9 = arg_221_1.var_.highlightMatValue113801_1
				local var_224_10 = var_224_9.color

				var_224_10.r = var_224_8
				var_224_10.g = var_224_8
				var_224_10.b = var_224_8
				var_224_9.color = var_224_10
			end

			local var_224_11 = 0
			local var_224_12 = 1.05

			if var_224_11 < arg_221_1.time_ and arg_221_1.time_ <= var_224_11 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, false)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_13 = arg_221_1:GetWordFromCfg(115311055)
				local var_224_14 = arg_221_1:FormatText(var_224_13.content)

				arg_221_1.text_.text = var_224_14

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_15 = 42
				local var_224_16 = utf8.len(var_224_14)
				local var_224_17 = var_224_15 <= 0 and var_224_12 or var_224_12 * (var_224_16 / var_224_15)

				if var_224_17 > 0 and var_224_12 < var_224_17 then
					arg_221_1.talkMaxDuration = var_224_17

					if var_224_17 + var_224_11 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_17 + var_224_11
					end
				end

				arg_221_1.text_.text = var_224_14
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)
				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_18 = math.max(var_224_12, arg_221_1.talkMaxDuration)

			if var_224_11 <= arg_221_1.time_ and arg_221_1.time_ < var_224_11 + var_224_18 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_11) / var_224_18

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_11 + var_224_18 and arg_221_1.time_ < var_224_11 + var_224_18 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play115311056 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 115311056
		arg_225_1.duration_ = 5

		SetActive(arg_225_1.tipsGo_, false)

		function arg_225_1.onSingleLineFinish_()
			arg_225_1.onSingleLineUpdate_ = nil
			arg_225_1.onSingleLineFinish_ = nil
			arg_225_1.state_ = "waiting"
		end

		function arg_225_1.playNext_(arg_227_0)
			if arg_227_0 == 1 then
				arg_225_0:Play115311057(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = 0
			local var_228_1 = 0.4

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

				local var_228_2 = arg_225_1:GetWordFromCfg(115311056)
				local var_228_3 = arg_225_1:FormatText(var_228_2.content)

				arg_225_1.text_.text = var_228_3

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_4 = 16
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
	Play115311057 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 115311057
		arg_229_1.duration_ = 9.9

		local var_229_0 = {
			ja = 9.9,
			ko = 7.1,
			zh = 6.066,
			en = 8.533
		}
		local var_229_1 = manager.audio:GetLocalizationFlag()

		if var_229_0[var_229_1] ~= nil then
			arg_229_1.duration_ = var_229_0[var_229_1]
		end

		SetActive(arg_229_1.tipsGo_, false)

		function arg_229_1.onSingleLineFinish_()
			arg_229_1.onSingleLineUpdate_ = nil
			arg_229_1.onSingleLineFinish_ = nil
			arg_229_1.state_ = "waiting"
		end

		function arg_229_1.playNext_(arg_231_0)
			if arg_231_0 == 1 then
				arg_229_0:Play115311058(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = arg_229_1.actors_["10029"]
			local var_232_1 = 0

			if var_232_1 < arg_229_1.time_ and arg_229_1.time_ <= var_232_1 + arg_232_0 then
				local var_232_2 = var_232_0:GetComponent("Image")

				if var_232_2 then
					arg_229_1.var_.highlightMatValue10029 = var_232_2
				end
			end

			local var_232_3 = 0.2

			if var_232_1 <= arg_229_1.time_ and arg_229_1.time_ < var_232_1 + var_232_3 then
				local var_232_4 = (arg_229_1.time_ - var_232_1) / var_232_3

				if arg_229_1.var_.highlightMatValue10029 then
					local var_232_5 = Mathf.Lerp(0.5, 1, var_232_4)
					local var_232_6 = arg_229_1.var_.highlightMatValue10029
					local var_232_7 = var_232_6.color

					var_232_7.r = var_232_5
					var_232_7.g = var_232_5
					var_232_7.b = var_232_5
					var_232_6.color = var_232_7
				end
			end

			if arg_229_1.time_ >= var_232_1 + var_232_3 and arg_229_1.time_ < var_232_1 + var_232_3 + arg_232_0 and arg_229_1.var_.highlightMatValue10029 then
				local var_232_8 = 1

				var_232_0.transform:SetSiblingIndex(1)

				local var_232_9 = arg_229_1.var_.highlightMatValue10029
				local var_232_10 = var_232_9.color

				var_232_10.r = var_232_8
				var_232_10.g = var_232_8
				var_232_10.b = var_232_8
				var_232_9.color = var_232_10
			end

			local var_232_11 = 0
			local var_232_12 = 0.725

			if var_232_11 < arg_229_1.time_ and arg_229_1.time_ <= var_232_11 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_13 = arg_229_1:FormatText(StoryNameCfg[312].name)

				arg_229_1.leftNameTxt_.text = var_232_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_14 = arg_229_1:GetWordFromCfg(115311057)
				local var_232_15 = arg_229_1:FormatText(var_232_14.content)

				arg_229_1.text_.text = var_232_15

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_16 = 29
				local var_232_17 = utf8.len(var_232_15)
				local var_232_18 = var_232_16 <= 0 and var_232_12 or var_232_12 * (var_232_17 / var_232_16)

				if var_232_18 > 0 and var_232_12 < var_232_18 then
					arg_229_1.talkMaxDuration = var_232_18

					if var_232_18 + var_232_11 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_18 + var_232_11
					end
				end

				arg_229_1.text_.text = var_232_15
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311057", "story_v_out_115311.awb") ~= 0 then
					local var_232_19 = manager.audio:GetVoiceLength("story_v_out_115311", "115311057", "story_v_out_115311.awb") / 1000

					if var_232_19 + var_232_11 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_19 + var_232_11
					end

					if var_232_14.prefab_name ~= "" and arg_229_1.actors_[var_232_14.prefab_name] ~= nil then
						local var_232_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_14.prefab_name].transform, "story_v_out_115311", "115311057", "story_v_out_115311.awb")

						arg_229_1:RecordAudio("115311057", var_232_20)
						arg_229_1:RecordAudio("115311057", var_232_20)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_out_115311", "115311057", "story_v_out_115311.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_out_115311", "115311057", "story_v_out_115311.awb")
				end

				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_21 = math.max(var_232_12, arg_229_1.talkMaxDuration)

			if var_232_11 <= arg_229_1.time_ and arg_229_1.time_ < var_232_11 + var_232_21 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_11) / var_232_21

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_11 + var_232_21 and arg_229_1.time_ < var_232_11 + var_232_21 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play115311058 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 115311058
		arg_233_1.duration_ = 10.7

		local var_233_0 = {
			ja = 8.8,
			ko = 7.1,
			zh = 7.433,
			en = 10.7
		}
		local var_233_1 = manager.audio:GetLocalizationFlag()

		if var_233_0[var_233_1] ~= nil then
			arg_233_1.duration_ = var_233_0[var_233_1]
		end

		SetActive(arg_233_1.tipsGo_, false)

		function arg_233_1.onSingleLineFinish_()
			arg_233_1.onSingleLineUpdate_ = nil
			arg_233_1.onSingleLineFinish_ = nil
			arg_233_1.state_ = "waiting"
		end

		function arg_233_1.playNext_(arg_235_0)
			if arg_235_0 == 1 then
				arg_233_0:Play115311059(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = arg_233_1.actors_["10029"]
			local var_236_1 = 0

			if var_236_1 < arg_233_1.time_ and arg_233_1.time_ <= var_236_1 + arg_236_0 then
				local var_236_2 = var_236_0:GetComponent("Image")

				if var_236_2 then
					arg_233_1.var_.highlightMatValue10029 = var_236_2
				end
			end

			local var_236_3 = 0.2

			if var_236_1 <= arg_233_1.time_ and arg_233_1.time_ < var_236_1 + var_236_3 then
				local var_236_4 = (arg_233_1.time_ - var_236_1) / var_236_3

				if arg_233_1.var_.highlightMatValue10029 then
					local var_236_5 = Mathf.Lerp(1, 0.5, var_236_4)
					local var_236_6 = arg_233_1.var_.highlightMatValue10029
					local var_236_7 = var_236_6.color

					var_236_7.r = var_236_5
					var_236_7.g = var_236_5
					var_236_7.b = var_236_5
					var_236_6.color = var_236_7
				end
			end

			if arg_233_1.time_ >= var_236_1 + var_236_3 and arg_233_1.time_ < var_236_1 + var_236_3 + arg_236_0 and arg_233_1.var_.highlightMatValue10029 then
				local var_236_8 = 0.5
				local var_236_9 = arg_233_1.var_.highlightMatValue10029
				local var_236_10 = var_236_9.color

				var_236_10.r = var_236_8
				var_236_10.g = var_236_8
				var_236_10.b = var_236_8
				var_236_9.color = var_236_10
			end

			local var_236_11 = arg_233_1.actors_["113801_1"]
			local var_236_12 = 0

			if var_236_12 < arg_233_1.time_ and arg_233_1.time_ <= var_236_12 + arg_236_0 then
				local var_236_13 = var_236_11:GetComponent("Image")

				if var_236_13 then
					arg_233_1.var_.highlightMatValue113801_1 = var_236_13
				end
			end

			local var_236_14 = 0.2

			if var_236_12 <= arg_233_1.time_ and arg_233_1.time_ < var_236_12 + var_236_14 then
				local var_236_15 = (arg_233_1.time_ - var_236_12) / var_236_14

				if arg_233_1.var_.highlightMatValue113801_1 then
					local var_236_16 = Mathf.Lerp(0.5, 1, var_236_15)
					local var_236_17 = arg_233_1.var_.highlightMatValue113801_1
					local var_236_18 = var_236_17.color

					var_236_18.r = var_236_16
					var_236_18.g = var_236_16
					var_236_18.b = var_236_16
					var_236_17.color = var_236_18
				end
			end

			if arg_233_1.time_ >= var_236_12 + var_236_14 and arg_233_1.time_ < var_236_12 + var_236_14 + arg_236_0 and arg_233_1.var_.highlightMatValue113801_1 then
				local var_236_19 = 1

				var_236_11.transform:SetSiblingIndex(1)

				local var_236_20 = arg_233_1.var_.highlightMatValue113801_1
				local var_236_21 = var_236_20.color

				var_236_21.r = var_236_19
				var_236_21.g = var_236_19
				var_236_21.b = var_236_19
				var_236_20.color = var_236_21
			end

			local var_236_22 = 0
			local var_236_23 = 0.6

			if var_236_22 < arg_233_1.time_ and arg_233_1.time_ <= var_236_22 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_24 = arg_233_1:FormatText(StoryNameCfg[94].name)

				arg_233_1.leftNameTxt_.text = var_236_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_25 = arg_233_1:GetWordFromCfg(115311058)
				local var_236_26 = arg_233_1:FormatText(var_236_25.content)

				arg_233_1.text_.text = var_236_26

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_27 = 24
				local var_236_28 = utf8.len(var_236_26)
				local var_236_29 = var_236_27 <= 0 and var_236_23 or var_236_23 * (var_236_28 / var_236_27)

				if var_236_29 > 0 and var_236_23 < var_236_29 then
					arg_233_1.talkMaxDuration = var_236_29

					if var_236_29 + var_236_22 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_29 + var_236_22
					end
				end

				arg_233_1.text_.text = var_236_26
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311058", "story_v_out_115311.awb") ~= 0 then
					local var_236_30 = manager.audio:GetVoiceLength("story_v_out_115311", "115311058", "story_v_out_115311.awb") / 1000

					if var_236_30 + var_236_22 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_30 + var_236_22
					end

					if var_236_25.prefab_name ~= "" and arg_233_1.actors_[var_236_25.prefab_name] ~= nil then
						local var_236_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_233_1.actors_[var_236_25.prefab_name].transform, "story_v_out_115311", "115311058", "story_v_out_115311.awb")

						arg_233_1:RecordAudio("115311058", var_236_31)
						arg_233_1:RecordAudio("115311058", var_236_31)
					else
						arg_233_1:AudioAction("play", "voice", "story_v_out_115311", "115311058", "story_v_out_115311.awb")
					end

					arg_233_1:RecordHistoryTalkVoice("story_v_out_115311", "115311058", "story_v_out_115311.awb")
				end

				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_32 = math.max(var_236_23, arg_233_1.talkMaxDuration)

			if var_236_22 <= arg_233_1.time_ and arg_233_1.time_ < var_236_22 + var_236_32 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_22) / var_236_32

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_22 + var_236_32 and arg_233_1.time_ < var_236_22 + var_236_32 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play115311059 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 115311059
		arg_237_1.duration_ = 19.5

		local var_237_0 = {
			ja = 19.5,
			ko = 6.433,
			zh = 7.366,
			en = 6.033
		}
		local var_237_1 = manager.audio:GetLocalizationFlag()

		if var_237_0[var_237_1] ~= nil then
			arg_237_1.duration_ = var_237_0[var_237_1]
		end

		SetActive(arg_237_1.tipsGo_, false)

		function arg_237_1.onSingleLineFinish_()
			arg_237_1.onSingleLineUpdate_ = nil
			arg_237_1.onSingleLineFinish_ = nil
			arg_237_1.state_ = "waiting"
		end

		function arg_237_1.playNext_(arg_239_0)
			if arg_239_0 == 1 then
				arg_237_0:Play115311060(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = 0
			local var_240_1 = 0.725

			if var_240_0 < arg_237_1.time_ and arg_237_1.time_ <= var_240_0 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_2 = arg_237_1:FormatText(StoryNameCfg[94].name)

				arg_237_1.leftNameTxt_.text = var_240_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_3 = arg_237_1:GetWordFromCfg(115311059)
				local var_240_4 = arg_237_1:FormatText(var_240_3.content)

				arg_237_1.text_.text = var_240_4

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_5 = 29
				local var_240_6 = utf8.len(var_240_4)
				local var_240_7 = var_240_5 <= 0 and var_240_1 or var_240_1 * (var_240_6 / var_240_5)

				if var_240_7 > 0 and var_240_1 < var_240_7 then
					arg_237_1.talkMaxDuration = var_240_7

					if var_240_7 + var_240_0 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_7 + var_240_0
					end
				end

				arg_237_1.text_.text = var_240_4
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311059", "story_v_out_115311.awb") ~= 0 then
					local var_240_8 = manager.audio:GetVoiceLength("story_v_out_115311", "115311059", "story_v_out_115311.awb") / 1000

					if var_240_8 + var_240_0 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_8 + var_240_0
					end

					if var_240_3.prefab_name ~= "" and arg_237_1.actors_[var_240_3.prefab_name] ~= nil then
						local var_240_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_237_1.actors_[var_240_3.prefab_name].transform, "story_v_out_115311", "115311059", "story_v_out_115311.awb")

						arg_237_1:RecordAudio("115311059", var_240_9)
						arg_237_1:RecordAudio("115311059", var_240_9)
					else
						arg_237_1:AudioAction("play", "voice", "story_v_out_115311", "115311059", "story_v_out_115311.awb")
					end

					arg_237_1:RecordHistoryTalkVoice("story_v_out_115311", "115311059", "story_v_out_115311.awb")
				end

				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_10 = math.max(var_240_1, arg_237_1.talkMaxDuration)

			if var_240_0 <= arg_237_1.time_ and arg_237_1.time_ < var_240_0 + var_240_10 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_0) / var_240_10

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_0 + var_240_10 and arg_237_1.time_ < var_240_0 + var_240_10 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play115311060 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 115311060
		arg_241_1.duration_ = 1.566

		local var_241_0 = {
			ja = 1.133,
			ko = 1.2,
			zh = 1.533,
			en = 1.566
		}
		local var_241_1 = manager.audio:GetLocalizationFlag()

		if var_241_0[var_241_1] ~= nil then
			arg_241_1.duration_ = var_241_0[var_241_1]
		end

		SetActive(arg_241_1.tipsGo_, false)

		function arg_241_1.onSingleLineFinish_()
			arg_241_1.onSingleLineUpdate_ = nil
			arg_241_1.onSingleLineFinish_ = nil
			arg_241_1.state_ = "waiting"
		end

		function arg_241_1.playNext_(arg_243_0)
			if arg_243_0 == 1 then
				arg_241_0:Play115311061(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = arg_241_1.actors_["10029"]
			local var_244_1 = 0

			if var_244_1 < arg_241_1.time_ and arg_241_1.time_ <= var_244_1 + arg_244_0 then
				local var_244_2 = var_244_0:GetComponent("Image")

				if var_244_2 then
					arg_241_1.var_.highlightMatValue10029 = var_244_2
				end
			end

			local var_244_3 = 0.2

			if var_244_1 <= arg_241_1.time_ and arg_241_1.time_ < var_244_1 + var_244_3 then
				local var_244_4 = (arg_241_1.time_ - var_244_1) / var_244_3

				if arg_241_1.var_.highlightMatValue10029 then
					local var_244_5 = Mathf.Lerp(0.5, 1, var_244_4)
					local var_244_6 = arg_241_1.var_.highlightMatValue10029
					local var_244_7 = var_244_6.color

					var_244_7.r = var_244_5
					var_244_7.g = var_244_5
					var_244_7.b = var_244_5
					var_244_6.color = var_244_7
				end
			end

			if arg_241_1.time_ >= var_244_1 + var_244_3 and arg_241_1.time_ < var_244_1 + var_244_3 + arg_244_0 and arg_241_1.var_.highlightMatValue10029 then
				local var_244_8 = 1

				var_244_0.transform:SetSiblingIndex(1)

				local var_244_9 = arg_241_1.var_.highlightMatValue10029
				local var_244_10 = var_244_9.color

				var_244_10.r = var_244_8
				var_244_10.g = var_244_8
				var_244_10.b = var_244_8
				var_244_9.color = var_244_10
			end

			local var_244_11 = arg_241_1.actors_["113801_1"]
			local var_244_12 = 0

			if var_244_12 < arg_241_1.time_ and arg_241_1.time_ <= var_244_12 + arg_244_0 then
				local var_244_13 = var_244_11:GetComponent("Image")

				if var_244_13 then
					arg_241_1.var_.highlightMatValue113801_1 = var_244_13
				end
			end

			local var_244_14 = 0.2

			if var_244_12 <= arg_241_1.time_ and arg_241_1.time_ < var_244_12 + var_244_14 then
				local var_244_15 = (arg_241_1.time_ - var_244_12) / var_244_14

				if arg_241_1.var_.highlightMatValue113801_1 then
					local var_244_16 = Mathf.Lerp(1, 0.5, var_244_15)
					local var_244_17 = arg_241_1.var_.highlightMatValue113801_1
					local var_244_18 = var_244_17.color

					var_244_18.r = var_244_16
					var_244_18.g = var_244_16
					var_244_18.b = var_244_16
					var_244_17.color = var_244_18
				end
			end

			if arg_241_1.time_ >= var_244_12 + var_244_14 and arg_241_1.time_ < var_244_12 + var_244_14 + arg_244_0 and arg_241_1.var_.highlightMatValue113801_1 then
				local var_244_19 = 0.5
				local var_244_20 = arg_241_1.var_.highlightMatValue113801_1
				local var_244_21 = var_244_20.color

				var_244_21.r = var_244_19
				var_244_21.g = var_244_19
				var_244_21.b = var_244_19
				var_244_20.color = var_244_21
			end

			local var_244_22 = 0
			local var_244_23 = 0.075

			if var_244_22 < arg_241_1.time_ and arg_241_1.time_ <= var_244_22 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_24 = arg_241_1:FormatText(StoryNameCfg[312].name)

				arg_241_1.leftNameTxt_.text = var_244_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_25 = arg_241_1:GetWordFromCfg(115311060)
				local var_244_26 = arg_241_1:FormatText(var_244_25.content)

				arg_241_1.text_.text = var_244_26

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_27 = 3
				local var_244_28 = utf8.len(var_244_26)
				local var_244_29 = var_244_27 <= 0 and var_244_23 or var_244_23 * (var_244_28 / var_244_27)

				if var_244_29 > 0 and var_244_23 < var_244_29 then
					arg_241_1.talkMaxDuration = var_244_29

					if var_244_29 + var_244_22 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_29 + var_244_22
					end
				end

				arg_241_1.text_.text = var_244_26
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311060", "story_v_out_115311.awb") ~= 0 then
					local var_244_30 = manager.audio:GetVoiceLength("story_v_out_115311", "115311060", "story_v_out_115311.awb") / 1000

					if var_244_30 + var_244_22 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_30 + var_244_22
					end

					if var_244_25.prefab_name ~= "" and arg_241_1.actors_[var_244_25.prefab_name] ~= nil then
						local var_244_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_241_1.actors_[var_244_25.prefab_name].transform, "story_v_out_115311", "115311060", "story_v_out_115311.awb")

						arg_241_1:RecordAudio("115311060", var_244_31)
						arg_241_1:RecordAudio("115311060", var_244_31)
					else
						arg_241_1:AudioAction("play", "voice", "story_v_out_115311", "115311060", "story_v_out_115311.awb")
					end

					arg_241_1:RecordHistoryTalkVoice("story_v_out_115311", "115311060", "story_v_out_115311.awb")
				end

				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_32 = math.max(var_244_23, arg_241_1.talkMaxDuration)

			if var_244_22 <= arg_241_1.time_ and arg_241_1.time_ < var_244_22 + var_244_32 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_22) / var_244_32

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_22 + var_244_32 and arg_241_1.time_ < var_244_22 + var_244_32 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play115311061 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 115311061
		arg_245_1.duration_ = 8.2

		local var_245_0 = {
			ja = 8.2,
			ko = 7.4,
			zh = 7.7,
			en = 8
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
				arg_245_0:Play115311062(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = arg_245_1.actors_["10029"]
			local var_248_1 = 0

			if var_248_1 < arg_245_1.time_ and arg_245_1.time_ <= var_248_1 + arg_248_0 then
				local var_248_2 = var_248_0:GetComponent("Image")

				if var_248_2 then
					arg_245_1.var_.highlightMatValue10029 = var_248_2
				end
			end

			local var_248_3 = 0.2

			if var_248_1 <= arg_245_1.time_ and arg_245_1.time_ < var_248_1 + var_248_3 then
				local var_248_4 = (arg_245_1.time_ - var_248_1) / var_248_3

				if arg_245_1.var_.highlightMatValue10029 then
					local var_248_5 = Mathf.Lerp(1, 0.5, var_248_4)
					local var_248_6 = arg_245_1.var_.highlightMatValue10029
					local var_248_7 = var_248_6.color

					var_248_7.r = var_248_5
					var_248_7.g = var_248_5
					var_248_7.b = var_248_5
					var_248_6.color = var_248_7
				end
			end

			if arg_245_1.time_ >= var_248_1 + var_248_3 and arg_245_1.time_ < var_248_1 + var_248_3 + arg_248_0 and arg_245_1.var_.highlightMatValue10029 then
				local var_248_8 = 0.5
				local var_248_9 = arg_245_1.var_.highlightMatValue10029
				local var_248_10 = var_248_9.color

				var_248_10.r = var_248_8
				var_248_10.g = var_248_8
				var_248_10.b = var_248_8
				var_248_9.color = var_248_10
			end

			local var_248_11 = arg_245_1.actors_["113801_1"]
			local var_248_12 = 0

			if var_248_12 < arg_245_1.time_ and arg_245_1.time_ <= var_248_12 + arg_248_0 then
				local var_248_13 = var_248_11:GetComponent("Image")

				if var_248_13 then
					arg_245_1.var_.highlightMatValue113801_1 = var_248_13
				end
			end

			local var_248_14 = 0.2

			if var_248_12 <= arg_245_1.time_ and arg_245_1.time_ < var_248_12 + var_248_14 then
				local var_248_15 = (arg_245_1.time_ - var_248_12) / var_248_14

				if arg_245_1.var_.highlightMatValue113801_1 then
					local var_248_16 = Mathf.Lerp(0.5, 1, var_248_15)
					local var_248_17 = arg_245_1.var_.highlightMatValue113801_1
					local var_248_18 = var_248_17.color

					var_248_18.r = var_248_16
					var_248_18.g = var_248_16
					var_248_18.b = var_248_16
					var_248_17.color = var_248_18
				end
			end

			if arg_245_1.time_ >= var_248_12 + var_248_14 and arg_245_1.time_ < var_248_12 + var_248_14 + arg_248_0 and arg_245_1.var_.highlightMatValue113801_1 then
				local var_248_19 = 1

				var_248_11.transform:SetSiblingIndex(1)

				local var_248_20 = arg_245_1.var_.highlightMatValue113801_1
				local var_248_21 = var_248_20.color

				var_248_21.r = var_248_19
				var_248_21.g = var_248_19
				var_248_21.b = var_248_19
				var_248_20.color = var_248_21
			end

			local var_248_22 = 0
			local var_248_23 = 0.7

			if var_248_22 < arg_245_1.time_ and arg_245_1.time_ <= var_248_22 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_24 = arg_245_1:FormatText(StoryNameCfg[94].name)

				arg_245_1.leftNameTxt_.text = var_248_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_25 = arg_245_1:GetWordFromCfg(115311061)
				local var_248_26 = arg_245_1:FormatText(var_248_25.content)

				arg_245_1.text_.text = var_248_26

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_27 = 28
				local var_248_28 = utf8.len(var_248_26)
				local var_248_29 = var_248_27 <= 0 and var_248_23 or var_248_23 * (var_248_28 / var_248_27)

				if var_248_29 > 0 and var_248_23 < var_248_29 then
					arg_245_1.talkMaxDuration = var_248_29

					if var_248_29 + var_248_22 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_29 + var_248_22
					end
				end

				arg_245_1.text_.text = var_248_26
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311061", "story_v_out_115311.awb") ~= 0 then
					local var_248_30 = manager.audio:GetVoiceLength("story_v_out_115311", "115311061", "story_v_out_115311.awb") / 1000

					if var_248_30 + var_248_22 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_30 + var_248_22
					end

					if var_248_25.prefab_name ~= "" and arg_245_1.actors_[var_248_25.prefab_name] ~= nil then
						local var_248_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_245_1.actors_[var_248_25.prefab_name].transform, "story_v_out_115311", "115311061", "story_v_out_115311.awb")

						arg_245_1:RecordAudio("115311061", var_248_31)
						arg_245_1:RecordAudio("115311061", var_248_31)
					else
						arg_245_1:AudioAction("play", "voice", "story_v_out_115311", "115311061", "story_v_out_115311.awb")
					end

					arg_245_1:RecordHistoryTalkVoice("story_v_out_115311", "115311061", "story_v_out_115311.awb")
				end

				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_32 = math.max(var_248_23, arg_245_1.talkMaxDuration)

			if var_248_22 <= arg_245_1.time_ and arg_245_1.time_ < var_248_22 + var_248_32 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_22) / var_248_32

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_22 + var_248_32 and arg_245_1.time_ < var_248_22 + var_248_32 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play115311062 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 115311062
		arg_249_1.duration_ = 12.4

		local var_249_0 = {
			ja = 11.6,
			ko = 10.6,
			zh = 10.066,
			en = 12.4
		}
		local var_249_1 = manager.audio:GetLocalizationFlag()

		if var_249_0[var_249_1] ~= nil then
			arg_249_1.duration_ = var_249_0[var_249_1]
		end

		SetActive(arg_249_1.tipsGo_, false)

		function arg_249_1.onSingleLineFinish_()
			arg_249_1.onSingleLineUpdate_ = nil
			arg_249_1.onSingleLineFinish_ = nil
			arg_249_1.state_ = "waiting"
		end

		function arg_249_1.playNext_(arg_251_0)
			if arg_251_0 == 1 then
				arg_249_0:Play115311063(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = arg_249_1.actors_["10029"]
			local var_252_1 = 0

			if var_252_1 < arg_249_1.time_ and arg_249_1.time_ <= var_252_1 + arg_252_0 then
				local var_252_2 = var_252_0:GetComponent("Image")

				if var_252_2 then
					arg_249_1.var_.highlightMatValue10029 = var_252_2
				end
			end

			local var_252_3 = 0.2

			if var_252_1 <= arg_249_1.time_ and arg_249_1.time_ < var_252_1 + var_252_3 then
				local var_252_4 = (arg_249_1.time_ - var_252_1) / var_252_3

				if arg_249_1.var_.highlightMatValue10029 then
					local var_252_5 = Mathf.Lerp(0.5, 1, var_252_4)
					local var_252_6 = arg_249_1.var_.highlightMatValue10029
					local var_252_7 = var_252_6.color

					var_252_7.r = var_252_5
					var_252_7.g = var_252_5
					var_252_7.b = var_252_5
					var_252_6.color = var_252_7
				end
			end

			if arg_249_1.time_ >= var_252_1 + var_252_3 and arg_249_1.time_ < var_252_1 + var_252_3 + arg_252_0 and arg_249_1.var_.highlightMatValue10029 then
				local var_252_8 = 1

				var_252_0.transform:SetSiblingIndex(1)

				local var_252_9 = arg_249_1.var_.highlightMatValue10029
				local var_252_10 = var_252_9.color

				var_252_10.r = var_252_8
				var_252_10.g = var_252_8
				var_252_10.b = var_252_8
				var_252_9.color = var_252_10
			end

			local var_252_11 = arg_249_1.actors_["113801_1"]
			local var_252_12 = 0

			if var_252_12 < arg_249_1.time_ and arg_249_1.time_ <= var_252_12 + arg_252_0 then
				local var_252_13 = var_252_11:GetComponent("Image")

				if var_252_13 then
					arg_249_1.var_.highlightMatValue113801_1 = var_252_13
				end
			end

			local var_252_14 = 0.2

			if var_252_12 <= arg_249_1.time_ and arg_249_1.time_ < var_252_12 + var_252_14 then
				local var_252_15 = (arg_249_1.time_ - var_252_12) / var_252_14

				if arg_249_1.var_.highlightMatValue113801_1 then
					local var_252_16 = Mathf.Lerp(1, 0.5, var_252_15)
					local var_252_17 = arg_249_1.var_.highlightMatValue113801_1
					local var_252_18 = var_252_17.color

					var_252_18.r = var_252_16
					var_252_18.g = var_252_16
					var_252_18.b = var_252_16
					var_252_17.color = var_252_18
				end
			end

			if arg_249_1.time_ >= var_252_12 + var_252_14 and arg_249_1.time_ < var_252_12 + var_252_14 + arg_252_0 and arg_249_1.var_.highlightMatValue113801_1 then
				local var_252_19 = 0.5
				local var_252_20 = arg_249_1.var_.highlightMatValue113801_1
				local var_252_21 = var_252_20.color

				var_252_21.r = var_252_19
				var_252_21.g = var_252_19
				var_252_21.b = var_252_19
				var_252_20.color = var_252_21
			end

			local var_252_22 = 0
			local var_252_23 = 1

			if var_252_22 < arg_249_1.time_ and arg_249_1.time_ <= var_252_22 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_24 = arg_249_1:FormatText(StoryNameCfg[312].name)

				arg_249_1.leftNameTxt_.text = var_252_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_25 = arg_249_1:GetWordFromCfg(115311062)
				local var_252_26 = arg_249_1:FormatText(var_252_25.content)

				arg_249_1.text_.text = var_252_26

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_27 = 40
				local var_252_28 = utf8.len(var_252_26)
				local var_252_29 = var_252_27 <= 0 and var_252_23 or var_252_23 * (var_252_28 / var_252_27)

				if var_252_29 > 0 and var_252_23 < var_252_29 then
					arg_249_1.talkMaxDuration = var_252_29

					if var_252_29 + var_252_22 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_29 + var_252_22
					end
				end

				arg_249_1.text_.text = var_252_26
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311062", "story_v_out_115311.awb") ~= 0 then
					local var_252_30 = manager.audio:GetVoiceLength("story_v_out_115311", "115311062", "story_v_out_115311.awb") / 1000

					if var_252_30 + var_252_22 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_30 + var_252_22
					end

					if var_252_25.prefab_name ~= "" and arg_249_1.actors_[var_252_25.prefab_name] ~= nil then
						local var_252_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_249_1.actors_[var_252_25.prefab_name].transform, "story_v_out_115311", "115311062", "story_v_out_115311.awb")

						arg_249_1:RecordAudio("115311062", var_252_31)
						arg_249_1:RecordAudio("115311062", var_252_31)
					else
						arg_249_1:AudioAction("play", "voice", "story_v_out_115311", "115311062", "story_v_out_115311.awb")
					end

					arg_249_1:RecordHistoryTalkVoice("story_v_out_115311", "115311062", "story_v_out_115311.awb")
				end

				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_32 = math.max(var_252_23, arg_249_1.talkMaxDuration)

			if var_252_22 <= arg_249_1.time_ and arg_249_1.time_ < var_252_22 + var_252_32 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_22) / var_252_32

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_22 + var_252_32 and arg_249_1.time_ < var_252_22 + var_252_32 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play115311063 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 115311063
		arg_253_1.duration_ = 5

		SetActive(arg_253_1.tipsGo_, false)

		function arg_253_1.onSingleLineFinish_()
			arg_253_1.onSingleLineUpdate_ = nil
			arg_253_1.onSingleLineFinish_ = nil
			arg_253_1.state_ = "waiting"
		end

		function arg_253_1.playNext_(arg_255_0)
			if arg_255_0 == 1 then
				arg_253_0:Play115311064(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = arg_253_1.actors_["10029"]
			local var_256_1 = 0

			if var_256_1 < arg_253_1.time_ and arg_253_1.time_ <= var_256_1 + arg_256_0 then
				local var_256_2 = var_256_0:GetComponent("Image")

				if var_256_2 then
					arg_253_1.var_.highlightMatValue10029 = var_256_2
				end
			end

			local var_256_3 = 0.2

			if var_256_1 <= arg_253_1.time_ and arg_253_1.time_ < var_256_1 + var_256_3 then
				local var_256_4 = (arg_253_1.time_ - var_256_1) / var_256_3

				if arg_253_1.var_.highlightMatValue10029 then
					local var_256_5 = Mathf.Lerp(1, 0.5, var_256_4)
					local var_256_6 = arg_253_1.var_.highlightMatValue10029
					local var_256_7 = var_256_6.color

					var_256_7.r = var_256_5
					var_256_7.g = var_256_5
					var_256_7.b = var_256_5
					var_256_6.color = var_256_7
				end
			end

			if arg_253_1.time_ >= var_256_1 + var_256_3 and arg_253_1.time_ < var_256_1 + var_256_3 + arg_256_0 and arg_253_1.var_.highlightMatValue10029 then
				local var_256_8 = 0.5
				local var_256_9 = arg_253_1.var_.highlightMatValue10029
				local var_256_10 = var_256_9.color

				var_256_10.r = var_256_8
				var_256_10.g = var_256_8
				var_256_10.b = var_256_8
				var_256_9.color = var_256_10
			end

			local var_256_11 = 0
			local var_256_12 = 1.05

			if var_256_11 < arg_253_1.time_ and arg_253_1.time_ <= var_256_11 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, false)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_13 = arg_253_1:GetWordFromCfg(115311063)
				local var_256_14 = arg_253_1:FormatText(var_256_13.content)

				arg_253_1.text_.text = var_256_14

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_15 = 42
				local var_256_16 = utf8.len(var_256_14)
				local var_256_17 = var_256_15 <= 0 and var_256_12 or var_256_12 * (var_256_16 / var_256_15)

				if var_256_17 > 0 and var_256_12 < var_256_17 then
					arg_253_1.talkMaxDuration = var_256_17

					if var_256_17 + var_256_11 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_17 + var_256_11
					end
				end

				arg_253_1.text_.text = var_256_14
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)
				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_18 = math.max(var_256_12, arg_253_1.talkMaxDuration)

			if var_256_11 <= arg_253_1.time_ and arg_253_1.time_ < var_256_11 + var_256_18 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_11) / var_256_18

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_11 + var_256_18 and arg_253_1.time_ < var_256_11 + var_256_18 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play115311064 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 115311064
		arg_257_1.duration_ = 6.366

		local var_257_0 = {
			ja = 6.166,
			ko = 6.366,
			zh = 5.266,
			en = 5.866
		}
		local var_257_1 = manager.audio:GetLocalizationFlag()

		if var_257_0[var_257_1] ~= nil then
			arg_257_1.duration_ = var_257_0[var_257_1]
		end

		SetActive(arg_257_1.tipsGo_, false)

		function arg_257_1.onSingleLineFinish_()
			arg_257_1.onSingleLineUpdate_ = nil
			arg_257_1.onSingleLineFinish_ = nil
			arg_257_1.state_ = "waiting"
		end

		function arg_257_1.playNext_(arg_259_0)
			if arg_259_0 == 1 then
				arg_257_0:Play115311065(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = arg_257_1.actors_["10029"]
			local var_260_1 = 0

			if var_260_1 < arg_257_1.time_ and arg_257_1.time_ <= var_260_1 + arg_260_0 then
				local var_260_2 = var_260_0:GetComponent("Image")

				if var_260_2 then
					arg_257_1.var_.highlightMatValue10029 = var_260_2
				end
			end

			local var_260_3 = 0.2

			if var_260_1 <= arg_257_1.time_ and arg_257_1.time_ < var_260_1 + var_260_3 then
				local var_260_4 = (arg_257_1.time_ - var_260_1) / var_260_3

				if arg_257_1.var_.highlightMatValue10029 then
					local var_260_5 = Mathf.Lerp(0.5, 1, var_260_4)
					local var_260_6 = arg_257_1.var_.highlightMatValue10029
					local var_260_7 = var_260_6.color

					var_260_7.r = var_260_5
					var_260_7.g = var_260_5
					var_260_7.b = var_260_5
					var_260_6.color = var_260_7
				end
			end

			if arg_257_1.time_ >= var_260_1 + var_260_3 and arg_257_1.time_ < var_260_1 + var_260_3 + arg_260_0 and arg_257_1.var_.highlightMatValue10029 then
				local var_260_8 = 1

				var_260_0.transform:SetSiblingIndex(1)

				local var_260_9 = arg_257_1.var_.highlightMatValue10029
				local var_260_10 = var_260_9.color

				var_260_10.r = var_260_8
				var_260_10.g = var_260_8
				var_260_10.b = var_260_8
				var_260_9.color = var_260_10
			end

			local var_260_11 = 0
			local var_260_12 = 0.75

			if var_260_11 < arg_257_1.time_ and arg_257_1.time_ <= var_260_11 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, true)

				local var_260_13 = arg_257_1:FormatText(StoryNameCfg[312].name)

				arg_257_1.leftNameTxt_.text = var_260_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_257_1.leftNameTxt_.transform)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1.leftNameTxt_.text)
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_14 = arg_257_1:GetWordFromCfg(115311064)
				local var_260_15 = arg_257_1:FormatText(var_260_14.content)

				arg_257_1.text_.text = var_260_15

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_16 = 30
				local var_260_17 = utf8.len(var_260_15)
				local var_260_18 = var_260_16 <= 0 and var_260_12 or var_260_12 * (var_260_17 / var_260_16)

				if var_260_18 > 0 and var_260_12 < var_260_18 then
					arg_257_1.talkMaxDuration = var_260_18

					if var_260_18 + var_260_11 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_18 + var_260_11
					end
				end

				arg_257_1.text_.text = var_260_15
				arg_257_1.typewritter.percent = 0

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311064", "story_v_out_115311.awb") ~= 0 then
					local var_260_19 = manager.audio:GetVoiceLength("story_v_out_115311", "115311064", "story_v_out_115311.awb") / 1000

					if var_260_19 + var_260_11 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_19 + var_260_11
					end

					if var_260_14.prefab_name ~= "" and arg_257_1.actors_[var_260_14.prefab_name] ~= nil then
						local var_260_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_257_1.actors_[var_260_14.prefab_name].transform, "story_v_out_115311", "115311064", "story_v_out_115311.awb")

						arg_257_1:RecordAudio("115311064", var_260_20)
						arg_257_1:RecordAudio("115311064", var_260_20)
					else
						arg_257_1:AudioAction("play", "voice", "story_v_out_115311", "115311064", "story_v_out_115311.awb")
					end

					arg_257_1:RecordHistoryTalkVoice("story_v_out_115311", "115311064", "story_v_out_115311.awb")
				end

				arg_257_1:RecordContent(arg_257_1.text_.text)
			end

			local var_260_21 = math.max(var_260_12, arg_257_1.talkMaxDuration)

			if var_260_11 <= arg_257_1.time_ and arg_257_1.time_ < var_260_11 + var_260_21 then
				arg_257_1.typewritter.percent = (arg_257_1.time_ - var_260_11) / var_260_21

				arg_257_1.typewritter:SetDirty()
			end

			if arg_257_1.time_ >= var_260_11 + var_260_21 and arg_257_1.time_ < var_260_11 + var_260_21 + arg_260_0 then
				arg_257_1.typewritter.percent = 1

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(true)
			end
		end
	end,
	Play115311065 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 115311065
		arg_261_1.duration_ = 2.366

		local var_261_0 = {
			ja = 1.9,
			ko = 0.999999999999,
			zh = 2.366,
			en = 1.6
		}
		local var_261_1 = manager.audio:GetLocalizationFlag()

		if var_261_0[var_261_1] ~= nil then
			arg_261_1.duration_ = var_261_0[var_261_1]
		end

		SetActive(arg_261_1.tipsGo_, false)

		function arg_261_1.onSingleLineFinish_()
			arg_261_1.onSingleLineUpdate_ = nil
			arg_261_1.onSingleLineFinish_ = nil
			arg_261_1.state_ = "waiting"
		end

		function arg_261_1.playNext_(arg_263_0)
			if arg_263_0 == 1 then
				arg_261_0:Play115311066(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = arg_261_1.actors_["10029"]
			local var_264_1 = 0

			if var_264_1 < arg_261_1.time_ and arg_261_1.time_ <= var_264_1 + arg_264_0 then
				local var_264_2 = var_264_0:GetComponent("Image")

				if var_264_2 then
					arg_261_1.var_.highlightMatValue10029 = var_264_2
				end
			end

			local var_264_3 = 0.2

			if var_264_1 <= arg_261_1.time_ and arg_261_1.time_ < var_264_1 + var_264_3 then
				local var_264_4 = (arg_261_1.time_ - var_264_1) / var_264_3

				if arg_261_1.var_.highlightMatValue10029 then
					local var_264_5 = Mathf.Lerp(1, 0.5, var_264_4)
					local var_264_6 = arg_261_1.var_.highlightMatValue10029
					local var_264_7 = var_264_6.color

					var_264_7.r = var_264_5
					var_264_7.g = var_264_5
					var_264_7.b = var_264_5
					var_264_6.color = var_264_7
				end
			end

			if arg_261_1.time_ >= var_264_1 + var_264_3 and arg_261_1.time_ < var_264_1 + var_264_3 + arg_264_0 and arg_261_1.var_.highlightMatValue10029 then
				local var_264_8 = 0.5
				local var_264_9 = arg_261_1.var_.highlightMatValue10029
				local var_264_10 = var_264_9.color

				var_264_10.r = var_264_8
				var_264_10.g = var_264_8
				var_264_10.b = var_264_8
				var_264_9.color = var_264_10
			end

			local var_264_11 = 0
			local var_264_12 = 0.125

			if var_264_11 < arg_261_1.time_ and arg_261_1.time_ <= var_264_11 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, true)

				local var_264_13 = arg_261_1:FormatText(StoryNameCfg[316].name)

				arg_261_1.leftNameTxt_.text = var_264_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_261_1.leftNameTxt_.transform)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1.leftNameTxt_.text)
				SetActive(arg_261_1.iconTrs_.gameObject, true)
				arg_261_1.iconController_:SetSelectedState("hero")

				arg_261_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenmb")

				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_14 = arg_261_1:GetWordFromCfg(115311065)
				local var_264_15 = arg_261_1:FormatText(var_264_14.content)

				arg_261_1.text_.text = var_264_15

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_16 = 5
				local var_264_17 = utf8.len(var_264_15)
				local var_264_18 = var_264_16 <= 0 and var_264_12 or var_264_12 * (var_264_17 / var_264_16)

				if var_264_18 > 0 and var_264_12 < var_264_18 then
					arg_261_1.talkMaxDuration = var_264_18

					if var_264_18 + var_264_11 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_18 + var_264_11
					end
				end

				arg_261_1.text_.text = var_264_15
				arg_261_1.typewritter.percent = 0

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311065", "story_v_out_115311.awb") ~= 0 then
					local var_264_19 = manager.audio:GetVoiceLength("story_v_out_115311", "115311065", "story_v_out_115311.awb") / 1000

					if var_264_19 + var_264_11 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_19 + var_264_11
					end

					if var_264_14.prefab_name ~= "" and arg_261_1.actors_[var_264_14.prefab_name] ~= nil then
						local var_264_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_261_1.actors_[var_264_14.prefab_name].transform, "story_v_out_115311", "115311065", "story_v_out_115311.awb")

						arg_261_1:RecordAudio("115311065", var_264_20)
						arg_261_1:RecordAudio("115311065", var_264_20)
					else
						arg_261_1:AudioAction("play", "voice", "story_v_out_115311", "115311065", "story_v_out_115311.awb")
					end

					arg_261_1:RecordHistoryTalkVoice("story_v_out_115311", "115311065", "story_v_out_115311.awb")
				end

				arg_261_1:RecordContent(arg_261_1.text_.text)
			end

			local var_264_21 = math.max(var_264_12, arg_261_1.talkMaxDuration)

			if var_264_11 <= arg_261_1.time_ and arg_261_1.time_ < var_264_11 + var_264_21 then
				arg_261_1.typewritter.percent = (arg_261_1.time_ - var_264_11) / var_264_21

				arg_261_1.typewritter:SetDirty()
			end

			if arg_261_1.time_ >= var_264_11 + var_264_21 and arg_261_1.time_ < var_264_11 + var_264_21 + arg_264_0 then
				arg_261_1.typewritter.percent = 1

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(true)
			end
		end
	end,
	Play115311066 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 115311066
		arg_265_1.duration_ = 5

		SetActive(arg_265_1.tipsGo_, false)

		function arg_265_1.onSingleLineFinish_()
			arg_265_1.onSingleLineUpdate_ = nil
			arg_265_1.onSingleLineFinish_ = nil
			arg_265_1.state_ = "waiting"
		end

		function arg_265_1.playNext_(arg_267_0)
			if arg_267_0 == 1 then
				arg_265_0:Play115311067(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = 0
			local var_268_1 = 1.125

			if var_268_0 < arg_265_1.time_ and arg_265_1.time_ <= var_268_0 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, false)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_2 = arg_265_1:GetWordFromCfg(115311066)
				local var_268_3 = arg_265_1:FormatText(var_268_2.content)

				arg_265_1.text_.text = var_268_3

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_4 = 45
				local var_268_5 = utf8.len(var_268_3)
				local var_268_6 = var_268_4 <= 0 and var_268_1 or var_268_1 * (var_268_5 / var_268_4)

				if var_268_6 > 0 and var_268_1 < var_268_6 then
					arg_265_1.talkMaxDuration = var_268_6

					if var_268_6 + var_268_0 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_6 + var_268_0
					end
				end

				arg_265_1.text_.text = var_268_3
				arg_265_1.typewritter.percent = 0

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(false)
				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_7 = math.max(var_268_1, arg_265_1.talkMaxDuration)

			if var_268_0 <= arg_265_1.time_ and arg_265_1.time_ < var_268_0 + var_268_7 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_0) / var_268_7

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_0 + var_268_7 and arg_265_1.time_ < var_268_0 + var_268_7 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play115311067 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 115311067
		arg_269_1.duration_ = 4.6

		local var_269_0 = {
			ja = 3.366,
			ko = 4.566,
			zh = 3.166,
			en = 4.6
		}
		local var_269_1 = manager.audio:GetLocalizationFlag()

		if var_269_0[var_269_1] ~= nil then
			arg_269_1.duration_ = var_269_0[var_269_1]
		end

		SetActive(arg_269_1.tipsGo_, false)

		function arg_269_1.onSingleLineFinish_()
			arg_269_1.onSingleLineUpdate_ = nil
			arg_269_1.onSingleLineFinish_ = nil
			arg_269_1.state_ = "waiting"
		end

		function arg_269_1.playNext_(arg_271_0)
			if arg_271_0 == 1 then
				arg_269_0:Play115311068(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = 0
			local var_272_1 = 0.4

			if var_272_0 < arg_269_1.time_ and arg_269_1.time_ <= var_272_0 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, true)

				local var_272_2 = arg_269_1:FormatText(StoryNameCfg[316].name)

				arg_269_1.leftNameTxt_.text = var_272_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_269_1.leftNameTxt_.transform)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1.leftNameTxt_.text)
				SetActive(arg_269_1.iconTrs_.gameObject, true)
				arg_269_1.iconController_:SetSelectedState("hero")

				arg_269_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenmb")

				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_3 = arg_269_1:GetWordFromCfg(115311067)
				local var_272_4 = arg_269_1:FormatText(var_272_3.content)

				arg_269_1.text_.text = var_272_4

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_5 = 16
				local var_272_6 = utf8.len(var_272_4)
				local var_272_7 = var_272_5 <= 0 and var_272_1 or var_272_1 * (var_272_6 / var_272_5)

				if var_272_7 > 0 and var_272_1 < var_272_7 then
					arg_269_1.talkMaxDuration = var_272_7

					if var_272_7 + var_272_0 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_7 + var_272_0
					end
				end

				arg_269_1.text_.text = var_272_4
				arg_269_1.typewritter.percent = 0

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311067", "story_v_out_115311.awb") ~= 0 then
					local var_272_8 = manager.audio:GetVoiceLength("story_v_out_115311", "115311067", "story_v_out_115311.awb") / 1000

					if var_272_8 + var_272_0 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_8 + var_272_0
					end

					if var_272_3.prefab_name ~= "" and arg_269_1.actors_[var_272_3.prefab_name] ~= nil then
						local var_272_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_269_1.actors_[var_272_3.prefab_name].transform, "story_v_out_115311", "115311067", "story_v_out_115311.awb")

						arg_269_1:RecordAudio("115311067", var_272_9)
						arg_269_1:RecordAudio("115311067", var_272_9)
					else
						arg_269_1:AudioAction("play", "voice", "story_v_out_115311", "115311067", "story_v_out_115311.awb")
					end

					arg_269_1:RecordHistoryTalkVoice("story_v_out_115311", "115311067", "story_v_out_115311.awb")
				end

				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_10 = math.max(var_272_1, arg_269_1.talkMaxDuration)

			if var_272_0 <= arg_269_1.time_ and arg_269_1.time_ < var_272_0 + var_272_10 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_0) / var_272_10

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_0 + var_272_10 and arg_269_1.time_ < var_272_0 + var_272_10 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play115311068 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 115311068
		arg_273_1.duration_ = 5

		SetActive(arg_273_1.tipsGo_, false)

		function arg_273_1.onSingleLineFinish_()
			arg_273_1.onSingleLineUpdate_ = nil
			arg_273_1.onSingleLineFinish_ = nil
			arg_273_1.state_ = "waiting"
		end

		function arg_273_1.playNext_(arg_275_0)
			if arg_275_0 == 1 then
				arg_273_0:Play115311069(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = 0
			local var_276_1 = 1.45

			if var_276_0 < arg_273_1.time_ and arg_273_1.time_ <= var_276_0 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, false)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_2 = arg_273_1:GetWordFromCfg(115311068)
				local var_276_3 = arg_273_1:FormatText(var_276_2.content)

				arg_273_1.text_.text = var_276_3

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_4 = 58
				local var_276_5 = utf8.len(var_276_3)
				local var_276_6 = var_276_4 <= 0 and var_276_1 or var_276_1 * (var_276_5 / var_276_4)

				if var_276_6 > 0 and var_276_1 < var_276_6 then
					arg_273_1.talkMaxDuration = var_276_6

					if var_276_6 + var_276_0 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_6 + var_276_0
					end
				end

				arg_273_1.text_.text = var_276_3
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)
				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_7 = math.max(var_276_1, arg_273_1.talkMaxDuration)

			if var_276_0 <= arg_273_1.time_ and arg_273_1.time_ < var_276_0 + var_276_7 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_0) / var_276_7

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_0 + var_276_7 and arg_273_1.time_ < var_276_0 + var_276_7 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play115311069 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 115311069
		arg_277_1.duration_ = 5

		SetActive(arg_277_1.tipsGo_, false)

		function arg_277_1.onSingleLineFinish_()
			arg_277_1.onSingleLineUpdate_ = nil
			arg_277_1.onSingleLineFinish_ = nil
			arg_277_1.state_ = "waiting"
		end

		function arg_277_1.playNext_(arg_279_0)
			if arg_279_0 == 1 then
				arg_277_0:Play115311070(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = 0
			local var_280_1 = 0.875

			if var_280_0 < arg_277_1.time_ and arg_277_1.time_ <= var_280_0 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, false)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_2 = arg_277_1:GetWordFromCfg(115311069)
				local var_280_3 = arg_277_1:FormatText(var_280_2.content)

				arg_277_1.text_.text = var_280_3

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_4 = 35
				local var_280_5 = utf8.len(var_280_3)
				local var_280_6 = var_280_4 <= 0 and var_280_1 or var_280_1 * (var_280_5 / var_280_4)

				if var_280_6 > 0 and var_280_1 < var_280_6 then
					arg_277_1.talkMaxDuration = var_280_6

					if var_280_6 + var_280_0 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_6 + var_280_0
					end
				end

				arg_277_1.text_.text = var_280_3
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)
				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_7 = math.max(var_280_1, arg_277_1.talkMaxDuration)

			if var_280_0 <= arg_277_1.time_ and arg_277_1.time_ < var_280_0 + var_280_7 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_0) / var_280_7

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_0 + var_280_7 and arg_277_1.time_ < var_280_0 + var_280_7 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play115311070 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 115311070
		arg_281_1.duration_ = 17.7

		local var_281_0 = {
			ja = 17.333,
			ko = 13,
			zh = 13.4,
			en = 17.7
		}
		local var_281_1 = manager.audio:GetLocalizationFlag()

		if var_281_0[var_281_1] ~= nil then
			arg_281_1.duration_ = var_281_0[var_281_1]
		end

		SetActive(arg_281_1.tipsGo_, false)

		function arg_281_1.onSingleLineFinish_()
			arg_281_1.onSingleLineUpdate_ = nil
			arg_281_1.onSingleLineFinish_ = nil
			arg_281_1.state_ = "waiting"
		end

		function arg_281_1.playNext_(arg_283_0)
			if arg_283_0 == 1 then
				arg_281_0:Play115311071(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = arg_281_1.actors_["113801_1"]
			local var_284_1 = 0

			if var_284_1 < arg_281_1.time_ and arg_281_1.time_ <= var_284_1 + arg_284_0 then
				local var_284_2 = var_284_0:GetComponent("Image")

				if var_284_2 then
					arg_281_1.var_.highlightMatValue113801_1 = var_284_2
				end
			end

			local var_284_3 = 0.2

			if var_284_1 <= arg_281_1.time_ and arg_281_1.time_ < var_284_1 + var_284_3 then
				local var_284_4 = (arg_281_1.time_ - var_284_1) / var_284_3

				if arg_281_1.var_.highlightMatValue113801_1 then
					local var_284_5 = Mathf.Lerp(0.5, 1, var_284_4)
					local var_284_6 = arg_281_1.var_.highlightMatValue113801_1
					local var_284_7 = var_284_6.color

					var_284_7.r = var_284_5
					var_284_7.g = var_284_5
					var_284_7.b = var_284_5
					var_284_6.color = var_284_7
				end
			end

			if arg_281_1.time_ >= var_284_1 + var_284_3 and arg_281_1.time_ < var_284_1 + var_284_3 + arg_284_0 and arg_281_1.var_.highlightMatValue113801_1 then
				local var_284_8 = 1

				var_284_0.transform:SetSiblingIndex(1)

				local var_284_9 = arg_281_1.var_.highlightMatValue113801_1
				local var_284_10 = var_284_9.color

				var_284_10.r = var_284_8
				var_284_10.g = var_284_8
				var_284_10.b = var_284_8
				var_284_9.color = var_284_10
			end

			local var_284_11 = 0
			local var_284_12 = 1.2

			if var_284_11 < arg_281_1.time_ and arg_281_1.time_ <= var_284_11 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_13 = arg_281_1:FormatText(StoryNameCfg[94].name)

				arg_281_1.leftNameTxt_.text = var_284_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_14 = arg_281_1:GetWordFromCfg(115311070)
				local var_284_15 = arg_281_1:FormatText(var_284_14.content)

				arg_281_1.text_.text = var_284_15

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_16 = 48
				local var_284_17 = utf8.len(var_284_15)
				local var_284_18 = var_284_16 <= 0 and var_284_12 or var_284_12 * (var_284_17 / var_284_16)

				if var_284_18 > 0 and var_284_12 < var_284_18 then
					arg_281_1.talkMaxDuration = var_284_18

					if var_284_18 + var_284_11 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_18 + var_284_11
					end
				end

				arg_281_1.text_.text = var_284_15
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311070", "story_v_out_115311.awb") ~= 0 then
					local var_284_19 = manager.audio:GetVoiceLength("story_v_out_115311", "115311070", "story_v_out_115311.awb") / 1000

					if var_284_19 + var_284_11 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_19 + var_284_11
					end

					if var_284_14.prefab_name ~= "" and arg_281_1.actors_[var_284_14.prefab_name] ~= nil then
						local var_284_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_14.prefab_name].transform, "story_v_out_115311", "115311070", "story_v_out_115311.awb")

						arg_281_1:RecordAudio("115311070", var_284_20)
						arg_281_1:RecordAudio("115311070", var_284_20)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_out_115311", "115311070", "story_v_out_115311.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_out_115311", "115311070", "story_v_out_115311.awb")
				end

				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_21 = math.max(var_284_12, arg_281_1.talkMaxDuration)

			if var_284_11 <= arg_281_1.time_ and arg_281_1.time_ < var_284_11 + var_284_21 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_11) / var_284_21

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_11 + var_284_21 and arg_281_1.time_ < var_284_11 + var_284_21 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play115311071 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 115311071
		arg_285_1.duration_ = 9.033

		local var_285_0 = {
			ja = 8.733,
			ko = 9.033,
			zh = 8.433,
			en = 9
		}
		local var_285_1 = manager.audio:GetLocalizationFlag()

		if var_285_0[var_285_1] ~= nil then
			arg_285_1.duration_ = var_285_0[var_285_1]
		end

		SetActive(arg_285_1.tipsGo_, false)

		function arg_285_1.onSingleLineFinish_()
			arg_285_1.onSingleLineUpdate_ = nil
			arg_285_1.onSingleLineFinish_ = nil
			arg_285_1.state_ = "waiting"
		end

		function arg_285_1.playNext_(arg_287_0)
			if arg_287_0 == 1 then
				arg_285_0:Play115311072(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = arg_285_1.actors_["113801_1"]
			local var_288_1 = 0

			if var_288_1 < arg_285_1.time_ and arg_285_1.time_ <= var_288_1 + arg_288_0 then
				local var_288_2 = var_288_0:GetComponent("Image")

				if var_288_2 then
					arg_285_1.var_.highlightMatValue113801_1 = var_288_2
				end
			end

			local var_288_3 = 0.2

			if var_288_1 <= arg_285_1.time_ and arg_285_1.time_ < var_288_1 + var_288_3 then
				local var_288_4 = (arg_285_1.time_ - var_288_1) / var_288_3

				if arg_285_1.var_.highlightMatValue113801_1 then
					local var_288_5 = Mathf.Lerp(1, 0.5, var_288_4)
					local var_288_6 = arg_285_1.var_.highlightMatValue113801_1
					local var_288_7 = var_288_6.color

					var_288_7.r = var_288_5
					var_288_7.g = var_288_5
					var_288_7.b = var_288_5
					var_288_6.color = var_288_7
				end
			end

			if arg_285_1.time_ >= var_288_1 + var_288_3 and arg_285_1.time_ < var_288_1 + var_288_3 + arg_288_0 and arg_285_1.var_.highlightMatValue113801_1 then
				local var_288_8 = 0.5
				local var_288_9 = arg_285_1.var_.highlightMatValue113801_1
				local var_288_10 = var_288_9.color

				var_288_10.r = var_288_8
				var_288_10.g = var_288_8
				var_288_10.b = var_288_8
				var_288_9.color = var_288_10
			end

			local var_288_11 = arg_285_1.actors_["10029"]
			local var_288_12 = 0

			if var_288_12 < arg_285_1.time_ and arg_285_1.time_ <= var_288_12 + arg_288_0 then
				local var_288_13 = var_288_11:GetComponent("Image")

				if var_288_13 then
					arg_285_1.var_.highlightMatValue10029 = var_288_13
				end
			end

			local var_288_14 = 0.2

			if var_288_12 <= arg_285_1.time_ and arg_285_1.time_ < var_288_12 + var_288_14 then
				local var_288_15 = (arg_285_1.time_ - var_288_12) / var_288_14

				if arg_285_1.var_.highlightMatValue10029 then
					local var_288_16 = Mathf.Lerp(0.5, 1, var_288_15)
					local var_288_17 = arg_285_1.var_.highlightMatValue10029
					local var_288_18 = var_288_17.color

					var_288_18.r = var_288_16
					var_288_18.g = var_288_16
					var_288_18.b = var_288_16
					var_288_17.color = var_288_18
				end
			end

			if arg_285_1.time_ >= var_288_12 + var_288_14 and arg_285_1.time_ < var_288_12 + var_288_14 + arg_288_0 and arg_285_1.var_.highlightMatValue10029 then
				local var_288_19 = 1

				var_288_11.transform:SetSiblingIndex(1)

				local var_288_20 = arg_285_1.var_.highlightMatValue10029
				local var_288_21 = var_288_20.color

				var_288_21.r = var_288_19
				var_288_21.g = var_288_19
				var_288_21.b = var_288_19
				var_288_20.color = var_288_21
			end

			local var_288_22 = 0
			local var_288_23 = 0.925

			if var_288_22 < arg_285_1.time_ and arg_285_1.time_ <= var_288_22 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_24 = arg_285_1:FormatText(StoryNameCfg[312].name)

				arg_285_1.leftNameTxt_.text = var_288_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, false)
				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_25 = arg_285_1:GetWordFromCfg(115311071)
				local var_288_26 = arg_285_1:FormatText(var_288_25.content)

				arg_285_1.text_.text = var_288_26

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_27 = 37
				local var_288_28 = utf8.len(var_288_26)
				local var_288_29 = var_288_27 <= 0 and var_288_23 or var_288_23 * (var_288_28 / var_288_27)

				if var_288_29 > 0 and var_288_23 < var_288_29 then
					arg_285_1.talkMaxDuration = var_288_29

					if var_288_29 + var_288_22 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_29 + var_288_22
					end
				end

				arg_285_1.text_.text = var_288_26
				arg_285_1.typewritter.percent = 0

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311071", "story_v_out_115311.awb") ~= 0 then
					local var_288_30 = manager.audio:GetVoiceLength("story_v_out_115311", "115311071", "story_v_out_115311.awb") / 1000

					if var_288_30 + var_288_22 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_30 + var_288_22
					end

					if var_288_25.prefab_name ~= "" and arg_285_1.actors_[var_288_25.prefab_name] ~= nil then
						local var_288_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_285_1.actors_[var_288_25.prefab_name].transform, "story_v_out_115311", "115311071", "story_v_out_115311.awb")

						arg_285_1:RecordAudio("115311071", var_288_31)
						arg_285_1:RecordAudio("115311071", var_288_31)
					else
						arg_285_1:AudioAction("play", "voice", "story_v_out_115311", "115311071", "story_v_out_115311.awb")
					end

					arg_285_1:RecordHistoryTalkVoice("story_v_out_115311", "115311071", "story_v_out_115311.awb")
				end

				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_32 = math.max(var_288_23, arg_285_1.talkMaxDuration)

			if var_288_22 <= arg_285_1.time_ and arg_285_1.time_ < var_288_22 + var_288_32 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_22) / var_288_32

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_22 + var_288_32 and arg_285_1.time_ < var_288_22 + var_288_32 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	Play115311072 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 115311072
		arg_289_1.duration_ = 5.333

		local var_289_0 = {
			ja = 3,
			ko = 2.866,
			zh = 5.333,
			en = 4.133
		}
		local var_289_1 = manager.audio:GetLocalizationFlag()

		if var_289_0[var_289_1] ~= nil then
			arg_289_1.duration_ = var_289_0[var_289_1]
		end

		SetActive(arg_289_1.tipsGo_, false)

		function arg_289_1.onSingleLineFinish_()
			arg_289_1.onSingleLineUpdate_ = nil
			arg_289_1.onSingleLineFinish_ = nil
			arg_289_1.state_ = "waiting"
		end

		function arg_289_1.playNext_(arg_291_0)
			if arg_291_0 == 1 then
				arg_289_0:Play115311073(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = arg_289_1.actors_["113801_1"]
			local var_292_1 = 0

			if var_292_1 < arg_289_1.time_ and arg_289_1.time_ <= var_292_1 + arg_292_0 then
				local var_292_2 = var_292_0:GetComponent("Image")

				if var_292_2 then
					arg_289_1.var_.highlightMatValue113801_1 = var_292_2
				end
			end

			local var_292_3 = 0.2

			if var_292_1 <= arg_289_1.time_ and arg_289_1.time_ < var_292_1 + var_292_3 then
				local var_292_4 = (arg_289_1.time_ - var_292_1) / var_292_3

				if arg_289_1.var_.highlightMatValue113801_1 then
					local var_292_5 = Mathf.Lerp(0.5, 1, var_292_4)
					local var_292_6 = arg_289_1.var_.highlightMatValue113801_1
					local var_292_7 = var_292_6.color

					var_292_7.r = var_292_5
					var_292_7.g = var_292_5
					var_292_7.b = var_292_5
					var_292_6.color = var_292_7
				end
			end

			if arg_289_1.time_ >= var_292_1 + var_292_3 and arg_289_1.time_ < var_292_1 + var_292_3 + arg_292_0 and arg_289_1.var_.highlightMatValue113801_1 then
				local var_292_8 = 1

				var_292_0.transform:SetSiblingIndex(1)

				local var_292_9 = arg_289_1.var_.highlightMatValue113801_1
				local var_292_10 = var_292_9.color

				var_292_10.r = var_292_8
				var_292_10.g = var_292_8
				var_292_10.b = var_292_8
				var_292_9.color = var_292_10
			end

			local var_292_11 = arg_289_1.actors_["10029"]
			local var_292_12 = 0

			if var_292_12 < arg_289_1.time_ and arg_289_1.time_ <= var_292_12 + arg_292_0 then
				local var_292_13 = var_292_11:GetComponent("Image")

				if var_292_13 then
					arg_289_1.var_.highlightMatValue10029 = var_292_13
				end
			end

			local var_292_14 = 0.2

			if var_292_12 <= arg_289_1.time_ and arg_289_1.time_ < var_292_12 + var_292_14 then
				local var_292_15 = (arg_289_1.time_ - var_292_12) / var_292_14

				if arg_289_1.var_.highlightMatValue10029 then
					local var_292_16 = Mathf.Lerp(1, 0.5, var_292_15)
					local var_292_17 = arg_289_1.var_.highlightMatValue10029
					local var_292_18 = var_292_17.color

					var_292_18.r = var_292_16
					var_292_18.g = var_292_16
					var_292_18.b = var_292_16
					var_292_17.color = var_292_18
				end
			end

			if arg_289_1.time_ >= var_292_12 + var_292_14 and arg_289_1.time_ < var_292_12 + var_292_14 + arg_292_0 and arg_289_1.var_.highlightMatValue10029 then
				local var_292_19 = 0.5
				local var_292_20 = arg_289_1.var_.highlightMatValue10029
				local var_292_21 = var_292_20.color

				var_292_21.r = var_292_19
				var_292_21.g = var_292_19
				var_292_21.b = var_292_19
				var_292_20.color = var_292_21
			end

			local var_292_22 = 0
			local var_292_23 = 0.4

			if var_292_22 < arg_289_1.time_ and arg_289_1.time_ <= var_292_22 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, true)

				local var_292_24 = arg_289_1:FormatText(StoryNameCfg[94].name)

				arg_289_1.leftNameTxt_.text = var_292_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_289_1.leftNameTxt_.transform)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1.leftNameTxt_.text)
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_25 = arg_289_1:GetWordFromCfg(115311072)
				local var_292_26 = arg_289_1:FormatText(var_292_25.content)

				arg_289_1.text_.text = var_292_26

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_27 = 16
				local var_292_28 = utf8.len(var_292_26)
				local var_292_29 = var_292_27 <= 0 and var_292_23 or var_292_23 * (var_292_28 / var_292_27)

				if var_292_29 > 0 and var_292_23 < var_292_29 then
					arg_289_1.talkMaxDuration = var_292_29

					if var_292_29 + var_292_22 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_29 + var_292_22
					end
				end

				arg_289_1.text_.text = var_292_26
				arg_289_1.typewritter.percent = 0

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311072", "story_v_out_115311.awb") ~= 0 then
					local var_292_30 = manager.audio:GetVoiceLength("story_v_out_115311", "115311072", "story_v_out_115311.awb") / 1000

					if var_292_30 + var_292_22 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_30 + var_292_22
					end

					if var_292_25.prefab_name ~= "" and arg_289_1.actors_[var_292_25.prefab_name] ~= nil then
						local var_292_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_289_1.actors_[var_292_25.prefab_name].transform, "story_v_out_115311", "115311072", "story_v_out_115311.awb")

						arg_289_1:RecordAudio("115311072", var_292_31)
						arg_289_1:RecordAudio("115311072", var_292_31)
					else
						arg_289_1:AudioAction("play", "voice", "story_v_out_115311", "115311072", "story_v_out_115311.awb")
					end

					arg_289_1:RecordHistoryTalkVoice("story_v_out_115311", "115311072", "story_v_out_115311.awb")
				end

				arg_289_1:RecordContent(arg_289_1.text_.text)
			end

			local var_292_32 = math.max(var_292_23, arg_289_1.talkMaxDuration)

			if var_292_22 <= arg_289_1.time_ and arg_289_1.time_ < var_292_22 + var_292_32 then
				arg_289_1.typewritter.percent = (arg_289_1.time_ - var_292_22) / var_292_32

				arg_289_1.typewritter:SetDirty()
			end

			if arg_289_1.time_ >= var_292_22 + var_292_32 and arg_289_1.time_ < var_292_22 + var_292_32 + arg_292_0 then
				arg_289_1.typewritter.percent = 1

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(true)
			end
		end
	end,
	Play115311073 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 115311073
		arg_293_1.duration_ = 5.133

		local var_293_0 = {
			ja = 1.4,
			ko = 3.633,
			zh = 3.8,
			en = 5.133
		}
		local var_293_1 = manager.audio:GetLocalizationFlag()

		if var_293_0[var_293_1] ~= nil then
			arg_293_1.duration_ = var_293_0[var_293_1]
		end

		SetActive(arg_293_1.tipsGo_, false)

		function arg_293_1.onSingleLineFinish_()
			arg_293_1.onSingleLineUpdate_ = nil
			arg_293_1.onSingleLineFinish_ = nil
			arg_293_1.state_ = "waiting"
		end

		function arg_293_1.playNext_(arg_295_0)
			if arg_295_0 == 1 then
				arg_293_0:Play115311074(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = arg_293_1.actors_["113801_1"]
			local var_296_1 = 0

			if var_296_1 < arg_293_1.time_ and arg_293_1.time_ <= var_296_1 + arg_296_0 then
				local var_296_2 = var_296_0:GetComponent("Image")

				if var_296_2 then
					arg_293_1.var_.highlightMatValue113801_1 = var_296_2
				end
			end

			local var_296_3 = 0.2

			if var_296_1 <= arg_293_1.time_ and arg_293_1.time_ < var_296_1 + var_296_3 then
				local var_296_4 = (arg_293_1.time_ - var_296_1) / var_296_3

				if arg_293_1.var_.highlightMatValue113801_1 then
					local var_296_5 = Mathf.Lerp(1, 0.5, var_296_4)
					local var_296_6 = arg_293_1.var_.highlightMatValue113801_1
					local var_296_7 = var_296_6.color

					var_296_7.r = var_296_5
					var_296_7.g = var_296_5
					var_296_7.b = var_296_5
					var_296_6.color = var_296_7
				end
			end

			if arg_293_1.time_ >= var_296_1 + var_296_3 and arg_293_1.time_ < var_296_1 + var_296_3 + arg_296_0 and arg_293_1.var_.highlightMatValue113801_1 then
				local var_296_8 = 0.5
				local var_296_9 = arg_293_1.var_.highlightMatValue113801_1
				local var_296_10 = var_296_9.color

				var_296_10.r = var_296_8
				var_296_10.g = var_296_8
				var_296_10.b = var_296_8
				var_296_9.color = var_296_10
			end

			local var_296_11 = arg_293_1.actors_["10029"]
			local var_296_12 = 0

			if var_296_12 < arg_293_1.time_ and arg_293_1.time_ <= var_296_12 + arg_296_0 then
				local var_296_13 = var_296_11:GetComponent("Image")

				if var_296_13 then
					arg_293_1.var_.highlightMatValue10029 = var_296_13
				end
			end

			local var_296_14 = 0.2

			if var_296_12 <= arg_293_1.time_ and arg_293_1.time_ < var_296_12 + var_296_14 then
				local var_296_15 = (arg_293_1.time_ - var_296_12) / var_296_14

				if arg_293_1.var_.highlightMatValue10029 then
					local var_296_16 = Mathf.Lerp(0.5, 1, var_296_15)
					local var_296_17 = arg_293_1.var_.highlightMatValue10029
					local var_296_18 = var_296_17.color

					var_296_18.r = var_296_16
					var_296_18.g = var_296_16
					var_296_18.b = var_296_16
					var_296_17.color = var_296_18
				end
			end

			if arg_293_1.time_ >= var_296_12 + var_296_14 and arg_293_1.time_ < var_296_12 + var_296_14 + arg_296_0 and arg_293_1.var_.highlightMatValue10029 then
				local var_296_19 = 1

				var_296_11.transform:SetSiblingIndex(1)

				local var_296_20 = arg_293_1.var_.highlightMatValue10029
				local var_296_21 = var_296_20.color

				var_296_21.r = var_296_19
				var_296_21.g = var_296_19
				var_296_21.b = var_296_19
				var_296_20.color = var_296_21
			end

			local var_296_22 = 0
			local var_296_23 = 0.35

			if var_296_22 < arg_293_1.time_ and arg_293_1.time_ <= var_296_22 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0
				arg_293_1.dialogCg_.alpha = 1

				arg_293_1.dialog_:SetActive(true)
				SetActive(arg_293_1.leftNameGo_, true)

				local var_296_24 = arg_293_1:FormatText(StoryNameCfg[312].name)

				arg_293_1.leftNameTxt_.text = var_296_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_293_1.leftNameTxt_.transform)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1.leftNameTxt_.text)
				SetActive(arg_293_1.iconTrs_.gameObject, false)
				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_25 = arg_293_1:GetWordFromCfg(115311073)
				local var_296_26 = arg_293_1:FormatText(var_296_25.content)

				arg_293_1.text_.text = var_296_26

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_27 = 14
				local var_296_28 = utf8.len(var_296_26)
				local var_296_29 = var_296_27 <= 0 and var_296_23 or var_296_23 * (var_296_28 / var_296_27)

				if var_296_29 > 0 and var_296_23 < var_296_29 then
					arg_293_1.talkMaxDuration = var_296_29

					if var_296_29 + var_296_22 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_29 + var_296_22
					end
				end

				arg_293_1.text_.text = var_296_26
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311073", "story_v_out_115311.awb") ~= 0 then
					local var_296_30 = manager.audio:GetVoiceLength("story_v_out_115311", "115311073", "story_v_out_115311.awb") / 1000

					if var_296_30 + var_296_22 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_30 + var_296_22
					end

					if var_296_25.prefab_name ~= "" and arg_293_1.actors_[var_296_25.prefab_name] ~= nil then
						local var_296_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_293_1.actors_[var_296_25.prefab_name].transform, "story_v_out_115311", "115311073", "story_v_out_115311.awb")

						arg_293_1:RecordAudio("115311073", var_296_31)
						arg_293_1:RecordAudio("115311073", var_296_31)
					else
						arg_293_1:AudioAction("play", "voice", "story_v_out_115311", "115311073", "story_v_out_115311.awb")
					end

					arg_293_1:RecordHistoryTalkVoice("story_v_out_115311", "115311073", "story_v_out_115311.awb")
				end

				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_32 = math.max(var_296_23, arg_293_1.talkMaxDuration)

			if var_296_22 <= arg_293_1.time_ and arg_293_1.time_ < var_296_22 + var_296_32 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_22) / var_296_32

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_22 + var_296_32 and arg_293_1.time_ < var_296_22 + var_296_32 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play115311074 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 115311074
		arg_297_1.duration_ = 11.4

		local var_297_0 = {
			ja = 9.233,
			ko = 11.033,
			zh = 11.4,
			en = 10.2
		}
		local var_297_1 = manager.audio:GetLocalizationFlag()

		if var_297_0[var_297_1] ~= nil then
			arg_297_1.duration_ = var_297_0[var_297_1]
		end

		SetActive(arg_297_1.tipsGo_, false)

		function arg_297_1.onSingleLineFinish_()
			arg_297_1.onSingleLineUpdate_ = nil
			arg_297_1.onSingleLineFinish_ = nil
			arg_297_1.state_ = "waiting"
		end

		function arg_297_1.playNext_(arg_299_0)
			if arg_299_0 == 1 then
				arg_297_0:Play115311075(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = arg_297_1.actors_["113801_1"]
			local var_300_1 = 0

			if var_300_1 < arg_297_1.time_ and arg_297_1.time_ <= var_300_1 + arg_300_0 then
				local var_300_2 = var_300_0:GetComponent("Image")

				if var_300_2 then
					arg_297_1.var_.highlightMatValue113801_1 = var_300_2
				end
			end

			local var_300_3 = 0.2

			if var_300_1 <= arg_297_1.time_ and arg_297_1.time_ < var_300_1 + var_300_3 then
				local var_300_4 = (arg_297_1.time_ - var_300_1) / var_300_3

				if arg_297_1.var_.highlightMatValue113801_1 then
					local var_300_5 = Mathf.Lerp(0.5, 1, var_300_4)
					local var_300_6 = arg_297_1.var_.highlightMatValue113801_1
					local var_300_7 = var_300_6.color

					var_300_7.r = var_300_5
					var_300_7.g = var_300_5
					var_300_7.b = var_300_5
					var_300_6.color = var_300_7
				end
			end

			if arg_297_1.time_ >= var_300_1 + var_300_3 and arg_297_1.time_ < var_300_1 + var_300_3 + arg_300_0 and arg_297_1.var_.highlightMatValue113801_1 then
				local var_300_8 = 1

				var_300_0.transform:SetSiblingIndex(1)

				local var_300_9 = arg_297_1.var_.highlightMatValue113801_1
				local var_300_10 = var_300_9.color

				var_300_10.r = var_300_8
				var_300_10.g = var_300_8
				var_300_10.b = var_300_8
				var_300_9.color = var_300_10
			end

			local var_300_11 = arg_297_1.actors_["10029"]
			local var_300_12 = 0

			if var_300_12 < arg_297_1.time_ and arg_297_1.time_ <= var_300_12 + arg_300_0 then
				local var_300_13 = var_300_11:GetComponent("Image")

				if var_300_13 then
					arg_297_1.var_.highlightMatValue10029 = var_300_13
				end
			end

			local var_300_14 = 0.2

			if var_300_12 <= arg_297_1.time_ and arg_297_1.time_ < var_300_12 + var_300_14 then
				local var_300_15 = (arg_297_1.time_ - var_300_12) / var_300_14

				if arg_297_1.var_.highlightMatValue10029 then
					local var_300_16 = Mathf.Lerp(1, 0.5, var_300_15)
					local var_300_17 = arg_297_1.var_.highlightMatValue10029
					local var_300_18 = var_300_17.color

					var_300_18.r = var_300_16
					var_300_18.g = var_300_16
					var_300_18.b = var_300_16
					var_300_17.color = var_300_18
				end
			end

			if arg_297_1.time_ >= var_300_12 + var_300_14 and arg_297_1.time_ < var_300_12 + var_300_14 + arg_300_0 and arg_297_1.var_.highlightMatValue10029 then
				local var_300_19 = 0.5
				local var_300_20 = arg_297_1.var_.highlightMatValue10029
				local var_300_21 = var_300_20.color

				var_300_21.r = var_300_19
				var_300_21.g = var_300_19
				var_300_21.b = var_300_19
				var_300_20.color = var_300_21
			end

			local var_300_22 = 0
			local var_300_23 = 1.1

			if var_300_22 < arg_297_1.time_ and arg_297_1.time_ <= var_300_22 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, true)

				local var_300_24 = arg_297_1:FormatText(StoryNameCfg[94].name)

				arg_297_1.leftNameTxt_.text = var_300_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_297_1.leftNameTxt_.transform)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1.leftNameTxt_.text)
				SetActive(arg_297_1.iconTrs_.gameObject, false)
				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_25 = arg_297_1:GetWordFromCfg(115311074)
				local var_300_26 = arg_297_1:FormatText(var_300_25.content)

				arg_297_1.text_.text = var_300_26

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_27 = 44
				local var_300_28 = utf8.len(var_300_26)
				local var_300_29 = var_300_27 <= 0 and var_300_23 or var_300_23 * (var_300_28 / var_300_27)

				if var_300_29 > 0 and var_300_23 < var_300_29 then
					arg_297_1.talkMaxDuration = var_300_29

					if var_300_29 + var_300_22 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_29 + var_300_22
					end
				end

				arg_297_1.text_.text = var_300_26
				arg_297_1.typewritter.percent = 0

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311074", "story_v_out_115311.awb") ~= 0 then
					local var_300_30 = manager.audio:GetVoiceLength("story_v_out_115311", "115311074", "story_v_out_115311.awb") / 1000

					if var_300_30 + var_300_22 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_30 + var_300_22
					end

					if var_300_25.prefab_name ~= "" and arg_297_1.actors_[var_300_25.prefab_name] ~= nil then
						local var_300_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_297_1.actors_[var_300_25.prefab_name].transform, "story_v_out_115311", "115311074", "story_v_out_115311.awb")

						arg_297_1:RecordAudio("115311074", var_300_31)
						arg_297_1:RecordAudio("115311074", var_300_31)
					else
						arg_297_1:AudioAction("play", "voice", "story_v_out_115311", "115311074", "story_v_out_115311.awb")
					end

					arg_297_1:RecordHistoryTalkVoice("story_v_out_115311", "115311074", "story_v_out_115311.awb")
				end

				arg_297_1:RecordContent(arg_297_1.text_.text)
			end

			local var_300_32 = math.max(var_300_23, arg_297_1.talkMaxDuration)

			if var_300_22 <= arg_297_1.time_ and arg_297_1.time_ < var_300_22 + var_300_32 then
				arg_297_1.typewritter.percent = (arg_297_1.time_ - var_300_22) / var_300_32

				arg_297_1.typewritter:SetDirty()
			end

			if arg_297_1.time_ >= var_300_22 + var_300_32 and arg_297_1.time_ < var_300_22 + var_300_32 + arg_300_0 then
				arg_297_1.typewritter.percent = 1

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(true)
			end
		end
	end,
	Play115311075 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 115311075
		arg_301_1.duration_ = 11.7

		local var_301_0 = {
			ja = 11.7,
			ko = 7.033,
			zh = 5.6,
			en = 7.2
		}
		local var_301_1 = manager.audio:GetLocalizationFlag()

		if var_301_0[var_301_1] ~= nil then
			arg_301_1.duration_ = var_301_0[var_301_1]
		end

		SetActive(arg_301_1.tipsGo_, false)

		function arg_301_1.onSingleLineFinish_()
			arg_301_1.onSingleLineUpdate_ = nil
			arg_301_1.onSingleLineFinish_ = nil
			arg_301_1.state_ = "waiting"
		end

		function arg_301_1.playNext_(arg_303_0)
			if arg_303_0 == 1 then
				arg_301_0:Play115311076(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = 0
			local var_304_1 = 0.6

			if var_304_0 < arg_301_1.time_ and arg_301_1.time_ <= var_304_0 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, true)

				local var_304_2 = arg_301_1:FormatText(StoryNameCfg[94].name)

				arg_301_1.leftNameTxt_.text = var_304_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_301_1.leftNameTxt_.transform)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1.leftNameTxt_.text)
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_3 = arg_301_1:GetWordFromCfg(115311075)
				local var_304_4 = arg_301_1:FormatText(var_304_3.content)

				arg_301_1.text_.text = var_304_4

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_5 = 24
				local var_304_6 = utf8.len(var_304_4)
				local var_304_7 = var_304_5 <= 0 and var_304_1 or var_304_1 * (var_304_6 / var_304_5)

				if var_304_7 > 0 and var_304_1 < var_304_7 then
					arg_301_1.talkMaxDuration = var_304_7

					if var_304_7 + var_304_0 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_7 + var_304_0
					end
				end

				arg_301_1.text_.text = var_304_4
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311075", "story_v_out_115311.awb") ~= 0 then
					local var_304_8 = manager.audio:GetVoiceLength("story_v_out_115311", "115311075", "story_v_out_115311.awb") / 1000

					if var_304_8 + var_304_0 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_8 + var_304_0
					end

					if var_304_3.prefab_name ~= "" and arg_301_1.actors_[var_304_3.prefab_name] ~= nil then
						local var_304_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_301_1.actors_[var_304_3.prefab_name].transform, "story_v_out_115311", "115311075", "story_v_out_115311.awb")

						arg_301_1:RecordAudio("115311075", var_304_9)
						arg_301_1:RecordAudio("115311075", var_304_9)
					else
						arg_301_1:AudioAction("play", "voice", "story_v_out_115311", "115311075", "story_v_out_115311.awb")
					end

					arg_301_1:RecordHistoryTalkVoice("story_v_out_115311", "115311075", "story_v_out_115311.awb")
				end

				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_10 = math.max(var_304_1, arg_301_1.talkMaxDuration)

			if var_304_0 <= arg_301_1.time_ and arg_301_1.time_ < var_304_0 + var_304_10 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_0) / var_304_10

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_0 + var_304_10 and arg_301_1.time_ < var_304_0 + var_304_10 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play115311076 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 115311076
		arg_305_1.duration_ = 11.833

		local var_305_0 = {
			ja = 8.9,
			ko = 11.833,
			zh = 9.866,
			en = 11.633
		}
		local var_305_1 = manager.audio:GetLocalizationFlag()

		if var_305_0[var_305_1] ~= nil then
			arg_305_1.duration_ = var_305_0[var_305_1]
		end

		SetActive(arg_305_1.tipsGo_, false)

		function arg_305_1.onSingleLineFinish_()
			arg_305_1.onSingleLineUpdate_ = nil
			arg_305_1.onSingleLineFinish_ = nil
			arg_305_1.state_ = "waiting"
		end

		function arg_305_1.playNext_(arg_307_0)
			if arg_307_0 == 1 then
				arg_305_0:Play115311077(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = arg_305_1.actors_["113801_1"]
			local var_308_1 = 0

			if var_308_1 < arg_305_1.time_ and arg_305_1.time_ <= var_308_1 + arg_308_0 then
				local var_308_2 = var_308_0:GetComponent("Image")

				if var_308_2 then
					arg_305_1.var_.highlightMatValue113801_1 = var_308_2
				end
			end

			local var_308_3 = 0.2

			if var_308_1 <= arg_305_1.time_ and arg_305_1.time_ < var_308_1 + var_308_3 then
				local var_308_4 = (arg_305_1.time_ - var_308_1) / var_308_3

				if arg_305_1.var_.highlightMatValue113801_1 then
					local var_308_5 = Mathf.Lerp(1, 0.5, var_308_4)
					local var_308_6 = arg_305_1.var_.highlightMatValue113801_1
					local var_308_7 = var_308_6.color

					var_308_7.r = var_308_5
					var_308_7.g = var_308_5
					var_308_7.b = var_308_5
					var_308_6.color = var_308_7
				end
			end

			if arg_305_1.time_ >= var_308_1 + var_308_3 and arg_305_1.time_ < var_308_1 + var_308_3 + arg_308_0 and arg_305_1.var_.highlightMatValue113801_1 then
				local var_308_8 = 0.5
				local var_308_9 = arg_305_1.var_.highlightMatValue113801_1
				local var_308_10 = var_308_9.color

				var_308_10.r = var_308_8
				var_308_10.g = var_308_8
				var_308_10.b = var_308_8
				var_308_9.color = var_308_10
			end

			local var_308_11 = arg_305_1.actors_["10029"]
			local var_308_12 = 0

			if var_308_12 < arg_305_1.time_ and arg_305_1.time_ <= var_308_12 + arg_308_0 then
				local var_308_13 = var_308_11:GetComponent("Image")

				if var_308_13 then
					arg_305_1.var_.highlightMatValue10029 = var_308_13
				end
			end

			local var_308_14 = 0.2

			if var_308_12 <= arg_305_1.time_ and arg_305_1.time_ < var_308_12 + var_308_14 then
				local var_308_15 = (arg_305_1.time_ - var_308_12) / var_308_14

				if arg_305_1.var_.highlightMatValue10029 then
					local var_308_16 = Mathf.Lerp(0.5, 1, var_308_15)
					local var_308_17 = arg_305_1.var_.highlightMatValue10029
					local var_308_18 = var_308_17.color

					var_308_18.r = var_308_16
					var_308_18.g = var_308_16
					var_308_18.b = var_308_16
					var_308_17.color = var_308_18
				end
			end

			if arg_305_1.time_ >= var_308_12 + var_308_14 and arg_305_1.time_ < var_308_12 + var_308_14 + arg_308_0 and arg_305_1.var_.highlightMatValue10029 then
				local var_308_19 = 1

				var_308_11.transform:SetSiblingIndex(1)

				local var_308_20 = arg_305_1.var_.highlightMatValue10029
				local var_308_21 = var_308_20.color

				var_308_21.r = var_308_19
				var_308_21.g = var_308_19
				var_308_21.b = var_308_19
				var_308_20.color = var_308_21
			end

			local var_308_22 = 0
			local var_308_23 = 0.925

			if var_308_22 < arg_305_1.time_ and arg_305_1.time_ <= var_308_22 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, true)

				local var_308_24 = arg_305_1:FormatText(StoryNameCfg[312].name)

				arg_305_1.leftNameTxt_.text = var_308_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_305_1.leftNameTxt_.transform)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1.leftNameTxt_.text)
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_25 = arg_305_1:GetWordFromCfg(115311076)
				local var_308_26 = arg_305_1:FormatText(var_308_25.content)

				arg_305_1.text_.text = var_308_26

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_27 = 37
				local var_308_28 = utf8.len(var_308_26)
				local var_308_29 = var_308_27 <= 0 and var_308_23 or var_308_23 * (var_308_28 / var_308_27)

				if var_308_29 > 0 and var_308_23 < var_308_29 then
					arg_305_1.talkMaxDuration = var_308_29

					if var_308_29 + var_308_22 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_29 + var_308_22
					end
				end

				arg_305_1.text_.text = var_308_26
				arg_305_1.typewritter.percent = 0

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311076", "story_v_out_115311.awb") ~= 0 then
					local var_308_30 = manager.audio:GetVoiceLength("story_v_out_115311", "115311076", "story_v_out_115311.awb") / 1000

					if var_308_30 + var_308_22 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_30 + var_308_22
					end

					if var_308_25.prefab_name ~= "" and arg_305_1.actors_[var_308_25.prefab_name] ~= nil then
						local var_308_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_305_1.actors_[var_308_25.prefab_name].transform, "story_v_out_115311", "115311076", "story_v_out_115311.awb")

						arg_305_1:RecordAudio("115311076", var_308_31)
						arg_305_1:RecordAudio("115311076", var_308_31)
					else
						arg_305_1:AudioAction("play", "voice", "story_v_out_115311", "115311076", "story_v_out_115311.awb")
					end

					arg_305_1:RecordHistoryTalkVoice("story_v_out_115311", "115311076", "story_v_out_115311.awb")
				end

				arg_305_1:RecordContent(arg_305_1.text_.text)
			end

			local var_308_32 = math.max(var_308_23, arg_305_1.talkMaxDuration)

			if var_308_22 <= arg_305_1.time_ and arg_305_1.time_ < var_308_22 + var_308_32 then
				arg_305_1.typewritter.percent = (arg_305_1.time_ - var_308_22) / var_308_32

				arg_305_1.typewritter:SetDirty()
			end

			if arg_305_1.time_ >= var_308_22 + var_308_32 and arg_305_1.time_ < var_308_22 + var_308_32 + arg_308_0 then
				arg_305_1.typewritter.percent = 1

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(true)
			end
		end
	end,
	Play115311077 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 115311077
		arg_309_1.duration_ = 12

		local var_309_0 = {
			ja = 12,
			ko = 7.466,
			zh = 7.266,
			en = 8.9
		}
		local var_309_1 = manager.audio:GetLocalizationFlag()

		if var_309_0[var_309_1] ~= nil then
			arg_309_1.duration_ = var_309_0[var_309_1]
		end

		SetActive(arg_309_1.tipsGo_, false)

		function arg_309_1.onSingleLineFinish_()
			arg_309_1.onSingleLineUpdate_ = nil
			arg_309_1.onSingleLineFinish_ = nil
			arg_309_1.state_ = "waiting"
		end

		function arg_309_1.playNext_(arg_311_0)
			if arg_311_0 == 1 then
				arg_309_0:Play115311078(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = arg_309_1.actors_["113801_1"]
			local var_312_1 = 0

			if var_312_1 < arg_309_1.time_ and arg_309_1.time_ <= var_312_1 + arg_312_0 then
				local var_312_2 = var_312_0:GetComponent("Image")

				if var_312_2 then
					arg_309_1.var_.highlightMatValue113801_1 = var_312_2
				end
			end

			local var_312_3 = 0.2

			if var_312_1 <= arg_309_1.time_ and arg_309_1.time_ < var_312_1 + var_312_3 then
				local var_312_4 = (arg_309_1.time_ - var_312_1) / var_312_3

				if arg_309_1.var_.highlightMatValue113801_1 then
					local var_312_5 = Mathf.Lerp(0.5, 1, var_312_4)
					local var_312_6 = arg_309_1.var_.highlightMatValue113801_1
					local var_312_7 = var_312_6.color

					var_312_7.r = var_312_5
					var_312_7.g = var_312_5
					var_312_7.b = var_312_5
					var_312_6.color = var_312_7
				end
			end

			if arg_309_1.time_ >= var_312_1 + var_312_3 and arg_309_1.time_ < var_312_1 + var_312_3 + arg_312_0 and arg_309_1.var_.highlightMatValue113801_1 then
				local var_312_8 = 1

				var_312_0.transform:SetSiblingIndex(1)

				local var_312_9 = arg_309_1.var_.highlightMatValue113801_1
				local var_312_10 = var_312_9.color

				var_312_10.r = var_312_8
				var_312_10.g = var_312_8
				var_312_10.b = var_312_8
				var_312_9.color = var_312_10
			end

			local var_312_11 = arg_309_1.actors_["10029"]
			local var_312_12 = 0

			if var_312_12 < arg_309_1.time_ and arg_309_1.time_ <= var_312_12 + arg_312_0 then
				local var_312_13 = var_312_11:GetComponent("Image")

				if var_312_13 then
					arg_309_1.var_.highlightMatValue10029 = var_312_13
				end
			end

			local var_312_14 = 0.2

			if var_312_12 <= arg_309_1.time_ and arg_309_1.time_ < var_312_12 + var_312_14 then
				local var_312_15 = (arg_309_1.time_ - var_312_12) / var_312_14

				if arg_309_1.var_.highlightMatValue10029 then
					local var_312_16 = Mathf.Lerp(1, 0.5, var_312_15)
					local var_312_17 = arg_309_1.var_.highlightMatValue10029
					local var_312_18 = var_312_17.color

					var_312_18.r = var_312_16
					var_312_18.g = var_312_16
					var_312_18.b = var_312_16
					var_312_17.color = var_312_18
				end
			end

			if arg_309_1.time_ >= var_312_12 + var_312_14 and arg_309_1.time_ < var_312_12 + var_312_14 + arg_312_0 and arg_309_1.var_.highlightMatValue10029 then
				local var_312_19 = 0.5
				local var_312_20 = arg_309_1.var_.highlightMatValue10029
				local var_312_21 = var_312_20.color

				var_312_21.r = var_312_19
				var_312_21.g = var_312_19
				var_312_21.b = var_312_19
				var_312_20.color = var_312_21
			end

			local var_312_22 = 0
			local var_312_23 = 0.7

			if var_312_22 < arg_309_1.time_ and arg_309_1.time_ <= var_312_22 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_24 = arg_309_1:FormatText(StoryNameCfg[94].name)

				arg_309_1.leftNameTxt_.text = var_312_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_25 = arg_309_1:GetWordFromCfg(115311077)
				local var_312_26 = arg_309_1:FormatText(var_312_25.content)

				arg_309_1.text_.text = var_312_26

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_27 = 28
				local var_312_28 = utf8.len(var_312_26)
				local var_312_29 = var_312_27 <= 0 and var_312_23 or var_312_23 * (var_312_28 / var_312_27)

				if var_312_29 > 0 and var_312_23 < var_312_29 then
					arg_309_1.talkMaxDuration = var_312_29

					if var_312_29 + var_312_22 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_29 + var_312_22
					end
				end

				arg_309_1.text_.text = var_312_26
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311077", "story_v_out_115311.awb") ~= 0 then
					local var_312_30 = manager.audio:GetVoiceLength("story_v_out_115311", "115311077", "story_v_out_115311.awb") / 1000

					if var_312_30 + var_312_22 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_30 + var_312_22
					end

					if var_312_25.prefab_name ~= "" and arg_309_1.actors_[var_312_25.prefab_name] ~= nil then
						local var_312_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_309_1.actors_[var_312_25.prefab_name].transform, "story_v_out_115311", "115311077", "story_v_out_115311.awb")

						arg_309_1:RecordAudio("115311077", var_312_31)
						arg_309_1:RecordAudio("115311077", var_312_31)
					else
						arg_309_1:AudioAction("play", "voice", "story_v_out_115311", "115311077", "story_v_out_115311.awb")
					end

					arg_309_1:RecordHistoryTalkVoice("story_v_out_115311", "115311077", "story_v_out_115311.awb")
				end

				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_32 = math.max(var_312_23, arg_309_1.talkMaxDuration)

			if var_312_22 <= arg_309_1.time_ and arg_309_1.time_ < var_312_22 + var_312_32 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_22) / var_312_32

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_22 + var_312_32 and arg_309_1.time_ < var_312_22 + var_312_32 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play115311078 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 115311078
		arg_313_1.duration_ = 5

		SetActive(arg_313_1.tipsGo_, false)

		function arg_313_1.onSingleLineFinish_()
			arg_313_1.onSingleLineUpdate_ = nil
			arg_313_1.onSingleLineFinish_ = nil
			arg_313_1.state_ = "waiting"
		end

		function arg_313_1.playNext_(arg_315_0)
			if arg_315_0 == 1 then
				arg_313_0:Play115311079(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = arg_313_1.actors_["113801_1"]
			local var_316_1 = 0

			if var_316_1 < arg_313_1.time_ and arg_313_1.time_ <= var_316_1 + arg_316_0 then
				local var_316_2 = var_316_0:GetComponent("Image")

				if var_316_2 then
					arg_313_1.var_.highlightMatValue113801_1 = var_316_2
				end
			end

			local var_316_3 = 0.2

			if var_316_1 <= arg_313_1.time_ and arg_313_1.time_ < var_316_1 + var_316_3 then
				local var_316_4 = (arg_313_1.time_ - var_316_1) / var_316_3

				if arg_313_1.var_.highlightMatValue113801_1 then
					local var_316_5 = Mathf.Lerp(1, 0.5, var_316_4)
					local var_316_6 = arg_313_1.var_.highlightMatValue113801_1
					local var_316_7 = var_316_6.color

					var_316_7.r = var_316_5
					var_316_7.g = var_316_5
					var_316_7.b = var_316_5
					var_316_6.color = var_316_7
				end
			end

			if arg_313_1.time_ >= var_316_1 + var_316_3 and arg_313_1.time_ < var_316_1 + var_316_3 + arg_316_0 and arg_313_1.var_.highlightMatValue113801_1 then
				local var_316_8 = 0.5
				local var_316_9 = arg_313_1.var_.highlightMatValue113801_1
				local var_316_10 = var_316_9.color

				var_316_10.r = var_316_8
				var_316_10.g = var_316_8
				var_316_10.b = var_316_8
				var_316_9.color = var_316_10
			end

			local var_316_11 = 0
			local var_316_12 = 1.4

			if var_316_11 < arg_313_1.time_ and arg_313_1.time_ <= var_316_11 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, false)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_313_1.iconTrs_.gameObject, false)
				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_13 = arg_313_1:GetWordFromCfg(115311078)
				local var_316_14 = arg_313_1:FormatText(var_316_13.content)

				arg_313_1.text_.text = var_316_14

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_15 = 56
				local var_316_16 = utf8.len(var_316_14)
				local var_316_17 = var_316_15 <= 0 and var_316_12 or var_316_12 * (var_316_16 / var_316_15)

				if var_316_17 > 0 and var_316_12 < var_316_17 then
					arg_313_1.talkMaxDuration = var_316_17

					if var_316_17 + var_316_11 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_17 + var_316_11
					end
				end

				arg_313_1.text_.text = var_316_14
				arg_313_1.typewritter.percent = 0

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(false)
				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_18 = math.max(var_316_12, arg_313_1.talkMaxDuration)

			if var_316_11 <= arg_313_1.time_ and arg_313_1.time_ < var_316_11 + var_316_18 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_11) / var_316_18

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_11 + var_316_18 and arg_313_1.time_ < var_316_11 + var_316_18 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play115311079 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 115311079
		arg_317_1.duration_ = 7.233

		local var_317_0 = {
			ja = 6.2,
			ko = 7.233,
			zh = 7.2,
			en = 5.8
		}
		local var_317_1 = manager.audio:GetLocalizationFlag()

		if var_317_0[var_317_1] ~= nil then
			arg_317_1.duration_ = var_317_0[var_317_1]
		end

		SetActive(arg_317_1.tipsGo_, false)

		function arg_317_1.onSingleLineFinish_()
			arg_317_1.onSingleLineUpdate_ = nil
			arg_317_1.onSingleLineFinish_ = nil
			arg_317_1.state_ = "waiting"
		end

		function arg_317_1.playNext_(arg_319_0)
			if arg_319_0 == 1 then
				arg_317_0:Play115311080(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = arg_317_1.actors_["113801_1"]
			local var_320_1 = 0

			if var_320_1 < arg_317_1.time_ and arg_317_1.time_ <= var_320_1 + arg_320_0 then
				local var_320_2 = var_320_0:GetComponent("Image")

				if var_320_2 then
					arg_317_1.var_.highlightMatValue113801_1 = var_320_2
				end
			end

			local var_320_3 = 0.2

			if var_320_1 <= arg_317_1.time_ and arg_317_1.time_ < var_320_1 + var_320_3 then
				local var_320_4 = (arg_317_1.time_ - var_320_1) / var_320_3

				if arg_317_1.var_.highlightMatValue113801_1 then
					local var_320_5 = Mathf.Lerp(0.5, 1, var_320_4)
					local var_320_6 = arg_317_1.var_.highlightMatValue113801_1
					local var_320_7 = var_320_6.color

					var_320_7.r = var_320_5
					var_320_7.g = var_320_5
					var_320_7.b = var_320_5
					var_320_6.color = var_320_7
				end
			end

			if arg_317_1.time_ >= var_320_1 + var_320_3 and arg_317_1.time_ < var_320_1 + var_320_3 + arg_320_0 and arg_317_1.var_.highlightMatValue113801_1 then
				local var_320_8 = 1

				var_320_0.transform:SetSiblingIndex(1)

				local var_320_9 = arg_317_1.var_.highlightMatValue113801_1
				local var_320_10 = var_320_9.color

				var_320_10.r = var_320_8
				var_320_10.g = var_320_8
				var_320_10.b = var_320_8
				var_320_9.color = var_320_10
			end

			local var_320_11 = 0
			local var_320_12 = 0.675

			if var_320_11 < arg_317_1.time_ and arg_317_1.time_ <= var_320_11 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, true)

				local var_320_13 = arg_317_1:FormatText(StoryNameCfg[94].name)

				arg_317_1.leftNameTxt_.text = var_320_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_317_1.leftNameTxt_.transform)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1.leftNameTxt_.text)
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_14 = arg_317_1:GetWordFromCfg(115311079)
				local var_320_15 = arg_317_1:FormatText(var_320_14.content)

				arg_317_1.text_.text = var_320_15

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_16 = 27
				local var_320_17 = utf8.len(var_320_15)
				local var_320_18 = var_320_16 <= 0 and var_320_12 or var_320_12 * (var_320_17 / var_320_16)

				if var_320_18 > 0 and var_320_12 < var_320_18 then
					arg_317_1.talkMaxDuration = var_320_18

					if var_320_18 + var_320_11 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_18 + var_320_11
					end
				end

				arg_317_1.text_.text = var_320_15
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311079", "story_v_out_115311.awb") ~= 0 then
					local var_320_19 = manager.audio:GetVoiceLength("story_v_out_115311", "115311079", "story_v_out_115311.awb") / 1000

					if var_320_19 + var_320_11 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_19 + var_320_11
					end

					if var_320_14.prefab_name ~= "" and arg_317_1.actors_[var_320_14.prefab_name] ~= nil then
						local var_320_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_317_1.actors_[var_320_14.prefab_name].transform, "story_v_out_115311", "115311079", "story_v_out_115311.awb")

						arg_317_1:RecordAudio("115311079", var_320_20)
						arg_317_1:RecordAudio("115311079", var_320_20)
					else
						arg_317_1:AudioAction("play", "voice", "story_v_out_115311", "115311079", "story_v_out_115311.awb")
					end

					arg_317_1:RecordHistoryTalkVoice("story_v_out_115311", "115311079", "story_v_out_115311.awb")
				end

				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_21 = math.max(var_320_12, arg_317_1.talkMaxDuration)

			if var_320_11 <= arg_317_1.time_ and arg_317_1.time_ < var_320_11 + var_320_21 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_11) / var_320_21

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_11 + var_320_21 and arg_317_1.time_ < var_320_11 + var_320_21 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play115311080 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 115311080
		arg_321_1.duration_ = 7.466

		local var_321_0 = {
			ja = 4.066,
			ko = 6.433,
			zh = 5.8,
			en = 7.466
		}
		local var_321_1 = manager.audio:GetLocalizationFlag()

		if var_321_0[var_321_1] ~= nil then
			arg_321_1.duration_ = var_321_0[var_321_1]
		end

		SetActive(arg_321_1.tipsGo_, false)

		function arg_321_1.onSingleLineFinish_()
			arg_321_1.onSingleLineUpdate_ = nil
			arg_321_1.onSingleLineFinish_ = nil
			arg_321_1.state_ = "waiting"
		end

		function arg_321_1.playNext_(arg_323_0)
			if arg_323_0 == 1 then
				arg_321_0:Play115311081(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = arg_321_1.actors_["113801_1"]
			local var_324_1 = 0

			if var_324_1 < arg_321_1.time_ and arg_321_1.time_ <= var_324_1 + arg_324_0 then
				local var_324_2 = var_324_0:GetComponent("Image")

				if var_324_2 then
					arg_321_1.var_.highlightMatValue113801_1 = var_324_2
				end
			end

			local var_324_3 = 0.2

			if var_324_1 <= arg_321_1.time_ and arg_321_1.time_ < var_324_1 + var_324_3 then
				local var_324_4 = (arg_321_1.time_ - var_324_1) / var_324_3

				if arg_321_1.var_.highlightMatValue113801_1 then
					local var_324_5 = Mathf.Lerp(1, 0.5, var_324_4)
					local var_324_6 = arg_321_1.var_.highlightMatValue113801_1
					local var_324_7 = var_324_6.color

					var_324_7.r = var_324_5
					var_324_7.g = var_324_5
					var_324_7.b = var_324_5
					var_324_6.color = var_324_7
				end
			end

			if arg_321_1.time_ >= var_324_1 + var_324_3 and arg_321_1.time_ < var_324_1 + var_324_3 + arg_324_0 and arg_321_1.var_.highlightMatValue113801_1 then
				local var_324_8 = 0.5
				local var_324_9 = arg_321_1.var_.highlightMatValue113801_1
				local var_324_10 = var_324_9.color

				var_324_10.r = var_324_8
				var_324_10.g = var_324_8
				var_324_10.b = var_324_8
				var_324_9.color = var_324_10
			end

			local var_324_11 = arg_321_1.actors_["10029"]
			local var_324_12 = 0

			if var_324_12 < arg_321_1.time_ and arg_321_1.time_ <= var_324_12 + arg_324_0 then
				local var_324_13 = var_324_11:GetComponent("Image")

				if var_324_13 then
					arg_321_1.var_.highlightMatValue10029 = var_324_13
				end
			end

			local var_324_14 = 0.2

			if var_324_12 <= arg_321_1.time_ and arg_321_1.time_ < var_324_12 + var_324_14 then
				local var_324_15 = (arg_321_1.time_ - var_324_12) / var_324_14

				if arg_321_1.var_.highlightMatValue10029 then
					local var_324_16 = Mathf.Lerp(0.5, 1, var_324_15)
					local var_324_17 = arg_321_1.var_.highlightMatValue10029
					local var_324_18 = var_324_17.color

					var_324_18.r = var_324_16
					var_324_18.g = var_324_16
					var_324_18.b = var_324_16
					var_324_17.color = var_324_18
				end
			end

			if arg_321_1.time_ >= var_324_12 + var_324_14 and arg_321_1.time_ < var_324_12 + var_324_14 + arg_324_0 and arg_321_1.var_.highlightMatValue10029 then
				local var_324_19 = 1

				var_324_11.transform:SetSiblingIndex(1)

				local var_324_20 = arg_321_1.var_.highlightMatValue10029
				local var_324_21 = var_324_20.color

				var_324_21.r = var_324_19
				var_324_21.g = var_324_19
				var_324_21.b = var_324_19
				var_324_20.color = var_324_21
			end

			local var_324_22 = 0
			local var_324_23 = 0.5

			if var_324_22 < arg_321_1.time_ and arg_321_1.time_ <= var_324_22 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, true)

				local var_324_24 = arg_321_1:FormatText(StoryNameCfg[312].name)

				arg_321_1.leftNameTxt_.text = var_324_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_321_1.leftNameTxt_.transform)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1.leftNameTxt_.text)
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_25 = arg_321_1:GetWordFromCfg(115311080)
				local var_324_26 = arg_321_1:FormatText(var_324_25.content)

				arg_321_1.text_.text = var_324_26

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_27 = 20
				local var_324_28 = utf8.len(var_324_26)
				local var_324_29 = var_324_27 <= 0 and var_324_23 or var_324_23 * (var_324_28 / var_324_27)

				if var_324_29 > 0 and var_324_23 < var_324_29 then
					arg_321_1.talkMaxDuration = var_324_29

					if var_324_29 + var_324_22 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_29 + var_324_22
					end
				end

				arg_321_1.text_.text = var_324_26
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311080", "story_v_out_115311.awb") ~= 0 then
					local var_324_30 = manager.audio:GetVoiceLength("story_v_out_115311", "115311080", "story_v_out_115311.awb") / 1000

					if var_324_30 + var_324_22 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_30 + var_324_22
					end

					if var_324_25.prefab_name ~= "" and arg_321_1.actors_[var_324_25.prefab_name] ~= nil then
						local var_324_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_321_1.actors_[var_324_25.prefab_name].transform, "story_v_out_115311", "115311080", "story_v_out_115311.awb")

						arg_321_1:RecordAudio("115311080", var_324_31)
						arg_321_1:RecordAudio("115311080", var_324_31)
					else
						arg_321_1:AudioAction("play", "voice", "story_v_out_115311", "115311080", "story_v_out_115311.awb")
					end

					arg_321_1:RecordHistoryTalkVoice("story_v_out_115311", "115311080", "story_v_out_115311.awb")
				end

				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_32 = math.max(var_324_23, arg_321_1.talkMaxDuration)

			if var_324_22 <= arg_321_1.time_ and arg_321_1.time_ < var_324_22 + var_324_32 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_22) / var_324_32

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_22 + var_324_32 and arg_321_1.time_ < var_324_22 + var_324_32 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play115311081 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 115311081
		arg_325_1.duration_ = 14.333

		local var_325_0 = {
			ja = 12.9,
			ko = 14.333,
			zh = 10.066,
			en = 13
		}
		local var_325_1 = manager.audio:GetLocalizationFlag()

		if var_325_0[var_325_1] ~= nil then
			arg_325_1.duration_ = var_325_0[var_325_1]
		end

		SetActive(arg_325_1.tipsGo_, false)

		function arg_325_1.onSingleLineFinish_()
			arg_325_1.onSingleLineUpdate_ = nil
			arg_325_1.onSingleLineFinish_ = nil
			arg_325_1.state_ = "waiting"
		end

		function arg_325_1.playNext_(arg_327_0)
			if arg_327_0 == 1 then
				arg_325_0:Play115311082(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = 0
			local var_328_1 = 1.15

			if var_328_0 < arg_325_1.time_ and arg_325_1.time_ <= var_328_0 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, true)

				local var_328_2 = arg_325_1:FormatText(StoryNameCfg[312].name)

				arg_325_1.leftNameTxt_.text = var_328_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_325_1.leftNameTxt_.transform)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1.leftNameTxt_.text)
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_3 = arg_325_1:GetWordFromCfg(115311081)
				local var_328_4 = arg_325_1:FormatText(var_328_3.content)

				arg_325_1.text_.text = var_328_4

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_5 = 45
				local var_328_6 = utf8.len(var_328_4)
				local var_328_7 = var_328_5 <= 0 and var_328_1 or var_328_1 * (var_328_6 / var_328_5)

				if var_328_7 > 0 and var_328_1 < var_328_7 then
					arg_325_1.talkMaxDuration = var_328_7

					if var_328_7 + var_328_0 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_7 + var_328_0
					end
				end

				arg_325_1.text_.text = var_328_4
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311081", "story_v_out_115311.awb") ~= 0 then
					local var_328_8 = manager.audio:GetVoiceLength("story_v_out_115311", "115311081", "story_v_out_115311.awb") / 1000

					if var_328_8 + var_328_0 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_8 + var_328_0
					end

					if var_328_3.prefab_name ~= "" and arg_325_1.actors_[var_328_3.prefab_name] ~= nil then
						local var_328_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_325_1.actors_[var_328_3.prefab_name].transform, "story_v_out_115311", "115311081", "story_v_out_115311.awb")

						arg_325_1:RecordAudio("115311081", var_328_9)
						arg_325_1:RecordAudio("115311081", var_328_9)
					else
						arg_325_1:AudioAction("play", "voice", "story_v_out_115311", "115311081", "story_v_out_115311.awb")
					end

					arg_325_1:RecordHistoryTalkVoice("story_v_out_115311", "115311081", "story_v_out_115311.awb")
				end

				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_10 = math.max(var_328_1, arg_325_1.talkMaxDuration)

			if var_328_0 <= arg_325_1.time_ and arg_325_1.time_ < var_328_0 + var_328_10 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_0) / var_328_10

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_0 + var_328_10 and arg_325_1.time_ < var_328_0 + var_328_10 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play115311082 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 115311082
		arg_329_1.duration_ = 5

		SetActive(arg_329_1.tipsGo_, false)

		function arg_329_1.onSingleLineFinish_()
			arg_329_1.onSingleLineUpdate_ = nil
			arg_329_1.onSingleLineFinish_ = nil
			arg_329_1.state_ = "waiting"
		end

		function arg_329_1.playNext_(arg_331_0)
			if arg_331_0 == 1 then
				arg_329_0:Play115311083(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = arg_329_1.actors_["10029"]
			local var_332_1 = 0

			if var_332_1 < arg_329_1.time_ and arg_329_1.time_ <= var_332_1 + arg_332_0 then
				local var_332_2 = var_332_0:GetComponent("Image")

				if var_332_2 then
					arg_329_1.var_.highlightMatValue10029 = var_332_2
				end
			end

			local var_332_3 = 0.2

			if var_332_1 <= arg_329_1.time_ and arg_329_1.time_ < var_332_1 + var_332_3 then
				local var_332_4 = (arg_329_1.time_ - var_332_1) / var_332_3

				if arg_329_1.var_.highlightMatValue10029 then
					local var_332_5 = Mathf.Lerp(1, 0.5, var_332_4)
					local var_332_6 = arg_329_1.var_.highlightMatValue10029
					local var_332_7 = var_332_6.color

					var_332_7.r = var_332_5
					var_332_7.g = var_332_5
					var_332_7.b = var_332_5
					var_332_6.color = var_332_7
				end
			end

			if arg_329_1.time_ >= var_332_1 + var_332_3 and arg_329_1.time_ < var_332_1 + var_332_3 + arg_332_0 and arg_329_1.var_.highlightMatValue10029 then
				local var_332_8 = 0.5
				local var_332_9 = arg_329_1.var_.highlightMatValue10029
				local var_332_10 = var_332_9.color

				var_332_10.r = var_332_8
				var_332_10.g = var_332_8
				var_332_10.b = var_332_8
				var_332_9.color = var_332_10
			end

			local var_332_11 = 0
			local var_332_12 = 1

			if var_332_11 < arg_329_1.time_ and arg_329_1.time_ <= var_332_11 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, false)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_13 = arg_329_1:GetWordFromCfg(115311082)
				local var_332_14 = arg_329_1:FormatText(var_332_13.content)

				arg_329_1.text_.text = var_332_14

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_15 = 40
				local var_332_16 = utf8.len(var_332_14)
				local var_332_17 = var_332_15 <= 0 and var_332_12 or var_332_12 * (var_332_16 / var_332_15)

				if var_332_17 > 0 and var_332_12 < var_332_17 then
					arg_329_1.talkMaxDuration = var_332_17

					if var_332_17 + var_332_11 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_17 + var_332_11
					end
				end

				arg_329_1.text_.text = var_332_14
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)
				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_18 = math.max(var_332_12, arg_329_1.talkMaxDuration)

			if var_332_11 <= arg_329_1.time_ and arg_329_1.time_ < var_332_11 + var_332_18 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_11) / var_332_18

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_11 + var_332_18 and arg_329_1.time_ < var_332_11 + var_332_18 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play115311083 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 115311083
		arg_333_1.duration_ = 2.866

		local var_333_0 = {
			ja = 2.866,
			ko = 2.533,
			zh = 2.566,
			en = 2.3
		}
		local var_333_1 = manager.audio:GetLocalizationFlag()

		if var_333_0[var_333_1] ~= nil then
			arg_333_1.duration_ = var_333_0[var_333_1]
		end

		SetActive(arg_333_1.tipsGo_, false)

		function arg_333_1.onSingleLineFinish_()
			arg_333_1.onSingleLineUpdate_ = nil
			arg_333_1.onSingleLineFinish_ = nil
			arg_333_1.state_ = "waiting"
		end

		function arg_333_1.playNext_(arg_335_0)
			if arg_335_0 == 1 then
				arg_333_0:Play115311084(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = arg_333_1.actors_["10029"]
			local var_336_1 = 0

			if var_336_1 < arg_333_1.time_ and arg_333_1.time_ <= var_336_1 + arg_336_0 then
				local var_336_2 = var_336_0:GetComponent("Image")

				if var_336_2 then
					arg_333_1.var_.alphaMatValue10029 = var_336_2
					arg_333_1.var_.alphaOldValue10029 = var_336_2.color.a
				end

				arg_333_1.var_.alphaOldValue10029 = 1
			end

			local var_336_3 = 0.5

			if var_336_1 <= arg_333_1.time_ and arg_333_1.time_ < var_336_1 + var_336_3 then
				local var_336_4 = (arg_333_1.time_ - var_336_1) / var_336_3
				local var_336_5 = Mathf.Lerp(arg_333_1.var_.alphaOldValue10029, 0, var_336_4)

				if arg_333_1.var_.alphaMatValue10029 then
					local var_336_6 = arg_333_1.var_.alphaMatValue10029.color

					var_336_6.a = var_336_5
					arg_333_1.var_.alphaMatValue10029.color = var_336_6
				end
			end

			if arg_333_1.time_ >= var_336_1 + var_336_3 and arg_333_1.time_ < var_336_1 + var_336_3 + arg_336_0 and arg_333_1.var_.alphaMatValue10029 then
				local var_336_7 = arg_333_1.var_.alphaMatValue10029
				local var_336_8 = var_336_7.color

				var_336_8.a = 0
				var_336_7.color = var_336_8
			end

			local var_336_9 = arg_333_1.actors_["113801_1"]
			local var_336_10 = 0

			if var_336_10 < arg_333_1.time_ and arg_333_1.time_ <= var_336_10 + arg_336_0 then
				local var_336_11 = var_336_9:GetComponent("Image")

				if var_336_11 then
					arg_333_1.var_.alphaMatValue113801_1 = var_336_11
					arg_333_1.var_.alphaOldValue113801_1 = var_336_11.color.a
				end

				arg_333_1.var_.alphaOldValue113801_1 = 1
			end

			local var_336_12 = 0.5

			if var_336_10 <= arg_333_1.time_ and arg_333_1.time_ < var_336_10 + var_336_12 then
				local var_336_13 = (arg_333_1.time_ - var_336_10) / var_336_12
				local var_336_14 = Mathf.Lerp(arg_333_1.var_.alphaOldValue113801_1, 0, var_336_13)

				if arg_333_1.var_.alphaMatValue113801_1 then
					local var_336_15 = arg_333_1.var_.alphaMatValue113801_1.color

					var_336_15.a = var_336_14
					arg_333_1.var_.alphaMatValue113801_1.color = var_336_15
				end
			end

			if arg_333_1.time_ >= var_336_10 + var_336_12 and arg_333_1.time_ < var_336_10 + var_336_12 + arg_336_0 and arg_333_1.var_.alphaMatValue113801_1 then
				local var_336_16 = arg_333_1.var_.alphaMatValue113801_1
				local var_336_17 = var_336_16.color

				var_336_17.a = 0
				var_336_16.color = var_336_17
			end

			local var_336_18 = 0
			local var_336_19 = 0.225

			if var_336_18 < arg_333_1.time_ and arg_333_1.time_ <= var_336_18 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, true)

				local var_336_20 = arg_333_1:FormatText(StoryNameCfg[316].name)

				arg_333_1.leftNameTxt_.text = var_336_20

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_333_1.leftNameTxt_.transform)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1.leftNameTxt_.text)
				SetActive(arg_333_1.iconTrs_.gameObject, true)
				arg_333_1.iconController_:SetSelectedState("hero")

				arg_333_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenmb")

				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_21 = arg_333_1:GetWordFromCfg(115311083)
				local var_336_22 = arg_333_1:FormatText(var_336_21.content)

				arg_333_1.text_.text = var_336_22

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_23 = 9
				local var_336_24 = utf8.len(var_336_22)
				local var_336_25 = var_336_23 <= 0 and var_336_19 or var_336_19 * (var_336_24 / var_336_23)

				if var_336_25 > 0 and var_336_19 < var_336_25 then
					arg_333_1.talkMaxDuration = var_336_25

					if var_336_25 + var_336_18 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_25 + var_336_18
					end
				end

				arg_333_1.text_.text = var_336_22
				arg_333_1.typewritter.percent = 0

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311083", "story_v_out_115311.awb") ~= 0 then
					local var_336_26 = manager.audio:GetVoiceLength("story_v_out_115311", "115311083", "story_v_out_115311.awb") / 1000

					if var_336_26 + var_336_18 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_26 + var_336_18
					end

					if var_336_21.prefab_name ~= "" and arg_333_1.actors_[var_336_21.prefab_name] ~= nil then
						local var_336_27 = LuaForUtil.PlayVoiceWithCriLipsync(arg_333_1.actors_[var_336_21.prefab_name].transform, "story_v_out_115311", "115311083", "story_v_out_115311.awb")

						arg_333_1:RecordAudio("115311083", var_336_27)
						arg_333_1:RecordAudio("115311083", var_336_27)
					else
						arg_333_1:AudioAction("play", "voice", "story_v_out_115311", "115311083", "story_v_out_115311.awb")
					end

					arg_333_1:RecordHistoryTalkVoice("story_v_out_115311", "115311083", "story_v_out_115311.awb")
				end

				arg_333_1:RecordContent(arg_333_1.text_.text)
			end

			local var_336_28 = math.max(var_336_19, arg_333_1.talkMaxDuration)

			if var_336_18 <= arg_333_1.time_ and arg_333_1.time_ < var_336_18 + var_336_28 then
				arg_333_1.typewritter.percent = (arg_333_1.time_ - var_336_18) / var_336_28

				arg_333_1.typewritter:SetDirty()
			end

			if arg_333_1.time_ >= var_336_18 + var_336_28 and arg_333_1.time_ < var_336_18 + var_336_28 + arg_336_0 then
				arg_333_1.typewritter.percent = 1

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(true)
			end
		end
	end,
	Play115311084 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 115311084
		arg_337_1.duration_ = 6.1

		local var_337_0 = {
			ja = 6.1,
			ko = 5.366,
			zh = 4,
			en = 5.366
		}
		local var_337_1 = manager.audio:GetLocalizationFlag()

		if var_337_0[var_337_1] ~= nil then
			arg_337_1.duration_ = var_337_0[var_337_1]
		end

		SetActive(arg_337_1.tipsGo_, false)

		function arg_337_1.onSingleLineFinish_()
			arg_337_1.onSingleLineUpdate_ = nil
			arg_337_1.onSingleLineFinish_ = nil
			arg_337_1.state_ = "waiting"
		end

		function arg_337_1.playNext_(arg_339_0)
			if arg_339_0 == 1 then
				arg_337_0:Play115311085(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = 0
			local var_340_1 = 0.55

			if var_340_0 < arg_337_1.time_ and arg_337_1.time_ <= var_340_0 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, true)

				local var_340_2 = arg_337_1:FormatText(StoryNameCfg[104].name)

				arg_337_1.leftNameTxt_.text = var_340_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_337_1.leftNameTxt_.transform)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1.leftNameTxt_.text)
				SetActive(arg_337_1.iconTrs_.gameObject, true)
				arg_337_1.iconController_:SetSelectedState("hero")

				arg_337_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_woundedd")

				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_3 = arg_337_1:GetWordFromCfg(115311084)
				local var_340_4 = arg_337_1:FormatText(var_340_3.content)

				arg_337_1.text_.text = var_340_4

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_5 = 22
				local var_340_6 = utf8.len(var_340_4)
				local var_340_7 = var_340_5 <= 0 and var_340_1 or var_340_1 * (var_340_6 / var_340_5)

				if var_340_7 > 0 and var_340_1 < var_340_7 then
					arg_337_1.talkMaxDuration = var_340_7

					if var_340_7 + var_340_0 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_7 + var_340_0
					end
				end

				arg_337_1.text_.text = var_340_4
				arg_337_1.typewritter.percent = 0

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311084", "story_v_out_115311.awb") ~= 0 then
					local var_340_8 = manager.audio:GetVoiceLength("story_v_out_115311", "115311084", "story_v_out_115311.awb") / 1000

					if var_340_8 + var_340_0 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_8 + var_340_0
					end

					if var_340_3.prefab_name ~= "" and arg_337_1.actors_[var_340_3.prefab_name] ~= nil then
						local var_340_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_337_1.actors_[var_340_3.prefab_name].transform, "story_v_out_115311", "115311084", "story_v_out_115311.awb")

						arg_337_1:RecordAudio("115311084", var_340_9)
						arg_337_1:RecordAudio("115311084", var_340_9)
					else
						arg_337_1:AudioAction("play", "voice", "story_v_out_115311", "115311084", "story_v_out_115311.awb")
					end

					arg_337_1:RecordHistoryTalkVoice("story_v_out_115311", "115311084", "story_v_out_115311.awb")
				end

				arg_337_1:RecordContent(arg_337_1.text_.text)
			end

			local var_340_10 = math.max(var_340_1, arg_337_1.talkMaxDuration)

			if var_340_0 <= arg_337_1.time_ and arg_337_1.time_ < var_340_0 + var_340_10 then
				arg_337_1.typewritter.percent = (arg_337_1.time_ - var_340_0) / var_340_10

				arg_337_1.typewritter:SetDirty()
			end

			if arg_337_1.time_ >= var_340_0 + var_340_10 and arg_337_1.time_ < var_340_0 + var_340_10 + arg_340_0 then
				arg_337_1.typewritter.percent = 1

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(true)
			end
		end
	end,
	Play115311085 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 115311085
		arg_341_1.duration_ = 5

		SetActive(arg_341_1.tipsGo_, false)

		function arg_341_1.onSingleLineFinish_()
			arg_341_1.onSingleLineUpdate_ = nil
			arg_341_1.onSingleLineFinish_ = nil
			arg_341_1.state_ = "waiting"
		end

		function arg_341_1.playNext_(arg_343_0)
			if arg_343_0 == 1 then
				arg_341_0:Play115311086(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = 0
			local var_344_1 = 1.5

			if var_344_0 < arg_341_1.time_ and arg_341_1.time_ <= var_344_0 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, false)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_341_1.iconTrs_.gameObject, false)
				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_2 = arg_341_1:GetWordFromCfg(115311085)
				local var_344_3 = arg_341_1:FormatText(var_344_2.content)

				arg_341_1.text_.text = var_344_3

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_4 = 60
				local var_344_5 = utf8.len(var_344_3)
				local var_344_6 = var_344_4 <= 0 and var_344_1 or var_344_1 * (var_344_5 / var_344_4)

				if var_344_6 > 0 and var_344_1 < var_344_6 then
					arg_341_1.talkMaxDuration = var_344_6

					if var_344_6 + var_344_0 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_6 + var_344_0
					end
				end

				arg_341_1.text_.text = var_344_3
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)
				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_7 = math.max(var_344_1, arg_341_1.talkMaxDuration)

			if var_344_0 <= arg_341_1.time_ and arg_341_1.time_ < var_344_0 + var_344_7 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_0) / var_344_7

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_0 + var_344_7 and arg_341_1.time_ < var_344_0 + var_344_7 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play115311086 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 115311086
		arg_345_1.duration_ = 5

		SetActive(arg_345_1.tipsGo_, false)

		function arg_345_1.onSingleLineFinish_()
			arg_345_1.onSingleLineUpdate_ = nil
			arg_345_1.onSingleLineFinish_ = nil
			arg_345_1.state_ = "waiting"
		end

		function arg_345_1.playNext_(arg_347_0)
			if arg_347_0 == 1 then
				arg_345_0:Play115311087(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = 0
			local var_348_1 = 1.15

			if var_348_0 < arg_345_1.time_ and arg_345_1.time_ <= var_348_0 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0
				arg_345_1.dialogCg_.alpha = 1

				arg_345_1.dialog_:SetActive(true)
				SetActive(arg_345_1.leftNameGo_, false)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_345_1.iconTrs_.gameObject, false)
				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_2 = arg_345_1:GetWordFromCfg(115311086)
				local var_348_3 = arg_345_1:FormatText(var_348_2.content)

				arg_345_1.text_.text = var_348_3

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_4 = 46
				local var_348_5 = utf8.len(var_348_3)
				local var_348_6 = var_348_4 <= 0 and var_348_1 or var_348_1 * (var_348_5 / var_348_4)

				if var_348_6 > 0 and var_348_1 < var_348_6 then
					arg_345_1.talkMaxDuration = var_348_6

					if var_348_6 + var_348_0 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_6 + var_348_0
					end
				end

				arg_345_1.text_.text = var_348_3
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)
				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_7 = math.max(var_348_1, arg_345_1.talkMaxDuration)

			if var_348_0 <= arg_345_1.time_ and arg_345_1.time_ < var_348_0 + var_348_7 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_0) / var_348_7

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_0 + var_348_7 and arg_345_1.time_ < var_348_0 + var_348_7 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play115311087 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 115311087
		arg_349_1.duration_ = 7.766

		local var_349_0 = {
			ja = 6.7,
			ko = 7.766,
			zh = 7.166,
			en = 5.366
		}
		local var_349_1 = manager.audio:GetLocalizationFlag()

		if var_349_0[var_349_1] ~= nil then
			arg_349_1.duration_ = var_349_0[var_349_1]
		end

		SetActive(arg_349_1.tipsGo_, false)

		function arg_349_1.onSingleLineFinish_()
			arg_349_1.onSingleLineUpdate_ = nil
			arg_349_1.onSingleLineFinish_ = nil
			arg_349_1.state_ = "waiting"
		end

		function arg_349_1.playNext_(arg_351_0)
			if arg_351_0 == 1 then
				arg_349_0:Play115311088(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = arg_349_1.actors_["10029"]
			local var_352_1 = 0

			if var_352_1 < arg_349_1.time_ and arg_349_1.time_ <= var_352_1 + arg_352_0 then
				local var_352_2 = var_352_0:GetComponent("Image")

				if var_352_2 then
					arg_349_1.var_.alphaMatValue10029 = var_352_2
					arg_349_1.var_.alphaOldValue10029 = var_352_2.color.a
				end

				arg_349_1.var_.alphaOldValue10029 = 0
			end

			local var_352_3 = 0.5

			if var_352_1 <= arg_349_1.time_ and arg_349_1.time_ < var_352_1 + var_352_3 then
				local var_352_4 = (arg_349_1.time_ - var_352_1) / var_352_3
				local var_352_5 = Mathf.Lerp(arg_349_1.var_.alphaOldValue10029, 1, var_352_4)

				if arg_349_1.var_.alphaMatValue10029 then
					local var_352_6 = arg_349_1.var_.alphaMatValue10029.color

					var_352_6.a = var_352_5
					arg_349_1.var_.alphaMatValue10029.color = var_352_6
				end
			end

			if arg_349_1.time_ >= var_352_1 + var_352_3 and arg_349_1.time_ < var_352_1 + var_352_3 + arg_352_0 and arg_349_1.var_.alphaMatValue10029 then
				local var_352_7 = arg_349_1.var_.alphaMatValue10029
				local var_352_8 = var_352_7.color

				var_352_8.a = 1
				var_352_7.color = var_352_8
			end

			local var_352_9 = arg_349_1.actors_["113801_1"]
			local var_352_10 = 0

			if var_352_10 < arg_349_1.time_ and arg_349_1.time_ <= var_352_10 + arg_352_0 then
				local var_352_11 = var_352_9:GetComponent("Image")

				if var_352_11 then
					arg_349_1.var_.alphaMatValue113801_1 = var_352_11
					arg_349_1.var_.alphaOldValue113801_1 = var_352_11.color.a
				end

				arg_349_1.var_.alphaOldValue113801_1 = 0
			end

			local var_352_12 = 0.5

			if var_352_10 <= arg_349_1.time_ and arg_349_1.time_ < var_352_10 + var_352_12 then
				local var_352_13 = (arg_349_1.time_ - var_352_10) / var_352_12
				local var_352_14 = Mathf.Lerp(arg_349_1.var_.alphaOldValue113801_1, 1, var_352_13)

				if arg_349_1.var_.alphaMatValue113801_1 then
					local var_352_15 = arg_349_1.var_.alphaMatValue113801_1.color

					var_352_15.a = var_352_14
					arg_349_1.var_.alphaMatValue113801_1.color = var_352_15
				end
			end

			if arg_349_1.time_ >= var_352_10 + var_352_12 and arg_349_1.time_ < var_352_10 + var_352_12 + arg_352_0 and arg_349_1.var_.alphaMatValue113801_1 then
				local var_352_16 = arg_349_1.var_.alphaMatValue113801_1
				local var_352_17 = var_352_16.color

				var_352_17.a = 1
				var_352_16.color = var_352_17
			end

			local var_352_18 = arg_349_1.actors_["113801_1"]
			local var_352_19 = 0

			if var_352_19 < arg_349_1.time_ and arg_349_1.time_ <= var_352_19 + arg_352_0 then
				local var_352_20 = var_352_18:GetComponent("Image")

				if var_352_20 then
					arg_349_1.var_.highlightMatValue113801_1 = var_352_20
				end
			end

			local var_352_21 = 0.2

			if var_352_19 <= arg_349_1.time_ and arg_349_1.time_ < var_352_19 + var_352_21 then
				local var_352_22 = (arg_349_1.time_ - var_352_19) / var_352_21

				if arg_349_1.var_.highlightMatValue113801_1 then
					local var_352_23 = Mathf.Lerp(0.5, 1, var_352_22)
					local var_352_24 = arg_349_1.var_.highlightMatValue113801_1
					local var_352_25 = var_352_24.color

					var_352_25.r = var_352_23
					var_352_25.g = var_352_23
					var_352_25.b = var_352_23
					var_352_24.color = var_352_25
				end
			end

			if arg_349_1.time_ >= var_352_19 + var_352_21 and arg_349_1.time_ < var_352_19 + var_352_21 + arg_352_0 and arg_349_1.var_.highlightMatValue113801_1 then
				local var_352_26 = 1

				var_352_18.transform:SetSiblingIndex(1)

				local var_352_27 = arg_349_1.var_.highlightMatValue113801_1
				local var_352_28 = var_352_27.color

				var_352_28.r = var_352_26
				var_352_28.g = var_352_26
				var_352_28.b = var_352_26
				var_352_27.color = var_352_28
			end

			local var_352_29 = 0
			local var_352_30 = 0.575

			if var_352_29 < arg_349_1.time_ and arg_349_1.time_ <= var_352_29 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0
				arg_349_1.dialogCg_.alpha = 1

				arg_349_1.dialog_:SetActive(true)
				SetActive(arg_349_1.leftNameGo_, true)

				local var_352_31 = arg_349_1:FormatText(StoryNameCfg[94].name)

				arg_349_1.leftNameTxt_.text = var_352_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_349_1.leftNameTxt_.transform)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1.leftNameTxt_.text)
				SetActive(arg_349_1.iconTrs_.gameObject, false)
				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_32 = arg_349_1:GetWordFromCfg(115311087)
				local var_352_33 = arg_349_1:FormatText(var_352_32.content)

				arg_349_1.text_.text = var_352_33

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_34 = 23
				local var_352_35 = utf8.len(var_352_33)
				local var_352_36 = var_352_34 <= 0 and var_352_30 or var_352_30 * (var_352_35 / var_352_34)

				if var_352_36 > 0 and var_352_30 < var_352_36 then
					arg_349_1.talkMaxDuration = var_352_36

					if var_352_36 + var_352_29 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_36 + var_352_29
					end
				end

				arg_349_1.text_.text = var_352_33
				arg_349_1.typewritter.percent = 0

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311087", "story_v_out_115311.awb") ~= 0 then
					local var_352_37 = manager.audio:GetVoiceLength("story_v_out_115311", "115311087", "story_v_out_115311.awb") / 1000

					if var_352_37 + var_352_29 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_37 + var_352_29
					end

					if var_352_32.prefab_name ~= "" and arg_349_1.actors_[var_352_32.prefab_name] ~= nil then
						local var_352_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_349_1.actors_[var_352_32.prefab_name].transform, "story_v_out_115311", "115311087", "story_v_out_115311.awb")

						arg_349_1:RecordAudio("115311087", var_352_38)
						arg_349_1:RecordAudio("115311087", var_352_38)
					else
						arg_349_1:AudioAction("play", "voice", "story_v_out_115311", "115311087", "story_v_out_115311.awb")
					end

					arg_349_1:RecordHistoryTalkVoice("story_v_out_115311", "115311087", "story_v_out_115311.awb")
				end

				arg_349_1:RecordContent(arg_349_1.text_.text)
			end

			local var_352_39 = math.max(var_352_30, arg_349_1.talkMaxDuration)

			if var_352_29 <= arg_349_1.time_ and arg_349_1.time_ < var_352_29 + var_352_39 then
				arg_349_1.typewritter.percent = (arg_349_1.time_ - var_352_29) / var_352_39

				arg_349_1.typewritter:SetDirty()
			end

			if arg_349_1.time_ >= var_352_29 + var_352_39 and arg_349_1.time_ < var_352_29 + var_352_39 + arg_352_0 then
				arg_349_1.typewritter.percent = 1

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(true)
			end
		end
	end,
	Play115311088 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 115311088
		arg_353_1.duration_ = 20.533

		local var_353_0 = {
			ja = 20.533,
			ko = 12.133,
			zh = 14.733,
			en = 16.2
		}
		local var_353_1 = manager.audio:GetLocalizationFlag()

		if var_353_0[var_353_1] ~= nil then
			arg_353_1.duration_ = var_353_0[var_353_1]
		end

		SetActive(arg_353_1.tipsGo_, false)

		function arg_353_1.onSingleLineFinish_()
			arg_353_1.onSingleLineUpdate_ = nil
			arg_353_1.onSingleLineFinish_ = nil
			arg_353_1.state_ = "waiting"
		end

		function arg_353_1.playNext_(arg_355_0)
			if arg_355_0 == 1 then
				arg_353_0:Play115311089(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = 0
			local var_356_1 = 1.2

			if var_356_0 < arg_353_1.time_ and arg_353_1.time_ <= var_356_0 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0
				arg_353_1.dialogCg_.alpha = 1

				arg_353_1.dialog_:SetActive(true)
				SetActive(arg_353_1.leftNameGo_, true)

				local var_356_2 = arg_353_1:FormatText(StoryNameCfg[94].name)

				arg_353_1.leftNameTxt_.text = var_356_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_353_1.leftNameTxt_.transform)

				arg_353_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_353_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_353_1:RecordName(arg_353_1.leftNameTxt_.text)
				SetActive(arg_353_1.iconTrs_.gameObject, false)
				arg_353_1.callingController_:SetSelectedState("normal")

				local var_356_3 = arg_353_1:GetWordFromCfg(115311088)
				local var_356_4 = arg_353_1:FormatText(var_356_3.content)

				arg_353_1.text_.text = var_356_4

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.text_)

				local var_356_5 = 48
				local var_356_6 = utf8.len(var_356_4)
				local var_356_7 = var_356_5 <= 0 and var_356_1 or var_356_1 * (var_356_6 / var_356_5)

				if var_356_7 > 0 and var_356_1 < var_356_7 then
					arg_353_1.talkMaxDuration = var_356_7

					if var_356_7 + var_356_0 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_7 + var_356_0
					end
				end

				arg_353_1.text_.text = var_356_4
				arg_353_1.typewritter.percent = 0

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311088", "story_v_out_115311.awb") ~= 0 then
					local var_356_8 = manager.audio:GetVoiceLength("story_v_out_115311", "115311088", "story_v_out_115311.awb") / 1000

					if var_356_8 + var_356_0 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_8 + var_356_0
					end

					if var_356_3.prefab_name ~= "" and arg_353_1.actors_[var_356_3.prefab_name] ~= nil then
						local var_356_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_353_1.actors_[var_356_3.prefab_name].transform, "story_v_out_115311", "115311088", "story_v_out_115311.awb")

						arg_353_1:RecordAudio("115311088", var_356_9)
						arg_353_1:RecordAudio("115311088", var_356_9)
					else
						arg_353_1:AudioAction("play", "voice", "story_v_out_115311", "115311088", "story_v_out_115311.awb")
					end

					arg_353_1:RecordHistoryTalkVoice("story_v_out_115311", "115311088", "story_v_out_115311.awb")
				end

				arg_353_1:RecordContent(arg_353_1.text_.text)
			end

			local var_356_10 = math.max(var_356_1, arg_353_1.talkMaxDuration)

			if var_356_0 <= arg_353_1.time_ and arg_353_1.time_ < var_356_0 + var_356_10 then
				arg_353_1.typewritter.percent = (arg_353_1.time_ - var_356_0) / var_356_10

				arg_353_1.typewritter:SetDirty()
			end

			if arg_353_1.time_ >= var_356_0 + var_356_10 and arg_353_1.time_ < var_356_0 + var_356_10 + arg_356_0 then
				arg_353_1.typewritter.percent = 1

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(true)
			end
		end
	end,
	Play115311089 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 115311089
		arg_357_1.duration_ = 5

		SetActive(arg_357_1.tipsGo_, false)

		function arg_357_1.onSingleLineFinish_()
			arg_357_1.onSingleLineUpdate_ = nil
			arg_357_1.onSingleLineFinish_ = nil
			arg_357_1.state_ = "waiting"
		end

		function arg_357_1.playNext_(arg_359_0)
			if arg_359_0 == 1 then
				arg_357_0:Play115311090(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = arg_357_1.actors_["113801_1"]
			local var_360_1 = 0

			if var_360_1 < arg_357_1.time_ and arg_357_1.time_ <= var_360_1 + arg_360_0 then
				local var_360_2 = var_360_0:GetComponent("Image")

				if var_360_2 then
					arg_357_1.var_.highlightMatValue113801_1 = var_360_2
				end
			end

			local var_360_3 = 0.2

			if var_360_1 <= arg_357_1.time_ and arg_357_1.time_ < var_360_1 + var_360_3 then
				local var_360_4 = (arg_357_1.time_ - var_360_1) / var_360_3

				if arg_357_1.var_.highlightMatValue113801_1 then
					local var_360_5 = Mathf.Lerp(1, 0.5, var_360_4)
					local var_360_6 = arg_357_1.var_.highlightMatValue113801_1
					local var_360_7 = var_360_6.color

					var_360_7.r = var_360_5
					var_360_7.g = var_360_5
					var_360_7.b = var_360_5
					var_360_6.color = var_360_7
				end
			end

			if arg_357_1.time_ >= var_360_1 + var_360_3 and arg_357_1.time_ < var_360_1 + var_360_3 + arg_360_0 and arg_357_1.var_.highlightMatValue113801_1 then
				local var_360_8 = 0.5
				local var_360_9 = arg_357_1.var_.highlightMatValue113801_1
				local var_360_10 = var_360_9.color

				var_360_10.r = var_360_8
				var_360_10.g = var_360_8
				var_360_10.b = var_360_8
				var_360_9.color = var_360_10
			end

			local var_360_11 = 0
			local var_360_12 = 1.325

			if var_360_11 < arg_357_1.time_ and arg_357_1.time_ <= var_360_11 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0
				arg_357_1.dialogCg_.alpha = 1

				arg_357_1.dialog_:SetActive(true)
				SetActive(arg_357_1.leftNameGo_, false)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_357_1.iconTrs_.gameObject, false)
				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_13 = arg_357_1:GetWordFromCfg(115311089)
				local var_360_14 = arg_357_1:FormatText(var_360_13.content)

				arg_357_1.text_.text = var_360_14

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_15 = 53
				local var_360_16 = utf8.len(var_360_14)
				local var_360_17 = var_360_15 <= 0 and var_360_12 or var_360_12 * (var_360_16 / var_360_15)

				if var_360_17 > 0 and var_360_12 < var_360_17 then
					arg_357_1.talkMaxDuration = var_360_17

					if var_360_17 + var_360_11 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_17 + var_360_11
					end
				end

				arg_357_1.text_.text = var_360_14
				arg_357_1.typewritter.percent = 0

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(false)
				arg_357_1:RecordContent(arg_357_1.text_.text)
			end

			local var_360_18 = math.max(var_360_12, arg_357_1.talkMaxDuration)

			if var_360_11 <= arg_357_1.time_ and arg_357_1.time_ < var_360_11 + var_360_18 then
				arg_357_1.typewritter.percent = (arg_357_1.time_ - var_360_11) / var_360_18

				arg_357_1.typewritter:SetDirty()
			end

			if arg_357_1.time_ >= var_360_11 + var_360_18 and arg_357_1.time_ < var_360_11 + var_360_18 + arg_360_0 then
				arg_357_1.typewritter.percent = 1

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(true)
			end
		end
	end,
	Play115311090 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 115311090
		arg_361_1.duration_ = 3.1

		local var_361_0 = {
			ja = 1.266,
			ko = 1.666,
			zh = 1.8,
			en = 3.1
		}
		local var_361_1 = manager.audio:GetLocalizationFlag()

		if var_361_0[var_361_1] ~= nil then
			arg_361_1.duration_ = var_361_0[var_361_1]
		end

		SetActive(arg_361_1.tipsGo_, false)

		function arg_361_1.onSingleLineFinish_()
			arg_361_1.onSingleLineUpdate_ = nil
			arg_361_1.onSingleLineFinish_ = nil
			arg_361_1.state_ = "waiting"
		end

		function arg_361_1.playNext_(arg_363_0)
			if arg_363_0 == 1 then
				arg_361_0:Play115311091(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = arg_361_1.actors_["10029"]
			local var_364_1 = 0

			if var_364_1 < arg_361_1.time_ and arg_361_1.time_ <= var_364_1 + arg_364_0 then
				local var_364_2 = var_364_0:GetComponent("Image")

				if var_364_2 then
					arg_361_1.var_.highlightMatValue10029 = var_364_2
				end
			end

			local var_364_3 = 0.2

			if var_364_1 <= arg_361_1.time_ and arg_361_1.time_ < var_364_1 + var_364_3 then
				local var_364_4 = (arg_361_1.time_ - var_364_1) / var_364_3

				if arg_361_1.var_.highlightMatValue10029 then
					local var_364_5 = Mathf.Lerp(0.5, 1, var_364_4)
					local var_364_6 = arg_361_1.var_.highlightMatValue10029
					local var_364_7 = var_364_6.color

					var_364_7.r = var_364_5
					var_364_7.g = var_364_5
					var_364_7.b = var_364_5
					var_364_6.color = var_364_7
				end
			end

			if arg_361_1.time_ >= var_364_1 + var_364_3 and arg_361_1.time_ < var_364_1 + var_364_3 + arg_364_0 and arg_361_1.var_.highlightMatValue10029 then
				local var_364_8 = 1

				var_364_0.transform:SetSiblingIndex(1)

				local var_364_9 = arg_361_1.var_.highlightMatValue10029
				local var_364_10 = var_364_9.color

				var_364_10.r = var_364_8
				var_364_10.g = var_364_8
				var_364_10.b = var_364_8
				var_364_9.color = var_364_10
			end

			local var_364_11 = 0
			local var_364_12 = 0.1

			if var_364_11 < arg_361_1.time_ and arg_361_1.time_ <= var_364_11 + arg_364_0 then
				arg_361_1.talkMaxDuration = 0
				arg_361_1.dialogCg_.alpha = 1

				arg_361_1.dialog_:SetActive(true)
				SetActive(arg_361_1.leftNameGo_, true)

				local var_364_13 = arg_361_1:FormatText(StoryNameCfg[312].name)

				arg_361_1.leftNameTxt_.text = var_364_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_361_1.leftNameTxt_.transform)

				arg_361_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_361_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_361_1:RecordName(arg_361_1.leftNameTxt_.text)
				SetActive(arg_361_1.iconTrs_.gameObject, false)
				arg_361_1.callingController_:SetSelectedState("normal")

				local var_364_14 = arg_361_1:GetWordFromCfg(115311090)
				local var_364_15 = arg_361_1:FormatText(var_364_14.content)

				arg_361_1.text_.text = var_364_15

				LuaForUtil.ClearLinePrefixSymbol(arg_361_1.text_)

				local var_364_16 = 4
				local var_364_17 = utf8.len(var_364_15)
				local var_364_18 = var_364_16 <= 0 and var_364_12 or var_364_12 * (var_364_17 / var_364_16)

				if var_364_18 > 0 and var_364_12 < var_364_18 then
					arg_361_1.talkMaxDuration = var_364_18

					if var_364_18 + var_364_11 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_18 + var_364_11
					end
				end

				arg_361_1.text_.text = var_364_15
				arg_361_1.typewritter.percent = 0

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311090", "story_v_out_115311.awb") ~= 0 then
					local var_364_19 = manager.audio:GetVoiceLength("story_v_out_115311", "115311090", "story_v_out_115311.awb") / 1000

					if var_364_19 + var_364_11 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_19 + var_364_11
					end

					if var_364_14.prefab_name ~= "" and arg_361_1.actors_[var_364_14.prefab_name] ~= nil then
						local var_364_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_361_1.actors_[var_364_14.prefab_name].transform, "story_v_out_115311", "115311090", "story_v_out_115311.awb")

						arg_361_1:RecordAudio("115311090", var_364_20)
						arg_361_1:RecordAudio("115311090", var_364_20)
					else
						arg_361_1:AudioAction("play", "voice", "story_v_out_115311", "115311090", "story_v_out_115311.awb")
					end

					arg_361_1:RecordHistoryTalkVoice("story_v_out_115311", "115311090", "story_v_out_115311.awb")
				end

				arg_361_1:RecordContent(arg_361_1.text_.text)
			end

			local var_364_21 = math.max(var_364_12, arg_361_1.talkMaxDuration)

			if var_364_11 <= arg_361_1.time_ and arg_361_1.time_ < var_364_11 + var_364_21 then
				arg_361_1.typewritter.percent = (arg_361_1.time_ - var_364_11) / var_364_21

				arg_361_1.typewritter:SetDirty()
			end

			if arg_361_1.time_ >= var_364_11 + var_364_21 and arg_361_1.time_ < var_364_11 + var_364_21 + arg_364_0 then
				arg_361_1.typewritter.percent = 1

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(true)
			end
		end
	end,
	Play115311091 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 115311091
		arg_365_1.duration_ = 5.666

		local var_365_0 = {
			ja = 5,
			ko = 4.733,
			zh = 3.133,
			en = 5.666
		}
		local var_365_1 = manager.audio:GetLocalizationFlag()

		if var_365_0[var_365_1] ~= nil then
			arg_365_1.duration_ = var_365_0[var_365_1]
		end

		SetActive(arg_365_1.tipsGo_, false)

		function arg_365_1.onSingleLineFinish_()
			arg_365_1.onSingleLineUpdate_ = nil
			arg_365_1.onSingleLineFinish_ = nil
			arg_365_1.state_ = "waiting"
		end

		function arg_365_1.playNext_(arg_367_0)
			if arg_367_0 == 1 then
				arg_365_0:Play115311092(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = arg_365_1.actors_["10029"]
			local var_368_1 = 0

			if var_368_1 < arg_365_1.time_ and arg_365_1.time_ <= var_368_1 + arg_368_0 then
				local var_368_2 = var_368_0:GetComponent("Image")

				if var_368_2 then
					arg_365_1.var_.highlightMatValue10029 = var_368_2
				end
			end

			local var_368_3 = 0.2

			if var_368_1 <= arg_365_1.time_ and arg_365_1.time_ < var_368_1 + var_368_3 then
				local var_368_4 = (arg_365_1.time_ - var_368_1) / var_368_3

				if arg_365_1.var_.highlightMatValue10029 then
					local var_368_5 = Mathf.Lerp(1, 0.5, var_368_4)
					local var_368_6 = arg_365_1.var_.highlightMatValue10029
					local var_368_7 = var_368_6.color

					var_368_7.r = var_368_5
					var_368_7.g = var_368_5
					var_368_7.b = var_368_5
					var_368_6.color = var_368_7
				end
			end

			if arg_365_1.time_ >= var_368_1 + var_368_3 and arg_365_1.time_ < var_368_1 + var_368_3 + arg_368_0 and arg_365_1.var_.highlightMatValue10029 then
				local var_368_8 = 0.5
				local var_368_9 = arg_365_1.var_.highlightMatValue10029
				local var_368_10 = var_368_9.color

				var_368_10.r = var_368_8
				var_368_10.g = var_368_8
				var_368_10.b = var_368_8
				var_368_9.color = var_368_10
			end

			local var_368_11 = 0
			local var_368_12 = 0.325

			if var_368_11 < arg_365_1.time_ and arg_365_1.time_ <= var_368_11 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0
				arg_365_1.dialogCg_.alpha = 1

				arg_365_1.dialog_:SetActive(true)
				SetActive(arg_365_1.leftNameGo_, true)

				local var_368_13 = arg_365_1:FormatText(StoryNameCfg[104].name)

				arg_365_1.leftNameTxt_.text = var_368_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_365_1.leftNameTxt_.transform)

				arg_365_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_365_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_365_1:RecordName(arg_365_1.leftNameTxt_.text)
				SetActive(arg_365_1.iconTrs_.gameObject, true)
				arg_365_1.iconController_:SetSelectedState("hero")

				arg_365_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_woundedd")

				arg_365_1.callingController_:SetSelectedState("normal")

				local var_368_14 = arg_365_1:GetWordFromCfg(115311091)
				local var_368_15 = arg_365_1:FormatText(var_368_14.content)

				arg_365_1.text_.text = var_368_15

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.text_)

				local var_368_16 = 13
				local var_368_17 = utf8.len(var_368_15)
				local var_368_18 = var_368_16 <= 0 and var_368_12 or var_368_12 * (var_368_17 / var_368_16)

				if var_368_18 > 0 and var_368_12 < var_368_18 then
					arg_365_1.talkMaxDuration = var_368_18

					if var_368_18 + var_368_11 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_18 + var_368_11
					end
				end

				arg_365_1.text_.text = var_368_15
				arg_365_1.typewritter.percent = 0

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311091", "story_v_out_115311.awb") ~= 0 then
					local var_368_19 = manager.audio:GetVoiceLength("story_v_out_115311", "115311091", "story_v_out_115311.awb") / 1000

					if var_368_19 + var_368_11 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_19 + var_368_11
					end

					if var_368_14.prefab_name ~= "" and arg_365_1.actors_[var_368_14.prefab_name] ~= nil then
						local var_368_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_365_1.actors_[var_368_14.prefab_name].transform, "story_v_out_115311", "115311091", "story_v_out_115311.awb")

						arg_365_1:RecordAudio("115311091", var_368_20)
						arg_365_1:RecordAudio("115311091", var_368_20)
					else
						arg_365_1:AudioAction("play", "voice", "story_v_out_115311", "115311091", "story_v_out_115311.awb")
					end

					arg_365_1:RecordHistoryTalkVoice("story_v_out_115311", "115311091", "story_v_out_115311.awb")
				end

				arg_365_1:RecordContent(arg_365_1.text_.text)
			end

			local var_368_21 = math.max(var_368_12, arg_365_1.talkMaxDuration)

			if var_368_11 <= arg_365_1.time_ and arg_365_1.time_ < var_368_11 + var_368_21 then
				arg_365_1.typewritter.percent = (arg_365_1.time_ - var_368_11) / var_368_21

				arg_365_1.typewritter:SetDirty()
			end

			if arg_365_1.time_ >= var_368_11 + var_368_21 and arg_365_1.time_ < var_368_11 + var_368_21 + arg_368_0 then
				arg_365_1.typewritter.percent = 1

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(true)
			end
		end
	end,
	Play115311092 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 115311092
		arg_369_1.duration_ = 2.333

		local var_369_0 = {
			ja = 1.666,
			ko = 1.766,
			zh = 1.933,
			en = 2.333
		}
		local var_369_1 = manager.audio:GetLocalizationFlag()

		if var_369_0[var_369_1] ~= nil then
			arg_369_1.duration_ = var_369_0[var_369_1]
		end

		SetActive(arg_369_1.tipsGo_, false)

		function arg_369_1.onSingleLineFinish_()
			arg_369_1.onSingleLineUpdate_ = nil
			arg_369_1.onSingleLineFinish_ = nil
			arg_369_1.state_ = "waiting"
		end

		function arg_369_1.playNext_(arg_371_0)
			if arg_371_0 == 1 then
				arg_369_0:Play115311093(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = 0
			local var_372_1 = 0.2

			if var_372_0 < arg_369_1.time_ and arg_369_1.time_ <= var_372_0 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0
				arg_369_1.dialogCg_.alpha = 1

				arg_369_1.dialog_:SetActive(true)
				SetActive(arg_369_1.leftNameGo_, true)

				local var_372_2 = arg_369_1:FormatText(StoryNameCfg[316].name)

				arg_369_1.leftNameTxt_.text = var_372_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_369_1.leftNameTxt_.transform)

				arg_369_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_369_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_369_1:RecordName(arg_369_1.leftNameTxt_.text)
				SetActive(arg_369_1.iconTrs_.gameObject, true)
				arg_369_1.iconController_:SetSelectedState("hero")

				arg_369_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenmb")

				arg_369_1.callingController_:SetSelectedState("normal")

				local var_372_3 = arg_369_1:GetWordFromCfg(115311092)
				local var_372_4 = arg_369_1:FormatText(var_372_3.content)

				arg_369_1.text_.text = var_372_4

				LuaForUtil.ClearLinePrefixSymbol(arg_369_1.text_)

				local var_372_5 = 8
				local var_372_6 = utf8.len(var_372_4)
				local var_372_7 = var_372_5 <= 0 and var_372_1 or var_372_1 * (var_372_6 / var_372_5)

				if var_372_7 > 0 and var_372_1 < var_372_7 then
					arg_369_1.talkMaxDuration = var_372_7

					if var_372_7 + var_372_0 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_7 + var_372_0
					end
				end

				arg_369_1.text_.text = var_372_4
				arg_369_1.typewritter.percent = 0

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311092", "story_v_out_115311.awb") ~= 0 then
					local var_372_8 = manager.audio:GetVoiceLength("story_v_out_115311", "115311092", "story_v_out_115311.awb") / 1000

					if var_372_8 + var_372_0 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_8 + var_372_0
					end

					if var_372_3.prefab_name ~= "" and arg_369_1.actors_[var_372_3.prefab_name] ~= nil then
						local var_372_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_369_1.actors_[var_372_3.prefab_name].transform, "story_v_out_115311", "115311092", "story_v_out_115311.awb")

						arg_369_1:RecordAudio("115311092", var_372_9)
						arg_369_1:RecordAudio("115311092", var_372_9)
					else
						arg_369_1:AudioAction("play", "voice", "story_v_out_115311", "115311092", "story_v_out_115311.awb")
					end

					arg_369_1:RecordHistoryTalkVoice("story_v_out_115311", "115311092", "story_v_out_115311.awb")
				end

				arg_369_1:RecordContent(arg_369_1.text_.text)
			end

			local var_372_10 = math.max(var_372_1, arg_369_1.talkMaxDuration)

			if var_372_0 <= arg_369_1.time_ and arg_369_1.time_ < var_372_0 + var_372_10 then
				arg_369_1.typewritter.percent = (arg_369_1.time_ - var_372_0) / var_372_10

				arg_369_1.typewritter:SetDirty()
			end

			if arg_369_1.time_ >= var_372_0 + var_372_10 and arg_369_1.time_ < var_372_0 + var_372_10 + arg_372_0 then
				arg_369_1.typewritter.percent = 1

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(true)
			end
		end
	end,
	Play115311093 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 115311093
		arg_373_1.duration_ = 5

		SetActive(arg_373_1.tipsGo_, false)

		function arg_373_1.onSingleLineFinish_()
			arg_373_1.onSingleLineUpdate_ = nil
			arg_373_1.onSingleLineFinish_ = nil
			arg_373_1.state_ = "waiting"
		end

		function arg_373_1.playNext_(arg_375_0)
			if arg_375_0 == 1 then
				arg_373_0:Play115311094(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = 0
			local var_376_1 = 1.1

			if var_376_0 < arg_373_1.time_ and arg_373_1.time_ <= var_376_0 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0
				arg_373_1.dialogCg_.alpha = 1

				arg_373_1.dialog_:SetActive(true)
				SetActive(arg_373_1.leftNameGo_, false)

				arg_373_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_373_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_373_1:RecordName(arg_373_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_373_1.iconTrs_.gameObject, false)
				arg_373_1.callingController_:SetSelectedState("normal")

				local var_376_2 = arg_373_1:GetWordFromCfg(115311093)
				local var_376_3 = arg_373_1:FormatText(var_376_2.content)

				arg_373_1.text_.text = var_376_3

				LuaForUtil.ClearLinePrefixSymbol(arg_373_1.text_)

				local var_376_4 = 44
				local var_376_5 = utf8.len(var_376_3)
				local var_376_6 = var_376_4 <= 0 and var_376_1 or var_376_1 * (var_376_5 / var_376_4)

				if var_376_6 > 0 and var_376_1 < var_376_6 then
					arg_373_1.talkMaxDuration = var_376_6

					if var_376_6 + var_376_0 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_6 + var_376_0
					end
				end

				arg_373_1.text_.text = var_376_3
				arg_373_1.typewritter.percent = 0

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(false)
				arg_373_1:RecordContent(arg_373_1.text_.text)
			end

			local var_376_7 = math.max(var_376_1, arg_373_1.talkMaxDuration)

			if var_376_0 <= arg_373_1.time_ and arg_373_1.time_ < var_376_0 + var_376_7 then
				arg_373_1.typewritter.percent = (arg_373_1.time_ - var_376_0) / var_376_7

				arg_373_1.typewritter:SetDirty()
			end

			if arg_373_1.time_ >= var_376_0 + var_376_7 and arg_373_1.time_ < var_376_0 + var_376_7 + arg_376_0 then
				arg_373_1.typewritter.percent = 1

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(true)
			end
		end
	end,
	Play115311094 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 115311094
		arg_377_1.duration_ = 21.9

		local var_377_0 = {
			ja = 17.566,
			ko = 20.1,
			zh = 17,
			en = 21.9
		}
		local var_377_1 = manager.audio:GetLocalizationFlag()

		if var_377_0[var_377_1] ~= nil then
			arg_377_1.duration_ = var_377_0[var_377_1]
		end

		SetActive(arg_377_1.tipsGo_, false)

		function arg_377_1.onSingleLineFinish_()
			arg_377_1.onSingleLineUpdate_ = nil
			arg_377_1.onSingleLineFinish_ = nil
			arg_377_1.state_ = "waiting"
		end

		function arg_377_1.playNext_(arg_379_0)
			if arg_379_0 == 1 then
				arg_377_0:Play115311095(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = arg_377_1.actors_["113801_1"]
			local var_380_1 = 0

			if var_380_1 < arg_377_1.time_ and arg_377_1.time_ <= var_380_1 + arg_380_0 then
				local var_380_2 = var_380_0:GetComponent("Image")

				if var_380_2 then
					arg_377_1.var_.highlightMatValue113801_1 = var_380_2
				end
			end

			local var_380_3 = 0.2

			if var_380_1 <= arg_377_1.time_ and arg_377_1.time_ < var_380_1 + var_380_3 then
				local var_380_4 = (arg_377_1.time_ - var_380_1) / var_380_3

				if arg_377_1.var_.highlightMatValue113801_1 then
					local var_380_5 = Mathf.Lerp(0.5, 1, var_380_4)
					local var_380_6 = arg_377_1.var_.highlightMatValue113801_1
					local var_380_7 = var_380_6.color

					var_380_7.r = var_380_5
					var_380_7.g = var_380_5
					var_380_7.b = var_380_5
					var_380_6.color = var_380_7
				end
			end

			if arg_377_1.time_ >= var_380_1 + var_380_3 and arg_377_1.time_ < var_380_1 + var_380_3 + arg_380_0 and arg_377_1.var_.highlightMatValue113801_1 then
				local var_380_8 = 1

				var_380_0.transform:SetSiblingIndex(1)

				local var_380_9 = arg_377_1.var_.highlightMatValue113801_1
				local var_380_10 = var_380_9.color

				var_380_10.r = var_380_8
				var_380_10.g = var_380_8
				var_380_10.b = var_380_8
				var_380_9.color = var_380_10
			end

			local var_380_11 = 0
			local var_380_12 = 1.725

			if var_380_11 < arg_377_1.time_ and arg_377_1.time_ <= var_380_11 + arg_380_0 then
				arg_377_1.talkMaxDuration = 0
				arg_377_1.dialogCg_.alpha = 1

				arg_377_1.dialog_:SetActive(true)
				SetActive(arg_377_1.leftNameGo_, true)

				local var_380_13 = arg_377_1:FormatText(StoryNameCfg[94].name)

				arg_377_1.leftNameTxt_.text = var_380_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_377_1.leftNameTxt_.transform)

				arg_377_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_377_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_377_1:RecordName(arg_377_1.leftNameTxt_.text)
				SetActive(arg_377_1.iconTrs_.gameObject, false)
				arg_377_1.callingController_:SetSelectedState("normal")

				local var_380_14 = arg_377_1:GetWordFromCfg(115311094)
				local var_380_15 = arg_377_1:FormatText(var_380_14.content)

				arg_377_1.text_.text = var_380_15

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_16 = 69
				local var_380_17 = utf8.len(var_380_15)
				local var_380_18 = var_380_16 <= 0 and var_380_12 or var_380_12 * (var_380_17 / var_380_16)

				if var_380_18 > 0 and var_380_12 < var_380_18 then
					arg_377_1.talkMaxDuration = var_380_18

					if var_380_18 + var_380_11 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_18 + var_380_11
					end
				end

				arg_377_1.text_.text = var_380_15
				arg_377_1.typewritter.percent = 0

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311094", "story_v_out_115311.awb") ~= 0 then
					local var_380_19 = manager.audio:GetVoiceLength("story_v_out_115311", "115311094", "story_v_out_115311.awb") / 1000

					if var_380_19 + var_380_11 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_19 + var_380_11
					end

					if var_380_14.prefab_name ~= "" and arg_377_1.actors_[var_380_14.prefab_name] ~= nil then
						local var_380_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_377_1.actors_[var_380_14.prefab_name].transform, "story_v_out_115311", "115311094", "story_v_out_115311.awb")

						arg_377_1:RecordAudio("115311094", var_380_20)
						arg_377_1:RecordAudio("115311094", var_380_20)
					else
						arg_377_1:AudioAction("play", "voice", "story_v_out_115311", "115311094", "story_v_out_115311.awb")
					end

					arg_377_1:RecordHistoryTalkVoice("story_v_out_115311", "115311094", "story_v_out_115311.awb")
				end

				arg_377_1:RecordContent(arg_377_1.text_.text)
			end

			local var_380_21 = math.max(var_380_12, arg_377_1.talkMaxDuration)

			if var_380_11 <= arg_377_1.time_ and arg_377_1.time_ < var_380_11 + var_380_21 then
				arg_377_1.typewritter.percent = (arg_377_1.time_ - var_380_11) / var_380_21

				arg_377_1.typewritter:SetDirty()
			end

			if arg_377_1.time_ >= var_380_11 + var_380_21 and arg_377_1.time_ < var_380_11 + var_380_21 + arg_380_0 then
				arg_377_1.typewritter.percent = 1

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(true)
			end
		end
	end,
	Play115311095 = function(arg_381_0, arg_381_1)
		arg_381_1.time_ = 0
		arg_381_1.frameCnt_ = 0
		arg_381_1.state_ = "playing"
		arg_381_1.curTalkId_ = 115311095
		arg_381_1.duration_ = 19.233

		local var_381_0 = {
			ja = 11.4,
			ko = 13.866,
			zh = 15.4,
			en = 19.233
		}
		local var_381_1 = manager.audio:GetLocalizationFlag()

		if var_381_0[var_381_1] ~= nil then
			arg_381_1.duration_ = var_381_0[var_381_1]
		end

		SetActive(arg_381_1.tipsGo_, false)

		function arg_381_1.onSingleLineFinish_()
			arg_381_1.onSingleLineUpdate_ = nil
			arg_381_1.onSingleLineFinish_ = nil
			arg_381_1.state_ = "waiting"
		end

		function arg_381_1.playNext_(arg_383_0)
			if arg_383_0 == 1 then
				arg_381_0:Play115311096(arg_381_1)
			end
		end

		function arg_381_1.onSingleLineUpdate_(arg_384_0)
			local var_384_0 = 0
			local var_384_1 = 1.375

			if var_384_0 < arg_381_1.time_ and arg_381_1.time_ <= var_384_0 + arg_384_0 then
				arg_381_1.talkMaxDuration = 0
				arg_381_1.dialogCg_.alpha = 1

				arg_381_1.dialog_:SetActive(true)
				SetActive(arg_381_1.leftNameGo_, true)

				local var_384_2 = arg_381_1:FormatText(StoryNameCfg[94].name)

				arg_381_1.leftNameTxt_.text = var_384_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_381_1.leftNameTxt_.transform)

				arg_381_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_381_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_381_1:RecordName(arg_381_1.leftNameTxt_.text)
				SetActive(arg_381_1.iconTrs_.gameObject, false)
				arg_381_1.callingController_:SetSelectedState("normal")

				local var_384_3 = arg_381_1:GetWordFromCfg(115311095)
				local var_384_4 = arg_381_1:FormatText(var_384_3.content)

				arg_381_1.text_.text = var_384_4

				LuaForUtil.ClearLinePrefixSymbol(arg_381_1.text_)

				local var_384_5 = 55
				local var_384_6 = utf8.len(var_384_4)
				local var_384_7 = var_384_5 <= 0 and var_384_1 or var_384_1 * (var_384_6 / var_384_5)

				if var_384_7 > 0 and var_384_1 < var_384_7 then
					arg_381_1.talkMaxDuration = var_384_7

					if var_384_7 + var_384_0 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_7 + var_384_0
					end
				end

				arg_381_1.text_.text = var_384_4
				arg_381_1.typewritter.percent = 0

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311095", "story_v_out_115311.awb") ~= 0 then
					local var_384_8 = manager.audio:GetVoiceLength("story_v_out_115311", "115311095", "story_v_out_115311.awb") / 1000

					if var_384_8 + var_384_0 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_8 + var_384_0
					end

					if var_384_3.prefab_name ~= "" and arg_381_1.actors_[var_384_3.prefab_name] ~= nil then
						local var_384_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_381_1.actors_[var_384_3.prefab_name].transform, "story_v_out_115311", "115311095", "story_v_out_115311.awb")

						arg_381_1:RecordAudio("115311095", var_384_9)
						arg_381_1:RecordAudio("115311095", var_384_9)
					else
						arg_381_1:AudioAction("play", "voice", "story_v_out_115311", "115311095", "story_v_out_115311.awb")
					end

					arg_381_1:RecordHistoryTalkVoice("story_v_out_115311", "115311095", "story_v_out_115311.awb")
				end

				arg_381_1:RecordContent(arg_381_1.text_.text)
			end

			local var_384_10 = math.max(var_384_1, arg_381_1.talkMaxDuration)

			if var_384_0 <= arg_381_1.time_ and arg_381_1.time_ < var_384_0 + var_384_10 then
				arg_381_1.typewritter.percent = (arg_381_1.time_ - var_384_0) / var_384_10

				arg_381_1.typewritter:SetDirty()
			end

			if arg_381_1.time_ >= var_384_0 + var_384_10 and arg_381_1.time_ < var_384_0 + var_384_10 + arg_384_0 then
				arg_381_1.typewritter.percent = 1

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(true)
			end
		end
	end,
	Play115311096 = function(arg_385_0, arg_385_1)
		arg_385_1.time_ = 0
		arg_385_1.frameCnt_ = 0
		arg_385_1.state_ = "playing"
		arg_385_1.curTalkId_ = 115311096
		arg_385_1.duration_ = 18.333

		local var_385_0 = {
			ja = 18.333,
			ko = 14.133,
			zh = 14.933,
			en = 17.866
		}
		local var_385_1 = manager.audio:GetLocalizationFlag()

		if var_385_0[var_385_1] ~= nil then
			arg_385_1.duration_ = var_385_0[var_385_1]
		end

		SetActive(arg_385_1.tipsGo_, false)

		function arg_385_1.onSingleLineFinish_()
			arg_385_1.onSingleLineUpdate_ = nil
			arg_385_1.onSingleLineFinish_ = nil
			arg_385_1.state_ = "waiting"
		end

		function arg_385_1.playNext_(arg_387_0)
			if arg_387_0 == 1 then
				arg_385_0:Play115311097(arg_385_1)
			end
		end

		function arg_385_1.onSingleLineUpdate_(arg_388_0)
			local var_388_0 = 0
			local var_388_1 = 1.35

			if var_388_0 < arg_385_1.time_ and arg_385_1.time_ <= var_388_0 + arg_388_0 then
				arg_385_1.talkMaxDuration = 0
				arg_385_1.dialogCg_.alpha = 1

				arg_385_1.dialog_:SetActive(true)
				SetActive(arg_385_1.leftNameGo_, true)

				local var_388_2 = arg_385_1:FormatText(StoryNameCfg[94].name)

				arg_385_1.leftNameTxt_.text = var_388_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_385_1.leftNameTxt_.transform)

				arg_385_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_385_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_385_1:RecordName(arg_385_1.leftNameTxt_.text)
				SetActive(arg_385_1.iconTrs_.gameObject, false)
				arg_385_1.callingController_:SetSelectedState("normal")

				local var_388_3 = arg_385_1:GetWordFromCfg(115311096)
				local var_388_4 = arg_385_1:FormatText(var_388_3.content)

				arg_385_1.text_.text = var_388_4

				LuaForUtil.ClearLinePrefixSymbol(arg_385_1.text_)

				local var_388_5 = 54
				local var_388_6 = utf8.len(var_388_4)
				local var_388_7 = var_388_5 <= 0 and var_388_1 or var_388_1 * (var_388_6 / var_388_5)

				if var_388_7 > 0 and var_388_1 < var_388_7 then
					arg_385_1.talkMaxDuration = var_388_7

					if var_388_7 + var_388_0 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_7 + var_388_0
					end
				end

				arg_385_1.text_.text = var_388_4
				arg_385_1.typewritter.percent = 0

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311096", "story_v_out_115311.awb") ~= 0 then
					local var_388_8 = manager.audio:GetVoiceLength("story_v_out_115311", "115311096", "story_v_out_115311.awb") / 1000

					if var_388_8 + var_388_0 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_8 + var_388_0
					end

					if var_388_3.prefab_name ~= "" and arg_385_1.actors_[var_388_3.prefab_name] ~= nil then
						local var_388_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_385_1.actors_[var_388_3.prefab_name].transform, "story_v_out_115311", "115311096", "story_v_out_115311.awb")

						arg_385_1:RecordAudio("115311096", var_388_9)
						arg_385_1:RecordAudio("115311096", var_388_9)
					else
						arg_385_1:AudioAction("play", "voice", "story_v_out_115311", "115311096", "story_v_out_115311.awb")
					end

					arg_385_1:RecordHistoryTalkVoice("story_v_out_115311", "115311096", "story_v_out_115311.awb")
				end

				arg_385_1:RecordContent(arg_385_1.text_.text)
			end

			local var_388_10 = math.max(var_388_1, arg_385_1.talkMaxDuration)

			if var_388_0 <= arg_385_1.time_ and arg_385_1.time_ < var_388_0 + var_388_10 then
				arg_385_1.typewritter.percent = (arg_385_1.time_ - var_388_0) / var_388_10

				arg_385_1.typewritter:SetDirty()
			end

			if arg_385_1.time_ >= var_388_0 + var_388_10 and arg_385_1.time_ < var_388_0 + var_388_10 + arg_388_0 then
				arg_385_1.typewritter.percent = 1

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(true)
			end
		end
	end,
	Play115311097 = function(arg_389_0, arg_389_1)
		arg_389_1.time_ = 0
		arg_389_1.frameCnt_ = 0
		arg_389_1.state_ = "playing"
		arg_389_1.curTalkId_ = 115311097
		arg_389_1.duration_ = 14.966

		local var_389_0 = {
			ja = 11.466,
			ko = 14.966,
			zh = 14.266,
			en = 14.2
		}
		local var_389_1 = manager.audio:GetLocalizationFlag()

		if var_389_0[var_389_1] ~= nil then
			arg_389_1.duration_ = var_389_0[var_389_1]
		end

		SetActive(arg_389_1.tipsGo_, false)

		function arg_389_1.onSingleLineFinish_()
			arg_389_1.onSingleLineUpdate_ = nil
			arg_389_1.onSingleLineFinish_ = nil
			arg_389_1.state_ = "waiting"
		end

		function arg_389_1.playNext_(arg_391_0)
			if arg_391_0 == 1 then
				arg_389_0:Play115311098(arg_389_1)
			end
		end

		function arg_389_1.onSingleLineUpdate_(arg_392_0)
			local var_392_0 = 0
			local var_392_1 = 1.4

			if var_392_0 < arg_389_1.time_ and arg_389_1.time_ <= var_392_0 + arg_392_0 then
				arg_389_1.talkMaxDuration = 0
				arg_389_1.dialogCg_.alpha = 1

				arg_389_1.dialog_:SetActive(true)
				SetActive(arg_389_1.leftNameGo_, true)

				local var_392_2 = arg_389_1:FormatText(StoryNameCfg[94].name)

				arg_389_1.leftNameTxt_.text = var_392_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_389_1.leftNameTxt_.transform)

				arg_389_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_389_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_389_1:RecordName(arg_389_1.leftNameTxt_.text)
				SetActive(arg_389_1.iconTrs_.gameObject, false)
				arg_389_1.callingController_:SetSelectedState("normal")

				local var_392_3 = arg_389_1:GetWordFromCfg(115311097)
				local var_392_4 = arg_389_1:FormatText(var_392_3.content)

				arg_389_1.text_.text = var_392_4

				LuaForUtil.ClearLinePrefixSymbol(arg_389_1.text_)

				local var_392_5 = 56
				local var_392_6 = utf8.len(var_392_4)
				local var_392_7 = var_392_5 <= 0 and var_392_1 or var_392_1 * (var_392_6 / var_392_5)

				if var_392_7 > 0 and var_392_1 < var_392_7 then
					arg_389_1.talkMaxDuration = var_392_7

					if var_392_7 + var_392_0 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_7 + var_392_0
					end
				end

				arg_389_1.text_.text = var_392_4
				arg_389_1.typewritter.percent = 0

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311097", "story_v_out_115311.awb") ~= 0 then
					local var_392_8 = manager.audio:GetVoiceLength("story_v_out_115311", "115311097", "story_v_out_115311.awb") / 1000

					if var_392_8 + var_392_0 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_8 + var_392_0
					end

					if var_392_3.prefab_name ~= "" and arg_389_1.actors_[var_392_3.prefab_name] ~= nil then
						local var_392_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_389_1.actors_[var_392_3.prefab_name].transform, "story_v_out_115311", "115311097", "story_v_out_115311.awb")

						arg_389_1:RecordAudio("115311097", var_392_9)
						arg_389_1:RecordAudio("115311097", var_392_9)
					else
						arg_389_1:AudioAction("play", "voice", "story_v_out_115311", "115311097", "story_v_out_115311.awb")
					end

					arg_389_1:RecordHistoryTalkVoice("story_v_out_115311", "115311097", "story_v_out_115311.awb")
				end

				arg_389_1:RecordContent(arg_389_1.text_.text)
			end

			local var_392_10 = math.max(var_392_1, arg_389_1.talkMaxDuration)

			if var_392_0 <= arg_389_1.time_ and arg_389_1.time_ < var_392_0 + var_392_10 then
				arg_389_1.typewritter.percent = (arg_389_1.time_ - var_392_0) / var_392_10

				arg_389_1.typewritter:SetDirty()
			end

			if arg_389_1.time_ >= var_392_0 + var_392_10 and arg_389_1.time_ < var_392_0 + var_392_10 + arg_392_0 then
				arg_389_1.typewritter.percent = 1

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(true)
			end
		end
	end,
	Play115311098 = function(arg_393_0, arg_393_1)
		arg_393_1.time_ = 0
		arg_393_1.frameCnt_ = 0
		arg_393_1.state_ = "playing"
		arg_393_1.curTalkId_ = 115311098
		arg_393_1.duration_ = 16.6

		local var_393_0 = {
			ja = 13.433,
			ko = 12.733,
			zh = 13.6,
			en = 16.6
		}
		local var_393_1 = manager.audio:GetLocalizationFlag()

		if var_393_0[var_393_1] ~= nil then
			arg_393_1.duration_ = var_393_0[var_393_1]
		end

		SetActive(arg_393_1.tipsGo_, false)

		function arg_393_1.onSingleLineFinish_()
			arg_393_1.onSingleLineUpdate_ = nil
			arg_393_1.onSingleLineFinish_ = nil
			arg_393_1.state_ = "waiting"
		end

		function arg_393_1.playNext_(arg_395_0)
			if arg_395_0 == 1 then
				arg_393_0:Play115311099(arg_393_1)
			end
		end

		function arg_393_1.onSingleLineUpdate_(arg_396_0)
			local var_396_0 = 0
			local var_396_1 = 1.25

			if var_396_0 < arg_393_1.time_ and arg_393_1.time_ <= var_396_0 + arg_396_0 then
				arg_393_1.talkMaxDuration = 0
				arg_393_1.dialogCg_.alpha = 1

				arg_393_1.dialog_:SetActive(true)
				SetActive(arg_393_1.leftNameGo_, true)

				local var_396_2 = arg_393_1:FormatText(StoryNameCfg[94].name)

				arg_393_1.leftNameTxt_.text = var_396_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_393_1.leftNameTxt_.transform)

				arg_393_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_393_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_393_1:RecordName(arg_393_1.leftNameTxt_.text)
				SetActive(arg_393_1.iconTrs_.gameObject, false)
				arg_393_1.callingController_:SetSelectedState("normal")

				local var_396_3 = arg_393_1:GetWordFromCfg(115311098)
				local var_396_4 = arg_393_1:FormatText(var_396_3.content)

				arg_393_1.text_.text = var_396_4

				LuaForUtil.ClearLinePrefixSymbol(arg_393_1.text_)

				local var_396_5 = 50
				local var_396_6 = utf8.len(var_396_4)
				local var_396_7 = var_396_5 <= 0 and var_396_1 or var_396_1 * (var_396_6 / var_396_5)

				if var_396_7 > 0 and var_396_1 < var_396_7 then
					arg_393_1.talkMaxDuration = var_396_7

					if var_396_7 + var_396_0 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_7 + var_396_0
					end
				end

				arg_393_1.text_.text = var_396_4
				arg_393_1.typewritter.percent = 0

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311098", "story_v_out_115311.awb") ~= 0 then
					local var_396_8 = manager.audio:GetVoiceLength("story_v_out_115311", "115311098", "story_v_out_115311.awb") / 1000

					if var_396_8 + var_396_0 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_8 + var_396_0
					end

					if var_396_3.prefab_name ~= "" and arg_393_1.actors_[var_396_3.prefab_name] ~= nil then
						local var_396_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_393_1.actors_[var_396_3.prefab_name].transform, "story_v_out_115311", "115311098", "story_v_out_115311.awb")

						arg_393_1:RecordAudio("115311098", var_396_9)
						arg_393_1:RecordAudio("115311098", var_396_9)
					else
						arg_393_1:AudioAction("play", "voice", "story_v_out_115311", "115311098", "story_v_out_115311.awb")
					end

					arg_393_1:RecordHistoryTalkVoice("story_v_out_115311", "115311098", "story_v_out_115311.awb")
				end

				arg_393_1:RecordContent(arg_393_1.text_.text)
			end

			local var_396_10 = math.max(var_396_1, arg_393_1.talkMaxDuration)

			if var_396_0 <= arg_393_1.time_ and arg_393_1.time_ < var_396_0 + var_396_10 then
				arg_393_1.typewritter.percent = (arg_393_1.time_ - var_396_0) / var_396_10

				arg_393_1.typewritter:SetDirty()
			end

			if arg_393_1.time_ >= var_396_0 + var_396_10 and arg_393_1.time_ < var_396_0 + var_396_10 + arg_396_0 then
				arg_393_1.typewritter.percent = 1

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(true)
			end
		end
	end,
	Play115311099 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 115311099
		arg_397_1.duration_ = 2.266

		local var_397_0 = {
			ja = 2.266,
			ko = 1.3,
			zh = 1.333,
			en = 1.733
		}
		local var_397_1 = manager.audio:GetLocalizationFlag()

		if var_397_0[var_397_1] ~= nil then
			arg_397_1.duration_ = var_397_0[var_397_1]
		end

		SetActive(arg_397_1.tipsGo_, false)

		function arg_397_1.onSingleLineFinish_()
			arg_397_1.onSingleLineUpdate_ = nil
			arg_397_1.onSingleLineFinish_ = nil
			arg_397_1.state_ = "waiting"
		end

		function arg_397_1.playNext_(arg_399_0)
			if arg_399_0 == 1 then
				arg_397_0:Play115311100(arg_397_1)
			end
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = arg_397_1.actors_["113801_1"]
			local var_400_1 = 0

			if var_400_1 < arg_397_1.time_ and arg_397_1.time_ <= var_400_1 + arg_400_0 then
				local var_400_2 = var_400_0:GetComponent("Image")

				if var_400_2 then
					arg_397_1.var_.highlightMatValue113801_1 = var_400_2
				end
			end

			local var_400_3 = 0.2

			if var_400_1 <= arg_397_1.time_ and arg_397_1.time_ < var_400_1 + var_400_3 then
				local var_400_4 = (arg_397_1.time_ - var_400_1) / var_400_3

				if arg_397_1.var_.highlightMatValue113801_1 then
					local var_400_5 = Mathf.Lerp(1, 0.5, var_400_4)
					local var_400_6 = arg_397_1.var_.highlightMatValue113801_1
					local var_400_7 = var_400_6.color

					var_400_7.r = var_400_5
					var_400_7.g = var_400_5
					var_400_7.b = var_400_5
					var_400_6.color = var_400_7
				end
			end

			if arg_397_1.time_ >= var_400_1 + var_400_3 and arg_397_1.time_ < var_400_1 + var_400_3 + arg_400_0 and arg_397_1.var_.highlightMatValue113801_1 then
				local var_400_8 = 0.5
				local var_400_9 = arg_397_1.var_.highlightMatValue113801_1
				local var_400_10 = var_400_9.color

				var_400_10.r = var_400_8
				var_400_10.g = var_400_8
				var_400_10.b = var_400_8
				var_400_9.color = var_400_10
			end

			local var_400_11 = 0
			local var_400_12 = 0.075

			if var_400_11 < arg_397_1.time_ and arg_397_1.time_ <= var_400_11 + arg_400_0 then
				arg_397_1.talkMaxDuration = 0
				arg_397_1.dialogCg_.alpha = 1

				arg_397_1.dialog_:SetActive(true)
				SetActive(arg_397_1.leftNameGo_, true)

				local var_400_13 = arg_397_1:FormatText(StoryNameCfg[104].name)

				arg_397_1.leftNameTxt_.text = var_400_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_397_1.leftNameTxt_.transform)

				arg_397_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_397_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_397_1:RecordName(arg_397_1.leftNameTxt_.text)
				SetActive(arg_397_1.iconTrs_.gameObject, true)
				arg_397_1.iconController_:SetSelectedState("hero")

				arg_397_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_woundedd")

				arg_397_1.callingController_:SetSelectedState("normal")

				local var_400_14 = arg_397_1:GetWordFromCfg(115311099)
				local var_400_15 = arg_397_1:FormatText(var_400_14.content)

				arg_397_1.text_.text = var_400_15

				LuaForUtil.ClearLinePrefixSymbol(arg_397_1.text_)

				local var_400_16 = 3
				local var_400_17 = utf8.len(var_400_15)
				local var_400_18 = var_400_16 <= 0 and var_400_12 or var_400_12 * (var_400_17 / var_400_16)

				if var_400_18 > 0 and var_400_12 < var_400_18 then
					arg_397_1.talkMaxDuration = var_400_18

					if var_400_18 + var_400_11 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_18 + var_400_11
					end
				end

				arg_397_1.text_.text = var_400_15
				arg_397_1.typewritter.percent = 0

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311099", "story_v_out_115311.awb") ~= 0 then
					local var_400_19 = manager.audio:GetVoiceLength("story_v_out_115311", "115311099", "story_v_out_115311.awb") / 1000

					if var_400_19 + var_400_11 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_19 + var_400_11
					end

					if var_400_14.prefab_name ~= "" and arg_397_1.actors_[var_400_14.prefab_name] ~= nil then
						local var_400_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_397_1.actors_[var_400_14.prefab_name].transform, "story_v_out_115311", "115311099", "story_v_out_115311.awb")

						arg_397_1:RecordAudio("115311099", var_400_20)
						arg_397_1:RecordAudio("115311099", var_400_20)
					else
						arg_397_1:AudioAction("play", "voice", "story_v_out_115311", "115311099", "story_v_out_115311.awb")
					end

					arg_397_1:RecordHistoryTalkVoice("story_v_out_115311", "115311099", "story_v_out_115311.awb")
				end

				arg_397_1:RecordContent(arg_397_1.text_.text)
			end

			local var_400_21 = math.max(var_400_12, arg_397_1.talkMaxDuration)

			if var_400_11 <= arg_397_1.time_ and arg_397_1.time_ < var_400_11 + var_400_21 then
				arg_397_1.typewritter.percent = (arg_397_1.time_ - var_400_11) / var_400_21

				arg_397_1.typewritter:SetDirty()
			end

			if arg_397_1.time_ >= var_400_11 + var_400_21 and arg_397_1.time_ < var_400_11 + var_400_21 + arg_400_0 then
				arg_397_1.typewritter.percent = 1

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(true)
			end
		end
	end,
	Play115311100 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 115311100
		arg_401_1.duration_ = 5

		SetActive(arg_401_1.tipsGo_, false)

		function arg_401_1.onSingleLineFinish_()
			arg_401_1.onSingleLineUpdate_ = nil
			arg_401_1.onSingleLineFinish_ = nil
			arg_401_1.state_ = "waiting"
		end

		function arg_401_1.playNext_(arg_403_0)
			if arg_403_0 == 1 then
				arg_401_0:Play115311101(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = arg_401_1.actors_["10029"]
			local var_404_1 = 0

			if var_404_1 < arg_401_1.time_ and arg_401_1.time_ <= var_404_1 + arg_404_0 then
				local var_404_2 = var_404_0:GetComponent("Image")

				if var_404_2 then
					arg_401_1.var_.alphaMatValue10029 = var_404_2
					arg_401_1.var_.alphaOldValue10029 = var_404_2.color.a
				end

				arg_401_1.var_.alphaOldValue10029 = 1
			end

			local var_404_3 = 0.5

			if var_404_1 <= arg_401_1.time_ and arg_401_1.time_ < var_404_1 + var_404_3 then
				local var_404_4 = (arg_401_1.time_ - var_404_1) / var_404_3
				local var_404_5 = Mathf.Lerp(arg_401_1.var_.alphaOldValue10029, 0, var_404_4)

				if arg_401_1.var_.alphaMatValue10029 then
					local var_404_6 = arg_401_1.var_.alphaMatValue10029.color

					var_404_6.a = var_404_5
					arg_401_1.var_.alphaMatValue10029.color = var_404_6
				end
			end

			if arg_401_1.time_ >= var_404_1 + var_404_3 and arg_401_1.time_ < var_404_1 + var_404_3 + arg_404_0 and arg_401_1.var_.alphaMatValue10029 then
				local var_404_7 = arg_401_1.var_.alphaMatValue10029
				local var_404_8 = var_404_7.color

				var_404_8.a = 0
				var_404_7.color = var_404_8
			end

			local var_404_9 = arg_401_1.actors_["113801_1"]
			local var_404_10 = 0

			if var_404_10 < arg_401_1.time_ and arg_401_1.time_ <= var_404_10 + arg_404_0 then
				local var_404_11 = var_404_9:GetComponent("Image")

				if var_404_11 then
					arg_401_1.var_.alphaMatValue113801_1 = var_404_11
					arg_401_1.var_.alphaOldValue113801_1 = var_404_11.color.a
				end

				arg_401_1.var_.alphaOldValue113801_1 = 1
			end

			local var_404_12 = 0.5

			if var_404_10 <= arg_401_1.time_ and arg_401_1.time_ < var_404_10 + var_404_12 then
				local var_404_13 = (arg_401_1.time_ - var_404_10) / var_404_12
				local var_404_14 = Mathf.Lerp(arg_401_1.var_.alphaOldValue113801_1, 0, var_404_13)

				if arg_401_1.var_.alphaMatValue113801_1 then
					local var_404_15 = arg_401_1.var_.alphaMatValue113801_1.color

					var_404_15.a = var_404_14
					arg_401_1.var_.alphaMatValue113801_1.color = var_404_15
				end
			end

			if arg_401_1.time_ >= var_404_10 + var_404_12 and arg_401_1.time_ < var_404_10 + var_404_12 + arg_404_0 and arg_401_1.var_.alphaMatValue113801_1 then
				local var_404_16 = arg_401_1.var_.alphaMatValue113801_1
				local var_404_17 = var_404_16.color

				var_404_17.a = 0
				var_404_16.color = var_404_17
			end

			local var_404_18 = 0
			local var_404_19 = 1.025

			if var_404_18 < arg_401_1.time_ and arg_401_1.time_ <= var_404_18 + arg_404_0 then
				arg_401_1.talkMaxDuration = 0
				arg_401_1.dialogCg_.alpha = 1

				arg_401_1.dialog_:SetActive(true)
				SetActive(arg_401_1.leftNameGo_, false)

				arg_401_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_401_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_401_1:RecordName(arg_401_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_401_1.iconTrs_.gameObject, false)
				arg_401_1.callingController_:SetSelectedState("normal")

				local var_404_20 = arg_401_1:GetWordFromCfg(115311100)
				local var_404_21 = arg_401_1:FormatText(var_404_20.content)

				arg_401_1.text_.text = var_404_21

				LuaForUtil.ClearLinePrefixSymbol(arg_401_1.text_)

				local var_404_22 = 41
				local var_404_23 = utf8.len(var_404_21)
				local var_404_24 = var_404_22 <= 0 and var_404_19 or var_404_19 * (var_404_23 / var_404_22)

				if var_404_24 > 0 and var_404_19 < var_404_24 then
					arg_401_1.talkMaxDuration = var_404_24

					if var_404_24 + var_404_18 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_24 + var_404_18
					end
				end

				arg_401_1.text_.text = var_404_21
				arg_401_1.typewritter.percent = 0

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(false)
				arg_401_1:RecordContent(arg_401_1.text_.text)
			end

			local var_404_25 = math.max(var_404_19, arg_401_1.talkMaxDuration)

			if var_404_18 <= arg_401_1.time_ and arg_401_1.time_ < var_404_18 + var_404_25 then
				arg_401_1.typewritter.percent = (arg_401_1.time_ - var_404_18) / var_404_25

				arg_401_1.typewritter:SetDirty()
			end

			if arg_401_1.time_ >= var_404_18 + var_404_25 and arg_401_1.time_ < var_404_18 + var_404_25 + arg_404_0 then
				arg_401_1.typewritter.percent = 1

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(true)
			end
		end
	end,
	Play115311101 = function(arg_405_0, arg_405_1)
		arg_405_1.time_ = 0
		arg_405_1.frameCnt_ = 0
		arg_405_1.state_ = "playing"
		arg_405_1.curTalkId_ = 115311101
		arg_405_1.duration_ = 5

		SetActive(arg_405_1.tipsGo_, false)

		function arg_405_1.onSingleLineFinish_()
			arg_405_1.onSingleLineUpdate_ = nil
			arg_405_1.onSingleLineFinish_ = nil
			arg_405_1.state_ = "waiting"
		end

		function arg_405_1.playNext_(arg_407_0)
			if arg_407_0 == 1 then
				arg_405_0:Play115311102(arg_405_1)
			end
		end

		function arg_405_1.onSingleLineUpdate_(arg_408_0)
			local var_408_0 = 0
			local var_408_1 = 1.35

			if var_408_0 < arg_405_1.time_ and arg_405_1.time_ <= var_408_0 + arg_408_0 then
				arg_405_1.talkMaxDuration = 0
				arg_405_1.dialogCg_.alpha = 1

				arg_405_1.dialog_:SetActive(true)
				SetActive(arg_405_1.leftNameGo_, false)

				arg_405_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_405_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_405_1:RecordName(arg_405_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_405_1.iconTrs_.gameObject, false)
				arg_405_1.callingController_:SetSelectedState("normal")

				local var_408_2 = arg_405_1:GetWordFromCfg(115311101)
				local var_408_3 = arg_405_1:FormatText(var_408_2.content)

				arg_405_1.text_.text = var_408_3

				LuaForUtil.ClearLinePrefixSymbol(arg_405_1.text_)

				local var_408_4 = 54
				local var_408_5 = utf8.len(var_408_3)
				local var_408_6 = var_408_4 <= 0 and var_408_1 or var_408_1 * (var_408_5 / var_408_4)

				if var_408_6 > 0 and var_408_1 < var_408_6 then
					arg_405_1.talkMaxDuration = var_408_6

					if var_408_6 + var_408_0 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_6 + var_408_0
					end
				end

				arg_405_1.text_.text = var_408_3
				arg_405_1.typewritter.percent = 0

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(false)
				arg_405_1:RecordContent(arg_405_1.text_.text)
			end

			local var_408_7 = math.max(var_408_1, arg_405_1.talkMaxDuration)

			if var_408_0 <= arg_405_1.time_ and arg_405_1.time_ < var_408_0 + var_408_7 then
				arg_405_1.typewritter.percent = (arg_405_1.time_ - var_408_0) / var_408_7

				arg_405_1.typewritter:SetDirty()
			end

			if arg_405_1.time_ >= var_408_0 + var_408_7 and arg_405_1.time_ < var_408_0 + var_408_7 + arg_408_0 then
				arg_405_1.typewritter.percent = 1

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(true)
			end
		end
	end,
	Play115311102 = function(arg_409_0, arg_409_1)
		arg_409_1.time_ = 0
		arg_409_1.frameCnt_ = 0
		arg_409_1.state_ = "playing"
		arg_409_1.curTalkId_ = 115311102
		arg_409_1.duration_ = 20.7

		local var_409_0 = {
			ja = 20.7,
			ko = 14.8,
			zh = 14.2,
			en = 17.066
		}
		local var_409_1 = manager.audio:GetLocalizationFlag()

		if var_409_0[var_409_1] ~= nil then
			arg_409_1.duration_ = var_409_0[var_409_1]
		end

		SetActive(arg_409_1.tipsGo_, false)

		function arg_409_1.onSingleLineFinish_()
			arg_409_1.onSingleLineUpdate_ = nil
			arg_409_1.onSingleLineFinish_ = nil
			arg_409_1.state_ = "waiting"
		end

		function arg_409_1.playNext_(arg_411_0)
			if arg_411_0 == 1 then
				arg_409_0:Play115311103(arg_409_1)
			end
		end

		function arg_409_1.onSingleLineUpdate_(arg_412_0)
			local var_412_0 = arg_409_1.actors_["10029"]
			local var_412_1 = 0

			if var_412_1 < arg_409_1.time_ and arg_409_1.time_ <= var_412_1 + arg_412_0 then
				local var_412_2 = var_412_0:GetComponent("Image")

				if var_412_2 then
					arg_409_1.var_.alphaMatValue10029 = var_412_2
					arg_409_1.var_.alphaOldValue10029 = var_412_2.color.a
				end

				arg_409_1.var_.alphaOldValue10029 = 0
			end

			local var_412_3 = 0.5

			if var_412_1 <= arg_409_1.time_ and arg_409_1.time_ < var_412_1 + var_412_3 then
				local var_412_4 = (arg_409_1.time_ - var_412_1) / var_412_3
				local var_412_5 = Mathf.Lerp(arg_409_1.var_.alphaOldValue10029, 1, var_412_4)

				if arg_409_1.var_.alphaMatValue10029 then
					local var_412_6 = arg_409_1.var_.alphaMatValue10029.color

					var_412_6.a = var_412_5
					arg_409_1.var_.alphaMatValue10029.color = var_412_6
				end
			end

			if arg_409_1.time_ >= var_412_1 + var_412_3 and arg_409_1.time_ < var_412_1 + var_412_3 + arg_412_0 and arg_409_1.var_.alphaMatValue10029 then
				local var_412_7 = arg_409_1.var_.alphaMatValue10029
				local var_412_8 = var_412_7.color

				var_412_8.a = 1
				var_412_7.color = var_412_8
			end

			local var_412_9 = arg_409_1.actors_["113801_1"]
			local var_412_10 = 0

			if var_412_10 < arg_409_1.time_ and arg_409_1.time_ <= var_412_10 + arg_412_0 then
				local var_412_11 = var_412_9:GetComponent("Image")

				if var_412_11 then
					arg_409_1.var_.alphaMatValue113801_1 = var_412_11
					arg_409_1.var_.alphaOldValue113801_1 = var_412_11.color.a
				end

				arg_409_1.var_.alphaOldValue113801_1 = 0
			end

			local var_412_12 = 0.5

			if var_412_10 <= arg_409_1.time_ and arg_409_1.time_ < var_412_10 + var_412_12 then
				local var_412_13 = (arg_409_1.time_ - var_412_10) / var_412_12
				local var_412_14 = Mathf.Lerp(arg_409_1.var_.alphaOldValue113801_1, 1, var_412_13)

				if arg_409_1.var_.alphaMatValue113801_1 then
					local var_412_15 = arg_409_1.var_.alphaMatValue113801_1.color

					var_412_15.a = var_412_14
					arg_409_1.var_.alphaMatValue113801_1.color = var_412_15
				end
			end

			if arg_409_1.time_ >= var_412_10 + var_412_12 and arg_409_1.time_ < var_412_10 + var_412_12 + arg_412_0 and arg_409_1.var_.alphaMatValue113801_1 then
				local var_412_16 = arg_409_1.var_.alphaMatValue113801_1
				local var_412_17 = var_412_16.color

				var_412_17.a = 1
				var_412_16.color = var_412_17
			end

			local var_412_18 = arg_409_1.actors_["113801_1"]
			local var_412_19 = 0

			if var_412_19 < arg_409_1.time_ and arg_409_1.time_ <= var_412_19 + arg_412_0 then
				local var_412_20 = var_412_18:GetComponent("Image")

				if var_412_20 then
					arg_409_1.var_.highlightMatValue113801_1 = var_412_20
				end
			end

			local var_412_21 = 0.2

			if var_412_19 <= arg_409_1.time_ and arg_409_1.time_ < var_412_19 + var_412_21 then
				local var_412_22 = (arg_409_1.time_ - var_412_19) / var_412_21

				if arg_409_1.var_.highlightMatValue113801_1 then
					local var_412_23 = Mathf.Lerp(0.5, 1, var_412_22)
					local var_412_24 = arg_409_1.var_.highlightMatValue113801_1
					local var_412_25 = var_412_24.color

					var_412_25.r = var_412_23
					var_412_25.g = var_412_23
					var_412_25.b = var_412_23
					var_412_24.color = var_412_25
				end
			end

			if arg_409_1.time_ >= var_412_19 + var_412_21 and arg_409_1.time_ < var_412_19 + var_412_21 + arg_412_0 and arg_409_1.var_.highlightMatValue113801_1 then
				local var_412_26 = 1

				var_412_18.transform:SetSiblingIndex(1)

				local var_412_27 = arg_409_1.var_.highlightMatValue113801_1
				local var_412_28 = var_412_27.color

				var_412_28.r = var_412_26
				var_412_28.g = var_412_26
				var_412_28.b = var_412_26
				var_412_27.color = var_412_28
			end

			local var_412_29 = 0
			local var_412_30 = 1.5

			if var_412_29 < arg_409_1.time_ and arg_409_1.time_ <= var_412_29 + arg_412_0 then
				arg_409_1.talkMaxDuration = 0
				arg_409_1.dialogCg_.alpha = 1

				arg_409_1.dialog_:SetActive(true)
				SetActive(arg_409_1.leftNameGo_, true)

				local var_412_31 = arg_409_1:FormatText(StoryNameCfg[94].name)

				arg_409_1.leftNameTxt_.text = var_412_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_409_1.leftNameTxt_.transform)

				arg_409_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_409_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_409_1:RecordName(arg_409_1.leftNameTxt_.text)
				SetActive(arg_409_1.iconTrs_.gameObject, false)
				arg_409_1.callingController_:SetSelectedState("normal")

				local var_412_32 = arg_409_1:GetWordFromCfg(115311102)
				local var_412_33 = arg_409_1:FormatText(var_412_32.content)

				arg_409_1.text_.text = var_412_33

				LuaForUtil.ClearLinePrefixSymbol(arg_409_1.text_)

				local var_412_34 = 60
				local var_412_35 = utf8.len(var_412_33)
				local var_412_36 = var_412_34 <= 0 and var_412_30 or var_412_30 * (var_412_35 / var_412_34)

				if var_412_36 > 0 and var_412_30 < var_412_36 then
					arg_409_1.talkMaxDuration = var_412_36

					if var_412_36 + var_412_29 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_36 + var_412_29
					end
				end

				arg_409_1.text_.text = var_412_33
				arg_409_1.typewritter.percent = 0

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311102", "story_v_out_115311.awb") ~= 0 then
					local var_412_37 = manager.audio:GetVoiceLength("story_v_out_115311", "115311102", "story_v_out_115311.awb") / 1000

					if var_412_37 + var_412_29 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_37 + var_412_29
					end

					if var_412_32.prefab_name ~= "" and arg_409_1.actors_[var_412_32.prefab_name] ~= nil then
						local var_412_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_409_1.actors_[var_412_32.prefab_name].transform, "story_v_out_115311", "115311102", "story_v_out_115311.awb")

						arg_409_1:RecordAudio("115311102", var_412_38)
						arg_409_1:RecordAudio("115311102", var_412_38)
					else
						arg_409_1:AudioAction("play", "voice", "story_v_out_115311", "115311102", "story_v_out_115311.awb")
					end

					arg_409_1:RecordHistoryTalkVoice("story_v_out_115311", "115311102", "story_v_out_115311.awb")
				end

				arg_409_1:RecordContent(arg_409_1.text_.text)
			end

			local var_412_39 = math.max(var_412_30, arg_409_1.talkMaxDuration)

			if var_412_29 <= arg_409_1.time_ and arg_409_1.time_ < var_412_29 + var_412_39 then
				arg_409_1.typewritter.percent = (arg_409_1.time_ - var_412_29) / var_412_39

				arg_409_1.typewritter:SetDirty()
			end

			if arg_409_1.time_ >= var_412_29 + var_412_39 and arg_409_1.time_ < var_412_29 + var_412_39 + arg_412_0 then
				arg_409_1.typewritter.percent = 1

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(true)
			end
		end
	end,
	Play115311103 = function(arg_413_0, arg_413_1)
		arg_413_1.time_ = 0
		arg_413_1.frameCnt_ = 0
		arg_413_1.state_ = "playing"
		arg_413_1.curTalkId_ = 115311103
		arg_413_1.duration_ = 5

		SetActive(arg_413_1.tipsGo_, false)

		function arg_413_1.onSingleLineFinish_()
			arg_413_1.onSingleLineUpdate_ = nil
			arg_413_1.onSingleLineFinish_ = nil
			arg_413_1.state_ = "waiting"
		end

		function arg_413_1.playNext_(arg_415_0)
			if arg_415_0 == 1 then
				arg_413_0:Play115311104(arg_413_1)
			end
		end

		function arg_413_1.onSingleLineUpdate_(arg_416_0)
			local var_416_0 = arg_413_1.actors_["113801_1"]
			local var_416_1 = 0

			if var_416_1 < arg_413_1.time_ and arg_413_1.time_ <= var_416_1 + arg_416_0 then
				local var_416_2 = var_416_0:GetComponent("Image")

				if var_416_2 then
					arg_413_1.var_.highlightMatValue113801_1 = var_416_2
				end
			end

			local var_416_3 = 0.2

			if var_416_1 <= arg_413_1.time_ and arg_413_1.time_ < var_416_1 + var_416_3 then
				local var_416_4 = (arg_413_1.time_ - var_416_1) / var_416_3

				if arg_413_1.var_.highlightMatValue113801_1 then
					local var_416_5 = Mathf.Lerp(1, 0.5, var_416_4)
					local var_416_6 = arg_413_1.var_.highlightMatValue113801_1
					local var_416_7 = var_416_6.color

					var_416_7.r = var_416_5
					var_416_7.g = var_416_5
					var_416_7.b = var_416_5
					var_416_6.color = var_416_7
				end
			end

			if arg_413_1.time_ >= var_416_1 + var_416_3 and arg_413_1.time_ < var_416_1 + var_416_3 + arg_416_0 and arg_413_1.var_.highlightMatValue113801_1 then
				local var_416_8 = 0.5
				local var_416_9 = arg_413_1.var_.highlightMatValue113801_1
				local var_416_10 = var_416_9.color

				var_416_10.r = var_416_8
				var_416_10.g = var_416_8
				var_416_10.b = var_416_8
				var_416_9.color = var_416_10
			end

			local var_416_11 = 0
			local var_416_12 = 0.725

			if var_416_11 < arg_413_1.time_ and arg_413_1.time_ <= var_416_11 + arg_416_0 then
				arg_413_1.talkMaxDuration = 0
				arg_413_1.dialogCg_.alpha = 1

				arg_413_1.dialog_:SetActive(true)
				SetActive(arg_413_1.leftNameGo_, false)

				arg_413_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_413_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_413_1:RecordName(arg_413_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_413_1.iconTrs_.gameObject, false)
				arg_413_1.callingController_:SetSelectedState("normal")

				local var_416_13 = arg_413_1:GetWordFromCfg(115311103)
				local var_416_14 = arg_413_1:FormatText(var_416_13.content)

				arg_413_1.text_.text = var_416_14

				LuaForUtil.ClearLinePrefixSymbol(arg_413_1.text_)

				local var_416_15 = 29
				local var_416_16 = utf8.len(var_416_14)
				local var_416_17 = var_416_15 <= 0 and var_416_12 or var_416_12 * (var_416_16 / var_416_15)

				if var_416_17 > 0 and var_416_12 < var_416_17 then
					arg_413_1.talkMaxDuration = var_416_17

					if var_416_17 + var_416_11 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_17 + var_416_11
					end
				end

				arg_413_1.text_.text = var_416_14
				arg_413_1.typewritter.percent = 0

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(false)
				arg_413_1:RecordContent(arg_413_1.text_.text)
			end

			local var_416_18 = math.max(var_416_12, arg_413_1.talkMaxDuration)

			if var_416_11 <= arg_413_1.time_ and arg_413_1.time_ < var_416_11 + var_416_18 then
				arg_413_1.typewritter.percent = (arg_413_1.time_ - var_416_11) / var_416_18

				arg_413_1.typewritter:SetDirty()
			end

			if arg_413_1.time_ >= var_416_11 + var_416_18 and arg_413_1.time_ < var_416_11 + var_416_18 + arg_416_0 then
				arg_413_1.typewritter.percent = 1

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(true)
			end
		end
	end,
	Play115311104 = function(arg_417_0, arg_417_1)
		arg_417_1.time_ = 0
		arg_417_1.frameCnt_ = 0
		arg_417_1.state_ = "playing"
		arg_417_1.curTalkId_ = 115311104
		arg_417_1.duration_ = 14.7

		local var_417_0 = {
			ja = 14.7,
			ko = 8.6,
			zh = 8.033,
			en = 7.5
		}
		local var_417_1 = manager.audio:GetLocalizationFlag()

		if var_417_0[var_417_1] ~= nil then
			arg_417_1.duration_ = var_417_0[var_417_1]
		end

		SetActive(arg_417_1.tipsGo_, false)

		function arg_417_1.onSingleLineFinish_()
			arg_417_1.onSingleLineUpdate_ = nil
			arg_417_1.onSingleLineFinish_ = nil
			arg_417_1.state_ = "waiting"
		end

		function arg_417_1.playNext_(arg_419_0)
			if arg_419_0 == 1 then
				arg_417_0:Play115311105(arg_417_1)
			end
		end

		function arg_417_1.onSingleLineUpdate_(arg_420_0)
			local var_420_0 = arg_417_1.actors_["113801_1"]
			local var_420_1 = 0

			if var_420_1 < arg_417_1.time_ and arg_417_1.time_ <= var_420_1 + arg_420_0 then
				local var_420_2 = var_420_0:GetComponent("Image")

				if var_420_2 then
					arg_417_1.var_.highlightMatValue113801_1 = var_420_2
				end
			end

			local var_420_3 = 0.2

			if var_420_1 <= arg_417_1.time_ and arg_417_1.time_ < var_420_1 + var_420_3 then
				local var_420_4 = (arg_417_1.time_ - var_420_1) / var_420_3

				if arg_417_1.var_.highlightMatValue113801_1 then
					local var_420_5 = Mathf.Lerp(0.5, 1, var_420_4)
					local var_420_6 = arg_417_1.var_.highlightMatValue113801_1
					local var_420_7 = var_420_6.color

					var_420_7.r = var_420_5
					var_420_7.g = var_420_5
					var_420_7.b = var_420_5
					var_420_6.color = var_420_7
				end
			end

			if arg_417_1.time_ >= var_420_1 + var_420_3 and arg_417_1.time_ < var_420_1 + var_420_3 + arg_420_0 and arg_417_1.var_.highlightMatValue113801_1 then
				local var_420_8 = 1

				var_420_0.transform:SetSiblingIndex(1)

				local var_420_9 = arg_417_1.var_.highlightMatValue113801_1
				local var_420_10 = var_420_9.color

				var_420_10.r = var_420_8
				var_420_10.g = var_420_8
				var_420_10.b = var_420_8
				var_420_9.color = var_420_10
			end

			local var_420_11 = 0
			local var_420_12 = 0.75

			if var_420_11 < arg_417_1.time_ and arg_417_1.time_ <= var_420_11 + arg_420_0 then
				arg_417_1.talkMaxDuration = 0
				arg_417_1.dialogCg_.alpha = 1

				arg_417_1.dialog_:SetActive(true)
				SetActive(arg_417_1.leftNameGo_, true)

				local var_420_13 = arg_417_1:FormatText(StoryNameCfg[94].name)

				arg_417_1.leftNameTxt_.text = var_420_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_417_1.leftNameTxt_.transform)

				arg_417_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_417_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_417_1:RecordName(arg_417_1.leftNameTxt_.text)
				SetActive(arg_417_1.iconTrs_.gameObject, false)
				arg_417_1.callingController_:SetSelectedState("normal")

				local var_420_14 = arg_417_1:GetWordFromCfg(115311104)
				local var_420_15 = arg_417_1:FormatText(var_420_14.content)

				arg_417_1.text_.text = var_420_15

				LuaForUtil.ClearLinePrefixSymbol(arg_417_1.text_)

				local var_420_16 = 30
				local var_420_17 = utf8.len(var_420_15)
				local var_420_18 = var_420_16 <= 0 and var_420_12 or var_420_12 * (var_420_17 / var_420_16)

				if var_420_18 > 0 and var_420_12 < var_420_18 then
					arg_417_1.talkMaxDuration = var_420_18

					if var_420_18 + var_420_11 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_18 + var_420_11
					end
				end

				arg_417_1.text_.text = var_420_15
				arg_417_1.typewritter.percent = 0

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311104", "story_v_out_115311.awb") ~= 0 then
					local var_420_19 = manager.audio:GetVoiceLength("story_v_out_115311", "115311104", "story_v_out_115311.awb") / 1000

					if var_420_19 + var_420_11 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_19 + var_420_11
					end

					if var_420_14.prefab_name ~= "" and arg_417_1.actors_[var_420_14.prefab_name] ~= nil then
						local var_420_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_417_1.actors_[var_420_14.prefab_name].transform, "story_v_out_115311", "115311104", "story_v_out_115311.awb")

						arg_417_1:RecordAudio("115311104", var_420_20)
						arg_417_1:RecordAudio("115311104", var_420_20)
					else
						arg_417_1:AudioAction("play", "voice", "story_v_out_115311", "115311104", "story_v_out_115311.awb")
					end

					arg_417_1:RecordHistoryTalkVoice("story_v_out_115311", "115311104", "story_v_out_115311.awb")
				end

				arg_417_1:RecordContent(arg_417_1.text_.text)
			end

			local var_420_21 = math.max(var_420_12, arg_417_1.talkMaxDuration)

			if var_420_11 <= arg_417_1.time_ and arg_417_1.time_ < var_420_11 + var_420_21 then
				arg_417_1.typewritter.percent = (arg_417_1.time_ - var_420_11) / var_420_21

				arg_417_1.typewritter:SetDirty()
			end

			if arg_417_1.time_ >= var_420_11 + var_420_21 and arg_417_1.time_ < var_420_11 + var_420_21 + arg_420_0 then
				arg_417_1.typewritter.percent = 1

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(true)
			end
		end
	end,
	Play115311105 = function(arg_421_0, arg_421_1)
		arg_421_1.time_ = 0
		arg_421_1.frameCnt_ = 0
		arg_421_1.state_ = "playing"
		arg_421_1.curTalkId_ = 115311105
		arg_421_1.duration_ = 12.066

		local var_421_0 = {
			ja = 8,
			ko = 10.366,
			zh = 12.066,
			en = 7.166
		}
		local var_421_1 = manager.audio:GetLocalizationFlag()

		if var_421_0[var_421_1] ~= nil then
			arg_421_1.duration_ = var_421_0[var_421_1]
		end

		SetActive(arg_421_1.tipsGo_, false)

		function arg_421_1.onSingleLineFinish_()
			arg_421_1.onSingleLineUpdate_ = nil
			arg_421_1.onSingleLineFinish_ = nil
			arg_421_1.state_ = "waiting"
		end

		function arg_421_1.playNext_(arg_423_0)
			if arg_423_0 == 1 then
				arg_421_0:Play115311106(arg_421_1)
			end
		end

		function arg_421_1.onSingleLineUpdate_(arg_424_0)
			local var_424_0 = 0
			local var_424_1 = 1.225

			if var_424_0 < arg_421_1.time_ and arg_421_1.time_ <= var_424_0 + arg_424_0 then
				arg_421_1.talkMaxDuration = 0
				arg_421_1.dialogCg_.alpha = 1

				arg_421_1.dialog_:SetActive(true)
				SetActive(arg_421_1.leftNameGo_, true)

				local var_424_2 = arg_421_1:FormatText(StoryNameCfg[94].name)

				arg_421_1.leftNameTxt_.text = var_424_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_421_1.leftNameTxt_.transform)

				arg_421_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_421_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_421_1:RecordName(arg_421_1.leftNameTxt_.text)
				SetActive(arg_421_1.iconTrs_.gameObject, false)
				arg_421_1.callingController_:SetSelectedState("normal")

				local var_424_3 = arg_421_1:GetWordFromCfg(115311105)
				local var_424_4 = arg_421_1:FormatText(var_424_3.content)

				arg_421_1.text_.text = var_424_4

				LuaForUtil.ClearLinePrefixSymbol(arg_421_1.text_)

				local var_424_5 = 49
				local var_424_6 = utf8.len(var_424_4)
				local var_424_7 = var_424_5 <= 0 and var_424_1 or var_424_1 * (var_424_6 / var_424_5)

				if var_424_7 > 0 and var_424_1 < var_424_7 then
					arg_421_1.talkMaxDuration = var_424_7

					if var_424_7 + var_424_0 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_7 + var_424_0
					end
				end

				arg_421_1.text_.text = var_424_4
				arg_421_1.typewritter.percent = 0

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311105", "story_v_out_115311.awb") ~= 0 then
					local var_424_8 = manager.audio:GetVoiceLength("story_v_out_115311", "115311105", "story_v_out_115311.awb") / 1000

					if var_424_8 + var_424_0 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_8 + var_424_0
					end

					if var_424_3.prefab_name ~= "" and arg_421_1.actors_[var_424_3.prefab_name] ~= nil then
						local var_424_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_421_1.actors_[var_424_3.prefab_name].transform, "story_v_out_115311", "115311105", "story_v_out_115311.awb")

						arg_421_1:RecordAudio("115311105", var_424_9)
						arg_421_1:RecordAudio("115311105", var_424_9)
					else
						arg_421_1:AudioAction("play", "voice", "story_v_out_115311", "115311105", "story_v_out_115311.awb")
					end

					arg_421_1:RecordHistoryTalkVoice("story_v_out_115311", "115311105", "story_v_out_115311.awb")
				end

				arg_421_1:RecordContent(arg_421_1.text_.text)
			end

			local var_424_10 = math.max(var_424_1, arg_421_1.talkMaxDuration)

			if var_424_0 <= arg_421_1.time_ and arg_421_1.time_ < var_424_0 + var_424_10 then
				arg_421_1.typewritter.percent = (arg_421_1.time_ - var_424_0) / var_424_10

				arg_421_1.typewritter:SetDirty()
			end

			if arg_421_1.time_ >= var_424_0 + var_424_10 and arg_421_1.time_ < var_424_0 + var_424_10 + arg_424_0 then
				arg_421_1.typewritter.percent = 1

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(true)
			end
		end
	end,
	Play115311106 = function(arg_425_0, arg_425_1)
		arg_425_1.time_ = 0
		arg_425_1.frameCnt_ = 0
		arg_425_1.state_ = "playing"
		arg_425_1.curTalkId_ = 115311106
		arg_425_1.duration_ = 5

		SetActive(arg_425_1.tipsGo_, false)

		function arg_425_1.onSingleLineFinish_()
			arg_425_1.onSingleLineUpdate_ = nil
			arg_425_1.onSingleLineFinish_ = nil
			arg_425_1.state_ = "waiting"
		end

		function arg_425_1.playNext_(arg_427_0)
			if arg_427_0 == 1 then
				arg_425_0:Play115311107(arg_425_1)
			end
		end

		function arg_425_1.onSingleLineUpdate_(arg_428_0)
			local var_428_0 = arg_425_1.actors_["113801_1"]
			local var_428_1 = 0

			if var_428_1 < arg_425_1.time_ and arg_425_1.time_ <= var_428_1 + arg_428_0 then
				local var_428_2 = var_428_0:GetComponent("Image")

				if var_428_2 then
					arg_425_1.var_.highlightMatValue113801_1 = var_428_2
				end
			end

			local var_428_3 = 0.2

			if var_428_1 <= arg_425_1.time_ and arg_425_1.time_ < var_428_1 + var_428_3 then
				local var_428_4 = (arg_425_1.time_ - var_428_1) / var_428_3

				if arg_425_1.var_.highlightMatValue113801_1 then
					local var_428_5 = Mathf.Lerp(1, 0.5, var_428_4)
					local var_428_6 = arg_425_1.var_.highlightMatValue113801_1
					local var_428_7 = var_428_6.color

					var_428_7.r = var_428_5
					var_428_7.g = var_428_5
					var_428_7.b = var_428_5
					var_428_6.color = var_428_7
				end
			end

			if arg_425_1.time_ >= var_428_1 + var_428_3 and arg_425_1.time_ < var_428_1 + var_428_3 + arg_428_0 and arg_425_1.var_.highlightMatValue113801_1 then
				local var_428_8 = 0.5
				local var_428_9 = arg_425_1.var_.highlightMatValue113801_1
				local var_428_10 = var_428_9.color

				var_428_10.r = var_428_8
				var_428_10.g = var_428_8
				var_428_10.b = var_428_8
				var_428_9.color = var_428_10
			end

			local var_428_11 = 0
			local var_428_12 = 1.225

			if var_428_11 < arg_425_1.time_ and arg_425_1.time_ <= var_428_11 + arg_428_0 then
				arg_425_1.talkMaxDuration = 0
				arg_425_1.dialogCg_.alpha = 1

				arg_425_1.dialog_:SetActive(true)
				SetActive(arg_425_1.leftNameGo_, false)

				arg_425_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_425_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_425_1:RecordName(arg_425_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_425_1.iconTrs_.gameObject, false)
				arg_425_1.callingController_:SetSelectedState("normal")

				local var_428_13 = arg_425_1:GetWordFromCfg(115311106)
				local var_428_14 = arg_425_1:FormatText(var_428_13.content)

				arg_425_1.text_.text = var_428_14

				LuaForUtil.ClearLinePrefixSymbol(arg_425_1.text_)

				local var_428_15 = 49
				local var_428_16 = utf8.len(var_428_14)
				local var_428_17 = var_428_15 <= 0 and var_428_12 or var_428_12 * (var_428_16 / var_428_15)

				if var_428_17 > 0 and var_428_12 < var_428_17 then
					arg_425_1.talkMaxDuration = var_428_17

					if var_428_17 + var_428_11 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_17 + var_428_11
					end
				end

				arg_425_1.text_.text = var_428_14
				arg_425_1.typewritter.percent = 0

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(false)
				arg_425_1:RecordContent(arg_425_1.text_.text)
			end

			local var_428_18 = math.max(var_428_12, arg_425_1.talkMaxDuration)

			if var_428_11 <= arg_425_1.time_ and arg_425_1.time_ < var_428_11 + var_428_18 then
				arg_425_1.typewritter.percent = (arg_425_1.time_ - var_428_11) / var_428_18

				arg_425_1.typewritter:SetDirty()
			end

			if arg_425_1.time_ >= var_428_11 + var_428_18 and arg_425_1.time_ < var_428_11 + var_428_18 + arg_428_0 then
				arg_425_1.typewritter.percent = 1

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(true)
			end
		end
	end,
	Play115311107 = function(arg_429_0, arg_429_1)
		arg_429_1.time_ = 0
		arg_429_1.frameCnt_ = 0
		arg_429_1.state_ = "playing"
		arg_429_1.curTalkId_ = 115311107
		arg_429_1.duration_ = 5

		SetActive(arg_429_1.tipsGo_, false)

		function arg_429_1.onSingleLineFinish_()
			arg_429_1.onSingleLineUpdate_ = nil
			arg_429_1.onSingleLineFinish_ = nil
			arg_429_1.state_ = "waiting"
		end

		function arg_429_1.playNext_(arg_431_0)
			if arg_431_0 == 1 then
				arg_429_0:Play115311108(arg_429_1)
			end
		end

		function arg_429_1.onSingleLineUpdate_(arg_432_0)
			local var_432_0 = 0
			local var_432_1 = 1.1

			if var_432_0 < arg_429_1.time_ and arg_429_1.time_ <= var_432_0 + arg_432_0 then
				arg_429_1.talkMaxDuration = 0
				arg_429_1.dialogCg_.alpha = 1

				arg_429_1.dialog_:SetActive(true)
				SetActive(arg_429_1.leftNameGo_, false)

				arg_429_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_429_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_429_1:RecordName(arg_429_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_429_1.iconTrs_.gameObject, false)
				arg_429_1.callingController_:SetSelectedState("normal")

				local var_432_2 = arg_429_1:GetWordFromCfg(115311107)
				local var_432_3 = arg_429_1:FormatText(var_432_2.content)

				arg_429_1.text_.text = var_432_3

				LuaForUtil.ClearLinePrefixSymbol(arg_429_1.text_)

				local var_432_4 = 44
				local var_432_5 = utf8.len(var_432_3)
				local var_432_6 = var_432_4 <= 0 and var_432_1 or var_432_1 * (var_432_5 / var_432_4)

				if var_432_6 > 0 and var_432_1 < var_432_6 then
					arg_429_1.talkMaxDuration = var_432_6

					if var_432_6 + var_432_0 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_6 + var_432_0
					end
				end

				arg_429_1.text_.text = var_432_3
				arg_429_1.typewritter.percent = 0

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(false)
				arg_429_1:RecordContent(arg_429_1.text_.text)
			end

			local var_432_7 = math.max(var_432_1, arg_429_1.talkMaxDuration)

			if var_432_0 <= arg_429_1.time_ and arg_429_1.time_ < var_432_0 + var_432_7 then
				arg_429_1.typewritter.percent = (arg_429_1.time_ - var_432_0) / var_432_7

				arg_429_1.typewritter:SetDirty()
			end

			if arg_429_1.time_ >= var_432_0 + var_432_7 and arg_429_1.time_ < var_432_0 + var_432_7 + arg_432_0 then
				arg_429_1.typewritter.percent = 1

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(true)
			end
		end
	end,
	Play115311108 = function(arg_433_0, arg_433_1)
		arg_433_1.time_ = 0
		arg_433_1.frameCnt_ = 0
		arg_433_1.state_ = "playing"
		arg_433_1.curTalkId_ = 115311108
		arg_433_1.duration_ = 8.866

		local var_433_0 = {
			ja = 8.866,
			ko = 5.366,
			zh = 6.633,
			en = 8.866
		}
		local var_433_1 = manager.audio:GetLocalizationFlag()

		if var_433_0[var_433_1] ~= nil then
			arg_433_1.duration_ = var_433_0[var_433_1]
		end

		SetActive(arg_433_1.tipsGo_, false)

		function arg_433_1.onSingleLineFinish_()
			arg_433_1.onSingleLineUpdate_ = nil
			arg_433_1.onSingleLineFinish_ = nil
			arg_433_1.state_ = "waiting"
		end

		function arg_433_1.playNext_(arg_435_0)
			if arg_435_0 == 1 then
				arg_433_0:Play115311109(arg_433_1)
			end
		end

		function arg_433_1.onSingleLineUpdate_(arg_436_0)
			local var_436_0 = arg_433_1.actors_["113801_1"]
			local var_436_1 = 0

			if var_436_1 < arg_433_1.time_ and arg_433_1.time_ <= var_436_1 + arg_436_0 then
				local var_436_2 = var_436_0:GetComponent("Image")

				if var_436_2 then
					arg_433_1.var_.highlightMatValue113801_1 = var_436_2
				end
			end

			local var_436_3 = 0.2

			if var_436_1 <= arg_433_1.time_ and arg_433_1.time_ < var_436_1 + var_436_3 then
				local var_436_4 = (arg_433_1.time_ - var_436_1) / var_436_3

				if arg_433_1.var_.highlightMatValue113801_1 then
					local var_436_5 = Mathf.Lerp(0.5, 1, var_436_4)
					local var_436_6 = arg_433_1.var_.highlightMatValue113801_1
					local var_436_7 = var_436_6.color

					var_436_7.r = var_436_5
					var_436_7.g = var_436_5
					var_436_7.b = var_436_5
					var_436_6.color = var_436_7
				end
			end

			if arg_433_1.time_ >= var_436_1 + var_436_3 and arg_433_1.time_ < var_436_1 + var_436_3 + arg_436_0 and arg_433_1.var_.highlightMatValue113801_1 then
				local var_436_8 = 1

				var_436_0.transform:SetSiblingIndex(1)

				local var_436_9 = arg_433_1.var_.highlightMatValue113801_1
				local var_436_10 = var_436_9.color

				var_436_10.r = var_436_8
				var_436_10.g = var_436_8
				var_436_10.b = var_436_8
				var_436_9.color = var_436_10
			end

			local var_436_11 = 0
			local var_436_12 = 0.675

			if var_436_11 < arg_433_1.time_ and arg_433_1.time_ <= var_436_11 + arg_436_0 then
				arg_433_1.talkMaxDuration = 0
				arg_433_1.dialogCg_.alpha = 1

				arg_433_1.dialog_:SetActive(true)
				SetActive(arg_433_1.leftNameGo_, true)

				local var_436_13 = arg_433_1:FormatText(StoryNameCfg[94].name)

				arg_433_1.leftNameTxt_.text = var_436_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_433_1.leftNameTxt_.transform)

				arg_433_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_433_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_433_1:RecordName(arg_433_1.leftNameTxt_.text)
				SetActive(arg_433_1.iconTrs_.gameObject, false)
				arg_433_1.callingController_:SetSelectedState("normal")

				local var_436_14 = arg_433_1:GetWordFromCfg(115311108)
				local var_436_15 = arg_433_1:FormatText(var_436_14.content)

				arg_433_1.text_.text = var_436_15

				LuaForUtil.ClearLinePrefixSymbol(arg_433_1.text_)

				local var_436_16 = 25
				local var_436_17 = utf8.len(var_436_15)
				local var_436_18 = var_436_16 <= 0 and var_436_12 or var_436_12 * (var_436_17 / var_436_16)

				if var_436_18 > 0 and var_436_12 < var_436_18 then
					arg_433_1.talkMaxDuration = var_436_18

					if var_436_18 + var_436_11 > arg_433_1.duration_ then
						arg_433_1.duration_ = var_436_18 + var_436_11
					end
				end

				arg_433_1.text_.text = var_436_15
				arg_433_1.typewritter.percent = 0

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311108", "story_v_out_115311.awb") ~= 0 then
					local var_436_19 = manager.audio:GetVoiceLength("story_v_out_115311", "115311108", "story_v_out_115311.awb") / 1000

					if var_436_19 + var_436_11 > arg_433_1.duration_ then
						arg_433_1.duration_ = var_436_19 + var_436_11
					end

					if var_436_14.prefab_name ~= "" and arg_433_1.actors_[var_436_14.prefab_name] ~= nil then
						local var_436_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_433_1.actors_[var_436_14.prefab_name].transform, "story_v_out_115311", "115311108", "story_v_out_115311.awb")

						arg_433_1:RecordAudio("115311108", var_436_20)
						arg_433_1:RecordAudio("115311108", var_436_20)
					else
						arg_433_1:AudioAction("play", "voice", "story_v_out_115311", "115311108", "story_v_out_115311.awb")
					end

					arg_433_1:RecordHistoryTalkVoice("story_v_out_115311", "115311108", "story_v_out_115311.awb")
				end

				arg_433_1:RecordContent(arg_433_1.text_.text)
			end

			local var_436_21 = math.max(var_436_12, arg_433_1.talkMaxDuration)

			if var_436_11 <= arg_433_1.time_ and arg_433_1.time_ < var_436_11 + var_436_21 then
				arg_433_1.typewritter.percent = (arg_433_1.time_ - var_436_11) / var_436_21

				arg_433_1.typewritter:SetDirty()
			end

			if arg_433_1.time_ >= var_436_11 + var_436_21 and arg_433_1.time_ < var_436_11 + var_436_21 + arg_436_0 then
				arg_433_1.typewritter.percent = 1

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(true)
			end
		end
	end,
	Play115311109 = function(arg_437_0, arg_437_1)
		arg_437_1.time_ = 0
		arg_437_1.frameCnt_ = 0
		arg_437_1.state_ = "playing"
		arg_437_1.curTalkId_ = 115311109
		arg_437_1.duration_ = 15.6

		local var_437_0 = {
			ja = 15.6,
			ko = 9.866,
			zh = 10.566,
			en = 10.666
		}
		local var_437_1 = manager.audio:GetLocalizationFlag()

		if var_437_0[var_437_1] ~= nil then
			arg_437_1.duration_ = var_437_0[var_437_1]
		end

		SetActive(arg_437_1.tipsGo_, false)

		function arg_437_1.onSingleLineFinish_()
			arg_437_1.onSingleLineUpdate_ = nil
			arg_437_1.onSingleLineFinish_ = nil
			arg_437_1.state_ = "waiting"
		end

		function arg_437_1.playNext_(arg_439_0)
			if arg_439_0 == 1 then
				arg_437_0:Play115311110(arg_437_1)
			end
		end

		function arg_437_1.onSingleLineUpdate_(arg_440_0)
			local var_440_0 = 0
			local var_440_1 = 0.9

			if var_440_0 < arg_437_1.time_ and arg_437_1.time_ <= var_440_0 + arg_440_0 then
				arg_437_1.talkMaxDuration = 0
				arg_437_1.dialogCg_.alpha = 1

				arg_437_1.dialog_:SetActive(true)
				SetActive(arg_437_1.leftNameGo_, true)

				local var_440_2 = arg_437_1:FormatText(StoryNameCfg[94].name)

				arg_437_1.leftNameTxt_.text = var_440_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_437_1.leftNameTxt_.transform)

				arg_437_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_437_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_437_1:RecordName(arg_437_1.leftNameTxt_.text)
				SetActive(arg_437_1.iconTrs_.gameObject, false)
				arg_437_1.callingController_:SetSelectedState("normal")

				local var_440_3 = arg_437_1:GetWordFromCfg(115311109)
				local var_440_4 = arg_437_1:FormatText(var_440_3.content)

				arg_437_1.text_.text = var_440_4

				LuaForUtil.ClearLinePrefixSymbol(arg_437_1.text_)

				local var_440_5 = 36
				local var_440_6 = utf8.len(var_440_4)
				local var_440_7 = var_440_5 <= 0 and var_440_1 or var_440_1 * (var_440_6 / var_440_5)

				if var_440_7 > 0 and var_440_1 < var_440_7 then
					arg_437_1.talkMaxDuration = var_440_7

					if var_440_7 + var_440_0 > arg_437_1.duration_ then
						arg_437_1.duration_ = var_440_7 + var_440_0
					end
				end

				arg_437_1.text_.text = var_440_4
				arg_437_1.typewritter.percent = 0

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311109", "story_v_out_115311.awb") ~= 0 then
					local var_440_8 = manager.audio:GetVoiceLength("story_v_out_115311", "115311109", "story_v_out_115311.awb") / 1000

					if var_440_8 + var_440_0 > arg_437_1.duration_ then
						arg_437_1.duration_ = var_440_8 + var_440_0
					end

					if var_440_3.prefab_name ~= "" and arg_437_1.actors_[var_440_3.prefab_name] ~= nil then
						local var_440_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_437_1.actors_[var_440_3.prefab_name].transform, "story_v_out_115311", "115311109", "story_v_out_115311.awb")

						arg_437_1:RecordAudio("115311109", var_440_9)
						arg_437_1:RecordAudio("115311109", var_440_9)
					else
						arg_437_1:AudioAction("play", "voice", "story_v_out_115311", "115311109", "story_v_out_115311.awb")
					end

					arg_437_1:RecordHistoryTalkVoice("story_v_out_115311", "115311109", "story_v_out_115311.awb")
				end

				arg_437_1:RecordContent(arg_437_1.text_.text)
			end

			local var_440_10 = math.max(var_440_1, arg_437_1.talkMaxDuration)

			if var_440_0 <= arg_437_1.time_ and arg_437_1.time_ < var_440_0 + var_440_10 then
				arg_437_1.typewritter.percent = (arg_437_1.time_ - var_440_0) / var_440_10

				arg_437_1.typewritter:SetDirty()
			end

			if arg_437_1.time_ >= var_440_0 + var_440_10 and arg_437_1.time_ < var_440_0 + var_440_10 + arg_440_0 then
				arg_437_1.typewritter.percent = 1

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(true)
			end
		end
	end,
	Play115311110 = function(arg_441_0, arg_441_1)
		arg_441_1.time_ = 0
		arg_441_1.frameCnt_ = 0
		arg_441_1.state_ = "playing"
		arg_441_1.curTalkId_ = 115311110
		arg_441_1.duration_ = 6.1

		local var_441_0 = {
			ja = 5.3,
			ko = 5.766,
			zh = 6.1,
			en = 5.766
		}
		local var_441_1 = manager.audio:GetLocalizationFlag()

		if var_441_0[var_441_1] ~= nil then
			arg_441_1.duration_ = var_441_0[var_441_1]
		end

		SetActive(arg_441_1.tipsGo_, false)

		function arg_441_1.onSingleLineFinish_()
			arg_441_1.onSingleLineUpdate_ = nil
			arg_441_1.onSingleLineFinish_ = nil
			arg_441_1.state_ = "waiting"
		end

		function arg_441_1.playNext_(arg_443_0)
			if arg_443_0 == 1 then
				arg_441_0:Play115311111(arg_441_1)
			end
		end

		function arg_441_1.onSingleLineUpdate_(arg_444_0)
			local var_444_0 = 2

			if var_444_0 < arg_441_1.time_ and arg_441_1.time_ <= var_444_0 + arg_444_0 then
				local var_444_1 = manager.ui.mainCamera.transform.localPosition
				local var_444_2 = Vector3.New(0, 0, 10) + Vector3.New(var_444_1.x, var_444_1.y, 0)
				local var_444_3 = arg_441_1.bgs_.ST22a

				var_444_3.transform.localPosition = var_444_2
				var_444_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_444_4 = var_444_3:GetComponent("SpriteRenderer")

				if var_444_4 and var_444_4.sprite then
					local var_444_5 = (var_444_3.transform.localPosition - var_444_1).z
					local var_444_6 = manager.ui.mainCameraCom_
					local var_444_7 = 2 * var_444_5 * Mathf.Tan(var_444_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_444_8 = var_444_7 * var_444_6.aspect
					local var_444_9 = var_444_4.sprite.bounds.size.x
					local var_444_10 = var_444_4.sprite.bounds.size.y
					local var_444_11 = var_444_8 / var_444_9
					local var_444_12 = var_444_7 / var_444_10
					local var_444_13 = var_444_12 < var_444_11 and var_444_11 or var_444_12

					var_444_3.transform.localScale = Vector3.New(var_444_13, var_444_13, 0)
				end

				for iter_444_0, iter_444_1 in pairs(arg_441_1.bgs_) do
					if iter_444_0 ~= "ST22a" then
						iter_444_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_444_14 = 0

			if var_444_14 < arg_441_1.time_ and arg_441_1.time_ <= var_444_14 + arg_444_0 then
				arg_441_1.mask_.enabled = true
				arg_441_1.mask_.raycastTarget = true

				arg_441_1:SetGaussion(false)
			end

			local var_444_15 = 2

			if var_444_14 <= arg_441_1.time_ and arg_441_1.time_ < var_444_14 + var_444_15 then
				local var_444_16 = (arg_441_1.time_ - var_444_14) / var_444_15
				local var_444_17 = Color.New(0, 0, 0)

				var_444_17.a = Mathf.Lerp(0, 1, var_444_16)
				arg_441_1.mask_.color = var_444_17
			end

			if arg_441_1.time_ >= var_444_14 + var_444_15 and arg_441_1.time_ < var_444_14 + var_444_15 + arg_444_0 then
				local var_444_18 = Color.New(0, 0, 0)

				var_444_18.a = 1
				arg_441_1.mask_.color = var_444_18
			end

			local var_444_19 = 2

			if var_444_19 < arg_441_1.time_ and arg_441_1.time_ <= var_444_19 + arg_444_0 then
				arg_441_1.mask_.enabled = true
				arg_441_1.mask_.raycastTarget = true

				arg_441_1:SetGaussion(false)
			end

			local var_444_20 = 2

			if var_444_19 <= arg_441_1.time_ and arg_441_1.time_ < var_444_19 + var_444_20 then
				local var_444_21 = (arg_441_1.time_ - var_444_19) / var_444_20
				local var_444_22 = Color.New(0, 0, 0)

				var_444_22.a = Mathf.Lerp(1, 0, var_444_21)
				arg_441_1.mask_.color = var_444_22
			end

			if arg_441_1.time_ >= var_444_19 + var_444_20 and arg_441_1.time_ < var_444_19 + var_444_20 + arg_444_0 then
				local var_444_23 = Color.New(0, 0, 0)
				local var_444_24 = 0

				arg_441_1.mask_.enabled = false
				var_444_23.a = var_444_24
				arg_441_1.mask_.color = var_444_23
			end

			local var_444_25 = arg_441_1.actors_["113801_1"].transform
			local var_444_26 = 1.966

			if var_444_26 < arg_441_1.time_ and arg_441_1.time_ <= var_444_26 + arg_444_0 then
				arg_441_1.var_.moveOldPos113801_1 = var_444_25.localPosition
				var_444_25.localScale = Vector3.New(1, 1, 1)

				arg_441_1:CheckSpriteTmpPos("113801_1", 7)
			end

			local var_444_27 = 0.001

			if var_444_26 <= arg_441_1.time_ and arg_441_1.time_ < var_444_26 + var_444_27 then
				local var_444_28 = (arg_441_1.time_ - var_444_26) / var_444_27
				local var_444_29 = Vector3.New(0, -2000, -370)

				var_444_25.localPosition = Vector3.Lerp(arg_441_1.var_.moveOldPos113801_1, var_444_29, var_444_28)
			end

			if arg_441_1.time_ >= var_444_26 + var_444_27 and arg_441_1.time_ < var_444_26 + var_444_27 + arg_444_0 then
				var_444_25.localPosition = Vector3.New(0, -2000, -370)
			end

			local var_444_30 = arg_441_1.actors_["10029"].transform
			local var_444_31 = 1.966

			if var_444_31 < arg_441_1.time_ and arg_441_1.time_ <= var_444_31 + arg_444_0 then
				arg_441_1.var_.moveOldPos10029 = var_444_30.localPosition
				var_444_30.localScale = Vector3.New(1, 1, 1)

				arg_441_1:CheckSpriteTmpPos("10029", 7)
			end

			local var_444_32 = 0.001

			if var_444_31 <= arg_441_1.time_ and arg_441_1.time_ < var_444_31 + var_444_32 then
				local var_444_33 = (arg_441_1.time_ - var_444_31) / var_444_32
				local var_444_34 = Vector3.New(0, -2000, -180)

				var_444_30.localPosition = Vector3.Lerp(arg_441_1.var_.moveOldPos10029, var_444_34, var_444_33)
			end

			if arg_441_1.time_ >= var_444_31 + var_444_32 and arg_441_1.time_ < var_444_31 + var_444_32 + arg_444_0 then
				var_444_30.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_444_35 = arg_441_1.actors_["10030"].transform
			local var_444_36 = 3.8

			if var_444_36 < arg_441_1.time_ and arg_441_1.time_ <= var_444_36 + arg_444_0 then
				arg_441_1.var_.moveOldPos10030 = var_444_35.localPosition
				var_444_35.localScale = Vector3.New(1, 1, 1)

				arg_441_1:CheckSpriteTmpPos("10030", 3)

				local var_444_37 = var_444_35.childCount

				for iter_444_2 = 0, var_444_37 - 1 do
					local var_444_38 = var_444_35:GetChild(iter_444_2)

					if var_444_38.name == "split_2" or not string.find(var_444_38.name, "split") then
						var_444_38.gameObject:SetActive(true)
					else
						var_444_38.gameObject:SetActive(false)
					end
				end
			end

			local var_444_39 = 0.001

			if var_444_36 <= arg_441_1.time_ and arg_441_1.time_ < var_444_36 + var_444_39 then
				local var_444_40 = (arg_441_1.time_ - var_444_36) / var_444_39
				local var_444_41 = Vector3.New(0, -390, 150)

				var_444_35.localPosition = Vector3.Lerp(arg_441_1.var_.moveOldPos10030, var_444_41, var_444_40)
			end

			if arg_441_1.time_ >= var_444_36 + var_444_39 and arg_441_1.time_ < var_444_36 + var_444_39 + arg_444_0 then
				var_444_35.localPosition = Vector3.New(0, -390, 150)
			end

			local var_444_42 = arg_441_1.actors_["10030"]
			local var_444_43 = 3.8

			if var_444_43 < arg_441_1.time_ and arg_441_1.time_ <= var_444_43 + arg_444_0 then
				local var_444_44 = var_444_42:GetComponentInChildren(typeof(CanvasGroup))

				if var_444_44 then
					arg_441_1.var_.alphaOldValue10030 = var_444_44.alpha
					arg_441_1.var_.characterEffect10030 = var_444_44
				end

				arg_441_1.var_.alphaOldValue10030 = 0
			end

			local var_444_45 = 0.5

			if var_444_43 <= arg_441_1.time_ and arg_441_1.time_ < var_444_43 + var_444_45 then
				local var_444_46 = (arg_441_1.time_ - var_444_43) / var_444_45
				local var_444_47 = Mathf.Lerp(arg_441_1.var_.alphaOldValue10030, 1, var_444_46)

				if arg_441_1.var_.characterEffect10030 then
					arg_441_1.var_.characterEffect10030.alpha = var_444_47
				end
			end

			if arg_441_1.time_ >= var_444_43 + var_444_45 and arg_441_1.time_ < var_444_43 + var_444_45 + arg_444_0 and arg_441_1.var_.characterEffect10030 then
				arg_441_1.var_.characterEffect10030.alpha = 1
			end

			local var_444_48 = arg_441_1.actors_["10030"]
			local var_444_49 = 3.8

			if var_444_49 < arg_441_1.time_ and arg_441_1.time_ <= var_444_49 + arg_444_0 and arg_441_1.var_.actorSpriteComps10030 == nil then
				arg_441_1.var_.actorSpriteComps10030 = var_444_48:GetComponentsInChildren(typeof(Image), true)
			end

			local var_444_50 = 0.2

			if var_444_49 <= arg_441_1.time_ and arg_441_1.time_ < var_444_49 + var_444_50 then
				local var_444_51 = (arg_441_1.time_ - var_444_49) / var_444_50

				if arg_441_1.var_.actorSpriteComps10030 then
					for iter_444_3, iter_444_4 in pairs(arg_441_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_444_4 then
							local var_444_52 = Mathf.Lerp(iter_444_4.color.r, 1, var_444_51)

							iter_444_4.color = Color.New(var_444_52, var_444_52, var_444_52)
						end
					end
				end
			end

			if arg_441_1.time_ >= var_444_49 + var_444_50 and arg_441_1.time_ < var_444_49 + var_444_50 + arg_444_0 and arg_441_1.var_.actorSpriteComps10030 then
				local var_444_53 = 1

				for iter_444_5, iter_444_6 in pairs(arg_441_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_444_6 then
						iter_444_6.color = Color.New(var_444_53, var_444_53, var_444_53)
					end
				end

				arg_441_1.var_.actorSpriteComps10030 = nil
			end

			if arg_441_1.frameCnt_ <= 1 then
				arg_441_1.dialog_:SetActive(false)
			end

			local var_444_54 = 4
			local var_444_55 = 0.15

			if var_444_54 < arg_441_1.time_ and arg_441_1.time_ <= var_444_54 + arg_444_0 then
				arg_441_1.talkMaxDuration = 0

				arg_441_1.dialog_:SetActive(true)

				local var_444_56 = LeanTween.value(arg_441_1.dialog_, 0, 1, 0.3)

				var_444_56:setOnUpdate(LuaHelper.FloatAction(function(arg_445_0)
					arg_441_1.dialogCg_.alpha = arg_445_0
				end))
				var_444_56:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_441_1.dialog_)
					var_444_56:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_441_1.duration_ = arg_441_1.duration_ + 0.3

				SetActive(arg_441_1.leftNameGo_, true)

				local var_444_57 = arg_441_1:FormatText(StoryNameCfg[309].name)

				arg_441_1.leftNameTxt_.text = var_444_57

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_441_1.leftNameTxt_.transform)

				arg_441_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_441_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_441_1:RecordName(arg_441_1.leftNameTxt_.text)
				SetActive(arg_441_1.iconTrs_.gameObject, false)
				arg_441_1.callingController_:SetSelectedState("normal")

				local var_444_58 = arg_441_1:GetWordFromCfg(115311110)
				local var_444_59 = arg_441_1:FormatText(var_444_58.content)

				arg_441_1.text_.text = var_444_59

				LuaForUtil.ClearLinePrefixSymbol(arg_441_1.text_)

				local var_444_60 = 6
				local var_444_61 = utf8.len(var_444_59)
				local var_444_62 = var_444_60 <= 0 and var_444_55 or var_444_55 * (var_444_61 / var_444_60)

				if var_444_62 > 0 and var_444_55 < var_444_62 then
					arg_441_1.talkMaxDuration = var_444_62
					var_444_54 = var_444_54 + 0.3

					if var_444_62 + var_444_54 > arg_441_1.duration_ then
						arg_441_1.duration_ = var_444_62 + var_444_54
					end
				end

				arg_441_1.text_.text = var_444_59
				arg_441_1.typewritter.percent = 0

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311110", "story_v_out_115311.awb") ~= 0 then
					local var_444_63 = manager.audio:GetVoiceLength("story_v_out_115311", "115311110", "story_v_out_115311.awb") / 1000

					if var_444_63 + var_444_54 > arg_441_1.duration_ then
						arg_441_1.duration_ = var_444_63 + var_444_54
					end

					if var_444_58.prefab_name ~= "" and arg_441_1.actors_[var_444_58.prefab_name] ~= nil then
						local var_444_64 = LuaForUtil.PlayVoiceWithCriLipsync(arg_441_1.actors_[var_444_58.prefab_name].transform, "story_v_out_115311", "115311110", "story_v_out_115311.awb")

						arg_441_1:RecordAudio("115311110", var_444_64)
						arg_441_1:RecordAudio("115311110", var_444_64)
					else
						arg_441_1:AudioAction("play", "voice", "story_v_out_115311", "115311110", "story_v_out_115311.awb")
					end

					arg_441_1:RecordHistoryTalkVoice("story_v_out_115311", "115311110", "story_v_out_115311.awb")
				end

				arg_441_1:RecordContent(arg_441_1.text_.text)
			end

			local var_444_65 = var_444_54 + 0.3
			local var_444_66 = math.max(var_444_55, arg_441_1.talkMaxDuration)

			if var_444_65 <= arg_441_1.time_ and arg_441_1.time_ < var_444_65 + var_444_66 then
				arg_441_1.typewritter.percent = (arg_441_1.time_ - var_444_65) / var_444_66

				arg_441_1.typewritter:SetDirty()
			end

			if arg_441_1.time_ >= var_444_65 + var_444_66 and arg_441_1.time_ < var_444_65 + var_444_66 + arg_444_0 then
				arg_441_1.typewritter.percent = 1

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(true)
			end
		end
	end,
	Play115311111 = function(arg_447_0, arg_447_1)
		arg_447_1.time_ = 0
		arg_447_1.frameCnt_ = 0
		arg_447_1.state_ = "playing"
		arg_447_1.curTalkId_ = 115311111
		arg_447_1.duration_ = 5

		SetActive(arg_447_1.tipsGo_, false)

		function arg_447_1.onSingleLineFinish_()
			arg_447_1.onSingleLineUpdate_ = nil
			arg_447_1.onSingleLineFinish_ = nil
			arg_447_1.state_ = "waiting"
		end

		function arg_447_1.playNext_(arg_449_0)
			if arg_449_0 == 1 then
				arg_447_0:Play115311112(arg_447_1)
			end
		end

		function arg_447_1.onSingleLineUpdate_(arg_450_0)
			local var_450_0 = arg_447_1.actors_["10030"]
			local var_450_1 = 0

			if var_450_1 < arg_447_1.time_ and arg_447_1.time_ <= var_450_1 + arg_450_0 then
				local var_450_2 = var_450_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_450_2 then
					arg_447_1.var_.alphaOldValue10030 = var_450_2.alpha
					arg_447_1.var_.characterEffect10030 = var_450_2
				end

				arg_447_1.var_.alphaOldValue10030 = 1
			end

			local var_450_3 = 0.5

			if var_450_1 <= arg_447_1.time_ and arg_447_1.time_ < var_450_1 + var_450_3 then
				local var_450_4 = (arg_447_1.time_ - var_450_1) / var_450_3
				local var_450_5 = Mathf.Lerp(arg_447_1.var_.alphaOldValue10030, 0, var_450_4)

				if arg_447_1.var_.characterEffect10030 then
					arg_447_1.var_.characterEffect10030.alpha = var_450_5
				end
			end

			if arg_447_1.time_ >= var_450_1 + var_450_3 and arg_447_1.time_ < var_450_1 + var_450_3 + arg_450_0 and arg_447_1.var_.characterEffect10030 then
				arg_447_1.var_.characterEffect10030.alpha = 0
			end

			local var_450_6 = 0
			local var_450_7 = 1.15

			if var_450_6 < arg_447_1.time_ and arg_447_1.time_ <= var_450_6 + arg_450_0 then
				arg_447_1.talkMaxDuration = 0
				arg_447_1.dialogCg_.alpha = 1

				arg_447_1.dialog_:SetActive(true)
				SetActive(arg_447_1.leftNameGo_, false)

				arg_447_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_447_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_447_1:RecordName(arg_447_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_447_1.iconTrs_.gameObject, false)
				arg_447_1.callingController_:SetSelectedState("normal")

				local var_450_8 = arg_447_1:GetWordFromCfg(115311111)
				local var_450_9 = arg_447_1:FormatText(var_450_8.content)

				arg_447_1.text_.text = var_450_9

				LuaForUtil.ClearLinePrefixSymbol(arg_447_1.text_)

				local var_450_10 = 46
				local var_450_11 = utf8.len(var_450_9)
				local var_450_12 = var_450_10 <= 0 and var_450_7 or var_450_7 * (var_450_11 / var_450_10)

				if var_450_12 > 0 and var_450_7 < var_450_12 then
					arg_447_1.talkMaxDuration = var_450_12

					if var_450_12 + var_450_6 > arg_447_1.duration_ then
						arg_447_1.duration_ = var_450_12 + var_450_6
					end
				end

				arg_447_1.text_.text = var_450_9
				arg_447_1.typewritter.percent = 0

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(false)
				arg_447_1:RecordContent(arg_447_1.text_.text)
			end

			local var_450_13 = math.max(var_450_7, arg_447_1.talkMaxDuration)

			if var_450_6 <= arg_447_1.time_ and arg_447_1.time_ < var_450_6 + var_450_13 then
				arg_447_1.typewritter.percent = (arg_447_1.time_ - var_450_6) / var_450_13

				arg_447_1.typewritter:SetDirty()
			end

			if arg_447_1.time_ >= var_450_6 + var_450_13 and arg_447_1.time_ < var_450_6 + var_450_13 + arg_450_0 then
				arg_447_1.typewritter.percent = 1

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(true)
			end
		end
	end,
	Play115311112 = function(arg_451_0, arg_451_1)
		arg_451_1.time_ = 0
		arg_451_1.frameCnt_ = 0
		arg_451_1.state_ = "playing"
		arg_451_1.curTalkId_ = 115311112
		arg_451_1.duration_ = 5

		SetActive(arg_451_1.tipsGo_, false)

		function arg_451_1.onSingleLineFinish_()
			arg_451_1.onSingleLineUpdate_ = nil
			arg_451_1.onSingleLineFinish_ = nil
			arg_451_1.state_ = "waiting"
		end

		function arg_451_1.playNext_(arg_453_0)
			if arg_453_0 == 1 then
				arg_451_0:Play115311113(arg_451_1)
			end
		end

		function arg_451_1.onSingleLineUpdate_(arg_454_0)
			local var_454_0 = 0
			local var_454_1 = 1

			if var_454_0 < arg_451_1.time_ and arg_451_1.time_ <= var_454_0 + arg_454_0 then
				arg_451_1.talkMaxDuration = 0
				arg_451_1.dialogCg_.alpha = 1

				arg_451_1.dialog_:SetActive(true)
				SetActive(arg_451_1.leftNameGo_, false)

				arg_451_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_451_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_451_1:RecordName(arg_451_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_451_1.iconTrs_.gameObject, false)
				arg_451_1.callingController_:SetSelectedState("normal")

				local var_454_2 = arg_451_1:GetWordFromCfg(115311112)
				local var_454_3 = arg_451_1:FormatText(var_454_2.content)

				arg_451_1.text_.text = var_454_3

				LuaForUtil.ClearLinePrefixSymbol(arg_451_1.text_)

				local var_454_4 = 40
				local var_454_5 = utf8.len(var_454_3)
				local var_454_6 = var_454_4 <= 0 and var_454_1 or var_454_1 * (var_454_5 / var_454_4)

				if var_454_6 > 0 and var_454_1 < var_454_6 then
					arg_451_1.talkMaxDuration = var_454_6

					if var_454_6 + var_454_0 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_6 + var_454_0
					end
				end

				arg_451_1.text_.text = var_454_3
				arg_451_1.typewritter.percent = 0

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(false)
				arg_451_1:RecordContent(arg_451_1.text_.text)
			end

			local var_454_7 = math.max(var_454_1, arg_451_1.talkMaxDuration)

			if var_454_0 <= arg_451_1.time_ and arg_451_1.time_ < var_454_0 + var_454_7 then
				arg_451_1.typewritter.percent = (arg_451_1.time_ - var_454_0) / var_454_7

				arg_451_1.typewritter:SetDirty()
			end

			if arg_451_1.time_ >= var_454_0 + var_454_7 and arg_451_1.time_ < var_454_0 + var_454_7 + arg_454_0 then
				arg_451_1.typewritter.percent = 1

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(true)
			end
		end
	end,
	Play115311113 = function(arg_455_0, arg_455_1)
		arg_455_1.time_ = 0
		arg_455_1.frameCnt_ = 0
		arg_455_1.state_ = "playing"
		arg_455_1.curTalkId_ = 115311113
		arg_455_1.duration_ = 5

		SetActive(arg_455_1.tipsGo_, false)

		function arg_455_1.onSingleLineFinish_()
			arg_455_1.onSingleLineUpdate_ = nil
			arg_455_1.onSingleLineFinish_ = nil
			arg_455_1.state_ = "waiting"
		end

		function arg_455_1.playNext_(arg_457_0)
			if arg_457_0 == 1 then
				arg_455_0:Play115311114(arg_455_1)
			end
		end

		function arg_455_1.onSingleLineUpdate_(arg_458_0)
			local var_458_0 = 0
			local var_458_1 = 0.65

			if var_458_0 < arg_455_1.time_ and arg_455_1.time_ <= var_458_0 + arg_458_0 then
				arg_455_1.talkMaxDuration = 0
				arg_455_1.dialogCg_.alpha = 1

				arg_455_1.dialog_:SetActive(true)
				SetActive(arg_455_1.leftNameGo_, false)

				arg_455_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_455_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_455_1:RecordName(arg_455_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_455_1.iconTrs_.gameObject, false)
				arg_455_1.callingController_:SetSelectedState("normal")

				local var_458_2 = arg_455_1:GetWordFromCfg(115311113)
				local var_458_3 = arg_455_1:FormatText(var_458_2.content)

				arg_455_1.text_.text = var_458_3

				LuaForUtil.ClearLinePrefixSymbol(arg_455_1.text_)

				local var_458_4 = 26
				local var_458_5 = utf8.len(var_458_3)
				local var_458_6 = var_458_4 <= 0 and var_458_1 or var_458_1 * (var_458_5 / var_458_4)

				if var_458_6 > 0 and var_458_1 < var_458_6 then
					arg_455_1.talkMaxDuration = var_458_6

					if var_458_6 + var_458_0 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_6 + var_458_0
					end
				end

				arg_455_1.text_.text = var_458_3
				arg_455_1.typewritter.percent = 0

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(false)
				arg_455_1:RecordContent(arg_455_1.text_.text)
			end

			local var_458_7 = math.max(var_458_1, arg_455_1.talkMaxDuration)

			if var_458_0 <= arg_455_1.time_ and arg_455_1.time_ < var_458_0 + var_458_7 then
				arg_455_1.typewritter.percent = (arg_455_1.time_ - var_458_0) / var_458_7

				arg_455_1.typewritter:SetDirty()
			end

			if arg_455_1.time_ >= var_458_0 + var_458_7 and arg_455_1.time_ < var_458_0 + var_458_7 + arg_458_0 then
				arg_455_1.typewritter.percent = 1

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(true)
			end
		end
	end,
	Play115311114 = function(arg_459_0, arg_459_1)
		arg_459_1.time_ = 0
		arg_459_1.frameCnt_ = 0
		arg_459_1.state_ = "playing"
		arg_459_1.curTalkId_ = 115311114
		arg_459_1.duration_ = 5.1

		local var_459_0 = {
			ja = 5,
			ko = 4.033,
			zh = 5.1,
			en = 4.233
		}
		local var_459_1 = manager.audio:GetLocalizationFlag()

		if var_459_0[var_459_1] ~= nil then
			arg_459_1.duration_ = var_459_0[var_459_1]
		end

		SetActive(arg_459_1.tipsGo_, false)

		function arg_459_1.onSingleLineFinish_()
			arg_459_1.onSingleLineUpdate_ = nil
			arg_459_1.onSingleLineFinish_ = nil
			arg_459_1.state_ = "waiting"
		end

		function arg_459_1.playNext_(arg_461_0)
			if arg_461_0 == 1 then
				arg_459_0:Play115311115(arg_459_1)
			end
		end

		function arg_459_1.onSingleLineUpdate_(arg_462_0)
			local var_462_0 = arg_459_1.actors_["10030"]
			local var_462_1 = 0

			if var_462_1 < arg_459_1.time_ and arg_459_1.time_ <= var_462_1 + arg_462_0 then
				local var_462_2 = var_462_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_462_2 then
					arg_459_1.var_.alphaOldValue10030 = var_462_2.alpha
					arg_459_1.var_.characterEffect10030 = var_462_2
				end

				arg_459_1.var_.alphaOldValue10030 = 0
			end

			local var_462_3 = 0.5

			if var_462_1 <= arg_459_1.time_ and arg_459_1.time_ < var_462_1 + var_462_3 then
				local var_462_4 = (arg_459_1.time_ - var_462_1) / var_462_3
				local var_462_5 = Mathf.Lerp(arg_459_1.var_.alphaOldValue10030, 1, var_462_4)

				if arg_459_1.var_.characterEffect10030 then
					arg_459_1.var_.characterEffect10030.alpha = var_462_5
				end
			end

			if arg_459_1.time_ >= var_462_1 + var_462_3 and arg_459_1.time_ < var_462_1 + var_462_3 + arg_462_0 and arg_459_1.var_.characterEffect10030 then
				arg_459_1.var_.characterEffect10030.alpha = 1
			end

			local var_462_6 = arg_459_1.actors_["10030"]
			local var_462_7 = 0

			if var_462_7 < arg_459_1.time_ and arg_459_1.time_ <= var_462_7 + arg_462_0 and arg_459_1.var_.actorSpriteComps10030 == nil then
				arg_459_1.var_.actorSpriteComps10030 = var_462_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_462_8 = 0.2

			if var_462_7 <= arg_459_1.time_ and arg_459_1.time_ < var_462_7 + var_462_8 then
				local var_462_9 = (arg_459_1.time_ - var_462_7) / var_462_8

				if arg_459_1.var_.actorSpriteComps10030 then
					for iter_462_0, iter_462_1 in pairs(arg_459_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_462_1 then
							local var_462_10 = Mathf.Lerp(iter_462_1.color.r, 1, var_462_9)

							iter_462_1.color = Color.New(var_462_10, var_462_10, var_462_10)
						end
					end
				end
			end

			if arg_459_1.time_ >= var_462_7 + var_462_8 and arg_459_1.time_ < var_462_7 + var_462_8 + arg_462_0 and arg_459_1.var_.actorSpriteComps10030 then
				local var_462_11 = 1

				for iter_462_2, iter_462_3 in pairs(arg_459_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_462_3 then
						iter_462_3.color = Color.New(var_462_11, var_462_11, var_462_11)
					end
				end

				arg_459_1.var_.actorSpriteComps10030 = nil
			end

			local var_462_12 = arg_459_1.actors_["10030"].transform
			local var_462_13 = 0

			if var_462_13 < arg_459_1.time_ and arg_459_1.time_ <= var_462_13 + arg_462_0 then
				arg_459_1.var_.moveOldPos10030 = var_462_12.localPosition
				var_462_12.localScale = Vector3.New(1, 1, 1)

				arg_459_1:CheckSpriteTmpPos("10030", 3)

				local var_462_14 = var_462_12.childCount

				for iter_462_4 = 0, var_462_14 - 1 do
					local var_462_15 = var_462_12:GetChild(iter_462_4)

					if var_462_15.name == "split_1" or not string.find(var_462_15.name, "split") then
						var_462_15.gameObject:SetActive(true)
					else
						var_462_15.gameObject:SetActive(false)
					end
				end
			end

			local var_462_16 = 0.001

			if var_462_13 <= arg_459_1.time_ and arg_459_1.time_ < var_462_13 + var_462_16 then
				local var_462_17 = (arg_459_1.time_ - var_462_13) / var_462_16
				local var_462_18 = Vector3.New(0, -390, 150)

				var_462_12.localPosition = Vector3.Lerp(arg_459_1.var_.moveOldPos10030, var_462_18, var_462_17)
			end

			if arg_459_1.time_ >= var_462_13 + var_462_16 and arg_459_1.time_ < var_462_13 + var_462_16 + arg_462_0 then
				var_462_12.localPosition = Vector3.New(0, -390, 150)
			end

			local var_462_19 = 0
			local var_462_20 = 0.375

			if var_462_19 < arg_459_1.time_ and arg_459_1.time_ <= var_462_19 + arg_462_0 then
				arg_459_1.talkMaxDuration = 0
				arg_459_1.dialogCg_.alpha = 1

				arg_459_1.dialog_:SetActive(true)
				SetActive(arg_459_1.leftNameGo_, true)

				local var_462_21 = arg_459_1:FormatText(StoryNameCfg[309].name)

				arg_459_1.leftNameTxt_.text = var_462_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_459_1.leftNameTxt_.transform)

				arg_459_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_459_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_459_1:RecordName(arg_459_1.leftNameTxt_.text)
				SetActive(arg_459_1.iconTrs_.gameObject, false)
				arg_459_1.callingController_:SetSelectedState("normal")

				local var_462_22 = arg_459_1:GetWordFromCfg(115311114)
				local var_462_23 = arg_459_1:FormatText(var_462_22.content)

				arg_459_1.text_.text = var_462_23

				LuaForUtil.ClearLinePrefixSymbol(arg_459_1.text_)

				local var_462_24 = 15
				local var_462_25 = utf8.len(var_462_23)
				local var_462_26 = var_462_24 <= 0 and var_462_20 or var_462_20 * (var_462_25 / var_462_24)

				if var_462_26 > 0 and var_462_20 < var_462_26 then
					arg_459_1.talkMaxDuration = var_462_26

					if var_462_26 + var_462_19 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_26 + var_462_19
					end
				end

				arg_459_1.text_.text = var_462_23
				arg_459_1.typewritter.percent = 0

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311114", "story_v_out_115311.awb") ~= 0 then
					local var_462_27 = manager.audio:GetVoiceLength("story_v_out_115311", "115311114", "story_v_out_115311.awb") / 1000

					if var_462_27 + var_462_19 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_27 + var_462_19
					end

					if var_462_22.prefab_name ~= "" and arg_459_1.actors_[var_462_22.prefab_name] ~= nil then
						local var_462_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_459_1.actors_[var_462_22.prefab_name].transform, "story_v_out_115311", "115311114", "story_v_out_115311.awb")

						arg_459_1:RecordAudio("115311114", var_462_28)
						arg_459_1:RecordAudio("115311114", var_462_28)
					else
						arg_459_1:AudioAction("play", "voice", "story_v_out_115311", "115311114", "story_v_out_115311.awb")
					end

					arg_459_1:RecordHistoryTalkVoice("story_v_out_115311", "115311114", "story_v_out_115311.awb")
				end

				arg_459_1:RecordContent(arg_459_1.text_.text)
			end

			local var_462_29 = math.max(var_462_20, arg_459_1.talkMaxDuration)

			if var_462_19 <= arg_459_1.time_ and arg_459_1.time_ < var_462_19 + var_462_29 then
				arg_459_1.typewritter.percent = (arg_459_1.time_ - var_462_19) / var_462_29

				arg_459_1.typewritter:SetDirty()
			end

			if arg_459_1.time_ >= var_462_19 + var_462_29 and arg_459_1.time_ < var_462_19 + var_462_29 + arg_462_0 then
				arg_459_1.typewritter.percent = 1

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(true)
			end
		end
	end,
	Play115311115 = function(arg_463_0, arg_463_1)
		arg_463_1.time_ = 0
		arg_463_1.frameCnt_ = 0
		arg_463_1.state_ = "playing"
		arg_463_1.curTalkId_ = 115311115
		arg_463_1.duration_ = 5

		SetActive(arg_463_1.tipsGo_, false)

		function arg_463_1.onSingleLineFinish_()
			arg_463_1.onSingleLineUpdate_ = nil
			arg_463_1.onSingleLineFinish_ = nil
			arg_463_1.state_ = "waiting"
		end

		function arg_463_1.playNext_(arg_465_0)
			if arg_465_0 == 1 then
				arg_463_0:Play115311116(arg_463_1)
			end
		end

		function arg_463_1.onSingleLineUpdate_(arg_466_0)
			local var_466_0 = arg_463_1.actors_["10030"]
			local var_466_1 = 0

			if var_466_1 < arg_463_1.time_ and arg_463_1.time_ <= var_466_1 + arg_466_0 then
				local var_466_2 = var_466_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_466_2 then
					arg_463_1.var_.alphaOldValue10030 = var_466_2.alpha
					arg_463_1.var_.characterEffect10030 = var_466_2
				end

				arg_463_1.var_.alphaOldValue10030 = 1
			end

			local var_466_3 = 0.5

			if var_466_1 <= arg_463_1.time_ and arg_463_1.time_ < var_466_1 + var_466_3 then
				local var_466_4 = (arg_463_1.time_ - var_466_1) / var_466_3
				local var_466_5 = Mathf.Lerp(arg_463_1.var_.alphaOldValue10030, 0, var_466_4)

				if arg_463_1.var_.characterEffect10030 then
					arg_463_1.var_.characterEffect10030.alpha = var_466_5
				end
			end

			if arg_463_1.time_ >= var_466_1 + var_466_3 and arg_463_1.time_ < var_466_1 + var_466_3 + arg_466_0 and arg_463_1.var_.characterEffect10030 then
				arg_463_1.var_.characterEffect10030.alpha = 0
			end

			local var_466_6 = 0
			local var_466_7 = 0.875

			if var_466_6 < arg_463_1.time_ and arg_463_1.time_ <= var_466_6 + arg_466_0 then
				arg_463_1.talkMaxDuration = 0
				arg_463_1.dialogCg_.alpha = 1

				arg_463_1.dialog_:SetActive(true)
				SetActive(arg_463_1.leftNameGo_, false)

				arg_463_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_463_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_463_1:RecordName(arg_463_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_463_1.iconTrs_.gameObject, false)
				arg_463_1.callingController_:SetSelectedState("normal")

				local var_466_8 = arg_463_1:GetWordFromCfg(115311115)
				local var_466_9 = arg_463_1:FormatText(var_466_8.content)

				arg_463_1.text_.text = var_466_9

				LuaForUtil.ClearLinePrefixSymbol(arg_463_1.text_)

				local var_466_10 = 35
				local var_466_11 = utf8.len(var_466_9)
				local var_466_12 = var_466_10 <= 0 and var_466_7 or var_466_7 * (var_466_11 / var_466_10)

				if var_466_12 > 0 and var_466_7 < var_466_12 then
					arg_463_1.talkMaxDuration = var_466_12

					if var_466_12 + var_466_6 > arg_463_1.duration_ then
						arg_463_1.duration_ = var_466_12 + var_466_6
					end
				end

				arg_463_1.text_.text = var_466_9
				arg_463_1.typewritter.percent = 0

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(false)
				arg_463_1:RecordContent(arg_463_1.text_.text)
			end

			local var_466_13 = math.max(var_466_7, arg_463_1.talkMaxDuration)

			if var_466_6 <= arg_463_1.time_ and arg_463_1.time_ < var_466_6 + var_466_13 then
				arg_463_1.typewritter.percent = (arg_463_1.time_ - var_466_6) / var_466_13

				arg_463_1.typewritter:SetDirty()
			end

			if arg_463_1.time_ >= var_466_6 + var_466_13 and arg_463_1.time_ < var_466_6 + var_466_13 + arg_466_0 then
				arg_463_1.typewritter.percent = 1

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(true)
			end
		end
	end,
	Play115311116 = function(arg_467_0, arg_467_1)
		arg_467_1.time_ = 0
		arg_467_1.frameCnt_ = 0
		arg_467_1.state_ = "playing"
		arg_467_1.curTalkId_ = 115311116
		arg_467_1.duration_ = 5

		SetActive(arg_467_1.tipsGo_, false)

		function arg_467_1.onSingleLineFinish_()
			arg_467_1.onSingleLineUpdate_ = nil
			arg_467_1.onSingleLineFinish_ = nil
			arg_467_1.state_ = "waiting"
		end

		function arg_467_1.playNext_(arg_469_0)
			if arg_469_0 == 1 then
				arg_467_0:Play115311117(arg_467_1)
			end
		end

		function arg_467_1.onSingleLineUpdate_(arg_470_0)
			local var_470_0 = 0
			local var_470_1 = 0.825

			if var_470_0 < arg_467_1.time_ and arg_467_1.time_ <= var_470_0 + arg_470_0 then
				arg_467_1.talkMaxDuration = 0
				arg_467_1.dialogCg_.alpha = 1

				arg_467_1.dialog_:SetActive(true)
				SetActive(arg_467_1.leftNameGo_, false)

				arg_467_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_467_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_467_1:RecordName(arg_467_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_467_1.iconTrs_.gameObject, false)
				arg_467_1.callingController_:SetSelectedState("normal")

				local var_470_2 = arg_467_1:GetWordFromCfg(115311116)
				local var_470_3 = arg_467_1:FormatText(var_470_2.content)

				arg_467_1.text_.text = var_470_3

				LuaForUtil.ClearLinePrefixSymbol(arg_467_1.text_)

				local var_470_4 = 33
				local var_470_5 = utf8.len(var_470_3)
				local var_470_6 = var_470_4 <= 0 and var_470_1 or var_470_1 * (var_470_5 / var_470_4)

				if var_470_6 > 0 and var_470_1 < var_470_6 then
					arg_467_1.talkMaxDuration = var_470_6

					if var_470_6 + var_470_0 > arg_467_1.duration_ then
						arg_467_1.duration_ = var_470_6 + var_470_0
					end
				end

				arg_467_1.text_.text = var_470_3
				arg_467_1.typewritter.percent = 0

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(false)
				arg_467_1:RecordContent(arg_467_1.text_.text)
			end

			local var_470_7 = math.max(var_470_1, arg_467_1.talkMaxDuration)

			if var_470_0 <= arg_467_1.time_ and arg_467_1.time_ < var_470_0 + var_470_7 then
				arg_467_1.typewritter.percent = (arg_467_1.time_ - var_470_0) / var_470_7

				arg_467_1.typewritter:SetDirty()
			end

			if arg_467_1.time_ >= var_470_0 + var_470_7 and arg_467_1.time_ < var_470_0 + var_470_7 + arg_470_0 then
				arg_467_1.typewritter.percent = 1

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(true)
			end
		end
	end,
	Play115311117 = function(arg_471_0, arg_471_1)
		arg_471_1.time_ = 0
		arg_471_1.frameCnt_ = 0
		arg_471_1.state_ = "playing"
		arg_471_1.curTalkId_ = 115311117
		arg_471_1.duration_ = 5.533333333332

		SetActive(arg_471_1.tipsGo_, false)

		function arg_471_1.onSingleLineFinish_()
			arg_471_1.onSingleLineUpdate_ = nil
			arg_471_1.onSingleLineFinish_ = nil
			arg_471_1.state_ = "waiting"
		end

		function arg_471_1.playNext_(arg_473_0)
			if arg_473_0 == 1 then
				arg_471_0:Play115311118(arg_471_1)
			end
		end

		function arg_471_1.onSingleLineUpdate_(arg_474_0)
			local var_474_0 = arg_471_1.bgs_.ST22a.transform
			local var_474_1 = 0

			if var_474_1 < arg_471_1.time_ and arg_471_1.time_ <= var_474_1 + arg_474_0 then
				arg_471_1.var_.moveOldPosST22a = var_474_0.localPosition
			end

			local var_474_2 = 4.5

			if var_474_1 <= arg_471_1.time_ and arg_471_1.time_ < var_474_1 + var_474_2 then
				local var_474_3 = (arg_471_1.time_ - var_474_1) / var_474_2
				local var_474_4 = Vector3.New(0, 1, 9.5)

				var_474_0.localPosition = Vector3.Lerp(arg_471_1.var_.moveOldPosST22a, var_474_4, var_474_3)
			end

			if arg_471_1.time_ >= var_474_1 + var_474_2 and arg_471_1.time_ < var_474_1 + var_474_2 + arg_474_0 then
				var_474_0.localPosition = Vector3.New(0, 1, 9.5)
			end

			local var_474_5 = 0

			if var_474_5 < arg_471_1.time_ and arg_471_1.time_ <= var_474_5 + arg_474_0 then
				arg_471_1.allBtn_.enabled = false
			end

			local var_474_6 = 4.5

			if arg_471_1.time_ >= var_474_5 + var_474_6 and arg_471_1.time_ < var_474_5 + var_474_6 + arg_474_0 then
				arg_471_1.allBtn_.enabled = true
			end

			local var_474_7 = 0
			local var_474_8 = 0.45

			if var_474_7 < arg_471_1.time_ and arg_471_1.time_ <= var_474_7 + arg_474_0 then
				arg_471_1.talkMaxDuration = 0
				arg_471_1.dialogCg_.alpha = 1

				arg_471_1.dialog_:SetActive(true)
				SetActive(arg_471_1.leftNameGo_, false)

				arg_471_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_471_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_471_1:RecordName(arg_471_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_471_1.iconTrs_.gameObject, false)
				arg_471_1.callingController_:SetSelectedState("normal")

				local var_474_9 = arg_471_1:GetWordFromCfg(115311117)
				local var_474_10 = arg_471_1:FormatText(var_474_9.content)

				arg_471_1.text_.text = var_474_10

				LuaForUtil.ClearLinePrefixSymbol(arg_471_1.text_)

				local var_474_11 = 18
				local var_474_12 = utf8.len(var_474_10)
				local var_474_13 = var_474_11 <= 0 and var_474_8 or var_474_8 * (var_474_12 / var_474_11)

				if var_474_13 > 0 and var_474_8 < var_474_13 then
					arg_471_1.talkMaxDuration = var_474_13

					if var_474_13 + var_474_7 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_13 + var_474_7
					end
				end

				arg_471_1.text_.text = var_474_10
				arg_471_1.typewritter.percent = 0

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(false)
				arg_471_1:RecordContent(arg_471_1.text_.text)
			end

			local var_474_14 = math.max(var_474_8, arg_471_1.talkMaxDuration)

			if var_474_7 <= arg_471_1.time_ and arg_471_1.time_ < var_474_7 + var_474_14 then
				arg_471_1.typewritter.percent = (arg_471_1.time_ - var_474_7) / var_474_14

				arg_471_1.typewritter:SetDirty()
			end

			if arg_471_1.time_ >= var_474_7 + var_474_14 and arg_471_1.time_ < var_474_7 + var_474_14 + arg_474_0 then
				arg_471_1.typewritter.percent = 1

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(true)
			end
		end
	end,
	Play115311118 = function(arg_475_0, arg_475_1)
		arg_475_1.time_ = 0
		arg_475_1.frameCnt_ = 0
		arg_475_1.state_ = "playing"
		arg_475_1.curTalkId_ = 115311118
		arg_475_1.duration_ = 7.866

		local var_475_0 = {
			ja = 6.866,
			ko = 6.766,
			zh = 7.866,
			en = 7.6
		}
		local var_475_1 = manager.audio:GetLocalizationFlag()

		if var_475_0[var_475_1] ~= nil then
			arg_475_1.duration_ = var_475_0[var_475_1]
		end

		SetActive(arg_475_1.tipsGo_, false)

		function arg_475_1.onSingleLineFinish_()
			arg_475_1.onSingleLineUpdate_ = nil
			arg_475_1.onSingleLineFinish_ = nil
			arg_475_1.state_ = "waiting"
		end

		function arg_475_1.playNext_(arg_477_0)
			if arg_477_0 == 1 then
				arg_475_0:Play115311119(arg_475_1)
			end
		end

		function arg_475_1.onSingleLineUpdate_(arg_478_0)
			local var_478_0 = 2

			if var_478_0 < arg_475_1.time_ and arg_475_1.time_ <= var_478_0 + arg_478_0 then
				local var_478_1 = manager.ui.mainCamera.transform.localPosition
				local var_478_2 = Vector3.New(0, 0, 10) + Vector3.New(var_478_1.x, var_478_1.y, 0)
				local var_478_3 = arg_475_1.bgs_.ST28a

				var_478_3.transform.localPosition = var_478_2
				var_478_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_478_4 = var_478_3:GetComponent("SpriteRenderer")

				if var_478_4 and var_478_4.sprite then
					local var_478_5 = (var_478_3.transform.localPosition - var_478_1).z
					local var_478_6 = manager.ui.mainCameraCom_
					local var_478_7 = 2 * var_478_5 * Mathf.Tan(var_478_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_478_8 = var_478_7 * var_478_6.aspect
					local var_478_9 = var_478_4.sprite.bounds.size.x
					local var_478_10 = var_478_4.sprite.bounds.size.y
					local var_478_11 = var_478_8 / var_478_9
					local var_478_12 = var_478_7 / var_478_10
					local var_478_13 = var_478_12 < var_478_11 and var_478_11 or var_478_12

					var_478_3.transform.localScale = Vector3.New(var_478_13, var_478_13, 0)
				end

				for iter_478_0, iter_478_1 in pairs(arg_475_1.bgs_) do
					if iter_478_0 ~= "ST28a" then
						iter_478_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_478_14 = 0

			if var_478_14 < arg_475_1.time_ and arg_475_1.time_ <= var_478_14 + arg_478_0 then
				arg_475_1.mask_.enabled = true
				arg_475_1.mask_.raycastTarget = true

				arg_475_1:SetGaussion(false)
			end

			local var_478_15 = 2

			if var_478_14 <= arg_475_1.time_ and arg_475_1.time_ < var_478_14 + var_478_15 then
				local var_478_16 = (arg_475_1.time_ - var_478_14) / var_478_15
				local var_478_17 = Color.New(0, 0, 0)

				var_478_17.a = Mathf.Lerp(0, 1, var_478_16)
				arg_475_1.mask_.color = var_478_17
			end

			if arg_475_1.time_ >= var_478_14 + var_478_15 and arg_475_1.time_ < var_478_14 + var_478_15 + arg_478_0 then
				local var_478_18 = Color.New(0, 0, 0)

				var_478_18.a = 1
				arg_475_1.mask_.color = var_478_18
			end

			local var_478_19 = 2

			if var_478_19 < arg_475_1.time_ and arg_475_1.time_ <= var_478_19 + arg_478_0 then
				arg_475_1.mask_.enabled = true
				arg_475_1.mask_.raycastTarget = true

				arg_475_1:SetGaussion(false)
			end

			local var_478_20 = 2

			if var_478_19 <= arg_475_1.time_ and arg_475_1.time_ < var_478_19 + var_478_20 then
				local var_478_21 = (arg_475_1.time_ - var_478_19) / var_478_20
				local var_478_22 = Color.New(0, 0, 0)

				var_478_22.a = Mathf.Lerp(1, 0, var_478_21)
				arg_475_1.mask_.color = var_478_22
			end

			if arg_475_1.time_ >= var_478_19 + var_478_20 and arg_475_1.time_ < var_478_19 + var_478_20 + arg_478_0 then
				local var_478_23 = Color.New(0, 0, 0)
				local var_478_24 = 0

				arg_475_1.mask_.enabled = false
				var_478_23.a = var_478_24
				arg_475_1.mask_.color = var_478_23
			end

			local var_478_25 = 0
			local var_478_26 = 0.3

			if var_478_25 < arg_475_1.time_ and arg_475_1.time_ <= var_478_25 + arg_478_0 then
				local var_478_27 = "play"
				local var_478_28 = "music"

				arg_475_1:AudioAction(var_478_27, var_478_28, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_478_29 = 4
			local var_478_30 = 0.533333333333333

			if var_478_29 < arg_475_1.time_ and arg_475_1.time_ <= var_478_29 + arg_478_0 then
				local var_478_31 = "play"
				local var_478_32 = "music"

				arg_475_1:AudioAction(var_478_31, var_478_32, "bgm_activity_1_3_warchess", "bgm_activity_1_3_warchess", "bgm_activity_1_3_warchess.awb")
			end

			if arg_475_1.frameCnt_ <= 1 then
				arg_475_1.dialog_:SetActive(false)
			end

			local var_478_33 = 4
			local var_478_34 = 0.3

			if var_478_33 < arg_475_1.time_ and arg_475_1.time_ <= var_478_33 + arg_478_0 then
				arg_475_1.talkMaxDuration = 0

				arg_475_1.dialog_:SetActive(true)

				local var_478_35 = LeanTween.value(arg_475_1.dialog_, 0, 1, 0.3)

				var_478_35:setOnUpdate(LuaHelper.FloatAction(function(arg_479_0)
					arg_475_1.dialogCg_.alpha = arg_479_0
				end))
				var_478_35:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_475_1.dialog_)
					var_478_35:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_475_1.duration_ = arg_475_1.duration_ + 0.3

				SetActive(arg_475_1.leftNameGo_, true)

				local var_478_36 = arg_475_1:FormatText(StoryNameCfg[104].name)

				arg_475_1.leftNameTxt_.text = var_478_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_475_1.leftNameTxt_.transform)

				arg_475_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_475_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_475_1:RecordName(arg_475_1.leftNameTxt_.text)
				SetActive(arg_475_1.iconTrs_.gameObject, true)
				arg_475_1.iconController_:SetSelectedState("hero")

				arg_475_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_woundedd")

				arg_475_1.callingController_:SetSelectedState("normal")

				local var_478_37 = arg_475_1:GetWordFromCfg(115311118)
				local var_478_38 = arg_475_1:FormatText(var_478_37.content)

				arg_475_1.text_.text = var_478_38

				LuaForUtil.ClearLinePrefixSymbol(arg_475_1.text_)

				local var_478_39 = 12
				local var_478_40 = utf8.len(var_478_38)
				local var_478_41 = var_478_39 <= 0 and var_478_34 or var_478_34 * (var_478_40 / var_478_39)

				if var_478_41 > 0 and var_478_34 < var_478_41 then
					arg_475_1.talkMaxDuration = var_478_41
					var_478_33 = var_478_33 + 0.3

					if var_478_41 + var_478_33 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_41 + var_478_33
					end
				end

				arg_475_1.text_.text = var_478_38
				arg_475_1.typewritter.percent = 0

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311118", "story_v_out_115311.awb") ~= 0 then
					local var_478_42 = manager.audio:GetVoiceLength("story_v_out_115311", "115311118", "story_v_out_115311.awb") / 1000

					if var_478_42 + var_478_33 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_42 + var_478_33
					end

					if var_478_37.prefab_name ~= "" and arg_475_1.actors_[var_478_37.prefab_name] ~= nil then
						local var_478_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_475_1.actors_[var_478_37.prefab_name].transform, "story_v_out_115311", "115311118", "story_v_out_115311.awb")

						arg_475_1:RecordAudio("115311118", var_478_43)
						arg_475_1:RecordAudio("115311118", var_478_43)
					else
						arg_475_1:AudioAction("play", "voice", "story_v_out_115311", "115311118", "story_v_out_115311.awb")
					end

					arg_475_1:RecordHistoryTalkVoice("story_v_out_115311", "115311118", "story_v_out_115311.awb")
				end

				arg_475_1:RecordContent(arg_475_1.text_.text)
			end

			local var_478_44 = var_478_33 + 0.3
			local var_478_45 = math.max(var_478_34, arg_475_1.talkMaxDuration)

			if var_478_44 <= arg_475_1.time_ and arg_475_1.time_ < var_478_44 + var_478_45 then
				arg_475_1.typewritter.percent = (arg_475_1.time_ - var_478_44) / var_478_45

				arg_475_1.typewritter:SetDirty()
			end

			if arg_475_1.time_ >= var_478_44 + var_478_45 and arg_475_1.time_ < var_478_44 + var_478_45 + arg_478_0 then
				arg_475_1.typewritter.percent = 1

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(true)
			end
		end
	end,
	Play115311119 = function(arg_481_0, arg_481_1)
		arg_481_1.time_ = 0
		arg_481_1.frameCnt_ = 0
		arg_481_1.state_ = "playing"
		arg_481_1.curTalkId_ = 115311119
		arg_481_1.duration_ = 6.6

		local var_481_0 = {
			ja = 5,
			ko = 6.6,
			zh = 5.8,
			en = 6.1
		}
		local var_481_1 = manager.audio:GetLocalizationFlag()

		if var_481_0[var_481_1] ~= nil then
			arg_481_1.duration_ = var_481_0[var_481_1]
		end

		SetActive(arg_481_1.tipsGo_, false)

		function arg_481_1.onSingleLineFinish_()
			arg_481_1.onSingleLineUpdate_ = nil
			arg_481_1.onSingleLineFinish_ = nil
			arg_481_1.state_ = "waiting"
		end

		function arg_481_1.playNext_(arg_483_0)
			if arg_483_0 == 1 then
				arg_481_0:Play115311120(arg_481_1)
			end
		end

		function arg_481_1.onSingleLineUpdate_(arg_484_0)
			local var_484_0 = 0
			local var_484_1 = 0.5

			if var_484_0 < arg_481_1.time_ and arg_481_1.time_ <= var_484_0 + arg_484_0 then
				arg_481_1.talkMaxDuration = 0
				arg_481_1.dialogCg_.alpha = 1

				arg_481_1.dialog_:SetActive(true)
				SetActive(arg_481_1.leftNameGo_, true)

				local var_484_2 = arg_481_1:FormatText(StoryNameCfg[105].name)

				arg_481_1.leftNameTxt_.text = var_484_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_481_1.leftNameTxt_.transform)

				arg_481_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_481_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_481_1:RecordName(arg_481_1.leftNameTxt_.text)
				SetActive(arg_481_1.iconTrs_.gameObject, true)
				arg_481_1.iconController_:SetSelectedState("hero")

				arg_481_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_officeladyb")

				arg_481_1.callingController_:SetSelectedState("normal")

				local var_484_3 = arg_481_1:GetWordFromCfg(115311119)
				local var_484_4 = arg_481_1:FormatText(var_484_3.content)

				arg_481_1.text_.text = var_484_4

				LuaForUtil.ClearLinePrefixSymbol(arg_481_1.text_)

				local var_484_5 = 20
				local var_484_6 = utf8.len(var_484_4)
				local var_484_7 = var_484_5 <= 0 and var_484_1 or var_484_1 * (var_484_6 / var_484_5)

				if var_484_7 > 0 and var_484_1 < var_484_7 then
					arg_481_1.talkMaxDuration = var_484_7

					if var_484_7 + var_484_0 > arg_481_1.duration_ then
						arg_481_1.duration_ = var_484_7 + var_484_0
					end
				end

				arg_481_1.text_.text = var_484_4
				arg_481_1.typewritter.percent = 0

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311119", "story_v_out_115311.awb") ~= 0 then
					local var_484_8 = manager.audio:GetVoiceLength("story_v_out_115311", "115311119", "story_v_out_115311.awb") / 1000

					if var_484_8 + var_484_0 > arg_481_1.duration_ then
						arg_481_1.duration_ = var_484_8 + var_484_0
					end

					if var_484_3.prefab_name ~= "" and arg_481_1.actors_[var_484_3.prefab_name] ~= nil then
						local var_484_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_481_1.actors_[var_484_3.prefab_name].transform, "story_v_out_115311", "115311119", "story_v_out_115311.awb")

						arg_481_1:RecordAudio("115311119", var_484_9)
						arg_481_1:RecordAudio("115311119", var_484_9)
					else
						arg_481_1:AudioAction("play", "voice", "story_v_out_115311", "115311119", "story_v_out_115311.awb")
					end

					arg_481_1:RecordHistoryTalkVoice("story_v_out_115311", "115311119", "story_v_out_115311.awb")
				end

				arg_481_1:RecordContent(arg_481_1.text_.text)
			end

			local var_484_10 = math.max(var_484_1, arg_481_1.talkMaxDuration)

			if var_484_0 <= arg_481_1.time_ and arg_481_1.time_ < var_484_0 + var_484_10 then
				arg_481_1.typewritter.percent = (arg_481_1.time_ - var_484_0) / var_484_10

				arg_481_1.typewritter:SetDirty()
			end

			if arg_481_1.time_ >= var_484_0 + var_484_10 and arg_481_1.time_ < var_484_0 + var_484_10 + arg_484_0 then
				arg_481_1.typewritter.percent = 1

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(true)
			end
		end
	end,
	Play115311120 = function(arg_485_0, arg_485_1)
		arg_485_1.time_ = 0
		arg_485_1.frameCnt_ = 0
		arg_485_1.state_ = "playing"
		arg_485_1.curTalkId_ = 115311120
		arg_485_1.duration_ = 5

		SetActive(arg_485_1.tipsGo_, false)

		function arg_485_1.onSingleLineFinish_()
			arg_485_1.onSingleLineUpdate_ = nil
			arg_485_1.onSingleLineFinish_ = nil
			arg_485_1.state_ = "waiting"
		end

		function arg_485_1.playNext_(arg_487_0)
			if arg_487_0 == 1 then
				arg_485_0:Play115311121(arg_485_1)
			end
		end

		function arg_485_1.onSingleLineUpdate_(arg_488_0)
			local var_488_0 = 0.466666666666667
			local var_488_1 = 0.533333333333333

			if var_488_0 < arg_485_1.time_ and arg_485_1.time_ <= var_488_0 + arg_488_0 then
				local var_488_2 = "play"
				local var_488_3 = "music"

				arg_485_1:AudioAction(var_488_2, var_488_3, "bgm_activity_1_3_warchess", "bgm_activity_1_3_warchess", "bgm_activity_1_3_warchess.awb")
			end

			local var_488_4 = 0
			local var_488_5 = 0.725

			if var_488_4 < arg_485_1.time_ and arg_485_1.time_ <= var_488_4 + arg_488_0 then
				arg_485_1.talkMaxDuration = 0
				arg_485_1.dialogCg_.alpha = 1

				arg_485_1.dialog_:SetActive(true)
				SetActive(arg_485_1.leftNameGo_, false)

				arg_485_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_485_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_485_1:RecordName(arg_485_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_485_1.iconTrs_.gameObject, false)
				arg_485_1.callingController_:SetSelectedState("normal")

				local var_488_6 = arg_485_1:GetWordFromCfg(115311120)
				local var_488_7 = arg_485_1:FormatText(var_488_6.content)

				arg_485_1.text_.text = var_488_7

				LuaForUtil.ClearLinePrefixSymbol(arg_485_1.text_)

				local var_488_8 = 29
				local var_488_9 = utf8.len(var_488_7)
				local var_488_10 = var_488_8 <= 0 and var_488_5 or var_488_5 * (var_488_9 / var_488_8)

				if var_488_10 > 0 and var_488_5 < var_488_10 then
					arg_485_1.talkMaxDuration = var_488_10

					if var_488_10 + var_488_4 > arg_485_1.duration_ then
						arg_485_1.duration_ = var_488_10 + var_488_4
					end
				end

				arg_485_1.text_.text = var_488_7
				arg_485_1.typewritter.percent = 0

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(false)
				arg_485_1:RecordContent(arg_485_1.text_.text)
			end

			local var_488_11 = math.max(var_488_5, arg_485_1.talkMaxDuration)

			if var_488_4 <= arg_485_1.time_ and arg_485_1.time_ < var_488_4 + var_488_11 then
				arg_485_1.typewritter.percent = (arg_485_1.time_ - var_488_4) / var_488_11

				arg_485_1.typewritter:SetDirty()
			end

			if arg_485_1.time_ >= var_488_4 + var_488_11 and arg_485_1.time_ < var_488_4 + var_488_11 + arg_488_0 then
				arg_485_1.typewritter.percent = 1

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(true)
			end
		end
	end,
	Play115311121 = function(arg_489_0, arg_489_1)
		arg_489_1.time_ = 0
		arg_489_1.frameCnt_ = 0
		arg_489_1.state_ = "playing"
		arg_489_1.curTalkId_ = 115311121
		arg_489_1.duration_ = 5

		SetActive(arg_489_1.tipsGo_, false)

		function arg_489_1.onSingleLineFinish_()
			arg_489_1.onSingleLineUpdate_ = nil
			arg_489_1.onSingleLineFinish_ = nil
			arg_489_1.state_ = "waiting"
		end

		function arg_489_1.playNext_(arg_491_0)
			if arg_491_0 == 1 then
				arg_489_0:Play115311122(arg_489_1)
			end
		end

		function arg_489_1.onSingleLineUpdate_(arg_492_0)
			local var_492_0 = 0
			local var_492_1 = 1.4

			if var_492_0 < arg_489_1.time_ and arg_489_1.time_ <= var_492_0 + arg_492_0 then
				arg_489_1.talkMaxDuration = 0
				arg_489_1.dialogCg_.alpha = 1

				arg_489_1.dialog_:SetActive(true)
				SetActive(arg_489_1.leftNameGo_, false)

				arg_489_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_489_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_489_1:RecordName(arg_489_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_489_1.iconTrs_.gameObject, false)
				arg_489_1.callingController_:SetSelectedState("normal")

				local var_492_2 = arg_489_1:GetWordFromCfg(115311121)
				local var_492_3 = arg_489_1:FormatText(var_492_2.content)

				arg_489_1.text_.text = var_492_3

				LuaForUtil.ClearLinePrefixSymbol(arg_489_1.text_)

				local var_492_4 = 56
				local var_492_5 = utf8.len(var_492_3)
				local var_492_6 = var_492_4 <= 0 and var_492_1 or var_492_1 * (var_492_5 / var_492_4)

				if var_492_6 > 0 and var_492_1 < var_492_6 then
					arg_489_1.talkMaxDuration = var_492_6

					if var_492_6 + var_492_0 > arg_489_1.duration_ then
						arg_489_1.duration_ = var_492_6 + var_492_0
					end
				end

				arg_489_1.text_.text = var_492_3
				arg_489_1.typewritter.percent = 0

				arg_489_1.typewritter:SetDirty()
				arg_489_1:ShowNextGo(false)
				arg_489_1:RecordContent(arg_489_1.text_.text)
			end

			local var_492_7 = math.max(var_492_1, arg_489_1.talkMaxDuration)

			if var_492_0 <= arg_489_1.time_ and arg_489_1.time_ < var_492_0 + var_492_7 then
				arg_489_1.typewritter.percent = (arg_489_1.time_ - var_492_0) / var_492_7

				arg_489_1.typewritter:SetDirty()
			end

			if arg_489_1.time_ >= var_492_0 + var_492_7 and arg_489_1.time_ < var_492_0 + var_492_7 + arg_492_0 then
				arg_489_1.typewritter.percent = 1

				arg_489_1.typewritter:SetDirty()
				arg_489_1:ShowNextGo(true)
			end
		end
	end,
	Play115311122 = function(arg_493_0, arg_493_1)
		arg_493_1.time_ = 0
		arg_493_1.frameCnt_ = 0
		arg_493_1.state_ = "playing"
		arg_493_1.curTalkId_ = 115311122
		arg_493_1.duration_ = 7

		SetActive(arg_493_1.tipsGo_, false)

		function arg_493_1.onSingleLineFinish_()
			arg_493_1.onSingleLineUpdate_ = nil
			arg_493_1.onSingleLineFinish_ = nil
			arg_493_1.state_ = "waiting"
		end

		function arg_493_1.playNext_(arg_495_0)
			if arg_495_0 == 1 then
				arg_493_0:Play115311123(arg_493_1)
			end
		end

		function arg_493_1.onSingleLineUpdate_(arg_496_0)
			local var_496_0 = 0

			if var_496_0 < arg_493_1.time_ and arg_493_1.time_ <= var_496_0 + arg_496_0 then
				arg_493_1.mask_.enabled = true
				arg_493_1.mask_.raycastTarget = true

				arg_493_1:SetGaussion(false)
			end

			local var_496_1 = 2

			if var_496_0 <= arg_493_1.time_ and arg_493_1.time_ < var_496_0 + var_496_1 then
				local var_496_2 = (arg_493_1.time_ - var_496_0) / var_496_1
				local var_496_3 = Color.New(1, 1, 1)

				var_496_3.a = Mathf.Lerp(1, 0, var_496_2)
				arg_493_1.mask_.color = var_496_3
			end

			if arg_493_1.time_ >= var_496_0 + var_496_1 and arg_493_1.time_ < var_496_0 + var_496_1 + arg_496_0 then
				local var_496_4 = Color.New(1, 1, 1)
				local var_496_5 = 0

				arg_493_1.mask_.enabled = false
				var_496_4.a = var_496_5
				arg_493_1.mask_.color = var_496_4
			end

			if arg_493_1.frameCnt_ <= 1 then
				arg_493_1.dialog_:SetActive(false)
			end

			local var_496_6 = 2
			local var_496_7 = 1.15

			if var_496_6 < arg_493_1.time_ and arg_493_1.time_ <= var_496_6 + arg_496_0 then
				arg_493_1.talkMaxDuration = 0

				arg_493_1.dialog_:SetActive(true)

				local var_496_8 = LeanTween.value(arg_493_1.dialog_, 0, 1, 0.3)

				var_496_8:setOnUpdate(LuaHelper.FloatAction(function(arg_497_0)
					arg_493_1.dialogCg_.alpha = arg_497_0
				end))
				var_496_8:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_493_1.dialog_)
					var_496_8:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_493_1.duration_ = arg_493_1.duration_ + 0.3

				SetActive(arg_493_1.leftNameGo_, false)

				arg_493_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_493_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_493_1:RecordName(arg_493_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_493_1.iconTrs_.gameObject, false)
				arg_493_1.callingController_:SetSelectedState("normal")

				local var_496_9 = arg_493_1:GetWordFromCfg(115311122)
				local var_496_10 = arg_493_1:FormatText(var_496_9.content)

				arg_493_1.text_.text = var_496_10

				LuaForUtil.ClearLinePrefixSymbol(arg_493_1.text_)

				local var_496_11 = 46
				local var_496_12 = utf8.len(var_496_10)
				local var_496_13 = var_496_11 <= 0 and var_496_7 or var_496_7 * (var_496_12 / var_496_11)

				if var_496_13 > 0 and var_496_7 < var_496_13 then
					arg_493_1.talkMaxDuration = var_496_13
					var_496_6 = var_496_6 + 0.3

					if var_496_13 + var_496_6 > arg_493_1.duration_ then
						arg_493_1.duration_ = var_496_13 + var_496_6
					end
				end

				arg_493_1.text_.text = var_496_10
				arg_493_1.typewritter.percent = 0

				arg_493_1.typewritter:SetDirty()
				arg_493_1:ShowNextGo(false)
				arg_493_1:RecordContent(arg_493_1.text_.text)
			end

			local var_496_14 = var_496_6 + 0.3
			local var_496_15 = math.max(var_496_7, arg_493_1.talkMaxDuration)

			if var_496_14 <= arg_493_1.time_ and arg_493_1.time_ < var_496_14 + var_496_15 then
				arg_493_1.typewritter.percent = (arg_493_1.time_ - var_496_14) / var_496_15

				arg_493_1.typewritter:SetDirty()
			end

			if arg_493_1.time_ >= var_496_14 + var_496_15 and arg_493_1.time_ < var_496_14 + var_496_15 + arg_496_0 then
				arg_493_1.typewritter.percent = 1

				arg_493_1.typewritter:SetDirty()
				arg_493_1:ShowNextGo(true)
			end
		end
	end,
	Play115311123 = function(arg_499_0, arg_499_1)
		arg_499_1.time_ = 0
		arg_499_1.frameCnt_ = 0
		arg_499_1.state_ = "playing"
		arg_499_1.curTalkId_ = 115311123
		arg_499_1.duration_ = 5

		SetActive(arg_499_1.tipsGo_, false)

		function arg_499_1.onSingleLineFinish_()
			arg_499_1.onSingleLineUpdate_ = nil
			arg_499_1.onSingleLineFinish_ = nil
			arg_499_1.state_ = "waiting"
		end

		function arg_499_1.playNext_(arg_501_0)
			if arg_501_0 == 1 then
				arg_499_0:Play115311124(arg_499_1)
			end
		end

		function arg_499_1.onSingleLineUpdate_(arg_502_0)
			local var_502_0 = 0
			local var_502_1 = 1.725

			if var_502_0 < arg_499_1.time_ and arg_499_1.time_ <= var_502_0 + arg_502_0 then
				arg_499_1.talkMaxDuration = 0
				arg_499_1.dialogCg_.alpha = 1

				arg_499_1.dialog_:SetActive(true)
				SetActive(arg_499_1.leftNameGo_, false)

				arg_499_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_499_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_499_1:RecordName(arg_499_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_499_1.iconTrs_.gameObject, false)
				arg_499_1.callingController_:SetSelectedState("normal")

				local var_502_2 = arg_499_1:GetWordFromCfg(115311123)
				local var_502_3 = arg_499_1:FormatText(var_502_2.content)

				arg_499_1.text_.text = var_502_3

				LuaForUtil.ClearLinePrefixSymbol(arg_499_1.text_)

				local var_502_4 = 69
				local var_502_5 = utf8.len(var_502_3)
				local var_502_6 = var_502_4 <= 0 and var_502_1 or var_502_1 * (var_502_5 / var_502_4)

				if var_502_6 > 0 and var_502_1 < var_502_6 then
					arg_499_1.talkMaxDuration = var_502_6

					if var_502_6 + var_502_0 > arg_499_1.duration_ then
						arg_499_1.duration_ = var_502_6 + var_502_0
					end
				end

				arg_499_1.text_.text = var_502_3
				arg_499_1.typewritter.percent = 0

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(false)
				arg_499_1:RecordContent(arg_499_1.text_.text)
			end

			local var_502_7 = math.max(var_502_1, arg_499_1.talkMaxDuration)

			if var_502_0 <= arg_499_1.time_ and arg_499_1.time_ < var_502_0 + var_502_7 then
				arg_499_1.typewritter.percent = (arg_499_1.time_ - var_502_0) / var_502_7

				arg_499_1.typewritter:SetDirty()
			end

			if arg_499_1.time_ >= var_502_0 + var_502_7 and arg_499_1.time_ < var_502_0 + var_502_7 + arg_502_0 then
				arg_499_1.typewritter.percent = 1

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(true)
			end
		end
	end,
	Play115311124 = function(arg_503_0, arg_503_1)
		arg_503_1.time_ = 0
		arg_503_1.frameCnt_ = 0
		arg_503_1.state_ = "playing"
		arg_503_1.curTalkId_ = 115311124
		arg_503_1.duration_ = 5

		SetActive(arg_503_1.tipsGo_, false)

		function arg_503_1.onSingleLineFinish_()
			arg_503_1.onSingleLineUpdate_ = nil
			arg_503_1.onSingleLineFinish_ = nil
			arg_503_1.state_ = "waiting"
		end

		function arg_503_1.playNext_(arg_505_0)
			if arg_505_0 == 1 then
				arg_503_0:Play115311125(arg_503_1)
			end
		end

		function arg_503_1.onSingleLineUpdate_(arg_506_0)
			local var_506_0 = 0
			local var_506_1 = 1.8

			if var_506_0 < arg_503_1.time_ and arg_503_1.time_ <= var_506_0 + arg_506_0 then
				arg_503_1.talkMaxDuration = 0
				arg_503_1.dialogCg_.alpha = 1

				arg_503_1.dialog_:SetActive(true)
				SetActive(arg_503_1.leftNameGo_, false)

				arg_503_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_503_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_503_1:RecordName(arg_503_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_503_1.iconTrs_.gameObject, false)
				arg_503_1.callingController_:SetSelectedState("normal")

				local var_506_2 = arg_503_1:GetWordFromCfg(115311124)
				local var_506_3 = arg_503_1:FormatText(var_506_2.content)

				arg_503_1.text_.text = var_506_3

				LuaForUtil.ClearLinePrefixSymbol(arg_503_1.text_)

				local var_506_4 = 72
				local var_506_5 = utf8.len(var_506_3)
				local var_506_6 = var_506_4 <= 0 and var_506_1 or var_506_1 * (var_506_5 / var_506_4)

				if var_506_6 > 0 and var_506_1 < var_506_6 then
					arg_503_1.talkMaxDuration = var_506_6

					if var_506_6 + var_506_0 > arg_503_1.duration_ then
						arg_503_1.duration_ = var_506_6 + var_506_0
					end
				end

				arg_503_1.text_.text = var_506_3
				arg_503_1.typewritter.percent = 0

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(false)
				arg_503_1:RecordContent(arg_503_1.text_.text)
			end

			local var_506_7 = math.max(var_506_1, arg_503_1.talkMaxDuration)

			if var_506_0 <= arg_503_1.time_ and arg_503_1.time_ < var_506_0 + var_506_7 then
				arg_503_1.typewritter.percent = (arg_503_1.time_ - var_506_0) / var_506_7

				arg_503_1.typewritter:SetDirty()
			end

			if arg_503_1.time_ >= var_506_0 + var_506_7 and arg_503_1.time_ < var_506_0 + var_506_7 + arg_506_0 then
				arg_503_1.typewritter.percent = 1

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(true)
			end
		end
	end,
	Play115311125 = function(arg_507_0, arg_507_1)
		arg_507_1.time_ = 0
		arg_507_1.frameCnt_ = 0
		arg_507_1.state_ = "playing"
		arg_507_1.curTalkId_ = 115311125
		arg_507_1.duration_ = 5

		SetActive(arg_507_1.tipsGo_, false)

		function arg_507_1.onSingleLineFinish_()
			arg_507_1.onSingleLineUpdate_ = nil
			arg_507_1.onSingleLineFinish_ = nil
			arg_507_1.state_ = "waiting"
		end

		function arg_507_1.playNext_(arg_509_0)
			if arg_509_0 == 1 then
				arg_507_0:Play115311126(arg_507_1)
			end
		end

		function arg_507_1.onSingleLineUpdate_(arg_510_0)
			local var_510_0 = 0
			local var_510_1 = 1.25

			if var_510_0 < arg_507_1.time_ and arg_507_1.time_ <= var_510_0 + arg_510_0 then
				arg_507_1.talkMaxDuration = 0
				arg_507_1.dialogCg_.alpha = 1

				arg_507_1.dialog_:SetActive(true)
				SetActive(arg_507_1.leftNameGo_, false)

				arg_507_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_507_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_507_1:RecordName(arg_507_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_507_1.iconTrs_.gameObject, false)
				arg_507_1.callingController_:SetSelectedState("normal")

				local var_510_2 = arg_507_1:GetWordFromCfg(115311125)
				local var_510_3 = arg_507_1:FormatText(var_510_2.content)

				arg_507_1.text_.text = var_510_3

				LuaForUtil.ClearLinePrefixSymbol(arg_507_1.text_)

				local var_510_4 = 50
				local var_510_5 = utf8.len(var_510_3)
				local var_510_6 = var_510_4 <= 0 and var_510_1 or var_510_1 * (var_510_5 / var_510_4)

				if var_510_6 > 0 and var_510_1 < var_510_6 then
					arg_507_1.talkMaxDuration = var_510_6

					if var_510_6 + var_510_0 > arg_507_1.duration_ then
						arg_507_1.duration_ = var_510_6 + var_510_0
					end
				end

				arg_507_1.text_.text = var_510_3
				arg_507_1.typewritter.percent = 0

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(false)
				arg_507_1:RecordContent(arg_507_1.text_.text)
			end

			local var_510_7 = math.max(var_510_1, arg_507_1.talkMaxDuration)

			if var_510_0 <= arg_507_1.time_ and arg_507_1.time_ < var_510_0 + var_510_7 then
				arg_507_1.typewritter.percent = (arg_507_1.time_ - var_510_0) / var_510_7

				arg_507_1.typewritter:SetDirty()
			end

			if arg_507_1.time_ >= var_510_0 + var_510_7 and arg_507_1.time_ < var_510_0 + var_510_7 + arg_510_0 then
				arg_507_1.typewritter.percent = 1

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(true)
			end
		end
	end,
	Play115311126 = function(arg_511_0, arg_511_1)
		arg_511_1.time_ = 0
		arg_511_1.frameCnt_ = 0
		arg_511_1.state_ = "playing"
		arg_511_1.curTalkId_ = 115311126
		arg_511_1.duration_ = 6.766

		local var_511_0 = {
			ja = 6.766,
			ko = 5.566,
			zh = 5.633,
			en = 5.9
		}
		local var_511_1 = manager.audio:GetLocalizationFlag()

		if var_511_0[var_511_1] ~= nil then
			arg_511_1.duration_ = var_511_0[var_511_1]
		end

		SetActive(arg_511_1.tipsGo_, false)

		function arg_511_1.onSingleLineFinish_()
			arg_511_1.onSingleLineUpdate_ = nil
			arg_511_1.onSingleLineFinish_ = nil
			arg_511_1.state_ = "waiting"
		end

		function arg_511_1.playNext_(arg_513_0)
			if arg_513_0 == 1 then
				arg_511_0:Play115311127(arg_511_1)
			end
		end

		function arg_511_1.onSingleLineUpdate_(arg_514_0)
			local var_514_0 = 0
			local var_514_1 = 0.6

			if var_514_0 < arg_511_1.time_ and arg_511_1.time_ <= var_514_0 + arg_514_0 then
				arg_511_1.talkMaxDuration = 0
				arg_511_1.dialogCg_.alpha = 1

				arg_511_1.dialog_:SetActive(true)
				SetActive(arg_511_1.leftNameGo_, true)

				local var_514_2 = arg_511_1:FormatText(StoryNameCfg[316].name)

				arg_511_1.leftNameTxt_.text = var_514_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_511_1.leftNameTxt_.transform)

				arg_511_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_511_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_511_1:RecordName(arg_511_1.leftNameTxt_.text)
				SetActive(arg_511_1.iconTrs_.gameObject, true)
				arg_511_1.iconController_:SetSelectedState("hero")

				arg_511_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenmb")

				arg_511_1.callingController_:SetSelectedState("normal")

				local var_514_3 = arg_511_1:GetWordFromCfg(115311126)
				local var_514_4 = arg_511_1:FormatText(var_514_3.content)

				arg_511_1.text_.text = var_514_4

				LuaForUtil.ClearLinePrefixSymbol(arg_511_1.text_)

				local var_514_5 = 24
				local var_514_6 = utf8.len(var_514_4)
				local var_514_7 = var_514_5 <= 0 and var_514_1 or var_514_1 * (var_514_6 / var_514_5)

				if var_514_7 > 0 and var_514_1 < var_514_7 then
					arg_511_1.talkMaxDuration = var_514_7

					if var_514_7 + var_514_0 > arg_511_1.duration_ then
						arg_511_1.duration_ = var_514_7 + var_514_0
					end
				end

				arg_511_1.text_.text = var_514_4
				arg_511_1.typewritter.percent = 0

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311126", "story_v_out_115311.awb") ~= 0 then
					local var_514_8 = manager.audio:GetVoiceLength("story_v_out_115311", "115311126", "story_v_out_115311.awb") / 1000

					if var_514_8 + var_514_0 > arg_511_1.duration_ then
						arg_511_1.duration_ = var_514_8 + var_514_0
					end

					if var_514_3.prefab_name ~= "" and arg_511_1.actors_[var_514_3.prefab_name] ~= nil then
						local var_514_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_511_1.actors_[var_514_3.prefab_name].transform, "story_v_out_115311", "115311126", "story_v_out_115311.awb")

						arg_511_1:RecordAudio("115311126", var_514_9)
						arg_511_1:RecordAudio("115311126", var_514_9)
					else
						arg_511_1:AudioAction("play", "voice", "story_v_out_115311", "115311126", "story_v_out_115311.awb")
					end

					arg_511_1:RecordHistoryTalkVoice("story_v_out_115311", "115311126", "story_v_out_115311.awb")
				end

				arg_511_1:RecordContent(arg_511_1.text_.text)
			end

			local var_514_10 = math.max(var_514_1, arg_511_1.talkMaxDuration)

			if var_514_0 <= arg_511_1.time_ and arg_511_1.time_ < var_514_0 + var_514_10 then
				arg_511_1.typewritter.percent = (arg_511_1.time_ - var_514_0) / var_514_10

				arg_511_1.typewritter:SetDirty()
			end

			if arg_511_1.time_ >= var_514_0 + var_514_10 and arg_511_1.time_ < var_514_0 + var_514_10 + arg_514_0 then
				arg_511_1.typewritter.percent = 1

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(true)
			end
		end
	end,
	Play115311127 = function(arg_515_0, arg_515_1)
		arg_515_1.time_ = 0
		arg_515_1.frameCnt_ = 0
		arg_515_1.state_ = "playing"
		arg_515_1.curTalkId_ = 115311127
		arg_515_1.duration_ = 8.1

		local var_515_0 = {
			ja = 8.1,
			ko = 6.566,
			zh = 4.7,
			en = 6.566
		}
		local var_515_1 = manager.audio:GetLocalizationFlag()

		if var_515_0[var_515_1] ~= nil then
			arg_515_1.duration_ = var_515_0[var_515_1]
		end

		SetActive(arg_515_1.tipsGo_, false)

		function arg_515_1.onSingleLineFinish_()
			arg_515_1.onSingleLineUpdate_ = nil
			arg_515_1.onSingleLineFinish_ = nil
			arg_515_1.state_ = "waiting"
		end

		function arg_515_1.playNext_(arg_517_0)
			if arg_517_0 == 1 then
				arg_515_0:Play115311128(arg_515_1)
			end
		end

		function arg_515_1.onSingleLineUpdate_(arg_518_0)
			local var_518_0 = 0
			local var_518_1 = 0.625

			if var_518_0 < arg_515_1.time_ and arg_515_1.time_ <= var_518_0 + arg_518_0 then
				arg_515_1.talkMaxDuration = 0
				arg_515_1.dialogCg_.alpha = 1

				arg_515_1.dialog_:SetActive(true)
				SetActive(arg_515_1.leftNameGo_, true)

				local var_518_2 = arg_515_1:FormatText(StoryNameCfg[104].name)

				arg_515_1.leftNameTxt_.text = var_518_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_515_1.leftNameTxt_.transform)

				arg_515_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_515_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_515_1:RecordName(arg_515_1.leftNameTxt_.text)
				SetActive(arg_515_1.iconTrs_.gameObject, true)
				arg_515_1.iconController_:SetSelectedState("hero")

				arg_515_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_woundedd")

				arg_515_1.callingController_:SetSelectedState("normal")

				local var_518_3 = arg_515_1:GetWordFromCfg(115311127)
				local var_518_4 = arg_515_1:FormatText(var_518_3.content)

				arg_515_1.text_.text = var_518_4

				LuaForUtil.ClearLinePrefixSymbol(arg_515_1.text_)

				local var_518_5 = 25
				local var_518_6 = utf8.len(var_518_4)
				local var_518_7 = var_518_5 <= 0 and var_518_1 or var_518_1 * (var_518_6 / var_518_5)

				if var_518_7 > 0 and var_518_1 < var_518_7 then
					arg_515_1.talkMaxDuration = var_518_7

					if var_518_7 + var_518_0 > arg_515_1.duration_ then
						arg_515_1.duration_ = var_518_7 + var_518_0
					end
				end

				arg_515_1.text_.text = var_518_4
				arg_515_1.typewritter.percent = 0

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311127", "story_v_out_115311.awb") ~= 0 then
					local var_518_8 = manager.audio:GetVoiceLength("story_v_out_115311", "115311127", "story_v_out_115311.awb") / 1000

					if var_518_8 + var_518_0 > arg_515_1.duration_ then
						arg_515_1.duration_ = var_518_8 + var_518_0
					end

					if var_518_3.prefab_name ~= "" and arg_515_1.actors_[var_518_3.prefab_name] ~= nil then
						local var_518_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_515_1.actors_[var_518_3.prefab_name].transform, "story_v_out_115311", "115311127", "story_v_out_115311.awb")

						arg_515_1:RecordAudio("115311127", var_518_9)
						arg_515_1:RecordAudio("115311127", var_518_9)
					else
						arg_515_1:AudioAction("play", "voice", "story_v_out_115311", "115311127", "story_v_out_115311.awb")
					end

					arg_515_1:RecordHistoryTalkVoice("story_v_out_115311", "115311127", "story_v_out_115311.awb")
				end

				arg_515_1:RecordContent(arg_515_1.text_.text)
			end

			local var_518_10 = math.max(var_518_1, arg_515_1.talkMaxDuration)

			if var_518_0 <= arg_515_1.time_ and arg_515_1.time_ < var_518_0 + var_518_10 then
				arg_515_1.typewritter.percent = (arg_515_1.time_ - var_518_0) / var_518_10

				arg_515_1.typewritter:SetDirty()
			end

			if arg_515_1.time_ >= var_518_0 + var_518_10 and arg_515_1.time_ < var_518_0 + var_518_10 + arg_518_0 then
				arg_515_1.typewritter.percent = 1

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(true)
			end
		end
	end,
	Play115311128 = function(arg_519_0, arg_519_1)
		arg_519_1.time_ = 0
		arg_519_1.frameCnt_ = 0
		arg_519_1.state_ = "playing"
		arg_519_1.curTalkId_ = 115311128
		arg_519_1.duration_ = 5

		SetActive(arg_519_1.tipsGo_, false)

		function arg_519_1.onSingleLineFinish_()
			arg_519_1.onSingleLineUpdate_ = nil
			arg_519_1.onSingleLineFinish_ = nil
			arg_519_1.state_ = "waiting"
		end

		function arg_519_1.playNext_(arg_521_0)
			if arg_521_0 == 1 then
				arg_519_0:Play115311129(arg_519_1)
			end
		end

		function arg_519_1.onSingleLineUpdate_(arg_522_0)
			local var_522_0 = 0
			local var_522_1 = 1

			if var_522_0 < arg_519_1.time_ and arg_519_1.time_ <= var_522_0 + arg_522_0 then
				arg_519_1.talkMaxDuration = 0
				arg_519_1.dialogCg_.alpha = 1

				arg_519_1.dialog_:SetActive(true)
				SetActive(arg_519_1.leftNameGo_, false)

				arg_519_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_519_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_519_1:RecordName(arg_519_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_519_1.iconTrs_.gameObject, false)
				arg_519_1.callingController_:SetSelectedState("normal")

				local var_522_2 = arg_519_1:GetWordFromCfg(115311128)
				local var_522_3 = arg_519_1:FormatText(var_522_2.content)

				arg_519_1.text_.text = var_522_3

				LuaForUtil.ClearLinePrefixSymbol(arg_519_1.text_)

				local var_522_4 = 40
				local var_522_5 = utf8.len(var_522_3)
				local var_522_6 = var_522_4 <= 0 and var_522_1 or var_522_1 * (var_522_5 / var_522_4)

				if var_522_6 > 0 and var_522_1 < var_522_6 then
					arg_519_1.talkMaxDuration = var_522_6

					if var_522_6 + var_522_0 > arg_519_1.duration_ then
						arg_519_1.duration_ = var_522_6 + var_522_0
					end
				end

				arg_519_1.text_.text = var_522_3
				arg_519_1.typewritter.percent = 0

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(false)
				arg_519_1:RecordContent(arg_519_1.text_.text)
			end

			local var_522_7 = math.max(var_522_1, arg_519_1.talkMaxDuration)

			if var_522_0 <= arg_519_1.time_ and arg_519_1.time_ < var_522_0 + var_522_7 then
				arg_519_1.typewritter.percent = (arg_519_1.time_ - var_522_0) / var_522_7

				arg_519_1.typewritter:SetDirty()
			end

			if arg_519_1.time_ >= var_522_0 + var_522_7 and arg_519_1.time_ < var_522_0 + var_522_7 + arg_522_0 then
				arg_519_1.typewritter.percent = 1

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(true)
			end
		end
	end,
	Play115311129 = function(arg_523_0, arg_523_1)
		arg_523_1.time_ = 0
		arg_523_1.frameCnt_ = 0
		arg_523_1.state_ = "playing"
		arg_523_1.curTalkId_ = 115311129
		arg_523_1.duration_ = 5

		SetActive(arg_523_1.tipsGo_, false)

		function arg_523_1.onSingleLineFinish_()
			arg_523_1.onSingleLineUpdate_ = nil
			arg_523_1.onSingleLineFinish_ = nil
			arg_523_1.state_ = "waiting"
		end

		function arg_523_1.playNext_(arg_525_0)
			if arg_525_0 == 1 then
				arg_523_0:Play115311130(arg_523_1)
			end
		end

		function arg_523_1.onSingleLineUpdate_(arg_526_0)
			local var_526_0 = 0
			local var_526_1 = 1.15

			if var_526_0 < arg_523_1.time_ and arg_523_1.time_ <= var_526_0 + arg_526_0 then
				arg_523_1.talkMaxDuration = 0
				arg_523_1.dialogCg_.alpha = 1

				arg_523_1.dialog_:SetActive(true)
				SetActive(arg_523_1.leftNameGo_, false)

				arg_523_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_523_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_523_1:RecordName(arg_523_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_523_1.iconTrs_.gameObject, false)
				arg_523_1.callingController_:SetSelectedState("normal")

				local var_526_2 = arg_523_1:GetWordFromCfg(115311129)
				local var_526_3 = arg_523_1:FormatText(var_526_2.content)

				arg_523_1.text_.text = var_526_3

				LuaForUtil.ClearLinePrefixSymbol(arg_523_1.text_)

				local var_526_4 = 46
				local var_526_5 = utf8.len(var_526_3)
				local var_526_6 = var_526_4 <= 0 and var_526_1 or var_526_1 * (var_526_5 / var_526_4)

				if var_526_6 > 0 and var_526_1 < var_526_6 then
					arg_523_1.talkMaxDuration = var_526_6

					if var_526_6 + var_526_0 > arg_523_1.duration_ then
						arg_523_1.duration_ = var_526_6 + var_526_0
					end
				end

				arg_523_1.text_.text = var_526_3
				arg_523_1.typewritter.percent = 0

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(false)
				arg_523_1:RecordContent(arg_523_1.text_.text)
			end

			local var_526_7 = math.max(var_526_1, arg_523_1.talkMaxDuration)

			if var_526_0 <= arg_523_1.time_ and arg_523_1.time_ < var_526_0 + var_526_7 then
				arg_523_1.typewritter.percent = (arg_523_1.time_ - var_526_0) / var_526_7

				arg_523_1.typewritter:SetDirty()
			end

			if arg_523_1.time_ >= var_526_0 + var_526_7 and arg_523_1.time_ < var_526_0 + var_526_7 + arg_526_0 then
				arg_523_1.typewritter.percent = 1

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(true)
			end
		end
	end,
	Play115311130 = function(arg_527_0, arg_527_1)
		arg_527_1.time_ = 0
		arg_527_1.frameCnt_ = 0
		arg_527_1.state_ = "playing"
		arg_527_1.curTalkId_ = 115311130
		arg_527_1.duration_ = 4.666

		local var_527_0 = {
			ja = 4.666,
			ko = 2.533,
			zh = 3.5,
			en = 2.566
		}
		local var_527_1 = manager.audio:GetLocalizationFlag()

		if var_527_0[var_527_1] ~= nil then
			arg_527_1.duration_ = var_527_0[var_527_1]
		end

		SetActive(arg_527_1.tipsGo_, false)

		function arg_527_1.onSingleLineFinish_()
			arg_527_1.onSingleLineUpdate_ = nil
			arg_527_1.onSingleLineFinish_ = nil
			arg_527_1.state_ = "waiting"
		end

		function arg_527_1.playNext_(arg_529_0)
			if arg_529_0 == 1 then
				arg_527_0:Play115311131(arg_527_1)
			end
		end

		function arg_527_1.onSingleLineUpdate_(arg_530_0)
			local var_530_0 = arg_527_1.actors_["113801_1"].transform
			local var_530_1 = 0

			if var_530_1 < arg_527_1.time_ and arg_527_1.time_ <= var_530_1 + arg_530_0 then
				arg_527_1.var_.moveOldPos113801_1 = var_530_0.localPosition
				var_530_0.localScale = Vector3.New(1, 1, 1)

				arg_527_1:CheckSpriteTmpPos("113801_1", 3)
			end

			local var_530_2 = 0.001

			if var_530_1 <= arg_527_1.time_ and arg_527_1.time_ < var_530_1 + var_530_2 then
				local var_530_3 = (arg_527_1.time_ - var_530_1) / var_530_2
				local var_530_4 = Vector3.New(0, -310, -370)

				var_530_0.localPosition = Vector3.Lerp(arg_527_1.var_.moveOldPos113801_1, var_530_4, var_530_3)
			end

			if arg_527_1.time_ >= var_530_1 + var_530_2 and arg_527_1.time_ < var_530_1 + var_530_2 + arg_530_0 then
				var_530_0.localPosition = Vector3.New(0, -310, -370)
			end

			local var_530_5 = arg_527_1.actors_["113801_1"]
			local var_530_6 = 0

			if var_530_6 < arg_527_1.time_ and arg_527_1.time_ <= var_530_6 + arg_530_0 then
				local var_530_7 = var_530_5:GetComponent("Image")

				if var_530_7 then
					arg_527_1.var_.alphaMatValue113801_1 = var_530_7
					arg_527_1.var_.alphaOldValue113801_1 = var_530_7.color.a
				end

				arg_527_1.var_.alphaOldValue113801_1 = 0
			end

			local var_530_8 = 0.5

			if var_530_6 <= arg_527_1.time_ and arg_527_1.time_ < var_530_6 + var_530_8 then
				local var_530_9 = (arg_527_1.time_ - var_530_6) / var_530_8
				local var_530_10 = Mathf.Lerp(arg_527_1.var_.alphaOldValue113801_1, 1, var_530_9)

				if arg_527_1.var_.alphaMatValue113801_1 then
					local var_530_11 = arg_527_1.var_.alphaMatValue113801_1.color

					var_530_11.a = var_530_10
					arg_527_1.var_.alphaMatValue113801_1.color = var_530_11
				end
			end

			if arg_527_1.time_ >= var_530_6 + var_530_8 and arg_527_1.time_ < var_530_6 + var_530_8 + arg_530_0 and arg_527_1.var_.alphaMatValue113801_1 then
				local var_530_12 = arg_527_1.var_.alphaMatValue113801_1
				local var_530_13 = var_530_12.color

				var_530_13.a = 1
				var_530_12.color = var_530_13
			end

			local var_530_14 = arg_527_1.actors_["113801_1"]
			local var_530_15 = 0

			if var_530_15 < arg_527_1.time_ and arg_527_1.time_ <= var_530_15 + arg_530_0 then
				local var_530_16 = var_530_14:GetComponent("Image")

				if var_530_16 then
					arg_527_1.var_.highlightMatValue113801_1 = var_530_16
				end
			end

			local var_530_17 = 0.2

			if var_530_15 <= arg_527_1.time_ and arg_527_1.time_ < var_530_15 + var_530_17 then
				local var_530_18 = (arg_527_1.time_ - var_530_15) / var_530_17

				if arg_527_1.var_.highlightMatValue113801_1 then
					local var_530_19 = Mathf.Lerp(0.5, 1, var_530_18)
					local var_530_20 = arg_527_1.var_.highlightMatValue113801_1
					local var_530_21 = var_530_20.color

					var_530_21.r = var_530_19
					var_530_21.g = var_530_19
					var_530_21.b = var_530_19
					var_530_20.color = var_530_21
				end
			end

			if arg_527_1.time_ >= var_530_15 + var_530_17 and arg_527_1.time_ < var_530_15 + var_530_17 + arg_530_0 and arg_527_1.var_.highlightMatValue113801_1 then
				local var_530_22 = 1

				var_530_14.transform:SetSiblingIndex(1)

				local var_530_23 = arg_527_1.var_.highlightMatValue113801_1
				local var_530_24 = var_530_23.color

				var_530_24.r = var_530_22
				var_530_24.g = var_530_22
				var_530_24.b = var_530_22
				var_530_23.color = var_530_24
			end

			local var_530_25 = 0
			local var_530_26 = 0.25

			if var_530_25 < arg_527_1.time_ and arg_527_1.time_ <= var_530_25 + arg_530_0 then
				arg_527_1.talkMaxDuration = 0
				arg_527_1.dialogCg_.alpha = 1

				arg_527_1.dialog_:SetActive(true)
				SetActive(arg_527_1.leftNameGo_, true)

				local var_530_27 = arg_527_1:FormatText(StoryNameCfg[94].name)

				arg_527_1.leftNameTxt_.text = var_530_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_527_1.leftNameTxt_.transform)

				arg_527_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_527_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_527_1:RecordName(arg_527_1.leftNameTxt_.text)
				SetActive(arg_527_1.iconTrs_.gameObject, false)
				arg_527_1.callingController_:SetSelectedState("normal")

				local var_530_28 = arg_527_1:GetWordFromCfg(115311130)
				local var_530_29 = arg_527_1:FormatText(var_530_28.content)

				arg_527_1.text_.text = var_530_29

				LuaForUtil.ClearLinePrefixSymbol(arg_527_1.text_)

				local var_530_30 = 10
				local var_530_31 = utf8.len(var_530_29)
				local var_530_32 = var_530_30 <= 0 and var_530_26 or var_530_26 * (var_530_31 / var_530_30)

				if var_530_32 > 0 and var_530_26 < var_530_32 then
					arg_527_1.talkMaxDuration = var_530_32

					if var_530_32 + var_530_25 > arg_527_1.duration_ then
						arg_527_1.duration_ = var_530_32 + var_530_25
					end
				end

				arg_527_1.text_.text = var_530_29
				arg_527_1.typewritter.percent = 0

				arg_527_1.typewritter:SetDirty()
				arg_527_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311130", "story_v_out_115311.awb") ~= 0 then
					local var_530_33 = manager.audio:GetVoiceLength("story_v_out_115311", "115311130", "story_v_out_115311.awb") / 1000

					if var_530_33 + var_530_25 > arg_527_1.duration_ then
						arg_527_1.duration_ = var_530_33 + var_530_25
					end

					if var_530_28.prefab_name ~= "" and arg_527_1.actors_[var_530_28.prefab_name] ~= nil then
						local var_530_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_527_1.actors_[var_530_28.prefab_name].transform, "story_v_out_115311", "115311130", "story_v_out_115311.awb")

						arg_527_1:RecordAudio("115311130", var_530_34)
						arg_527_1:RecordAudio("115311130", var_530_34)
					else
						arg_527_1:AudioAction("play", "voice", "story_v_out_115311", "115311130", "story_v_out_115311.awb")
					end

					arg_527_1:RecordHistoryTalkVoice("story_v_out_115311", "115311130", "story_v_out_115311.awb")
				end

				arg_527_1:RecordContent(arg_527_1.text_.text)
			end

			local var_530_35 = math.max(var_530_26, arg_527_1.talkMaxDuration)

			if var_530_25 <= arg_527_1.time_ and arg_527_1.time_ < var_530_25 + var_530_35 then
				arg_527_1.typewritter.percent = (arg_527_1.time_ - var_530_25) / var_530_35

				arg_527_1.typewritter:SetDirty()
			end

			if arg_527_1.time_ >= var_530_25 + var_530_35 and arg_527_1.time_ < var_530_25 + var_530_35 + arg_530_0 then
				arg_527_1.typewritter.percent = 1

				arg_527_1.typewritter:SetDirty()
				arg_527_1:ShowNextGo(true)
			end
		end
	end,
	Play115311131 = function(arg_531_0, arg_531_1)
		arg_531_1.time_ = 0
		arg_531_1.frameCnt_ = 0
		arg_531_1.state_ = "playing"
		arg_531_1.curTalkId_ = 115311131
		arg_531_1.duration_ = 5

		SetActive(arg_531_1.tipsGo_, false)

		function arg_531_1.onSingleLineFinish_()
			arg_531_1.onSingleLineUpdate_ = nil
			arg_531_1.onSingleLineFinish_ = nil
			arg_531_1.state_ = "waiting"
		end

		function arg_531_1.playNext_(arg_533_0)
			if arg_533_0 == 1 then
				arg_531_0:Play115311132(arg_531_1)
			end
		end

		function arg_531_1.onSingleLineUpdate_(arg_534_0)
			local var_534_0 = arg_531_1.actors_["113801_1"]
			local var_534_1 = 0

			if var_534_1 < arg_531_1.time_ and arg_531_1.time_ <= var_534_1 + arg_534_0 then
				local var_534_2 = var_534_0:GetComponent("Image")

				if var_534_2 then
					arg_531_1.var_.highlightMatValue113801_1 = var_534_2
				end
			end

			local var_534_3 = 0.2

			if var_534_1 <= arg_531_1.time_ and arg_531_1.time_ < var_534_1 + var_534_3 then
				local var_534_4 = (arg_531_1.time_ - var_534_1) / var_534_3

				if arg_531_1.var_.highlightMatValue113801_1 then
					local var_534_5 = Mathf.Lerp(1, 0.5, var_534_4)
					local var_534_6 = arg_531_1.var_.highlightMatValue113801_1
					local var_534_7 = var_534_6.color

					var_534_7.r = var_534_5
					var_534_7.g = var_534_5
					var_534_7.b = var_534_5
					var_534_6.color = var_534_7
				end
			end

			if arg_531_1.time_ >= var_534_1 + var_534_3 and arg_531_1.time_ < var_534_1 + var_534_3 + arg_534_0 and arg_531_1.var_.highlightMatValue113801_1 then
				local var_534_8 = 0.5
				local var_534_9 = arg_531_1.var_.highlightMatValue113801_1
				local var_534_10 = var_534_9.color

				var_534_10.r = var_534_8
				var_534_10.g = var_534_8
				var_534_10.b = var_534_8
				var_534_9.color = var_534_10
			end

			local var_534_11 = 0
			local var_534_12 = 1.7

			if var_534_11 < arg_531_1.time_ and arg_531_1.time_ <= var_534_11 + arg_534_0 then
				arg_531_1.talkMaxDuration = 0
				arg_531_1.dialogCg_.alpha = 1

				arg_531_1.dialog_:SetActive(true)
				SetActive(arg_531_1.leftNameGo_, false)

				arg_531_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_531_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_531_1:RecordName(arg_531_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_531_1.iconTrs_.gameObject, false)
				arg_531_1.callingController_:SetSelectedState("normal")

				local var_534_13 = arg_531_1:GetWordFromCfg(115311131)
				local var_534_14 = arg_531_1:FormatText(var_534_13.content)

				arg_531_1.text_.text = var_534_14

				LuaForUtil.ClearLinePrefixSymbol(arg_531_1.text_)

				local var_534_15 = 68
				local var_534_16 = utf8.len(var_534_14)
				local var_534_17 = var_534_15 <= 0 and var_534_12 or var_534_12 * (var_534_16 / var_534_15)

				if var_534_17 > 0 and var_534_12 < var_534_17 then
					arg_531_1.talkMaxDuration = var_534_17

					if var_534_17 + var_534_11 > arg_531_1.duration_ then
						arg_531_1.duration_ = var_534_17 + var_534_11
					end
				end

				arg_531_1.text_.text = var_534_14
				arg_531_1.typewritter.percent = 0

				arg_531_1.typewritter:SetDirty()
				arg_531_1:ShowNextGo(false)
				arg_531_1:RecordContent(arg_531_1.text_.text)
			end

			local var_534_18 = math.max(var_534_12, arg_531_1.talkMaxDuration)

			if var_534_11 <= arg_531_1.time_ and arg_531_1.time_ < var_534_11 + var_534_18 then
				arg_531_1.typewritter.percent = (arg_531_1.time_ - var_534_11) / var_534_18

				arg_531_1.typewritter:SetDirty()
			end

			if arg_531_1.time_ >= var_534_11 + var_534_18 and arg_531_1.time_ < var_534_11 + var_534_18 + arg_534_0 then
				arg_531_1.typewritter.percent = 1

				arg_531_1.typewritter:SetDirty()
				arg_531_1:ShowNextGo(true)
			end
		end
	end,
	Play115311132 = function(arg_535_0, arg_535_1)
		arg_535_1.time_ = 0
		arg_535_1.frameCnt_ = 0
		arg_535_1.state_ = "playing"
		arg_535_1.curTalkId_ = 115311132
		arg_535_1.duration_ = 4.566

		local var_535_0 = {
			ja = 2.666,
			ko = 3.733,
			zh = 4.566,
			en = 3.8
		}
		local var_535_1 = manager.audio:GetLocalizationFlag()

		if var_535_0[var_535_1] ~= nil then
			arg_535_1.duration_ = var_535_0[var_535_1]
		end

		SetActive(arg_535_1.tipsGo_, false)

		function arg_535_1.onSingleLineFinish_()
			arg_535_1.onSingleLineUpdate_ = nil
			arg_535_1.onSingleLineFinish_ = nil
			arg_535_1.state_ = "waiting"
		end

		function arg_535_1.playNext_(arg_537_0)
			if arg_537_0 == 1 then
				arg_535_0:Play115311133(arg_535_1)
			end
		end

		function arg_535_1.onSingleLineUpdate_(arg_538_0)
			local var_538_0 = arg_535_1.actors_["113801_1"]
			local var_538_1 = 0

			if var_538_1 < arg_535_1.time_ and arg_535_1.time_ <= var_538_1 + arg_538_0 then
				local var_538_2 = var_538_0:GetComponent("Image")

				if var_538_2 then
					arg_535_1.var_.highlightMatValue113801_1 = var_538_2
				end
			end

			local var_538_3 = 0.2

			if var_538_1 <= arg_535_1.time_ and arg_535_1.time_ < var_538_1 + var_538_3 then
				local var_538_4 = (arg_535_1.time_ - var_538_1) / var_538_3

				if arg_535_1.var_.highlightMatValue113801_1 then
					local var_538_5 = Mathf.Lerp(0.5, 1, var_538_4)
					local var_538_6 = arg_535_1.var_.highlightMatValue113801_1
					local var_538_7 = var_538_6.color

					var_538_7.r = var_538_5
					var_538_7.g = var_538_5
					var_538_7.b = var_538_5
					var_538_6.color = var_538_7
				end
			end

			if arg_535_1.time_ >= var_538_1 + var_538_3 and arg_535_1.time_ < var_538_1 + var_538_3 + arg_538_0 and arg_535_1.var_.highlightMatValue113801_1 then
				local var_538_8 = 1

				var_538_0.transform:SetSiblingIndex(1)

				local var_538_9 = arg_535_1.var_.highlightMatValue113801_1
				local var_538_10 = var_538_9.color

				var_538_10.r = var_538_8
				var_538_10.g = var_538_8
				var_538_10.b = var_538_8
				var_538_9.color = var_538_10
			end

			local var_538_11 = 0
			local var_538_12 = 0.275

			if var_538_11 < arg_535_1.time_ and arg_535_1.time_ <= var_538_11 + arg_538_0 then
				arg_535_1.talkMaxDuration = 0
				arg_535_1.dialogCg_.alpha = 1

				arg_535_1.dialog_:SetActive(true)
				SetActive(arg_535_1.leftNameGo_, true)

				local var_538_13 = arg_535_1:FormatText(StoryNameCfg[94].name)

				arg_535_1.leftNameTxt_.text = var_538_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_535_1.leftNameTxt_.transform)

				arg_535_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_535_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_535_1:RecordName(arg_535_1.leftNameTxt_.text)
				SetActive(arg_535_1.iconTrs_.gameObject, false)
				arg_535_1.callingController_:SetSelectedState("normal")

				local var_538_14 = arg_535_1:GetWordFromCfg(115311132)
				local var_538_15 = arg_535_1:FormatText(var_538_14.content)

				arg_535_1.text_.text = var_538_15

				LuaForUtil.ClearLinePrefixSymbol(arg_535_1.text_)

				local var_538_16 = 11
				local var_538_17 = utf8.len(var_538_15)
				local var_538_18 = var_538_16 <= 0 and var_538_12 or var_538_12 * (var_538_17 / var_538_16)

				if var_538_18 > 0 and var_538_12 < var_538_18 then
					arg_535_1.talkMaxDuration = var_538_18

					if var_538_18 + var_538_11 > arg_535_1.duration_ then
						arg_535_1.duration_ = var_538_18 + var_538_11
					end
				end

				arg_535_1.text_.text = var_538_15
				arg_535_1.typewritter.percent = 0

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311132", "story_v_out_115311.awb") ~= 0 then
					local var_538_19 = manager.audio:GetVoiceLength("story_v_out_115311", "115311132", "story_v_out_115311.awb") / 1000

					if var_538_19 + var_538_11 > arg_535_1.duration_ then
						arg_535_1.duration_ = var_538_19 + var_538_11
					end

					if var_538_14.prefab_name ~= "" and arg_535_1.actors_[var_538_14.prefab_name] ~= nil then
						local var_538_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_535_1.actors_[var_538_14.prefab_name].transform, "story_v_out_115311", "115311132", "story_v_out_115311.awb")

						arg_535_1:RecordAudio("115311132", var_538_20)
						arg_535_1:RecordAudio("115311132", var_538_20)
					else
						arg_535_1:AudioAction("play", "voice", "story_v_out_115311", "115311132", "story_v_out_115311.awb")
					end

					arg_535_1:RecordHistoryTalkVoice("story_v_out_115311", "115311132", "story_v_out_115311.awb")
				end

				arg_535_1:RecordContent(arg_535_1.text_.text)
			end

			local var_538_21 = math.max(var_538_12, arg_535_1.talkMaxDuration)

			if var_538_11 <= arg_535_1.time_ and arg_535_1.time_ < var_538_11 + var_538_21 then
				arg_535_1.typewritter.percent = (arg_535_1.time_ - var_538_11) / var_538_21

				arg_535_1.typewritter:SetDirty()
			end

			if arg_535_1.time_ >= var_538_11 + var_538_21 and arg_535_1.time_ < var_538_11 + var_538_21 + arg_538_0 then
				arg_535_1.typewritter.percent = 1

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(true)
			end
		end
	end,
	Play115311133 = function(arg_539_0, arg_539_1)
		arg_539_1.time_ = 0
		arg_539_1.frameCnt_ = 0
		arg_539_1.state_ = "playing"
		arg_539_1.curTalkId_ = 115311133
		arg_539_1.duration_ = 9

		SetActive(arg_539_1.tipsGo_, false)

		function arg_539_1.onSingleLineFinish_()
			arg_539_1.onSingleLineUpdate_ = nil
			arg_539_1.onSingleLineFinish_ = nil
			arg_539_1.state_ = "waiting"
		end

		function arg_539_1.playNext_(arg_541_0)
			if arg_541_0 == 1 then
				arg_539_0:Play115311134(arg_539_1)
			end
		end

		function arg_539_1.onSingleLineUpdate_(arg_542_0)
			local var_542_0 = 2

			if var_542_0 < arg_539_1.time_ and arg_539_1.time_ <= var_542_0 + arg_542_0 then
				local var_542_1 = manager.ui.mainCamera.transform.localPosition
				local var_542_2 = Vector3.New(0, 0, 10) + Vector3.New(var_542_1.x, var_542_1.y, 0)
				local var_542_3 = arg_539_1.bgs_.ST22a

				var_542_3.transform.localPosition = var_542_2
				var_542_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_542_4 = var_542_3:GetComponent("SpriteRenderer")

				if var_542_4 and var_542_4.sprite then
					local var_542_5 = (var_542_3.transform.localPosition - var_542_1).z
					local var_542_6 = manager.ui.mainCameraCom_
					local var_542_7 = 2 * var_542_5 * Mathf.Tan(var_542_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_542_8 = var_542_7 * var_542_6.aspect
					local var_542_9 = var_542_4.sprite.bounds.size.x
					local var_542_10 = var_542_4.sprite.bounds.size.y
					local var_542_11 = var_542_8 / var_542_9
					local var_542_12 = var_542_7 / var_542_10
					local var_542_13 = var_542_12 < var_542_11 and var_542_11 or var_542_12

					var_542_3.transform.localScale = Vector3.New(var_542_13, var_542_13, 0)
				end

				for iter_542_0, iter_542_1 in pairs(arg_539_1.bgs_) do
					if iter_542_0 ~= "ST22a" then
						iter_542_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_542_14 = 0

			if var_542_14 < arg_539_1.time_ and arg_539_1.time_ <= var_542_14 + arg_542_0 then
				arg_539_1.mask_.enabled = true
				arg_539_1.mask_.raycastTarget = true

				arg_539_1:SetGaussion(false)
			end

			local var_542_15 = 2

			if var_542_14 <= arg_539_1.time_ and arg_539_1.time_ < var_542_14 + var_542_15 then
				local var_542_16 = (arg_539_1.time_ - var_542_14) / var_542_15
				local var_542_17 = Color.New(0, 0, 0)

				var_542_17.a = Mathf.Lerp(0, 1, var_542_16)
				arg_539_1.mask_.color = var_542_17
			end

			if arg_539_1.time_ >= var_542_14 + var_542_15 and arg_539_1.time_ < var_542_14 + var_542_15 + arg_542_0 then
				local var_542_18 = Color.New(0, 0, 0)

				var_542_18.a = 1
				arg_539_1.mask_.color = var_542_18
			end

			local var_542_19 = 2

			if var_542_19 < arg_539_1.time_ and arg_539_1.time_ <= var_542_19 + arg_542_0 then
				arg_539_1.mask_.enabled = true
				arg_539_1.mask_.raycastTarget = true

				arg_539_1:SetGaussion(false)
			end

			local var_542_20 = 2

			if var_542_19 <= arg_539_1.time_ and arg_539_1.time_ < var_542_19 + var_542_20 then
				local var_542_21 = (arg_539_1.time_ - var_542_19) / var_542_20
				local var_542_22 = Color.New(0, 0, 0)

				var_542_22.a = Mathf.Lerp(1, 0, var_542_21)
				arg_539_1.mask_.color = var_542_22
			end

			if arg_539_1.time_ >= var_542_19 + var_542_20 and arg_539_1.time_ < var_542_19 + var_542_20 + arg_542_0 then
				local var_542_23 = Color.New(0, 0, 0)
				local var_542_24 = 0

				arg_539_1.mask_.enabled = false
				var_542_23.a = var_542_24
				arg_539_1.mask_.color = var_542_23
			end

			local var_542_25 = arg_539_1.actors_["113801_1"].transform
			local var_542_26 = 1.966

			if var_542_26 < arg_539_1.time_ and arg_539_1.time_ <= var_542_26 + arg_542_0 then
				arg_539_1.var_.moveOldPos113801_1 = var_542_25.localPosition
				var_542_25.localScale = Vector3.New(1, 1, 1)

				arg_539_1:CheckSpriteTmpPos("113801_1", 7)
			end

			local var_542_27 = 0.001

			if var_542_26 <= arg_539_1.time_ and arg_539_1.time_ < var_542_26 + var_542_27 then
				local var_542_28 = (arg_539_1.time_ - var_542_26) / var_542_27
				local var_542_29 = Vector3.New(0, -2000, -370)

				var_542_25.localPosition = Vector3.Lerp(arg_539_1.var_.moveOldPos113801_1, var_542_29, var_542_28)
			end

			if arg_539_1.time_ >= var_542_26 + var_542_27 and arg_539_1.time_ < var_542_26 + var_542_27 + arg_542_0 then
				var_542_25.localPosition = Vector3.New(0, -2000, -370)
			end

			if arg_539_1.frameCnt_ <= 1 then
				arg_539_1.dialog_:SetActive(false)
			end

			local var_542_30 = 4
			local var_542_31 = 0.575

			if var_542_30 < arg_539_1.time_ and arg_539_1.time_ <= var_542_30 + arg_542_0 then
				arg_539_1.talkMaxDuration = 0

				arg_539_1.dialog_:SetActive(true)

				local var_542_32 = LeanTween.value(arg_539_1.dialog_, 0, 1, 0.3)

				var_542_32:setOnUpdate(LuaHelper.FloatAction(function(arg_543_0)
					arg_539_1.dialogCg_.alpha = arg_543_0
				end))
				var_542_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_539_1.dialog_)
					var_542_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_539_1.duration_ = arg_539_1.duration_ + 0.3

				SetActive(arg_539_1.leftNameGo_, false)

				arg_539_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_539_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_539_1:RecordName(arg_539_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_539_1.iconTrs_.gameObject, false)
				arg_539_1.callingController_:SetSelectedState("normal")

				local var_542_33 = arg_539_1:GetWordFromCfg(115311133)
				local var_542_34 = arg_539_1:FormatText(var_542_33.content)

				arg_539_1.text_.text = var_542_34

				LuaForUtil.ClearLinePrefixSymbol(arg_539_1.text_)

				local var_542_35 = 23
				local var_542_36 = utf8.len(var_542_34)
				local var_542_37 = var_542_35 <= 0 and var_542_31 or var_542_31 * (var_542_36 / var_542_35)

				if var_542_37 > 0 and var_542_31 < var_542_37 then
					arg_539_1.talkMaxDuration = var_542_37
					var_542_30 = var_542_30 + 0.3

					if var_542_37 + var_542_30 > arg_539_1.duration_ then
						arg_539_1.duration_ = var_542_37 + var_542_30
					end
				end

				arg_539_1.text_.text = var_542_34
				arg_539_1.typewritter.percent = 0

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(false)
				arg_539_1:RecordContent(arg_539_1.text_.text)
			end

			local var_542_38 = var_542_30 + 0.3
			local var_542_39 = math.max(var_542_31, arg_539_1.talkMaxDuration)

			if var_542_38 <= arg_539_1.time_ and arg_539_1.time_ < var_542_38 + var_542_39 then
				arg_539_1.typewritter.percent = (arg_539_1.time_ - var_542_38) / var_542_39

				arg_539_1.typewritter:SetDirty()
			end

			if arg_539_1.time_ >= var_542_38 + var_542_39 and arg_539_1.time_ < var_542_38 + var_542_39 + arg_542_0 then
				arg_539_1.typewritter.percent = 1

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(true)
			end
		end
	end,
	Play115311134 = function(arg_545_0, arg_545_1)
		arg_545_1.time_ = 0
		arg_545_1.frameCnt_ = 0
		arg_545_1.state_ = "playing"
		arg_545_1.curTalkId_ = 115311134
		arg_545_1.duration_ = 5

		SetActive(arg_545_1.tipsGo_, false)

		function arg_545_1.onSingleLineFinish_()
			arg_545_1.onSingleLineUpdate_ = nil
			arg_545_1.onSingleLineFinish_ = nil
			arg_545_1.state_ = "waiting"
		end

		function arg_545_1.playNext_(arg_547_0)
			if arg_547_0 == 1 then
				arg_545_0:Play115311135(arg_545_1)
			end
		end

		function arg_545_1.onSingleLineUpdate_(arg_548_0)
			local var_548_0 = 0
			local var_548_1 = 0.75

			if var_548_0 < arg_545_1.time_ and arg_545_1.time_ <= var_548_0 + arg_548_0 then
				arg_545_1.talkMaxDuration = 0
				arg_545_1.dialogCg_.alpha = 1

				arg_545_1.dialog_:SetActive(true)
				SetActive(arg_545_1.leftNameGo_, false)

				arg_545_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_545_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_545_1:RecordName(arg_545_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_545_1.iconTrs_.gameObject, false)
				arg_545_1.callingController_:SetSelectedState("normal")

				local var_548_2 = arg_545_1:GetWordFromCfg(115311134)
				local var_548_3 = arg_545_1:FormatText(var_548_2.content)

				arg_545_1.text_.text = var_548_3

				LuaForUtil.ClearLinePrefixSymbol(arg_545_1.text_)

				local var_548_4 = 30
				local var_548_5 = utf8.len(var_548_3)
				local var_548_6 = var_548_4 <= 0 and var_548_1 or var_548_1 * (var_548_5 / var_548_4)

				if var_548_6 > 0 and var_548_1 < var_548_6 then
					arg_545_1.talkMaxDuration = var_548_6

					if var_548_6 + var_548_0 > arg_545_1.duration_ then
						arg_545_1.duration_ = var_548_6 + var_548_0
					end
				end

				arg_545_1.text_.text = var_548_3
				arg_545_1.typewritter.percent = 0

				arg_545_1.typewritter:SetDirty()
				arg_545_1:ShowNextGo(false)
				arg_545_1:RecordContent(arg_545_1.text_.text)
			end

			local var_548_7 = math.max(var_548_1, arg_545_1.talkMaxDuration)

			if var_548_0 <= arg_545_1.time_ and arg_545_1.time_ < var_548_0 + var_548_7 then
				arg_545_1.typewritter.percent = (arg_545_1.time_ - var_548_0) / var_548_7

				arg_545_1.typewritter:SetDirty()
			end

			if arg_545_1.time_ >= var_548_0 + var_548_7 and arg_545_1.time_ < var_548_0 + var_548_7 + arg_548_0 then
				arg_545_1.typewritter.percent = 1

				arg_545_1.typewritter:SetDirty()
				arg_545_1:ShowNextGo(true)
			end
		end
	end,
	Play115311135 = function(arg_549_0, arg_549_1)
		arg_549_1.time_ = 0
		arg_549_1.frameCnt_ = 0
		arg_549_1.state_ = "playing"
		arg_549_1.curTalkId_ = 115311135
		arg_549_1.duration_ = 12.833

		local var_549_0 = {
			ja = 12.833,
			ko = 5.466,
			zh = 8.133,
			en = 6.966
		}
		local var_549_1 = manager.audio:GetLocalizationFlag()

		if var_549_0[var_549_1] ~= nil then
			arg_549_1.duration_ = var_549_0[var_549_1]
		end

		SetActive(arg_549_1.tipsGo_, false)

		function arg_549_1.onSingleLineFinish_()
			arg_549_1.onSingleLineUpdate_ = nil
			arg_549_1.onSingleLineFinish_ = nil
			arg_549_1.state_ = "waiting"
		end

		function arg_549_1.playNext_(arg_551_0)
			if arg_551_0 == 1 then
				arg_549_0:Play115311136(arg_549_1)
			end
		end

		function arg_549_1.onSingleLineUpdate_(arg_552_0)
			local var_552_0 = arg_549_1.actors_["10030"]
			local var_552_1 = 0

			if var_552_1 < arg_549_1.time_ and arg_549_1.time_ <= var_552_1 + arg_552_0 then
				local var_552_2 = var_552_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_552_2 then
					arg_549_1.var_.alphaOldValue10030 = var_552_2.alpha
					arg_549_1.var_.characterEffect10030 = var_552_2
				end

				arg_549_1.var_.alphaOldValue10030 = 0
			end

			local var_552_3 = 0.5

			if var_552_1 <= arg_549_1.time_ and arg_549_1.time_ < var_552_1 + var_552_3 then
				local var_552_4 = (arg_549_1.time_ - var_552_1) / var_552_3
				local var_552_5 = Mathf.Lerp(arg_549_1.var_.alphaOldValue10030, 1, var_552_4)

				if arg_549_1.var_.characterEffect10030 then
					arg_549_1.var_.characterEffect10030.alpha = var_552_5
				end
			end

			if arg_549_1.time_ >= var_552_1 + var_552_3 and arg_549_1.time_ < var_552_1 + var_552_3 + arg_552_0 and arg_549_1.var_.characterEffect10030 then
				arg_549_1.var_.characterEffect10030.alpha = 1
			end

			local var_552_6 = arg_549_1.actors_["10030"]
			local var_552_7 = 0

			if var_552_7 < arg_549_1.time_ and arg_549_1.time_ <= var_552_7 + arg_552_0 and arg_549_1.var_.actorSpriteComps10030 == nil then
				arg_549_1.var_.actorSpriteComps10030 = var_552_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_552_8 = 0.2

			if var_552_7 <= arg_549_1.time_ and arg_549_1.time_ < var_552_7 + var_552_8 then
				local var_552_9 = (arg_549_1.time_ - var_552_7) / var_552_8

				if arg_549_1.var_.actorSpriteComps10030 then
					for iter_552_0, iter_552_1 in pairs(arg_549_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_552_1 then
							local var_552_10 = Mathf.Lerp(iter_552_1.color.r, 1, var_552_9)

							iter_552_1.color = Color.New(var_552_10, var_552_10, var_552_10)
						end
					end
				end
			end

			if arg_549_1.time_ >= var_552_7 + var_552_8 and arg_549_1.time_ < var_552_7 + var_552_8 + arg_552_0 and arg_549_1.var_.actorSpriteComps10030 then
				local var_552_11 = 1

				for iter_552_2, iter_552_3 in pairs(arg_549_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_552_3 then
						iter_552_3.color = Color.New(var_552_11, var_552_11, var_552_11)
					end
				end

				arg_549_1.var_.actorSpriteComps10030 = nil
			end

			local var_552_12 = arg_549_1.actors_["10030"].transform
			local var_552_13 = 0

			if var_552_13 < arg_549_1.time_ and arg_549_1.time_ <= var_552_13 + arg_552_0 then
				arg_549_1.var_.moveOldPos10030 = var_552_12.localPosition
				var_552_12.localScale = Vector3.New(1, 1, 1)

				arg_549_1:CheckSpriteTmpPos("10030", 3)

				local var_552_14 = var_552_12.childCount

				for iter_552_4 = 0, var_552_14 - 1 do
					local var_552_15 = var_552_12:GetChild(iter_552_4)

					if var_552_15.name == "split_2" or not string.find(var_552_15.name, "split") then
						var_552_15.gameObject:SetActive(true)
					else
						var_552_15.gameObject:SetActive(false)
					end
				end
			end

			local var_552_16 = 0.001

			if var_552_13 <= arg_549_1.time_ and arg_549_1.time_ < var_552_13 + var_552_16 then
				local var_552_17 = (arg_549_1.time_ - var_552_13) / var_552_16
				local var_552_18 = Vector3.New(0, -390, 150)

				var_552_12.localPosition = Vector3.Lerp(arg_549_1.var_.moveOldPos10030, var_552_18, var_552_17)
			end

			if arg_549_1.time_ >= var_552_13 + var_552_16 and arg_549_1.time_ < var_552_13 + var_552_16 + arg_552_0 then
				var_552_12.localPosition = Vector3.New(0, -390, 150)
			end

			local var_552_19 = 0
			local var_552_20 = 0.525

			if var_552_19 < arg_549_1.time_ and arg_549_1.time_ <= var_552_19 + arg_552_0 then
				arg_549_1.talkMaxDuration = 0
				arg_549_1.dialogCg_.alpha = 1

				arg_549_1.dialog_:SetActive(true)
				SetActive(arg_549_1.leftNameGo_, true)

				local var_552_21 = arg_549_1:FormatText(StoryNameCfg[309].name)

				arg_549_1.leftNameTxt_.text = var_552_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_549_1.leftNameTxt_.transform)

				arg_549_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_549_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_549_1:RecordName(arg_549_1.leftNameTxt_.text)
				SetActive(arg_549_1.iconTrs_.gameObject, false)
				arg_549_1.callingController_:SetSelectedState("normal")

				local var_552_22 = arg_549_1:GetWordFromCfg(115311135)
				local var_552_23 = arg_549_1:FormatText(var_552_22.content)

				arg_549_1.text_.text = var_552_23

				LuaForUtil.ClearLinePrefixSymbol(arg_549_1.text_)

				local var_552_24 = 21
				local var_552_25 = utf8.len(var_552_23)
				local var_552_26 = var_552_24 <= 0 and var_552_20 or var_552_20 * (var_552_25 / var_552_24)

				if var_552_26 > 0 and var_552_20 < var_552_26 then
					arg_549_1.talkMaxDuration = var_552_26

					if var_552_26 + var_552_19 > arg_549_1.duration_ then
						arg_549_1.duration_ = var_552_26 + var_552_19
					end
				end

				arg_549_1.text_.text = var_552_23
				arg_549_1.typewritter.percent = 0

				arg_549_1.typewritter:SetDirty()
				arg_549_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311135", "story_v_out_115311.awb") ~= 0 then
					local var_552_27 = manager.audio:GetVoiceLength("story_v_out_115311", "115311135", "story_v_out_115311.awb") / 1000

					if var_552_27 + var_552_19 > arg_549_1.duration_ then
						arg_549_1.duration_ = var_552_27 + var_552_19
					end

					if var_552_22.prefab_name ~= "" and arg_549_1.actors_[var_552_22.prefab_name] ~= nil then
						local var_552_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_549_1.actors_[var_552_22.prefab_name].transform, "story_v_out_115311", "115311135", "story_v_out_115311.awb")

						arg_549_1:RecordAudio("115311135", var_552_28)
						arg_549_1:RecordAudio("115311135", var_552_28)
					else
						arg_549_1:AudioAction("play", "voice", "story_v_out_115311", "115311135", "story_v_out_115311.awb")
					end

					arg_549_1:RecordHistoryTalkVoice("story_v_out_115311", "115311135", "story_v_out_115311.awb")
				end

				arg_549_1:RecordContent(arg_549_1.text_.text)
			end

			local var_552_29 = math.max(var_552_20, arg_549_1.talkMaxDuration)

			if var_552_19 <= arg_549_1.time_ and arg_549_1.time_ < var_552_19 + var_552_29 then
				arg_549_1.typewritter.percent = (arg_549_1.time_ - var_552_19) / var_552_29

				arg_549_1.typewritter:SetDirty()
			end

			if arg_549_1.time_ >= var_552_19 + var_552_29 and arg_549_1.time_ < var_552_19 + var_552_29 + arg_552_0 then
				arg_549_1.typewritter.percent = 1

				arg_549_1.typewritter:SetDirty()
				arg_549_1:ShowNextGo(true)
			end
		end
	end,
	Play115311136 = function(arg_553_0, arg_553_1)
		arg_553_1.time_ = 0
		arg_553_1.frameCnt_ = 0
		arg_553_1.state_ = "playing"
		arg_553_1.curTalkId_ = 115311136
		arg_553_1.duration_ = 5

		SetActive(arg_553_1.tipsGo_, false)

		function arg_553_1.onSingleLineFinish_()
			arg_553_1.onSingleLineUpdate_ = nil
			arg_553_1.onSingleLineFinish_ = nil
			arg_553_1.state_ = "waiting"
		end

		function arg_553_1.playNext_(arg_555_0)
			if arg_555_0 == 1 then
				arg_553_0:Play115311137(arg_553_1)
			end
		end

		function arg_553_1.onSingleLineUpdate_(arg_556_0)
			local var_556_0 = arg_553_1.actors_["10030"]
			local var_556_1 = 0

			if var_556_1 < arg_553_1.time_ and arg_553_1.time_ <= var_556_1 + arg_556_0 and arg_553_1.var_.actorSpriteComps10030 == nil then
				arg_553_1.var_.actorSpriteComps10030 = var_556_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_556_2 = 0.2

			if var_556_1 <= arg_553_1.time_ and arg_553_1.time_ < var_556_1 + var_556_2 then
				local var_556_3 = (arg_553_1.time_ - var_556_1) / var_556_2

				if arg_553_1.var_.actorSpriteComps10030 then
					for iter_556_0, iter_556_1 in pairs(arg_553_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_556_1 then
							local var_556_4 = Mathf.Lerp(iter_556_1.color.r, 0.5, var_556_3)

							iter_556_1.color = Color.New(var_556_4, var_556_4, var_556_4)
						end
					end
				end
			end

			if arg_553_1.time_ >= var_556_1 + var_556_2 and arg_553_1.time_ < var_556_1 + var_556_2 + arg_556_0 and arg_553_1.var_.actorSpriteComps10030 then
				local var_556_5 = 0.5

				for iter_556_2, iter_556_3 in pairs(arg_553_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_556_3 then
						iter_556_3.color = Color.New(var_556_5, var_556_5, var_556_5)
					end
				end

				arg_553_1.var_.actorSpriteComps10030 = nil
			end

			local var_556_6 = 0
			local var_556_7 = 0.85

			if var_556_6 < arg_553_1.time_ and arg_553_1.time_ <= var_556_6 + arg_556_0 then
				arg_553_1.talkMaxDuration = 0
				arg_553_1.dialogCg_.alpha = 1

				arg_553_1.dialog_:SetActive(true)
				SetActive(arg_553_1.leftNameGo_, false)

				arg_553_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_553_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_553_1:RecordName(arg_553_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_553_1.iconTrs_.gameObject, false)
				arg_553_1.callingController_:SetSelectedState("normal")

				local var_556_8 = arg_553_1:GetWordFromCfg(115311136)
				local var_556_9 = arg_553_1:FormatText(var_556_8.content)

				arg_553_1.text_.text = var_556_9

				LuaForUtil.ClearLinePrefixSymbol(arg_553_1.text_)

				local var_556_10 = 34
				local var_556_11 = utf8.len(var_556_9)
				local var_556_12 = var_556_10 <= 0 and var_556_7 or var_556_7 * (var_556_11 / var_556_10)

				if var_556_12 > 0 and var_556_7 < var_556_12 then
					arg_553_1.talkMaxDuration = var_556_12

					if var_556_12 + var_556_6 > arg_553_1.duration_ then
						arg_553_1.duration_ = var_556_12 + var_556_6
					end
				end

				arg_553_1.text_.text = var_556_9
				arg_553_1.typewritter.percent = 0

				arg_553_1.typewritter:SetDirty()
				arg_553_1:ShowNextGo(false)
				arg_553_1:RecordContent(arg_553_1.text_.text)
			end

			local var_556_13 = math.max(var_556_7, arg_553_1.talkMaxDuration)

			if var_556_6 <= arg_553_1.time_ and arg_553_1.time_ < var_556_6 + var_556_13 then
				arg_553_1.typewritter.percent = (arg_553_1.time_ - var_556_6) / var_556_13

				arg_553_1.typewritter:SetDirty()
			end

			if arg_553_1.time_ >= var_556_6 + var_556_13 and arg_553_1.time_ < var_556_6 + var_556_13 + arg_556_0 then
				arg_553_1.typewritter.percent = 1

				arg_553_1.typewritter:SetDirty()
				arg_553_1:ShowNextGo(true)
			end
		end
	end,
	Play115311137 = function(arg_557_0, arg_557_1)
		arg_557_1.time_ = 0
		arg_557_1.frameCnt_ = 0
		arg_557_1.state_ = "playing"
		arg_557_1.curTalkId_ = 115311137
		arg_557_1.duration_ = 9.566

		local var_557_0 = {
			ja = 7,
			ko = 8.066,
			zh = 9.566,
			en = 9.533
		}
		local var_557_1 = manager.audio:GetLocalizationFlag()

		if var_557_0[var_557_1] ~= nil then
			arg_557_1.duration_ = var_557_0[var_557_1]
		end

		SetActive(arg_557_1.tipsGo_, false)

		function arg_557_1.onSingleLineFinish_()
			arg_557_1.onSingleLineUpdate_ = nil
			arg_557_1.onSingleLineFinish_ = nil
			arg_557_1.state_ = "waiting"
		end

		function arg_557_1.playNext_(arg_559_0)
			if arg_559_0 == 1 then
				arg_557_0:Play115311138(arg_557_1)
			end
		end

		function arg_557_1.onSingleLineUpdate_(arg_560_0)
			local var_560_0 = arg_557_1.actors_["10030"]
			local var_560_1 = 0

			if var_560_1 < arg_557_1.time_ and arg_557_1.time_ <= var_560_1 + arg_560_0 and arg_557_1.var_.actorSpriteComps10030 == nil then
				arg_557_1.var_.actorSpriteComps10030 = var_560_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_560_2 = 0.2

			if var_560_1 <= arg_557_1.time_ and arg_557_1.time_ < var_560_1 + var_560_2 then
				local var_560_3 = (arg_557_1.time_ - var_560_1) / var_560_2

				if arg_557_1.var_.actorSpriteComps10030 then
					for iter_560_0, iter_560_1 in pairs(arg_557_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_560_1 then
							local var_560_4 = Mathf.Lerp(iter_560_1.color.r, 1, var_560_3)

							iter_560_1.color = Color.New(var_560_4, var_560_4, var_560_4)
						end
					end
				end
			end

			if arg_557_1.time_ >= var_560_1 + var_560_2 and arg_557_1.time_ < var_560_1 + var_560_2 + arg_560_0 and arg_557_1.var_.actorSpriteComps10030 then
				local var_560_5 = 1

				for iter_560_2, iter_560_3 in pairs(arg_557_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_560_3 then
						iter_560_3.color = Color.New(var_560_5, var_560_5, var_560_5)
					end
				end

				arg_557_1.var_.actorSpriteComps10030 = nil
			end

			local var_560_6 = 0
			local var_560_7 = 1.05

			if var_560_6 < arg_557_1.time_ and arg_557_1.time_ <= var_560_6 + arg_560_0 then
				arg_557_1.talkMaxDuration = 0
				arg_557_1.dialogCg_.alpha = 1

				arg_557_1.dialog_:SetActive(true)
				SetActive(arg_557_1.leftNameGo_, true)

				local var_560_8 = arg_557_1:FormatText(StoryNameCfg[309].name)

				arg_557_1.leftNameTxt_.text = var_560_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_557_1.leftNameTxt_.transform)

				arg_557_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_557_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_557_1:RecordName(arg_557_1.leftNameTxt_.text)
				SetActive(arg_557_1.iconTrs_.gameObject, false)
				arg_557_1.callingController_:SetSelectedState("normal")

				local var_560_9 = arg_557_1:GetWordFromCfg(115311137)
				local var_560_10 = arg_557_1:FormatText(var_560_9.content)

				arg_557_1.text_.text = var_560_10

				LuaForUtil.ClearLinePrefixSymbol(arg_557_1.text_)

				local var_560_11 = 42
				local var_560_12 = utf8.len(var_560_10)
				local var_560_13 = var_560_11 <= 0 and var_560_7 or var_560_7 * (var_560_12 / var_560_11)

				if var_560_13 > 0 and var_560_7 < var_560_13 then
					arg_557_1.talkMaxDuration = var_560_13

					if var_560_13 + var_560_6 > arg_557_1.duration_ then
						arg_557_1.duration_ = var_560_13 + var_560_6
					end
				end

				arg_557_1.text_.text = var_560_10
				arg_557_1.typewritter.percent = 0

				arg_557_1.typewritter:SetDirty()
				arg_557_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311137", "story_v_out_115311.awb") ~= 0 then
					local var_560_14 = manager.audio:GetVoiceLength("story_v_out_115311", "115311137", "story_v_out_115311.awb") / 1000

					if var_560_14 + var_560_6 > arg_557_1.duration_ then
						arg_557_1.duration_ = var_560_14 + var_560_6
					end

					if var_560_9.prefab_name ~= "" and arg_557_1.actors_[var_560_9.prefab_name] ~= nil then
						local var_560_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_557_1.actors_[var_560_9.prefab_name].transform, "story_v_out_115311", "115311137", "story_v_out_115311.awb")

						arg_557_1:RecordAudio("115311137", var_560_15)
						arg_557_1:RecordAudio("115311137", var_560_15)
					else
						arg_557_1:AudioAction("play", "voice", "story_v_out_115311", "115311137", "story_v_out_115311.awb")
					end

					arg_557_1:RecordHistoryTalkVoice("story_v_out_115311", "115311137", "story_v_out_115311.awb")
				end

				arg_557_1:RecordContent(arg_557_1.text_.text)
			end

			local var_560_16 = math.max(var_560_7, arg_557_1.talkMaxDuration)

			if var_560_6 <= arg_557_1.time_ and arg_557_1.time_ < var_560_6 + var_560_16 then
				arg_557_1.typewritter.percent = (arg_557_1.time_ - var_560_6) / var_560_16

				arg_557_1.typewritter:SetDirty()
			end

			if arg_557_1.time_ >= var_560_6 + var_560_16 and arg_557_1.time_ < var_560_6 + var_560_16 + arg_560_0 then
				arg_557_1.typewritter.percent = 1

				arg_557_1.typewritter:SetDirty()
				arg_557_1:ShowNextGo(true)
			end
		end
	end,
	Play115311138 = function(arg_561_0, arg_561_1)
		arg_561_1.time_ = 0
		arg_561_1.frameCnt_ = 0
		arg_561_1.state_ = "playing"
		arg_561_1.curTalkId_ = 115311138
		arg_561_1.duration_ = 7.1

		local var_561_0 = {
			ja = 4.5,
			ko = 3.9,
			zh = 4.2,
			en = 7.1
		}
		local var_561_1 = manager.audio:GetLocalizationFlag()

		if var_561_0[var_561_1] ~= nil then
			arg_561_1.duration_ = var_561_0[var_561_1]
		end

		SetActive(arg_561_1.tipsGo_, false)

		function arg_561_1.onSingleLineFinish_()
			arg_561_1.onSingleLineUpdate_ = nil
			arg_561_1.onSingleLineFinish_ = nil
			arg_561_1.state_ = "waiting"
		end

		function arg_561_1.playNext_(arg_563_0)
			if arg_563_0 == 1 then
				arg_561_0:Play115311139(arg_561_1)
			end
		end

		function arg_561_1.onSingleLineUpdate_(arg_564_0)
			local var_564_0 = 0
			local var_564_1 = 0.525

			if var_564_0 < arg_561_1.time_ and arg_561_1.time_ <= var_564_0 + arg_564_0 then
				arg_561_1.talkMaxDuration = 0
				arg_561_1.dialogCg_.alpha = 1

				arg_561_1.dialog_:SetActive(true)
				SetActive(arg_561_1.leftNameGo_, true)

				local var_564_2 = arg_561_1:FormatText(StoryNameCfg[309].name)

				arg_561_1.leftNameTxt_.text = var_564_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_561_1.leftNameTxt_.transform)

				arg_561_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_561_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_561_1:RecordName(arg_561_1.leftNameTxt_.text)
				SetActive(arg_561_1.iconTrs_.gameObject, false)
				arg_561_1.callingController_:SetSelectedState("normal")

				local var_564_3 = arg_561_1:GetWordFromCfg(115311138)
				local var_564_4 = arg_561_1:FormatText(var_564_3.content)

				arg_561_1.text_.text = var_564_4

				LuaForUtil.ClearLinePrefixSymbol(arg_561_1.text_)

				local var_564_5 = 21
				local var_564_6 = utf8.len(var_564_4)
				local var_564_7 = var_564_5 <= 0 and var_564_1 or var_564_1 * (var_564_6 / var_564_5)

				if var_564_7 > 0 and var_564_1 < var_564_7 then
					arg_561_1.talkMaxDuration = var_564_7

					if var_564_7 + var_564_0 > arg_561_1.duration_ then
						arg_561_1.duration_ = var_564_7 + var_564_0
					end
				end

				arg_561_1.text_.text = var_564_4
				arg_561_1.typewritter.percent = 0

				arg_561_1.typewritter:SetDirty()
				arg_561_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311138", "story_v_out_115311.awb") ~= 0 then
					local var_564_8 = manager.audio:GetVoiceLength("story_v_out_115311", "115311138", "story_v_out_115311.awb") / 1000

					if var_564_8 + var_564_0 > arg_561_1.duration_ then
						arg_561_1.duration_ = var_564_8 + var_564_0
					end

					if var_564_3.prefab_name ~= "" and arg_561_1.actors_[var_564_3.prefab_name] ~= nil then
						local var_564_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_561_1.actors_[var_564_3.prefab_name].transform, "story_v_out_115311", "115311138", "story_v_out_115311.awb")

						arg_561_1:RecordAudio("115311138", var_564_9)
						arg_561_1:RecordAudio("115311138", var_564_9)
					else
						arg_561_1:AudioAction("play", "voice", "story_v_out_115311", "115311138", "story_v_out_115311.awb")
					end

					arg_561_1:RecordHistoryTalkVoice("story_v_out_115311", "115311138", "story_v_out_115311.awb")
				end

				arg_561_1:RecordContent(arg_561_1.text_.text)
			end

			local var_564_10 = math.max(var_564_1, arg_561_1.talkMaxDuration)

			if var_564_0 <= arg_561_1.time_ and arg_561_1.time_ < var_564_0 + var_564_10 then
				arg_561_1.typewritter.percent = (arg_561_1.time_ - var_564_0) / var_564_10

				arg_561_1.typewritter:SetDirty()
			end

			if arg_561_1.time_ >= var_564_0 + var_564_10 and arg_561_1.time_ < var_564_0 + var_564_10 + arg_564_0 then
				arg_561_1.typewritter.percent = 1

				arg_561_1.typewritter:SetDirty()
				arg_561_1:ShowNextGo(true)
			end
		end
	end,
	Play115311139 = function(arg_565_0, arg_565_1)
		arg_565_1.time_ = 0
		arg_565_1.frameCnt_ = 0
		arg_565_1.state_ = "playing"
		arg_565_1.curTalkId_ = 115311139
		arg_565_1.duration_ = 5

		SetActive(arg_565_1.tipsGo_, false)

		function arg_565_1.onSingleLineFinish_()
			arg_565_1.onSingleLineUpdate_ = nil
			arg_565_1.onSingleLineFinish_ = nil
			arg_565_1.state_ = "waiting"
		end

		function arg_565_1.playNext_(arg_567_0)
			if arg_567_0 == 1 then
				arg_565_0:Play115311140(arg_565_1)
			end
		end

		function arg_565_1.onSingleLineUpdate_(arg_568_0)
			local var_568_0 = arg_565_1.actors_["10030"]
			local var_568_1 = 0

			if var_568_1 < arg_565_1.time_ and arg_565_1.time_ <= var_568_1 + arg_568_0 then
				local var_568_2 = var_568_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_568_2 then
					arg_565_1.var_.alphaOldValue10030 = var_568_2.alpha
					arg_565_1.var_.characterEffect10030 = var_568_2
				end

				arg_565_1.var_.alphaOldValue10030 = 1
			end

			local var_568_3 = 0.5

			if var_568_1 <= arg_565_1.time_ and arg_565_1.time_ < var_568_1 + var_568_3 then
				local var_568_4 = (arg_565_1.time_ - var_568_1) / var_568_3
				local var_568_5 = Mathf.Lerp(arg_565_1.var_.alphaOldValue10030, 0, var_568_4)

				if arg_565_1.var_.characterEffect10030 then
					arg_565_1.var_.characterEffect10030.alpha = var_568_5
				end
			end

			if arg_565_1.time_ >= var_568_1 + var_568_3 and arg_565_1.time_ < var_568_1 + var_568_3 + arg_568_0 and arg_565_1.var_.characterEffect10030 then
				arg_565_1.var_.characterEffect10030.alpha = 0
			end

			local var_568_6 = 0
			local var_568_7 = 1.45

			if var_568_6 < arg_565_1.time_ and arg_565_1.time_ <= var_568_6 + arg_568_0 then
				arg_565_1.talkMaxDuration = 0
				arg_565_1.dialogCg_.alpha = 1

				arg_565_1.dialog_:SetActive(true)
				SetActive(arg_565_1.leftNameGo_, false)

				arg_565_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_565_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_565_1:RecordName(arg_565_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_565_1.iconTrs_.gameObject, false)
				arg_565_1.callingController_:SetSelectedState("normal")

				local var_568_8 = arg_565_1:GetWordFromCfg(115311139)
				local var_568_9 = arg_565_1:FormatText(var_568_8.content)

				arg_565_1.text_.text = var_568_9

				LuaForUtil.ClearLinePrefixSymbol(arg_565_1.text_)

				local var_568_10 = 58
				local var_568_11 = utf8.len(var_568_9)
				local var_568_12 = var_568_10 <= 0 and var_568_7 or var_568_7 * (var_568_11 / var_568_10)

				if var_568_12 > 0 and var_568_7 < var_568_12 then
					arg_565_1.talkMaxDuration = var_568_12

					if var_568_12 + var_568_6 > arg_565_1.duration_ then
						arg_565_1.duration_ = var_568_12 + var_568_6
					end
				end

				arg_565_1.text_.text = var_568_9
				arg_565_1.typewritter.percent = 0

				arg_565_1.typewritter:SetDirty()
				arg_565_1:ShowNextGo(false)
				arg_565_1:RecordContent(arg_565_1.text_.text)
			end

			local var_568_13 = math.max(var_568_7, arg_565_1.talkMaxDuration)

			if var_568_6 <= arg_565_1.time_ and arg_565_1.time_ < var_568_6 + var_568_13 then
				arg_565_1.typewritter.percent = (arg_565_1.time_ - var_568_6) / var_568_13

				arg_565_1.typewritter:SetDirty()
			end

			if arg_565_1.time_ >= var_568_6 + var_568_13 and arg_565_1.time_ < var_568_6 + var_568_13 + arg_568_0 then
				arg_565_1.typewritter.percent = 1

				arg_565_1.typewritter:SetDirty()
				arg_565_1:ShowNextGo(true)
			end
		end
	end,
	Play115311140 = function(arg_569_0, arg_569_1)
		arg_569_1.time_ = 0
		arg_569_1.frameCnt_ = 0
		arg_569_1.state_ = "playing"
		arg_569_1.curTalkId_ = 115311140
		arg_569_1.duration_ = 5

		SetActive(arg_569_1.tipsGo_, false)

		function arg_569_1.onSingleLineFinish_()
			arg_569_1.onSingleLineUpdate_ = nil
			arg_569_1.onSingleLineFinish_ = nil
			arg_569_1.state_ = "waiting"
		end

		function arg_569_1.playNext_(arg_571_0)
			if arg_571_0 == 1 then
				arg_569_0:Play115311141(arg_569_1)
			end
		end

		function arg_569_1.onSingleLineUpdate_(arg_572_0)
			local var_572_0 = 0
			local var_572_1 = 0.3

			if var_572_0 < arg_569_1.time_ and arg_569_1.time_ <= var_572_0 + arg_572_0 then
				arg_569_1.talkMaxDuration = 0
				arg_569_1.dialogCg_.alpha = 1

				arg_569_1.dialog_:SetActive(true)
				SetActive(arg_569_1.leftNameGo_, false)

				arg_569_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_569_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_569_1:RecordName(arg_569_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_569_1.iconTrs_.gameObject, false)
				arg_569_1.callingController_:SetSelectedState("normal")

				local var_572_2 = arg_569_1:GetWordFromCfg(115311140)
				local var_572_3 = arg_569_1:FormatText(var_572_2.content)

				arg_569_1.text_.text = var_572_3

				LuaForUtil.ClearLinePrefixSymbol(arg_569_1.text_)

				local var_572_4 = 12
				local var_572_5 = utf8.len(var_572_3)
				local var_572_6 = var_572_4 <= 0 and var_572_1 or var_572_1 * (var_572_5 / var_572_4)

				if var_572_6 > 0 and var_572_1 < var_572_6 then
					arg_569_1.talkMaxDuration = var_572_6

					if var_572_6 + var_572_0 > arg_569_1.duration_ then
						arg_569_1.duration_ = var_572_6 + var_572_0
					end
				end

				arg_569_1.text_.text = var_572_3
				arg_569_1.typewritter.percent = 0

				arg_569_1.typewritter:SetDirty()
				arg_569_1:ShowNextGo(false)
				arg_569_1:RecordContent(arg_569_1.text_.text)
			end

			local var_572_7 = math.max(var_572_1, arg_569_1.talkMaxDuration)

			if var_572_0 <= arg_569_1.time_ and arg_569_1.time_ < var_572_0 + var_572_7 then
				arg_569_1.typewritter.percent = (arg_569_1.time_ - var_572_0) / var_572_7

				arg_569_1.typewritter:SetDirty()
			end

			if arg_569_1.time_ >= var_572_0 + var_572_7 and arg_569_1.time_ < var_572_0 + var_572_7 + arg_572_0 then
				arg_569_1.typewritter.percent = 1

				arg_569_1.typewritter:SetDirty()
				arg_569_1:ShowNextGo(true)
			end
		end
	end,
	Play115311141 = function(arg_573_0, arg_573_1)
		arg_573_1.time_ = 0
		arg_573_1.frameCnt_ = 0
		arg_573_1.state_ = "playing"
		arg_573_1.curTalkId_ = 115311141
		arg_573_1.duration_ = 5.833

		local var_573_0 = {
			ja = 5.833,
			ko = 5.3,
			zh = 5.666,
			en = 5.233
		}
		local var_573_1 = manager.audio:GetLocalizationFlag()

		if var_573_0[var_573_1] ~= nil then
			arg_573_1.duration_ = var_573_0[var_573_1]
		end

		SetActive(arg_573_1.tipsGo_, false)

		function arg_573_1.onSingleLineFinish_()
			arg_573_1.onSingleLineUpdate_ = nil
			arg_573_1.onSingleLineFinish_ = nil
			arg_573_1.state_ = "waiting"
		end

		function arg_573_1.playNext_(arg_575_0)
			if arg_575_0 == 1 then
				arg_573_0:Play115311142(arg_573_1)
			end
		end

		function arg_573_1.onSingleLineUpdate_(arg_576_0)
			local var_576_0 = manager.ui.mainCamera.transform
			local var_576_1 = 0

			if var_576_1 < arg_573_1.time_ and arg_573_1.time_ <= var_576_1 + arg_576_0 then
				arg_573_1.var_.shakeOldPos = var_576_0.localPosition
			end

			local var_576_2 = 0.6

			if var_576_1 <= arg_573_1.time_ and arg_573_1.time_ < var_576_1 + var_576_2 then
				local var_576_3 = (arg_573_1.time_ - var_576_1) / 0.066
				local var_576_4, var_576_5 = math.modf(var_576_3)

				var_576_0.localPosition = Vector3.New(var_576_5 * 0.13, var_576_5 * 0.13, var_576_5 * 0.13) + arg_573_1.var_.shakeOldPos
			end

			if arg_573_1.time_ >= var_576_1 + var_576_2 and arg_573_1.time_ < var_576_1 + var_576_2 + arg_576_0 then
				var_576_0.localPosition = arg_573_1.var_.shakeOldPos
			end

			local var_576_6 = arg_573_1.actors_["10030"]
			local var_576_7 = 0.8

			if var_576_7 < arg_573_1.time_ and arg_573_1.time_ <= var_576_7 + arg_576_0 then
				local var_576_8 = var_576_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_576_8 then
					arg_573_1.var_.alphaOldValue10030 = var_576_8.alpha
					arg_573_1.var_.characterEffect10030 = var_576_8
				end

				arg_573_1.var_.alphaOldValue10030 = 0
			end

			local var_576_9 = 0.5

			if var_576_7 <= arg_573_1.time_ and arg_573_1.time_ < var_576_7 + var_576_9 then
				local var_576_10 = (arg_573_1.time_ - var_576_7) / var_576_9
				local var_576_11 = Mathf.Lerp(arg_573_1.var_.alphaOldValue10030, 1, var_576_10)

				if arg_573_1.var_.characterEffect10030 then
					arg_573_1.var_.characterEffect10030.alpha = var_576_11
				end
			end

			if arg_573_1.time_ >= var_576_7 + var_576_9 and arg_573_1.time_ < var_576_7 + var_576_9 + arg_576_0 and arg_573_1.var_.characterEffect10030 then
				arg_573_1.var_.characterEffect10030.alpha = 1
			end

			local var_576_12 = arg_573_1.actors_["10030"]
			local var_576_13 = 0.8

			if var_576_13 < arg_573_1.time_ and arg_573_1.time_ <= var_576_13 + arg_576_0 and arg_573_1.var_.actorSpriteComps10030 == nil then
				arg_573_1.var_.actorSpriteComps10030 = var_576_12:GetComponentsInChildren(typeof(Image), true)
			end

			local var_576_14 = 0.2

			if var_576_13 <= arg_573_1.time_ and arg_573_1.time_ < var_576_13 + var_576_14 then
				local var_576_15 = (arg_573_1.time_ - var_576_13) / var_576_14

				if arg_573_1.var_.actorSpriteComps10030 then
					for iter_576_0, iter_576_1 in pairs(arg_573_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_576_1 then
							local var_576_16 = Mathf.Lerp(iter_576_1.color.r, 1, var_576_15)

							iter_576_1.color = Color.New(var_576_16, var_576_16, var_576_16)
						end
					end
				end
			end

			if arg_573_1.time_ >= var_576_13 + var_576_14 and arg_573_1.time_ < var_576_13 + var_576_14 + arg_576_0 and arg_573_1.var_.actorSpriteComps10030 then
				local var_576_17 = 1

				for iter_576_2, iter_576_3 in pairs(arg_573_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_576_3 then
						iter_576_3.color = Color.New(var_576_17, var_576_17, var_576_17)
					end
				end

				arg_573_1.var_.actorSpriteComps10030 = nil
			end

			local var_576_18 = arg_573_1.actors_["10030"].transform
			local var_576_19 = 0.8

			if var_576_19 < arg_573_1.time_ and arg_573_1.time_ <= var_576_19 + arg_576_0 then
				arg_573_1.var_.moveOldPos10030 = var_576_18.localPosition
				var_576_18.localScale = Vector3.New(1, 1, 1)

				arg_573_1:CheckSpriteTmpPos("10030", 3)

				local var_576_20 = var_576_18.childCount

				for iter_576_4 = 0, var_576_20 - 1 do
					local var_576_21 = var_576_18:GetChild(iter_576_4)

					if var_576_21.name == "split_1" or not string.find(var_576_21.name, "split") then
						var_576_21.gameObject:SetActive(true)
					else
						var_576_21.gameObject:SetActive(false)
					end
				end
			end

			local var_576_22 = 0.001

			if var_576_19 <= arg_573_1.time_ and arg_573_1.time_ < var_576_19 + var_576_22 then
				local var_576_23 = (arg_573_1.time_ - var_576_19) / var_576_22
				local var_576_24 = Vector3.New(0, -390, 150)

				var_576_18.localPosition = Vector3.Lerp(arg_573_1.var_.moveOldPos10030, var_576_24, var_576_23)
			end

			if arg_573_1.time_ >= var_576_19 + var_576_22 and arg_573_1.time_ < var_576_19 + var_576_22 + arg_576_0 then
				var_576_18.localPosition = Vector3.New(0, -390, 150)
			end

			local var_576_25 = 0

			if var_576_25 < arg_573_1.time_ and arg_573_1.time_ <= var_576_25 + arg_576_0 then
				arg_573_1.allBtn_.enabled = false
			end

			local var_576_26 = 0.8

			if arg_573_1.time_ >= var_576_25 + var_576_26 and arg_573_1.time_ < var_576_25 + var_576_26 + arg_576_0 then
				arg_573_1.allBtn_.enabled = true
			end

			if arg_573_1.frameCnt_ <= 1 then
				arg_573_1.dialog_:SetActive(false)
			end

			local var_576_27 = 0.8
			local var_576_28 = 0.325

			if var_576_27 < arg_573_1.time_ and arg_573_1.time_ <= var_576_27 + arg_576_0 then
				arg_573_1.talkMaxDuration = 0

				arg_573_1.dialog_:SetActive(true)

				local var_576_29 = LeanTween.value(arg_573_1.dialog_, 0, 1, 0.3)

				var_576_29:setOnUpdate(LuaHelper.FloatAction(function(arg_577_0)
					arg_573_1.dialogCg_.alpha = arg_577_0
				end))
				var_576_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_573_1.dialog_)
					var_576_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_573_1.duration_ = arg_573_1.duration_ + 0.3

				SetActive(arg_573_1.leftNameGo_, true)

				local var_576_30 = arg_573_1:FormatText(StoryNameCfg[309].name)

				arg_573_1.leftNameTxt_.text = var_576_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_573_1.leftNameTxt_.transform)

				arg_573_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_573_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_573_1:RecordName(arg_573_1.leftNameTxt_.text)
				SetActive(arg_573_1.iconTrs_.gameObject, false)
				arg_573_1.callingController_:SetSelectedState("normal")

				local var_576_31 = arg_573_1:GetWordFromCfg(115311141)
				local var_576_32 = arg_573_1:FormatText(var_576_31.content)

				arg_573_1.text_.text = var_576_32

				LuaForUtil.ClearLinePrefixSymbol(arg_573_1.text_)

				local var_576_33 = 13
				local var_576_34 = utf8.len(var_576_32)
				local var_576_35 = var_576_33 <= 0 and var_576_28 or var_576_28 * (var_576_34 / var_576_33)

				if var_576_35 > 0 and var_576_28 < var_576_35 then
					arg_573_1.talkMaxDuration = var_576_35
					var_576_27 = var_576_27 + 0.3

					if var_576_35 + var_576_27 > arg_573_1.duration_ then
						arg_573_1.duration_ = var_576_35 + var_576_27
					end
				end

				arg_573_1.text_.text = var_576_32
				arg_573_1.typewritter.percent = 0

				arg_573_1.typewritter:SetDirty()
				arg_573_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311141", "story_v_out_115311.awb") ~= 0 then
					local var_576_36 = manager.audio:GetVoiceLength("story_v_out_115311", "115311141", "story_v_out_115311.awb") / 1000

					if var_576_36 + var_576_27 > arg_573_1.duration_ then
						arg_573_1.duration_ = var_576_36 + var_576_27
					end

					if var_576_31.prefab_name ~= "" and arg_573_1.actors_[var_576_31.prefab_name] ~= nil then
						local var_576_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_573_1.actors_[var_576_31.prefab_name].transform, "story_v_out_115311", "115311141", "story_v_out_115311.awb")

						arg_573_1:RecordAudio("115311141", var_576_37)
						arg_573_1:RecordAudio("115311141", var_576_37)
					else
						arg_573_1:AudioAction("play", "voice", "story_v_out_115311", "115311141", "story_v_out_115311.awb")
					end

					arg_573_1:RecordHistoryTalkVoice("story_v_out_115311", "115311141", "story_v_out_115311.awb")
				end

				arg_573_1:RecordContent(arg_573_1.text_.text)
			end

			local var_576_38 = var_576_27 + 0.3
			local var_576_39 = math.max(var_576_28, arg_573_1.talkMaxDuration)

			if var_576_38 <= arg_573_1.time_ and arg_573_1.time_ < var_576_38 + var_576_39 then
				arg_573_1.typewritter.percent = (arg_573_1.time_ - var_576_38) / var_576_39

				arg_573_1.typewritter:SetDirty()
			end

			if arg_573_1.time_ >= var_576_38 + var_576_39 and arg_573_1.time_ < var_576_38 + var_576_39 + arg_576_0 then
				arg_573_1.typewritter.percent = 1

				arg_573_1.typewritter:SetDirty()
				arg_573_1:ShowNextGo(true)
			end
		end
	end,
	Play115311142 = function(arg_579_0, arg_579_1)
		arg_579_1.time_ = 0
		arg_579_1.frameCnt_ = 0
		arg_579_1.state_ = "playing"
		arg_579_1.curTalkId_ = 115311142
		arg_579_1.duration_ = 5

		SetActive(arg_579_1.tipsGo_, false)

		function arg_579_1.onSingleLineFinish_()
			arg_579_1.onSingleLineUpdate_ = nil
			arg_579_1.onSingleLineFinish_ = nil
			arg_579_1.state_ = "waiting"
		end

		function arg_579_1.playNext_(arg_581_0)
			if arg_581_0 == 1 then
				arg_579_0:Play115311143(arg_579_1)
			end
		end

		function arg_579_1.onSingleLineUpdate_(arg_582_0)
			local var_582_0 = arg_579_1.actors_["10030"]
			local var_582_1 = 0

			if var_582_1 < arg_579_1.time_ and arg_579_1.time_ <= var_582_1 + arg_582_0 then
				local var_582_2 = var_582_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_582_2 then
					arg_579_1.var_.alphaOldValue10030 = var_582_2.alpha
					arg_579_1.var_.characterEffect10030 = var_582_2
				end

				arg_579_1.var_.alphaOldValue10030 = 1
			end

			local var_582_3 = 0.5

			if var_582_1 <= arg_579_1.time_ and arg_579_1.time_ < var_582_1 + var_582_3 then
				local var_582_4 = (arg_579_1.time_ - var_582_1) / var_582_3
				local var_582_5 = Mathf.Lerp(arg_579_1.var_.alphaOldValue10030, 0, var_582_4)

				if arg_579_1.var_.characterEffect10030 then
					arg_579_1.var_.characterEffect10030.alpha = var_582_5
				end
			end

			if arg_579_1.time_ >= var_582_1 + var_582_3 and arg_579_1.time_ < var_582_1 + var_582_3 + arg_582_0 and arg_579_1.var_.characterEffect10030 then
				arg_579_1.var_.characterEffect10030.alpha = 0
			end

			local var_582_6 = 0
			local var_582_7 = 1.025

			if var_582_6 < arg_579_1.time_ and arg_579_1.time_ <= var_582_6 + arg_582_0 then
				arg_579_1.talkMaxDuration = 0
				arg_579_1.dialogCg_.alpha = 1

				arg_579_1.dialog_:SetActive(true)
				SetActive(arg_579_1.leftNameGo_, false)

				arg_579_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_579_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_579_1:RecordName(arg_579_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_579_1.iconTrs_.gameObject, false)
				arg_579_1.callingController_:SetSelectedState("normal")

				local var_582_8 = arg_579_1:GetWordFromCfg(115311142)
				local var_582_9 = arg_579_1:FormatText(var_582_8.content)

				arg_579_1.text_.text = var_582_9

				LuaForUtil.ClearLinePrefixSymbol(arg_579_1.text_)

				local var_582_10 = 41
				local var_582_11 = utf8.len(var_582_9)
				local var_582_12 = var_582_10 <= 0 and var_582_7 or var_582_7 * (var_582_11 / var_582_10)

				if var_582_12 > 0 and var_582_7 < var_582_12 then
					arg_579_1.talkMaxDuration = var_582_12

					if var_582_12 + var_582_6 > arg_579_1.duration_ then
						arg_579_1.duration_ = var_582_12 + var_582_6
					end
				end

				arg_579_1.text_.text = var_582_9
				arg_579_1.typewritter.percent = 0

				arg_579_1.typewritter:SetDirty()
				arg_579_1:ShowNextGo(false)
				arg_579_1:RecordContent(arg_579_1.text_.text)
			end

			local var_582_13 = math.max(var_582_7, arg_579_1.talkMaxDuration)

			if var_582_6 <= arg_579_1.time_ and arg_579_1.time_ < var_582_6 + var_582_13 then
				arg_579_1.typewritter.percent = (arg_579_1.time_ - var_582_6) / var_582_13

				arg_579_1.typewritter:SetDirty()
			end

			if arg_579_1.time_ >= var_582_6 + var_582_13 and arg_579_1.time_ < var_582_6 + var_582_13 + arg_582_0 then
				arg_579_1.typewritter.percent = 1

				arg_579_1.typewritter:SetDirty()
				arg_579_1:ShowNextGo(true)
			end
		end
	end,
	Play115311143 = function(arg_583_0, arg_583_1)
		arg_583_1.time_ = 0
		arg_583_1.frameCnt_ = 0
		arg_583_1.state_ = "playing"
		arg_583_1.curTalkId_ = 115311143
		arg_583_1.duration_ = 4.333

		local var_583_0 = {
			ja = 4.333,
			ko = 3.1,
			zh = 2.633,
			en = 3.066
		}
		local var_583_1 = manager.audio:GetLocalizationFlag()

		if var_583_0[var_583_1] ~= nil then
			arg_583_1.duration_ = var_583_0[var_583_1]
		end

		SetActive(arg_583_1.tipsGo_, false)

		function arg_583_1.onSingleLineFinish_()
			arg_583_1.onSingleLineUpdate_ = nil
			arg_583_1.onSingleLineFinish_ = nil
			arg_583_1.state_ = "waiting"
		end

		function arg_583_1.playNext_(arg_585_0)
			if arg_585_0 == 1 then
				arg_583_0:Play115311144(arg_583_1)
			end
		end

		function arg_583_1.onSingleLineUpdate_(arg_586_0)
			local var_586_0 = "1041_1"

			if arg_583_1.actors_[var_586_0] == nil then
				local var_586_1 = Object.Instantiate(arg_583_1.imageGo_, arg_583_1.canvasGo_.transform)

				var_586_1.transform:SetSiblingIndex(1)

				var_586_1.name = var_586_0

				local var_586_2 = var_586_1:GetComponent(typeof(Image))

				var_586_2.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. var_586_0)

				var_586_2:SetNativeSize()

				var_586_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_583_1.actors_[var_586_0] = var_586_1
			end

			local var_586_3 = arg_583_1.actors_["1041_1"]
			local var_586_4 = 0

			if var_586_4 < arg_583_1.time_ and arg_583_1.time_ <= var_586_4 + arg_586_0 then
				local var_586_5 = var_586_3:GetComponent("Image")

				if var_586_5 then
					arg_583_1.var_.alphaMatValue1041_1 = var_586_5
					arg_583_1.var_.alphaOldValue1041_1 = var_586_5.color.a
				end

				arg_583_1.var_.alphaOldValue1041_1 = 0
			end

			local var_586_6 = 0.5

			if var_586_4 <= arg_583_1.time_ and arg_583_1.time_ < var_586_4 + var_586_6 then
				local var_586_7 = (arg_583_1.time_ - var_586_4) / var_586_6
				local var_586_8 = Mathf.Lerp(arg_583_1.var_.alphaOldValue1041_1, 1, var_586_7)

				if arg_583_1.var_.alphaMatValue1041_1 then
					local var_586_9 = arg_583_1.var_.alphaMatValue1041_1.color

					var_586_9.a = var_586_8
					arg_583_1.var_.alphaMatValue1041_1.color = var_586_9
				end
			end

			if arg_583_1.time_ >= var_586_4 + var_586_6 and arg_583_1.time_ < var_586_4 + var_586_6 + arg_586_0 and arg_583_1.var_.alphaMatValue1041_1 then
				local var_586_10 = arg_583_1.var_.alphaMatValue1041_1
				local var_586_11 = var_586_10.color

				var_586_11.a = 1
				var_586_10.color = var_586_11
			end

			local var_586_12 = arg_583_1.actors_["1041_1"]
			local var_586_13 = 0

			if var_586_13 < arg_583_1.time_ and arg_583_1.time_ <= var_586_13 + arg_586_0 then
				local var_586_14 = var_586_12:GetComponent("Image")

				if var_586_14 then
					arg_583_1.var_.highlightMatValue1041_1 = var_586_14
				end
			end

			local var_586_15 = 0.2

			if var_586_13 <= arg_583_1.time_ and arg_583_1.time_ < var_586_13 + var_586_15 then
				local var_586_16 = (arg_583_1.time_ - var_586_13) / var_586_15

				if arg_583_1.var_.highlightMatValue1041_1 then
					local var_586_17 = Mathf.Lerp(0.5, 1, var_586_16)
					local var_586_18 = arg_583_1.var_.highlightMatValue1041_1
					local var_586_19 = var_586_18.color

					var_586_19.r = var_586_17
					var_586_19.g = var_586_17
					var_586_19.b = var_586_17
					var_586_18.color = var_586_19
				end
			end

			if arg_583_1.time_ >= var_586_13 + var_586_15 and arg_583_1.time_ < var_586_13 + var_586_15 + arg_586_0 and arg_583_1.var_.highlightMatValue1041_1 then
				local var_586_20 = 1

				var_586_12.transform:SetSiblingIndex(1)

				local var_586_21 = arg_583_1.var_.highlightMatValue1041_1
				local var_586_22 = var_586_21.color

				var_586_22.r = var_586_20
				var_586_22.g = var_586_20
				var_586_22.b = var_586_20
				var_586_21.color = var_586_22
			end

			local var_586_23 = arg_583_1.actors_["1041_1"].transform
			local var_586_24 = 0

			if var_586_24 < arg_583_1.time_ and arg_583_1.time_ <= var_586_24 + arg_586_0 then
				arg_583_1.var_.moveOldPos1041_1 = var_586_23.localPosition
				var_586_23.localScale = Vector3.New(1, 1, 1)

				arg_583_1:CheckSpriteTmpPos("1041_1", 4)
			end

			local var_586_25 = 0.001

			if var_586_24 <= arg_583_1.time_ and arg_583_1.time_ < var_586_24 + var_586_25 then
				local var_586_26 = (arg_583_1.time_ - var_586_24) / var_586_25
				local var_586_27 = Vector3.New(440, -310, -370)

				var_586_23.localPosition = Vector3.Lerp(arg_583_1.var_.moveOldPos1041_1, var_586_27, var_586_26)
			end

			if arg_583_1.time_ >= var_586_24 + var_586_25 and arg_583_1.time_ < var_586_24 + var_586_25 + arg_586_0 then
				var_586_23.localPosition = Vector3.New(440, -310, -370)
			end

			local var_586_28 = 0
			local var_586_29 = 0.3

			if var_586_28 < arg_583_1.time_ and arg_583_1.time_ <= var_586_28 + arg_586_0 then
				arg_583_1.talkMaxDuration = 0
				arg_583_1.dialogCg_.alpha = 1

				arg_583_1.dialog_:SetActive(true)
				SetActive(arg_583_1.leftNameGo_, true)

				local var_586_30 = arg_583_1:FormatText(StoryNameCfg[208].name)

				arg_583_1.leftNameTxt_.text = var_586_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_583_1.leftNameTxt_.transform)

				arg_583_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_583_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_583_1:RecordName(arg_583_1.leftNameTxt_.text)
				SetActive(arg_583_1.iconTrs_.gameObject, false)
				arg_583_1.callingController_:SetSelectedState("normal")

				local var_586_31 = arg_583_1:GetWordFromCfg(115311143)
				local var_586_32 = arg_583_1:FormatText(var_586_31.content)

				arg_583_1.text_.text = var_586_32

				LuaForUtil.ClearLinePrefixSymbol(arg_583_1.text_)

				local var_586_33 = 12
				local var_586_34 = utf8.len(var_586_32)
				local var_586_35 = var_586_33 <= 0 and var_586_29 or var_586_29 * (var_586_34 / var_586_33)

				if var_586_35 > 0 and var_586_29 < var_586_35 then
					arg_583_1.talkMaxDuration = var_586_35

					if var_586_35 + var_586_28 > arg_583_1.duration_ then
						arg_583_1.duration_ = var_586_35 + var_586_28
					end
				end

				arg_583_1.text_.text = var_586_32
				arg_583_1.typewritter.percent = 0

				arg_583_1.typewritter:SetDirty()
				arg_583_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311143", "story_v_out_115311.awb") ~= 0 then
					local var_586_36 = manager.audio:GetVoiceLength("story_v_out_115311", "115311143", "story_v_out_115311.awb") / 1000

					if var_586_36 + var_586_28 > arg_583_1.duration_ then
						arg_583_1.duration_ = var_586_36 + var_586_28
					end

					if var_586_31.prefab_name ~= "" and arg_583_1.actors_[var_586_31.prefab_name] ~= nil then
						local var_586_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_583_1.actors_[var_586_31.prefab_name].transform, "story_v_out_115311", "115311143", "story_v_out_115311.awb")

						arg_583_1:RecordAudio("115311143", var_586_37)
						arg_583_1:RecordAudio("115311143", var_586_37)
					else
						arg_583_1:AudioAction("play", "voice", "story_v_out_115311", "115311143", "story_v_out_115311.awb")
					end

					arg_583_1:RecordHistoryTalkVoice("story_v_out_115311", "115311143", "story_v_out_115311.awb")
				end

				arg_583_1:RecordContent(arg_583_1.text_.text)
			end

			local var_586_38 = math.max(var_586_29, arg_583_1.talkMaxDuration)

			if var_586_28 <= arg_583_1.time_ and arg_583_1.time_ < var_586_28 + var_586_38 then
				arg_583_1.typewritter.percent = (arg_583_1.time_ - var_586_28) / var_586_38

				arg_583_1.typewritter:SetDirty()
			end

			if arg_583_1.time_ >= var_586_28 + var_586_38 and arg_583_1.time_ < var_586_28 + var_586_38 + arg_586_0 then
				arg_583_1.typewritter.percent = 1

				arg_583_1.typewritter:SetDirty()
				arg_583_1:ShowNextGo(true)
			end
		end
	end,
	Play115311144 = function(arg_587_0, arg_587_1)
		arg_587_1.time_ = 0
		arg_587_1.frameCnt_ = 0
		arg_587_1.state_ = "playing"
		arg_587_1.curTalkId_ = 115311144
		arg_587_1.duration_ = 13.966

		local var_587_0 = {
			ja = 13.966,
			ko = 7.733,
			zh = 7.333,
			en = 7.1
		}
		local var_587_1 = manager.audio:GetLocalizationFlag()

		if var_587_0[var_587_1] ~= nil then
			arg_587_1.duration_ = var_587_0[var_587_1]
		end

		SetActive(arg_587_1.tipsGo_, false)

		function arg_587_1.onSingleLineFinish_()
			arg_587_1.onSingleLineUpdate_ = nil
			arg_587_1.onSingleLineFinish_ = nil
			arg_587_1.state_ = "waiting"
		end

		function arg_587_1.playNext_(arg_589_0)
			if arg_589_0 == 1 then
				arg_587_0:Play115311145(arg_587_1)
			end
		end

		function arg_587_1.onSingleLineUpdate_(arg_590_0)
			local var_590_0 = arg_587_1.actors_["10030"]
			local var_590_1 = 0

			if var_590_1 < arg_587_1.time_ and arg_587_1.time_ <= var_590_1 + arg_590_0 then
				local var_590_2 = var_590_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_590_2 then
					arg_587_1.var_.alphaOldValue10030 = var_590_2.alpha
					arg_587_1.var_.characterEffect10030 = var_590_2
				end

				arg_587_1.var_.alphaOldValue10030 = 0
			end

			local var_590_3 = 0.5

			if var_590_1 <= arg_587_1.time_ and arg_587_1.time_ < var_590_1 + var_590_3 then
				local var_590_4 = (arg_587_1.time_ - var_590_1) / var_590_3
				local var_590_5 = Mathf.Lerp(arg_587_1.var_.alphaOldValue10030, 1, var_590_4)

				if arg_587_1.var_.characterEffect10030 then
					arg_587_1.var_.characterEffect10030.alpha = var_590_5
				end
			end

			if arg_587_1.time_ >= var_590_1 + var_590_3 and arg_587_1.time_ < var_590_1 + var_590_3 + arg_590_0 and arg_587_1.var_.characterEffect10030 then
				arg_587_1.var_.characterEffect10030.alpha = 1
			end

			local var_590_6 = arg_587_1.actors_["10030"]
			local var_590_7 = 0

			if var_590_7 < arg_587_1.time_ and arg_587_1.time_ <= var_590_7 + arg_590_0 and arg_587_1.var_.actorSpriteComps10030 == nil then
				arg_587_1.var_.actorSpriteComps10030 = var_590_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_590_8 = 0.2

			if var_590_7 <= arg_587_1.time_ and arg_587_1.time_ < var_590_7 + var_590_8 then
				local var_590_9 = (arg_587_1.time_ - var_590_7) / var_590_8

				if arg_587_1.var_.actorSpriteComps10030 then
					for iter_590_0, iter_590_1 in pairs(arg_587_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_590_1 then
							local var_590_10 = Mathf.Lerp(iter_590_1.color.r, 1, var_590_9)

							iter_590_1.color = Color.New(var_590_10, var_590_10, var_590_10)
						end
					end
				end
			end

			if arg_587_1.time_ >= var_590_7 + var_590_8 and arg_587_1.time_ < var_590_7 + var_590_8 + arg_590_0 and arg_587_1.var_.actorSpriteComps10030 then
				local var_590_11 = 1

				for iter_590_2, iter_590_3 in pairs(arg_587_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_590_3 then
						iter_590_3.color = Color.New(var_590_11, var_590_11, var_590_11)
					end
				end

				arg_587_1.var_.actorSpriteComps10030 = nil
			end

			local var_590_12 = arg_587_1.actors_["10030"].transform
			local var_590_13 = 0

			if var_590_13 < arg_587_1.time_ and arg_587_1.time_ <= var_590_13 + arg_590_0 then
				arg_587_1.var_.moveOldPos10030 = var_590_12.localPosition
				var_590_12.localScale = Vector3.New(1, 1, 1)

				arg_587_1:CheckSpriteTmpPos("10030", 2)

				local var_590_14 = var_590_12.childCount

				for iter_590_4 = 0, var_590_14 - 1 do
					local var_590_15 = var_590_12:GetChild(iter_590_4)

					if var_590_15.name == "split_2" or not string.find(var_590_15.name, "split") then
						var_590_15.gameObject:SetActive(true)
					else
						var_590_15.gameObject:SetActive(false)
					end
				end
			end

			local var_590_16 = 0.001

			if var_590_13 <= arg_587_1.time_ and arg_587_1.time_ < var_590_13 + var_590_16 then
				local var_590_17 = (arg_587_1.time_ - var_590_13) / var_590_16
				local var_590_18 = Vector3.New(-390, -390, 150)

				var_590_12.localPosition = Vector3.Lerp(arg_587_1.var_.moveOldPos10030, var_590_18, var_590_17)
			end

			if arg_587_1.time_ >= var_590_13 + var_590_16 and arg_587_1.time_ < var_590_13 + var_590_16 + arg_590_0 then
				var_590_12.localPosition = Vector3.New(-390, -390, 150)
			end

			local var_590_19 = arg_587_1.actors_["1041_1"]
			local var_590_20 = 0

			if var_590_20 < arg_587_1.time_ and arg_587_1.time_ <= var_590_20 + arg_590_0 then
				local var_590_21 = var_590_19:GetComponent("Image")

				if var_590_21 then
					arg_587_1.var_.highlightMatValue1041_1 = var_590_21
				end
			end

			local var_590_22 = 0.2

			if var_590_20 <= arg_587_1.time_ and arg_587_1.time_ < var_590_20 + var_590_22 then
				local var_590_23 = (arg_587_1.time_ - var_590_20) / var_590_22

				if arg_587_1.var_.highlightMatValue1041_1 then
					local var_590_24 = Mathf.Lerp(1, 0.5, var_590_23)
					local var_590_25 = arg_587_1.var_.highlightMatValue1041_1
					local var_590_26 = var_590_25.color

					var_590_26.r = var_590_24
					var_590_26.g = var_590_24
					var_590_26.b = var_590_24
					var_590_25.color = var_590_26
				end
			end

			if arg_587_1.time_ >= var_590_20 + var_590_22 and arg_587_1.time_ < var_590_20 + var_590_22 + arg_590_0 and arg_587_1.var_.highlightMatValue1041_1 then
				local var_590_27 = 0.5
				local var_590_28 = arg_587_1.var_.highlightMatValue1041_1
				local var_590_29 = var_590_28.color

				var_590_29.r = var_590_27
				var_590_29.g = var_590_27
				var_590_29.b = var_590_27
				var_590_28.color = var_590_29
			end

			local var_590_30 = 0
			local var_590_31 = 0.625

			if var_590_30 < arg_587_1.time_ and arg_587_1.time_ <= var_590_30 + arg_590_0 then
				arg_587_1.talkMaxDuration = 0
				arg_587_1.dialogCg_.alpha = 1

				arg_587_1.dialog_:SetActive(true)
				SetActive(arg_587_1.leftNameGo_, true)

				local var_590_32 = arg_587_1:FormatText(StoryNameCfg[309].name)

				arg_587_1.leftNameTxt_.text = var_590_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_587_1.leftNameTxt_.transform)

				arg_587_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_587_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_587_1:RecordName(arg_587_1.leftNameTxt_.text)
				SetActive(arg_587_1.iconTrs_.gameObject, false)
				arg_587_1.callingController_:SetSelectedState("normal")

				local var_590_33 = arg_587_1:GetWordFromCfg(115311144)
				local var_590_34 = arg_587_1:FormatText(var_590_33.content)

				arg_587_1.text_.text = var_590_34

				LuaForUtil.ClearLinePrefixSymbol(arg_587_1.text_)

				local var_590_35 = 25
				local var_590_36 = utf8.len(var_590_34)
				local var_590_37 = var_590_35 <= 0 and var_590_31 or var_590_31 * (var_590_36 / var_590_35)

				if var_590_37 > 0 and var_590_31 < var_590_37 then
					arg_587_1.talkMaxDuration = var_590_37

					if var_590_37 + var_590_30 > arg_587_1.duration_ then
						arg_587_1.duration_ = var_590_37 + var_590_30
					end
				end

				arg_587_1.text_.text = var_590_34
				arg_587_1.typewritter.percent = 0

				arg_587_1.typewritter:SetDirty()
				arg_587_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311144", "story_v_out_115311.awb") ~= 0 then
					local var_590_38 = manager.audio:GetVoiceLength("story_v_out_115311", "115311144", "story_v_out_115311.awb") / 1000

					if var_590_38 + var_590_30 > arg_587_1.duration_ then
						arg_587_1.duration_ = var_590_38 + var_590_30
					end

					if var_590_33.prefab_name ~= "" and arg_587_1.actors_[var_590_33.prefab_name] ~= nil then
						local var_590_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_587_1.actors_[var_590_33.prefab_name].transform, "story_v_out_115311", "115311144", "story_v_out_115311.awb")

						arg_587_1:RecordAudio("115311144", var_590_39)
						arg_587_1:RecordAudio("115311144", var_590_39)
					else
						arg_587_1:AudioAction("play", "voice", "story_v_out_115311", "115311144", "story_v_out_115311.awb")
					end

					arg_587_1:RecordHistoryTalkVoice("story_v_out_115311", "115311144", "story_v_out_115311.awb")
				end

				arg_587_1:RecordContent(arg_587_1.text_.text)
			end

			local var_590_40 = math.max(var_590_31, arg_587_1.talkMaxDuration)

			if var_590_30 <= arg_587_1.time_ and arg_587_1.time_ < var_590_30 + var_590_40 then
				arg_587_1.typewritter.percent = (arg_587_1.time_ - var_590_30) / var_590_40

				arg_587_1.typewritter:SetDirty()
			end

			if arg_587_1.time_ >= var_590_30 + var_590_40 and arg_587_1.time_ < var_590_30 + var_590_40 + arg_590_0 then
				arg_587_1.typewritter.percent = 1

				arg_587_1.typewritter:SetDirty()
				arg_587_1:ShowNextGo(true)
			end
		end
	end,
	Play115311145 = function(arg_591_0, arg_591_1)
		arg_591_1.time_ = 0
		arg_591_1.frameCnt_ = 0
		arg_591_1.state_ = "playing"
		arg_591_1.curTalkId_ = 115311145
		arg_591_1.duration_ = 4.333

		local var_591_0 = {
			ja = 3.633,
			ko = 4.333,
			zh = 2.833,
			en = 3.266
		}
		local var_591_1 = manager.audio:GetLocalizationFlag()

		if var_591_0[var_591_1] ~= nil then
			arg_591_1.duration_ = var_591_0[var_591_1]
		end

		SetActive(arg_591_1.tipsGo_, false)

		function arg_591_1.onSingleLineFinish_()
			arg_591_1.onSingleLineUpdate_ = nil
			arg_591_1.onSingleLineFinish_ = nil
			arg_591_1.state_ = "waiting"
		end

		function arg_591_1.playNext_(arg_593_0)
			if arg_593_0 == 1 then
				arg_591_0:Play115311146(arg_591_1)
			end
		end

		function arg_591_1.onSingleLineUpdate_(arg_594_0)
			local var_594_0 = arg_591_1.actors_["10030"]
			local var_594_1 = 0

			if var_594_1 < arg_591_1.time_ and arg_591_1.time_ <= var_594_1 + arg_594_0 and arg_591_1.var_.actorSpriteComps10030 == nil then
				arg_591_1.var_.actorSpriteComps10030 = var_594_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_594_2 = 0.2

			if var_594_1 <= arg_591_1.time_ and arg_591_1.time_ < var_594_1 + var_594_2 then
				local var_594_3 = (arg_591_1.time_ - var_594_1) / var_594_2

				if arg_591_1.var_.actorSpriteComps10030 then
					for iter_594_0, iter_594_1 in pairs(arg_591_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_594_1 then
							local var_594_4 = Mathf.Lerp(iter_594_1.color.r, 0.5, var_594_3)

							iter_594_1.color = Color.New(var_594_4, var_594_4, var_594_4)
						end
					end
				end
			end

			if arg_591_1.time_ >= var_594_1 + var_594_2 and arg_591_1.time_ < var_594_1 + var_594_2 + arg_594_0 and arg_591_1.var_.actorSpriteComps10030 then
				local var_594_5 = 0.5

				for iter_594_2, iter_594_3 in pairs(arg_591_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_594_3 then
						iter_594_3.color = Color.New(var_594_5, var_594_5, var_594_5)
					end
				end

				arg_591_1.var_.actorSpriteComps10030 = nil
			end

			local var_594_6 = arg_591_1.actors_["1041_1"]
			local var_594_7 = 0

			if var_594_7 < arg_591_1.time_ and arg_591_1.time_ <= var_594_7 + arg_594_0 then
				local var_594_8 = var_594_6:GetComponent("Image")

				if var_594_8 then
					arg_591_1.var_.highlightMatValue1041_1 = var_594_8
				end
			end

			local var_594_9 = 0.2

			if var_594_7 <= arg_591_1.time_ and arg_591_1.time_ < var_594_7 + var_594_9 then
				local var_594_10 = (arg_591_1.time_ - var_594_7) / var_594_9

				if arg_591_1.var_.highlightMatValue1041_1 then
					local var_594_11 = Mathf.Lerp(0.5, 1, var_594_10)
					local var_594_12 = arg_591_1.var_.highlightMatValue1041_1
					local var_594_13 = var_594_12.color

					var_594_13.r = var_594_11
					var_594_13.g = var_594_11
					var_594_13.b = var_594_11
					var_594_12.color = var_594_13
				end
			end

			if arg_591_1.time_ >= var_594_7 + var_594_9 and arg_591_1.time_ < var_594_7 + var_594_9 + arg_594_0 and arg_591_1.var_.highlightMatValue1041_1 then
				local var_594_14 = 1

				var_594_6.transform:SetSiblingIndex(1)

				local var_594_15 = arg_591_1.var_.highlightMatValue1041_1
				local var_594_16 = var_594_15.color

				var_594_16.r = var_594_14
				var_594_16.g = var_594_14
				var_594_16.b = var_594_14
				var_594_15.color = var_594_16
			end

			local var_594_17 = 0
			local var_594_18 = 0.35

			if var_594_17 < arg_591_1.time_ and arg_591_1.time_ <= var_594_17 + arg_594_0 then
				arg_591_1.talkMaxDuration = 0
				arg_591_1.dialogCg_.alpha = 1

				arg_591_1.dialog_:SetActive(true)
				SetActive(arg_591_1.leftNameGo_, true)

				local var_594_19 = arg_591_1:FormatText(StoryNameCfg[208].name)

				arg_591_1.leftNameTxt_.text = var_594_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_591_1.leftNameTxt_.transform)

				arg_591_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_591_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_591_1:RecordName(arg_591_1.leftNameTxt_.text)
				SetActive(arg_591_1.iconTrs_.gameObject, false)
				arg_591_1.callingController_:SetSelectedState("normal")

				local var_594_20 = arg_591_1:GetWordFromCfg(115311145)
				local var_594_21 = arg_591_1:FormatText(var_594_20.content)

				arg_591_1.text_.text = var_594_21

				LuaForUtil.ClearLinePrefixSymbol(arg_591_1.text_)

				local var_594_22 = 14
				local var_594_23 = utf8.len(var_594_21)
				local var_594_24 = var_594_22 <= 0 and var_594_18 or var_594_18 * (var_594_23 / var_594_22)

				if var_594_24 > 0 and var_594_18 < var_594_24 then
					arg_591_1.talkMaxDuration = var_594_24

					if var_594_24 + var_594_17 > arg_591_1.duration_ then
						arg_591_1.duration_ = var_594_24 + var_594_17
					end
				end

				arg_591_1.text_.text = var_594_21
				arg_591_1.typewritter.percent = 0

				arg_591_1.typewritter:SetDirty()
				arg_591_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311145", "story_v_out_115311.awb") ~= 0 then
					local var_594_25 = manager.audio:GetVoiceLength("story_v_out_115311", "115311145", "story_v_out_115311.awb") / 1000

					if var_594_25 + var_594_17 > arg_591_1.duration_ then
						arg_591_1.duration_ = var_594_25 + var_594_17
					end

					if var_594_20.prefab_name ~= "" and arg_591_1.actors_[var_594_20.prefab_name] ~= nil then
						local var_594_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_591_1.actors_[var_594_20.prefab_name].transform, "story_v_out_115311", "115311145", "story_v_out_115311.awb")

						arg_591_1:RecordAudio("115311145", var_594_26)
						arg_591_1:RecordAudio("115311145", var_594_26)
					else
						arg_591_1:AudioAction("play", "voice", "story_v_out_115311", "115311145", "story_v_out_115311.awb")
					end

					arg_591_1:RecordHistoryTalkVoice("story_v_out_115311", "115311145", "story_v_out_115311.awb")
				end

				arg_591_1:RecordContent(arg_591_1.text_.text)
			end

			local var_594_27 = math.max(var_594_18, arg_591_1.talkMaxDuration)

			if var_594_17 <= arg_591_1.time_ and arg_591_1.time_ < var_594_17 + var_594_27 then
				arg_591_1.typewritter.percent = (arg_591_1.time_ - var_594_17) / var_594_27

				arg_591_1.typewritter:SetDirty()
			end

			if arg_591_1.time_ >= var_594_17 + var_594_27 and arg_591_1.time_ < var_594_17 + var_594_27 + arg_594_0 then
				arg_591_1.typewritter.percent = 1

				arg_591_1.typewritter:SetDirty()
				arg_591_1:ShowNextGo(true)
			end
		end
	end,
	Play115311146 = function(arg_595_0, arg_595_1)
		arg_595_1.time_ = 0
		arg_595_1.frameCnt_ = 0
		arg_595_1.state_ = "playing"
		arg_595_1.curTalkId_ = 115311146
		arg_595_1.duration_ = 5

		SetActive(arg_595_1.tipsGo_, false)

		function arg_595_1.onSingleLineFinish_()
			arg_595_1.onSingleLineUpdate_ = nil
			arg_595_1.onSingleLineFinish_ = nil
			arg_595_1.state_ = "waiting"
		end

		function arg_595_1.playNext_(arg_597_0)
			if arg_597_0 == 1 then
				arg_595_0:Play115311147(arg_595_1)
			end
		end

		function arg_595_1.onSingleLineUpdate_(arg_598_0)
			local var_598_0 = arg_595_1.actors_["10030"].transform
			local var_598_1 = 0

			if var_598_1 < arg_595_1.time_ and arg_595_1.time_ <= var_598_1 + arg_598_0 then
				arg_595_1.var_.moveOldPos10030 = var_598_0.localPosition
				var_598_0.localScale = Vector3.New(1, 1, 1)

				arg_595_1:CheckSpriteTmpPos("10030", 2)

				local var_598_2 = var_598_0.childCount

				for iter_598_0 = 0, var_598_2 - 1 do
					local var_598_3 = var_598_0:GetChild(iter_598_0)

					if var_598_3.name == "split_3" or not string.find(var_598_3.name, "split") then
						var_598_3.gameObject:SetActive(true)
					else
						var_598_3.gameObject:SetActive(false)
					end
				end
			end

			local var_598_4 = 0.001

			if var_598_1 <= arg_595_1.time_ and arg_595_1.time_ < var_598_1 + var_598_4 then
				local var_598_5 = (arg_595_1.time_ - var_598_1) / var_598_4
				local var_598_6 = Vector3.New(-390, -390, 150)

				var_598_0.localPosition = Vector3.Lerp(arg_595_1.var_.moveOldPos10030, var_598_6, var_598_5)
			end

			if arg_595_1.time_ >= var_598_1 + var_598_4 and arg_595_1.time_ < var_598_1 + var_598_4 + arg_598_0 then
				var_598_0.localPosition = Vector3.New(-390, -390, 150)
			end

			local var_598_7 = arg_595_1.actors_["1041_1"]
			local var_598_8 = 0

			if var_598_8 < arg_595_1.time_ and arg_595_1.time_ <= var_598_8 + arg_598_0 then
				local var_598_9 = var_598_7:GetComponent("Image")

				if var_598_9 then
					arg_595_1.var_.highlightMatValue1041_1 = var_598_9
				end
			end

			local var_598_10 = 0.2

			if var_598_8 <= arg_595_1.time_ and arg_595_1.time_ < var_598_8 + var_598_10 then
				local var_598_11 = (arg_595_1.time_ - var_598_8) / var_598_10

				if arg_595_1.var_.highlightMatValue1041_1 then
					local var_598_12 = Mathf.Lerp(1, 0.5, var_598_11)
					local var_598_13 = arg_595_1.var_.highlightMatValue1041_1
					local var_598_14 = var_598_13.color

					var_598_14.r = var_598_12
					var_598_14.g = var_598_12
					var_598_14.b = var_598_12
					var_598_13.color = var_598_14
				end
			end

			if arg_595_1.time_ >= var_598_8 + var_598_10 and arg_595_1.time_ < var_598_8 + var_598_10 + arg_598_0 and arg_595_1.var_.highlightMatValue1041_1 then
				local var_598_15 = 0.5
				local var_598_16 = arg_595_1.var_.highlightMatValue1041_1
				local var_598_17 = var_598_16.color

				var_598_17.r = var_598_15
				var_598_17.g = var_598_15
				var_598_17.b = var_598_15
				var_598_16.color = var_598_17
			end

			local var_598_18 = 0
			local var_598_19 = 0.575

			if var_598_18 < arg_595_1.time_ and arg_595_1.time_ <= var_598_18 + arg_598_0 then
				arg_595_1.talkMaxDuration = 0
				arg_595_1.dialogCg_.alpha = 1

				arg_595_1.dialog_:SetActive(true)
				SetActive(arg_595_1.leftNameGo_, false)

				arg_595_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_595_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_595_1:RecordName(arg_595_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_595_1.iconTrs_.gameObject, false)
				arg_595_1.callingController_:SetSelectedState("normal")

				local var_598_20 = arg_595_1:GetWordFromCfg(115311146)
				local var_598_21 = arg_595_1:FormatText(var_598_20.content)

				arg_595_1.text_.text = var_598_21

				LuaForUtil.ClearLinePrefixSymbol(arg_595_1.text_)

				local var_598_22 = 23
				local var_598_23 = utf8.len(var_598_21)
				local var_598_24 = var_598_22 <= 0 and var_598_19 or var_598_19 * (var_598_23 / var_598_22)

				if var_598_24 > 0 and var_598_19 < var_598_24 then
					arg_595_1.talkMaxDuration = var_598_24

					if var_598_24 + var_598_18 > arg_595_1.duration_ then
						arg_595_1.duration_ = var_598_24 + var_598_18
					end
				end

				arg_595_1.text_.text = var_598_21
				arg_595_1.typewritter.percent = 0

				arg_595_1.typewritter:SetDirty()
				arg_595_1:ShowNextGo(false)
				arg_595_1:RecordContent(arg_595_1.text_.text)
			end

			local var_598_25 = math.max(var_598_19, arg_595_1.talkMaxDuration)

			if var_598_18 <= arg_595_1.time_ and arg_595_1.time_ < var_598_18 + var_598_25 then
				arg_595_1.typewritter.percent = (arg_595_1.time_ - var_598_18) / var_598_25

				arg_595_1.typewritter:SetDirty()
			end

			if arg_595_1.time_ >= var_598_18 + var_598_25 and arg_595_1.time_ < var_598_18 + var_598_25 + arg_598_0 then
				arg_595_1.typewritter.percent = 1

				arg_595_1.typewritter:SetDirty()
				arg_595_1:ShowNextGo(true)
			end
		end
	end,
	Play115311147 = function(arg_599_0, arg_599_1)
		arg_599_1.time_ = 0
		arg_599_1.frameCnt_ = 0
		arg_599_1.state_ = "playing"
		arg_599_1.curTalkId_ = 115311147
		arg_599_1.duration_ = 10.233

		local var_599_0 = {
			ja = 10.233,
			ko = 6.733,
			zh = 5.5,
			en = 6.3
		}
		local var_599_1 = manager.audio:GetLocalizationFlag()

		if var_599_0[var_599_1] ~= nil then
			arg_599_1.duration_ = var_599_0[var_599_1]
		end

		SetActive(arg_599_1.tipsGo_, false)

		function arg_599_1.onSingleLineFinish_()
			arg_599_1.onSingleLineUpdate_ = nil
			arg_599_1.onSingleLineFinish_ = nil
			arg_599_1.state_ = "waiting"
		end

		function arg_599_1.playNext_(arg_601_0)
			if arg_601_0 == 1 then
				arg_599_0:Play115311148(arg_599_1)
			end
		end

		function arg_599_1.onSingleLineUpdate_(arg_602_0)
			local var_602_0 = arg_599_1.actors_["1041_1"]
			local var_602_1 = 0

			if var_602_1 < arg_599_1.time_ and arg_599_1.time_ <= var_602_1 + arg_602_0 then
				local var_602_2 = var_602_0:GetComponent("Image")

				if var_602_2 then
					arg_599_1.var_.highlightMatValue1041_1 = var_602_2
				end
			end

			local var_602_3 = 0.2

			if var_602_1 <= arg_599_1.time_ and arg_599_1.time_ < var_602_1 + var_602_3 then
				local var_602_4 = (arg_599_1.time_ - var_602_1) / var_602_3

				if arg_599_1.var_.highlightMatValue1041_1 then
					local var_602_5 = Mathf.Lerp(0.5, 1, var_602_4)
					local var_602_6 = arg_599_1.var_.highlightMatValue1041_1
					local var_602_7 = var_602_6.color

					var_602_7.r = var_602_5
					var_602_7.g = var_602_5
					var_602_7.b = var_602_5
					var_602_6.color = var_602_7
				end
			end

			if arg_599_1.time_ >= var_602_1 + var_602_3 and arg_599_1.time_ < var_602_1 + var_602_3 + arg_602_0 and arg_599_1.var_.highlightMatValue1041_1 then
				local var_602_8 = 1

				var_602_0.transform:SetSiblingIndex(1)

				local var_602_9 = arg_599_1.var_.highlightMatValue1041_1
				local var_602_10 = var_602_9.color

				var_602_10.r = var_602_8
				var_602_10.g = var_602_8
				var_602_10.b = var_602_8
				var_602_9.color = var_602_10
			end

			local var_602_11 = 0
			local var_602_12 = 0.725

			if var_602_11 < arg_599_1.time_ and arg_599_1.time_ <= var_602_11 + arg_602_0 then
				arg_599_1.talkMaxDuration = 0
				arg_599_1.dialogCg_.alpha = 1

				arg_599_1.dialog_:SetActive(true)
				SetActive(arg_599_1.leftNameGo_, true)

				local var_602_13 = arg_599_1:FormatText(StoryNameCfg[208].name)

				arg_599_1.leftNameTxt_.text = var_602_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_599_1.leftNameTxt_.transform)

				arg_599_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_599_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_599_1:RecordName(arg_599_1.leftNameTxt_.text)
				SetActive(arg_599_1.iconTrs_.gameObject, false)
				arg_599_1.callingController_:SetSelectedState("normal")

				local var_602_14 = arg_599_1:GetWordFromCfg(115311147)
				local var_602_15 = arg_599_1:FormatText(var_602_14.content)

				arg_599_1.text_.text = var_602_15

				LuaForUtil.ClearLinePrefixSymbol(arg_599_1.text_)

				local var_602_16 = 29
				local var_602_17 = utf8.len(var_602_15)
				local var_602_18 = var_602_16 <= 0 and var_602_12 or var_602_12 * (var_602_17 / var_602_16)

				if var_602_18 > 0 and var_602_12 < var_602_18 then
					arg_599_1.talkMaxDuration = var_602_18

					if var_602_18 + var_602_11 > arg_599_1.duration_ then
						arg_599_1.duration_ = var_602_18 + var_602_11
					end
				end

				arg_599_1.text_.text = var_602_15
				arg_599_1.typewritter.percent = 0

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311147", "story_v_out_115311.awb") ~= 0 then
					local var_602_19 = manager.audio:GetVoiceLength("story_v_out_115311", "115311147", "story_v_out_115311.awb") / 1000

					if var_602_19 + var_602_11 > arg_599_1.duration_ then
						arg_599_1.duration_ = var_602_19 + var_602_11
					end

					if var_602_14.prefab_name ~= "" and arg_599_1.actors_[var_602_14.prefab_name] ~= nil then
						local var_602_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_599_1.actors_[var_602_14.prefab_name].transform, "story_v_out_115311", "115311147", "story_v_out_115311.awb")

						arg_599_1:RecordAudio("115311147", var_602_20)
						arg_599_1:RecordAudio("115311147", var_602_20)
					else
						arg_599_1:AudioAction("play", "voice", "story_v_out_115311", "115311147", "story_v_out_115311.awb")
					end

					arg_599_1:RecordHistoryTalkVoice("story_v_out_115311", "115311147", "story_v_out_115311.awb")
				end

				arg_599_1:RecordContent(arg_599_1.text_.text)
			end

			local var_602_21 = math.max(var_602_12, arg_599_1.talkMaxDuration)

			if var_602_11 <= arg_599_1.time_ and arg_599_1.time_ < var_602_11 + var_602_21 then
				arg_599_1.typewritter.percent = (arg_599_1.time_ - var_602_11) / var_602_21

				arg_599_1.typewritter:SetDirty()
			end

			if arg_599_1.time_ >= var_602_11 + var_602_21 and arg_599_1.time_ < var_602_11 + var_602_21 + arg_602_0 then
				arg_599_1.typewritter.percent = 1

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(true)
			end
		end
	end,
	Play115311148 = function(arg_603_0, arg_603_1)
		arg_603_1.time_ = 0
		arg_603_1.frameCnt_ = 0
		arg_603_1.state_ = "playing"
		arg_603_1.curTalkId_ = 115311148
		arg_603_1.duration_ = 12.866

		local var_603_0 = {
			ja = 12.866,
			ko = 9.666,
			zh = 8.5,
			en = 11.3
		}
		local var_603_1 = manager.audio:GetLocalizationFlag()

		if var_603_0[var_603_1] ~= nil then
			arg_603_1.duration_ = var_603_0[var_603_1]
		end

		SetActive(arg_603_1.tipsGo_, false)

		function arg_603_1.onSingleLineFinish_()
			arg_603_1.onSingleLineUpdate_ = nil
			arg_603_1.onSingleLineFinish_ = nil
			arg_603_1.state_ = "waiting"
		end

		function arg_603_1.playNext_(arg_605_0)
			if arg_605_0 == 1 then
				arg_603_0:Play115311149(arg_603_1)
			end
		end

		function arg_603_1.onSingleLineUpdate_(arg_606_0)
			local var_606_0 = 0
			local var_606_1 = 1

			if var_606_0 < arg_603_1.time_ and arg_603_1.time_ <= var_606_0 + arg_606_0 then
				arg_603_1.talkMaxDuration = 0
				arg_603_1.dialogCg_.alpha = 1

				arg_603_1.dialog_:SetActive(true)
				SetActive(arg_603_1.leftNameGo_, true)

				local var_606_2 = arg_603_1:FormatText(StoryNameCfg[208].name)

				arg_603_1.leftNameTxt_.text = var_606_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_603_1.leftNameTxt_.transform)

				arg_603_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_603_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_603_1:RecordName(arg_603_1.leftNameTxt_.text)
				SetActive(arg_603_1.iconTrs_.gameObject, false)
				arg_603_1.callingController_:SetSelectedState("normal")

				local var_606_3 = arg_603_1:GetWordFromCfg(115311148)
				local var_606_4 = arg_603_1:FormatText(var_606_3.content)

				arg_603_1.text_.text = var_606_4

				LuaForUtil.ClearLinePrefixSymbol(arg_603_1.text_)

				local var_606_5 = 41
				local var_606_6 = utf8.len(var_606_4)
				local var_606_7 = var_606_5 <= 0 and var_606_1 or var_606_1 * (var_606_6 / var_606_5)

				if var_606_7 > 0 and var_606_1 < var_606_7 then
					arg_603_1.talkMaxDuration = var_606_7

					if var_606_7 + var_606_0 > arg_603_1.duration_ then
						arg_603_1.duration_ = var_606_7 + var_606_0
					end
				end

				arg_603_1.text_.text = var_606_4
				arg_603_1.typewritter.percent = 0

				arg_603_1.typewritter:SetDirty()
				arg_603_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311148", "story_v_out_115311.awb") ~= 0 then
					local var_606_8 = manager.audio:GetVoiceLength("story_v_out_115311", "115311148", "story_v_out_115311.awb") / 1000

					if var_606_8 + var_606_0 > arg_603_1.duration_ then
						arg_603_1.duration_ = var_606_8 + var_606_0
					end

					if var_606_3.prefab_name ~= "" and arg_603_1.actors_[var_606_3.prefab_name] ~= nil then
						local var_606_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_603_1.actors_[var_606_3.prefab_name].transform, "story_v_out_115311", "115311148", "story_v_out_115311.awb")

						arg_603_1:RecordAudio("115311148", var_606_9)
						arg_603_1:RecordAudio("115311148", var_606_9)
					else
						arg_603_1:AudioAction("play", "voice", "story_v_out_115311", "115311148", "story_v_out_115311.awb")
					end

					arg_603_1:RecordHistoryTalkVoice("story_v_out_115311", "115311148", "story_v_out_115311.awb")
				end

				arg_603_1:RecordContent(arg_603_1.text_.text)
			end

			local var_606_10 = math.max(var_606_1, arg_603_1.talkMaxDuration)

			if var_606_0 <= arg_603_1.time_ and arg_603_1.time_ < var_606_0 + var_606_10 then
				arg_603_1.typewritter.percent = (arg_603_1.time_ - var_606_0) / var_606_10

				arg_603_1.typewritter:SetDirty()
			end

			if arg_603_1.time_ >= var_606_0 + var_606_10 and arg_603_1.time_ < var_606_0 + var_606_10 + arg_606_0 then
				arg_603_1.typewritter.percent = 1

				arg_603_1.typewritter:SetDirty()
				arg_603_1:ShowNextGo(true)
			end
		end
	end,
	Play115311149 = function(arg_607_0, arg_607_1)
		arg_607_1.time_ = 0
		arg_607_1.frameCnt_ = 0
		arg_607_1.state_ = "playing"
		arg_607_1.curTalkId_ = 115311149
		arg_607_1.duration_ = 1.6

		local var_607_0 = {
			ja = 0.999999999999,
			ko = 0.999999999999,
			zh = 1.6,
			en = 1.166
		}
		local var_607_1 = manager.audio:GetLocalizationFlag()

		if var_607_0[var_607_1] ~= nil then
			arg_607_1.duration_ = var_607_0[var_607_1]
		end

		SetActive(arg_607_1.tipsGo_, false)

		function arg_607_1.onSingleLineFinish_()
			arg_607_1.onSingleLineUpdate_ = nil
			arg_607_1.onSingleLineFinish_ = nil
			arg_607_1.state_ = "waiting"
		end

		function arg_607_1.playNext_(arg_609_0)
			if arg_609_0 == 1 then
				arg_607_0:Play115311150(arg_607_1)
			end
		end

		function arg_607_1.onSingleLineUpdate_(arg_610_0)
			local var_610_0 = arg_607_1.actors_["1041_1"]
			local var_610_1 = 0

			if var_610_1 < arg_607_1.time_ and arg_607_1.time_ <= var_610_1 + arg_610_0 then
				local var_610_2 = var_610_0:GetComponent("Image")

				if var_610_2 then
					arg_607_1.var_.highlightMatValue1041_1 = var_610_2
				end
			end

			local var_610_3 = 0.2

			if var_610_1 <= arg_607_1.time_ and arg_607_1.time_ < var_610_1 + var_610_3 then
				local var_610_4 = (arg_607_1.time_ - var_610_1) / var_610_3

				if arg_607_1.var_.highlightMatValue1041_1 then
					local var_610_5 = Mathf.Lerp(1, 0.5, var_610_4)
					local var_610_6 = arg_607_1.var_.highlightMatValue1041_1
					local var_610_7 = var_610_6.color

					var_610_7.r = var_610_5
					var_610_7.g = var_610_5
					var_610_7.b = var_610_5
					var_610_6.color = var_610_7
				end
			end

			if arg_607_1.time_ >= var_610_1 + var_610_3 and arg_607_1.time_ < var_610_1 + var_610_3 + arg_610_0 and arg_607_1.var_.highlightMatValue1041_1 then
				local var_610_8 = 0.5
				local var_610_9 = arg_607_1.var_.highlightMatValue1041_1
				local var_610_10 = var_610_9.color

				var_610_10.r = var_610_8
				var_610_10.g = var_610_8
				var_610_10.b = var_610_8
				var_610_9.color = var_610_10
			end

			local var_610_11 = arg_607_1.actors_["10030"]
			local var_610_12 = 0

			if var_610_12 < arg_607_1.time_ and arg_607_1.time_ <= var_610_12 + arg_610_0 and arg_607_1.var_.actorSpriteComps10030 == nil then
				arg_607_1.var_.actorSpriteComps10030 = var_610_11:GetComponentsInChildren(typeof(Image), true)
			end

			local var_610_13 = 0.2

			if var_610_12 <= arg_607_1.time_ and arg_607_1.time_ < var_610_12 + var_610_13 then
				local var_610_14 = (arg_607_1.time_ - var_610_12) / var_610_13

				if arg_607_1.var_.actorSpriteComps10030 then
					for iter_610_0, iter_610_1 in pairs(arg_607_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_610_1 then
							local var_610_15 = Mathf.Lerp(iter_610_1.color.r, 1, var_610_14)

							iter_610_1.color = Color.New(var_610_15, var_610_15, var_610_15)
						end
					end
				end
			end

			if arg_607_1.time_ >= var_610_12 + var_610_13 and arg_607_1.time_ < var_610_12 + var_610_13 + arg_610_0 and arg_607_1.var_.actorSpriteComps10030 then
				local var_610_16 = 1

				for iter_610_2, iter_610_3 in pairs(arg_607_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_610_3 then
						iter_610_3.color = Color.New(var_610_16, var_610_16, var_610_16)
					end
				end

				arg_607_1.var_.actorSpriteComps10030 = nil
			end

			local var_610_17 = 0
			local var_610_18 = 0.1

			if var_610_17 < arg_607_1.time_ and arg_607_1.time_ <= var_610_17 + arg_610_0 then
				arg_607_1.talkMaxDuration = 0
				arg_607_1.dialogCg_.alpha = 1

				arg_607_1.dialog_:SetActive(true)
				SetActive(arg_607_1.leftNameGo_, true)

				local var_610_19 = arg_607_1:FormatText(StoryNameCfg[309].name)

				arg_607_1.leftNameTxt_.text = var_610_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_607_1.leftNameTxt_.transform)

				arg_607_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_607_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_607_1:RecordName(arg_607_1.leftNameTxt_.text)
				SetActive(arg_607_1.iconTrs_.gameObject, false)
				arg_607_1.callingController_:SetSelectedState("normal")

				local var_610_20 = arg_607_1:GetWordFromCfg(115311149)
				local var_610_21 = arg_607_1:FormatText(var_610_20.content)

				arg_607_1.text_.text = var_610_21

				LuaForUtil.ClearLinePrefixSymbol(arg_607_1.text_)

				local var_610_22 = 4
				local var_610_23 = utf8.len(var_610_21)
				local var_610_24 = var_610_22 <= 0 and var_610_18 or var_610_18 * (var_610_23 / var_610_22)

				if var_610_24 > 0 and var_610_18 < var_610_24 then
					arg_607_1.talkMaxDuration = var_610_24

					if var_610_24 + var_610_17 > arg_607_1.duration_ then
						arg_607_1.duration_ = var_610_24 + var_610_17
					end
				end

				arg_607_1.text_.text = var_610_21
				arg_607_1.typewritter.percent = 0

				arg_607_1.typewritter:SetDirty()
				arg_607_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311149", "story_v_out_115311.awb") ~= 0 then
					local var_610_25 = manager.audio:GetVoiceLength("story_v_out_115311", "115311149", "story_v_out_115311.awb") / 1000

					if var_610_25 + var_610_17 > arg_607_1.duration_ then
						arg_607_1.duration_ = var_610_25 + var_610_17
					end

					if var_610_20.prefab_name ~= "" and arg_607_1.actors_[var_610_20.prefab_name] ~= nil then
						local var_610_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_607_1.actors_[var_610_20.prefab_name].transform, "story_v_out_115311", "115311149", "story_v_out_115311.awb")

						arg_607_1:RecordAudio("115311149", var_610_26)
						arg_607_1:RecordAudio("115311149", var_610_26)
					else
						arg_607_1:AudioAction("play", "voice", "story_v_out_115311", "115311149", "story_v_out_115311.awb")
					end

					arg_607_1:RecordHistoryTalkVoice("story_v_out_115311", "115311149", "story_v_out_115311.awb")
				end

				arg_607_1:RecordContent(arg_607_1.text_.text)
			end

			local var_610_27 = math.max(var_610_18, arg_607_1.talkMaxDuration)

			if var_610_17 <= arg_607_1.time_ and arg_607_1.time_ < var_610_17 + var_610_27 then
				arg_607_1.typewritter.percent = (arg_607_1.time_ - var_610_17) / var_610_27

				arg_607_1.typewritter:SetDirty()
			end

			if arg_607_1.time_ >= var_610_17 + var_610_27 and arg_607_1.time_ < var_610_17 + var_610_27 + arg_610_0 then
				arg_607_1.typewritter.percent = 1

				arg_607_1.typewritter:SetDirty()
				arg_607_1:ShowNextGo(true)
			end
		end
	end,
	Play115311150 = function(arg_611_0, arg_611_1)
		arg_611_1.time_ = 0
		arg_611_1.frameCnt_ = 0
		arg_611_1.state_ = "playing"
		arg_611_1.curTalkId_ = 115311150
		arg_611_1.duration_ = 9

		SetActive(arg_611_1.tipsGo_, false)

		function arg_611_1.onSingleLineFinish_()
			arg_611_1.onSingleLineUpdate_ = nil
			arg_611_1.onSingleLineFinish_ = nil
			arg_611_1.state_ = "waiting"
		end

		function arg_611_1.playNext_(arg_613_0)
			if arg_613_0 == 1 then
				arg_611_0:Play115311151(arg_611_1)
			end
		end

		function arg_611_1.onSingleLineUpdate_(arg_614_0)
			local var_614_0 = "F01a"

			if arg_611_1.bgs_[var_614_0] == nil then
				local var_614_1 = Object.Instantiate(arg_611_1.paintGo_)

				var_614_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_614_0)
				var_614_1.name = var_614_0
				var_614_1.transform.parent = arg_611_1.stage_.transform
				var_614_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_611_1.bgs_[var_614_0] = var_614_1
			end

			local var_614_2 = 2

			if var_614_2 < arg_611_1.time_ and arg_611_1.time_ <= var_614_2 + arg_614_0 then
				local var_614_3 = manager.ui.mainCamera.transform.localPosition
				local var_614_4 = Vector3.New(0, 0, 10) + Vector3.New(var_614_3.x, var_614_3.y, 0)
				local var_614_5 = arg_611_1.bgs_.F01a

				var_614_5.transform.localPosition = var_614_4
				var_614_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_614_6 = var_614_5:GetComponent("SpriteRenderer")

				if var_614_6 and var_614_6.sprite then
					local var_614_7 = (var_614_5.transform.localPosition - var_614_3).z
					local var_614_8 = manager.ui.mainCameraCom_
					local var_614_9 = 2 * var_614_7 * Mathf.Tan(var_614_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_614_10 = var_614_9 * var_614_8.aspect
					local var_614_11 = var_614_6.sprite.bounds.size.x
					local var_614_12 = var_614_6.sprite.bounds.size.y
					local var_614_13 = var_614_10 / var_614_11
					local var_614_14 = var_614_9 / var_614_12
					local var_614_15 = var_614_14 < var_614_13 and var_614_13 or var_614_14

					var_614_5.transform.localScale = Vector3.New(var_614_15, var_614_15, 0)
				end

				for iter_614_0, iter_614_1 in pairs(arg_611_1.bgs_) do
					if iter_614_0 ~= "F01a" then
						iter_614_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_614_16 = 0

			if var_614_16 < arg_611_1.time_ and arg_611_1.time_ <= var_614_16 + arg_614_0 then
				arg_611_1.mask_.enabled = true
				arg_611_1.mask_.raycastTarget = true

				arg_611_1:SetGaussion(false)
			end

			local var_614_17 = 2

			if var_614_16 <= arg_611_1.time_ and arg_611_1.time_ < var_614_16 + var_614_17 then
				local var_614_18 = (arg_611_1.time_ - var_614_16) / var_614_17
				local var_614_19 = Color.New(0, 0, 0)

				var_614_19.a = Mathf.Lerp(0, 1, var_614_18)
				arg_611_1.mask_.color = var_614_19
			end

			if arg_611_1.time_ >= var_614_16 + var_614_17 and arg_611_1.time_ < var_614_16 + var_614_17 + arg_614_0 then
				local var_614_20 = Color.New(0, 0, 0)

				var_614_20.a = 1
				arg_611_1.mask_.color = var_614_20
			end

			local var_614_21 = 2

			if var_614_21 < arg_611_1.time_ and arg_611_1.time_ <= var_614_21 + arg_614_0 then
				arg_611_1.mask_.enabled = true
				arg_611_1.mask_.raycastTarget = true

				arg_611_1:SetGaussion(false)
			end

			local var_614_22 = 2

			if var_614_21 <= arg_611_1.time_ and arg_611_1.time_ < var_614_21 + var_614_22 then
				local var_614_23 = (arg_611_1.time_ - var_614_21) / var_614_22
				local var_614_24 = Color.New(0, 0, 0)

				var_614_24.a = Mathf.Lerp(1, 0, var_614_23)
				arg_611_1.mask_.color = var_614_24
			end

			if arg_611_1.time_ >= var_614_21 + var_614_22 and arg_611_1.time_ < var_614_21 + var_614_22 + arg_614_0 then
				local var_614_25 = Color.New(0, 0, 0)
				local var_614_26 = 0

				arg_611_1.mask_.enabled = false
				var_614_25.a = var_614_26
				arg_611_1.mask_.color = var_614_25
			end

			local var_614_27 = arg_611_1.actors_["10030"].transform
			local var_614_28 = 1.966

			if var_614_28 < arg_611_1.time_ and arg_611_1.time_ <= var_614_28 + arg_614_0 then
				arg_611_1.var_.moveOldPos10030 = var_614_27.localPosition
				var_614_27.localScale = Vector3.New(1, 1, 1)

				arg_611_1:CheckSpriteTmpPos("10030", 7)

				local var_614_29 = var_614_27.childCount

				for iter_614_2 = 0, var_614_29 - 1 do
					local var_614_30 = var_614_27:GetChild(iter_614_2)

					if var_614_30.name == "split_3" or not string.find(var_614_30.name, "split") then
						var_614_30.gameObject:SetActive(true)
					else
						var_614_30.gameObject:SetActive(false)
					end
				end
			end

			local var_614_31 = 0.001

			if var_614_28 <= arg_611_1.time_ and arg_611_1.time_ < var_614_28 + var_614_31 then
				local var_614_32 = (arg_611_1.time_ - var_614_28) / var_614_31
				local var_614_33 = Vector3.New(0, -2000, 150)

				var_614_27.localPosition = Vector3.Lerp(arg_611_1.var_.moveOldPos10030, var_614_33, var_614_32)
			end

			if arg_611_1.time_ >= var_614_28 + var_614_31 and arg_611_1.time_ < var_614_28 + var_614_31 + arg_614_0 then
				var_614_27.localPosition = Vector3.New(0, -2000, 150)
			end

			local var_614_34 = arg_611_1.actors_["1041_1"].transform
			local var_614_35 = 1.966

			if var_614_35 < arg_611_1.time_ and arg_611_1.time_ <= var_614_35 + arg_614_0 then
				arg_611_1.var_.moveOldPos1041_1 = var_614_34.localPosition
				var_614_34.localScale = Vector3.New(1, 1, 1)

				arg_611_1:CheckSpriteTmpPos("1041_1", 0)
			end

			local var_614_36 = 0.001

			if var_614_35 <= arg_611_1.time_ and arg_611_1.time_ < var_614_35 + var_614_36 then
				local var_614_37 = (arg_611_1.time_ - var_614_35) / var_614_36
				local var_614_38 = Vector3.New(-1500, -310, -370)

				var_614_34.localPosition = Vector3.Lerp(arg_611_1.var_.moveOldPos1041_1, var_614_38, var_614_37)
			end

			if arg_611_1.time_ >= var_614_35 + var_614_36 and arg_611_1.time_ < var_614_35 + var_614_36 + arg_614_0 then
				var_614_34.localPosition = Vector3.New(-1500, -310, -370)
			end

			local var_614_39 = 0
			local var_614_40 = 1

			if var_614_39 < arg_611_1.time_ and arg_611_1.time_ <= var_614_39 + arg_614_0 then
				local var_614_41 = "play"
				local var_614_42 = "music"

				arg_611_1:AudioAction(var_614_41, var_614_42, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_611_1.frameCnt_ <= 1 then
				arg_611_1.dialog_:SetActive(false)
			end

			local var_614_43 = 4
			local var_614_44 = 0.95

			if var_614_43 < arg_611_1.time_ and arg_611_1.time_ <= var_614_43 + arg_614_0 then
				arg_611_1.talkMaxDuration = 0

				arg_611_1.dialog_:SetActive(true)

				local var_614_45 = LeanTween.value(arg_611_1.dialog_, 0, 1, 0.3)

				var_614_45:setOnUpdate(LuaHelper.FloatAction(function(arg_615_0)
					arg_611_1.dialogCg_.alpha = arg_615_0
				end))
				var_614_45:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_611_1.dialog_)
					var_614_45:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_611_1.duration_ = arg_611_1.duration_ + 0.3

				SetActive(arg_611_1.leftNameGo_, false)

				arg_611_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_611_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_611_1:RecordName(arg_611_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_611_1.iconTrs_.gameObject, false)
				arg_611_1.callingController_:SetSelectedState("normal")

				local var_614_46 = arg_611_1:GetWordFromCfg(115311150)
				local var_614_47 = arg_611_1:FormatText(var_614_46.content)

				arg_611_1.text_.text = var_614_47

				LuaForUtil.ClearLinePrefixSymbol(arg_611_1.text_)

				local var_614_48 = 38
				local var_614_49 = utf8.len(var_614_47)
				local var_614_50 = var_614_48 <= 0 and var_614_44 or var_614_44 * (var_614_49 / var_614_48)

				if var_614_50 > 0 and var_614_44 < var_614_50 then
					arg_611_1.talkMaxDuration = var_614_50
					var_614_43 = var_614_43 + 0.3

					if var_614_50 + var_614_43 > arg_611_1.duration_ then
						arg_611_1.duration_ = var_614_50 + var_614_43
					end
				end

				arg_611_1.text_.text = var_614_47
				arg_611_1.typewritter.percent = 0

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(false)
				arg_611_1:RecordContent(arg_611_1.text_.text)
			end

			local var_614_51 = var_614_43 + 0.3
			local var_614_52 = math.max(var_614_44, arg_611_1.talkMaxDuration)

			if var_614_51 <= arg_611_1.time_ and arg_611_1.time_ < var_614_51 + var_614_52 then
				arg_611_1.typewritter.percent = (arg_611_1.time_ - var_614_51) / var_614_52

				arg_611_1.typewritter:SetDirty()
			end

			if arg_611_1.time_ >= var_614_51 + var_614_52 and arg_611_1.time_ < var_614_51 + var_614_52 + arg_614_0 then
				arg_611_1.typewritter.percent = 1

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(true)
			end
		end
	end,
	Play115311151 = function(arg_617_0, arg_617_1)
		arg_617_1.time_ = 0
		arg_617_1.frameCnt_ = 0
		arg_617_1.state_ = "playing"
		arg_617_1.curTalkId_ = 115311151
		arg_617_1.duration_ = 10.866

		local var_617_0 = {
			ja = 10.866,
			ko = 7,
			zh = 7.2,
			en = 7.166
		}
		local var_617_1 = manager.audio:GetLocalizationFlag()

		if var_617_0[var_617_1] ~= nil then
			arg_617_1.duration_ = var_617_0[var_617_1]
		end

		SetActive(arg_617_1.tipsGo_, false)

		function arg_617_1.onSingleLineFinish_()
			arg_617_1.onSingleLineUpdate_ = nil
			arg_617_1.onSingleLineFinish_ = nil
			arg_617_1.state_ = "waiting"
		end

		function arg_617_1.playNext_(arg_619_0)
			if arg_619_0 == 1 then
				arg_617_0:Play115311152(arg_617_1)
			end
		end

		function arg_617_1.onSingleLineUpdate_(arg_620_0)
			local var_620_0 = arg_617_1.actors_["10030"]
			local var_620_1 = 0

			if var_620_1 < arg_617_1.time_ and arg_617_1.time_ <= var_620_1 + arg_620_0 then
				local var_620_2 = var_620_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_620_2 then
					arg_617_1.var_.alphaOldValue10030 = var_620_2.alpha
					arg_617_1.var_.characterEffect10030 = var_620_2
				end

				arg_617_1.var_.alphaOldValue10030 = 0
			end

			local var_620_3 = 0.5

			if var_620_1 <= arg_617_1.time_ and arg_617_1.time_ < var_620_1 + var_620_3 then
				local var_620_4 = (arg_617_1.time_ - var_620_1) / var_620_3
				local var_620_5 = Mathf.Lerp(arg_617_1.var_.alphaOldValue10030, 1, var_620_4)

				if arg_617_1.var_.characterEffect10030 then
					arg_617_1.var_.characterEffect10030.alpha = var_620_5
				end
			end

			if arg_617_1.time_ >= var_620_1 + var_620_3 and arg_617_1.time_ < var_620_1 + var_620_3 + arg_620_0 and arg_617_1.var_.characterEffect10030 then
				arg_617_1.var_.characterEffect10030.alpha = 1
			end

			local var_620_6 = arg_617_1.actors_["10030"]
			local var_620_7 = 0

			if var_620_7 < arg_617_1.time_ and arg_617_1.time_ <= var_620_7 + arg_620_0 and arg_617_1.var_.actorSpriteComps10030 == nil then
				arg_617_1.var_.actorSpriteComps10030 = var_620_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_620_8 = 0.2

			if var_620_7 <= arg_617_1.time_ and arg_617_1.time_ < var_620_7 + var_620_8 then
				local var_620_9 = (arg_617_1.time_ - var_620_7) / var_620_8

				if arg_617_1.var_.actorSpriteComps10030 then
					for iter_620_0, iter_620_1 in pairs(arg_617_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_620_1 then
							local var_620_10 = Mathf.Lerp(iter_620_1.color.r, 1, var_620_9)

							iter_620_1.color = Color.New(var_620_10, var_620_10, var_620_10)
						end
					end
				end
			end

			if arg_617_1.time_ >= var_620_7 + var_620_8 and arg_617_1.time_ < var_620_7 + var_620_8 + arg_620_0 and arg_617_1.var_.actorSpriteComps10030 then
				local var_620_11 = 1

				for iter_620_2, iter_620_3 in pairs(arg_617_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_620_3 then
						iter_620_3.color = Color.New(var_620_11, var_620_11, var_620_11)
					end
				end

				arg_617_1.var_.actorSpriteComps10030 = nil
			end

			local var_620_12 = arg_617_1.actors_["10030"].transform
			local var_620_13 = 0

			if var_620_13 < arg_617_1.time_ and arg_617_1.time_ <= var_620_13 + arg_620_0 then
				arg_617_1.var_.moveOldPos10030 = var_620_12.localPosition
				var_620_12.localScale = Vector3.New(1, 1, 1)

				arg_617_1:CheckSpriteTmpPos("10030", 4)

				local var_620_14 = var_620_12.childCount

				for iter_620_4 = 0, var_620_14 - 1 do
					local var_620_15 = var_620_12:GetChild(iter_620_4)

					if var_620_15.name == "split_1" or not string.find(var_620_15.name, "split") then
						var_620_15.gameObject:SetActive(true)
					else
						var_620_15.gameObject:SetActive(false)
					end
				end
			end

			local var_620_16 = 0.001

			if var_620_13 <= arg_617_1.time_ and arg_617_1.time_ < var_620_13 + var_620_16 then
				local var_620_17 = (arg_617_1.time_ - var_620_13) / var_620_16
				local var_620_18 = Vector3.New(390, -390, 150)

				var_620_12.localPosition = Vector3.Lerp(arg_617_1.var_.moveOldPos10030, var_620_18, var_620_17)
			end

			if arg_617_1.time_ >= var_620_13 + var_620_16 and arg_617_1.time_ < var_620_13 + var_620_16 + arg_620_0 then
				var_620_12.localPosition = Vector3.New(390, -390, 150)
			end

			local var_620_19 = 0
			local var_620_20 = 1

			if var_620_19 < arg_617_1.time_ and arg_617_1.time_ <= var_620_19 + arg_620_0 then
				local var_620_21 = "play"
				local var_620_22 = "music"

				arg_617_1:AudioAction(var_620_21, var_620_22, "bgm_side_daily03", "bgm_side_daily03", "bgm_side_daily03.awb")
			end

			local var_620_23 = 0
			local var_620_24 = 0.85

			if var_620_23 < arg_617_1.time_ and arg_617_1.time_ <= var_620_23 + arg_620_0 then
				arg_617_1.talkMaxDuration = 0
				arg_617_1.dialogCg_.alpha = 1

				arg_617_1.dialog_:SetActive(true)
				SetActive(arg_617_1.leftNameGo_, true)

				local var_620_25 = arg_617_1:FormatText(StoryNameCfg[309].name)

				arg_617_1.leftNameTxt_.text = var_620_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_617_1.leftNameTxt_.transform)

				arg_617_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_617_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_617_1:RecordName(arg_617_1.leftNameTxt_.text)
				SetActive(arg_617_1.iconTrs_.gameObject, false)
				arg_617_1.callingController_:SetSelectedState("normal")

				local var_620_26 = arg_617_1:GetWordFromCfg(115311151)
				local var_620_27 = arg_617_1:FormatText(var_620_26.content)

				arg_617_1.text_.text = var_620_27

				LuaForUtil.ClearLinePrefixSymbol(arg_617_1.text_)

				local var_620_28 = 34
				local var_620_29 = utf8.len(var_620_27)
				local var_620_30 = var_620_28 <= 0 and var_620_24 or var_620_24 * (var_620_29 / var_620_28)

				if var_620_30 > 0 and var_620_24 < var_620_30 then
					arg_617_1.talkMaxDuration = var_620_30

					if var_620_30 + var_620_23 > arg_617_1.duration_ then
						arg_617_1.duration_ = var_620_30 + var_620_23
					end
				end

				arg_617_1.text_.text = var_620_27
				arg_617_1.typewritter.percent = 0

				arg_617_1.typewritter:SetDirty()
				arg_617_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311151", "story_v_out_115311.awb") ~= 0 then
					local var_620_31 = manager.audio:GetVoiceLength("story_v_out_115311", "115311151", "story_v_out_115311.awb") / 1000

					if var_620_31 + var_620_23 > arg_617_1.duration_ then
						arg_617_1.duration_ = var_620_31 + var_620_23
					end

					if var_620_26.prefab_name ~= "" and arg_617_1.actors_[var_620_26.prefab_name] ~= nil then
						local var_620_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_617_1.actors_[var_620_26.prefab_name].transform, "story_v_out_115311", "115311151", "story_v_out_115311.awb")

						arg_617_1:RecordAudio("115311151", var_620_32)
						arg_617_1:RecordAudio("115311151", var_620_32)
					else
						arg_617_1:AudioAction("play", "voice", "story_v_out_115311", "115311151", "story_v_out_115311.awb")
					end

					arg_617_1:RecordHistoryTalkVoice("story_v_out_115311", "115311151", "story_v_out_115311.awb")
				end

				arg_617_1:RecordContent(arg_617_1.text_.text)
			end

			local var_620_33 = math.max(var_620_24, arg_617_1.talkMaxDuration)

			if var_620_23 <= arg_617_1.time_ and arg_617_1.time_ < var_620_23 + var_620_33 then
				arg_617_1.typewritter.percent = (arg_617_1.time_ - var_620_23) / var_620_33

				arg_617_1.typewritter:SetDirty()
			end

			if arg_617_1.time_ >= var_620_23 + var_620_33 and arg_617_1.time_ < var_620_23 + var_620_33 + arg_620_0 then
				arg_617_1.typewritter.percent = 1

				arg_617_1.typewritter:SetDirty()
				arg_617_1:ShowNextGo(true)
			end
		end
	end,
	Play115311152 = function(arg_621_0, arg_621_1)
		arg_621_1.time_ = 0
		arg_621_1.frameCnt_ = 0
		arg_621_1.state_ = "playing"
		arg_621_1.curTalkId_ = 115311152
		arg_621_1.duration_ = 12.366

		local var_621_0 = {
			ja = 9.8,
			ko = 10.666,
			zh = 11.4,
			en = 12.366
		}
		local var_621_1 = manager.audio:GetLocalizationFlag()

		if var_621_0[var_621_1] ~= nil then
			arg_621_1.duration_ = var_621_0[var_621_1]
		end

		SetActive(arg_621_1.tipsGo_, false)

		function arg_621_1.onSingleLineFinish_()
			arg_621_1.onSingleLineUpdate_ = nil
			arg_621_1.onSingleLineFinish_ = nil
			arg_621_1.state_ = "waiting"
		end

		function arg_621_1.playNext_(arg_623_0)
			if arg_623_0 == 1 then
				arg_621_0:Play115311153(arg_621_1)
			end
		end

		function arg_621_1.onSingleLineUpdate_(arg_624_0)
			local var_624_0 = arg_621_1.actors_["10030"]
			local var_624_1 = 0

			if var_624_1 < arg_621_1.time_ and arg_621_1.time_ <= var_624_1 + arg_624_0 and arg_621_1.var_.actorSpriteComps10030 == nil then
				arg_621_1.var_.actorSpriteComps10030 = var_624_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_624_2 = 0.2

			if var_624_1 <= arg_621_1.time_ and arg_621_1.time_ < var_624_1 + var_624_2 then
				local var_624_3 = (arg_621_1.time_ - var_624_1) / var_624_2

				if arg_621_1.var_.actorSpriteComps10030 then
					for iter_624_0, iter_624_1 in pairs(arg_621_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_624_1 then
							local var_624_4 = Mathf.Lerp(iter_624_1.color.r, 0.5, var_624_3)

							iter_624_1.color = Color.New(var_624_4, var_624_4, var_624_4)
						end
					end
				end
			end

			if arg_621_1.time_ >= var_624_1 + var_624_2 and arg_621_1.time_ < var_624_1 + var_624_2 + arg_624_0 and arg_621_1.var_.actorSpriteComps10030 then
				local var_624_5 = 0.5

				for iter_624_2, iter_624_3 in pairs(arg_621_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_624_3 then
						iter_624_3.color = Color.New(var_624_5, var_624_5, var_624_5)
					end
				end

				arg_621_1.var_.actorSpriteComps10030 = nil
			end

			local var_624_6 = "1038"

			if arg_621_1.actors_[var_624_6] == nil then
				local var_624_7 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_624_6), arg_621_1.canvasGo_.transform)

				var_624_7.transform:SetSiblingIndex(1)

				var_624_7.name = var_624_6
				var_624_7.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_621_1.actors_[var_624_6] = var_624_7
			end

			local var_624_8 = arg_621_1.actors_["1038"].transform
			local var_624_9 = 0

			if var_624_9 < arg_621_1.time_ and arg_621_1.time_ <= var_624_9 + arg_624_0 then
				arg_621_1.var_.moveOldPos1038 = var_624_8.localPosition
				var_624_8.localScale = Vector3.New(1, 1, 1)

				arg_621_1:CheckSpriteTmpPos("1038", 2)

				local var_624_10 = var_624_8.childCount

				for iter_624_4 = 0, var_624_10 - 1 do
					local var_624_11 = var_624_8:GetChild(iter_624_4)

					if var_624_11.name == "split_1" or not string.find(var_624_11.name, "split") then
						var_624_11.gameObject:SetActive(true)
					else
						var_624_11.gameObject:SetActive(false)
					end
				end
			end

			local var_624_12 = 0.001

			if var_624_9 <= arg_621_1.time_ and arg_621_1.time_ < var_624_9 + var_624_12 then
				local var_624_13 = (arg_621_1.time_ - var_624_9) / var_624_12
				local var_624_14 = Vector3.New(-390, -400, 0)

				var_624_8.localPosition = Vector3.Lerp(arg_621_1.var_.moveOldPos1038, var_624_14, var_624_13)
			end

			if arg_621_1.time_ >= var_624_9 + var_624_12 and arg_621_1.time_ < var_624_9 + var_624_12 + arg_624_0 then
				var_624_8.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_624_15 = arg_621_1.actors_["1038"]
			local var_624_16 = 0

			if var_624_16 < arg_621_1.time_ and arg_621_1.time_ <= var_624_16 + arg_624_0 then
				local var_624_17 = var_624_15:GetComponentInChildren(typeof(CanvasGroup))

				if var_624_17 then
					arg_621_1.var_.alphaOldValue1038 = var_624_17.alpha
					arg_621_1.var_.characterEffect1038 = var_624_17
				end

				arg_621_1.var_.alphaOldValue1038 = 0
			end

			local var_624_18 = 0.5

			if var_624_16 <= arg_621_1.time_ and arg_621_1.time_ < var_624_16 + var_624_18 then
				local var_624_19 = (arg_621_1.time_ - var_624_16) / var_624_18
				local var_624_20 = Mathf.Lerp(arg_621_1.var_.alphaOldValue1038, 1, var_624_19)

				if arg_621_1.var_.characterEffect1038 then
					arg_621_1.var_.characterEffect1038.alpha = var_624_20
				end
			end

			if arg_621_1.time_ >= var_624_16 + var_624_18 and arg_621_1.time_ < var_624_16 + var_624_18 + arg_624_0 and arg_621_1.var_.characterEffect1038 then
				arg_621_1.var_.characterEffect1038.alpha = 1
			end

			local var_624_21 = arg_621_1.actors_["1038"]
			local var_624_22 = 0

			if var_624_22 < arg_621_1.time_ and arg_621_1.time_ <= var_624_22 + arg_624_0 and arg_621_1.var_.actorSpriteComps1038 == nil then
				arg_621_1.var_.actorSpriteComps1038 = var_624_21:GetComponentsInChildren(typeof(Image), true)
			end

			local var_624_23 = 0.2

			if var_624_22 <= arg_621_1.time_ and arg_621_1.time_ < var_624_22 + var_624_23 then
				local var_624_24 = (arg_621_1.time_ - var_624_22) / var_624_23

				if arg_621_1.var_.actorSpriteComps1038 then
					for iter_624_5, iter_624_6 in pairs(arg_621_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_624_6 then
							local var_624_25 = Mathf.Lerp(iter_624_6.color.r, 1, var_624_24)

							iter_624_6.color = Color.New(var_624_25, var_624_25, var_624_25)
						end
					end
				end
			end

			if arg_621_1.time_ >= var_624_22 + var_624_23 and arg_621_1.time_ < var_624_22 + var_624_23 + arg_624_0 and arg_621_1.var_.actorSpriteComps1038 then
				local var_624_26 = 1

				for iter_624_7, iter_624_8 in pairs(arg_621_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_624_8 then
						iter_624_8.color = Color.New(var_624_26, var_624_26, var_624_26)
					end
				end

				arg_621_1.var_.actorSpriteComps1038 = nil
			end

			local var_624_27 = 0
			local var_624_28 = 1.05

			if var_624_27 < arg_621_1.time_ and arg_621_1.time_ <= var_624_27 + arg_624_0 then
				arg_621_1.talkMaxDuration = 0
				arg_621_1.dialogCg_.alpha = 1

				arg_621_1.dialog_:SetActive(true)
				SetActive(arg_621_1.leftNameGo_, true)

				local var_624_29 = arg_621_1:FormatText(StoryNameCfg[94].name)

				arg_621_1.leftNameTxt_.text = var_624_29

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_621_1.leftNameTxt_.transform)

				arg_621_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_621_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_621_1:RecordName(arg_621_1.leftNameTxt_.text)
				SetActive(arg_621_1.iconTrs_.gameObject, false)
				arg_621_1.callingController_:SetSelectedState("normal")

				local var_624_30 = arg_621_1:GetWordFromCfg(115311152)
				local var_624_31 = arg_621_1:FormatText(var_624_30.content)

				arg_621_1.text_.text = var_624_31

				LuaForUtil.ClearLinePrefixSymbol(arg_621_1.text_)

				local var_624_32 = 42
				local var_624_33 = utf8.len(var_624_31)
				local var_624_34 = var_624_32 <= 0 and var_624_28 or var_624_28 * (var_624_33 / var_624_32)

				if var_624_34 > 0 and var_624_28 < var_624_34 then
					arg_621_1.talkMaxDuration = var_624_34

					if var_624_34 + var_624_27 > arg_621_1.duration_ then
						arg_621_1.duration_ = var_624_34 + var_624_27
					end
				end

				arg_621_1.text_.text = var_624_31
				arg_621_1.typewritter.percent = 0

				arg_621_1.typewritter:SetDirty()
				arg_621_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311152", "story_v_out_115311.awb") ~= 0 then
					local var_624_35 = manager.audio:GetVoiceLength("story_v_out_115311", "115311152", "story_v_out_115311.awb") / 1000

					if var_624_35 + var_624_27 > arg_621_1.duration_ then
						arg_621_1.duration_ = var_624_35 + var_624_27
					end

					if var_624_30.prefab_name ~= "" and arg_621_1.actors_[var_624_30.prefab_name] ~= nil then
						local var_624_36 = LuaForUtil.PlayVoiceWithCriLipsync(arg_621_1.actors_[var_624_30.prefab_name].transform, "story_v_out_115311", "115311152", "story_v_out_115311.awb")

						arg_621_1:RecordAudio("115311152", var_624_36)
						arg_621_1:RecordAudio("115311152", var_624_36)
					else
						arg_621_1:AudioAction("play", "voice", "story_v_out_115311", "115311152", "story_v_out_115311.awb")
					end

					arg_621_1:RecordHistoryTalkVoice("story_v_out_115311", "115311152", "story_v_out_115311.awb")
				end

				arg_621_1:RecordContent(arg_621_1.text_.text)
			end

			local var_624_37 = math.max(var_624_28, arg_621_1.talkMaxDuration)

			if var_624_27 <= arg_621_1.time_ and arg_621_1.time_ < var_624_27 + var_624_37 then
				arg_621_1.typewritter.percent = (arg_621_1.time_ - var_624_27) / var_624_37

				arg_621_1.typewritter:SetDirty()
			end

			if arg_621_1.time_ >= var_624_27 + var_624_37 and arg_621_1.time_ < var_624_27 + var_624_37 + arg_624_0 then
				arg_621_1.typewritter.percent = 1

				arg_621_1.typewritter:SetDirty()
				arg_621_1:ShowNextGo(true)
			end
		end
	end,
	Play115311153 = function(arg_625_0, arg_625_1)
		arg_625_1.time_ = 0
		arg_625_1.frameCnt_ = 0
		arg_625_1.state_ = "playing"
		arg_625_1.curTalkId_ = 115311153
		arg_625_1.duration_ = 13.166

		local var_625_0 = {
			ja = 12.666,
			ko = 9.633,
			zh = 13.166,
			en = 10.566
		}
		local var_625_1 = manager.audio:GetLocalizationFlag()

		if var_625_0[var_625_1] ~= nil then
			arg_625_1.duration_ = var_625_0[var_625_1]
		end

		SetActive(arg_625_1.tipsGo_, false)

		function arg_625_1.onSingleLineFinish_()
			arg_625_1.onSingleLineUpdate_ = nil
			arg_625_1.onSingleLineFinish_ = nil
			arg_625_1.state_ = "waiting"
		end

		function arg_625_1.playNext_(arg_627_0)
			if arg_627_0 == 1 then
				arg_625_0:Play115311154(arg_625_1)
			end
		end

		function arg_625_1.onSingleLineUpdate_(arg_628_0)
			local var_628_0 = 0
			local var_628_1 = 1.25

			if var_628_0 < arg_625_1.time_ and arg_625_1.time_ <= var_628_0 + arg_628_0 then
				arg_625_1.talkMaxDuration = 0
				arg_625_1.dialogCg_.alpha = 1

				arg_625_1.dialog_:SetActive(true)
				SetActive(arg_625_1.leftNameGo_, true)

				local var_628_2 = arg_625_1:FormatText(StoryNameCfg[94].name)

				arg_625_1.leftNameTxt_.text = var_628_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_625_1.leftNameTxt_.transform)

				arg_625_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_625_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_625_1:RecordName(arg_625_1.leftNameTxt_.text)
				SetActive(arg_625_1.iconTrs_.gameObject, false)
				arg_625_1.callingController_:SetSelectedState("normal")

				local var_628_3 = arg_625_1:GetWordFromCfg(115311153)
				local var_628_4 = arg_625_1:FormatText(var_628_3.content)

				arg_625_1.text_.text = var_628_4

				LuaForUtil.ClearLinePrefixSymbol(arg_625_1.text_)

				local var_628_5 = 50
				local var_628_6 = utf8.len(var_628_4)
				local var_628_7 = var_628_5 <= 0 and var_628_1 or var_628_1 * (var_628_6 / var_628_5)

				if var_628_7 > 0 and var_628_1 < var_628_7 then
					arg_625_1.talkMaxDuration = var_628_7

					if var_628_7 + var_628_0 > arg_625_1.duration_ then
						arg_625_1.duration_ = var_628_7 + var_628_0
					end
				end

				arg_625_1.text_.text = var_628_4
				arg_625_1.typewritter.percent = 0

				arg_625_1.typewritter:SetDirty()
				arg_625_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311153", "story_v_out_115311.awb") ~= 0 then
					local var_628_8 = manager.audio:GetVoiceLength("story_v_out_115311", "115311153", "story_v_out_115311.awb") / 1000

					if var_628_8 + var_628_0 > arg_625_1.duration_ then
						arg_625_1.duration_ = var_628_8 + var_628_0
					end

					if var_628_3.prefab_name ~= "" and arg_625_1.actors_[var_628_3.prefab_name] ~= nil then
						local var_628_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_625_1.actors_[var_628_3.prefab_name].transform, "story_v_out_115311", "115311153", "story_v_out_115311.awb")

						arg_625_1:RecordAudio("115311153", var_628_9)
						arg_625_1:RecordAudio("115311153", var_628_9)
					else
						arg_625_1:AudioAction("play", "voice", "story_v_out_115311", "115311153", "story_v_out_115311.awb")
					end

					arg_625_1:RecordHistoryTalkVoice("story_v_out_115311", "115311153", "story_v_out_115311.awb")
				end

				arg_625_1:RecordContent(arg_625_1.text_.text)
			end

			local var_628_10 = math.max(var_628_1, arg_625_1.talkMaxDuration)

			if var_628_0 <= arg_625_1.time_ and arg_625_1.time_ < var_628_0 + var_628_10 then
				arg_625_1.typewritter.percent = (arg_625_1.time_ - var_628_0) / var_628_10

				arg_625_1.typewritter:SetDirty()
			end

			if arg_625_1.time_ >= var_628_0 + var_628_10 and arg_625_1.time_ < var_628_0 + var_628_10 + arg_628_0 then
				arg_625_1.typewritter.percent = 1

				arg_625_1.typewritter:SetDirty()
				arg_625_1:ShowNextGo(true)
			end
		end
	end,
	Play115311154 = function(arg_629_0, arg_629_1)
		arg_629_1.time_ = 0
		arg_629_1.frameCnt_ = 0
		arg_629_1.state_ = "playing"
		arg_629_1.curTalkId_ = 115311154
		arg_629_1.duration_ = 5

		SetActive(arg_629_1.tipsGo_, false)

		function arg_629_1.onSingleLineFinish_()
			arg_629_1.onSingleLineUpdate_ = nil
			arg_629_1.onSingleLineFinish_ = nil
			arg_629_1.state_ = "waiting"
		end

		function arg_629_1.playNext_(arg_631_0)
			if arg_631_0 == 1 then
				arg_629_0:Play115311155(arg_629_1)
			end
		end

		function arg_629_1.onSingleLineUpdate_(arg_632_0)
			local var_632_0 = arg_629_1.actors_["10030"]
			local var_632_1 = 0

			if var_632_1 < arg_629_1.time_ and arg_629_1.time_ <= var_632_1 + arg_632_0 then
				local var_632_2 = var_632_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_632_2 then
					arg_629_1.var_.alphaOldValue10030 = var_632_2.alpha
					arg_629_1.var_.characterEffect10030 = var_632_2
				end

				arg_629_1.var_.alphaOldValue10030 = 1
			end

			local var_632_3 = 0.5

			if var_632_1 <= arg_629_1.time_ and arg_629_1.time_ < var_632_1 + var_632_3 then
				local var_632_4 = (arg_629_1.time_ - var_632_1) / var_632_3
				local var_632_5 = Mathf.Lerp(arg_629_1.var_.alphaOldValue10030, 0, var_632_4)

				if arg_629_1.var_.characterEffect10030 then
					arg_629_1.var_.characterEffect10030.alpha = var_632_5
				end
			end

			if arg_629_1.time_ >= var_632_1 + var_632_3 and arg_629_1.time_ < var_632_1 + var_632_3 + arg_632_0 and arg_629_1.var_.characterEffect10030 then
				arg_629_1.var_.characterEffect10030.alpha = 0
			end

			local var_632_6 = arg_629_1.actors_["1038"]
			local var_632_7 = 0

			if var_632_7 < arg_629_1.time_ and arg_629_1.time_ <= var_632_7 + arg_632_0 then
				local var_632_8 = var_632_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_632_8 then
					arg_629_1.var_.alphaOldValue1038 = var_632_8.alpha
					arg_629_1.var_.characterEffect1038 = var_632_8
				end

				arg_629_1.var_.alphaOldValue1038 = 1
			end

			local var_632_9 = 0.5

			if var_632_7 <= arg_629_1.time_ and arg_629_1.time_ < var_632_7 + var_632_9 then
				local var_632_10 = (arg_629_1.time_ - var_632_7) / var_632_9
				local var_632_11 = Mathf.Lerp(arg_629_1.var_.alphaOldValue1038, 0, var_632_10)

				if arg_629_1.var_.characterEffect1038 then
					arg_629_1.var_.characterEffect1038.alpha = var_632_11
				end
			end

			if arg_629_1.time_ >= var_632_7 + var_632_9 and arg_629_1.time_ < var_632_7 + var_632_9 + arg_632_0 and arg_629_1.var_.characterEffect1038 then
				arg_629_1.var_.characterEffect1038.alpha = 0
			end

			local var_632_12 = 0
			local var_632_13 = 1.425

			if var_632_12 < arg_629_1.time_ and arg_629_1.time_ <= var_632_12 + arg_632_0 then
				arg_629_1.talkMaxDuration = 0
				arg_629_1.dialogCg_.alpha = 1

				arg_629_1.dialog_:SetActive(true)
				SetActive(arg_629_1.leftNameGo_, false)

				arg_629_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_629_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_629_1:RecordName(arg_629_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_629_1.iconTrs_.gameObject, false)
				arg_629_1.callingController_:SetSelectedState("normal")

				local var_632_14 = arg_629_1:GetWordFromCfg(115311154)
				local var_632_15 = arg_629_1:FormatText(var_632_14.content)

				arg_629_1.text_.text = var_632_15

				LuaForUtil.ClearLinePrefixSymbol(arg_629_1.text_)

				local var_632_16 = 57
				local var_632_17 = utf8.len(var_632_15)
				local var_632_18 = var_632_16 <= 0 and var_632_13 or var_632_13 * (var_632_17 / var_632_16)

				if var_632_18 > 0 and var_632_13 < var_632_18 then
					arg_629_1.talkMaxDuration = var_632_18

					if var_632_18 + var_632_12 > arg_629_1.duration_ then
						arg_629_1.duration_ = var_632_18 + var_632_12
					end
				end

				arg_629_1.text_.text = var_632_15
				arg_629_1.typewritter.percent = 0

				arg_629_1.typewritter:SetDirty()
				arg_629_1:ShowNextGo(false)
				arg_629_1:RecordContent(arg_629_1.text_.text)
			end

			local var_632_19 = math.max(var_632_13, arg_629_1.talkMaxDuration)

			if var_632_12 <= arg_629_1.time_ and arg_629_1.time_ < var_632_12 + var_632_19 then
				arg_629_1.typewritter.percent = (arg_629_1.time_ - var_632_12) / var_632_19

				arg_629_1.typewritter:SetDirty()
			end

			if arg_629_1.time_ >= var_632_12 + var_632_19 and arg_629_1.time_ < var_632_12 + var_632_19 + arg_632_0 then
				arg_629_1.typewritter.percent = 1

				arg_629_1.typewritter:SetDirty()
				arg_629_1:ShowNextGo(true)
			end
		end
	end,
	Play115311155 = function(arg_633_0, arg_633_1)
		arg_633_1.time_ = 0
		arg_633_1.frameCnt_ = 0
		arg_633_1.state_ = "playing"
		arg_633_1.curTalkId_ = 115311155
		arg_633_1.duration_ = 5

		SetActive(arg_633_1.tipsGo_, false)

		function arg_633_1.onSingleLineFinish_()
			arg_633_1.onSingleLineUpdate_ = nil
			arg_633_1.onSingleLineFinish_ = nil
			arg_633_1.state_ = "waiting"
		end

		function arg_633_1.playNext_(arg_635_0)
			if arg_635_0 == 1 then
				arg_633_0:Play115311156(arg_633_1)
			end
		end

		function arg_633_1.onSingleLineUpdate_(arg_636_0)
			local var_636_0 = 0
			local var_636_1 = 0.9

			if var_636_0 < arg_633_1.time_ and arg_633_1.time_ <= var_636_0 + arg_636_0 then
				arg_633_1.talkMaxDuration = 0
				arg_633_1.dialogCg_.alpha = 1

				arg_633_1.dialog_:SetActive(true)
				SetActive(arg_633_1.leftNameGo_, false)

				arg_633_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_633_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_633_1:RecordName(arg_633_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_633_1.iconTrs_.gameObject, false)
				arg_633_1.callingController_:SetSelectedState("normal")

				local var_636_2 = arg_633_1:GetWordFromCfg(115311155)
				local var_636_3 = arg_633_1:FormatText(var_636_2.content)

				arg_633_1.text_.text = var_636_3

				LuaForUtil.ClearLinePrefixSymbol(arg_633_1.text_)

				local var_636_4 = 36
				local var_636_5 = utf8.len(var_636_3)
				local var_636_6 = var_636_4 <= 0 and var_636_1 or var_636_1 * (var_636_5 / var_636_4)

				if var_636_6 > 0 and var_636_1 < var_636_6 then
					arg_633_1.talkMaxDuration = var_636_6

					if var_636_6 + var_636_0 > arg_633_1.duration_ then
						arg_633_1.duration_ = var_636_6 + var_636_0
					end
				end

				arg_633_1.text_.text = var_636_3
				arg_633_1.typewritter.percent = 0

				arg_633_1.typewritter:SetDirty()
				arg_633_1:ShowNextGo(false)
				arg_633_1:RecordContent(arg_633_1.text_.text)
			end

			local var_636_7 = math.max(var_636_1, arg_633_1.talkMaxDuration)

			if var_636_0 <= arg_633_1.time_ and arg_633_1.time_ < var_636_0 + var_636_7 then
				arg_633_1.typewritter.percent = (arg_633_1.time_ - var_636_0) / var_636_7

				arg_633_1.typewritter:SetDirty()
			end

			if arg_633_1.time_ >= var_636_0 + var_636_7 and arg_633_1.time_ < var_636_0 + var_636_7 + arg_636_0 then
				arg_633_1.typewritter.percent = 1

				arg_633_1.typewritter:SetDirty()
				arg_633_1:ShowNextGo(true)
			end
		end
	end,
	Play115311156 = function(arg_637_0, arg_637_1)
		arg_637_1.time_ = 0
		arg_637_1.frameCnt_ = 0
		arg_637_1.state_ = "playing"
		arg_637_1.curTalkId_ = 115311156
		arg_637_1.duration_ = 7.933

		local var_637_0 = {
			ja = 7.933,
			ko = 4,
			zh = 3.3,
			en = 4.066
		}
		local var_637_1 = manager.audio:GetLocalizationFlag()

		if var_637_0[var_637_1] ~= nil then
			arg_637_1.duration_ = var_637_0[var_637_1]
		end

		SetActive(arg_637_1.tipsGo_, false)

		function arg_637_1.onSingleLineFinish_()
			arg_637_1.onSingleLineUpdate_ = nil
			arg_637_1.onSingleLineFinish_ = nil
			arg_637_1.state_ = "waiting"
		end

		function arg_637_1.playNext_(arg_639_0)
			if arg_639_0 == 1 then
				arg_637_0:Play115311157(arg_637_1)
			end
		end

		function arg_637_1.onSingleLineUpdate_(arg_640_0)
			local var_640_0 = arg_637_1.actors_["10030"]
			local var_640_1 = 0

			if var_640_1 < arg_637_1.time_ and arg_637_1.time_ <= var_640_1 + arg_640_0 then
				local var_640_2 = var_640_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_640_2 then
					arg_637_1.var_.alphaOldValue10030 = var_640_2.alpha
					arg_637_1.var_.characterEffect10030 = var_640_2
				end

				arg_637_1.var_.alphaOldValue10030 = 0
			end

			local var_640_3 = 0.5

			if var_640_1 <= arg_637_1.time_ and arg_637_1.time_ < var_640_1 + var_640_3 then
				local var_640_4 = (arg_637_1.time_ - var_640_1) / var_640_3
				local var_640_5 = Mathf.Lerp(arg_637_1.var_.alphaOldValue10030, 1, var_640_4)

				if arg_637_1.var_.characterEffect10030 then
					arg_637_1.var_.characterEffect10030.alpha = var_640_5
				end
			end

			if arg_637_1.time_ >= var_640_1 + var_640_3 and arg_637_1.time_ < var_640_1 + var_640_3 + arg_640_0 and arg_637_1.var_.characterEffect10030 then
				arg_637_1.var_.characterEffect10030.alpha = 1
			end

			local var_640_6 = arg_637_1.actors_["1038"]
			local var_640_7 = 0

			if var_640_7 < arg_637_1.time_ and arg_637_1.time_ <= var_640_7 + arg_640_0 then
				local var_640_8 = var_640_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_640_8 then
					arg_637_1.var_.alphaOldValue1038 = var_640_8.alpha
					arg_637_1.var_.characterEffect1038 = var_640_8
				end

				arg_637_1.var_.alphaOldValue1038 = 0
			end

			local var_640_9 = 0.5

			if var_640_7 <= arg_637_1.time_ and arg_637_1.time_ < var_640_7 + var_640_9 then
				local var_640_10 = (arg_637_1.time_ - var_640_7) / var_640_9
				local var_640_11 = Mathf.Lerp(arg_637_1.var_.alphaOldValue1038, 1, var_640_10)

				if arg_637_1.var_.characterEffect1038 then
					arg_637_1.var_.characterEffect1038.alpha = var_640_11
				end
			end

			if arg_637_1.time_ >= var_640_7 + var_640_9 and arg_637_1.time_ < var_640_7 + var_640_9 + arg_640_0 and arg_637_1.var_.characterEffect1038 then
				arg_637_1.var_.characterEffect1038.alpha = 1
			end

			local var_640_12 = arg_637_1.actors_["10030"].transform
			local var_640_13 = 0

			if var_640_13 < arg_637_1.time_ and arg_637_1.time_ <= var_640_13 + arg_640_0 then
				arg_637_1.var_.moveOldPos10030 = var_640_12.localPosition
				var_640_12.localScale = Vector3.New(1, 1, 1)

				arg_637_1:CheckSpriteTmpPos("10030", 4)

				local var_640_14 = var_640_12.childCount

				for iter_640_0 = 0, var_640_14 - 1 do
					local var_640_15 = var_640_12:GetChild(iter_640_0)

					if var_640_15.name == "split_2" or not string.find(var_640_15.name, "split") then
						var_640_15.gameObject:SetActive(true)
					else
						var_640_15.gameObject:SetActive(false)
					end
				end
			end

			local var_640_16 = 0.001

			if var_640_13 <= arg_637_1.time_ and arg_637_1.time_ < var_640_13 + var_640_16 then
				local var_640_17 = (arg_637_1.time_ - var_640_13) / var_640_16
				local var_640_18 = Vector3.New(390, -390, 150)

				var_640_12.localPosition = Vector3.Lerp(arg_637_1.var_.moveOldPos10030, var_640_18, var_640_17)
			end

			if arg_637_1.time_ >= var_640_13 + var_640_16 and arg_637_1.time_ < var_640_13 + var_640_16 + arg_640_0 then
				var_640_12.localPosition = Vector3.New(390, -390, 150)
			end

			local var_640_19 = arg_637_1.actors_["10030"]
			local var_640_20 = 0

			if var_640_20 < arg_637_1.time_ and arg_637_1.time_ <= var_640_20 + arg_640_0 and arg_637_1.var_.actorSpriteComps10030 == nil then
				arg_637_1.var_.actorSpriteComps10030 = var_640_19:GetComponentsInChildren(typeof(Image), true)
			end

			local var_640_21 = 0.2

			if var_640_20 <= arg_637_1.time_ and arg_637_1.time_ < var_640_20 + var_640_21 then
				local var_640_22 = (arg_637_1.time_ - var_640_20) / var_640_21

				if arg_637_1.var_.actorSpriteComps10030 then
					for iter_640_1, iter_640_2 in pairs(arg_637_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_640_2 then
							local var_640_23 = Mathf.Lerp(iter_640_2.color.r, 1, var_640_22)

							iter_640_2.color = Color.New(var_640_23, var_640_23, var_640_23)
						end
					end
				end
			end

			if arg_637_1.time_ >= var_640_20 + var_640_21 and arg_637_1.time_ < var_640_20 + var_640_21 + arg_640_0 and arg_637_1.var_.actorSpriteComps10030 then
				local var_640_24 = 1

				for iter_640_3, iter_640_4 in pairs(arg_637_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_640_4 then
						iter_640_4.color = Color.New(var_640_24, var_640_24, var_640_24)
					end
				end

				arg_637_1.var_.actorSpriteComps10030 = nil
			end

			local var_640_25 = arg_637_1.actors_["1038"]
			local var_640_26 = 0

			if var_640_26 < arg_637_1.time_ and arg_637_1.time_ <= var_640_26 + arg_640_0 and arg_637_1.var_.actorSpriteComps1038 == nil then
				arg_637_1.var_.actorSpriteComps1038 = var_640_25:GetComponentsInChildren(typeof(Image), true)
			end

			local var_640_27 = 0.2

			if var_640_26 <= arg_637_1.time_ and arg_637_1.time_ < var_640_26 + var_640_27 then
				local var_640_28 = (arg_637_1.time_ - var_640_26) / var_640_27

				if arg_637_1.var_.actorSpriteComps1038 then
					for iter_640_5, iter_640_6 in pairs(arg_637_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_640_6 then
							local var_640_29 = Mathf.Lerp(iter_640_6.color.r, 0.5, var_640_28)

							iter_640_6.color = Color.New(var_640_29, var_640_29, var_640_29)
						end
					end
				end
			end

			if arg_637_1.time_ >= var_640_26 + var_640_27 and arg_637_1.time_ < var_640_26 + var_640_27 + arg_640_0 and arg_637_1.var_.actorSpriteComps1038 then
				local var_640_30 = 0.5

				for iter_640_7, iter_640_8 in pairs(arg_637_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_640_8 then
						iter_640_8.color = Color.New(var_640_30, var_640_30, var_640_30)
					end
				end

				arg_637_1.var_.actorSpriteComps1038 = nil
			end

			local var_640_31 = 0
			local var_640_32 = 0.35

			if var_640_31 < arg_637_1.time_ and arg_637_1.time_ <= var_640_31 + arg_640_0 then
				arg_637_1.talkMaxDuration = 0
				arg_637_1.dialogCg_.alpha = 1

				arg_637_1.dialog_:SetActive(true)
				SetActive(arg_637_1.leftNameGo_, true)

				local var_640_33 = arg_637_1:FormatText(StoryNameCfg[309].name)

				arg_637_1.leftNameTxt_.text = var_640_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_637_1.leftNameTxt_.transform)

				arg_637_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_637_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_637_1:RecordName(arg_637_1.leftNameTxt_.text)
				SetActive(arg_637_1.iconTrs_.gameObject, false)
				arg_637_1.callingController_:SetSelectedState("normal")

				local var_640_34 = arg_637_1:GetWordFromCfg(115311156)
				local var_640_35 = arg_637_1:FormatText(var_640_34.content)

				arg_637_1.text_.text = var_640_35

				LuaForUtil.ClearLinePrefixSymbol(arg_637_1.text_)

				local var_640_36 = 14
				local var_640_37 = utf8.len(var_640_35)
				local var_640_38 = var_640_36 <= 0 and var_640_32 or var_640_32 * (var_640_37 / var_640_36)

				if var_640_38 > 0 and var_640_32 < var_640_38 then
					arg_637_1.talkMaxDuration = var_640_38

					if var_640_38 + var_640_31 > arg_637_1.duration_ then
						arg_637_1.duration_ = var_640_38 + var_640_31
					end
				end

				arg_637_1.text_.text = var_640_35
				arg_637_1.typewritter.percent = 0

				arg_637_1.typewritter:SetDirty()
				arg_637_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311156", "story_v_out_115311.awb") ~= 0 then
					local var_640_39 = manager.audio:GetVoiceLength("story_v_out_115311", "115311156", "story_v_out_115311.awb") / 1000

					if var_640_39 + var_640_31 > arg_637_1.duration_ then
						arg_637_1.duration_ = var_640_39 + var_640_31
					end

					if var_640_34.prefab_name ~= "" and arg_637_1.actors_[var_640_34.prefab_name] ~= nil then
						local var_640_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_637_1.actors_[var_640_34.prefab_name].transform, "story_v_out_115311", "115311156", "story_v_out_115311.awb")

						arg_637_1:RecordAudio("115311156", var_640_40)
						arg_637_1:RecordAudio("115311156", var_640_40)
					else
						arg_637_1:AudioAction("play", "voice", "story_v_out_115311", "115311156", "story_v_out_115311.awb")
					end

					arg_637_1:RecordHistoryTalkVoice("story_v_out_115311", "115311156", "story_v_out_115311.awb")
				end

				arg_637_1:RecordContent(arg_637_1.text_.text)
			end

			local var_640_41 = math.max(var_640_32, arg_637_1.talkMaxDuration)

			if var_640_31 <= arg_637_1.time_ and arg_637_1.time_ < var_640_31 + var_640_41 then
				arg_637_1.typewritter.percent = (arg_637_1.time_ - var_640_31) / var_640_41

				arg_637_1.typewritter:SetDirty()
			end

			if arg_637_1.time_ >= var_640_31 + var_640_41 and arg_637_1.time_ < var_640_31 + var_640_41 + arg_640_0 then
				arg_637_1.typewritter.percent = 1

				arg_637_1.typewritter:SetDirty()
				arg_637_1:ShowNextGo(true)
			end
		end
	end,
	Play115311157 = function(arg_641_0, arg_641_1)
		arg_641_1.time_ = 0
		arg_641_1.frameCnt_ = 0
		arg_641_1.state_ = "playing"
		arg_641_1.curTalkId_ = 115311157
		arg_641_1.duration_ = 6.4

		local var_641_0 = {
			ja = 6.4,
			ko = 4.2,
			zh = 5.733,
			en = 5.8
		}
		local var_641_1 = manager.audio:GetLocalizationFlag()

		if var_641_0[var_641_1] ~= nil then
			arg_641_1.duration_ = var_641_0[var_641_1]
		end

		SetActive(arg_641_1.tipsGo_, false)

		function arg_641_1.onSingleLineFinish_()
			arg_641_1.onSingleLineUpdate_ = nil
			arg_641_1.onSingleLineFinish_ = nil
			arg_641_1.state_ = "waiting"
		end

		function arg_641_1.playNext_(arg_643_0)
			if arg_643_0 == 1 then
				arg_641_0:Play115311158(arg_641_1)
			end
		end

		function arg_641_1.onSingleLineUpdate_(arg_644_0)
			local var_644_0 = arg_641_1.actors_["10030"]
			local var_644_1 = 0

			if var_644_1 < arg_641_1.time_ and arg_641_1.time_ <= var_644_1 + arg_644_0 and arg_641_1.var_.actorSpriteComps10030 == nil then
				arg_641_1.var_.actorSpriteComps10030 = var_644_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_644_2 = 0.2

			if var_644_1 <= arg_641_1.time_ and arg_641_1.time_ < var_644_1 + var_644_2 then
				local var_644_3 = (arg_641_1.time_ - var_644_1) / var_644_2

				if arg_641_1.var_.actorSpriteComps10030 then
					for iter_644_0, iter_644_1 in pairs(arg_641_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_644_1 then
							local var_644_4 = Mathf.Lerp(iter_644_1.color.r, 0.5, var_644_3)

							iter_644_1.color = Color.New(var_644_4, var_644_4, var_644_4)
						end
					end
				end
			end

			if arg_641_1.time_ >= var_644_1 + var_644_2 and arg_641_1.time_ < var_644_1 + var_644_2 + arg_644_0 and arg_641_1.var_.actorSpriteComps10030 then
				local var_644_5 = 0.5

				for iter_644_2, iter_644_3 in pairs(arg_641_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_644_3 then
						iter_644_3.color = Color.New(var_644_5, var_644_5, var_644_5)
					end
				end

				arg_641_1.var_.actorSpriteComps10030 = nil
			end

			local var_644_6 = arg_641_1.actors_["1038"]
			local var_644_7 = 0

			if var_644_7 < arg_641_1.time_ and arg_641_1.time_ <= var_644_7 + arg_644_0 and arg_641_1.var_.actorSpriteComps1038 == nil then
				arg_641_1.var_.actorSpriteComps1038 = var_644_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_644_8 = 0.2

			if var_644_7 <= arg_641_1.time_ and arg_641_1.time_ < var_644_7 + var_644_8 then
				local var_644_9 = (arg_641_1.time_ - var_644_7) / var_644_8

				if arg_641_1.var_.actorSpriteComps1038 then
					for iter_644_4, iter_644_5 in pairs(arg_641_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_644_5 then
							local var_644_10 = Mathf.Lerp(iter_644_5.color.r, 1, var_644_9)

							iter_644_5.color = Color.New(var_644_10, var_644_10, var_644_10)
						end
					end
				end
			end

			if arg_641_1.time_ >= var_644_7 + var_644_8 and arg_641_1.time_ < var_644_7 + var_644_8 + arg_644_0 and arg_641_1.var_.actorSpriteComps1038 then
				local var_644_11 = 1

				for iter_644_6, iter_644_7 in pairs(arg_641_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_644_7 then
						iter_644_7.color = Color.New(var_644_11, var_644_11, var_644_11)
					end
				end

				arg_641_1.var_.actorSpriteComps1038 = nil
			end

			local var_644_12 = arg_641_1.actors_["1038"].transform
			local var_644_13 = 0

			if var_644_13 < arg_641_1.time_ and arg_641_1.time_ <= var_644_13 + arg_644_0 then
				arg_641_1.var_.moveOldPos1038 = var_644_12.localPosition
				var_644_12.localScale = Vector3.New(1, 1, 1)

				arg_641_1:CheckSpriteTmpPos("1038", 2)

				local var_644_14 = var_644_12.childCount

				for iter_644_8 = 0, var_644_14 - 1 do
					local var_644_15 = var_644_12:GetChild(iter_644_8)

					if var_644_15.name == "split_9" or not string.find(var_644_15.name, "split") then
						var_644_15.gameObject:SetActive(true)
					else
						var_644_15.gameObject:SetActive(false)
					end
				end
			end

			local var_644_16 = 0.001

			if var_644_13 <= arg_641_1.time_ and arg_641_1.time_ < var_644_13 + var_644_16 then
				local var_644_17 = (arg_641_1.time_ - var_644_13) / var_644_16
				local var_644_18 = Vector3.New(-390, -400, 0)

				var_644_12.localPosition = Vector3.Lerp(arg_641_1.var_.moveOldPos1038, var_644_18, var_644_17)
			end

			if arg_641_1.time_ >= var_644_13 + var_644_16 and arg_641_1.time_ < var_644_13 + var_644_16 + arg_644_0 then
				var_644_12.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_644_19 = 0
			local var_644_20 = 0.5

			if var_644_19 < arg_641_1.time_ and arg_641_1.time_ <= var_644_19 + arg_644_0 then
				arg_641_1.talkMaxDuration = 0
				arg_641_1.dialogCg_.alpha = 1

				arg_641_1.dialog_:SetActive(true)
				SetActive(arg_641_1.leftNameGo_, true)

				local var_644_21 = arg_641_1:FormatText(StoryNameCfg[94].name)

				arg_641_1.leftNameTxt_.text = var_644_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_641_1.leftNameTxt_.transform)

				arg_641_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_641_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_641_1:RecordName(arg_641_1.leftNameTxt_.text)
				SetActive(arg_641_1.iconTrs_.gameObject, false)
				arg_641_1.callingController_:SetSelectedState("normal")

				local var_644_22 = arg_641_1:GetWordFromCfg(115311157)
				local var_644_23 = arg_641_1:FormatText(var_644_22.content)

				arg_641_1.text_.text = var_644_23

				LuaForUtil.ClearLinePrefixSymbol(arg_641_1.text_)

				local var_644_24 = 20
				local var_644_25 = utf8.len(var_644_23)
				local var_644_26 = var_644_24 <= 0 and var_644_20 or var_644_20 * (var_644_25 / var_644_24)

				if var_644_26 > 0 and var_644_20 < var_644_26 then
					arg_641_1.talkMaxDuration = var_644_26

					if var_644_26 + var_644_19 > arg_641_1.duration_ then
						arg_641_1.duration_ = var_644_26 + var_644_19
					end
				end

				arg_641_1.text_.text = var_644_23
				arg_641_1.typewritter.percent = 0

				arg_641_1.typewritter:SetDirty()
				arg_641_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311157", "story_v_out_115311.awb") ~= 0 then
					local var_644_27 = manager.audio:GetVoiceLength("story_v_out_115311", "115311157", "story_v_out_115311.awb") / 1000

					if var_644_27 + var_644_19 > arg_641_1.duration_ then
						arg_641_1.duration_ = var_644_27 + var_644_19
					end

					if var_644_22.prefab_name ~= "" and arg_641_1.actors_[var_644_22.prefab_name] ~= nil then
						local var_644_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_641_1.actors_[var_644_22.prefab_name].transform, "story_v_out_115311", "115311157", "story_v_out_115311.awb")

						arg_641_1:RecordAudio("115311157", var_644_28)
						arg_641_1:RecordAudio("115311157", var_644_28)
					else
						arg_641_1:AudioAction("play", "voice", "story_v_out_115311", "115311157", "story_v_out_115311.awb")
					end

					arg_641_1:RecordHistoryTalkVoice("story_v_out_115311", "115311157", "story_v_out_115311.awb")
				end

				arg_641_1:RecordContent(arg_641_1.text_.text)
			end

			local var_644_29 = math.max(var_644_20, arg_641_1.talkMaxDuration)

			if var_644_19 <= arg_641_1.time_ and arg_641_1.time_ < var_644_19 + var_644_29 then
				arg_641_1.typewritter.percent = (arg_641_1.time_ - var_644_19) / var_644_29

				arg_641_1.typewritter:SetDirty()
			end

			if arg_641_1.time_ >= var_644_19 + var_644_29 and arg_641_1.time_ < var_644_19 + var_644_29 + arg_644_0 then
				arg_641_1.typewritter.percent = 1

				arg_641_1.typewritter:SetDirty()
				arg_641_1:ShowNextGo(true)
			end
		end
	end,
	Play115311158 = function(arg_645_0, arg_645_1)
		arg_645_1.time_ = 0
		arg_645_1.frameCnt_ = 0
		arg_645_1.state_ = "playing"
		arg_645_1.curTalkId_ = 115311158
		arg_645_1.duration_ = 17.6

		local var_645_0 = {
			ja = 17.466,
			ko = 15.8,
			zh = 13.766,
			en = 17.6
		}
		local var_645_1 = manager.audio:GetLocalizationFlag()

		if var_645_0[var_645_1] ~= nil then
			arg_645_1.duration_ = var_645_0[var_645_1]
		end

		SetActive(arg_645_1.tipsGo_, false)

		function arg_645_1.onSingleLineFinish_()
			arg_645_1.onSingleLineUpdate_ = nil
			arg_645_1.onSingleLineFinish_ = nil
			arg_645_1.state_ = "waiting"
		end

		function arg_645_1.playNext_(arg_647_0)
			if arg_647_0 == 1 then
				arg_645_0:Play115311159(arg_645_1)
			end
		end

		function arg_645_1.onSingleLineUpdate_(arg_648_0)
			local var_648_0 = 0
			local var_648_1 = 1.375

			if var_648_0 < arg_645_1.time_ and arg_645_1.time_ <= var_648_0 + arg_648_0 then
				arg_645_1.talkMaxDuration = 0
				arg_645_1.dialogCg_.alpha = 1

				arg_645_1.dialog_:SetActive(true)
				SetActive(arg_645_1.leftNameGo_, true)

				local var_648_2 = arg_645_1:FormatText(StoryNameCfg[94].name)

				arg_645_1.leftNameTxt_.text = var_648_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_645_1.leftNameTxt_.transform)

				arg_645_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_645_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_645_1:RecordName(arg_645_1.leftNameTxt_.text)
				SetActive(arg_645_1.iconTrs_.gameObject, false)
				arg_645_1.callingController_:SetSelectedState("normal")

				local var_648_3 = arg_645_1:GetWordFromCfg(115311158)
				local var_648_4 = arg_645_1:FormatText(var_648_3.content)

				arg_645_1.text_.text = var_648_4

				LuaForUtil.ClearLinePrefixSymbol(arg_645_1.text_)

				local var_648_5 = 55
				local var_648_6 = utf8.len(var_648_4)
				local var_648_7 = var_648_5 <= 0 and var_648_1 or var_648_1 * (var_648_6 / var_648_5)

				if var_648_7 > 0 and var_648_1 < var_648_7 then
					arg_645_1.talkMaxDuration = var_648_7

					if var_648_7 + var_648_0 > arg_645_1.duration_ then
						arg_645_1.duration_ = var_648_7 + var_648_0
					end
				end

				arg_645_1.text_.text = var_648_4
				arg_645_1.typewritter.percent = 0

				arg_645_1.typewritter:SetDirty()
				arg_645_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311158", "story_v_out_115311.awb") ~= 0 then
					local var_648_8 = manager.audio:GetVoiceLength("story_v_out_115311", "115311158", "story_v_out_115311.awb") / 1000

					if var_648_8 + var_648_0 > arg_645_1.duration_ then
						arg_645_1.duration_ = var_648_8 + var_648_0
					end

					if var_648_3.prefab_name ~= "" and arg_645_1.actors_[var_648_3.prefab_name] ~= nil then
						local var_648_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_645_1.actors_[var_648_3.prefab_name].transform, "story_v_out_115311", "115311158", "story_v_out_115311.awb")

						arg_645_1:RecordAudio("115311158", var_648_9)
						arg_645_1:RecordAudio("115311158", var_648_9)
					else
						arg_645_1:AudioAction("play", "voice", "story_v_out_115311", "115311158", "story_v_out_115311.awb")
					end

					arg_645_1:RecordHistoryTalkVoice("story_v_out_115311", "115311158", "story_v_out_115311.awb")
				end

				arg_645_1:RecordContent(arg_645_1.text_.text)
			end

			local var_648_10 = math.max(var_648_1, arg_645_1.talkMaxDuration)

			if var_648_0 <= arg_645_1.time_ and arg_645_1.time_ < var_648_0 + var_648_10 then
				arg_645_1.typewritter.percent = (arg_645_1.time_ - var_648_0) / var_648_10

				arg_645_1.typewritter:SetDirty()
			end

			if arg_645_1.time_ >= var_648_0 + var_648_10 and arg_645_1.time_ < var_648_0 + var_648_10 + arg_648_0 then
				arg_645_1.typewritter.percent = 1

				arg_645_1.typewritter:SetDirty()
				arg_645_1:ShowNextGo(true)
			end
		end
	end,
	Play115311159 = function(arg_649_0, arg_649_1)
		arg_649_1.time_ = 0
		arg_649_1.frameCnt_ = 0
		arg_649_1.state_ = "playing"
		arg_649_1.curTalkId_ = 115311159
		arg_649_1.duration_ = 10.166

		local var_649_0 = {
			ja = 10.166,
			ko = 7.666,
			zh = 8.333,
			en = 8.633
		}
		local var_649_1 = manager.audio:GetLocalizationFlag()

		if var_649_0[var_649_1] ~= nil then
			arg_649_1.duration_ = var_649_0[var_649_1]
		end

		SetActive(arg_649_1.tipsGo_, false)

		function arg_649_1.onSingleLineFinish_()
			arg_649_1.onSingleLineUpdate_ = nil
			arg_649_1.onSingleLineFinish_ = nil
			arg_649_1.state_ = "waiting"
		end

		function arg_649_1.playNext_(arg_651_0)
			if arg_651_0 == 1 then
				arg_649_0:Play115311160(arg_649_1)
			end
		end

		function arg_649_1.onSingleLineUpdate_(arg_652_0)
			local var_652_0 = arg_649_1.actors_["10030"].transform
			local var_652_1 = 0

			if var_652_1 < arg_649_1.time_ and arg_649_1.time_ <= var_652_1 + arg_652_0 then
				arg_649_1.var_.moveOldPos10030 = var_652_0.localPosition
				var_652_0.localScale = Vector3.New(1, 1, 1)

				arg_649_1:CheckSpriteTmpPos("10030", 4)

				local var_652_2 = var_652_0.childCount

				for iter_652_0 = 0, var_652_2 - 1 do
					local var_652_3 = var_652_0:GetChild(iter_652_0)

					if var_652_3.name == "split_3" or not string.find(var_652_3.name, "split") then
						var_652_3.gameObject:SetActive(true)
					else
						var_652_3.gameObject:SetActive(false)
					end
				end
			end

			local var_652_4 = 0.001

			if var_652_1 <= arg_649_1.time_ and arg_649_1.time_ < var_652_1 + var_652_4 then
				local var_652_5 = (arg_649_1.time_ - var_652_1) / var_652_4
				local var_652_6 = Vector3.New(390, -390, 150)

				var_652_0.localPosition = Vector3.Lerp(arg_649_1.var_.moveOldPos10030, var_652_6, var_652_5)
			end

			if arg_649_1.time_ >= var_652_1 + var_652_4 and arg_649_1.time_ < var_652_1 + var_652_4 + arg_652_0 then
				var_652_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_652_7 = arg_649_1.actors_["10030"]
			local var_652_8 = 0

			if var_652_8 < arg_649_1.time_ and arg_649_1.time_ <= var_652_8 + arg_652_0 and arg_649_1.var_.actorSpriteComps10030 == nil then
				arg_649_1.var_.actorSpriteComps10030 = var_652_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_652_9 = 0.2

			if var_652_8 <= arg_649_1.time_ and arg_649_1.time_ < var_652_8 + var_652_9 then
				local var_652_10 = (arg_649_1.time_ - var_652_8) / var_652_9

				if arg_649_1.var_.actorSpriteComps10030 then
					for iter_652_1, iter_652_2 in pairs(arg_649_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_652_2 then
							local var_652_11 = Mathf.Lerp(iter_652_2.color.r, 1, var_652_10)

							iter_652_2.color = Color.New(var_652_11, var_652_11, var_652_11)
						end
					end
				end
			end

			if arg_649_1.time_ >= var_652_8 + var_652_9 and arg_649_1.time_ < var_652_8 + var_652_9 + arg_652_0 and arg_649_1.var_.actorSpriteComps10030 then
				local var_652_12 = 1

				for iter_652_3, iter_652_4 in pairs(arg_649_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_652_4 then
						iter_652_4.color = Color.New(var_652_12, var_652_12, var_652_12)
					end
				end

				arg_649_1.var_.actorSpriteComps10030 = nil
			end

			local var_652_13 = arg_649_1.actors_["1038"]
			local var_652_14 = 0

			if var_652_14 < arg_649_1.time_ and arg_649_1.time_ <= var_652_14 + arg_652_0 and arg_649_1.var_.actorSpriteComps1038 == nil then
				arg_649_1.var_.actorSpriteComps1038 = var_652_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_652_15 = 0.2

			if var_652_14 <= arg_649_1.time_ and arg_649_1.time_ < var_652_14 + var_652_15 then
				local var_652_16 = (arg_649_1.time_ - var_652_14) / var_652_15

				if arg_649_1.var_.actorSpriteComps1038 then
					for iter_652_5, iter_652_6 in pairs(arg_649_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_652_6 then
							local var_652_17 = Mathf.Lerp(iter_652_6.color.r, 0.5, var_652_16)

							iter_652_6.color = Color.New(var_652_17, var_652_17, var_652_17)
						end
					end
				end
			end

			if arg_649_1.time_ >= var_652_14 + var_652_15 and arg_649_1.time_ < var_652_14 + var_652_15 + arg_652_0 and arg_649_1.var_.actorSpriteComps1038 then
				local var_652_18 = 0.5

				for iter_652_7, iter_652_8 in pairs(arg_649_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_652_8 then
						iter_652_8.color = Color.New(var_652_18, var_652_18, var_652_18)
					end
				end

				arg_649_1.var_.actorSpriteComps1038 = nil
			end

			local var_652_19 = arg_649_1.actors_["10030"]
			local var_652_20 = 0

			if var_652_20 < arg_649_1.time_ and arg_649_1.time_ <= var_652_20 + arg_652_0 then
				local var_652_21 = var_652_19:GetComponentInChildren(typeof(CanvasGroup))

				if var_652_21 then
					arg_649_1.var_.alphaOldValue10030 = var_652_21.alpha
					arg_649_1.var_.characterEffect10030 = var_652_21
				end

				arg_649_1.var_.alphaOldValue10030 = 0
			end

			local var_652_22 = 0.0166666666666667

			if var_652_20 <= arg_649_1.time_ and arg_649_1.time_ < var_652_20 + var_652_22 then
				local var_652_23 = (arg_649_1.time_ - var_652_20) / var_652_22
				local var_652_24 = Mathf.Lerp(arg_649_1.var_.alphaOldValue10030, 1, var_652_23)

				if arg_649_1.var_.characterEffect10030 then
					arg_649_1.var_.characterEffect10030.alpha = var_652_24
				end
			end

			if arg_649_1.time_ >= var_652_20 + var_652_22 and arg_649_1.time_ < var_652_20 + var_652_22 + arg_652_0 and arg_649_1.var_.characterEffect10030 then
				arg_649_1.var_.characterEffect10030.alpha = 1
			end

			local var_652_25 = 0
			local var_652_26 = 0.875

			if var_652_25 < arg_649_1.time_ and arg_649_1.time_ <= var_652_25 + arg_652_0 then
				arg_649_1.talkMaxDuration = 0
				arg_649_1.dialogCg_.alpha = 1

				arg_649_1.dialog_:SetActive(true)
				SetActive(arg_649_1.leftNameGo_, true)

				local var_652_27 = arg_649_1:FormatText(StoryNameCfg[309].name)

				arg_649_1.leftNameTxt_.text = var_652_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_649_1.leftNameTxt_.transform)

				arg_649_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_649_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_649_1:RecordName(arg_649_1.leftNameTxt_.text)
				SetActive(arg_649_1.iconTrs_.gameObject, false)
				arg_649_1.callingController_:SetSelectedState("normal")

				local var_652_28 = arg_649_1:GetWordFromCfg(115311159)
				local var_652_29 = arg_649_1:FormatText(var_652_28.content)

				arg_649_1.text_.text = var_652_29

				LuaForUtil.ClearLinePrefixSymbol(arg_649_1.text_)

				local var_652_30 = 35
				local var_652_31 = utf8.len(var_652_29)
				local var_652_32 = var_652_30 <= 0 and var_652_26 or var_652_26 * (var_652_31 / var_652_30)

				if var_652_32 > 0 and var_652_26 < var_652_32 then
					arg_649_1.talkMaxDuration = var_652_32

					if var_652_32 + var_652_25 > arg_649_1.duration_ then
						arg_649_1.duration_ = var_652_32 + var_652_25
					end
				end

				arg_649_1.text_.text = var_652_29
				arg_649_1.typewritter.percent = 0

				arg_649_1.typewritter:SetDirty()
				arg_649_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311159", "story_v_out_115311.awb") ~= 0 then
					local var_652_33 = manager.audio:GetVoiceLength("story_v_out_115311", "115311159", "story_v_out_115311.awb") / 1000

					if var_652_33 + var_652_25 > arg_649_1.duration_ then
						arg_649_1.duration_ = var_652_33 + var_652_25
					end

					if var_652_28.prefab_name ~= "" and arg_649_1.actors_[var_652_28.prefab_name] ~= nil then
						local var_652_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_649_1.actors_[var_652_28.prefab_name].transform, "story_v_out_115311", "115311159", "story_v_out_115311.awb")

						arg_649_1:RecordAudio("115311159", var_652_34)
						arg_649_1:RecordAudio("115311159", var_652_34)
					else
						arg_649_1:AudioAction("play", "voice", "story_v_out_115311", "115311159", "story_v_out_115311.awb")
					end

					arg_649_1:RecordHistoryTalkVoice("story_v_out_115311", "115311159", "story_v_out_115311.awb")
				end

				arg_649_1:RecordContent(arg_649_1.text_.text)
			end

			local var_652_35 = math.max(var_652_26, arg_649_1.talkMaxDuration)

			if var_652_25 <= arg_649_1.time_ and arg_649_1.time_ < var_652_25 + var_652_35 then
				arg_649_1.typewritter.percent = (arg_649_1.time_ - var_652_25) / var_652_35

				arg_649_1.typewritter:SetDirty()
			end

			if arg_649_1.time_ >= var_652_25 + var_652_35 and arg_649_1.time_ < var_652_25 + var_652_35 + arg_652_0 then
				arg_649_1.typewritter.percent = 1

				arg_649_1.typewritter:SetDirty()
				arg_649_1:ShowNextGo(true)
			end
		end
	end,
	Play115311160 = function(arg_653_0, arg_653_1)
		arg_653_1.time_ = 0
		arg_653_1.frameCnt_ = 0
		arg_653_1.state_ = "playing"
		arg_653_1.curTalkId_ = 115311160
		arg_653_1.duration_ = 7.2

		local var_653_0 = {
			ja = 7.2,
			ko = 4.9,
			zh = 4.533,
			en = 6.3
		}
		local var_653_1 = manager.audio:GetLocalizationFlag()

		if var_653_0[var_653_1] ~= nil then
			arg_653_1.duration_ = var_653_0[var_653_1]
		end

		SetActive(arg_653_1.tipsGo_, false)

		function arg_653_1.onSingleLineFinish_()
			arg_653_1.onSingleLineUpdate_ = nil
			arg_653_1.onSingleLineFinish_ = nil
			arg_653_1.state_ = "waiting"
		end

		function arg_653_1.playNext_(arg_655_0)
			if arg_655_0 == 1 then
				arg_653_0:Play115311161(arg_653_1)
			end
		end

		function arg_653_1.onSingleLineUpdate_(arg_656_0)
			local var_656_0 = arg_653_1.actors_["10030"]
			local var_656_1 = 0

			if var_656_1 < arg_653_1.time_ and arg_653_1.time_ <= var_656_1 + arg_656_0 and arg_653_1.var_.actorSpriteComps10030 == nil then
				arg_653_1.var_.actorSpriteComps10030 = var_656_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_656_2 = 0.2

			if var_656_1 <= arg_653_1.time_ and arg_653_1.time_ < var_656_1 + var_656_2 then
				local var_656_3 = (arg_653_1.time_ - var_656_1) / var_656_2

				if arg_653_1.var_.actorSpriteComps10030 then
					for iter_656_0, iter_656_1 in pairs(arg_653_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_656_1 then
							local var_656_4 = Mathf.Lerp(iter_656_1.color.r, 0.5, var_656_3)

							iter_656_1.color = Color.New(var_656_4, var_656_4, var_656_4)
						end
					end
				end
			end

			if arg_653_1.time_ >= var_656_1 + var_656_2 and arg_653_1.time_ < var_656_1 + var_656_2 + arg_656_0 and arg_653_1.var_.actorSpriteComps10030 then
				local var_656_5 = 0.5

				for iter_656_2, iter_656_3 in pairs(arg_653_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_656_3 then
						iter_656_3.color = Color.New(var_656_5, var_656_5, var_656_5)
					end
				end

				arg_653_1.var_.actorSpriteComps10030 = nil
			end

			local var_656_6 = arg_653_1.actors_["1038"]
			local var_656_7 = 0

			if var_656_7 < arg_653_1.time_ and arg_653_1.time_ <= var_656_7 + arg_656_0 and arg_653_1.var_.actorSpriteComps1038 == nil then
				arg_653_1.var_.actorSpriteComps1038 = var_656_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_656_8 = 0.2

			if var_656_7 <= arg_653_1.time_ and arg_653_1.time_ < var_656_7 + var_656_8 then
				local var_656_9 = (arg_653_1.time_ - var_656_7) / var_656_8

				if arg_653_1.var_.actorSpriteComps1038 then
					for iter_656_4, iter_656_5 in pairs(arg_653_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_656_5 then
							local var_656_10 = Mathf.Lerp(iter_656_5.color.r, 1, var_656_9)

							iter_656_5.color = Color.New(var_656_10, var_656_10, var_656_10)
						end
					end
				end
			end

			if arg_653_1.time_ >= var_656_7 + var_656_8 and arg_653_1.time_ < var_656_7 + var_656_8 + arg_656_0 and arg_653_1.var_.actorSpriteComps1038 then
				local var_656_11 = 1

				for iter_656_6, iter_656_7 in pairs(arg_653_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_656_7 then
						iter_656_7.color = Color.New(var_656_11, var_656_11, var_656_11)
					end
				end

				arg_653_1.var_.actorSpriteComps1038 = nil
			end

			local var_656_12 = 0
			local var_656_13 = 0.4

			if var_656_12 < arg_653_1.time_ and arg_653_1.time_ <= var_656_12 + arg_656_0 then
				arg_653_1.talkMaxDuration = 0
				arg_653_1.dialogCg_.alpha = 1

				arg_653_1.dialog_:SetActive(true)
				SetActive(arg_653_1.leftNameGo_, true)

				local var_656_14 = arg_653_1:FormatText(StoryNameCfg[94].name)

				arg_653_1.leftNameTxt_.text = var_656_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_653_1.leftNameTxt_.transform)

				arg_653_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_653_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_653_1:RecordName(arg_653_1.leftNameTxt_.text)
				SetActive(arg_653_1.iconTrs_.gameObject, false)
				arg_653_1.callingController_:SetSelectedState("normal")

				local var_656_15 = arg_653_1:GetWordFromCfg(115311160)
				local var_656_16 = arg_653_1:FormatText(var_656_15.content)

				arg_653_1.text_.text = var_656_16

				LuaForUtil.ClearLinePrefixSymbol(arg_653_1.text_)

				local var_656_17 = 16
				local var_656_18 = utf8.len(var_656_16)
				local var_656_19 = var_656_17 <= 0 and var_656_13 or var_656_13 * (var_656_18 / var_656_17)

				if var_656_19 > 0 and var_656_13 < var_656_19 then
					arg_653_1.talkMaxDuration = var_656_19

					if var_656_19 + var_656_12 > arg_653_1.duration_ then
						arg_653_1.duration_ = var_656_19 + var_656_12
					end
				end

				arg_653_1.text_.text = var_656_16
				arg_653_1.typewritter.percent = 0

				arg_653_1.typewritter:SetDirty()
				arg_653_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311160", "story_v_out_115311.awb") ~= 0 then
					local var_656_20 = manager.audio:GetVoiceLength("story_v_out_115311", "115311160", "story_v_out_115311.awb") / 1000

					if var_656_20 + var_656_12 > arg_653_1.duration_ then
						arg_653_1.duration_ = var_656_20 + var_656_12
					end

					if var_656_15.prefab_name ~= "" and arg_653_1.actors_[var_656_15.prefab_name] ~= nil then
						local var_656_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_653_1.actors_[var_656_15.prefab_name].transform, "story_v_out_115311", "115311160", "story_v_out_115311.awb")

						arg_653_1:RecordAudio("115311160", var_656_21)
						arg_653_1:RecordAudio("115311160", var_656_21)
					else
						arg_653_1:AudioAction("play", "voice", "story_v_out_115311", "115311160", "story_v_out_115311.awb")
					end

					arg_653_1:RecordHistoryTalkVoice("story_v_out_115311", "115311160", "story_v_out_115311.awb")
				end

				arg_653_1:RecordContent(arg_653_1.text_.text)
			end

			local var_656_22 = math.max(var_656_13, arg_653_1.talkMaxDuration)

			if var_656_12 <= arg_653_1.time_ and arg_653_1.time_ < var_656_12 + var_656_22 then
				arg_653_1.typewritter.percent = (arg_653_1.time_ - var_656_12) / var_656_22

				arg_653_1.typewritter:SetDirty()
			end

			if arg_653_1.time_ >= var_656_12 + var_656_22 and arg_653_1.time_ < var_656_12 + var_656_22 + arg_656_0 then
				arg_653_1.typewritter.percent = 1

				arg_653_1.typewritter:SetDirty()
				arg_653_1:ShowNextGo(true)
			end
		end
	end,
	Play115311161 = function(arg_657_0, arg_657_1)
		arg_657_1.time_ = 0
		arg_657_1.frameCnt_ = 0
		arg_657_1.state_ = "playing"
		arg_657_1.curTalkId_ = 115311161
		arg_657_1.duration_ = 7.766

		local var_657_0 = {
			ja = 7.766,
			ko = 3.9,
			zh = 4.733,
			en = 4.6
		}
		local var_657_1 = manager.audio:GetLocalizationFlag()

		if var_657_0[var_657_1] ~= nil then
			arg_657_1.duration_ = var_657_0[var_657_1]
		end

		SetActive(arg_657_1.tipsGo_, false)

		function arg_657_1.onSingleLineFinish_()
			arg_657_1.onSingleLineUpdate_ = nil
			arg_657_1.onSingleLineFinish_ = nil
			arg_657_1.state_ = "waiting"
		end

		function arg_657_1.playNext_(arg_659_0)
			if arg_659_0 == 1 then
				arg_657_0:Play115311162(arg_657_1)
			end
		end

		function arg_657_1.onSingleLineUpdate_(arg_660_0)
			local var_660_0 = arg_657_1.actors_["1038"]
			local var_660_1 = 0

			if var_660_1 < arg_657_1.time_ and arg_657_1.time_ <= var_660_1 + arg_660_0 and arg_657_1.var_.actorSpriteComps1038 == nil then
				arg_657_1.var_.actorSpriteComps1038 = var_660_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_660_2 = 0.2

			if var_660_1 <= arg_657_1.time_ and arg_657_1.time_ < var_660_1 + var_660_2 then
				local var_660_3 = (arg_657_1.time_ - var_660_1) / var_660_2

				if arg_657_1.var_.actorSpriteComps1038 then
					for iter_660_0, iter_660_1 in pairs(arg_657_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_660_1 then
							local var_660_4 = Mathf.Lerp(iter_660_1.color.r, 0.5, var_660_3)

							iter_660_1.color = Color.New(var_660_4, var_660_4, var_660_4)
						end
					end
				end
			end

			if arg_657_1.time_ >= var_660_1 + var_660_2 and arg_657_1.time_ < var_660_1 + var_660_2 + arg_660_0 and arg_657_1.var_.actorSpriteComps1038 then
				local var_660_5 = 0.5

				for iter_660_2, iter_660_3 in pairs(arg_657_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_660_3 then
						iter_660_3.color = Color.New(var_660_5, var_660_5, var_660_5)
					end
				end

				arg_657_1.var_.actorSpriteComps1038 = nil
			end

			local var_660_6 = arg_657_1.actors_["10030"]
			local var_660_7 = 0

			if var_660_7 < arg_657_1.time_ and arg_657_1.time_ <= var_660_7 + arg_660_0 and arg_657_1.var_.actorSpriteComps10030 == nil then
				arg_657_1.var_.actorSpriteComps10030 = var_660_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_660_8 = 0.2

			if var_660_7 <= arg_657_1.time_ and arg_657_1.time_ < var_660_7 + var_660_8 then
				local var_660_9 = (arg_657_1.time_ - var_660_7) / var_660_8

				if arg_657_1.var_.actorSpriteComps10030 then
					for iter_660_4, iter_660_5 in pairs(arg_657_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_660_5 then
							local var_660_10 = Mathf.Lerp(iter_660_5.color.r, 1, var_660_9)

							iter_660_5.color = Color.New(var_660_10, var_660_10, var_660_10)
						end
					end
				end
			end

			if arg_657_1.time_ >= var_660_7 + var_660_8 and arg_657_1.time_ < var_660_7 + var_660_8 + arg_660_0 and arg_657_1.var_.actorSpriteComps10030 then
				local var_660_11 = 1

				for iter_660_6, iter_660_7 in pairs(arg_657_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_660_7 then
						iter_660_7.color = Color.New(var_660_11, var_660_11, var_660_11)
					end
				end

				arg_657_1.var_.actorSpriteComps10030 = nil
			end

			local var_660_12 = 0
			local var_660_13 = 0.425

			if var_660_12 < arg_657_1.time_ and arg_657_1.time_ <= var_660_12 + arg_660_0 then
				arg_657_1.talkMaxDuration = 0
				arg_657_1.dialogCg_.alpha = 1

				arg_657_1.dialog_:SetActive(true)
				SetActive(arg_657_1.leftNameGo_, true)

				local var_660_14 = arg_657_1:FormatText(StoryNameCfg[309].name)

				arg_657_1.leftNameTxt_.text = var_660_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_657_1.leftNameTxt_.transform)

				arg_657_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_657_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_657_1:RecordName(arg_657_1.leftNameTxt_.text)
				SetActive(arg_657_1.iconTrs_.gameObject, false)
				arg_657_1.callingController_:SetSelectedState("normal")

				local var_660_15 = arg_657_1:GetWordFromCfg(115311161)
				local var_660_16 = arg_657_1:FormatText(var_660_15.content)

				arg_657_1.text_.text = var_660_16

				LuaForUtil.ClearLinePrefixSymbol(arg_657_1.text_)

				local var_660_17 = 17
				local var_660_18 = utf8.len(var_660_16)
				local var_660_19 = var_660_17 <= 0 and var_660_13 or var_660_13 * (var_660_18 / var_660_17)

				if var_660_19 > 0 and var_660_13 < var_660_19 then
					arg_657_1.talkMaxDuration = var_660_19

					if var_660_19 + var_660_12 > arg_657_1.duration_ then
						arg_657_1.duration_ = var_660_19 + var_660_12
					end
				end

				arg_657_1.text_.text = var_660_16
				arg_657_1.typewritter.percent = 0

				arg_657_1.typewritter:SetDirty()
				arg_657_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311161", "story_v_out_115311.awb") ~= 0 then
					local var_660_20 = manager.audio:GetVoiceLength("story_v_out_115311", "115311161", "story_v_out_115311.awb") / 1000

					if var_660_20 + var_660_12 > arg_657_1.duration_ then
						arg_657_1.duration_ = var_660_20 + var_660_12
					end

					if var_660_15.prefab_name ~= "" and arg_657_1.actors_[var_660_15.prefab_name] ~= nil then
						local var_660_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_657_1.actors_[var_660_15.prefab_name].transform, "story_v_out_115311", "115311161", "story_v_out_115311.awb")

						arg_657_1:RecordAudio("115311161", var_660_21)
						arg_657_1:RecordAudio("115311161", var_660_21)
					else
						arg_657_1:AudioAction("play", "voice", "story_v_out_115311", "115311161", "story_v_out_115311.awb")
					end

					arg_657_1:RecordHistoryTalkVoice("story_v_out_115311", "115311161", "story_v_out_115311.awb")
				end

				arg_657_1:RecordContent(arg_657_1.text_.text)
			end

			local var_660_22 = math.max(var_660_13, arg_657_1.talkMaxDuration)

			if var_660_12 <= arg_657_1.time_ and arg_657_1.time_ < var_660_12 + var_660_22 then
				arg_657_1.typewritter.percent = (arg_657_1.time_ - var_660_12) / var_660_22

				arg_657_1.typewritter:SetDirty()
			end

			if arg_657_1.time_ >= var_660_12 + var_660_22 and arg_657_1.time_ < var_660_12 + var_660_22 + arg_660_0 then
				arg_657_1.typewritter.percent = 1

				arg_657_1.typewritter:SetDirty()
				arg_657_1:ShowNextGo(true)
			end
		end
	end,
	Play115311162 = function(arg_661_0, arg_661_1)
		arg_661_1.time_ = 0
		arg_661_1.frameCnt_ = 0
		arg_661_1.state_ = "playing"
		arg_661_1.curTalkId_ = 115311162
		arg_661_1.duration_ = 9.833

		local var_661_0 = {
			ja = 9.833,
			ko = 5.9,
			zh = 5.1,
			en = 6.666
		}
		local var_661_1 = manager.audio:GetLocalizationFlag()

		if var_661_0[var_661_1] ~= nil then
			arg_661_1.duration_ = var_661_0[var_661_1]
		end

		SetActive(arg_661_1.tipsGo_, false)

		function arg_661_1.onSingleLineFinish_()
			arg_661_1.onSingleLineUpdate_ = nil
			arg_661_1.onSingleLineFinish_ = nil
			arg_661_1.state_ = "waiting"
		end

		function arg_661_1.playNext_(arg_663_0)
			if arg_663_0 == 1 then
				arg_661_0:Play115311163(arg_661_1)
			end
		end

		function arg_661_1.onSingleLineUpdate_(arg_664_0)
			local var_664_0 = 0
			local var_664_1 = 0.65

			if var_664_0 < arg_661_1.time_ and arg_661_1.time_ <= var_664_0 + arg_664_0 then
				arg_661_1.talkMaxDuration = 0
				arg_661_1.dialogCg_.alpha = 1

				arg_661_1.dialog_:SetActive(true)
				SetActive(arg_661_1.leftNameGo_, true)

				local var_664_2 = arg_661_1:FormatText(StoryNameCfg[309].name)

				arg_661_1.leftNameTxt_.text = var_664_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_661_1.leftNameTxt_.transform)

				arg_661_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_661_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_661_1:RecordName(arg_661_1.leftNameTxt_.text)
				SetActive(arg_661_1.iconTrs_.gameObject, false)
				arg_661_1.callingController_:SetSelectedState("normal")

				local var_664_3 = arg_661_1:GetWordFromCfg(115311162)
				local var_664_4 = arg_661_1:FormatText(var_664_3.content)

				arg_661_1.text_.text = var_664_4

				LuaForUtil.ClearLinePrefixSymbol(arg_661_1.text_)

				local var_664_5 = 26
				local var_664_6 = utf8.len(var_664_4)
				local var_664_7 = var_664_5 <= 0 and var_664_1 or var_664_1 * (var_664_6 / var_664_5)

				if var_664_7 > 0 and var_664_1 < var_664_7 then
					arg_661_1.talkMaxDuration = var_664_7

					if var_664_7 + var_664_0 > arg_661_1.duration_ then
						arg_661_1.duration_ = var_664_7 + var_664_0
					end
				end

				arg_661_1.text_.text = var_664_4
				arg_661_1.typewritter.percent = 0

				arg_661_1.typewritter:SetDirty()
				arg_661_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311162", "story_v_out_115311.awb") ~= 0 then
					local var_664_8 = manager.audio:GetVoiceLength("story_v_out_115311", "115311162", "story_v_out_115311.awb") / 1000

					if var_664_8 + var_664_0 > arg_661_1.duration_ then
						arg_661_1.duration_ = var_664_8 + var_664_0
					end

					if var_664_3.prefab_name ~= "" and arg_661_1.actors_[var_664_3.prefab_name] ~= nil then
						local var_664_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_661_1.actors_[var_664_3.prefab_name].transform, "story_v_out_115311", "115311162", "story_v_out_115311.awb")

						arg_661_1:RecordAudio("115311162", var_664_9)
						arg_661_1:RecordAudio("115311162", var_664_9)
					else
						arg_661_1:AudioAction("play", "voice", "story_v_out_115311", "115311162", "story_v_out_115311.awb")
					end

					arg_661_1:RecordHistoryTalkVoice("story_v_out_115311", "115311162", "story_v_out_115311.awb")
				end

				arg_661_1:RecordContent(arg_661_1.text_.text)
			end

			local var_664_10 = math.max(var_664_1, arg_661_1.talkMaxDuration)

			if var_664_0 <= arg_661_1.time_ and arg_661_1.time_ < var_664_0 + var_664_10 then
				arg_661_1.typewritter.percent = (arg_661_1.time_ - var_664_0) / var_664_10

				arg_661_1.typewritter:SetDirty()
			end

			if arg_661_1.time_ >= var_664_0 + var_664_10 and arg_661_1.time_ < var_664_0 + var_664_10 + arg_664_0 then
				arg_661_1.typewritter.percent = 1

				arg_661_1.typewritter:SetDirty()
				arg_661_1:ShowNextGo(true)
			end
		end
	end,
	Play115311163 = function(arg_665_0, arg_665_1)
		arg_665_1.time_ = 0
		arg_665_1.frameCnt_ = 0
		arg_665_1.state_ = "playing"
		arg_665_1.curTalkId_ = 115311163
		arg_665_1.duration_ = 11.4

		local var_665_0 = {
			ja = 11.4,
			ko = 7.266,
			zh = 7.4,
			en = 7.1
		}
		local var_665_1 = manager.audio:GetLocalizationFlag()

		if var_665_0[var_665_1] ~= nil then
			arg_665_1.duration_ = var_665_0[var_665_1]
		end

		SetActive(arg_665_1.tipsGo_, false)

		function arg_665_1.onSingleLineFinish_()
			arg_665_1.onSingleLineUpdate_ = nil
			arg_665_1.onSingleLineFinish_ = nil
			arg_665_1.state_ = "waiting"
		end

		function arg_665_1.playNext_(arg_667_0)
			if arg_667_0 == 1 then
				arg_665_0:Play115311164(arg_665_1)
			end
		end

		function arg_665_1.onSingleLineUpdate_(arg_668_0)
			local var_668_0 = arg_665_1.actors_["1038"]
			local var_668_1 = 0

			if var_668_1 < arg_665_1.time_ and arg_665_1.time_ <= var_668_1 + arg_668_0 and arg_665_1.var_.actorSpriteComps1038 == nil then
				arg_665_1.var_.actorSpriteComps1038 = var_668_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_668_2 = 0.2

			if var_668_1 <= arg_665_1.time_ and arg_665_1.time_ < var_668_1 + var_668_2 then
				local var_668_3 = (arg_665_1.time_ - var_668_1) / var_668_2

				if arg_665_1.var_.actorSpriteComps1038 then
					for iter_668_0, iter_668_1 in pairs(arg_665_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_668_1 then
							local var_668_4 = Mathf.Lerp(iter_668_1.color.r, 1, var_668_3)

							iter_668_1.color = Color.New(var_668_4, var_668_4, var_668_4)
						end
					end
				end
			end

			if arg_665_1.time_ >= var_668_1 + var_668_2 and arg_665_1.time_ < var_668_1 + var_668_2 + arg_668_0 and arg_665_1.var_.actorSpriteComps1038 then
				local var_668_5 = 1

				for iter_668_2, iter_668_3 in pairs(arg_665_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_668_3 then
						iter_668_3.color = Color.New(var_668_5, var_668_5, var_668_5)
					end
				end

				arg_665_1.var_.actorSpriteComps1038 = nil
			end

			local var_668_6 = arg_665_1.actors_["10030"]
			local var_668_7 = 0

			if var_668_7 < arg_665_1.time_ and arg_665_1.time_ <= var_668_7 + arg_668_0 and arg_665_1.var_.actorSpriteComps10030 == nil then
				arg_665_1.var_.actorSpriteComps10030 = var_668_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_668_8 = 0.2

			if var_668_7 <= arg_665_1.time_ and arg_665_1.time_ < var_668_7 + var_668_8 then
				local var_668_9 = (arg_665_1.time_ - var_668_7) / var_668_8

				if arg_665_1.var_.actorSpriteComps10030 then
					for iter_668_4, iter_668_5 in pairs(arg_665_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_668_5 then
							local var_668_10 = Mathf.Lerp(iter_668_5.color.r, 0.5, var_668_9)

							iter_668_5.color = Color.New(var_668_10, var_668_10, var_668_10)
						end
					end
				end
			end

			if arg_665_1.time_ >= var_668_7 + var_668_8 and arg_665_1.time_ < var_668_7 + var_668_8 + arg_668_0 and arg_665_1.var_.actorSpriteComps10030 then
				local var_668_11 = 0.5

				for iter_668_6, iter_668_7 in pairs(arg_665_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_668_7 then
						iter_668_7.color = Color.New(var_668_11, var_668_11, var_668_11)
					end
				end

				arg_665_1.var_.actorSpriteComps10030 = nil
			end

			local var_668_12 = 0
			local var_668_13 = 0.775

			if var_668_12 < arg_665_1.time_ and arg_665_1.time_ <= var_668_12 + arg_668_0 then
				arg_665_1.talkMaxDuration = 0
				arg_665_1.dialogCg_.alpha = 1

				arg_665_1.dialog_:SetActive(true)
				SetActive(arg_665_1.leftNameGo_, true)

				local var_668_14 = arg_665_1:FormatText(StoryNameCfg[94].name)

				arg_665_1.leftNameTxt_.text = var_668_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_665_1.leftNameTxt_.transform)

				arg_665_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_665_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_665_1:RecordName(arg_665_1.leftNameTxt_.text)
				SetActive(arg_665_1.iconTrs_.gameObject, false)
				arg_665_1.callingController_:SetSelectedState("normal")

				local var_668_15 = arg_665_1:GetWordFromCfg(115311163)
				local var_668_16 = arg_665_1:FormatText(var_668_15.content)

				arg_665_1.text_.text = var_668_16

				LuaForUtil.ClearLinePrefixSymbol(arg_665_1.text_)

				local var_668_17 = 31
				local var_668_18 = utf8.len(var_668_16)
				local var_668_19 = var_668_17 <= 0 and var_668_13 or var_668_13 * (var_668_18 / var_668_17)

				if var_668_19 > 0 and var_668_13 < var_668_19 then
					arg_665_1.talkMaxDuration = var_668_19

					if var_668_19 + var_668_12 > arg_665_1.duration_ then
						arg_665_1.duration_ = var_668_19 + var_668_12
					end
				end

				arg_665_1.text_.text = var_668_16
				arg_665_1.typewritter.percent = 0

				arg_665_1.typewritter:SetDirty()
				arg_665_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311163", "story_v_out_115311.awb") ~= 0 then
					local var_668_20 = manager.audio:GetVoiceLength("story_v_out_115311", "115311163", "story_v_out_115311.awb") / 1000

					if var_668_20 + var_668_12 > arg_665_1.duration_ then
						arg_665_1.duration_ = var_668_20 + var_668_12
					end

					if var_668_15.prefab_name ~= "" and arg_665_1.actors_[var_668_15.prefab_name] ~= nil then
						local var_668_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_665_1.actors_[var_668_15.prefab_name].transform, "story_v_out_115311", "115311163", "story_v_out_115311.awb")

						arg_665_1:RecordAudio("115311163", var_668_21)
						arg_665_1:RecordAudio("115311163", var_668_21)
					else
						arg_665_1:AudioAction("play", "voice", "story_v_out_115311", "115311163", "story_v_out_115311.awb")
					end

					arg_665_1:RecordHistoryTalkVoice("story_v_out_115311", "115311163", "story_v_out_115311.awb")
				end

				arg_665_1:RecordContent(arg_665_1.text_.text)
			end

			local var_668_22 = math.max(var_668_13, arg_665_1.talkMaxDuration)

			if var_668_12 <= arg_665_1.time_ and arg_665_1.time_ < var_668_12 + var_668_22 then
				arg_665_1.typewritter.percent = (arg_665_1.time_ - var_668_12) / var_668_22

				arg_665_1.typewritter:SetDirty()
			end

			if arg_665_1.time_ >= var_668_12 + var_668_22 and arg_665_1.time_ < var_668_12 + var_668_22 + arg_668_0 then
				arg_665_1.typewritter.percent = 1

				arg_665_1.typewritter:SetDirty()
				arg_665_1:ShowNextGo(true)
			end
		end
	end,
	Play115311164 = function(arg_669_0, arg_669_1)
		arg_669_1.time_ = 0
		arg_669_1.frameCnt_ = 0
		arg_669_1.state_ = "playing"
		arg_669_1.curTalkId_ = 115311164
		arg_669_1.duration_ = 17.7

		local var_669_0 = {
			ja = 10.666,
			ko = 16.4,
			zh = 17.3,
			en = 17.7
		}
		local var_669_1 = manager.audio:GetLocalizationFlag()

		if var_669_0[var_669_1] ~= nil then
			arg_669_1.duration_ = var_669_0[var_669_1]
		end

		SetActive(arg_669_1.tipsGo_, false)

		function arg_669_1.onSingleLineFinish_()
			arg_669_1.onSingleLineUpdate_ = nil
			arg_669_1.onSingleLineFinish_ = nil
			arg_669_1.state_ = "waiting"
		end

		function arg_669_1.playNext_(arg_671_0)
			if arg_671_0 == 1 then
				arg_669_0:Play115311165(arg_669_1)
			end
		end

		function arg_669_1.onSingleLineUpdate_(arg_672_0)
			local var_672_0 = 0
			local var_672_1 = 1.475

			if var_672_0 < arg_669_1.time_ and arg_669_1.time_ <= var_672_0 + arg_672_0 then
				arg_669_1.talkMaxDuration = 0
				arg_669_1.dialogCg_.alpha = 1

				arg_669_1.dialog_:SetActive(true)
				SetActive(arg_669_1.leftNameGo_, true)

				local var_672_2 = arg_669_1:FormatText(StoryNameCfg[94].name)

				arg_669_1.leftNameTxt_.text = var_672_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_669_1.leftNameTxt_.transform)

				arg_669_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_669_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_669_1:RecordName(arg_669_1.leftNameTxt_.text)
				SetActive(arg_669_1.iconTrs_.gameObject, false)
				arg_669_1.callingController_:SetSelectedState("normal")

				local var_672_3 = arg_669_1:GetWordFromCfg(115311164)
				local var_672_4 = arg_669_1:FormatText(var_672_3.content)

				arg_669_1.text_.text = var_672_4

				LuaForUtil.ClearLinePrefixSymbol(arg_669_1.text_)

				local var_672_5 = 59
				local var_672_6 = utf8.len(var_672_4)
				local var_672_7 = var_672_5 <= 0 and var_672_1 or var_672_1 * (var_672_6 / var_672_5)

				if var_672_7 > 0 and var_672_1 < var_672_7 then
					arg_669_1.talkMaxDuration = var_672_7

					if var_672_7 + var_672_0 > arg_669_1.duration_ then
						arg_669_1.duration_ = var_672_7 + var_672_0
					end
				end

				arg_669_1.text_.text = var_672_4
				arg_669_1.typewritter.percent = 0

				arg_669_1.typewritter:SetDirty()
				arg_669_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311164", "story_v_out_115311.awb") ~= 0 then
					local var_672_8 = manager.audio:GetVoiceLength("story_v_out_115311", "115311164", "story_v_out_115311.awb") / 1000

					if var_672_8 + var_672_0 > arg_669_1.duration_ then
						arg_669_1.duration_ = var_672_8 + var_672_0
					end

					if var_672_3.prefab_name ~= "" and arg_669_1.actors_[var_672_3.prefab_name] ~= nil then
						local var_672_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_669_1.actors_[var_672_3.prefab_name].transform, "story_v_out_115311", "115311164", "story_v_out_115311.awb")

						arg_669_1:RecordAudio("115311164", var_672_9)
						arg_669_1:RecordAudio("115311164", var_672_9)
					else
						arg_669_1:AudioAction("play", "voice", "story_v_out_115311", "115311164", "story_v_out_115311.awb")
					end

					arg_669_1:RecordHistoryTalkVoice("story_v_out_115311", "115311164", "story_v_out_115311.awb")
				end

				arg_669_1:RecordContent(arg_669_1.text_.text)
			end

			local var_672_10 = math.max(var_672_1, arg_669_1.talkMaxDuration)

			if var_672_0 <= arg_669_1.time_ and arg_669_1.time_ < var_672_0 + var_672_10 then
				arg_669_1.typewritter.percent = (arg_669_1.time_ - var_672_0) / var_672_10

				arg_669_1.typewritter:SetDirty()
			end

			if arg_669_1.time_ >= var_672_0 + var_672_10 and arg_669_1.time_ < var_672_0 + var_672_10 + arg_672_0 then
				arg_669_1.typewritter.percent = 1

				arg_669_1.typewritter:SetDirty()
				arg_669_1:ShowNextGo(true)
			end
		end
	end,
	Play115311165 = function(arg_673_0, arg_673_1)
		arg_673_1.time_ = 0
		arg_673_1.frameCnt_ = 0
		arg_673_1.state_ = "playing"
		arg_673_1.curTalkId_ = 115311165
		arg_673_1.duration_ = 7.533

		local var_673_0 = {
			ja = 6.6,
			ko = 7.533,
			zh = 5.933,
			en = 7
		}
		local var_673_1 = manager.audio:GetLocalizationFlag()

		if var_673_0[var_673_1] ~= nil then
			arg_673_1.duration_ = var_673_0[var_673_1]
		end

		SetActive(arg_673_1.tipsGo_, false)

		function arg_673_1.onSingleLineFinish_()
			arg_673_1.onSingleLineUpdate_ = nil
			arg_673_1.onSingleLineFinish_ = nil
			arg_673_1.state_ = "waiting"
		end

		function arg_673_1.playNext_(arg_675_0)
			if arg_675_0 == 1 then
				arg_673_0:Play115311166(arg_673_1)
			end
		end

		function arg_673_1.onSingleLineUpdate_(arg_676_0)
			local var_676_0 = arg_673_1.actors_["1038"]
			local var_676_1 = 0

			if var_676_1 < arg_673_1.time_ and arg_673_1.time_ <= var_676_1 + arg_676_0 and arg_673_1.var_.actorSpriteComps1038 == nil then
				arg_673_1.var_.actorSpriteComps1038 = var_676_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_676_2 = 0.2

			if var_676_1 <= arg_673_1.time_ and arg_673_1.time_ < var_676_1 + var_676_2 then
				local var_676_3 = (arg_673_1.time_ - var_676_1) / var_676_2

				if arg_673_1.var_.actorSpriteComps1038 then
					for iter_676_0, iter_676_1 in pairs(arg_673_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_676_1 then
							local var_676_4 = Mathf.Lerp(iter_676_1.color.r, 0.5, var_676_3)

							iter_676_1.color = Color.New(var_676_4, var_676_4, var_676_4)
						end
					end
				end
			end

			if arg_673_1.time_ >= var_676_1 + var_676_2 and arg_673_1.time_ < var_676_1 + var_676_2 + arg_676_0 and arg_673_1.var_.actorSpriteComps1038 then
				local var_676_5 = 0.5

				for iter_676_2, iter_676_3 in pairs(arg_673_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_676_3 then
						iter_676_3.color = Color.New(var_676_5, var_676_5, var_676_5)
					end
				end

				arg_673_1.var_.actorSpriteComps1038 = nil
			end

			local var_676_6 = arg_673_1.actors_["10030"]
			local var_676_7 = 0

			if var_676_7 < arg_673_1.time_ and arg_673_1.time_ <= var_676_7 + arg_676_0 and arg_673_1.var_.actorSpriteComps10030 == nil then
				arg_673_1.var_.actorSpriteComps10030 = var_676_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_676_8 = 0.2

			if var_676_7 <= arg_673_1.time_ and arg_673_1.time_ < var_676_7 + var_676_8 then
				local var_676_9 = (arg_673_1.time_ - var_676_7) / var_676_8

				if arg_673_1.var_.actorSpriteComps10030 then
					for iter_676_4, iter_676_5 in pairs(arg_673_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_676_5 then
							local var_676_10 = Mathf.Lerp(iter_676_5.color.r, 1, var_676_9)

							iter_676_5.color = Color.New(var_676_10, var_676_10, var_676_10)
						end
					end
				end
			end

			if arg_673_1.time_ >= var_676_7 + var_676_8 and arg_673_1.time_ < var_676_7 + var_676_8 + arg_676_0 and arg_673_1.var_.actorSpriteComps10030 then
				local var_676_11 = 1

				for iter_676_6, iter_676_7 in pairs(arg_673_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_676_7 then
						iter_676_7.color = Color.New(var_676_11, var_676_11, var_676_11)
					end
				end

				arg_673_1.var_.actorSpriteComps10030 = nil
			end

			local var_676_12 = 0
			local var_676_13 = 0.55

			if var_676_12 < arg_673_1.time_ and arg_673_1.time_ <= var_676_12 + arg_676_0 then
				arg_673_1.talkMaxDuration = 0
				arg_673_1.dialogCg_.alpha = 1

				arg_673_1.dialog_:SetActive(true)
				SetActive(arg_673_1.leftNameGo_, true)

				local var_676_14 = arg_673_1:FormatText(StoryNameCfg[309].name)

				arg_673_1.leftNameTxt_.text = var_676_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_673_1.leftNameTxt_.transform)

				arg_673_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_673_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_673_1:RecordName(arg_673_1.leftNameTxt_.text)
				SetActive(arg_673_1.iconTrs_.gameObject, false)
				arg_673_1.callingController_:SetSelectedState("normal")

				local var_676_15 = arg_673_1:GetWordFromCfg(115311165)
				local var_676_16 = arg_673_1:FormatText(var_676_15.content)

				arg_673_1.text_.text = var_676_16

				LuaForUtil.ClearLinePrefixSymbol(arg_673_1.text_)

				local var_676_17 = 22
				local var_676_18 = utf8.len(var_676_16)
				local var_676_19 = var_676_17 <= 0 and var_676_13 or var_676_13 * (var_676_18 / var_676_17)

				if var_676_19 > 0 and var_676_13 < var_676_19 then
					arg_673_1.talkMaxDuration = var_676_19

					if var_676_19 + var_676_12 > arg_673_1.duration_ then
						arg_673_1.duration_ = var_676_19 + var_676_12
					end
				end

				arg_673_1.text_.text = var_676_16
				arg_673_1.typewritter.percent = 0

				arg_673_1.typewritter:SetDirty()
				arg_673_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311165", "story_v_out_115311.awb") ~= 0 then
					local var_676_20 = manager.audio:GetVoiceLength("story_v_out_115311", "115311165", "story_v_out_115311.awb") / 1000

					if var_676_20 + var_676_12 > arg_673_1.duration_ then
						arg_673_1.duration_ = var_676_20 + var_676_12
					end

					if var_676_15.prefab_name ~= "" and arg_673_1.actors_[var_676_15.prefab_name] ~= nil then
						local var_676_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_673_1.actors_[var_676_15.prefab_name].transform, "story_v_out_115311", "115311165", "story_v_out_115311.awb")

						arg_673_1:RecordAudio("115311165", var_676_21)
						arg_673_1:RecordAudio("115311165", var_676_21)
					else
						arg_673_1:AudioAction("play", "voice", "story_v_out_115311", "115311165", "story_v_out_115311.awb")
					end

					arg_673_1:RecordHistoryTalkVoice("story_v_out_115311", "115311165", "story_v_out_115311.awb")
				end

				arg_673_1:RecordContent(arg_673_1.text_.text)
			end

			local var_676_22 = math.max(var_676_13, arg_673_1.talkMaxDuration)

			if var_676_12 <= arg_673_1.time_ and arg_673_1.time_ < var_676_12 + var_676_22 then
				arg_673_1.typewritter.percent = (arg_673_1.time_ - var_676_12) / var_676_22

				arg_673_1.typewritter:SetDirty()
			end

			if arg_673_1.time_ >= var_676_12 + var_676_22 and arg_673_1.time_ < var_676_12 + var_676_22 + arg_676_0 then
				arg_673_1.typewritter.percent = 1

				arg_673_1.typewritter:SetDirty()
				arg_673_1:ShowNextGo(true)
			end
		end
	end,
	Play115311166 = function(arg_677_0, arg_677_1)
		arg_677_1.time_ = 0
		arg_677_1.frameCnt_ = 0
		arg_677_1.state_ = "playing"
		arg_677_1.curTalkId_ = 115311166
		arg_677_1.duration_ = 5

		SetActive(arg_677_1.tipsGo_, false)

		function arg_677_1.onSingleLineFinish_()
			arg_677_1.onSingleLineUpdate_ = nil
			arg_677_1.onSingleLineFinish_ = nil
			arg_677_1.state_ = "waiting"
		end

		function arg_677_1.playNext_(arg_679_0)
			if arg_679_0 == 1 then
				arg_677_0:Play115311167(arg_677_1)
			end
		end

		function arg_677_1.onSingleLineUpdate_(arg_680_0)
			local var_680_0 = arg_677_1.actors_["10030"]
			local var_680_1 = 0

			if var_680_1 < arg_677_1.time_ and arg_677_1.time_ <= var_680_1 + arg_680_0 and arg_677_1.var_.actorSpriteComps10030 == nil then
				arg_677_1.var_.actorSpriteComps10030 = var_680_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_680_2 = 0.2

			if var_680_1 <= arg_677_1.time_ and arg_677_1.time_ < var_680_1 + var_680_2 then
				local var_680_3 = (arg_677_1.time_ - var_680_1) / var_680_2

				if arg_677_1.var_.actorSpriteComps10030 then
					for iter_680_0, iter_680_1 in pairs(arg_677_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_680_1 then
							local var_680_4 = Mathf.Lerp(iter_680_1.color.r, 0.5, var_680_3)

							iter_680_1.color = Color.New(var_680_4, var_680_4, var_680_4)
						end
					end
				end
			end

			if arg_677_1.time_ >= var_680_1 + var_680_2 and arg_677_1.time_ < var_680_1 + var_680_2 + arg_680_0 and arg_677_1.var_.actorSpriteComps10030 then
				local var_680_5 = 0.5

				for iter_680_2, iter_680_3 in pairs(arg_677_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_680_3 then
						iter_680_3.color = Color.New(var_680_5, var_680_5, var_680_5)
					end
				end

				arg_677_1.var_.actorSpriteComps10030 = nil
			end

			local var_680_6 = 0
			local var_680_7 = 1

			if var_680_6 < arg_677_1.time_ and arg_677_1.time_ <= var_680_6 + arg_680_0 then
				arg_677_1.talkMaxDuration = 0
				arg_677_1.dialogCg_.alpha = 1

				arg_677_1.dialog_:SetActive(true)
				SetActive(arg_677_1.leftNameGo_, false)

				arg_677_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_677_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_677_1:RecordName(arg_677_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_677_1.iconTrs_.gameObject, false)
				arg_677_1.callingController_:SetSelectedState("normal")

				local var_680_8 = arg_677_1:GetWordFromCfg(115311166)
				local var_680_9 = arg_677_1:FormatText(var_680_8.content)

				arg_677_1.text_.text = var_680_9

				LuaForUtil.ClearLinePrefixSymbol(arg_677_1.text_)

				local var_680_10 = 40
				local var_680_11 = utf8.len(var_680_9)
				local var_680_12 = var_680_10 <= 0 and var_680_7 or var_680_7 * (var_680_11 / var_680_10)

				if var_680_12 > 0 and var_680_7 < var_680_12 then
					arg_677_1.talkMaxDuration = var_680_12

					if var_680_12 + var_680_6 > arg_677_1.duration_ then
						arg_677_1.duration_ = var_680_12 + var_680_6
					end
				end

				arg_677_1.text_.text = var_680_9
				arg_677_1.typewritter.percent = 0

				arg_677_1.typewritter:SetDirty()
				arg_677_1:ShowNextGo(false)
				arg_677_1:RecordContent(arg_677_1.text_.text)
			end

			local var_680_13 = math.max(var_680_7, arg_677_1.talkMaxDuration)

			if var_680_6 <= arg_677_1.time_ and arg_677_1.time_ < var_680_6 + var_680_13 then
				arg_677_1.typewritter.percent = (arg_677_1.time_ - var_680_6) / var_680_13

				arg_677_1.typewritter:SetDirty()
			end

			if arg_677_1.time_ >= var_680_6 + var_680_13 and arg_677_1.time_ < var_680_6 + var_680_13 + arg_680_0 then
				arg_677_1.typewritter.percent = 1

				arg_677_1.typewritter:SetDirty()
				arg_677_1:ShowNextGo(true)
			end
		end
	end,
	Play115311167 = function(arg_681_0, arg_681_1)
		arg_681_1.time_ = 0
		arg_681_1.frameCnt_ = 0
		arg_681_1.state_ = "playing"
		arg_681_1.curTalkId_ = 115311167
		arg_681_1.duration_ = 4.066

		local var_681_0 = {
			ja = 3.866,
			ko = 3.4,
			zh = 2.666,
			en = 4.066
		}
		local var_681_1 = manager.audio:GetLocalizationFlag()

		if var_681_0[var_681_1] ~= nil then
			arg_681_1.duration_ = var_681_0[var_681_1]
		end

		SetActive(arg_681_1.tipsGo_, false)

		function arg_681_1.onSingleLineFinish_()
			arg_681_1.onSingleLineUpdate_ = nil
			arg_681_1.onSingleLineFinish_ = nil
			arg_681_1.state_ = "waiting"
		end

		function arg_681_1.playNext_(arg_683_0)
			if arg_683_0 == 1 then
				arg_681_0:Play115311168(arg_681_1)
			end
		end

		function arg_681_1.onSingleLineUpdate_(arg_684_0)
			local var_684_0 = arg_681_1.actors_["10030"]
			local var_684_1 = 0

			if var_684_1 < arg_681_1.time_ and arg_681_1.time_ <= var_684_1 + arg_684_0 and arg_681_1.var_.actorSpriteComps10030 == nil then
				arg_681_1.var_.actorSpriteComps10030 = var_684_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_684_2 = 0.2

			if var_684_1 <= arg_681_1.time_ and arg_681_1.time_ < var_684_1 + var_684_2 then
				local var_684_3 = (arg_681_1.time_ - var_684_1) / var_684_2

				if arg_681_1.var_.actorSpriteComps10030 then
					for iter_684_0, iter_684_1 in pairs(arg_681_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_684_1 then
							local var_684_4 = Mathf.Lerp(iter_684_1.color.r, 1, var_684_3)

							iter_684_1.color = Color.New(var_684_4, var_684_4, var_684_4)
						end
					end
				end
			end

			if arg_681_1.time_ >= var_684_1 + var_684_2 and arg_681_1.time_ < var_684_1 + var_684_2 + arg_684_0 and arg_681_1.var_.actorSpriteComps10030 then
				local var_684_5 = 1

				for iter_684_2, iter_684_3 in pairs(arg_681_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_684_3 then
						iter_684_3.color = Color.New(var_684_5, var_684_5, var_684_5)
					end
				end

				arg_681_1.var_.actorSpriteComps10030 = nil
			end

			local var_684_6 = arg_681_1.actors_["10030"].transform
			local var_684_7 = 0

			if var_684_7 < arg_681_1.time_ and arg_681_1.time_ <= var_684_7 + arg_684_0 then
				arg_681_1.var_.moveOldPos10030 = var_684_6.localPosition
				var_684_6.localScale = Vector3.New(1, 1, 1)

				arg_681_1:CheckSpriteTmpPos("10030", 4)

				local var_684_8 = var_684_6.childCount

				for iter_684_4 = 0, var_684_8 - 1 do
					local var_684_9 = var_684_6:GetChild(iter_684_4)

					if var_684_9.name == "split_1" or not string.find(var_684_9.name, "split") then
						var_684_9.gameObject:SetActive(true)
					else
						var_684_9.gameObject:SetActive(false)
					end
				end
			end

			local var_684_10 = 0.001

			if var_684_7 <= arg_681_1.time_ and arg_681_1.time_ < var_684_7 + var_684_10 then
				local var_684_11 = (arg_681_1.time_ - var_684_7) / var_684_10
				local var_684_12 = Vector3.New(390, -390, 150)

				var_684_6.localPosition = Vector3.Lerp(arg_681_1.var_.moveOldPos10030, var_684_12, var_684_11)
			end

			if arg_681_1.time_ >= var_684_7 + var_684_10 and arg_681_1.time_ < var_684_7 + var_684_10 + arg_684_0 then
				var_684_6.localPosition = Vector3.New(390, -390, 150)
			end

			local var_684_13 = arg_681_1.actors_["10030"]
			local var_684_14 = 0

			if var_684_14 < arg_681_1.time_ and arg_681_1.time_ <= var_684_14 + arg_684_0 then
				local var_684_15 = var_684_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_684_15 then
					arg_681_1.var_.alphaOldValue10030 = var_684_15.alpha
					arg_681_1.var_.characterEffect10030 = var_684_15
				end

				arg_681_1.var_.alphaOldValue10030 = 0
			end

			local var_684_16 = 0.0166666666666667

			if var_684_14 <= arg_681_1.time_ and arg_681_1.time_ < var_684_14 + var_684_16 then
				local var_684_17 = (arg_681_1.time_ - var_684_14) / var_684_16
				local var_684_18 = Mathf.Lerp(arg_681_1.var_.alphaOldValue10030, 1, var_684_17)

				if arg_681_1.var_.characterEffect10030 then
					arg_681_1.var_.characterEffect10030.alpha = var_684_18
				end
			end

			if arg_681_1.time_ >= var_684_14 + var_684_16 and arg_681_1.time_ < var_684_14 + var_684_16 + arg_684_0 and arg_681_1.var_.characterEffect10030 then
				arg_681_1.var_.characterEffect10030.alpha = 1
			end

			local var_684_19 = 0
			local var_684_20 = 0.35

			if var_684_19 < arg_681_1.time_ and arg_681_1.time_ <= var_684_19 + arg_684_0 then
				arg_681_1.talkMaxDuration = 0
				arg_681_1.dialogCg_.alpha = 1

				arg_681_1.dialog_:SetActive(true)
				SetActive(arg_681_1.leftNameGo_, true)

				local var_684_21 = arg_681_1:FormatText(StoryNameCfg[309].name)

				arg_681_1.leftNameTxt_.text = var_684_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_681_1.leftNameTxt_.transform)

				arg_681_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_681_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_681_1:RecordName(arg_681_1.leftNameTxt_.text)
				SetActive(arg_681_1.iconTrs_.gameObject, false)
				arg_681_1.callingController_:SetSelectedState("normal")

				local var_684_22 = arg_681_1:GetWordFromCfg(115311167)
				local var_684_23 = arg_681_1:FormatText(var_684_22.content)

				arg_681_1.text_.text = var_684_23

				LuaForUtil.ClearLinePrefixSymbol(arg_681_1.text_)

				local var_684_24 = 14
				local var_684_25 = utf8.len(var_684_23)
				local var_684_26 = var_684_24 <= 0 and var_684_20 or var_684_20 * (var_684_25 / var_684_24)

				if var_684_26 > 0 and var_684_20 < var_684_26 then
					arg_681_1.talkMaxDuration = var_684_26

					if var_684_26 + var_684_19 > arg_681_1.duration_ then
						arg_681_1.duration_ = var_684_26 + var_684_19
					end
				end

				arg_681_1.text_.text = var_684_23
				arg_681_1.typewritter.percent = 0

				arg_681_1.typewritter:SetDirty()
				arg_681_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311167", "story_v_out_115311.awb") ~= 0 then
					local var_684_27 = manager.audio:GetVoiceLength("story_v_out_115311", "115311167", "story_v_out_115311.awb") / 1000

					if var_684_27 + var_684_19 > arg_681_1.duration_ then
						arg_681_1.duration_ = var_684_27 + var_684_19
					end

					if var_684_22.prefab_name ~= "" and arg_681_1.actors_[var_684_22.prefab_name] ~= nil then
						local var_684_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_681_1.actors_[var_684_22.prefab_name].transform, "story_v_out_115311", "115311167", "story_v_out_115311.awb")

						arg_681_1:RecordAudio("115311167", var_684_28)
						arg_681_1:RecordAudio("115311167", var_684_28)
					else
						arg_681_1:AudioAction("play", "voice", "story_v_out_115311", "115311167", "story_v_out_115311.awb")
					end

					arg_681_1:RecordHistoryTalkVoice("story_v_out_115311", "115311167", "story_v_out_115311.awb")
				end

				arg_681_1:RecordContent(arg_681_1.text_.text)
			end

			local var_684_29 = math.max(var_684_20, arg_681_1.talkMaxDuration)

			if var_684_19 <= arg_681_1.time_ and arg_681_1.time_ < var_684_19 + var_684_29 then
				arg_681_1.typewritter.percent = (arg_681_1.time_ - var_684_19) / var_684_29

				arg_681_1.typewritter:SetDirty()
			end

			if arg_681_1.time_ >= var_684_19 + var_684_29 and arg_681_1.time_ < var_684_19 + var_684_29 + arg_684_0 then
				arg_681_1.typewritter.percent = 1

				arg_681_1.typewritter:SetDirty()
				arg_681_1:ShowNextGo(true)
			end
		end
	end,
	Play115311168 = function(arg_685_0, arg_685_1)
		arg_685_1.time_ = 0
		arg_685_1.frameCnt_ = 0
		arg_685_1.state_ = "playing"
		arg_685_1.curTalkId_ = 115311168
		arg_685_1.duration_ = 5

		SetActive(arg_685_1.tipsGo_, false)

		function arg_685_1.onSingleLineFinish_()
			arg_685_1.onSingleLineUpdate_ = nil
			arg_685_1.onSingleLineFinish_ = nil
			arg_685_1.state_ = "waiting"
		end

		function arg_685_1.playNext_(arg_687_0)
			if arg_687_0 == 1 then
				arg_685_0:Play115311169(arg_685_1)
			end
		end

		function arg_685_1.onSingleLineUpdate_(arg_688_0)
			local var_688_0 = arg_685_1.actors_["10030"]
			local var_688_1 = 0

			if var_688_1 < arg_685_1.time_ and arg_685_1.time_ <= var_688_1 + arg_688_0 and arg_685_1.var_.actorSpriteComps10030 == nil then
				arg_685_1.var_.actorSpriteComps10030 = var_688_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_688_2 = 0.2

			if var_688_1 <= arg_685_1.time_ and arg_685_1.time_ < var_688_1 + var_688_2 then
				local var_688_3 = (arg_685_1.time_ - var_688_1) / var_688_2

				if arg_685_1.var_.actorSpriteComps10030 then
					for iter_688_0, iter_688_1 in pairs(arg_685_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_688_1 then
							local var_688_4 = Mathf.Lerp(iter_688_1.color.r, 0.5, var_688_3)

							iter_688_1.color = Color.New(var_688_4, var_688_4, var_688_4)
						end
					end
				end
			end

			if arg_685_1.time_ >= var_688_1 + var_688_2 and arg_685_1.time_ < var_688_1 + var_688_2 + arg_688_0 and arg_685_1.var_.actorSpriteComps10030 then
				local var_688_5 = 0.5

				for iter_688_2, iter_688_3 in pairs(arg_685_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_688_3 then
						iter_688_3.color = Color.New(var_688_5, var_688_5, var_688_5)
					end
				end

				arg_685_1.var_.actorSpriteComps10030 = nil
			end

			local var_688_6 = 0
			local var_688_7 = 0.7

			if var_688_6 < arg_685_1.time_ and arg_685_1.time_ <= var_688_6 + arg_688_0 then
				arg_685_1.talkMaxDuration = 0
				arg_685_1.dialogCg_.alpha = 1

				arg_685_1.dialog_:SetActive(true)
				SetActive(arg_685_1.leftNameGo_, false)

				arg_685_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_685_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_685_1:RecordName(arg_685_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_685_1.iconTrs_.gameObject, false)
				arg_685_1.callingController_:SetSelectedState("normal")

				local var_688_8 = arg_685_1:GetWordFromCfg(115311168)
				local var_688_9 = arg_685_1:FormatText(var_688_8.content)

				arg_685_1.text_.text = var_688_9

				LuaForUtil.ClearLinePrefixSymbol(arg_685_1.text_)

				local var_688_10 = 28
				local var_688_11 = utf8.len(var_688_9)
				local var_688_12 = var_688_10 <= 0 and var_688_7 or var_688_7 * (var_688_11 / var_688_10)

				if var_688_12 > 0 and var_688_7 < var_688_12 then
					arg_685_1.talkMaxDuration = var_688_12

					if var_688_12 + var_688_6 > arg_685_1.duration_ then
						arg_685_1.duration_ = var_688_12 + var_688_6
					end
				end

				arg_685_1.text_.text = var_688_9
				arg_685_1.typewritter.percent = 0

				arg_685_1.typewritter:SetDirty()
				arg_685_1:ShowNextGo(false)
				arg_685_1:RecordContent(arg_685_1.text_.text)
			end

			local var_688_13 = math.max(var_688_7, arg_685_1.talkMaxDuration)

			if var_688_6 <= arg_685_1.time_ and arg_685_1.time_ < var_688_6 + var_688_13 then
				arg_685_1.typewritter.percent = (arg_685_1.time_ - var_688_6) / var_688_13

				arg_685_1.typewritter:SetDirty()
			end

			if arg_685_1.time_ >= var_688_6 + var_688_13 and arg_685_1.time_ < var_688_6 + var_688_13 + arg_688_0 then
				arg_685_1.typewritter.percent = 1

				arg_685_1.typewritter:SetDirty()
				arg_685_1:ShowNextGo(true)
			end
		end
	end,
	Play115311169 = function(arg_689_0, arg_689_1)
		arg_689_1.time_ = 0
		arg_689_1.frameCnt_ = 0
		arg_689_1.state_ = "playing"
		arg_689_1.curTalkId_ = 115311169
		arg_689_1.duration_ = 3

		local var_689_0 = {
			ja = 3,
			ko = 1.666,
			zh = 2.866,
			en = 1.8
		}
		local var_689_1 = manager.audio:GetLocalizationFlag()

		if var_689_0[var_689_1] ~= nil then
			arg_689_1.duration_ = var_689_0[var_689_1]
		end

		SetActive(arg_689_1.tipsGo_, false)

		function arg_689_1.onSingleLineFinish_()
			arg_689_1.onSingleLineUpdate_ = nil
			arg_689_1.onSingleLineFinish_ = nil
			arg_689_1.state_ = "waiting"
		end

		function arg_689_1.playNext_(arg_691_0)
			if arg_691_0 == 1 then
				arg_689_0:Play115311170(arg_689_1)
			end
		end

		function arg_689_1.onSingleLineUpdate_(arg_692_0)
			local var_692_0 = arg_689_1.actors_["1038"]
			local var_692_1 = 0

			if var_692_1 < arg_689_1.time_ and arg_689_1.time_ <= var_692_1 + arg_692_0 and arg_689_1.var_.actorSpriteComps1038 == nil then
				arg_689_1.var_.actorSpriteComps1038 = var_692_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_692_2 = 0.2

			if var_692_1 <= arg_689_1.time_ and arg_689_1.time_ < var_692_1 + var_692_2 then
				local var_692_3 = (arg_689_1.time_ - var_692_1) / var_692_2

				if arg_689_1.var_.actorSpriteComps1038 then
					for iter_692_0, iter_692_1 in pairs(arg_689_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_692_1 then
							local var_692_4 = Mathf.Lerp(iter_692_1.color.r, 1, var_692_3)

							iter_692_1.color = Color.New(var_692_4, var_692_4, var_692_4)
						end
					end
				end
			end

			if arg_689_1.time_ >= var_692_1 + var_692_2 and arg_689_1.time_ < var_692_1 + var_692_2 + arg_692_0 and arg_689_1.var_.actorSpriteComps1038 then
				local var_692_5 = 1

				for iter_692_2, iter_692_3 in pairs(arg_689_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_692_3 then
						iter_692_3.color = Color.New(var_692_5, var_692_5, var_692_5)
					end
				end

				arg_689_1.var_.actorSpriteComps1038 = nil
			end

			local var_692_6 = arg_689_1.actors_["1038"].transform
			local var_692_7 = 0

			if var_692_7 < arg_689_1.time_ and arg_689_1.time_ <= var_692_7 + arg_692_0 then
				arg_689_1.var_.moveOldPos1038 = var_692_6.localPosition
				var_692_6.localScale = Vector3.New(1, 1, 1)

				arg_689_1:CheckSpriteTmpPos("1038", 2)

				local var_692_8 = var_692_6.childCount

				for iter_692_4 = 0, var_692_8 - 1 do
					local var_692_9 = var_692_6:GetChild(iter_692_4)

					if var_692_9.name == "split_7" or not string.find(var_692_9.name, "split") then
						var_692_9.gameObject:SetActive(true)
					else
						var_692_9.gameObject:SetActive(false)
					end
				end
			end

			local var_692_10 = 0.001

			if var_692_7 <= arg_689_1.time_ and arg_689_1.time_ < var_692_7 + var_692_10 then
				local var_692_11 = (arg_689_1.time_ - var_692_7) / var_692_10
				local var_692_12 = Vector3.New(-390, -400, 0)

				var_692_6.localPosition = Vector3.Lerp(arg_689_1.var_.moveOldPos1038, var_692_12, var_692_11)
			end

			if arg_689_1.time_ >= var_692_7 + var_692_10 and arg_689_1.time_ < var_692_7 + var_692_10 + arg_692_0 then
				var_692_6.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_692_13 = 0
			local var_692_14 = 0.2

			if var_692_13 < arg_689_1.time_ and arg_689_1.time_ <= var_692_13 + arg_692_0 then
				arg_689_1.talkMaxDuration = 0
				arg_689_1.dialogCg_.alpha = 1

				arg_689_1.dialog_:SetActive(true)
				SetActive(arg_689_1.leftNameGo_, true)

				local var_692_15 = arg_689_1:FormatText(StoryNameCfg[94].name)

				arg_689_1.leftNameTxt_.text = var_692_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_689_1.leftNameTxt_.transform)

				arg_689_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_689_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_689_1:RecordName(arg_689_1.leftNameTxt_.text)
				SetActive(arg_689_1.iconTrs_.gameObject, false)
				arg_689_1.callingController_:SetSelectedState("normal")

				local var_692_16 = arg_689_1:GetWordFromCfg(115311169)
				local var_692_17 = arg_689_1:FormatText(var_692_16.content)

				arg_689_1.text_.text = var_692_17

				LuaForUtil.ClearLinePrefixSymbol(arg_689_1.text_)

				local var_692_18 = 8
				local var_692_19 = utf8.len(var_692_17)
				local var_692_20 = var_692_18 <= 0 and var_692_14 or var_692_14 * (var_692_19 / var_692_18)

				if var_692_20 > 0 and var_692_14 < var_692_20 then
					arg_689_1.talkMaxDuration = var_692_20

					if var_692_20 + var_692_13 > arg_689_1.duration_ then
						arg_689_1.duration_ = var_692_20 + var_692_13
					end
				end

				arg_689_1.text_.text = var_692_17
				arg_689_1.typewritter.percent = 0

				arg_689_1.typewritter:SetDirty()
				arg_689_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311169", "story_v_out_115311.awb") ~= 0 then
					local var_692_21 = manager.audio:GetVoiceLength("story_v_out_115311", "115311169", "story_v_out_115311.awb") / 1000

					if var_692_21 + var_692_13 > arg_689_1.duration_ then
						arg_689_1.duration_ = var_692_21 + var_692_13
					end

					if var_692_16.prefab_name ~= "" and arg_689_1.actors_[var_692_16.prefab_name] ~= nil then
						local var_692_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_689_1.actors_[var_692_16.prefab_name].transform, "story_v_out_115311", "115311169", "story_v_out_115311.awb")

						arg_689_1:RecordAudio("115311169", var_692_22)
						arg_689_1:RecordAudio("115311169", var_692_22)
					else
						arg_689_1:AudioAction("play", "voice", "story_v_out_115311", "115311169", "story_v_out_115311.awb")
					end

					arg_689_1:RecordHistoryTalkVoice("story_v_out_115311", "115311169", "story_v_out_115311.awb")
				end

				arg_689_1:RecordContent(arg_689_1.text_.text)
			end

			local var_692_23 = math.max(var_692_14, arg_689_1.talkMaxDuration)

			if var_692_13 <= arg_689_1.time_ and arg_689_1.time_ < var_692_13 + var_692_23 then
				arg_689_1.typewritter.percent = (arg_689_1.time_ - var_692_13) / var_692_23

				arg_689_1.typewritter:SetDirty()
			end

			if arg_689_1.time_ >= var_692_13 + var_692_23 and arg_689_1.time_ < var_692_13 + var_692_23 + arg_692_0 then
				arg_689_1.typewritter.percent = 1

				arg_689_1.typewritter:SetDirty()
				arg_689_1:ShowNextGo(true)
			end
		end
	end,
	Play115311170 = function(arg_693_0, arg_693_1)
		arg_693_1.time_ = 0
		arg_693_1.frameCnt_ = 0
		arg_693_1.state_ = "playing"
		arg_693_1.curTalkId_ = 115311170
		arg_693_1.duration_ = 7.166

		local var_693_0 = {
			ja = 7.1,
			ko = 5.233,
			zh = 6.8,
			en = 7.166
		}
		local var_693_1 = manager.audio:GetLocalizationFlag()

		if var_693_0[var_693_1] ~= nil then
			arg_693_1.duration_ = var_693_0[var_693_1]
		end

		SetActive(arg_693_1.tipsGo_, false)

		function arg_693_1.onSingleLineFinish_()
			arg_693_1.onSingleLineUpdate_ = nil
			arg_693_1.onSingleLineFinish_ = nil
			arg_693_1.state_ = "waiting"
		end

		function arg_693_1.playNext_(arg_695_0)
			if arg_695_0 == 1 then
				arg_693_0:Play115311171(arg_693_1)
			end
		end

		function arg_693_1.onSingleLineUpdate_(arg_696_0)
			local var_696_0 = arg_693_1.actors_["10030"].transform
			local var_696_1 = 0

			if var_696_1 < arg_693_1.time_ and arg_693_1.time_ <= var_696_1 + arg_696_0 then
				arg_693_1.var_.moveOldPos10030 = var_696_0.localPosition
				var_696_0.localScale = Vector3.New(1, 1, 1)

				arg_693_1:CheckSpriteTmpPos("10030", 4)

				local var_696_2 = var_696_0.childCount

				for iter_696_0 = 0, var_696_2 - 1 do
					local var_696_3 = var_696_0:GetChild(iter_696_0)

					if var_696_3.name == "split_3" or not string.find(var_696_3.name, "split") then
						var_696_3.gameObject:SetActive(true)
					else
						var_696_3.gameObject:SetActive(false)
					end
				end
			end

			local var_696_4 = 0.001

			if var_696_1 <= arg_693_1.time_ and arg_693_1.time_ < var_696_1 + var_696_4 then
				local var_696_5 = (arg_693_1.time_ - var_696_1) / var_696_4
				local var_696_6 = Vector3.New(390, -390, 150)

				var_696_0.localPosition = Vector3.Lerp(arg_693_1.var_.moveOldPos10030, var_696_6, var_696_5)
			end

			if arg_693_1.time_ >= var_696_1 + var_696_4 and arg_693_1.time_ < var_696_1 + var_696_4 + arg_696_0 then
				var_696_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_696_7 = arg_693_1.actors_["10030"]
			local var_696_8 = 0

			if var_696_8 < arg_693_1.time_ and arg_693_1.time_ <= var_696_8 + arg_696_0 and arg_693_1.var_.actorSpriteComps10030 == nil then
				arg_693_1.var_.actorSpriteComps10030 = var_696_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_696_9 = 0.2

			if var_696_8 <= arg_693_1.time_ and arg_693_1.time_ < var_696_8 + var_696_9 then
				local var_696_10 = (arg_693_1.time_ - var_696_8) / var_696_9

				if arg_693_1.var_.actorSpriteComps10030 then
					for iter_696_1, iter_696_2 in pairs(arg_693_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_696_2 then
							local var_696_11 = Mathf.Lerp(iter_696_2.color.r, 1, var_696_10)

							iter_696_2.color = Color.New(var_696_11, var_696_11, var_696_11)
						end
					end
				end
			end

			if arg_693_1.time_ >= var_696_8 + var_696_9 and arg_693_1.time_ < var_696_8 + var_696_9 + arg_696_0 and arg_693_1.var_.actorSpriteComps10030 then
				local var_696_12 = 1

				for iter_696_3, iter_696_4 in pairs(arg_693_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_696_4 then
						iter_696_4.color = Color.New(var_696_12, var_696_12, var_696_12)
					end
				end

				arg_693_1.var_.actorSpriteComps10030 = nil
			end

			local var_696_13 = arg_693_1.actors_["1038"]
			local var_696_14 = 0

			if var_696_14 < arg_693_1.time_ and arg_693_1.time_ <= var_696_14 + arg_696_0 and arg_693_1.var_.actorSpriteComps1038 == nil then
				arg_693_1.var_.actorSpriteComps1038 = var_696_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_696_15 = 0.2

			if var_696_14 <= arg_693_1.time_ and arg_693_1.time_ < var_696_14 + var_696_15 then
				local var_696_16 = (arg_693_1.time_ - var_696_14) / var_696_15

				if arg_693_1.var_.actorSpriteComps1038 then
					for iter_696_5, iter_696_6 in pairs(arg_693_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_696_6 then
							local var_696_17 = Mathf.Lerp(iter_696_6.color.r, 0.5, var_696_16)

							iter_696_6.color = Color.New(var_696_17, var_696_17, var_696_17)
						end
					end
				end
			end

			if arg_693_1.time_ >= var_696_14 + var_696_15 and arg_693_1.time_ < var_696_14 + var_696_15 + arg_696_0 and arg_693_1.var_.actorSpriteComps1038 then
				local var_696_18 = 0.5

				for iter_696_7, iter_696_8 in pairs(arg_693_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_696_8 then
						iter_696_8.color = Color.New(var_696_18, var_696_18, var_696_18)
					end
				end

				arg_693_1.var_.actorSpriteComps1038 = nil
			end

			local var_696_19 = 0
			local var_696_20 = 0.725

			if var_696_19 < arg_693_1.time_ and arg_693_1.time_ <= var_696_19 + arg_696_0 then
				arg_693_1.talkMaxDuration = 0
				arg_693_1.dialogCg_.alpha = 1

				arg_693_1.dialog_:SetActive(true)
				SetActive(arg_693_1.leftNameGo_, true)

				local var_696_21 = arg_693_1:FormatText(StoryNameCfg[309].name)

				arg_693_1.leftNameTxt_.text = var_696_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_693_1.leftNameTxt_.transform)

				arg_693_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_693_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_693_1:RecordName(arg_693_1.leftNameTxt_.text)
				SetActive(arg_693_1.iconTrs_.gameObject, false)
				arg_693_1.callingController_:SetSelectedState("normal")

				local var_696_22 = arg_693_1:GetWordFromCfg(115311170)
				local var_696_23 = arg_693_1:FormatText(var_696_22.content)

				arg_693_1.text_.text = var_696_23

				LuaForUtil.ClearLinePrefixSymbol(arg_693_1.text_)

				local var_696_24 = 29
				local var_696_25 = utf8.len(var_696_23)
				local var_696_26 = var_696_24 <= 0 and var_696_20 or var_696_20 * (var_696_25 / var_696_24)

				if var_696_26 > 0 and var_696_20 < var_696_26 then
					arg_693_1.talkMaxDuration = var_696_26

					if var_696_26 + var_696_19 > arg_693_1.duration_ then
						arg_693_1.duration_ = var_696_26 + var_696_19
					end
				end

				arg_693_1.text_.text = var_696_23
				arg_693_1.typewritter.percent = 0

				arg_693_1.typewritter:SetDirty()
				arg_693_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311170", "story_v_out_115311.awb") ~= 0 then
					local var_696_27 = manager.audio:GetVoiceLength("story_v_out_115311", "115311170", "story_v_out_115311.awb") / 1000

					if var_696_27 + var_696_19 > arg_693_1.duration_ then
						arg_693_1.duration_ = var_696_27 + var_696_19
					end

					if var_696_22.prefab_name ~= "" and arg_693_1.actors_[var_696_22.prefab_name] ~= nil then
						local var_696_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_693_1.actors_[var_696_22.prefab_name].transform, "story_v_out_115311", "115311170", "story_v_out_115311.awb")

						arg_693_1:RecordAudio("115311170", var_696_28)
						arg_693_1:RecordAudio("115311170", var_696_28)
					else
						arg_693_1:AudioAction("play", "voice", "story_v_out_115311", "115311170", "story_v_out_115311.awb")
					end

					arg_693_1:RecordHistoryTalkVoice("story_v_out_115311", "115311170", "story_v_out_115311.awb")
				end

				arg_693_1:RecordContent(arg_693_1.text_.text)
			end

			local var_696_29 = math.max(var_696_20, arg_693_1.talkMaxDuration)

			if var_696_19 <= arg_693_1.time_ and arg_693_1.time_ < var_696_19 + var_696_29 then
				arg_693_1.typewritter.percent = (arg_693_1.time_ - var_696_19) / var_696_29

				arg_693_1.typewritter:SetDirty()
			end

			if arg_693_1.time_ >= var_696_19 + var_696_29 and arg_693_1.time_ < var_696_19 + var_696_29 + arg_696_0 then
				arg_693_1.typewritter.percent = 1

				arg_693_1.typewritter:SetDirty()
				arg_693_1:ShowNextGo(true)
			end
		end
	end,
	Play115311171 = function(arg_697_0, arg_697_1)
		arg_697_1.time_ = 0
		arg_697_1.frameCnt_ = 0
		arg_697_1.state_ = "playing"
		arg_697_1.curTalkId_ = 115311171
		arg_697_1.duration_ = 5

		SetActive(arg_697_1.tipsGo_, false)

		function arg_697_1.onSingleLineFinish_()
			arg_697_1.onSingleLineUpdate_ = nil
			arg_697_1.onSingleLineFinish_ = nil
			arg_697_1.state_ = "waiting"
		end

		function arg_697_1.playNext_(arg_699_0)
			if arg_699_0 == 1 then
				arg_697_0:Play115311172(arg_697_1)
			end
		end

		function arg_697_1.onSingleLineUpdate_(arg_700_0)
			local var_700_0 = arg_697_1.actors_["10030"]
			local var_700_1 = 0

			if var_700_1 < arg_697_1.time_ and arg_697_1.time_ <= var_700_1 + arg_700_0 then
				local var_700_2 = var_700_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_700_2 then
					arg_697_1.var_.alphaOldValue10030 = var_700_2.alpha
					arg_697_1.var_.characterEffect10030 = var_700_2
				end

				arg_697_1.var_.alphaOldValue10030 = 1
			end

			local var_700_3 = 0.5

			if var_700_1 <= arg_697_1.time_ and arg_697_1.time_ < var_700_1 + var_700_3 then
				local var_700_4 = (arg_697_1.time_ - var_700_1) / var_700_3
				local var_700_5 = Mathf.Lerp(arg_697_1.var_.alphaOldValue10030, 0, var_700_4)

				if arg_697_1.var_.characterEffect10030 then
					arg_697_1.var_.characterEffect10030.alpha = var_700_5
				end
			end

			if arg_697_1.time_ >= var_700_1 + var_700_3 and arg_697_1.time_ < var_700_1 + var_700_3 + arg_700_0 and arg_697_1.var_.characterEffect10030 then
				arg_697_1.var_.characterEffect10030.alpha = 0
			end

			local var_700_6 = arg_697_1.actors_["1038"]
			local var_700_7 = 0

			if var_700_7 < arg_697_1.time_ and arg_697_1.time_ <= var_700_7 + arg_700_0 then
				local var_700_8 = var_700_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_700_8 then
					arg_697_1.var_.alphaOldValue1038 = var_700_8.alpha
					arg_697_1.var_.characterEffect1038 = var_700_8
				end

				arg_697_1.var_.alphaOldValue1038 = 1
			end

			local var_700_9 = 0.5

			if var_700_7 <= arg_697_1.time_ and arg_697_1.time_ < var_700_7 + var_700_9 then
				local var_700_10 = (arg_697_1.time_ - var_700_7) / var_700_9
				local var_700_11 = Mathf.Lerp(arg_697_1.var_.alphaOldValue1038, 0, var_700_10)

				if arg_697_1.var_.characterEffect1038 then
					arg_697_1.var_.characterEffect1038.alpha = var_700_11
				end
			end

			if arg_697_1.time_ >= var_700_7 + var_700_9 and arg_697_1.time_ < var_700_7 + var_700_9 + arg_700_0 and arg_697_1.var_.characterEffect1038 then
				arg_697_1.var_.characterEffect1038.alpha = 0
			end

			local var_700_12 = 0
			local var_700_13 = 0.525

			if var_700_12 < arg_697_1.time_ and arg_697_1.time_ <= var_700_12 + arg_700_0 then
				arg_697_1.talkMaxDuration = 0
				arg_697_1.dialogCg_.alpha = 1

				arg_697_1.dialog_:SetActive(true)
				SetActive(arg_697_1.leftNameGo_, false)

				arg_697_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_697_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_697_1:RecordName(arg_697_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_697_1.iconTrs_.gameObject, false)
				arg_697_1.callingController_:SetSelectedState("normal")

				local var_700_14 = arg_697_1:GetWordFromCfg(115311171)
				local var_700_15 = arg_697_1:FormatText(var_700_14.content)

				arg_697_1.text_.text = var_700_15

				LuaForUtil.ClearLinePrefixSymbol(arg_697_1.text_)

				local var_700_16 = 21
				local var_700_17 = utf8.len(var_700_15)
				local var_700_18 = var_700_16 <= 0 and var_700_13 or var_700_13 * (var_700_17 / var_700_16)

				if var_700_18 > 0 and var_700_13 < var_700_18 then
					arg_697_1.talkMaxDuration = var_700_18

					if var_700_18 + var_700_12 > arg_697_1.duration_ then
						arg_697_1.duration_ = var_700_18 + var_700_12
					end
				end

				arg_697_1.text_.text = var_700_15
				arg_697_1.typewritter.percent = 0

				arg_697_1.typewritter:SetDirty()
				arg_697_1:ShowNextGo(false)
				arg_697_1:RecordContent(arg_697_1.text_.text)
			end

			local var_700_19 = math.max(var_700_13, arg_697_1.talkMaxDuration)

			if var_700_12 <= arg_697_1.time_ and arg_697_1.time_ < var_700_12 + var_700_19 then
				arg_697_1.typewritter.percent = (arg_697_1.time_ - var_700_12) / var_700_19

				arg_697_1.typewritter:SetDirty()
			end

			if arg_697_1.time_ >= var_700_12 + var_700_19 and arg_697_1.time_ < var_700_12 + var_700_19 + arg_700_0 then
				arg_697_1.typewritter.percent = 1

				arg_697_1.typewritter:SetDirty()
				arg_697_1:ShowNextGo(true)
			end
		end
	end,
	Play115311172 = function(arg_701_0, arg_701_1)
		arg_701_1.time_ = 0
		arg_701_1.frameCnt_ = 0
		arg_701_1.state_ = "playing"
		arg_701_1.curTalkId_ = 115311172
		arg_701_1.duration_ = 4.166

		local var_701_0 = {
			ja = 4.166,
			ko = 3.033,
			zh = 3.7,
			en = 2.533
		}
		local var_701_1 = manager.audio:GetLocalizationFlag()

		if var_701_0[var_701_1] ~= nil then
			arg_701_1.duration_ = var_701_0[var_701_1]
		end

		SetActive(arg_701_1.tipsGo_, false)

		function arg_701_1.onSingleLineFinish_()
			arg_701_1.onSingleLineUpdate_ = nil
			arg_701_1.onSingleLineFinish_ = nil
			arg_701_1.state_ = "waiting"
		end

		function arg_701_1.playNext_(arg_703_0)
			if arg_703_0 == 1 then
				arg_701_0:Play115311173(arg_701_1)
			end
		end

		function arg_701_1.onSingleLineUpdate_(arg_704_0)
			local var_704_0 = arg_701_1.actors_["10030"].transform
			local var_704_1 = 0

			if var_704_1 < arg_701_1.time_ and arg_701_1.time_ <= var_704_1 + arg_704_0 then
				arg_701_1.var_.moveOldPos10030 = var_704_0.localPosition
				var_704_0.localScale = Vector3.New(1, 1, 1)

				arg_701_1:CheckSpriteTmpPos("10030", 3)

				local var_704_2 = var_704_0.childCount

				for iter_704_0 = 0, var_704_2 - 1 do
					local var_704_3 = var_704_0:GetChild(iter_704_0)

					if var_704_3.name == "split_2" or not string.find(var_704_3.name, "split") then
						var_704_3.gameObject:SetActive(true)
					else
						var_704_3.gameObject:SetActive(false)
					end
				end
			end

			local var_704_4 = 0.001

			if var_704_1 <= arg_701_1.time_ and arg_701_1.time_ < var_704_1 + var_704_4 then
				local var_704_5 = (arg_701_1.time_ - var_704_1) / var_704_4
				local var_704_6 = Vector3.New(0, -390, 150)

				var_704_0.localPosition = Vector3.Lerp(arg_701_1.var_.moveOldPos10030, var_704_6, var_704_5)
			end

			if arg_701_1.time_ >= var_704_1 + var_704_4 and arg_701_1.time_ < var_704_1 + var_704_4 + arg_704_0 then
				var_704_0.localPosition = Vector3.New(0, -390, 150)
			end

			local var_704_7 = arg_701_1.actors_["10030"]
			local var_704_8 = 0

			if var_704_8 < arg_701_1.time_ and arg_701_1.time_ <= var_704_8 + arg_704_0 and arg_701_1.var_.actorSpriteComps10030 == nil then
				arg_701_1.var_.actorSpriteComps10030 = var_704_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_704_9 = 0.2

			if var_704_8 <= arg_701_1.time_ and arg_701_1.time_ < var_704_8 + var_704_9 then
				local var_704_10 = (arg_701_1.time_ - var_704_8) / var_704_9

				if arg_701_1.var_.actorSpriteComps10030 then
					for iter_704_1, iter_704_2 in pairs(arg_701_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_704_2 then
							local var_704_11 = Mathf.Lerp(iter_704_2.color.r, 1, var_704_10)

							iter_704_2.color = Color.New(var_704_11, var_704_11, var_704_11)
						end
					end
				end
			end

			if arg_701_1.time_ >= var_704_8 + var_704_9 and arg_701_1.time_ < var_704_8 + var_704_9 + arg_704_0 and arg_701_1.var_.actorSpriteComps10030 then
				local var_704_12 = 1

				for iter_704_3, iter_704_4 in pairs(arg_701_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_704_4 then
						iter_704_4.color = Color.New(var_704_12, var_704_12, var_704_12)
					end
				end

				arg_701_1.var_.actorSpriteComps10030 = nil
			end

			local var_704_13 = arg_701_1.actors_["10030"]
			local var_704_14 = 0

			if var_704_14 < arg_701_1.time_ and arg_701_1.time_ <= var_704_14 + arg_704_0 then
				local var_704_15 = var_704_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_704_15 then
					arg_701_1.var_.alphaOldValue10030 = var_704_15.alpha
					arg_701_1.var_.characterEffect10030 = var_704_15
				end

				arg_701_1.var_.alphaOldValue10030 = 0
			end

			local var_704_16 = 0.5

			if var_704_14 <= arg_701_1.time_ and arg_701_1.time_ < var_704_14 + var_704_16 then
				local var_704_17 = (arg_701_1.time_ - var_704_14) / var_704_16
				local var_704_18 = Mathf.Lerp(arg_701_1.var_.alphaOldValue10030, 1, var_704_17)

				if arg_701_1.var_.characterEffect10030 then
					arg_701_1.var_.characterEffect10030.alpha = var_704_18
				end
			end

			if arg_701_1.time_ >= var_704_14 + var_704_16 and arg_701_1.time_ < var_704_14 + var_704_16 + arg_704_0 and arg_701_1.var_.characterEffect10030 then
				arg_701_1.var_.characterEffect10030.alpha = 1
			end

			local var_704_19 = 0
			local var_704_20 = 0.25

			if var_704_19 < arg_701_1.time_ and arg_701_1.time_ <= var_704_19 + arg_704_0 then
				arg_701_1.talkMaxDuration = 0
				arg_701_1.dialogCg_.alpha = 1

				arg_701_1.dialog_:SetActive(true)
				SetActive(arg_701_1.leftNameGo_, true)

				local var_704_21 = arg_701_1:FormatText(StoryNameCfg[309].name)

				arg_701_1.leftNameTxt_.text = var_704_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_701_1.leftNameTxt_.transform)

				arg_701_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_701_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_701_1:RecordName(arg_701_1.leftNameTxt_.text)
				SetActive(arg_701_1.iconTrs_.gameObject, false)
				arg_701_1.callingController_:SetSelectedState("normal")

				local var_704_22 = arg_701_1:GetWordFromCfg(115311172)
				local var_704_23 = arg_701_1:FormatText(var_704_22.content)

				arg_701_1.text_.text = var_704_23

				LuaForUtil.ClearLinePrefixSymbol(arg_701_1.text_)

				local var_704_24 = 10
				local var_704_25 = utf8.len(var_704_23)
				local var_704_26 = var_704_24 <= 0 and var_704_20 or var_704_20 * (var_704_25 / var_704_24)

				if var_704_26 > 0 and var_704_20 < var_704_26 then
					arg_701_1.talkMaxDuration = var_704_26

					if var_704_26 + var_704_19 > arg_701_1.duration_ then
						arg_701_1.duration_ = var_704_26 + var_704_19
					end
				end

				arg_701_1.text_.text = var_704_23
				arg_701_1.typewritter.percent = 0

				arg_701_1.typewritter:SetDirty()
				arg_701_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115311", "115311172", "story_v_out_115311.awb") ~= 0 then
					local var_704_27 = manager.audio:GetVoiceLength("story_v_out_115311", "115311172", "story_v_out_115311.awb") / 1000

					if var_704_27 + var_704_19 > arg_701_1.duration_ then
						arg_701_1.duration_ = var_704_27 + var_704_19
					end

					if var_704_22.prefab_name ~= "" and arg_701_1.actors_[var_704_22.prefab_name] ~= nil then
						local var_704_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_701_1.actors_[var_704_22.prefab_name].transform, "story_v_out_115311", "115311172", "story_v_out_115311.awb")

						arg_701_1:RecordAudio("115311172", var_704_28)
						arg_701_1:RecordAudio("115311172", var_704_28)
					else
						arg_701_1:AudioAction("play", "voice", "story_v_out_115311", "115311172", "story_v_out_115311.awb")
					end

					arg_701_1:RecordHistoryTalkVoice("story_v_out_115311", "115311172", "story_v_out_115311.awb")
				end

				arg_701_1:RecordContent(arg_701_1.text_.text)
			end

			local var_704_29 = math.max(var_704_20, arg_701_1.talkMaxDuration)

			if var_704_19 <= arg_701_1.time_ and arg_701_1.time_ < var_704_19 + var_704_29 then
				arg_701_1.typewritter.percent = (arg_701_1.time_ - var_704_19) / var_704_29

				arg_701_1.typewritter:SetDirty()
			end

			if arg_701_1.time_ >= var_704_19 + var_704_29 and arg_701_1.time_ < var_704_19 + var_704_29 + arg_704_0 then
				arg_701_1.typewritter.percent = 1

				arg_701_1.typewritter:SetDirty()
				arg_701_1:ShowNextGo(true)
			end
		end
	end,
	Play115311173 = function(arg_705_0, arg_705_1)
		arg_705_1.time_ = 0
		arg_705_1.frameCnt_ = 0
		arg_705_1.state_ = "playing"
		arg_705_1.curTalkId_ = 115311173
		arg_705_1.duration_ = 4.499999999999

		SetActive(arg_705_1.tipsGo_, false)

		function arg_705_1.onSingleLineFinish_()
			arg_705_1.onSingleLineUpdate_ = nil
			arg_705_1.onSingleLineFinish_ = nil
			arg_705_1.state_ = "waiting"
		end

		function arg_705_1.playNext_(arg_707_0)
			if arg_707_0 == 1 then
				arg_705_0:Play115311174(arg_705_1)
			end
		end

		function arg_705_1.onSingleLineUpdate_(arg_708_0)
			local var_708_0 = arg_705_1.actors_["10030"].transform
			local var_708_1 = 1.966

			if var_708_1 < arg_705_1.time_ and arg_705_1.time_ <= var_708_1 + arg_708_0 then
				arg_705_1.var_.moveOldPos10030 = var_708_0.localPosition
				var_708_0.localScale = Vector3.New(1, 1, 1)

				arg_705_1:CheckSpriteTmpPos("10030", 7)

				local var_708_2 = var_708_0.childCount

				for iter_708_0 = 0, var_708_2 - 1 do
					local var_708_3 = var_708_0:GetChild(iter_708_0)

					if var_708_3.name == "split_2" or not string.find(var_708_3.name, "split") then
						var_708_3.gameObject:SetActive(true)
					else
						var_708_3.gameObject:SetActive(false)
					end
				end
			end

			local var_708_4 = 0.001

			if var_708_1 <= arg_705_1.time_ and arg_705_1.time_ < var_708_1 + var_708_4 then
				local var_708_5 = (arg_705_1.time_ - var_708_1) / var_708_4
				local var_708_6 = Vector3.New(0, -2000, 150)

				var_708_0.localPosition = Vector3.Lerp(arg_705_1.var_.moveOldPos10030, var_708_6, var_708_5)
			end

			if arg_705_1.time_ >= var_708_1 + var_708_4 and arg_705_1.time_ < var_708_1 + var_708_4 + arg_708_0 then
				var_708_0.localPosition = Vector3.New(0, -2000, 150)
			end

			local var_708_7 = 0

			if var_708_7 < arg_705_1.time_ and arg_705_1.time_ <= var_708_7 + arg_708_0 then
				arg_705_1.mask_.enabled = true
				arg_705_1.mask_.raycastTarget = true

				arg_705_1:SetGaussion(false)
			end

			local var_708_8 = 2

			if var_708_7 <= arg_705_1.time_ and arg_705_1.time_ < var_708_7 + var_708_8 then
				local var_708_9 = (arg_705_1.time_ - var_708_7) / var_708_8
				local var_708_10 = Color.New(0, 0, 0)

				var_708_10.a = Mathf.Lerp(0, 1, var_708_9)
				arg_705_1.mask_.color = var_708_10
			end

			if arg_705_1.time_ >= var_708_7 + var_708_8 and arg_705_1.time_ < var_708_7 + var_708_8 + arg_708_0 then
				local var_708_11 = Color.New(0, 0, 0)

				var_708_11.a = 1
				arg_705_1.mask_.color = var_708_11
			end

			local var_708_12 = 2

			if var_708_12 < arg_705_1.time_ and arg_705_1.time_ <= var_708_12 + arg_708_0 then
				arg_705_1.mask_.enabled = true
				arg_705_1.mask_.raycastTarget = true

				arg_705_1:SetGaussion(false)
			end

			local var_708_13 = 2

			if var_708_12 <= arg_705_1.time_ and arg_705_1.time_ < var_708_12 + var_708_13 then
				local var_708_14 = (arg_705_1.time_ - var_708_12) / var_708_13
				local var_708_15 = Color.New(0, 0, 0)

				var_708_15.a = Mathf.Lerp(1, 0, var_708_14)
				arg_705_1.mask_.color = var_708_15
			end

			if arg_705_1.time_ >= var_708_12 + var_708_13 and arg_705_1.time_ < var_708_12 + var_708_13 + arg_708_0 then
				local var_708_16 = Color.New(0, 0, 0)
				local var_708_17 = 0

				arg_705_1.mask_.enabled = false
				var_708_16.a = var_708_17
				arg_705_1.mask_.color = var_708_16
			end

			local var_708_18 = 2

			if var_708_18 < arg_705_1.time_ and arg_705_1.time_ <= var_708_18 + arg_708_0 then
				arg_705_1.fswbg_:SetActive(true)
				arg_705_1.dialog_:SetActive(false)

				arg_705_1.fswtw_.percent = 0

				local var_708_19 = arg_705_1:GetWordFromCfg(115311173)
				local var_708_20 = arg_705_1:FormatText(var_708_19.content)

				arg_705_1.fswt_.text = var_708_20

				LuaForUtil.ClearLinePrefixSymbol(arg_705_1.fswt_)

				arg_705_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_705_1.fswtw_:SetDirty()

				arg_705_1.typewritterCharCountI18N = 0

				SetActive(arg_705_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_705_1:ShowNextGo(false)
			end

			local var_708_21 = 2.01666666666667

			if var_708_21 < arg_705_1.time_ and arg_705_1.time_ <= var_708_21 + arg_708_0 then
				arg_705_1.var_.oldValueTypewriter = arg_705_1.fswtw_.percent

				arg_705_1:ShowNextGo(false)
			end

			local var_708_22 = 22
			local var_708_23 = 1.46666666666667
			local var_708_24 = arg_705_1:GetWordFromCfg(115311173)
			local var_708_25 = arg_705_1:FormatText(var_708_24.content)
			local var_708_26, var_708_27 = arg_705_1:GetPercentByPara(var_708_25, 1)

			if var_708_21 < arg_705_1.time_ and arg_705_1.time_ <= var_708_21 + arg_708_0 then
				arg_705_1.talkMaxDuration = 0

				local var_708_28 = var_708_22 <= 0 and var_708_23 or var_708_23 * ((var_708_27 - arg_705_1.typewritterCharCountI18N) / var_708_22)

				if var_708_28 > 0 and var_708_23 < var_708_28 then
					arg_705_1.talkMaxDuration = var_708_28

					if var_708_28 + var_708_21 > arg_705_1.duration_ then
						arg_705_1.duration_ = var_708_28 + var_708_21
					end
				end
			end

			local var_708_29 = 1.46666666666667
			local var_708_30 = math.max(var_708_29, arg_705_1.talkMaxDuration)

			if var_708_21 <= arg_705_1.time_ and arg_705_1.time_ < var_708_21 + var_708_30 then
				local var_708_31 = (arg_705_1.time_ - var_708_21) / var_708_30

				arg_705_1.fswtw_.percent = Mathf.Lerp(arg_705_1.var_.oldValueTypewriter, var_708_26, var_708_31)
				arg_705_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_705_1.fswtw_:SetDirty()
			end

			if arg_705_1.time_ >= var_708_21 + var_708_30 and arg_705_1.time_ < var_708_21 + var_708_30 + arg_708_0 then
				arg_705_1.fswtw_.percent = var_708_26

				arg_705_1.fswtw_:SetDirty()
				arg_705_1:ShowNextGo(true)

				arg_705_1.typewritterCharCountI18N = var_708_27
			end

			local var_708_32 = 2

			if var_708_32 < arg_705_1.time_ and arg_705_1.time_ <= var_708_32 + arg_708_0 then
				local var_708_33 = arg_705_1.fswbg_.transform:Find("textbox/adapt/content") or arg_705_1.fswbg_.transform:Find("textbox/content")
				local var_708_34 = var_708_33:GetComponent("Text")
				local var_708_35 = var_708_33:GetComponent("RectTransform")

				var_708_34.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_708_35.offsetMin = Vector2.New(0, 0)
				var_708_35.offsetMax = Vector2.New(0, 0)
			end

			local var_708_36 = 2.01666666666667

			if var_708_36 < arg_705_1.time_ and arg_705_1.time_ <= var_708_36 + arg_708_0 then
				local var_708_37 = manager.ui.mainCamera.transform.localPosition
				local var_708_38 = Vector3.New(0, 0, 10) + Vector3.New(var_708_37.x, var_708_37.y, 0)
				local var_708_39 = arg_705_1.bgs_.ST22a

				var_708_39.transform.localPosition = var_708_38
				var_708_39.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_708_40 = var_708_39:GetComponent("SpriteRenderer")

				if var_708_40 and var_708_40.sprite then
					local var_708_41 = (var_708_39.transform.localPosition - var_708_37).z
					local var_708_42 = manager.ui.mainCameraCom_
					local var_708_43 = 2 * var_708_41 * Mathf.Tan(var_708_42.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_708_44 = var_708_43 * var_708_42.aspect
					local var_708_45 = var_708_40.sprite.bounds.size.x
					local var_708_46 = var_708_40.sprite.bounds.size.y
					local var_708_47 = var_708_44 / var_708_45
					local var_708_48 = var_708_43 / var_708_46
					local var_708_49 = var_708_48 < var_708_47 and var_708_47 or var_708_48

					var_708_39.transform.localScale = Vector3.New(var_708_49, var_708_49, 0)
				end

				for iter_708_1, iter_708_2 in pairs(arg_705_1.bgs_) do
					if iter_708_1 ~= "ST22a" then
						iter_708_2.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end
		end
	end,
	Play115311174 = function(arg_709_0, arg_709_1)
		arg_709_1.time_ = 0
		arg_709_1.frameCnt_ = 0
		arg_709_1.state_ = "playing"
		arg_709_1.curTalkId_ = 115311174
		arg_709_1.duration_ = 0.999999999999

		SetActive(arg_709_1.tipsGo_, false)

		function arg_709_1.onSingleLineFinish_()
			arg_709_1.onSingleLineUpdate_ = nil
			arg_709_1.onSingleLineFinish_ = nil
			arg_709_1.state_ = "waiting"
		end

		function arg_709_1.playNext_(arg_711_0)
			if arg_711_0 == 1 then
				arg_709_0:Play115311175(arg_709_1)
			end
		end

		function arg_709_1.onSingleLineUpdate_(arg_712_0)
			local var_712_0 = 0

			if var_712_0 < arg_709_1.time_ and arg_709_1.time_ <= var_712_0 + arg_712_0 then
				arg_709_1.var_.oldValueTypewriter = arg_709_1.fswtw_.percent

				arg_709_1:ShowNextGo(false)
			end

			local var_712_1 = 10
			local var_712_2 = 0.666666666666667
			local var_712_3 = arg_709_1:GetWordFromCfg(115311173)
			local var_712_4 = arg_709_1:FormatText(var_712_3.content)
			local var_712_5, var_712_6 = arg_709_1:GetPercentByPara(var_712_4, 2)

			if var_712_0 < arg_709_1.time_ and arg_709_1.time_ <= var_712_0 + arg_712_0 then
				arg_709_1.talkMaxDuration = 0

				local var_712_7 = var_712_1 <= 0 and var_712_2 or var_712_2 * ((var_712_6 - arg_709_1.typewritterCharCountI18N) / var_712_1)

				if var_712_7 > 0 and var_712_2 < var_712_7 then
					arg_709_1.talkMaxDuration = var_712_7

					if var_712_7 + var_712_0 > arg_709_1.duration_ then
						arg_709_1.duration_ = var_712_7 + var_712_0
					end
				end
			end

			local var_712_8 = 0.666666666666667
			local var_712_9 = math.max(var_712_8, arg_709_1.talkMaxDuration)

			if var_712_0 <= arg_709_1.time_ and arg_709_1.time_ < var_712_0 + var_712_9 then
				local var_712_10 = (arg_709_1.time_ - var_712_0) / var_712_9

				arg_709_1.fswtw_.percent = Mathf.Lerp(arg_709_1.var_.oldValueTypewriter, var_712_5, var_712_10)
				arg_709_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_709_1.fswtw_:SetDirty()
			end

			if arg_709_1.time_ >= var_712_0 + var_712_9 and arg_709_1.time_ < var_712_0 + var_712_9 + arg_712_0 then
				arg_709_1.fswtw_.percent = var_712_5

				arg_709_1.fswtw_:SetDirty()
				arg_709_1:ShowNextGo(true)

				arg_709_1.typewritterCharCountI18N = var_712_6
			end
		end
	end,
	Play115311175 = function(arg_713_0, arg_713_1)
		arg_713_1.time_ = 0
		arg_713_1.frameCnt_ = 0
		arg_713_1.state_ = "playing"
		arg_713_1.curTalkId_ = 115311175
		arg_713_1.duration_ = 2.949999999999

		SetActive(arg_713_1.tipsGo_, false)

		function arg_713_1.onSingleLineFinish_()
			arg_713_1.onSingleLineUpdate_ = nil
			arg_713_1.onSingleLineFinish_ = nil
			arg_713_1.state_ = "waiting"
		end

		function arg_713_1.playNext_(arg_715_0)
			if arg_715_0 == 1 then
				arg_713_0:Play115311176(arg_713_1)
			end
		end

		function arg_713_1.onSingleLineUpdate_(arg_716_0)
			local var_716_0 = 2

			if var_716_0 < arg_713_1.time_ and arg_713_1.time_ <= var_716_0 + arg_716_0 then
				arg_713_1.fswbg_:SetActive(true)
				arg_713_1.dialog_:SetActive(false)

				arg_713_1.fswtw_.percent = 0

				local var_716_1 = arg_713_1:GetWordFromCfg(115311175)
				local var_716_2 = arg_713_1:FormatText(var_716_1.content)

				arg_713_1.fswt_.text = var_716_2

				LuaForUtil.ClearLinePrefixSymbol(arg_713_1.fswt_)

				arg_713_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_713_1.fswtw_:SetDirty()

				arg_713_1.typewritterCharCountI18N = 0

				SetActive(arg_713_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_713_1:ShowNextGo(false)
			end

			local var_716_3 = 2.01666666666667

			if var_716_3 < arg_713_1.time_ and arg_713_1.time_ <= var_716_3 + arg_716_0 then
				arg_713_1.var_.oldValueTypewriter = arg_713_1.fswtw_.percent

				arg_713_1:ShowNextGo(false)
			end

			local var_716_4 = 14
			local var_716_5 = 0.933333333333333
			local var_716_6 = arg_713_1:GetWordFromCfg(115311175)
			local var_716_7 = arg_713_1:FormatText(var_716_6.content)
			local var_716_8, var_716_9 = arg_713_1:GetPercentByPara(var_716_7, 1)

			if var_716_3 < arg_713_1.time_ and arg_713_1.time_ <= var_716_3 + arg_716_0 then
				arg_713_1.talkMaxDuration = 0

				local var_716_10 = var_716_4 <= 0 and var_716_5 or var_716_5 * ((var_716_9 - arg_713_1.typewritterCharCountI18N) / var_716_4)

				if var_716_10 > 0 and var_716_5 < var_716_10 then
					arg_713_1.talkMaxDuration = var_716_10

					if var_716_10 + var_716_3 > arg_713_1.duration_ then
						arg_713_1.duration_ = var_716_10 + var_716_3
					end
				end
			end

			local var_716_11 = 0.933333333333333
			local var_716_12 = math.max(var_716_11, arg_713_1.talkMaxDuration)

			if var_716_3 <= arg_713_1.time_ and arg_713_1.time_ < var_716_3 + var_716_12 then
				local var_716_13 = (arg_713_1.time_ - var_716_3) / var_716_12

				arg_713_1.fswtw_.percent = Mathf.Lerp(arg_713_1.var_.oldValueTypewriter, var_716_8, var_716_13)
				arg_713_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_713_1.fswtw_:SetDirty()
			end

			if arg_713_1.time_ >= var_716_3 + var_716_12 and arg_713_1.time_ < var_716_3 + var_716_12 + arg_716_0 then
				arg_713_1.fswtw_.percent = var_716_8

				arg_713_1.fswtw_:SetDirty()
				arg_713_1:ShowNextGo(true)

				arg_713_1.typewritterCharCountI18N = var_716_9
			end

			local var_716_14 = arg_713_1.bgs_.ST22a
			local var_716_15 = 0

			if var_716_15 < arg_713_1.time_ and arg_713_1.time_ <= var_716_15 + arg_716_0 then
				local var_716_16 = var_716_14:GetComponent("SpriteRenderer")

				if var_716_16 then
					var_716_16.material = arg_713_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_716_17 = var_716_16.material
					local var_716_18 = var_716_17:GetColor("_Color")

					arg_713_1.var_.alphaOldValueST22a = var_716_18.a
					arg_713_1.var_.alphaMatValueST22a = var_716_17
				end

				arg_713_1.var_.alphaOldValueST22a = 1
			end

			local var_716_19 = 2

			if var_716_15 <= arg_713_1.time_ and arg_713_1.time_ < var_716_15 + var_716_19 then
				local var_716_20 = (arg_713_1.time_ - var_716_15) / var_716_19
				local var_716_21 = Mathf.Lerp(arg_713_1.var_.alphaOldValueST22a, 0, var_716_20)

				if arg_713_1.var_.alphaMatValueST22a then
					local var_716_22 = arg_713_1.var_.alphaMatValueST22a
					local var_716_23 = var_716_22:GetColor("_Color")

					var_716_23.a = var_716_21

					var_716_22:SetColor("_Color", var_716_23)
				end
			end

			if arg_713_1.time_ >= var_716_15 + var_716_19 and arg_713_1.time_ < var_716_15 + var_716_19 + arg_716_0 and arg_713_1.var_.alphaMatValueST22a then
				local var_716_24 = arg_713_1.var_.alphaMatValueST22a
				local var_716_25 = var_716_24:GetColor("_Color")

				var_716_25.a = 0

				var_716_24:SetColor("_Color", var_716_25)
			end
		end
	end,
	Play115311176 = function(arg_717_0, arg_717_1)
		arg_717_1.time_ = 0
		arg_717_1.frameCnt_ = 0
		arg_717_1.state_ = "playing"
		arg_717_1.curTalkId_ = 115311176
		arg_717_1.duration_ = 0.999999999999

		SetActive(arg_717_1.tipsGo_, false)

		function arg_717_1.onSingleLineFinish_()
			arg_717_1.onSingleLineUpdate_ = nil
			arg_717_1.onSingleLineFinish_ = nil
			arg_717_1.state_ = "waiting"
		end

		function arg_717_1.playNext_(arg_719_0)
			if arg_719_0 == 1 then
				arg_717_0:Play115311177(arg_717_1)
			end
		end

		function arg_717_1.onSingleLineUpdate_(arg_720_0)
			local var_720_0 = 0

			if var_720_0 < arg_717_1.time_ and arg_717_1.time_ <= var_720_0 + arg_720_0 then
				arg_717_1.var_.oldValueTypewriter = arg_717_1.fswtw_.percent

				arg_717_1:ShowNextGo(false)
			end

			local var_720_1 = 14
			local var_720_2 = 0.933333333333333
			local var_720_3 = arg_717_1:GetWordFromCfg(115311175)
			local var_720_4 = arg_717_1:FormatText(var_720_3.content)
			local var_720_5, var_720_6 = arg_717_1:GetPercentByPara(var_720_4, 2)

			if var_720_0 < arg_717_1.time_ and arg_717_1.time_ <= var_720_0 + arg_720_0 then
				arg_717_1.talkMaxDuration = 0

				local var_720_7 = var_720_1 <= 0 and var_720_2 or var_720_2 * ((var_720_6 - arg_717_1.typewritterCharCountI18N) / var_720_1)

				if var_720_7 > 0 and var_720_2 < var_720_7 then
					arg_717_1.talkMaxDuration = var_720_7

					if var_720_7 + var_720_0 > arg_717_1.duration_ then
						arg_717_1.duration_ = var_720_7 + var_720_0
					end
				end
			end

			local var_720_8 = 0.933333333333333
			local var_720_9 = math.max(var_720_8, arg_717_1.talkMaxDuration)

			if var_720_0 <= arg_717_1.time_ and arg_717_1.time_ < var_720_0 + var_720_9 then
				local var_720_10 = (arg_717_1.time_ - var_720_0) / var_720_9

				arg_717_1.fswtw_.percent = Mathf.Lerp(arg_717_1.var_.oldValueTypewriter, var_720_5, var_720_10)
				arg_717_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_717_1.fswtw_:SetDirty()
			end

			if arg_717_1.time_ >= var_720_0 + var_720_9 and arg_717_1.time_ < var_720_0 + var_720_9 + arg_720_0 then
				arg_717_1.fswtw_.percent = var_720_5

				arg_717_1.fswtw_:SetDirty()
				arg_717_1:ShowNextGo(true)

				arg_717_1.typewritterCharCountI18N = var_720_6
			end
		end
	end,
	Play115311177 = function(arg_721_0, arg_721_1)
		arg_721_1.time_ = 0
		arg_721_1.frameCnt_ = 0
		arg_721_1.state_ = "playing"
		arg_721_1.curTalkId_ = 115311177
		arg_721_1.duration_ = 0.999999999999

		SetActive(arg_721_1.tipsGo_, false)

		function arg_721_1.onSingleLineFinish_()
			arg_721_1.onSingleLineUpdate_ = nil
			arg_721_1.onSingleLineFinish_ = nil
			arg_721_1.state_ = "waiting"
		end

		function arg_721_1.playNext_(arg_723_0)
			if arg_723_0 == 1 then
				arg_721_0:Play115311178(arg_721_1)
			end
		end

		function arg_721_1.onSingleLineUpdate_(arg_724_0)
			local var_724_0 = 0

			if var_724_0 < arg_721_1.time_ and arg_721_1.time_ <= var_724_0 + arg_724_0 then
				arg_721_1.var_.oldValueTypewriter = arg_721_1.fswtw_.percent

				arg_721_1:ShowNextGo(false)
			end

			local var_724_1 = 14
			local var_724_2 = 0.933333333333333
			local var_724_3 = arg_721_1:GetWordFromCfg(115311175)
			local var_724_4 = arg_721_1:FormatText(var_724_3.content)
			local var_724_5, var_724_6 = arg_721_1:GetPercentByPara(var_724_4, 3)

			if var_724_0 < arg_721_1.time_ and arg_721_1.time_ <= var_724_0 + arg_724_0 then
				arg_721_1.talkMaxDuration = 0

				local var_724_7 = var_724_1 <= 0 and var_724_2 or var_724_2 * ((var_724_6 - arg_721_1.typewritterCharCountI18N) / var_724_1)

				if var_724_7 > 0 and var_724_2 < var_724_7 then
					arg_721_1.talkMaxDuration = var_724_7

					if var_724_7 + var_724_0 > arg_721_1.duration_ then
						arg_721_1.duration_ = var_724_7 + var_724_0
					end
				end
			end

			local var_724_8 = 0.933333333333333
			local var_724_9 = math.max(var_724_8, arg_721_1.talkMaxDuration)

			if var_724_0 <= arg_721_1.time_ and arg_721_1.time_ < var_724_0 + var_724_9 then
				local var_724_10 = (arg_721_1.time_ - var_724_0) / var_724_9

				arg_721_1.fswtw_.percent = Mathf.Lerp(arg_721_1.var_.oldValueTypewriter, var_724_5, var_724_10)
				arg_721_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_721_1.fswtw_:SetDirty()
			end

			if arg_721_1.time_ >= var_724_0 + var_724_9 and arg_721_1.time_ < var_724_0 + var_724_9 + arg_724_0 then
				arg_721_1.fswtw_.percent = var_724_5

				arg_721_1.fswtw_:SetDirty()
				arg_721_1:ShowNextGo(true)

				arg_721_1.typewritterCharCountI18N = var_724_6
			end
		end
	end,
	Play115311178 = function(arg_725_0, arg_725_1)
		arg_725_1.time_ = 0
		arg_725_1.frameCnt_ = 0
		arg_725_1.state_ = "playing"
		arg_725_1.curTalkId_ = 115311178
		arg_725_1.duration_ = 0.999999999999

		SetActive(arg_725_1.tipsGo_, false)

		function arg_725_1.onSingleLineFinish_()
			arg_725_1.onSingleLineUpdate_ = nil
			arg_725_1.onSingleLineFinish_ = nil
			arg_725_1.state_ = "waiting"
		end

		function arg_725_1.playNext_(arg_727_0)
			if arg_727_0 == 1 then
				arg_725_0:Play115311179(arg_725_1)
			end
		end

		function arg_725_1.onSingleLineUpdate_(arg_728_0)
			local var_728_0 = 0

			if var_728_0 < arg_725_1.time_ and arg_725_1.time_ <= var_728_0 + arg_728_0 then
				arg_725_1.var_.oldValueTypewriter = arg_725_1.fswtw_.percent

				arg_725_1:ShowNextGo(false)
			end

			local var_728_1 = 14
			local var_728_2 = 0.933333333333333
			local var_728_3 = arg_725_1:GetWordFromCfg(115311175)
			local var_728_4 = arg_725_1:FormatText(var_728_3.content)
			local var_728_5, var_728_6 = arg_725_1:GetPercentByPara(var_728_4, 4)

			if var_728_0 < arg_725_1.time_ and arg_725_1.time_ <= var_728_0 + arg_728_0 then
				arg_725_1.talkMaxDuration = 0

				local var_728_7 = var_728_1 <= 0 and var_728_2 or var_728_2 * ((var_728_6 - arg_725_1.typewritterCharCountI18N) / var_728_1)

				if var_728_7 > 0 and var_728_2 < var_728_7 then
					arg_725_1.talkMaxDuration = var_728_7

					if var_728_7 + var_728_0 > arg_725_1.duration_ then
						arg_725_1.duration_ = var_728_7 + var_728_0
					end
				end
			end

			local var_728_8 = 0.933333333333333
			local var_728_9 = math.max(var_728_8, arg_725_1.talkMaxDuration)

			if var_728_0 <= arg_725_1.time_ and arg_725_1.time_ < var_728_0 + var_728_9 then
				local var_728_10 = (arg_725_1.time_ - var_728_0) / var_728_9

				arg_725_1.fswtw_.percent = Mathf.Lerp(arg_725_1.var_.oldValueTypewriter, var_728_5, var_728_10)
				arg_725_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_725_1.fswtw_:SetDirty()
			end

			if arg_725_1.time_ >= var_728_0 + var_728_9 and arg_725_1.time_ < var_728_0 + var_728_9 + arg_728_0 then
				arg_725_1.fswtw_.percent = var_728_5

				arg_725_1.fswtw_:SetDirty()
				arg_725_1:ShowNextGo(true)

				arg_725_1.typewritterCharCountI18N = var_728_6
			end
		end
	end,
	Play115311179 = function(arg_729_0, arg_729_1)
		arg_729_1.time_ = 0
		arg_729_1.frameCnt_ = 0
		arg_729_1.state_ = "playing"
		arg_729_1.curTalkId_ = 115311179
		arg_729_1.duration_ = 0.999999999999

		SetActive(arg_729_1.tipsGo_, false)

		function arg_729_1.onSingleLineFinish_()
			arg_729_1.onSingleLineUpdate_ = nil
			arg_729_1.onSingleLineFinish_ = nil
			arg_729_1.state_ = "waiting"
			arg_729_1.auto_ = false
		end

		function arg_729_1.playNext_(arg_731_0)
			arg_729_1.onStoryFinished_()
		end

		function arg_729_1.onSingleLineUpdate_(arg_732_0)
			local var_732_0 = 0

			if var_732_0 < arg_729_1.time_ and arg_729_1.time_ <= var_732_0 + arg_732_0 then
				arg_729_1.var_.oldValueTypewriter = arg_729_1.fswtw_.percent

				arg_729_1:ShowNextGo(false)
			end

			local var_732_1 = 14
			local var_732_2 = 0.933333333333333
			local var_732_3 = arg_729_1:GetWordFromCfg(115311175)
			local var_732_4 = arg_729_1:FormatText(var_732_3.content)
			local var_732_5, var_732_6 = arg_729_1:GetPercentByPara(var_732_4, 5)

			if var_732_0 < arg_729_1.time_ and arg_729_1.time_ <= var_732_0 + arg_732_0 then
				arg_729_1.talkMaxDuration = 0

				local var_732_7 = var_732_1 <= 0 and var_732_2 or var_732_2 * ((var_732_6 - arg_729_1.typewritterCharCountI18N) / var_732_1)

				if var_732_7 > 0 and var_732_2 < var_732_7 then
					arg_729_1.talkMaxDuration = var_732_7

					if var_732_7 + var_732_0 > arg_729_1.duration_ then
						arg_729_1.duration_ = var_732_7 + var_732_0
					end
				end
			end

			local var_732_8 = 0.933333333333333
			local var_732_9 = math.max(var_732_8, arg_729_1.talkMaxDuration)

			if var_732_0 <= arg_729_1.time_ and arg_729_1.time_ < var_732_0 + var_732_9 then
				local var_732_10 = (arg_729_1.time_ - var_732_0) / var_732_9

				arg_729_1.fswtw_.percent = Mathf.Lerp(arg_729_1.var_.oldValueTypewriter, var_732_5, var_732_10)
				arg_729_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_729_1.fswtw_:SetDirty()
			end

			if arg_729_1.time_ >= var_732_0 + var_732_9 and arg_729_1.time_ < var_732_0 + var_732_9 + arg_732_0 then
				arg_729_1.fswtw_.percent = var_732_5

				arg_729_1.fswtw_:SetDirty()
				arg_729_1:ShowNextGo(true)

				arg_729_1.typewritterCharCountI18N = var_732_6
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST22a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST28a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/F01a"
	},
	voices = {
		"story_v_out_115311.awb"
	}
}
