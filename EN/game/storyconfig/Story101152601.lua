return {
	Play115261001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 115261001
		arg_1_1.duration_ = 6.433

		local var_1_0 = {
			ja = 5.1,
			ko = 6.433,
			zh = 5.633,
			en = 5.933
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
				arg_1_0:Play115261002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = 0

			if var_4_0 < arg_1_1.time_ and arg_1_1.time_ <= var_4_0 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = false

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

			local var_4_6 = "ST22"

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
				local var_4_11 = arg_1_1.bgs_.ST22

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
					if iter_4_0 ~= "ST22" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_22 = 0
			local var_4_23 = 0.6

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 1.10700136857828
			local var_4_27 = 1.89299863142172

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_1_3_warchess", "bgm_activity_1_3_warchess", "bgm_activity_1_3_warchess.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 0.666666666666667

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

				local var_4_33 = arg_1_1:FormatText(StoryNameCfg[306].name)

				arg_1_1.leftNameTxt_.text = var_4_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_34 = arg_1_1:GetWordFromCfg(115261001)
				local var_4_35 = arg_1_1:FormatText(var_4_34.content)

				arg_1_1.text_.text = var_4_35

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_36 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261001", "story_v_out_115261.awb") ~= 0 then
					local var_4_39 = manager.audio:GetVoiceLength("story_v_out_115261", "115261001", "story_v_out_115261.awb") / 1000

					if var_4_39 + var_4_30 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_39 + var_4_30
					end

					if var_4_34.prefab_name ~= "" and arg_1_1.actors_[var_4_34.prefab_name] ~= nil then
						local var_4_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_34.prefab_name].transform, "story_v_out_115261", "115261001", "story_v_out_115261.awb")

						arg_1_1:RecordAudio("115261001", var_4_40)
						arg_1_1:RecordAudio("115261001", var_4_40)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_115261", "115261001", "story_v_out_115261.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_115261", "115261001", "story_v_out_115261.awb")
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
	Play115261002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 115261002
		arg_7_1.duration_ = 5.166

		local var_7_0 = {
			ja = 3.4,
			ko = 5.166,
			zh = 3.833,
			en = 3.6
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
				arg_7_0:Play115261003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.666666666666667

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_2 = arg_7_1:FormatText(StoryNameCfg[306].name)

				arg_7_1.leftNameTxt_.text = var_10_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_3 = arg_7_1:GetWordFromCfg(115261002)
				local var_10_4 = arg_7_1:FormatText(var_10_3.content)

				arg_7_1.text_.text = var_10_4

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_5 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261002", "story_v_out_115261.awb") ~= 0 then
					local var_10_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261002", "story_v_out_115261.awb") / 1000

					if var_10_8 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_8 + var_10_0
					end

					if var_10_3.prefab_name ~= "" and arg_7_1.actors_[var_10_3.prefab_name] ~= nil then
						local var_10_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_3.prefab_name].transform, "story_v_out_115261", "115261002", "story_v_out_115261.awb")

						arg_7_1:RecordAudio("115261002", var_10_9)
						arg_7_1:RecordAudio("115261002", var_10_9)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_115261", "115261002", "story_v_out_115261.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_115261", "115261002", "story_v_out_115261.awb")
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
	Play115261003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 115261003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play115261004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 3

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

				local var_14_2 = arg_11_1:GetWordFromCfg(115261003)
				local var_14_3 = arg_11_1:FormatText(var_14_2.content)

				arg_11_1.text_.text = var_14_3

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_4 = 56
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
	Play115261004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 115261004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play115261005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 2.93333333333333

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

				local var_18_2 = arg_15_1:GetWordFromCfg(115261004)
				local var_18_3 = arg_15_1:FormatText(var_18_2.content)

				arg_15_1.text_.text = var_18_3

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_4 = 53
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
	Play115261005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 115261005
		arg_19_1.duration_ = 2.933

		local var_19_0 = {
			ja = 1.499999999999,
			ko = 2.933,
			zh = 1.5,
			en = 1.6
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
				arg_19_0:Play115261006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 0.366666666666667

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_2 = arg_19_1:FormatText(StoryNameCfg[307].name)

				arg_19_1.leftNameTxt_.text = var_22_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, true)
				arg_19_1.iconController_:SetSelectedState("hero")

				arg_19_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_fathera")

				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_3 = arg_19_1:GetWordFromCfg(115261005)
				local var_22_4 = arg_19_1:FormatText(var_22_3.content)

				arg_19_1.text_.text = var_22_4

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_5 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261005", "story_v_out_115261.awb") ~= 0 then
					local var_22_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261005", "story_v_out_115261.awb") / 1000

					if var_22_8 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_8 + var_22_0
					end

					if var_22_3.prefab_name ~= "" and arg_19_1.actors_[var_22_3.prefab_name] ~= nil then
						local var_22_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_3.prefab_name].transform, "story_v_out_115261", "115261005", "story_v_out_115261.awb")

						arg_19_1:RecordAudio("115261005", var_22_9)
						arg_19_1:RecordAudio("115261005", var_22_9)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_115261", "115261005", "story_v_out_115261.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_115261", "115261005", "story_v_out_115261.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_10 = math.max(var_22_1, arg_19_1.talkMaxDuration)

			if var_22_0 <= arg_19_1.time_ and arg_19_1.time_ < var_22_0 + var_22_10 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_0) / var_22_10

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_0 + var_22_10 and arg_19_1.time_ < var_22_0 + var_22_10 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play115261006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 115261006
		arg_23_1.duration_ = 3

		local var_23_0 = {
			ja = 2.499999999999,
			ko = 3,
			zh = 2.499999999999,
			en = 2.499999999999
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
				arg_23_0:Play115261007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 2

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_2 = arg_23_1:FormatText(StoryNameCfg[308].name)

				arg_23_1.leftNameTxt_.text = var_26_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, true)
				arg_23_1.iconController_:SetSelectedState("hero")

				arg_23_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_fathera")

				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_3 = arg_23_1:GetWordFromCfg(115261006)
				local var_26_4 = arg_23_1:FormatText(var_26_3.content)

				arg_23_1.text_.text = var_26_4

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_5 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261006", "story_v_out_115261.awb") ~= 0 then
					local var_26_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261006", "story_v_out_115261.awb") / 1000

					if var_26_8 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_8 + var_26_0
					end

					if var_26_3.prefab_name ~= "" and arg_23_1.actors_[var_26_3.prefab_name] ~= nil then
						local var_26_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_3.prefab_name].transform, "story_v_out_115261", "115261006", "story_v_out_115261.awb")

						arg_23_1:RecordAudio("115261006", var_26_9)
						arg_23_1:RecordAudio("115261006", var_26_9)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_115261", "115261006", "story_v_out_115261.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_115261", "115261006", "story_v_out_115261.awb")
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
	Play115261007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 115261007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play115261008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0
			local var_30_1 = 2.66666666666667

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_2 = arg_27_1:GetWordFromCfg(115261007)
				local var_30_3 = arg_27_1:FormatText(var_30_2.content)

				arg_27_1.text_.text = var_30_3

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_4 = 47
				local var_30_5 = utf8.len(var_30_3)
				local var_30_6 = var_30_4 <= 0 and var_30_1 or var_30_1 * (var_30_5 / var_30_4)

				if var_30_6 > 0 and var_30_1 < var_30_6 then
					arg_27_1.talkMaxDuration = var_30_6

					if var_30_6 + var_30_0 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_6 + var_30_0
					end
				end

				arg_27_1.text_.text = var_30_3
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_7 = math.max(var_30_1, arg_27_1.talkMaxDuration)

			if var_30_0 <= arg_27_1.time_ and arg_27_1.time_ < var_30_0 + var_30_7 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_0) / var_30_7

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_0 + var_30_7 and arg_27_1.time_ < var_30_0 + var_30_7 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play115261008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 115261008
		arg_31_1.duration_ = 1.5

		local var_31_0 = {
			ja = 1.499999999999,
			ko = 1.5,
			zh = 1.499999999999,
			en = 1.499999999999
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
				arg_31_0:Play115261009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 0.333333333333333

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_2 = arg_31_1:FormatText(StoryNameCfg[205].name)

				arg_31_1.leftNameTxt_.text = var_34_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_3 = arg_31_1:GetWordFromCfg(115261008)
				local var_34_4 = arg_31_1:FormatText(var_34_3.content)

				arg_31_1.text_.text = var_34_4

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_5 = 2
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

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261008", "story_v_out_115261.awb") ~= 0 then
					local var_34_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261008", "story_v_out_115261.awb") / 1000

					if var_34_8 + var_34_0 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_8 + var_34_0
					end

					if var_34_3.prefab_name ~= "" and arg_31_1.actors_[var_34_3.prefab_name] ~= nil then
						local var_34_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_3.prefab_name].transform, "story_v_out_115261", "115261008", "story_v_out_115261.awb")

						arg_31_1:RecordAudio("115261008", var_34_9)
						arg_31_1:RecordAudio("115261008", var_34_9)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_115261", "115261008", "story_v_out_115261.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_115261", "115261008", "story_v_out_115261.awb")
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
	Play115261009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 115261009
		arg_35_1.duration_ = 5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play115261010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 2.2

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, false)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_2 = arg_35_1:GetWordFromCfg(115261009)
				local var_38_3 = arg_35_1:FormatText(var_38_2.content)

				arg_35_1.text_.text = var_38_3

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_4 = 39
				local var_38_5 = utf8.len(var_38_3)
				local var_38_6 = var_38_4 <= 0 and var_38_1 or var_38_1 * (var_38_5 / var_38_4)

				if var_38_6 > 0 and var_38_1 < var_38_6 then
					arg_35_1.talkMaxDuration = var_38_6

					if var_38_6 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_6 + var_38_0
					end
				end

				arg_35_1.text_.text = var_38_3
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_7 = math.max(var_38_1, arg_35_1.talkMaxDuration)

			if var_38_0 <= arg_35_1.time_ and arg_35_1.time_ < var_38_0 + var_38_7 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_0) / var_38_7

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_0 + var_38_7 and arg_35_1.time_ < var_38_0 + var_38_7 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play115261010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 115261010
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play115261011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0
			local var_42_1 = 2.03333333333333

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, false)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_2 = arg_39_1:GetWordFromCfg(115261010)
				local var_42_3 = arg_39_1:FormatText(var_42_2.content)

				arg_39_1.text_.text = var_42_3

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_4 = 46
				local var_42_5 = utf8.len(var_42_3)
				local var_42_6 = var_42_4 <= 0 and var_42_1 or var_42_1 * (var_42_5 / var_42_4)

				if var_42_6 > 0 and var_42_1 < var_42_6 then
					arg_39_1.talkMaxDuration = var_42_6

					if var_42_6 + var_42_0 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_6 + var_42_0
					end
				end

				arg_39_1.text_.text = var_42_3
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)
				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_7 = math.max(var_42_1, arg_39_1.talkMaxDuration)

			if var_42_0 <= arg_39_1.time_ and arg_39_1.time_ < var_42_0 + var_42_7 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_0) / var_42_7

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_0 + var_42_7 and arg_39_1.time_ < var_42_0 + var_42_7 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play115261011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 115261011
		arg_43_1.duration_ = 5.566

		local var_43_0 = {
			ja = 5.566,
			ko = 4.633,
			zh = 5.366,
			en = 4.466
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
				arg_43_0:Play115261012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0
			local var_46_1 = 1.33333333333333

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_2 = arg_43_1:FormatText(StoryNameCfg[307].name)

				arg_43_1.leftNameTxt_.text = var_46_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, true)
				arg_43_1.iconController_:SetSelectedState("hero")

				arg_43_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_fathera")

				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_3 = arg_43_1:GetWordFromCfg(115261011)
				local var_46_4 = arg_43_1:FormatText(var_46_3.content)

				arg_43_1.text_.text = var_46_4

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_5 = 24
				local var_46_6 = utf8.len(var_46_4)
				local var_46_7 = var_46_5 <= 0 and var_46_1 or var_46_1 * (var_46_6 / var_46_5)

				if var_46_7 > 0 and var_46_1 < var_46_7 then
					arg_43_1.talkMaxDuration = var_46_7

					if var_46_7 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_7 + var_46_0
					end
				end

				arg_43_1.text_.text = var_46_4
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261011", "story_v_out_115261.awb") ~= 0 then
					local var_46_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261011", "story_v_out_115261.awb") / 1000

					if var_46_8 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_8 + var_46_0
					end

					if var_46_3.prefab_name ~= "" and arg_43_1.actors_[var_46_3.prefab_name] ~= nil then
						local var_46_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_3.prefab_name].transform, "story_v_out_115261", "115261011", "story_v_out_115261.awb")

						arg_43_1:RecordAudio("115261011", var_46_9)
						arg_43_1:RecordAudio("115261011", var_46_9)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_115261", "115261011", "story_v_out_115261.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_115261", "115261011", "story_v_out_115261.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_10 = math.max(var_46_1, arg_43_1.talkMaxDuration)

			if var_46_0 <= arg_43_1.time_ and arg_43_1.time_ < var_46_0 + var_46_10 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_0) / var_46_10

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_0 + var_46_10 and arg_43_1.time_ < var_46_0 + var_46_10 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play115261012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 115261012
		arg_47_1.duration_ = 9.033

		local var_47_0 = {
			ja = 3.9,
			ko = 9.033,
			zh = 6.533,
			en = 8.5
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
				arg_47_0:Play115261013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0
			local var_50_1 = 1.93333333333333

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_2 = arg_47_1:FormatText(StoryNameCfg[308].name)

				arg_47_1.leftNameTxt_.text = var_50_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, true)
				arg_47_1.iconController_:SetSelectedState("hero")

				arg_47_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_fathera")

				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_3 = arg_47_1:GetWordFromCfg(115261012)
				local var_50_4 = arg_47_1:FormatText(var_50_3.content)

				arg_47_1.text_.text = var_50_4

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_5 = 36
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

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261012", "story_v_out_115261.awb") ~= 0 then
					local var_50_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261012", "story_v_out_115261.awb") / 1000

					if var_50_8 + var_50_0 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_8 + var_50_0
					end

					if var_50_3.prefab_name ~= "" and arg_47_1.actors_[var_50_3.prefab_name] ~= nil then
						local var_50_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_3.prefab_name].transform, "story_v_out_115261", "115261012", "story_v_out_115261.awb")

						arg_47_1:RecordAudio("115261012", var_50_9)
						arg_47_1:RecordAudio("115261012", var_50_9)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_115261", "115261012", "story_v_out_115261.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_115261", "115261012", "story_v_out_115261.awb")
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
	Play115261013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 115261013
		arg_51_1.duration_ = 10.366

		local var_51_0 = {
			ja = 10.366,
			ko = 3.933,
			zh = 3.333,
			en = 3.766
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
				arg_51_0:Play115261014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0
			local var_54_1 = 1.16666666666667

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_2 = arg_51_1:FormatText(StoryNameCfg[308].name)

				arg_51_1.leftNameTxt_.text = var_54_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, true)
				arg_51_1.iconController_:SetSelectedState("hero")

				arg_51_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_fathera")

				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_3 = arg_51_1:GetWordFromCfg(115261013)
				local var_54_4 = arg_51_1:FormatText(var_54_3.content)

				arg_51_1.text_.text = var_54_4

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_5 = 18
				local var_54_6 = utf8.len(var_54_4)
				local var_54_7 = var_54_5 <= 0 and var_54_1 or var_54_1 * (var_54_6 / var_54_5)

				if var_54_7 > 0 and var_54_1 < var_54_7 then
					arg_51_1.talkMaxDuration = var_54_7

					if var_54_7 + var_54_0 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_7 + var_54_0
					end
				end

				arg_51_1.text_.text = var_54_4
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261013", "story_v_out_115261.awb") ~= 0 then
					local var_54_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261013", "story_v_out_115261.awb") / 1000

					if var_54_8 + var_54_0 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_8 + var_54_0
					end

					if var_54_3.prefab_name ~= "" and arg_51_1.actors_[var_54_3.prefab_name] ~= nil then
						local var_54_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_3.prefab_name].transform, "story_v_out_115261", "115261013", "story_v_out_115261.awb")

						arg_51_1:RecordAudio("115261013", var_54_9)
						arg_51_1:RecordAudio("115261013", var_54_9)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_115261", "115261013", "story_v_out_115261.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_115261", "115261013", "story_v_out_115261.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_10 = math.max(var_54_1, arg_51_1.talkMaxDuration)

			if var_54_0 <= arg_51_1.time_ and arg_51_1.time_ < var_54_0 + var_54_10 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_0) / var_54_10

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_0 + var_54_10 and arg_51_1.time_ < var_54_0 + var_54_10 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play115261014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 115261014
		arg_55_1.duration_ = 9.66666666666667

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play115261015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 2.66666666666667

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				local var_58_1 = manager.ui.mainCamera.transform.localPosition
				local var_58_2 = Vector3.New(0, 0, 10) + Vector3.New(var_58_1.x, var_58_1.y, 0)
				local var_58_3 = arg_55_1.bgs_.ST22

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
					if iter_58_0 ~= "ST22" then
						iter_58_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_58_14 = 0

			if var_58_14 < arg_55_1.time_ and arg_55_1.time_ <= var_58_14 + arg_58_0 then
				arg_55_1.mask_.enabled = true
				arg_55_1.mask_.raycastTarget = true

				arg_55_1:SetGaussion(false)
			end

			local var_58_15 = 2

			if var_58_14 <= arg_55_1.time_ and arg_55_1.time_ < var_58_14 + var_58_15 then
				local var_58_16 = (arg_55_1.time_ - var_58_14) / var_58_15
				local var_58_17 = Color.New(0, 0, 0)

				var_58_17.a = Mathf.Lerp(0, 1, var_58_16)
				arg_55_1.mask_.color = var_58_17
			end

			if arg_55_1.time_ >= var_58_14 + var_58_15 and arg_55_1.time_ < var_58_14 + var_58_15 + arg_58_0 then
				local var_58_18 = Color.New(0, 0, 0)

				var_58_18.a = 1
				arg_55_1.mask_.color = var_58_18
			end

			local var_58_19 = 2.66666666666667

			if var_58_19 < arg_55_1.time_ and arg_55_1.time_ <= var_58_19 + arg_58_0 then
				arg_55_1.mask_.enabled = true
				arg_55_1.mask_.raycastTarget = true

				arg_55_1:SetGaussion(false)
			end

			local var_58_20 = 2

			if var_58_19 <= arg_55_1.time_ and arg_55_1.time_ < var_58_19 + var_58_20 then
				local var_58_21 = (arg_55_1.time_ - var_58_19) / var_58_20
				local var_58_22 = Color.New(0, 0, 0)

				var_58_22.a = Mathf.Lerp(1, 0, var_58_21)
				arg_55_1.mask_.color = var_58_22
			end

			if arg_55_1.time_ >= var_58_19 + var_58_20 and arg_55_1.time_ < var_58_19 + var_58_20 + arg_58_0 then
				local var_58_23 = Color.New(0, 0, 0)
				local var_58_24 = 0

				arg_55_1.mask_.enabled = false
				var_58_23.a = var_58_24
				arg_55_1.mask_.color = var_58_23
			end

			local var_58_25 = 2

			if var_58_25 < arg_55_1.time_ and arg_55_1.time_ <= var_58_25 + arg_58_0 then
				arg_55_1.screenFilterGo_:SetActive(true)

				arg_55_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
			end

			local var_58_26 = 0.766666666666667

			if var_58_25 <= arg_55_1.time_ and arg_55_1.time_ < var_58_25 + var_58_26 then
				local var_58_27 = (arg_55_1.time_ - var_58_25) / var_58_26

				arg_55_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_58_27)
			end

			if arg_55_1.time_ >= var_58_25 + var_58_26 and arg_55_1.time_ < var_58_25 + var_58_26 + arg_58_0 then
				arg_55_1.screenFilterEffect_.weight = 1
			end

			if arg_55_1.frameCnt_ <= 1 then
				arg_55_1.dialog_:SetActive(false)
			end

			local var_58_28 = 4.66666666666667
			local var_58_29 = 0.466666666666667

			if var_58_28 < arg_55_1.time_ and arg_55_1.time_ <= var_58_28 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0

				arg_55_1.dialog_:SetActive(true)

				local var_58_30 = LeanTween.value(arg_55_1.dialog_, 0, 1, 0.3)

				var_58_30:setOnUpdate(LuaHelper.FloatAction(function(arg_59_0)
					arg_55_1.dialogCg_.alpha = arg_59_0
				end))
				var_58_30:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_55_1.dialog_)
					var_58_30:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_55_1.duration_ = arg_55_1.duration_ + 0.3

				SetActive(arg_55_1.leftNameGo_, false)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_31 = arg_55_1:GetWordFromCfg(115261014)
				local var_58_32 = arg_55_1:FormatText(var_58_31.content)

				arg_55_1.text_.text = var_58_32

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_33 = 2
				local var_58_34 = utf8.len(var_58_32)
				local var_58_35 = var_58_33 <= 0 and var_58_29 or var_58_29 * (var_58_34 / var_58_33)

				if var_58_35 > 0 and var_58_29 < var_58_35 then
					arg_55_1.talkMaxDuration = var_58_35
					var_58_28 = var_58_28 + 0.3

					if var_58_35 + var_58_28 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_35 + var_58_28
					end
				end

				arg_55_1.text_.text = var_58_32
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_36 = var_58_28 + 0.3
			local var_58_37 = math.max(var_58_29, arg_55_1.talkMaxDuration)

			if var_58_36 <= arg_55_1.time_ and arg_55_1.time_ < var_58_36 + var_58_37 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_36) / var_58_37

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_36 + var_58_37 and arg_55_1.time_ < var_58_36 + var_58_37 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play115261015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 115261015
		arg_61_1.duration_ = 12.033

		local var_61_0 = {
			ja = 8.3,
			ko = 12.033,
			zh = 10.1,
			en = 8.333
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
				arg_61_0:Play115261016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = 0
			local var_64_1 = 1.125

			if var_64_0 < arg_61_1.time_ and arg_61_1.time_ <= var_64_0 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_2 = arg_61_1:FormatText(StoryNameCfg[205].name)

				arg_61_1.leftNameTxt_.text = var_64_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, true)
				arg_61_1.iconController_:SetSelectedState("hero")

				arg_61_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1042")

				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_3 = arg_61_1:GetWordFromCfg(115261015)
				local var_64_4 = arg_61_1:FormatText(var_64_3.content)

				arg_61_1.text_.text = var_64_4

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_5 = 45
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

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261015", "story_v_out_115261.awb") ~= 0 then
					local var_64_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261015", "story_v_out_115261.awb") / 1000

					if var_64_8 + var_64_0 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_8 + var_64_0
					end

					if var_64_3.prefab_name ~= "" and arg_61_1.actors_[var_64_3.prefab_name] ~= nil then
						local var_64_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_3.prefab_name].transform, "story_v_out_115261", "115261015", "story_v_out_115261.awb")

						arg_61_1:RecordAudio("115261015", var_64_9)
						arg_61_1:RecordAudio("115261015", var_64_9)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_115261", "115261015", "story_v_out_115261.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_115261", "115261015", "story_v_out_115261.awb")
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
	Play115261016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 115261016
		arg_65_1.duration_ = 9.4

		local var_65_0 = {
			ja = 4.266,
			ko = 7.266,
			zh = 7.4,
			en = 9.4
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
				arg_65_0:Play115261017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = 0
			local var_68_1 = 1.5

			if var_68_0 < arg_65_1.time_ and arg_65_1.time_ <= var_68_0 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_2 = arg_65_1:FormatText(StoryNameCfg[205].name)

				arg_65_1.leftNameTxt_.text = var_68_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, true)
				arg_65_1.iconController_:SetSelectedState("hero")

				arg_65_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1042")

				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_3 = arg_65_1:GetWordFromCfg(115261016)
				local var_68_4 = arg_65_1:FormatText(var_68_3.content)

				arg_65_1.text_.text = var_68_4

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_5 = 28
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

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261016", "story_v_out_115261.awb") ~= 0 then
					local var_68_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261016", "story_v_out_115261.awb") / 1000

					if var_68_8 + var_68_0 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_8 + var_68_0
					end

					if var_68_3.prefab_name ~= "" and arg_65_1.actors_[var_68_3.prefab_name] ~= nil then
						local var_68_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_3.prefab_name].transform, "story_v_out_115261", "115261016", "story_v_out_115261.awb")

						arg_65_1:RecordAudio("115261016", var_68_9)
						arg_65_1:RecordAudio("115261016", var_68_9)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_115261", "115261016", "story_v_out_115261.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_115261", "115261016", "story_v_out_115261.awb")
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
	Play115261017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 115261017
		arg_69_1.duration_ = 18.366

		local var_69_0 = {
			ja = 10.666,
			ko = 18.366,
			zh = 13.566,
			en = 14.2
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
				arg_69_0:Play115261018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = "1038"

			if arg_69_1.actors_[var_72_0] == nil then
				local var_72_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_72_0), arg_69_1.canvasGo_.transform)

				var_72_1.transform:SetSiblingIndex(1)

				var_72_1.name = var_72_0
				var_72_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_69_1.actors_[var_72_0] = var_72_1
			end

			local var_72_2 = arg_69_1.actors_["1038"].transform
			local var_72_3 = 0

			if var_72_3 < arg_69_1.time_ and arg_69_1.time_ <= var_72_3 + arg_72_0 then
				arg_69_1.var_.moveOldPos1038 = var_72_2.localPosition
				var_72_2.localScale = Vector3.New(1, 1, 1)

				arg_69_1:CheckSpriteTmpPos("1038", 3)

				local var_72_4 = var_72_2.childCount

				for iter_72_0 = 0, var_72_4 - 1 do
					local var_72_5 = var_72_2:GetChild(iter_72_0)

					if var_72_5.name == "split_9" or not string.find(var_72_5.name, "split") then
						var_72_5.gameObject:SetActive(true)
					else
						var_72_5.gameObject:SetActive(false)
					end
				end
			end

			local var_72_6 = 0.001

			if var_72_3 <= arg_69_1.time_ and arg_69_1.time_ < var_72_3 + var_72_6 then
				local var_72_7 = (arg_69_1.time_ - var_72_3) / var_72_6
				local var_72_8 = Vector3.New(0, -400, 0)

				var_72_2.localPosition = Vector3.Lerp(arg_69_1.var_.moveOldPos1038, var_72_8, var_72_7)
			end

			if arg_69_1.time_ >= var_72_3 + var_72_6 and arg_69_1.time_ < var_72_3 + var_72_6 + arg_72_0 then
				var_72_2.localPosition = Vector3.New(0, -400, 0)
			end

			local var_72_9 = arg_69_1.actors_["1038"]
			local var_72_10 = 0

			if var_72_10 < arg_69_1.time_ and arg_69_1.time_ <= var_72_10 + arg_72_0 and arg_69_1.var_.actorSpriteComps1038 == nil then
				arg_69_1.var_.actorSpriteComps1038 = var_72_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_72_11 = 0.2

			if var_72_10 <= arg_69_1.time_ and arg_69_1.time_ < var_72_10 + var_72_11 then
				local var_72_12 = (arg_69_1.time_ - var_72_10) / var_72_11

				if arg_69_1.var_.actorSpriteComps1038 then
					for iter_72_1, iter_72_2 in pairs(arg_69_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_72_2 then
							local var_72_13 = Mathf.Lerp(iter_72_2.color.r, 1, var_72_12)

							iter_72_2.color = Color.New(var_72_13, var_72_13, var_72_13)
						end
					end
				end
			end

			if arg_69_1.time_ >= var_72_10 + var_72_11 and arg_69_1.time_ < var_72_10 + var_72_11 + arg_72_0 and arg_69_1.var_.actorSpriteComps1038 then
				local var_72_14 = 1

				for iter_72_3, iter_72_4 in pairs(arg_69_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_72_4 then
						iter_72_4.color = Color.New(var_72_14, var_72_14, var_72_14)
					end
				end

				arg_69_1.var_.actorSpriteComps1038 = nil
			end

			local var_72_15 = arg_69_1.actors_["1038"]
			local var_72_16 = 0

			if var_72_16 < arg_69_1.time_ and arg_69_1.time_ <= var_72_16 + arg_72_0 then
				local var_72_17 = var_72_15:GetComponentInChildren(typeof(CanvasGroup))

				if var_72_17 then
					arg_69_1.var_.alphaOldValue1038 = var_72_17.alpha
					arg_69_1.var_.characterEffect1038 = var_72_17
				end

				arg_69_1.var_.alphaOldValue1038 = 0
			end

			local var_72_18 = 0.5

			if var_72_16 <= arg_69_1.time_ and arg_69_1.time_ < var_72_16 + var_72_18 then
				local var_72_19 = (arg_69_1.time_ - var_72_16) / var_72_18
				local var_72_20 = Mathf.Lerp(arg_69_1.var_.alphaOldValue1038, 1, var_72_19)

				if arg_69_1.var_.characterEffect1038 then
					arg_69_1.var_.characterEffect1038.alpha = var_72_20
				end
			end

			if arg_69_1.time_ >= var_72_16 + var_72_18 and arg_69_1.time_ < var_72_16 + var_72_18 + arg_72_0 and arg_69_1.var_.characterEffect1038 then
				arg_69_1.var_.characterEffect1038.alpha = 1
			end

			local var_72_21 = 0
			local var_72_22 = 2.5

			if var_72_21 < arg_69_1.time_ and arg_69_1.time_ <= var_72_21 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_23 = arg_69_1:FormatText(StoryNameCfg[94].name)

				arg_69_1.leftNameTxt_.text = var_72_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_24 = arg_69_1:GetWordFromCfg(115261017)
				local var_72_25 = arg_69_1:FormatText(var_72_24.content)

				arg_69_1.text_.text = var_72_25

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_26 = 54
				local var_72_27 = utf8.len(var_72_25)
				local var_72_28 = var_72_26 <= 0 and var_72_22 or var_72_22 * (var_72_27 / var_72_26)

				if var_72_28 > 0 and var_72_22 < var_72_28 then
					arg_69_1.talkMaxDuration = var_72_28

					if var_72_28 + var_72_21 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_28 + var_72_21
					end
				end

				arg_69_1.text_.text = var_72_25
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261017", "story_v_out_115261.awb") ~= 0 then
					local var_72_29 = manager.audio:GetVoiceLength("story_v_out_115261", "115261017", "story_v_out_115261.awb") / 1000

					if var_72_29 + var_72_21 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_29 + var_72_21
					end

					if var_72_24.prefab_name ~= "" and arg_69_1.actors_[var_72_24.prefab_name] ~= nil then
						local var_72_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_24.prefab_name].transform, "story_v_out_115261", "115261017", "story_v_out_115261.awb")

						arg_69_1:RecordAudio("115261017", var_72_30)
						arg_69_1:RecordAudio("115261017", var_72_30)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_115261", "115261017", "story_v_out_115261.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_115261", "115261017", "story_v_out_115261.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_31 = math.max(var_72_22, arg_69_1.talkMaxDuration)

			if var_72_21 <= arg_69_1.time_ and arg_69_1.time_ < var_72_21 + var_72_31 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_21) / var_72_31

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_21 + var_72_31 and arg_69_1.time_ < var_72_21 + var_72_31 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play115261018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 115261018
		arg_73_1.duration_ = 9.466

		local var_73_0 = {
			ja = 4.033,
			ko = 9.466,
			zh = 7.066,
			en = 7.266
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
				arg_73_0:Play115261019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = 0
			local var_76_1 = 1.33333333333333

			if var_76_0 < arg_73_1.time_ and arg_73_1.time_ <= var_76_0 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_2 = arg_73_1:FormatText(StoryNameCfg[94].name)

				arg_73_1.leftNameTxt_.text = var_76_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_3 = arg_73_1:GetWordFromCfg(115261018)
				local var_76_4 = arg_73_1:FormatText(var_76_3.content)

				arg_73_1.text_.text = var_76_4

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_5 = 31
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

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261018", "story_v_out_115261.awb") ~= 0 then
					local var_76_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261018", "story_v_out_115261.awb") / 1000

					if var_76_8 + var_76_0 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_8 + var_76_0
					end

					if var_76_3.prefab_name ~= "" and arg_73_1.actors_[var_76_3.prefab_name] ~= nil then
						local var_76_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_3.prefab_name].transform, "story_v_out_115261", "115261018", "story_v_out_115261.awb")

						arg_73_1:RecordAudio("115261018", var_76_9)
						arg_73_1:RecordAudio("115261018", var_76_9)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_115261", "115261018", "story_v_out_115261.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_115261", "115261018", "story_v_out_115261.awb")
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
	Play115261019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 115261019
		arg_77_1.duration_ = 12.9

		local var_77_0 = {
			ja = 9.6,
			ko = 12.9,
			zh = 9.3,
			en = 10.466
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
				arg_77_0:Play115261020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["1038"]
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 and arg_77_1.var_.actorSpriteComps1038 == nil then
				arg_77_1.var_.actorSpriteComps1038 = var_80_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_80_2 = 0.2

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2

				if arg_77_1.var_.actorSpriteComps1038 then
					for iter_80_0, iter_80_1 in pairs(arg_77_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_80_1 then
							local var_80_4 = Mathf.Lerp(iter_80_1.color.r, 0.5, var_80_3)

							iter_80_1.color = Color.New(var_80_4, var_80_4, var_80_4)
						end
					end
				end
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 and arg_77_1.var_.actorSpriteComps1038 then
				local var_80_5 = 0.5

				for iter_80_2, iter_80_3 in pairs(arg_77_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_80_3 then
						iter_80_3.color = Color.New(var_80_5, var_80_5, var_80_5)
					end
				end

				arg_77_1.var_.actorSpriteComps1038 = nil
			end

			local var_80_6 = 0
			local var_80_7 = 1.66666666666667

			if var_80_6 < arg_77_1.time_ and arg_77_1.time_ <= var_80_6 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_8 = arg_77_1:FormatText(StoryNameCfg[205].name)

				arg_77_1.leftNameTxt_.text = var_80_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, true)
				arg_77_1.iconController_:SetSelectedState("hero")

				arg_77_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1042")

				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_9 = arg_77_1:GetWordFromCfg(115261019)
				local var_80_10 = arg_77_1:FormatText(var_80_9.content)

				arg_77_1.text_.text = var_80_10

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_11 = 36
				local var_80_12 = utf8.len(var_80_10)
				local var_80_13 = var_80_11 <= 0 and var_80_7 or var_80_7 * (var_80_12 / var_80_11)

				if var_80_13 > 0 and var_80_7 < var_80_13 then
					arg_77_1.talkMaxDuration = var_80_13

					if var_80_13 + var_80_6 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_13 + var_80_6
					end
				end

				arg_77_1.text_.text = var_80_10
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261019", "story_v_out_115261.awb") ~= 0 then
					local var_80_14 = manager.audio:GetVoiceLength("story_v_out_115261", "115261019", "story_v_out_115261.awb") / 1000

					if var_80_14 + var_80_6 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_14 + var_80_6
					end

					if var_80_9.prefab_name ~= "" and arg_77_1.actors_[var_80_9.prefab_name] ~= nil then
						local var_80_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_9.prefab_name].transform, "story_v_out_115261", "115261019", "story_v_out_115261.awb")

						arg_77_1:RecordAudio("115261019", var_80_15)
						arg_77_1:RecordAudio("115261019", var_80_15)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_115261", "115261019", "story_v_out_115261.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_115261", "115261019", "story_v_out_115261.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_16 = math.max(var_80_7, arg_77_1.talkMaxDuration)

			if var_80_6 <= arg_77_1.time_ and arg_77_1.time_ < var_80_6 + var_80_16 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_6) / var_80_16

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_6 + var_80_16 and arg_77_1.time_ < var_80_6 + var_80_16 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play115261020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 115261020
		arg_81_1.duration_ = 7.866

		local var_81_0 = {
			ja = 7.866,
			ko = 6.933,
			zh = 5.166,
			en = 5.566
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
				arg_81_0:Play115261021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = 0
			local var_84_1 = 1.16666666666667

			if var_84_0 < arg_81_1.time_ and arg_81_1.time_ <= var_84_0 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_2 = arg_81_1:FormatText(StoryNameCfg[205].name)

				arg_81_1.leftNameTxt_.text = var_84_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, true)
				arg_81_1.iconController_:SetSelectedState("hero")

				arg_81_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1042")

				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_3 = arg_81_1:GetWordFromCfg(115261020)
				local var_84_4 = arg_81_1:FormatText(var_84_3.content)

				arg_81_1.text_.text = var_84_4

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_5 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261020", "story_v_out_115261.awb") ~= 0 then
					local var_84_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261020", "story_v_out_115261.awb") / 1000

					if var_84_8 + var_84_0 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_8 + var_84_0
					end

					if var_84_3.prefab_name ~= "" and arg_81_1.actors_[var_84_3.prefab_name] ~= nil then
						local var_84_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_3.prefab_name].transform, "story_v_out_115261", "115261020", "story_v_out_115261.awb")

						arg_81_1:RecordAudio("115261020", var_84_9)
						arg_81_1:RecordAudio("115261020", var_84_9)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_115261", "115261020", "story_v_out_115261.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_115261", "115261020", "story_v_out_115261.awb")
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
	Play115261021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 115261021
		arg_85_1.duration_ = 2.633

		local var_85_0 = {
			ja = 0.999999999999,
			ko = 0.999999999999,
			zh = 2.633,
			en = 1.2
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
				arg_85_0:Play115261022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = arg_85_1.actors_["1038"]
			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 and arg_85_1.var_.actorSpriteComps1038 == nil then
				arg_85_1.var_.actorSpriteComps1038 = var_88_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_88_2 = 0.2

			if var_88_1 <= arg_85_1.time_ and arg_85_1.time_ < var_88_1 + var_88_2 then
				local var_88_3 = (arg_85_1.time_ - var_88_1) / var_88_2

				if arg_85_1.var_.actorSpriteComps1038 then
					for iter_88_0, iter_88_1 in pairs(arg_85_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_88_1 then
							local var_88_4 = Mathf.Lerp(iter_88_1.color.r, 1, var_88_3)

							iter_88_1.color = Color.New(var_88_4, var_88_4, var_88_4)
						end
					end
				end
			end

			if arg_85_1.time_ >= var_88_1 + var_88_2 and arg_85_1.time_ < var_88_1 + var_88_2 + arg_88_0 and arg_85_1.var_.actorSpriteComps1038 then
				local var_88_5 = 1

				for iter_88_2, iter_88_3 in pairs(arg_85_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_88_3 then
						iter_88_3.color = Color.New(var_88_5, var_88_5, var_88_5)
					end
				end

				arg_85_1.var_.actorSpriteComps1038 = nil
			end

			local var_88_6 = 0
			local var_88_7 = 0.333333333333333

			if var_88_6 < arg_85_1.time_ and arg_85_1.time_ <= var_88_6 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_8 = arg_85_1:FormatText(StoryNameCfg[94].name)

				arg_85_1.leftNameTxt_.text = var_88_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_9 = arg_85_1:GetWordFromCfg(115261021)
				local var_88_10 = arg_85_1:FormatText(var_88_9.content)

				arg_85_1.text_.text = var_88_10

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_11 = 2
				local var_88_12 = utf8.len(var_88_10)
				local var_88_13 = var_88_11 <= 0 and var_88_7 or var_88_7 * (var_88_12 / var_88_11)

				if var_88_13 > 0 and var_88_7 < var_88_13 then
					arg_85_1.talkMaxDuration = var_88_13

					if var_88_13 + var_88_6 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_13 + var_88_6
					end
				end

				arg_85_1.text_.text = var_88_10
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261021", "story_v_out_115261.awb") ~= 0 then
					local var_88_14 = manager.audio:GetVoiceLength("story_v_out_115261", "115261021", "story_v_out_115261.awb") / 1000

					if var_88_14 + var_88_6 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_14 + var_88_6
					end

					if var_88_9.prefab_name ~= "" and arg_85_1.actors_[var_88_9.prefab_name] ~= nil then
						local var_88_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_9.prefab_name].transform, "story_v_out_115261", "115261021", "story_v_out_115261.awb")

						arg_85_1:RecordAudio("115261021", var_88_15)
						arg_85_1:RecordAudio("115261021", var_88_15)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_115261", "115261021", "story_v_out_115261.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_115261", "115261021", "story_v_out_115261.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_16 = math.max(var_88_7, arg_85_1.talkMaxDuration)

			if var_88_6 <= arg_85_1.time_ and arg_85_1.time_ < var_88_6 + var_88_16 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_6) / var_88_16

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_6 + var_88_16 and arg_85_1.time_ < var_88_6 + var_88_16 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play115261022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 115261022
		arg_89_1.duration_ = 9.6

		local var_89_0 = {
			ja = 7.1,
			ko = 9.566,
			zh = 9.6,
			en = 9.433
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
				arg_89_0:Play115261023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = 0
			local var_92_1 = 1.5

			if var_92_0 < arg_89_1.time_ and arg_89_1.time_ <= var_92_0 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_2 = arg_89_1:FormatText(StoryNameCfg[94].name)

				arg_89_1.leftNameTxt_.text = var_92_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_3 = arg_89_1:GetWordFromCfg(115261022)
				local var_92_4 = arg_89_1:FormatText(var_92_3.content)

				arg_89_1.text_.text = var_92_4

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_5 = 37
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

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261022", "story_v_out_115261.awb") ~= 0 then
					local var_92_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261022", "story_v_out_115261.awb") / 1000

					if var_92_8 + var_92_0 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_8 + var_92_0
					end

					if var_92_3.prefab_name ~= "" and arg_89_1.actors_[var_92_3.prefab_name] ~= nil then
						local var_92_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_3.prefab_name].transform, "story_v_out_115261", "115261022", "story_v_out_115261.awb")

						arg_89_1:RecordAudio("115261022", var_92_9)
						arg_89_1:RecordAudio("115261022", var_92_9)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_115261", "115261022", "story_v_out_115261.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_115261", "115261022", "story_v_out_115261.awb")
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
	Play115261023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 115261023
		arg_93_1.duration_ = 9.933

		local var_93_0 = {
			ja = 7.2,
			ko = 7.033,
			zh = 7.966,
			en = 9.933
		}
		local var_93_1 = manager.audio:GetLocalizationFlag()

		if var_93_0[var_93_1] ~= nil then
			arg_93_1.duration_ = var_93_0[var_93_1]
		end

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play115261024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = 0
			local var_96_1 = 1.33333333333333

			if var_96_0 < arg_93_1.time_ and arg_93_1.time_ <= var_96_0 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_2 = arg_93_1:FormatText(StoryNameCfg[94].name)

				arg_93_1.leftNameTxt_.text = var_96_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_3 = arg_93_1:GetWordFromCfg(115261023)
				local var_96_4 = arg_93_1:FormatText(var_96_3.content)

				arg_93_1.text_.text = var_96_4

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_5 = 28
				local var_96_6 = utf8.len(var_96_4)
				local var_96_7 = var_96_5 <= 0 and var_96_1 or var_96_1 * (var_96_6 / var_96_5)

				if var_96_7 > 0 and var_96_1 < var_96_7 then
					arg_93_1.talkMaxDuration = var_96_7

					if var_96_7 + var_96_0 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_7 + var_96_0
					end
				end

				arg_93_1.text_.text = var_96_4
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261023", "story_v_out_115261.awb") ~= 0 then
					local var_96_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261023", "story_v_out_115261.awb") / 1000

					if var_96_8 + var_96_0 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_8 + var_96_0
					end

					if var_96_3.prefab_name ~= "" and arg_93_1.actors_[var_96_3.prefab_name] ~= nil then
						local var_96_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_3.prefab_name].transform, "story_v_out_115261", "115261023", "story_v_out_115261.awb")

						arg_93_1:RecordAudio("115261023", var_96_9)
						arg_93_1:RecordAudio("115261023", var_96_9)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_115261", "115261023", "story_v_out_115261.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_115261", "115261023", "story_v_out_115261.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_10 = math.max(var_96_1, arg_93_1.talkMaxDuration)

			if var_96_0 <= arg_93_1.time_ and arg_93_1.time_ < var_96_0 + var_96_10 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_0) / var_96_10

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_0 + var_96_10 and arg_93_1.time_ < var_96_0 + var_96_10 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play115261024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 115261024
		arg_97_1.duration_ = 3.999999999999

		SetActive(arg_97_1.tipsGo_, false)

		function arg_97_1.onSingleLineFinish_()
			arg_97_1.onSingleLineUpdate_ = nil
			arg_97_1.onSingleLineFinish_ = nil
			arg_97_1.state_ = "waiting"
		end

		function arg_97_1.playNext_(arg_99_0)
			if arg_99_0 == 1 then
				arg_97_0:Play115261025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = 0

			if var_100_0 < arg_97_1.time_ and arg_97_1.time_ <= var_100_0 + arg_100_0 then
				arg_97_1.mask_.enabled = true
				arg_97_1.mask_.raycastTarget = false

				arg_97_1:SetGaussion(false)
			end

			local var_100_1 = 2.00133333333333

			if var_100_0 <= arg_97_1.time_ and arg_97_1.time_ < var_100_0 + var_100_1 then
				local var_100_2 = (arg_97_1.time_ - var_100_0) / var_100_1
				local var_100_3 = Color.New(0, 0, 0)

				var_100_3.a = Mathf.Lerp(0, 1, var_100_2)
				arg_97_1.mask_.color = var_100_3
			end

			if arg_97_1.time_ >= var_100_0 + var_100_1 and arg_97_1.time_ < var_100_0 + var_100_1 + arg_100_0 then
				local var_100_4 = Color.New(0, 0, 0)

				var_100_4.a = 1
				arg_97_1.mask_.color = var_100_4
			end

			local var_100_5 = 2.00133333333333

			if var_100_5 < arg_97_1.time_ and arg_97_1.time_ <= var_100_5 + arg_100_0 then
				arg_97_1.mask_.enabled = true
				arg_97_1.mask_.raycastTarget = false

				arg_97_1:SetGaussion(false)
			end

			local var_100_6 = 0.165333333333335

			if var_100_5 <= arg_97_1.time_ and arg_97_1.time_ < var_100_5 + var_100_6 then
				local var_100_7 = (arg_97_1.time_ - var_100_5) / var_100_6
				local var_100_8 = Color.New(0, 0, 0)

				var_100_8.a = Mathf.Lerp(1, 0, var_100_7)
				arg_97_1.mask_.color = var_100_8
			end

			if arg_97_1.time_ >= var_100_5 + var_100_6 and arg_97_1.time_ < var_100_5 + var_100_6 + arg_100_0 then
				local var_100_9 = Color.New(0, 0, 0)
				local var_100_10 = 0

				arg_97_1.mask_.enabled = false
				var_100_9.a = var_100_10
				arg_97_1.mask_.color = var_100_9
			end

			local var_100_11 = 2

			if var_100_11 < arg_97_1.time_ and arg_97_1.time_ <= var_100_11 + arg_100_0 then
				arg_97_1.fswbg_:SetActive(true)
				arg_97_1.dialog_:SetActive(false)

				arg_97_1.fswtw_.percent = 0

				local var_100_12 = arg_97_1:GetWordFromCfg(115261024)
				local var_100_13 = arg_97_1:FormatText(var_100_12.content)

				arg_97_1.fswt_.text = var_100_13

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.fswt_)

				arg_97_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_97_1.fswtw_:SetDirty()

				arg_97_1.typewritterCharCountI18N = 0

				arg_97_1:ShowNextGo(false)
			end

			local var_100_14 = 2.06666666666667

			if var_100_14 < arg_97_1.time_ and arg_97_1.time_ <= var_100_14 + arg_100_0 then
				arg_97_1.var_.oldValueTypewriter = arg_97_1.fswtw_.percent

				arg_97_1:ShowNextGo(false)
			end

			local var_100_15 = 0
			local var_100_16 = 0
			local var_100_17 = arg_97_1:GetWordFromCfg(115261024)
			local var_100_18 = arg_97_1:FormatText(var_100_17.content)
			local var_100_19, var_100_20 = arg_97_1:GetPercentByPara(var_100_18, 1)

			if var_100_14 < arg_97_1.time_ and arg_97_1.time_ <= var_100_14 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0

				local var_100_21 = var_100_15 <= 0 and var_100_16 or var_100_16 * ((var_100_20 - arg_97_1.typewritterCharCountI18N) / var_100_15)

				if var_100_21 > 0 and var_100_16 < var_100_21 then
					arg_97_1.talkMaxDuration = var_100_21

					if var_100_21 + var_100_14 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_21 + var_100_14
					end
				end
			end

			local var_100_22 = 0
			local var_100_23 = math.max(var_100_22, arg_97_1.talkMaxDuration)

			if var_100_14 <= arg_97_1.time_ and arg_97_1.time_ < var_100_14 + var_100_23 then
				local var_100_24 = (arg_97_1.time_ - var_100_14) / var_100_23

				arg_97_1.fswtw_.percent = Mathf.Lerp(arg_97_1.var_.oldValueTypewriter, var_100_19, var_100_24)
				arg_97_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_97_1.fswtw_:SetDirty()
			end

			if arg_97_1.time_ >= var_100_14 + var_100_23 and arg_97_1.time_ < var_100_14 + var_100_23 + arg_100_0 then
				arg_97_1.fswtw_.percent = var_100_19

				arg_97_1.fswtw_:SetDirty()
				arg_97_1:ShowNextGo(true)

				arg_97_1.typewritterCharCountI18N = var_100_20
			end

			local var_100_25 = 2.01666666666667

			if var_100_25 < arg_97_1.time_ and arg_97_1.time_ <= var_100_25 + arg_100_0 then
				arg_97_1.var_.oldValueTypewriter = arg_97_1.fswtw_.percent

				arg_97_1:ShowNextGo(false)
			end

			local var_100_26 = 15
			local var_100_27 = 1
			local var_100_28 = arg_97_1:GetWordFromCfg(115261024)
			local var_100_29 = arg_97_1:FormatText(var_100_28.content)
			local var_100_30, var_100_31 = arg_97_1:GetPercentByPara(var_100_29, 1)

			if var_100_25 < arg_97_1.time_ and arg_97_1.time_ <= var_100_25 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0

				local var_100_32 = var_100_26 <= 0 and var_100_27 or var_100_27 * ((var_100_31 - arg_97_1.typewritterCharCountI18N) / var_100_26)

				if var_100_32 > 0 and var_100_27 < var_100_32 then
					arg_97_1.talkMaxDuration = var_100_32

					if var_100_32 + var_100_25 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_32 + var_100_25
					end
				end
			end

			local var_100_33 = 1
			local var_100_34 = math.max(var_100_33, arg_97_1.talkMaxDuration)

			if var_100_25 <= arg_97_1.time_ and arg_97_1.time_ < var_100_25 + var_100_34 then
				local var_100_35 = (arg_97_1.time_ - var_100_25) / var_100_34

				arg_97_1.fswtw_.percent = Mathf.Lerp(arg_97_1.var_.oldValueTypewriter, var_100_30, var_100_35)
				arg_97_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_97_1.fswtw_:SetDirty()
			end

			if arg_97_1.time_ >= var_100_25 + var_100_34 and arg_97_1.time_ < var_100_25 + var_100_34 + arg_100_0 then
				arg_97_1.fswtw_.percent = var_100_30

				arg_97_1.fswtw_:SetDirty()
				arg_97_1:ShowNextGo(true)

				arg_97_1.typewritterCharCountI18N = var_100_31
			end

			local var_100_36 = arg_97_1.actors_["1038"].transform
			local var_100_37 = 2

			if var_100_37 < arg_97_1.time_ and arg_97_1.time_ <= var_100_37 + arg_100_0 then
				arg_97_1.var_.moveOldPos1038 = var_100_36.localPosition
				var_100_36.localScale = Vector3.New(1, 1, 1)

				arg_97_1:CheckSpriteTmpPos("1038", 7)

				local var_100_38 = var_100_36.childCount

				for iter_100_0 = 0, var_100_38 - 1 do
					local var_100_39 = var_100_36:GetChild(iter_100_0)

					if var_100_39.name == "split_9" or not string.find(var_100_39.name, "split") then
						var_100_39.gameObject:SetActive(true)
					else
						var_100_39.gameObject:SetActive(false)
					end
				end
			end

			local var_100_40 = 0.001

			if var_100_37 <= arg_97_1.time_ and arg_97_1.time_ < var_100_37 + var_100_40 then
				local var_100_41 = (arg_97_1.time_ - var_100_37) / var_100_40
				local var_100_42 = Vector3.New(0, -2000, -180)

				var_100_36.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos1038, var_100_42, var_100_41)
			end

			if arg_97_1.time_ >= var_100_37 + var_100_40 and arg_97_1.time_ < var_100_37 + var_100_40 + arg_100_0 then
				var_100_36.localPosition = Vector3.New(0, -2000, -180)
			end

			local var_100_43 = 2

			if var_100_43 < arg_97_1.time_ and arg_97_1.time_ <= var_100_43 + arg_100_0 then
				arg_97_1.screenFilterGo_:SetActive(false)
			end

			local var_100_44 = 0.0166666666666667

			if var_100_43 <= arg_97_1.time_ and arg_97_1.time_ < var_100_43 + var_100_44 then
				local var_100_45 = (arg_97_1.time_ - var_100_43) / var_100_44

				arg_97_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_100_45)
			end

			if arg_97_1.time_ >= var_100_43 + var_100_44 and arg_97_1.time_ < var_100_43 + var_100_44 + arg_100_0 then
				arg_97_1.screenFilterEffect_.weight = 0
			end

			local var_100_46 = "STblack"

			if arg_97_1.bgs_[var_100_46] == nil then
				local var_100_47 = Object.Instantiate(arg_97_1.paintGo_)

				var_100_47:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_100_46)
				var_100_47.name = var_100_46
				var_100_47.transform.parent = arg_97_1.stage_.transform
				var_100_47.transform.localPosition = Vector3.New(0, 100, 0)
				arg_97_1.bgs_[var_100_46] = var_100_47
			end

			local var_100_48 = 2

			if var_100_48 < arg_97_1.time_ and arg_97_1.time_ <= var_100_48 + arg_100_0 then
				local var_100_49 = manager.ui.mainCamera.transform.localPosition
				local var_100_50 = Vector3.New(0, 0, 10) + Vector3.New(var_100_49.x, var_100_49.y, 0)
				local var_100_51 = arg_97_1.bgs_.STblack

				var_100_51.transform.localPosition = var_100_50
				var_100_51.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_100_52 = var_100_51:GetComponent("SpriteRenderer")

				if var_100_52 and var_100_52.sprite then
					local var_100_53 = (var_100_51.transform.localPosition - var_100_49).z
					local var_100_54 = manager.ui.mainCameraCom_
					local var_100_55 = 2 * var_100_53 * Mathf.Tan(var_100_54.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_100_56 = var_100_55 * var_100_54.aspect
					local var_100_57 = var_100_52.sprite.bounds.size.x
					local var_100_58 = var_100_52.sprite.bounds.size.y
					local var_100_59 = var_100_56 / var_100_57
					local var_100_60 = var_100_55 / var_100_58
					local var_100_61 = var_100_60 < var_100_59 and var_100_59 or var_100_60

					var_100_51.transform.localScale = Vector3.New(var_100_61, var_100_61, 0)
				end

				for iter_100_1, iter_100_2 in pairs(arg_97_1.bgs_) do
					if iter_100_1 ~= "STblack" then
						iter_100_2.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end
		end
	end,
	Play115261025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 115261025
		arg_101_1.duration_ = 0.999999999999

		SetActive(arg_101_1.tipsGo_, false)

		function arg_101_1.onSingleLineFinish_()
			arg_101_1.onSingleLineUpdate_ = nil
			arg_101_1.onSingleLineFinish_ = nil
			arg_101_1.state_ = "waiting"
		end

		function arg_101_1.playNext_(arg_103_0)
			if arg_103_0 == 1 then
				arg_101_0:Play115261026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = 0

			if var_104_0 < arg_101_1.time_ and arg_101_1.time_ <= var_104_0 + arg_104_0 then
				arg_101_1.var_.oldValueTypewriter = arg_101_1.fswtw_.percent

				arg_101_1:ShowNextGo(false)
			end

			local var_104_1 = 14
			local var_104_2 = 0.933333333333333
			local var_104_3 = arg_101_1:GetWordFromCfg(115261024)
			local var_104_4 = arg_101_1:FormatText(var_104_3.content)
			local var_104_5, var_104_6 = arg_101_1:GetPercentByPara(var_104_4, 2)

			if var_104_0 < arg_101_1.time_ and arg_101_1.time_ <= var_104_0 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0

				local var_104_7 = var_104_1 <= 0 and var_104_2 or var_104_2 * ((var_104_6 - arg_101_1.typewritterCharCountI18N) / var_104_1)

				if var_104_7 > 0 and var_104_2 < var_104_7 then
					arg_101_1.talkMaxDuration = var_104_7

					if var_104_7 + var_104_0 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_7 + var_104_0
					end
				end
			end

			local var_104_8 = 0.933333333333333
			local var_104_9 = math.max(var_104_8, arg_101_1.talkMaxDuration)

			if var_104_0 <= arg_101_1.time_ and arg_101_1.time_ < var_104_0 + var_104_9 then
				local var_104_10 = (arg_101_1.time_ - var_104_0) / var_104_9

				arg_101_1.fswtw_.percent = Mathf.Lerp(arg_101_1.var_.oldValueTypewriter, var_104_5, var_104_10)
				arg_101_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_101_1.fswtw_:SetDirty()
			end

			if arg_101_1.time_ >= var_104_0 + var_104_9 and arg_101_1.time_ < var_104_0 + var_104_9 + arg_104_0 then
				arg_101_1.fswtw_.percent = var_104_5

				arg_101_1.fswtw_:SetDirty()
				arg_101_1:ShowNextGo(true)

				arg_101_1.typewritterCharCountI18N = var_104_6
			end
		end
	end,
	Play115261026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 115261026
		arg_105_1.duration_ = 1.066666666666

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play115261027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = 0

			if var_108_0 < arg_105_1.time_ and arg_105_1.time_ <= var_108_0 + arg_108_0 then
				arg_105_1.var_.oldValueTypewriter = arg_105_1.fswtw_.percent

				arg_105_1:ShowNextGo(false)
			end

			local var_108_1 = 16
			local var_108_2 = 1.06666666666667
			local var_108_3 = arg_105_1:GetWordFromCfg(115261024)
			local var_108_4 = arg_105_1:FormatText(var_108_3.content)
			local var_108_5, var_108_6 = arg_105_1:GetPercentByPara(var_108_4, 3)

			if var_108_0 < arg_105_1.time_ and arg_105_1.time_ <= var_108_0 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0

				local var_108_7 = var_108_1 <= 0 and var_108_2 or var_108_2 * ((var_108_6 - arg_105_1.typewritterCharCountI18N) / var_108_1)

				if var_108_7 > 0 and var_108_2 < var_108_7 then
					arg_105_1.talkMaxDuration = var_108_7

					if var_108_7 + var_108_0 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_7 + var_108_0
					end
				end
			end

			local var_108_8 = 1.06666666666667
			local var_108_9 = math.max(var_108_8, arg_105_1.talkMaxDuration)

			if var_108_0 <= arg_105_1.time_ and arg_105_1.time_ < var_108_0 + var_108_9 then
				local var_108_10 = (arg_105_1.time_ - var_108_0) / var_108_9

				arg_105_1.fswtw_.percent = Mathf.Lerp(arg_105_1.var_.oldValueTypewriter, var_108_5, var_108_10)
				arg_105_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_105_1.fswtw_:SetDirty()
			end

			if arg_105_1.time_ >= var_108_0 + var_108_9 and arg_105_1.time_ < var_108_0 + var_108_9 + arg_108_0 then
				arg_105_1.fswtw_.percent = var_108_5

				arg_105_1.fswtw_:SetDirty()
				arg_105_1:ShowNextGo(true)

				arg_105_1.typewritterCharCountI18N = var_108_6
			end
		end
	end,
	Play115261027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 115261027
		arg_109_1.duration_ = 1.133333333332

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play115261028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 0

			if var_112_0 < arg_109_1.time_ and arg_109_1.time_ <= var_112_0 + arg_112_0 then
				arg_109_1.var_.oldValueTypewriter = arg_109_1.fswtw_.percent

				arg_109_1:ShowNextGo(false)
			end

			local var_112_1 = 17
			local var_112_2 = 1.13333333333333
			local var_112_3 = arg_109_1:GetWordFromCfg(115261024)
			local var_112_4 = arg_109_1:FormatText(var_112_3.content)
			local var_112_5, var_112_6 = arg_109_1:GetPercentByPara(var_112_4, 4)

			if var_112_0 < arg_109_1.time_ and arg_109_1.time_ <= var_112_0 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0

				local var_112_7 = var_112_1 <= 0 and var_112_2 or var_112_2 * ((var_112_6 - arg_109_1.typewritterCharCountI18N) / var_112_1)

				if var_112_7 > 0 and var_112_2 < var_112_7 then
					arg_109_1.talkMaxDuration = var_112_7

					if var_112_7 + var_112_0 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_7 + var_112_0
					end
				end
			end

			local var_112_8 = 1.13333333333333
			local var_112_9 = math.max(var_112_8, arg_109_1.talkMaxDuration)

			if var_112_0 <= arg_109_1.time_ and arg_109_1.time_ < var_112_0 + var_112_9 then
				local var_112_10 = (arg_109_1.time_ - var_112_0) / var_112_9

				arg_109_1.fswtw_.percent = Mathf.Lerp(arg_109_1.var_.oldValueTypewriter, var_112_5, var_112_10)
				arg_109_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_109_1.fswtw_:SetDirty()
			end

			if arg_109_1.time_ >= var_112_0 + var_112_9 and arg_109_1.time_ < var_112_0 + var_112_9 + arg_112_0 then
				arg_109_1.fswtw_.percent = var_112_5

				arg_109_1.fswtw_:SetDirty()
				arg_109_1:ShowNextGo(true)

				arg_109_1.typewritterCharCountI18N = var_112_6
			end
		end
	end,
	Play115261028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 115261028
		arg_113_1.duration_ = 0.999999999999

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play115261029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				arg_113_1.var_.oldValueTypewriter = arg_113_1.fswtw_.percent

				arg_113_1:ShowNextGo(false)
			end

			local var_116_1 = 12
			local var_116_2 = 0.8
			local var_116_3 = arg_113_1:GetWordFromCfg(115261024)
			local var_116_4 = arg_113_1:FormatText(var_116_3.content)
			local var_116_5, var_116_6 = arg_113_1:GetPercentByPara(var_116_4, 5)

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0

				local var_116_7 = var_116_1 <= 0 and var_116_2 or var_116_2 * ((var_116_6 - arg_113_1.typewritterCharCountI18N) / var_116_1)

				if var_116_7 > 0 and var_116_2 < var_116_7 then
					arg_113_1.talkMaxDuration = var_116_7

					if var_116_7 + var_116_0 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_7 + var_116_0
					end
				end
			end

			local var_116_8 = 0.8
			local var_116_9 = math.max(var_116_8, arg_113_1.talkMaxDuration)

			if var_116_0 <= arg_113_1.time_ and arg_113_1.time_ < var_116_0 + var_116_9 then
				local var_116_10 = (arg_113_1.time_ - var_116_0) / var_116_9

				arg_113_1.fswtw_.percent = Mathf.Lerp(arg_113_1.var_.oldValueTypewriter, var_116_5, var_116_10)
				arg_113_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_113_1.fswtw_:SetDirty()
			end

			if arg_113_1.time_ >= var_116_0 + var_116_9 and arg_113_1.time_ < var_116_0 + var_116_9 + arg_116_0 then
				arg_113_1.fswtw_.percent = var_116_5

				arg_113_1.fswtw_:SetDirty()
				arg_113_1:ShowNextGo(true)

				arg_113_1.typewritterCharCountI18N = var_116_6
			end
		end
	end,
	Play115261029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 115261029
		arg_117_1.duration_ = 0.999999999999

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play115261030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = 0

			if var_120_0 < arg_117_1.time_ and arg_117_1.time_ <= var_120_0 + arg_120_0 then
				arg_117_1.var_.oldValueTypewriter = arg_117_1.fswtw_.percent

				arg_117_1:ShowNextGo(false)
			end

			local var_120_1 = 14
			local var_120_2 = 0.933333333333333
			local var_120_3 = arg_117_1:GetWordFromCfg(115261024)
			local var_120_4 = arg_117_1:FormatText(var_120_3.content)
			local var_120_5, var_120_6 = arg_117_1:GetPercentByPara(var_120_4, 6)

			if var_120_0 < arg_117_1.time_ and arg_117_1.time_ <= var_120_0 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0

				local var_120_7 = var_120_1 <= 0 and var_120_2 or var_120_2 * ((var_120_6 - arg_117_1.typewritterCharCountI18N) / var_120_1)

				if var_120_7 > 0 and var_120_2 < var_120_7 then
					arg_117_1.talkMaxDuration = var_120_7

					if var_120_7 + var_120_0 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_7 + var_120_0
					end
				end
			end

			local var_120_8 = 0.933333333333333
			local var_120_9 = math.max(var_120_8, arg_117_1.talkMaxDuration)

			if var_120_0 <= arg_117_1.time_ and arg_117_1.time_ < var_120_0 + var_120_9 then
				local var_120_10 = (arg_117_1.time_ - var_120_0) / var_120_9

				arg_117_1.fswtw_.percent = Mathf.Lerp(arg_117_1.var_.oldValueTypewriter, var_120_5, var_120_10)
				arg_117_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_117_1.fswtw_:SetDirty()
			end

			if arg_117_1.time_ >= var_120_0 + var_120_9 and arg_117_1.time_ < var_120_0 + var_120_9 + arg_120_0 then
				arg_117_1.fswtw_.percent = var_120_5

				arg_117_1.fswtw_:SetDirty()
				arg_117_1:ShowNextGo(true)

				arg_117_1.typewritterCharCountI18N = var_120_6
			end
		end
	end,
	Play115261030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 115261030
		arg_121_1.duration_ = 0.999999999999

		SetActive(arg_121_1.tipsGo_, false)

		function arg_121_1.onSingleLineFinish_()
			arg_121_1.onSingleLineUpdate_ = nil
			arg_121_1.onSingleLineFinish_ = nil
			arg_121_1.state_ = "waiting"
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play115261031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = 0

			if var_124_0 < arg_121_1.time_ and arg_121_1.time_ <= var_124_0 + arg_124_0 then
				arg_121_1.var_.oldValueTypewriter = arg_121_1.fswtw_.percent

				arg_121_1:ShowNextGo(false)
			end

			local var_124_1 = 14
			local var_124_2 = 0.933333333333333
			local var_124_3 = arg_121_1:GetWordFromCfg(115261024)
			local var_124_4 = arg_121_1:FormatText(var_124_3.content)
			local var_124_5, var_124_6 = arg_121_1:GetPercentByPara(var_124_4, 7)

			if var_124_0 < arg_121_1.time_ and arg_121_1.time_ <= var_124_0 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0

				local var_124_7 = var_124_1 <= 0 and var_124_2 or var_124_2 * ((var_124_6 - arg_121_1.typewritterCharCountI18N) / var_124_1)

				if var_124_7 > 0 and var_124_2 < var_124_7 then
					arg_121_1.talkMaxDuration = var_124_7

					if var_124_7 + var_124_0 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_7 + var_124_0
					end
				end
			end

			local var_124_8 = 0.933333333333333
			local var_124_9 = math.max(var_124_8, arg_121_1.talkMaxDuration)

			if var_124_0 <= arg_121_1.time_ and arg_121_1.time_ < var_124_0 + var_124_9 then
				local var_124_10 = (arg_121_1.time_ - var_124_0) / var_124_9

				arg_121_1.fswtw_.percent = Mathf.Lerp(arg_121_1.var_.oldValueTypewriter, var_124_5, var_124_10)
				arg_121_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_121_1.fswtw_:SetDirty()
			end

			if arg_121_1.time_ >= var_124_0 + var_124_9 and arg_121_1.time_ < var_124_0 + var_124_9 + arg_124_0 then
				arg_121_1.fswtw_.percent = var_124_5

				arg_121_1.fswtw_:SetDirty()
				arg_121_1:ShowNextGo(true)

				arg_121_1.typewritterCharCountI18N = var_124_6
			end
		end
	end,
	Play115261031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 115261031
		arg_125_1.duration_ = 7.99999999999999

		local var_125_0 = {
			ja = 6.99999999999999,
			ko = 7.06599999999999,
			zh = 7.99999999999999,
			en = 7.13299999999999
		}
		local var_125_1 = manager.audio:GetLocalizationFlag()

		if var_125_0[var_125_1] ~= nil then
			arg_125_1.duration_ = var_125_0[var_125_1]
		end

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play115261032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = "F01a"

			if arg_125_1.bgs_[var_128_0] == nil then
				local var_128_1 = Object.Instantiate(arg_125_1.paintGo_)

				var_128_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_128_0)
				var_128_1.name = var_128_0
				var_128_1.transform.parent = arg_125_1.stage_.transform
				var_128_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_125_1.bgs_[var_128_0] = var_128_1
			end

			local var_128_2 = 4

			if var_128_2 < arg_125_1.time_ and arg_125_1.time_ <= var_128_2 + arg_128_0 then
				local var_128_3 = manager.ui.mainCamera.transform.localPosition
				local var_128_4 = Vector3.New(0, 0, 10) + Vector3.New(var_128_3.x, var_128_3.y, 0)
				local var_128_5 = arg_125_1.bgs_.F01a

				var_128_5.transform.localPosition = var_128_4
				var_128_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_128_6 = var_128_5:GetComponent("SpriteRenderer")

				if var_128_6 and var_128_6.sprite then
					local var_128_7 = (var_128_5.transform.localPosition - var_128_3).z
					local var_128_8 = manager.ui.mainCameraCom_
					local var_128_9 = 2 * var_128_7 * Mathf.Tan(var_128_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_128_10 = var_128_9 * var_128_8.aspect
					local var_128_11 = var_128_6.sprite.bounds.size.x
					local var_128_12 = var_128_6.sprite.bounds.size.y
					local var_128_13 = var_128_10 / var_128_11
					local var_128_14 = var_128_9 / var_128_12
					local var_128_15 = var_128_14 < var_128_13 and var_128_13 or var_128_14

					var_128_5.transform.localScale = Vector3.New(var_128_15, var_128_15, 0)
				end

				for iter_128_0, iter_128_1 in pairs(arg_125_1.bgs_) do
					if iter_128_0 ~= "F01a" then
						iter_128_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_128_16 = 4

			if var_128_16 < arg_125_1.time_ and arg_125_1.time_ <= var_128_16 + arg_128_0 then
				arg_125_1.mask_.enabled = true
				arg_125_1.mask_.raycastTarget = false

				arg_125_1:SetGaussion(false)
			end

			local var_128_17 = 2

			if var_128_16 <= arg_125_1.time_ and arg_125_1.time_ < var_128_16 + var_128_17 then
				local var_128_18 = (arg_125_1.time_ - var_128_16) / var_128_17
				local var_128_19 = Color.New(0, 0, 0)

				var_128_19.a = Mathf.Lerp(1, 0, var_128_18)
				arg_125_1.mask_.color = var_128_19
			end

			if arg_125_1.time_ >= var_128_16 + var_128_17 and arg_125_1.time_ < var_128_16 + var_128_17 + arg_128_0 then
				local var_128_20 = Color.New(0, 0, 0)
				local var_128_21 = 0

				arg_125_1.mask_.enabled = false
				var_128_20.a = var_128_21
				arg_125_1.mask_.color = var_128_20
			end

			local var_128_22 = arg_125_1.actors_["1038"].transform
			local var_128_23 = 5.99999999999999

			if var_128_23 < arg_125_1.time_ and arg_125_1.time_ <= var_128_23 + arg_128_0 then
				arg_125_1.var_.moveOldPos1038 = var_128_22.localPosition
				var_128_22.localScale = Vector3.New(1, 1, 1)

				arg_125_1:CheckSpriteTmpPos("1038", 2)

				local var_128_24 = var_128_22.childCount

				for iter_128_2 = 0, var_128_24 - 1 do
					local var_128_25 = var_128_22:GetChild(iter_128_2)

					if var_128_25.name == "split_1" or not string.find(var_128_25.name, "split") then
						var_128_25.gameObject:SetActive(true)
					else
						var_128_25.gameObject:SetActive(false)
					end
				end
			end

			local var_128_26 = 0.001

			if var_128_23 <= arg_125_1.time_ and arg_125_1.time_ < var_128_23 + var_128_26 then
				local var_128_27 = (arg_125_1.time_ - var_128_23) / var_128_26
				local var_128_28 = Vector3.New(-390, -400, 0)

				var_128_22.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos1038, var_128_28, var_128_27)
			end

			if arg_125_1.time_ >= var_128_23 + var_128_26 and arg_125_1.time_ < var_128_23 + var_128_26 + arg_128_0 then
				var_128_22.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_128_29 = 0

			if var_128_29 < arg_125_1.time_ and arg_125_1.time_ <= var_128_29 + arg_128_0 then
				arg_125_1.fswbg_:SetActive(false)
				arg_125_1.dialog_:SetActive(true)
				arg_125_1:ShowNextGo(false)
			end

			local var_128_30 = arg_125_1.actors_["1038"]
			local var_128_31 = 5.99999999999999

			if var_128_31 < arg_125_1.time_ and arg_125_1.time_ <= var_128_31 + arg_128_0 and arg_125_1.var_.actorSpriteComps1038 == nil then
				arg_125_1.var_.actorSpriteComps1038 = var_128_30:GetComponentsInChildren(typeof(Image), true)
			end

			local var_128_32 = 0.2

			if var_128_31 <= arg_125_1.time_ and arg_125_1.time_ < var_128_31 + var_128_32 then
				local var_128_33 = (arg_125_1.time_ - var_128_31) / var_128_32

				if arg_125_1.var_.actorSpriteComps1038 then
					for iter_128_3, iter_128_4 in pairs(arg_125_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_128_4 then
							local var_128_34 = Mathf.Lerp(iter_128_4.color.r, 1, var_128_33)

							iter_128_4.color = Color.New(var_128_34, var_128_34, var_128_34)
						end
					end
				end
			end

			if arg_125_1.time_ >= var_128_31 + var_128_32 and arg_125_1.time_ < var_128_31 + var_128_32 + arg_128_0 and arg_125_1.var_.actorSpriteComps1038 then
				local var_128_35 = 1

				for iter_128_5, iter_128_6 in pairs(arg_125_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_128_6 then
						iter_128_6.color = Color.New(var_128_35, var_128_35, var_128_35)
					end
				end

				arg_125_1.var_.actorSpriteComps1038 = nil
			end

			local var_128_36 = arg_125_1.actors_["1038"]
			local var_128_37 = 5.99999999999999

			if var_128_37 < arg_125_1.time_ and arg_125_1.time_ <= var_128_37 + arg_128_0 then
				local var_128_38 = var_128_36:GetComponentInChildren(typeof(CanvasGroup))

				if var_128_38 then
					arg_125_1.var_.alphaOldValue1038 = var_128_38.alpha
					arg_125_1.var_.characterEffect1038 = var_128_38
				end

				arg_125_1.var_.alphaOldValue1038 = 0
			end

			local var_128_39 = 0.5

			if var_128_37 <= arg_125_1.time_ and arg_125_1.time_ < var_128_37 + var_128_39 then
				local var_128_40 = (arg_125_1.time_ - var_128_37) / var_128_39
				local var_128_41 = Mathf.Lerp(arg_125_1.var_.alphaOldValue1038, 1, var_128_40)

				if arg_125_1.var_.characterEffect1038 then
					arg_125_1.var_.characterEffect1038.alpha = var_128_41
				end
			end

			if arg_125_1.time_ >= var_128_37 + var_128_39 and arg_125_1.time_ < var_128_37 + var_128_39 + arg_128_0 and arg_125_1.var_.characterEffect1038 then
				arg_125_1.var_.characterEffect1038.alpha = 1
			end

			local var_128_42 = 1.03333333333333
			local var_128_43 = 1

			if var_128_42 < arg_125_1.time_ and arg_125_1.time_ <= var_128_42 + arg_128_0 then
				local var_128_44 = "play"
				local var_128_45 = "music"

				arg_125_1:AudioAction(var_128_44, var_128_45, "bgm_side_daily03", "bgm_side_daily03", "bgm_side_daily03.awb")
			end

			local var_128_46 = 0
			local var_128_47 = 1

			if var_128_46 < arg_125_1.time_ and arg_125_1.time_ <= var_128_46 + arg_128_0 then
				local var_128_48 = "play"
				local var_128_49 = "music"

				arg_125_1:AudioAction(var_128_48, var_128_49, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_125_1.frameCnt_ <= 1 then
				arg_125_1.dialog_:SetActive(false)
			end

			local var_128_50 = 5.99999999999999
			local var_128_51 = 0.1

			if var_128_50 < arg_125_1.time_ and arg_125_1.time_ <= var_128_50 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0

				arg_125_1.dialog_:SetActive(true)

				local var_128_52 = LeanTween.value(arg_125_1.dialog_, 0, 1, 0.3)

				var_128_52:setOnUpdate(LuaHelper.FloatAction(function(arg_129_0)
					arg_125_1.dialogCg_.alpha = arg_129_0
				end))
				var_128_52:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_125_1.dialog_)
					var_128_52:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_125_1.duration_ = arg_125_1.duration_ + 0.3

				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_53 = arg_125_1:FormatText(StoryNameCfg[94].name)

				arg_125_1.leftNameTxt_.text = var_128_53

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_54 = arg_125_1:GetWordFromCfg(115261031)
				local var_128_55 = arg_125_1:FormatText(var_128_54.content)

				arg_125_1.text_.text = var_128_55

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_56 = 4
				local var_128_57 = utf8.len(var_128_55)
				local var_128_58 = var_128_56 <= 0 and var_128_51 or var_128_51 * (var_128_57 / var_128_56)

				if var_128_58 > 0 and var_128_51 < var_128_58 then
					arg_125_1.talkMaxDuration = var_128_58
					var_128_50 = var_128_50 + 0.3

					if var_128_58 + var_128_50 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_58 + var_128_50
					end
				end

				arg_125_1.text_.text = var_128_55
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261031", "story_v_out_115261.awb") ~= 0 then
					local var_128_59 = manager.audio:GetVoiceLength("story_v_out_115261", "115261031", "story_v_out_115261.awb") / 1000

					if var_128_59 + var_128_50 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_59 + var_128_50
					end

					if var_128_54.prefab_name ~= "" and arg_125_1.actors_[var_128_54.prefab_name] ~= nil then
						local var_128_60 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_54.prefab_name].transform, "story_v_out_115261", "115261031", "story_v_out_115261.awb")

						arg_125_1:RecordAudio("115261031", var_128_60)
						arg_125_1:RecordAudio("115261031", var_128_60)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_115261", "115261031", "story_v_out_115261.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_115261", "115261031", "story_v_out_115261.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_61 = var_128_50 + 0.3
			local var_128_62 = math.max(var_128_51, arg_125_1.talkMaxDuration)

			if var_128_61 <= arg_125_1.time_ and arg_125_1.time_ < var_128_61 + var_128_62 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_61) / var_128_62

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_61 + var_128_62 and arg_125_1.time_ < var_128_61 + var_128_62 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play115261032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 115261032
		arg_131_1.duration_ = 1.2

		local var_131_0 = {
			ja = 0.999999999999,
			ko = 1.066,
			zh = 1.133,
			en = 1.2
		}
		local var_131_1 = manager.audio:GetLocalizationFlag()

		if var_131_0[var_131_1] ~= nil then
			arg_131_1.duration_ = var_131_0[var_131_1]
		end

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play115261033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["1038"]
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 and arg_131_1.var_.actorSpriteComps1038 == nil then
				arg_131_1.var_.actorSpriteComps1038 = var_134_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_134_2 = 0.2

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2

				if arg_131_1.var_.actorSpriteComps1038 then
					for iter_134_0, iter_134_1 in pairs(arg_131_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_134_1 then
							local var_134_4 = Mathf.Lerp(iter_134_1.color.r, 0.5, var_134_3)

							iter_134_1.color = Color.New(var_134_4, var_134_4, var_134_4)
						end
					end
				end
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 and arg_131_1.var_.actorSpriteComps1038 then
				local var_134_5 = 0.5

				for iter_134_2, iter_134_3 in pairs(arg_131_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_134_3 then
						iter_134_3.color = Color.New(var_134_5, var_134_5, var_134_5)
					end
				end

				arg_131_1.var_.actorSpriteComps1038 = nil
			end

			local var_134_6 = "10030"

			if arg_131_1.actors_[var_134_6] == nil then
				local var_134_7 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_134_6), arg_131_1.canvasGo_.transform)

				var_134_7.transform:SetSiblingIndex(1)

				var_134_7.name = var_134_6
				var_134_7.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_131_1.actors_[var_134_6] = var_134_7
			end

			local var_134_8 = arg_131_1.actors_["10030"].transform
			local var_134_9 = 0

			if var_134_9 < arg_131_1.time_ and arg_131_1.time_ <= var_134_9 + arg_134_0 then
				arg_131_1.var_.moveOldPos10030 = var_134_8.localPosition
				var_134_8.localScale = Vector3.New(1, 1, 1)

				arg_131_1:CheckSpriteTmpPos("10030", 4)

				local var_134_10 = var_134_8.childCount

				for iter_134_4 = 0, var_134_10 - 1 do
					local var_134_11 = var_134_8:GetChild(iter_134_4)

					if var_134_11.name == "split_1" or not string.find(var_134_11.name, "split") then
						var_134_11.gameObject:SetActive(true)
					else
						var_134_11.gameObject:SetActive(false)
					end
				end
			end

			local var_134_12 = 0.001

			if var_134_9 <= arg_131_1.time_ and arg_131_1.time_ < var_134_9 + var_134_12 then
				local var_134_13 = (arg_131_1.time_ - var_134_9) / var_134_12
				local var_134_14 = Vector3.New(390, -390, 150)

				var_134_8.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos10030, var_134_14, var_134_13)
			end

			if arg_131_1.time_ >= var_134_9 + var_134_12 and arg_131_1.time_ < var_134_9 + var_134_12 + arg_134_0 then
				var_134_8.localPosition = Vector3.New(390, -390, 150)
			end

			local var_134_15 = arg_131_1.actors_["10030"]
			local var_134_16 = 0

			if var_134_16 < arg_131_1.time_ and arg_131_1.time_ <= var_134_16 + arg_134_0 and arg_131_1.var_.actorSpriteComps10030 == nil then
				arg_131_1.var_.actorSpriteComps10030 = var_134_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_134_17 = 0.2

			if var_134_16 <= arg_131_1.time_ and arg_131_1.time_ < var_134_16 + var_134_17 then
				local var_134_18 = (arg_131_1.time_ - var_134_16) / var_134_17

				if arg_131_1.var_.actorSpriteComps10030 then
					for iter_134_5, iter_134_6 in pairs(arg_131_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_134_6 then
							local var_134_19 = Mathf.Lerp(iter_134_6.color.r, 1, var_134_18)

							iter_134_6.color = Color.New(var_134_19, var_134_19, var_134_19)
						end
					end
				end
			end

			if arg_131_1.time_ >= var_134_16 + var_134_17 and arg_131_1.time_ < var_134_16 + var_134_17 + arg_134_0 and arg_131_1.var_.actorSpriteComps10030 then
				local var_134_20 = 1

				for iter_134_7, iter_134_8 in pairs(arg_131_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_134_8 then
						iter_134_8.color = Color.New(var_134_20, var_134_20, var_134_20)
					end
				end

				arg_131_1.var_.actorSpriteComps10030 = nil
			end

			local var_134_21 = arg_131_1.actors_["10030"]
			local var_134_22 = 0

			if var_134_22 < arg_131_1.time_ and arg_131_1.time_ <= var_134_22 + arg_134_0 then
				local var_134_23 = var_134_21:GetComponentInChildren(typeof(CanvasGroup))

				if var_134_23 then
					arg_131_1.var_.alphaOldValue10030 = var_134_23.alpha
					arg_131_1.var_.characterEffect10030 = var_134_23
				end

				arg_131_1.var_.alphaOldValue10030 = 0
			end

			local var_134_24 = 0.5

			if var_134_22 <= arg_131_1.time_ and arg_131_1.time_ < var_134_22 + var_134_24 then
				local var_134_25 = (arg_131_1.time_ - var_134_22) / var_134_24
				local var_134_26 = Mathf.Lerp(arg_131_1.var_.alphaOldValue10030, 1, var_134_25)

				if arg_131_1.var_.characterEffect10030 then
					arg_131_1.var_.characterEffect10030.alpha = var_134_26
				end
			end

			if arg_131_1.time_ >= var_134_22 + var_134_24 and arg_131_1.time_ < var_134_22 + var_134_24 + arg_134_0 and arg_131_1.var_.characterEffect10030 then
				arg_131_1.var_.characterEffect10030.alpha = 1
			end

			local var_134_27 = 0
			local var_134_28 = 0.1

			if var_134_27 < arg_131_1.time_ and arg_131_1.time_ <= var_134_27 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_29 = arg_131_1:FormatText(StoryNameCfg[309].name)

				arg_131_1.leftNameTxt_.text = var_134_29

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_30 = arg_131_1:GetWordFromCfg(115261032)
				local var_134_31 = arg_131_1:FormatText(var_134_30.content)

				arg_131_1.text_.text = var_134_31

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_32 = 4
				local var_134_33 = utf8.len(var_134_31)
				local var_134_34 = var_134_32 <= 0 and var_134_28 or var_134_28 * (var_134_33 / var_134_32)

				if var_134_34 > 0 and var_134_28 < var_134_34 then
					arg_131_1.talkMaxDuration = var_134_34

					if var_134_34 + var_134_27 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_34 + var_134_27
					end
				end

				arg_131_1.text_.text = var_134_31
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261032", "story_v_out_115261.awb") ~= 0 then
					local var_134_35 = manager.audio:GetVoiceLength("story_v_out_115261", "115261032", "story_v_out_115261.awb") / 1000

					if var_134_35 + var_134_27 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_35 + var_134_27
					end

					if var_134_30.prefab_name ~= "" and arg_131_1.actors_[var_134_30.prefab_name] ~= nil then
						local var_134_36 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_30.prefab_name].transform, "story_v_out_115261", "115261032", "story_v_out_115261.awb")

						arg_131_1:RecordAudio("115261032", var_134_36)
						arg_131_1:RecordAudio("115261032", var_134_36)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_115261", "115261032", "story_v_out_115261.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_115261", "115261032", "story_v_out_115261.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_37 = math.max(var_134_28, arg_131_1.talkMaxDuration)

			if var_134_27 <= arg_131_1.time_ and arg_131_1.time_ < var_134_27 + var_134_37 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_27) / var_134_37

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_27 + var_134_37 and arg_131_1.time_ < var_134_27 + var_134_37 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play115261033 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 115261033
		arg_135_1.duration_ = 5.4

		local var_135_0 = {
			ja = 4.8,
			ko = 5.4,
			zh = 4,
			en = 5
		}
		local var_135_1 = manager.audio:GetLocalizationFlag()

		if var_135_0[var_135_1] ~= nil then
			arg_135_1.duration_ = var_135_0[var_135_1]
		end

		SetActive(arg_135_1.tipsGo_, false)

		function arg_135_1.onSingleLineFinish_()
			arg_135_1.onSingleLineUpdate_ = nil
			arg_135_1.onSingleLineFinish_ = nil
			arg_135_1.state_ = "waiting"
		end

		function arg_135_1.playNext_(arg_137_0)
			if arg_137_0 == 1 then
				arg_135_0:Play115261034(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = 0
			local var_138_1 = 0.4

			if var_138_0 < arg_135_1.time_ and arg_135_1.time_ <= var_138_0 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_2 = arg_135_1:FormatText(StoryNameCfg[309].name)

				arg_135_1.leftNameTxt_.text = var_138_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_3 = arg_135_1:GetWordFromCfg(115261033)
				local var_138_4 = arg_135_1:FormatText(var_138_3.content)

				arg_135_1.text_.text = var_138_4

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_5 = 16
				local var_138_6 = utf8.len(var_138_4)
				local var_138_7 = var_138_5 <= 0 and var_138_1 or var_138_1 * (var_138_6 / var_138_5)

				if var_138_7 > 0 and var_138_1 < var_138_7 then
					arg_135_1.talkMaxDuration = var_138_7

					if var_138_7 + var_138_0 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_7 + var_138_0
					end
				end

				arg_135_1.text_.text = var_138_4
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261033", "story_v_out_115261.awb") ~= 0 then
					local var_138_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261033", "story_v_out_115261.awb") / 1000

					if var_138_8 + var_138_0 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_8 + var_138_0
					end

					if var_138_3.prefab_name ~= "" and arg_135_1.actors_[var_138_3.prefab_name] ~= nil then
						local var_138_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_3.prefab_name].transform, "story_v_out_115261", "115261033", "story_v_out_115261.awb")

						arg_135_1:RecordAudio("115261033", var_138_9)
						arg_135_1:RecordAudio("115261033", var_138_9)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_115261", "115261033", "story_v_out_115261.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_115261", "115261033", "story_v_out_115261.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_10 = math.max(var_138_1, arg_135_1.talkMaxDuration)

			if var_138_0 <= arg_135_1.time_ and arg_135_1.time_ < var_138_0 + var_138_10 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_0) / var_138_10

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_0 + var_138_10 and arg_135_1.time_ < var_138_0 + var_138_10 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play115261034 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 115261034
		arg_139_1.duration_ = 5

		SetActive(arg_139_1.tipsGo_, false)

		function arg_139_1.onSingleLineFinish_()
			arg_139_1.onSingleLineUpdate_ = nil
			arg_139_1.onSingleLineFinish_ = nil
			arg_139_1.state_ = "waiting"
		end

		function arg_139_1.playNext_(arg_141_0)
			if arg_141_0 == 1 then
				arg_139_0:Play115261035(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["1038"].transform
			local var_142_1 = 0.5

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 then
				arg_139_1.var_.moveOldPos1038 = var_142_0.localPosition
				var_142_0.localScale = Vector3.New(1, 1, 1)

				arg_139_1:CheckSpriteTmpPos("1038", 7)

				local var_142_2 = var_142_0.childCount

				for iter_142_0 = 0, var_142_2 - 1 do
					local var_142_3 = var_142_0:GetChild(iter_142_0)

					if var_142_3.name == "split_5" or not string.find(var_142_3.name, "split") then
						var_142_3.gameObject:SetActive(true)
					else
						var_142_3.gameObject:SetActive(false)
					end
				end
			end

			local var_142_4 = 0.001

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_4 then
				local var_142_5 = (arg_139_1.time_ - var_142_1) / var_142_4
				local var_142_6 = Vector3.New(0, -2000, 0)

				var_142_0.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos1038, var_142_6, var_142_5)
			end

			if arg_139_1.time_ >= var_142_1 + var_142_4 and arg_139_1.time_ < var_142_1 + var_142_4 + arg_142_0 then
				var_142_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_142_7 = arg_139_1.actors_["10030"].transform
			local var_142_8 = 0.5

			if var_142_8 < arg_139_1.time_ and arg_139_1.time_ <= var_142_8 + arg_142_0 then
				arg_139_1.var_.moveOldPos10030 = var_142_7.localPosition
				var_142_7.localScale = Vector3.New(1, 1, 1)

				arg_139_1:CheckSpriteTmpPos("10030", 7)

				local var_142_9 = var_142_7.childCount

				for iter_142_1 = 0, var_142_9 - 1 do
					local var_142_10 = var_142_7:GetChild(iter_142_1)

					if var_142_10.name == "split_1" or not string.find(var_142_10.name, "split") then
						var_142_10.gameObject:SetActive(true)
					else
						var_142_10.gameObject:SetActive(false)
					end
				end
			end

			local var_142_11 = 0.001

			if var_142_8 <= arg_139_1.time_ and arg_139_1.time_ < var_142_8 + var_142_11 then
				local var_142_12 = (arg_139_1.time_ - var_142_8) / var_142_11
				local var_142_13 = Vector3.New(0, -2000, 150)

				var_142_7.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos10030, var_142_13, var_142_12)
			end

			if arg_139_1.time_ >= var_142_8 + var_142_11 and arg_139_1.time_ < var_142_8 + var_142_11 + arg_142_0 then
				var_142_7.localPosition = Vector3.New(0, -2000, 150)
			end

			local var_142_14 = arg_139_1.actors_["10030"]
			local var_142_15 = 0

			if var_142_15 < arg_139_1.time_ and arg_139_1.time_ <= var_142_15 + arg_142_0 then
				local var_142_16 = var_142_14:GetComponentInChildren(typeof(CanvasGroup))

				if var_142_16 then
					arg_139_1.var_.alphaOldValue10030 = var_142_16.alpha
					arg_139_1.var_.characterEffect10030 = var_142_16
				end

				arg_139_1.var_.alphaOldValue10030 = 1
			end

			local var_142_17 = 0.2

			if var_142_15 <= arg_139_1.time_ and arg_139_1.time_ < var_142_15 + var_142_17 then
				local var_142_18 = (arg_139_1.time_ - var_142_15) / var_142_17
				local var_142_19 = Mathf.Lerp(arg_139_1.var_.alphaOldValue10030, 0, var_142_18)

				if arg_139_1.var_.characterEffect10030 then
					arg_139_1.var_.characterEffect10030.alpha = var_142_19
				end
			end

			if arg_139_1.time_ >= var_142_15 + var_142_17 and arg_139_1.time_ < var_142_15 + var_142_17 + arg_142_0 and arg_139_1.var_.characterEffect10030 then
				arg_139_1.var_.characterEffect10030.alpha = 0
			end

			local var_142_20 = arg_139_1.actors_["1038"]
			local var_142_21 = 0

			if var_142_21 < arg_139_1.time_ and arg_139_1.time_ <= var_142_21 + arg_142_0 then
				local var_142_22 = var_142_20:GetComponentInChildren(typeof(CanvasGroup))

				if var_142_22 then
					arg_139_1.var_.alphaOldValue1038 = var_142_22.alpha
					arg_139_1.var_.characterEffect1038 = var_142_22
				end

				arg_139_1.var_.alphaOldValue1038 = 1
			end

			local var_142_23 = 0.2

			if var_142_21 <= arg_139_1.time_ and arg_139_1.time_ < var_142_21 + var_142_23 then
				local var_142_24 = (arg_139_1.time_ - var_142_21) / var_142_23
				local var_142_25 = Mathf.Lerp(arg_139_1.var_.alphaOldValue1038, 0, var_142_24)

				if arg_139_1.var_.characterEffect1038 then
					arg_139_1.var_.characterEffect1038.alpha = var_142_25
				end
			end

			if arg_139_1.time_ >= var_142_21 + var_142_23 and arg_139_1.time_ < var_142_21 + var_142_23 + arg_142_0 and arg_139_1.var_.characterEffect1038 then
				arg_139_1.var_.characterEffect1038.alpha = 0
			end

			local var_142_26 = 0
			local var_142_27 = 0.7

			if var_142_26 < arg_139_1.time_ and arg_139_1.time_ <= var_142_26 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, false)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_28 = arg_139_1:GetWordFromCfg(115261034)
				local var_142_29 = arg_139_1:FormatText(var_142_28.content)

				arg_139_1.text_.text = var_142_29

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_30 = 28
				local var_142_31 = utf8.len(var_142_29)
				local var_142_32 = var_142_30 <= 0 and var_142_27 or var_142_27 * (var_142_31 / var_142_30)

				if var_142_32 > 0 and var_142_27 < var_142_32 then
					arg_139_1.talkMaxDuration = var_142_32

					if var_142_32 + var_142_26 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_32 + var_142_26
					end
				end

				arg_139_1.text_.text = var_142_29
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)
				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_33 = math.max(var_142_27, arg_139_1.talkMaxDuration)

			if var_142_26 <= arg_139_1.time_ and arg_139_1.time_ < var_142_26 + var_142_33 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_26) / var_142_33

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_26 + var_142_33 and arg_139_1.time_ < var_142_26 + var_142_33 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play115261035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 115261035
		arg_143_1.duration_ = 5

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play115261036(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = 0
			local var_146_1 = 1.275

			if var_146_0 < arg_143_1.time_ and arg_143_1.time_ <= var_146_0 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, false)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_2 = arg_143_1:GetWordFromCfg(115261035)
				local var_146_3 = arg_143_1:FormatText(var_146_2.content)

				arg_143_1.text_.text = var_146_3

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_4 = 51
				local var_146_5 = utf8.len(var_146_3)
				local var_146_6 = var_146_4 <= 0 and var_146_1 or var_146_1 * (var_146_5 / var_146_4)

				if var_146_6 > 0 and var_146_1 < var_146_6 then
					arg_143_1.talkMaxDuration = var_146_6

					if var_146_6 + var_146_0 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_6 + var_146_0
					end
				end

				arg_143_1.text_.text = var_146_3
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)
				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_7 = math.max(var_146_1, arg_143_1.talkMaxDuration)

			if var_146_0 <= arg_143_1.time_ and arg_143_1.time_ < var_146_0 + var_146_7 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_0) / var_146_7

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_0 + var_146_7 and arg_143_1.time_ < var_146_0 + var_146_7 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play115261036 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 115261036
		arg_147_1.duration_ = 6.033

		local var_147_0 = {
			ja = 5.8,
			ko = 6.033,
			zh = 4.3,
			en = 3.766
		}
		local var_147_1 = manager.audio:GetLocalizationFlag()

		if var_147_0[var_147_1] ~= nil then
			arg_147_1.duration_ = var_147_0[var_147_1]
		end

		SetActive(arg_147_1.tipsGo_, false)

		function arg_147_1.onSingleLineFinish_()
			arg_147_1.onSingleLineUpdate_ = nil
			arg_147_1.onSingleLineFinish_ = nil
			arg_147_1.state_ = "waiting"
		end

		function arg_147_1.playNext_(arg_149_0)
			if arg_149_0 == 1 then
				arg_147_0:Play115261037(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["10030"]
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 and arg_147_1.var_.actorSpriteComps10030 == nil then
				arg_147_1.var_.actorSpriteComps10030 = var_150_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_150_2 = 0.2

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_2 then
				local var_150_3 = (arg_147_1.time_ - var_150_1) / var_150_2

				if arg_147_1.var_.actorSpriteComps10030 then
					for iter_150_0, iter_150_1 in pairs(arg_147_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_150_1 then
							local var_150_4 = Mathf.Lerp(iter_150_1.color.r, 1, var_150_3)

							iter_150_1.color = Color.New(var_150_4, var_150_4, var_150_4)
						end
					end
				end
			end

			if arg_147_1.time_ >= var_150_1 + var_150_2 and arg_147_1.time_ < var_150_1 + var_150_2 + arg_150_0 and arg_147_1.var_.actorSpriteComps10030 then
				local var_150_5 = 1

				for iter_150_2, iter_150_3 in pairs(arg_147_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_150_3 then
						iter_150_3.color = Color.New(var_150_5, var_150_5, var_150_5)
					end
				end

				arg_147_1.var_.actorSpriteComps10030 = nil
			end

			local var_150_6 = arg_147_1.actors_["10030"].transform
			local var_150_7 = 0

			if var_150_7 < arg_147_1.time_ and arg_147_1.time_ <= var_150_7 + arg_150_0 then
				arg_147_1.var_.moveOldPos10030 = var_150_6.localPosition
				var_150_6.localScale = Vector3.New(1, 1, 1)

				arg_147_1:CheckSpriteTmpPos("10030", 4)

				local var_150_8 = var_150_6.childCount

				for iter_150_4 = 0, var_150_8 - 1 do
					local var_150_9 = var_150_6:GetChild(iter_150_4)

					if var_150_9.name == "split_3" or not string.find(var_150_9.name, "split") then
						var_150_9.gameObject:SetActive(true)
					else
						var_150_9.gameObject:SetActive(false)
					end
				end
			end

			local var_150_10 = 0.001

			if var_150_7 <= arg_147_1.time_ and arg_147_1.time_ < var_150_7 + var_150_10 then
				local var_150_11 = (arg_147_1.time_ - var_150_7) / var_150_10
				local var_150_12 = Vector3.New(390, -390, 150)

				var_150_6.localPosition = Vector3.Lerp(arg_147_1.var_.moveOldPos10030, var_150_12, var_150_11)
			end

			if arg_147_1.time_ >= var_150_7 + var_150_10 and arg_147_1.time_ < var_150_7 + var_150_10 + arg_150_0 then
				var_150_6.localPosition = Vector3.New(390, -390, 150)
			end

			local var_150_13 = arg_147_1.actors_["10030"]
			local var_150_14 = 0

			if var_150_14 < arg_147_1.time_ and arg_147_1.time_ <= var_150_14 + arg_150_0 then
				local var_150_15 = var_150_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_150_15 then
					arg_147_1.var_.alphaOldValue10030 = var_150_15.alpha
					arg_147_1.var_.characterEffect10030 = var_150_15
				end

				arg_147_1.var_.alphaOldValue10030 = 0
			end

			local var_150_16 = 0.5

			if var_150_14 <= arg_147_1.time_ and arg_147_1.time_ < var_150_14 + var_150_16 then
				local var_150_17 = (arg_147_1.time_ - var_150_14) / var_150_16
				local var_150_18 = Mathf.Lerp(arg_147_1.var_.alphaOldValue10030, 1, var_150_17)

				if arg_147_1.var_.characterEffect10030 then
					arg_147_1.var_.characterEffect10030.alpha = var_150_18
				end
			end

			if arg_147_1.time_ >= var_150_14 + var_150_16 and arg_147_1.time_ < var_150_14 + var_150_16 + arg_150_0 and arg_147_1.var_.characterEffect10030 then
				arg_147_1.var_.characterEffect10030.alpha = 1
			end

			local var_150_19 = 0
			local var_150_20 = 0.35

			if var_150_19 < arg_147_1.time_ and arg_147_1.time_ <= var_150_19 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_21 = arg_147_1:FormatText(StoryNameCfg[309].name)

				arg_147_1.leftNameTxt_.text = var_150_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_22 = arg_147_1:GetWordFromCfg(115261036)
				local var_150_23 = arg_147_1:FormatText(var_150_22.content)

				arg_147_1.text_.text = var_150_23

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_24 = 14
				local var_150_25 = utf8.len(var_150_23)
				local var_150_26 = var_150_24 <= 0 and var_150_20 or var_150_20 * (var_150_25 / var_150_24)

				if var_150_26 > 0 and var_150_20 < var_150_26 then
					arg_147_1.talkMaxDuration = var_150_26

					if var_150_26 + var_150_19 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_26 + var_150_19
					end
				end

				arg_147_1.text_.text = var_150_23
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261036", "story_v_out_115261.awb") ~= 0 then
					local var_150_27 = manager.audio:GetVoiceLength("story_v_out_115261", "115261036", "story_v_out_115261.awb") / 1000

					if var_150_27 + var_150_19 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_27 + var_150_19
					end

					if var_150_22.prefab_name ~= "" and arg_147_1.actors_[var_150_22.prefab_name] ~= nil then
						local var_150_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_22.prefab_name].transform, "story_v_out_115261", "115261036", "story_v_out_115261.awb")

						arg_147_1:RecordAudio("115261036", var_150_28)
						arg_147_1:RecordAudio("115261036", var_150_28)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_115261", "115261036", "story_v_out_115261.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_115261", "115261036", "story_v_out_115261.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_29 = math.max(var_150_20, arg_147_1.talkMaxDuration)

			if var_150_19 <= arg_147_1.time_ and arg_147_1.time_ < var_150_19 + var_150_29 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_19) / var_150_29

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_19 + var_150_29 and arg_147_1.time_ < var_150_19 + var_150_29 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play115261037 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 115261037
		arg_151_1.duration_ = 9.5

		local var_151_0 = {
			ja = 9.5,
			ko = 7,
			zh = 7.7,
			en = 8.133
		}
		local var_151_1 = manager.audio:GetLocalizationFlag()

		if var_151_0[var_151_1] ~= nil then
			arg_151_1.duration_ = var_151_0[var_151_1]
		end

		SetActive(arg_151_1.tipsGo_, false)

		function arg_151_1.onSingleLineFinish_()
			arg_151_1.onSingleLineUpdate_ = nil
			arg_151_1.onSingleLineFinish_ = nil
			arg_151_1.state_ = "waiting"
		end

		function arg_151_1.playNext_(arg_153_0)
			if arg_153_0 == 1 then
				arg_151_0:Play115261038(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["10030"]
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 and arg_151_1.var_.actorSpriteComps10030 == nil then
				arg_151_1.var_.actorSpriteComps10030 = var_154_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_154_2 = 0.2

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_2 then
				local var_154_3 = (arg_151_1.time_ - var_154_1) / var_154_2

				if arg_151_1.var_.actorSpriteComps10030 then
					for iter_154_0, iter_154_1 in pairs(arg_151_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_154_1 then
							local var_154_4 = Mathf.Lerp(iter_154_1.color.r, 0.5, var_154_3)

							iter_154_1.color = Color.New(var_154_4, var_154_4, var_154_4)
						end
					end
				end
			end

			if arg_151_1.time_ >= var_154_1 + var_154_2 and arg_151_1.time_ < var_154_1 + var_154_2 + arg_154_0 and arg_151_1.var_.actorSpriteComps10030 then
				local var_154_5 = 0.5

				for iter_154_2, iter_154_3 in pairs(arg_151_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_154_3 then
						iter_154_3.color = Color.New(var_154_5, var_154_5, var_154_5)
					end
				end

				arg_151_1.var_.actorSpriteComps10030 = nil
			end

			local var_154_6 = arg_151_1.actors_["1038"]
			local var_154_7 = 0

			if var_154_7 < arg_151_1.time_ and arg_151_1.time_ <= var_154_7 + arg_154_0 and arg_151_1.var_.actorSpriteComps1038 == nil then
				arg_151_1.var_.actorSpriteComps1038 = var_154_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_154_8 = 0.2

			if var_154_7 <= arg_151_1.time_ and arg_151_1.time_ < var_154_7 + var_154_8 then
				local var_154_9 = (arg_151_1.time_ - var_154_7) / var_154_8

				if arg_151_1.var_.actorSpriteComps1038 then
					for iter_154_4, iter_154_5 in pairs(arg_151_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_154_5 then
							local var_154_10 = Mathf.Lerp(iter_154_5.color.r, 1, var_154_9)

							iter_154_5.color = Color.New(var_154_10, var_154_10, var_154_10)
						end
					end
				end
			end

			if arg_151_1.time_ >= var_154_7 + var_154_8 and arg_151_1.time_ < var_154_7 + var_154_8 + arg_154_0 and arg_151_1.var_.actorSpriteComps1038 then
				local var_154_11 = 1

				for iter_154_6, iter_154_7 in pairs(arg_151_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_154_7 then
						iter_154_7.color = Color.New(var_154_11, var_154_11, var_154_11)
					end
				end

				arg_151_1.var_.actorSpriteComps1038 = nil
			end

			local var_154_12 = arg_151_1.actors_["1038"].transform
			local var_154_13 = 0

			if var_154_13 < arg_151_1.time_ and arg_151_1.time_ <= var_154_13 + arg_154_0 then
				arg_151_1.var_.moveOldPos1038 = var_154_12.localPosition
				var_154_12.localScale = Vector3.New(1, 1, 1)

				arg_151_1:CheckSpriteTmpPos("1038", 2)

				local var_154_14 = var_154_12.childCount

				for iter_154_8 = 0, var_154_14 - 1 do
					local var_154_15 = var_154_12:GetChild(iter_154_8)

					if var_154_15.name == "split_1" or not string.find(var_154_15.name, "split") then
						var_154_15.gameObject:SetActive(true)
					else
						var_154_15.gameObject:SetActive(false)
					end
				end
			end

			local var_154_16 = 0.001

			if var_154_13 <= arg_151_1.time_ and arg_151_1.time_ < var_154_13 + var_154_16 then
				local var_154_17 = (arg_151_1.time_ - var_154_13) / var_154_16
				local var_154_18 = Vector3.New(-390, -400, 0)

				var_154_12.localPosition = Vector3.Lerp(arg_151_1.var_.moveOldPos1038, var_154_18, var_154_17)
			end

			if arg_151_1.time_ >= var_154_13 + var_154_16 and arg_151_1.time_ < var_154_13 + var_154_16 + arg_154_0 then
				var_154_12.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_154_19 = arg_151_1.actors_["1038"]
			local var_154_20 = 0

			if var_154_20 < arg_151_1.time_ and arg_151_1.time_ <= var_154_20 + arg_154_0 then
				local var_154_21 = var_154_19:GetComponentInChildren(typeof(CanvasGroup))

				if var_154_21 then
					arg_151_1.var_.alphaOldValue1038 = var_154_21.alpha
					arg_151_1.var_.characterEffect1038 = var_154_21
				end

				arg_151_1.var_.alphaOldValue1038 = 0
			end

			local var_154_22 = 0.034

			if var_154_20 <= arg_151_1.time_ and arg_151_1.time_ < var_154_20 + var_154_22 then
				local var_154_23 = (arg_151_1.time_ - var_154_20) / var_154_22
				local var_154_24 = Mathf.Lerp(arg_151_1.var_.alphaOldValue1038, 1, var_154_23)

				if arg_151_1.var_.characterEffect1038 then
					arg_151_1.var_.characterEffect1038.alpha = var_154_24
				end
			end

			if arg_151_1.time_ >= var_154_20 + var_154_22 and arg_151_1.time_ < var_154_20 + var_154_22 + arg_154_0 and arg_151_1.var_.characterEffect1038 then
				arg_151_1.var_.characterEffect1038.alpha = 1
			end

			local var_154_25 = arg_151_1.actors_["1038"]
			local var_154_26 = 0

			if var_154_26 < arg_151_1.time_ and arg_151_1.time_ <= var_154_26 + arg_154_0 then
				local var_154_27 = var_154_25:GetComponentInChildren(typeof(CanvasGroup))

				if var_154_27 then
					arg_151_1.var_.alphaOldValue1038 = var_154_27.alpha
					arg_151_1.var_.characterEffect1038 = var_154_27
				end

				arg_151_1.var_.alphaOldValue1038 = 0
			end

			local var_154_28 = 0.5

			if var_154_26 <= arg_151_1.time_ and arg_151_1.time_ < var_154_26 + var_154_28 then
				local var_154_29 = (arg_151_1.time_ - var_154_26) / var_154_28
				local var_154_30 = Mathf.Lerp(arg_151_1.var_.alphaOldValue1038, 1, var_154_29)

				if arg_151_1.var_.characterEffect1038 then
					arg_151_1.var_.characterEffect1038.alpha = var_154_30
				end
			end

			if arg_151_1.time_ >= var_154_26 + var_154_28 and arg_151_1.time_ < var_154_26 + var_154_28 + arg_154_0 and arg_151_1.var_.characterEffect1038 then
				arg_151_1.var_.characterEffect1038.alpha = 1
			end

			local var_154_31 = 0
			local var_154_32 = 0.875

			if var_154_31 < arg_151_1.time_ and arg_151_1.time_ <= var_154_31 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_33 = arg_151_1:FormatText(StoryNameCfg[94].name)

				arg_151_1.leftNameTxt_.text = var_154_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_34 = arg_151_1:GetWordFromCfg(115261037)
				local var_154_35 = arg_151_1:FormatText(var_154_34.content)

				arg_151_1.text_.text = var_154_35

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_36 = 35
				local var_154_37 = utf8.len(var_154_35)
				local var_154_38 = var_154_36 <= 0 and var_154_32 or var_154_32 * (var_154_37 / var_154_36)

				if var_154_38 > 0 and var_154_32 < var_154_38 then
					arg_151_1.talkMaxDuration = var_154_38

					if var_154_38 + var_154_31 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_38 + var_154_31
					end
				end

				arg_151_1.text_.text = var_154_35
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261037", "story_v_out_115261.awb") ~= 0 then
					local var_154_39 = manager.audio:GetVoiceLength("story_v_out_115261", "115261037", "story_v_out_115261.awb") / 1000

					if var_154_39 + var_154_31 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_39 + var_154_31
					end

					if var_154_34.prefab_name ~= "" and arg_151_1.actors_[var_154_34.prefab_name] ~= nil then
						local var_154_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_34.prefab_name].transform, "story_v_out_115261", "115261037", "story_v_out_115261.awb")

						arg_151_1:RecordAudio("115261037", var_154_40)
						arg_151_1:RecordAudio("115261037", var_154_40)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_115261", "115261037", "story_v_out_115261.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_115261", "115261037", "story_v_out_115261.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_41 = math.max(var_154_32, arg_151_1.talkMaxDuration)

			if var_154_31 <= arg_151_1.time_ and arg_151_1.time_ < var_154_31 + var_154_41 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_31) / var_154_41

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_31 + var_154_41 and arg_151_1.time_ < var_154_31 + var_154_41 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play115261038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 115261038
		arg_155_1.duration_ = 4.4

		local var_155_0 = {
			ja = 4.4,
			ko = 2.933,
			zh = 2.366,
			en = 2.466
		}
		local var_155_1 = manager.audio:GetLocalizationFlag()

		if var_155_0[var_155_1] ~= nil then
			arg_155_1.duration_ = var_155_0[var_155_1]
		end

		SetActive(arg_155_1.tipsGo_, false)

		function arg_155_1.onSingleLineFinish_()
			arg_155_1.onSingleLineUpdate_ = nil
			arg_155_1.onSingleLineFinish_ = nil
			arg_155_1.state_ = "waiting"
		end

		function arg_155_1.playNext_(arg_157_0)
			if arg_157_0 == 1 then
				arg_155_0:Play115261039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["10030"]
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 and arg_155_1.var_.actorSpriteComps10030 == nil then
				arg_155_1.var_.actorSpriteComps10030 = var_158_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_158_2 = 0.2

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_2 then
				local var_158_3 = (arg_155_1.time_ - var_158_1) / var_158_2

				if arg_155_1.var_.actorSpriteComps10030 then
					for iter_158_0, iter_158_1 in pairs(arg_155_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_158_1 then
							local var_158_4 = Mathf.Lerp(iter_158_1.color.r, 1, var_158_3)

							iter_158_1.color = Color.New(var_158_4, var_158_4, var_158_4)
						end
					end
				end
			end

			if arg_155_1.time_ >= var_158_1 + var_158_2 and arg_155_1.time_ < var_158_1 + var_158_2 + arg_158_0 and arg_155_1.var_.actorSpriteComps10030 then
				local var_158_5 = 1

				for iter_158_2, iter_158_3 in pairs(arg_155_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_158_3 then
						iter_158_3.color = Color.New(var_158_5, var_158_5, var_158_5)
					end
				end

				arg_155_1.var_.actorSpriteComps10030 = nil
			end

			local var_158_6 = arg_155_1.actors_["1038"]
			local var_158_7 = 0

			if var_158_7 < arg_155_1.time_ and arg_155_1.time_ <= var_158_7 + arg_158_0 and arg_155_1.var_.actorSpriteComps1038 == nil then
				arg_155_1.var_.actorSpriteComps1038 = var_158_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_158_8 = 0.2

			if var_158_7 <= arg_155_1.time_ and arg_155_1.time_ < var_158_7 + var_158_8 then
				local var_158_9 = (arg_155_1.time_ - var_158_7) / var_158_8

				if arg_155_1.var_.actorSpriteComps1038 then
					for iter_158_4, iter_158_5 in pairs(arg_155_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_158_5 then
							local var_158_10 = Mathf.Lerp(iter_158_5.color.r, 0.5, var_158_9)

							iter_158_5.color = Color.New(var_158_10, var_158_10, var_158_10)
						end
					end
				end
			end

			if arg_155_1.time_ >= var_158_7 + var_158_8 and arg_155_1.time_ < var_158_7 + var_158_8 + arg_158_0 and arg_155_1.var_.actorSpriteComps1038 then
				local var_158_11 = 0.5

				for iter_158_6, iter_158_7 in pairs(arg_155_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_158_7 then
						iter_158_7.color = Color.New(var_158_11, var_158_11, var_158_11)
					end
				end

				arg_155_1.var_.actorSpriteComps1038 = nil
			end

			local var_158_12 = 0
			local var_158_13 = 0.175

			if var_158_12 < arg_155_1.time_ and arg_155_1.time_ <= var_158_12 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_14 = arg_155_1:FormatText(StoryNameCfg[309].name)

				arg_155_1.leftNameTxt_.text = var_158_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_15 = arg_155_1:GetWordFromCfg(115261038)
				local var_158_16 = arg_155_1:FormatText(var_158_15.content)

				arg_155_1.text_.text = var_158_16

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_17 = 7
				local var_158_18 = utf8.len(var_158_16)
				local var_158_19 = var_158_17 <= 0 and var_158_13 or var_158_13 * (var_158_18 / var_158_17)

				if var_158_19 > 0 and var_158_13 < var_158_19 then
					arg_155_1.talkMaxDuration = var_158_19

					if var_158_19 + var_158_12 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_19 + var_158_12
					end
				end

				arg_155_1.text_.text = var_158_16
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261038", "story_v_out_115261.awb") ~= 0 then
					local var_158_20 = manager.audio:GetVoiceLength("story_v_out_115261", "115261038", "story_v_out_115261.awb") / 1000

					if var_158_20 + var_158_12 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_20 + var_158_12
					end

					if var_158_15.prefab_name ~= "" and arg_155_1.actors_[var_158_15.prefab_name] ~= nil then
						local var_158_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_15.prefab_name].transform, "story_v_out_115261", "115261038", "story_v_out_115261.awb")

						arg_155_1:RecordAudio("115261038", var_158_21)
						arg_155_1:RecordAudio("115261038", var_158_21)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_115261", "115261038", "story_v_out_115261.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_115261", "115261038", "story_v_out_115261.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_22 = math.max(var_158_13, arg_155_1.talkMaxDuration)

			if var_158_12 <= arg_155_1.time_ and arg_155_1.time_ < var_158_12 + var_158_22 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_12) / var_158_22

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_12 + var_158_22 and arg_155_1.time_ < var_158_12 + var_158_22 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play115261039 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 115261039
		arg_159_1.duration_ = 9.466

		local var_159_0 = {
			ja = 9.466,
			ko = 7.9,
			zh = 6.033,
			en = 8.766
		}
		local var_159_1 = manager.audio:GetLocalizationFlag()

		if var_159_0[var_159_1] ~= nil then
			arg_159_1.duration_ = var_159_0[var_159_1]
		end

		SetActive(arg_159_1.tipsGo_, false)

		function arg_159_1.onSingleLineFinish_()
			arg_159_1.onSingleLineUpdate_ = nil
			arg_159_1.onSingleLineFinish_ = nil
			arg_159_1.state_ = "waiting"
		end

		function arg_159_1.playNext_(arg_161_0)
			if arg_161_0 == 1 then
				arg_159_0:Play115261040(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0
			local var_162_1 = 0.725

			if var_162_0 < arg_159_1.time_ and arg_159_1.time_ <= var_162_0 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_2 = arg_159_1:FormatText(StoryNameCfg[309].name)

				arg_159_1.leftNameTxt_.text = var_162_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_3 = arg_159_1:GetWordFromCfg(115261039)
				local var_162_4 = arg_159_1:FormatText(var_162_3.content)

				arg_159_1.text_.text = var_162_4

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_5 = 29
				local var_162_6 = utf8.len(var_162_4)
				local var_162_7 = var_162_5 <= 0 and var_162_1 or var_162_1 * (var_162_6 / var_162_5)

				if var_162_7 > 0 and var_162_1 < var_162_7 then
					arg_159_1.talkMaxDuration = var_162_7

					if var_162_7 + var_162_0 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_7 + var_162_0
					end
				end

				arg_159_1.text_.text = var_162_4
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261039", "story_v_out_115261.awb") ~= 0 then
					local var_162_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261039", "story_v_out_115261.awb") / 1000

					if var_162_8 + var_162_0 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_8 + var_162_0
					end

					if var_162_3.prefab_name ~= "" and arg_159_1.actors_[var_162_3.prefab_name] ~= nil then
						local var_162_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_3.prefab_name].transform, "story_v_out_115261", "115261039", "story_v_out_115261.awb")

						arg_159_1:RecordAudio("115261039", var_162_9)
						arg_159_1:RecordAudio("115261039", var_162_9)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_115261", "115261039", "story_v_out_115261.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_115261", "115261039", "story_v_out_115261.awb")
				end

				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_10 = math.max(var_162_1, arg_159_1.talkMaxDuration)

			if var_162_0 <= arg_159_1.time_ and arg_159_1.time_ < var_162_0 + var_162_10 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_0) / var_162_10

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_0 + var_162_10 and arg_159_1.time_ < var_162_0 + var_162_10 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play115261040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 115261040
		arg_163_1.duration_ = 15.933

		local var_163_0 = {
			ja = 15.933,
			ko = 11.033,
			zh = 9.5,
			en = 10.5
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
				arg_163_0:Play115261041(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = 0
			local var_166_1 = 1

			if var_166_0 < arg_163_1.time_ and arg_163_1.time_ <= var_166_0 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_2 = arg_163_1:FormatText(StoryNameCfg[309].name)

				arg_163_1.leftNameTxt_.text = var_166_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_3 = arg_163_1:GetWordFromCfg(115261040)
				local var_166_4 = arg_163_1:FormatText(var_166_3.content)

				arg_163_1.text_.text = var_166_4

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_5 = 40
				local var_166_6 = utf8.len(var_166_4)
				local var_166_7 = var_166_5 <= 0 and var_166_1 or var_166_1 * (var_166_6 / var_166_5)

				if var_166_7 > 0 and var_166_1 < var_166_7 then
					arg_163_1.talkMaxDuration = var_166_7

					if var_166_7 + var_166_0 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_7 + var_166_0
					end
				end

				arg_163_1.text_.text = var_166_4
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261040", "story_v_out_115261.awb") ~= 0 then
					local var_166_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261040", "story_v_out_115261.awb") / 1000

					if var_166_8 + var_166_0 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_8 + var_166_0
					end

					if var_166_3.prefab_name ~= "" and arg_163_1.actors_[var_166_3.prefab_name] ~= nil then
						local var_166_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_3.prefab_name].transform, "story_v_out_115261", "115261040", "story_v_out_115261.awb")

						arg_163_1:RecordAudio("115261040", var_166_9)
						arg_163_1:RecordAudio("115261040", var_166_9)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_115261", "115261040", "story_v_out_115261.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_115261", "115261040", "story_v_out_115261.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_10 = math.max(var_166_1, arg_163_1.talkMaxDuration)

			if var_166_0 <= arg_163_1.time_ and arg_163_1.time_ < var_166_0 + var_166_10 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_0) / var_166_10

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_0 + var_166_10 and arg_163_1.time_ < var_166_0 + var_166_10 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play115261041 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 115261041
		arg_167_1.duration_ = 6.1

		local var_167_0 = {
			ja = 4.133,
			ko = 3.633,
			zh = 3.833,
			en = 6.1
		}
		local var_167_1 = manager.audio:GetLocalizationFlag()

		if var_167_0[var_167_1] ~= nil then
			arg_167_1.duration_ = var_167_0[var_167_1]
		end

		SetActive(arg_167_1.tipsGo_, false)

		function arg_167_1.onSingleLineFinish_()
			arg_167_1.onSingleLineUpdate_ = nil
			arg_167_1.onSingleLineFinish_ = nil
			arg_167_1.state_ = "waiting"
		end

		function arg_167_1.playNext_(arg_169_0)
			if arg_169_0 == 1 then
				arg_167_0:Play115261042(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["10030"]
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 and arg_167_1.var_.actorSpriteComps10030 == nil then
				arg_167_1.var_.actorSpriteComps10030 = var_170_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_170_2 = 0.2

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_2 then
				local var_170_3 = (arg_167_1.time_ - var_170_1) / var_170_2

				if arg_167_1.var_.actorSpriteComps10030 then
					for iter_170_0, iter_170_1 in pairs(arg_167_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_170_1 then
							local var_170_4 = Mathf.Lerp(iter_170_1.color.r, 0.5, var_170_3)

							iter_170_1.color = Color.New(var_170_4, var_170_4, var_170_4)
						end
					end
				end
			end

			if arg_167_1.time_ >= var_170_1 + var_170_2 and arg_167_1.time_ < var_170_1 + var_170_2 + arg_170_0 and arg_167_1.var_.actorSpriteComps10030 then
				local var_170_5 = 0.5

				for iter_170_2, iter_170_3 in pairs(arg_167_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_170_3 then
						iter_170_3.color = Color.New(var_170_5, var_170_5, var_170_5)
					end
				end

				arg_167_1.var_.actorSpriteComps10030 = nil
			end

			local var_170_6 = arg_167_1.actors_["1038"]
			local var_170_7 = 0

			if var_170_7 < arg_167_1.time_ and arg_167_1.time_ <= var_170_7 + arg_170_0 and arg_167_1.var_.actorSpriteComps1038 == nil then
				arg_167_1.var_.actorSpriteComps1038 = var_170_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_170_8 = 0.2

			if var_170_7 <= arg_167_1.time_ and arg_167_1.time_ < var_170_7 + var_170_8 then
				local var_170_9 = (arg_167_1.time_ - var_170_7) / var_170_8

				if arg_167_1.var_.actorSpriteComps1038 then
					for iter_170_4, iter_170_5 in pairs(arg_167_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_170_5 then
							local var_170_10 = Mathf.Lerp(iter_170_5.color.r, 1, var_170_9)

							iter_170_5.color = Color.New(var_170_10, var_170_10, var_170_10)
						end
					end
				end
			end

			if arg_167_1.time_ >= var_170_7 + var_170_8 and arg_167_1.time_ < var_170_7 + var_170_8 + arg_170_0 and arg_167_1.var_.actorSpriteComps1038 then
				local var_170_11 = 1

				for iter_170_6, iter_170_7 in pairs(arg_167_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_170_7 then
						iter_170_7.color = Color.New(var_170_11, var_170_11, var_170_11)
					end
				end

				arg_167_1.var_.actorSpriteComps1038 = nil
			end

			local var_170_12 = 0
			local var_170_13 = 0.325

			if var_170_12 < arg_167_1.time_ and arg_167_1.time_ <= var_170_12 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_14 = arg_167_1:FormatText(StoryNameCfg[94].name)

				arg_167_1.leftNameTxt_.text = var_170_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_15 = arg_167_1:GetWordFromCfg(115261041)
				local var_170_16 = arg_167_1:FormatText(var_170_15.content)

				arg_167_1.text_.text = var_170_16

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_17 = 13
				local var_170_18 = utf8.len(var_170_16)
				local var_170_19 = var_170_17 <= 0 and var_170_13 or var_170_13 * (var_170_18 / var_170_17)

				if var_170_19 > 0 and var_170_13 < var_170_19 then
					arg_167_1.talkMaxDuration = var_170_19

					if var_170_19 + var_170_12 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_19 + var_170_12
					end
				end

				arg_167_1.text_.text = var_170_16
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261041", "story_v_out_115261.awb") ~= 0 then
					local var_170_20 = manager.audio:GetVoiceLength("story_v_out_115261", "115261041", "story_v_out_115261.awb") / 1000

					if var_170_20 + var_170_12 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_20 + var_170_12
					end

					if var_170_15.prefab_name ~= "" and arg_167_1.actors_[var_170_15.prefab_name] ~= nil then
						local var_170_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_15.prefab_name].transform, "story_v_out_115261", "115261041", "story_v_out_115261.awb")

						arg_167_1:RecordAudio("115261041", var_170_21)
						arg_167_1:RecordAudio("115261041", var_170_21)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_115261", "115261041", "story_v_out_115261.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_115261", "115261041", "story_v_out_115261.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_22 = math.max(var_170_13, arg_167_1.talkMaxDuration)

			if var_170_12 <= arg_167_1.time_ and arg_167_1.time_ < var_170_12 + var_170_22 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_12) / var_170_22

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_12 + var_170_22 and arg_167_1.time_ < var_170_12 + var_170_22 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play115261042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 115261042
		arg_171_1.duration_ = 12.3

		local var_171_0 = {
			ja = 12.3,
			ko = 10.366,
			zh = 8.2,
			en = 10.2
		}
		local var_171_1 = manager.audio:GetLocalizationFlag()

		if var_171_0[var_171_1] ~= nil then
			arg_171_1.duration_ = var_171_0[var_171_1]
		end

		SetActive(arg_171_1.tipsGo_, false)

		function arg_171_1.onSingleLineFinish_()
			arg_171_1.onSingleLineUpdate_ = nil
			arg_171_1.onSingleLineFinish_ = nil
			arg_171_1.state_ = "waiting"
		end

		function arg_171_1.playNext_(arg_173_0)
			if arg_173_0 == 1 then
				arg_171_0:Play115261043(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["10030"]
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 and arg_171_1.var_.actorSpriteComps10030 == nil then
				arg_171_1.var_.actorSpriteComps10030 = var_174_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_174_2 = 0.2

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_2 then
				local var_174_3 = (arg_171_1.time_ - var_174_1) / var_174_2

				if arg_171_1.var_.actorSpriteComps10030 then
					for iter_174_0, iter_174_1 in pairs(arg_171_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_174_1 then
							local var_174_4 = Mathf.Lerp(iter_174_1.color.r, 1, var_174_3)

							iter_174_1.color = Color.New(var_174_4, var_174_4, var_174_4)
						end
					end
				end
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 and arg_171_1.var_.actorSpriteComps10030 then
				local var_174_5 = 1

				for iter_174_2, iter_174_3 in pairs(arg_171_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_174_3 then
						iter_174_3.color = Color.New(var_174_5, var_174_5, var_174_5)
					end
				end

				arg_171_1.var_.actorSpriteComps10030 = nil
			end

			local var_174_6 = arg_171_1.actors_["1038"]
			local var_174_7 = 0

			if var_174_7 < arg_171_1.time_ and arg_171_1.time_ <= var_174_7 + arg_174_0 and arg_171_1.var_.actorSpriteComps1038 == nil then
				arg_171_1.var_.actorSpriteComps1038 = var_174_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_174_8 = 0.2

			if var_174_7 <= arg_171_1.time_ and arg_171_1.time_ < var_174_7 + var_174_8 then
				local var_174_9 = (arg_171_1.time_ - var_174_7) / var_174_8

				if arg_171_1.var_.actorSpriteComps1038 then
					for iter_174_4, iter_174_5 in pairs(arg_171_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_174_5 then
							local var_174_10 = Mathf.Lerp(iter_174_5.color.r, 0.5, var_174_9)

							iter_174_5.color = Color.New(var_174_10, var_174_10, var_174_10)
						end
					end
				end
			end

			if arg_171_1.time_ >= var_174_7 + var_174_8 and arg_171_1.time_ < var_174_7 + var_174_8 + arg_174_0 and arg_171_1.var_.actorSpriteComps1038 then
				local var_174_11 = 0.5

				for iter_174_6, iter_174_7 in pairs(arg_171_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_174_7 then
						iter_174_7.color = Color.New(var_174_11, var_174_11, var_174_11)
					end
				end

				arg_171_1.var_.actorSpriteComps1038 = nil
			end

			local var_174_12 = 0
			local var_174_13 = 0.95

			if var_174_12 < arg_171_1.time_ and arg_171_1.time_ <= var_174_12 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_14 = arg_171_1:FormatText(StoryNameCfg[309].name)

				arg_171_1.leftNameTxt_.text = var_174_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_15 = arg_171_1:GetWordFromCfg(115261042)
				local var_174_16 = arg_171_1:FormatText(var_174_15.content)

				arg_171_1.text_.text = var_174_16

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_17 = 38
				local var_174_18 = utf8.len(var_174_16)
				local var_174_19 = var_174_17 <= 0 and var_174_13 or var_174_13 * (var_174_18 / var_174_17)

				if var_174_19 > 0 and var_174_13 < var_174_19 then
					arg_171_1.talkMaxDuration = var_174_19

					if var_174_19 + var_174_12 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_19 + var_174_12
					end
				end

				arg_171_1.text_.text = var_174_16
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261042", "story_v_out_115261.awb") ~= 0 then
					local var_174_20 = manager.audio:GetVoiceLength("story_v_out_115261", "115261042", "story_v_out_115261.awb") / 1000

					if var_174_20 + var_174_12 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_20 + var_174_12
					end

					if var_174_15.prefab_name ~= "" and arg_171_1.actors_[var_174_15.prefab_name] ~= nil then
						local var_174_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_15.prefab_name].transform, "story_v_out_115261", "115261042", "story_v_out_115261.awb")

						arg_171_1:RecordAudio("115261042", var_174_21)
						arg_171_1:RecordAudio("115261042", var_174_21)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_115261", "115261042", "story_v_out_115261.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_115261", "115261042", "story_v_out_115261.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_22 = math.max(var_174_13, arg_171_1.talkMaxDuration)

			if var_174_12 <= arg_171_1.time_ and arg_171_1.time_ < var_174_12 + var_174_22 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_12) / var_174_22

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_12 + var_174_22 and arg_171_1.time_ < var_174_12 + var_174_22 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play115261043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 115261043
		arg_175_1.duration_ = 12

		local var_175_0 = {
			ja = 7.866,
			ko = 10.7,
			zh = 9.7,
			en = 12
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
				arg_175_0:Play115261044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["10030"]
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 and arg_175_1.var_.actorSpriteComps10030 == nil then
				arg_175_1.var_.actorSpriteComps10030 = var_178_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_178_2 = 0.2

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2

				if arg_175_1.var_.actorSpriteComps10030 then
					for iter_178_0, iter_178_1 in pairs(arg_175_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_178_1 then
							local var_178_4 = Mathf.Lerp(iter_178_1.color.r, 0.5, var_178_3)

							iter_178_1.color = Color.New(var_178_4, var_178_4, var_178_4)
						end
					end
				end
			end

			if arg_175_1.time_ >= var_178_1 + var_178_2 and arg_175_1.time_ < var_178_1 + var_178_2 + arg_178_0 and arg_175_1.var_.actorSpriteComps10030 then
				local var_178_5 = 0.5

				for iter_178_2, iter_178_3 in pairs(arg_175_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_178_3 then
						iter_178_3.color = Color.New(var_178_5, var_178_5, var_178_5)
					end
				end

				arg_175_1.var_.actorSpriteComps10030 = nil
			end

			local var_178_6 = arg_175_1.actors_["1038"]
			local var_178_7 = 0

			if var_178_7 < arg_175_1.time_ and arg_175_1.time_ <= var_178_7 + arg_178_0 and arg_175_1.var_.actorSpriteComps1038 == nil then
				arg_175_1.var_.actorSpriteComps1038 = var_178_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_178_8 = 0.2

			if var_178_7 <= arg_175_1.time_ and arg_175_1.time_ < var_178_7 + var_178_8 then
				local var_178_9 = (arg_175_1.time_ - var_178_7) / var_178_8

				if arg_175_1.var_.actorSpriteComps1038 then
					for iter_178_4, iter_178_5 in pairs(arg_175_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_178_5 then
							local var_178_10 = Mathf.Lerp(iter_178_5.color.r, 1, var_178_9)

							iter_178_5.color = Color.New(var_178_10, var_178_10, var_178_10)
						end
					end
				end
			end

			if arg_175_1.time_ >= var_178_7 + var_178_8 and arg_175_1.time_ < var_178_7 + var_178_8 + arg_178_0 and arg_175_1.var_.actorSpriteComps1038 then
				local var_178_11 = 1

				for iter_178_6, iter_178_7 in pairs(arg_175_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_178_7 then
						iter_178_7.color = Color.New(var_178_11, var_178_11, var_178_11)
					end
				end

				arg_175_1.var_.actorSpriteComps1038 = nil
			end

			local var_178_12 = 0
			local var_178_13 = 0.875

			if var_178_12 < arg_175_1.time_ and arg_175_1.time_ <= var_178_12 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_14 = arg_175_1:FormatText(StoryNameCfg[94].name)

				arg_175_1.leftNameTxt_.text = var_178_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_15 = arg_175_1:GetWordFromCfg(115261043)
				local var_178_16 = arg_175_1:FormatText(var_178_15.content)

				arg_175_1.text_.text = var_178_16

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_17 = 35
				local var_178_18 = utf8.len(var_178_16)
				local var_178_19 = var_178_17 <= 0 and var_178_13 or var_178_13 * (var_178_18 / var_178_17)

				if var_178_19 > 0 and var_178_13 < var_178_19 then
					arg_175_1.talkMaxDuration = var_178_19

					if var_178_19 + var_178_12 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_19 + var_178_12
					end
				end

				arg_175_1.text_.text = var_178_16
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261043", "story_v_out_115261.awb") ~= 0 then
					local var_178_20 = manager.audio:GetVoiceLength("story_v_out_115261", "115261043", "story_v_out_115261.awb") / 1000

					if var_178_20 + var_178_12 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_20 + var_178_12
					end

					if var_178_15.prefab_name ~= "" and arg_175_1.actors_[var_178_15.prefab_name] ~= nil then
						local var_178_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_15.prefab_name].transform, "story_v_out_115261", "115261043", "story_v_out_115261.awb")

						arg_175_1:RecordAudio("115261043", var_178_21)
						arg_175_1:RecordAudio("115261043", var_178_21)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_115261", "115261043", "story_v_out_115261.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_115261", "115261043", "story_v_out_115261.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_22 = math.max(var_178_13, arg_175_1.talkMaxDuration)

			if var_178_12 <= arg_175_1.time_ and arg_175_1.time_ < var_178_12 + var_178_22 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_12) / var_178_22

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_12 + var_178_22 and arg_175_1.time_ < var_178_12 + var_178_22 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play115261044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 115261044
		arg_179_1.duration_ = 5

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play115261045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["10030"].transform
			local var_182_1 = 0.5

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 then
				arg_179_1.var_.moveOldPos10030 = var_182_0.localPosition
				var_182_0.localScale = Vector3.New(1, 1, 1)

				arg_179_1:CheckSpriteTmpPos("10030", 0)

				local var_182_2 = var_182_0.childCount

				for iter_182_0 = 0, var_182_2 - 1 do
					local var_182_3 = var_182_0:GetChild(iter_182_0)

					if var_182_3.name == "split_3" or not string.find(var_182_3.name, "split") then
						var_182_3.gameObject:SetActive(true)
					else
						var_182_3.gameObject:SetActive(false)
					end
				end
			end

			local var_182_4 = 0.001

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_4 then
				local var_182_5 = (arg_179_1.time_ - var_182_1) / var_182_4
				local var_182_6 = Vector3.New(-2000, -390, 150)

				var_182_0.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos10030, var_182_6, var_182_5)
			end

			if arg_179_1.time_ >= var_182_1 + var_182_4 and arg_179_1.time_ < var_182_1 + var_182_4 + arg_182_0 then
				var_182_0.localPosition = Vector3.New(-2000, -390, 150)
			end

			local var_182_7 = arg_179_1.actors_["1038"].transform
			local var_182_8 = 0.5

			if var_182_8 < arg_179_1.time_ and arg_179_1.time_ <= var_182_8 + arg_182_0 then
				arg_179_1.var_.moveOldPos1038 = var_182_7.localPosition
				var_182_7.localScale = Vector3.New(1, 1, 1)

				arg_179_1:CheckSpriteTmpPos("1038", 0)

				local var_182_9 = var_182_7.childCount

				for iter_182_1 = 0, var_182_9 - 1 do
					local var_182_10 = var_182_7:GetChild(iter_182_1)

					if var_182_10.name == "split_1" or not string.find(var_182_10.name, "split") then
						var_182_10.gameObject:SetActive(true)
					else
						var_182_10.gameObject:SetActive(false)
					end
				end
			end

			local var_182_11 = 0.001

			if var_182_8 <= arg_179_1.time_ and arg_179_1.time_ < var_182_8 + var_182_11 then
				local var_182_12 = (arg_179_1.time_ - var_182_8) / var_182_11
				local var_182_13 = Vector3.New(-2000, -400, 0)

				var_182_7.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1038, var_182_13, var_182_12)
			end

			if arg_179_1.time_ >= var_182_8 + var_182_11 and arg_179_1.time_ < var_182_8 + var_182_11 + arg_182_0 then
				var_182_7.localPosition = Vector3.New(-2000, -400, 0)
			end

			local var_182_14 = arg_179_1.actors_["10030"]
			local var_182_15 = 0

			if var_182_15 < arg_179_1.time_ and arg_179_1.time_ <= var_182_15 + arg_182_0 then
				local var_182_16 = var_182_14:GetComponentInChildren(typeof(CanvasGroup))

				if var_182_16 then
					arg_179_1.var_.alphaOldValue10030 = var_182_16.alpha
					arg_179_1.var_.characterEffect10030 = var_182_16
				end

				arg_179_1.var_.alphaOldValue10030 = 1
			end

			local var_182_17 = 0.5

			if var_182_15 <= arg_179_1.time_ and arg_179_1.time_ < var_182_15 + var_182_17 then
				local var_182_18 = (arg_179_1.time_ - var_182_15) / var_182_17
				local var_182_19 = Mathf.Lerp(arg_179_1.var_.alphaOldValue10030, 0, var_182_18)

				if arg_179_1.var_.characterEffect10030 then
					arg_179_1.var_.characterEffect10030.alpha = var_182_19
				end
			end

			if arg_179_1.time_ >= var_182_15 + var_182_17 and arg_179_1.time_ < var_182_15 + var_182_17 + arg_182_0 and arg_179_1.var_.characterEffect10030 then
				arg_179_1.var_.characterEffect10030.alpha = 0
			end

			local var_182_20 = arg_179_1.actors_["1038"]
			local var_182_21 = 0

			if var_182_21 < arg_179_1.time_ and arg_179_1.time_ <= var_182_21 + arg_182_0 then
				local var_182_22 = var_182_20:GetComponentInChildren(typeof(CanvasGroup))

				if var_182_22 then
					arg_179_1.var_.alphaOldValue1038 = var_182_22.alpha
					arg_179_1.var_.characterEffect1038 = var_182_22
				end

				arg_179_1.var_.alphaOldValue1038 = 1
			end

			local var_182_23 = 0.5

			if var_182_21 <= arg_179_1.time_ and arg_179_1.time_ < var_182_21 + var_182_23 then
				local var_182_24 = (arg_179_1.time_ - var_182_21) / var_182_23
				local var_182_25 = Mathf.Lerp(arg_179_1.var_.alphaOldValue1038, 0, var_182_24)

				if arg_179_1.var_.characterEffect1038 then
					arg_179_1.var_.characterEffect1038.alpha = var_182_25
				end
			end

			if arg_179_1.time_ >= var_182_21 + var_182_23 and arg_179_1.time_ < var_182_21 + var_182_23 + arg_182_0 and arg_179_1.var_.characterEffect1038 then
				arg_179_1.var_.characterEffect1038.alpha = 0
			end

			local var_182_26 = 0
			local var_182_27 = 1.175

			if var_182_26 < arg_179_1.time_ and arg_179_1.time_ <= var_182_26 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, false)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_28 = arg_179_1:GetWordFromCfg(115261044)
				local var_182_29 = arg_179_1:FormatText(var_182_28.content)

				arg_179_1.text_.text = var_182_29

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_30 = 47
				local var_182_31 = utf8.len(var_182_29)
				local var_182_32 = var_182_30 <= 0 and var_182_27 or var_182_27 * (var_182_31 / var_182_30)

				if var_182_32 > 0 and var_182_27 < var_182_32 then
					arg_179_1.talkMaxDuration = var_182_32

					if var_182_32 + var_182_26 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_32 + var_182_26
					end
				end

				arg_179_1.text_.text = var_182_29
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)
				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_33 = math.max(var_182_27, arg_179_1.talkMaxDuration)

			if var_182_26 <= arg_179_1.time_ and arg_179_1.time_ < var_182_26 + var_182_33 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_26) / var_182_33

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_26 + var_182_33 and arg_179_1.time_ < var_182_26 + var_182_33 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play115261045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 115261045
		arg_183_1.duration_ = 5

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play115261046(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = 0
			local var_186_1 = 1.225

			if var_186_0 < arg_183_1.time_ and arg_183_1.time_ <= var_186_0 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, false)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_2 = arg_183_1:GetWordFromCfg(115261045)
				local var_186_3 = arg_183_1:FormatText(var_186_2.content)

				arg_183_1.text_.text = var_186_3

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_4 = 49
				local var_186_5 = utf8.len(var_186_3)
				local var_186_6 = var_186_4 <= 0 and var_186_1 or var_186_1 * (var_186_5 / var_186_4)

				if var_186_6 > 0 and var_186_1 < var_186_6 then
					arg_183_1.talkMaxDuration = var_186_6

					if var_186_6 + var_186_0 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_6 + var_186_0
					end
				end

				arg_183_1.text_.text = var_186_3
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)
				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_7 = math.max(var_186_1, arg_183_1.talkMaxDuration)

			if var_186_0 <= arg_183_1.time_ and arg_183_1.time_ < var_186_0 + var_186_7 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_0) / var_186_7

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_0 + var_186_7 and arg_183_1.time_ < var_186_0 + var_186_7 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play115261046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 115261046
		arg_187_1.duration_ = 6.866

		local var_187_0 = {
			ja = 4.533,
			ko = 6.2,
			zh = 5.166,
			en = 6.866
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
				arg_187_0:Play115261047(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["10030"].transform
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 then
				arg_187_1.var_.moveOldPos10030 = var_190_0.localPosition
				var_190_0.localScale = Vector3.New(1, 1, 1)

				arg_187_1:CheckSpriteTmpPos("10030", 4)

				local var_190_2 = var_190_0.childCount

				for iter_190_0 = 0, var_190_2 - 1 do
					local var_190_3 = var_190_0:GetChild(iter_190_0)

					if var_190_3.name == "split_3" or not string.find(var_190_3.name, "split") then
						var_190_3.gameObject:SetActive(true)
					else
						var_190_3.gameObject:SetActive(false)
					end
				end
			end

			local var_190_4 = 0.001

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_4 then
				local var_190_5 = (arg_187_1.time_ - var_190_1) / var_190_4
				local var_190_6 = Vector3.New(390, -390, 150)

				var_190_0.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos10030, var_190_6, var_190_5)
			end

			if arg_187_1.time_ >= var_190_1 + var_190_4 and arg_187_1.time_ < var_190_1 + var_190_4 + arg_190_0 then
				var_190_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_190_7 = arg_187_1.actors_["10030"]
			local var_190_8 = 0

			if var_190_8 < arg_187_1.time_ and arg_187_1.time_ <= var_190_8 + arg_190_0 and arg_187_1.var_.actorSpriteComps10030 == nil then
				arg_187_1.var_.actorSpriteComps10030 = var_190_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_190_9 = 0.2

			if var_190_8 <= arg_187_1.time_ and arg_187_1.time_ < var_190_8 + var_190_9 then
				local var_190_10 = (arg_187_1.time_ - var_190_8) / var_190_9

				if arg_187_1.var_.actorSpriteComps10030 then
					for iter_190_1, iter_190_2 in pairs(arg_187_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_190_2 then
							local var_190_11 = Mathf.Lerp(iter_190_2.color.r, 1, var_190_10)

							iter_190_2.color = Color.New(var_190_11, var_190_11, var_190_11)
						end
					end
				end
			end

			if arg_187_1.time_ >= var_190_8 + var_190_9 and arg_187_1.time_ < var_190_8 + var_190_9 + arg_190_0 and arg_187_1.var_.actorSpriteComps10030 then
				local var_190_12 = 1

				for iter_190_3, iter_190_4 in pairs(arg_187_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_190_4 then
						iter_190_4.color = Color.New(var_190_12, var_190_12, var_190_12)
					end
				end

				arg_187_1.var_.actorSpriteComps10030 = nil
			end

			local var_190_13 = arg_187_1.actors_["10030"]
			local var_190_14 = 0

			if var_190_14 < arg_187_1.time_ and arg_187_1.time_ <= var_190_14 + arg_190_0 then
				local var_190_15 = var_190_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_190_15 then
					arg_187_1.var_.alphaOldValue10030 = var_190_15.alpha
					arg_187_1.var_.characterEffect10030 = var_190_15
				end

				arg_187_1.var_.alphaOldValue10030 = 0
			end

			local var_190_16 = 0.5

			if var_190_14 <= arg_187_1.time_ and arg_187_1.time_ < var_190_14 + var_190_16 then
				local var_190_17 = (arg_187_1.time_ - var_190_14) / var_190_16
				local var_190_18 = Mathf.Lerp(arg_187_1.var_.alphaOldValue10030, 1, var_190_17)

				if arg_187_1.var_.characterEffect10030 then
					arg_187_1.var_.characterEffect10030.alpha = var_190_18
				end
			end

			if arg_187_1.time_ >= var_190_14 + var_190_16 and arg_187_1.time_ < var_190_14 + var_190_16 + arg_190_0 and arg_187_1.var_.characterEffect10030 then
				arg_187_1.var_.characterEffect10030.alpha = 1
			end

			local var_190_19 = 0
			local var_190_20 = 0.65

			if var_190_19 < arg_187_1.time_ and arg_187_1.time_ <= var_190_19 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_21 = arg_187_1:FormatText(StoryNameCfg[309].name)

				arg_187_1.leftNameTxt_.text = var_190_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_22 = arg_187_1:GetWordFromCfg(115261046)
				local var_190_23 = arg_187_1:FormatText(var_190_22.content)

				arg_187_1.text_.text = var_190_23

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_24 = 26
				local var_190_25 = utf8.len(var_190_23)
				local var_190_26 = var_190_24 <= 0 and var_190_20 or var_190_20 * (var_190_25 / var_190_24)

				if var_190_26 > 0 and var_190_20 < var_190_26 then
					arg_187_1.talkMaxDuration = var_190_26

					if var_190_26 + var_190_19 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_26 + var_190_19
					end
				end

				arg_187_1.text_.text = var_190_23
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261046", "story_v_out_115261.awb") ~= 0 then
					local var_190_27 = manager.audio:GetVoiceLength("story_v_out_115261", "115261046", "story_v_out_115261.awb") / 1000

					if var_190_27 + var_190_19 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_27 + var_190_19
					end

					if var_190_22.prefab_name ~= "" and arg_187_1.actors_[var_190_22.prefab_name] ~= nil then
						local var_190_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_22.prefab_name].transform, "story_v_out_115261", "115261046", "story_v_out_115261.awb")

						arg_187_1:RecordAudio("115261046", var_190_28)
						arg_187_1:RecordAudio("115261046", var_190_28)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_115261", "115261046", "story_v_out_115261.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_115261", "115261046", "story_v_out_115261.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_29 = math.max(var_190_20, arg_187_1.talkMaxDuration)

			if var_190_19 <= arg_187_1.time_ and arg_187_1.time_ < var_190_19 + var_190_29 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_19) / var_190_29

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_19 + var_190_29 and arg_187_1.time_ < var_190_19 + var_190_29 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play115261047 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 115261047
		arg_191_1.duration_ = 13

		local var_191_0 = {
			ja = 12.933,
			ko = 11.533,
			zh = 13,
			en = 12.933
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
				arg_191_0:Play115261048(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["10030"]
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 and arg_191_1.var_.actorSpriteComps10030 == nil then
				arg_191_1.var_.actorSpriteComps10030 = var_194_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_194_2 = 0.2

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2

				if arg_191_1.var_.actorSpriteComps10030 then
					for iter_194_0, iter_194_1 in pairs(arg_191_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_194_1 then
							local var_194_4 = Mathf.Lerp(iter_194_1.color.r, 0.5, var_194_3)

							iter_194_1.color = Color.New(var_194_4, var_194_4, var_194_4)
						end
					end
				end
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 and arg_191_1.var_.actorSpriteComps10030 then
				local var_194_5 = 0.5

				for iter_194_2, iter_194_3 in pairs(arg_191_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_194_3 then
						iter_194_3.color = Color.New(var_194_5, var_194_5, var_194_5)
					end
				end

				arg_191_1.var_.actorSpriteComps10030 = nil
			end

			local var_194_6 = arg_191_1.actors_["1038"].transform
			local var_194_7 = 0

			if var_194_7 < arg_191_1.time_ and arg_191_1.time_ <= var_194_7 + arg_194_0 then
				arg_191_1.var_.moveOldPos1038 = var_194_6.localPosition
				var_194_6.localScale = Vector3.New(1, 1, 1)

				arg_191_1:CheckSpriteTmpPos("1038", 2)

				local var_194_8 = var_194_6.childCount

				for iter_194_4 = 0, var_194_8 - 1 do
					local var_194_9 = var_194_6:GetChild(iter_194_4)

					if var_194_9.name == "split_1" or not string.find(var_194_9.name, "split") then
						var_194_9.gameObject:SetActive(true)
					else
						var_194_9.gameObject:SetActive(false)
					end
				end
			end

			local var_194_10 = 0.001

			if var_194_7 <= arg_191_1.time_ and arg_191_1.time_ < var_194_7 + var_194_10 then
				local var_194_11 = (arg_191_1.time_ - var_194_7) / var_194_10
				local var_194_12 = Vector3.New(-390, -400, 0)

				var_194_6.localPosition = Vector3.Lerp(arg_191_1.var_.moveOldPos1038, var_194_12, var_194_11)
			end

			if arg_191_1.time_ >= var_194_7 + var_194_10 and arg_191_1.time_ < var_194_7 + var_194_10 + arg_194_0 then
				var_194_6.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_194_13 = arg_191_1.actors_["1038"]
			local var_194_14 = 0

			if var_194_14 < arg_191_1.time_ and arg_191_1.time_ <= var_194_14 + arg_194_0 and arg_191_1.var_.actorSpriteComps1038 == nil then
				arg_191_1.var_.actorSpriteComps1038 = var_194_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_194_15 = 0.2

			if var_194_14 <= arg_191_1.time_ and arg_191_1.time_ < var_194_14 + var_194_15 then
				local var_194_16 = (arg_191_1.time_ - var_194_14) / var_194_15

				if arg_191_1.var_.actorSpriteComps1038 then
					for iter_194_5, iter_194_6 in pairs(arg_191_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_194_6 then
							local var_194_17 = Mathf.Lerp(iter_194_6.color.r, 1, var_194_16)

							iter_194_6.color = Color.New(var_194_17, var_194_17, var_194_17)
						end
					end
				end
			end

			if arg_191_1.time_ >= var_194_14 + var_194_15 and arg_191_1.time_ < var_194_14 + var_194_15 + arg_194_0 and arg_191_1.var_.actorSpriteComps1038 then
				local var_194_18 = 1

				for iter_194_7, iter_194_8 in pairs(arg_191_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_194_8 then
						iter_194_8.color = Color.New(var_194_18, var_194_18, var_194_18)
					end
				end

				arg_191_1.var_.actorSpriteComps1038 = nil
			end

			local var_194_19 = arg_191_1.actors_["1038"]
			local var_194_20 = 0

			if var_194_20 < arg_191_1.time_ and arg_191_1.time_ <= var_194_20 + arg_194_0 then
				local var_194_21 = var_194_19:GetComponentInChildren(typeof(CanvasGroup))

				if var_194_21 then
					arg_191_1.var_.alphaOldValue1038 = var_194_21.alpha
					arg_191_1.var_.characterEffect1038 = var_194_21
				end

				arg_191_1.var_.alphaOldValue1038 = 0
			end

			local var_194_22 = 0.5

			if var_194_20 <= arg_191_1.time_ and arg_191_1.time_ < var_194_20 + var_194_22 then
				local var_194_23 = (arg_191_1.time_ - var_194_20) / var_194_22
				local var_194_24 = Mathf.Lerp(arg_191_1.var_.alphaOldValue1038, 1, var_194_23)

				if arg_191_1.var_.characterEffect1038 then
					arg_191_1.var_.characterEffect1038.alpha = var_194_24
				end
			end

			if arg_191_1.time_ >= var_194_20 + var_194_22 and arg_191_1.time_ < var_194_20 + var_194_22 + arg_194_0 and arg_191_1.var_.characterEffect1038 then
				arg_191_1.var_.characterEffect1038.alpha = 1
			end

			local var_194_25 = arg_191_1.actors_["10030"]
			local var_194_26 = 0

			if var_194_26 < arg_191_1.time_ and arg_191_1.time_ <= var_194_26 + arg_194_0 then
				local var_194_27 = var_194_25:GetComponentInChildren(typeof(CanvasGroup))

				if var_194_27 then
					arg_191_1.var_.alphaOldValue10030 = var_194_27.alpha
					arg_191_1.var_.characterEffect10030 = var_194_27
				end

				arg_191_1.var_.alphaOldValue10030 = 0
			end

			local var_194_28 = 0.0166666666666667

			if var_194_26 <= arg_191_1.time_ and arg_191_1.time_ < var_194_26 + var_194_28 then
				local var_194_29 = (arg_191_1.time_ - var_194_26) / var_194_28
				local var_194_30 = Mathf.Lerp(arg_191_1.var_.alphaOldValue10030, 1, var_194_29)

				if arg_191_1.var_.characterEffect10030 then
					arg_191_1.var_.characterEffect10030.alpha = var_194_30
				end
			end

			if arg_191_1.time_ >= var_194_26 + var_194_28 and arg_191_1.time_ < var_194_26 + var_194_28 + arg_194_0 and arg_191_1.var_.characterEffect10030 then
				arg_191_1.var_.characterEffect10030.alpha = 1
			end

			local var_194_31 = 0
			local var_194_32 = 1.225

			if var_194_31 < arg_191_1.time_ and arg_191_1.time_ <= var_194_31 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_33 = arg_191_1:FormatText(StoryNameCfg[94].name)

				arg_191_1.leftNameTxt_.text = var_194_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_34 = arg_191_1:GetWordFromCfg(115261047)
				local var_194_35 = arg_191_1:FormatText(var_194_34.content)

				arg_191_1.text_.text = var_194_35

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_36 = 49
				local var_194_37 = utf8.len(var_194_35)
				local var_194_38 = var_194_36 <= 0 and var_194_32 or var_194_32 * (var_194_37 / var_194_36)

				if var_194_38 > 0 and var_194_32 < var_194_38 then
					arg_191_1.talkMaxDuration = var_194_38

					if var_194_38 + var_194_31 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_38 + var_194_31
					end
				end

				arg_191_1.text_.text = var_194_35
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261047", "story_v_out_115261.awb") ~= 0 then
					local var_194_39 = manager.audio:GetVoiceLength("story_v_out_115261", "115261047", "story_v_out_115261.awb") / 1000

					if var_194_39 + var_194_31 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_39 + var_194_31
					end

					if var_194_34.prefab_name ~= "" and arg_191_1.actors_[var_194_34.prefab_name] ~= nil then
						local var_194_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_34.prefab_name].transform, "story_v_out_115261", "115261047", "story_v_out_115261.awb")

						arg_191_1:RecordAudio("115261047", var_194_40)
						arg_191_1:RecordAudio("115261047", var_194_40)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_115261", "115261047", "story_v_out_115261.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_115261", "115261047", "story_v_out_115261.awb")
				end

				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_41 = math.max(var_194_32, arg_191_1.talkMaxDuration)

			if var_194_31 <= arg_191_1.time_ and arg_191_1.time_ < var_194_31 + var_194_41 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_31) / var_194_41

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_31 + var_194_41 and arg_191_1.time_ < var_194_31 + var_194_41 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play115261048 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 115261048
		arg_195_1.duration_ = 8.5

		local var_195_0 = {
			ja = 8.5,
			ko = 5.1,
			zh = 4,
			en = 6.433
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
				arg_195_0:Play115261049(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["10030"]
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 and arg_195_1.var_.actorSpriteComps10030 == nil then
				arg_195_1.var_.actorSpriteComps10030 = var_198_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_198_2 = 0.2

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_2 then
				local var_198_3 = (arg_195_1.time_ - var_198_1) / var_198_2

				if arg_195_1.var_.actorSpriteComps10030 then
					for iter_198_0, iter_198_1 in pairs(arg_195_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_198_1 then
							local var_198_4 = Mathf.Lerp(iter_198_1.color.r, 1, var_198_3)

							iter_198_1.color = Color.New(var_198_4, var_198_4, var_198_4)
						end
					end
				end
			end

			if arg_195_1.time_ >= var_198_1 + var_198_2 and arg_195_1.time_ < var_198_1 + var_198_2 + arg_198_0 and arg_195_1.var_.actorSpriteComps10030 then
				local var_198_5 = 1

				for iter_198_2, iter_198_3 in pairs(arg_195_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_198_3 then
						iter_198_3.color = Color.New(var_198_5, var_198_5, var_198_5)
					end
				end

				arg_195_1.var_.actorSpriteComps10030 = nil
			end

			local var_198_6 = arg_195_1.actors_["1038"]
			local var_198_7 = 0

			if var_198_7 < arg_195_1.time_ and arg_195_1.time_ <= var_198_7 + arg_198_0 and arg_195_1.var_.actorSpriteComps1038 == nil then
				arg_195_1.var_.actorSpriteComps1038 = var_198_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_198_8 = 0.2

			if var_198_7 <= arg_195_1.time_ and arg_195_1.time_ < var_198_7 + var_198_8 then
				local var_198_9 = (arg_195_1.time_ - var_198_7) / var_198_8

				if arg_195_1.var_.actorSpriteComps1038 then
					for iter_198_4, iter_198_5 in pairs(arg_195_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_198_5 then
							local var_198_10 = Mathf.Lerp(iter_198_5.color.r, 0.5, var_198_9)

							iter_198_5.color = Color.New(var_198_10, var_198_10, var_198_10)
						end
					end
				end
			end

			if arg_195_1.time_ >= var_198_7 + var_198_8 and arg_195_1.time_ < var_198_7 + var_198_8 + arg_198_0 and arg_195_1.var_.actorSpriteComps1038 then
				local var_198_11 = 0.5

				for iter_198_6, iter_198_7 in pairs(arg_195_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_198_7 then
						iter_198_7.color = Color.New(var_198_11, var_198_11, var_198_11)
					end
				end

				arg_195_1.var_.actorSpriteComps1038 = nil
			end

			local var_198_12 = arg_195_1.actors_["10030"].transform
			local var_198_13 = 0

			if var_198_13 < arg_195_1.time_ and arg_195_1.time_ <= var_198_13 + arg_198_0 then
				arg_195_1.var_.moveOldPos10030 = var_198_12.localPosition
				var_198_12.localScale = Vector3.New(1, 1, 1)

				arg_195_1:CheckSpriteTmpPos("10030", 4)

				local var_198_14 = var_198_12.childCount

				for iter_198_8 = 0, var_198_14 - 1 do
					local var_198_15 = var_198_12:GetChild(iter_198_8)

					if var_198_15.name == "split_1" or not string.find(var_198_15.name, "split") then
						var_198_15.gameObject:SetActive(true)
					else
						var_198_15.gameObject:SetActive(false)
					end
				end
			end

			local var_198_16 = 0.001

			if var_198_13 <= arg_195_1.time_ and arg_195_1.time_ < var_198_13 + var_198_16 then
				local var_198_17 = (arg_195_1.time_ - var_198_13) / var_198_16
				local var_198_18 = Vector3.New(390, -390, 150)

				var_198_12.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos10030, var_198_18, var_198_17)
			end

			if arg_195_1.time_ >= var_198_13 + var_198_16 and arg_195_1.time_ < var_198_13 + var_198_16 + arg_198_0 then
				var_198_12.localPosition = Vector3.New(390, -390, 150)
			end

			local var_198_19 = 0
			local var_198_20 = 0.45

			if var_198_19 < arg_195_1.time_ and arg_195_1.time_ <= var_198_19 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_21 = arg_195_1:FormatText(StoryNameCfg[309].name)

				arg_195_1.leftNameTxt_.text = var_198_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_22 = arg_195_1:GetWordFromCfg(115261048)
				local var_198_23 = arg_195_1:FormatText(var_198_22.content)

				arg_195_1.text_.text = var_198_23

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_24 = 18
				local var_198_25 = utf8.len(var_198_23)
				local var_198_26 = var_198_24 <= 0 and var_198_20 or var_198_20 * (var_198_25 / var_198_24)

				if var_198_26 > 0 and var_198_20 < var_198_26 then
					arg_195_1.talkMaxDuration = var_198_26

					if var_198_26 + var_198_19 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_26 + var_198_19
					end
				end

				arg_195_1.text_.text = var_198_23
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261048", "story_v_out_115261.awb") ~= 0 then
					local var_198_27 = manager.audio:GetVoiceLength("story_v_out_115261", "115261048", "story_v_out_115261.awb") / 1000

					if var_198_27 + var_198_19 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_27 + var_198_19
					end

					if var_198_22.prefab_name ~= "" and arg_195_1.actors_[var_198_22.prefab_name] ~= nil then
						local var_198_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_22.prefab_name].transform, "story_v_out_115261", "115261048", "story_v_out_115261.awb")

						arg_195_1:RecordAudio("115261048", var_198_28)
						arg_195_1:RecordAudio("115261048", var_198_28)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_115261", "115261048", "story_v_out_115261.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_115261", "115261048", "story_v_out_115261.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_29 = math.max(var_198_20, arg_195_1.talkMaxDuration)

			if var_198_19 <= arg_195_1.time_ and arg_195_1.time_ < var_198_19 + var_198_29 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_19) / var_198_29

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_19 + var_198_29 and arg_195_1.time_ < var_198_19 + var_198_29 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play115261049 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 115261049
		arg_199_1.duration_ = 11.1

		local var_199_0 = {
			ja = 11.1,
			ko = 8.966,
			zh = 8.733,
			en = 8.8
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
				arg_199_0:Play115261050(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["10030"]
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 and arg_199_1.var_.actorSpriteComps10030 == nil then
				arg_199_1.var_.actorSpriteComps10030 = var_202_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_202_2 = 0.2

			if var_202_1 <= arg_199_1.time_ and arg_199_1.time_ < var_202_1 + var_202_2 then
				local var_202_3 = (arg_199_1.time_ - var_202_1) / var_202_2

				if arg_199_1.var_.actorSpriteComps10030 then
					for iter_202_0, iter_202_1 in pairs(arg_199_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_202_1 then
							local var_202_4 = Mathf.Lerp(iter_202_1.color.r, 0.5, var_202_3)

							iter_202_1.color = Color.New(var_202_4, var_202_4, var_202_4)
						end
					end
				end
			end

			if arg_199_1.time_ >= var_202_1 + var_202_2 and arg_199_1.time_ < var_202_1 + var_202_2 + arg_202_0 and arg_199_1.var_.actorSpriteComps10030 then
				local var_202_5 = 0.5

				for iter_202_2, iter_202_3 in pairs(arg_199_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_202_3 then
						iter_202_3.color = Color.New(var_202_5, var_202_5, var_202_5)
					end
				end

				arg_199_1.var_.actorSpriteComps10030 = nil
			end

			local var_202_6 = arg_199_1.actors_["1038"]
			local var_202_7 = 0

			if var_202_7 < arg_199_1.time_ and arg_199_1.time_ <= var_202_7 + arg_202_0 and arg_199_1.var_.actorSpriteComps1038 == nil then
				arg_199_1.var_.actorSpriteComps1038 = var_202_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_202_8 = 0.2

			if var_202_7 <= arg_199_1.time_ and arg_199_1.time_ < var_202_7 + var_202_8 then
				local var_202_9 = (arg_199_1.time_ - var_202_7) / var_202_8

				if arg_199_1.var_.actorSpriteComps1038 then
					for iter_202_4, iter_202_5 in pairs(arg_199_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_202_5 then
							local var_202_10 = Mathf.Lerp(iter_202_5.color.r, 1, var_202_9)

							iter_202_5.color = Color.New(var_202_10, var_202_10, var_202_10)
						end
					end
				end
			end

			if arg_199_1.time_ >= var_202_7 + var_202_8 and arg_199_1.time_ < var_202_7 + var_202_8 + arg_202_0 and arg_199_1.var_.actorSpriteComps1038 then
				local var_202_11 = 1

				for iter_202_6, iter_202_7 in pairs(arg_199_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_202_7 then
						iter_202_7.color = Color.New(var_202_11, var_202_11, var_202_11)
					end
				end

				arg_199_1.var_.actorSpriteComps1038 = nil
			end

			local var_202_12 = 0
			local var_202_13 = 0.8

			if var_202_12 < arg_199_1.time_ and arg_199_1.time_ <= var_202_12 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_14 = arg_199_1:FormatText(StoryNameCfg[94].name)

				arg_199_1.leftNameTxt_.text = var_202_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_15 = arg_199_1:GetWordFromCfg(115261049)
				local var_202_16 = arg_199_1:FormatText(var_202_15.content)

				arg_199_1.text_.text = var_202_16

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_17 = 32
				local var_202_18 = utf8.len(var_202_16)
				local var_202_19 = var_202_17 <= 0 and var_202_13 or var_202_13 * (var_202_18 / var_202_17)

				if var_202_19 > 0 and var_202_13 < var_202_19 then
					arg_199_1.talkMaxDuration = var_202_19

					if var_202_19 + var_202_12 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_19 + var_202_12
					end
				end

				arg_199_1.text_.text = var_202_16
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261049", "story_v_out_115261.awb") ~= 0 then
					local var_202_20 = manager.audio:GetVoiceLength("story_v_out_115261", "115261049", "story_v_out_115261.awb") / 1000

					if var_202_20 + var_202_12 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_20 + var_202_12
					end

					if var_202_15.prefab_name ~= "" and arg_199_1.actors_[var_202_15.prefab_name] ~= nil then
						local var_202_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_15.prefab_name].transform, "story_v_out_115261", "115261049", "story_v_out_115261.awb")

						arg_199_1:RecordAudio("115261049", var_202_21)
						arg_199_1:RecordAudio("115261049", var_202_21)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_115261", "115261049", "story_v_out_115261.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_115261", "115261049", "story_v_out_115261.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_22 = math.max(var_202_13, arg_199_1.talkMaxDuration)

			if var_202_12 <= arg_199_1.time_ and arg_199_1.time_ < var_202_12 + var_202_22 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_12) / var_202_22

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_12 + var_202_22 and arg_199_1.time_ < var_202_12 + var_202_22 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play115261050 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 115261050
		arg_203_1.duration_ = 6.166

		local var_203_0 = {
			ja = 6.166,
			ko = 4.7,
			zh = 4.633,
			en = 4.866
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
		end

		function arg_203_1.playNext_(arg_205_0)
			if arg_205_0 == 1 then
				arg_203_0:Play115261051(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["10030"]
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 and arg_203_1.var_.actorSpriteComps10030 == nil then
				arg_203_1.var_.actorSpriteComps10030 = var_206_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_206_2 = 0.2

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_2 then
				local var_206_3 = (arg_203_1.time_ - var_206_1) / var_206_2

				if arg_203_1.var_.actorSpriteComps10030 then
					for iter_206_0, iter_206_1 in pairs(arg_203_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_206_1 then
							local var_206_4 = Mathf.Lerp(iter_206_1.color.r, 1, var_206_3)

							iter_206_1.color = Color.New(var_206_4, var_206_4, var_206_4)
						end
					end
				end
			end

			if arg_203_1.time_ >= var_206_1 + var_206_2 and arg_203_1.time_ < var_206_1 + var_206_2 + arg_206_0 and arg_203_1.var_.actorSpriteComps10030 then
				local var_206_5 = 1

				for iter_206_2, iter_206_3 in pairs(arg_203_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_206_3 then
						iter_206_3.color = Color.New(var_206_5, var_206_5, var_206_5)
					end
				end

				arg_203_1.var_.actorSpriteComps10030 = nil
			end

			local var_206_6 = arg_203_1.actors_["1038"]
			local var_206_7 = 0

			if var_206_7 < arg_203_1.time_ and arg_203_1.time_ <= var_206_7 + arg_206_0 and arg_203_1.var_.actorSpriteComps1038 == nil then
				arg_203_1.var_.actorSpriteComps1038 = var_206_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_206_8 = 0.2

			if var_206_7 <= arg_203_1.time_ and arg_203_1.time_ < var_206_7 + var_206_8 then
				local var_206_9 = (arg_203_1.time_ - var_206_7) / var_206_8

				if arg_203_1.var_.actorSpriteComps1038 then
					for iter_206_4, iter_206_5 in pairs(arg_203_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_206_5 then
							local var_206_10 = Mathf.Lerp(iter_206_5.color.r, 0.5, var_206_9)

							iter_206_5.color = Color.New(var_206_10, var_206_10, var_206_10)
						end
					end
				end
			end

			if arg_203_1.time_ >= var_206_7 + var_206_8 and arg_203_1.time_ < var_206_7 + var_206_8 + arg_206_0 and arg_203_1.var_.actorSpriteComps1038 then
				local var_206_11 = 0.5

				for iter_206_6, iter_206_7 in pairs(arg_203_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_206_7 then
						iter_206_7.color = Color.New(var_206_11, var_206_11, var_206_11)
					end
				end

				arg_203_1.var_.actorSpriteComps1038 = nil
			end

			local var_206_12 = arg_203_1.actors_["10030"].transform
			local var_206_13 = 0

			if var_206_13 < arg_203_1.time_ and arg_203_1.time_ <= var_206_13 + arg_206_0 then
				arg_203_1.var_.moveOldPos10030 = var_206_12.localPosition
				var_206_12.localScale = Vector3.New(1, 1, 1)

				arg_203_1:CheckSpriteTmpPos("10030", 4)

				local var_206_14 = var_206_12.childCount

				for iter_206_8 = 0, var_206_14 - 1 do
					local var_206_15 = var_206_12:GetChild(iter_206_8)

					if var_206_15.name == "split_3" or not string.find(var_206_15.name, "split") then
						var_206_15.gameObject:SetActive(true)
					else
						var_206_15.gameObject:SetActive(false)
					end
				end
			end

			local var_206_16 = 0.001

			if var_206_13 <= arg_203_1.time_ and arg_203_1.time_ < var_206_13 + var_206_16 then
				local var_206_17 = (arg_203_1.time_ - var_206_13) / var_206_16
				local var_206_18 = Vector3.New(390, -390, 150)

				var_206_12.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos10030, var_206_18, var_206_17)
			end

			if arg_203_1.time_ >= var_206_13 + var_206_16 and arg_203_1.time_ < var_206_13 + var_206_16 + arg_206_0 then
				var_206_12.localPosition = Vector3.New(390, -390, 150)
			end

			local var_206_19 = 0
			local var_206_20 = 0.45

			if var_206_19 < arg_203_1.time_ and arg_203_1.time_ <= var_206_19 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_21 = arg_203_1:FormatText(StoryNameCfg[309].name)

				arg_203_1.leftNameTxt_.text = var_206_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_22 = arg_203_1:GetWordFromCfg(115261050)
				local var_206_23 = arg_203_1:FormatText(var_206_22.content)

				arg_203_1.text_.text = var_206_23

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_24 = 18
				local var_206_25 = utf8.len(var_206_23)
				local var_206_26 = var_206_24 <= 0 and var_206_20 or var_206_20 * (var_206_25 / var_206_24)

				if var_206_26 > 0 and var_206_20 < var_206_26 then
					arg_203_1.talkMaxDuration = var_206_26

					if var_206_26 + var_206_19 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_26 + var_206_19
					end
				end

				arg_203_1.text_.text = var_206_23
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261050", "story_v_out_115261.awb") ~= 0 then
					local var_206_27 = manager.audio:GetVoiceLength("story_v_out_115261", "115261050", "story_v_out_115261.awb") / 1000

					if var_206_27 + var_206_19 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_27 + var_206_19
					end

					if var_206_22.prefab_name ~= "" and arg_203_1.actors_[var_206_22.prefab_name] ~= nil then
						local var_206_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_22.prefab_name].transform, "story_v_out_115261", "115261050", "story_v_out_115261.awb")

						arg_203_1:RecordAudio("115261050", var_206_28)
						arg_203_1:RecordAudio("115261050", var_206_28)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_115261", "115261050", "story_v_out_115261.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_115261", "115261050", "story_v_out_115261.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_29 = math.max(var_206_20, arg_203_1.talkMaxDuration)

			if var_206_19 <= arg_203_1.time_ and arg_203_1.time_ < var_206_19 + var_206_29 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_19) / var_206_29

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_19 + var_206_29 and arg_203_1.time_ < var_206_19 + var_206_29 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play115261051 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 115261051
		arg_207_1.duration_ = 5

		SetActive(arg_207_1.tipsGo_, false)

		function arg_207_1.onSingleLineFinish_()
			arg_207_1.onSingleLineUpdate_ = nil
			arg_207_1.onSingleLineFinish_ = nil
			arg_207_1.state_ = "waiting"
		end

		function arg_207_1.playNext_(arg_209_0)
			if arg_209_0 == 1 then
				arg_207_0:Play115261052(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["10030"].transform
			local var_210_1 = 0.5

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 then
				arg_207_1.var_.moveOldPos10030 = var_210_0.localPosition
				var_210_0.localScale = Vector3.New(1, 1, 1)

				arg_207_1:CheckSpriteTmpPos("10030", 4)

				local var_210_2 = var_210_0.childCount

				for iter_210_0 = 0, var_210_2 - 1 do
					local var_210_3 = var_210_0:GetChild(iter_210_0)

					if var_210_3.name == "split_3" or not string.find(var_210_3.name, "split") then
						var_210_3.gameObject:SetActive(true)
					else
						var_210_3.gameObject:SetActive(false)
					end
				end
			end

			local var_210_4 = 0.001

			if var_210_1 <= arg_207_1.time_ and arg_207_1.time_ < var_210_1 + var_210_4 then
				local var_210_5 = (arg_207_1.time_ - var_210_1) / var_210_4
				local var_210_6 = Vector3.New(390, -390, 150)

				var_210_0.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos10030, var_210_6, var_210_5)
			end

			if arg_207_1.time_ >= var_210_1 + var_210_4 and arg_207_1.time_ < var_210_1 + var_210_4 + arg_210_0 then
				var_210_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_210_7 = arg_207_1.actors_["10030"]
			local var_210_8 = 0

			if var_210_8 < arg_207_1.time_ and arg_207_1.time_ <= var_210_8 + arg_210_0 then
				local var_210_9 = var_210_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_210_9 then
					arg_207_1.var_.alphaOldValue10030 = var_210_9.alpha
					arg_207_1.var_.characterEffect10030 = var_210_9
				end

				arg_207_1.var_.alphaOldValue10030 = 1
			end

			local var_210_10 = 0.5

			if var_210_8 <= arg_207_1.time_ and arg_207_1.time_ < var_210_8 + var_210_10 then
				local var_210_11 = (arg_207_1.time_ - var_210_8) / var_210_10
				local var_210_12 = Mathf.Lerp(arg_207_1.var_.alphaOldValue10030, 0, var_210_11)

				if arg_207_1.var_.characterEffect10030 then
					arg_207_1.var_.characterEffect10030.alpha = var_210_12
				end
			end

			if arg_207_1.time_ >= var_210_8 + var_210_10 and arg_207_1.time_ < var_210_8 + var_210_10 + arg_210_0 and arg_207_1.var_.characterEffect10030 then
				arg_207_1.var_.characterEffect10030.alpha = 0
			end

			local var_210_13 = arg_207_1.actors_["1038"]
			local var_210_14 = 0

			if var_210_14 < arg_207_1.time_ and arg_207_1.time_ <= var_210_14 + arg_210_0 then
				local var_210_15 = var_210_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_210_15 then
					arg_207_1.var_.alphaOldValue1038 = var_210_15.alpha
					arg_207_1.var_.characterEffect1038 = var_210_15
				end

				arg_207_1.var_.alphaOldValue1038 = 1
			end

			local var_210_16 = 0.5

			if var_210_14 <= arg_207_1.time_ and arg_207_1.time_ < var_210_14 + var_210_16 then
				local var_210_17 = (arg_207_1.time_ - var_210_14) / var_210_16
				local var_210_18 = Mathf.Lerp(arg_207_1.var_.alphaOldValue1038, 0, var_210_17)

				if arg_207_1.var_.characterEffect1038 then
					arg_207_1.var_.characterEffect1038.alpha = var_210_18
				end
			end

			if arg_207_1.time_ >= var_210_14 + var_210_16 and arg_207_1.time_ < var_210_14 + var_210_16 + arg_210_0 and arg_207_1.var_.characterEffect1038 then
				arg_207_1.var_.characterEffect1038.alpha = 0
			end

			local var_210_19 = 0
			local var_210_20 = 0.525

			if var_210_19 < arg_207_1.time_ and arg_207_1.time_ <= var_210_19 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, false)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_21 = arg_207_1:GetWordFromCfg(115261051)
				local var_210_22 = arg_207_1:FormatText(var_210_21.content)

				arg_207_1.text_.text = var_210_22

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_23 = 21
				local var_210_24 = utf8.len(var_210_22)
				local var_210_25 = var_210_23 <= 0 and var_210_20 or var_210_20 * (var_210_24 / var_210_23)

				if var_210_25 > 0 and var_210_20 < var_210_25 then
					arg_207_1.talkMaxDuration = var_210_25

					if var_210_25 + var_210_19 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_25 + var_210_19
					end
				end

				arg_207_1.text_.text = var_210_22
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)
				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_26 = math.max(var_210_20, arg_207_1.talkMaxDuration)

			if var_210_19 <= arg_207_1.time_ and arg_207_1.time_ < var_210_19 + var_210_26 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_19) / var_210_26

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_19 + var_210_26 and arg_207_1.time_ < var_210_19 + var_210_26 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play115261052 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 115261052
		arg_211_1.duration_ = 10.233

		local var_211_0 = {
			ja = 8.066,
			ko = 6.9,
			zh = 8.233,
			en = 10.233
		}
		local var_211_1 = manager.audio:GetLocalizationFlag()

		if var_211_0[var_211_1] ~= nil then
			arg_211_1.duration_ = var_211_0[var_211_1]
		end

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play115261053(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = arg_211_1.actors_["1038"]
			local var_214_1 = 0

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 and arg_211_1.var_.actorSpriteComps1038 == nil then
				arg_211_1.var_.actorSpriteComps1038 = var_214_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_214_2 = 0.2

			if var_214_1 <= arg_211_1.time_ and arg_211_1.time_ < var_214_1 + var_214_2 then
				local var_214_3 = (arg_211_1.time_ - var_214_1) / var_214_2

				if arg_211_1.var_.actorSpriteComps1038 then
					for iter_214_0, iter_214_1 in pairs(arg_211_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_214_1 then
							local var_214_4 = Mathf.Lerp(iter_214_1.color.r, 1, var_214_3)

							iter_214_1.color = Color.New(var_214_4, var_214_4, var_214_4)
						end
					end
				end
			end

			if arg_211_1.time_ >= var_214_1 + var_214_2 and arg_211_1.time_ < var_214_1 + var_214_2 + arg_214_0 and arg_211_1.var_.actorSpriteComps1038 then
				local var_214_5 = 1

				for iter_214_2, iter_214_3 in pairs(arg_211_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_214_3 then
						iter_214_3.color = Color.New(var_214_5, var_214_5, var_214_5)
					end
				end

				arg_211_1.var_.actorSpriteComps1038 = nil
			end

			local var_214_6 = arg_211_1.actors_["1038"].transform
			local var_214_7 = 0

			if var_214_7 < arg_211_1.time_ and arg_211_1.time_ <= var_214_7 + arg_214_0 then
				arg_211_1.var_.moveOldPos1038 = var_214_6.localPosition
				var_214_6.localScale = Vector3.New(1, 1, 1)

				arg_211_1:CheckSpriteTmpPos("1038", 2)

				local var_214_8 = var_214_6.childCount

				for iter_214_4 = 0, var_214_8 - 1 do
					local var_214_9 = var_214_6:GetChild(iter_214_4)

					if var_214_9.name == "split_1" or not string.find(var_214_9.name, "split") then
						var_214_9.gameObject:SetActive(true)
					else
						var_214_9.gameObject:SetActive(false)
					end
				end
			end

			local var_214_10 = 0.001

			if var_214_7 <= arg_211_1.time_ and arg_211_1.time_ < var_214_7 + var_214_10 then
				local var_214_11 = (arg_211_1.time_ - var_214_7) / var_214_10
				local var_214_12 = Vector3.New(-390, -400, 0)

				var_214_6.localPosition = Vector3.Lerp(arg_211_1.var_.moveOldPos1038, var_214_12, var_214_11)
			end

			if arg_211_1.time_ >= var_214_7 + var_214_10 and arg_211_1.time_ < var_214_7 + var_214_10 + arg_214_0 then
				var_214_6.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_214_13 = arg_211_1.actors_["1038"]
			local var_214_14 = 0

			if var_214_14 < arg_211_1.time_ and arg_211_1.time_ <= var_214_14 + arg_214_0 then
				local var_214_15 = var_214_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_214_15 then
					arg_211_1.var_.alphaOldValue1038 = var_214_15.alpha
					arg_211_1.var_.characterEffect1038 = var_214_15
				end

				arg_211_1.var_.alphaOldValue1038 = 0
			end

			local var_214_16 = 0.5

			if var_214_14 <= arg_211_1.time_ and arg_211_1.time_ < var_214_14 + var_214_16 then
				local var_214_17 = (arg_211_1.time_ - var_214_14) / var_214_16
				local var_214_18 = Mathf.Lerp(arg_211_1.var_.alphaOldValue1038, 1, var_214_17)

				if arg_211_1.var_.characterEffect1038 then
					arg_211_1.var_.characterEffect1038.alpha = var_214_18
				end
			end

			if arg_211_1.time_ >= var_214_14 + var_214_16 and arg_211_1.time_ < var_214_14 + var_214_16 + arg_214_0 and arg_211_1.var_.characterEffect1038 then
				arg_211_1.var_.characterEffect1038.alpha = 1
			end

			local var_214_19 = arg_211_1.actors_["10030"]
			local var_214_20 = 0

			if var_214_20 < arg_211_1.time_ and arg_211_1.time_ <= var_214_20 + arg_214_0 and arg_211_1.var_.actorSpriteComps10030 == nil then
				arg_211_1.var_.actorSpriteComps10030 = var_214_19:GetComponentsInChildren(typeof(Image), true)
			end

			local var_214_21 = 0.2

			if var_214_20 <= arg_211_1.time_ and arg_211_1.time_ < var_214_20 + var_214_21 then
				local var_214_22 = (arg_211_1.time_ - var_214_20) / var_214_21

				if arg_211_1.var_.actorSpriteComps10030 then
					for iter_214_5, iter_214_6 in pairs(arg_211_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_214_6 then
							local var_214_23 = Mathf.Lerp(iter_214_6.color.r, 0.5, var_214_22)

							iter_214_6.color = Color.New(var_214_23, var_214_23, var_214_23)
						end
					end
				end
			end

			if arg_211_1.time_ >= var_214_20 + var_214_21 and arg_211_1.time_ < var_214_20 + var_214_21 + arg_214_0 and arg_211_1.var_.actorSpriteComps10030 then
				local var_214_24 = 0.5

				for iter_214_7, iter_214_8 in pairs(arg_211_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_214_8 then
						iter_214_8.color = Color.New(var_214_24, var_214_24, var_214_24)
					end
				end

				arg_211_1.var_.actorSpriteComps10030 = nil
			end

			local var_214_25 = arg_211_1.actors_["10030"]
			local var_214_26 = 0

			if var_214_26 < arg_211_1.time_ and arg_211_1.time_ <= var_214_26 + arg_214_0 then
				local var_214_27 = var_214_25:GetComponentInChildren(typeof(CanvasGroup))

				if var_214_27 then
					arg_211_1.var_.alphaOldValue10030 = var_214_27.alpha
					arg_211_1.var_.characterEffect10030 = var_214_27
				end

				arg_211_1.var_.alphaOldValue10030 = 0
			end

			local var_214_28 = 0.333333333333333

			if var_214_26 <= arg_211_1.time_ and arg_211_1.time_ < var_214_26 + var_214_28 then
				local var_214_29 = (arg_211_1.time_ - var_214_26) / var_214_28
				local var_214_30 = Mathf.Lerp(arg_211_1.var_.alphaOldValue10030, 1, var_214_29)

				if arg_211_1.var_.characterEffect10030 then
					arg_211_1.var_.characterEffect10030.alpha = var_214_30
				end
			end

			if arg_211_1.time_ >= var_214_26 + var_214_28 and arg_211_1.time_ < var_214_26 + var_214_28 + arg_214_0 and arg_211_1.var_.characterEffect10030 then
				arg_211_1.var_.characterEffect10030.alpha = 1
			end

			local var_214_31 = 0
			local var_214_32 = 0.7

			if var_214_31 < arg_211_1.time_ and arg_211_1.time_ <= var_214_31 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_33 = arg_211_1:FormatText(StoryNameCfg[94].name)

				arg_211_1.leftNameTxt_.text = var_214_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_34 = arg_211_1:GetWordFromCfg(115261052)
				local var_214_35 = arg_211_1:FormatText(var_214_34.content)

				arg_211_1.text_.text = var_214_35

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_36 = 29
				local var_214_37 = utf8.len(var_214_35)
				local var_214_38 = var_214_36 <= 0 and var_214_32 or var_214_32 * (var_214_37 / var_214_36)

				if var_214_38 > 0 and var_214_32 < var_214_38 then
					arg_211_1.talkMaxDuration = var_214_38

					if var_214_38 + var_214_31 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_38 + var_214_31
					end
				end

				arg_211_1.text_.text = var_214_35
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261052", "story_v_out_115261.awb") ~= 0 then
					local var_214_39 = manager.audio:GetVoiceLength("story_v_out_115261", "115261052", "story_v_out_115261.awb") / 1000

					if var_214_39 + var_214_31 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_39 + var_214_31
					end

					if var_214_34.prefab_name ~= "" and arg_211_1.actors_[var_214_34.prefab_name] ~= nil then
						local var_214_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_34.prefab_name].transform, "story_v_out_115261", "115261052", "story_v_out_115261.awb")

						arg_211_1:RecordAudio("115261052", var_214_40)
						arg_211_1:RecordAudio("115261052", var_214_40)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_out_115261", "115261052", "story_v_out_115261.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_out_115261", "115261052", "story_v_out_115261.awb")
				end

				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_41 = math.max(var_214_32, arg_211_1.talkMaxDuration)

			if var_214_31 <= arg_211_1.time_ and arg_211_1.time_ < var_214_31 + var_214_41 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_31) / var_214_41

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_31 + var_214_41 and arg_211_1.time_ < var_214_31 + var_214_41 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play115261053 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 115261053
		arg_215_1.duration_ = 14.766

		local var_215_0 = {
			ja = 14.766,
			ko = 9.4,
			zh = 9.433,
			en = 11.033
		}
		local var_215_1 = manager.audio:GetLocalizationFlag()

		if var_215_0[var_215_1] ~= nil then
			arg_215_1.duration_ = var_215_0[var_215_1]
		end

		SetActive(arg_215_1.tipsGo_, false)

		function arg_215_1.onSingleLineFinish_()
			arg_215_1.onSingleLineUpdate_ = nil
			arg_215_1.onSingleLineFinish_ = nil
			arg_215_1.state_ = "waiting"
		end

		function arg_215_1.playNext_(arg_217_0)
			if arg_217_0 == 1 then
				arg_215_0:Play115261054(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = 0
			local var_218_1 = 0.925

			if var_218_0 < arg_215_1.time_ and arg_215_1.time_ <= var_218_0 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_2 = arg_215_1:FormatText(StoryNameCfg[94].name)

				arg_215_1.leftNameTxt_.text = var_218_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_3 = arg_215_1:GetWordFromCfg(115261053)
				local var_218_4 = arg_215_1:FormatText(var_218_3.content)

				arg_215_1.text_.text = var_218_4

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_5 = 37
				local var_218_6 = utf8.len(var_218_4)
				local var_218_7 = var_218_5 <= 0 and var_218_1 or var_218_1 * (var_218_6 / var_218_5)

				if var_218_7 > 0 and var_218_1 < var_218_7 then
					arg_215_1.talkMaxDuration = var_218_7

					if var_218_7 + var_218_0 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_7 + var_218_0
					end
				end

				arg_215_1.text_.text = var_218_4
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261053", "story_v_out_115261.awb") ~= 0 then
					local var_218_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261053", "story_v_out_115261.awb") / 1000

					if var_218_8 + var_218_0 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_8 + var_218_0
					end

					if var_218_3.prefab_name ~= "" and arg_215_1.actors_[var_218_3.prefab_name] ~= nil then
						local var_218_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_3.prefab_name].transform, "story_v_out_115261", "115261053", "story_v_out_115261.awb")

						arg_215_1:RecordAudio("115261053", var_218_9)
						arg_215_1:RecordAudio("115261053", var_218_9)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_115261", "115261053", "story_v_out_115261.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_115261", "115261053", "story_v_out_115261.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_10 = math.max(var_218_1, arg_215_1.talkMaxDuration)

			if var_218_0 <= arg_215_1.time_ and arg_215_1.time_ < var_218_0 + var_218_10 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_0) / var_218_10

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_0 + var_218_10 and arg_215_1.time_ < var_218_0 + var_218_10 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play115261054 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 115261054
		arg_219_1.duration_ = 2.866

		local var_219_0 = {
			ja = 2.866,
			ko = 1.6,
			zh = 1.7,
			en = 2.6
		}
		local var_219_1 = manager.audio:GetLocalizationFlag()

		if var_219_0[var_219_1] ~= nil then
			arg_219_1.duration_ = var_219_0[var_219_1]
		end

		SetActive(arg_219_1.tipsGo_, false)

		function arg_219_1.onSingleLineFinish_()
			arg_219_1.onSingleLineUpdate_ = nil
			arg_219_1.onSingleLineFinish_ = nil
			arg_219_1.state_ = "waiting"
		end

		function arg_219_1.playNext_(arg_221_0)
			if arg_221_0 == 1 then
				arg_219_0:Play115261055(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["10030"]
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 and arg_219_1.var_.actorSpriteComps10030 == nil then
				arg_219_1.var_.actorSpriteComps10030 = var_222_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_222_2 = 0.2

			if var_222_1 <= arg_219_1.time_ and arg_219_1.time_ < var_222_1 + var_222_2 then
				local var_222_3 = (arg_219_1.time_ - var_222_1) / var_222_2

				if arg_219_1.var_.actorSpriteComps10030 then
					for iter_222_0, iter_222_1 in pairs(arg_219_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_222_1 then
							local var_222_4 = Mathf.Lerp(iter_222_1.color.r, 1, var_222_3)

							iter_222_1.color = Color.New(var_222_4, var_222_4, var_222_4)
						end
					end
				end
			end

			if arg_219_1.time_ >= var_222_1 + var_222_2 and arg_219_1.time_ < var_222_1 + var_222_2 + arg_222_0 and arg_219_1.var_.actorSpriteComps10030 then
				local var_222_5 = 1

				for iter_222_2, iter_222_3 in pairs(arg_219_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_222_3 then
						iter_222_3.color = Color.New(var_222_5, var_222_5, var_222_5)
					end
				end

				arg_219_1.var_.actorSpriteComps10030 = nil
			end

			local var_222_6 = arg_219_1.actors_["1038"]
			local var_222_7 = 0

			if var_222_7 < arg_219_1.time_ and arg_219_1.time_ <= var_222_7 + arg_222_0 and arg_219_1.var_.actorSpriteComps1038 == nil then
				arg_219_1.var_.actorSpriteComps1038 = var_222_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_222_8 = 0.2

			if var_222_7 <= arg_219_1.time_ and arg_219_1.time_ < var_222_7 + var_222_8 then
				local var_222_9 = (arg_219_1.time_ - var_222_7) / var_222_8

				if arg_219_1.var_.actorSpriteComps1038 then
					for iter_222_4, iter_222_5 in pairs(arg_219_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_222_5 then
							local var_222_10 = Mathf.Lerp(iter_222_5.color.r, 0.5, var_222_9)

							iter_222_5.color = Color.New(var_222_10, var_222_10, var_222_10)
						end
					end
				end
			end

			if arg_219_1.time_ >= var_222_7 + var_222_8 and arg_219_1.time_ < var_222_7 + var_222_8 + arg_222_0 and arg_219_1.var_.actorSpriteComps1038 then
				local var_222_11 = 0.5

				for iter_222_6, iter_222_7 in pairs(arg_219_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_222_7 then
						iter_222_7.color = Color.New(var_222_11, var_222_11, var_222_11)
					end
				end

				arg_219_1.var_.actorSpriteComps1038 = nil
			end

			local var_222_12 = 0
			local var_222_13 = 0.15

			if var_222_12 < arg_219_1.time_ and arg_219_1.time_ <= var_222_12 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_14 = arg_219_1:FormatText(StoryNameCfg[309].name)

				arg_219_1.leftNameTxt_.text = var_222_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_15 = arg_219_1:GetWordFromCfg(115261054)
				local var_222_16 = arg_219_1:FormatText(var_222_15.content)

				arg_219_1.text_.text = var_222_16

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_17 = 6
				local var_222_18 = utf8.len(var_222_16)
				local var_222_19 = var_222_17 <= 0 and var_222_13 or var_222_13 * (var_222_18 / var_222_17)

				if var_222_19 > 0 and var_222_13 < var_222_19 then
					arg_219_1.talkMaxDuration = var_222_19

					if var_222_19 + var_222_12 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_19 + var_222_12
					end
				end

				arg_219_1.text_.text = var_222_16
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261054", "story_v_out_115261.awb") ~= 0 then
					local var_222_20 = manager.audio:GetVoiceLength("story_v_out_115261", "115261054", "story_v_out_115261.awb") / 1000

					if var_222_20 + var_222_12 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_20 + var_222_12
					end

					if var_222_15.prefab_name ~= "" and arg_219_1.actors_[var_222_15.prefab_name] ~= nil then
						local var_222_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_15.prefab_name].transform, "story_v_out_115261", "115261054", "story_v_out_115261.awb")

						arg_219_1:RecordAudio("115261054", var_222_21)
						arg_219_1:RecordAudio("115261054", var_222_21)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_115261", "115261054", "story_v_out_115261.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_115261", "115261054", "story_v_out_115261.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_22 = math.max(var_222_13, arg_219_1.talkMaxDuration)

			if var_222_12 <= arg_219_1.time_ and arg_219_1.time_ < var_222_12 + var_222_22 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_12) / var_222_22

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_12 + var_222_22 and arg_219_1.time_ < var_222_12 + var_222_22 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play115261055 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 115261055
		arg_223_1.duration_ = 5

		SetActive(arg_223_1.tipsGo_, false)

		function arg_223_1.onSingleLineFinish_()
			arg_223_1.onSingleLineUpdate_ = nil
			arg_223_1.onSingleLineFinish_ = nil
			arg_223_1.state_ = "waiting"
		end

		function arg_223_1.playNext_(arg_225_0)
			if arg_225_0 == 1 then
				arg_223_0:Play115261056(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["1038"]
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 then
				local var_226_2 = var_226_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_226_2 then
					arg_223_1.var_.alphaOldValue1038 = var_226_2.alpha
					arg_223_1.var_.characterEffect1038 = var_226_2
				end

				arg_223_1.var_.alphaOldValue1038 = 1
			end

			local var_226_3 = 0.5

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_3 then
				local var_226_4 = (arg_223_1.time_ - var_226_1) / var_226_3
				local var_226_5 = Mathf.Lerp(arg_223_1.var_.alphaOldValue1038, 0, var_226_4)

				if arg_223_1.var_.characterEffect1038 then
					arg_223_1.var_.characterEffect1038.alpha = var_226_5
				end
			end

			if arg_223_1.time_ >= var_226_1 + var_226_3 and arg_223_1.time_ < var_226_1 + var_226_3 + arg_226_0 and arg_223_1.var_.characterEffect1038 then
				arg_223_1.var_.characterEffect1038.alpha = 0
			end

			local var_226_6 = arg_223_1.actors_["10030"]
			local var_226_7 = 0

			if var_226_7 < arg_223_1.time_ and arg_223_1.time_ <= var_226_7 + arg_226_0 then
				local var_226_8 = var_226_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_226_8 then
					arg_223_1.var_.alphaOldValue10030 = var_226_8.alpha
					arg_223_1.var_.characterEffect10030 = var_226_8
				end

				arg_223_1.var_.alphaOldValue10030 = 1
			end

			local var_226_9 = 0.5

			if var_226_7 <= arg_223_1.time_ and arg_223_1.time_ < var_226_7 + var_226_9 then
				local var_226_10 = (arg_223_1.time_ - var_226_7) / var_226_9
				local var_226_11 = Mathf.Lerp(arg_223_1.var_.alphaOldValue10030, 0, var_226_10)

				if arg_223_1.var_.characterEffect10030 then
					arg_223_1.var_.characterEffect10030.alpha = var_226_11
				end
			end

			if arg_223_1.time_ >= var_226_7 + var_226_9 and arg_223_1.time_ < var_226_7 + var_226_9 + arg_226_0 and arg_223_1.var_.characterEffect10030 then
				arg_223_1.var_.characterEffect10030.alpha = 0
			end

			local var_226_12 = 0
			local var_226_13 = 1.275

			if var_226_12 < arg_223_1.time_ and arg_223_1.time_ <= var_226_12 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, false)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_14 = arg_223_1:GetWordFromCfg(115261055)
				local var_226_15 = arg_223_1:FormatText(var_226_14.content)

				arg_223_1.text_.text = var_226_15

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_16 = 51
				local var_226_17 = utf8.len(var_226_15)
				local var_226_18 = var_226_16 <= 0 and var_226_13 or var_226_13 * (var_226_17 / var_226_16)

				if var_226_18 > 0 and var_226_13 < var_226_18 then
					arg_223_1.talkMaxDuration = var_226_18

					if var_226_18 + var_226_12 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_18 + var_226_12
					end
				end

				arg_223_1.text_.text = var_226_15
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)
				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_19 = math.max(var_226_13, arg_223_1.talkMaxDuration)

			if var_226_12 <= arg_223_1.time_ and arg_223_1.time_ < var_226_12 + var_226_19 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_12) / var_226_19

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_12 + var_226_19 and arg_223_1.time_ < var_226_12 + var_226_19 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play115261056 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 115261056
		arg_227_1.duration_ = 5

		SetActive(arg_227_1.tipsGo_, false)

		function arg_227_1.onSingleLineFinish_()
			arg_227_1.onSingleLineUpdate_ = nil
			arg_227_1.onSingleLineFinish_ = nil
			arg_227_1.state_ = "waiting"
		end

		function arg_227_1.playNext_(arg_229_0)
			if arg_229_0 == 1 then
				arg_227_0:Play115261057(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = 0
			local var_230_1 = 0.875

			if var_230_0 < arg_227_1.time_ and arg_227_1.time_ <= var_230_0 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, false)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_2 = arg_227_1:GetWordFromCfg(115261056)
				local var_230_3 = arg_227_1:FormatText(var_230_2.content)

				arg_227_1.text_.text = var_230_3

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_4 = 35
				local var_230_5 = utf8.len(var_230_3)
				local var_230_6 = var_230_4 <= 0 and var_230_1 or var_230_1 * (var_230_5 / var_230_4)

				if var_230_6 > 0 and var_230_1 < var_230_6 then
					arg_227_1.talkMaxDuration = var_230_6

					if var_230_6 + var_230_0 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_6 + var_230_0
					end
				end

				arg_227_1.text_.text = var_230_3
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)
				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_7 = math.max(var_230_1, arg_227_1.talkMaxDuration)

			if var_230_0 <= arg_227_1.time_ and arg_227_1.time_ < var_230_0 + var_230_7 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_0) / var_230_7

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_0 + var_230_7 and arg_227_1.time_ < var_230_0 + var_230_7 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play115261057 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 115261057
		arg_231_1.duration_ = 5

		SetActive(arg_231_1.tipsGo_, false)

		function arg_231_1.onSingleLineFinish_()
			arg_231_1.onSingleLineUpdate_ = nil
			arg_231_1.onSingleLineFinish_ = nil
			arg_231_1.state_ = "waiting"
		end

		function arg_231_1.playNext_(arg_233_0)
			if arg_233_0 == 1 then
				arg_231_0:Play115261058(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = 0
			local var_234_1 = 0.65

			if var_234_0 < arg_231_1.time_ and arg_231_1.time_ <= var_234_0 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, false)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_2 = arg_231_1:GetWordFromCfg(115261057)
				local var_234_3 = arg_231_1:FormatText(var_234_2.content)

				arg_231_1.text_.text = var_234_3

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_4 = 26
				local var_234_5 = utf8.len(var_234_3)
				local var_234_6 = var_234_4 <= 0 and var_234_1 or var_234_1 * (var_234_5 / var_234_4)

				if var_234_6 > 0 and var_234_1 < var_234_6 then
					arg_231_1.talkMaxDuration = var_234_6

					if var_234_6 + var_234_0 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_6 + var_234_0
					end
				end

				arg_231_1.text_.text = var_234_3
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)
				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_7 = math.max(var_234_1, arg_231_1.talkMaxDuration)

			if var_234_0 <= arg_231_1.time_ and arg_231_1.time_ < var_234_0 + var_234_7 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_0) / var_234_7

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_0 + var_234_7 and arg_231_1.time_ < var_234_0 + var_234_7 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play115261058 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 115261058
		arg_235_1.duration_ = 3.366

		local var_235_0 = {
			ja = 3.366,
			ko = 1.933,
			zh = 2.966,
			en = 2.2
		}
		local var_235_1 = manager.audio:GetLocalizationFlag()

		if var_235_0[var_235_1] ~= nil then
			arg_235_1.duration_ = var_235_0[var_235_1]
		end

		SetActive(arg_235_1.tipsGo_, false)

		function arg_235_1.onSingleLineFinish_()
			arg_235_1.onSingleLineUpdate_ = nil
			arg_235_1.onSingleLineFinish_ = nil
			arg_235_1.state_ = "waiting"
		end

		function arg_235_1.playNext_(arg_237_0)
			if arg_237_0 == 1 then
				arg_235_0:Play115261059(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["1038"].transform
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 then
				arg_235_1.var_.moveOldPos1038 = var_238_0.localPosition
				var_238_0.localScale = Vector3.New(1, 1, 1)

				arg_235_1:CheckSpriteTmpPos("1038", 3)

				local var_238_2 = var_238_0.childCount

				for iter_238_0 = 0, var_238_2 - 1 do
					local var_238_3 = var_238_0:GetChild(iter_238_0)

					if var_238_3.name == "split_1" or not string.find(var_238_3.name, "split") then
						var_238_3.gameObject:SetActive(true)
					else
						var_238_3.gameObject:SetActive(false)
					end
				end
			end

			local var_238_4 = 0.001

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_4 then
				local var_238_5 = (arg_235_1.time_ - var_238_1) / var_238_4
				local var_238_6 = Vector3.New(0, -400, 0)

				var_238_0.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos1038, var_238_6, var_238_5)
			end

			if arg_235_1.time_ >= var_238_1 + var_238_4 and arg_235_1.time_ < var_238_1 + var_238_4 + arg_238_0 then
				var_238_0.localPosition = Vector3.New(0, -400, 0)
			end

			local var_238_7 = arg_235_1.actors_["1038"]
			local var_238_8 = 0

			if var_238_8 < arg_235_1.time_ and arg_235_1.time_ <= var_238_8 + arg_238_0 and arg_235_1.var_.actorSpriteComps1038 == nil then
				arg_235_1.var_.actorSpriteComps1038 = var_238_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_238_9 = 0.2

			if var_238_8 <= arg_235_1.time_ and arg_235_1.time_ < var_238_8 + var_238_9 then
				local var_238_10 = (arg_235_1.time_ - var_238_8) / var_238_9

				if arg_235_1.var_.actorSpriteComps1038 then
					for iter_238_1, iter_238_2 in pairs(arg_235_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_238_2 then
							local var_238_11 = Mathf.Lerp(iter_238_2.color.r, 1, var_238_10)

							iter_238_2.color = Color.New(var_238_11, var_238_11, var_238_11)
						end
					end
				end
			end

			if arg_235_1.time_ >= var_238_8 + var_238_9 and arg_235_1.time_ < var_238_8 + var_238_9 + arg_238_0 and arg_235_1.var_.actorSpriteComps1038 then
				local var_238_12 = 1

				for iter_238_3, iter_238_4 in pairs(arg_235_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_238_4 then
						iter_238_4.color = Color.New(var_238_12, var_238_12, var_238_12)
					end
				end

				arg_235_1.var_.actorSpriteComps1038 = nil
			end

			local var_238_13 = arg_235_1.actors_["1038"]
			local var_238_14 = 0

			if var_238_14 < arg_235_1.time_ and arg_235_1.time_ <= var_238_14 + arg_238_0 then
				local var_238_15 = var_238_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_238_15 then
					arg_235_1.var_.alphaOldValue1038 = var_238_15.alpha
					arg_235_1.var_.characterEffect1038 = var_238_15
				end

				arg_235_1.var_.alphaOldValue1038 = 0
			end

			local var_238_16 = 0.5

			if var_238_14 <= arg_235_1.time_ and arg_235_1.time_ < var_238_14 + var_238_16 then
				local var_238_17 = (arg_235_1.time_ - var_238_14) / var_238_16
				local var_238_18 = Mathf.Lerp(arg_235_1.var_.alphaOldValue1038, 1, var_238_17)

				if arg_235_1.var_.characterEffect1038 then
					arg_235_1.var_.characterEffect1038.alpha = var_238_18
				end
			end

			if arg_235_1.time_ >= var_238_14 + var_238_16 and arg_235_1.time_ < var_238_14 + var_238_16 + arg_238_0 and arg_235_1.var_.characterEffect1038 then
				arg_235_1.var_.characterEffect1038.alpha = 1
			end

			local var_238_19 = 0
			local var_238_20 = 0.275

			if var_238_19 < arg_235_1.time_ and arg_235_1.time_ <= var_238_19 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_21 = arg_235_1:FormatText(StoryNameCfg[94].name)

				arg_235_1.leftNameTxt_.text = var_238_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_22 = arg_235_1:GetWordFromCfg(115261058)
				local var_238_23 = arg_235_1:FormatText(var_238_22.content)

				arg_235_1.text_.text = var_238_23

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_24 = 11
				local var_238_25 = utf8.len(var_238_23)
				local var_238_26 = var_238_24 <= 0 and var_238_20 or var_238_20 * (var_238_25 / var_238_24)

				if var_238_26 > 0 and var_238_20 < var_238_26 then
					arg_235_1.talkMaxDuration = var_238_26

					if var_238_26 + var_238_19 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_26 + var_238_19
					end
				end

				arg_235_1.text_.text = var_238_23
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261058", "story_v_out_115261.awb") ~= 0 then
					local var_238_27 = manager.audio:GetVoiceLength("story_v_out_115261", "115261058", "story_v_out_115261.awb") / 1000

					if var_238_27 + var_238_19 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_27 + var_238_19
					end

					if var_238_22.prefab_name ~= "" and arg_235_1.actors_[var_238_22.prefab_name] ~= nil then
						local var_238_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_22.prefab_name].transform, "story_v_out_115261", "115261058", "story_v_out_115261.awb")

						arg_235_1:RecordAudio("115261058", var_238_28)
						arg_235_1:RecordAudio("115261058", var_238_28)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_115261", "115261058", "story_v_out_115261.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_115261", "115261058", "story_v_out_115261.awb")
				end

				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_29 = math.max(var_238_20, arg_235_1.talkMaxDuration)

			if var_238_19 <= arg_235_1.time_ and arg_235_1.time_ < var_238_19 + var_238_29 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_19) / var_238_29

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_19 + var_238_29 and arg_235_1.time_ < var_238_19 + var_238_29 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play115261059 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 115261059
		arg_239_1.duration_ = 7.433

		local var_239_0 = {
			ja = 7.433,
			ko = 6.066,
			zh = 4.1,
			en = 4.766
		}
		local var_239_1 = manager.audio:GetLocalizationFlag()

		if var_239_0[var_239_1] ~= nil then
			arg_239_1.duration_ = var_239_0[var_239_1]
		end

		SetActive(arg_239_1.tipsGo_, false)

		function arg_239_1.onSingleLineFinish_()
			arg_239_1.onSingleLineUpdate_ = nil
			arg_239_1.onSingleLineFinish_ = nil
			arg_239_1.state_ = "waiting"
		end

		function arg_239_1.playNext_(arg_241_0)
			if arg_241_0 == 1 then
				arg_239_0:Play115261060(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["1038"]
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 and arg_239_1.var_.actorSpriteComps1038 == nil then
				arg_239_1.var_.actorSpriteComps1038 = var_242_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_242_2 = 0.2

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_2 then
				local var_242_3 = (arg_239_1.time_ - var_242_1) / var_242_2

				if arg_239_1.var_.actorSpriteComps1038 then
					for iter_242_0, iter_242_1 in pairs(arg_239_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_242_1 then
							local var_242_4 = Mathf.Lerp(iter_242_1.color.r, 0.5, var_242_3)

							iter_242_1.color = Color.New(var_242_4, var_242_4, var_242_4)
						end
					end
				end
			end

			if arg_239_1.time_ >= var_242_1 + var_242_2 and arg_239_1.time_ < var_242_1 + var_242_2 + arg_242_0 and arg_239_1.var_.actorSpriteComps1038 then
				local var_242_5 = 0.5

				for iter_242_2, iter_242_3 in pairs(arg_239_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_242_3 then
						iter_242_3.color = Color.New(var_242_5, var_242_5, var_242_5)
					end
				end

				arg_239_1.var_.actorSpriteComps1038 = nil
			end

			local var_242_6 = 0
			local var_242_7 = 0.5

			if var_242_6 < arg_239_1.time_ and arg_239_1.time_ <= var_242_6 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_8 = arg_239_1:FormatText(StoryNameCfg[205].name)

				arg_239_1.leftNameTxt_.text = var_242_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, true)
				arg_239_1.iconController_:SetSelectedState("hero")

				arg_239_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1042")

				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_9 = arg_239_1:GetWordFromCfg(115261059)
				local var_242_10 = arg_239_1:FormatText(var_242_9.content)

				arg_239_1.text_.text = var_242_10

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_11 = 22
				local var_242_12 = utf8.len(var_242_10)
				local var_242_13 = var_242_11 <= 0 and var_242_7 or var_242_7 * (var_242_12 / var_242_11)

				if var_242_13 > 0 and var_242_7 < var_242_13 then
					arg_239_1.talkMaxDuration = var_242_13

					if var_242_13 + var_242_6 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_13 + var_242_6
					end
				end

				arg_239_1.text_.text = var_242_10
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261059", "story_v_out_115261.awb") ~= 0 then
					local var_242_14 = manager.audio:GetVoiceLength("story_v_out_115261", "115261059", "story_v_out_115261.awb") / 1000

					if var_242_14 + var_242_6 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_14 + var_242_6
					end

					if var_242_9.prefab_name ~= "" and arg_239_1.actors_[var_242_9.prefab_name] ~= nil then
						local var_242_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_9.prefab_name].transform, "story_v_out_115261", "115261059", "story_v_out_115261.awb")

						arg_239_1:RecordAudio("115261059", var_242_15)
						arg_239_1:RecordAudio("115261059", var_242_15)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_115261", "115261059", "story_v_out_115261.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_115261", "115261059", "story_v_out_115261.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_16 = math.max(var_242_7, arg_239_1.talkMaxDuration)

			if var_242_6 <= arg_239_1.time_ and arg_239_1.time_ < var_242_6 + var_242_16 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_6) / var_242_16

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_6 + var_242_16 and arg_239_1.time_ < var_242_6 + var_242_16 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play115261060 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 115261060
		arg_243_1.duration_ = 3

		local var_243_0 = {
			ja = 2.966,
			ko = 2.533,
			zh = 3,
			en = 2.8
		}
		local var_243_1 = manager.audio:GetLocalizationFlag()

		if var_243_0[var_243_1] ~= nil then
			arg_243_1.duration_ = var_243_0[var_243_1]
		end

		SetActive(arg_243_1.tipsGo_, false)

		function arg_243_1.onSingleLineFinish_()
			arg_243_1.onSingleLineUpdate_ = nil
			arg_243_1.onSingleLineFinish_ = nil
			arg_243_1.state_ = "waiting"
		end

		function arg_243_1.playNext_(arg_245_0)
			if arg_245_0 == 1 then
				arg_243_0:Play115261061(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = 0
			local var_246_1 = 0.225

			if var_246_0 < arg_243_1.time_ and arg_243_1.time_ <= var_246_0 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_2 = arg_243_1:FormatText(StoryNameCfg[309].name)

				arg_243_1.leftNameTxt_.text = var_246_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, true)
				arg_243_1.iconController_:SetSelectedState("hero")

				arg_243_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10030_split_1")

				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_3 = arg_243_1:GetWordFromCfg(115261060)
				local var_246_4 = arg_243_1:FormatText(var_246_3.content)

				arg_243_1.text_.text = var_246_4

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_5 = 9
				local var_246_6 = utf8.len(var_246_4)
				local var_246_7 = var_246_5 <= 0 and var_246_1 or var_246_1 * (var_246_6 / var_246_5)

				if var_246_7 > 0 and var_246_1 < var_246_7 then
					arg_243_1.talkMaxDuration = var_246_7

					if var_246_7 + var_246_0 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_7 + var_246_0
					end
				end

				arg_243_1.text_.text = var_246_4
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261060", "story_v_out_115261.awb") ~= 0 then
					local var_246_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261060", "story_v_out_115261.awb") / 1000

					if var_246_8 + var_246_0 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_8 + var_246_0
					end

					if var_246_3.prefab_name ~= "" and arg_243_1.actors_[var_246_3.prefab_name] ~= nil then
						local var_246_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_3.prefab_name].transform, "story_v_out_115261", "115261060", "story_v_out_115261.awb")

						arg_243_1:RecordAudio("115261060", var_246_9)
						arg_243_1:RecordAudio("115261060", var_246_9)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_115261", "115261060", "story_v_out_115261.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_115261", "115261060", "story_v_out_115261.awb")
				end

				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_10 = math.max(var_246_1, arg_243_1.talkMaxDuration)

			if var_246_0 <= arg_243_1.time_ and arg_243_1.time_ < var_246_0 + var_246_10 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_0) / var_246_10

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_0 + var_246_10 and arg_243_1.time_ < var_246_0 + var_246_10 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play115261061 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 115261061
		arg_247_1.duration_ = 5

		SetActive(arg_247_1.tipsGo_, false)

		function arg_247_1.onSingleLineFinish_()
			arg_247_1.onSingleLineUpdate_ = nil
			arg_247_1.onSingleLineFinish_ = nil
			arg_247_1.state_ = "waiting"
		end

		function arg_247_1.playNext_(arg_249_0)
			if arg_249_0 == 1 then
				arg_247_0:Play115261062(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["1038"]
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 then
				local var_250_2 = var_250_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_250_2 then
					arg_247_1.var_.alphaOldValue1038 = var_250_2.alpha
					arg_247_1.var_.characterEffect1038 = var_250_2
				end

				arg_247_1.var_.alphaOldValue1038 = 1
			end

			local var_250_3 = 0.333333333333333

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_3 then
				local var_250_4 = (arg_247_1.time_ - var_250_1) / var_250_3
				local var_250_5 = Mathf.Lerp(arg_247_1.var_.alphaOldValue1038, 0, var_250_4)

				if arg_247_1.var_.characterEffect1038 then
					arg_247_1.var_.characterEffect1038.alpha = var_250_5
				end
			end

			if arg_247_1.time_ >= var_250_1 + var_250_3 and arg_247_1.time_ < var_250_1 + var_250_3 + arg_250_0 and arg_247_1.var_.characterEffect1038 then
				arg_247_1.var_.characterEffect1038.alpha = 0
			end

			local var_250_6 = 0
			local var_250_7 = 0.8

			if var_250_6 < arg_247_1.time_ and arg_247_1.time_ <= var_250_6 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, false)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_8 = arg_247_1:GetWordFromCfg(115261061)
				local var_250_9 = arg_247_1:FormatText(var_250_8.content)

				arg_247_1.text_.text = var_250_9

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_10 = 32
				local var_250_11 = utf8.len(var_250_9)
				local var_250_12 = var_250_10 <= 0 and var_250_7 or var_250_7 * (var_250_11 / var_250_10)

				if var_250_12 > 0 and var_250_7 < var_250_12 then
					arg_247_1.talkMaxDuration = var_250_12

					if var_250_12 + var_250_6 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_12 + var_250_6
					end
				end

				arg_247_1.text_.text = var_250_9
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)
				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_13 = math.max(var_250_7, arg_247_1.talkMaxDuration)

			if var_250_6 <= arg_247_1.time_ and arg_247_1.time_ < var_250_6 + var_250_13 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_6) / var_250_13

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_6 + var_250_13 and arg_247_1.time_ < var_250_6 + var_250_13 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play115261062 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 115261062
		arg_251_1.duration_ = 5.966

		local var_251_0 = {
			ja = 5.366,
			ko = 3.8,
			zh = 4.2,
			en = 5.966
		}
		local var_251_1 = manager.audio:GetLocalizationFlag()

		if var_251_0[var_251_1] ~= nil then
			arg_251_1.duration_ = var_251_0[var_251_1]
		end

		SetActive(arg_251_1.tipsGo_, false)

		function arg_251_1.onSingleLineFinish_()
			arg_251_1.onSingleLineUpdate_ = nil
			arg_251_1.onSingleLineFinish_ = nil
			arg_251_1.state_ = "waiting"
		end

		function arg_251_1.playNext_(arg_253_0)
			if arg_253_0 == 1 then
				arg_251_0:Play115261063(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = 0
			local var_254_1 = 0.375

			if var_254_0 < arg_251_1.time_ and arg_251_1.time_ <= var_254_0 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_2 = arg_251_1:FormatText(StoryNameCfg[205].name)

				arg_251_1.leftNameTxt_.text = var_254_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, true)
				arg_251_1.iconController_:SetSelectedState("hero")

				arg_251_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1042")

				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_3 = arg_251_1:GetWordFromCfg(115261062)
				local var_254_4 = arg_251_1:FormatText(var_254_3.content)

				arg_251_1.text_.text = var_254_4

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_5 = 15
				local var_254_6 = utf8.len(var_254_4)
				local var_254_7 = var_254_5 <= 0 and var_254_1 or var_254_1 * (var_254_6 / var_254_5)

				if var_254_7 > 0 and var_254_1 < var_254_7 then
					arg_251_1.talkMaxDuration = var_254_7

					if var_254_7 + var_254_0 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_7 + var_254_0
					end
				end

				arg_251_1.text_.text = var_254_4
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261062", "story_v_out_115261.awb") ~= 0 then
					local var_254_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261062", "story_v_out_115261.awb") / 1000

					if var_254_8 + var_254_0 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_8 + var_254_0
					end

					if var_254_3.prefab_name ~= "" and arg_251_1.actors_[var_254_3.prefab_name] ~= nil then
						local var_254_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_3.prefab_name].transform, "story_v_out_115261", "115261062", "story_v_out_115261.awb")

						arg_251_1:RecordAudio("115261062", var_254_9)
						arg_251_1:RecordAudio("115261062", var_254_9)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_115261", "115261062", "story_v_out_115261.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_115261", "115261062", "story_v_out_115261.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_10 = math.max(var_254_1, arg_251_1.talkMaxDuration)

			if var_254_0 <= arg_251_1.time_ and arg_251_1.time_ < var_254_0 + var_254_10 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_0) / var_254_10

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_0 + var_254_10 and arg_251_1.time_ < var_254_0 + var_254_10 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play115261063 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 115261063
		arg_255_1.duration_ = 5.666

		local var_255_0 = {
			ja = 5.666,
			ko = 4.7,
			zh = 3.866,
			en = 4.966
		}
		local var_255_1 = manager.audio:GetLocalizationFlag()

		if var_255_0[var_255_1] ~= nil then
			arg_255_1.duration_ = var_255_0[var_255_1]
		end

		SetActive(arg_255_1.tipsGo_, false)

		function arg_255_1.onSingleLineFinish_()
			arg_255_1.onSingleLineUpdate_ = nil
			arg_255_1.onSingleLineFinish_ = nil
			arg_255_1.state_ = "waiting"
		end

		function arg_255_1.playNext_(arg_257_0)
			if arg_257_0 == 1 then
				arg_255_0:Play115261064(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = 0
			local var_258_1 = 0.475

			if var_258_0 < arg_255_1.time_ and arg_255_1.time_ <= var_258_0 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_2 = arg_255_1:FormatText(StoryNameCfg[205].name)

				arg_255_1.leftNameTxt_.text = var_258_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, true)
				arg_255_1.iconController_:SetSelectedState("hero")

				arg_255_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1042")

				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_3 = arg_255_1:GetWordFromCfg(115261063)
				local var_258_4 = arg_255_1:FormatText(var_258_3.content)

				arg_255_1.text_.text = var_258_4

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_5 = 19
				local var_258_6 = utf8.len(var_258_4)
				local var_258_7 = var_258_5 <= 0 and var_258_1 or var_258_1 * (var_258_6 / var_258_5)

				if var_258_7 > 0 and var_258_1 < var_258_7 then
					arg_255_1.talkMaxDuration = var_258_7

					if var_258_7 + var_258_0 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_7 + var_258_0
					end
				end

				arg_255_1.text_.text = var_258_4
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261063", "story_v_out_115261.awb") ~= 0 then
					local var_258_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261063", "story_v_out_115261.awb") / 1000

					if var_258_8 + var_258_0 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_8 + var_258_0
					end

					if var_258_3.prefab_name ~= "" and arg_255_1.actors_[var_258_3.prefab_name] ~= nil then
						local var_258_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_3.prefab_name].transform, "story_v_out_115261", "115261063", "story_v_out_115261.awb")

						arg_255_1:RecordAudio("115261063", var_258_9)
						arg_255_1:RecordAudio("115261063", var_258_9)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_115261", "115261063", "story_v_out_115261.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_115261", "115261063", "story_v_out_115261.awb")
				end

				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_10 = math.max(var_258_1, arg_255_1.talkMaxDuration)

			if var_258_0 <= arg_255_1.time_ and arg_255_1.time_ < var_258_0 + var_258_10 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_0) / var_258_10

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_0 + var_258_10 and arg_255_1.time_ < var_258_0 + var_258_10 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play115261064 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 115261064
		arg_259_1.duration_ = 5

		SetActive(arg_259_1.tipsGo_, false)

		function arg_259_1.onSingleLineFinish_()
			arg_259_1.onSingleLineUpdate_ = nil
			arg_259_1.onSingleLineFinish_ = nil
			arg_259_1.state_ = "waiting"
		end

		function arg_259_1.playNext_(arg_261_0)
			if arg_261_0 == 1 then
				arg_259_0:Play115261065(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = 0
			local var_262_1 = 0.275

			if var_262_0 < arg_259_1.time_ and arg_259_1.time_ <= var_262_0 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, false)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_2 = arg_259_1:GetWordFromCfg(115261064)
				local var_262_3 = arg_259_1:FormatText(var_262_2.content)

				arg_259_1.text_.text = var_262_3

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_4 = 11
				local var_262_5 = utf8.len(var_262_3)
				local var_262_6 = var_262_4 <= 0 and var_262_1 or var_262_1 * (var_262_5 / var_262_4)

				if var_262_6 > 0 and var_262_1 < var_262_6 then
					arg_259_1.talkMaxDuration = var_262_6

					if var_262_6 + var_262_0 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_6 + var_262_0
					end
				end

				arg_259_1.text_.text = var_262_3
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)
				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_7 = math.max(var_262_1, arg_259_1.talkMaxDuration)

			if var_262_0 <= arg_259_1.time_ and arg_259_1.time_ < var_262_0 + var_262_7 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_0) / var_262_7

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_0 + var_262_7 and arg_259_1.time_ < var_262_0 + var_262_7 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play115261065 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 115261065
		arg_263_1.duration_ = 10.633

		local var_263_0 = {
			ja = 6.466,
			ko = 10.6,
			zh = 9.566,
			en = 10.633
		}
		local var_263_1 = manager.audio:GetLocalizationFlag()

		if var_263_0[var_263_1] ~= nil then
			arg_263_1.duration_ = var_263_0[var_263_1]
		end

		SetActive(arg_263_1.tipsGo_, false)

		function arg_263_1.onSingleLineFinish_()
			arg_263_1.onSingleLineUpdate_ = nil
			arg_263_1.onSingleLineFinish_ = nil
			arg_263_1.state_ = "waiting"
		end

		function arg_263_1.playNext_(arg_265_0)
			if arg_265_0 == 1 then
				arg_263_0:Play115261066(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = arg_263_1.actors_["1038"].transform
			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 then
				arg_263_1.var_.moveOldPos1038 = var_266_0.localPosition
				var_266_0.localScale = Vector3.New(1, 1, 1)

				arg_263_1:CheckSpriteTmpPos("1038", 3)

				local var_266_2 = var_266_0.childCount

				for iter_266_0 = 0, var_266_2 - 1 do
					local var_266_3 = var_266_0:GetChild(iter_266_0)

					if var_266_3.name == "split_9" or not string.find(var_266_3.name, "split") then
						var_266_3.gameObject:SetActive(true)
					else
						var_266_3.gameObject:SetActive(false)
					end
				end
			end

			local var_266_4 = 0.001

			if var_266_1 <= arg_263_1.time_ and arg_263_1.time_ < var_266_1 + var_266_4 then
				local var_266_5 = (arg_263_1.time_ - var_266_1) / var_266_4
				local var_266_6 = Vector3.New(0, -400, 0)

				var_266_0.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos1038, var_266_6, var_266_5)
			end

			if arg_263_1.time_ >= var_266_1 + var_266_4 and arg_263_1.time_ < var_266_1 + var_266_4 + arg_266_0 then
				var_266_0.localPosition = Vector3.New(0, -400, 0)
			end

			local var_266_7 = arg_263_1.actors_["1038"]
			local var_266_8 = 0

			if var_266_8 < arg_263_1.time_ and arg_263_1.time_ <= var_266_8 + arg_266_0 and arg_263_1.var_.actorSpriteComps1038 == nil then
				arg_263_1.var_.actorSpriteComps1038 = var_266_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_266_9 = 0.2

			if var_266_8 <= arg_263_1.time_ and arg_263_1.time_ < var_266_8 + var_266_9 then
				local var_266_10 = (arg_263_1.time_ - var_266_8) / var_266_9

				if arg_263_1.var_.actorSpriteComps1038 then
					for iter_266_1, iter_266_2 in pairs(arg_263_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_266_2 then
							local var_266_11 = Mathf.Lerp(iter_266_2.color.r, 1, var_266_10)

							iter_266_2.color = Color.New(var_266_11, var_266_11, var_266_11)
						end
					end
				end
			end

			if arg_263_1.time_ >= var_266_8 + var_266_9 and arg_263_1.time_ < var_266_8 + var_266_9 + arg_266_0 and arg_263_1.var_.actorSpriteComps1038 then
				local var_266_12 = 1

				for iter_266_3, iter_266_4 in pairs(arg_263_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_266_4 then
						iter_266_4.color = Color.New(var_266_12, var_266_12, var_266_12)
					end
				end

				arg_263_1.var_.actorSpriteComps1038 = nil
			end

			local var_266_13 = arg_263_1.actors_["1038"]
			local var_266_14 = 0

			if var_266_14 < arg_263_1.time_ and arg_263_1.time_ <= var_266_14 + arg_266_0 then
				local var_266_15 = var_266_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_266_15 then
					arg_263_1.var_.alphaOldValue1038 = var_266_15.alpha
					arg_263_1.var_.characterEffect1038 = var_266_15
				end

				arg_263_1.var_.alphaOldValue1038 = 0
			end

			local var_266_16 = 0.5

			if var_266_14 <= arg_263_1.time_ and arg_263_1.time_ < var_266_14 + var_266_16 then
				local var_266_17 = (arg_263_1.time_ - var_266_14) / var_266_16
				local var_266_18 = Mathf.Lerp(arg_263_1.var_.alphaOldValue1038, 1, var_266_17)

				if arg_263_1.var_.characterEffect1038 then
					arg_263_1.var_.characterEffect1038.alpha = var_266_18
				end
			end

			if arg_263_1.time_ >= var_266_14 + var_266_16 and arg_263_1.time_ < var_266_14 + var_266_16 + arg_266_0 and arg_263_1.var_.characterEffect1038 then
				arg_263_1.var_.characterEffect1038.alpha = 1
			end

			local var_266_19 = 0
			local var_266_20 = 0.8

			if var_266_19 < arg_263_1.time_ and arg_263_1.time_ <= var_266_19 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_21 = arg_263_1:FormatText(StoryNameCfg[94].name)

				arg_263_1.leftNameTxt_.text = var_266_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_22 = arg_263_1:GetWordFromCfg(115261065)
				local var_266_23 = arg_263_1:FormatText(var_266_22.content)

				arg_263_1.text_.text = var_266_23

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_24 = 32
				local var_266_25 = utf8.len(var_266_23)
				local var_266_26 = var_266_24 <= 0 and var_266_20 or var_266_20 * (var_266_25 / var_266_24)

				if var_266_26 > 0 and var_266_20 < var_266_26 then
					arg_263_1.talkMaxDuration = var_266_26

					if var_266_26 + var_266_19 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_26 + var_266_19
					end
				end

				arg_263_1.text_.text = var_266_23
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261065", "story_v_out_115261.awb") ~= 0 then
					local var_266_27 = manager.audio:GetVoiceLength("story_v_out_115261", "115261065", "story_v_out_115261.awb") / 1000

					if var_266_27 + var_266_19 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_27 + var_266_19
					end

					if var_266_22.prefab_name ~= "" and arg_263_1.actors_[var_266_22.prefab_name] ~= nil then
						local var_266_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_22.prefab_name].transform, "story_v_out_115261", "115261065", "story_v_out_115261.awb")

						arg_263_1:RecordAudio("115261065", var_266_28)
						arg_263_1:RecordAudio("115261065", var_266_28)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_out_115261", "115261065", "story_v_out_115261.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_out_115261", "115261065", "story_v_out_115261.awb")
				end

				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_29 = math.max(var_266_20, arg_263_1.talkMaxDuration)

			if var_266_19 <= arg_263_1.time_ and arg_263_1.time_ < var_266_19 + var_266_29 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_19) / var_266_29

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_19 + var_266_29 and arg_263_1.time_ < var_266_19 + var_266_29 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play115261066 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 115261066
		arg_267_1.duration_ = 15.433

		local var_267_0 = {
			ja = 7.866,
			ko = 13.4,
			zh = 12.5,
			en = 15.433
		}
		local var_267_1 = manager.audio:GetLocalizationFlag()

		if var_267_0[var_267_1] ~= nil then
			arg_267_1.duration_ = var_267_0[var_267_1]
		end

		SetActive(arg_267_1.tipsGo_, false)

		function arg_267_1.onSingleLineFinish_()
			arg_267_1.onSingleLineUpdate_ = nil
			arg_267_1.onSingleLineFinish_ = nil
			arg_267_1.state_ = "waiting"
		end

		function arg_267_1.playNext_(arg_269_0)
			if arg_269_0 == 1 then
				arg_267_0:Play115261067(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = 0
			local var_270_1 = 1.3

			if var_270_0 < arg_267_1.time_ and arg_267_1.time_ <= var_270_0 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_2 = arg_267_1:FormatText(StoryNameCfg[94].name)

				arg_267_1.leftNameTxt_.text = var_270_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_3 = arg_267_1:GetWordFromCfg(115261066)
				local var_270_4 = arg_267_1:FormatText(var_270_3.content)

				arg_267_1.text_.text = var_270_4

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_5 = 52
				local var_270_6 = utf8.len(var_270_4)
				local var_270_7 = var_270_5 <= 0 and var_270_1 or var_270_1 * (var_270_6 / var_270_5)

				if var_270_7 > 0 and var_270_1 < var_270_7 then
					arg_267_1.talkMaxDuration = var_270_7

					if var_270_7 + var_270_0 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_7 + var_270_0
					end
				end

				arg_267_1.text_.text = var_270_4
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261066", "story_v_out_115261.awb") ~= 0 then
					local var_270_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261066", "story_v_out_115261.awb") / 1000

					if var_270_8 + var_270_0 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_8 + var_270_0
					end

					if var_270_3.prefab_name ~= "" and arg_267_1.actors_[var_270_3.prefab_name] ~= nil then
						local var_270_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_267_1.actors_[var_270_3.prefab_name].transform, "story_v_out_115261", "115261066", "story_v_out_115261.awb")

						arg_267_1:RecordAudio("115261066", var_270_9)
						arg_267_1:RecordAudio("115261066", var_270_9)
					else
						arg_267_1:AudioAction("play", "voice", "story_v_out_115261", "115261066", "story_v_out_115261.awb")
					end

					arg_267_1:RecordHistoryTalkVoice("story_v_out_115261", "115261066", "story_v_out_115261.awb")
				end

				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_10 = math.max(var_270_1, arg_267_1.talkMaxDuration)

			if var_270_0 <= arg_267_1.time_ and arg_267_1.time_ < var_270_0 + var_270_10 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_0) / var_270_10

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_0 + var_270_10 and arg_267_1.time_ < var_270_0 + var_270_10 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play115261067 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 115261067
		arg_271_1.duration_ = 7.5

		local var_271_0 = {
			ja = 6.833,
			ko = 6.866,
			zh = 5.4,
			en = 7.5
		}
		local var_271_1 = manager.audio:GetLocalizationFlag()

		if var_271_0[var_271_1] ~= nil then
			arg_271_1.duration_ = var_271_0[var_271_1]
		end

		SetActive(arg_271_1.tipsGo_, false)

		function arg_271_1.onSingleLineFinish_()
			arg_271_1.onSingleLineUpdate_ = nil
			arg_271_1.onSingleLineFinish_ = nil
			arg_271_1.state_ = "waiting"
		end

		function arg_271_1.playNext_(arg_273_0)
			if arg_273_0 == 1 then
				arg_271_0:Play115261068(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = arg_271_1.actors_["1038"]
			local var_274_1 = 0

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 and arg_271_1.var_.actorSpriteComps1038 == nil then
				arg_271_1.var_.actorSpriteComps1038 = var_274_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_274_2 = 0.2

			if var_274_1 <= arg_271_1.time_ and arg_271_1.time_ < var_274_1 + var_274_2 then
				local var_274_3 = (arg_271_1.time_ - var_274_1) / var_274_2

				if arg_271_1.var_.actorSpriteComps1038 then
					for iter_274_0, iter_274_1 in pairs(arg_271_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_274_1 then
							local var_274_4 = Mathf.Lerp(iter_274_1.color.r, 0.5, var_274_3)

							iter_274_1.color = Color.New(var_274_4, var_274_4, var_274_4)
						end
					end
				end
			end

			if arg_271_1.time_ >= var_274_1 + var_274_2 and arg_271_1.time_ < var_274_1 + var_274_2 + arg_274_0 and arg_271_1.var_.actorSpriteComps1038 then
				local var_274_5 = 0.5

				for iter_274_2, iter_274_3 in pairs(arg_271_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_274_3 then
						iter_274_3.color = Color.New(var_274_5, var_274_5, var_274_5)
					end
				end

				arg_271_1.var_.actorSpriteComps1038 = nil
			end

			local var_274_6 = 0
			local var_274_7 = 0.625

			if var_274_6 < arg_271_1.time_ and arg_271_1.time_ <= var_274_6 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_8 = arg_271_1:FormatText(StoryNameCfg[205].name)

				arg_271_1.leftNameTxt_.text = var_274_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, true)
				arg_271_1.iconController_:SetSelectedState("hero")

				arg_271_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1042")

				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_9 = arg_271_1:GetWordFromCfg(115261067)
				local var_274_10 = arg_271_1:FormatText(var_274_9.content)

				arg_271_1.text_.text = var_274_10

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_11 = 25
				local var_274_12 = utf8.len(var_274_10)
				local var_274_13 = var_274_11 <= 0 and var_274_7 or var_274_7 * (var_274_12 / var_274_11)

				if var_274_13 > 0 and var_274_7 < var_274_13 then
					arg_271_1.talkMaxDuration = var_274_13

					if var_274_13 + var_274_6 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_13 + var_274_6
					end
				end

				arg_271_1.text_.text = var_274_10
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261067", "story_v_out_115261.awb") ~= 0 then
					local var_274_14 = manager.audio:GetVoiceLength("story_v_out_115261", "115261067", "story_v_out_115261.awb") / 1000

					if var_274_14 + var_274_6 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_14 + var_274_6
					end

					if var_274_9.prefab_name ~= "" and arg_271_1.actors_[var_274_9.prefab_name] ~= nil then
						local var_274_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_271_1.actors_[var_274_9.prefab_name].transform, "story_v_out_115261", "115261067", "story_v_out_115261.awb")

						arg_271_1:RecordAudio("115261067", var_274_15)
						arg_271_1:RecordAudio("115261067", var_274_15)
					else
						arg_271_1:AudioAction("play", "voice", "story_v_out_115261", "115261067", "story_v_out_115261.awb")
					end

					arg_271_1:RecordHistoryTalkVoice("story_v_out_115261", "115261067", "story_v_out_115261.awb")
				end

				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_16 = math.max(var_274_7, arg_271_1.talkMaxDuration)

			if var_274_6 <= arg_271_1.time_ and arg_271_1.time_ < var_274_6 + var_274_16 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_6) / var_274_16

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_6 + var_274_16 and arg_271_1.time_ < var_274_6 + var_274_16 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play115261068 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 115261068
		arg_275_1.duration_ = 2.4

		local var_275_0 = {
			ja = 0.999999999999,
			ko = 1.066,
			zh = 2.4,
			en = 0.999999999999
		}
		local var_275_1 = manager.audio:GetLocalizationFlag()

		if var_275_0[var_275_1] ~= nil then
			arg_275_1.duration_ = var_275_0[var_275_1]
		end

		SetActive(arg_275_1.tipsGo_, false)

		function arg_275_1.onSingleLineFinish_()
			arg_275_1.onSingleLineUpdate_ = nil
			arg_275_1.onSingleLineFinish_ = nil
			arg_275_1.state_ = "waiting"
		end

		function arg_275_1.playNext_(arg_277_0)
			if arg_277_0 == 1 then
				arg_275_0:Play115261069(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = arg_275_1.actors_["1038"]
			local var_278_1 = 0

			if var_278_1 < arg_275_1.time_ and arg_275_1.time_ <= var_278_1 + arg_278_0 and arg_275_1.var_.actorSpriteComps1038 == nil then
				arg_275_1.var_.actorSpriteComps1038 = var_278_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_278_2 = 0.2

			if var_278_1 <= arg_275_1.time_ and arg_275_1.time_ < var_278_1 + var_278_2 then
				local var_278_3 = (arg_275_1.time_ - var_278_1) / var_278_2

				if arg_275_1.var_.actorSpriteComps1038 then
					for iter_278_0, iter_278_1 in pairs(arg_275_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_278_1 then
							local var_278_4 = Mathf.Lerp(iter_278_1.color.r, 1, var_278_3)

							iter_278_1.color = Color.New(var_278_4, var_278_4, var_278_4)
						end
					end
				end
			end

			if arg_275_1.time_ >= var_278_1 + var_278_2 and arg_275_1.time_ < var_278_1 + var_278_2 + arg_278_0 and arg_275_1.var_.actorSpriteComps1038 then
				local var_278_5 = 1

				for iter_278_2, iter_278_3 in pairs(arg_275_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_278_3 then
						iter_278_3.color = Color.New(var_278_5, var_278_5, var_278_5)
					end
				end

				arg_275_1.var_.actorSpriteComps1038 = nil
			end

			local var_278_6 = arg_275_1.actors_["1038"].transform
			local var_278_7 = 0

			if var_278_7 < arg_275_1.time_ and arg_275_1.time_ <= var_278_7 + arg_278_0 then
				arg_275_1.var_.moveOldPos1038 = var_278_6.localPosition
				var_278_6.localScale = Vector3.New(1, 1, 1)

				arg_275_1:CheckSpriteTmpPos("1038", 3)

				local var_278_8 = var_278_6.childCount

				for iter_278_4 = 0, var_278_8 - 1 do
					local var_278_9 = var_278_6:GetChild(iter_278_4)

					if var_278_9.name == "split_9" or not string.find(var_278_9.name, "split") then
						var_278_9.gameObject:SetActive(true)
					else
						var_278_9.gameObject:SetActive(false)
					end
				end
			end

			local var_278_10 = 0.001

			if var_278_7 <= arg_275_1.time_ and arg_275_1.time_ < var_278_7 + var_278_10 then
				local var_278_11 = (arg_275_1.time_ - var_278_7) / var_278_10
				local var_278_12 = Vector3.New(0, -400, 0)

				var_278_6.localPosition = Vector3.Lerp(arg_275_1.var_.moveOldPos1038, var_278_12, var_278_11)
			end

			if arg_275_1.time_ >= var_278_7 + var_278_10 and arg_275_1.time_ < var_278_7 + var_278_10 + arg_278_0 then
				var_278_6.localPosition = Vector3.New(0, -400, 0)
			end

			local var_278_13 = 0
			local var_278_14 = 0.05

			if var_278_13 < arg_275_1.time_ and arg_275_1.time_ <= var_278_13 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_15 = arg_275_1:FormatText(StoryNameCfg[94].name)

				arg_275_1.leftNameTxt_.text = var_278_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_16 = arg_275_1:GetWordFromCfg(115261068)
				local var_278_17 = arg_275_1:FormatText(var_278_16.content)

				arg_275_1.text_.text = var_278_17

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_18 = 2
				local var_278_19 = utf8.len(var_278_17)
				local var_278_20 = var_278_18 <= 0 and var_278_14 or var_278_14 * (var_278_19 / var_278_18)

				if var_278_20 > 0 and var_278_14 < var_278_20 then
					arg_275_1.talkMaxDuration = var_278_20

					if var_278_20 + var_278_13 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_20 + var_278_13
					end
				end

				arg_275_1.text_.text = var_278_17
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261068", "story_v_out_115261.awb") ~= 0 then
					local var_278_21 = manager.audio:GetVoiceLength("story_v_out_115261", "115261068", "story_v_out_115261.awb") / 1000

					if var_278_21 + var_278_13 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_21 + var_278_13
					end

					if var_278_16.prefab_name ~= "" and arg_275_1.actors_[var_278_16.prefab_name] ~= nil then
						local var_278_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_275_1.actors_[var_278_16.prefab_name].transform, "story_v_out_115261", "115261068", "story_v_out_115261.awb")

						arg_275_1:RecordAudio("115261068", var_278_22)
						arg_275_1:RecordAudio("115261068", var_278_22)
					else
						arg_275_1:AudioAction("play", "voice", "story_v_out_115261", "115261068", "story_v_out_115261.awb")
					end

					arg_275_1:RecordHistoryTalkVoice("story_v_out_115261", "115261068", "story_v_out_115261.awb")
				end

				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_23 = math.max(var_278_14, arg_275_1.talkMaxDuration)

			if var_278_13 <= arg_275_1.time_ and arg_275_1.time_ < var_278_13 + var_278_23 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_13) / var_278_23

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_13 + var_278_23 and arg_275_1.time_ < var_278_13 + var_278_23 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play115261069 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 115261069
		arg_279_1.duration_ = 4.4

		local var_279_0 = {
			ja = 3.333,
			ko = 3.433,
			zh = 4.4,
			en = 3.5
		}
		local var_279_1 = manager.audio:GetLocalizationFlag()

		if var_279_0[var_279_1] ~= nil then
			arg_279_1.duration_ = var_279_0[var_279_1]
		end

		SetActive(arg_279_1.tipsGo_, false)

		function arg_279_1.onSingleLineFinish_()
			arg_279_1.onSingleLineUpdate_ = nil
			arg_279_1.onSingleLineFinish_ = nil
			arg_279_1.state_ = "waiting"
		end

		function arg_279_1.playNext_(arg_281_0)
			if arg_281_0 == 1 then
				arg_279_0:Play115261070(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = 0
			local var_282_1 = 0.375

			if var_282_0 < arg_279_1.time_ and arg_279_1.time_ <= var_282_0 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_2 = arg_279_1:FormatText(StoryNameCfg[94].name)

				arg_279_1.leftNameTxt_.text = var_282_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_3 = arg_279_1:GetWordFromCfg(115261069)
				local var_282_4 = arg_279_1:FormatText(var_282_3.content)

				arg_279_1.text_.text = var_282_4

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_5 = 15
				local var_282_6 = utf8.len(var_282_4)
				local var_282_7 = var_282_5 <= 0 and var_282_1 or var_282_1 * (var_282_6 / var_282_5)

				if var_282_7 > 0 and var_282_1 < var_282_7 then
					arg_279_1.talkMaxDuration = var_282_7

					if var_282_7 + var_282_0 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_7 + var_282_0
					end
				end

				arg_279_1.text_.text = var_282_4
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261069", "story_v_out_115261.awb") ~= 0 then
					local var_282_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261069", "story_v_out_115261.awb") / 1000

					if var_282_8 + var_282_0 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_8 + var_282_0
					end

					if var_282_3.prefab_name ~= "" and arg_279_1.actors_[var_282_3.prefab_name] ~= nil then
						local var_282_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_279_1.actors_[var_282_3.prefab_name].transform, "story_v_out_115261", "115261069", "story_v_out_115261.awb")

						arg_279_1:RecordAudio("115261069", var_282_9)
						arg_279_1:RecordAudio("115261069", var_282_9)
					else
						arg_279_1:AudioAction("play", "voice", "story_v_out_115261", "115261069", "story_v_out_115261.awb")
					end

					arg_279_1:RecordHistoryTalkVoice("story_v_out_115261", "115261069", "story_v_out_115261.awb")
				end

				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_10 = math.max(var_282_1, arg_279_1.talkMaxDuration)

			if var_282_0 <= arg_279_1.time_ and arg_279_1.time_ < var_282_0 + var_282_10 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_0) / var_282_10

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_0 + var_282_10 and arg_279_1.time_ < var_282_0 + var_282_10 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play115261070 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 115261070
		arg_283_1.duration_ = 5

		SetActive(arg_283_1.tipsGo_, false)

		function arg_283_1.onSingleLineFinish_()
			arg_283_1.onSingleLineUpdate_ = nil
			arg_283_1.onSingleLineFinish_ = nil
			arg_283_1.state_ = "waiting"
		end

		function arg_283_1.playNext_(arg_285_0)
			if arg_285_0 == 1 then
				arg_283_0:Play115261071(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = arg_283_1.actors_["1038"]
			local var_286_1 = 0

			if var_286_1 < arg_283_1.time_ and arg_283_1.time_ <= var_286_1 + arg_286_0 then
				local var_286_2 = var_286_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_286_2 then
					arg_283_1.var_.alphaOldValue1038 = var_286_2.alpha
					arg_283_1.var_.characterEffect1038 = var_286_2
				end

				arg_283_1.var_.alphaOldValue1038 = 1
			end

			local var_286_3 = 0.333333333333333

			if var_286_1 <= arg_283_1.time_ and arg_283_1.time_ < var_286_1 + var_286_3 then
				local var_286_4 = (arg_283_1.time_ - var_286_1) / var_286_3
				local var_286_5 = Mathf.Lerp(arg_283_1.var_.alphaOldValue1038, 0, var_286_4)

				if arg_283_1.var_.characterEffect1038 then
					arg_283_1.var_.characterEffect1038.alpha = var_286_5
				end
			end

			if arg_283_1.time_ >= var_286_1 + var_286_3 and arg_283_1.time_ < var_286_1 + var_286_3 + arg_286_0 and arg_283_1.var_.characterEffect1038 then
				arg_283_1.var_.characterEffect1038.alpha = 0
			end

			local var_286_6 = 0
			local var_286_7 = 0.925

			if var_286_6 < arg_283_1.time_ and arg_283_1.time_ <= var_286_6 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, false)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_8 = arg_283_1:GetWordFromCfg(115261070)
				local var_286_9 = arg_283_1:FormatText(var_286_8.content)

				arg_283_1.text_.text = var_286_9

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_10 = 37
				local var_286_11 = utf8.len(var_286_9)
				local var_286_12 = var_286_10 <= 0 and var_286_7 or var_286_7 * (var_286_11 / var_286_10)

				if var_286_12 > 0 and var_286_7 < var_286_12 then
					arg_283_1.talkMaxDuration = var_286_12

					if var_286_12 + var_286_6 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_12 + var_286_6
					end
				end

				arg_283_1.text_.text = var_286_9
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)
				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_13 = math.max(var_286_7, arg_283_1.talkMaxDuration)

			if var_286_6 <= arg_283_1.time_ and arg_283_1.time_ < var_286_6 + var_286_13 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_6) / var_286_13

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_6 + var_286_13 and arg_283_1.time_ < var_286_6 + var_286_13 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play115261071 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 115261071
		arg_287_1.duration_ = 7.733

		local var_287_0 = {
			ja = 5.433,
			ko = 5.733,
			zh = 7.733,
			en = 6.666
		}
		local var_287_1 = manager.audio:GetLocalizationFlag()

		if var_287_0[var_287_1] ~= nil then
			arg_287_1.duration_ = var_287_0[var_287_1]
		end

		SetActive(arg_287_1.tipsGo_, false)

		function arg_287_1.onSingleLineFinish_()
			arg_287_1.onSingleLineUpdate_ = nil
			arg_287_1.onSingleLineFinish_ = nil
			arg_287_1.state_ = "waiting"
		end

		function arg_287_1.playNext_(arg_289_0)
			if arg_289_0 == 1 then
				arg_287_0:Play115261072(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = arg_287_1.actors_["1038"].transform
			local var_290_1 = 0

			if var_290_1 < arg_287_1.time_ and arg_287_1.time_ <= var_290_1 + arg_290_0 then
				arg_287_1.var_.moveOldPos1038 = var_290_0.localPosition
				var_290_0.localScale = Vector3.New(1, 1, 1)

				arg_287_1:CheckSpriteTmpPos("1038", 3)

				local var_290_2 = var_290_0.childCount

				for iter_290_0 = 0, var_290_2 - 1 do
					local var_290_3 = var_290_0:GetChild(iter_290_0)

					if var_290_3.name == "split_1" or not string.find(var_290_3.name, "split") then
						var_290_3.gameObject:SetActive(true)
					else
						var_290_3.gameObject:SetActive(false)
					end
				end
			end

			local var_290_4 = 0.001

			if var_290_1 <= arg_287_1.time_ and arg_287_1.time_ < var_290_1 + var_290_4 then
				local var_290_5 = (arg_287_1.time_ - var_290_1) / var_290_4
				local var_290_6 = Vector3.New(0, -400, 0)

				var_290_0.localPosition = Vector3.Lerp(arg_287_1.var_.moveOldPos1038, var_290_6, var_290_5)
			end

			if arg_287_1.time_ >= var_290_1 + var_290_4 and arg_287_1.time_ < var_290_1 + var_290_4 + arg_290_0 then
				var_290_0.localPosition = Vector3.New(0, -400, 0)
			end

			local var_290_7 = arg_287_1.actors_["1038"]
			local var_290_8 = 0

			if var_290_8 < arg_287_1.time_ and arg_287_1.time_ <= var_290_8 + arg_290_0 and arg_287_1.var_.actorSpriteComps1038 == nil then
				arg_287_1.var_.actorSpriteComps1038 = var_290_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_290_9 = 0.2

			if var_290_8 <= arg_287_1.time_ and arg_287_1.time_ < var_290_8 + var_290_9 then
				local var_290_10 = (arg_287_1.time_ - var_290_8) / var_290_9

				if arg_287_1.var_.actorSpriteComps1038 then
					for iter_290_1, iter_290_2 in pairs(arg_287_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_290_2 then
							local var_290_11 = Mathf.Lerp(iter_290_2.color.r, 1, var_290_10)

							iter_290_2.color = Color.New(var_290_11, var_290_11, var_290_11)
						end
					end
				end
			end

			if arg_287_1.time_ >= var_290_8 + var_290_9 and arg_287_1.time_ < var_290_8 + var_290_9 + arg_290_0 and arg_287_1.var_.actorSpriteComps1038 then
				local var_290_12 = 1

				for iter_290_3, iter_290_4 in pairs(arg_287_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_290_4 then
						iter_290_4.color = Color.New(var_290_12, var_290_12, var_290_12)
					end
				end

				arg_287_1.var_.actorSpriteComps1038 = nil
			end

			local var_290_13 = arg_287_1.actors_["1038"]
			local var_290_14 = 0

			if var_290_14 < arg_287_1.time_ and arg_287_1.time_ <= var_290_14 + arg_290_0 then
				local var_290_15 = var_290_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_290_15 then
					arg_287_1.var_.alphaOldValue1038 = var_290_15.alpha
					arg_287_1.var_.characterEffect1038 = var_290_15
				end

				arg_287_1.var_.alphaOldValue1038 = 0
			end

			local var_290_16 = 0.5

			if var_290_14 <= arg_287_1.time_ and arg_287_1.time_ < var_290_14 + var_290_16 then
				local var_290_17 = (arg_287_1.time_ - var_290_14) / var_290_16
				local var_290_18 = Mathf.Lerp(arg_287_1.var_.alphaOldValue1038, 1, var_290_17)

				if arg_287_1.var_.characterEffect1038 then
					arg_287_1.var_.characterEffect1038.alpha = var_290_18
				end
			end

			if arg_287_1.time_ >= var_290_14 + var_290_16 and arg_287_1.time_ < var_290_14 + var_290_16 + arg_290_0 and arg_287_1.var_.characterEffect1038 then
				arg_287_1.var_.characterEffect1038.alpha = 1
			end

			local var_290_19 = 0
			local var_290_20 = 0.75

			if var_290_19 < arg_287_1.time_ and arg_287_1.time_ <= var_290_19 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, true)

				local var_290_21 = arg_287_1:FormatText(StoryNameCfg[94].name)

				arg_287_1.leftNameTxt_.text = var_290_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_287_1.leftNameTxt_.transform)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1.leftNameTxt_.text)
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_22 = arg_287_1:GetWordFromCfg(115261071)
				local var_290_23 = arg_287_1:FormatText(var_290_22.content)

				arg_287_1.text_.text = var_290_23

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_24 = 30
				local var_290_25 = utf8.len(var_290_23)
				local var_290_26 = var_290_24 <= 0 and var_290_20 or var_290_20 * (var_290_25 / var_290_24)

				if var_290_26 > 0 and var_290_20 < var_290_26 then
					arg_287_1.talkMaxDuration = var_290_26

					if var_290_26 + var_290_19 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_26 + var_290_19
					end
				end

				arg_287_1.text_.text = var_290_23
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261071", "story_v_out_115261.awb") ~= 0 then
					local var_290_27 = manager.audio:GetVoiceLength("story_v_out_115261", "115261071", "story_v_out_115261.awb") / 1000

					if var_290_27 + var_290_19 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_27 + var_290_19
					end

					if var_290_22.prefab_name ~= "" and arg_287_1.actors_[var_290_22.prefab_name] ~= nil then
						local var_290_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_287_1.actors_[var_290_22.prefab_name].transform, "story_v_out_115261", "115261071", "story_v_out_115261.awb")

						arg_287_1:RecordAudio("115261071", var_290_28)
						arg_287_1:RecordAudio("115261071", var_290_28)
					else
						arg_287_1:AudioAction("play", "voice", "story_v_out_115261", "115261071", "story_v_out_115261.awb")
					end

					arg_287_1:RecordHistoryTalkVoice("story_v_out_115261", "115261071", "story_v_out_115261.awb")
				end

				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_29 = math.max(var_290_20, arg_287_1.talkMaxDuration)

			if var_290_19 <= arg_287_1.time_ and arg_287_1.time_ < var_290_19 + var_290_29 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_19) / var_290_29

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_19 + var_290_29 and arg_287_1.time_ < var_290_19 + var_290_29 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play115261072 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 115261072
		arg_291_1.duration_ = 5

		SetActive(arg_291_1.tipsGo_, false)

		function arg_291_1.onSingleLineFinish_()
			arg_291_1.onSingleLineUpdate_ = nil
			arg_291_1.onSingleLineFinish_ = nil
			arg_291_1.state_ = "waiting"
		end

		function arg_291_1.playNext_(arg_293_0)
			if arg_293_0 == 1 then
				arg_291_0:Play115261073(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = arg_291_1.actors_["1038"]
			local var_294_1 = 0

			if var_294_1 < arg_291_1.time_ and arg_291_1.time_ <= var_294_1 + arg_294_0 then
				local var_294_2 = var_294_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_294_2 then
					arg_291_1.var_.alphaOldValue1038 = var_294_2.alpha
					arg_291_1.var_.characterEffect1038 = var_294_2
				end

				arg_291_1.var_.alphaOldValue1038 = 1
			end

			local var_294_3 = 0.333333333333333

			if var_294_1 <= arg_291_1.time_ and arg_291_1.time_ < var_294_1 + var_294_3 then
				local var_294_4 = (arg_291_1.time_ - var_294_1) / var_294_3
				local var_294_5 = Mathf.Lerp(arg_291_1.var_.alphaOldValue1038, 0, var_294_4)

				if arg_291_1.var_.characterEffect1038 then
					arg_291_1.var_.characterEffect1038.alpha = var_294_5
				end
			end

			if arg_291_1.time_ >= var_294_1 + var_294_3 and arg_291_1.time_ < var_294_1 + var_294_3 + arg_294_0 and arg_291_1.var_.characterEffect1038 then
				arg_291_1.var_.characterEffect1038.alpha = 0
			end

			local var_294_6 = 0
			local var_294_7 = 0.3

			if var_294_6 < arg_291_1.time_ and arg_291_1.time_ <= var_294_6 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, false)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_8 = arg_291_1:GetWordFromCfg(115261072)
				local var_294_9 = arg_291_1:FormatText(var_294_8.content)

				arg_291_1.text_.text = var_294_9

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_10 = 12
				local var_294_11 = utf8.len(var_294_9)
				local var_294_12 = var_294_10 <= 0 and var_294_7 or var_294_7 * (var_294_11 / var_294_10)

				if var_294_12 > 0 and var_294_7 < var_294_12 then
					arg_291_1.talkMaxDuration = var_294_12

					if var_294_12 + var_294_6 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_12 + var_294_6
					end
				end

				arg_291_1.text_.text = var_294_9
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)
				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_13 = math.max(var_294_7, arg_291_1.talkMaxDuration)

			if var_294_6 <= arg_291_1.time_ and arg_291_1.time_ < var_294_6 + var_294_13 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_6) / var_294_13

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_6 + var_294_13 and arg_291_1.time_ < var_294_6 + var_294_13 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play115261073 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 115261073
		arg_295_1.duration_ = 4.133

		local var_295_0 = {
			ja = 4.133,
			ko = 2.666,
			zh = 3.166,
			en = 2.333
		}
		local var_295_1 = manager.audio:GetLocalizationFlag()

		if var_295_0[var_295_1] ~= nil then
			arg_295_1.duration_ = var_295_0[var_295_1]
		end

		SetActive(arg_295_1.tipsGo_, false)

		function arg_295_1.onSingleLineFinish_()
			arg_295_1.onSingleLineUpdate_ = nil
			arg_295_1.onSingleLineFinish_ = nil
			arg_295_1.state_ = "waiting"
		end

		function arg_295_1.playNext_(arg_297_0)
			if arg_297_0 == 1 then
				arg_295_0:Play115261074(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = arg_295_1.actors_["1038"].transform
			local var_298_1 = 0

			if var_298_1 < arg_295_1.time_ and arg_295_1.time_ <= var_298_1 + arg_298_0 then
				arg_295_1.var_.moveOldPos1038 = var_298_0.localPosition
				var_298_0.localScale = Vector3.New(1, 1, 1)

				arg_295_1:CheckSpriteTmpPos("1038", 2)

				local var_298_2 = var_298_0.childCount

				for iter_298_0 = 0, var_298_2 - 1 do
					local var_298_3 = var_298_0:GetChild(iter_298_0)

					if var_298_3.name == "split_1" or not string.find(var_298_3.name, "split") then
						var_298_3.gameObject:SetActive(true)
					else
						var_298_3.gameObject:SetActive(false)
					end
				end
			end

			local var_298_4 = 0.001

			if var_298_1 <= arg_295_1.time_ and arg_295_1.time_ < var_298_1 + var_298_4 then
				local var_298_5 = (arg_295_1.time_ - var_298_1) / var_298_4
				local var_298_6 = Vector3.New(-390, -400, 0)

				var_298_0.localPosition = Vector3.Lerp(arg_295_1.var_.moveOldPos1038, var_298_6, var_298_5)
			end

			if arg_295_1.time_ >= var_298_1 + var_298_4 and arg_295_1.time_ < var_298_1 + var_298_4 + arg_298_0 then
				var_298_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_298_7 = arg_295_1.actors_["1038"]
			local var_298_8 = 0

			if var_298_8 < arg_295_1.time_ and arg_295_1.time_ <= var_298_8 + arg_298_0 and arg_295_1.var_.actorSpriteComps1038 == nil then
				arg_295_1.var_.actorSpriteComps1038 = var_298_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_298_9 = 0.2

			if var_298_8 <= arg_295_1.time_ and arg_295_1.time_ < var_298_8 + var_298_9 then
				local var_298_10 = (arg_295_1.time_ - var_298_8) / var_298_9

				if arg_295_1.var_.actorSpriteComps1038 then
					for iter_298_1, iter_298_2 in pairs(arg_295_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_298_2 then
							local var_298_11 = Mathf.Lerp(iter_298_2.color.r, 1, var_298_10)

							iter_298_2.color = Color.New(var_298_11, var_298_11, var_298_11)
						end
					end
				end
			end

			if arg_295_1.time_ >= var_298_8 + var_298_9 and arg_295_1.time_ < var_298_8 + var_298_9 + arg_298_0 and arg_295_1.var_.actorSpriteComps1038 then
				local var_298_12 = 1

				for iter_298_3, iter_298_4 in pairs(arg_295_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_298_4 then
						iter_298_4.color = Color.New(var_298_12, var_298_12, var_298_12)
					end
				end

				arg_295_1.var_.actorSpriteComps1038 = nil
			end

			local var_298_13 = arg_295_1.actors_["1038"]
			local var_298_14 = 0

			if var_298_14 < arg_295_1.time_ and arg_295_1.time_ <= var_298_14 + arg_298_0 then
				local var_298_15 = var_298_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_298_15 then
					arg_295_1.var_.alphaOldValue1038 = var_298_15.alpha
					arg_295_1.var_.characterEffect1038 = var_298_15
				end

				arg_295_1.var_.alphaOldValue1038 = 0
			end

			local var_298_16 = 0.5

			if var_298_14 <= arg_295_1.time_ and arg_295_1.time_ < var_298_14 + var_298_16 then
				local var_298_17 = (arg_295_1.time_ - var_298_14) / var_298_16
				local var_298_18 = Mathf.Lerp(arg_295_1.var_.alphaOldValue1038, 1, var_298_17)

				if arg_295_1.var_.characterEffect1038 then
					arg_295_1.var_.characterEffect1038.alpha = var_298_18
				end
			end

			if arg_295_1.time_ >= var_298_14 + var_298_16 and arg_295_1.time_ < var_298_14 + var_298_16 + arg_298_0 and arg_295_1.var_.characterEffect1038 then
				arg_295_1.var_.characterEffect1038.alpha = 1
			end

			local var_298_19 = arg_295_1.actors_["10030"].transform
			local var_298_20 = 0

			if var_298_20 < arg_295_1.time_ and arg_295_1.time_ <= var_298_20 + arg_298_0 then
				arg_295_1.var_.moveOldPos10030 = var_298_19.localPosition
				var_298_19.localScale = Vector3.New(1, 1, 1)

				arg_295_1:CheckSpriteTmpPos("10030", 4)

				local var_298_21 = var_298_19.childCount

				for iter_298_5 = 0, var_298_21 - 1 do
					local var_298_22 = var_298_19:GetChild(iter_298_5)

					if var_298_22.name == "split_1" or not string.find(var_298_22.name, "split") then
						var_298_22.gameObject:SetActive(true)
					else
						var_298_22.gameObject:SetActive(false)
					end
				end
			end

			local var_298_23 = 0.001

			if var_298_20 <= arg_295_1.time_ and arg_295_1.time_ < var_298_20 + var_298_23 then
				local var_298_24 = (arg_295_1.time_ - var_298_20) / var_298_23
				local var_298_25 = Vector3.New(390, -390, 150)

				var_298_19.localPosition = Vector3.Lerp(arg_295_1.var_.moveOldPos10030, var_298_25, var_298_24)
			end

			if arg_295_1.time_ >= var_298_20 + var_298_23 and arg_295_1.time_ < var_298_20 + var_298_23 + arg_298_0 then
				var_298_19.localPosition = Vector3.New(390, -390, 150)
			end

			local var_298_26 = arg_295_1.actors_["10030"]
			local var_298_27 = 0

			if var_298_27 < arg_295_1.time_ and arg_295_1.time_ <= var_298_27 + arg_298_0 then
				local var_298_28 = var_298_26:GetComponentInChildren(typeof(CanvasGroup))

				if var_298_28 then
					arg_295_1.var_.alphaOldValue10030 = var_298_28.alpha
					arg_295_1.var_.characterEffect10030 = var_298_28
				end

				arg_295_1.var_.alphaOldValue10030 = 0
			end

			local var_298_29 = 0.5

			if var_298_27 <= arg_295_1.time_ and arg_295_1.time_ < var_298_27 + var_298_29 then
				local var_298_30 = (arg_295_1.time_ - var_298_27) / var_298_29
				local var_298_31 = Mathf.Lerp(arg_295_1.var_.alphaOldValue10030, 1, var_298_30)

				if arg_295_1.var_.characterEffect10030 then
					arg_295_1.var_.characterEffect10030.alpha = var_298_31
				end
			end

			if arg_295_1.time_ >= var_298_27 + var_298_29 and arg_295_1.time_ < var_298_27 + var_298_29 + arg_298_0 and arg_295_1.var_.characterEffect10030 then
				arg_295_1.var_.characterEffect10030.alpha = 1
			end

			local var_298_32 = arg_295_1.actors_["10030"]
			local var_298_33 = 0

			if var_298_33 < arg_295_1.time_ and arg_295_1.time_ <= var_298_33 + arg_298_0 and arg_295_1.var_.actorSpriteComps10030 == nil then
				arg_295_1.var_.actorSpriteComps10030 = var_298_32:GetComponentsInChildren(typeof(Image), true)
			end

			local var_298_34 = 0.2

			if var_298_33 <= arg_295_1.time_ and arg_295_1.time_ < var_298_33 + var_298_34 then
				local var_298_35 = (arg_295_1.time_ - var_298_33) / var_298_34

				if arg_295_1.var_.actorSpriteComps10030 then
					for iter_298_6, iter_298_7 in pairs(arg_295_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_298_7 then
							local var_298_36 = Mathf.Lerp(iter_298_7.color.r, 0.5, var_298_35)

							iter_298_7.color = Color.New(var_298_36, var_298_36, var_298_36)
						end
					end
				end
			end

			if arg_295_1.time_ >= var_298_33 + var_298_34 and arg_295_1.time_ < var_298_33 + var_298_34 + arg_298_0 and arg_295_1.var_.actorSpriteComps10030 then
				local var_298_37 = 0.5

				for iter_298_8, iter_298_9 in pairs(arg_295_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_298_9 then
						iter_298_9.color = Color.New(var_298_37, var_298_37, var_298_37)
					end
				end

				arg_295_1.var_.actorSpriteComps10030 = nil
			end

			local var_298_38 = 0
			local var_298_39 = 0.275

			if var_298_38 < arg_295_1.time_ and arg_295_1.time_ <= var_298_38 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, true)

				local var_298_40 = arg_295_1:FormatText(StoryNameCfg[94].name)

				arg_295_1.leftNameTxt_.text = var_298_40

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_295_1.leftNameTxt_.transform)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1.leftNameTxt_.text)
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_41 = arg_295_1:GetWordFromCfg(115261073)
				local var_298_42 = arg_295_1:FormatText(var_298_41.content)

				arg_295_1.text_.text = var_298_42

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_43 = 11
				local var_298_44 = utf8.len(var_298_42)
				local var_298_45 = var_298_43 <= 0 and var_298_39 or var_298_39 * (var_298_44 / var_298_43)

				if var_298_45 > 0 and var_298_39 < var_298_45 then
					arg_295_1.talkMaxDuration = var_298_45

					if var_298_45 + var_298_38 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_45 + var_298_38
					end
				end

				arg_295_1.text_.text = var_298_42
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261073", "story_v_out_115261.awb") ~= 0 then
					local var_298_46 = manager.audio:GetVoiceLength("story_v_out_115261", "115261073", "story_v_out_115261.awb") / 1000

					if var_298_46 + var_298_38 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_46 + var_298_38
					end

					if var_298_41.prefab_name ~= "" and arg_295_1.actors_[var_298_41.prefab_name] ~= nil then
						local var_298_47 = LuaForUtil.PlayVoiceWithCriLipsync(arg_295_1.actors_[var_298_41.prefab_name].transform, "story_v_out_115261", "115261073", "story_v_out_115261.awb")

						arg_295_1:RecordAudio("115261073", var_298_47)
						arg_295_1:RecordAudio("115261073", var_298_47)
					else
						arg_295_1:AudioAction("play", "voice", "story_v_out_115261", "115261073", "story_v_out_115261.awb")
					end

					arg_295_1:RecordHistoryTalkVoice("story_v_out_115261", "115261073", "story_v_out_115261.awb")
				end

				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_48 = math.max(var_298_39, arg_295_1.talkMaxDuration)

			if var_298_38 <= arg_295_1.time_ and arg_295_1.time_ < var_298_38 + var_298_48 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_38) / var_298_48

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_38 + var_298_48 and arg_295_1.time_ < var_298_38 + var_298_48 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play115261074 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 115261074
		arg_299_1.duration_ = 19.033

		local var_299_0 = {
			ja = 12.5,
			ko = 8.166,
			zh = 7.9,
			en = 19.033
		}
		local var_299_1 = manager.audio:GetLocalizationFlag()

		if var_299_0[var_299_1] ~= nil then
			arg_299_1.duration_ = var_299_0[var_299_1]
		end

		SetActive(arg_299_1.tipsGo_, false)

		function arg_299_1.onSingleLineFinish_()
			arg_299_1.onSingleLineUpdate_ = nil
			arg_299_1.onSingleLineFinish_ = nil
			arg_299_1.state_ = "waiting"
		end

		function arg_299_1.playNext_(arg_301_0)
			if arg_301_0 == 1 then
				arg_299_0:Play115261075(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = 0
			local var_302_1 = 0.875

			if var_302_0 < arg_299_1.time_ and arg_299_1.time_ <= var_302_0 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_2 = arg_299_1:FormatText(StoryNameCfg[94].name)

				arg_299_1.leftNameTxt_.text = var_302_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_3 = arg_299_1:GetWordFromCfg(115261074)
				local var_302_4 = arg_299_1:FormatText(var_302_3.content)

				arg_299_1.text_.text = var_302_4

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_5 = 35
				local var_302_6 = utf8.len(var_302_4)
				local var_302_7 = var_302_5 <= 0 and var_302_1 or var_302_1 * (var_302_6 / var_302_5)

				if var_302_7 > 0 and var_302_1 < var_302_7 then
					arg_299_1.talkMaxDuration = var_302_7

					if var_302_7 + var_302_0 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_7 + var_302_0
					end
				end

				arg_299_1.text_.text = var_302_4
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261074", "story_v_out_115261.awb") ~= 0 then
					local var_302_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261074", "story_v_out_115261.awb") / 1000

					if var_302_8 + var_302_0 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_8 + var_302_0
					end

					if var_302_3.prefab_name ~= "" and arg_299_1.actors_[var_302_3.prefab_name] ~= nil then
						local var_302_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_299_1.actors_[var_302_3.prefab_name].transform, "story_v_out_115261", "115261074", "story_v_out_115261.awb")

						arg_299_1:RecordAudio("115261074", var_302_9)
						arg_299_1:RecordAudio("115261074", var_302_9)
					else
						arg_299_1:AudioAction("play", "voice", "story_v_out_115261", "115261074", "story_v_out_115261.awb")
					end

					arg_299_1:RecordHistoryTalkVoice("story_v_out_115261", "115261074", "story_v_out_115261.awb")
				end

				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_10 = math.max(var_302_1, arg_299_1.talkMaxDuration)

			if var_302_0 <= arg_299_1.time_ and arg_299_1.time_ < var_302_0 + var_302_10 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_0) / var_302_10

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_0 + var_302_10 and arg_299_1.time_ < var_302_0 + var_302_10 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play115261075 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 115261075
		arg_303_1.duration_ = 3.833

		local var_303_0 = {
			ja = 2.7,
			ko = 2.8,
			zh = 3.333,
			en = 3.833
		}
		local var_303_1 = manager.audio:GetLocalizationFlag()

		if var_303_0[var_303_1] ~= nil then
			arg_303_1.duration_ = var_303_0[var_303_1]
		end

		SetActive(arg_303_1.tipsGo_, false)

		function arg_303_1.onSingleLineFinish_()
			arg_303_1.onSingleLineUpdate_ = nil
			arg_303_1.onSingleLineFinish_ = nil
			arg_303_1.state_ = "waiting"
		end

		function arg_303_1.playNext_(arg_305_0)
			if arg_305_0 == 1 then
				arg_303_0:Play115261076(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = arg_303_1.actors_["1038"].transform
			local var_306_1 = 0

			if var_306_1 < arg_303_1.time_ and arg_303_1.time_ <= var_306_1 + arg_306_0 then
				arg_303_1.var_.moveOldPos1038 = var_306_0.localPosition
				var_306_0.localScale = Vector3.New(1, 1, 1)

				arg_303_1:CheckSpriteTmpPos("1038", 2)

				local var_306_2 = var_306_0.childCount

				for iter_306_0 = 0, var_306_2 - 1 do
					local var_306_3 = var_306_0:GetChild(iter_306_0)

					if var_306_3.name == "split_1" or not string.find(var_306_3.name, "split") then
						var_306_3.gameObject:SetActive(true)
					else
						var_306_3.gameObject:SetActive(false)
					end
				end
			end

			local var_306_4 = 0.001

			if var_306_1 <= arg_303_1.time_ and arg_303_1.time_ < var_306_1 + var_306_4 then
				local var_306_5 = (arg_303_1.time_ - var_306_1) / var_306_4
				local var_306_6 = Vector3.New(-390, -400, 0)

				var_306_0.localPosition = Vector3.Lerp(arg_303_1.var_.moveOldPos1038, var_306_6, var_306_5)
			end

			if arg_303_1.time_ >= var_306_1 + var_306_4 and arg_303_1.time_ < var_306_1 + var_306_4 + arg_306_0 then
				var_306_0.localPosition = Vector3.New(-390, -400, 0)
			end

			local var_306_7 = arg_303_1.actors_["1038"]
			local var_306_8 = 0

			if var_306_8 < arg_303_1.time_ and arg_303_1.time_ <= var_306_8 + arg_306_0 and arg_303_1.var_.actorSpriteComps1038 == nil then
				arg_303_1.var_.actorSpriteComps1038 = var_306_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_306_9 = 0.2

			if var_306_8 <= arg_303_1.time_ and arg_303_1.time_ < var_306_8 + var_306_9 then
				local var_306_10 = (arg_303_1.time_ - var_306_8) / var_306_9

				if arg_303_1.var_.actorSpriteComps1038 then
					for iter_306_1, iter_306_2 in pairs(arg_303_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_306_2 then
							local var_306_11 = Mathf.Lerp(iter_306_2.color.r, 0.5, var_306_10)

							iter_306_2.color = Color.New(var_306_11, var_306_11, var_306_11)
						end
					end
				end
			end

			if arg_303_1.time_ >= var_306_8 + var_306_9 and arg_303_1.time_ < var_306_8 + var_306_9 + arg_306_0 and arg_303_1.var_.actorSpriteComps1038 then
				local var_306_12 = 0.5

				for iter_306_3, iter_306_4 in pairs(arg_303_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_306_4 then
						iter_306_4.color = Color.New(var_306_12, var_306_12, var_306_12)
					end
				end

				arg_303_1.var_.actorSpriteComps1038 = nil
			end

			local var_306_13 = arg_303_1.actors_["10030"]
			local var_306_14 = 0

			if var_306_14 < arg_303_1.time_ and arg_303_1.time_ <= var_306_14 + arg_306_0 and arg_303_1.var_.actorSpriteComps10030 == nil then
				arg_303_1.var_.actorSpriteComps10030 = var_306_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_306_15 = 0.2

			if var_306_14 <= arg_303_1.time_ and arg_303_1.time_ < var_306_14 + var_306_15 then
				local var_306_16 = (arg_303_1.time_ - var_306_14) / var_306_15

				if arg_303_1.var_.actorSpriteComps10030 then
					for iter_306_5, iter_306_6 in pairs(arg_303_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_306_6 then
							local var_306_17 = Mathf.Lerp(iter_306_6.color.r, 1, var_306_16)

							iter_306_6.color = Color.New(var_306_17, var_306_17, var_306_17)
						end
					end
				end
			end

			if arg_303_1.time_ >= var_306_14 + var_306_15 and arg_303_1.time_ < var_306_14 + var_306_15 + arg_306_0 and arg_303_1.var_.actorSpriteComps10030 then
				local var_306_18 = 1

				for iter_306_7, iter_306_8 in pairs(arg_303_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_306_8 then
						iter_306_8.color = Color.New(var_306_18, var_306_18, var_306_18)
					end
				end

				arg_303_1.var_.actorSpriteComps10030 = nil
			end

			local var_306_19 = 0
			local var_306_20 = 0.225

			if var_306_19 < arg_303_1.time_ and arg_303_1.time_ <= var_306_19 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, true)

				local var_306_21 = arg_303_1:FormatText(StoryNameCfg[309].name)

				arg_303_1.leftNameTxt_.text = var_306_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_303_1.leftNameTxt_.transform)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1.leftNameTxt_.text)
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_22 = arg_303_1:GetWordFromCfg(115261075)
				local var_306_23 = arg_303_1:FormatText(var_306_22.content)

				arg_303_1.text_.text = var_306_23

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_24 = 9
				local var_306_25 = utf8.len(var_306_23)
				local var_306_26 = var_306_24 <= 0 and var_306_20 or var_306_20 * (var_306_25 / var_306_24)

				if var_306_26 > 0 and var_306_20 < var_306_26 then
					arg_303_1.talkMaxDuration = var_306_26

					if var_306_26 + var_306_19 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_26 + var_306_19
					end
				end

				arg_303_1.text_.text = var_306_23
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261075", "story_v_out_115261.awb") ~= 0 then
					local var_306_27 = manager.audio:GetVoiceLength("story_v_out_115261", "115261075", "story_v_out_115261.awb") / 1000

					if var_306_27 + var_306_19 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_27 + var_306_19
					end

					if var_306_22.prefab_name ~= "" and arg_303_1.actors_[var_306_22.prefab_name] ~= nil then
						local var_306_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_303_1.actors_[var_306_22.prefab_name].transform, "story_v_out_115261", "115261075", "story_v_out_115261.awb")

						arg_303_1:RecordAudio("115261075", var_306_28)
						arg_303_1:RecordAudio("115261075", var_306_28)
					else
						arg_303_1:AudioAction("play", "voice", "story_v_out_115261", "115261075", "story_v_out_115261.awb")
					end

					arg_303_1:RecordHistoryTalkVoice("story_v_out_115261", "115261075", "story_v_out_115261.awb")
				end

				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_29 = math.max(var_306_20, arg_303_1.talkMaxDuration)

			if var_306_19 <= arg_303_1.time_ and arg_303_1.time_ < var_306_19 + var_306_29 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_19) / var_306_29

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_19 + var_306_29 and arg_303_1.time_ < var_306_19 + var_306_29 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play115261076 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 115261076
		arg_307_1.duration_ = 14.166

		local var_307_0 = {
			ja = 14.166,
			ko = 12.2,
			zh = 11.933,
			en = 14.166
		}
		local var_307_1 = manager.audio:GetLocalizationFlag()

		if var_307_0[var_307_1] ~= nil then
			arg_307_1.duration_ = var_307_0[var_307_1]
		end

		SetActive(arg_307_1.tipsGo_, false)

		function arg_307_1.onSingleLineFinish_()
			arg_307_1.onSingleLineUpdate_ = nil
			arg_307_1.onSingleLineFinish_ = nil
			arg_307_1.state_ = "waiting"
		end

		function arg_307_1.playNext_(arg_309_0)
			if arg_309_0 == 1 then
				arg_307_0:Play115261077(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = arg_307_1.actors_["1038"]
			local var_310_1 = 0

			if var_310_1 < arg_307_1.time_ and arg_307_1.time_ <= var_310_1 + arg_310_0 and arg_307_1.var_.actorSpriteComps1038 == nil then
				arg_307_1.var_.actorSpriteComps1038 = var_310_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_310_2 = 0.2

			if var_310_1 <= arg_307_1.time_ and arg_307_1.time_ < var_310_1 + var_310_2 then
				local var_310_3 = (arg_307_1.time_ - var_310_1) / var_310_2

				if arg_307_1.var_.actorSpriteComps1038 then
					for iter_310_0, iter_310_1 in pairs(arg_307_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_310_1 then
							local var_310_4 = Mathf.Lerp(iter_310_1.color.r, 1, var_310_3)

							iter_310_1.color = Color.New(var_310_4, var_310_4, var_310_4)
						end
					end
				end
			end

			if arg_307_1.time_ >= var_310_1 + var_310_2 and arg_307_1.time_ < var_310_1 + var_310_2 + arg_310_0 and arg_307_1.var_.actorSpriteComps1038 then
				local var_310_5 = 1

				for iter_310_2, iter_310_3 in pairs(arg_307_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_310_3 then
						iter_310_3.color = Color.New(var_310_5, var_310_5, var_310_5)
					end
				end

				arg_307_1.var_.actorSpriteComps1038 = nil
			end

			local var_310_6 = arg_307_1.actors_["10030"]
			local var_310_7 = 0

			if var_310_7 < arg_307_1.time_ and arg_307_1.time_ <= var_310_7 + arg_310_0 and arg_307_1.var_.actorSpriteComps10030 == nil then
				arg_307_1.var_.actorSpriteComps10030 = var_310_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_310_8 = 0.2

			if var_310_7 <= arg_307_1.time_ and arg_307_1.time_ < var_310_7 + var_310_8 then
				local var_310_9 = (arg_307_1.time_ - var_310_7) / var_310_8

				if arg_307_1.var_.actorSpriteComps10030 then
					for iter_310_4, iter_310_5 in pairs(arg_307_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_310_5 then
							local var_310_10 = Mathf.Lerp(iter_310_5.color.r, 0.5, var_310_9)

							iter_310_5.color = Color.New(var_310_10, var_310_10, var_310_10)
						end
					end
				end
			end

			if arg_307_1.time_ >= var_310_7 + var_310_8 and arg_307_1.time_ < var_310_7 + var_310_8 + arg_310_0 and arg_307_1.var_.actorSpriteComps10030 then
				local var_310_11 = 0.5

				for iter_310_6, iter_310_7 in pairs(arg_307_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_310_7 then
						iter_310_7.color = Color.New(var_310_11, var_310_11, var_310_11)
					end
				end

				arg_307_1.var_.actorSpriteComps10030 = nil
			end

			local var_310_12 = 0
			local var_310_13 = 1.325

			if var_310_12 < arg_307_1.time_ and arg_307_1.time_ <= var_310_12 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, true)

				local var_310_14 = arg_307_1:FormatText(StoryNameCfg[94].name)

				arg_307_1.leftNameTxt_.text = var_310_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_307_1.leftNameTxt_.transform)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1.leftNameTxt_.text)
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_15 = arg_307_1:GetWordFromCfg(115261076)
				local var_310_16 = arg_307_1:FormatText(var_310_15.content)

				arg_307_1.text_.text = var_310_16

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_17 = 53
				local var_310_18 = utf8.len(var_310_16)
				local var_310_19 = var_310_17 <= 0 and var_310_13 or var_310_13 * (var_310_18 / var_310_17)

				if var_310_19 > 0 and var_310_13 < var_310_19 then
					arg_307_1.talkMaxDuration = var_310_19

					if var_310_19 + var_310_12 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_19 + var_310_12
					end
				end

				arg_307_1.text_.text = var_310_16
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261076", "story_v_out_115261.awb") ~= 0 then
					local var_310_20 = manager.audio:GetVoiceLength("story_v_out_115261", "115261076", "story_v_out_115261.awb") / 1000

					if var_310_20 + var_310_12 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_20 + var_310_12
					end

					if var_310_15.prefab_name ~= "" and arg_307_1.actors_[var_310_15.prefab_name] ~= nil then
						local var_310_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_307_1.actors_[var_310_15.prefab_name].transform, "story_v_out_115261", "115261076", "story_v_out_115261.awb")

						arg_307_1:RecordAudio("115261076", var_310_21)
						arg_307_1:RecordAudio("115261076", var_310_21)
					else
						arg_307_1:AudioAction("play", "voice", "story_v_out_115261", "115261076", "story_v_out_115261.awb")
					end

					arg_307_1:RecordHistoryTalkVoice("story_v_out_115261", "115261076", "story_v_out_115261.awb")
				end

				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_22 = math.max(var_310_13, arg_307_1.talkMaxDuration)

			if var_310_12 <= arg_307_1.time_ and arg_307_1.time_ < var_310_12 + var_310_22 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_12) / var_310_22

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_12 + var_310_22 and arg_307_1.time_ < var_310_12 + var_310_22 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play115261077 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 115261077
		arg_311_1.duration_ = 10.4

		local var_311_0 = {
			ja = 10.4,
			ko = 7.766,
			zh = 10.166,
			en = 8.333
		}
		local var_311_1 = manager.audio:GetLocalizationFlag()

		if var_311_0[var_311_1] ~= nil then
			arg_311_1.duration_ = var_311_0[var_311_1]
		end

		SetActive(arg_311_1.tipsGo_, false)

		function arg_311_1.onSingleLineFinish_()
			arg_311_1.onSingleLineUpdate_ = nil
			arg_311_1.onSingleLineFinish_ = nil
			arg_311_1.state_ = "waiting"
		end

		function arg_311_1.playNext_(arg_313_0)
			if arg_313_0 == 1 then
				arg_311_0:Play115261078(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = arg_311_1.actors_["1038"]
			local var_314_1 = 0

			if var_314_1 < arg_311_1.time_ and arg_311_1.time_ <= var_314_1 + arg_314_0 and arg_311_1.var_.actorSpriteComps1038 == nil then
				arg_311_1.var_.actorSpriteComps1038 = var_314_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_314_2 = 0.2

			if var_314_1 <= arg_311_1.time_ and arg_311_1.time_ < var_314_1 + var_314_2 then
				local var_314_3 = (arg_311_1.time_ - var_314_1) / var_314_2

				if arg_311_1.var_.actorSpriteComps1038 then
					for iter_314_0, iter_314_1 in pairs(arg_311_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_314_1 then
							local var_314_4 = Mathf.Lerp(iter_314_1.color.r, 0.5, var_314_3)

							iter_314_1.color = Color.New(var_314_4, var_314_4, var_314_4)
						end
					end
				end
			end

			if arg_311_1.time_ >= var_314_1 + var_314_2 and arg_311_1.time_ < var_314_1 + var_314_2 + arg_314_0 and arg_311_1.var_.actorSpriteComps1038 then
				local var_314_5 = 0.5

				for iter_314_2, iter_314_3 in pairs(arg_311_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_314_3 then
						iter_314_3.color = Color.New(var_314_5, var_314_5, var_314_5)
					end
				end

				arg_311_1.var_.actorSpriteComps1038 = nil
			end

			local var_314_6 = arg_311_1.actors_["10030"]
			local var_314_7 = 0

			if var_314_7 < arg_311_1.time_ and arg_311_1.time_ <= var_314_7 + arg_314_0 and arg_311_1.var_.actorSpriteComps10030 == nil then
				arg_311_1.var_.actorSpriteComps10030 = var_314_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_314_8 = 0.2

			if var_314_7 <= arg_311_1.time_ and arg_311_1.time_ < var_314_7 + var_314_8 then
				local var_314_9 = (arg_311_1.time_ - var_314_7) / var_314_8

				if arg_311_1.var_.actorSpriteComps10030 then
					for iter_314_4, iter_314_5 in pairs(arg_311_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_314_5 then
							local var_314_10 = Mathf.Lerp(iter_314_5.color.r, 1, var_314_9)

							iter_314_5.color = Color.New(var_314_10, var_314_10, var_314_10)
						end
					end
				end
			end

			if arg_311_1.time_ >= var_314_7 + var_314_8 and arg_311_1.time_ < var_314_7 + var_314_8 + arg_314_0 and arg_311_1.var_.actorSpriteComps10030 then
				local var_314_11 = 1

				for iter_314_6, iter_314_7 in pairs(arg_311_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_314_7 then
						iter_314_7.color = Color.New(var_314_11, var_314_11, var_314_11)
					end
				end

				arg_311_1.var_.actorSpriteComps10030 = nil
			end

			local var_314_12 = arg_311_1.actors_["10030"].transform
			local var_314_13 = 0

			if var_314_13 < arg_311_1.time_ and arg_311_1.time_ <= var_314_13 + arg_314_0 then
				arg_311_1.var_.moveOldPos10030 = var_314_12.localPosition
				var_314_12.localScale = Vector3.New(1, 1, 1)

				arg_311_1:CheckSpriteTmpPos("10030", 4)

				local var_314_14 = var_314_12.childCount

				for iter_314_8 = 0, var_314_14 - 1 do
					local var_314_15 = var_314_12:GetChild(iter_314_8)

					if var_314_15.name == "split_5" or not string.find(var_314_15.name, "split") then
						var_314_15.gameObject:SetActive(true)
					else
						var_314_15.gameObject:SetActive(false)
					end
				end
			end

			local var_314_16 = 0.001

			if var_314_13 <= arg_311_1.time_ and arg_311_1.time_ < var_314_13 + var_314_16 then
				local var_314_17 = (arg_311_1.time_ - var_314_13) / var_314_16
				local var_314_18 = Vector3.New(390, -390, 150)

				var_314_12.localPosition = Vector3.Lerp(arg_311_1.var_.moveOldPos10030, var_314_18, var_314_17)
			end

			if arg_311_1.time_ >= var_314_13 + var_314_16 and arg_311_1.time_ < var_314_13 + var_314_16 + arg_314_0 then
				var_314_12.localPosition = Vector3.New(390, -390, 150)
			end

			local var_314_19 = 0
			local var_314_20 = 0.75

			if var_314_19 < arg_311_1.time_ and arg_311_1.time_ <= var_314_19 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, true)

				local var_314_21 = arg_311_1:FormatText(StoryNameCfg[309].name)

				arg_311_1.leftNameTxt_.text = var_314_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_311_1.leftNameTxt_.transform)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1.leftNameTxt_.text)
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_22 = arg_311_1:GetWordFromCfg(115261077)
				local var_314_23 = arg_311_1:FormatText(var_314_22.content)

				arg_311_1.text_.text = var_314_23

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_24 = 38
				local var_314_25 = utf8.len(var_314_23)
				local var_314_26 = var_314_24 <= 0 and var_314_20 or var_314_20 * (var_314_25 / var_314_24)

				if var_314_26 > 0 and var_314_20 < var_314_26 then
					arg_311_1.talkMaxDuration = var_314_26

					if var_314_26 + var_314_19 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_26 + var_314_19
					end
				end

				arg_311_1.text_.text = var_314_23
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261077", "story_v_out_115261.awb") ~= 0 then
					local var_314_27 = manager.audio:GetVoiceLength("story_v_out_115261", "115261077", "story_v_out_115261.awb") / 1000

					if var_314_27 + var_314_19 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_27 + var_314_19
					end

					if var_314_22.prefab_name ~= "" and arg_311_1.actors_[var_314_22.prefab_name] ~= nil then
						local var_314_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_311_1.actors_[var_314_22.prefab_name].transform, "story_v_out_115261", "115261077", "story_v_out_115261.awb")

						arg_311_1:RecordAudio("115261077", var_314_28)
						arg_311_1:RecordAudio("115261077", var_314_28)
					else
						arg_311_1:AudioAction("play", "voice", "story_v_out_115261", "115261077", "story_v_out_115261.awb")
					end

					arg_311_1:RecordHistoryTalkVoice("story_v_out_115261", "115261077", "story_v_out_115261.awb")
				end

				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_29 = math.max(var_314_20, arg_311_1.talkMaxDuration)

			if var_314_19 <= arg_311_1.time_ and arg_311_1.time_ < var_314_19 + var_314_29 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_19) / var_314_29

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_19 + var_314_29 and arg_311_1.time_ < var_314_19 + var_314_29 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play115261078 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 115261078
		arg_315_1.duration_ = 12.166

		local var_315_0 = {
			ja = 12.166,
			ko = 7.4,
			zh = 6.2,
			en = 7.933
		}
		local var_315_1 = manager.audio:GetLocalizationFlag()

		if var_315_0[var_315_1] ~= nil then
			arg_315_1.duration_ = var_315_0[var_315_1]
		end

		SetActive(arg_315_1.tipsGo_, false)

		function arg_315_1.onSingleLineFinish_()
			arg_315_1.onSingleLineUpdate_ = nil
			arg_315_1.onSingleLineFinish_ = nil
			arg_315_1.state_ = "waiting"
		end

		function arg_315_1.playNext_(arg_317_0)
			if arg_317_0 == 1 then
				arg_315_0:Play115261079(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = arg_315_1.actors_["10030"].transform
			local var_318_1 = 0

			if var_318_1 < arg_315_1.time_ and arg_315_1.time_ <= var_318_1 + arg_318_0 then
				arg_315_1.var_.moveOldPos10030 = var_318_0.localPosition
				var_318_0.localScale = Vector3.New(1, 1, 1)

				arg_315_1:CheckSpriteTmpPos("10030", 4)

				local var_318_2 = var_318_0.childCount

				for iter_318_0 = 0, var_318_2 - 1 do
					local var_318_3 = var_318_0:GetChild(iter_318_0)

					if var_318_3.name == "split_3" or not string.find(var_318_3.name, "split") then
						var_318_3.gameObject:SetActive(true)
					else
						var_318_3.gameObject:SetActive(false)
					end
				end
			end

			local var_318_4 = 0.001

			if var_318_1 <= arg_315_1.time_ and arg_315_1.time_ < var_318_1 + var_318_4 then
				local var_318_5 = (arg_315_1.time_ - var_318_1) / var_318_4
				local var_318_6 = Vector3.New(390, -390, 150)

				var_318_0.localPosition = Vector3.Lerp(arg_315_1.var_.moveOldPos10030, var_318_6, var_318_5)
			end

			if arg_315_1.time_ >= var_318_1 + var_318_4 and arg_315_1.time_ < var_318_1 + var_318_4 + arg_318_0 then
				var_318_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_318_7 = arg_315_1.actors_["10030"]
			local var_318_8 = 0

			if var_318_8 < arg_315_1.time_ and arg_315_1.time_ <= var_318_8 + arg_318_0 then
				local var_318_9 = var_318_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_318_9 then
					arg_315_1.var_.alphaOldValue10030 = var_318_9.alpha
					arg_315_1.var_.characterEffect10030 = var_318_9
				end

				arg_315_1.var_.alphaOldValue10030 = 0
			end

			local var_318_10 = 0.0166666666666667

			if var_318_8 <= arg_315_1.time_ and arg_315_1.time_ < var_318_8 + var_318_10 then
				local var_318_11 = (arg_315_1.time_ - var_318_8) / var_318_10
				local var_318_12 = Mathf.Lerp(arg_315_1.var_.alphaOldValue10030, 1, var_318_11)

				if arg_315_1.var_.characterEffect10030 then
					arg_315_1.var_.characterEffect10030.alpha = var_318_12
				end
			end

			if arg_315_1.time_ >= var_318_8 + var_318_10 and arg_315_1.time_ < var_318_8 + var_318_10 + arg_318_0 and arg_315_1.var_.characterEffect10030 then
				arg_315_1.var_.characterEffect10030.alpha = 1
			end

			local var_318_13 = 0
			local var_318_14 = 0.75

			if var_318_13 < arg_315_1.time_ and arg_315_1.time_ <= var_318_13 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, true)

				local var_318_15 = arg_315_1:FormatText(StoryNameCfg[309].name)

				arg_315_1.leftNameTxt_.text = var_318_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_315_1.leftNameTxt_.transform)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1.leftNameTxt_.text)
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_16 = arg_315_1:GetWordFromCfg(115261078)
				local var_318_17 = arg_315_1:FormatText(var_318_16.content)

				arg_315_1.text_.text = var_318_17

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_18 = 30
				local var_318_19 = utf8.len(var_318_17)
				local var_318_20 = var_318_18 <= 0 and var_318_14 or var_318_14 * (var_318_19 / var_318_18)

				if var_318_20 > 0 and var_318_14 < var_318_20 then
					arg_315_1.talkMaxDuration = var_318_20

					if var_318_20 + var_318_13 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_20 + var_318_13
					end
				end

				arg_315_1.text_.text = var_318_17
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261078", "story_v_out_115261.awb") ~= 0 then
					local var_318_21 = manager.audio:GetVoiceLength("story_v_out_115261", "115261078", "story_v_out_115261.awb") / 1000

					if var_318_21 + var_318_13 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_21 + var_318_13
					end

					if var_318_16.prefab_name ~= "" and arg_315_1.actors_[var_318_16.prefab_name] ~= nil then
						local var_318_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_315_1.actors_[var_318_16.prefab_name].transform, "story_v_out_115261", "115261078", "story_v_out_115261.awb")

						arg_315_1:RecordAudio("115261078", var_318_22)
						arg_315_1:RecordAudio("115261078", var_318_22)
					else
						arg_315_1:AudioAction("play", "voice", "story_v_out_115261", "115261078", "story_v_out_115261.awb")
					end

					arg_315_1:RecordHistoryTalkVoice("story_v_out_115261", "115261078", "story_v_out_115261.awb")
				end

				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_23 = math.max(var_318_14, arg_315_1.talkMaxDuration)

			if var_318_13 <= arg_315_1.time_ and arg_315_1.time_ < var_318_13 + var_318_23 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_13) / var_318_23

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_13 + var_318_23 and arg_315_1.time_ < var_318_13 + var_318_23 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play115261079 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 115261079
		arg_319_1.duration_ = 5

		SetActive(arg_319_1.tipsGo_, false)

		function arg_319_1.onSingleLineFinish_()
			arg_319_1.onSingleLineUpdate_ = nil
			arg_319_1.onSingleLineFinish_ = nil
			arg_319_1.state_ = "waiting"
		end

		function arg_319_1.playNext_(arg_321_0)
			if arg_321_0 == 1 then
				arg_319_0:Play115261080(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = arg_319_1.actors_["10030"]
			local var_322_1 = 0

			if var_322_1 < arg_319_1.time_ and arg_319_1.time_ <= var_322_1 + arg_322_0 then
				local var_322_2 = var_322_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_322_2 then
					arg_319_1.var_.alphaOldValue10030 = var_322_2.alpha
					arg_319_1.var_.characterEffect10030 = var_322_2
				end

				arg_319_1.var_.alphaOldValue10030 = 1
			end

			local var_322_3 = 0.333333333333333

			if var_322_1 <= arg_319_1.time_ and arg_319_1.time_ < var_322_1 + var_322_3 then
				local var_322_4 = (arg_319_1.time_ - var_322_1) / var_322_3
				local var_322_5 = Mathf.Lerp(arg_319_1.var_.alphaOldValue10030, 0, var_322_4)

				if arg_319_1.var_.characterEffect10030 then
					arg_319_1.var_.characterEffect10030.alpha = var_322_5
				end
			end

			if arg_319_1.time_ >= var_322_1 + var_322_3 and arg_319_1.time_ < var_322_1 + var_322_3 + arg_322_0 and arg_319_1.var_.characterEffect10030 then
				arg_319_1.var_.characterEffect10030.alpha = 0
			end

			local var_322_6 = arg_319_1.actors_["1038"]
			local var_322_7 = 0

			if var_322_7 < arg_319_1.time_ and arg_319_1.time_ <= var_322_7 + arg_322_0 then
				local var_322_8 = var_322_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_322_8 then
					arg_319_1.var_.alphaOldValue1038 = var_322_8.alpha
					arg_319_1.var_.characterEffect1038 = var_322_8
				end

				arg_319_1.var_.alphaOldValue1038 = 1
			end

			local var_322_9 = 0.333333333333333

			if var_322_7 <= arg_319_1.time_ and arg_319_1.time_ < var_322_7 + var_322_9 then
				local var_322_10 = (arg_319_1.time_ - var_322_7) / var_322_9
				local var_322_11 = Mathf.Lerp(arg_319_1.var_.alphaOldValue1038, 0, var_322_10)

				if arg_319_1.var_.characterEffect1038 then
					arg_319_1.var_.characterEffect1038.alpha = var_322_11
				end
			end

			if arg_319_1.time_ >= var_322_7 + var_322_9 and arg_319_1.time_ < var_322_7 + var_322_9 + arg_322_0 and arg_319_1.var_.characterEffect1038 then
				arg_319_1.var_.characterEffect1038.alpha = 0
			end

			local var_322_12 = 0
			local var_322_13 = 0.85

			if var_322_12 < arg_319_1.time_ and arg_319_1.time_ <= var_322_12 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0
				arg_319_1.dialogCg_.alpha = 1

				arg_319_1.dialog_:SetActive(true)
				SetActive(arg_319_1.leftNameGo_, false)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_14 = arg_319_1:GetWordFromCfg(115261079)
				local var_322_15 = arg_319_1:FormatText(var_322_14.content)

				arg_319_1.text_.text = var_322_15

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_16 = 34
				local var_322_17 = utf8.len(var_322_15)
				local var_322_18 = var_322_16 <= 0 and var_322_13 or var_322_13 * (var_322_17 / var_322_16)

				if var_322_18 > 0 and var_322_13 < var_322_18 then
					arg_319_1.talkMaxDuration = var_322_18

					if var_322_18 + var_322_12 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_18 + var_322_12
					end
				end

				arg_319_1.text_.text = var_322_15
				arg_319_1.typewritter.percent = 0

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(false)
				arg_319_1:RecordContent(arg_319_1.text_.text)
			end

			local var_322_19 = math.max(var_322_13, arg_319_1.talkMaxDuration)

			if var_322_12 <= arg_319_1.time_ and arg_319_1.time_ < var_322_12 + var_322_19 then
				arg_319_1.typewritter.percent = (arg_319_1.time_ - var_322_12) / var_322_19

				arg_319_1.typewritter:SetDirty()
			end

			if arg_319_1.time_ >= var_322_12 + var_322_19 and arg_319_1.time_ < var_322_12 + var_322_19 + arg_322_0 then
				arg_319_1.typewritter.percent = 1

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(true)
			end
		end
	end,
	Play115261080 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 115261080
		arg_323_1.duration_ = 4.6

		local var_323_0 = {
			ja = 2.633,
			ko = 2.433,
			zh = 4.6,
			en = 3.266
		}
		local var_323_1 = manager.audio:GetLocalizationFlag()

		if var_323_0[var_323_1] ~= nil then
			arg_323_1.duration_ = var_323_0[var_323_1]
		end

		SetActive(arg_323_1.tipsGo_, false)

		function arg_323_1.onSingleLineFinish_()
			arg_323_1.onSingleLineUpdate_ = nil
			arg_323_1.onSingleLineFinish_ = nil
			arg_323_1.state_ = "waiting"
		end

		function arg_323_1.playNext_(arg_325_0)
			if arg_325_0 == 1 then
				arg_323_0:Play115261081(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = arg_323_1.actors_["1038"]
			local var_326_1 = 0

			if var_326_1 < arg_323_1.time_ and arg_323_1.time_ <= var_326_1 + arg_326_0 and arg_323_1.var_.actorSpriteComps1038 == nil then
				arg_323_1.var_.actorSpriteComps1038 = var_326_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_326_2 = 0.2

			if var_326_1 <= arg_323_1.time_ and arg_323_1.time_ < var_326_1 + var_326_2 then
				local var_326_3 = (arg_323_1.time_ - var_326_1) / var_326_2

				if arg_323_1.var_.actorSpriteComps1038 then
					for iter_326_0, iter_326_1 in pairs(arg_323_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_326_1 then
							local var_326_4 = Mathf.Lerp(iter_326_1.color.r, 1, var_326_3)

							iter_326_1.color = Color.New(var_326_4, var_326_4, var_326_4)
						end
					end
				end
			end

			if arg_323_1.time_ >= var_326_1 + var_326_2 and arg_323_1.time_ < var_326_1 + var_326_2 + arg_326_0 and arg_323_1.var_.actorSpriteComps1038 then
				local var_326_5 = 1

				for iter_326_2, iter_326_3 in pairs(arg_323_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_326_3 then
						iter_326_3.color = Color.New(var_326_5, var_326_5, var_326_5)
					end
				end

				arg_323_1.var_.actorSpriteComps1038 = nil
			end

			local var_326_6 = arg_323_1.actors_["1038"].transform
			local var_326_7 = 0

			if var_326_7 < arg_323_1.time_ and arg_323_1.time_ <= var_326_7 + arg_326_0 then
				arg_323_1.var_.moveOldPos1038 = var_326_6.localPosition
				var_326_6.localScale = Vector3.New(1, 1, 1)

				arg_323_1:CheckSpriteTmpPos("1038", 3)

				local var_326_8 = var_326_6.childCount

				for iter_326_4 = 0, var_326_8 - 1 do
					local var_326_9 = var_326_6:GetChild(iter_326_4)

					if var_326_9.name == "split_1" or not string.find(var_326_9.name, "split") then
						var_326_9.gameObject:SetActive(true)
					else
						var_326_9.gameObject:SetActive(false)
					end
				end
			end

			local var_326_10 = 0.001

			if var_326_7 <= arg_323_1.time_ and arg_323_1.time_ < var_326_7 + var_326_10 then
				local var_326_11 = (arg_323_1.time_ - var_326_7) / var_326_10
				local var_326_12 = Vector3.New(0, -400, 0)

				var_326_6.localPosition = Vector3.Lerp(arg_323_1.var_.moveOldPos1038, var_326_12, var_326_11)
			end

			if arg_323_1.time_ >= var_326_7 + var_326_10 and arg_323_1.time_ < var_326_7 + var_326_10 + arg_326_0 then
				var_326_6.localPosition = Vector3.New(0, -400, 0)
			end

			local var_326_13 = arg_323_1.actors_["1038"]
			local var_326_14 = 0

			if var_326_14 < arg_323_1.time_ and arg_323_1.time_ <= var_326_14 + arg_326_0 then
				local var_326_15 = var_326_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_326_15 then
					arg_323_1.var_.alphaOldValue1038 = var_326_15.alpha
					arg_323_1.var_.characterEffect1038 = var_326_15
				end

				arg_323_1.var_.alphaOldValue1038 = 0
			end

			local var_326_16 = 0.333333333333333

			if var_326_14 <= arg_323_1.time_ and arg_323_1.time_ < var_326_14 + var_326_16 then
				local var_326_17 = (arg_323_1.time_ - var_326_14) / var_326_16
				local var_326_18 = Mathf.Lerp(arg_323_1.var_.alphaOldValue1038, 1, var_326_17)

				if arg_323_1.var_.characterEffect1038 then
					arg_323_1.var_.characterEffect1038.alpha = var_326_18
				end
			end

			if arg_323_1.time_ >= var_326_14 + var_326_16 and arg_323_1.time_ < var_326_14 + var_326_16 + arg_326_0 and arg_323_1.var_.characterEffect1038 then
				arg_323_1.var_.characterEffect1038.alpha = 1
			end

			local var_326_19 = 0
			local var_326_20 = 0.225

			if var_326_19 < arg_323_1.time_ and arg_323_1.time_ <= var_326_19 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0
				arg_323_1.dialogCg_.alpha = 1

				arg_323_1.dialog_:SetActive(true)
				SetActive(arg_323_1.leftNameGo_, true)

				local var_326_21 = arg_323_1:FormatText(StoryNameCfg[94].name)

				arg_323_1.leftNameTxt_.text = var_326_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_323_1.leftNameTxt_.transform)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1.leftNameTxt_.text)
				SetActive(arg_323_1.iconTrs_.gameObject, false)
				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_22 = arg_323_1:GetWordFromCfg(115261080)
				local var_326_23 = arg_323_1:FormatText(var_326_22.content)

				arg_323_1.text_.text = var_326_23

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_24 = 9
				local var_326_25 = utf8.len(var_326_23)
				local var_326_26 = var_326_24 <= 0 and var_326_20 or var_326_20 * (var_326_25 / var_326_24)

				if var_326_26 > 0 and var_326_20 < var_326_26 then
					arg_323_1.talkMaxDuration = var_326_26

					if var_326_26 + var_326_19 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_26 + var_326_19
					end
				end

				arg_323_1.text_.text = var_326_23
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261080", "story_v_out_115261.awb") ~= 0 then
					local var_326_27 = manager.audio:GetVoiceLength("story_v_out_115261", "115261080", "story_v_out_115261.awb") / 1000

					if var_326_27 + var_326_19 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_27 + var_326_19
					end

					if var_326_22.prefab_name ~= "" and arg_323_1.actors_[var_326_22.prefab_name] ~= nil then
						local var_326_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_323_1.actors_[var_326_22.prefab_name].transform, "story_v_out_115261", "115261080", "story_v_out_115261.awb")

						arg_323_1:RecordAudio("115261080", var_326_28)
						arg_323_1:RecordAudio("115261080", var_326_28)
					else
						arg_323_1:AudioAction("play", "voice", "story_v_out_115261", "115261080", "story_v_out_115261.awb")
					end

					arg_323_1:RecordHistoryTalkVoice("story_v_out_115261", "115261080", "story_v_out_115261.awb")
				end

				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_29 = math.max(var_326_20, arg_323_1.talkMaxDuration)

			if var_326_19 <= arg_323_1.time_ and arg_323_1.time_ < var_326_19 + var_326_29 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_19) / var_326_29

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_19 + var_326_29 and arg_323_1.time_ < var_326_19 + var_326_29 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	Play115261081 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 115261081
		arg_327_1.duration_ = 5

		SetActive(arg_327_1.tipsGo_, false)

		function arg_327_1.onSingleLineFinish_()
			arg_327_1.onSingleLineUpdate_ = nil
			arg_327_1.onSingleLineFinish_ = nil
			arg_327_1.state_ = "waiting"
		end

		function arg_327_1.playNext_(arg_329_0)
			if arg_329_0 == 1 then
				arg_327_0:Play115261082(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = arg_327_1.actors_["1038"]
			local var_330_1 = 0

			if var_330_1 < arg_327_1.time_ and arg_327_1.time_ <= var_330_1 + arg_330_0 and arg_327_1.var_.actorSpriteComps1038 == nil then
				arg_327_1.var_.actorSpriteComps1038 = var_330_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_330_2 = 0.2

			if var_330_1 <= arg_327_1.time_ and arg_327_1.time_ < var_330_1 + var_330_2 then
				local var_330_3 = (arg_327_1.time_ - var_330_1) / var_330_2

				if arg_327_1.var_.actorSpriteComps1038 then
					for iter_330_0, iter_330_1 in pairs(arg_327_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_330_1 then
							local var_330_4 = Mathf.Lerp(iter_330_1.color.r, 0.5, var_330_3)

							iter_330_1.color = Color.New(var_330_4, var_330_4, var_330_4)
						end
					end
				end
			end

			if arg_327_1.time_ >= var_330_1 + var_330_2 and arg_327_1.time_ < var_330_1 + var_330_2 + arg_330_0 and arg_327_1.var_.actorSpriteComps1038 then
				local var_330_5 = 0.5

				for iter_330_2, iter_330_3 in pairs(arg_327_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_330_3 then
						iter_330_3.color = Color.New(var_330_5, var_330_5, var_330_5)
					end
				end

				arg_327_1.var_.actorSpriteComps1038 = nil
			end

			local var_330_6 = 1.999999999999
			local var_330_7 = 1

			if var_330_6 < arg_327_1.time_ and arg_327_1.time_ <= var_330_6 + arg_330_0 then
				local var_330_8 = "play"
				local var_330_9 = "effect"

				arg_327_1:AudioAction(var_330_8, var_330_9, "se_story_activity_1_5_3", "se_story_activity_1_5_3_cup", "")
			end

			local var_330_10 = arg_327_1.actors_["1038"].transform
			local var_330_11 = 0

			if var_330_11 < arg_327_1.time_ and arg_327_1.time_ <= var_330_11 + arg_330_0 then
				arg_327_1.var_.moveOldPos1038 = var_330_10.localPosition
				var_330_10.localScale = Vector3.New(1, 1, 1)

				arg_327_1:CheckSpriteTmpPos("1038", 7)

				local var_330_12 = var_330_10.childCount

				for iter_330_4 = 0, var_330_12 - 1 do
					local var_330_13 = var_330_10:GetChild(iter_330_4)

					if var_330_13.name == "split_1" or not string.find(var_330_13.name, "split") then
						var_330_13.gameObject:SetActive(true)
					else
						var_330_13.gameObject:SetActive(false)
					end
				end
			end

			local var_330_14 = 0.001

			if var_330_11 <= arg_327_1.time_ and arg_327_1.time_ < var_330_11 + var_330_14 then
				local var_330_15 = (arg_327_1.time_ - var_330_11) / var_330_14
				local var_330_16 = Vector3.New(0, -2000, 0)

				var_330_10.localPosition = Vector3.Lerp(arg_327_1.var_.moveOldPos1038, var_330_16, var_330_15)
			end

			if arg_327_1.time_ >= var_330_11 + var_330_14 and arg_327_1.time_ < var_330_11 + var_330_14 + arg_330_0 then
				var_330_10.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_330_17 = 0
			local var_330_18 = 0.9

			if var_330_17 < arg_327_1.time_ and arg_327_1.time_ <= var_330_17 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, false)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_19 = arg_327_1:GetWordFromCfg(115261081)
				local var_330_20 = arg_327_1:FormatText(var_330_19.content)

				arg_327_1.text_.text = var_330_20

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_21 = 36
				local var_330_22 = utf8.len(var_330_20)
				local var_330_23 = var_330_21 <= 0 and var_330_18 or var_330_18 * (var_330_22 / var_330_21)

				if var_330_23 > 0 and var_330_18 < var_330_23 then
					arg_327_1.talkMaxDuration = var_330_23

					if var_330_23 + var_330_17 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_23 + var_330_17
					end
				end

				arg_327_1.text_.text = var_330_20
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)
				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_24 = math.max(var_330_18, arg_327_1.talkMaxDuration)

			if var_330_17 <= arg_327_1.time_ and arg_327_1.time_ < var_330_17 + var_330_24 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_17) / var_330_24

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_17 + var_330_24 and arg_327_1.time_ < var_330_17 + var_330_24 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play115261082 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 115261082
		arg_331_1.duration_ = 5.466

		local var_331_0 = {
			ja = 5.4,
			ko = 4.833,
			zh = 5.466,
			en = 5
		}
		local var_331_1 = manager.audio:GetLocalizationFlag()

		if var_331_0[var_331_1] ~= nil then
			arg_331_1.duration_ = var_331_0[var_331_1]
		end

		SetActive(arg_331_1.tipsGo_, false)

		function arg_331_1.onSingleLineFinish_()
			arg_331_1.onSingleLineUpdate_ = nil
			arg_331_1.onSingleLineFinish_ = nil
			arg_331_1.state_ = "waiting"
		end

		function arg_331_1.playNext_(arg_333_0)
			if arg_333_0 == 1 then
				arg_331_0:Play115261083(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = arg_331_1.actors_["1038"]
			local var_334_1 = 0

			if var_334_1 < arg_331_1.time_ and arg_331_1.time_ <= var_334_1 + arg_334_0 and arg_331_1.var_.actorSpriteComps1038 == nil then
				arg_331_1.var_.actorSpriteComps1038 = var_334_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_334_2 = 0.2

			if var_334_1 <= arg_331_1.time_ and arg_331_1.time_ < var_334_1 + var_334_2 then
				local var_334_3 = (arg_331_1.time_ - var_334_1) / var_334_2

				if arg_331_1.var_.actorSpriteComps1038 then
					for iter_334_0, iter_334_1 in pairs(arg_331_1.var_.actorSpriteComps1038:ToTable()) do
						if iter_334_1 then
							local var_334_4 = Mathf.Lerp(iter_334_1.color.r, 1, var_334_3)

							iter_334_1.color = Color.New(var_334_4, var_334_4, var_334_4)
						end
					end
				end
			end

			if arg_331_1.time_ >= var_334_1 + var_334_2 and arg_331_1.time_ < var_334_1 + var_334_2 + arg_334_0 and arg_331_1.var_.actorSpriteComps1038 then
				local var_334_5 = 1

				for iter_334_2, iter_334_3 in pairs(arg_331_1.var_.actorSpriteComps1038:ToTable()) do
					if iter_334_3 then
						iter_334_3.color = Color.New(var_334_5, var_334_5, var_334_5)
					end
				end

				arg_331_1.var_.actorSpriteComps1038 = nil
			end

			local var_334_6 = arg_331_1.actors_["1038"].transform
			local var_334_7 = 0

			if var_334_7 < arg_331_1.time_ and arg_331_1.time_ <= var_334_7 + arg_334_0 then
				arg_331_1.var_.moveOldPos1038 = var_334_6.localPosition
				var_334_6.localScale = Vector3.New(1, 1, 1)

				arg_331_1:CheckSpriteTmpPos("1038", 3)

				local var_334_8 = var_334_6.childCount

				for iter_334_4 = 0, var_334_8 - 1 do
					local var_334_9 = var_334_6:GetChild(iter_334_4)

					if var_334_9.name == "split_9" or not string.find(var_334_9.name, "split") then
						var_334_9.gameObject:SetActive(true)
					else
						var_334_9.gameObject:SetActive(false)
					end
				end
			end

			local var_334_10 = 0.001

			if var_334_7 <= arg_331_1.time_ and arg_331_1.time_ < var_334_7 + var_334_10 then
				local var_334_11 = (arg_331_1.time_ - var_334_7) / var_334_10
				local var_334_12 = Vector3.New(0, -400, 0)

				var_334_6.localPosition = Vector3.Lerp(arg_331_1.var_.moveOldPos1038, var_334_12, var_334_11)
			end

			if arg_331_1.time_ >= var_334_7 + var_334_10 and arg_331_1.time_ < var_334_7 + var_334_10 + arg_334_0 then
				var_334_6.localPosition = Vector3.New(0, -400, 0)
			end

			local var_334_13 = arg_331_1.actors_["1038"]
			local var_334_14 = 0

			if var_334_14 < arg_331_1.time_ and arg_331_1.time_ <= var_334_14 + arg_334_0 then
				local var_334_15 = var_334_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_334_15 then
					arg_331_1.var_.alphaOldValue1038 = var_334_15.alpha
					arg_331_1.var_.characterEffect1038 = var_334_15
				end

				arg_331_1.var_.alphaOldValue1038 = 0
			end

			local var_334_16 = 0.5

			if var_334_14 <= arg_331_1.time_ and arg_331_1.time_ < var_334_14 + var_334_16 then
				local var_334_17 = (arg_331_1.time_ - var_334_14) / var_334_16
				local var_334_18 = Mathf.Lerp(arg_331_1.var_.alphaOldValue1038, 1, var_334_17)

				if arg_331_1.var_.characterEffect1038 then
					arg_331_1.var_.characterEffect1038.alpha = var_334_18
				end
			end

			if arg_331_1.time_ >= var_334_14 + var_334_16 and arg_331_1.time_ < var_334_14 + var_334_16 + arg_334_0 and arg_331_1.var_.characterEffect1038 then
				arg_331_1.var_.characterEffect1038.alpha = 1
			end

			local var_334_19 = 0
			local var_334_20 = 0.45

			if var_334_19 < arg_331_1.time_ and arg_331_1.time_ <= var_334_19 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_21 = arg_331_1:FormatText(StoryNameCfg[94].name)

				arg_331_1.leftNameTxt_.text = var_334_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_22 = arg_331_1:GetWordFromCfg(115261082)
				local var_334_23 = arg_331_1:FormatText(var_334_22.content)

				arg_331_1.text_.text = var_334_23

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_24 = 18
				local var_334_25 = utf8.len(var_334_23)
				local var_334_26 = var_334_24 <= 0 and var_334_20 or var_334_20 * (var_334_25 / var_334_24)

				if var_334_26 > 0 and var_334_20 < var_334_26 then
					arg_331_1.talkMaxDuration = var_334_26

					if var_334_26 + var_334_19 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_26 + var_334_19
					end
				end

				arg_331_1.text_.text = var_334_23
				arg_331_1.typewritter.percent = 0

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261082", "story_v_out_115261.awb") ~= 0 then
					local var_334_27 = manager.audio:GetVoiceLength("story_v_out_115261", "115261082", "story_v_out_115261.awb") / 1000

					if var_334_27 + var_334_19 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_27 + var_334_19
					end

					if var_334_22.prefab_name ~= "" and arg_331_1.actors_[var_334_22.prefab_name] ~= nil then
						local var_334_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_331_1.actors_[var_334_22.prefab_name].transform, "story_v_out_115261", "115261082", "story_v_out_115261.awb")

						arg_331_1:RecordAudio("115261082", var_334_28)
						arg_331_1:RecordAudio("115261082", var_334_28)
					else
						arg_331_1:AudioAction("play", "voice", "story_v_out_115261", "115261082", "story_v_out_115261.awb")
					end

					arg_331_1:RecordHistoryTalkVoice("story_v_out_115261", "115261082", "story_v_out_115261.awb")
				end

				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_29 = math.max(var_334_20, arg_331_1.talkMaxDuration)

			if var_334_19 <= arg_331_1.time_ and arg_331_1.time_ < var_334_19 + var_334_29 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_19) / var_334_29

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_19 + var_334_29 and arg_331_1.time_ < var_334_19 + var_334_29 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play115261083 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 115261083
		arg_335_1.duration_ = 8.333

		local var_335_0 = {
			ja = 8.333,
			ko = 7.5,
			zh = 8.3,
			en = 7.4
		}
		local var_335_1 = manager.audio:GetLocalizationFlag()

		if var_335_0[var_335_1] ~= nil then
			arg_335_1.duration_ = var_335_0[var_335_1]
		end

		SetActive(arg_335_1.tipsGo_, false)

		function arg_335_1.onSingleLineFinish_()
			arg_335_1.onSingleLineUpdate_ = nil
			arg_335_1.onSingleLineFinish_ = nil
			arg_335_1.state_ = "waiting"
		end

		function arg_335_1.playNext_(arg_337_0)
			if arg_337_0 == 1 then
				arg_335_0:Play115261084(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = "ST27a"

			if arg_335_1.bgs_[var_338_0] == nil then
				local var_338_1 = Object.Instantiate(arg_335_1.paintGo_)

				var_338_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_338_0)
				var_338_1.name = var_338_0
				var_338_1.transform.parent = arg_335_1.stage_.transform
				var_338_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_335_1.bgs_[var_338_0] = var_338_1
			end

			local var_338_2 = 2

			if var_338_2 < arg_335_1.time_ and arg_335_1.time_ <= var_338_2 + arg_338_0 then
				local var_338_3 = manager.ui.mainCamera.transform.localPosition
				local var_338_4 = Vector3.New(0, 0, 10) + Vector3.New(var_338_3.x, var_338_3.y, 0)
				local var_338_5 = arg_335_1.bgs_.ST27a

				var_338_5.transform.localPosition = var_338_4
				var_338_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_338_6 = var_338_5:GetComponent("SpriteRenderer")

				if var_338_6 and var_338_6.sprite then
					local var_338_7 = (var_338_5.transform.localPosition - var_338_3).z
					local var_338_8 = manager.ui.mainCameraCom_
					local var_338_9 = 2 * var_338_7 * Mathf.Tan(var_338_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_338_10 = var_338_9 * var_338_8.aspect
					local var_338_11 = var_338_6.sprite.bounds.size.x
					local var_338_12 = var_338_6.sprite.bounds.size.y
					local var_338_13 = var_338_10 / var_338_11
					local var_338_14 = var_338_9 / var_338_12
					local var_338_15 = var_338_14 < var_338_13 and var_338_13 or var_338_14

					var_338_5.transform.localScale = Vector3.New(var_338_15, var_338_15, 0)
				end

				for iter_338_0, iter_338_1 in pairs(arg_335_1.bgs_) do
					if iter_338_0 ~= "ST27a" then
						iter_338_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_338_16 = arg_335_1.actors_["1038"].transform
			local var_338_17 = 1.99933333333333

			if var_338_17 < arg_335_1.time_ and arg_335_1.time_ <= var_338_17 + arg_338_0 then
				arg_335_1.var_.moveOldPos1038 = var_338_16.localPosition
				var_338_16.localScale = Vector3.New(1, 1, 1)

				arg_335_1:CheckSpriteTmpPos("1038", 0)

				local var_338_18 = var_338_16.childCount

				for iter_338_2 = 0, var_338_18 - 1 do
					local var_338_19 = var_338_16:GetChild(iter_338_2)

					if var_338_19.name == "split_9" or not string.find(var_338_19.name, "split") then
						var_338_19.gameObject:SetActive(true)
					else
						var_338_19.gameObject:SetActive(false)
					end
				end
			end

			local var_338_20 = 0.001

			if var_338_17 <= arg_335_1.time_ and arg_335_1.time_ < var_338_17 + var_338_20 then
				local var_338_21 = (arg_335_1.time_ - var_338_17) / var_338_20
				local var_338_22 = Vector3.New(-2000, -400, 0)

				var_338_16.localPosition = Vector3.Lerp(arg_335_1.var_.moveOldPos1038, var_338_22, var_338_21)
			end

			if arg_335_1.time_ >= var_338_17 + var_338_20 and arg_335_1.time_ < var_338_17 + var_338_20 + arg_338_0 then
				var_338_16.localPosition = Vector3.New(-2000, -400, 0)
			end

			local var_338_23 = arg_335_1.actors_["10030"].transform
			local var_338_24 = 4

			if var_338_24 < arg_335_1.time_ and arg_335_1.time_ <= var_338_24 + arg_338_0 then
				arg_335_1.var_.moveOldPos10030 = var_338_23.localPosition
				var_338_23.localScale = Vector3.New(1, 1, 1)

				arg_335_1:CheckSpriteTmpPos("10030", 3)

				local var_338_25 = var_338_23.childCount

				for iter_338_3 = 0, var_338_25 - 1 do
					local var_338_26 = var_338_23:GetChild(iter_338_3)

					if var_338_26.name == "split_3" or not string.find(var_338_26.name, "split") then
						var_338_26.gameObject:SetActive(true)
					else
						var_338_26.gameObject:SetActive(false)
					end
				end
			end

			local var_338_27 = 0.001

			if var_338_24 <= arg_335_1.time_ and arg_335_1.time_ < var_338_24 + var_338_27 then
				local var_338_28 = (arg_335_1.time_ - var_338_24) / var_338_27
				local var_338_29 = Vector3.New(0, -390, 150)

				var_338_23.localPosition = Vector3.Lerp(arg_335_1.var_.moveOldPos10030, var_338_29, var_338_28)
			end

			if arg_335_1.time_ >= var_338_24 + var_338_27 and arg_335_1.time_ < var_338_24 + var_338_27 + arg_338_0 then
				var_338_23.localPosition = Vector3.New(0, -390, 150)
			end

			local var_338_30 = arg_335_1.actors_["10030"]
			local var_338_31 = 4

			if var_338_31 < arg_335_1.time_ and arg_335_1.time_ <= var_338_31 + arg_338_0 and arg_335_1.var_.actorSpriteComps10030 == nil then
				arg_335_1.var_.actorSpriteComps10030 = var_338_30:GetComponentsInChildren(typeof(Image), true)
			end

			local var_338_32 = 0.2

			if var_338_31 <= arg_335_1.time_ and arg_335_1.time_ < var_338_31 + var_338_32 then
				local var_338_33 = (arg_335_1.time_ - var_338_31) / var_338_32

				if arg_335_1.var_.actorSpriteComps10030 then
					for iter_338_4, iter_338_5 in pairs(arg_335_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_338_5 then
							local var_338_34 = Mathf.Lerp(iter_338_5.color.r, 1, var_338_33)

							iter_338_5.color = Color.New(var_338_34, var_338_34, var_338_34)
						end
					end
				end
			end

			if arg_335_1.time_ >= var_338_31 + var_338_32 and arg_335_1.time_ < var_338_31 + var_338_32 + arg_338_0 and arg_335_1.var_.actorSpriteComps10030 then
				local var_338_35 = 1

				for iter_338_6, iter_338_7 in pairs(arg_335_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_338_7 then
						iter_338_7.color = Color.New(var_338_35, var_338_35, var_338_35)
					end
				end

				arg_335_1.var_.actorSpriteComps10030 = nil
			end

			local var_338_36 = 0

			if var_338_36 < arg_335_1.time_ and arg_335_1.time_ <= var_338_36 + arg_338_0 then
				arg_335_1.mask_.enabled = true
				arg_335_1.mask_.raycastTarget = true

				arg_335_1:SetGaussion(false)
			end

			local var_338_37 = 2

			if var_338_36 <= arg_335_1.time_ and arg_335_1.time_ < var_338_36 + var_338_37 then
				local var_338_38 = (arg_335_1.time_ - var_338_36) / var_338_37
				local var_338_39 = Color.New(0, 0, 0)

				var_338_39.a = Mathf.Lerp(0, 1, var_338_38)
				arg_335_1.mask_.color = var_338_39
			end

			if arg_335_1.time_ >= var_338_36 + var_338_37 and arg_335_1.time_ < var_338_36 + var_338_37 + arg_338_0 then
				local var_338_40 = Color.New(0, 0, 0)

				var_338_40.a = 1
				arg_335_1.mask_.color = var_338_40
			end

			local var_338_41 = 2

			if var_338_41 < arg_335_1.time_ and arg_335_1.time_ <= var_338_41 + arg_338_0 then
				arg_335_1.mask_.enabled = true
				arg_335_1.mask_.raycastTarget = true

				arg_335_1:SetGaussion(false)
			end

			local var_338_42 = 2

			if var_338_41 <= arg_335_1.time_ and arg_335_1.time_ < var_338_41 + var_338_42 then
				local var_338_43 = (arg_335_1.time_ - var_338_41) / var_338_42
				local var_338_44 = Color.New(0, 0, 0)

				var_338_44.a = Mathf.Lerp(1, 0, var_338_43)
				arg_335_1.mask_.color = var_338_44
			end

			if arg_335_1.time_ >= var_338_41 + var_338_42 and arg_335_1.time_ < var_338_41 + var_338_42 + arg_338_0 then
				local var_338_45 = Color.New(0, 0, 0)
				local var_338_46 = 0

				arg_335_1.mask_.enabled = false
				var_338_45.a = var_338_46
				arg_335_1.mask_.color = var_338_45
			end

			local var_338_47 = arg_335_1.actors_["10030"]
			local var_338_48 = 4

			if var_338_48 < arg_335_1.time_ and arg_335_1.time_ <= var_338_48 + arg_338_0 then
				local var_338_49 = var_338_47:GetComponentInChildren(typeof(CanvasGroup))

				if var_338_49 then
					arg_335_1.var_.alphaOldValue10030 = var_338_49.alpha
					arg_335_1.var_.characterEffect10030 = var_338_49
				end

				arg_335_1.var_.alphaOldValue10030 = 0
			end

			local var_338_50 = 0.333333333333333

			if var_338_48 <= arg_335_1.time_ and arg_335_1.time_ < var_338_48 + var_338_50 then
				local var_338_51 = (arg_335_1.time_ - var_338_48) / var_338_50
				local var_338_52 = Mathf.Lerp(arg_335_1.var_.alphaOldValue10030, 1, var_338_51)

				if arg_335_1.var_.characterEffect10030 then
					arg_335_1.var_.characterEffect10030.alpha = var_338_52
				end
			end

			if arg_335_1.time_ >= var_338_48 + var_338_50 and arg_335_1.time_ < var_338_48 + var_338_50 + arg_338_0 and arg_335_1.var_.characterEffect10030 then
				arg_335_1.var_.characterEffect10030.alpha = 1
			end

			if arg_335_1.frameCnt_ <= 1 then
				arg_335_1.dialog_:SetActive(false)
			end

			local var_338_53 = 4
			local var_338_54 = 0.4

			if var_338_53 < arg_335_1.time_ and arg_335_1.time_ <= var_338_53 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0

				arg_335_1.dialog_:SetActive(true)

				local var_338_55 = LeanTween.value(arg_335_1.dialog_, 0, 1, 0.3)

				var_338_55:setOnUpdate(LuaHelper.FloatAction(function(arg_339_0)
					arg_335_1.dialogCg_.alpha = arg_339_0
				end))
				var_338_55:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_335_1.dialog_)
					var_338_55:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_335_1.duration_ = arg_335_1.duration_ + 0.3

				SetActive(arg_335_1.leftNameGo_, true)

				local var_338_56 = arg_335_1:FormatText(StoryNameCfg[309].name)

				arg_335_1.leftNameTxt_.text = var_338_56

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_335_1.leftNameTxt_.transform)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1.leftNameTxt_.text)
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_57 = arg_335_1:GetWordFromCfg(115261083)
				local var_338_58 = arg_335_1:FormatText(var_338_57.content)

				arg_335_1.text_.text = var_338_58

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_59 = 16
				local var_338_60 = utf8.len(var_338_58)
				local var_338_61 = var_338_59 <= 0 and var_338_54 or var_338_54 * (var_338_60 / var_338_59)

				if var_338_61 > 0 and var_338_54 < var_338_61 then
					arg_335_1.talkMaxDuration = var_338_61
					var_338_53 = var_338_53 + 0.3

					if var_338_61 + var_338_53 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_61 + var_338_53
					end
				end

				arg_335_1.text_.text = var_338_58
				arg_335_1.typewritter.percent = 0

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261083", "story_v_out_115261.awb") ~= 0 then
					local var_338_62 = manager.audio:GetVoiceLength("story_v_out_115261", "115261083", "story_v_out_115261.awb") / 1000

					if var_338_62 + var_338_53 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_62 + var_338_53
					end

					if var_338_57.prefab_name ~= "" and arg_335_1.actors_[var_338_57.prefab_name] ~= nil then
						local var_338_63 = LuaForUtil.PlayVoiceWithCriLipsync(arg_335_1.actors_[var_338_57.prefab_name].transform, "story_v_out_115261", "115261083", "story_v_out_115261.awb")

						arg_335_1:RecordAudio("115261083", var_338_63)
						arg_335_1:RecordAudio("115261083", var_338_63)
					else
						arg_335_1:AudioAction("play", "voice", "story_v_out_115261", "115261083", "story_v_out_115261.awb")
					end

					arg_335_1:RecordHistoryTalkVoice("story_v_out_115261", "115261083", "story_v_out_115261.awb")
				end

				arg_335_1:RecordContent(arg_335_1.text_.text)
			end

			local var_338_64 = var_338_53 + 0.3
			local var_338_65 = math.max(var_338_54, arg_335_1.talkMaxDuration)

			if var_338_64 <= arg_335_1.time_ and arg_335_1.time_ < var_338_64 + var_338_65 then
				arg_335_1.typewritter.percent = (arg_335_1.time_ - var_338_64) / var_338_65

				arg_335_1.typewritter:SetDirty()
			end

			if arg_335_1.time_ >= var_338_64 + var_338_65 and arg_335_1.time_ < var_338_64 + var_338_65 + arg_338_0 then
				arg_335_1.typewritter.percent = 1

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(true)
			end
		end
	end,
	Play115261084 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 115261084
		arg_341_1.duration_ = 5

		SetActive(arg_341_1.tipsGo_, false)

		function arg_341_1.onSingleLineFinish_()
			arg_341_1.onSingleLineUpdate_ = nil
			arg_341_1.onSingleLineFinish_ = nil
			arg_341_1.state_ = "waiting"
		end

		function arg_341_1.playNext_(arg_343_0)
			if arg_343_0 == 1 then
				arg_341_0:Play115261085(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = arg_341_1.actors_["10030"]
			local var_344_1 = 0

			if var_344_1 < arg_341_1.time_ and arg_341_1.time_ <= var_344_1 + arg_344_0 then
				local var_344_2 = var_344_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_344_2 then
					arg_341_1.var_.alphaOldValue10030 = var_344_2.alpha
					arg_341_1.var_.characterEffect10030 = var_344_2
				end

				arg_341_1.var_.alphaOldValue10030 = 1
			end

			local var_344_3 = 0.333333333333333

			if var_344_1 <= arg_341_1.time_ and arg_341_1.time_ < var_344_1 + var_344_3 then
				local var_344_4 = (arg_341_1.time_ - var_344_1) / var_344_3
				local var_344_5 = Mathf.Lerp(arg_341_1.var_.alphaOldValue10030, 0, var_344_4)

				if arg_341_1.var_.characterEffect10030 then
					arg_341_1.var_.characterEffect10030.alpha = var_344_5
				end
			end

			if arg_341_1.time_ >= var_344_1 + var_344_3 and arg_341_1.time_ < var_344_1 + var_344_3 + arg_344_0 and arg_341_1.var_.characterEffect10030 then
				arg_341_1.var_.characterEffect10030.alpha = 0
			end

			local var_344_6 = 0
			local var_344_7 = 0.6

			if var_344_6 < arg_341_1.time_ and arg_341_1.time_ <= var_344_6 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, false)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_341_1.iconTrs_.gameObject, false)
				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_8 = arg_341_1:GetWordFromCfg(115261084)
				local var_344_9 = arg_341_1:FormatText(var_344_8.content)

				arg_341_1.text_.text = var_344_9

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_10 = 24
				local var_344_11 = utf8.len(var_344_9)
				local var_344_12 = var_344_10 <= 0 and var_344_7 or var_344_7 * (var_344_11 / var_344_10)

				if var_344_12 > 0 and var_344_7 < var_344_12 then
					arg_341_1.talkMaxDuration = var_344_12

					if var_344_12 + var_344_6 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_12 + var_344_6
					end
				end

				arg_341_1.text_.text = var_344_9
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)
				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_13 = math.max(var_344_7, arg_341_1.talkMaxDuration)

			if var_344_6 <= arg_341_1.time_ and arg_341_1.time_ < var_344_6 + var_344_13 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_6) / var_344_13

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_6 + var_344_13 and arg_341_1.time_ < var_344_6 + var_344_13 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play115261085 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 115261085
		arg_345_1.duration_ = 5

		SetActive(arg_345_1.tipsGo_, false)

		function arg_345_1.onSingleLineFinish_()
			arg_345_1.onSingleLineUpdate_ = nil
			arg_345_1.onSingleLineFinish_ = nil
			arg_345_1.state_ = "waiting"
		end

		function arg_345_1.playNext_(arg_347_0)
			if arg_347_0 == 1 then
				arg_345_0:Play115261086(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = 0
			local var_348_1 = 1.325

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

				local var_348_2 = arg_345_1:GetWordFromCfg(115261085)
				local var_348_3 = arg_345_1:FormatText(var_348_2.content)

				arg_345_1.text_.text = var_348_3

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_4 = 53
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
	Play115261086 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 115261086
		arg_349_1.duration_ = 7.4

		local var_349_0 = {
			ja = 6.866,
			ko = 7.166,
			zh = 7.4,
			en = 5.866
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
				arg_349_0:Play115261087(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = 0
			local var_352_1 = 0.65

			if var_352_0 < arg_349_1.time_ and arg_349_1.time_ <= var_352_0 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0
				arg_349_1.dialogCg_.alpha = 1

				arg_349_1.dialog_:SetActive(true)
				SetActive(arg_349_1.leftNameGo_, true)

				local var_352_2 = arg_349_1:FormatText(StoryNameCfg[310].name)

				arg_349_1.leftNameTxt_.text = var_352_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_349_1.leftNameTxt_.transform)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1.leftNameTxt_.text)
				SetActive(arg_349_1.iconTrs_.gameObject, true)
				arg_349_1.iconController_:SetSelectedState("hero")

				arg_349_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpab")

				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_3 = arg_349_1:GetWordFromCfg(115261086)
				local var_352_4 = arg_349_1:FormatText(var_352_3.content)

				arg_349_1.text_.text = var_352_4

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_5 = 26
				local var_352_6 = utf8.len(var_352_4)
				local var_352_7 = var_352_5 <= 0 and var_352_1 or var_352_1 * (var_352_6 / var_352_5)

				if var_352_7 > 0 and var_352_1 < var_352_7 then
					arg_349_1.talkMaxDuration = var_352_7

					if var_352_7 + var_352_0 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_7 + var_352_0
					end
				end

				arg_349_1.text_.text = var_352_4
				arg_349_1.typewritter.percent = 0

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261086", "story_v_out_115261.awb") ~= 0 then
					local var_352_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261086", "story_v_out_115261.awb") / 1000

					if var_352_8 + var_352_0 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_8 + var_352_0
					end

					if var_352_3.prefab_name ~= "" and arg_349_1.actors_[var_352_3.prefab_name] ~= nil then
						local var_352_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_349_1.actors_[var_352_3.prefab_name].transform, "story_v_out_115261", "115261086", "story_v_out_115261.awb")

						arg_349_1:RecordAudio("115261086", var_352_9)
						arg_349_1:RecordAudio("115261086", var_352_9)
					else
						arg_349_1:AudioAction("play", "voice", "story_v_out_115261", "115261086", "story_v_out_115261.awb")
					end

					arg_349_1:RecordHistoryTalkVoice("story_v_out_115261", "115261086", "story_v_out_115261.awb")
				end

				arg_349_1:RecordContent(arg_349_1.text_.text)
			end

			local var_352_10 = math.max(var_352_1, arg_349_1.talkMaxDuration)

			if var_352_0 <= arg_349_1.time_ and arg_349_1.time_ < var_352_0 + var_352_10 then
				arg_349_1.typewritter.percent = (arg_349_1.time_ - var_352_0) / var_352_10

				arg_349_1.typewritter:SetDirty()
			end

			if arg_349_1.time_ >= var_352_0 + var_352_10 and arg_349_1.time_ < var_352_0 + var_352_10 + arg_352_0 then
				arg_349_1.typewritter.percent = 1

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(true)
			end
		end
	end,
	Play115261087 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 115261087
		arg_353_1.duration_ = 9.966

		local var_353_0 = {
			ja = 7.166,
			ko = 9.9,
			zh = 8.7,
			en = 9.966
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
				arg_353_0:Play115261088(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = 0
			local var_356_1 = 1.075

			if var_356_0 < arg_353_1.time_ and arg_353_1.time_ <= var_356_0 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0
				arg_353_1.dialogCg_.alpha = 1

				arg_353_1.dialog_:SetActive(true)
				SetActive(arg_353_1.leftNameGo_, true)

				local var_356_2 = arg_353_1:FormatText(StoryNameCfg[311].name)

				arg_353_1.leftNameTxt_.text = var_356_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_353_1.leftNameTxt_.transform)

				arg_353_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_353_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_353_1:RecordName(arg_353_1.leftNameTxt_.text)
				SetActive(arg_353_1.iconTrs_.gameObject, true)
				arg_353_1.iconController_:SetSelectedState("hero")

				arg_353_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_reporterm")

				arg_353_1.callingController_:SetSelectedState("normal")

				local var_356_3 = arg_353_1:GetWordFromCfg(115261087)
				local var_356_4 = arg_353_1:FormatText(var_356_3.content)

				arg_353_1.text_.text = var_356_4

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.text_)

				local var_356_5 = 43
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

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261087", "story_v_out_115261.awb") ~= 0 then
					local var_356_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261087", "story_v_out_115261.awb") / 1000

					if var_356_8 + var_356_0 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_8 + var_356_0
					end

					if var_356_3.prefab_name ~= "" and arg_353_1.actors_[var_356_3.prefab_name] ~= nil then
						local var_356_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_353_1.actors_[var_356_3.prefab_name].transform, "story_v_out_115261", "115261087", "story_v_out_115261.awb")

						arg_353_1:RecordAudio("115261087", var_356_9)
						arg_353_1:RecordAudio("115261087", var_356_9)
					else
						arg_353_1:AudioAction("play", "voice", "story_v_out_115261", "115261087", "story_v_out_115261.awb")
					end

					arg_353_1:RecordHistoryTalkVoice("story_v_out_115261", "115261087", "story_v_out_115261.awb")
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
	Play115261088 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 115261088
		arg_357_1.duration_ = 14.766

		local var_357_0 = {
			ja = 10.933,
			ko = 14.766,
			zh = 12.866,
			en = 14.166
		}
		local var_357_1 = manager.audio:GetLocalizationFlag()

		if var_357_0[var_357_1] ~= nil then
			arg_357_1.duration_ = var_357_0[var_357_1]
		end

		SetActive(arg_357_1.tipsGo_, false)

		function arg_357_1.onSingleLineFinish_()
			arg_357_1.onSingleLineUpdate_ = nil
			arg_357_1.onSingleLineFinish_ = nil
			arg_357_1.state_ = "waiting"
		end

		function arg_357_1.playNext_(arg_359_0)
			if arg_359_0 == 1 then
				arg_357_0:Play115261089(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = 0
			local var_360_1 = 1.125

			if var_360_0 < arg_357_1.time_ and arg_357_1.time_ <= var_360_0 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0
				arg_357_1.dialogCg_.alpha = 1

				arg_357_1.dialog_:SetActive(true)
				SetActive(arg_357_1.leftNameGo_, true)

				local var_360_2 = arg_357_1:FormatText(StoryNameCfg[310].name)

				arg_357_1.leftNameTxt_.text = var_360_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_357_1.leftNameTxt_.transform)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1.leftNameTxt_.text)
				SetActive(arg_357_1.iconTrs_.gameObject, true)
				arg_357_1.iconController_:SetSelectedState("hero")

				arg_357_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpab")

				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_3 = arg_357_1:GetWordFromCfg(115261088)
				local var_360_4 = arg_357_1:FormatText(var_360_3.content)

				arg_357_1.text_.text = var_360_4

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_5 = 45
				local var_360_6 = utf8.len(var_360_4)
				local var_360_7 = var_360_5 <= 0 and var_360_1 or var_360_1 * (var_360_6 / var_360_5)

				if var_360_7 > 0 and var_360_1 < var_360_7 then
					arg_357_1.talkMaxDuration = var_360_7

					if var_360_7 + var_360_0 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_7 + var_360_0
					end
				end

				arg_357_1.text_.text = var_360_4
				arg_357_1.typewritter.percent = 0

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261088", "story_v_out_115261.awb") ~= 0 then
					local var_360_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261088", "story_v_out_115261.awb") / 1000

					if var_360_8 + var_360_0 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_8 + var_360_0
					end

					if var_360_3.prefab_name ~= "" and arg_357_1.actors_[var_360_3.prefab_name] ~= nil then
						local var_360_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_357_1.actors_[var_360_3.prefab_name].transform, "story_v_out_115261", "115261088", "story_v_out_115261.awb")

						arg_357_1:RecordAudio("115261088", var_360_9)
						arg_357_1:RecordAudio("115261088", var_360_9)
					else
						arg_357_1:AudioAction("play", "voice", "story_v_out_115261", "115261088", "story_v_out_115261.awb")
					end

					arg_357_1:RecordHistoryTalkVoice("story_v_out_115261", "115261088", "story_v_out_115261.awb")
				end

				arg_357_1:RecordContent(arg_357_1.text_.text)
			end

			local var_360_10 = math.max(var_360_1, arg_357_1.talkMaxDuration)

			if var_360_0 <= arg_357_1.time_ and arg_357_1.time_ < var_360_0 + var_360_10 then
				arg_357_1.typewritter.percent = (arg_357_1.time_ - var_360_0) / var_360_10

				arg_357_1.typewritter:SetDirty()
			end

			if arg_357_1.time_ >= var_360_0 + var_360_10 and arg_357_1.time_ < var_360_0 + var_360_10 + arg_360_0 then
				arg_357_1.typewritter.percent = 1

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(true)
			end
		end
	end,
	Play115261089 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 115261089
		arg_361_1.duration_ = 5

		SetActive(arg_361_1.tipsGo_, false)

		function arg_361_1.onSingleLineFinish_()
			arg_361_1.onSingleLineUpdate_ = nil
			arg_361_1.onSingleLineFinish_ = nil
			arg_361_1.state_ = "waiting"
		end

		function arg_361_1.playNext_(arg_363_0)
			if arg_363_0 == 1 then
				arg_361_0:Play115261090(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = 0
			local var_364_1 = 1.575

			if var_364_0 < arg_361_1.time_ and arg_361_1.time_ <= var_364_0 + arg_364_0 then
				arg_361_1.talkMaxDuration = 0
				arg_361_1.dialogCg_.alpha = 1

				arg_361_1.dialog_:SetActive(true)
				SetActive(arg_361_1.leftNameGo_, false)

				arg_361_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_361_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_361_1:RecordName(arg_361_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_361_1.iconTrs_.gameObject, false)
				arg_361_1.callingController_:SetSelectedState("normal")

				local var_364_2 = arg_361_1:GetWordFromCfg(115261089)
				local var_364_3 = arg_361_1:FormatText(var_364_2.content)

				arg_361_1.text_.text = var_364_3

				LuaForUtil.ClearLinePrefixSymbol(arg_361_1.text_)

				local var_364_4 = 63
				local var_364_5 = utf8.len(var_364_3)
				local var_364_6 = var_364_4 <= 0 and var_364_1 or var_364_1 * (var_364_5 / var_364_4)

				if var_364_6 > 0 and var_364_1 < var_364_6 then
					arg_361_1.talkMaxDuration = var_364_6

					if var_364_6 + var_364_0 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_6 + var_364_0
					end
				end

				arg_361_1.text_.text = var_364_3
				arg_361_1.typewritter.percent = 0

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(false)
				arg_361_1:RecordContent(arg_361_1.text_.text)
			end

			local var_364_7 = math.max(var_364_1, arg_361_1.talkMaxDuration)

			if var_364_0 <= arg_361_1.time_ and arg_361_1.time_ < var_364_0 + var_364_7 then
				arg_361_1.typewritter.percent = (arg_361_1.time_ - var_364_0) / var_364_7

				arg_361_1.typewritter:SetDirty()
			end

			if arg_361_1.time_ >= var_364_0 + var_364_7 and arg_361_1.time_ < var_364_0 + var_364_7 + arg_364_0 then
				arg_361_1.typewritter.percent = 1

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(true)
			end
		end
	end,
	Play115261090 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 115261090
		arg_365_1.duration_ = 5

		SetActive(arg_365_1.tipsGo_, false)

		function arg_365_1.onSingleLineFinish_()
			arg_365_1.onSingleLineUpdate_ = nil
			arg_365_1.onSingleLineFinish_ = nil
			arg_365_1.state_ = "waiting"
		end

		function arg_365_1.playNext_(arg_367_0)
			if arg_367_0 == 1 then
				arg_365_0:Play115261091(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = 0
			local var_368_1 = 0.325

			if var_368_0 < arg_365_1.time_ and arg_365_1.time_ <= var_368_0 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0
				arg_365_1.dialogCg_.alpha = 1

				arg_365_1.dialog_:SetActive(true)
				SetActive(arg_365_1.leftNameGo_, false)

				arg_365_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_365_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_365_1:RecordName(arg_365_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_365_1.iconTrs_.gameObject, false)
				arg_365_1.callingController_:SetSelectedState("normal")

				local var_368_2 = arg_365_1:GetWordFromCfg(115261090)
				local var_368_3 = arg_365_1:FormatText(var_368_2.content)

				arg_365_1.text_.text = var_368_3

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.text_)

				local var_368_4 = 13
				local var_368_5 = utf8.len(var_368_3)
				local var_368_6 = var_368_4 <= 0 and var_368_1 or var_368_1 * (var_368_5 / var_368_4)

				if var_368_6 > 0 and var_368_1 < var_368_6 then
					arg_365_1.talkMaxDuration = var_368_6

					if var_368_6 + var_368_0 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_6 + var_368_0
					end
				end

				arg_365_1.text_.text = var_368_3
				arg_365_1.typewritter.percent = 0

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(false)
				arg_365_1:RecordContent(arg_365_1.text_.text)
			end

			local var_368_7 = math.max(var_368_1, arg_365_1.talkMaxDuration)

			if var_368_0 <= arg_365_1.time_ and arg_365_1.time_ < var_368_0 + var_368_7 then
				arg_365_1.typewritter.percent = (arg_365_1.time_ - var_368_0) / var_368_7

				arg_365_1.typewritter:SetDirty()
			end

			if arg_365_1.time_ >= var_368_0 + var_368_7 and arg_365_1.time_ < var_368_0 + var_368_7 + arg_368_0 then
				arg_365_1.typewritter.percent = 1

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(true)
			end
		end
	end,
	Play115261091 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 115261091
		arg_369_1.duration_ = 14.466

		local var_369_0 = {
			ja = 12.8,
			ko = 13.866,
			zh = 12.066,
			en = 14.466
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
				arg_369_0:Play115261092(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = "10029"

			if arg_369_1.actors_[var_372_0] == nil then
				local var_372_1 = Object.Instantiate(arg_369_1.imageGo_, arg_369_1.canvasGo_.transform)

				var_372_1.transform:SetSiblingIndex(1)

				var_372_1.name = var_372_0

				local var_372_2 = var_372_1:GetComponent(typeof(Image))

				var_372_2.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. var_372_0)

				var_372_2:SetNativeSize()

				var_372_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_369_1.actors_[var_372_0] = var_372_1
			end

			local var_372_3 = arg_369_1.actors_["10029"].transform
			local var_372_4 = 0

			if var_372_4 < arg_369_1.time_ and arg_369_1.time_ <= var_372_4 + arg_372_0 then
				arg_369_1.var_.moveOldPos10029 = var_372_3.localPosition
				var_372_3.localScale = Vector3.New(1, 1, 1)

				arg_369_1:CheckSpriteTmpPos("10029", 3)
			end

			local var_372_5 = 0.001

			if var_372_4 <= arg_369_1.time_ and arg_369_1.time_ < var_372_4 + var_372_5 then
				local var_372_6 = (arg_369_1.time_ - var_372_4) / var_372_5
				local var_372_7 = Vector3.New(0, -350, -180)

				var_372_3.localPosition = Vector3.Lerp(arg_369_1.var_.moveOldPos10029, var_372_7, var_372_6)
			end

			if arg_369_1.time_ >= var_372_4 + var_372_5 and arg_369_1.time_ < var_372_4 + var_372_5 + arg_372_0 then
				var_372_3.localPosition = Vector3.New(0, -350, -180)
			end

			local var_372_8 = arg_369_1.actors_["10029"]
			local var_372_9 = 0

			if var_372_9 < arg_369_1.time_ and arg_369_1.time_ <= var_372_9 + arg_372_0 then
				local var_372_10 = var_372_8:GetComponent("Image")

				if var_372_10 then
					arg_369_1.var_.alphaMatValue10029 = var_372_10
					arg_369_1.var_.alphaOldValue10029 = var_372_10.color.a
				end

				arg_369_1.var_.alphaOldValue10029 = 0
			end

			local var_372_11 = 0.333333333333333

			if var_372_9 <= arg_369_1.time_ and arg_369_1.time_ < var_372_9 + var_372_11 then
				local var_372_12 = (arg_369_1.time_ - var_372_9) / var_372_11
				local var_372_13 = Mathf.Lerp(arg_369_1.var_.alphaOldValue10029, 1, var_372_12)

				if arg_369_1.var_.alphaMatValue10029 then
					local var_372_14 = arg_369_1.var_.alphaMatValue10029.color

					var_372_14.a = var_372_13
					arg_369_1.var_.alphaMatValue10029.color = var_372_14
				end
			end

			if arg_369_1.time_ >= var_372_9 + var_372_11 and arg_369_1.time_ < var_372_9 + var_372_11 + arg_372_0 and arg_369_1.var_.alphaMatValue10029 then
				local var_372_15 = arg_369_1.var_.alphaMatValue10029
				local var_372_16 = var_372_15.color

				var_372_16.a = 1
				var_372_15.color = var_372_16
			end

			local var_372_17 = 0
			local var_372_18 = 1.1

			if var_372_17 < arg_369_1.time_ and arg_369_1.time_ <= var_372_17 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0
				arg_369_1.dialogCg_.alpha = 1

				arg_369_1.dialog_:SetActive(true)
				SetActive(arg_369_1.leftNameGo_, true)

				local var_372_19 = arg_369_1:FormatText(StoryNameCfg[312].name)

				arg_369_1.leftNameTxt_.text = var_372_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_369_1.leftNameTxt_.transform)

				arg_369_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_369_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_369_1:RecordName(arg_369_1.leftNameTxt_.text)
				SetActive(arg_369_1.iconTrs_.gameObject, false)
				arg_369_1.callingController_:SetSelectedState("normal")

				local var_372_20 = arg_369_1:GetWordFromCfg(115261091)
				local var_372_21 = arg_369_1:FormatText(var_372_20.content)

				arg_369_1.text_.text = var_372_21

				LuaForUtil.ClearLinePrefixSymbol(arg_369_1.text_)

				local var_372_22 = 43
				local var_372_23 = utf8.len(var_372_21)
				local var_372_24 = var_372_22 <= 0 and var_372_18 or var_372_18 * (var_372_23 / var_372_22)

				if var_372_24 > 0 and var_372_18 < var_372_24 then
					arg_369_1.talkMaxDuration = var_372_24

					if var_372_24 + var_372_17 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_24 + var_372_17
					end
				end

				arg_369_1.text_.text = var_372_21
				arg_369_1.typewritter.percent = 0

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261091", "story_v_out_115261.awb") ~= 0 then
					local var_372_25 = manager.audio:GetVoiceLength("story_v_out_115261", "115261091", "story_v_out_115261.awb") / 1000

					if var_372_25 + var_372_17 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_25 + var_372_17
					end

					if var_372_20.prefab_name ~= "" and arg_369_1.actors_[var_372_20.prefab_name] ~= nil then
						local var_372_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_369_1.actors_[var_372_20.prefab_name].transform, "story_v_out_115261", "115261091", "story_v_out_115261.awb")

						arg_369_1:RecordAudio("115261091", var_372_26)
						arg_369_1:RecordAudio("115261091", var_372_26)
					else
						arg_369_1:AudioAction("play", "voice", "story_v_out_115261", "115261091", "story_v_out_115261.awb")
					end

					arg_369_1:RecordHistoryTalkVoice("story_v_out_115261", "115261091", "story_v_out_115261.awb")
				end

				arg_369_1:RecordContent(arg_369_1.text_.text)
			end

			local var_372_27 = math.max(var_372_18, arg_369_1.talkMaxDuration)

			if var_372_17 <= arg_369_1.time_ and arg_369_1.time_ < var_372_17 + var_372_27 then
				arg_369_1.typewritter.percent = (arg_369_1.time_ - var_372_17) / var_372_27

				arg_369_1.typewritter:SetDirty()
			end

			if arg_369_1.time_ >= var_372_17 + var_372_27 and arg_369_1.time_ < var_372_17 + var_372_27 + arg_372_0 then
				arg_369_1.typewritter.percent = 1

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(true)
			end
		end
	end,
	Play115261092 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 115261092
		arg_373_1.duration_ = 12.166

		local var_373_0 = {
			ja = 3.033,
			ko = 8.933,
			zh = 7.833,
			en = 12.166
		}
		local var_373_1 = manager.audio:GetLocalizationFlag()

		if var_373_0[var_373_1] ~= nil then
			arg_373_1.duration_ = var_373_0[var_373_1]
		end

		SetActive(arg_373_1.tipsGo_, false)

		function arg_373_1.onSingleLineFinish_()
			arg_373_1.onSingleLineUpdate_ = nil
			arg_373_1.onSingleLineFinish_ = nil
			arg_373_1.state_ = "waiting"
		end

		function arg_373_1.playNext_(arg_375_0)
			if arg_375_0 == 1 then
				arg_373_0:Play115261093(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = 0
			local var_376_1 = 0.925

			if var_376_0 < arg_373_1.time_ and arg_373_1.time_ <= var_376_0 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0
				arg_373_1.dialogCg_.alpha = 1

				arg_373_1.dialog_:SetActive(true)
				SetActive(arg_373_1.leftNameGo_, true)

				local var_376_2 = arg_373_1:FormatText(StoryNameCfg[312].name)

				arg_373_1.leftNameTxt_.text = var_376_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_373_1.leftNameTxt_.transform)

				arg_373_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_373_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_373_1:RecordName(arg_373_1.leftNameTxt_.text)
				SetActive(arg_373_1.iconTrs_.gameObject, false)
				arg_373_1.callingController_:SetSelectedState("normal")

				local var_376_3 = arg_373_1:GetWordFromCfg(115261092)
				local var_376_4 = arg_373_1:FormatText(var_376_3.content)

				arg_373_1.text_.text = var_376_4

				LuaForUtil.ClearLinePrefixSymbol(arg_373_1.text_)

				local var_376_5 = 37
				local var_376_6 = utf8.len(var_376_4)
				local var_376_7 = var_376_5 <= 0 and var_376_1 or var_376_1 * (var_376_6 / var_376_5)

				if var_376_7 > 0 and var_376_1 < var_376_7 then
					arg_373_1.talkMaxDuration = var_376_7

					if var_376_7 + var_376_0 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_7 + var_376_0
					end
				end

				arg_373_1.text_.text = var_376_4
				arg_373_1.typewritter.percent = 0

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261092", "story_v_out_115261.awb") ~= 0 then
					local var_376_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261092", "story_v_out_115261.awb") / 1000

					if var_376_8 + var_376_0 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_8 + var_376_0
					end

					if var_376_3.prefab_name ~= "" and arg_373_1.actors_[var_376_3.prefab_name] ~= nil then
						local var_376_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_373_1.actors_[var_376_3.prefab_name].transform, "story_v_out_115261", "115261092", "story_v_out_115261.awb")

						arg_373_1:RecordAudio("115261092", var_376_9)
						arg_373_1:RecordAudio("115261092", var_376_9)
					else
						arg_373_1:AudioAction("play", "voice", "story_v_out_115261", "115261092", "story_v_out_115261.awb")
					end

					arg_373_1:RecordHistoryTalkVoice("story_v_out_115261", "115261092", "story_v_out_115261.awb")
				end

				arg_373_1:RecordContent(arg_373_1.text_.text)
			end

			local var_376_10 = math.max(var_376_1, arg_373_1.talkMaxDuration)

			if var_376_0 <= arg_373_1.time_ and arg_373_1.time_ < var_376_0 + var_376_10 then
				arg_373_1.typewritter.percent = (arg_373_1.time_ - var_376_0) / var_376_10

				arg_373_1.typewritter:SetDirty()
			end

			if arg_373_1.time_ >= var_376_0 + var_376_10 and arg_373_1.time_ < var_376_0 + var_376_10 + arg_376_0 then
				arg_373_1.typewritter.percent = 1

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(true)
			end
		end
	end,
	Play115261093 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 115261093
		arg_377_1.duration_ = 5

		SetActive(arg_377_1.tipsGo_, false)

		function arg_377_1.onSingleLineFinish_()
			arg_377_1.onSingleLineUpdate_ = nil
			arg_377_1.onSingleLineFinish_ = nil
			arg_377_1.state_ = "waiting"
		end

		function arg_377_1.playNext_(arg_379_0)
			if arg_379_0 == 1 then
				arg_377_0:Play115261094(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = arg_377_1.actors_["10029"]
			local var_380_1 = 0

			if var_380_1 < arg_377_1.time_ and arg_377_1.time_ <= var_380_1 + arg_380_0 then
				local var_380_2 = var_380_0:GetComponent("Image")

				if var_380_2 then
					arg_377_1.var_.alphaMatValue10029 = var_380_2
					arg_377_1.var_.alphaOldValue10029 = var_380_2.color.a
				end

				arg_377_1.var_.alphaOldValue10029 = 1
			end

			local var_380_3 = 0.333333333333333

			if var_380_1 <= arg_377_1.time_ and arg_377_1.time_ < var_380_1 + var_380_3 then
				local var_380_4 = (arg_377_1.time_ - var_380_1) / var_380_3
				local var_380_5 = Mathf.Lerp(arg_377_1.var_.alphaOldValue10029, 0, var_380_4)

				if arg_377_1.var_.alphaMatValue10029 then
					local var_380_6 = arg_377_1.var_.alphaMatValue10029.color

					var_380_6.a = var_380_5
					arg_377_1.var_.alphaMatValue10029.color = var_380_6
				end
			end

			if arg_377_1.time_ >= var_380_1 + var_380_3 and arg_377_1.time_ < var_380_1 + var_380_3 + arg_380_0 and arg_377_1.var_.alphaMatValue10029 then
				local var_380_7 = arg_377_1.var_.alphaMatValue10029
				local var_380_8 = var_380_7.color

				var_380_8.a = 0
				var_380_7.color = var_380_8
			end

			local var_380_9 = 0
			local var_380_10 = 1.225

			if var_380_9 < arg_377_1.time_ and arg_377_1.time_ <= var_380_9 + arg_380_0 then
				arg_377_1.talkMaxDuration = 0
				arg_377_1.dialogCg_.alpha = 1

				arg_377_1.dialog_:SetActive(true)
				SetActive(arg_377_1.leftNameGo_, false)

				arg_377_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_377_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_377_1:RecordName(arg_377_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_377_1.iconTrs_.gameObject, false)
				arg_377_1.callingController_:SetSelectedState("normal")

				local var_380_11 = arg_377_1:GetWordFromCfg(115261093)
				local var_380_12 = arg_377_1:FormatText(var_380_11.content)

				arg_377_1.text_.text = var_380_12

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_13 = 49
				local var_380_14 = utf8.len(var_380_12)
				local var_380_15 = var_380_13 <= 0 and var_380_10 or var_380_10 * (var_380_14 / var_380_13)

				if var_380_15 > 0 and var_380_10 < var_380_15 then
					arg_377_1.talkMaxDuration = var_380_15

					if var_380_15 + var_380_9 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_15 + var_380_9
					end
				end

				arg_377_1.text_.text = var_380_12
				arg_377_1.typewritter.percent = 0

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(false)
				arg_377_1:RecordContent(arg_377_1.text_.text)
			end

			local var_380_16 = math.max(var_380_10, arg_377_1.talkMaxDuration)

			if var_380_9 <= arg_377_1.time_ and arg_377_1.time_ < var_380_9 + var_380_16 then
				arg_377_1.typewritter.percent = (arg_377_1.time_ - var_380_9) / var_380_16

				arg_377_1.typewritter:SetDirty()
			end

			if arg_377_1.time_ >= var_380_9 + var_380_16 and arg_377_1.time_ < var_380_9 + var_380_16 + arg_380_0 then
				arg_377_1.typewritter.percent = 1

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(true)
			end
		end
	end,
	Play115261094 = function(arg_381_0, arg_381_1)
		arg_381_1.time_ = 0
		arg_381_1.frameCnt_ = 0
		arg_381_1.state_ = "playing"
		arg_381_1.curTalkId_ = 115261094
		arg_381_1.duration_ = 5

		SetActive(arg_381_1.tipsGo_, false)

		function arg_381_1.onSingleLineFinish_()
			arg_381_1.onSingleLineUpdate_ = nil
			arg_381_1.onSingleLineFinish_ = nil
			arg_381_1.state_ = "waiting"
		end

		function arg_381_1.playNext_(arg_383_0)
			if arg_383_0 == 1 then
				arg_381_0:Play115261095(arg_381_1)
			end
		end

		function arg_381_1.onSingleLineUpdate_(arg_384_0)
			local var_384_0 = 0
			local var_384_1 = 1.2

			if var_384_0 < arg_381_1.time_ and arg_381_1.time_ <= var_384_0 + arg_384_0 then
				arg_381_1.talkMaxDuration = 0
				arg_381_1.dialogCg_.alpha = 1

				arg_381_1.dialog_:SetActive(true)
				SetActive(arg_381_1.leftNameGo_, false)

				arg_381_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_381_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_381_1:RecordName(arg_381_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_381_1.iconTrs_.gameObject, false)
				arg_381_1.callingController_:SetSelectedState("normal")

				local var_384_2 = arg_381_1:GetWordFromCfg(115261094)
				local var_384_3 = arg_381_1:FormatText(var_384_2.content)

				arg_381_1.text_.text = var_384_3

				LuaForUtil.ClearLinePrefixSymbol(arg_381_1.text_)

				local var_384_4 = 48
				local var_384_5 = utf8.len(var_384_3)
				local var_384_6 = var_384_4 <= 0 and var_384_1 or var_384_1 * (var_384_5 / var_384_4)

				if var_384_6 > 0 and var_384_1 < var_384_6 then
					arg_381_1.talkMaxDuration = var_384_6

					if var_384_6 + var_384_0 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_6 + var_384_0
					end
				end

				arg_381_1.text_.text = var_384_3
				arg_381_1.typewritter.percent = 0

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(false)
				arg_381_1:RecordContent(arg_381_1.text_.text)
			end

			local var_384_7 = math.max(var_384_1, arg_381_1.talkMaxDuration)

			if var_384_0 <= arg_381_1.time_ and arg_381_1.time_ < var_384_0 + var_384_7 then
				arg_381_1.typewritter.percent = (arg_381_1.time_ - var_384_0) / var_384_7

				arg_381_1.typewritter:SetDirty()
			end

			if arg_381_1.time_ >= var_384_0 + var_384_7 and arg_381_1.time_ < var_384_0 + var_384_7 + arg_384_0 then
				arg_381_1.typewritter.percent = 1

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(true)
			end
		end
	end,
	Play115261095 = function(arg_385_0, arg_385_1)
		arg_385_1.time_ = 0
		arg_385_1.frameCnt_ = 0
		arg_385_1.state_ = "playing"
		arg_385_1.curTalkId_ = 115261095
		arg_385_1.duration_ = 10.4

		local var_385_0 = {
			ja = 10.4,
			ko = 7.533,
			zh = 6.033,
			en = 9.233
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
				arg_385_0:Play115261096(arg_385_1)
			end
		end

		function arg_385_1.onSingleLineUpdate_(arg_388_0)
			local var_388_0 = arg_385_1.actors_["10030"].transform
			local var_388_1 = 0

			if var_388_1 < arg_385_1.time_ and arg_385_1.time_ <= var_388_1 + arg_388_0 then
				arg_385_1.var_.moveOldPos10030 = var_388_0.localPosition
				var_388_0.localScale = Vector3.New(1, 1, 1)

				arg_385_1:CheckSpriteTmpPos("10030", 4)

				local var_388_2 = var_388_0.childCount

				for iter_388_0 = 0, var_388_2 - 1 do
					local var_388_3 = var_388_0:GetChild(iter_388_0)

					if var_388_3.name == "split_3" or not string.find(var_388_3.name, "split") then
						var_388_3.gameObject:SetActive(true)
					else
						var_388_3.gameObject:SetActive(false)
					end
				end
			end

			local var_388_4 = 0.001

			if var_388_1 <= arg_385_1.time_ and arg_385_1.time_ < var_388_1 + var_388_4 then
				local var_388_5 = (arg_385_1.time_ - var_388_1) / var_388_4
				local var_388_6 = Vector3.New(390, -390, 150)

				var_388_0.localPosition = Vector3.Lerp(arg_385_1.var_.moveOldPos10030, var_388_6, var_388_5)
			end

			if arg_385_1.time_ >= var_388_1 + var_388_4 and arg_385_1.time_ < var_388_1 + var_388_4 + arg_388_0 then
				var_388_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_388_7 = arg_385_1.actors_["10030"]
			local var_388_8 = 0

			if var_388_8 < arg_385_1.time_ and arg_385_1.time_ <= var_388_8 + arg_388_0 then
				local var_388_9 = var_388_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_388_9 then
					arg_385_1.var_.alphaOldValue10030 = var_388_9.alpha
					arg_385_1.var_.characterEffect10030 = var_388_9
				end

				arg_385_1.var_.alphaOldValue10030 = 0
			end

			local var_388_10 = 0.333333333333333

			if var_388_8 <= arg_385_1.time_ and arg_385_1.time_ < var_388_8 + var_388_10 then
				local var_388_11 = (arg_385_1.time_ - var_388_8) / var_388_10
				local var_388_12 = Mathf.Lerp(arg_385_1.var_.alphaOldValue10030, 1, var_388_11)

				if arg_385_1.var_.characterEffect10030 then
					arg_385_1.var_.characterEffect10030.alpha = var_388_12
				end
			end

			if arg_385_1.time_ >= var_388_8 + var_388_10 and arg_385_1.time_ < var_388_8 + var_388_10 + arg_388_0 and arg_385_1.var_.characterEffect10030 then
				arg_385_1.var_.characterEffect10030.alpha = 1
			end

			local var_388_13 = arg_385_1.actors_["10029"].transform
			local var_388_14 = 0

			if var_388_14 < arg_385_1.time_ and arg_385_1.time_ <= var_388_14 + arg_388_0 then
				arg_385_1.var_.moveOldPos10029 = var_388_13.localPosition
				var_388_13.localScale = Vector3.New(1, 1, 1)

				arg_385_1:CheckSpriteTmpPos("10029", 2)
			end

			local var_388_15 = 0.001

			if var_388_14 <= arg_385_1.time_ and arg_385_1.time_ < var_388_14 + var_388_15 then
				local var_388_16 = (arg_385_1.time_ - var_388_14) / var_388_15
				local var_388_17 = Vector3.New(-390, -350, -180)

				var_388_13.localPosition = Vector3.Lerp(arg_385_1.var_.moveOldPos10029, var_388_17, var_388_16)
			end

			if arg_385_1.time_ >= var_388_14 + var_388_15 and arg_385_1.time_ < var_388_14 + var_388_15 + arg_388_0 then
				var_388_13.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_388_18 = arg_385_1.actors_["10029"]
			local var_388_19 = 0

			if var_388_19 < arg_385_1.time_ and arg_385_1.time_ <= var_388_19 + arg_388_0 then
				local var_388_20 = var_388_18:GetComponent("Image")

				if var_388_20 then
					arg_385_1.var_.alphaMatValue10029 = var_388_20
					arg_385_1.var_.alphaOldValue10029 = var_388_20.color.a
				end

				arg_385_1.var_.alphaOldValue10029 = 0
			end

			local var_388_21 = 0.333333333333333

			if var_388_19 <= arg_385_1.time_ and arg_385_1.time_ < var_388_19 + var_388_21 then
				local var_388_22 = (arg_385_1.time_ - var_388_19) / var_388_21
				local var_388_23 = Mathf.Lerp(arg_385_1.var_.alphaOldValue10029, 1, var_388_22)

				if arg_385_1.var_.alphaMatValue10029 then
					local var_388_24 = arg_385_1.var_.alphaMatValue10029.color

					var_388_24.a = var_388_23
					arg_385_1.var_.alphaMatValue10029.color = var_388_24
				end
			end

			if arg_385_1.time_ >= var_388_19 + var_388_21 and arg_385_1.time_ < var_388_19 + var_388_21 + arg_388_0 and arg_385_1.var_.alphaMatValue10029 then
				local var_388_25 = arg_385_1.var_.alphaMatValue10029
				local var_388_26 = var_388_25.color

				var_388_26.a = 1
				var_388_25.color = var_388_26
			end

			local var_388_27 = arg_385_1.actors_["10030"]
			local var_388_28 = 0

			if var_388_28 < arg_385_1.time_ and arg_385_1.time_ <= var_388_28 + arg_388_0 and arg_385_1.var_.actorSpriteComps10030 == nil then
				arg_385_1.var_.actorSpriteComps10030 = var_388_27:GetComponentsInChildren(typeof(Image), true)
			end

			local var_388_29 = 0.2

			if var_388_28 <= arg_385_1.time_ and arg_385_1.time_ < var_388_28 + var_388_29 then
				local var_388_30 = (arg_385_1.time_ - var_388_28) / var_388_29

				if arg_385_1.var_.actorSpriteComps10030 then
					for iter_388_1, iter_388_2 in pairs(arg_385_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_388_2 then
							local var_388_31 = Mathf.Lerp(iter_388_2.color.r, 1, var_388_30)

							iter_388_2.color = Color.New(var_388_31, var_388_31, var_388_31)
						end
					end
				end
			end

			if arg_385_1.time_ >= var_388_28 + var_388_29 and arg_385_1.time_ < var_388_28 + var_388_29 + arg_388_0 and arg_385_1.var_.actorSpriteComps10030 then
				local var_388_32 = 1

				for iter_388_3, iter_388_4 in pairs(arg_385_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_388_4 then
						iter_388_4.color = Color.New(var_388_32, var_388_32, var_388_32)
					end
				end

				arg_385_1.var_.actorSpriteComps10030 = nil
			end

			local var_388_33 = arg_385_1.actors_["10029"]
			local var_388_34 = 0

			if var_388_34 < arg_385_1.time_ and arg_385_1.time_ <= var_388_34 + arg_388_0 then
				local var_388_35 = var_388_33:GetComponent("Image")

				if var_388_35 then
					arg_385_1.var_.highlightMatValue10029 = var_388_35
				end
			end

			local var_388_36 = 0.2

			if var_388_34 <= arg_385_1.time_ and arg_385_1.time_ < var_388_34 + var_388_36 then
				local var_388_37 = (arg_385_1.time_ - var_388_34) / var_388_36

				if arg_385_1.var_.highlightMatValue10029 then
					local var_388_38 = Mathf.Lerp(1, 0.5, var_388_37)
					local var_388_39 = arg_385_1.var_.highlightMatValue10029
					local var_388_40 = var_388_39.color

					var_388_40.r = var_388_38
					var_388_40.g = var_388_38
					var_388_40.b = var_388_38
					var_388_39.color = var_388_40
				end
			end

			if arg_385_1.time_ >= var_388_34 + var_388_36 and arg_385_1.time_ < var_388_34 + var_388_36 + arg_388_0 and arg_385_1.var_.highlightMatValue10029 then
				local var_388_41 = 0.5
				local var_388_42 = arg_385_1.var_.highlightMatValue10029
				local var_388_43 = var_388_42.color

				var_388_43.r = var_388_41
				var_388_43.g = var_388_41
				var_388_43.b = var_388_41
				var_388_42.color = var_388_43
			end

			local var_388_44 = 0
			local var_388_45 = 0.8

			if var_388_44 < arg_385_1.time_ and arg_385_1.time_ <= var_388_44 + arg_388_0 then
				arg_385_1.talkMaxDuration = 0
				arg_385_1.dialogCg_.alpha = 1

				arg_385_1.dialog_:SetActive(true)
				SetActive(arg_385_1.leftNameGo_, true)

				local var_388_46 = arg_385_1:FormatText(StoryNameCfg[309].name)

				arg_385_1.leftNameTxt_.text = var_388_46

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_385_1.leftNameTxt_.transform)

				arg_385_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_385_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_385_1:RecordName(arg_385_1.leftNameTxt_.text)
				SetActive(arg_385_1.iconTrs_.gameObject, false)
				arg_385_1.callingController_:SetSelectedState("normal")

				local var_388_47 = arg_385_1:GetWordFromCfg(115261095)
				local var_388_48 = arg_385_1:FormatText(var_388_47.content)

				arg_385_1.text_.text = var_388_48

				LuaForUtil.ClearLinePrefixSymbol(arg_385_1.text_)

				local var_388_49 = 32
				local var_388_50 = utf8.len(var_388_48)
				local var_388_51 = var_388_49 <= 0 and var_388_45 or var_388_45 * (var_388_50 / var_388_49)

				if var_388_51 > 0 and var_388_45 < var_388_51 then
					arg_385_1.talkMaxDuration = var_388_51

					if var_388_51 + var_388_44 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_51 + var_388_44
					end
				end

				arg_385_1.text_.text = var_388_48
				arg_385_1.typewritter.percent = 0

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261095", "story_v_out_115261.awb") ~= 0 then
					local var_388_52 = manager.audio:GetVoiceLength("story_v_out_115261", "115261095", "story_v_out_115261.awb") / 1000

					if var_388_52 + var_388_44 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_52 + var_388_44
					end

					if var_388_47.prefab_name ~= "" and arg_385_1.actors_[var_388_47.prefab_name] ~= nil then
						local var_388_53 = LuaForUtil.PlayVoiceWithCriLipsync(arg_385_1.actors_[var_388_47.prefab_name].transform, "story_v_out_115261", "115261095", "story_v_out_115261.awb")

						arg_385_1:RecordAudio("115261095", var_388_53)
						arg_385_1:RecordAudio("115261095", var_388_53)
					else
						arg_385_1:AudioAction("play", "voice", "story_v_out_115261", "115261095", "story_v_out_115261.awb")
					end

					arg_385_1:RecordHistoryTalkVoice("story_v_out_115261", "115261095", "story_v_out_115261.awb")
				end

				arg_385_1:RecordContent(arg_385_1.text_.text)
			end

			local var_388_54 = math.max(var_388_45, arg_385_1.talkMaxDuration)

			if var_388_44 <= arg_385_1.time_ and arg_385_1.time_ < var_388_44 + var_388_54 then
				arg_385_1.typewritter.percent = (arg_385_1.time_ - var_388_44) / var_388_54

				arg_385_1.typewritter:SetDirty()
			end

			if arg_385_1.time_ >= var_388_44 + var_388_54 and arg_385_1.time_ < var_388_44 + var_388_54 + arg_388_0 then
				arg_385_1.typewritter.percent = 1

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(true)
			end
		end
	end,
	Play115261096 = function(arg_389_0, arg_389_1)
		arg_389_1.time_ = 0
		arg_389_1.frameCnt_ = 0
		arg_389_1.state_ = "playing"
		arg_389_1.curTalkId_ = 115261096
		arg_389_1.duration_ = 13.066

		local var_389_0 = {
			ja = 10.8,
			ko = 9.9,
			zh = 10.5,
			en = 13.066
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
				arg_389_0:Play115261097(arg_389_1)
			end
		end

		function arg_389_1.onSingleLineUpdate_(arg_392_0)
			local var_392_0 = arg_389_1.actors_["10030"]
			local var_392_1 = 0

			if var_392_1 < arg_389_1.time_ and arg_389_1.time_ <= var_392_1 + arg_392_0 and arg_389_1.var_.actorSpriteComps10030 == nil then
				arg_389_1.var_.actorSpriteComps10030 = var_392_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_392_2 = 0.2

			if var_392_1 <= arg_389_1.time_ and arg_389_1.time_ < var_392_1 + var_392_2 then
				local var_392_3 = (arg_389_1.time_ - var_392_1) / var_392_2

				if arg_389_1.var_.actorSpriteComps10030 then
					for iter_392_0, iter_392_1 in pairs(arg_389_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_392_1 then
							local var_392_4 = Mathf.Lerp(iter_392_1.color.r, 0.5, var_392_3)

							iter_392_1.color = Color.New(var_392_4, var_392_4, var_392_4)
						end
					end
				end
			end

			if arg_389_1.time_ >= var_392_1 + var_392_2 and arg_389_1.time_ < var_392_1 + var_392_2 + arg_392_0 and arg_389_1.var_.actorSpriteComps10030 then
				local var_392_5 = 0.5

				for iter_392_2, iter_392_3 in pairs(arg_389_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_392_3 then
						iter_392_3.color = Color.New(var_392_5, var_392_5, var_392_5)
					end
				end

				arg_389_1.var_.actorSpriteComps10030 = nil
			end

			local var_392_6 = arg_389_1.actors_["10029"]
			local var_392_7 = 0

			if var_392_7 < arg_389_1.time_ and arg_389_1.time_ <= var_392_7 + arg_392_0 then
				local var_392_8 = var_392_6:GetComponent("Image")

				if var_392_8 then
					arg_389_1.var_.highlightMatValue10029 = var_392_8
				end
			end

			local var_392_9 = 0.2

			if var_392_7 <= arg_389_1.time_ and arg_389_1.time_ < var_392_7 + var_392_9 then
				local var_392_10 = (arg_389_1.time_ - var_392_7) / var_392_9

				if arg_389_1.var_.highlightMatValue10029 then
					local var_392_11 = Mathf.Lerp(0.5, 1, var_392_10)
					local var_392_12 = arg_389_1.var_.highlightMatValue10029
					local var_392_13 = var_392_12.color

					var_392_13.r = var_392_11
					var_392_13.g = var_392_11
					var_392_13.b = var_392_11
					var_392_12.color = var_392_13
				end
			end

			if arg_389_1.time_ >= var_392_7 + var_392_9 and arg_389_1.time_ < var_392_7 + var_392_9 + arg_392_0 and arg_389_1.var_.highlightMatValue10029 then
				local var_392_14 = 1

				var_392_6.transform:SetSiblingIndex(1)

				local var_392_15 = arg_389_1.var_.highlightMatValue10029
				local var_392_16 = var_392_15.color

				var_392_16.r = var_392_14
				var_392_16.g = var_392_14
				var_392_16.b = var_392_14
				var_392_15.color = var_392_16
			end

			local var_392_17 = 0
			local var_392_18 = 0.9

			if var_392_17 < arg_389_1.time_ and arg_389_1.time_ <= var_392_17 + arg_392_0 then
				arg_389_1.talkMaxDuration = 0
				arg_389_1.dialogCg_.alpha = 1

				arg_389_1.dialog_:SetActive(true)
				SetActive(arg_389_1.leftNameGo_, true)

				local var_392_19 = arg_389_1:FormatText(StoryNameCfg[312].name)

				arg_389_1.leftNameTxt_.text = var_392_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_389_1.leftNameTxt_.transform)

				arg_389_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_389_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_389_1:RecordName(arg_389_1.leftNameTxt_.text)
				SetActive(arg_389_1.iconTrs_.gameObject, false)
				arg_389_1.callingController_:SetSelectedState("normal")

				local var_392_20 = arg_389_1:GetWordFromCfg(115261096)
				local var_392_21 = arg_389_1:FormatText(var_392_20.content)

				arg_389_1.text_.text = var_392_21

				LuaForUtil.ClearLinePrefixSymbol(arg_389_1.text_)

				local var_392_22 = 36
				local var_392_23 = utf8.len(var_392_21)
				local var_392_24 = var_392_22 <= 0 and var_392_18 or var_392_18 * (var_392_23 / var_392_22)

				if var_392_24 > 0 and var_392_18 < var_392_24 then
					arg_389_1.talkMaxDuration = var_392_24

					if var_392_24 + var_392_17 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_24 + var_392_17
					end
				end

				arg_389_1.text_.text = var_392_21
				arg_389_1.typewritter.percent = 0

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261096", "story_v_out_115261.awb") ~= 0 then
					local var_392_25 = manager.audio:GetVoiceLength("story_v_out_115261", "115261096", "story_v_out_115261.awb") / 1000

					if var_392_25 + var_392_17 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_25 + var_392_17
					end

					if var_392_20.prefab_name ~= "" and arg_389_1.actors_[var_392_20.prefab_name] ~= nil then
						local var_392_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_389_1.actors_[var_392_20.prefab_name].transform, "story_v_out_115261", "115261096", "story_v_out_115261.awb")

						arg_389_1:RecordAudio("115261096", var_392_26)
						arg_389_1:RecordAudio("115261096", var_392_26)
					else
						arg_389_1:AudioAction("play", "voice", "story_v_out_115261", "115261096", "story_v_out_115261.awb")
					end

					arg_389_1:RecordHistoryTalkVoice("story_v_out_115261", "115261096", "story_v_out_115261.awb")
				end

				arg_389_1:RecordContent(arg_389_1.text_.text)
			end

			local var_392_27 = math.max(var_392_18, arg_389_1.talkMaxDuration)

			if var_392_17 <= arg_389_1.time_ and arg_389_1.time_ < var_392_17 + var_392_27 then
				arg_389_1.typewritter.percent = (arg_389_1.time_ - var_392_17) / var_392_27

				arg_389_1.typewritter:SetDirty()
			end

			if arg_389_1.time_ >= var_392_17 + var_392_27 and arg_389_1.time_ < var_392_17 + var_392_27 + arg_392_0 then
				arg_389_1.typewritter.percent = 1

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(true)
			end
		end
	end,
	Play115261097 = function(arg_393_0, arg_393_1)
		arg_393_1.time_ = 0
		arg_393_1.frameCnt_ = 0
		arg_393_1.state_ = "playing"
		arg_393_1.curTalkId_ = 115261097
		arg_393_1.duration_ = 18.033

		local var_393_0 = {
			ja = 8.666,
			ko = 14.9,
			zh = 11.933,
			en = 18.033
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
				arg_393_0:Play115261098(arg_393_1)
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

				local var_396_2 = arg_393_1:FormatText(StoryNameCfg[312].name)

				arg_393_1.leftNameTxt_.text = var_396_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_393_1.leftNameTxt_.transform)

				arg_393_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_393_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_393_1:RecordName(arg_393_1.leftNameTxt_.text)
				SetActive(arg_393_1.iconTrs_.gameObject, false)
				arg_393_1.callingController_:SetSelectedState("normal")

				local var_396_3 = arg_393_1:GetWordFromCfg(115261097)
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

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261097", "story_v_out_115261.awb") ~= 0 then
					local var_396_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261097", "story_v_out_115261.awb") / 1000

					if var_396_8 + var_396_0 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_8 + var_396_0
					end

					if var_396_3.prefab_name ~= "" and arg_393_1.actors_[var_396_3.prefab_name] ~= nil then
						local var_396_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_393_1.actors_[var_396_3.prefab_name].transform, "story_v_out_115261", "115261097", "story_v_out_115261.awb")

						arg_393_1:RecordAudio("115261097", var_396_9)
						arg_393_1:RecordAudio("115261097", var_396_9)
					else
						arg_393_1:AudioAction("play", "voice", "story_v_out_115261", "115261097", "story_v_out_115261.awb")
					end

					arg_393_1:RecordHistoryTalkVoice("story_v_out_115261", "115261097", "story_v_out_115261.awb")
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
	Play115261098 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 115261098
		arg_397_1.duration_ = 1.633

		local var_397_0 = {
			ja = 1.066,
			ko = 1.366,
			zh = 1.633,
			en = 1.466
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
				arg_397_0:Play115261099(arg_397_1)
			end
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = arg_397_1.actors_["10030"]
			local var_400_1 = 0

			if var_400_1 < arg_397_1.time_ and arg_397_1.time_ <= var_400_1 + arg_400_0 and arg_397_1.var_.actorSpriteComps10030 == nil then
				arg_397_1.var_.actorSpriteComps10030 = var_400_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_400_2 = 0.2

			if var_400_1 <= arg_397_1.time_ and arg_397_1.time_ < var_400_1 + var_400_2 then
				local var_400_3 = (arg_397_1.time_ - var_400_1) / var_400_2

				if arg_397_1.var_.actorSpriteComps10030 then
					for iter_400_0, iter_400_1 in pairs(arg_397_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_400_1 then
							local var_400_4 = Mathf.Lerp(iter_400_1.color.r, 1, var_400_3)

							iter_400_1.color = Color.New(var_400_4, var_400_4, var_400_4)
						end
					end
				end
			end

			if arg_397_1.time_ >= var_400_1 + var_400_2 and arg_397_1.time_ < var_400_1 + var_400_2 + arg_400_0 and arg_397_1.var_.actorSpriteComps10030 then
				local var_400_5 = 1

				for iter_400_2, iter_400_3 in pairs(arg_397_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_400_3 then
						iter_400_3.color = Color.New(var_400_5, var_400_5, var_400_5)
					end
				end

				arg_397_1.var_.actorSpriteComps10030 = nil
			end

			local var_400_6 = arg_397_1.actors_["10029"]
			local var_400_7 = 0

			if var_400_7 < arg_397_1.time_ and arg_397_1.time_ <= var_400_7 + arg_400_0 then
				local var_400_8 = var_400_6:GetComponent("Image")

				if var_400_8 then
					arg_397_1.var_.highlightMatValue10029 = var_400_8
				end
			end

			local var_400_9 = 0.2

			if var_400_7 <= arg_397_1.time_ and arg_397_1.time_ < var_400_7 + var_400_9 then
				local var_400_10 = (arg_397_1.time_ - var_400_7) / var_400_9

				if arg_397_1.var_.highlightMatValue10029 then
					local var_400_11 = Mathf.Lerp(1, 0.5, var_400_10)
					local var_400_12 = arg_397_1.var_.highlightMatValue10029
					local var_400_13 = var_400_12.color

					var_400_13.r = var_400_11
					var_400_13.g = var_400_11
					var_400_13.b = var_400_11
					var_400_12.color = var_400_13
				end
			end

			if arg_397_1.time_ >= var_400_7 + var_400_9 and arg_397_1.time_ < var_400_7 + var_400_9 + arg_400_0 and arg_397_1.var_.highlightMatValue10029 then
				local var_400_14 = 0.5
				local var_400_15 = arg_397_1.var_.highlightMatValue10029
				local var_400_16 = var_400_15.color

				var_400_16.r = var_400_14
				var_400_16.g = var_400_14
				var_400_16.b = var_400_14
				var_400_15.color = var_400_16
			end

			local var_400_17 = 0
			local var_400_18 = 0.1

			if var_400_17 < arg_397_1.time_ and arg_397_1.time_ <= var_400_17 + arg_400_0 then
				arg_397_1.talkMaxDuration = 0
				arg_397_1.dialogCg_.alpha = 1

				arg_397_1.dialog_:SetActive(true)
				SetActive(arg_397_1.leftNameGo_, true)

				local var_400_19 = arg_397_1:FormatText(StoryNameCfg[309].name)

				arg_397_1.leftNameTxt_.text = var_400_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_397_1.leftNameTxt_.transform)

				arg_397_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_397_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_397_1:RecordName(arg_397_1.leftNameTxt_.text)
				SetActive(arg_397_1.iconTrs_.gameObject, false)
				arg_397_1.callingController_:SetSelectedState("normal")

				local var_400_20 = arg_397_1:GetWordFromCfg(115261098)
				local var_400_21 = arg_397_1:FormatText(var_400_20.content)

				arg_397_1.text_.text = var_400_21

				LuaForUtil.ClearLinePrefixSymbol(arg_397_1.text_)

				local var_400_22 = 4
				local var_400_23 = utf8.len(var_400_21)
				local var_400_24 = var_400_22 <= 0 and var_400_18 or var_400_18 * (var_400_23 / var_400_22)

				if var_400_24 > 0 and var_400_18 < var_400_24 then
					arg_397_1.talkMaxDuration = var_400_24

					if var_400_24 + var_400_17 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_24 + var_400_17
					end
				end

				arg_397_1.text_.text = var_400_21
				arg_397_1.typewritter.percent = 0

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261098", "story_v_out_115261.awb") ~= 0 then
					local var_400_25 = manager.audio:GetVoiceLength("story_v_out_115261", "115261098", "story_v_out_115261.awb") / 1000

					if var_400_25 + var_400_17 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_25 + var_400_17
					end

					if var_400_20.prefab_name ~= "" and arg_397_1.actors_[var_400_20.prefab_name] ~= nil then
						local var_400_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_397_1.actors_[var_400_20.prefab_name].transform, "story_v_out_115261", "115261098", "story_v_out_115261.awb")

						arg_397_1:RecordAudio("115261098", var_400_26)
						arg_397_1:RecordAudio("115261098", var_400_26)
					else
						arg_397_1:AudioAction("play", "voice", "story_v_out_115261", "115261098", "story_v_out_115261.awb")
					end

					arg_397_1:RecordHistoryTalkVoice("story_v_out_115261", "115261098", "story_v_out_115261.awb")
				end

				arg_397_1:RecordContent(arg_397_1.text_.text)
			end

			local var_400_27 = math.max(var_400_18, arg_397_1.talkMaxDuration)

			if var_400_17 <= arg_397_1.time_ and arg_397_1.time_ < var_400_17 + var_400_27 then
				arg_397_1.typewritter.percent = (arg_397_1.time_ - var_400_17) / var_400_27

				arg_397_1.typewritter:SetDirty()
			end

			if arg_397_1.time_ >= var_400_17 + var_400_27 and arg_397_1.time_ < var_400_17 + var_400_27 + arg_400_0 then
				arg_397_1.typewritter.percent = 1

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(true)
			end
		end
	end,
	Play115261099 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 115261099
		arg_401_1.duration_ = 5

		SetActive(arg_401_1.tipsGo_, false)

		function arg_401_1.onSingleLineFinish_()
			arg_401_1.onSingleLineUpdate_ = nil
			arg_401_1.onSingleLineFinish_ = nil
			arg_401_1.state_ = "waiting"
		end

		function arg_401_1.playNext_(arg_403_0)
			if arg_403_0 == 1 then
				arg_401_0:Play115261100(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = arg_401_1.actors_["10030"]
			local var_404_1 = 0

			if var_404_1 < arg_401_1.time_ and arg_401_1.time_ <= var_404_1 + arg_404_0 then
				local var_404_2 = var_404_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_404_2 then
					arg_401_1.var_.alphaOldValue10030 = var_404_2.alpha
					arg_401_1.var_.characterEffect10030 = var_404_2
				end

				arg_401_1.var_.alphaOldValue10030 = 1
			end

			local var_404_3 = 0.333333333333333

			if var_404_1 <= arg_401_1.time_ and arg_401_1.time_ < var_404_1 + var_404_3 then
				local var_404_4 = (arg_401_1.time_ - var_404_1) / var_404_3
				local var_404_5 = Mathf.Lerp(arg_401_1.var_.alphaOldValue10030, 0, var_404_4)

				if arg_401_1.var_.characterEffect10030 then
					arg_401_1.var_.characterEffect10030.alpha = var_404_5
				end
			end

			if arg_401_1.time_ >= var_404_1 + var_404_3 and arg_401_1.time_ < var_404_1 + var_404_3 + arg_404_0 and arg_401_1.var_.characterEffect10030 then
				arg_401_1.var_.characterEffect10030.alpha = 0
			end

			local var_404_6 = arg_401_1.actors_["10029"]
			local var_404_7 = 0

			if var_404_7 < arg_401_1.time_ and arg_401_1.time_ <= var_404_7 + arg_404_0 then
				local var_404_8 = var_404_6:GetComponent("Image")

				if var_404_8 then
					arg_401_1.var_.alphaMatValue10029 = var_404_8
					arg_401_1.var_.alphaOldValue10029 = var_404_8.color.a
				end

				arg_401_1.var_.alphaOldValue10029 = 1
			end

			local var_404_9 = 0.333333333333333

			if var_404_7 <= arg_401_1.time_ and arg_401_1.time_ < var_404_7 + var_404_9 then
				local var_404_10 = (arg_401_1.time_ - var_404_7) / var_404_9
				local var_404_11 = Mathf.Lerp(arg_401_1.var_.alphaOldValue10029, 0, var_404_10)

				if arg_401_1.var_.alphaMatValue10029 then
					local var_404_12 = arg_401_1.var_.alphaMatValue10029.color

					var_404_12.a = var_404_11
					arg_401_1.var_.alphaMatValue10029.color = var_404_12
				end
			end

			if arg_401_1.time_ >= var_404_7 + var_404_9 and arg_401_1.time_ < var_404_7 + var_404_9 + arg_404_0 and arg_401_1.var_.alphaMatValue10029 then
				local var_404_13 = arg_401_1.var_.alphaMatValue10029
				local var_404_14 = var_404_13.color

				var_404_14.a = 0
				var_404_13.color = var_404_14
			end

			local var_404_15 = 0
			local var_404_16 = 0.575

			if var_404_15 < arg_401_1.time_ and arg_401_1.time_ <= var_404_15 + arg_404_0 then
				arg_401_1.talkMaxDuration = 0
				arg_401_1.dialogCg_.alpha = 1

				arg_401_1.dialog_:SetActive(true)
				SetActive(arg_401_1.leftNameGo_, false)

				arg_401_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_401_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_401_1:RecordName(arg_401_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_401_1.iconTrs_.gameObject, false)
				arg_401_1.callingController_:SetSelectedState("normal")

				local var_404_17 = arg_401_1:GetWordFromCfg(115261099)
				local var_404_18 = arg_401_1:FormatText(var_404_17.content)

				arg_401_1.text_.text = var_404_18

				LuaForUtil.ClearLinePrefixSymbol(arg_401_1.text_)

				local var_404_19 = 23
				local var_404_20 = utf8.len(var_404_18)
				local var_404_21 = var_404_19 <= 0 and var_404_16 or var_404_16 * (var_404_20 / var_404_19)

				if var_404_21 > 0 and var_404_16 < var_404_21 then
					arg_401_1.talkMaxDuration = var_404_21

					if var_404_21 + var_404_15 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_21 + var_404_15
					end
				end

				arg_401_1.text_.text = var_404_18
				arg_401_1.typewritter.percent = 0

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(false)
				arg_401_1:RecordContent(arg_401_1.text_.text)
			end

			local var_404_22 = math.max(var_404_16, arg_401_1.talkMaxDuration)

			if var_404_15 <= arg_401_1.time_ and arg_401_1.time_ < var_404_15 + var_404_22 then
				arg_401_1.typewritter.percent = (arg_401_1.time_ - var_404_15) / var_404_22

				arg_401_1.typewritter:SetDirty()
			end

			if arg_401_1.time_ >= var_404_15 + var_404_22 and arg_401_1.time_ < var_404_15 + var_404_22 + arg_404_0 then
				arg_401_1.typewritter.percent = 1

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(true)
			end
		end
	end,
	Play115261100 = function(arg_405_0, arg_405_1)
		arg_405_1.time_ = 0
		arg_405_1.frameCnt_ = 0
		arg_405_1.state_ = "playing"
		arg_405_1.curTalkId_ = 115261100
		arg_405_1.duration_ = 5

		SetActive(arg_405_1.tipsGo_, false)

		function arg_405_1.onSingleLineFinish_()
			arg_405_1.onSingleLineUpdate_ = nil
			arg_405_1.onSingleLineFinish_ = nil
			arg_405_1.state_ = "waiting"
		end

		function arg_405_1.playNext_(arg_407_0)
			if arg_407_0 == 1 then
				arg_405_0:Play115261101(arg_405_1)
			end
		end

		function arg_405_1.onSingleLineUpdate_(arg_408_0)
			local var_408_0 = 0
			local var_408_1 = 0.75

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

				local var_408_2 = arg_405_1:GetWordFromCfg(115261100)
				local var_408_3 = arg_405_1:FormatText(var_408_2.content)

				arg_405_1.text_.text = var_408_3

				LuaForUtil.ClearLinePrefixSymbol(arg_405_1.text_)

				local var_408_4 = 30
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
	Play115261101 = function(arg_409_0, arg_409_1)
		arg_409_1.time_ = 0
		arg_409_1.frameCnt_ = 0
		arg_409_1.state_ = "playing"
		arg_409_1.curTalkId_ = 115261101
		arg_409_1.duration_ = 3.966

		local var_409_0 = {
			ja = 2.666,
			ko = 3.433,
			zh = 3.966,
			en = 3.066
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
				arg_409_0:Play115261102(arg_409_1)
			end
		end

		function arg_409_1.onSingleLineUpdate_(arg_412_0)
			local var_412_0 = arg_409_1.actors_["10029"].transform
			local var_412_1 = 0

			if var_412_1 < arg_409_1.time_ and arg_409_1.time_ <= var_412_1 + arg_412_0 then
				arg_409_1.var_.moveOldPos10029 = var_412_0.localPosition
				var_412_0.localScale = Vector3.New(1, 1, 1)

				arg_409_1:CheckSpriteTmpPos("10029", 3)
			end

			local var_412_2 = 0.001

			if var_412_1 <= arg_409_1.time_ and arg_409_1.time_ < var_412_1 + var_412_2 then
				local var_412_3 = (arg_409_1.time_ - var_412_1) / var_412_2
				local var_412_4 = Vector3.New(0, -350, -180)

				var_412_0.localPosition = Vector3.Lerp(arg_409_1.var_.moveOldPos10029, var_412_4, var_412_3)
			end

			if arg_409_1.time_ >= var_412_1 + var_412_2 and arg_409_1.time_ < var_412_1 + var_412_2 + arg_412_0 then
				var_412_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_412_5 = arg_409_1.actors_["10029"]
			local var_412_6 = 0

			if var_412_6 < arg_409_1.time_ and arg_409_1.time_ <= var_412_6 + arg_412_0 then
				local var_412_7 = var_412_5:GetComponent("Image")

				if var_412_7 then
					arg_409_1.var_.highlightMatValue10029 = var_412_7
				end
			end

			local var_412_8 = 0.2

			if var_412_6 <= arg_409_1.time_ and arg_409_1.time_ < var_412_6 + var_412_8 then
				local var_412_9 = (arg_409_1.time_ - var_412_6) / var_412_8

				if arg_409_1.var_.highlightMatValue10029 then
					local var_412_10 = Mathf.Lerp(0.5, 1, var_412_9)
					local var_412_11 = arg_409_1.var_.highlightMatValue10029
					local var_412_12 = var_412_11.color

					var_412_12.r = var_412_10
					var_412_12.g = var_412_10
					var_412_12.b = var_412_10
					var_412_11.color = var_412_12
				end
			end

			if arg_409_1.time_ >= var_412_6 + var_412_8 and arg_409_1.time_ < var_412_6 + var_412_8 + arg_412_0 and arg_409_1.var_.highlightMatValue10029 then
				local var_412_13 = 1

				var_412_5.transform:SetSiblingIndex(1)

				local var_412_14 = arg_409_1.var_.highlightMatValue10029
				local var_412_15 = var_412_14.color

				var_412_15.r = var_412_13
				var_412_15.g = var_412_13
				var_412_15.b = var_412_13
				var_412_14.color = var_412_15
			end

			local var_412_16 = arg_409_1.actors_["10029"]
			local var_412_17 = 0

			if var_412_17 < arg_409_1.time_ and arg_409_1.time_ <= var_412_17 + arg_412_0 then
				local var_412_18 = var_412_16:GetComponent("Image")

				if var_412_18 then
					arg_409_1.var_.alphaMatValue10029 = var_412_18
					arg_409_1.var_.alphaOldValue10029 = var_412_18.color.a
				end

				arg_409_1.var_.alphaOldValue10029 = 0
			end

			local var_412_19 = 0.333333333333333

			if var_412_17 <= arg_409_1.time_ and arg_409_1.time_ < var_412_17 + var_412_19 then
				local var_412_20 = (arg_409_1.time_ - var_412_17) / var_412_19
				local var_412_21 = Mathf.Lerp(arg_409_1.var_.alphaOldValue10029, 1, var_412_20)

				if arg_409_1.var_.alphaMatValue10029 then
					local var_412_22 = arg_409_1.var_.alphaMatValue10029.color

					var_412_22.a = var_412_21
					arg_409_1.var_.alphaMatValue10029.color = var_412_22
				end
			end

			if arg_409_1.time_ >= var_412_17 + var_412_19 and arg_409_1.time_ < var_412_17 + var_412_19 + arg_412_0 and arg_409_1.var_.alphaMatValue10029 then
				local var_412_23 = arg_409_1.var_.alphaMatValue10029
				local var_412_24 = var_412_23.color

				var_412_24.a = 1
				var_412_23.color = var_412_24
			end

			local var_412_25 = 0
			local var_412_26 = 0.175

			if var_412_25 < arg_409_1.time_ and arg_409_1.time_ <= var_412_25 + arg_412_0 then
				arg_409_1.talkMaxDuration = 0
				arg_409_1.dialogCg_.alpha = 1

				arg_409_1.dialog_:SetActive(true)
				SetActive(arg_409_1.leftNameGo_, true)

				local var_412_27 = arg_409_1:FormatText(StoryNameCfg[312].name)

				arg_409_1.leftNameTxt_.text = var_412_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_409_1.leftNameTxt_.transform)

				arg_409_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_409_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_409_1:RecordName(arg_409_1.leftNameTxt_.text)
				SetActive(arg_409_1.iconTrs_.gameObject, false)
				arg_409_1.callingController_:SetSelectedState("normal")

				local var_412_28 = arg_409_1:GetWordFromCfg(115261101)
				local var_412_29 = arg_409_1:FormatText(var_412_28.content)

				arg_409_1.text_.text = var_412_29

				LuaForUtil.ClearLinePrefixSymbol(arg_409_1.text_)

				local var_412_30 = 7
				local var_412_31 = utf8.len(var_412_29)
				local var_412_32 = var_412_30 <= 0 and var_412_26 or var_412_26 * (var_412_31 / var_412_30)

				if var_412_32 > 0 and var_412_26 < var_412_32 then
					arg_409_1.talkMaxDuration = var_412_32

					if var_412_32 + var_412_25 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_32 + var_412_25
					end
				end

				arg_409_1.text_.text = var_412_29
				arg_409_1.typewritter.percent = 0

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261101", "story_v_out_115261.awb") ~= 0 then
					local var_412_33 = manager.audio:GetVoiceLength("story_v_out_115261", "115261101", "story_v_out_115261.awb") / 1000

					if var_412_33 + var_412_25 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_33 + var_412_25
					end

					if var_412_28.prefab_name ~= "" and arg_409_1.actors_[var_412_28.prefab_name] ~= nil then
						local var_412_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_409_1.actors_[var_412_28.prefab_name].transform, "story_v_out_115261", "115261101", "story_v_out_115261.awb")

						arg_409_1:RecordAudio("115261101", var_412_34)
						arg_409_1:RecordAudio("115261101", var_412_34)
					else
						arg_409_1:AudioAction("play", "voice", "story_v_out_115261", "115261101", "story_v_out_115261.awb")
					end

					arg_409_1:RecordHistoryTalkVoice("story_v_out_115261", "115261101", "story_v_out_115261.awb")
				end

				arg_409_1:RecordContent(arg_409_1.text_.text)
			end

			local var_412_35 = math.max(var_412_26, arg_409_1.talkMaxDuration)

			if var_412_25 <= arg_409_1.time_ and arg_409_1.time_ < var_412_25 + var_412_35 then
				arg_409_1.typewritter.percent = (arg_409_1.time_ - var_412_25) / var_412_35

				arg_409_1.typewritter:SetDirty()
			end

			if arg_409_1.time_ >= var_412_25 + var_412_35 and arg_409_1.time_ < var_412_25 + var_412_35 + arg_412_0 then
				arg_409_1.typewritter.percent = 1

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(true)
			end
		end
	end,
	Play115261102 = function(arg_413_0, arg_413_1)
		arg_413_1.time_ = 0
		arg_413_1.frameCnt_ = 0
		arg_413_1.state_ = "playing"
		arg_413_1.curTalkId_ = 115261102
		arg_413_1.duration_ = 5

		SetActive(arg_413_1.tipsGo_, false)

		function arg_413_1.onSingleLineFinish_()
			arg_413_1.onSingleLineUpdate_ = nil
			arg_413_1.onSingleLineFinish_ = nil
			arg_413_1.state_ = "waiting"
		end

		function arg_413_1.playNext_(arg_415_0)
			if arg_415_0 == 1 then
				arg_413_0:Play115261103(arg_413_1)
			end
		end

		function arg_413_1.onSingleLineUpdate_(arg_416_0)
			local var_416_0 = arg_413_1.actors_["10029"]
			local var_416_1 = 0

			if var_416_1 < arg_413_1.time_ and arg_413_1.time_ <= var_416_1 + arg_416_0 then
				local var_416_2 = var_416_0:GetComponent("Image")

				if var_416_2 then
					arg_413_1.var_.highlightMatValue10029 = var_416_2
				end
			end

			local var_416_3 = 0.2

			if var_416_1 <= arg_413_1.time_ and arg_413_1.time_ < var_416_1 + var_416_3 then
				local var_416_4 = (arg_413_1.time_ - var_416_1) / var_416_3

				if arg_413_1.var_.highlightMatValue10029 then
					local var_416_5 = Mathf.Lerp(1, 0.5, var_416_4)
					local var_416_6 = arg_413_1.var_.highlightMatValue10029
					local var_416_7 = var_416_6.color

					var_416_7.r = var_416_5
					var_416_7.g = var_416_5
					var_416_7.b = var_416_5
					var_416_6.color = var_416_7
				end
			end

			if arg_413_1.time_ >= var_416_1 + var_416_3 and arg_413_1.time_ < var_416_1 + var_416_3 + arg_416_0 and arg_413_1.var_.highlightMatValue10029 then
				local var_416_8 = 0.5
				local var_416_9 = arg_413_1.var_.highlightMatValue10029
				local var_416_10 = var_416_9.color

				var_416_10.r = var_416_8
				var_416_10.g = var_416_8
				var_416_10.b = var_416_8
				var_416_9.color = var_416_10
			end

			local var_416_11 = 0
			local var_416_12 = 0.95

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

				local var_416_13 = arg_413_1:GetWordFromCfg(115261102)
				local var_416_14 = arg_413_1:FormatText(var_416_13.content)

				arg_413_1.text_.text = var_416_14

				LuaForUtil.ClearLinePrefixSymbol(arg_413_1.text_)

				local var_416_15 = 38
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
	Play115261103 = function(arg_417_0, arg_417_1)
		arg_417_1.time_ = 0
		arg_417_1.frameCnt_ = 0
		arg_417_1.state_ = "playing"
		arg_417_1.curTalkId_ = 115261103
		arg_417_1.duration_ = 9.066

		local var_417_0 = {
			ja = 9.066,
			ko = 5.866,
			zh = 8.133,
			en = 6.5
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
				arg_417_0:Play115261104(arg_417_1)
			end
		end

		function arg_417_1.onSingleLineUpdate_(arg_420_0)
			local var_420_0 = 0
			local var_420_1 = 0.575

			if var_420_0 < arg_417_1.time_ and arg_417_1.time_ <= var_420_0 + arg_420_0 then
				arg_417_1.talkMaxDuration = 0
				arg_417_1.dialogCg_.alpha = 1

				arg_417_1.dialog_:SetActive(true)
				SetActive(arg_417_1.leftNameGo_, true)

				local var_420_2 = arg_417_1:FormatText(StoryNameCfg[310].name)

				arg_417_1.leftNameTxt_.text = var_420_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_417_1.leftNameTxt_.transform)

				arg_417_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_417_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_417_1:RecordName(arg_417_1.leftNameTxt_.text)
				SetActive(arg_417_1.iconTrs_.gameObject, true)
				arg_417_1.iconController_:SetSelectedState("hero")

				arg_417_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpab")

				arg_417_1.callingController_:SetSelectedState("normal")

				local var_420_3 = arg_417_1:GetWordFromCfg(115261103)
				local var_420_4 = arg_417_1:FormatText(var_420_3.content)

				arg_417_1.text_.text = var_420_4

				LuaForUtil.ClearLinePrefixSymbol(arg_417_1.text_)

				local var_420_5 = 23
				local var_420_6 = utf8.len(var_420_4)
				local var_420_7 = var_420_5 <= 0 and var_420_1 or var_420_1 * (var_420_6 / var_420_5)

				if var_420_7 > 0 and var_420_1 < var_420_7 then
					arg_417_1.talkMaxDuration = var_420_7

					if var_420_7 + var_420_0 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_7 + var_420_0
					end
				end

				arg_417_1.text_.text = var_420_4
				arg_417_1.typewritter.percent = 0

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261103", "story_v_out_115261.awb") ~= 0 then
					local var_420_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261103", "story_v_out_115261.awb") / 1000

					if var_420_8 + var_420_0 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_8 + var_420_0
					end

					if var_420_3.prefab_name ~= "" and arg_417_1.actors_[var_420_3.prefab_name] ~= nil then
						local var_420_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_417_1.actors_[var_420_3.prefab_name].transform, "story_v_out_115261", "115261103", "story_v_out_115261.awb")

						arg_417_1:RecordAudio("115261103", var_420_9)
						arg_417_1:RecordAudio("115261103", var_420_9)
					else
						arg_417_1:AudioAction("play", "voice", "story_v_out_115261", "115261103", "story_v_out_115261.awb")
					end

					arg_417_1:RecordHistoryTalkVoice("story_v_out_115261", "115261103", "story_v_out_115261.awb")
				end

				arg_417_1:RecordContent(arg_417_1.text_.text)
			end

			local var_420_10 = math.max(var_420_1, arg_417_1.talkMaxDuration)

			if var_420_0 <= arg_417_1.time_ and arg_417_1.time_ < var_420_0 + var_420_10 then
				arg_417_1.typewritter.percent = (arg_417_1.time_ - var_420_0) / var_420_10

				arg_417_1.typewritter:SetDirty()
			end

			if arg_417_1.time_ >= var_420_0 + var_420_10 and arg_417_1.time_ < var_420_0 + var_420_10 + arg_420_0 then
				arg_417_1.typewritter.percent = 1

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(true)
			end
		end
	end,
	Play115261104 = function(arg_421_0, arg_421_1)
		arg_421_1.time_ = 0
		arg_421_1.frameCnt_ = 0
		arg_421_1.state_ = "playing"
		arg_421_1.curTalkId_ = 115261104
		arg_421_1.duration_ = 6.866

		local var_421_0 = {
			ja = 6.833,
			ko = 6.866,
			zh = 6.166,
			en = 6.133
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
				arg_421_0:Play115261105(arg_421_1)
			end
		end

		function arg_421_1.onSingleLineUpdate_(arg_424_0)
			local var_424_0 = arg_421_1.actors_["10029"]
			local var_424_1 = 0

			if var_424_1 < arg_421_1.time_ and arg_421_1.time_ <= var_424_1 + arg_424_0 then
				local var_424_2 = var_424_0:GetComponent("Image")

				if var_424_2 then
					arg_421_1.var_.highlightMatValue10029 = var_424_2
				end
			end

			local var_424_3 = 0.2

			if var_424_1 <= arg_421_1.time_ and arg_421_1.time_ < var_424_1 + var_424_3 then
				local var_424_4 = (arg_421_1.time_ - var_424_1) / var_424_3

				if arg_421_1.var_.highlightMatValue10029 then
					local var_424_5 = Mathf.Lerp(0.5, 1, var_424_4)
					local var_424_6 = arg_421_1.var_.highlightMatValue10029
					local var_424_7 = var_424_6.color

					var_424_7.r = var_424_5
					var_424_7.g = var_424_5
					var_424_7.b = var_424_5
					var_424_6.color = var_424_7
				end
			end

			if arg_421_1.time_ >= var_424_1 + var_424_3 and arg_421_1.time_ < var_424_1 + var_424_3 + arg_424_0 and arg_421_1.var_.highlightMatValue10029 then
				local var_424_8 = 1

				var_424_0.transform:SetSiblingIndex(1)

				local var_424_9 = arg_421_1.var_.highlightMatValue10029
				local var_424_10 = var_424_9.color

				var_424_10.r = var_424_8
				var_424_10.g = var_424_8
				var_424_10.b = var_424_8
				var_424_9.color = var_424_10
			end

			local var_424_11 = 0
			local var_424_12 = 0.625

			if var_424_11 < arg_421_1.time_ and arg_421_1.time_ <= var_424_11 + arg_424_0 then
				arg_421_1.talkMaxDuration = 0
				arg_421_1.dialogCg_.alpha = 1

				arg_421_1.dialog_:SetActive(true)
				SetActive(arg_421_1.leftNameGo_, true)

				local var_424_13 = arg_421_1:FormatText(StoryNameCfg[312].name)

				arg_421_1.leftNameTxt_.text = var_424_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_421_1.leftNameTxt_.transform)

				arg_421_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_421_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_421_1:RecordName(arg_421_1.leftNameTxt_.text)
				SetActive(arg_421_1.iconTrs_.gameObject, false)
				arg_421_1.callingController_:SetSelectedState("normal")

				local var_424_14 = arg_421_1:GetWordFromCfg(115261104)
				local var_424_15 = arg_421_1:FormatText(var_424_14.content)

				arg_421_1.text_.text = var_424_15

				LuaForUtil.ClearLinePrefixSymbol(arg_421_1.text_)

				local var_424_16 = 24
				local var_424_17 = utf8.len(var_424_15)
				local var_424_18 = var_424_16 <= 0 and var_424_12 or var_424_12 * (var_424_17 / var_424_16)

				if var_424_18 > 0 and var_424_12 < var_424_18 then
					arg_421_1.talkMaxDuration = var_424_18

					if var_424_18 + var_424_11 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_18 + var_424_11
					end
				end

				arg_421_1.text_.text = var_424_15
				arg_421_1.typewritter.percent = 0

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261104", "story_v_out_115261.awb") ~= 0 then
					local var_424_19 = manager.audio:GetVoiceLength("story_v_out_115261", "115261104", "story_v_out_115261.awb") / 1000

					if var_424_19 + var_424_11 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_19 + var_424_11
					end

					if var_424_14.prefab_name ~= "" and arg_421_1.actors_[var_424_14.prefab_name] ~= nil then
						local var_424_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_421_1.actors_[var_424_14.prefab_name].transform, "story_v_out_115261", "115261104", "story_v_out_115261.awb")

						arg_421_1:RecordAudio("115261104", var_424_20)
						arg_421_1:RecordAudio("115261104", var_424_20)
					else
						arg_421_1:AudioAction("play", "voice", "story_v_out_115261", "115261104", "story_v_out_115261.awb")
					end

					arg_421_1:RecordHistoryTalkVoice("story_v_out_115261", "115261104", "story_v_out_115261.awb")
				end

				arg_421_1:RecordContent(arg_421_1.text_.text)
			end

			local var_424_21 = math.max(var_424_12, arg_421_1.talkMaxDuration)

			if var_424_11 <= arg_421_1.time_ and arg_421_1.time_ < var_424_11 + var_424_21 then
				arg_421_1.typewritter.percent = (arg_421_1.time_ - var_424_11) / var_424_21

				arg_421_1.typewritter:SetDirty()
			end

			if arg_421_1.time_ >= var_424_11 + var_424_21 and arg_421_1.time_ < var_424_11 + var_424_21 + arg_424_0 then
				arg_421_1.typewritter.percent = 1

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(true)
			end
		end
	end,
	Play115261105 = function(arg_425_0, arg_425_1)
		arg_425_1.time_ = 0
		arg_425_1.frameCnt_ = 0
		arg_425_1.state_ = "playing"
		arg_425_1.curTalkId_ = 115261105
		arg_425_1.duration_ = 8.7

		local var_425_0 = {
			ja = 8,
			ko = 8.7,
			zh = 7.8,
			en = 8.066
		}
		local var_425_1 = manager.audio:GetLocalizationFlag()

		if var_425_0[var_425_1] ~= nil then
			arg_425_1.duration_ = var_425_0[var_425_1]
		end

		SetActive(arg_425_1.tipsGo_, false)

		function arg_425_1.onSingleLineFinish_()
			arg_425_1.onSingleLineUpdate_ = nil
			arg_425_1.onSingleLineFinish_ = nil
			arg_425_1.state_ = "waiting"
		end

		function arg_425_1.playNext_(arg_427_0)
			if arg_427_0 == 1 then
				arg_425_0:Play115261106(arg_425_1)
			end
		end

		function arg_425_1.onSingleLineUpdate_(arg_428_0)
			local var_428_0 = arg_425_1.actors_["10029"]
			local var_428_1 = 0

			if var_428_1 < arg_425_1.time_ and arg_425_1.time_ <= var_428_1 + arg_428_0 then
				local var_428_2 = var_428_0:GetComponent("Image")

				if var_428_2 then
					arg_425_1.var_.highlightMatValue10029 = var_428_2
				end
			end

			local var_428_3 = 0.2

			if var_428_1 <= arg_425_1.time_ and arg_425_1.time_ < var_428_1 + var_428_3 then
				local var_428_4 = (arg_425_1.time_ - var_428_1) / var_428_3

				if arg_425_1.var_.highlightMatValue10029 then
					local var_428_5 = Mathf.Lerp(1, 0.5, var_428_4)
					local var_428_6 = arg_425_1.var_.highlightMatValue10029
					local var_428_7 = var_428_6.color

					var_428_7.r = var_428_5
					var_428_7.g = var_428_5
					var_428_7.b = var_428_5
					var_428_6.color = var_428_7
				end
			end

			if arg_425_1.time_ >= var_428_1 + var_428_3 and arg_425_1.time_ < var_428_1 + var_428_3 + arg_428_0 and arg_425_1.var_.highlightMatValue10029 then
				local var_428_8 = 0.5
				local var_428_9 = arg_425_1.var_.highlightMatValue10029
				local var_428_10 = var_428_9.color

				var_428_10.r = var_428_8
				var_428_10.g = var_428_8
				var_428_10.b = var_428_8
				var_428_9.color = var_428_10
			end

			local var_428_11 = 0
			local var_428_12 = 0.7

			if var_428_11 < arg_425_1.time_ and arg_425_1.time_ <= var_428_11 + arg_428_0 then
				arg_425_1.talkMaxDuration = 0
				arg_425_1.dialogCg_.alpha = 1

				arg_425_1.dialog_:SetActive(true)
				SetActive(arg_425_1.leftNameGo_, true)

				local var_428_13 = arg_425_1:FormatText(StoryNameCfg[310].name)

				arg_425_1.leftNameTxt_.text = var_428_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_425_1.leftNameTxt_.transform)

				arg_425_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_425_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_425_1:RecordName(arg_425_1.leftNameTxt_.text)
				SetActive(arg_425_1.iconTrs_.gameObject, true)
				arg_425_1.iconController_:SetSelectedState("hero")

				arg_425_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpab")

				arg_425_1.callingController_:SetSelectedState("normal")

				local var_428_14 = arg_425_1:GetWordFromCfg(115261105)
				local var_428_15 = arg_425_1:FormatText(var_428_14.content)

				arg_425_1.text_.text = var_428_15

				LuaForUtil.ClearLinePrefixSymbol(arg_425_1.text_)

				local var_428_16 = 28
				local var_428_17 = utf8.len(var_428_15)
				local var_428_18 = var_428_16 <= 0 and var_428_12 or var_428_12 * (var_428_17 / var_428_16)

				if var_428_18 > 0 and var_428_12 < var_428_18 then
					arg_425_1.talkMaxDuration = var_428_18

					if var_428_18 + var_428_11 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_18 + var_428_11
					end
				end

				arg_425_1.text_.text = var_428_15
				arg_425_1.typewritter.percent = 0

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261105", "story_v_out_115261.awb") ~= 0 then
					local var_428_19 = manager.audio:GetVoiceLength("story_v_out_115261", "115261105", "story_v_out_115261.awb") / 1000

					if var_428_19 + var_428_11 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_19 + var_428_11
					end

					if var_428_14.prefab_name ~= "" and arg_425_1.actors_[var_428_14.prefab_name] ~= nil then
						local var_428_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_425_1.actors_[var_428_14.prefab_name].transform, "story_v_out_115261", "115261105", "story_v_out_115261.awb")

						arg_425_1:RecordAudio("115261105", var_428_20)
						arg_425_1:RecordAudio("115261105", var_428_20)
					else
						arg_425_1:AudioAction("play", "voice", "story_v_out_115261", "115261105", "story_v_out_115261.awb")
					end

					arg_425_1:RecordHistoryTalkVoice("story_v_out_115261", "115261105", "story_v_out_115261.awb")
				end

				arg_425_1:RecordContent(arg_425_1.text_.text)
			end

			local var_428_21 = math.max(var_428_12, arg_425_1.talkMaxDuration)

			if var_428_11 <= arg_425_1.time_ and arg_425_1.time_ < var_428_11 + var_428_21 then
				arg_425_1.typewritter.percent = (arg_425_1.time_ - var_428_11) / var_428_21

				arg_425_1.typewritter:SetDirty()
			end

			if arg_425_1.time_ >= var_428_11 + var_428_21 and arg_425_1.time_ < var_428_11 + var_428_21 + arg_428_0 then
				arg_425_1.typewritter.percent = 1

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(true)
			end
		end
	end,
	Play115261106 = function(arg_429_0, arg_429_1)
		arg_429_1.time_ = 0
		arg_429_1.frameCnt_ = 0
		arg_429_1.state_ = "playing"
		arg_429_1.curTalkId_ = 115261106
		arg_429_1.duration_ = 5

		SetActive(arg_429_1.tipsGo_, false)

		function arg_429_1.onSingleLineFinish_()
			arg_429_1.onSingleLineUpdate_ = nil
			arg_429_1.onSingleLineFinish_ = nil
			arg_429_1.state_ = "waiting"
		end

		function arg_429_1.playNext_(arg_431_0)
			if arg_431_0 == 1 then
				arg_429_0:Play115261107(arg_429_1)
			end
		end

		function arg_429_1.onSingleLineUpdate_(arg_432_0)
			local var_432_0 = 0
			local var_432_1 = 0.6

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

				local var_432_2 = arg_429_1:GetWordFromCfg(115261106)
				local var_432_3 = arg_429_1:FormatText(var_432_2.content)

				arg_429_1.text_.text = var_432_3

				LuaForUtil.ClearLinePrefixSymbol(arg_429_1.text_)

				local var_432_4 = 24
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
	Play115261107 = function(arg_433_0, arg_433_1)
		arg_433_1.time_ = 0
		arg_433_1.frameCnt_ = 0
		arg_433_1.state_ = "playing"
		arg_433_1.curTalkId_ = 115261107
		arg_433_1.duration_ = 17.566

		local var_433_0 = {
			ja = 11.533,
			ko = 17.566,
			zh = 17.333,
			en = 13.633
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
				arg_433_0:Play115261108(arg_433_1)
			end
		end

		function arg_433_1.onSingleLineUpdate_(arg_436_0)
			local var_436_0 = 0
			local var_436_1 = 1.15

			if var_436_0 < arg_433_1.time_ and arg_433_1.time_ <= var_436_0 + arg_436_0 then
				arg_433_1.talkMaxDuration = 0
				arg_433_1.dialogCg_.alpha = 1

				arg_433_1.dialog_:SetActive(true)
				SetActive(arg_433_1.leftNameGo_, true)

				local var_436_2 = arg_433_1:FormatText(StoryNameCfg[310].name)

				arg_433_1.leftNameTxt_.text = var_436_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_433_1.leftNameTxt_.transform)

				arg_433_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_433_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_433_1:RecordName(arg_433_1.leftNameTxt_.text)
				SetActive(arg_433_1.iconTrs_.gameObject, true)
				arg_433_1.iconController_:SetSelectedState("hero")

				arg_433_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_grandpab")

				arg_433_1.callingController_:SetSelectedState("normal")

				local var_436_3 = arg_433_1:GetWordFromCfg(115261107)
				local var_436_4 = arg_433_1:FormatText(var_436_3.content)

				arg_433_1.text_.text = var_436_4

				LuaForUtil.ClearLinePrefixSymbol(arg_433_1.text_)

				local var_436_5 = 45
				local var_436_6 = utf8.len(var_436_4)
				local var_436_7 = var_436_5 <= 0 and var_436_1 or var_436_1 * (var_436_6 / var_436_5)

				if var_436_7 > 0 and var_436_1 < var_436_7 then
					arg_433_1.talkMaxDuration = var_436_7

					if var_436_7 + var_436_0 > arg_433_1.duration_ then
						arg_433_1.duration_ = var_436_7 + var_436_0
					end
				end

				arg_433_1.text_.text = var_436_4
				arg_433_1.typewritter.percent = 0

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261107", "story_v_out_115261.awb") ~= 0 then
					local var_436_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261107", "story_v_out_115261.awb") / 1000

					if var_436_8 + var_436_0 > arg_433_1.duration_ then
						arg_433_1.duration_ = var_436_8 + var_436_0
					end

					if var_436_3.prefab_name ~= "" and arg_433_1.actors_[var_436_3.prefab_name] ~= nil then
						local var_436_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_433_1.actors_[var_436_3.prefab_name].transform, "story_v_out_115261", "115261107", "story_v_out_115261.awb")

						arg_433_1:RecordAudio("115261107", var_436_9)
						arg_433_1:RecordAudio("115261107", var_436_9)
					else
						arg_433_1:AudioAction("play", "voice", "story_v_out_115261", "115261107", "story_v_out_115261.awb")
					end

					arg_433_1:RecordHistoryTalkVoice("story_v_out_115261", "115261107", "story_v_out_115261.awb")
				end

				arg_433_1:RecordContent(arg_433_1.text_.text)
			end

			local var_436_10 = math.max(var_436_1, arg_433_1.talkMaxDuration)

			if var_436_0 <= arg_433_1.time_ and arg_433_1.time_ < var_436_0 + var_436_10 then
				arg_433_1.typewritter.percent = (arg_433_1.time_ - var_436_0) / var_436_10

				arg_433_1.typewritter:SetDirty()
			end

			if arg_433_1.time_ >= var_436_0 + var_436_10 and arg_433_1.time_ < var_436_0 + var_436_10 + arg_436_0 then
				arg_433_1.typewritter.percent = 1

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(true)
			end
		end
	end,
	Play115261108 = function(arg_437_0, arg_437_1)
		arg_437_1.time_ = 0
		arg_437_1.frameCnt_ = 0
		arg_437_1.state_ = "playing"
		arg_437_1.curTalkId_ = 115261108
		arg_437_1.duration_ = 9

		SetActive(arg_437_1.tipsGo_, false)

		function arg_437_1.onSingleLineFinish_()
			arg_437_1.onSingleLineUpdate_ = nil
			arg_437_1.onSingleLineFinish_ = nil
			arg_437_1.state_ = "waiting"
		end

		function arg_437_1.playNext_(arg_439_0)
			if arg_439_0 == 1 then
				arg_437_0:Play115261109(arg_437_1)
			end
		end

		function arg_437_1.onSingleLineUpdate_(arg_440_0)
			local var_440_0 = "ST22a"

			if arg_437_1.bgs_[var_440_0] == nil then
				local var_440_1 = Object.Instantiate(arg_437_1.paintGo_)

				var_440_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_440_0)
				var_440_1.name = var_440_0
				var_440_1.transform.parent = arg_437_1.stage_.transform
				var_440_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_437_1.bgs_[var_440_0] = var_440_1
			end

			local var_440_2 = 2

			if var_440_2 < arg_437_1.time_ and arg_437_1.time_ <= var_440_2 + arg_440_0 then
				local var_440_3 = manager.ui.mainCamera.transform.localPosition
				local var_440_4 = Vector3.New(0, 0, 10) + Vector3.New(var_440_3.x, var_440_3.y, 0)
				local var_440_5 = arg_437_1.bgs_.ST22a

				var_440_5.transform.localPosition = var_440_4
				var_440_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_440_6 = var_440_5:GetComponent("SpriteRenderer")

				if var_440_6 and var_440_6.sprite then
					local var_440_7 = (var_440_5.transform.localPosition - var_440_3).z
					local var_440_8 = manager.ui.mainCameraCom_
					local var_440_9 = 2 * var_440_7 * Mathf.Tan(var_440_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_440_10 = var_440_9 * var_440_8.aspect
					local var_440_11 = var_440_6.sprite.bounds.size.x
					local var_440_12 = var_440_6.sprite.bounds.size.y
					local var_440_13 = var_440_10 / var_440_11
					local var_440_14 = var_440_9 / var_440_12
					local var_440_15 = var_440_14 < var_440_13 and var_440_13 or var_440_14

					var_440_5.transform.localScale = Vector3.New(var_440_15, var_440_15, 0)
				end

				for iter_440_0, iter_440_1 in pairs(arg_437_1.bgs_) do
					if iter_440_0 ~= "ST22a" then
						iter_440_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_440_16 = 0

			if var_440_16 < arg_437_1.time_ and arg_437_1.time_ <= var_440_16 + arg_440_0 then
				arg_437_1.mask_.enabled = true
				arg_437_1.mask_.raycastTarget = false

				arg_437_1:SetGaussion(false)
			end

			local var_440_17 = 2

			if var_440_16 <= arg_437_1.time_ and arg_437_1.time_ < var_440_16 + var_440_17 then
				local var_440_18 = (arg_437_1.time_ - var_440_16) / var_440_17
				local var_440_19 = Color.New(0, 0, 0)

				var_440_19.a = Mathf.Lerp(0, 1, var_440_18)
				arg_437_1.mask_.color = var_440_19
			end

			if arg_437_1.time_ >= var_440_16 + var_440_17 and arg_437_1.time_ < var_440_16 + var_440_17 + arg_440_0 then
				local var_440_20 = Color.New(0, 0, 0)

				var_440_20.a = 1
				arg_437_1.mask_.color = var_440_20
			end

			local var_440_21 = 2

			if var_440_21 < arg_437_1.time_ and arg_437_1.time_ <= var_440_21 + arg_440_0 then
				arg_437_1.mask_.enabled = true
				arg_437_1.mask_.raycastTarget = false

				arg_437_1:SetGaussion(false)
			end

			local var_440_22 = 2

			if var_440_21 <= arg_437_1.time_ and arg_437_1.time_ < var_440_21 + var_440_22 then
				local var_440_23 = (arg_437_1.time_ - var_440_21) / var_440_22
				local var_440_24 = Color.New(0, 0, 0)

				var_440_24.a = Mathf.Lerp(1, 0, var_440_23)
				arg_437_1.mask_.color = var_440_24
			end

			if arg_437_1.time_ >= var_440_21 + var_440_22 and arg_437_1.time_ < var_440_21 + var_440_22 + arg_440_0 then
				local var_440_25 = Color.New(0, 0, 0)
				local var_440_26 = 0

				arg_437_1.mask_.enabled = false
				var_440_25.a = var_440_26
				arg_437_1.mask_.color = var_440_25
			end

			local var_440_27 = arg_437_1.actors_["10029"].transform
			local var_440_28 = 2

			if var_440_28 < arg_437_1.time_ and arg_437_1.time_ <= var_440_28 + arg_440_0 then
				arg_437_1.var_.moveOldPos10029 = var_440_27.localPosition
				var_440_27.localScale = Vector3.New(1, 1, 1)

				arg_437_1:CheckSpriteTmpPos("10029", 0)
			end

			local var_440_29 = 0.001

			if var_440_28 <= arg_437_1.time_ and arg_437_1.time_ < var_440_28 + var_440_29 then
				local var_440_30 = (arg_437_1.time_ - var_440_28) / var_440_29
				local var_440_31 = Vector3.New(-1500, -350, -180)

				var_440_27.localPosition = Vector3.Lerp(arg_437_1.var_.moveOldPos10029, var_440_31, var_440_30)
			end

			if arg_437_1.time_ >= var_440_28 + var_440_29 and arg_437_1.time_ < var_440_28 + var_440_29 + arg_440_0 then
				var_440_27.localPosition = Vector3.New(-1500, -350, -180)
			end

			if arg_437_1.frameCnt_ <= 1 then
				arg_437_1.dialog_:SetActive(false)
			end

			local var_440_32 = 4
			local var_440_33 = 1.45

			if var_440_32 < arg_437_1.time_ and arg_437_1.time_ <= var_440_32 + arg_440_0 then
				arg_437_1.talkMaxDuration = 0

				arg_437_1.dialog_:SetActive(true)

				local var_440_34 = LeanTween.value(arg_437_1.dialog_, 0, 1, 0.3)

				var_440_34:setOnUpdate(LuaHelper.FloatAction(function(arg_441_0)
					arg_437_1.dialogCg_.alpha = arg_441_0
				end))
				var_440_34:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_437_1.dialog_)
					var_440_34:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_437_1.duration_ = arg_437_1.duration_ + 0.3

				SetActive(arg_437_1.leftNameGo_, false)

				arg_437_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_437_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_437_1:RecordName(arg_437_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_437_1.iconTrs_.gameObject, false)
				arg_437_1.callingController_:SetSelectedState("normal")

				local var_440_35 = arg_437_1:GetWordFromCfg(115261108)
				local var_440_36 = arg_437_1:FormatText(var_440_35.content)

				arg_437_1.text_.text = var_440_36

				LuaForUtil.ClearLinePrefixSymbol(arg_437_1.text_)

				local var_440_37 = 58
				local var_440_38 = utf8.len(var_440_36)
				local var_440_39 = var_440_37 <= 0 and var_440_33 or var_440_33 * (var_440_38 / var_440_37)

				if var_440_39 > 0 and var_440_33 < var_440_39 then
					arg_437_1.talkMaxDuration = var_440_39
					var_440_32 = var_440_32 + 0.3

					if var_440_39 + var_440_32 > arg_437_1.duration_ then
						arg_437_1.duration_ = var_440_39 + var_440_32
					end
				end

				arg_437_1.text_.text = var_440_36
				arg_437_1.typewritter.percent = 0

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(false)
				arg_437_1:RecordContent(arg_437_1.text_.text)
			end

			local var_440_40 = var_440_32 + 0.3
			local var_440_41 = math.max(var_440_33, arg_437_1.talkMaxDuration)

			if var_440_40 <= arg_437_1.time_ and arg_437_1.time_ < var_440_40 + var_440_41 then
				arg_437_1.typewritter.percent = (arg_437_1.time_ - var_440_40) / var_440_41

				arg_437_1.typewritter:SetDirty()
			end

			if arg_437_1.time_ >= var_440_40 + var_440_41 and arg_437_1.time_ < var_440_40 + var_440_41 + arg_440_0 then
				arg_437_1.typewritter.percent = 1

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(true)
			end
		end
	end,
	Play115261109 = function(arg_443_0, arg_443_1)
		arg_443_1.time_ = 0
		arg_443_1.frameCnt_ = 0
		arg_443_1.state_ = "playing"
		arg_443_1.curTalkId_ = 115261109
		arg_443_1.duration_ = 5.7

		local var_443_0 = {
			ja = 5.7,
			ko = 3.366,
			zh = 3.766,
			en = 4.233
		}
		local var_443_1 = manager.audio:GetLocalizationFlag()

		if var_443_0[var_443_1] ~= nil then
			arg_443_1.duration_ = var_443_0[var_443_1]
		end

		SetActive(arg_443_1.tipsGo_, false)

		function arg_443_1.onSingleLineFinish_()
			arg_443_1.onSingleLineUpdate_ = nil
			arg_443_1.onSingleLineFinish_ = nil
			arg_443_1.state_ = "waiting"
		end

		function arg_443_1.playNext_(arg_445_0)
			if arg_445_0 == 1 then
				arg_443_0:Play115261110(arg_443_1)
			end
		end

		function arg_443_1.onSingleLineUpdate_(arg_446_0)
			local var_446_0 = arg_443_1.actors_["10030"].transform
			local var_446_1 = 0

			if var_446_1 < arg_443_1.time_ and arg_443_1.time_ <= var_446_1 + arg_446_0 then
				arg_443_1.var_.moveOldPos10030 = var_446_0.localPosition
				var_446_0.localScale = Vector3.New(1, 1, 1)

				arg_443_1:CheckSpriteTmpPos("10030", 3)

				local var_446_2 = var_446_0.childCount

				for iter_446_0 = 0, var_446_2 - 1 do
					local var_446_3 = var_446_0:GetChild(iter_446_0)

					if var_446_3.name == "split_3" or not string.find(var_446_3.name, "split") then
						var_446_3.gameObject:SetActive(true)
					else
						var_446_3.gameObject:SetActive(false)
					end
				end
			end

			local var_446_4 = 0.001

			if var_446_1 <= arg_443_1.time_ and arg_443_1.time_ < var_446_1 + var_446_4 then
				local var_446_5 = (arg_443_1.time_ - var_446_1) / var_446_4
				local var_446_6 = Vector3.New(0, -390, 150)

				var_446_0.localPosition = Vector3.Lerp(arg_443_1.var_.moveOldPos10030, var_446_6, var_446_5)
			end

			if arg_443_1.time_ >= var_446_1 + var_446_4 and arg_443_1.time_ < var_446_1 + var_446_4 + arg_446_0 then
				var_446_0.localPosition = Vector3.New(0, -390, 150)
			end

			local var_446_7 = arg_443_1.actors_["10030"]
			local var_446_8 = 0

			if var_446_8 < arg_443_1.time_ and arg_443_1.time_ <= var_446_8 + arg_446_0 then
				local var_446_9 = var_446_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_446_9 then
					arg_443_1.var_.alphaOldValue10030 = var_446_9.alpha
					arg_443_1.var_.characterEffect10030 = var_446_9
				end

				arg_443_1.var_.alphaOldValue10030 = 0
			end

			local var_446_10 = 0.325

			if var_446_8 <= arg_443_1.time_ and arg_443_1.time_ < var_446_8 + var_446_10 then
				local var_446_11 = (arg_443_1.time_ - var_446_8) / var_446_10
				local var_446_12 = Mathf.Lerp(arg_443_1.var_.alphaOldValue10030, 1, var_446_11)

				if arg_443_1.var_.characterEffect10030 then
					arg_443_1.var_.characterEffect10030.alpha = var_446_12
				end
			end

			if arg_443_1.time_ >= var_446_8 + var_446_10 and arg_443_1.time_ < var_446_8 + var_446_10 + arg_446_0 and arg_443_1.var_.characterEffect10030 then
				arg_443_1.var_.characterEffect10030.alpha = 1
			end

			local var_446_13 = 0
			local var_446_14 = 0.325

			if var_446_13 < arg_443_1.time_ and arg_443_1.time_ <= var_446_13 + arg_446_0 then
				arg_443_1.talkMaxDuration = 0
				arg_443_1.dialogCg_.alpha = 1

				arg_443_1.dialog_:SetActive(true)
				SetActive(arg_443_1.leftNameGo_, true)

				local var_446_15 = arg_443_1:FormatText(StoryNameCfg[309].name)

				arg_443_1.leftNameTxt_.text = var_446_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_443_1.leftNameTxt_.transform)

				arg_443_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_443_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_443_1:RecordName(arg_443_1.leftNameTxt_.text)
				SetActive(arg_443_1.iconTrs_.gameObject, false)
				arg_443_1.callingController_:SetSelectedState("normal")

				local var_446_16 = arg_443_1:GetWordFromCfg(115261109)
				local var_446_17 = arg_443_1:FormatText(var_446_16.content)

				arg_443_1.text_.text = var_446_17

				LuaForUtil.ClearLinePrefixSymbol(arg_443_1.text_)

				local var_446_18 = 13
				local var_446_19 = utf8.len(var_446_17)
				local var_446_20 = var_446_18 <= 0 and var_446_14 or var_446_14 * (var_446_19 / var_446_18)

				if var_446_20 > 0 and var_446_14 < var_446_20 then
					arg_443_1.talkMaxDuration = var_446_20

					if var_446_20 + var_446_13 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_20 + var_446_13
					end
				end

				arg_443_1.text_.text = var_446_17
				arg_443_1.typewritter.percent = 0

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261109", "story_v_out_115261.awb") ~= 0 then
					local var_446_21 = manager.audio:GetVoiceLength("story_v_out_115261", "115261109", "story_v_out_115261.awb") / 1000

					if var_446_21 + var_446_13 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_21 + var_446_13
					end

					if var_446_16.prefab_name ~= "" and arg_443_1.actors_[var_446_16.prefab_name] ~= nil then
						local var_446_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_443_1.actors_[var_446_16.prefab_name].transform, "story_v_out_115261", "115261109", "story_v_out_115261.awb")

						arg_443_1:RecordAudio("115261109", var_446_22)
						arg_443_1:RecordAudio("115261109", var_446_22)
					else
						arg_443_1:AudioAction("play", "voice", "story_v_out_115261", "115261109", "story_v_out_115261.awb")
					end

					arg_443_1:RecordHistoryTalkVoice("story_v_out_115261", "115261109", "story_v_out_115261.awb")
				end

				arg_443_1:RecordContent(arg_443_1.text_.text)
			end

			local var_446_23 = math.max(var_446_14, arg_443_1.talkMaxDuration)

			if var_446_13 <= arg_443_1.time_ and arg_443_1.time_ < var_446_13 + var_446_23 then
				arg_443_1.typewritter.percent = (arg_443_1.time_ - var_446_13) / var_446_23

				arg_443_1.typewritter:SetDirty()
			end

			if arg_443_1.time_ >= var_446_13 + var_446_23 and arg_443_1.time_ < var_446_13 + var_446_23 + arg_446_0 then
				arg_443_1.typewritter.percent = 1

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(true)
			end
		end
	end,
	Play115261110 = function(arg_447_0, arg_447_1)
		arg_447_1.time_ = 0
		arg_447_1.frameCnt_ = 0
		arg_447_1.state_ = "playing"
		arg_447_1.curTalkId_ = 115261110
		arg_447_1.duration_ = 12.6

		local var_447_0 = {
			ja = 12.6,
			ko = 7.566,
			zh = 9.7,
			en = 9.966
		}
		local var_447_1 = manager.audio:GetLocalizationFlag()

		if var_447_0[var_447_1] ~= nil then
			arg_447_1.duration_ = var_447_0[var_447_1]
		end

		SetActive(arg_447_1.tipsGo_, false)

		function arg_447_1.onSingleLineFinish_()
			arg_447_1.onSingleLineUpdate_ = nil
			arg_447_1.onSingleLineFinish_ = nil
			arg_447_1.state_ = "waiting"
		end

		function arg_447_1.playNext_(arg_449_0)
			if arg_449_0 == 1 then
				arg_447_0:Play115261111(arg_447_1)
			end
		end

		function arg_447_1.onSingleLineUpdate_(arg_450_0)
			local var_450_0 = arg_447_1.actors_["10030"].transform
			local var_450_1 = 0

			if var_450_1 < arg_447_1.time_ and arg_447_1.time_ <= var_450_1 + arg_450_0 then
				arg_447_1.var_.moveOldPos10030 = var_450_0.localPosition
				var_450_0.localScale = Vector3.New(1, 1, 1)

				arg_447_1:CheckSpriteTmpPos("10030", 3)

				local var_450_2 = var_450_0.childCount

				for iter_450_0 = 0, var_450_2 - 1 do
					local var_450_3 = var_450_0:GetChild(iter_450_0)

					if var_450_3.name == "split_5" or not string.find(var_450_3.name, "split") then
						var_450_3.gameObject:SetActive(true)
					else
						var_450_3.gameObject:SetActive(false)
					end
				end
			end

			local var_450_4 = 0.001

			if var_450_1 <= arg_447_1.time_ and arg_447_1.time_ < var_450_1 + var_450_4 then
				local var_450_5 = (arg_447_1.time_ - var_450_1) / var_450_4
				local var_450_6 = Vector3.New(0, -390, 150)

				var_450_0.localPosition = Vector3.Lerp(arg_447_1.var_.moveOldPos10030, var_450_6, var_450_5)
			end

			if arg_447_1.time_ >= var_450_1 + var_450_4 and arg_447_1.time_ < var_450_1 + var_450_4 + arg_450_0 then
				var_450_0.localPosition = Vector3.New(0, -390, 150)
			end

			local var_450_7 = 0
			local var_450_8 = 0.7

			if var_450_7 < arg_447_1.time_ and arg_447_1.time_ <= var_450_7 + arg_450_0 then
				arg_447_1.talkMaxDuration = 0
				arg_447_1.dialogCg_.alpha = 1

				arg_447_1.dialog_:SetActive(true)
				SetActive(arg_447_1.leftNameGo_, true)

				local var_450_9 = arg_447_1:FormatText(StoryNameCfg[309].name)

				arg_447_1.leftNameTxt_.text = var_450_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_447_1.leftNameTxt_.transform)

				arg_447_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_447_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_447_1:RecordName(arg_447_1.leftNameTxt_.text)
				SetActive(arg_447_1.iconTrs_.gameObject, false)
				arg_447_1.callingController_:SetSelectedState("normal")

				local var_450_10 = arg_447_1:GetWordFromCfg(115261110)
				local var_450_11 = arg_447_1:FormatText(var_450_10.content)

				arg_447_1.text_.text = var_450_11

				LuaForUtil.ClearLinePrefixSymbol(arg_447_1.text_)

				local var_450_12 = 28
				local var_450_13 = utf8.len(var_450_11)
				local var_450_14 = var_450_12 <= 0 and var_450_8 or var_450_8 * (var_450_13 / var_450_12)

				if var_450_14 > 0 and var_450_8 < var_450_14 then
					arg_447_1.talkMaxDuration = var_450_14

					if var_450_14 + var_450_7 > arg_447_1.duration_ then
						arg_447_1.duration_ = var_450_14 + var_450_7
					end
				end

				arg_447_1.text_.text = var_450_11
				arg_447_1.typewritter.percent = 0

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261110", "story_v_out_115261.awb") ~= 0 then
					local var_450_15 = manager.audio:GetVoiceLength("story_v_out_115261", "115261110", "story_v_out_115261.awb") / 1000

					if var_450_15 + var_450_7 > arg_447_1.duration_ then
						arg_447_1.duration_ = var_450_15 + var_450_7
					end

					if var_450_10.prefab_name ~= "" and arg_447_1.actors_[var_450_10.prefab_name] ~= nil then
						local var_450_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_447_1.actors_[var_450_10.prefab_name].transform, "story_v_out_115261", "115261110", "story_v_out_115261.awb")

						arg_447_1:RecordAudio("115261110", var_450_16)
						arg_447_1:RecordAudio("115261110", var_450_16)
					else
						arg_447_1:AudioAction("play", "voice", "story_v_out_115261", "115261110", "story_v_out_115261.awb")
					end

					arg_447_1:RecordHistoryTalkVoice("story_v_out_115261", "115261110", "story_v_out_115261.awb")
				end

				arg_447_1:RecordContent(arg_447_1.text_.text)
			end

			local var_450_17 = math.max(var_450_8, arg_447_1.talkMaxDuration)

			if var_450_7 <= arg_447_1.time_ and arg_447_1.time_ < var_450_7 + var_450_17 then
				arg_447_1.typewritter.percent = (arg_447_1.time_ - var_450_7) / var_450_17

				arg_447_1.typewritter:SetDirty()
			end

			if arg_447_1.time_ >= var_450_7 + var_450_17 and arg_447_1.time_ < var_450_7 + var_450_17 + arg_450_0 then
				arg_447_1.typewritter.percent = 1

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(true)
			end
		end
	end,
	Play115261111 = function(arg_451_0, arg_451_1)
		arg_451_1.time_ = 0
		arg_451_1.frameCnt_ = 0
		arg_451_1.state_ = "playing"
		arg_451_1.curTalkId_ = 115261111
		arg_451_1.duration_ = 4.9

		local var_451_0 = {
			ja = 4.9,
			ko = 2.7,
			zh = 4.066,
			en = 3.9
		}
		local var_451_1 = manager.audio:GetLocalizationFlag()

		if var_451_0[var_451_1] ~= nil then
			arg_451_1.duration_ = var_451_0[var_451_1]
		end

		SetActive(arg_451_1.tipsGo_, false)

		function arg_451_1.onSingleLineFinish_()
			arg_451_1.onSingleLineUpdate_ = nil
			arg_451_1.onSingleLineFinish_ = nil
			arg_451_1.state_ = "waiting"
		end

		function arg_451_1.playNext_(arg_453_0)
			if arg_453_0 == 1 then
				arg_451_0:Play115261112(arg_451_1)
			end
		end

		function arg_451_1.onSingleLineUpdate_(arg_454_0)
			local var_454_0 = arg_451_1.actors_["10030"].transform
			local var_454_1 = 0

			if var_454_1 < arg_451_1.time_ and arg_451_1.time_ <= var_454_1 + arg_454_0 then
				arg_451_1.var_.moveOldPos10030 = var_454_0.localPosition
				var_454_0.localScale = Vector3.New(1, 1, 1)

				arg_451_1:CheckSpriteTmpPos("10030", 3)

				local var_454_2 = var_454_0.childCount

				for iter_454_0 = 0, var_454_2 - 1 do
					local var_454_3 = var_454_0:GetChild(iter_454_0)

					if var_454_3.name == "split_3" or not string.find(var_454_3.name, "split") then
						var_454_3.gameObject:SetActive(true)
					else
						var_454_3.gameObject:SetActive(false)
					end
				end
			end

			local var_454_4 = 0.001

			if var_454_1 <= arg_451_1.time_ and arg_451_1.time_ < var_454_1 + var_454_4 then
				local var_454_5 = (arg_451_1.time_ - var_454_1) / var_454_4
				local var_454_6 = Vector3.New(0, -390, 150)

				var_454_0.localPosition = Vector3.Lerp(arg_451_1.var_.moveOldPos10030, var_454_6, var_454_5)
			end

			if arg_451_1.time_ >= var_454_1 + var_454_4 and arg_451_1.time_ < var_454_1 + var_454_4 + arg_454_0 then
				var_454_0.localPosition = Vector3.New(0, -390, 150)
			end

			local var_454_7 = 0
			local var_454_8 = 0.175

			if var_454_7 < arg_451_1.time_ and arg_451_1.time_ <= var_454_7 + arg_454_0 then
				arg_451_1.talkMaxDuration = 0
				arg_451_1.dialogCg_.alpha = 1

				arg_451_1.dialog_:SetActive(true)
				SetActive(arg_451_1.leftNameGo_, true)

				local var_454_9 = arg_451_1:FormatText(StoryNameCfg[309].name)

				arg_451_1.leftNameTxt_.text = var_454_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_451_1.leftNameTxt_.transform)

				arg_451_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_451_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_451_1:RecordName(arg_451_1.leftNameTxt_.text)
				SetActive(arg_451_1.iconTrs_.gameObject, false)
				arg_451_1.callingController_:SetSelectedState("normal")

				local var_454_10 = arg_451_1:GetWordFromCfg(115261111)
				local var_454_11 = arg_451_1:FormatText(var_454_10.content)

				arg_451_1.text_.text = var_454_11

				LuaForUtil.ClearLinePrefixSymbol(arg_451_1.text_)

				local var_454_12 = 7
				local var_454_13 = utf8.len(var_454_11)
				local var_454_14 = var_454_12 <= 0 and var_454_8 or var_454_8 * (var_454_13 / var_454_12)

				if var_454_14 > 0 and var_454_8 < var_454_14 then
					arg_451_1.talkMaxDuration = var_454_14

					if var_454_14 + var_454_7 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_14 + var_454_7
					end
				end

				arg_451_1.text_.text = var_454_11
				arg_451_1.typewritter.percent = 0

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261111", "story_v_out_115261.awb") ~= 0 then
					local var_454_15 = manager.audio:GetVoiceLength("story_v_out_115261", "115261111", "story_v_out_115261.awb") / 1000

					if var_454_15 + var_454_7 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_15 + var_454_7
					end

					if var_454_10.prefab_name ~= "" and arg_451_1.actors_[var_454_10.prefab_name] ~= nil then
						local var_454_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_451_1.actors_[var_454_10.prefab_name].transform, "story_v_out_115261", "115261111", "story_v_out_115261.awb")

						arg_451_1:RecordAudio("115261111", var_454_16)
						arg_451_1:RecordAudio("115261111", var_454_16)
					else
						arg_451_1:AudioAction("play", "voice", "story_v_out_115261", "115261111", "story_v_out_115261.awb")
					end

					arg_451_1:RecordHistoryTalkVoice("story_v_out_115261", "115261111", "story_v_out_115261.awb")
				end

				arg_451_1:RecordContent(arg_451_1.text_.text)
			end

			local var_454_17 = math.max(var_454_8, arg_451_1.talkMaxDuration)

			if var_454_7 <= arg_451_1.time_ and arg_451_1.time_ < var_454_7 + var_454_17 then
				arg_451_1.typewritter.percent = (arg_451_1.time_ - var_454_7) / var_454_17

				arg_451_1.typewritter:SetDirty()
			end

			if arg_451_1.time_ >= var_454_7 + var_454_17 and arg_451_1.time_ < var_454_7 + var_454_17 + arg_454_0 then
				arg_451_1.typewritter.percent = 1

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(true)
			end
		end
	end,
	Play115261112 = function(arg_455_0, arg_455_1)
		arg_455_1.time_ = 0
		arg_455_1.frameCnt_ = 0
		arg_455_1.state_ = "playing"
		arg_455_1.curTalkId_ = 115261112
		arg_455_1.duration_ = 5

		SetActive(arg_455_1.tipsGo_, false)

		function arg_455_1.onSingleLineFinish_()
			arg_455_1.onSingleLineUpdate_ = nil
			arg_455_1.onSingleLineFinish_ = nil
			arg_455_1.state_ = "waiting"
		end

		function arg_455_1.playNext_(arg_457_0)
			if arg_457_0 == 1 then
				arg_455_0:Play115261113(arg_455_1)
			end
		end

		function arg_455_1.onSingleLineUpdate_(arg_458_0)
			local var_458_0 = arg_455_1.actors_["10030"]
			local var_458_1 = 0

			if var_458_1 < arg_455_1.time_ and arg_455_1.time_ <= var_458_1 + arg_458_0 then
				local var_458_2 = var_458_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_458_2 then
					arg_455_1.var_.alphaOldValue10030 = var_458_2.alpha
					arg_455_1.var_.characterEffect10030 = var_458_2
				end

				arg_455_1.var_.alphaOldValue10030 = 1
			end

			local var_458_3 = 0.333333333333333

			if var_458_1 <= arg_455_1.time_ and arg_455_1.time_ < var_458_1 + var_458_3 then
				local var_458_4 = (arg_455_1.time_ - var_458_1) / var_458_3
				local var_458_5 = Mathf.Lerp(arg_455_1.var_.alphaOldValue10030, 0, var_458_4)

				if arg_455_1.var_.characterEffect10030 then
					arg_455_1.var_.characterEffect10030.alpha = var_458_5
				end
			end

			if arg_455_1.time_ >= var_458_1 + var_458_3 and arg_455_1.time_ < var_458_1 + var_458_3 + arg_458_0 and arg_455_1.var_.characterEffect10030 then
				arg_455_1.var_.characterEffect10030.alpha = 0
			end

			local var_458_6 = 0
			local var_458_7 = 0.975

			if var_458_6 < arg_455_1.time_ and arg_455_1.time_ <= var_458_6 + arg_458_0 then
				arg_455_1.talkMaxDuration = 0
				arg_455_1.dialogCg_.alpha = 1

				arg_455_1.dialog_:SetActive(true)
				SetActive(arg_455_1.leftNameGo_, false)

				arg_455_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_455_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_455_1:RecordName(arg_455_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_455_1.iconTrs_.gameObject, false)
				arg_455_1.callingController_:SetSelectedState("normal")

				local var_458_8 = arg_455_1:GetWordFromCfg(115261112)
				local var_458_9 = arg_455_1:FormatText(var_458_8.content)

				arg_455_1.text_.text = var_458_9

				LuaForUtil.ClearLinePrefixSymbol(arg_455_1.text_)

				local var_458_10 = 39
				local var_458_11 = utf8.len(var_458_9)
				local var_458_12 = var_458_10 <= 0 and var_458_7 or var_458_7 * (var_458_11 / var_458_10)

				if var_458_12 > 0 and var_458_7 < var_458_12 then
					arg_455_1.talkMaxDuration = var_458_12

					if var_458_12 + var_458_6 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_12 + var_458_6
					end
				end

				arg_455_1.text_.text = var_458_9
				arg_455_1.typewritter.percent = 0

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(false)
				arg_455_1:RecordContent(arg_455_1.text_.text)
			end

			local var_458_13 = math.max(var_458_7, arg_455_1.talkMaxDuration)

			if var_458_6 <= arg_455_1.time_ and arg_455_1.time_ < var_458_6 + var_458_13 then
				arg_455_1.typewritter.percent = (arg_455_1.time_ - var_458_6) / var_458_13

				arg_455_1.typewritter:SetDirty()
			end

			if arg_455_1.time_ >= var_458_6 + var_458_13 and arg_455_1.time_ < var_458_6 + var_458_13 + arg_458_0 then
				arg_455_1.typewritter.percent = 1

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(true)
			end
		end
	end,
	Play115261113 = function(arg_459_0, arg_459_1)
		arg_459_1.time_ = 0
		arg_459_1.frameCnt_ = 0
		arg_459_1.state_ = "playing"
		arg_459_1.curTalkId_ = 115261113
		arg_459_1.duration_ = 3.7

		local var_459_0 = {
			ja = 2.1,
			ko = 1.766,
			zh = 3.7,
			en = 1.1
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
				arg_459_0:Play115261114(arg_459_1)
			end
		end

		function arg_459_1.onSingleLineUpdate_(arg_462_0)
			local var_462_0 = arg_459_1.actors_["10030"].transform
			local var_462_1 = 0

			if var_462_1 < arg_459_1.time_ and arg_459_1.time_ <= var_462_1 + arg_462_0 then
				arg_459_1.var_.moveOldPos10030 = var_462_0.localPosition
				var_462_0.localScale = Vector3.New(1, 1, 1)

				arg_459_1:CheckSpriteTmpPos("10030", 3)

				local var_462_2 = var_462_0.childCount

				for iter_462_0 = 0, var_462_2 - 1 do
					local var_462_3 = var_462_0:GetChild(iter_462_0)

					if var_462_3.name == "split_1" or not string.find(var_462_3.name, "split") then
						var_462_3.gameObject:SetActive(true)
					else
						var_462_3.gameObject:SetActive(false)
					end
				end
			end

			local var_462_4 = 0.001

			if var_462_1 <= arg_459_1.time_ and arg_459_1.time_ < var_462_1 + var_462_4 then
				local var_462_5 = (arg_459_1.time_ - var_462_1) / var_462_4
				local var_462_6 = Vector3.New(0, -390, 150)

				var_462_0.localPosition = Vector3.Lerp(arg_459_1.var_.moveOldPos10030, var_462_6, var_462_5)
			end

			if arg_459_1.time_ >= var_462_1 + var_462_4 and arg_459_1.time_ < var_462_1 + var_462_4 + arg_462_0 then
				var_462_0.localPosition = Vector3.New(0, -390, 150)
			end

			local var_462_7 = arg_459_1.actors_["10030"]
			local var_462_8 = 0

			if var_462_8 < arg_459_1.time_ and arg_459_1.time_ <= var_462_8 + arg_462_0 and arg_459_1.var_.actorSpriteComps10030 == nil then
				arg_459_1.var_.actorSpriteComps10030 = var_462_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_462_9 = 0.2

			if var_462_8 <= arg_459_1.time_ and arg_459_1.time_ < var_462_8 + var_462_9 then
				local var_462_10 = (arg_459_1.time_ - var_462_8) / var_462_9

				if arg_459_1.var_.actorSpriteComps10030 then
					for iter_462_1, iter_462_2 in pairs(arg_459_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_462_2 then
							local var_462_11 = Mathf.Lerp(iter_462_2.color.r, 1, var_462_10)

							iter_462_2.color = Color.New(var_462_11, var_462_11, var_462_11)
						end
					end
				end
			end

			if arg_459_1.time_ >= var_462_8 + var_462_9 and arg_459_1.time_ < var_462_8 + var_462_9 + arg_462_0 and arg_459_1.var_.actorSpriteComps10030 then
				local var_462_12 = 1

				for iter_462_3, iter_462_4 in pairs(arg_459_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_462_4 then
						iter_462_4.color = Color.New(var_462_12, var_462_12, var_462_12)
					end
				end

				arg_459_1.var_.actorSpriteComps10030 = nil
			end

			local var_462_13 = arg_459_1.actors_["10030"]
			local var_462_14 = 0

			if var_462_14 < arg_459_1.time_ and arg_459_1.time_ <= var_462_14 + arg_462_0 then
				local var_462_15 = var_462_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_462_15 then
					arg_459_1.var_.alphaOldValue10030 = var_462_15.alpha
					arg_459_1.var_.characterEffect10030 = var_462_15
				end

				arg_459_1.var_.alphaOldValue10030 = 0
			end

			local var_462_16 = 0.333333333333333

			if var_462_14 <= arg_459_1.time_ and arg_459_1.time_ < var_462_14 + var_462_16 then
				local var_462_17 = (arg_459_1.time_ - var_462_14) / var_462_16
				local var_462_18 = Mathf.Lerp(arg_459_1.var_.alphaOldValue10030, 1, var_462_17)

				if arg_459_1.var_.characterEffect10030 then
					arg_459_1.var_.characterEffect10030.alpha = var_462_18
				end
			end

			if arg_459_1.time_ >= var_462_14 + var_462_16 and arg_459_1.time_ < var_462_14 + var_462_16 + arg_462_0 and arg_459_1.var_.characterEffect10030 then
				arg_459_1.var_.characterEffect10030.alpha = 1
			end

			local var_462_19 = 0
			local var_462_20 = 0.125

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

				local var_462_22 = arg_459_1:GetWordFromCfg(115261113)
				local var_462_23 = arg_459_1:FormatText(var_462_22.content)

				arg_459_1.text_.text = var_462_23

				LuaForUtil.ClearLinePrefixSymbol(arg_459_1.text_)

				local var_462_24 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261113", "story_v_out_115261.awb") ~= 0 then
					local var_462_27 = manager.audio:GetVoiceLength("story_v_out_115261", "115261113", "story_v_out_115261.awb") / 1000

					if var_462_27 + var_462_19 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_27 + var_462_19
					end

					if var_462_22.prefab_name ~= "" and arg_459_1.actors_[var_462_22.prefab_name] ~= nil then
						local var_462_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_459_1.actors_[var_462_22.prefab_name].transform, "story_v_out_115261", "115261113", "story_v_out_115261.awb")

						arg_459_1:RecordAudio("115261113", var_462_28)
						arg_459_1:RecordAudio("115261113", var_462_28)
					else
						arg_459_1:AudioAction("play", "voice", "story_v_out_115261", "115261113", "story_v_out_115261.awb")
					end

					arg_459_1:RecordHistoryTalkVoice("story_v_out_115261", "115261113", "story_v_out_115261.awb")
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
	Play115261114 = function(arg_463_0, arg_463_1)
		arg_463_1.time_ = 0
		arg_463_1.frameCnt_ = 0
		arg_463_1.state_ = "playing"
		arg_463_1.curTalkId_ = 115261114
		arg_463_1.duration_ = 5

		SetActive(arg_463_1.tipsGo_, false)

		function arg_463_1.onSingleLineFinish_()
			arg_463_1.onSingleLineUpdate_ = nil
			arg_463_1.onSingleLineFinish_ = nil
			arg_463_1.state_ = "waiting"
		end

		function arg_463_1.playNext_(arg_465_0)
			if arg_465_0 == 1 then
				arg_463_0:Play115261115(arg_463_1)
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

			local var_466_3 = 0.333333333333333

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
			local var_466_7 = 0.6

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

				local var_466_8 = arg_463_1:GetWordFromCfg(115261114)
				local var_466_9 = arg_463_1:FormatText(var_466_8.content)

				arg_463_1.text_.text = var_466_9

				LuaForUtil.ClearLinePrefixSymbol(arg_463_1.text_)

				local var_466_10 = 24
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
	Play115261115 = function(arg_467_0, arg_467_1)
		arg_467_1.time_ = 0
		arg_467_1.frameCnt_ = 0
		arg_467_1.state_ = "playing"
		arg_467_1.curTalkId_ = 115261115
		arg_467_1.duration_ = 3.866

		local var_467_0 = {
			ja = 3.666,
			ko = 3.866,
			zh = 2.966,
			en = 3.366
		}
		local var_467_1 = manager.audio:GetLocalizationFlag()

		if var_467_0[var_467_1] ~= nil then
			arg_467_1.duration_ = var_467_0[var_467_1]
		end

		SetActive(arg_467_1.tipsGo_, false)

		function arg_467_1.onSingleLineFinish_()
			arg_467_1.onSingleLineUpdate_ = nil
			arg_467_1.onSingleLineFinish_ = nil
			arg_467_1.state_ = "waiting"
		end

		function arg_467_1.playNext_(arg_469_0)
			if arg_469_0 == 1 then
				arg_467_0:Play115261116(arg_467_1)
			end
		end

		function arg_467_1.onSingleLineUpdate_(arg_470_0)
			local var_470_0 = arg_467_1.actors_["10029"].transform
			local var_470_1 = 0

			if var_470_1 < arg_467_1.time_ and arg_467_1.time_ <= var_470_1 + arg_470_0 then
				arg_467_1.var_.moveOldPos10029 = var_470_0.localPosition
				var_470_0.localScale = Vector3.New(1, 1, 1)

				arg_467_1:CheckSpriteTmpPos("10029", 3)
			end

			local var_470_2 = 0.001

			if var_470_1 <= arg_467_1.time_ and arg_467_1.time_ < var_470_1 + var_470_2 then
				local var_470_3 = (arg_467_1.time_ - var_470_1) / var_470_2
				local var_470_4 = Vector3.New(0, -350, -180)

				var_470_0.localPosition = Vector3.Lerp(arg_467_1.var_.moveOldPos10029, var_470_4, var_470_3)
			end

			if arg_467_1.time_ >= var_470_1 + var_470_2 and arg_467_1.time_ < var_470_1 + var_470_2 + arg_470_0 then
				var_470_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_470_5 = arg_467_1.actors_["10029"]
			local var_470_6 = 0

			if var_470_6 < arg_467_1.time_ and arg_467_1.time_ <= var_470_6 + arg_470_0 then
				local var_470_7 = var_470_5:GetComponent("Image")

				if var_470_7 then
					arg_467_1.var_.highlightMatValue10029 = var_470_7
				end
			end

			local var_470_8 = 0.2

			if var_470_6 <= arg_467_1.time_ and arg_467_1.time_ < var_470_6 + var_470_8 then
				local var_470_9 = (arg_467_1.time_ - var_470_6) / var_470_8

				if arg_467_1.var_.highlightMatValue10029 then
					local var_470_10 = Mathf.Lerp(0.5, 1, var_470_9)
					local var_470_11 = arg_467_1.var_.highlightMatValue10029
					local var_470_12 = var_470_11.color

					var_470_12.r = var_470_10
					var_470_12.g = var_470_10
					var_470_12.b = var_470_10
					var_470_11.color = var_470_12
				end
			end

			if arg_467_1.time_ >= var_470_6 + var_470_8 and arg_467_1.time_ < var_470_6 + var_470_8 + arg_470_0 and arg_467_1.var_.highlightMatValue10029 then
				local var_470_13 = 1

				var_470_5.transform:SetSiblingIndex(1)

				local var_470_14 = arg_467_1.var_.highlightMatValue10029
				local var_470_15 = var_470_14.color

				var_470_15.r = var_470_13
				var_470_15.g = var_470_13
				var_470_15.b = var_470_13
				var_470_14.color = var_470_15
			end

			local var_470_16 = arg_467_1.actors_["10029"]
			local var_470_17 = 0

			if var_470_17 < arg_467_1.time_ and arg_467_1.time_ <= var_470_17 + arg_470_0 then
				local var_470_18 = var_470_16:GetComponent("Image")

				if var_470_18 then
					arg_467_1.var_.alphaMatValue10029 = var_470_18
					arg_467_1.var_.alphaOldValue10029 = var_470_18.color.a
				end

				arg_467_1.var_.alphaOldValue10029 = 0
			end

			local var_470_19 = 0.333333333333333

			if var_470_17 <= arg_467_1.time_ and arg_467_1.time_ < var_470_17 + var_470_19 then
				local var_470_20 = (arg_467_1.time_ - var_470_17) / var_470_19
				local var_470_21 = Mathf.Lerp(arg_467_1.var_.alphaOldValue10029, 1, var_470_20)

				if arg_467_1.var_.alphaMatValue10029 then
					local var_470_22 = arg_467_1.var_.alphaMatValue10029.color

					var_470_22.a = var_470_21
					arg_467_1.var_.alphaMatValue10029.color = var_470_22
				end
			end

			if arg_467_1.time_ >= var_470_17 + var_470_19 and arg_467_1.time_ < var_470_17 + var_470_19 + arg_470_0 and arg_467_1.var_.alphaMatValue10029 then
				local var_470_23 = arg_467_1.var_.alphaMatValue10029
				local var_470_24 = var_470_23.color

				var_470_24.a = 1
				var_470_23.color = var_470_24
			end

			local var_470_25 = 0
			local var_470_26 = 0.25

			if var_470_25 < arg_467_1.time_ and arg_467_1.time_ <= var_470_25 + arg_470_0 then
				arg_467_1.talkMaxDuration = 0
				arg_467_1.dialogCg_.alpha = 1

				arg_467_1.dialog_:SetActive(true)
				SetActive(arg_467_1.leftNameGo_, true)

				local var_470_27 = arg_467_1:FormatText(StoryNameCfg[312].name)

				arg_467_1.leftNameTxt_.text = var_470_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_467_1.leftNameTxt_.transform)

				arg_467_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_467_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_467_1:RecordName(arg_467_1.leftNameTxt_.text)
				SetActive(arg_467_1.iconTrs_.gameObject, false)
				arg_467_1.callingController_:SetSelectedState("normal")

				local var_470_28 = arg_467_1:GetWordFromCfg(115261115)
				local var_470_29 = arg_467_1:FormatText(var_470_28.content)

				arg_467_1.text_.text = var_470_29

				LuaForUtil.ClearLinePrefixSymbol(arg_467_1.text_)

				local var_470_30 = 10
				local var_470_31 = utf8.len(var_470_29)
				local var_470_32 = var_470_30 <= 0 and var_470_26 or var_470_26 * (var_470_31 / var_470_30)

				if var_470_32 > 0 and var_470_26 < var_470_32 then
					arg_467_1.talkMaxDuration = var_470_32

					if var_470_32 + var_470_25 > arg_467_1.duration_ then
						arg_467_1.duration_ = var_470_32 + var_470_25
					end
				end

				arg_467_1.text_.text = var_470_29
				arg_467_1.typewritter.percent = 0

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261115", "story_v_out_115261.awb") ~= 0 then
					local var_470_33 = manager.audio:GetVoiceLength("story_v_out_115261", "115261115", "story_v_out_115261.awb") / 1000

					if var_470_33 + var_470_25 > arg_467_1.duration_ then
						arg_467_1.duration_ = var_470_33 + var_470_25
					end

					if var_470_28.prefab_name ~= "" and arg_467_1.actors_[var_470_28.prefab_name] ~= nil then
						local var_470_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_467_1.actors_[var_470_28.prefab_name].transform, "story_v_out_115261", "115261115", "story_v_out_115261.awb")

						arg_467_1:RecordAudio("115261115", var_470_34)
						arg_467_1:RecordAudio("115261115", var_470_34)
					else
						arg_467_1:AudioAction("play", "voice", "story_v_out_115261", "115261115", "story_v_out_115261.awb")
					end

					arg_467_1:RecordHistoryTalkVoice("story_v_out_115261", "115261115", "story_v_out_115261.awb")
				end

				arg_467_1:RecordContent(arg_467_1.text_.text)
			end

			local var_470_35 = math.max(var_470_26, arg_467_1.talkMaxDuration)

			if var_470_25 <= arg_467_1.time_ and arg_467_1.time_ < var_470_25 + var_470_35 then
				arg_467_1.typewritter.percent = (arg_467_1.time_ - var_470_25) / var_470_35

				arg_467_1.typewritter:SetDirty()
			end

			if arg_467_1.time_ >= var_470_25 + var_470_35 and arg_467_1.time_ < var_470_25 + var_470_35 + arg_470_0 then
				arg_467_1.typewritter.percent = 1

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(true)
			end
		end
	end,
	Play115261116 = function(arg_471_0, arg_471_1)
		arg_471_1.time_ = 0
		arg_471_1.frameCnt_ = 0
		arg_471_1.state_ = "playing"
		arg_471_1.curTalkId_ = 115261116
		arg_471_1.duration_ = 5

		SetActive(arg_471_1.tipsGo_, false)

		function arg_471_1.onSingleLineFinish_()
			arg_471_1.onSingleLineUpdate_ = nil
			arg_471_1.onSingleLineFinish_ = nil
			arg_471_1.state_ = "waiting"
		end

		function arg_471_1.playNext_(arg_473_0)
			if arg_473_0 == 1 then
				arg_471_0:Play115261117(arg_471_1)
			end
		end

		function arg_471_1.onSingleLineUpdate_(arg_474_0)
			local var_474_0 = arg_471_1.actors_["10029"]
			local var_474_1 = 0

			if var_474_1 < arg_471_1.time_ and arg_471_1.time_ <= var_474_1 + arg_474_0 then
				local var_474_2 = var_474_0:GetComponent("Image")

				if var_474_2 then
					arg_471_1.var_.highlightMatValue10029 = var_474_2
				end
			end

			local var_474_3 = 0.2

			if var_474_1 <= arg_471_1.time_ and arg_471_1.time_ < var_474_1 + var_474_3 then
				local var_474_4 = (arg_471_1.time_ - var_474_1) / var_474_3

				if arg_471_1.var_.highlightMatValue10029 then
					local var_474_5 = Mathf.Lerp(1, 0.5, var_474_4)
					local var_474_6 = arg_471_1.var_.highlightMatValue10029
					local var_474_7 = var_474_6.color

					var_474_7.r = var_474_5
					var_474_7.g = var_474_5
					var_474_7.b = var_474_5
					var_474_6.color = var_474_7
				end
			end

			if arg_471_1.time_ >= var_474_1 + var_474_3 and arg_471_1.time_ < var_474_1 + var_474_3 + arg_474_0 and arg_471_1.var_.highlightMatValue10029 then
				local var_474_8 = 0.5
				local var_474_9 = arg_471_1.var_.highlightMatValue10029
				local var_474_10 = var_474_9.color

				var_474_10.r = var_474_8
				var_474_10.g = var_474_8
				var_474_10.b = var_474_8
				var_474_9.color = var_474_10
			end

			local var_474_11 = 0
			local var_474_12 = 0.725

			if var_474_11 < arg_471_1.time_ and arg_471_1.time_ <= var_474_11 + arg_474_0 then
				arg_471_1.talkMaxDuration = 0
				arg_471_1.dialogCg_.alpha = 1

				arg_471_1.dialog_:SetActive(true)
				SetActive(arg_471_1.leftNameGo_, false)

				arg_471_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_471_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_471_1:RecordName(arg_471_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_471_1.iconTrs_.gameObject, false)
				arg_471_1.callingController_:SetSelectedState("normal")

				local var_474_13 = arg_471_1:GetWordFromCfg(115261116)
				local var_474_14 = arg_471_1:FormatText(var_474_13.content)

				arg_471_1.text_.text = var_474_14

				LuaForUtil.ClearLinePrefixSymbol(arg_471_1.text_)

				local var_474_15 = 29
				local var_474_16 = utf8.len(var_474_14)
				local var_474_17 = var_474_15 <= 0 and var_474_12 or var_474_12 * (var_474_16 / var_474_15)

				if var_474_17 > 0 and var_474_12 < var_474_17 then
					arg_471_1.talkMaxDuration = var_474_17

					if var_474_17 + var_474_11 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_17 + var_474_11
					end
				end

				arg_471_1.text_.text = var_474_14
				arg_471_1.typewritter.percent = 0

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(false)
				arg_471_1:RecordContent(arg_471_1.text_.text)
			end

			local var_474_18 = math.max(var_474_12, arg_471_1.talkMaxDuration)

			if var_474_11 <= arg_471_1.time_ and arg_471_1.time_ < var_474_11 + var_474_18 then
				arg_471_1.typewritter.percent = (arg_471_1.time_ - var_474_11) / var_474_18

				arg_471_1.typewritter:SetDirty()
			end

			if arg_471_1.time_ >= var_474_11 + var_474_18 and arg_471_1.time_ < var_474_11 + var_474_18 + arg_474_0 then
				arg_471_1.typewritter.percent = 1

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(true)
			end
		end
	end,
	Play115261117 = function(arg_475_0, arg_475_1)
		arg_475_1.time_ = 0
		arg_475_1.frameCnt_ = 0
		arg_475_1.state_ = "playing"
		arg_475_1.curTalkId_ = 115261117
		arg_475_1.duration_ = 9.4

		local var_475_0 = {
			ja = 5.433,
			ko = 6.733,
			zh = 5.5,
			en = 9.4
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
				arg_475_0:Play115261118(arg_475_1)
			end
		end

		function arg_475_1.onSingleLineUpdate_(arg_478_0)
			local var_478_0 = arg_475_1.actors_["10029"].transform
			local var_478_1 = 0

			if var_478_1 < arg_475_1.time_ and arg_475_1.time_ <= var_478_1 + arg_478_0 then
				arg_475_1.var_.moveOldPos10029 = var_478_0.localPosition
				var_478_0.localScale = Vector3.New(1, 1, 1)

				arg_475_1:CheckSpriteTmpPos("10029", 3)
			end

			local var_478_2 = 0.001

			if var_478_1 <= arg_475_1.time_ and arg_475_1.time_ < var_478_1 + var_478_2 then
				local var_478_3 = (arg_475_1.time_ - var_478_1) / var_478_2
				local var_478_4 = Vector3.New(0, -350, -180)

				var_478_0.localPosition = Vector3.Lerp(arg_475_1.var_.moveOldPos10029, var_478_4, var_478_3)
			end

			if arg_475_1.time_ >= var_478_1 + var_478_2 and arg_475_1.time_ < var_478_1 + var_478_2 + arg_478_0 then
				var_478_0.localPosition = Vector3.New(0, -350, -180)
			end

			local var_478_5 = arg_475_1.actors_["10029"]
			local var_478_6 = 0

			if var_478_6 < arg_475_1.time_ and arg_475_1.time_ <= var_478_6 + arg_478_0 then
				local var_478_7 = var_478_5:GetComponent("Image")

				if var_478_7 then
					arg_475_1.var_.highlightMatValue10029 = var_478_7
				end
			end

			local var_478_8 = 0.2

			if var_478_6 <= arg_475_1.time_ and arg_475_1.time_ < var_478_6 + var_478_8 then
				local var_478_9 = (arg_475_1.time_ - var_478_6) / var_478_8

				if arg_475_1.var_.highlightMatValue10029 then
					local var_478_10 = Mathf.Lerp(0.5, 1, var_478_9)
					local var_478_11 = arg_475_1.var_.highlightMatValue10029
					local var_478_12 = var_478_11.color

					var_478_12.r = var_478_10
					var_478_12.g = var_478_10
					var_478_12.b = var_478_10
					var_478_11.color = var_478_12
				end
			end

			if arg_475_1.time_ >= var_478_6 + var_478_8 and arg_475_1.time_ < var_478_6 + var_478_8 + arg_478_0 and arg_475_1.var_.highlightMatValue10029 then
				local var_478_13 = 1

				var_478_5.transform:SetSiblingIndex(1)

				local var_478_14 = arg_475_1.var_.highlightMatValue10029
				local var_478_15 = var_478_14.color

				var_478_15.r = var_478_13
				var_478_15.g = var_478_13
				var_478_15.b = var_478_13
				var_478_14.color = var_478_15
			end

			local var_478_16 = 0
			local var_478_17 = 0.65

			if var_478_16 < arg_475_1.time_ and arg_475_1.time_ <= var_478_16 + arg_478_0 then
				arg_475_1.talkMaxDuration = 0
				arg_475_1.dialogCg_.alpha = 1

				arg_475_1.dialog_:SetActive(true)
				SetActive(arg_475_1.leftNameGo_, true)

				local var_478_18 = arg_475_1:FormatText(StoryNameCfg[312].name)

				arg_475_1.leftNameTxt_.text = var_478_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_475_1.leftNameTxt_.transform)

				arg_475_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_475_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_475_1:RecordName(arg_475_1.leftNameTxt_.text)
				SetActive(arg_475_1.iconTrs_.gameObject, false)
				arg_475_1.callingController_:SetSelectedState("normal")

				local var_478_19 = arg_475_1:GetWordFromCfg(115261117)
				local var_478_20 = arg_475_1:FormatText(var_478_19.content)

				arg_475_1.text_.text = var_478_20

				LuaForUtil.ClearLinePrefixSymbol(arg_475_1.text_)

				local var_478_21 = 26
				local var_478_22 = utf8.len(var_478_20)
				local var_478_23 = var_478_21 <= 0 and var_478_17 or var_478_17 * (var_478_22 / var_478_21)

				if var_478_23 > 0 and var_478_17 < var_478_23 then
					arg_475_1.talkMaxDuration = var_478_23

					if var_478_23 + var_478_16 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_23 + var_478_16
					end
				end

				arg_475_1.text_.text = var_478_20
				arg_475_1.typewritter.percent = 0

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261117", "story_v_out_115261.awb") ~= 0 then
					local var_478_24 = manager.audio:GetVoiceLength("story_v_out_115261", "115261117", "story_v_out_115261.awb") / 1000

					if var_478_24 + var_478_16 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_24 + var_478_16
					end

					if var_478_19.prefab_name ~= "" and arg_475_1.actors_[var_478_19.prefab_name] ~= nil then
						local var_478_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_475_1.actors_[var_478_19.prefab_name].transform, "story_v_out_115261", "115261117", "story_v_out_115261.awb")

						arg_475_1:RecordAudio("115261117", var_478_25)
						arg_475_1:RecordAudio("115261117", var_478_25)
					else
						arg_475_1:AudioAction("play", "voice", "story_v_out_115261", "115261117", "story_v_out_115261.awb")
					end

					arg_475_1:RecordHistoryTalkVoice("story_v_out_115261", "115261117", "story_v_out_115261.awb")
				end

				arg_475_1:RecordContent(arg_475_1.text_.text)
			end

			local var_478_26 = math.max(var_478_17, arg_475_1.talkMaxDuration)

			if var_478_16 <= arg_475_1.time_ and arg_475_1.time_ < var_478_16 + var_478_26 then
				arg_475_1.typewritter.percent = (arg_475_1.time_ - var_478_16) / var_478_26

				arg_475_1.typewritter:SetDirty()
			end

			if arg_475_1.time_ >= var_478_16 + var_478_26 and arg_475_1.time_ < var_478_16 + var_478_26 + arg_478_0 then
				arg_475_1.typewritter.percent = 1

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(true)
			end
		end
	end,
	Play115261118 = function(arg_479_0, arg_479_1)
		arg_479_1.time_ = 0
		arg_479_1.frameCnt_ = 0
		arg_479_1.state_ = "playing"
		arg_479_1.curTalkId_ = 115261118
		arg_479_1.duration_ = 6.366

		local var_479_0 = {
			ja = 6.366,
			ko = 4.833,
			zh = 2.266,
			en = 4.133
		}
		local var_479_1 = manager.audio:GetLocalizationFlag()

		if var_479_0[var_479_1] ~= nil then
			arg_479_1.duration_ = var_479_0[var_479_1]
		end

		SetActive(arg_479_1.tipsGo_, false)

		function arg_479_1.onSingleLineFinish_()
			arg_479_1.onSingleLineUpdate_ = nil
			arg_479_1.onSingleLineFinish_ = nil
			arg_479_1.state_ = "waiting"
		end

		function arg_479_1.playNext_(arg_481_0)
			if arg_481_0 == 1 then
				arg_479_0:Play115261119(arg_479_1)
			end
		end

		function arg_479_1.onSingleLineUpdate_(arg_482_0)
			local var_482_0 = 0
			local var_482_1 = 0.325

			if var_482_0 < arg_479_1.time_ and arg_479_1.time_ <= var_482_0 + arg_482_0 then
				arg_479_1.talkMaxDuration = 0
				arg_479_1.dialogCg_.alpha = 1

				arg_479_1.dialog_:SetActive(true)
				SetActive(arg_479_1.leftNameGo_, true)

				local var_482_2 = arg_479_1:FormatText(StoryNameCfg[312].name)

				arg_479_1.leftNameTxt_.text = var_482_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_479_1.leftNameTxt_.transform)

				arg_479_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_479_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_479_1:RecordName(arg_479_1.leftNameTxt_.text)
				SetActive(arg_479_1.iconTrs_.gameObject, false)
				arg_479_1.callingController_:SetSelectedState("normal")

				local var_482_3 = arg_479_1:GetWordFromCfg(115261118)
				local var_482_4 = arg_479_1:FormatText(var_482_3.content)

				arg_479_1.text_.text = var_482_4

				LuaForUtil.ClearLinePrefixSymbol(arg_479_1.text_)

				local var_482_5 = 13
				local var_482_6 = utf8.len(var_482_4)
				local var_482_7 = var_482_5 <= 0 and var_482_1 or var_482_1 * (var_482_6 / var_482_5)

				if var_482_7 > 0 and var_482_1 < var_482_7 then
					arg_479_1.talkMaxDuration = var_482_7

					if var_482_7 + var_482_0 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_7 + var_482_0
					end
				end

				arg_479_1.text_.text = var_482_4
				arg_479_1.typewritter.percent = 0

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261118", "story_v_out_115261.awb") ~= 0 then
					local var_482_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261118", "story_v_out_115261.awb") / 1000

					if var_482_8 + var_482_0 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_8 + var_482_0
					end

					if var_482_3.prefab_name ~= "" and arg_479_1.actors_[var_482_3.prefab_name] ~= nil then
						local var_482_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_479_1.actors_[var_482_3.prefab_name].transform, "story_v_out_115261", "115261118", "story_v_out_115261.awb")

						arg_479_1:RecordAudio("115261118", var_482_9)
						arg_479_1:RecordAudio("115261118", var_482_9)
					else
						arg_479_1:AudioAction("play", "voice", "story_v_out_115261", "115261118", "story_v_out_115261.awb")
					end

					arg_479_1:RecordHistoryTalkVoice("story_v_out_115261", "115261118", "story_v_out_115261.awb")
				end

				arg_479_1:RecordContent(arg_479_1.text_.text)
			end

			local var_482_10 = math.max(var_482_1, arg_479_1.talkMaxDuration)

			if var_482_0 <= arg_479_1.time_ and arg_479_1.time_ < var_482_0 + var_482_10 then
				arg_479_1.typewritter.percent = (arg_479_1.time_ - var_482_0) / var_482_10

				arg_479_1.typewritter:SetDirty()
			end

			if arg_479_1.time_ >= var_482_0 + var_482_10 and arg_479_1.time_ < var_482_0 + var_482_10 + arg_482_0 then
				arg_479_1.typewritter.percent = 1

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(true)
			end
		end
	end,
	Play115261119 = function(arg_483_0, arg_483_1)
		arg_483_1.time_ = 0
		arg_483_1.frameCnt_ = 0
		arg_483_1.state_ = "playing"
		arg_483_1.curTalkId_ = 115261119
		arg_483_1.duration_ = 5

		SetActive(arg_483_1.tipsGo_, false)

		function arg_483_1.onSingleLineFinish_()
			arg_483_1.onSingleLineUpdate_ = nil
			arg_483_1.onSingleLineFinish_ = nil
			arg_483_1.state_ = "waiting"
		end

		function arg_483_1.playNext_(arg_485_0)
			if arg_485_0 == 1 then
				arg_483_0:Play115261120(arg_483_1)
			end
		end

		function arg_483_1.onSingleLineUpdate_(arg_486_0)
			local var_486_0 = arg_483_1.actors_["10029"].transform
			local var_486_1 = 0.299333333333333

			if var_486_1 < arg_483_1.time_ and arg_483_1.time_ <= var_486_1 + arg_486_0 then
				arg_483_1.var_.moveOldPos10029 = var_486_0.localPosition
				var_486_0.localScale = Vector3.New(1, 1, 1)

				arg_483_1:CheckSpriteTmpPos("10029", 0)
			end

			local var_486_2 = 0.001

			if var_486_1 <= arg_483_1.time_ and arg_483_1.time_ < var_486_1 + var_486_2 then
				local var_486_3 = (arg_483_1.time_ - var_486_1) / var_486_2
				local var_486_4 = Vector3.New(-1500, -350, -180)

				var_486_0.localPosition = Vector3.Lerp(arg_483_1.var_.moveOldPos10029, var_486_4, var_486_3)
			end

			if arg_483_1.time_ >= var_486_1 + var_486_2 and arg_483_1.time_ < var_486_1 + var_486_2 + arg_486_0 then
				var_486_0.localPosition = Vector3.New(-1500, -350, -180)
			end

			local var_486_5 = arg_483_1.actors_["10029"]
			local var_486_6 = 0

			if var_486_6 < arg_483_1.time_ and arg_483_1.time_ <= var_486_6 + arg_486_0 then
				local var_486_7 = var_486_5:GetComponent("Image")

				if var_486_7 then
					arg_483_1.var_.alphaMatValue10029 = var_486_7
					arg_483_1.var_.alphaOldValue10029 = var_486_7.color.a
				end

				arg_483_1.var_.alphaOldValue10029 = 1
			end

			local var_486_8 = 0.333333333333333

			if var_486_6 <= arg_483_1.time_ and arg_483_1.time_ < var_486_6 + var_486_8 then
				local var_486_9 = (arg_483_1.time_ - var_486_6) / var_486_8
				local var_486_10 = Mathf.Lerp(arg_483_1.var_.alphaOldValue10029, 0, var_486_9)

				if arg_483_1.var_.alphaMatValue10029 then
					local var_486_11 = arg_483_1.var_.alphaMatValue10029.color

					var_486_11.a = var_486_10
					arg_483_1.var_.alphaMatValue10029.color = var_486_11
				end
			end

			if arg_483_1.time_ >= var_486_6 + var_486_8 and arg_483_1.time_ < var_486_6 + var_486_8 + arg_486_0 and arg_483_1.var_.alphaMatValue10029 then
				local var_486_12 = arg_483_1.var_.alphaMatValue10029
				local var_486_13 = var_486_12.color

				var_486_13.a = 0
				var_486_12.color = var_486_13
			end

			local var_486_14 = 0
			local var_486_15 = 0.575

			if var_486_14 < arg_483_1.time_ and arg_483_1.time_ <= var_486_14 + arg_486_0 then
				arg_483_1.talkMaxDuration = 0
				arg_483_1.dialogCg_.alpha = 1

				arg_483_1.dialog_:SetActive(true)
				SetActive(arg_483_1.leftNameGo_, false)

				arg_483_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_483_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_483_1:RecordName(arg_483_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_483_1.iconTrs_.gameObject, false)
				arg_483_1.callingController_:SetSelectedState("normal")

				local var_486_16 = arg_483_1:GetWordFromCfg(115261119)
				local var_486_17 = arg_483_1:FormatText(var_486_16.content)

				arg_483_1.text_.text = var_486_17

				LuaForUtil.ClearLinePrefixSymbol(arg_483_1.text_)

				local var_486_18 = 23
				local var_486_19 = utf8.len(var_486_17)
				local var_486_20 = var_486_18 <= 0 and var_486_15 or var_486_15 * (var_486_19 / var_486_18)

				if var_486_20 > 0 and var_486_15 < var_486_20 then
					arg_483_1.talkMaxDuration = var_486_20

					if var_486_20 + var_486_14 > arg_483_1.duration_ then
						arg_483_1.duration_ = var_486_20 + var_486_14
					end
				end

				arg_483_1.text_.text = var_486_17
				arg_483_1.typewritter.percent = 0

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(false)
				arg_483_1:RecordContent(arg_483_1.text_.text)
			end

			local var_486_21 = math.max(var_486_15, arg_483_1.talkMaxDuration)

			if var_486_14 <= arg_483_1.time_ and arg_483_1.time_ < var_486_14 + var_486_21 then
				arg_483_1.typewritter.percent = (arg_483_1.time_ - var_486_14) / var_486_21

				arg_483_1.typewritter:SetDirty()
			end

			if arg_483_1.time_ >= var_486_14 + var_486_21 and arg_483_1.time_ < var_486_14 + var_486_21 + arg_486_0 then
				arg_483_1.typewritter.percent = 1

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(true)
			end
		end
	end,
	Play115261120 = function(arg_487_0, arg_487_1)
		arg_487_1.time_ = 0
		arg_487_1.frameCnt_ = 0
		arg_487_1.state_ = "playing"
		arg_487_1.curTalkId_ = 115261120
		arg_487_1.duration_ = 4.933

		local var_487_0 = {
			ja = 1.8,
			ko = 2.866,
			zh = 3.1,
			en = 4.933
		}
		local var_487_1 = manager.audio:GetLocalizationFlag()

		if var_487_0[var_487_1] ~= nil then
			arg_487_1.duration_ = var_487_0[var_487_1]
		end

		SetActive(arg_487_1.tipsGo_, false)

		function arg_487_1.onSingleLineFinish_()
			arg_487_1.onSingleLineUpdate_ = nil
			arg_487_1.onSingleLineFinish_ = nil
			arg_487_1.state_ = "waiting"
		end

		function arg_487_1.playNext_(arg_489_0)
			if arg_489_0 == 1 then
				arg_487_0:Play115261121(arg_487_1)
			end
		end

		function arg_487_1.onSingleLineUpdate_(arg_490_0)
			local var_490_0 = arg_487_1.actors_["10030"].transform
			local var_490_1 = 0

			if var_490_1 < arg_487_1.time_ and arg_487_1.time_ <= var_490_1 + arg_490_0 then
				arg_487_1.var_.moveOldPos10030 = var_490_0.localPosition
				var_490_0.localScale = Vector3.New(1, 1, 1)

				arg_487_1:CheckSpriteTmpPos("10030", 4)

				local var_490_2 = var_490_0.childCount

				for iter_490_0 = 0, var_490_2 - 1 do
					local var_490_3 = var_490_0:GetChild(iter_490_0)

					if var_490_3.name == "split_1" or not string.find(var_490_3.name, "split") then
						var_490_3.gameObject:SetActive(true)
					else
						var_490_3.gameObject:SetActive(false)
					end
				end
			end

			local var_490_4 = 0.001

			if var_490_1 <= arg_487_1.time_ and arg_487_1.time_ < var_490_1 + var_490_4 then
				local var_490_5 = (arg_487_1.time_ - var_490_1) / var_490_4
				local var_490_6 = Vector3.New(390, -390, 150)

				var_490_0.localPosition = Vector3.Lerp(arg_487_1.var_.moveOldPos10030, var_490_6, var_490_5)
			end

			if arg_487_1.time_ >= var_490_1 + var_490_4 and arg_487_1.time_ < var_490_1 + var_490_4 + arg_490_0 then
				var_490_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_490_7 = arg_487_1.actors_["10030"]
			local var_490_8 = 0

			if var_490_8 < arg_487_1.time_ and arg_487_1.time_ <= var_490_8 + arg_490_0 then
				local var_490_9 = var_490_7:GetComponentInChildren(typeof(CanvasGroup))

				if var_490_9 then
					arg_487_1.var_.alphaOldValue10030 = var_490_9.alpha
					arg_487_1.var_.characterEffect10030 = var_490_9
				end

				arg_487_1.var_.alphaOldValue10030 = 0
			end

			local var_490_10 = 0.333333333333333

			if var_490_8 <= arg_487_1.time_ and arg_487_1.time_ < var_490_8 + var_490_10 then
				local var_490_11 = (arg_487_1.time_ - var_490_8) / var_490_10
				local var_490_12 = Mathf.Lerp(arg_487_1.var_.alphaOldValue10030, 1, var_490_11)

				if arg_487_1.var_.characterEffect10030 then
					arg_487_1.var_.characterEffect10030.alpha = var_490_12
				end
			end

			if arg_487_1.time_ >= var_490_8 + var_490_10 and arg_487_1.time_ < var_490_8 + var_490_10 + arg_490_0 and arg_487_1.var_.characterEffect10030 then
				arg_487_1.var_.characterEffect10030.alpha = 1
			end

			local var_490_13 = arg_487_1.actors_["10029"].transform
			local var_490_14 = 0

			if var_490_14 < arg_487_1.time_ and arg_487_1.time_ <= var_490_14 + arg_490_0 then
				arg_487_1.var_.moveOldPos10029 = var_490_13.localPosition
				var_490_13.localScale = Vector3.New(1, 1, 1)

				arg_487_1:CheckSpriteTmpPos("10029", 2)
			end

			local var_490_15 = 0.001

			if var_490_14 <= arg_487_1.time_ and arg_487_1.time_ < var_490_14 + var_490_15 then
				local var_490_16 = (arg_487_1.time_ - var_490_14) / var_490_15
				local var_490_17 = Vector3.New(-390, -350, -180)

				var_490_13.localPosition = Vector3.Lerp(arg_487_1.var_.moveOldPos10029, var_490_17, var_490_16)
			end

			if arg_487_1.time_ >= var_490_14 + var_490_15 and arg_487_1.time_ < var_490_14 + var_490_15 + arg_490_0 then
				var_490_13.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_490_18 = arg_487_1.actors_["10029"]
			local var_490_19 = 0

			if var_490_19 < arg_487_1.time_ and arg_487_1.time_ <= var_490_19 + arg_490_0 then
				local var_490_20 = var_490_18:GetComponent("Image")

				if var_490_20 then
					arg_487_1.var_.alphaMatValue10029 = var_490_20
					arg_487_1.var_.alphaOldValue10029 = var_490_20.color.a
				end

				arg_487_1.var_.alphaOldValue10029 = 0
			end

			local var_490_21 = 0.333333333333333

			if var_490_19 <= arg_487_1.time_ and arg_487_1.time_ < var_490_19 + var_490_21 then
				local var_490_22 = (arg_487_1.time_ - var_490_19) / var_490_21
				local var_490_23 = Mathf.Lerp(arg_487_1.var_.alphaOldValue10029, 1, var_490_22)

				if arg_487_1.var_.alphaMatValue10029 then
					local var_490_24 = arg_487_1.var_.alphaMatValue10029.color

					var_490_24.a = var_490_23
					arg_487_1.var_.alphaMatValue10029.color = var_490_24
				end
			end

			if arg_487_1.time_ >= var_490_19 + var_490_21 and arg_487_1.time_ < var_490_19 + var_490_21 + arg_490_0 and arg_487_1.var_.alphaMatValue10029 then
				local var_490_25 = arg_487_1.var_.alphaMatValue10029
				local var_490_26 = var_490_25.color

				var_490_26.a = 1
				var_490_25.color = var_490_26
			end

			local var_490_27 = arg_487_1.actors_["10030"]
			local var_490_28 = 0

			if var_490_28 < arg_487_1.time_ and arg_487_1.time_ <= var_490_28 + arg_490_0 and arg_487_1.var_.actorSpriteComps10030 == nil then
				arg_487_1.var_.actorSpriteComps10030 = var_490_27:GetComponentsInChildren(typeof(Image), true)
			end

			local var_490_29 = 0.2

			if var_490_28 <= arg_487_1.time_ and arg_487_1.time_ < var_490_28 + var_490_29 then
				local var_490_30 = (arg_487_1.time_ - var_490_28) / var_490_29

				if arg_487_1.var_.actorSpriteComps10030 then
					for iter_490_1, iter_490_2 in pairs(arg_487_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_490_2 then
							local var_490_31 = Mathf.Lerp(iter_490_2.color.r, 1, var_490_30)

							iter_490_2.color = Color.New(var_490_31, var_490_31, var_490_31)
						end
					end
				end
			end

			if arg_487_1.time_ >= var_490_28 + var_490_29 and arg_487_1.time_ < var_490_28 + var_490_29 + arg_490_0 and arg_487_1.var_.actorSpriteComps10030 then
				local var_490_32 = 1

				for iter_490_3, iter_490_4 in pairs(arg_487_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_490_4 then
						iter_490_4.color = Color.New(var_490_32, var_490_32, var_490_32)
					end
				end

				arg_487_1.var_.actorSpriteComps10030 = nil
			end

			local var_490_33 = arg_487_1.actors_["10029"]
			local var_490_34 = 0

			if var_490_34 < arg_487_1.time_ and arg_487_1.time_ <= var_490_34 + arg_490_0 then
				local var_490_35 = var_490_33:GetComponent("Image")

				if var_490_35 then
					arg_487_1.var_.highlightMatValue10029 = var_490_35
				end
			end

			local var_490_36 = 0.2

			if var_490_34 <= arg_487_1.time_ and arg_487_1.time_ < var_490_34 + var_490_36 then
				local var_490_37 = (arg_487_1.time_ - var_490_34) / var_490_36

				if arg_487_1.var_.highlightMatValue10029 then
					local var_490_38 = Mathf.Lerp(1, 0.5, var_490_37)
					local var_490_39 = arg_487_1.var_.highlightMatValue10029
					local var_490_40 = var_490_39.color

					var_490_40.r = var_490_38
					var_490_40.g = var_490_38
					var_490_40.b = var_490_38
					var_490_39.color = var_490_40
				end
			end

			if arg_487_1.time_ >= var_490_34 + var_490_36 and arg_487_1.time_ < var_490_34 + var_490_36 + arg_490_0 and arg_487_1.var_.highlightMatValue10029 then
				local var_490_41 = 0.5
				local var_490_42 = arg_487_1.var_.highlightMatValue10029
				local var_490_43 = var_490_42.color

				var_490_43.r = var_490_41
				var_490_43.g = var_490_41
				var_490_43.b = var_490_41
				var_490_42.color = var_490_43
			end

			local var_490_44 = 0
			local var_490_45 = 0.225

			if var_490_44 < arg_487_1.time_ and arg_487_1.time_ <= var_490_44 + arg_490_0 then
				arg_487_1.talkMaxDuration = 0
				arg_487_1.dialogCg_.alpha = 1

				arg_487_1.dialog_:SetActive(true)
				SetActive(arg_487_1.leftNameGo_, true)

				local var_490_46 = arg_487_1:FormatText(StoryNameCfg[309].name)

				arg_487_1.leftNameTxt_.text = var_490_46

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_487_1.leftNameTxt_.transform)

				arg_487_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_487_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_487_1:RecordName(arg_487_1.leftNameTxt_.text)
				SetActive(arg_487_1.iconTrs_.gameObject, false)
				arg_487_1.callingController_:SetSelectedState("normal")

				local var_490_47 = arg_487_1:GetWordFromCfg(115261120)
				local var_490_48 = arg_487_1:FormatText(var_490_47.content)

				arg_487_1.text_.text = var_490_48

				LuaForUtil.ClearLinePrefixSymbol(arg_487_1.text_)

				local var_490_49 = 9
				local var_490_50 = utf8.len(var_490_48)
				local var_490_51 = var_490_49 <= 0 and var_490_45 or var_490_45 * (var_490_50 / var_490_49)

				if var_490_51 > 0 and var_490_45 < var_490_51 then
					arg_487_1.talkMaxDuration = var_490_51

					if var_490_51 + var_490_44 > arg_487_1.duration_ then
						arg_487_1.duration_ = var_490_51 + var_490_44
					end
				end

				arg_487_1.text_.text = var_490_48
				arg_487_1.typewritter.percent = 0

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261120", "story_v_out_115261.awb") ~= 0 then
					local var_490_52 = manager.audio:GetVoiceLength("story_v_out_115261", "115261120", "story_v_out_115261.awb") / 1000

					if var_490_52 + var_490_44 > arg_487_1.duration_ then
						arg_487_1.duration_ = var_490_52 + var_490_44
					end

					if var_490_47.prefab_name ~= "" and arg_487_1.actors_[var_490_47.prefab_name] ~= nil then
						local var_490_53 = LuaForUtil.PlayVoiceWithCriLipsync(arg_487_1.actors_[var_490_47.prefab_name].transform, "story_v_out_115261", "115261120", "story_v_out_115261.awb")

						arg_487_1:RecordAudio("115261120", var_490_53)
						arg_487_1:RecordAudio("115261120", var_490_53)
					else
						arg_487_1:AudioAction("play", "voice", "story_v_out_115261", "115261120", "story_v_out_115261.awb")
					end

					arg_487_1:RecordHistoryTalkVoice("story_v_out_115261", "115261120", "story_v_out_115261.awb")
				end

				arg_487_1:RecordContent(arg_487_1.text_.text)
			end

			local var_490_54 = math.max(var_490_45, arg_487_1.talkMaxDuration)

			if var_490_44 <= arg_487_1.time_ and arg_487_1.time_ < var_490_44 + var_490_54 then
				arg_487_1.typewritter.percent = (arg_487_1.time_ - var_490_44) / var_490_54

				arg_487_1.typewritter:SetDirty()
			end

			if arg_487_1.time_ >= var_490_44 + var_490_54 and arg_487_1.time_ < var_490_44 + var_490_54 + arg_490_0 then
				arg_487_1.typewritter.percent = 1

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(true)
			end
		end
	end,
	Play115261121 = function(arg_491_0, arg_491_1)
		arg_491_1.time_ = 0
		arg_491_1.frameCnt_ = 0
		arg_491_1.state_ = "playing"
		arg_491_1.curTalkId_ = 115261121
		arg_491_1.duration_ = 12.866

		local var_491_0 = {
			ja = 12.866,
			ko = 12.666,
			zh = 11.5,
			en = 11.833
		}
		local var_491_1 = manager.audio:GetLocalizationFlag()

		if var_491_0[var_491_1] ~= nil then
			arg_491_1.duration_ = var_491_0[var_491_1]
		end

		SetActive(arg_491_1.tipsGo_, false)

		function arg_491_1.onSingleLineFinish_()
			arg_491_1.onSingleLineUpdate_ = nil
			arg_491_1.onSingleLineFinish_ = nil
			arg_491_1.state_ = "waiting"
		end

		function arg_491_1.playNext_(arg_493_0)
			if arg_493_0 == 1 then
				arg_491_0:Play115261122(arg_491_1)
			end
		end

		function arg_491_1.onSingleLineUpdate_(arg_494_0)
			local var_494_0 = arg_491_1.actors_["10029"].transform
			local var_494_1 = 0

			if var_494_1 < arg_491_1.time_ and arg_491_1.time_ <= var_494_1 + arg_494_0 then
				arg_491_1.var_.moveOldPos10029 = var_494_0.localPosition
				var_494_0.localScale = Vector3.New(1, 1, 1)

				arg_491_1:CheckSpriteTmpPos("10029", 2)
			end

			local var_494_2 = 0.001

			if var_494_1 <= arg_491_1.time_ and arg_491_1.time_ < var_494_1 + var_494_2 then
				local var_494_3 = (arg_491_1.time_ - var_494_1) / var_494_2
				local var_494_4 = Vector3.New(-390, -350, -180)

				var_494_0.localPosition = Vector3.Lerp(arg_491_1.var_.moveOldPos10029, var_494_4, var_494_3)
			end

			if arg_491_1.time_ >= var_494_1 + var_494_2 and arg_491_1.time_ < var_494_1 + var_494_2 + arg_494_0 then
				var_494_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_494_5 = arg_491_1.actors_["10030"]
			local var_494_6 = 0

			if var_494_6 < arg_491_1.time_ and arg_491_1.time_ <= var_494_6 + arg_494_0 and arg_491_1.var_.actorSpriteComps10030 == nil then
				arg_491_1.var_.actorSpriteComps10030 = var_494_5:GetComponentsInChildren(typeof(Image), true)
			end

			local var_494_7 = 0.2

			if var_494_6 <= arg_491_1.time_ and arg_491_1.time_ < var_494_6 + var_494_7 then
				local var_494_8 = (arg_491_1.time_ - var_494_6) / var_494_7

				if arg_491_1.var_.actorSpriteComps10030 then
					for iter_494_0, iter_494_1 in pairs(arg_491_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_494_1 then
							local var_494_9 = Mathf.Lerp(iter_494_1.color.r, 0.5, var_494_8)

							iter_494_1.color = Color.New(var_494_9, var_494_9, var_494_9)
						end
					end
				end
			end

			if arg_491_1.time_ >= var_494_6 + var_494_7 and arg_491_1.time_ < var_494_6 + var_494_7 + arg_494_0 and arg_491_1.var_.actorSpriteComps10030 then
				local var_494_10 = 0.5

				for iter_494_2, iter_494_3 in pairs(arg_491_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_494_3 then
						iter_494_3.color = Color.New(var_494_10, var_494_10, var_494_10)
					end
				end

				arg_491_1.var_.actorSpriteComps10030 = nil
			end

			local var_494_11 = arg_491_1.actors_["10029"]
			local var_494_12 = 0

			if var_494_12 < arg_491_1.time_ and arg_491_1.time_ <= var_494_12 + arg_494_0 then
				local var_494_13 = var_494_11:GetComponent("Image")

				if var_494_13 then
					arg_491_1.var_.highlightMatValue10029 = var_494_13
				end
			end

			local var_494_14 = 0.2

			if var_494_12 <= arg_491_1.time_ and arg_491_1.time_ < var_494_12 + var_494_14 then
				local var_494_15 = (arg_491_1.time_ - var_494_12) / var_494_14

				if arg_491_1.var_.highlightMatValue10029 then
					local var_494_16 = Mathf.Lerp(0.5, 1, var_494_15)
					local var_494_17 = arg_491_1.var_.highlightMatValue10029
					local var_494_18 = var_494_17.color

					var_494_18.r = var_494_16
					var_494_18.g = var_494_16
					var_494_18.b = var_494_16
					var_494_17.color = var_494_18
				end
			end

			if arg_491_1.time_ >= var_494_12 + var_494_14 and arg_491_1.time_ < var_494_12 + var_494_14 + arg_494_0 and arg_491_1.var_.highlightMatValue10029 then
				local var_494_19 = 1

				var_494_11.transform:SetSiblingIndex(1)

				local var_494_20 = arg_491_1.var_.highlightMatValue10029
				local var_494_21 = var_494_20.color

				var_494_21.r = var_494_19
				var_494_21.g = var_494_19
				var_494_21.b = var_494_19
				var_494_20.color = var_494_21
			end

			local var_494_22 = 0
			local var_494_23 = 1.1

			if var_494_22 < arg_491_1.time_ and arg_491_1.time_ <= var_494_22 + arg_494_0 then
				arg_491_1.talkMaxDuration = 0
				arg_491_1.dialogCg_.alpha = 1

				arg_491_1.dialog_:SetActive(true)
				SetActive(arg_491_1.leftNameGo_, true)

				local var_494_24 = arg_491_1:FormatText(StoryNameCfg[312].name)

				arg_491_1.leftNameTxt_.text = var_494_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_491_1.leftNameTxt_.transform)

				arg_491_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_491_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_491_1:RecordName(arg_491_1.leftNameTxt_.text)
				SetActive(arg_491_1.iconTrs_.gameObject, false)
				arg_491_1.callingController_:SetSelectedState("normal")

				local var_494_25 = arg_491_1:GetWordFromCfg(115261121)
				local var_494_26 = arg_491_1:FormatText(var_494_25.content)

				arg_491_1.text_.text = var_494_26

				LuaForUtil.ClearLinePrefixSymbol(arg_491_1.text_)

				local var_494_27 = 44
				local var_494_28 = utf8.len(var_494_26)
				local var_494_29 = var_494_27 <= 0 and var_494_23 or var_494_23 * (var_494_28 / var_494_27)

				if var_494_29 > 0 and var_494_23 < var_494_29 then
					arg_491_1.talkMaxDuration = var_494_29

					if var_494_29 + var_494_22 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_29 + var_494_22
					end
				end

				arg_491_1.text_.text = var_494_26
				arg_491_1.typewritter.percent = 0

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261121", "story_v_out_115261.awb") ~= 0 then
					local var_494_30 = manager.audio:GetVoiceLength("story_v_out_115261", "115261121", "story_v_out_115261.awb") / 1000

					if var_494_30 + var_494_22 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_30 + var_494_22
					end

					if var_494_25.prefab_name ~= "" and arg_491_1.actors_[var_494_25.prefab_name] ~= nil then
						local var_494_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_491_1.actors_[var_494_25.prefab_name].transform, "story_v_out_115261", "115261121", "story_v_out_115261.awb")

						arg_491_1:RecordAudio("115261121", var_494_31)
						arg_491_1:RecordAudio("115261121", var_494_31)
					else
						arg_491_1:AudioAction("play", "voice", "story_v_out_115261", "115261121", "story_v_out_115261.awb")
					end

					arg_491_1:RecordHistoryTalkVoice("story_v_out_115261", "115261121", "story_v_out_115261.awb")
				end

				arg_491_1:RecordContent(arg_491_1.text_.text)
			end

			local var_494_32 = math.max(var_494_23, arg_491_1.talkMaxDuration)

			if var_494_22 <= arg_491_1.time_ and arg_491_1.time_ < var_494_22 + var_494_32 then
				arg_491_1.typewritter.percent = (arg_491_1.time_ - var_494_22) / var_494_32

				arg_491_1.typewritter:SetDirty()
			end

			if arg_491_1.time_ >= var_494_22 + var_494_32 and arg_491_1.time_ < var_494_22 + var_494_32 + arg_494_0 then
				arg_491_1.typewritter.percent = 1

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(true)
			end
		end
	end,
	Play115261122 = function(arg_495_0, arg_495_1)
		arg_495_1.time_ = 0
		arg_495_1.frameCnt_ = 0
		arg_495_1.state_ = "playing"
		arg_495_1.curTalkId_ = 115261122
		arg_495_1.duration_ = 18.466

		local var_495_0 = {
			ja = 14.4,
			ko = 14.133,
			zh = 13.2,
			en = 18.466
		}
		local var_495_1 = manager.audio:GetLocalizationFlag()

		if var_495_0[var_495_1] ~= nil then
			arg_495_1.duration_ = var_495_0[var_495_1]
		end

		SetActive(arg_495_1.tipsGo_, false)

		function arg_495_1.onSingleLineFinish_()
			arg_495_1.onSingleLineUpdate_ = nil
			arg_495_1.onSingleLineFinish_ = nil
			arg_495_1.state_ = "waiting"
		end

		function arg_495_1.playNext_(arg_497_0)
			if arg_497_0 == 1 then
				arg_495_0:Play115261123(arg_495_1)
			end
		end

		function arg_495_1.onSingleLineUpdate_(arg_498_0)
			local var_498_0 = 0
			local var_498_1 = 1.375

			if var_498_0 < arg_495_1.time_ and arg_495_1.time_ <= var_498_0 + arg_498_0 then
				arg_495_1.talkMaxDuration = 0
				arg_495_1.dialogCg_.alpha = 1

				arg_495_1.dialog_:SetActive(true)
				SetActive(arg_495_1.leftNameGo_, true)

				local var_498_2 = arg_495_1:FormatText(StoryNameCfg[312].name)

				arg_495_1.leftNameTxt_.text = var_498_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_495_1.leftNameTxt_.transform)

				arg_495_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_495_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_495_1:RecordName(arg_495_1.leftNameTxt_.text)
				SetActive(arg_495_1.iconTrs_.gameObject, false)
				arg_495_1.callingController_:SetSelectedState("normal")

				local var_498_3 = arg_495_1:GetWordFromCfg(115261122)
				local var_498_4 = arg_495_1:FormatText(var_498_3.content)

				arg_495_1.text_.text = var_498_4

				LuaForUtil.ClearLinePrefixSymbol(arg_495_1.text_)

				local var_498_5 = 54
				local var_498_6 = utf8.len(var_498_4)
				local var_498_7 = var_498_5 <= 0 and var_498_1 or var_498_1 * (var_498_6 / var_498_5)

				if var_498_7 > 0 and var_498_1 < var_498_7 then
					arg_495_1.talkMaxDuration = var_498_7

					if var_498_7 + var_498_0 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_7 + var_498_0
					end
				end

				arg_495_1.text_.text = var_498_4
				arg_495_1.typewritter.percent = 0

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261122", "story_v_out_115261.awb") ~= 0 then
					local var_498_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261122", "story_v_out_115261.awb") / 1000

					if var_498_8 + var_498_0 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_8 + var_498_0
					end

					if var_498_3.prefab_name ~= "" and arg_495_1.actors_[var_498_3.prefab_name] ~= nil then
						local var_498_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_495_1.actors_[var_498_3.prefab_name].transform, "story_v_out_115261", "115261122", "story_v_out_115261.awb")

						arg_495_1:RecordAudio("115261122", var_498_9)
						arg_495_1:RecordAudio("115261122", var_498_9)
					else
						arg_495_1:AudioAction("play", "voice", "story_v_out_115261", "115261122", "story_v_out_115261.awb")
					end

					arg_495_1:RecordHistoryTalkVoice("story_v_out_115261", "115261122", "story_v_out_115261.awb")
				end

				arg_495_1:RecordContent(arg_495_1.text_.text)
			end

			local var_498_10 = math.max(var_498_1, arg_495_1.talkMaxDuration)

			if var_498_0 <= arg_495_1.time_ and arg_495_1.time_ < var_498_0 + var_498_10 then
				arg_495_1.typewritter.percent = (arg_495_1.time_ - var_498_0) / var_498_10

				arg_495_1.typewritter:SetDirty()
			end

			if arg_495_1.time_ >= var_498_0 + var_498_10 and arg_495_1.time_ < var_498_0 + var_498_10 + arg_498_0 then
				arg_495_1.typewritter.percent = 1

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(true)
			end
		end
	end,
	Play115261123 = function(arg_499_0, arg_499_1)
		arg_499_1.time_ = 0
		arg_499_1.frameCnt_ = 0
		arg_499_1.state_ = "playing"
		arg_499_1.curTalkId_ = 115261123
		arg_499_1.duration_ = 13.4

		local var_499_0 = {
			ja = 9.133,
			ko = 9.1,
			zh = 9.4,
			en = 13.4
		}
		local var_499_1 = manager.audio:GetLocalizationFlag()

		if var_499_0[var_499_1] ~= nil then
			arg_499_1.duration_ = var_499_0[var_499_1]
		end

		SetActive(arg_499_1.tipsGo_, false)

		function arg_499_1.onSingleLineFinish_()
			arg_499_1.onSingleLineUpdate_ = nil
			arg_499_1.onSingleLineFinish_ = nil
			arg_499_1.state_ = "waiting"
		end

		function arg_499_1.playNext_(arg_501_0)
			if arg_501_0 == 1 then
				arg_499_0:Play115261124(arg_499_1)
			end
		end

		function arg_499_1.onSingleLineUpdate_(arg_502_0)
			local var_502_0 = 0
			local var_502_1 = 0.975

			if var_502_0 < arg_499_1.time_ and arg_499_1.time_ <= var_502_0 + arg_502_0 then
				arg_499_1.talkMaxDuration = 0
				arg_499_1.dialogCg_.alpha = 1

				arg_499_1.dialog_:SetActive(true)
				SetActive(arg_499_1.leftNameGo_, true)

				local var_502_2 = arg_499_1:FormatText(StoryNameCfg[312].name)

				arg_499_1.leftNameTxt_.text = var_502_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_499_1.leftNameTxt_.transform)

				arg_499_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_499_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_499_1:RecordName(arg_499_1.leftNameTxt_.text)
				SetActive(arg_499_1.iconTrs_.gameObject, false)
				arg_499_1.callingController_:SetSelectedState("normal")

				local var_502_3 = arg_499_1:GetWordFromCfg(115261123)
				local var_502_4 = arg_499_1:FormatText(var_502_3.content)

				arg_499_1.text_.text = var_502_4

				LuaForUtil.ClearLinePrefixSymbol(arg_499_1.text_)

				local var_502_5 = 38
				local var_502_6 = utf8.len(var_502_4)
				local var_502_7 = var_502_5 <= 0 and var_502_1 or var_502_1 * (var_502_6 / var_502_5)

				if var_502_7 > 0 and var_502_1 < var_502_7 then
					arg_499_1.talkMaxDuration = var_502_7

					if var_502_7 + var_502_0 > arg_499_1.duration_ then
						arg_499_1.duration_ = var_502_7 + var_502_0
					end
				end

				arg_499_1.text_.text = var_502_4
				arg_499_1.typewritter.percent = 0

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261123", "story_v_out_115261.awb") ~= 0 then
					local var_502_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261123", "story_v_out_115261.awb") / 1000

					if var_502_8 + var_502_0 > arg_499_1.duration_ then
						arg_499_1.duration_ = var_502_8 + var_502_0
					end

					if var_502_3.prefab_name ~= "" and arg_499_1.actors_[var_502_3.prefab_name] ~= nil then
						local var_502_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_499_1.actors_[var_502_3.prefab_name].transform, "story_v_out_115261", "115261123", "story_v_out_115261.awb")

						arg_499_1:RecordAudio("115261123", var_502_9)
						arg_499_1:RecordAudio("115261123", var_502_9)
					else
						arg_499_1:AudioAction("play", "voice", "story_v_out_115261", "115261123", "story_v_out_115261.awb")
					end

					arg_499_1:RecordHistoryTalkVoice("story_v_out_115261", "115261123", "story_v_out_115261.awb")
				end

				arg_499_1:RecordContent(arg_499_1.text_.text)
			end

			local var_502_10 = math.max(var_502_1, arg_499_1.talkMaxDuration)

			if var_502_0 <= arg_499_1.time_ and arg_499_1.time_ < var_502_0 + var_502_10 then
				arg_499_1.typewritter.percent = (arg_499_1.time_ - var_502_0) / var_502_10

				arg_499_1.typewritter:SetDirty()
			end

			if arg_499_1.time_ >= var_502_0 + var_502_10 and arg_499_1.time_ < var_502_0 + var_502_10 + arg_502_0 then
				arg_499_1.typewritter.percent = 1

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(true)
			end
		end
	end,
	Play115261124 = function(arg_503_0, arg_503_1)
		arg_503_1.time_ = 0
		arg_503_1.frameCnt_ = 0
		arg_503_1.state_ = "playing"
		arg_503_1.curTalkId_ = 115261124
		arg_503_1.duration_ = 11.7

		local var_503_0 = {
			ja = 11.133,
			ko = 9.566,
			zh = 9.9,
			en = 11.7
		}
		local var_503_1 = manager.audio:GetLocalizationFlag()

		if var_503_0[var_503_1] ~= nil then
			arg_503_1.duration_ = var_503_0[var_503_1]
		end

		SetActive(arg_503_1.tipsGo_, false)

		function arg_503_1.onSingleLineFinish_()
			arg_503_1.onSingleLineUpdate_ = nil
			arg_503_1.onSingleLineFinish_ = nil
			arg_503_1.state_ = "waiting"
		end

		function arg_503_1.playNext_(arg_505_0)
			if arg_505_0 == 1 then
				arg_503_0:Play115261125(arg_503_1)
			end
		end

		function arg_503_1.onSingleLineUpdate_(arg_506_0)
			local var_506_0 = 0
			local var_506_1 = 0.95

			if var_506_0 < arg_503_1.time_ and arg_503_1.time_ <= var_506_0 + arg_506_0 then
				arg_503_1.talkMaxDuration = 0
				arg_503_1.dialogCg_.alpha = 1

				arg_503_1.dialog_:SetActive(true)
				SetActive(arg_503_1.leftNameGo_, true)

				local var_506_2 = arg_503_1:FormatText(StoryNameCfg[312].name)

				arg_503_1.leftNameTxt_.text = var_506_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_503_1.leftNameTxt_.transform)

				arg_503_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_503_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_503_1:RecordName(arg_503_1.leftNameTxt_.text)
				SetActive(arg_503_1.iconTrs_.gameObject, false)
				arg_503_1.callingController_:SetSelectedState("normal")

				local var_506_3 = arg_503_1:GetWordFromCfg(115261124)
				local var_506_4 = arg_503_1:FormatText(var_506_3.content)

				arg_503_1.text_.text = var_506_4

				LuaForUtil.ClearLinePrefixSymbol(arg_503_1.text_)

				local var_506_5 = 38
				local var_506_6 = utf8.len(var_506_4)
				local var_506_7 = var_506_5 <= 0 and var_506_1 or var_506_1 * (var_506_6 / var_506_5)

				if var_506_7 > 0 and var_506_1 < var_506_7 then
					arg_503_1.talkMaxDuration = var_506_7

					if var_506_7 + var_506_0 > arg_503_1.duration_ then
						arg_503_1.duration_ = var_506_7 + var_506_0
					end
				end

				arg_503_1.text_.text = var_506_4
				arg_503_1.typewritter.percent = 0

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261124", "story_v_out_115261.awb") ~= 0 then
					local var_506_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261124", "story_v_out_115261.awb") / 1000

					if var_506_8 + var_506_0 > arg_503_1.duration_ then
						arg_503_1.duration_ = var_506_8 + var_506_0
					end

					if var_506_3.prefab_name ~= "" and arg_503_1.actors_[var_506_3.prefab_name] ~= nil then
						local var_506_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_503_1.actors_[var_506_3.prefab_name].transform, "story_v_out_115261", "115261124", "story_v_out_115261.awb")

						arg_503_1:RecordAudio("115261124", var_506_9)
						arg_503_1:RecordAudio("115261124", var_506_9)
					else
						arg_503_1:AudioAction("play", "voice", "story_v_out_115261", "115261124", "story_v_out_115261.awb")
					end

					arg_503_1:RecordHistoryTalkVoice("story_v_out_115261", "115261124", "story_v_out_115261.awb")
				end

				arg_503_1:RecordContent(arg_503_1.text_.text)
			end

			local var_506_10 = math.max(var_506_1, arg_503_1.talkMaxDuration)

			if var_506_0 <= arg_503_1.time_ and arg_503_1.time_ < var_506_0 + var_506_10 then
				arg_503_1.typewritter.percent = (arg_503_1.time_ - var_506_0) / var_506_10

				arg_503_1.typewritter:SetDirty()
			end

			if arg_503_1.time_ >= var_506_0 + var_506_10 and arg_503_1.time_ < var_506_0 + var_506_10 + arg_506_0 then
				arg_503_1.typewritter.percent = 1

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(true)
			end
		end
	end,
	Play115261125 = function(arg_507_0, arg_507_1)
		arg_507_1.time_ = 0
		arg_507_1.frameCnt_ = 0
		arg_507_1.state_ = "playing"
		arg_507_1.curTalkId_ = 115261125
		arg_507_1.duration_ = 4.766

		local var_507_0 = {
			ja = 1.9,
			ko = 3.8,
			zh = 4.3,
			en = 4.766
		}
		local var_507_1 = manager.audio:GetLocalizationFlag()

		if var_507_0[var_507_1] ~= nil then
			arg_507_1.duration_ = var_507_0[var_507_1]
		end

		SetActive(arg_507_1.tipsGo_, false)

		function arg_507_1.onSingleLineFinish_()
			arg_507_1.onSingleLineUpdate_ = nil
			arg_507_1.onSingleLineFinish_ = nil
			arg_507_1.state_ = "waiting"
		end

		function arg_507_1.playNext_(arg_509_0)
			if arg_509_0 == 1 then
				arg_507_0:Play115261126(arg_507_1)
			end
		end

		function arg_507_1.onSingleLineUpdate_(arg_510_0)
			local var_510_0 = arg_507_1.actors_["10030"].transform
			local var_510_1 = 0

			if var_510_1 < arg_507_1.time_ and arg_507_1.time_ <= var_510_1 + arg_510_0 then
				arg_507_1.var_.moveOldPos10030 = var_510_0.localPosition
				var_510_0.localScale = Vector3.New(1, 1, 1)

				arg_507_1:CheckSpriteTmpPos("10030", 4)

				local var_510_2 = var_510_0.childCount

				for iter_510_0 = 0, var_510_2 - 1 do
					local var_510_3 = var_510_0:GetChild(iter_510_0)

					if var_510_3.name == "split_3" or not string.find(var_510_3.name, "split") then
						var_510_3.gameObject:SetActive(true)
					else
						var_510_3.gameObject:SetActive(false)
					end
				end
			end

			local var_510_4 = 0.001

			if var_510_1 <= arg_507_1.time_ and arg_507_1.time_ < var_510_1 + var_510_4 then
				local var_510_5 = (arg_507_1.time_ - var_510_1) / var_510_4
				local var_510_6 = Vector3.New(390, -390, 150)

				var_510_0.localPosition = Vector3.Lerp(arg_507_1.var_.moveOldPos10030, var_510_6, var_510_5)
			end

			if arg_507_1.time_ >= var_510_1 + var_510_4 and arg_507_1.time_ < var_510_1 + var_510_4 + arg_510_0 then
				var_510_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_510_7 = arg_507_1.actors_["10029"]
			local var_510_8 = 0

			if var_510_8 < arg_507_1.time_ and arg_507_1.time_ <= var_510_8 + arg_510_0 then
				local var_510_9 = var_510_7:GetComponent("Image")

				if var_510_9 then
					arg_507_1.var_.highlightMatValue10029 = var_510_9
				end
			end

			local var_510_10 = 0.2

			if var_510_8 <= arg_507_1.time_ and arg_507_1.time_ < var_510_8 + var_510_10 then
				local var_510_11 = (arg_507_1.time_ - var_510_8) / var_510_10

				if arg_507_1.var_.highlightMatValue10029 then
					local var_510_12 = Mathf.Lerp(1, 0.5, var_510_11)
					local var_510_13 = arg_507_1.var_.highlightMatValue10029
					local var_510_14 = var_510_13.color

					var_510_14.r = var_510_12
					var_510_14.g = var_510_12
					var_510_14.b = var_510_12
					var_510_13.color = var_510_14
				end
			end

			if arg_507_1.time_ >= var_510_8 + var_510_10 and arg_507_1.time_ < var_510_8 + var_510_10 + arg_510_0 and arg_507_1.var_.highlightMatValue10029 then
				local var_510_15 = 0.5
				local var_510_16 = arg_507_1.var_.highlightMatValue10029
				local var_510_17 = var_510_16.color

				var_510_17.r = var_510_15
				var_510_17.g = var_510_15
				var_510_17.b = var_510_15
				var_510_16.color = var_510_17
			end

			local var_510_18 = arg_507_1.actors_["10030"]
			local var_510_19 = 0

			if var_510_19 < arg_507_1.time_ and arg_507_1.time_ <= var_510_19 + arg_510_0 then
				local var_510_20 = var_510_18:GetComponentInChildren(typeof(CanvasGroup))

				if var_510_20 then
					arg_507_1.var_.alphaOldValue10030 = var_510_20.alpha
					arg_507_1.var_.characterEffect10030 = var_510_20
				end

				arg_507_1.var_.alphaOldValue10030 = 0
			end

			local var_510_21 = 0.0166666666666667

			if var_510_19 <= arg_507_1.time_ and arg_507_1.time_ < var_510_19 + var_510_21 then
				local var_510_22 = (arg_507_1.time_ - var_510_19) / var_510_21
				local var_510_23 = Mathf.Lerp(arg_507_1.var_.alphaOldValue10030, 1, var_510_22)

				if arg_507_1.var_.characterEffect10030 then
					arg_507_1.var_.characterEffect10030.alpha = var_510_23
				end
			end

			if arg_507_1.time_ >= var_510_19 + var_510_21 and arg_507_1.time_ < var_510_19 + var_510_21 + arg_510_0 and arg_507_1.var_.characterEffect10030 then
				arg_507_1.var_.characterEffect10030.alpha = 1
			end

			local var_510_24 = 0
			local var_510_25 = 0.25

			if var_510_24 < arg_507_1.time_ and arg_507_1.time_ <= var_510_24 + arg_510_0 then
				arg_507_1.talkMaxDuration = 0
				arg_507_1.dialogCg_.alpha = 1

				arg_507_1.dialog_:SetActive(true)
				SetActive(arg_507_1.leftNameGo_, true)

				local var_510_26 = arg_507_1:FormatText(StoryNameCfg[309].name)

				arg_507_1.leftNameTxt_.text = var_510_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_507_1.leftNameTxt_.transform)

				arg_507_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_507_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_507_1:RecordName(arg_507_1.leftNameTxt_.text)
				SetActive(arg_507_1.iconTrs_.gameObject, false)
				arg_507_1.callingController_:SetSelectedState("normal")

				local var_510_27 = arg_507_1:GetWordFromCfg(115261125)
				local var_510_28 = arg_507_1:FormatText(var_510_27.content)

				arg_507_1.text_.text = var_510_28

				LuaForUtil.ClearLinePrefixSymbol(arg_507_1.text_)

				local var_510_29 = 10
				local var_510_30 = utf8.len(var_510_28)
				local var_510_31 = var_510_29 <= 0 and var_510_25 or var_510_25 * (var_510_30 / var_510_29)

				if var_510_31 > 0 and var_510_25 < var_510_31 then
					arg_507_1.talkMaxDuration = var_510_31

					if var_510_31 + var_510_24 > arg_507_1.duration_ then
						arg_507_1.duration_ = var_510_31 + var_510_24
					end
				end

				arg_507_1.text_.text = var_510_28
				arg_507_1.typewritter.percent = 0

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261125", "story_v_out_115261.awb") ~= 0 then
					local var_510_32 = manager.audio:GetVoiceLength("story_v_out_115261", "115261125", "story_v_out_115261.awb") / 1000

					if var_510_32 + var_510_24 > arg_507_1.duration_ then
						arg_507_1.duration_ = var_510_32 + var_510_24
					end

					if var_510_27.prefab_name ~= "" and arg_507_1.actors_[var_510_27.prefab_name] ~= nil then
						local var_510_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_507_1.actors_[var_510_27.prefab_name].transform, "story_v_out_115261", "115261125", "story_v_out_115261.awb")

						arg_507_1:RecordAudio("115261125", var_510_33)
						arg_507_1:RecordAudio("115261125", var_510_33)
					else
						arg_507_1:AudioAction("play", "voice", "story_v_out_115261", "115261125", "story_v_out_115261.awb")
					end

					arg_507_1:RecordHistoryTalkVoice("story_v_out_115261", "115261125", "story_v_out_115261.awb")
				end

				arg_507_1:RecordContent(arg_507_1.text_.text)
			end

			local var_510_34 = math.max(var_510_25, arg_507_1.talkMaxDuration)

			if var_510_24 <= arg_507_1.time_ and arg_507_1.time_ < var_510_24 + var_510_34 then
				arg_507_1.typewritter.percent = (arg_507_1.time_ - var_510_24) / var_510_34

				arg_507_1.typewritter:SetDirty()
			end

			if arg_507_1.time_ >= var_510_24 + var_510_34 and arg_507_1.time_ < var_510_24 + var_510_34 + arg_510_0 then
				arg_507_1.typewritter.percent = 1

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(true)
			end
		end
	end,
	Play115261126 = function(arg_511_0, arg_511_1)
		arg_511_1.time_ = 0
		arg_511_1.frameCnt_ = 0
		arg_511_1.state_ = "playing"
		arg_511_1.curTalkId_ = 115261126
		arg_511_1.duration_ = 5

		SetActive(arg_511_1.tipsGo_, false)

		function arg_511_1.onSingleLineFinish_()
			arg_511_1.onSingleLineUpdate_ = nil
			arg_511_1.onSingleLineFinish_ = nil
			arg_511_1.state_ = "waiting"
		end

		function arg_511_1.playNext_(arg_513_0)
			if arg_513_0 == 1 then
				arg_511_0:Play115261127(arg_511_1)
			end
		end

		function arg_511_1.onSingleLineUpdate_(arg_514_0)
			local var_514_0 = arg_511_1.actors_["10030"]
			local var_514_1 = 0

			if var_514_1 < arg_511_1.time_ and arg_511_1.time_ <= var_514_1 + arg_514_0 then
				local var_514_2 = var_514_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_514_2 then
					arg_511_1.var_.alphaOldValue10030 = var_514_2.alpha
					arg_511_1.var_.characterEffect10030 = var_514_2
				end

				arg_511_1.var_.alphaOldValue10030 = 1
			end

			local var_514_3 = 0.333333333333333

			if var_514_1 <= arg_511_1.time_ and arg_511_1.time_ < var_514_1 + var_514_3 then
				local var_514_4 = (arg_511_1.time_ - var_514_1) / var_514_3
				local var_514_5 = Mathf.Lerp(arg_511_1.var_.alphaOldValue10030, 0, var_514_4)

				if arg_511_1.var_.characterEffect10030 then
					arg_511_1.var_.characterEffect10030.alpha = var_514_5
				end
			end

			if arg_511_1.time_ >= var_514_1 + var_514_3 and arg_511_1.time_ < var_514_1 + var_514_3 + arg_514_0 and arg_511_1.var_.characterEffect10030 then
				arg_511_1.var_.characterEffect10030.alpha = 0
			end

			local var_514_6 = arg_511_1.actors_["10029"]
			local var_514_7 = 0

			if var_514_7 < arg_511_1.time_ and arg_511_1.time_ <= var_514_7 + arg_514_0 then
				local var_514_8 = var_514_6:GetComponent("Image")

				if var_514_8 then
					arg_511_1.var_.alphaMatValue10029 = var_514_8
					arg_511_1.var_.alphaOldValue10029 = var_514_8.color.a
				end

				arg_511_1.var_.alphaOldValue10029 = 1
			end

			local var_514_9 = 0.333333333333333

			if var_514_7 <= arg_511_1.time_ and arg_511_1.time_ < var_514_7 + var_514_9 then
				local var_514_10 = (arg_511_1.time_ - var_514_7) / var_514_9
				local var_514_11 = Mathf.Lerp(arg_511_1.var_.alphaOldValue10029, 0, var_514_10)

				if arg_511_1.var_.alphaMatValue10029 then
					local var_514_12 = arg_511_1.var_.alphaMatValue10029.color

					var_514_12.a = var_514_11
					arg_511_1.var_.alphaMatValue10029.color = var_514_12
				end
			end

			if arg_511_1.time_ >= var_514_7 + var_514_9 and arg_511_1.time_ < var_514_7 + var_514_9 + arg_514_0 and arg_511_1.var_.alphaMatValue10029 then
				local var_514_13 = arg_511_1.var_.alphaMatValue10029
				local var_514_14 = var_514_13.color

				var_514_14.a = 0
				var_514_13.color = var_514_14
			end

			local var_514_15 = 0
			local var_514_16 = 1.325

			if var_514_15 < arg_511_1.time_ and arg_511_1.time_ <= var_514_15 + arg_514_0 then
				arg_511_1.talkMaxDuration = 0
				arg_511_1.dialogCg_.alpha = 1

				arg_511_1.dialog_:SetActive(true)
				SetActive(arg_511_1.leftNameGo_, false)

				arg_511_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_511_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_511_1:RecordName(arg_511_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_511_1.iconTrs_.gameObject, false)
				arg_511_1.callingController_:SetSelectedState("normal")

				local var_514_17 = arg_511_1:GetWordFromCfg(115261126)
				local var_514_18 = arg_511_1:FormatText(var_514_17.content)

				arg_511_1.text_.text = var_514_18

				LuaForUtil.ClearLinePrefixSymbol(arg_511_1.text_)

				local var_514_19 = 53
				local var_514_20 = utf8.len(var_514_18)
				local var_514_21 = var_514_19 <= 0 and var_514_16 or var_514_16 * (var_514_20 / var_514_19)

				if var_514_21 > 0 and var_514_16 < var_514_21 then
					arg_511_1.talkMaxDuration = var_514_21

					if var_514_21 + var_514_15 > arg_511_1.duration_ then
						arg_511_1.duration_ = var_514_21 + var_514_15
					end
				end

				arg_511_1.text_.text = var_514_18
				arg_511_1.typewritter.percent = 0

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(false)
				arg_511_1:RecordContent(arg_511_1.text_.text)
			end

			local var_514_22 = math.max(var_514_16, arg_511_1.talkMaxDuration)

			if var_514_15 <= arg_511_1.time_ and arg_511_1.time_ < var_514_15 + var_514_22 then
				arg_511_1.typewritter.percent = (arg_511_1.time_ - var_514_15) / var_514_22

				arg_511_1.typewritter:SetDirty()
			end

			if arg_511_1.time_ >= var_514_15 + var_514_22 and arg_511_1.time_ < var_514_15 + var_514_22 + arg_514_0 then
				arg_511_1.typewritter.percent = 1

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(true)
			end
		end
	end,
	Play115261127 = function(arg_515_0, arg_515_1)
		arg_515_1.time_ = 0
		arg_515_1.frameCnt_ = 0
		arg_515_1.state_ = "playing"
		arg_515_1.curTalkId_ = 115261127
		arg_515_1.duration_ = 6.533

		local var_515_0 = {
			ja = 5.533,
			ko = 4.9,
			zh = 3.4,
			en = 6.533
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
				arg_515_0:Play115261128(arg_515_1)
			end
		end

		function arg_515_1.onSingleLineUpdate_(arg_518_0)
			local var_518_0 = arg_515_1.actors_["10029"].transform
			local var_518_1 = 0

			if var_518_1 < arg_515_1.time_ and arg_515_1.time_ <= var_518_1 + arg_518_0 then
				arg_515_1.var_.moveOldPos10029 = var_518_0.localPosition
				var_518_0.localScale = Vector3.New(1, 1, 1)

				arg_515_1:CheckSpriteTmpPos("10029", 2)
			end

			local var_518_2 = 0.001

			if var_518_1 <= arg_515_1.time_ and arg_515_1.time_ < var_518_1 + var_518_2 then
				local var_518_3 = (arg_515_1.time_ - var_518_1) / var_518_2
				local var_518_4 = Vector3.New(-390, -350, -180)

				var_518_0.localPosition = Vector3.Lerp(arg_515_1.var_.moveOldPos10029, var_518_4, var_518_3)
			end

			if arg_515_1.time_ >= var_518_1 + var_518_2 and arg_515_1.time_ < var_518_1 + var_518_2 + arg_518_0 then
				var_518_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_518_5 = arg_515_1.actors_["10029"]
			local var_518_6 = 0

			if var_518_6 < arg_515_1.time_ and arg_515_1.time_ <= var_518_6 + arg_518_0 then
				local var_518_7 = var_518_5:GetComponent("Image")

				if var_518_7 then
					arg_515_1.var_.highlightMatValue10029 = var_518_7
				end
			end

			local var_518_8 = 0.2

			if var_518_6 <= arg_515_1.time_ and arg_515_1.time_ < var_518_6 + var_518_8 then
				local var_518_9 = (arg_515_1.time_ - var_518_6) / var_518_8

				if arg_515_1.var_.highlightMatValue10029 then
					local var_518_10 = Mathf.Lerp(0.5, 1, var_518_9)
					local var_518_11 = arg_515_1.var_.highlightMatValue10029
					local var_518_12 = var_518_11.color

					var_518_12.r = var_518_10
					var_518_12.g = var_518_10
					var_518_12.b = var_518_10
					var_518_11.color = var_518_12
				end
			end

			if arg_515_1.time_ >= var_518_6 + var_518_8 and arg_515_1.time_ < var_518_6 + var_518_8 + arg_518_0 and arg_515_1.var_.highlightMatValue10029 then
				local var_518_13 = 1

				var_518_5.transform:SetSiblingIndex(1)

				local var_518_14 = arg_515_1.var_.highlightMatValue10029
				local var_518_15 = var_518_14.color

				var_518_15.r = var_518_13
				var_518_15.g = var_518_13
				var_518_15.b = var_518_13
				var_518_14.color = var_518_15
			end

			local var_518_16 = arg_515_1.actors_["10030"].transform
			local var_518_17 = 0

			if var_518_17 < arg_515_1.time_ and arg_515_1.time_ <= var_518_17 + arg_518_0 then
				arg_515_1.var_.moveOldPos10030 = var_518_16.localPosition
				var_518_16.localScale = Vector3.New(1, 1, 1)

				arg_515_1:CheckSpriteTmpPos("10030", 4)

				local var_518_18 = var_518_16.childCount

				for iter_518_0 = 0, var_518_18 - 1 do
					local var_518_19 = var_518_16:GetChild(iter_518_0)

					if var_518_19.name == "split_3" or not string.find(var_518_19.name, "split") then
						var_518_19.gameObject:SetActive(true)
					else
						var_518_19.gameObject:SetActive(false)
					end
				end
			end

			local var_518_20 = 0.001

			if var_518_17 <= arg_515_1.time_ and arg_515_1.time_ < var_518_17 + var_518_20 then
				local var_518_21 = (arg_515_1.time_ - var_518_17) / var_518_20
				local var_518_22 = Vector3.New(390, -390, 150)

				var_518_16.localPosition = Vector3.Lerp(arg_515_1.var_.moveOldPos10030, var_518_22, var_518_21)
			end

			if arg_515_1.time_ >= var_518_17 + var_518_20 and arg_515_1.time_ < var_518_17 + var_518_20 + arg_518_0 then
				var_518_16.localPosition = Vector3.New(390, -390, 150)
			end

			local var_518_23 = arg_515_1.actors_["10030"]
			local var_518_24 = 0

			if var_518_24 < arg_515_1.time_ and arg_515_1.time_ <= var_518_24 + arg_518_0 and arg_515_1.var_.actorSpriteComps10030 == nil then
				arg_515_1.var_.actorSpriteComps10030 = var_518_23:GetComponentsInChildren(typeof(Image), true)
			end

			local var_518_25 = 0.2

			if var_518_24 <= arg_515_1.time_ and arg_515_1.time_ < var_518_24 + var_518_25 then
				local var_518_26 = (arg_515_1.time_ - var_518_24) / var_518_25

				if arg_515_1.var_.actorSpriteComps10030 then
					for iter_518_1, iter_518_2 in pairs(arg_515_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_518_2 then
							local var_518_27 = Mathf.Lerp(iter_518_2.color.r, 0.5, var_518_26)

							iter_518_2.color = Color.New(var_518_27, var_518_27, var_518_27)
						end
					end
				end
			end

			if arg_515_1.time_ >= var_518_24 + var_518_25 and arg_515_1.time_ < var_518_24 + var_518_25 + arg_518_0 and arg_515_1.var_.actorSpriteComps10030 then
				local var_518_28 = 0.5

				for iter_518_3, iter_518_4 in pairs(arg_515_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_518_4 then
						iter_518_4.color = Color.New(var_518_28, var_518_28, var_518_28)
					end
				end

				arg_515_1.var_.actorSpriteComps10030 = nil
			end

			local var_518_29 = arg_515_1.actors_["10030"]
			local var_518_30 = 0

			if var_518_30 < arg_515_1.time_ and arg_515_1.time_ <= var_518_30 + arg_518_0 then
				local var_518_31 = var_518_29:GetComponentInChildren(typeof(CanvasGroup))

				if var_518_31 then
					arg_515_1.var_.alphaOldValue10030 = var_518_31.alpha
					arg_515_1.var_.characterEffect10030 = var_518_31
				end

				arg_515_1.var_.alphaOldValue10030 = 0
			end

			local var_518_32 = 0.333333333333333

			if var_518_30 <= arg_515_1.time_ and arg_515_1.time_ < var_518_30 + var_518_32 then
				local var_518_33 = (arg_515_1.time_ - var_518_30) / var_518_32
				local var_518_34 = Mathf.Lerp(arg_515_1.var_.alphaOldValue10030, 1, var_518_33)

				if arg_515_1.var_.characterEffect10030 then
					arg_515_1.var_.characterEffect10030.alpha = var_518_34
				end
			end

			if arg_515_1.time_ >= var_518_30 + var_518_32 and arg_515_1.time_ < var_518_30 + var_518_32 + arg_518_0 and arg_515_1.var_.characterEffect10030 then
				arg_515_1.var_.characterEffect10030.alpha = 1
			end

			local var_518_35 = arg_515_1.actors_["10029"]
			local var_518_36 = 0

			if var_518_36 < arg_515_1.time_ and arg_515_1.time_ <= var_518_36 + arg_518_0 then
				local var_518_37 = var_518_35:GetComponent("Image")

				if var_518_37 then
					arg_515_1.var_.alphaMatValue10029 = var_518_37
					arg_515_1.var_.alphaOldValue10029 = var_518_37.color.a
				end

				arg_515_1.var_.alphaOldValue10029 = 0
			end

			local var_518_38 = 0.333333333333333

			if var_518_36 <= arg_515_1.time_ and arg_515_1.time_ < var_518_36 + var_518_38 then
				local var_518_39 = (arg_515_1.time_ - var_518_36) / var_518_38
				local var_518_40 = Mathf.Lerp(arg_515_1.var_.alphaOldValue10029, 1, var_518_39)

				if arg_515_1.var_.alphaMatValue10029 then
					local var_518_41 = arg_515_1.var_.alphaMatValue10029.color

					var_518_41.a = var_518_40
					arg_515_1.var_.alphaMatValue10029.color = var_518_41
				end
			end

			if arg_515_1.time_ >= var_518_36 + var_518_38 and arg_515_1.time_ < var_518_36 + var_518_38 + arg_518_0 and arg_515_1.var_.alphaMatValue10029 then
				local var_518_42 = arg_515_1.var_.alphaMatValue10029
				local var_518_43 = var_518_42.color

				var_518_43.a = 1
				var_518_42.color = var_518_43
			end

			local var_518_44 = 0
			local var_518_45 = 0.325

			if var_518_44 < arg_515_1.time_ and arg_515_1.time_ <= var_518_44 + arg_518_0 then
				arg_515_1.talkMaxDuration = 0
				arg_515_1.dialogCg_.alpha = 1

				arg_515_1.dialog_:SetActive(true)
				SetActive(arg_515_1.leftNameGo_, true)

				local var_518_46 = arg_515_1:FormatText(StoryNameCfg[312].name)

				arg_515_1.leftNameTxt_.text = var_518_46

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_515_1.leftNameTxt_.transform)

				arg_515_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_515_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_515_1:RecordName(arg_515_1.leftNameTxt_.text)
				SetActive(arg_515_1.iconTrs_.gameObject, false)
				arg_515_1.callingController_:SetSelectedState("normal")

				local var_518_47 = arg_515_1:GetWordFromCfg(115261127)
				local var_518_48 = arg_515_1:FormatText(var_518_47.content)

				arg_515_1.text_.text = var_518_48

				LuaForUtil.ClearLinePrefixSymbol(arg_515_1.text_)

				local var_518_49 = 13
				local var_518_50 = utf8.len(var_518_48)
				local var_518_51 = var_518_49 <= 0 and var_518_45 or var_518_45 * (var_518_50 / var_518_49)

				if var_518_51 > 0 and var_518_45 < var_518_51 then
					arg_515_1.talkMaxDuration = var_518_51

					if var_518_51 + var_518_44 > arg_515_1.duration_ then
						arg_515_1.duration_ = var_518_51 + var_518_44
					end
				end

				arg_515_1.text_.text = var_518_48
				arg_515_1.typewritter.percent = 0

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261127", "story_v_out_115261.awb") ~= 0 then
					local var_518_52 = manager.audio:GetVoiceLength("story_v_out_115261", "115261127", "story_v_out_115261.awb") / 1000

					if var_518_52 + var_518_44 > arg_515_1.duration_ then
						arg_515_1.duration_ = var_518_52 + var_518_44
					end

					if var_518_47.prefab_name ~= "" and arg_515_1.actors_[var_518_47.prefab_name] ~= nil then
						local var_518_53 = LuaForUtil.PlayVoiceWithCriLipsync(arg_515_1.actors_[var_518_47.prefab_name].transform, "story_v_out_115261", "115261127", "story_v_out_115261.awb")

						arg_515_1:RecordAudio("115261127", var_518_53)
						arg_515_1:RecordAudio("115261127", var_518_53)
					else
						arg_515_1:AudioAction("play", "voice", "story_v_out_115261", "115261127", "story_v_out_115261.awb")
					end

					arg_515_1:RecordHistoryTalkVoice("story_v_out_115261", "115261127", "story_v_out_115261.awb")
				end

				arg_515_1:RecordContent(arg_515_1.text_.text)
			end

			local var_518_54 = math.max(var_518_45, arg_515_1.talkMaxDuration)

			if var_518_44 <= arg_515_1.time_ and arg_515_1.time_ < var_518_44 + var_518_54 then
				arg_515_1.typewritter.percent = (arg_515_1.time_ - var_518_44) / var_518_54

				arg_515_1.typewritter:SetDirty()
			end

			if arg_515_1.time_ >= var_518_44 + var_518_54 and arg_515_1.time_ < var_518_44 + var_518_54 + arg_518_0 then
				arg_515_1.typewritter.percent = 1

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(true)
			end
		end
	end,
	Play115261128 = function(arg_519_0, arg_519_1)
		arg_519_1.time_ = 0
		arg_519_1.frameCnt_ = 0
		arg_519_1.state_ = "playing"
		arg_519_1.curTalkId_ = 115261128
		arg_519_1.duration_ = 11.2

		local var_519_0 = {
			ja = 9.833,
			ko = 9.133,
			zh = 9.6,
			en = 11.2
		}
		local var_519_1 = manager.audio:GetLocalizationFlag()

		if var_519_0[var_519_1] ~= nil then
			arg_519_1.duration_ = var_519_0[var_519_1]
		end

		SetActive(arg_519_1.tipsGo_, false)

		function arg_519_1.onSingleLineFinish_()
			arg_519_1.onSingleLineUpdate_ = nil
			arg_519_1.onSingleLineFinish_ = nil
			arg_519_1.state_ = "waiting"
		end

		function arg_519_1.playNext_(arg_521_0)
			if arg_521_0 == 1 then
				arg_519_0:Play115261129(arg_519_1)
			end
		end

		function arg_519_1.onSingleLineUpdate_(arg_522_0)
			local var_522_0 = 0
			local var_522_1 = 1

			if var_522_0 < arg_519_1.time_ and arg_519_1.time_ <= var_522_0 + arg_522_0 then
				arg_519_1.talkMaxDuration = 0
				arg_519_1.dialogCg_.alpha = 1

				arg_519_1.dialog_:SetActive(true)
				SetActive(arg_519_1.leftNameGo_, true)

				local var_522_2 = arg_519_1:FormatText(StoryNameCfg[312].name)

				arg_519_1.leftNameTxt_.text = var_522_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_519_1.leftNameTxt_.transform)

				arg_519_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_519_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_519_1:RecordName(arg_519_1.leftNameTxt_.text)
				SetActive(arg_519_1.iconTrs_.gameObject, false)
				arg_519_1.callingController_:SetSelectedState("normal")

				local var_522_3 = arg_519_1:GetWordFromCfg(115261128)
				local var_522_4 = arg_519_1:FormatText(var_522_3.content)

				arg_519_1.text_.text = var_522_4

				LuaForUtil.ClearLinePrefixSymbol(arg_519_1.text_)

				local var_522_5 = 40
				local var_522_6 = utf8.len(var_522_4)
				local var_522_7 = var_522_5 <= 0 and var_522_1 or var_522_1 * (var_522_6 / var_522_5)

				if var_522_7 > 0 and var_522_1 < var_522_7 then
					arg_519_1.talkMaxDuration = var_522_7

					if var_522_7 + var_522_0 > arg_519_1.duration_ then
						arg_519_1.duration_ = var_522_7 + var_522_0
					end
				end

				arg_519_1.text_.text = var_522_4
				arg_519_1.typewritter.percent = 0

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261128", "story_v_out_115261.awb") ~= 0 then
					local var_522_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261128", "story_v_out_115261.awb") / 1000

					if var_522_8 + var_522_0 > arg_519_1.duration_ then
						arg_519_1.duration_ = var_522_8 + var_522_0
					end

					if var_522_3.prefab_name ~= "" and arg_519_1.actors_[var_522_3.prefab_name] ~= nil then
						local var_522_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_519_1.actors_[var_522_3.prefab_name].transform, "story_v_out_115261", "115261128", "story_v_out_115261.awb")

						arg_519_1:RecordAudio("115261128", var_522_9)
						arg_519_1:RecordAudio("115261128", var_522_9)
					else
						arg_519_1:AudioAction("play", "voice", "story_v_out_115261", "115261128", "story_v_out_115261.awb")
					end

					arg_519_1:RecordHistoryTalkVoice("story_v_out_115261", "115261128", "story_v_out_115261.awb")
				end

				arg_519_1:RecordContent(arg_519_1.text_.text)
			end

			local var_522_10 = math.max(var_522_1, arg_519_1.talkMaxDuration)

			if var_522_0 <= arg_519_1.time_ and arg_519_1.time_ < var_522_0 + var_522_10 then
				arg_519_1.typewritter.percent = (arg_519_1.time_ - var_522_0) / var_522_10

				arg_519_1.typewritter:SetDirty()
			end

			if arg_519_1.time_ >= var_522_0 + var_522_10 and arg_519_1.time_ < var_522_0 + var_522_10 + arg_522_0 then
				arg_519_1.typewritter.percent = 1

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(true)
			end
		end
	end,
	Play115261129 = function(arg_523_0, arg_523_1)
		arg_523_1.time_ = 0
		arg_523_1.frameCnt_ = 0
		arg_523_1.state_ = "playing"
		arg_523_1.curTalkId_ = 115261129
		arg_523_1.duration_ = 3.366

		local var_523_0 = {
			ja = 3.3,
			ko = 3.033,
			zh = 3.366,
			en = 2
		}
		local var_523_1 = manager.audio:GetLocalizationFlag()

		if var_523_0[var_523_1] ~= nil then
			arg_523_1.duration_ = var_523_0[var_523_1]
		end

		SetActive(arg_523_1.tipsGo_, false)

		function arg_523_1.onSingleLineFinish_()
			arg_523_1.onSingleLineUpdate_ = nil
			arg_523_1.onSingleLineFinish_ = nil
			arg_523_1.state_ = "waiting"
		end

		function arg_523_1.playNext_(arg_525_0)
			if arg_525_0 == 1 then
				arg_523_0:Play115261130(arg_523_1)
			end
		end

		function arg_523_1.onSingleLineUpdate_(arg_526_0)
			local var_526_0 = arg_523_1.actors_["10030"]
			local var_526_1 = 0

			if var_526_1 < arg_523_1.time_ and arg_523_1.time_ <= var_526_1 + arg_526_0 and arg_523_1.var_.actorSpriteComps10030 == nil then
				arg_523_1.var_.actorSpriteComps10030 = var_526_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_526_2 = 0.2

			if var_526_1 <= arg_523_1.time_ and arg_523_1.time_ < var_526_1 + var_526_2 then
				local var_526_3 = (arg_523_1.time_ - var_526_1) / var_526_2

				if arg_523_1.var_.actorSpriteComps10030 then
					for iter_526_0, iter_526_1 in pairs(arg_523_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_526_1 then
							local var_526_4 = Mathf.Lerp(iter_526_1.color.r, 1, var_526_3)

							iter_526_1.color = Color.New(var_526_4, var_526_4, var_526_4)
						end
					end
				end
			end

			if arg_523_1.time_ >= var_526_1 + var_526_2 and arg_523_1.time_ < var_526_1 + var_526_2 + arg_526_0 and arg_523_1.var_.actorSpriteComps10030 then
				local var_526_5 = 1

				for iter_526_2, iter_526_3 in pairs(arg_523_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_526_3 then
						iter_526_3.color = Color.New(var_526_5, var_526_5, var_526_5)
					end
				end

				arg_523_1.var_.actorSpriteComps10030 = nil
			end

			local var_526_6 = arg_523_1.actors_["10029"]
			local var_526_7 = 0

			if var_526_7 < arg_523_1.time_ and arg_523_1.time_ <= var_526_7 + arg_526_0 then
				local var_526_8 = var_526_6:GetComponent("Image")

				if var_526_8 then
					arg_523_1.var_.highlightMatValue10029 = var_526_8
				end
			end

			local var_526_9 = 0.2

			if var_526_7 <= arg_523_1.time_ and arg_523_1.time_ < var_526_7 + var_526_9 then
				local var_526_10 = (arg_523_1.time_ - var_526_7) / var_526_9

				if arg_523_1.var_.highlightMatValue10029 then
					local var_526_11 = Mathf.Lerp(1, 0.5, var_526_10)
					local var_526_12 = arg_523_1.var_.highlightMatValue10029
					local var_526_13 = var_526_12.color

					var_526_13.r = var_526_11
					var_526_13.g = var_526_11
					var_526_13.b = var_526_11
					var_526_12.color = var_526_13
				end
			end

			if arg_523_1.time_ >= var_526_7 + var_526_9 and arg_523_1.time_ < var_526_7 + var_526_9 + arg_526_0 and arg_523_1.var_.highlightMatValue10029 then
				local var_526_14 = 0.5
				local var_526_15 = arg_523_1.var_.highlightMatValue10029
				local var_526_16 = var_526_15.color

				var_526_16.r = var_526_14
				var_526_16.g = var_526_14
				var_526_16.b = var_526_14
				var_526_15.color = var_526_16
			end

			local var_526_17 = arg_523_1.actors_["10030"].transform
			local var_526_18 = 0

			if var_526_18 < arg_523_1.time_ and arg_523_1.time_ <= var_526_18 + arg_526_0 then
				arg_523_1.var_.moveOldPos10030 = var_526_17.localPosition
				var_526_17.localScale = Vector3.New(1, 1, 1)

				arg_523_1:CheckSpriteTmpPos("10030", 4)

				local var_526_19 = var_526_17.childCount

				for iter_526_4 = 0, var_526_19 - 1 do
					local var_526_20 = var_526_17:GetChild(iter_526_4)

					if var_526_20.name == "split_1" or not string.find(var_526_20.name, "split") then
						var_526_20.gameObject:SetActive(true)
					else
						var_526_20.gameObject:SetActive(false)
					end
				end
			end

			local var_526_21 = 0.001

			if var_526_18 <= arg_523_1.time_ and arg_523_1.time_ < var_526_18 + var_526_21 then
				local var_526_22 = (arg_523_1.time_ - var_526_18) / var_526_21
				local var_526_23 = Vector3.New(390, -390, 150)

				var_526_17.localPosition = Vector3.Lerp(arg_523_1.var_.moveOldPos10030, var_526_23, var_526_22)
			end

			if arg_523_1.time_ >= var_526_18 + var_526_21 and arg_523_1.time_ < var_526_18 + var_526_21 + arg_526_0 then
				var_526_17.localPosition = Vector3.New(390, -390, 150)
			end

			local var_526_24 = 0
			local var_526_25 = 0.2

			if var_526_24 < arg_523_1.time_ and arg_523_1.time_ <= var_526_24 + arg_526_0 then
				arg_523_1.talkMaxDuration = 0
				arg_523_1.dialogCg_.alpha = 1

				arg_523_1.dialog_:SetActive(true)
				SetActive(arg_523_1.leftNameGo_, true)

				local var_526_26 = arg_523_1:FormatText(StoryNameCfg[309].name)

				arg_523_1.leftNameTxt_.text = var_526_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_523_1.leftNameTxt_.transform)

				arg_523_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_523_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_523_1:RecordName(arg_523_1.leftNameTxt_.text)
				SetActive(arg_523_1.iconTrs_.gameObject, false)
				arg_523_1.callingController_:SetSelectedState("normal")

				local var_526_27 = arg_523_1:GetWordFromCfg(115261129)
				local var_526_28 = arg_523_1:FormatText(var_526_27.content)

				arg_523_1.text_.text = var_526_28

				LuaForUtil.ClearLinePrefixSymbol(arg_523_1.text_)

				local var_526_29 = 8
				local var_526_30 = utf8.len(var_526_28)
				local var_526_31 = var_526_29 <= 0 and var_526_25 or var_526_25 * (var_526_30 / var_526_29)

				if var_526_31 > 0 and var_526_25 < var_526_31 then
					arg_523_1.talkMaxDuration = var_526_31

					if var_526_31 + var_526_24 > arg_523_1.duration_ then
						arg_523_1.duration_ = var_526_31 + var_526_24
					end
				end

				arg_523_1.text_.text = var_526_28
				arg_523_1.typewritter.percent = 0

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261129", "story_v_out_115261.awb") ~= 0 then
					local var_526_32 = manager.audio:GetVoiceLength("story_v_out_115261", "115261129", "story_v_out_115261.awb") / 1000

					if var_526_32 + var_526_24 > arg_523_1.duration_ then
						arg_523_1.duration_ = var_526_32 + var_526_24
					end

					if var_526_27.prefab_name ~= "" and arg_523_1.actors_[var_526_27.prefab_name] ~= nil then
						local var_526_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_523_1.actors_[var_526_27.prefab_name].transform, "story_v_out_115261", "115261129", "story_v_out_115261.awb")

						arg_523_1:RecordAudio("115261129", var_526_33)
						arg_523_1:RecordAudio("115261129", var_526_33)
					else
						arg_523_1:AudioAction("play", "voice", "story_v_out_115261", "115261129", "story_v_out_115261.awb")
					end

					arg_523_1:RecordHistoryTalkVoice("story_v_out_115261", "115261129", "story_v_out_115261.awb")
				end

				arg_523_1:RecordContent(arg_523_1.text_.text)
			end

			local var_526_34 = math.max(var_526_25, arg_523_1.talkMaxDuration)

			if var_526_24 <= arg_523_1.time_ and arg_523_1.time_ < var_526_24 + var_526_34 then
				arg_523_1.typewritter.percent = (arg_523_1.time_ - var_526_24) / var_526_34

				arg_523_1.typewritter:SetDirty()
			end

			if arg_523_1.time_ >= var_526_24 + var_526_34 and arg_523_1.time_ < var_526_24 + var_526_34 + arg_526_0 then
				arg_523_1.typewritter.percent = 1

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(true)
			end
		end
	end,
	Play115261130 = function(arg_527_0, arg_527_1)
		arg_527_1.time_ = 0
		arg_527_1.frameCnt_ = 0
		arg_527_1.state_ = "playing"
		arg_527_1.curTalkId_ = 115261130
		arg_527_1.duration_ = 12.966

		local var_527_0 = {
			ja = 12.966,
			ko = 12.733,
			zh = 10.766,
			en = 12.533
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
				arg_527_0:Play115261131(arg_527_1)
			end
		end

		function arg_527_1.onSingleLineUpdate_(arg_530_0)
			local var_530_0 = arg_527_1.actors_["10030"]
			local var_530_1 = 0

			if var_530_1 < arg_527_1.time_ and arg_527_1.time_ <= var_530_1 + arg_530_0 and arg_527_1.var_.actorSpriteComps10030 == nil then
				arg_527_1.var_.actorSpriteComps10030 = var_530_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_530_2 = 0.2

			if var_530_1 <= arg_527_1.time_ and arg_527_1.time_ < var_530_1 + var_530_2 then
				local var_530_3 = (arg_527_1.time_ - var_530_1) / var_530_2

				if arg_527_1.var_.actorSpriteComps10030 then
					for iter_530_0, iter_530_1 in pairs(arg_527_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_530_1 then
							local var_530_4 = Mathf.Lerp(iter_530_1.color.r, 0.5, var_530_3)

							iter_530_1.color = Color.New(var_530_4, var_530_4, var_530_4)
						end
					end
				end
			end

			if arg_527_1.time_ >= var_530_1 + var_530_2 and arg_527_1.time_ < var_530_1 + var_530_2 + arg_530_0 and arg_527_1.var_.actorSpriteComps10030 then
				local var_530_5 = 0.5

				for iter_530_2, iter_530_3 in pairs(arg_527_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_530_3 then
						iter_530_3.color = Color.New(var_530_5, var_530_5, var_530_5)
					end
				end

				arg_527_1.var_.actorSpriteComps10030 = nil
			end

			local var_530_6 = arg_527_1.actors_["10029"]
			local var_530_7 = 0

			if var_530_7 < arg_527_1.time_ and arg_527_1.time_ <= var_530_7 + arg_530_0 then
				local var_530_8 = var_530_6:GetComponent("Image")

				if var_530_8 then
					arg_527_1.var_.highlightMatValue10029 = var_530_8
				end
			end

			local var_530_9 = 0.2

			if var_530_7 <= arg_527_1.time_ and arg_527_1.time_ < var_530_7 + var_530_9 then
				local var_530_10 = (arg_527_1.time_ - var_530_7) / var_530_9

				if arg_527_1.var_.highlightMatValue10029 then
					local var_530_11 = Mathf.Lerp(0.5, 1, var_530_10)
					local var_530_12 = arg_527_1.var_.highlightMatValue10029
					local var_530_13 = var_530_12.color

					var_530_13.r = var_530_11
					var_530_13.g = var_530_11
					var_530_13.b = var_530_11
					var_530_12.color = var_530_13
				end
			end

			if arg_527_1.time_ >= var_530_7 + var_530_9 and arg_527_1.time_ < var_530_7 + var_530_9 + arg_530_0 and arg_527_1.var_.highlightMatValue10029 then
				local var_530_14 = 1

				var_530_6.transform:SetSiblingIndex(1)

				local var_530_15 = arg_527_1.var_.highlightMatValue10029
				local var_530_16 = var_530_15.color

				var_530_16.r = var_530_14
				var_530_16.g = var_530_14
				var_530_16.b = var_530_14
				var_530_15.color = var_530_16
			end

			local var_530_17 = 0
			local var_530_18 = 1.15

			if var_530_17 < arg_527_1.time_ and arg_527_1.time_ <= var_530_17 + arg_530_0 then
				arg_527_1.talkMaxDuration = 0
				arg_527_1.dialogCg_.alpha = 1

				arg_527_1.dialog_:SetActive(true)
				SetActive(arg_527_1.leftNameGo_, true)

				local var_530_19 = arg_527_1:FormatText(StoryNameCfg[312].name)

				arg_527_1.leftNameTxt_.text = var_530_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_527_1.leftNameTxt_.transform)

				arg_527_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_527_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_527_1:RecordName(arg_527_1.leftNameTxt_.text)
				SetActive(arg_527_1.iconTrs_.gameObject, false)
				arg_527_1.callingController_:SetSelectedState("normal")

				local var_530_20 = arg_527_1:GetWordFromCfg(115261130)
				local var_530_21 = arg_527_1:FormatText(var_530_20.content)

				arg_527_1.text_.text = var_530_21

				LuaForUtil.ClearLinePrefixSymbol(arg_527_1.text_)

				local var_530_22 = 46
				local var_530_23 = utf8.len(var_530_21)
				local var_530_24 = var_530_22 <= 0 and var_530_18 or var_530_18 * (var_530_23 / var_530_22)

				if var_530_24 > 0 and var_530_18 < var_530_24 then
					arg_527_1.talkMaxDuration = var_530_24

					if var_530_24 + var_530_17 > arg_527_1.duration_ then
						arg_527_1.duration_ = var_530_24 + var_530_17
					end
				end

				arg_527_1.text_.text = var_530_21
				arg_527_1.typewritter.percent = 0

				arg_527_1.typewritter:SetDirty()
				arg_527_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261130", "story_v_out_115261.awb") ~= 0 then
					local var_530_25 = manager.audio:GetVoiceLength("story_v_out_115261", "115261130", "story_v_out_115261.awb") / 1000

					if var_530_25 + var_530_17 > arg_527_1.duration_ then
						arg_527_1.duration_ = var_530_25 + var_530_17
					end

					if var_530_20.prefab_name ~= "" and arg_527_1.actors_[var_530_20.prefab_name] ~= nil then
						local var_530_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_527_1.actors_[var_530_20.prefab_name].transform, "story_v_out_115261", "115261130", "story_v_out_115261.awb")

						arg_527_1:RecordAudio("115261130", var_530_26)
						arg_527_1:RecordAudio("115261130", var_530_26)
					else
						arg_527_1:AudioAction("play", "voice", "story_v_out_115261", "115261130", "story_v_out_115261.awb")
					end

					arg_527_1:RecordHistoryTalkVoice("story_v_out_115261", "115261130", "story_v_out_115261.awb")
				end

				arg_527_1:RecordContent(arg_527_1.text_.text)
			end

			local var_530_27 = math.max(var_530_18, arg_527_1.talkMaxDuration)

			if var_530_17 <= arg_527_1.time_ and arg_527_1.time_ < var_530_17 + var_530_27 then
				arg_527_1.typewritter.percent = (arg_527_1.time_ - var_530_17) / var_530_27

				arg_527_1.typewritter:SetDirty()
			end

			if arg_527_1.time_ >= var_530_17 + var_530_27 and arg_527_1.time_ < var_530_17 + var_530_27 + arg_530_0 then
				arg_527_1.typewritter.percent = 1

				arg_527_1.typewritter:SetDirty()
				arg_527_1:ShowNextGo(true)
			end
		end
	end,
	Play115261131 = function(arg_531_0, arg_531_1)
		arg_531_1.time_ = 0
		arg_531_1.frameCnt_ = 0
		arg_531_1.state_ = "playing"
		arg_531_1.curTalkId_ = 115261131
		arg_531_1.duration_ = 3.5

		local var_531_0 = {
			ja = 3.5,
			ko = 2.966,
			zh = 2.366,
			en = 3.333
		}
		local var_531_1 = manager.audio:GetLocalizationFlag()

		if var_531_0[var_531_1] ~= nil then
			arg_531_1.duration_ = var_531_0[var_531_1]
		end

		SetActive(arg_531_1.tipsGo_, false)

		function arg_531_1.onSingleLineFinish_()
			arg_531_1.onSingleLineUpdate_ = nil
			arg_531_1.onSingleLineFinish_ = nil
			arg_531_1.state_ = "waiting"
		end

		function arg_531_1.playNext_(arg_533_0)
			if arg_533_0 == 1 then
				arg_531_0:Play115261132(arg_531_1)
			end
		end

		function arg_531_1.onSingleLineUpdate_(arg_534_0)
			local var_534_0 = arg_531_1.actors_["10030"]
			local var_534_1 = 0

			if var_534_1 < arg_531_1.time_ and arg_531_1.time_ <= var_534_1 + arg_534_0 and arg_531_1.var_.actorSpriteComps10030 == nil then
				arg_531_1.var_.actorSpriteComps10030 = var_534_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_534_2 = 0.2

			if var_534_1 <= arg_531_1.time_ and arg_531_1.time_ < var_534_1 + var_534_2 then
				local var_534_3 = (arg_531_1.time_ - var_534_1) / var_534_2

				if arg_531_1.var_.actorSpriteComps10030 then
					for iter_534_0, iter_534_1 in pairs(arg_531_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_534_1 then
							local var_534_4 = Mathf.Lerp(iter_534_1.color.r, 1, var_534_3)

							iter_534_1.color = Color.New(var_534_4, var_534_4, var_534_4)
						end
					end
				end
			end

			if arg_531_1.time_ >= var_534_1 + var_534_2 and arg_531_1.time_ < var_534_1 + var_534_2 + arg_534_0 and arg_531_1.var_.actorSpriteComps10030 then
				local var_534_5 = 1

				for iter_534_2, iter_534_3 in pairs(arg_531_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_534_3 then
						iter_534_3.color = Color.New(var_534_5, var_534_5, var_534_5)
					end
				end

				arg_531_1.var_.actorSpriteComps10030 = nil
			end

			local var_534_6 = arg_531_1.actors_["10029"]
			local var_534_7 = 0

			if var_534_7 < arg_531_1.time_ and arg_531_1.time_ <= var_534_7 + arg_534_0 then
				local var_534_8 = var_534_6:GetComponent("Image")

				if var_534_8 then
					arg_531_1.var_.highlightMatValue10029 = var_534_8
				end
			end

			local var_534_9 = 0.2

			if var_534_7 <= arg_531_1.time_ and arg_531_1.time_ < var_534_7 + var_534_9 then
				local var_534_10 = (arg_531_1.time_ - var_534_7) / var_534_9

				if arg_531_1.var_.highlightMatValue10029 then
					local var_534_11 = Mathf.Lerp(1, 0.5, var_534_10)
					local var_534_12 = arg_531_1.var_.highlightMatValue10029
					local var_534_13 = var_534_12.color

					var_534_13.r = var_534_11
					var_534_13.g = var_534_11
					var_534_13.b = var_534_11
					var_534_12.color = var_534_13
				end
			end

			if arg_531_1.time_ >= var_534_7 + var_534_9 and arg_531_1.time_ < var_534_7 + var_534_9 + arg_534_0 and arg_531_1.var_.highlightMatValue10029 then
				local var_534_14 = 0.5
				local var_534_15 = arg_531_1.var_.highlightMatValue10029
				local var_534_16 = var_534_15.color

				var_534_16.r = var_534_14
				var_534_16.g = var_534_14
				var_534_16.b = var_534_14
				var_534_15.color = var_534_16
			end

			local var_534_17 = arg_531_1.actors_["10030"].transform
			local var_534_18 = 0

			if var_534_18 < arg_531_1.time_ and arg_531_1.time_ <= var_534_18 + arg_534_0 then
				arg_531_1.var_.moveOldPos10030 = var_534_17.localPosition
				var_534_17.localScale = Vector3.New(1, 1, 1)

				arg_531_1:CheckSpriteTmpPos("10030", 4)

				local var_534_19 = var_534_17.childCount

				for iter_534_4 = 0, var_534_19 - 1 do
					local var_534_20 = var_534_17:GetChild(iter_534_4)

					if var_534_20.name == "split_3" or not string.find(var_534_20.name, "split") then
						var_534_20.gameObject:SetActive(true)
					else
						var_534_20.gameObject:SetActive(false)
					end
				end
			end

			local var_534_21 = 0.001

			if var_534_18 <= arg_531_1.time_ and arg_531_1.time_ < var_534_18 + var_534_21 then
				local var_534_22 = (arg_531_1.time_ - var_534_18) / var_534_21
				local var_534_23 = Vector3.New(390, -390, 150)

				var_534_17.localPosition = Vector3.Lerp(arg_531_1.var_.moveOldPos10030, var_534_23, var_534_22)
			end

			if arg_531_1.time_ >= var_534_18 + var_534_21 and arg_531_1.time_ < var_534_18 + var_534_21 + arg_534_0 then
				var_534_17.localPosition = Vector3.New(390, -390, 150)
			end

			local var_534_24 = arg_531_1.actors_["10030"]
			local var_534_25 = 0

			if var_534_25 < arg_531_1.time_ and arg_531_1.time_ <= var_534_25 + arg_534_0 then
				local var_534_26 = var_534_24:GetComponentInChildren(typeof(CanvasGroup))

				if var_534_26 then
					arg_531_1.var_.alphaOldValue10030 = var_534_26.alpha
					arg_531_1.var_.characterEffect10030 = var_534_26
				end

				arg_531_1.var_.alphaOldValue10030 = 0
			end

			local var_534_27 = 0.0166666666666667

			if var_534_25 <= arg_531_1.time_ and arg_531_1.time_ < var_534_25 + var_534_27 then
				local var_534_28 = (arg_531_1.time_ - var_534_25) / var_534_27
				local var_534_29 = Mathf.Lerp(arg_531_1.var_.alphaOldValue10030, 1, var_534_28)

				if arg_531_1.var_.characterEffect10030 then
					arg_531_1.var_.characterEffect10030.alpha = var_534_29
				end
			end

			if arg_531_1.time_ >= var_534_25 + var_534_27 and arg_531_1.time_ < var_534_25 + var_534_27 + arg_534_0 and arg_531_1.var_.characterEffect10030 then
				arg_531_1.var_.characterEffect10030.alpha = 1
			end

			local var_534_30 = 0
			local var_534_31 = 0.2

			if var_534_30 < arg_531_1.time_ and arg_531_1.time_ <= var_534_30 + arg_534_0 then
				arg_531_1.talkMaxDuration = 0
				arg_531_1.dialogCg_.alpha = 1

				arg_531_1.dialog_:SetActive(true)
				SetActive(arg_531_1.leftNameGo_, true)

				local var_534_32 = arg_531_1:FormatText(StoryNameCfg[309].name)

				arg_531_1.leftNameTxt_.text = var_534_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_531_1.leftNameTxt_.transform)

				arg_531_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_531_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_531_1:RecordName(arg_531_1.leftNameTxt_.text)
				SetActive(arg_531_1.iconTrs_.gameObject, false)
				arg_531_1.callingController_:SetSelectedState("normal")

				local var_534_33 = arg_531_1:GetWordFromCfg(115261131)
				local var_534_34 = arg_531_1:FormatText(var_534_33.content)

				arg_531_1.text_.text = var_534_34

				LuaForUtil.ClearLinePrefixSymbol(arg_531_1.text_)

				local var_534_35 = 8
				local var_534_36 = utf8.len(var_534_34)
				local var_534_37 = var_534_35 <= 0 and var_534_31 or var_534_31 * (var_534_36 / var_534_35)

				if var_534_37 > 0 and var_534_31 < var_534_37 then
					arg_531_1.talkMaxDuration = var_534_37

					if var_534_37 + var_534_30 > arg_531_1.duration_ then
						arg_531_1.duration_ = var_534_37 + var_534_30
					end
				end

				arg_531_1.text_.text = var_534_34
				arg_531_1.typewritter.percent = 0

				arg_531_1.typewritter:SetDirty()
				arg_531_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261131", "story_v_out_115261.awb") ~= 0 then
					local var_534_38 = manager.audio:GetVoiceLength("story_v_out_115261", "115261131", "story_v_out_115261.awb") / 1000

					if var_534_38 + var_534_30 > arg_531_1.duration_ then
						arg_531_1.duration_ = var_534_38 + var_534_30
					end

					if var_534_33.prefab_name ~= "" and arg_531_1.actors_[var_534_33.prefab_name] ~= nil then
						local var_534_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_531_1.actors_[var_534_33.prefab_name].transform, "story_v_out_115261", "115261131", "story_v_out_115261.awb")

						arg_531_1:RecordAudio("115261131", var_534_39)
						arg_531_1:RecordAudio("115261131", var_534_39)
					else
						arg_531_1:AudioAction("play", "voice", "story_v_out_115261", "115261131", "story_v_out_115261.awb")
					end

					arg_531_1:RecordHistoryTalkVoice("story_v_out_115261", "115261131", "story_v_out_115261.awb")
				end

				arg_531_1:RecordContent(arg_531_1.text_.text)
			end

			local var_534_40 = math.max(var_534_31, arg_531_1.talkMaxDuration)

			if var_534_30 <= arg_531_1.time_ and arg_531_1.time_ < var_534_30 + var_534_40 then
				arg_531_1.typewritter.percent = (arg_531_1.time_ - var_534_30) / var_534_40

				arg_531_1.typewritter:SetDirty()
			end

			if arg_531_1.time_ >= var_534_30 + var_534_40 and arg_531_1.time_ < var_534_30 + var_534_40 + arg_534_0 then
				arg_531_1.typewritter.percent = 1

				arg_531_1.typewritter:SetDirty()
				arg_531_1:ShowNextGo(true)
			end
		end
	end,
	Play115261132 = function(arg_535_0, arg_535_1)
		arg_535_1.time_ = 0
		arg_535_1.frameCnt_ = 0
		arg_535_1.state_ = "playing"
		arg_535_1.curTalkId_ = 115261132
		arg_535_1.duration_ = 7.666

		local var_535_0 = {
			ja = 6,
			ko = 6.7,
			zh = 7.1,
			en = 7.666
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
				arg_535_0:Play115261133(arg_535_1)
			end
		end

		function arg_535_1.onSingleLineUpdate_(arg_538_0)
			local var_538_0 = arg_535_1.actors_["10030"]
			local var_538_1 = 0

			if var_538_1 < arg_535_1.time_ and arg_535_1.time_ <= var_538_1 + arg_538_0 and arg_535_1.var_.actorSpriteComps10030 == nil then
				arg_535_1.var_.actorSpriteComps10030 = var_538_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_538_2 = 0.2

			if var_538_1 <= arg_535_1.time_ and arg_535_1.time_ < var_538_1 + var_538_2 then
				local var_538_3 = (arg_535_1.time_ - var_538_1) / var_538_2

				if arg_535_1.var_.actorSpriteComps10030 then
					for iter_538_0, iter_538_1 in pairs(arg_535_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_538_1 then
							local var_538_4 = Mathf.Lerp(iter_538_1.color.r, 0.5, var_538_3)

							iter_538_1.color = Color.New(var_538_4, var_538_4, var_538_4)
						end
					end
				end
			end

			if arg_535_1.time_ >= var_538_1 + var_538_2 and arg_535_1.time_ < var_538_1 + var_538_2 + arg_538_0 and arg_535_1.var_.actorSpriteComps10030 then
				local var_538_5 = 0.5

				for iter_538_2, iter_538_3 in pairs(arg_535_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_538_3 then
						iter_538_3.color = Color.New(var_538_5, var_538_5, var_538_5)
					end
				end

				arg_535_1.var_.actorSpriteComps10030 = nil
			end

			local var_538_6 = arg_535_1.actors_["10029"]
			local var_538_7 = 0

			if var_538_7 < arg_535_1.time_ and arg_535_1.time_ <= var_538_7 + arg_538_0 then
				local var_538_8 = var_538_6:GetComponent("Image")

				if var_538_8 then
					arg_535_1.var_.highlightMatValue10029 = var_538_8
				end
			end

			local var_538_9 = 0.2

			if var_538_7 <= arg_535_1.time_ and arg_535_1.time_ < var_538_7 + var_538_9 then
				local var_538_10 = (arg_535_1.time_ - var_538_7) / var_538_9

				if arg_535_1.var_.highlightMatValue10029 then
					local var_538_11 = Mathf.Lerp(0.5, 1, var_538_10)
					local var_538_12 = arg_535_1.var_.highlightMatValue10029
					local var_538_13 = var_538_12.color

					var_538_13.r = var_538_11
					var_538_13.g = var_538_11
					var_538_13.b = var_538_11
					var_538_12.color = var_538_13
				end
			end

			if arg_535_1.time_ >= var_538_7 + var_538_9 and arg_535_1.time_ < var_538_7 + var_538_9 + arg_538_0 and arg_535_1.var_.highlightMatValue10029 then
				local var_538_14 = 1

				var_538_6.transform:SetSiblingIndex(1)

				local var_538_15 = arg_535_1.var_.highlightMatValue10029
				local var_538_16 = var_538_15.color

				var_538_16.r = var_538_14
				var_538_16.g = var_538_14
				var_538_16.b = var_538_14
				var_538_15.color = var_538_16
			end

			local var_538_17 = 0
			local var_538_18 = 0.625

			if var_538_17 < arg_535_1.time_ and arg_535_1.time_ <= var_538_17 + arg_538_0 then
				arg_535_1.talkMaxDuration = 0
				arg_535_1.dialogCg_.alpha = 1

				arg_535_1.dialog_:SetActive(true)
				SetActive(arg_535_1.leftNameGo_, true)

				local var_538_19 = arg_535_1:FormatText(StoryNameCfg[312].name)

				arg_535_1.leftNameTxt_.text = var_538_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_535_1.leftNameTxt_.transform)

				arg_535_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_535_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_535_1:RecordName(arg_535_1.leftNameTxt_.text)
				SetActive(arg_535_1.iconTrs_.gameObject, false)
				arg_535_1.callingController_:SetSelectedState("normal")

				local var_538_20 = arg_535_1:GetWordFromCfg(115261132)
				local var_538_21 = arg_535_1:FormatText(var_538_20.content)

				arg_535_1.text_.text = var_538_21

				LuaForUtil.ClearLinePrefixSymbol(arg_535_1.text_)

				local var_538_22 = 29
				local var_538_23 = utf8.len(var_538_21)
				local var_538_24 = var_538_22 <= 0 and var_538_18 or var_538_18 * (var_538_23 / var_538_22)

				if var_538_24 > 0 and var_538_18 < var_538_24 then
					arg_535_1.talkMaxDuration = var_538_24

					if var_538_24 + var_538_17 > arg_535_1.duration_ then
						arg_535_1.duration_ = var_538_24 + var_538_17
					end
				end

				arg_535_1.text_.text = var_538_21
				arg_535_1.typewritter.percent = 0

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261132", "story_v_out_115261.awb") ~= 0 then
					local var_538_25 = manager.audio:GetVoiceLength("story_v_out_115261", "115261132", "story_v_out_115261.awb") / 1000

					if var_538_25 + var_538_17 > arg_535_1.duration_ then
						arg_535_1.duration_ = var_538_25 + var_538_17
					end

					if var_538_20.prefab_name ~= "" and arg_535_1.actors_[var_538_20.prefab_name] ~= nil then
						local var_538_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_535_1.actors_[var_538_20.prefab_name].transform, "story_v_out_115261", "115261132", "story_v_out_115261.awb")

						arg_535_1:RecordAudio("115261132", var_538_26)
						arg_535_1:RecordAudio("115261132", var_538_26)
					else
						arg_535_1:AudioAction("play", "voice", "story_v_out_115261", "115261132", "story_v_out_115261.awb")
					end

					arg_535_1:RecordHistoryTalkVoice("story_v_out_115261", "115261132", "story_v_out_115261.awb")
				end

				arg_535_1:RecordContent(arg_535_1.text_.text)
			end

			local var_538_27 = math.max(var_538_18, arg_535_1.talkMaxDuration)

			if var_538_17 <= arg_535_1.time_ and arg_535_1.time_ < var_538_17 + var_538_27 then
				arg_535_1.typewritter.percent = (arg_535_1.time_ - var_538_17) / var_538_27

				arg_535_1.typewritter:SetDirty()
			end

			if arg_535_1.time_ >= var_538_17 + var_538_27 and arg_535_1.time_ < var_538_17 + var_538_27 + arg_538_0 then
				arg_535_1.typewritter.percent = 1

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(true)
			end
		end
	end,
	Play115261133 = function(arg_539_0, arg_539_1)
		arg_539_1.time_ = 0
		arg_539_1.frameCnt_ = 0
		arg_539_1.state_ = "playing"
		arg_539_1.curTalkId_ = 115261133
		arg_539_1.duration_ = 17.3

		local var_539_0 = {
			ja = 10.9,
			ko = 16.4,
			zh = 12.533,
			en = 17.3
		}
		local var_539_1 = manager.audio:GetLocalizationFlag()

		if var_539_0[var_539_1] ~= nil then
			arg_539_1.duration_ = var_539_0[var_539_1]
		end

		SetActive(arg_539_1.tipsGo_, false)

		function arg_539_1.onSingleLineFinish_()
			arg_539_1.onSingleLineUpdate_ = nil
			arg_539_1.onSingleLineFinish_ = nil
			arg_539_1.state_ = "waiting"
		end

		function arg_539_1.playNext_(arg_541_0)
			if arg_541_0 == 1 then
				arg_539_0:Play115261134(arg_539_1)
			end
		end

		function arg_539_1.onSingleLineUpdate_(arg_542_0)
			local var_542_0 = 0
			local var_542_1 = 1.4

			if var_542_0 < arg_539_1.time_ and arg_539_1.time_ <= var_542_0 + arg_542_0 then
				arg_539_1.talkMaxDuration = 0
				arg_539_1.dialogCg_.alpha = 1

				arg_539_1.dialog_:SetActive(true)
				SetActive(arg_539_1.leftNameGo_, true)

				local var_542_2 = arg_539_1:FormatText(StoryNameCfg[312].name)

				arg_539_1.leftNameTxt_.text = var_542_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_539_1.leftNameTxt_.transform)

				arg_539_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_539_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_539_1:RecordName(arg_539_1.leftNameTxt_.text)
				SetActive(arg_539_1.iconTrs_.gameObject, false)
				arg_539_1.callingController_:SetSelectedState("normal")

				local var_542_3 = arg_539_1:GetWordFromCfg(115261133)
				local var_542_4 = arg_539_1:FormatText(var_542_3.content)

				arg_539_1.text_.text = var_542_4

				LuaForUtil.ClearLinePrefixSymbol(arg_539_1.text_)

				local var_542_5 = 56
				local var_542_6 = utf8.len(var_542_4)
				local var_542_7 = var_542_5 <= 0 and var_542_1 or var_542_1 * (var_542_6 / var_542_5)

				if var_542_7 > 0 and var_542_1 < var_542_7 then
					arg_539_1.talkMaxDuration = var_542_7

					if var_542_7 + var_542_0 > arg_539_1.duration_ then
						arg_539_1.duration_ = var_542_7 + var_542_0
					end
				end

				arg_539_1.text_.text = var_542_4
				arg_539_1.typewritter.percent = 0

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261133", "story_v_out_115261.awb") ~= 0 then
					local var_542_8 = manager.audio:GetVoiceLength("story_v_out_115261", "115261133", "story_v_out_115261.awb") / 1000

					if var_542_8 + var_542_0 > arg_539_1.duration_ then
						arg_539_1.duration_ = var_542_8 + var_542_0
					end

					if var_542_3.prefab_name ~= "" and arg_539_1.actors_[var_542_3.prefab_name] ~= nil then
						local var_542_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_539_1.actors_[var_542_3.prefab_name].transform, "story_v_out_115261", "115261133", "story_v_out_115261.awb")

						arg_539_1:RecordAudio("115261133", var_542_9)
						arg_539_1:RecordAudio("115261133", var_542_9)
					else
						arg_539_1:AudioAction("play", "voice", "story_v_out_115261", "115261133", "story_v_out_115261.awb")
					end

					arg_539_1:RecordHistoryTalkVoice("story_v_out_115261", "115261133", "story_v_out_115261.awb")
				end

				arg_539_1:RecordContent(arg_539_1.text_.text)
			end

			local var_542_10 = math.max(var_542_1, arg_539_1.talkMaxDuration)

			if var_542_0 <= arg_539_1.time_ and arg_539_1.time_ < var_542_0 + var_542_10 then
				arg_539_1.typewritter.percent = (arg_539_1.time_ - var_542_0) / var_542_10

				arg_539_1.typewritter:SetDirty()
			end

			if arg_539_1.time_ >= var_542_0 + var_542_10 and arg_539_1.time_ < var_542_0 + var_542_10 + arg_542_0 then
				arg_539_1.typewritter.percent = 1

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(true)
			end
		end
	end,
	Play115261134 = function(arg_543_0, arg_543_1)
		arg_543_1.time_ = 0
		arg_543_1.frameCnt_ = 0
		arg_543_1.state_ = "playing"
		arg_543_1.curTalkId_ = 115261134
		arg_543_1.duration_ = 6.533

		local var_543_0 = {
			ja = 6.533,
			ko = 6.533,
			zh = 5.166,
			en = 5.633
		}
		local var_543_1 = manager.audio:GetLocalizationFlag()

		if var_543_0[var_543_1] ~= nil then
			arg_543_1.duration_ = var_543_0[var_543_1]
		end

		SetActive(arg_543_1.tipsGo_, false)

		function arg_543_1.onSingleLineFinish_()
			arg_543_1.onSingleLineUpdate_ = nil
			arg_543_1.onSingleLineFinish_ = nil
			arg_543_1.state_ = "waiting"
		end

		function arg_543_1.playNext_(arg_545_0)
			if arg_545_0 == 1 then
				arg_543_0:Play115261135(arg_543_1)
			end
		end

		function arg_543_1.onSingleLineUpdate_(arg_546_0)
			local var_546_0 = arg_543_1.actors_["10030"]
			local var_546_1 = 0

			if var_546_1 < arg_543_1.time_ and arg_543_1.time_ <= var_546_1 + arg_546_0 and arg_543_1.var_.actorSpriteComps10030 == nil then
				arg_543_1.var_.actorSpriteComps10030 = var_546_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_546_2 = 0.2

			if var_546_1 <= arg_543_1.time_ and arg_543_1.time_ < var_546_1 + var_546_2 then
				local var_546_3 = (arg_543_1.time_ - var_546_1) / var_546_2

				if arg_543_1.var_.actorSpriteComps10030 then
					for iter_546_0, iter_546_1 in pairs(arg_543_1.var_.actorSpriteComps10030:ToTable()) do
						if iter_546_1 then
							local var_546_4 = Mathf.Lerp(iter_546_1.color.r, 1, var_546_3)

							iter_546_1.color = Color.New(var_546_4, var_546_4, var_546_4)
						end
					end
				end
			end

			if arg_543_1.time_ >= var_546_1 + var_546_2 and arg_543_1.time_ < var_546_1 + var_546_2 + arg_546_0 and arg_543_1.var_.actorSpriteComps10030 then
				local var_546_5 = 1

				for iter_546_2, iter_546_3 in pairs(arg_543_1.var_.actorSpriteComps10030:ToTable()) do
					if iter_546_3 then
						iter_546_3.color = Color.New(var_546_5, var_546_5, var_546_5)
					end
				end

				arg_543_1.var_.actorSpriteComps10030 = nil
			end

			local var_546_6 = arg_543_1.actors_["10029"]
			local var_546_7 = 0

			if var_546_7 < arg_543_1.time_ and arg_543_1.time_ <= var_546_7 + arg_546_0 then
				local var_546_8 = var_546_6:GetComponent("Image")

				if var_546_8 then
					arg_543_1.var_.highlightMatValue10029 = var_546_8
				end
			end

			local var_546_9 = 0.2

			if var_546_7 <= arg_543_1.time_ and arg_543_1.time_ < var_546_7 + var_546_9 then
				local var_546_10 = (arg_543_1.time_ - var_546_7) / var_546_9

				if arg_543_1.var_.highlightMatValue10029 then
					local var_546_11 = Mathf.Lerp(1, 0.5, var_546_10)
					local var_546_12 = arg_543_1.var_.highlightMatValue10029
					local var_546_13 = var_546_12.color

					var_546_13.r = var_546_11
					var_546_13.g = var_546_11
					var_546_13.b = var_546_11
					var_546_12.color = var_546_13
				end
			end

			if arg_543_1.time_ >= var_546_7 + var_546_9 and arg_543_1.time_ < var_546_7 + var_546_9 + arg_546_0 and arg_543_1.var_.highlightMatValue10029 then
				local var_546_14 = 0.5
				local var_546_15 = arg_543_1.var_.highlightMatValue10029
				local var_546_16 = var_546_15.color

				var_546_16.r = var_546_14
				var_546_16.g = var_546_14
				var_546_16.b = var_546_14
				var_546_15.color = var_546_16
			end

			local var_546_17 = arg_543_1.actors_["10030"].transform
			local var_546_18 = 0

			if var_546_18 < arg_543_1.time_ and arg_543_1.time_ <= var_546_18 + arg_546_0 then
				arg_543_1.var_.moveOldPos10030 = var_546_17.localPosition
				var_546_17.localScale = Vector3.New(1, 1, 1)

				arg_543_1:CheckSpriteTmpPos("10030", 4)

				local var_546_19 = var_546_17.childCount

				for iter_546_4 = 0, var_546_19 - 1 do
					local var_546_20 = var_546_17:GetChild(iter_546_4)

					if var_546_20.name == "split_1" or not string.find(var_546_20.name, "split") then
						var_546_20.gameObject:SetActive(true)
					else
						var_546_20.gameObject:SetActive(false)
					end
				end
			end

			local var_546_21 = 0.001

			if var_546_18 <= arg_543_1.time_ and arg_543_1.time_ < var_546_18 + var_546_21 then
				local var_546_22 = (arg_543_1.time_ - var_546_18) / var_546_21
				local var_546_23 = Vector3.New(390, -390, 150)

				var_546_17.localPosition = Vector3.Lerp(arg_543_1.var_.moveOldPos10030, var_546_23, var_546_22)
			end

			if arg_543_1.time_ >= var_546_18 + var_546_21 and arg_543_1.time_ < var_546_18 + var_546_21 + arg_546_0 then
				var_546_17.localPosition = Vector3.New(390, -390, 150)
			end

			local var_546_24 = arg_543_1.actors_["10030"]
			local var_546_25 = 0

			if var_546_25 < arg_543_1.time_ and arg_543_1.time_ <= var_546_25 + arg_546_0 then
				local var_546_26 = var_546_24:GetComponentInChildren(typeof(CanvasGroup))

				if var_546_26 then
					arg_543_1.var_.alphaOldValue10030 = var_546_26.alpha
					arg_543_1.var_.characterEffect10030 = var_546_26
				end

				arg_543_1.var_.alphaOldValue10030 = 0
			end

			local var_546_27 = 0.0166666666666667

			if var_546_25 <= arg_543_1.time_ and arg_543_1.time_ < var_546_25 + var_546_27 then
				local var_546_28 = (arg_543_1.time_ - var_546_25) / var_546_27
				local var_546_29 = Mathf.Lerp(arg_543_1.var_.alphaOldValue10030, 1, var_546_28)

				if arg_543_1.var_.characterEffect10030 then
					arg_543_1.var_.characterEffect10030.alpha = var_546_29
				end
			end

			if arg_543_1.time_ >= var_546_25 + var_546_27 and arg_543_1.time_ < var_546_25 + var_546_27 + arg_546_0 and arg_543_1.var_.characterEffect10030 then
				arg_543_1.var_.characterEffect10030.alpha = 1
			end

			local var_546_30 = 0
			local var_546_31 = 0.5

			if var_546_30 < arg_543_1.time_ and arg_543_1.time_ <= var_546_30 + arg_546_0 then
				arg_543_1.talkMaxDuration = 0
				arg_543_1.dialogCg_.alpha = 1

				arg_543_1.dialog_:SetActive(true)
				SetActive(arg_543_1.leftNameGo_, true)

				local var_546_32 = arg_543_1:FormatText(StoryNameCfg[309].name)

				arg_543_1.leftNameTxt_.text = var_546_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_543_1.leftNameTxt_.transform)

				arg_543_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_543_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_543_1:RecordName(arg_543_1.leftNameTxt_.text)
				SetActive(arg_543_1.iconTrs_.gameObject, false)
				arg_543_1.callingController_:SetSelectedState("normal")

				local var_546_33 = arg_543_1:GetWordFromCfg(115261134)
				local var_546_34 = arg_543_1:FormatText(var_546_33.content)

				arg_543_1.text_.text = var_546_34

				LuaForUtil.ClearLinePrefixSymbol(arg_543_1.text_)

				local var_546_35 = 20
				local var_546_36 = utf8.len(var_546_34)
				local var_546_37 = var_546_35 <= 0 and var_546_31 or var_546_31 * (var_546_36 / var_546_35)

				if var_546_37 > 0 and var_546_31 < var_546_37 then
					arg_543_1.talkMaxDuration = var_546_37

					if var_546_37 + var_546_30 > arg_543_1.duration_ then
						arg_543_1.duration_ = var_546_37 + var_546_30
					end
				end

				arg_543_1.text_.text = var_546_34
				arg_543_1.typewritter.percent = 0

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261134", "story_v_out_115261.awb") ~= 0 then
					local var_546_38 = manager.audio:GetVoiceLength("story_v_out_115261", "115261134", "story_v_out_115261.awb") / 1000

					if var_546_38 + var_546_30 > arg_543_1.duration_ then
						arg_543_1.duration_ = var_546_38 + var_546_30
					end

					if var_546_33.prefab_name ~= "" and arg_543_1.actors_[var_546_33.prefab_name] ~= nil then
						local var_546_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_543_1.actors_[var_546_33.prefab_name].transform, "story_v_out_115261", "115261134", "story_v_out_115261.awb")

						arg_543_1:RecordAudio("115261134", var_546_39)
						arg_543_1:RecordAudio("115261134", var_546_39)
					else
						arg_543_1:AudioAction("play", "voice", "story_v_out_115261", "115261134", "story_v_out_115261.awb")
					end

					arg_543_1:RecordHistoryTalkVoice("story_v_out_115261", "115261134", "story_v_out_115261.awb")
				end

				arg_543_1:RecordContent(arg_543_1.text_.text)
			end

			local var_546_40 = math.max(var_546_31, arg_543_1.talkMaxDuration)

			if var_546_30 <= arg_543_1.time_ and arg_543_1.time_ < var_546_30 + var_546_40 then
				arg_543_1.typewritter.percent = (arg_543_1.time_ - var_546_30) / var_546_40

				arg_543_1.typewritter:SetDirty()
			end

			if arg_543_1.time_ >= var_546_30 + var_546_40 and arg_543_1.time_ < var_546_30 + var_546_40 + arg_546_0 then
				arg_543_1.typewritter.percent = 1

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(true)
			end
		end
	end,
	Play115261135 = function(arg_547_0, arg_547_1)
		arg_547_1.time_ = 0
		arg_547_1.frameCnt_ = 0
		arg_547_1.state_ = "playing"
		arg_547_1.curTalkId_ = 115261135
		arg_547_1.duration_ = 2.666

		local var_547_0 = {
			ja = 2.666,
			ko = 1.633,
			zh = 2,
			en = 2.533
		}
		local var_547_1 = manager.audio:GetLocalizationFlag()

		if var_547_0[var_547_1] ~= nil then
			arg_547_1.duration_ = var_547_0[var_547_1]
		end

		SetActive(arg_547_1.tipsGo_, false)

		function arg_547_1.onSingleLineFinish_()
			arg_547_1.onSingleLineUpdate_ = nil
			arg_547_1.onSingleLineFinish_ = nil
			arg_547_1.state_ = "waiting"
		end

		function arg_547_1.playNext_(arg_549_0)
			if arg_549_0 == 1 then
				arg_547_0:Play115261136(arg_547_1)
			end
		end

		function arg_547_1.onSingleLineUpdate_(arg_550_0)
			local var_550_0 = arg_547_1.actors_["10030"].transform
			local var_550_1 = 0

			if var_550_1 < arg_547_1.time_ and arg_547_1.time_ <= var_550_1 + arg_550_0 then
				arg_547_1.var_.moveOldPos10030 = var_550_0.localPosition
				var_550_0.localScale = Vector3.New(1, 1, 1)

				arg_547_1:CheckSpriteTmpPos("10030", 4)

				local var_550_2 = var_550_0.childCount

				for iter_550_0 = 0, var_550_2 - 1 do
					local var_550_3 = var_550_0:GetChild(iter_550_0)

					if var_550_3.name == "split_5" or not string.find(var_550_3.name, "split") then
						var_550_3.gameObject:SetActive(true)
					else
						var_550_3.gameObject:SetActive(false)
					end
				end
			end

			local var_550_4 = 0.001

			if var_550_1 <= arg_547_1.time_ and arg_547_1.time_ < var_550_1 + var_550_4 then
				local var_550_5 = (arg_547_1.time_ - var_550_1) / var_550_4
				local var_550_6 = Vector3.New(390, -390, 150)

				var_550_0.localPosition = Vector3.Lerp(arg_547_1.var_.moveOldPos10030, var_550_6, var_550_5)
			end

			if arg_547_1.time_ >= var_550_1 + var_550_4 and arg_547_1.time_ < var_550_1 + var_550_4 + arg_550_0 then
				var_550_0.localPosition = Vector3.New(390, -390, 150)
			end

			local var_550_7 = 0
			local var_550_8 = 0.15

			if var_550_7 < arg_547_1.time_ and arg_547_1.time_ <= var_550_7 + arg_550_0 then
				arg_547_1.talkMaxDuration = 0
				arg_547_1.dialogCg_.alpha = 1

				arg_547_1.dialog_:SetActive(true)
				SetActive(arg_547_1.leftNameGo_, true)

				local var_550_9 = arg_547_1:FormatText(StoryNameCfg[309].name)

				arg_547_1.leftNameTxt_.text = var_550_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_547_1.leftNameTxt_.transform)

				arg_547_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_547_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_547_1:RecordName(arg_547_1.leftNameTxt_.text)
				SetActive(arg_547_1.iconTrs_.gameObject, false)
				arg_547_1.callingController_:SetSelectedState("normal")

				local var_550_10 = arg_547_1:GetWordFromCfg(115261135)
				local var_550_11 = arg_547_1:FormatText(var_550_10.content)

				arg_547_1.text_.text = var_550_11

				LuaForUtil.ClearLinePrefixSymbol(arg_547_1.text_)

				local var_550_12 = 6
				local var_550_13 = utf8.len(var_550_11)
				local var_550_14 = var_550_12 <= 0 and var_550_8 or var_550_8 * (var_550_13 / var_550_12)

				if var_550_14 > 0 and var_550_8 < var_550_14 then
					arg_547_1.talkMaxDuration = var_550_14

					if var_550_14 + var_550_7 > arg_547_1.duration_ then
						arg_547_1.duration_ = var_550_14 + var_550_7
					end
				end

				arg_547_1.text_.text = var_550_11
				arg_547_1.typewritter.percent = 0

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_115261", "115261135", "story_v_out_115261.awb") ~= 0 then
					local var_550_15 = manager.audio:GetVoiceLength("story_v_out_115261", "115261135", "story_v_out_115261.awb") / 1000

					if var_550_15 + var_550_7 > arg_547_1.duration_ then
						arg_547_1.duration_ = var_550_15 + var_550_7
					end

					if var_550_10.prefab_name ~= "" and arg_547_1.actors_[var_550_10.prefab_name] ~= nil then
						local var_550_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_547_1.actors_[var_550_10.prefab_name].transform, "story_v_out_115261", "115261135", "story_v_out_115261.awb")

						arg_547_1:RecordAudio("115261135", var_550_16)
						arg_547_1:RecordAudio("115261135", var_550_16)
					else
						arg_547_1:AudioAction("play", "voice", "story_v_out_115261", "115261135", "story_v_out_115261.awb")
					end

					arg_547_1:RecordHistoryTalkVoice("story_v_out_115261", "115261135", "story_v_out_115261.awb")
				end

				arg_547_1:RecordContent(arg_547_1.text_.text)
			end

			local var_550_17 = math.max(var_550_8, arg_547_1.talkMaxDuration)

			if var_550_7 <= arg_547_1.time_ and arg_547_1.time_ < var_550_7 + var_550_17 then
				arg_547_1.typewritter.percent = (arg_547_1.time_ - var_550_7) / var_550_17

				arg_547_1.typewritter:SetDirty()
			end

			if arg_547_1.time_ >= var_550_7 + var_550_17 and arg_547_1.time_ < var_550_7 + var_550_17 + arg_550_0 then
				arg_547_1.typewritter.percent = 1

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(true)
			end
		end
	end,
	Play115261136 = function(arg_551_0, arg_551_1)
		arg_551_1.time_ = 0
		arg_551_1.frameCnt_ = 0
		arg_551_1.state_ = "playing"
		arg_551_1.curTalkId_ = 115261136
		arg_551_1.duration_ = 5

		SetActive(arg_551_1.tipsGo_, false)

		function arg_551_1.onSingleLineFinish_()
			arg_551_1.onSingleLineUpdate_ = nil
			arg_551_1.onSingleLineFinish_ = nil
			arg_551_1.state_ = "waiting"
			arg_551_1.auto_ = false
		end

		function arg_551_1.playNext_(arg_553_0)
			arg_551_1.onStoryFinished_()
		end

		function arg_551_1.onSingleLineUpdate_(arg_554_0)
			local var_554_0 = arg_551_1.actors_["10030"]
			local var_554_1 = 0

			if var_554_1 < arg_551_1.time_ and arg_551_1.time_ <= var_554_1 + arg_554_0 then
				local var_554_2 = var_554_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_554_2 then
					arg_551_1.var_.alphaOldValue10030 = var_554_2.alpha
					arg_551_1.var_.characterEffect10030 = var_554_2
				end

				arg_551_1.var_.alphaOldValue10030 = 1
			end

			local var_554_3 = 0.333333333333333

			if var_554_1 <= arg_551_1.time_ and arg_551_1.time_ < var_554_1 + var_554_3 then
				local var_554_4 = (arg_551_1.time_ - var_554_1) / var_554_3
				local var_554_5 = Mathf.Lerp(arg_551_1.var_.alphaOldValue10030, 0, var_554_4)

				if arg_551_1.var_.characterEffect10030 then
					arg_551_1.var_.characterEffect10030.alpha = var_554_5
				end
			end

			if arg_551_1.time_ >= var_554_1 + var_554_3 and arg_551_1.time_ < var_554_1 + var_554_3 + arg_554_0 and arg_551_1.var_.characterEffect10030 then
				arg_551_1.var_.characterEffect10030.alpha = 0
			end

			local var_554_6 = arg_551_1.actors_["10029"]
			local var_554_7 = 0

			if var_554_7 < arg_551_1.time_ and arg_551_1.time_ <= var_554_7 + arg_554_0 then
				local var_554_8 = var_554_6:GetComponent("Image")

				if var_554_8 then
					arg_551_1.var_.alphaMatValue10029 = var_554_8
					arg_551_1.var_.alphaOldValue10029 = var_554_8.color.a
				end

				arg_551_1.var_.alphaOldValue10029 = 1
			end

			local var_554_9 = 0.333333333333333

			if var_554_7 <= arg_551_1.time_ and arg_551_1.time_ < var_554_7 + var_554_9 then
				local var_554_10 = (arg_551_1.time_ - var_554_7) / var_554_9
				local var_554_11 = Mathf.Lerp(arg_551_1.var_.alphaOldValue10029, 0, var_554_10)

				if arg_551_1.var_.alphaMatValue10029 then
					local var_554_12 = arg_551_1.var_.alphaMatValue10029.color

					var_554_12.a = var_554_11
					arg_551_1.var_.alphaMatValue10029.color = var_554_12
				end
			end

			if arg_551_1.time_ >= var_554_7 + var_554_9 and arg_551_1.time_ < var_554_7 + var_554_9 + arg_554_0 and arg_551_1.var_.alphaMatValue10029 then
				local var_554_13 = arg_551_1.var_.alphaMatValue10029
				local var_554_14 = var_554_13.color

				var_554_14.a = 0
				var_554_13.color = var_554_14
			end

			local var_554_15 = 0
			local var_554_16 = 0.825

			if var_554_15 < arg_551_1.time_ and arg_551_1.time_ <= var_554_15 + arg_554_0 then
				arg_551_1.talkMaxDuration = 0
				arg_551_1.dialogCg_.alpha = 1

				arg_551_1.dialog_:SetActive(true)
				SetActive(arg_551_1.leftNameGo_, false)

				arg_551_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_551_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_551_1:RecordName(arg_551_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_551_1.iconTrs_.gameObject, false)
				arg_551_1.callingController_:SetSelectedState("normal")

				local var_554_17 = arg_551_1:GetWordFromCfg(115261136)
				local var_554_18 = arg_551_1:FormatText(var_554_17.content)

				arg_551_1.text_.text = var_554_18

				LuaForUtil.ClearLinePrefixSymbol(arg_551_1.text_)

				local var_554_19 = 33
				local var_554_20 = utf8.len(var_554_18)
				local var_554_21 = var_554_19 <= 0 and var_554_16 or var_554_16 * (var_554_20 / var_554_19)

				if var_554_21 > 0 and var_554_16 < var_554_21 then
					arg_551_1.talkMaxDuration = var_554_21

					if var_554_21 + var_554_15 > arg_551_1.duration_ then
						arg_551_1.duration_ = var_554_21 + var_554_15
					end
				end

				arg_551_1.text_.text = var_554_18
				arg_551_1.typewritter.percent = 0

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(false)
				arg_551_1:RecordContent(arg_551_1.text_.text)
			end

			local var_554_22 = math.max(var_554_16, arg_551_1.talkMaxDuration)

			if var_554_15 <= arg_551_1.time_ and arg_551_1.time_ < var_554_15 + var_554_22 then
				arg_551_1.typewritter.percent = (arg_551_1.time_ - var_554_15) / var_554_22

				arg_551_1.typewritter:SetDirty()
			end

			if arg_551_1.time_ >= var_554_15 + var_554_22 and arg_551_1.time_ < var_554_15 + var_554_22 + arg_554_0 then
				arg_551_1.typewritter.percent = 1

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST22",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/F01a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST27a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST22a"
	},
	voices = {
		"story_v_out_115261.awb"
	}
}
