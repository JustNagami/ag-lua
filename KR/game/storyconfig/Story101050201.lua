﻿return {
	Play105021001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 105021001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play105021002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = 0
			local var_4_1 = 1

			if var_4_0 < arg_1_1.time_ and arg_1_1.time_ <= var_4_0 + arg_4_0 then
				local var_4_2 = "play"
				local var_4_3 = "effect"

				arg_1_1:AudioAction(var_4_2, var_4_3, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_4 = "B01c"

			if arg_1_1.bgs_[var_4_4] == nil then
				local var_4_5 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_5:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_4)
				var_4_5.name = var_4_4
				var_4_5.transform.parent = arg_1_1.stage_.transform
				var_4_5.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_4] = var_4_5
			end

			local var_4_6 = arg_1_1.bgs_.B01c
			local var_4_7 = 0

			if var_4_7 < arg_1_1.time_ and arg_1_1.time_ <= var_4_7 + arg_4_0 then
				local var_4_8 = var_4_6:GetComponent("SpriteRenderer")

				if var_4_8 then
					var_4_8.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_9 = var_4_8.material
					local var_4_10 = var_4_9:GetColor("_Color")

					arg_1_1.var_.alphaOldValueB01c = var_4_10.a
					arg_1_1.var_.alphaMatValueB01c = var_4_9
				end

				arg_1_1.var_.alphaOldValueB01c = 0
			end

			local var_4_11 = 1.5

			if var_4_7 <= arg_1_1.time_ and arg_1_1.time_ < var_4_7 + var_4_11 then
				local var_4_12 = (arg_1_1.time_ - var_4_7) / var_4_11
				local var_4_13 = Mathf.Lerp(arg_1_1.var_.alphaOldValueB01c, 1, var_4_12)

				if arg_1_1.var_.alphaMatValueB01c then
					local var_4_14 = arg_1_1.var_.alphaMatValueB01c
					local var_4_15 = var_4_14:GetColor("_Color")

					var_4_15.a = var_4_13

					var_4_14:SetColor("_Color", var_4_15)
				end
			end

			if arg_1_1.time_ >= var_4_7 + var_4_11 and arg_1_1.time_ < var_4_7 + var_4_11 + arg_4_0 and arg_1_1.var_.alphaMatValueB01c then
				local var_4_16 = arg_1_1.var_.alphaMatValueB01c
				local var_4_17 = var_4_16:GetColor("_Color")

				var_4_17.a = 1

				var_4_16:SetColor("_Color", var_4_17)
			end

			local var_4_18 = 0

			if var_4_18 < arg_1_1.time_ and arg_1_1.time_ <= var_4_18 + arg_4_0 then
				local var_4_19 = manager.ui.mainCamera.transform.localPosition
				local var_4_20 = Vector3.New(0, 0, 10) + Vector3.New(var_4_19.x, var_4_19.y, 0)
				local var_4_21 = arg_1_1.bgs_.B01c

				var_4_21.transform.localPosition = var_4_20
				var_4_21.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_4_22 = var_4_21:GetComponent("SpriteRenderer")

				if var_4_22 and var_4_22.sprite then
					local var_4_23 = (var_4_21.transform.localPosition - var_4_19).z
					local var_4_24 = manager.ui.mainCameraCom_
					local var_4_25 = 2 * var_4_23 * Mathf.Tan(var_4_24.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_4_26 = var_4_25 * var_4_24.aspect
					local var_4_27 = var_4_22.sprite.bounds.size.x
					local var_4_28 = var_4_22.sprite.bounds.size.y
					local var_4_29 = var_4_26 / var_4_27
					local var_4_30 = var_4_25 / var_4_28
					local var_4_31 = var_4_30 < var_4_29 and var_4_29 or var_4_30

					var_4_21.transform.localScale = Vector3.New(var_4_31, var_4_31, 0)
				end

				for iter_4_0, iter_4_1 in pairs(arg_1_1.bgs_) do
					if iter_4_0 ~= "B01c" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_32 = 0

			if var_4_32 < arg_1_1.time_ and arg_1_1.time_ <= var_4_32 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_33 = 2

			if arg_1_1.time_ >= var_4_32 + var_4_33 and arg_1_1.time_ < var_4_32 + var_4_33 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_34 = 2
			local var_4_35 = 0.275

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

				local var_4_37 = arg_1_1:GetWordFromCfg(105021001)
				local var_4_38 = arg_1_1:FormatText(var_4_37.content)

				arg_1_1.text_.text = var_4_38

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_39 = 11
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
	Play105021002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 105021002
		arg_7_1.duration_ = 4.3

		local var_7_0 = {
			ja = 3.933,
			ko = 4.2,
			zh = 4.3,
			en = 3.8
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
				arg_7_0:Play105021003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 1

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				local var_10_2 = "play"
				local var_10_3 = "music"

				arg_7_1:AudioAction(var_10_2, var_10_3, "bgm_story_v1_qiaolin", "bgm_story_v1_qiaolin", "bgm_story_v1_qiaolin")

				local var_10_4 = ""
				local var_10_5 = manager.audio:GetAudioName("bgm_story_v1_qiaolin", "bgm_story_v1_qiaolin")

				if var_10_5 ~= "" then
					if arg_7_1.bgmTxt_.text ~= var_10_5 and arg_7_1.bgmTxt_.text ~= "" then
						if arg_7_1.bgmTxt2_.text ~= "" then
							arg_7_1.bgmTxt_.text = arg_7_1.bgmTxt2_.text
						end

						arg_7_1.bgmTxt2_.text = var_10_5

						arg_7_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_7_1.bgmTxt_.text = var_10_5
					end

					if arg_7_1.bgmTimer then
						arg_7_1.bgmTimer:Stop()

						arg_7_1.bgmTimer = nil
					end

					if arg_7_1.settingData.show_music_name == 1 then
						arg_7_1.musicController:SetSelectedState("show")
						arg_7_1.musicAnimator_:Play("open", 0, 0)

						if arg_7_1.settingData.music_time ~= 0 then
							arg_7_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_7_1.settingData.music_time), function()
								if arg_7_1 == nil or isNil(arg_7_1.bgmTxt_) then
									return
								end

								arg_7_1.musicController:SetSelectedState("hide")
								arg_7_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_10_6 = 0
			local var_10_7 = 0.325

			if var_10_6 < arg_7_1.time_ and arg_7_1.time_ <= var_10_6 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_8 = arg_7_1:FormatText(StoryNameCfg[39].name)

				arg_7_1.leftNameTxt_.text = var_10_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, true)
				arg_7_1.iconController_:SetSelectedState("hero")

				arg_7_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_Jolin")

				arg_7_1.callingController_:SetSelectedState("normal")

				arg_7_1.keyicon_.color = Color.New(1, 1, 1)
				arg_7_1.icon_.color = Color.New(1, 1, 1)

				local var_10_9 = arg_7_1:GetWordFromCfg(105021002)
				local var_10_10 = arg_7_1:FormatText(var_10_9.content)

				arg_7_1.text_.text = var_10_10

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_11 = 13
				local var_10_12 = utf8.len(var_10_10)
				local var_10_13 = var_10_11 <= 0 and var_10_7 or var_10_7 * (var_10_12 / var_10_11)

				if var_10_13 > 0 and var_10_7 < var_10_13 then
					arg_7_1.talkMaxDuration = var_10_13

					if var_10_13 + var_10_6 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_13 + var_10_6
					end
				end

				arg_7_1.text_.text = var_10_10
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105021", "105021002", "story_v_out_105021.awb") ~= 0 then
					local var_10_14 = manager.audio:GetVoiceLength("story_v_out_105021", "105021002", "story_v_out_105021.awb") / 1000

					if var_10_14 + var_10_6 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_14 + var_10_6
					end

					if var_10_9.prefab_name ~= "" and arg_7_1.actors_[var_10_9.prefab_name] ~= nil then
						local var_10_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_9.prefab_name].transform, "story_v_out_105021", "105021002", "story_v_out_105021.awb")

						arg_7_1:RecordAudio("105021002", var_10_15)
						arg_7_1:RecordAudio("105021002", var_10_15)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_105021", "105021002", "story_v_out_105021.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_105021", "105021002", "story_v_out_105021.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_16 = math.max(var_10_7, arg_7_1.talkMaxDuration)

			if var_10_6 <= arg_7_1.time_ and arg_7_1.time_ < var_10_6 + var_10_16 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_6) / var_10_16

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_6 + var_10_16 and arg_7_1.time_ < var_10_6 + var_10_16 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play105021003 = function(arg_12_0, arg_12_1)
		arg_12_1.time_ = 0
		arg_12_1.frameCnt_ = 0
		arg_12_1.state_ = "playing"
		arg_12_1.curTalkId_ = 105021003
		arg_12_1.duration_ = 3.2

		local var_12_0 = {
			ja = 2.433,
			ko = 2,
			zh = 3.2,
			en = 2.6
		}
		local var_12_1 = manager.audio:GetLocalizationFlag()

		if var_12_0[var_12_1] ~= nil then
			arg_12_1.duration_ = var_12_0[var_12_1]
		end

		SetActive(arg_12_1.tipsGo_, false)

		function arg_12_1.onSingleLineFinish_()
			arg_12_1.onSingleLineUpdate_ = nil
			arg_12_1.onSingleLineFinish_ = nil
			arg_12_1.state_ = "waiting"
		end

		function arg_12_1.playNext_(arg_14_0)
			if arg_14_0 == 1 then
				arg_12_0:Play105021004(arg_12_1)
			end
		end

		function arg_12_1.onSingleLineUpdate_(arg_15_0)
			local var_15_0 = 0
			local var_15_1 = 0.2

			if var_15_0 < arg_12_1.time_ and arg_12_1.time_ <= var_15_0 + arg_15_0 then
				arg_12_1.talkMaxDuration = 0
				arg_12_1.dialogCg_.alpha = 1

				arg_12_1.dialog_:SetActive(true)
				SetActive(arg_12_1.leftNameGo_, true)

				local var_15_2 = arg_12_1:FormatText(StoryNameCfg[35].name)

				arg_12_1.leftNameTxt_.text = var_15_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_12_1.leftNameTxt_.transform)

				arg_12_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_12_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_12_1:RecordName(arg_12_1.leftNameTxt_.text)
				SetActive(arg_12_1.iconTrs_.gameObject, true)
				arg_12_1.iconController_:SetSelectedState("hero")

				arg_12_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1013")

				arg_12_1.callingController_:SetSelectedState("normal")

				arg_12_1.keyicon_.color = Color.New(1, 1, 1)
				arg_12_1.icon_.color = Color.New(1, 1, 1)

				local var_15_3 = arg_12_1:GetWordFromCfg(105021003)
				local var_15_4 = arg_12_1:FormatText(var_15_3.content)

				arg_12_1.text_.text = var_15_4

				LuaForUtil.ClearLinePrefixSymbol(arg_12_1.text_)

				local var_15_5 = 8
				local var_15_6 = utf8.len(var_15_4)
				local var_15_7 = var_15_5 <= 0 and var_15_1 or var_15_1 * (var_15_6 / var_15_5)

				if var_15_7 > 0 and var_15_1 < var_15_7 then
					arg_12_1.talkMaxDuration = var_15_7

					if var_15_7 + var_15_0 > arg_12_1.duration_ then
						arg_12_1.duration_ = var_15_7 + var_15_0
					end
				end

				arg_12_1.text_.text = var_15_4
				arg_12_1.typewritter.percent = 0

				arg_12_1.typewritter:SetDirty()
				arg_12_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105021", "105021003", "story_v_out_105021.awb") ~= 0 then
					local var_15_8 = manager.audio:GetVoiceLength("story_v_out_105021", "105021003", "story_v_out_105021.awb") / 1000

					if var_15_8 + var_15_0 > arg_12_1.duration_ then
						arg_12_1.duration_ = var_15_8 + var_15_0
					end

					if var_15_3.prefab_name ~= "" and arg_12_1.actors_[var_15_3.prefab_name] ~= nil then
						local var_15_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_12_1.actors_[var_15_3.prefab_name].transform, "story_v_out_105021", "105021003", "story_v_out_105021.awb")

						arg_12_1:RecordAudio("105021003", var_15_9)
						arg_12_1:RecordAudio("105021003", var_15_9)
					else
						arg_12_1:AudioAction("play", "voice", "story_v_out_105021", "105021003", "story_v_out_105021.awb")
					end

					arg_12_1:RecordHistoryTalkVoice("story_v_out_105021", "105021003", "story_v_out_105021.awb")
				end

				arg_12_1:RecordContent(arg_12_1.text_.text)
			end

			local var_15_10 = math.max(var_15_1, arg_12_1.talkMaxDuration)

			if var_15_0 <= arg_12_1.time_ and arg_12_1.time_ < var_15_0 + var_15_10 then
				arg_12_1.typewritter.percent = (arg_12_1.time_ - var_15_0) / var_15_10

				arg_12_1.typewritter:SetDirty()
			end

			if arg_12_1.time_ >= var_15_0 + var_15_10 and arg_12_1.time_ < var_15_0 + var_15_10 + arg_15_0 then
				arg_12_1.typewritter.percent = 1

				arg_12_1.typewritter:SetDirty()
				arg_12_1:ShowNextGo(true)
			end
		end
	end,
	Play105021004 = function(arg_16_0, arg_16_1)
		arg_16_1.time_ = 0
		arg_16_1.frameCnt_ = 0
		arg_16_1.state_ = "playing"
		arg_16_1.curTalkId_ = 105021004
		arg_16_1.duration_ = 5

		SetActive(arg_16_1.tipsGo_, false)

		function arg_16_1.onSingleLineFinish_()
			arg_16_1.onSingleLineUpdate_ = nil
			arg_16_1.onSingleLineFinish_ = nil
			arg_16_1.state_ = "waiting"
		end

		function arg_16_1.playNext_(arg_18_0)
			if arg_18_0 == 1 then
				arg_16_0:Play105021005(arg_16_1)
			end
		end

		function arg_16_1.onSingleLineUpdate_(arg_19_0)
			local var_19_0 = 0
			local var_19_1 = 1.325

			if var_19_0 < arg_16_1.time_ and arg_16_1.time_ <= var_19_0 + arg_19_0 then
				arg_16_1.talkMaxDuration = 0
				arg_16_1.dialogCg_.alpha = 1

				arg_16_1.dialog_:SetActive(true)
				SetActive(arg_16_1.leftNameGo_, false)

				arg_16_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_16_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_16_1:RecordName(arg_16_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_16_1.iconTrs_.gameObject, false)
				arg_16_1.callingController_:SetSelectedState("normal")

				local var_19_2 = arg_16_1:GetWordFromCfg(105021004)
				local var_19_3 = arg_16_1:FormatText(var_19_2.content)

				arg_16_1.text_.text = var_19_3

				LuaForUtil.ClearLinePrefixSymbol(arg_16_1.text_)

				local var_19_4 = 53
				local var_19_5 = utf8.len(var_19_3)
				local var_19_6 = var_19_4 <= 0 and var_19_1 or var_19_1 * (var_19_5 / var_19_4)

				if var_19_6 > 0 and var_19_1 < var_19_6 then
					arg_16_1.talkMaxDuration = var_19_6

					if var_19_6 + var_19_0 > arg_16_1.duration_ then
						arg_16_1.duration_ = var_19_6 + var_19_0
					end
				end

				arg_16_1.text_.text = var_19_3
				arg_16_1.typewritter.percent = 0

				arg_16_1.typewritter:SetDirty()
				arg_16_1:ShowNextGo(false)
				arg_16_1:RecordContent(arg_16_1.text_.text)
			end

			local var_19_7 = math.max(var_19_1, arg_16_1.talkMaxDuration)

			if var_19_0 <= arg_16_1.time_ and arg_16_1.time_ < var_19_0 + var_19_7 then
				arg_16_1.typewritter.percent = (arg_16_1.time_ - var_19_0) / var_19_7

				arg_16_1.typewritter:SetDirty()
			end

			if arg_16_1.time_ >= var_19_0 + var_19_7 and arg_16_1.time_ < var_19_0 + var_19_7 + arg_19_0 then
				arg_16_1.typewritter.percent = 1

				arg_16_1.typewritter:SetDirty()
				arg_16_1:ShowNextGo(true)
			end
		end
	end,
	Play105021005 = function(arg_20_0, arg_20_1)
		arg_20_1.time_ = 0
		arg_20_1.frameCnt_ = 0
		arg_20_1.state_ = "playing"
		arg_20_1.curTalkId_ = 105021005
		arg_20_1.duration_ = 2.97

		local var_20_0 = {
			ja = 2.966,
			ko = 1.999999999999,
			zh = 2.633,
			en = 2.6
		}
		local var_20_1 = manager.audio:GetLocalizationFlag()

		if var_20_0[var_20_1] ~= nil then
			arg_20_1.duration_ = var_20_0[var_20_1]
		end

		SetActive(arg_20_1.tipsGo_, false)

		function arg_20_1.onSingleLineFinish_()
			arg_20_1.onSingleLineUpdate_ = nil
			arg_20_1.onSingleLineFinish_ = nil
			arg_20_1.state_ = "waiting"
		end

		function arg_20_1.playNext_(arg_22_0)
			if arg_22_0 == 1 then
				arg_20_0:Play105021006(arg_20_1)
			end
		end

		function arg_20_1.onSingleLineUpdate_(arg_23_0)
			local var_23_0 = "10002ui_story"

			if arg_20_1.actors_[var_23_0] == nil then
				local var_23_1 = Object.Instantiate(Asset.Load("Char/" .. var_23_0), arg_20_1.stage_.transform)

				var_23_1.name = var_23_0
				var_23_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_20_1.actors_[var_23_0] = var_23_1

				local var_23_2 = var_23_1:GetComponentInChildren(typeof(CharacterEffect))

				var_23_2.enabled = true

				local var_23_3 = GameObjectTools.GetOrAddComponent(var_23_1, typeof(DynamicBoneHelper))

				if var_23_3 then
					var_23_3:EnableDynamicBone(false)
				end

				arg_20_1:ShowWeapon(var_23_2.transform, false)

				arg_20_1.var_[var_23_0 .. "Animator"] = var_23_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_20_1.var_[var_23_0 .. "Animator"].applyRootMotion = true
				arg_20_1.var_[var_23_0 .. "LipSync"] = var_23_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_23_4 = arg_20_1.actors_["10002ui_story"]
			local var_23_5 = 0

			if var_23_5 < arg_20_1.time_ and arg_20_1.time_ <= var_23_5 + arg_23_0 and arg_20_1.var_.characterEffect10002ui_story == nil then
				arg_20_1.var_.characterEffect10002ui_story = var_23_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_23_6 = 0.1

			if var_23_5 <= arg_20_1.time_ and arg_20_1.time_ < var_23_5 + var_23_6 then
				local var_23_7 = (arg_20_1.time_ - var_23_5) / var_23_6

				if arg_20_1.var_.characterEffect10002ui_story then
					arg_20_1.var_.characterEffect10002ui_story.fillFlat = false
				end
			end

			if arg_20_1.time_ >= var_23_5 + var_23_6 and arg_20_1.time_ < var_23_5 + var_23_6 + arg_23_0 and arg_20_1.var_.characterEffect10002ui_story then
				arg_20_1.var_.characterEffect10002ui_story.fillFlat = false
			end

			local var_23_8 = arg_20_1.actors_["10002ui_story"].transform
			local var_23_9 = 0

			if var_23_9 < arg_20_1.time_ and arg_20_1.time_ <= var_23_9 + arg_23_0 then
				arg_20_1.var_.moveOldPos10002ui_story = var_23_8.localPosition
			end

			local var_23_10 = 0.001

			if var_23_9 <= arg_20_1.time_ and arg_20_1.time_ < var_23_9 + var_23_10 then
				local var_23_11 = (arg_20_1.time_ - var_23_9) / var_23_10
				local var_23_12 = Vector3.New(-0.7, -1.2, -5.8)

				var_23_8.localPosition = Vector3.Lerp(arg_20_1.var_.moveOldPos10002ui_story, var_23_12, var_23_11)

				local var_23_13 = manager.ui.mainCamera.transform.position - var_23_8.position

				var_23_8.forward = Vector3.New(var_23_13.x, var_23_13.y, var_23_13.z)

				local var_23_14 = var_23_8.localEulerAngles

				var_23_14.z = 0
				var_23_14.x = 0
				var_23_8.localEulerAngles = var_23_14
			end

			if arg_20_1.time_ >= var_23_9 + var_23_10 and arg_20_1.time_ < var_23_9 + var_23_10 + arg_23_0 then
				var_23_8.localPosition = Vector3.New(-0.7, -1.2, -5.8)

				local var_23_15 = manager.ui.mainCamera.transform.position - var_23_8.position

				var_23_8.forward = Vector3.New(var_23_15.x, var_23_15.y, var_23_15.z)

				local var_23_16 = var_23_8.localEulerAngles

				var_23_16.z = 0
				var_23_16.x = 0
				var_23_8.localEulerAngles = var_23_16
			end

			local var_23_17 = 0

			if var_23_17 < arg_20_1.time_ and arg_20_1.time_ <= var_23_17 + arg_23_0 then
				arg_20_1:PlayTimeline("10002ui_story", "StoryTimeline/CharAction/story10002/story10002action/10002action5_2")
			end

			local var_23_18 = 0

			if var_23_18 < arg_20_1.time_ and arg_20_1.time_ <= var_23_18 + arg_23_0 then
				arg_20_1:PlayTimeline("10002ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_23_19 = 0
			local var_23_20 = 0.175

			if var_23_19 < arg_20_1.time_ and arg_20_1.time_ <= var_23_19 + arg_23_0 then
				arg_20_1.talkMaxDuration = 0
				arg_20_1.dialogCg_.alpha = 1

				arg_20_1.dialog_:SetActive(true)
				SetActive(arg_20_1.leftNameGo_, true)

				local var_23_21 = arg_20_1:FormatText(StoryNameCfg[39].name)

				arg_20_1.leftNameTxt_.text = var_23_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_20_1.leftNameTxt_.transform)

				arg_20_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_20_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_20_1:RecordName(arg_20_1.leftNameTxt_.text)
				SetActive(arg_20_1.iconTrs_.gameObject, false)
				arg_20_1.callingController_:SetSelectedState("normal")

				local var_23_22 = arg_20_1:GetWordFromCfg(105021005)
				local var_23_23 = arg_20_1:FormatText(var_23_22.content)

				arg_20_1.text_.text = var_23_23

				LuaForUtil.ClearLinePrefixSymbol(arg_20_1.text_)

				local var_23_24 = 7
				local var_23_25 = utf8.len(var_23_23)
				local var_23_26 = var_23_24 <= 0 and var_23_20 or var_23_20 * (var_23_25 / var_23_24)

				if var_23_26 > 0 and var_23_20 < var_23_26 then
					arg_20_1.talkMaxDuration = var_23_26

					if var_23_26 + var_23_19 > arg_20_1.duration_ then
						arg_20_1.duration_ = var_23_26 + var_23_19
					end
				end

				arg_20_1.text_.text = var_23_23
				arg_20_1.typewritter.percent = 0

				arg_20_1.typewritter:SetDirty()
				arg_20_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105021", "105021005", "story_v_out_105021.awb") ~= 0 then
					local var_23_27 = manager.audio:GetVoiceLength("story_v_out_105021", "105021005", "story_v_out_105021.awb") / 1000

					if var_23_27 + var_23_19 > arg_20_1.duration_ then
						arg_20_1.duration_ = var_23_27 + var_23_19
					end

					if var_23_22.prefab_name ~= "" and arg_20_1.actors_[var_23_22.prefab_name] ~= nil then
						local var_23_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_20_1.actors_[var_23_22.prefab_name].transform, "story_v_out_105021", "105021005", "story_v_out_105021.awb")

						arg_20_1:RecordAudio("105021005", var_23_28)
						arg_20_1:RecordAudio("105021005", var_23_28)
					else
						arg_20_1:AudioAction("play", "voice", "story_v_out_105021", "105021005", "story_v_out_105021.awb")
					end

					arg_20_1:RecordHistoryTalkVoice("story_v_out_105021", "105021005", "story_v_out_105021.awb")
				end

				arg_20_1:RecordContent(arg_20_1.text_.text)
			end

			local var_23_29 = math.max(var_23_20, arg_20_1.talkMaxDuration)

			if var_23_19 <= arg_20_1.time_ and arg_20_1.time_ < var_23_19 + var_23_29 then
				arg_20_1.typewritter.percent = (arg_20_1.time_ - var_23_19) / var_23_29

				arg_20_1.typewritter:SetDirty()
			end

			if arg_20_1.time_ >= var_23_19 + var_23_29 and arg_20_1.time_ < var_23_19 + var_23_29 + arg_23_0 then
				arg_20_1.typewritter.percent = 1

				arg_20_1.typewritter:SetDirty()
				arg_20_1:ShowNextGo(true)
			end
		end
	end,
	Play105021006 = function(arg_24_0, arg_24_1)
		arg_24_1.time_ = 0
		arg_24_1.frameCnt_ = 0
		arg_24_1.state_ = "playing"
		arg_24_1.curTalkId_ = 105021006
		arg_24_1.duration_ = 12.7

		local var_24_0 = {
			ja = 12.7,
			ko = 6.7,
			zh = 6.933,
			en = 7.566
		}
		local var_24_1 = manager.audio:GetLocalizationFlag()

		if var_24_0[var_24_1] ~= nil then
			arg_24_1.duration_ = var_24_0[var_24_1]
		end

		SetActive(arg_24_1.tipsGo_, false)

		function arg_24_1.onSingleLineFinish_()
			arg_24_1.onSingleLineUpdate_ = nil
			arg_24_1.onSingleLineFinish_ = nil
			arg_24_1.state_ = "waiting"
		end

		function arg_24_1.playNext_(arg_26_0)
			if arg_26_0 == 1 then
				arg_24_0:Play105021007(arg_24_1)
			end
		end

		function arg_24_1.onSingleLineUpdate_(arg_27_0)
			local var_27_0 = "1013ui_story"

			if arg_24_1.actors_[var_27_0] == nil then
				local var_27_1 = Object.Instantiate(Asset.Load("Char/" .. var_27_0), arg_24_1.stage_.transform)

				var_27_1.name = var_27_0
				var_27_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_24_1.actors_[var_27_0] = var_27_1

				local var_27_2 = var_27_1:GetComponentInChildren(typeof(CharacterEffect))

				var_27_2.enabled = true

				local var_27_3 = GameObjectTools.GetOrAddComponent(var_27_1, typeof(DynamicBoneHelper))

				if var_27_3 then
					var_27_3:EnableDynamicBone(false)
				end

				arg_24_1:ShowWeapon(var_27_2.transform, false)

				arg_24_1.var_[var_27_0 .. "Animator"] = var_27_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_24_1.var_[var_27_0 .. "Animator"].applyRootMotion = true
				arg_24_1.var_[var_27_0 .. "LipSync"] = var_27_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_27_4 = arg_24_1.actors_["1013ui_story"]
			local var_27_5 = 0

			if var_27_5 < arg_24_1.time_ and arg_24_1.time_ <= var_27_5 + arg_27_0 and arg_24_1.var_.characterEffect1013ui_story == nil then
				arg_24_1.var_.characterEffect1013ui_story = var_27_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_27_6 = 0.1

			if var_27_5 <= arg_24_1.time_ and arg_24_1.time_ < var_27_5 + var_27_6 then
				local var_27_7 = (arg_24_1.time_ - var_27_5) / var_27_6

				if arg_24_1.var_.characterEffect1013ui_story then
					arg_24_1.var_.characterEffect1013ui_story.fillFlat = false
				end
			end

			if arg_24_1.time_ >= var_27_5 + var_27_6 and arg_24_1.time_ < var_27_5 + var_27_6 + arg_27_0 and arg_24_1.var_.characterEffect1013ui_story then
				arg_24_1.var_.characterEffect1013ui_story.fillFlat = false
			end

			local var_27_8 = arg_24_1.actors_["10002ui_story"]
			local var_27_9 = 0

			if var_27_9 < arg_24_1.time_ and arg_24_1.time_ <= var_27_9 + arg_27_0 and arg_24_1.var_.characterEffect10002ui_story == nil then
				arg_24_1.var_.characterEffect10002ui_story = var_27_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_27_10 = 0.1

			if var_27_9 <= arg_24_1.time_ and arg_24_1.time_ < var_27_9 + var_27_10 then
				local var_27_11 = (arg_24_1.time_ - var_27_9) / var_27_10

				if arg_24_1.var_.characterEffect10002ui_story then
					local var_27_12 = Mathf.Lerp(0, 0.5, var_27_11)

					arg_24_1.var_.characterEffect10002ui_story.fillFlat = true
					arg_24_1.var_.characterEffect10002ui_story.fillRatio = var_27_12
				end
			end

			if arg_24_1.time_ >= var_27_9 + var_27_10 and arg_24_1.time_ < var_27_9 + var_27_10 + arg_27_0 and arg_24_1.var_.characterEffect10002ui_story then
				local var_27_13 = 0.5

				arg_24_1.var_.characterEffect10002ui_story.fillFlat = true
				arg_24_1.var_.characterEffect10002ui_story.fillRatio = var_27_13
			end

			local var_27_14 = arg_24_1.actors_["1013ui_story"].transform
			local var_27_15 = 0

			if var_27_15 < arg_24_1.time_ and arg_24_1.time_ <= var_27_15 + arg_27_0 then
				arg_24_1.var_.moveOldPos1013ui_story = var_27_14.localPosition
			end

			local var_27_16 = 0.001

			if var_27_15 <= arg_24_1.time_ and arg_24_1.time_ < var_27_15 + var_27_16 then
				local var_27_17 = (arg_24_1.time_ - var_27_15) / var_27_16
				local var_27_18 = Vector3.New(0.7, -0.66, -6.15)

				var_27_14.localPosition = Vector3.Lerp(arg_24_1.var_.moveOldPos1013ui_story, var_27_18, var_27_17)

				local var_27_19 = manager.ui.mainCamera.transform.position - var_27_14.position

				var_27_14.forward = Vector3.New(var_27_19.x, var_27_19.y, var_27_19.z)

				local var_27_20 = var_27_14.localEulerAngles

				var_27_20.z = 0
				var_27_20.x = 0
				var_27_14.localEulerAngles = var_27_20
			end

			if arg_24_1.time_ >= var_27_15 + var_27_16 and arg_24_1.time_ < var_27_15 + var_27_16 + arg_27_0 then
				var_27_14.localPosition = Vector3.New(0.7, -0.66, -6.15)

				local var_27_21 = manager.ui.mainCamera.transform.position - var_27_14.position

				var_27_14.forward = Vector3.New(var_27_21.x, var_27_21.y, var_27_21.z)

				local var_27_22 = var_27_14.localEulerAngles

				var_27_22.z = 0
				var_27_22.x = 0
				var_27_14.localEulerAngles = var_27_22
			end

			local var_27_23 = 0

			if var_27_23 < arg_24_1.time_ and arg_24_1.time_ <= var_27_23 + arg_27_0 then
				arg_24_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/1013/1013action/1013action1_1")
			end

			local var_27_24 = 0

			if var_27_24 < arg_24_1.time_ and arg_24_1.time_ <= var_27_24 + arg_27_0 then
				arg_24_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_27_25 = 0
			local var_27_26 = 0.9

			if var_27_25 < arg_24_1.time_ and arg_24_1.time_ <= var_27_25 + arg_27_0 then
				arg_24_1.talkMaxDuration = 0
				arg_24_1.dialogCg_.alpha = 1

				arg_24_1.dialog_:SetActive(true)
				SetActive(arg_24_1.leftNameGo_, true)

				local var_27_27 = arg_24_1:FormatText(StoryNameCfg[35].name)

				arg_24_1.leftNameTxt_.text = var_27_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_24_1.leftNameTxt_.transform)

				arg_24_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_24_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_24_1:RecordName(arg_24_1.leftNameTxt_.text)
				SetActive(arg_24_1.iconTrs_.gameObject, false)
				arg_24_1.callingController_:SetSelectedState("normal")

				local var_27_28 = arg_24_1:GetWordFromCfg(105021006)
				local var_27_29 = arg_24_1:FormatText(var_27_28.content)

				arg_24_1.text_.text = var_27_29

				LuaForUtil.ClearLinePrefixSymbol(arg_24_1.text_)

				local var_27_30 = 36
				local var_27_31 = utf8.len(var_27_29)
				local var_27_32 = var_27_30 <= 0 and var_27_26 or var_27_26 * (var_27_31 / var_27_30)

				if var_27_32 > 0 and var_27_26 < var_27_32 then
					arg_24_1.talkMaxDuration = var_27_32

					if var_27_32 + var_27_25 > arg_24_1.duration_ then
						arg_24_1.duration_ = var_27_32 + var_27_25
					end
				end

				arg_24_1.text_.text = var_27_29
				arg_24_1.typewritter.percent = 0

				arg_24_1.typewritter:SetDirty()
				arg_24_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105021", "105021006", "story_v_out_105021.awb") ~= 0 then
					local var_27_33 = manager.audio:GetVoiceLength("story_v_out_105021", "105021006", "story_v_out_105021.awb") / 1000

					if var_27_33 + var_27_25 > arg_24_1.duration_ then
						arg_24_1.duration_ = var_27_33 + var_27_25
					end

					if var_27_28.prefab_name ~= "" and arg_24_1.actors_[var_27_28.prefab_name] ~= nil then
						local var_27_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_24_1.actors_[var_27_28.prefab_name].transform, "story_v_out_105021", "105021006", "story_v_out_105021.awb")

						arg_24_1:RecordAudio("105021006", var_27_34)
						arg_24_1:RecordAudio("105021006", var_27_34)
					else
						arg_24_1:AudioAction("play", "voice", "story_v_out_105021", "105021006", "story_v_out_105021.awb")
					end

					arg_24_1:RecordHistoryTalkVoice("story_v_out_105021", "105021006", "story_v_out_105021.awb")
				end

				arg_24_1:RecordContent(arg_24_1.text_.text)
			end

			local var_27_35 = math.max(var_27_26, arg_24_1.talkMaxDuration)

			if var_27_25 <= arg_24_1.time_ and arg_24_1.time_ < var_27_25 + var_27_35 then
				arg_24_1.typewritter.percent = (arg_24_1.time_ - var_27_25) / var_27_35

				arg_24_1.typewritter:SetDirty()
			end

			if arg_24_1.time_ >= var_27_25 + var_27_35 and arg_24_1.time_ < var_27_25 + var_27_35 + arg_27_0 then
				arg_24_1.typewritter.percent = 1

				arg_24_1.typewritter:SetDirty()
				arg_24_1:ShowNextGo(true)
			end
		end
	end,
	Play105021007 = function(arg_28_0, arg_28_1)
		arg_28_1.time_ = 0
		arg_28_1.frameCnt_ = 0
		arg_28_1.state_ = "playing"
		arg_28_1.curTalkId_ = 105021007
		arg_28_1.duration_ = 7.3

		local var_28_0 = {
			ja = 5.266,
			ko = 3.466,
			zh = 2.8,
			en = 7.3
		}
		local var_28_1 = manager.audio:GetLocalizationFlag()

		if var_28_0[var_28_1] ~= nil then
			arg_28_1.duration_ = var_28_0[var_28_1]
		end

		SetActive(arg_28_1.tipsGo_, false)

		function arg_28_1.onSingleLineFinish_()
			arg_28_1.onSingleLineUpdate_ = nil
			arg_28_1.onSingleLineFinish_ = nil
			arg_28_1.state_ = "waiting"
		end

		function arg_28_1.playNext_(arg_30_0)
			if arg_30_0 == 1 then
				arg_28_0:Play105021008(arg_28_1)
			end
		end

		function arg_28_1.onSingleLineUpdate_(arg_31_0)
			local var_31_0 = arg_28_1.actors_["10002ui_story"]
			local var_31_1 = 0

			if var_31_1 < arg_28_1.time_ and arg_28_1.time_ <= var_31_1 + arg_31_0 and arg_28_1.var_.characterEffect10002ui_story == nil then
				arg_28_1.var_.characterEffect10002ui_story = var_31_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_31_2 = 0.1

			if var_31_1 <= arg_28_1.time_ and arg_28_1.time_ < var_31_1 + var_31_2 then
				local var_31_3 = (arg_28_1.time_ - var_31_1) / var_31_2

				if arg_28_1.var_.characterEffect10002ui_story then
					arg_28_1.var_.characterEffect10002ui_story.fillFlat = false
				end
			end

			if arg_28_1.time_ >= var_31_1 + var_31_2 and arg_28_1.time_ < var_31_1 + var_31_2 + arg_31_0 and arg_28_1.var_.characterEffect10002ui_story then
				arg_28_1.var_.characterEffect10002ui_story.fillFlat = false
			end

			local var_31_4 = arg_28_1.actors_["1013ui_story"]
			local var_31_5 = 0

			if var_31_5 < arg_28_1.time_ and arg_28_1.time_ <= var_31_5 + arg_31_0 and arg_28_1.var_.characterEffect1013ui_story == nil then
				arg_28_1.var_.characterEffect1013ui_story = var_31_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_31_6 = 0.1

			if var_31_5 <= arg_28_1.time_ and arg_28_1.time_ < var_31_5 + var_31_6 then
				local var_31_7 = (arg_28_1.time_ - var_31_5) / var_31_6

				if arg_28_1.var_.characterEffect1013ui_story then
					local var_31_8 = Mathf.Lerp(0, 0.5, var_31_7)

					arg_28_1.var_.characterEffect1013ui_story.fillFlat = true
					arg_28_1.var_.characterEffect1013ui_story.fillRatio = var_31_8
				end
			end

			if arg_28_1.time_ >= var_31_5 + var_31_6 and arg_28_1.time_ < var_31_5 + var_31_6 + arg_31_0 and arg_28_1.var_.characterEffect1013ui_story then
				local var_31_9 = 0.5

				arg_28_1.var_.characterEffect1013ui_story.fillFlat = true
				arg_28_1.var_.characterEffect1013ui_story.fillRatio = var_31_9
			end

			local var_31_10 = 0

			if var_31_10 < arg_28_1.time_ and arg_28_1.time_ <= var_31_10 + arg_31_0 then
				arg_28_1:PlayTimeline("10002ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_31_11 = 0
			local var_31_12 = 0.175

			if var_31_11 < arg_28_1.time_ and arg_28_1.time_ <= var_31_11 + arg_31_0 then
				arg_28_1.talkMaxDuration = 0
				arg_28_1.dialogCg_.alpha = 1

				arg_28_1.dialog_:SetActive(true)
				SetActive(arg_28_1.leftNameGo_, true)

				local var_31_13 = arg_28_1:FormatText(StoryNameCfg[39].name)

				arg_28_1.leftNameTxt_.text = var_31_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_28_1.leftNameTxt_.transform)

				arg_28_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_28_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_28_1:RecordName(arg_28_1.leftNameTxt_.text)
				SetActive(arg_28_1.iconTrs_.gameObject, false)
				arg_28_1.callingController_:SetSelectedState("normal")

				local var_31_14 = arg_28_1:GetWordFromCfg(105021007)
				local var_31_15 = arg_28_1:FormatText(var_31_14.content)

				arg_28_1.text_.text = var_31_15

				LuaForUtil.ClearLinePrefixSymbol(arg_28_1.text_)

				local var_31_16 = 7
				local var_31_17 = utf8.len(var_31_15)
				local var_31_18 = var_31_16 <= 0 and var_31_12 or var_31_12 * (var_31_17 / var_31_16)

				if var_31_18 > 0 and var_31_12 < var_31_18 then
					arg_28_1.talkMaxDuration = var_31_18

					if var_31_18 + var_31_11 > arg_28_1.duration_ then
						arg_28_1.duration_ = var_31_18 + var_31_11
					end
				end

				arg_28_1.text_.text = var_31_15
				arg_28_1.typewritter.percent = 0

				arg_28_1.typewritter:SetDirty()
				arg_28_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105021", "105021007", "story_v_out_105021.awb") ~= 0 then
					local var_31_19 = manager.audio:GetVoiceLength("story_v_out_105021", "105021007", "story_v_out_105021.awb") / 1000

					if var_31_19 + var_31_11 > arg_28_1.duration_ then
						arg_28_1.duration_ = var_31_19 + var_31_11
					end

					if var_31_14.prefab_name ~= "" and arg_28_1.actors_[var_31_14.prefab_name] ~= nil then
						local var_31_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_28_1.actors_[var_31_14.prefab_name].transform, "story_v_out_105021", "105021007", "story_v_out_105021.awb")

						arg_28_1:RecordAudio("105021007", var_31_20)
						arg_28_1:RecordAudio("105021007", var_31_20)
					else
						arg_28_1:AudioAction("play", "voice", "story_v_out_105021", "105021007", "story_v_out_105021.awb")
					end

					arg_28_1:RecordHistoryTalkVoice("story_v_out_105021", "105021007", "story_v_out_105021.awb")
				end

				arg_28_1:RecordContent(arg_28_1.text_.text)
			end

			local var_31_21 = math.max(var_31_12, arg_28_1.talkMaxDuration)

			if var_31_11 <= arg_28_1.time_ and arg_28_1.time_ < var_31_11 + var_31_21 then
				arg_28_1.typewritter.percent = (arg_28_1.time_ - var_31_11) / var_31_21

				arg_28_1.typewritter:SetDirty()
			end

			if arg_28_1.time_ >= var_31_11 + var_31_21 and arg_28_1.time_ < var_31_11 + var_31_21 + arg_31_0 then
				arg_28_1.typewritter.percent = 1

				arg_28_1.typewritter:SetDirty()
				arg_28_1:ShowNextGo(true)
			end
		end
	end,
	Play105021008 = function(arg_32_0, arg_32_1)
		arg_32_1.time_ = 0
		arg_32_1.frameCnt_ = 0
		arg_32_1.state_ = "playing"
		arg_32_1.curTalkId_ = 105021008
		arg_32_1.duration_ = 5

		SetActive(arg_32_1.tipsGo_, false)

		function arg_32_1.onSingleLineFinish_()
			arg_32_1.onSingleLineUpdate_ = nil
			arg_32_1.onSingleLineFinish_ = nil
			arg_32_1.state_ = "waiting"
		end

		function arg_32_1.playNext_(arg_34_0)
			if arg_34_0 == 1 then
				arg_32_0:Play105021009(arg_32_1)
			end
		end

		function arg_32_1.onSingleLineUpdate_(arg_35_0)
			local var_35_0 = arg_32_1.actors_["10002ui_story"]
			local var_35_1 = 0

			if var_35_1 < arg_32_1.time_ and arg_32_1.time_ <= var_35_1 + arg_35_0 and arg_32_1.var_.characterEffect10002ui_story == nil then
				arg_32_1.var_.characterEffect10002ui_story = var_35_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_35_2 = 0.1

			if var_35_1 <= arg_32_1.time_ and arg_32_1.time_ < var_35_1 + var_35_2 then
				local var_35_3 = (arg_32_1.time_ - var_35_1) / var_35_2

				if arg_32_1.var_.characterEffect10002ui_story then
					local var_35_4 = Mathf.Lerp(0, 0.5, var_35_3)

					arg_32_1.var_.characterEffect10002ui_story.fillFlat = true
					arg_32_1.var_.characterEffect10002ui_story.fillRatio = var_35_4
				end
			end

			if arg_32_1.time_ >= var_35_1 + var_35_2 and arg_32_1.time_ < var_35_1 + var_35_2 + arg_35_0 and arg_32_1.var_.characterEffect10002ui_story then
				local var_35_5 = 0.5

				arg_32_1.var_.characterEffect10002ui_story.fillFlat = true
				arg_32_1.var_.characterEffect10002ui_story.fillRatio = var_35_5
			end

			local var_35_6 = arg_32_1.actors_["10002ui_story"].transform
			local var_35_7 = 0

			if var_35_7 < arg_32_1.time_ and arg_32_1.time_ <= var_35_7 + arg_35_0 then
				arg_32_1.var_.moveOldPos10002ui_story = var_35_6.localPosition
			end

			local var_35_8 = 0.001

			if var_35_7 <= arg_32_1.time_ and arg_32_1.time_ < var_35_7 + var_35_8 then
				local var_35_9 = (arg_32_1.time_ - var_35_7) / var_35_8
				local var_35_10 = Vector3.New(0, 100, 0)

				var_35_6.localPosition = Vector3.Lerp(arg_32_1.var_.moveOldPos10002ui_story, var_35_10, var_35_9)

				local var_35_11 = manager.ui.mainCamera.transform.position - var_35_6.position

				var_35_6.forward = Vector3.New(var_35_11.x, var_35_11.y, var_35_11.z)

				local var_35_12 = var_35_6.localEulerAngles

				var_35_12.z = 0
				var_35_12.x = 0
				var_35_6.localEulerAngles = var_35_12
			end

			if arg_32_1.time_ >= var_35_7 + var_35_8 and arg_32_1.time_ < var_35_7 + var_35_8 + arg_35_0 then
				var_35_6.localPosition = Vector3.New(0, 100, 0)

				local var_35_13 = manager.ui.mainCamera.transform.position - var_35_6.position

				var_35_6.forward = Vector3.New(var_35_13.x, var_35_13.y, var_35_13.z)

				local var_35_14 = var_35_6.localEulerAngles

				var_35_14.z = 0
				var_35_14.x = 0
				var_35_6.localEulerAngles = var_35_14
			end

			local var_35_15 = arg_32_1.actors_["1013ui_story"].transform
			local var_35_16 = 0

			if var_35_16 < arg_32_1.time_ and arg_32_1.time_ <= var_35_16 + arg_35_0 then
				arg_32_1.var_.moveOldPos1013ui_story = var_35_15.localPosition
			end

			local var_35_17 = 0.001

			if var_35_16 <= arg_32_1.time_ and arg_32_1.time_ < var_35_16 + var_35_17 then
				local var_35_18 = (arg_32_1.time_ - var_35_16) / var_35_17
				local var_35_19 = Vector3.New(0, 100, 0)

				var_35_15.localPosition = Vector3.Lerp(arg_32_1.var_.moveOldPos1013ui_story, var_35_19, var_35_18)

				local var_35_20 = manager.ui.mainCamera.transform.position - var_35_15.position

				var_35_15.forward = Vector3.New(var_35_20.x, var_35_20.y, var_35_20.z)

				local var_35_21 = var_35_15.localEulerAngles

				var_35_21.z = 0
				var_35_21.x = 0
				var_35_15.localEulerAngles = var_35_21
			end

			if arg_32_1.time_ >= var_35_16 + var_35_17 and arg_32_1.time_ < var_35_16 + var_35_17 + arg_35_0 then
				var_35_15.localPosition = Vector3.New(0, 100, 0)

				local var_35_22 = manager.ui.mainCamera.transform.position - var_35_15.position

				var_35_15.forward = Vector3.New(var_35_22.x, var_35_22.y, var_35_22.z)

				local var_35_23 = var_35_15.localEulerAngles

				var_35_23.z = 0
				var_35_23.x = 0
				var_35_15.localEulerAngles = var_35_23
			end

			local var_35_24 = 0
			local var_35_25 = 0.75

			if var_35_24 < arg_32_1.time_ and arg_32_1.time_ <= var_35_24 + arg_35_0 then
				arg_32_1.talkMaxDuration = 0
				arg_32_1.dialogCg_.alpha = 1

				arg_32_1.dialog_:SetActive(true)
				SetActive(arg_32_1.leftNameGo_, false)

				arg_32_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_32_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_32_1:RecordName(arg_32_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_32_1.iconTrs_.gameObject, false)
				arg_32_1.callingController_:SetSelectedState("normal")

				local var_35_26 = arg_32_1:GetWordFromCfg(105021008)
				local var_35_27 = arg_32_1:FormatText(var_35_26.content)

				arg_32_1.text_.text = var_35_27

				LuaForUtil.ClearLinePrefixSymbol(arg_32_1.text_)

				local var_35_28 = 30
				local var_35_29 = utf8.len(var_35_27)
				local var_35_30 = var_35_28 <= 0 and var_35_25 or var_35_25 * (var_35_29 / var_35_28)

				if var_35_30 > 0 and var_35_25 < var_35_30 then
					arg_32_1.talkMaxDuration = var_35_30

					if var_35_30 + var_35_24 > arg_32_1.duration_ then
						arg_32_1.duration_ = var_35_30 + var_35_24
					end
				end

				arg_32_1.text_.text = var_35_27
				arg_32_1.typewritter.percent = 0

				arg_32_1.typewritter:SetDirty()
				arg_32_1:ShowNextGo(false)
				arg_32_1:RecordContent(arg_32_1.text_.text)
			end

			local var_35_31 = math.max(var_35_25, arg_32_1.talkMaxDuration)

			if var_35_24 <= arg_32_1.time_ and arg_32_1.time_ < var_35_24 + var_35_31 then
				arg_32_1.typewritter.percent = (arg_32_1.time_ - var_35_24) / var_35_31

				arg_32_1.typewritter:SetDirty()
			end

			if arg_32_1.time_ >= var_35_24 + var_35_31 and arg_32_1.time_ < var_35_24 + var_35_31 + arg_35_0 then
				arg_32_1.typewritter.percent = 1

				arg_32_1.typewritter:SetDirty()
				arg_32_1:ShowNextGo(true)
			end
		end
	end,
	Play105021009 = function(arg_36_0, arg_36_1)
		arg_36_1.time_ = 0
		arg_36_1.frameCnt_ = 0
		arg_36_1.state_ = "playing"
		arg_36_1.curTalkId_ = 105021009
		arg_36_1.duration_ = 4.67

		local var_36_0 = {
			ja = 4.233,
			ko = 2.9,
			zh = 2.533,
			en = 4.666
		}
		local var_36_1 = manager.audio:GetLocalizationFlag()

		if var_36_0[var_36_1] ~= nil then
			arg_36_1.duration_ = var_36_0[var_36_1]
		end

		SetActive(arg_36_1.tipsGo_, false)

		function arg_36_1.onSingleLineFinish_()
			arg_36_1.onSingleLineUpdate_ = nil
			arg_36_1.onSingleLineFinish_ = nil
			arg_36_1.state_ = "waiting"
		end

		function arg_36_1.playNext_(arg_38_0)
			if arg_38_0 == 1 then
				arg_36_0:Play105021010(arg_36_1)
			end
		end

		function arg_36_1.onSingleLineUpdate_(arg_39_0)
			local var_39_0 = arg_36_1.actors_["10002ui_story"]
			local var_39_1 = 0

			if var_39_1 < arg_36_1.time_ and arg_36_1.time_ <= var_39_1 + arg_39_0 and arg_36_1.var_.characterEffect10002ui_story == nil then
				arg_36_1.var_.characterEffect10002ui_story = var_39_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_39_2 = 0.1

			if var_39_1 <= arg_36_1.time_ and arg_36_1.time_ < var_39_1 + var_39_2 then
				local var_39_3 = (arg_36_1.time_ - var_39_1) / var_39_2

				if arg_36_1.var_.characterEffect10002ui_story then
					arg_36_1.var_.characterEffect10002ui_story.fillFlat = false
				end
			end

			if arg_36_1.time_ >= var_39_1 + var_39_2 and arg_36_1.time_ < var_39_1 + var_39_2 + arg_39_0 and arg_36_1.var_.characterEffect10002ui_story then
				arg_36_1.var_.characterEffect10002ui_story.fillFlat = false
			end

			local var_39_4 = arg_36_1.actors_["10002ui_story"].transform
			local var_39_5 = 0

			if var_39_5 < arg_36_1.time_ and arg_36_1.time_ <= var_39_5 + arg_39_0 then
				arg_36_1.var_.moveOldPos10002ui_story = var_39_4.localPosition
			end

			local var_39_6 = 0.001

			if var_39_5 <= arg_36_1.time_ and arg_36_1.time_ < var_39_5 + var_39_6 then
				local var_39_7 = (arg_36_1.time_ - var_39_5) / var_39_6
				local var_39_8 = Vector3.New(0, -1.2, -5.8)

				var_39_4.localPosition = Vector3.Lerp(arg_36_1.var_.moveOldPos10002ui_story, var_39_8, var_39_7)

				local var_39_9 = manager.ui.mainCamera.transform.position - var_39_4.position

				var_39_4.forward = Vector3.New(var_39_9.x, var_39_9.y, var_39_9.z)

				local var_39_10 = var_39_4.localEulerAngles

				var_39_10.z = 0
				var_39_10.x = 0
				var_39_4.localEulerAngles = var_39_10
			end

			if arg_36_1.time_ >= var_39_5 + var_39_6 and arg_36_1.time_ < var_39_5 + var_39_6 + arg_39_0 then
				var_39_4.localPosition = Vector3.New(0, -1.2, -5.8)

				local var_39_11 = manager.ui.mainCamera.transform.position - var_39_4.position

				var_39_4.forward = Vector3.New(var_39_11.x, var_39_11.y, var_39_11.z)

				local var_39_12 = var_39_4.localEulerAngles

				var_39_12.z = 0
				var_39_12.x = 0
				var_39_4.localEulerAngles = var_39_12
			end

			local var_39_13 = 0

			if var_39_13 < arg_36_1.time_ and arg_36_1.time_ <= var_39_13 + arg_39_0 then
				arg_36_1:PlayTimeline("10002ui_story", "StoryTimeline/CharAction/story10002/story10002action/10002action5_2")
			end

			local var_39_14 = 0

			if var_39_14 < arg_36_1.time_ and arg_36_1.time_ <= var_39_14 + arg_39_0 then
				arg_36_1:PlayTimeline("10002ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_39_15 = 0
			local var_39_16 = 0.275

			if var_39_15 < arg_36_1.time_ and arg_36_1.time_ <= var_39_15 + arg_39_0 then
				arg_36_1.talkMaxDuration = 0
				arg_36_1.dialogCg_.alpha = 1

				arg_36_1.dialog_:SetActive(true)
				SetActive(arg_36_1.leftNameGo_, true)

				local var_39_17 = arg_36_1:FormatText(StoryNameCfg[39].name)

				arg_36_1.leftNameTxt_.text = var_39_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_36_1.leftNameTxt_.transform)

				arg_36_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_36_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_36_1:RecordName(arg_36_1.leftNameTxt_.text)
				SetActive(arg_36_1.iconTrs_.gameObject, false)
				arg_36_1.callingController_:SetSelectedState("normal")

				local var_39_18 = arg_36_1:GetWordFromCfg(105021009)
				local var_39_19 = arg_36_1:FormatText(var_39_18.content)

				arg_36_1.text_.text = var_39_19

				LuaForUtil.ClearLinePrefixSymbol(arg_36_1.text_)

				local var_39_20 = 11
				local var_39_21 = utf8.len(var_39_19)
				local var_39_22 = var_39_20 <= 0 and var_39_16 or var_39_16 * (var_39_21 / var_39_20)

				if var_39_22 > 0 and var_39_16 < var_39_22 then
					arg_36_1.talkMaxDuration = var_39_22

					if var_39_22 + var_39_15 > arg_36_1.duration_ then
						arg_36_1.duration_ = var_39_22 + var_39_15
					end
				end

				arg_36_1.text_.text = var_39_19
				arg_36_1.typewritter.percent = 0

				arg_36_1.typewritter:SetDirty()
				arg_36_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105021", "105021009", "story_v_out_105021.awb") ~= 0 then
					local var_39_23 = manager.audio:GetVoiceLength("story_v_out_105021", "105021009", "story_v_out_105021.awb") / 1000

					if var_39_23 + var_39_15 > arg_36_1.duration_ then
						arg_36_1.duration_ = var_39_23 + var_39_15
					end

					if var_39_18.prefab_name ~= "" and arg_36_1.actors_[var_39_18.prefab_name] ~= nil then
						local var_39_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_36_1.actors_[var_39_18.prefab_name].transform, "story_v_out_105021", "105021009", "story_v_out_105021.awb")

						arg_36_1:RecordAudio("105021009", var_39_24)
						arg_36_1:RecordAudio("105021009", var_39_24)
					else
						arg_36_1:AudioAction("play", "voice", "story_v_out_105021", "105021009", "story_v_out_105021.awb")
					end

					arg_36_1:RecordHistoryTalkVoice("story_v_out_105021", "105021009", "story_v_out_105021.awb")
				end

				arg_36_1:RecordContent(arg_36_1.text_.text)
			end

			local var_39_25 = math.max(var_39_16, arg_36_1.talkMaxDuration)

			if var_39_15 <= arg_36_1.time_ and arg_36_1.time_ < var_39_15 + var_39_25 then
				arg_36_1.typewritter.percent = (arg_36_1.time_ - var_39_15) / var_39_25

				arg_36_1.typewritter:SetDirty()
			end

			if arg_36_1.time_ >= var_39_15 + var_39_25 and arg_36_1.time_ < var_39_15 + var_39_25 + arg_39_0 then
				arg_36_1.typewritter.percent = 1

				arg_36_1.typewritter:SetDirty()
				arg_36_1:ShowNextGo(true)
			end
		end
	end,
	Play105021010 = function(arg_40_0, arg_40_1)
		arg_40_1.time_ = 0
		arg_40_1.frameCnt_ = 0
		arg_40_1.state_ = "playing"
		arg_40_1.curTalkId_ = 105021010
		arg_40_1.duration_ = 8

		local var_40_0 = {
			ja = 8,
			ko = 6.666,
			zh = 6.733,
			en = 5.233
		}
		local var_40_1 = manager.audio:GetLocalizationFlag()

		if var_40_0[var_40_1] ~= nil then
			arg_40_1.duration_ = var_40_0[var_40_1]
		end

		SetActive(arg_40_1.tipsGo_, false)

		function arg_40_1.onSingleLineFinish_()
			arg_40_1.onSingleLineUpdate_ = nil
			arg_40_1.onSingleLineFinish_ = nil
			arg_40_1.state_ = "waiting"
		end

		function arg_40_1.playNext_(arg_42_0)
			if arg_42_0 == 1 then
				arg_40_0:Play105021011(arg_40_1)
			end
		end

		function arg_40_1.onSingleLineUpdate_(arg_43_0)
			local var_43_0 = arg_40_1.actors_["1013ui_story"]
			local var_43_1 = 0

			if var_43_1 < arg_40_1.time_ and arg_40_1.time_ <= var_43_1 + arg_43_0 and arg_40_1.var_.characterEffect1013ui_story == nil then
				arg_40_1.var_.characterEffect1013ui_story = var_43_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_43_2 = 0.1

			if var_43_1 <= arg_40_1.time_ and arg_40_1.time_ < var_43_1 + var_43_2 then
				local var_43_3 = (arg_40_1.time_ - var_43_1) / var_43_2

				if arg_40_1.var_.characterEffect1013ui_story then
					arg_40_1.var_.characterEffect1013ui_story.fillFlat = false
				end
			end

			if arg_40_1.time_ >= var_43_1 + var_43_2 and arg_40_1.time_ < var_43_1 + var_43_2 + arg_43_0 and arg_40_1.var_.characterEffect1013ui_story then
				arg_40_1.var_.characterEffect1013ui_story.fillFlat = false
			end

			local var_43_4 = arg_40_1.actors_["10002ui_story"]
			local var_43_5 = 0

			if var_43_5 < arg_40_1.time_ and arg_40_1.time_ <= var_43_5 + arg_43_0 and arg_40_1.var_.characterEffect10002ui_story == nil then
				arg_40_1.var_.characterEffect10002ui_story = var_43_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_43_6 = 0.1

			if var_43_5 <= arg_40_1.time_ and arg_40_1.time_ < var_43_5 + var_43_6 then
				local var_43_7 = (arg_40_1.time_ - var_43_5) / var_43_6

				if arg_40_1.var_.characterEffect10002ui_story then
					local var_43_8 = Mathf.Lerp(0, 0.5, var_43_7)

					arg_40_1.var_.characterEffect10002ui_story.fillFlat = true
					arg_40_1.var_.characterEffect10002ui_story.fillRatio = var_43_8
				end
			end

			if arg_40_1.time_ >= var_43_5 + var_43_6 and arg_40_1.time_ < var_43_5 + var_43_6 + arg_43_0 and arg_40_1.var_.characterEffect10002ui_story then
				local var_43_9 = 0.5

				arg_40_1.var_.characterEffect10002ui_story.fillFlat = true
				arg_40_1.var_.characterEffect10002ui_story.fillRatio = var_43_9
			end

			local var_43_10 = arg_40_1.actors_["10002ui_story"].transform
			local var_43_11 = 0

			if var_43_11 < arg_40_1.time_ and arg_40_1.time_ <= var_43_11 + arg_43_0 then
				arg_40_1.var_.moveOldPos10002ui_story = var_43_10.localPosition
			end

			local var_43_12 = 0.001

			if var_43_11 <= arg_40_1.time_ and arg_40_1.time_ < var_43_11 + var_43_12 then
				local var_43_13 = (arg_40_1.time_ - var_43_11) / var_43_12
				local var_43_14 = Vector3.New(0, 100, 0)

				var_43_10.localPosition = Vector3.Lerp(arg_40_1.var_.moveOldPos10002ui_story, var_43_14, var_43_13)

				local var_43_15 = manager.ui.mainCamera.transform.position - var_43_10.position

				var_43_10.forward = Vector3.New(var_43_15.x, var_43_15.y, var_43_15.z)

				local var_43_16 = var_43_10.localEulerAngles

				var_43_16.z = 0
				var_43_16.x = 0
				var_43_10.localEulerAngles = var_43_16
			end

			if arg_40_1.time_ >= var_43_11 + var_43_12 and arg_40_1.time_ < var_43_11 + var_43_12 + arg_43_0 then
				var_43_10.localPosition = Vector3.New(0, 100, 0)

				local var_43_17 = manager.ui.mainCamera.transform.position - var_43_10.position

				var_43_10.forward = Vector3.New(var_43_17.x, var_43_17.y, var_43_17.z)

				local var_43_18 = var_43_10.localEulerAngles

				var_43_18.z = 0
				var_43_18.x = 0
				var_43_10.localEulerAngles = var_43_18
			end

			local var_43_19 = arg_40_1.actors_["1013ui_story"].transform
			local var_43_20 = 0

			if var_43_20 < arg_40_1.time_ and arg_40_1.time_ <= var_43_20 + arg_43_0 then
				arg_40_1.var_.moveOldPos1013ui_story = var_43_19.localPosition
			end

			local var_43_21 = 0.001

			if var_43_20 <= arg_40_1.time_ and arg_40_1.time_ < var_43_20 + var_43_21 then
				local var_43_22 = (arg_40_1.time_ - var_43_20) / var_43_21
				local var_43_23 = Vector3.New(0, -0.66, -6.15)

				var_43_19.localPosition = Vector3.Lerp(arg_40_1.var_.moveOldPos1013ui_story, var_43_23, var_43_22)

				local var_43_24 = manager.ui.mainCamera.transform.position - var_43_19.position

				var_43_19.forward = Vector3.New(var_43_24.x, var_43_24.y, var_43_24.z)

				local var_43_25 = var_43_19.localEulerAngles

				var_43_25.z = 0
				var_43_25.x = 0
				var_43_19.localEulerAngles = var_43_25
			end

			if arg_40_1.time_ >= var_43_20 + var_43_21 and arg_40_1.time_ < var_43_20 + var_43_21 + arg_43_0 then
				var_43_19.localPosition = Vector3.New(0, -0.66, -6.15)

				local var_43_26 = manager.ui.mainCamera.transform.position - var_43_19.position

				var_43_19.forward = Vector3.New(var_43_26.x, var_43_26.y, var_43_26.z)

				local var_43_27 = var_43_19.localEulerAngles

				var_43_27.z = 0
				var_43_27.x = 0
				var_43_19.localEulerAngles = var_43_27
			end

			local var_43_28 = 0

			if var_43_28 < arg_40_1.time_ and arg_40_1.time_ <= var_43_28 + arg_43_0 then
				arg_40_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/1013/1013action/1013action10_1")
			end

			local var_43_29 = 0

			if var_43_29 < arg_40_1.time_ and arg_40_1.time_ <= var_43_29 + arg_43_0 then
				arg_40_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_43_30 = 0
			local var_43_31 = 0.8

			if var_43_30 < arg_40_1.time_ and arg_40_1.time_ <= var_43_30 + arg_43_0 then
				arg_40_1.talkMaxDuration = 0
				arg_40_1.dialogCg_.alpha = 1

				arg_40_1.dialog_:SetActive(true)
				SetActive(arg_40_1.leftNameGo_, true)

				local var_43_32 = arg_40_1:FormatText(StoryNameCfg[35].name)

				arg_40_1.leftNameTxt_.text = var_43_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_40_1.leftNameTxt_.transform)

				arg_40_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_40_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_40_1:RecordName(arg_40_1.leftNameTxt_.text)
				SetActive(arg_40_1.iconTrs_.gameObject, false)
				arg_40_1.callingController_:SetSelectedState("normal")

				local var_43_33 = arg_40_1:GetWordFromCfg(105021010)
				local var_43_34 = arg_40_1:FormatText(var_43_33.content)

				arg_40_1.text_.text = var_43_34

				LuaForUtil.ClearLinePrefixSymbol(arg_40_1.text_)

				local var_43_35 = 30
				local var_43_36 = utf8.len(var_43_34)
				local var_43_37 = var_43_35 <= 0 and var_43_31 or var_43_31 * (var_43_36 / var_43_35)

				if var_43_37 > 0 and var_43_31 < var_43_37 then
					arg_40_1.talkMaxDuration = var_43_37

					if var_43_37 + var_43_30 > arg_40_1.duration_ then
						arg_40_1.duration_ = var_43_37 + var_43_30
					end
				end

				arg_40_1.text_.text = var_43_34
				arg_40_1.typewritter.percent = 0

				arg_40_1.typewritter:SetDirty()
				arg_40_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105021", "105021010", "story_v_out_105021.awb") ~= 0 then
					local var_43_38 = manager.audio:GetVoiceLength("story_v_out_105021", "105021010", "story_v_out_105021.awb") / 1000

					if var_43_38 + var_43_30 > arg_40_1.duration_ then
						arg_40_1.duration_ = var_43_38 + var_43_30
					end

					if var_43_33.prefab_name ~= "" and arg_40_1.actors_[var_43_33.prefab_name] ~= nil then
						local var_43_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_40_1.actors_[var_43_33.prefab_name].transform, "story_v_out_105021", "105021010", "story_v_out_105021.awb")

						arg_40_1:RecordAudio("105021010", var_43_39)
						arg_40_1:RecordAudio("105021010", var_43_39)
					else
						arg_40_1:AudioAction("play", "voice", "story_v_out_105021", "105021010", "story_v_out_105021.awb")
					end

					arg_40_1:RecordHistoryTalkVoice("story_v_out_105021", "105021010", "story_v_out_105021.awb")
				end

				arg_40_1:RecordContent(arg_40_1.text_.text)
			end

			local var_43_40 = math.max(var_43_31, arg_40_1.talkMaxDuration)

			if var_43_30 <= arg_40_1.time_ and arg_40_1.time_ < var_43_30 + var_43_40 then
				arg_40_1.typewritter.percent = (arg_40_1.time_ - var_43_30) / var_43_40

				arg_40_1.typewritter:SetDirty()
			end

			if arg_40_1.time_ >= var_43_30 + var_43_40 and arg_40_1.time_ < var_43_30 + var_43_40 + arg_43_0 then
				arg_40_1.typewritter.percent = 1

				arg_40_1.typewritter:SetDirty()
				arg_40_1:ShowNextGo(true)
			end
		end
	end,
	Play105021011 = function(arg_44_0, arg_44_1)
		arg_44_1.time_ = 0
		arg_44_1.frameCnt_ = 0
		arg_44_1.state_ = "playing"
		arg_44_1.curTalkId_ = 105021011
		arg_44_1.duration_ = 3.13

		local var_44_0 = {
			ja = 1.999999999999,
			ko = 1.999999999999,
			zh = 3.133,
			en = 1.999999999999
		}
		local var_44_1 = manager.audio:GetLocalizationFlag()

		if var_44_0[var_44_1] ~= nil then
			arg_44_1.duration_ = var_44_0[var_44_1]
		end

		SetActive(arg_44_1.tipsGo_, false)

		function arg_44_1.onSingleLineFinish_()
			arg_44_1.onSingleLineUpdate_ = nil
			arg_44_1.onSingleLineFinish_ = nil
			arg_44_1.state_ = "waiting"
		end

		function arg_44_1.playNext_(arg_46_0)
			if arg_46_0 == 1 then
				arg_44_0:Play105021012(arg_44_1)
			end
		end

		function arg_44_1.onSingleLineUpdate_(arg_47_0)
			local var_47_0 = arg_44_1.actors_["1013ui_story"]
			local var_47_1 = 0

			if var_47_1 < arg_44_1.time_ and arg_44_1.time_ <= var_47_1 + arg_47_0 and arg_44_1.var_.characterEffect1013ui_story == nil then
				arg_44_1.var_.characterEffect1013ui_story = var_47_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_47_2 = 0.1

			if var_47_1 <= arg_44_1.time_ and arg_44_1.time_ < var_47_1 + var_47_2 then
				local var_47_3 = (arg_44_1.time_ - var_47_1) / var_47_2

				if arg_44_1.var_.characterEffect1013ui_story then
					local var_47_4 = Mathf.Lerp(0, 0.5, var_47_3)

					arg_44_1.var_.characterEffect1013ui_story.fillFlat = true
					arg_44_1.var_.characterEffect1013ui_story.fillRatio = var_47_4
				end
			end

			if arg_44_1.time_ >= var_47_1 + var_47_2 and arg_44_1.time_ < var_47_1 + var_47_2 + arg_47_0 and arg_44_1.var_.characterEffect1013ui_story then
				local var_47_5 = 0.5

				arg_44_1.var_.characterEffect1013ui_story.fillFlat = true
				arg_44_1.var_.characterEffect1013ui_story.fillRatio = var_47_5
			end

			local var_47_6 = 0

			if var_47_6 < arg_44_1.time_ and arg_44_1.time_ <= var_47_6 + arg_47_0 then
				arg_44_1:PlayTimeline("10002ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_47_7 = 0
			local var_47_8 = 0.05

			if var_47_7 < arg_44_1.time_ and arg_44_1.time_ <= var_47_7 + arg_47_0 then
				arg_44_1.talkMaxDuration = 0
				arg_44_1.dialogCg_.alpha = 1

				arg_44_1.dialog_:SetActive(true)
				SetActive(arg_44_1.leftNameGo_, true)

				local var_47_9 = arg_44_1:FormatText(StoryNameCfg[39].name)

				arg_44_1.leftNameTxt_.text = var_47_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_44_1.leftNameTxt_.transform)

				arg_44_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_44_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_44_1:RecordName(arg_44_1.leftNameTxt_.text)
				SetActive(arg_44_1.iconTrs_.gameObject, true)
				arg_44_1.iconController_:SetSelectedState("hero")

				arg_44_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_Jolin")

				arg_44_1.callingController_:SetSelectedState("normal")

				arg_44_1.keyicon_.color = Color.New(1, 1, 1)
				arg_44_1.icon_.color = Color.New(1, 1, 1)

				local var_47_10 = arg_44_1:GetWordFromCfg(105021011)
				local var_47_11 = arg_44_1:FormatText(var_47_10.content)

				arg_44_1.text_.text = var_47_11

				LuaForUtil.ClearLinePrefixSymbol(arg_44_1.text_)

				local var_47_12 = 2
				local var_47_13 = utf8.len(var_47_11)
				local var_47_14 = var_47_12 <= 0 and var_47_8 or var_47_8 * (var_47_13 / var_47_12)

				if var_47_14 > 0 and var_47_8 < var_47_14 then
					arg_44_1.talkMaxDuration = var_47_14

					if var_47_14 + var_47_7 > arg_44_1.duration_ then
						arg_44_1.duration_ = var_47_14 + var_47_7
					end
				end

				arg_44_1.text_.text = var_47_11
				arg_44_1.typewritter.percent = 0

				arg_44_1.typewritter:SetDirty()
				arg_44_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105021", "105021011", "story_v_out_105021.awb") ~= 0 then
					local var_47_15 = manager.audio:GetVoiceLength("story_v_out_105021", "105021011", "story_v_out_105021.awb") / 1000

					if var_47_15 + var_47_7 > arg_44_1.duration_ then
						arg_44_1.duration_ = var_47_15 + var_47_7
					end

					if var_47_10.prefab_name ~= "" and arg_44_1.actors_[var_47_10.prefab_name] ~= nil then
						local var_47_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_44_1.actors_[var_47_10.prefab_name].transform, "story_v_out_105021", "105021011", "story_v_out_105021.awb")

						arg_44_1:RecordAudio("105021011", var_47_16)
						arg_44_1:RecordAudio("105021011", var_47_16)
					else
						arg_44_1:AudioAction("play", "voice", "story_v_out_105021", "105021011", "story_v_out_105021.awb")
					end

					arg_44_1:RecordHistoryTalkVoice("story_v_out_105021", "105021011", "story_v_out_105021.awb")
				end

				arg_44_1:RecordContent(arg_44_1.text_.text)
			end

			local var_47_17 = math.max(var_47_8, arg_44_1.talkMaxDuration)

			if var_47_7 <= arg_44_1.time_ and arg_44_1.time_ < var_47_7 + var_47_17 then
				arg_44_1.typewritter.percent = (arg_44_1.time_ - var_47_7) / var_47_17

				arg_44_1.typewritter:SetDirty()
			end

			if arg_44_1.time_ >= var_47_7 + var_47_17 and arg_44_1.time_ < var_47_7 + var_47_17 + arg_47_0 then
				arg_44_1.typewritter.percent = 1

				arg_44_1.typewritter:SetDirty()
				arg_44_1:ShowNextGo(true)
			end
		end
	end,
	Play105021012 = function(arg_48_0, arg_48_1)
		arg_48_1.time_ = 0
		arg_48_1.frameCnt_ = 0
		arg_48_1.state_ = "playing"
		arg_48_1.curTalkId_ = 105021012
		arg_48_1.duration_ = 5

		SetActive(arg_48_1.tipsGo_, false)

		function arg_48_1.onSingleLineFinish_()
			arg_48_1.onSingleLineUpdate_ = nil
			arg_48_1.onSingleLineFinish_ = nil
			arg_48_1.state_ = "waiting"
		end

		function arg_48_1.playNext_(arg_50_0)
			if arg_50_0 == 1 then
				arg_48_0:Play105021013(arg_48_1)
			end
		end

		function arg_48_1.onSingleLineUpdate_(arg_51_0)
			local var_51_0 = arg_48_1.actors_["10002ui_story"].transform
			local var_51_1 = 0

			if var_51_1 < arg_48_1.time_ and arg_48_1.time_ <= var_51_1 + arg_51_0 then
				arg_48_1.var_.moveOldPos10002ui_story = var_51_0.localPosition
			end

			local var_51_2 = 0.001

			if var_51_1 <= arg_48_1.time_ and arg_48_1.time_ < var_51_1 + var_51_2 then
				local var_51_3 = (arg_48_1.time_ - var_51_1) / var_51_2
				local var_51_4 = Vector3.New(0, 100, 0)

				var_51_0.localPosition = Vector3.Lerp(arg_48_1.var_.moveOldPos10002ui_story, var_51_4, var_51_3)

				local var_51_5 = manager.ui.mainCamera.transform.position - var_51_0.position

				var_51_0.forward = Vector3.New(var_51_5.x, var_51_5.y, var_51_5.z)

				local var_51_6 = var_51_0.localEulerAngles

				var_51_6.z = 0
				var_51_6.x = 0
				var_51_0.localEulerAngles = var_51_6
			end

			if arg_48_1.time_ >= var_51_1 + var_51_2 and arg_48_1.time_ < var_51_1 + var_51_2 + arg_51_0 then
				var_51_0.localPosition = Vector3.New(0, 100, 0)

				local var_51_7 = manager.ui.mainCamera.transform.position - var_51_0.position

				var_51_0.forward = Vector3.New(var_51_7.x, var_51_7.y, var_51_7.z)

				local var_51_8 = var_51_0.localEulerAngles

				var_51_8.z = 0
				var_51_8.x = 0
				var_51_0.localEulerAngles = var_51_8
			end

			local var_51_9 = arg_48_1.actors_["1013ui_story"].transform
			local var_51_10 = 0

			if var_51_10 < arg_48_1.time_ and arg_48_1.time_ <= var_51_10 + arg_51_0 then
				arg_48_1.var_.moveOldPos1013ui_story = var_51_9.localPosition
			end

			local var_51_11 = 0.001

			if var_51_10 <= arg_48_1.time_ and arg_48_1.time_ < var_51_10 + var_51_11 then
				local var_51_12 = (arg_48_1.time_ - var_51_10) / var_51_11
				local var_51_13 = Vector3.New(0, 100, 0)

				var_51_9.localPosition = Vector3.Lerp(arg_48_1.var_.moveOldPos1013ui_story, var_51_13, var_51_12)

				local var_51_14 = manager.ui.mainCamera.transform.position - var_51_9.position

				var_51_9.forward = Vector3.New(var_51_14.x, var_51_14.y, var_51_14.z)

				local var_51_15 = var_51_9.localEulerAngles

				var_51_15.z = 0
				var_51_15.x = 0
				var_51_9.localEulerAngles = var_51_15
			end

			if arg_48_1.time_ >= var_51_10 + var_51_11 and arg_48_1.time_ < var_51_10 + var_51_11 + arg_51_0 then
				var_51_9.localPosition = Vector3.New(0, 100, 0)

				local var_51_16 = manager.ui.mainCamera.transform.position - var_51_9.position

				var_51_9.forward = Vector3.New(var_51_16.x, var_51_16.y, var_51_16.z)

				local var_51_17 = var_51_9.localEulerAngles

				var_51_17.z = 0
				var_51_17.x = 0
				var_51_9.localEulerAngles = var_51_17
			end

			local var_51_18 = 0
			local var_51_19 = 0.8

			if var_51_18 < arg_48_1.time_ and arg_48_1.time_ <= var_51_18 + arg_51_0 then
				arg_48_1.talkMaxDuration = 0
				arg_48_1.dialogCg_.alpha = 1

				arg_48_1.dialog_:SetActive(true)
				SetActive(arg_48_1.leftNameGo_, false)

				arg_48_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_48_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_48_1:RecordName(arg_48_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_48_1.iconTrs_.gameObject, false)
				arg_48_1.callingController_:SetSelectedState("normal")

				local var_51_20 = arg_48_1:GetWordFromCfg(105021012)
				local var_51_21 = arg_48_1:FormatText(var_51_20.content)

				arg_48_1.text_.text = var_51_21

				LuaForUtil.ClearLinePrefixSymbol(arg_48_1.text_)

				local var_51_22 = 32
				local var_51_23 = utf8.len(var_51_21)
				local var_51_24 = var_51_22 <= 0 and var_51_19 or var_51_19 * (var_51_23 / var_51_22)

				if var_51_24 > 0 and var_51_19 < var_51_24 then
					arg_48_1.talkMaxDuration = var_51_24

					if var_51_24 + var_51_18 > arg_48_1.duration_ then
						arg_48_1.duration_ = var_51_24 + var_51_18
					end
				end

				arg_48_1.text_.text = var_51_21
				arg_48_1.typewritter.percent = 0

				arg_48_1.typewritter:SetDirty()
				arg_48_1:ShowNextGo(false)
				arg_48_1:RecordContent(arg_48_1.text_.text)
			end

			local var_51_25 = math.max(var_51_19, arg_48_1.talkMaxDuration)

			if var_51_18 <= arg_48_1.time_ and arg_48_1.time_ < var_51_18 + var_51_25 then
				arg_48_1.typewritter.percent = (arg_48_1.time_ - var_51_18) / var_51_25

				arg_48_1.typewritter:SetDirty()
			end

			if arg_48_1.time_ >= var_51_18 + var_51_25 and arg_48_1.time_ < var_51_18 + var_51_25 + arg_51_0 then
				arg_48_1.typewritter.percent = 1

				arg_48_1.typewritter:SetDirty()
				arg_48_1:ShowNextGo(true)
			end
		end
	end,
	Play105021013 = function(arg_52_0, arg_52_1)
		arg_52_1.time_ = 0
		arg_52_1.frameCnt_ = 0
		arg_52_1.state_ = "playing"
		arg_52_1.curTalkId_ = 105021013
		arg_52_1.duration_ = 2.1

		local var_52_0 = {
			ja = 1.999999999999,
			ko = 2.1,
			zh = 1.999999999999,
			en = 1.999999999999
		}
		local var_52_1 = manager.audio:GetLocalizationFlag()

		if var_52_0[var_52_1] ~= nil then
			arg_52_1.duration_ = var_52_0[var_52_1]
		end

		SetActive(arg_52_1.tipsGo_, false)

		function arg_52_1.onSingleLineFinish_()
			arg_52_1.onSingleLineUpdate_ = nil
			arg_52_1.onSingleLineFinish_ = nil
			arg_52_1.state_ = "waiting"
		end

		function arg_52_1.playNext_(arg_54_0)
			if arg_54_0 == 1 then
				arg_52_0:Play105021014(arg_52_1)
			end
		end

		function arg_52_1.onSingleLineUpdate_(arg_55_0)
			local var_55_0 = arg_52_1.actors_["1013ui_story"]
			local var_55_1 = 0

			if var_55_1 < arg_52_1.time_ and arg_52_1.time_ <= var_55_1 + arg_55_0 and arg_52_1.var_.characterEffect1013ui_story == nil then
				arg_52_1.var_.characterEffect1013ui_story = var_55_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_55_2 = 0.1

			if var_55_1 <= arg_52_1.time_ and arg_52_1.time_ < var_55_1 + var_55_2 then
				local var_55_3 = (arg_52_1.time_ - var_55_1) / var_55_2

				if arg_52_1.var_.characterEffect1013ui_story then
					arg_52_1.var_.characterEffect1013ui_story.fillFlat = false
				end
			end

			if arg_52_1.time_ >= var_55_1 + var_55_2 and arg_52_1.time_ < var_55_1 + var_55_2 + arg_55_0 and arg_52_1.var_.characterEffect1013ui_story then
				arg_52_1.var_.characterEffect1013ui_story.fillFlat = false
			end

			local var_55_4 = arg_52_1.actors_["1013ui_story"].transform
			local var_55_5 = 0

			if var_55_5 < arg_52_1.time_ and arg_52_1.time_ <= var_55_5 + arg_55_0 then
				arg_52_1.var_.moveOldPos1013ui_story = var_55_4.localPosition
			end

			local var_55_6 = 0.001

			if var_55_5 <= arg_52_1.time_ and arg_52_1.time_ < var_55_5 + var_55_6 then
				local var_55_7 = (arg_52_1.time_ - var_55_5) / var_55_6
				local var_55_8 = Vector3.New(-0.7, -0.66, -6.15)

				var_55_4.localPosition = Vector3.Lerp(arg_52_1.var_.moveOldPos1013ui_story, var_55_8, var_55_7)

				local var_55_9 = manager.ui.mainCamera.transform.position - var_55_4.position

				var_55_4.forward = Vector3.New(var_55_9.x, var_55_9.y, var_55_9.z)

				local var_55_10 = var_55_4.localEulerAngles

				var_55_10.z = 0
				var_55_10.x = 0
				var_55_4.localEulerAngles = var_55_10
			end

			if arg_52_1.time_ >= var_55_5 + var_55_6 and arg_52_1.time_ < var_55_5 + var_55_6 + arg_55_0 then
				var_55_4.localPosition = Vector3.New(-0.7, -0.66, -6.15)

				local var_55_11 = manager.ui.mainCamera.transform.position - var_55_4.position

				var_55_4.forward = Vector3.New(var_55_11.x, var_55_11.y, var_55_11.z)

				local var_55_12 = var_55_4.localEulerAngles

				var_55_12.z = 0
				var_55_12.x = 0
				var_55_4.localEulerAngles = var_55_12
			end

			local var_55_13 = 0

			if var_55_13 < arg_52_1.time_ and arg_52_1.time_ <= var_55_13 + arg_55_0 then
				arg_52_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/1013/1013action/1013action2_1")
			end

			local var_55_14 = 0

			if var_55_14 < arg_52_1.time_ and arg_52_1.time_ <= var_55_14 + arg_55_0 then
				arg_52_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_55_15 = 0
			local var_55_16 = 0.175

			if var_55_15 < arg_52_1.time_ and arg_52_1.time_ <= var_55_15 + arg_55_0 then
				arg_52_1.talkMaxDuration = 0
				arg_52_1.dialogCg_.alpha = 1

				arg_52_1.dialog_:SetActive(true)
				SetActive(arg_52_1.leftNameGo_, true)

				local var_55_17 = arg_52_1:FormatText(StoryNameCfg[35].name)

				arg_52_1.leftNameTxt_.text = var_55_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_52_1.leftNameTxt_.transform)

				arg_52_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_52_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_52_1:RecordName(arg_52_1.leftNameTxt_.text)
				SetActive(arg_52_1.iconTrs_.gameObject, false)
				arg_52_1.callingController_:SetSelectedState("normal")

				local var_55_18 = arg_52_1:GetWordFromCfg(105021013)
				local var_55_19 = arg_52_1:FormatText(var_55_18.content)

				arg_52_1.text_.text = var_55_19

				LuaForUtil.ClearLinePrefixSymbol(arg_52_1.text_)

				local var_55_20 = 7
				local var_55_21 = utf8.len(var_55_19)
				local var_55_22 = var_55_20 <= 0 and var_55_16 or var_55_16 * (var_55_21 / var_55_20)

				if var_55_22 > 0 and var_55_16 < var_55_22 then
					arg_52_1.talkMaxDuration = var_55_22

					if var_55_22 + var_55_15 > arg_52_1.duration_ then
						arg_52_1.duration_ = var_55_22 + var_55_15
					end
				end

				arg_52_1.text_.text = var_55_19
				arg_52_1.typewritter.percent = 0

				arg_52_1.typewritter:SetDirty()
				arg_52_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105021", "105021013", "story_v_out_105021.awb") ~= 0 then
					local var_55_23 = manager.audio:GetVoiceLength("story_v_out_105021", "105021013", "story_v_out_105021.awb") / 1000

					if var_55_23 + var_55_15 > arg_52_1.duration_ then
						arg_52_1.duration_ = var_55_23 + var_55_15
					end

					if var_55_18.prefab_name ~= "" and arg_52_1.actors_[var_55_18.prefab_name] ~= nil then
						local var_55_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_52_1.actors_[var_55_18.prefab_name].transform, "story_v_out_105021", "105021013", "story_v_out_105021.awb")

						arg_52_1:RecordAudio("105021013", var_55_24)
						arg_52_1:RecordAudio("105021013", var_55_24)
					else
						arg_52_1:AudioAction("play", "voice", "story_v_out_105021", "105021013", "story_v_out_105021.awb")
					end

					arg_52_1:RecordHistoryTalkVoice("story_v_out_105021", "105021013", "story_v_out_105021.awb")
				end

				arg_52_1:RecordContent(arg_52_1.text_.text)
			end

			local var_55_25 = math.max(var_55_16, arg_52_1.talkMaxDuration)

			if var_55_15 <= arg_52_1.time_ and arg_52_1.time_ < var_55_15 + var_55_25 then
				arg_52_1.typewritter.percent = (arg_52_1.time_ - var_55_15) / var_55_25

				arg_52_1.typewritter:SetDirty()
			end

			if arg_52_1.time_ >= var_55_15 + var_55_25 and arg_52_1.time_ < var_55_15 + var_55_25 + arg_55_0 then
				arg_52_1.typewritter.percent = 1

				arg_52_1.typewritter:SetDirty()
				arg_52_1:ShowNextGo(true)
			end
		end
	end,
	Play105021014 = function(arg_56_0, arg_56_1)
		arg_56_1.time_ = 0
		arg_56_1.frameCnt_ = 0
		arg_56_1.state_ = "playing"
		arg_56_1.curTalkId_ = 105021014
		arg_56_1.duration_ = 5.3

		local var_56_0 = {
			ja = 3.5,
			ko = 5.1,
			zh = 5.3,
			en = 5.1
		}
		local var_56_1 = manager.audio:GetLocalizationFlag()

		if var_56_0[var_56_1] ~= nil then
			arg_56_1.duration_ = var_56_0[var_56_1]
		end

		SetActive(arg_56_1.tipsGo_, false)

		function arg_56_1.onSingleLineFinish_()
			arg_56_1.onSingleLineUpdate_ = nil
			arg_56_1.onSingleLineFinish_ = nil
			arg_56_1.state_ = "waiting"
		end

		function arg_56_1.playNext_(arg_58_0)
			if arg_58_0 == 1 then
				arg_56_0:Play105021015(arg_56_1)
			end
		end

		function arg_56_1.onSingleLineUpdate_(arg_59_0)
			local var_59_0 = arg_56_1.actors_["10002ui_story"]
			local var_59_1 = 0

			if var_59_1 < arg_56_1.time_ and arg_56_1.time_ <= var_59_1 + arg_59_0 and arg_56_1.var_.characterEffect10002ui_story == nil then
				arg_56_1.var_.characterEffect10002ui_story = var_59_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_59_2 = 0.1

			if var_59_1 <= arg_56_1.time_ and arg_56_1.time_ < var_59_1 + var_59_2 then
				local var_59_3 = (arg_56_1.time_ - var_59_1) / var_59_2

				if arg_56_1.var_.characterEffect10002ui_story then
					arg_56_1.var_.characterEffect10002ui_story.fillFlat = false
				end
			end

			if arg_56_1.time_ >= var_59_1 + var_59_2 and arg_56_1.time_ < var_59_1 + var_59_2 + arg_59_0 and arg_56_1.var_.characterEffect10002ui_story then
				arg_56_1.var_.characterEffect10002ui_story.fillFlat = false
			end

			local var_59_4 = arg_56_1.actors_["1013ui_story"]
			local var_59_5 = 0

			if var_59_5 < arg_56_1.time_ and arg_56_1.time_ <= var_59_5 + arg_59_0 and arg_56_1.var_.characterEffect1013ui_story == nil then
				arg_56_1.var_.characterEffect1013ui_story = var_59_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_59_6 = 0.1

			if var_59_5 <= arg_56_1.time_ and arg_56_1.time_ < var_59_5 + var_59_6 then
				local var_59_7 = (arg_56_1.time_ - var_59_5) / var_59_6

				if arg_56_1.var_.characterEffect1013ui_story then
					local var_59_8 = Mathf.Lerp(0, 0.5, var_59_7)

					arg_56_1.var_.characterEffect1013ui_story.fillFlat = true
					arg_56_1.var_.characterEffect1013ui_story.fillRatio = var_59_8
				end
			end

			if arg_56_1.time_ >= var_59_5 + var_59_6 and arg_56_1.time_ < var_59_5 + var_59_6 + arg_59_0 and arg_56_1.var_.characterEffect1013ui_story then
				local var_59_9 = 0.5

				arg_56_1.var_.characterEffect1013ui_story.fillFlat = true
				arg_56_1.var_.characterEffect1013ui_story.fillRatio = var_59_9
			end

			local var_59_10 = arg_56_1.actors_["10002ui_story"].transform
			local var_59_11 = 0

			if var_59_11 < arg_56_1.time_ and arg_56_1.time_ <= var_59_11 + arg_59_0 then
				arg_56_1.var_.moveOldPos10002ui_story = var_59_10.localPosition
			end

			local var_59_12 = 0.001

			if var_59_11 <= arg_56_1.time_ and arg_56_1.time_ < var_59_11 + var_59_12 then
				local var_59_13 = (arg_56_1.time_ - var_59_11) / var_59_12
				local var_59_14 = Vector3.New(0.7, -1.2, -5.8)

				var_59_10.localPosition = Vector3.Lerp(arg_56_1.var_.moveOldPos10002ui_story, var_59_14, var_59_13)

				local var_59_15 = manager.ui.mainCamera.transform.position - var_59_10.position

				var_59_10.forward = Vector3.New(var_59_15.x, var_59_15.y, var_59_15.z)

				local var_59_16 = var_59_10.localEulerAngles

				var_59_16.z = 0
				var_59_16.x = 0
				var_59_10.localEulerAngles = var_59_16
			end

			if arg_56_1.time_ >= var_59_11 + var_59_12 and arg_56_1.time_ < var_59_11 + var_59_12 + arg_59_0 then
				var_59_10.localPosition = Vector3.New(0.7, -1.2, -5.8)

				local var_59_17 = manager.ui.mainCamera.transform.position - var_59_10.position

				var_59_10.forward = Vector3.New(var_59_17.x, var_59_17.y, var_59_17.z)

				local var_59_18 = var_59_10.localEulerAngles

				var_59_18.z = 0
				var_59_18.x = 0
				var_59_10.localEulerAngles = var_59_18
			end

			local var_59_19 = 0

			if var_59_19 < arg_56_1.time_ and arg_56_1.time_ <= var_59_19 + arg_59_0 then
				arg_56_1:PlayTimeline("10002ui_story", "StoryTimeline/CharAction/story10002/story10002action/10002action1_1")
			end

			local var_59_20 = 0

			if var_59_20 < arg_56_1.time_ and arg_56_1.time_ <= var_59_20 + arg_59_0 then
				arg_56_1:PlayTimeline("10002ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_59_21 = 0
			local var_59_22 = 0.375

			if var_59_21 < arg_56_1.time_ and arg_56_1.time_ <= var_59_21 + arg_59_0 then
				arg_56_1.talkMaxDuration = 0
				arg_56_1.dialogCg_.alpha = 1

				arg_56_1.dialog_:SetActive(true)
				SetActive(arg_56_1.leftNameGo_, true)

				local var_59_23 = arg_56_1:FormatText(StoryNameCfg[39].name)

				arg_56_1.leftNameTxt_.text = var_59_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_56_1.leftNameTxt_.transform)

				arg_56_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_56_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_56_1:RecordName(arg_56_1.leftNameTxt_.text)
				SetActive(arg_56_1.iconTrs_.gameObject, false)
				arg_56_1.callingController_:SetSelectedState("normal")

				local var_59_24 = arg_56_1:GetWordFromCfg(105021014)
				local var_59_25 = arg_56_1:FormatText(var_59_24.content)

				arg_56_1.text_.text = var_59_25

				LuaForUtil.ClearLinePrefixSymbol(arg_56_1.text_)

				local var_59_26 = 15
				local var_59_27 = utf8.len(var_59_25)
				local var_59_28 = var_59_26 <= 0 and var_59_22 or var_59_22 * (var_59_27 / var_59_26)

				if var_59_28 > 0 and var_59_22 < var_59_28 then
					arg_56_1.talkMaxDuration = var_59_28

					if var_59_28 + var_59_21 > arg_56_1.duration_ then
						arg_56_1.duration_ = var_59_28 + var_59_21
					end
				end

				arg_56_1.text_.text = var_59_25
				arg_56_1.typewritter.percent = 0

				arg_56_1.typewritter:SetDirty()
				arg_56_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105021", "105021014", "story_v_out_105021.awb") ~= 0 then
					local var_59_29 = manager.audio:GetVoiceLength("story_v_out_105021", "105021014", "story_v_out_105021.awb") / 1000

					if var_59_29 + var_59_21 > arg_56_1.duration_ then
						arg_56_1.duration_ = var_59_29 + var_59_21
					end

					if var_59_24.prefab_name ~= "" and arg_56_1.actors_[var_59_24.prefab_name] ~= nil then
						local var_59_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_56_1.actors_[var_59_24.prefab_name].transform, "story_v_out_105021", "105021014", "story_v_out_105021.awb")

						arg_56_1:RecordAudio("105021014", var_59_30)
						arg_56_1:RecordAudio("105021014", var_59_30)
					else
						arg_56_1:AudioAction("play", "voice", "story_v_out_105021", "105021014", "story_v_out_105021.awb")
					end

					arg_56_1:RecordHistoryTalkVoice("story_v_out_105021", "105021014", "story_v_out_105021.awb")
				end

				arg_56_1:RecordContent(arg_56_1.text_.text)
			end

			local var_59_31 = math.max(var_59_22, arg_56_1.talkMaxDuration)

			if var_59_21 <= arg_56_1.time_ and arg_56_1.time_ < var_59_21 + var_59_31 then
				arg_56_1.typewritter.percent = (arg_56_1.time_ - var_59_21) / var_59_31

				arg_56_1.typewritter:SetDirty()
			end

			if arg_56_1.time_ >= var_59_21 + var_59_31 and arg_56_1.time_ < var_59_21 + var_59_31 + arg_59_0 then
				arg_56_1.typewritter.percent = 1

				arg_56_1.typewritter:SetDirty()
				arg_56_1:ShowNextGo(true)
			end
		end
	end,
	Play105021015 = function(arg_60_0, arg_60_1)
		arg_60_1.time_ = 0
		arg_60_1.frameCnt_ = 0
		arg_60_1.state_ = "playing"
		arg_60_1.curTalkId_ = 105021015
		arg_60_1.duration_ = 6.33

		local var_60_0 = {
			ja = 6.333,
			ko = 3.566,
			zh = 5.066,
			en = 4.3
		}
		local var_60_1 = manager.audio:GetLocalizationFlag()

		if var_60_0[var_60_1] ~= nil then
			arg_60_1.duration_ = var_60_0[var_60_1]
		end

		SetActive(arg_60_1.tipsGo_, false)

		function arg_60_1.onSingleLineFinish_()
			arg_60_1.onSingleLineUpdate_ = nil
			arg_60_1.onSingleLineFinish_ = nil
			arg_60_1.state_ = "waiting"
		end

		function arg_60_1.playNext_(arg_62_0)
			if arg_62_0 == 1 then
				arg_60_0:Play105021016(arg_60_1)
			end
		end

		function arg_60_1.onSingleLineUpdate_(arg_63_0)
			local var_63_0 = arg_60_1.actors_["1013ui_story"]
			local var_63_1 = 0

			if var_63_1 < arg_60_1.time_ and arg_60_1.time_ <= var_63_1 + arg_63_0 and arg_60_1.var_.characterEffect1013ui_story == nil then
				arg_60_1.var_.characterEffect1013ui_story = var_63_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_63_2 = 0.1

			if var_63_1 <= arg_60_1.time_ and arg_60_1.time_ < var_63_1 + var_63_2 then
				local var_63_3 = (arg_60_1.time_ - var_63_1) / var_63_2

				if arg_60_1.var_.characterEffect1013ui_story then
					arg_60_1.var_.characterEffect1013ui_story.fillFlat = false
				end
			end

			if arg_60_1.time_ >= var_63_1 + var_63_2 and arg_60_1.time_ < var_63_1 + var_63_2 + arg_63_0 and arg_60_1.var_.characterEffect1013ui_story then
				arg_60_1.var_.characterEffect1013ui_story.fillFlat = false
			end

			local var_63_4 = arg_60_1.actors_["10002ui_story"]
			local var_63_5 = 0

			if var_63_5 < arg_60_1.time_ and arg_60_1.time_ <= var_63_5 + arg_63_0 and arg_60_1.var_.characterEffect10002ui_story == nil then
				arg_60_1.var_.characterEffect10002ui_story = var_63_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_63_6 = 0.1

			if var_63_5 <= arg_60_1.time_ and arg_60_1.time_ < var_63_5 + var_63_6 then
				local var_63_7 = (arg_60_1.time_ - var_63_5) / var_63_6

				if arg_60_1.var_.characterEffect10002ui_story then
					local var_63_8 = Mathf.Lerp(0, 0.5, var_63_7)

					arg_60_1.var_.characterEffect10002ui_story.fillFlat = true
					arg_60_1.var_.characterEffect10002ui_story.fillRatio = var_63_8
				end
			end

			if arg_60_1.time_ >= var_63_5 + var_63_6 and arg_60_1.time_ < var_63_5 + var_63_6 + arg_63_0 and arg_60_1.var_.characterEffect10002ui_story then
				local var_63_9 = 0.5

				arg_60_1.var_.characterEffect10002ui_story.fillFlat = true
				arg_60_1.var_.characterEffect10002ui_story.fillRatio = var_63_9
			end

			local var_63_10 = 0

			if var_63_10 < arg_60_1.time_ and arg_60_1.time_ <= var_63_10 + arg_63_0 then
				arg_60_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/1013/1013actionlink/1013action423")
			end

			local var_63_11 = 0

			if var_63_11 < arg_60_1.time_ and arg_60_1.time_ <= var_63_11 + arg_63_0 then
				arg_60_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_63_12 = 0
			local var_63_13 = 0.525

			if var_63_12 < arg_60_1.time_ and arg_60_1.time_ <= var_63_12 + arg_63_0 then
				arg_60_1.talkMaxDuration = 0
				arg_60_1.dialogCg_.alpha = 1

				arg_60_1.dialog_:SetActive(true)
				SetActive(arg_60_1.leftNameGo_, true)

				local var_63_14 = arg_60_1:FormatText(StoryNameCfg[35].name)

				arg_60_1.leftNameTxt_.text = var_63_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_60_1.leftNameTxt_.transform)

				arg_60_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_60_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_60_1:RecordName(arg_60_1.leftNameTxt_.text)
				SetActive(arg_60_1.iconTrs_.gameObject, false)
				arg_60_1.callingController_:SetSelectedState("normal")

				local var_63_15 = arg_60_1:GetWordFromCfg(105021015)
				local var_63_16 = arg_60_1:FormatText(var_63_15.content)

				arg_60_1.text_.text = var_63_16

				LuaForUtil.ClearLinePrefixSymbol(arg_60_1.text_)

				local var_63_17 = 21
				local var_63_18 = utf8.len(var_63_16)
				local var_63_19 = var_63_17 <= 0 and var_63_13 or var_63_13 * (var_63_18 / var_63_17)

				if var_63_19 > 0 and var_63_13 < var_63_19 then
					arg_60_1.talkMaxDuration = var_63_19

					if var_63_19 + var_63_12 > arg_60_1.duration_ then
						arg_60_1.duration_ = var_63_19 + var_63_12
					end
				end

				arg_60_1.text_.text = var_63_16
				arg_60_1.typewritter.percent = 0

				arg_60_1.typewritter:SetDirty()
				arg_60_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105021", "105021015", "story_v_out_105021.awb") ~= 0 then
					local var_63_20 = manager.audio:GetVoiceLength("story_v_out_105021", "105021015", "story_v_out_105021.awb") / 1000

					if var_63_20 + var_63_12 > arg_60_1.duration_ then
						arg_60_1.duration_ = var_63_20 + var_63_12
					end

					if var_63_15.prefab_name ~= "" and arg_60_1.actors_[var_63_15.prefab_name] ~= nil then
						local var_63_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_60_1.actors_[var_63_15.prefab_name].transform, "story_v_out_105021", "105021015", "story_v_out_105021.awb")

						arg_60_1:RecordAudio("105021015", var_63_21)
						arg_60_1:RecordAudio("105021015", var_63_21)
					else
						arg_60_1:AudioAction("play", "voice", "story_v_out_105021", "105021015", "story_v_out_105021.awb")
					end

					arg_60_1:RecordHistoryTalkVoice("story_v_out_105021", "105021015", "story_v_out_105021.awb")
				end

				arg_60_1:RecordContent(arg_60_1.text_.text)
			end

			local var_63_22 = math.max(var_63_13, arg_60_1.talkMaxDuration)

			if var_63_12 <= arg_60_1.time_ and arg_60_1.time_ < var_63_12 + var_63_22 then
				arg_60_1.typewritter.percent = (arg_60_1.time_ - var_63_12) / var_63_22

				arg_60_1.typewritter:SetDirty()
			end

			if arg_60_1.time_ >= var_63_12 + var_63_22 and arg_60_1.time_ < var_63_12 + var_63_22 + arg_63_0 then
				arg_60_1.typewritter.percent = 1

				arg_60_1.typewritter:SetDirty()
				arg_60_1:ShowNextGo(true)
			end
		end
	end,
	Play105021016 = function(arg_64_0, arg_64_1)
		arg_64_1.time_ = 0
		arg_64_1.frameCnt_ = 0
		arg_64_1.state_ = "playing"
		arg_64_1.curTalkId_ = 105021016
		arg_64_1.duration_ = 4

		local var_64_0 = {
			ja = 4,
			ko = 2.733,
			zh = 2.466,
			en = 2.433
		}
		local var_64_1 = manager.audio:GetLocalizationFlag()

		if var_64_0[var_64_1] ~= nil then
			arg_64_1.duration_ = var_64_0[var_64_1]
		end

		SetActive(arg_64_1.tipsGo_, false)

		function arg_64_1.onSingleLineFinish_()
			arg_64_1.onSingleLineUpdate_ = nil
			arg_64_1.onSingleLineFinish_ = nil
			arg_64_1.state_ = "waiting"
		end

		function arg_64_1.playNext_(arg_66_0)
			if arg_66_0 == 1 then
				arg_64_0:Play105021017(arg_64_1)
			end
		end

		function arg_64_1.onSingleLineUpdate_(arg_67_0)
			local var_67_0 = arg_64_1.actors_["10002ui_story"]
			local var_67_1 = 0

			if var_67_1 < arg_64_1.time_ and arg_64_1.time_ <= var_67_1 + arg_67_0 and arg_64_1.var_.characterEffect10002ui_story == nil then
				arg_64_1.var_.characterEffect10002ui_story = var_67_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_67_2 = 0.1

			if var_67_1 <= arg_64_1.time_ and arg_64_1.time_ < var_67_1 + var_67_2 then
				local var_67_3 = (arg_64_1.time_ - var_67_1) / var_67_2

				if arg_64_1.var_.characterEffect10002ui_story then
					arg_64_1.var_.characterEffect10002ui_story.fillFlat = false
				end
			end

			if arg_64_1.time_ >= var_67_1 + var_67_2 and arg_64_1.time_ < var_67_1 + var_67_2 + arg_67_0 and arg_64_1.var_.characterEffect10002ui_story then
				arg_64_1.var_.characterEffect10002ui_story.fillFlat = false
			end

			local var_67_4 = arg_64_1.actors_["1013ui_story"]
			local var_67_5 = 0

			if var_67_5 < arg_64_1.time_ and arg_64_1.time_ <= var_67_5 + arg_67_0 and arg_64_1.var_.characterEffect1013ui_story == nil then
				arg_64_1.var_.characterEffect1013ui_story = var_67_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_67_6 = 0.1

			if var_67_5 <= arg_64_1.time_ and arg_64_1.time_ < var_67_5 + var_67_6 then
				local var_67_7 = (arg_64_1.time_ - var_67_5) / var_67_6

				if arg_64_1.var_.characterEffect1013ui_story then
					local var_67_8 = Mathf.Lerp(0, 0.5, var_67_7)

					arg_64_1.var_.characterEffect1013ui_story.fillFlat = true
					arg_64_1.var_.characterEffect1013ui_story.fillRatio = var_67_8
				end
			end

			if arg_64_1.time_ >= var_67_5 + var_67_6 and arg_64_1.time_ < var_67_5 + var_67_6 + arg_67_0 and arg_64_1.var_.characterEffect1013ui_story then
				local var_67_9 = 0.5

				arg_64_1.var_.characterEffect1013ui_story.fillFlat = true
				arg_64_1.var_.characterEffect1013ui_story.fillRatio = var_67_9
			end

			local var_67_10 = 0

			if var_67_10 < arg_64_1.time_ and arg_64_1.time_ <= var_67_10 + arg_67_0 then
				arg_64_1:PlayTimeline("10002ui_story", "StoryTimeline/CharAction/story10002/story10002action/10002action3_1")
			end

			local var_67_11 = 0

			if var_67_11 < arg_64_1.time_ and arg_64_1.time_ <= var_67_11 + arg_67_0 then
				arg_64_1:PlayTimeline("10002ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_67_12 = 0
			local var_67_13 = 0.275

			if var_67_12 < arg_64_1.time_ and arg_64_1.time_ <= var_67_12 + arg_67_0 then
				arg_64_1.talkMaxDuration = 0
				arg_64_1.dialogCg_.alpha = 1

				arg_64_1.dialog_:SetActive(true)
				SetActive(arg_64_1.leftNameGo_, true)

				local var_67_14 = arg_64_1:FormatText(StoryNameCfg[39].name)

				arg_64_1.leftNameTxt_.text = var_67_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_64_1.leftNameTxt_.transform)

				arg_64_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_64_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_64_1:RecordName(arg_64_1.leftNameTxt_.text)
				SetActive(arg_64_1.iconTrs_.gameObject, false)
				arg_64_1.callingController_:SetSelectedState("normal")

				local var_67_15 = arg_64_1:GetWordFromCfg(105021016)
				local var_67_16 = arg_64_1:FormatText(var_67_15.content)

				arg_64_1.text_.text = var_67_16

				LuaForUtil.ClearLinePrefixSymbol(arg_64_1.text_)

				local var_67_17 = 11
				local var_67_18 = utf8.len(var_67_16)
				local var_67_19 = var_67_17 <= 0 and var_67_13 or var_67_13 * (var_67_18 / var_67_17)

				if var_67_19 > 0 and var_67_13 < var_67_19 then
					arg_64_1.talkMaxDuration = var_67_19

					if var_67_19 + var_67_12 > arg_64_1.duration_ then
						arg_64_1.duration_ = var_67_19 + var_67_12
					end
				end

				arg_64_1.text_.text = var_67_16
				arg_64_1.typewritter.percent = 0

				arg_64_1.typewritter:SetDirty()
				arg_64_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105021", "105021016", "story_v_out_105021.awb") ~= 0 then
					local var_67_20 = manager.audio:GetVoiceLength("story_v_out_105021", "105021016", "story_v_out_105021.awb") / 1000

					if var_67_20 + var_67_12 > arg_64_1.duration_ then
						arg_64_1.duration_ = var_67_20 + var_67_12
					end

					if var_67_15.prefab_name ~= "" and arg_64_1.actors_[var_67_15.prefab_name] ~= nil then
						local var_67_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_64_1.actors_[var_67_15.prefab_name].transform, "story_v_out_105021", "105021016", "story_v_out_105021.awb")

						arg_64_1:RecordAudio("105021016", var_67_21)
						arg_64_1:RecordAudio("105021016", var_67_21)
					else
						arg_64_1:AudioAction("play", "voice", "story_v_out_105021", "105021016", "story_v_out_105021.awb")
					end

					arg_64_1:RecordHistoryTalkVoice("story_v_out_105021", "105021016", "story_v_out_105021.awb")
				end

				arg_64_1:RecordContent(arg_64_1.text_.text)
			end

			local var_67_22 = math.max(var_67_13, arg_64_1.talkMaxDuration)

			if var_67_12 <= arg_64_1.time_ and arg_64_1.time_ < var_67_12 + var_67_22 then
				arg_64_1.typewritter.percent = (arg_64_1.time_ - var_67_12) / var_67_22

				arg_64_1.typewritter:SetDirty()
			end

			if arg_64_1.time_ >= var_67_12 + var_67_22 and arg_64_1.time_ < var_67_12 + var_67_22 + arg_67_0 then
				arg_64_1.typewritter.percent = 1

				arg_64_1.typewritter:SetDirty()
				arg_64_1:ShowNextGo(true)
			end
		end
	end,
	Play105021017 = function(arg_68_0, arg_68_1)
		arg_68_1.time_ = 0
		arg_68_1.frameCnt_ = 0
		arg_68_1.state_ = "playing"
		arg_68_1.curTalkId_ = 105021017
		arg_68_1.duration_ = 6.13

		local var_68_0 = {
			ja = 6.133,
			ko = 3.533,
			zh = 3.666,
			en = 2.9
		}
		local var_68_1 = manager.audio:GetLocalizationFlag()

		if var_68_0[var_68_1] ~= nil then
			arg_68_1.duration_ = var_68_0[var_68_1]
		end

		SetActive(arg_68_1.tipsGo_, false)

		function arg_68_1.onSingleLineFinish_()
			arg_68_1.onSingleLineUpdate_ = nil
			arg_68_1.onSingleLineFinish_ = nil
			arg_68_1.state_ = "waiting"
		end

		function arg_68_1.playNext_(arg_70_0)
			if arg_70_0 == 1 then
				arg_68_0:Play105021018(arg_68_1)
			end
		end

		function arg_68_1.onSingleLineUpdate_(arg_71_0)
			local var_71_0 = arg_68_1.actors_["1013ui_story"]
			local var_71_1 = 0

			if var_71_1 < arg_68_1.time_ and arg_68_1.time_ <= var_71_1 + arg_71_0 and arg_68_1.var_.characterEffect1013ui_story == nil then
				arg_68_1.var_.characterEffect1013ui_story = var_71_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_71_2 = 0.1

			if var_71_1 <= arg_68_1.time_ and arg_68_1.time_ < var_71_1 + var_71_2 then
				local var_71_3 = (arg_68_1.time_ - var_71_1) / var_71_2

				if arg_68_1.var_.characterEffect1013ui_story then
					arg_68_1.var_.characterEffect1013ui_story.fillFlat = false
				end
			end

			if arg_68_1.time_ >= var_71_1 + var_71_2 and arg_68_1.time_ < var_71_1 + var_71_2 + arg_71_0 and arg_68_1.var_.characterEffect1013ui_story then
				arg_68_1.var_.characterEffect1013ui_story.fillFlat = false
			end

			local var_71_4 = arg_68_1.actors_["10002ui_story"]
			local var_71_5 = 0

			if var_71_5 < arg_68_1.time_ and arg_68_1.time_ <= var_71_5 + arg_71_0 and arg_68_1.var_.characterEffect10002ui_story == nil then
				arg_68_1.var_.characterEffect10002ui_story = var_71_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_71_6 = 0.1

			if var_71_5 <= arg_68_1.time_ and arg_68_1.time_ < var_71_5 + var_71_6 then
				local var_71_7 = (arg_68_1.time_ - var_71_5) / var_71_6

				if arg_68_1.var_.characterEffect10002ui_story then
					local var_71_8 = Mathf.Lerp(0, 0.5, var_71_7)

					arg_68_1.var_.characterEffect10002ui_story.fillFlat = true
					arg_68_1.var_.characterEffect10002ui_story.fillRatio = var_71_8
				end
			end

			if arg_68_1.time_ >= var_71_5 + var_71_6 and arg_68_1.time_ < var_71_5 + var_71_6 + arg_71_0 and arg_68_1.var_.characterEffect10002ui_story then
				local var_71_9 = 0.5

				arg_68_1.var_.characterEffect10002ui_story.fillFlat = true
				arg_68_1.var_.characterEffect10002ui_story.fillRatio = var_71_9
			end

			local var_71_10 = 0

			if var_71_10 < arg_68_1.time_ and arg_68_1.time_ <= var_71_10 + arg_71_0 then
				arg_68_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/1013/1013actionlink/1013action4310")
			end

			local var_71_11 = 0

			if var_71_11 < arg_68_1.time_ and arg_68_1.time_ <= var_71_11 + arg_71_0 then
				arg_68_1:PlayTimeline("1013ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_71_12 = 0
			local var_71_13 = 0.425

			if var_71_12 < arg_68_1.time_ and arg_68_1.time_ <= var_71_12 + arg_71_0 then
				arg_68_1.talkMaxDuration = 0
				arg_68_1.dialogCg_.alpha = 1

				arg_68_1.dialog_:SetActive(true)
				SetActive(arg_68_1.leftNameGo_, true)

				local var_71_14 = arg_68_1:FormatText(StoryNameCfg[35].name)

				arg_68_1.leftNameTxt_.text = var_71_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_68_1.leftNameTxt_.transform)

				arg_68_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_68_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_68_1:RecordName(arg_68_1.leftNameTxt_.text)
				SetActive(arg_68_1.iconTrs_.gameObject, false)
				arg_68_1.callingController_:SetSelectedState("normal")

				local var_71_15 = arg_68_1:GetWordFromCfg(105021017)
				local var_71_16 = arg_68_1:FormatText(var_71_15.content)

				arg_68_1.text_.text = var_71_16

				LuaForUtil.ClearLinePrefixSymbol(arg_68_1.text_)

				local var_71_17 = 17
				local var_71_18 = utf8.len(var_71_16)
				local var_71_19 = var_71_17 <= 0 and var_71_13 or var_71_13 * (var_71_18 / var_71_17)

				if var_71_19 > 0 and var_71_13 < var_71_19 then
					arg_68_1.talkMaxDuration = var_71_19

					if var_71_19 + var_71_12 > arg_68_1.duration_ then
						arg_68_1.duration_ = var_71_19 + var_71_12
					end
				end

				arg_68_1.text_.text = var_71_16
				arg_68_1.typewritter.percent = 0

				arg_68_1.typewritter:SetDirty()
				arg_68_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105021", "105021017", "story_v_out_105021.awb") ~= 0 then
					local var_71_20 = manager.audio:GetVoiceLength("story_v_out_105021", "105021017", "story_v_out_105021.awb") / 1000

					if var_71_20 + var_71_12 > arg_68_1.duration_ then
						arg_68_1.duration_ = var_71_20 + var_71_12
					end

					if var_71_15.prefab_name ~= "" and arg_68_1.actors_[var_71_15.prefab_name] ~= nil then
						local var_71_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_68_1.actors_[var_71_15.prefab_name].transform, "story_v_out_105021", "105021017", "story_v_out_105021.awb")

						arg_68_1:RecordAudio("105021017", var_71_21)
						arg_68_1:RecordAudio("105021017", var_71_21)
					else
						arg_68_1:AudioAction("play", "voice", "story_v_out_105021", "105021017", "story_v_out_105021.awb")
					end

					arg_68_1:RecordHistoryTalkVoice("story_v_out_105021", "105021017", "story_v_out_105021.awb")
				end

				arg_68_1:RecordContent(arg_68_1.text_.text)
			end

			local var_71_22 = math.max(var_71_13, arg_68_1.talkMaxDuration)

			if var_71_12 <= arg_68_1.time_ and arg_68_1.time_ < var_71_12 + var_71_22 then
				arg_68_1.typewritter.percent = (arg_68_1.time_ - var_71_12) / var_71_22

				arg_68_1.typewritter:SetDirty()
			end

			if arg_68_1.time_ >= var_71_12 + var_71_22 and arg_68_1.time_ < var_71_12 + var_71_22 + arg_71_0 then
				arg_68_1.typewritter.percent = 1

				arg_68_1.typewritter:SetDirty()
				arg_68_1:ShowNextGo(true)
			end
		end
	end,
	Play105021018 = function(arg_72_0, arg_72_1)
		arg_72_1.time_ = 0
		arg_72_1.frameCnt_ = 0
		arg_72_1.state_ = "playing"
		arg_72_1.curTalkId_ = 105021018
		arg_72_1.duration_ = 8.9

		local var_72_0 = {
			ja = 7.966,
			ko = 6.7,
			zh = 8.9,
			en = 8.7
		}
		local var_72_1 = manager.audio:GetLocalizationFlag()

		if var_72_0[var_72_1] ~= nil then
			arg_72_1.duration_ = var_72_0[var_72_1]
		end

		SetActive(arg_72_1.tipsGo_, false)

		function arg_72_1.onSingleLineFinish_()
			arg_72_1.onSingleLineUpdate_ = nil
			arg_72_1.onSingleLineFinish_ = nil
			arg_72_1.state_ = "waiting"
		end

		function arg_72_1.playNext_(arg_74_0)
			if arg_74_0 == 1 then
				arg_72_0:Play105021019(arg_72_1)
			end
		end

		function arg_72_1.onSingleLineUpdate_(arg_75_0)
			local var_75_0 = arg_72_1.actors_["10002ui_story"]
			local var_75_1 = 0

			if var_75_1 < arg_72_1.time_ and arg_72_1.time_ <= var_75_1 + arg_75_0 and arg_72_1.var_.characterEffect10002ui_story == nil then
				arg_72_1.var_.characterEffect10002ui_story = var_75_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_75_2 = 0.1

			if var_75_1 <= arg_72_1.time_ and arg_72_1.time_ < var_75_1 + var_75_2 then
				local var_75_3 = (arg_72_1.time_ - var_75_1) / var_75_2

				if arg_72_1.var_.characterEffect10002ui_story then
					arg_72_1.var_.characterEffect10002ui_story.fillFlat = false
				end
			end

			if arg_72_1.time_ >= var_75_1 + var_75_2 and arg_72_1.time_ < var_75_1 + var_75_2 + arg_75_0 and arg_72_1.var_.characterEffect10002ui_story then
				arg_72_1.var_.characterEffect10002ui_story.fillFlat = false
			end

			local var_75_4 = arg_72_1.actors_["1013ui_story"]
			local var_75_5 = 0

			if var_75_5 < arg_72_1.time_ and arg_72_1.time_ <= var_75_5 + arg_75_0 and arg_72_1.var_.characterEffect1013ui_story == nil then
				arg_72_1.var_.characterEffect1013ui_story = var_75_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_75_6 = 0.1

			if var_75_5 <= arg_72_1.time_ and arg_72_1.time_ < var_75_5 + var_75_6 then
				local var_75_7 = (arg_72_1.time_ - var_75_5) / var_75_6

				if arg_72_1.var_.characterEffect1013ui_story then
					local var_75_8 = Mathf.Lerp(0, 0.5, var_75_7)

					arg_72_1.var_.characterEffect1013ui_story.fillFlat = true
					arg_72_1.var_.characterEffect1013ui_story.fillRatio = var_75_8
				end
			end

			if arg_72_1.time_ >= var_75_5 + var_75_6 and arg_72_1.time_ < var_75_5 + var_75_6 + arg_75_0 and arg_72_1.var_.characterEffect1013ui_story then
				local var_75_9 = 0.5

				arg_72_1.var_.characterEffect1013ui_story.fillFlat = true
				arg_72_1.var_.characterEffect1013ui_story.fillRatio = var_75_9
			end

			local var_75_10 = 0

			if var_75_10 < arg_72_1.time_ and arg_72_1.time_ <= var_75_10 + arg_75_0 then
				arg_72_1:PlayTimeline("10002ui_story", "StoryTimeline/CharAction/story10002/story10002action/10002action3_2")
			end

			local var_75_11 = 0

			if var_75_11 < arg_72_1.time_ and arg_72_1.time_ <= var_75_11 + arg_75_0 then
				arg_72_1:PlayTimeline("10002ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_75_12 = 0
			local var_75_13 = 0.725

			if var_75_12 < arg_72_1.time_ and arg_72_1.time_ <= var_75_12 + arg_75_0 then
				arg_72_1.talkMaxDuration = 0
				arg_72_1.dialogCg_.alpha = 1

				arg_72_1.dialog_:SetActive(true)
				SetActive(arg_72_1.leftNameGo_, true)

				local var_75_14 = arg_72_1:FormatText(StoryNameCfg[39].name)

				arg_72_1.leftNameTxt_.text = var_75_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_72_1.leftNameTxt_.transform)

				arg_72_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_72_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_72_1:RecordName(arg_72_1.leftNameTxt_.text)
				SetActive(arg_72_1.iconTrs_.gameObject, false)
				arg_72_1.callingController_:SetSelectedState("normal")

				local var_75_15 = arg_72_1:GetWordFromCfg(105021018)
				local var_75_16 = arg_72_1:FormatText(var_75_15.content)

				arg_72_1.text_.text = var_75_16

				LuaForUtil.ClearLinePrefixSymbol(arg_72_1.text_)

				local var_75_17 = 29
				local var_75_18 = utf8.len(var_75_16)
				local var_75_19 = var_75_17 <= 0 and var_75_13 or var_75_13 * (var_75_18 / var_75_17)

				if var_75_19 > 0 and var_75_13 < var_75_19 then
					arg_72_1.talkMaxDuration = var_75_19

					if var_75_19 + var_75_12 > arg_72_1.duration_ then
						arg_72_1.duration_ = var_75_19 + var_75_12
					end
				end

				arg_72_1.text_.text = var_75_16
				arg_72_1.typewritter.percent = 0

				arg_72_1.typewritter:SetDirty()
				arg_72_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105021", "105021018", "story_v_out_105021.awb") ~= 0 then
					local var_75_20 = manager.audio:GetVoiceLength("story_v_out_105021", "105021018", "story_v_out_105021.awb") / 1000

					if var_75_20 + var_75_12 > arg_72_1.duration_ then
						arg_72_1.duration_ = var_75_20 + var_75_12
					end

					if var_75_15.prefab_name ~= "" and arg_72_1.actors_[var_75_15.prefab_name] ~= nil then
						local var_75_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_72_1.actors_[var_75_15.prefab_name].transform, "story_v_out_105021", "105021018", "story_v_out_105021.awb")

						arg_72_1:RecordAudio("105021018", var_75_21)
						arg_72_1:RecordAudio("105021018", var_75_21)
					else
						arg_72_1:AudioAction("play", "voice", "story_v_out_105021", "105021018", "story_v_out_105021.awb")
					end

					arg_72_1:RecordHistoryTalkVoice("story_v_out_105021", "105021018", "story_v_out_105021.awb")
				end

				arg_72_1:RecordContent(arg_72_1.text_.text)
			end

			local var_75_22 = math.max(var_75_13, arg_72_1.talkMaxDuration)

			if var_75_12 <= arg_72_1.time_ and arg_72_1.time_ < var_75_12 + var_75_22 then
				arg_72_1.typewritter.percent = (arg_72_1.time_ - var_75_12) / var_75_22

				arg_72_1.typewritter:SetDirty()
			end

			if arg_72_1.time_ >= var_75_12 + var_75_22 and arg_72_1.time_ < var_75_12 + var_75_22 + arg_75_0 then
				arg_72_1.typewritter.percent = 1

				arg_72_1.typewritter:SetDirty()
				arg_72_1:ShowNextGo(true)
			end
		end
	end,
	Play105021019 = function(arg_76_0, arg_76_1)
		arg_76_1.time_ = 0
		arg_76_1.frameCnt_ = 0
		arg_76_1.state_ = "playing"
		arg_76_1.curTalkId_ = 105021019
		arg_76_1.duration_ = 11.73

		local var_76_0 = {
			ja = 11.733,
			ko = 7.633,
			zh = 6.833,
			en = 11.3
		}
		local var_76_1 = manager.audio:GetLocalizationFlag()

		if var_76_0[var_76_1] ~= nil then
			arg_76_1.duration_ = var_76_0[var_76_1]
		end

		SetActive(arg_76_1.tipsGo_, false)

		function arg_76_1.onSingleLineFinish_()
			arg_76_1.onSingleLineUpdate_ = nil
			arg_76_1.onSingleLineFinish_ = nil
			arg_76_1.state_ = "waiting"
			arg_76_1.auto_ = false
		end

		function arg_76_1.playNext_(arg_78_0)
			arg_76_1.onStoryFinished_()
		end

		function arg_76_1.onSingleLineUpdate_(arg_79_0)
			local var_79_0 = 0

			if var_79_0 < arg_76_1.time_ and arg_76_1.time_ <= var_79_0 + arg_79_0 then
				arg_76_1:PlayTimeline("10002ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_79_1 = 0
			local var_79_2 = 0.725

			if var_79_1 < arg_76_1.time_ and arg_76_1.time_ <= var_79_1 + arg_79_0 then
				arg_76_1.talkMaxDuration = 0
				arg_76_1.dialogCg_.alpha = 1

				arg_76_1.dialog_:SetActive(true)
				SetActive(arg_76_1.leftNameGo_, true)

				local var_79_3 = arg_76_1:FormatText(StoryNameCfg[39].name)

				arg_76_1.leftNameTxt_.text = var_79_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_76_1.leftNameTxt_.transform)

				arg_76_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_76_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_76_1:RecordName(arg_76_1.leftNameTxt_.text)
				SetActive(arg_76_1.iconTrs_.gameObject, false)
				arg_76_1.callingController_:SetSelectedState("normal")

				local var_79_4 = arg_76_1:GetWordFromCfg(105021019)
				local var_79_5 = arg_76_1:FormatText(var_79_4.content)

				arg_76_1.text_.text = var_79_5

				LuaForUtil.ClearLinePrefixSymbol(arg_76_1.text_)

				local var_79_6 = 30
				local var_79_7 = utf8.len(var_79_5)
				local var_79_8 = var_79_6 <= 0 and var_79_2 or var_79_2 * (var_79_7 / var_79_6)

				if var_79_8 > 0 and var_79_2 < var_79_8 then
					arg_76_1.talkMaxDuration = var_79_8

					if var_79_8 + var_79_1 > arg_76_1.duration_ then
						arg_76_1.duration_ = var_79_8 + var_79_1
					end
				end

				arg_76_1.text_.text = var_79_5
				arg_76_1.typewritter.percent = 0

				arg_76_1.typewritter:SetDirty()
				arg_76_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_105021", "105021019", "story_v_out_105021.awb") ~= 0 then
					local var_79_9 = manager.audio:GetVoiceLength("story_v_out_105021", "105021019", "story_v_out_105021.awb") / 1000

					if var_79_9 + var_79_1 > arg_76_1.duration_ then
						arg_76_1.duration_ = var_79_9 + var_79_1
					end

					if var_79_4.prefab_name ~= "" and arg_76_1.actors_[var_79_4.prefab_name] ~= nil then
						local var_79_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_76_1.actors_[var_79_4.prefab_name].transform, "story_v_out_105021", "105021019", "story_v_out_105021.awb")

						arg_76_1:RecordAudio("105021019", var_79_10)
						arg_76_1:RecordAudio("105021019", var_79_10)
					else
						arg_76_1:AudioAction("play", "voice", "story_v_out_105021", "105021019", "story_v_out_105021.awb")
					end

					arg_76_1:RecordHistoryTalkVoice("story_v_out_105021", "105021019", "story_v_out_105021.awb")
				end

				arg_76_1:RecordContent(arg_76_1.text_.text)
			end

			local var_79_11 = math.max(var_79_2, arg_76_1.talkMaxDuration)

			if var_79_1 <= arg_76_1.time_ and arg_76_1.time_ < var_79_1 + var_79_11 then
				arg_76_1.typewritter.percent = (arg_76_1.time_ - var_79_1) / var_79_11

				arg_76_1.typewritter:SetDirty()
			end

			if arg_76_1.time_ >= var_79_1 + var_79_11 and arg_76_1.time_ < var_79_1 + var_79_11 + arg_79_0 then
				arg_76_1.typewritter.percent = 1

				arg_76_1.typewritter:SetDirty()
				arg_76_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/B01c"
	},
	voices = {
		"story_v_out_105021.awb"
	}
}
