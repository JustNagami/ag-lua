return {
	Play114191001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 114191001
		arg_1_1.duration_ = 6.999999999998

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play114191002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST22"

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
				local var_4_5 = arg_1_1.bgs_.ST22

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
					if iter_4_0 ~= "ST22" then
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

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 2
			local var_4_27 = 0.9

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_1_3_story_outdoor", "bgm_activity_1_3_story_outdoor", "bgm_activity_1_3_story_outdoor.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 1.999999999998
			local var_4_31 = 0.625

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

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_33 = arg_1_1:GetWordFromCfg(114191001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 25
				local var_4_36 = utf8.len(var_4_34)
				local var_4_37 = var_4_35 <= 0 and var_4_31 or var_4_31 * (var_4_36 / var_4_35)

				if var_4_37 > 0 and var_4_31 < var_4_37 then
					arg_1_1.talkMaxDuration = var_4_37
					var_4_30 = var_4_30 + 0.3

					if var_4_37 + var_4_30 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_37 + var_4_30
					end
				end

				arg_1_1.text_.text = var_4_34
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_38 = var_4_30 + 0.3
			local var_4_39 = math.max(var_4_31, arg_1_1.talkMaxDuration)

			if var_4_38 <= arg_1_1.time_ and arg_1_1.time_ < var_4_38 + var_4_39 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_38) / var_4_39

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_38 + var_4_39 and arg_1_1.time_ < var_4_38 + var_4_39 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play114191002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 114191002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play114191003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 1.475

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

				local var_10_2 = arg_7_1:GetWordFromCfg(114191002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 59
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
	Play114191003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 114191003
		arg_11_1.duration_ = 10.433

		local var_11_0 = {
			ja = 7.066,
			ko = 10.433,
			zh = 8.5,
			en = 9.033
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
				arg_11_0:Play114191004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 0.95

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_2 = arg_11_1:FormatText(StoryNameCfg[249].name)

				arg_11_1.leftNameTxt_.text = var_14_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, true)
				arg_11_1.iconController_:SetSelectedState("hero")

				arg_11_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenma")

				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_3 = arg_11_1:GetWordFromCfg(114191003)
				local var_14_4 = arg_11_1:FormatText(var_14_3.content)

				arg_11_1.text_.text = var_14_4

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_5 = 38
				local var_14_6 = utf8.len(var_14_4)
				local var_14_7 = var_14_5 <= 0 and var_14_1 or var_14_1 * (var_14_6 / var_14_5)

				if var_14_7 > 0 and var_14_1 < var_14_7 then
					arg_11_1.talkMaxDuration = var_14_7

					if var_14_7 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_7 + var_14_0
					end
				end

				arg_11_1.text_.text = var_14_4
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191003", "story_v_out_114191.awb") ~= 0 then
					local var_14_8 = manager.audio:GetVoiceLength("story_v_out_114191", "114191003", "story_v_out_114191.awb") / 1000

					if var_14_8 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_8 + var_14_0
					end

					if var_14_3.prefab_name ~= "" and arg_11_1.actors_[var_14_3.prefab_name] ~= nil then
						local var_14_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_3.prefab_name].transform, "story_v_out_114191", "114191003", "story_v_out_114191.awb")

						arg_11_1:RecordAudio("114191003", var_14_9)
						arg_11_1:RecordAudio("114191003", var_14_9)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_114191", "114191003", "story_v_out_114191.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_114191", "114191003", "story_v_out_114191.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_10 = math.max(var_14_1, arg_11_1.talkMaxDuration)

			if var_14_0 <= arg_11_1.time_ and arg_11_1.time_ < var_14_0 + var_14_10 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_0) / var_14_10

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_0 + var_14_10 and arg_11_1.time_ < var_14_0 + var_14_10 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play114191004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 114191004
		arg_15_1.duration_ = 10.466

		local var_15_0 = {
			ja = 5.1,
			ko = 10.466,
			zh = 10.066,
			en = 8.966
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
				arg_15_0:Play114191005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 1.075

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_2 = arg_15_1:FormatText(StoryNameCfg[250].name)

				arg_15_1.leftNameTxt_.text = var_18_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, true)
				arg_15_1.iconController_:SetSelectedState("hero")

				arg_15_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenwb")

				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_3 = arg_15_1:GetWordFromCfg(114191004)
				local var_18_4 = arg_15_1:FormatText(var_18_3.content)

				arg_15_1.text_.text = var_18_4

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_5 = 43
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

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191004", "story_v_out_114191.awb") ~= 0 then
					local var_18_8 = manager.audio:GetVoiceLength("story_v_out_114191", "114191004", "story_v_out_114191.awb") / 1000

					if var_18_8 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_8 + var_18_0
					end

					if var_18_3.prefab_name ~= "" and arg_15_1.actors_[var_18_3.prefab_name] ~= nil then
						local var_18_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_3.prefab_name].transform, "story_v_out_114191", "114191004", "story_v_out_114191.awb")

						arg_15_1:RecordAudio("114191004", var_18_9)
						arg_15_1:RecordAudio("114191004", var_18_9)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_114191", "114191004", "story_v_out_114191.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_114191", "114191004", "story_v_out_114191.awb")
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
	Play114191005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 114191005
		arg_19_1.duration_ = 10.9

		local var_19_0 = {
			ja = 10.9,
			ko = 9.6,
			zh = 8.1,
			en = 8.2
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
				arg_19_0:Play114191006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 0.875

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_2 = arg_19_1:FormatText(StoryNameCfg[251].name)

				arg_19_1.leftNameTxt_.text = var_22_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, true)
				arg_19_1.iconController_:SetSelectedState("hero")

				arg_19_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenmb")

				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_3 = arg_19_1:GetWordFromCfg(114191005)
				local var_22_4 = arg_19_1:FormatText(var_22_3.content)

				arg_19_1.text_.text = var_22_4

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_5 = 35
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

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191005", "story_v_out_114191.awb") ~= 0 then
					local var_22_8 = manager.audio:GetVoiceLength("story_v_out_114191", "114191005", "story_v_out_114191.awb") / 1000

					if var_22_8 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_8 + var_22_0
					end

					if var_22_3.prefab_name ~= "" and arg_19_1.actors_[var_22_3.prefab_name] ~= nil then
						local var_22_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_3.prefab_name].transform, "story_v_out_114191", "114191005", "story_v_out_114191.awb")

						arg_19_1:RecordAudio("114191005", var_22_9)
						arg_19_1:RecordAudio("114191005", var_22_9)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_114191", "114191005", "story_v_out_114191.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_114191", "114191005", "story_v_out_114191.awb")
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
	Play114191006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 114191006
		arg_23_1.duration_ = 15.466

		local var_23_0 = {
			ja = 11.866,
			ko = 14.833,
			zh = 15.466,
			en = 14.933
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
				arg_23_0:Play114191007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 1.475

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_2 = arg_23_1:FormatText(StoryNameCfg[251].name)

				arg_23_1.leftNameTxt_.text = var_26_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, true)
				arg_23_1.iconController_:SetSelectedState("hero")

				arg_23_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenmb")

				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_3 = arg_23_1:GetWordFromCfg(114191006)
				local var_26_4 = arg_23_1:FormatText(var_26_3.content)

				arg_23_1.text_.text = var_26_4

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_5 = 59
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

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191006", "story_v_out_114191.awb") ~= 0 then
					local var_26_8 = manager.audio:GetVoiceLength("story_v_out_114191", "114191006", "story_v_out_114191.awb") / 1000

					if var_26_8 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_8 + var_26_0
					end

					if var_26_3.prefab_name ~= "" and arg_23_1.actors_[var_26_3.prefab_name] ~= nil then
						local var_26_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_3.prefab_name].transform, "story_v_out_114191", "114191006", "story_v_out_114191.awb")

						arg_23_1:RecordAudio("114191006", var_26_9)
						arg_23_1:RecordAudio("114191006", var_26_9)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_114191", "114191006", "story_v_out_114191.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_114191", "114191006", "story_v_out_114191.awb")
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
	Play114191007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 114191007
		arg_27_1.duration_ = 12.766

		local var_27_0 = {
			ja = 5.733,
			ko = 9,
			zh = 10.666,
			en = 12.766
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
				arg_27_0:Play114191008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0
			local var_30_1 = 1.125

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_2 = arg_27_1:FormatText(StoryNameCfg[249].name)

				arg_27_1.leftNameTxt_.text = var_30_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, true)
				arg_27_1.iconController_:SetSelectedState("hero")

				arg_27_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenma")

				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_3 = arg_27_1:GetWordFromCfg(114191007)
				local var_30_4 = arg_27_1:FormatText(var_30_3.content)

				arg_27_1.text_.text = var_30_4

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_5 = 45
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

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191007", "story_v_out_114191.awb") ~= 0 then
					local var_30_8 = manager.audio:GetVoiceLength("story_v_out_114191", "114191007", "story_v_out_114191.awb") / 1000

					if var_30_8 + var_30_0 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_8 + var_30_0
					end

					if var_30_3.prefab_name ~= "" and arg_27_1.actors_[var_30_3.prefab_name] ~= nil then
						local var_30_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_3.prefab_name].transform, "story_v_out_114191", "114191007", "story_v_out_114191.awb")

						arg_27_1:RecordAudio("114191007", var_30_9)
						arg_27_1:RecordAudio("114191007", var_30_9)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_114191", "114191007", "story_v_out_114191.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_114191", "114191007", "story_v_out_114191.awb")
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
	Play114191008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 114191008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play114191009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 1.275

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, false)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_2 = arg_31_1:GetWordFromCfg(114191008)
				local var_34_3 = arg_31_1:FormatText(var_34_2.content)

				arg_31_1.text_.text = var_34_3

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_4 = 51
				local var_34_5 = utf8.len(var_34_3)
				local var_34_6 = var_34_4 <= 0 and var_34_1 or var_34_1 * (var_34_5 / var_34_4)

				if var_34_6 > 0 and var_34_1 < var_34_6 then
					arg_31_1.talkMaxDuration = var_34_6

					if var_34_6 + var_34_0 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_6 + var_34_0
					end
				end

				arg_31_1.text_.text = var_34_3
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_7 = math.max(var_34_1, arg_31_1.talkMaxDuration)

			if var_34_0 <= arg_31_1.time_ and arg_31_1.time_ < var_34_0 + var_34_7 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_0) / var_34_7

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_0 + var_34_7 and arg_31_1.time_ < var_34_0 + var_34_7 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play114191009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 114191009
		arg_35_1.duration_ = 3.666

		local var_35_0 = {
			ja = 3.3,
			ko = 3.666,
			zh = 3.033,
			en = 2.733
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
				arg_35_0:Play114191010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 0.275

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_2 = arg_35_1:FormatText(StoryNameCfg[249].name)

				arg_35_1.leftNameTxt_.text = var_38_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, true)
				arg_35_1.iconController_:SetSelectedState("hero")

				arg_35_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenma")

				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_3 = arg_35_1:GetWordFromCfg(114191009)
				local var_38_4 = arg_35_1:FormatText(var_38_3.content)

				arg_35_1.text_.text = var_38_4

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_5 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191009", "story_v_out_114191.awb") ~= 0 then
					local var_38_8 = manager.audio:GetVoiceLength("story_v_out_114191", "114191009", "story_v_out_114191.awb") / 1000

					if var_38_8 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_8 + var_38_0
					end

					if var_38_3.prefab_name ~= "" and arg_35_1.actors_[var_38_3.prefab_name] ~= nil then
						local var_38_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_3.prefab_name].transform, "story_v_out_114191", "114191009", "story_v_out_114191.awb")

						arg_35_1:RecordAudio("114191009", var_38_9)
						arg_35_1:RecordAudio("114191009", var_38_9)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_114191", "114191009", "story_v_out_114191.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_114191", "114191009", "story_v_out_114191.awb")
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
	Play114191010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 114191010
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play114191011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0
			local var_42_1 = 0.975

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

				local var_42_2 = arg_39_1:GetWordFromCfg(114191010)
				local var_42_3 = arg_39_1:FormatText(var_42_2.content)

				arg_39_1.text_.text = var_42_3

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_4 = 39
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
	Play114191011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 114191011
		arg_43_1.duration_ = 3.766

		local var_43_0 = {
			ja = 3.4,
			ko = 2.9,
			zh = 2.7,
			en = 3.766
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
				arg_43_0:Play114191012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0
			local var_46_1 = 0.2

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_2 = arg_43_1:FormatText(StoryNameCfg[205].name)

				arg_43_1.leftNameTxt_.text = var_46_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, true)
				arg_43_1.iconController_:SetSelectedState("hero")

				arg_43_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1042")

				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_3 = arg_43_1:GetWordFromCfg(114191011)
				local var_46_4 = arg_43_1:FormatText(var_46_3.content)

				arg_43_1.text_.text = var_46_4

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_5 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191011", "story_v_out_114191.awb") ~= 0 then
					local var_46_8 = manager.audio:GetVoiceLength("story_v_out_114191", "114191011", "story_v_out_114191.awb") / 1000

					if var_46_8 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_8 + var_46_0
					end

					if var_46_3.prefab_name ~= "" and arg_43_1.actors_[var_46_3.prefab_name] ~= nil then
						local var_46_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_3.prefab_name].transform, "story_v_out_114191", "114191011", "story_v_out_114191.awb")

						arg_43_1:RecordAudio("114191011", var_46_9)
						arg_43_1:RecordAudio("114191011", var_46_9)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_114191", "114191011", "story_v_out_114191.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_114191", "114191011", "story_v_out_114191.awb")
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
	Play114191012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 114191012
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play114191013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0
			local var_50_1 = 1.45

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

				local var_50_2 = arg_47_1:GetWordFromCfg(114191012)
				local var_50_3 = arg_47_1:FormatText(var_50_2.content)

				arg_47_1.text_.text = var_50_3

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_4 = 58
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
	Play114191013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 114191013
		arg_51_1.duration_ = 9

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play114191014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = "OM0203"

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
				local var_54_5 = arg_51_1.bgs_.OM0203

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
					if iter_54_0 ~= "OM0203" then
						iter_54_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_54_16 = 2

			if var_54_16 < arg_51_1.time_ and arg_51_1.time_ <= var_54_16 + arg_54_0 then
				arg_51_1.mask_.enabled = true
				arg_51_1.mask_.raycastTarget = true

				arg_51_1:SetGaussion(false)
			end

			local var_54_17 = 2

			if var_54_16 <= arg_51_1.time_ and arg_51_1.time_ < var_54_16 + var_54_17 then
				local var_54_18 = (arg_51_1.time_ - var_54_16) / var_54_17
				local var_54_19 = Color.New(0, 0, 0)

				var_54_19.a = Mathf.Lerp(1, 0, var_54_18)
				arg_51_1.mask_.color = var_54_19
			end

			if arg_51_1.time_ >= var_54_16 + var_54_17 and arg_51_1.time_ < var_54_16 + var_54_17 + arg_54_0 then
				local var_54_20 = Color.New(0, 0, 0)
				local var_54_21 = 0

				arg_51_1.mask_.enabled = false
				var_54_20.a = var_54_21
				arg_51_1.mask_.color = var_54_20
			end

			local var_54_22 = 0

			if var_54_22 < arg_51_1.time_ and arg_51_1.time_ <= var_54_22 + arg_54_0 then
				arg_51_1.mask_.enabled = true
				arg_51_1.mask_.raycastTarget = true

				arg_51_1:SetGaussion(false)
			end

			local var_54_23 = 2

			if var_54_22 <= arg_51_1.time_ and arg_51_1.time_ < var_54_22 + var_54_23 then
				local var_54_24 = (arg_51_1.time_ - var_54_22) / var_54_23
				local var_54_25 = Color.New(0, 0, 0)

				var_54_25.a = Mathf.Lerp(0, 1, var_54_24)
				arg_51_1.mask_.color = var_54_25
			end

			if arg_51_1.time_ >= var_54_22 + var_54_23 and arg_51_1.time_ < var_54_22 + var_54_23 + arg_54_0 then
				local var_54_26 = Color.New(0, 0, 0)

				var_54_26.a = 1
				arg_51_1.mask_.color = var_54_26
			end

			local var_54_27 = arg_51_1.bgs_.OM0203.transform
			local var_54_28 = 2

			if var_54_28 < arg_51_1.time_ and arg_51_1.time_ <= var_54_28 + arg_54_0 then
				arg_51_1.var_.moveOldPosOM0203 = var_54_27.localPosition
			end

			local var_54_29 = 0.001

			if var_54_28 <= arg_51_1.time_ and arg_51_1.time_ < var_54_28 + var_54_29 then
				local var_54_30 = (arg_51_1.time_ - var_54_28) / var_54_29
				local var_54_31 = Vector3.New(0, 1, 10)

				var_54_27.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPosOM0203, var_54_31, var_54_30)
			end

			if arg_51_1.time_ >= var_54_28 + var_54_29 and arg_51_1.time_ < var_54_28 + var_54_29 + arg_54_0 then
				var_54_27.localPosition = Vector3.New(0, 1, 10)
			end

			local var_54_32 = arg_51_1.bgs_.OM0203.transform
			local var_54_33 = 2.034

			if var_54_33 < arg_51_1.time_ and arg_51_1.time_ <= var_54_33 + arg_54_0 then
				arg_51_1.var_.moveOldPosOM0203 = var_54_32.localPosition
			end

			local var_54_34 = 3

			if var_54_33 <= arg_51_1.time_ and arg_51_1.time_ < var_54_33 + var_54_34 then
				local var_54_35 = (arg_51_1.time_ - var_54_33) / var_54_34
				local var_54_36 = Vector3.New(0, 1, 9.5)

				var_54_32.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPosOM0203, var_54_36, var_54_35)
			end

			if arg_51_1.time_ >= var_54_33 + var_54_34 and arg_51_1.time_ < var_54_33 + var_54_34 + arg_54_0 then
				var_54_32.localPosition = Vector3.New(0, 1, 9.5)
			end

			local var_54_37 = 4

			if var_54_37 < arg_51_1.time_ and arg_51_1.time_ <= var_54_37 + arg_54_0 then
				arg_51_1.allBtn_.enabled = false
			end

			local var_54_38 = 1.034

			if arg_51_1.time_ >= var_54_37 + var_54_38 and arg_51_1.time_ < var_54_37 + var_54_38 + arg_54_0 then
				arg_51_1.allBtn_.enabled = true
			end

			if arg_51_1.frameCnt_ <= 1 then
				arg_51_1.dialog_:SetActive(false)
			end

			local var_54_39 = 4
			local var_54_40 = 1.15

			if var_54_39 < arg_51_1.time_ and arg_51_1.time_ <= var_54_39 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0

				arg_51_1.dialog_:SetActive(true)

				local var_54_41 = LeanTween.value(arg_51_1.dialog_, 0, 1, 0.3)

				var_54_41:setOnUpdate(LuaHelper.FloatAction(function(arg_55_0)
					arg_51_1.dialogCg_.alpha = arg_55_0
				end))
				var_54_41:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_51_1.dialog_)
					var_54_41:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_51_1.duration_ = arg_51_1.duration_ + 0.3

				SetActive(arg_51_1.leftNameGo_, false)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_42 = arg_51_1:GetWordFromCfg(114191013)
				local var_54_43 = arg_51_1:FormatText(var_54_42.content)

				arg_51_1.text_.text = var_54_43

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_44 = 46
				local var_54_45 = utf8.len(var_54_43)
				local var_54_46 = var_54_44 <= 0 and var_54_40 or var_54_40 * (var_54_45 / var_54_44)

				if var_54_46 > 0 and var_54_40 < var_54_46 then
					arg_51_1.talkMaxDuration = var_54_46
					var_54_39 = var_54_39 + 0.3

					if var_54_46 + var_54_39 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_46 + var_54_39
					end
				end

				arg_51_1.text_.text = var_54_43
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)
				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_47 = var_54_39 + 0.3
			local var_54_48 = math.max(var_54_40, arg_51_1.talkMaxDuration)

			if var_54_47 <= arg_51_1.time_ and arg_51_1.time_ < var_54_47 + var_54_48 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_47) / var_54_48

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_47 + var_54_48 and arg_51_1.time_ < var_54_47 + var_54_48 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play114191014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 114191014
		arg_57_1.duration_ = 17.066

		local var_57_0 = {
			ja = 13.533,
			ko = 12.133,
			zh = 11.166,
			en = 17.066
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
				arg_57_0:Play114191015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = 0
			local var_60_1 = 1.2

			if var_60_0 < arg_57_1.time_ and arg_57_1.time_ <= var_60_0 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_2 = arg_57_1:FormatText(StoryNameCfg[205].name)

				arg_57_1.leftNameTxt_.text = var_60_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_3 = arg_57_1:GetWordFromCfg(114191014)
				local var_60_4 = arg_57_1:FormatText(var_60_3.content)

				arg_57_1.text_.text = var_60_4

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_5 = 48
				local var_60_6 = utf8.len(var_60_4)
				local var_60_7 = var_60_5 <= 0 and var_60_1 or var_60_1 * (var_60_6 / var_60_5)

				if var_60_7 > 0 and var_60_1 < var_60_7 then
					arg_57_1.talkMaxDuration = var_60_7

					if var_60_7 + var_60_0 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_7 + var_60_0
					end
				end

				arg_57_1.text_.text = var_60_4
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191014", "story_v_out_114191.awb") ~= 0 then
					local var_60_8 = manager.audio:GetVoiceLength("story_v_out_114191", "114191014", "story_v_out_114191.awb") / 1000

					if var_60_8 + var_60_0 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_8 + var_60_0
					end

					if var_60_3.prefab_name ~= "" and arg_57_1.actors_[var_60_3.prefab_name] ~= nil then
						local var_60_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_3.prefab_name].transform, "story_v_out_114191", "114191014", "story_v_out_114191.awb")

						arg_57_1:RecordAudio("114191014", var_60_9)
						arg_57_1:RecordAudio("114191014", var_60_9)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_114191", "114191014", "story_v_out_114191.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_114191", "114191014", "story_v_out_114191.awb")
				end

				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_10 = math.max(var_60_1, arg_57_1.talkMaxDuration)

			if var_60_0 <= arg_57_1.time_ and arg_57_1.time_ < var_60_0 + var_60_10 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_0) / var_60_10

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_0 + var_60_10 and arg_57_1.time_ < var_60_0 + var_60_10 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play114191015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 114191015
		arg_61_1.duration_ = 16.833

		local var_61_0 = {
			ja = 10.166,
			ko = 16.833,
			zh = 14.733,
			en = 14.7
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
				arg_61_0:Play114191016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = 0
			local var_64_1 = 1.475

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
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_3 = arg_61_1:GetWordFromCfg(114191015)
				local var_64_4 = arg_61_1:FormatText(var_64_3.content)

				arg_61_1.text_.text = var_64_4

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_5 = 59
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

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191015", "story_v_out_114191.awb") ~= 0 then
					local var_64_8 = manager.audio:GetVoiceLength("story_v_out_114191", "114191015", "story_v_out_114191.awb") / 1000

					if var_64_8 + var_64_0 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_8 + var_64_0
					end

					if var_64_3.prefab_name ~= "" and arg_61_1.actors_[var_64_3.prefab_name] ~= nil then
						local var_64_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_3.prefab_name].transform, "story_v_out_114191", "114191015", "story_v_out_114191.awb")

						arg_61_1:RecordAudio("114191015", var_64_9)
						arg_61_1:RecordAudio("114191015", var_64_9)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_114191", "114191015", "story_v_out_114191.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_114191", "114191015", "story_v_out_114191.awb")
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
	Play114191016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 114191016
		arg_65_1.duration_ = 18.366

		local var_65_0 = {
			ja = 18.366,
			ko = 15.6,
			zh = 12.633,
			en = 14.533
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
				arg_65_0:Play114191017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = 0
			local var_68_1 = 1.325

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
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_3 = arg_65_1:GetWordFromCfg(114191016)
				local var_68_4 = arg_65_1:FormatText(var_68_3.content)

				arg_65_1.text_.text = var_68_4

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_5 = 53
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

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191016", "story_v_out_114191.awb") ~= 0 then
					local var_68_8 = manager.audio:GetVoiceLength("story_v_out_114191", "114191016", "story_v_out_114191.awb") / 1000

					if var_68_8 + var_68_0 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_8 + var_68_0
					end

					if var_68_3.prefab_name ~= "" and arg_65_1.actors_[var_68_3.prefab_name] ~= nil then
						local var_68_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_3.prefab_name].transform, "story_v_out_114191", "114191016", "story_v_out_114191.awb")

						arg_65_1:RecordAudio("114191016", var_68_9)
						arg_65_1:RecordAudio("114191016", var_68_9)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_114191", "114191016", "story_v_out_114191.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_114191", "114191016", "story_v_out_114191.awb")
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
	Play114191017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 114191017
		arg_69_1.duration_ = 11.7

		local var_69_0 = {
			ja = 11.7,
			ko = 9.6,
			zh = 7.733,
			en = 11.033
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
				arg_69_0:Play114191018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = 0
			local var_72_1 = 0.9

			if var_72_0 < arg_69_1.time_ and arg_69_1.time_ <= var_72_0 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_2 = arg_69_1:FormatText(StoryNameCfg[205].name)

				arg_69_1.leftNameTxt_.text = var_72_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_3 = arg_69_1:GetWordFromCfg(114191017)
				local var_72_4 = arg_69_1:FormatText(var_72_3.content)

				arg_69_1.text_.text = var_72_4

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_5 = 36
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

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191017", "story_v_out_114191.awb") ~= 0 then
					local var_72_8 = manager.audio:GetVoiceLength("story_v_out_114191", "114191017", "story_v_out_114191.awb") / 1000

					if var_72_8 + var_72_0 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_8 + var_72_0
					end

					if var_72_3.prefab_name ~= "" and arg_69_1.actors_[var_72_3.prefab_name] ~= nil then
						local var_72_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_3.prefab_name].transform, "story_v_out_114191", "114191017", "story_v_out_114191.awb")

						arg_69_1:RecordAudio("114191017", var_72_9)
						arg_69_1:RecordAudio("114191017", var_72_9)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_114191", "114191017", "story_v_out_114191.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_114191", "114191017", "story_v_out_114191.awb")
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
	Play114191018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 114191018
		arg_73_1.duration_ = 19.466

		local var_73_0 = {
			ja = 19.466,
			ko = 12.933,
			zh = 10.1,
			en = 14.066
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
				arg_73_0:Play114191019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = 0
			local var_76_1 = 1

			if var_76_0 < arg_73_1.time_ and arg_73_1.time_ <= var_76_0 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_2 = arg_73_1:FormatText(StoryNameCfg[205].name)

				arg_73_1.leftNameTxt_.text = var_76_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_3 = arg_73_1:GetWordFromCfg(114191018)
				local var_76_4 = arg_73_1:FormatText(var_76_3.content)

				arg_73_1.text_.text = var_76_4

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_5 = 40
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

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191018", "story_v_out_114191.awb") ~= 0 then
					local var_76_8 = manager.audio:GetVoiceLength("story_v_out_114191", "114191018", "story_v_out_114191.awb") / 1000

					if var_76_8 + var_76_0 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_8 + var_76_0
					end

					if var_76_3.prefab_name ~= "" and arg_73_1.actors_[var_76_3.prefab_name] ~= nil then
						local var_76_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_3.prefab_name].transform, "story_v_out_114191", "114191018", "story_v_out_114191.awb")

						arg_73_1:RecordAudio("114191018", var_76_9)
						arg_73_1:RecordAudio("114191018", var_76_9)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_114191", "114191018", "story_v_out_114191.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_114191", "114191018", "story_v_out_114191.awb")
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
	Play114191019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 114191019
		arg_77_1.duration_ = 16

		local var_77_0 = {
			ja = 15.966,
			ko = 7.8,
			zh = 8.7,
			en = 16
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
				arg_77_0:Play114191020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = 0
			local var_80_1 = 0.925

			if var_80_0 < arg_77_1.time_ and arg_77_1.time_ <= var_80_0 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_2 = arg_77_1:FormatText(StoryNameCfg[205].name)

				arg_77_1.leftNameTxt_.text = var_80_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_3 = arg_77_1:GetWordFromCfg(114191019)
				local var_80_4 = arg_77_1:FormatText(var_80_3.content)

				arg_77_1.text_.text = var_80_4

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_5 = 35
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

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191019", "story_v_out_114191.awb") ~= 0 then
					local var_80_8 = manager.audio:GetVoiceLength("story_v_out_114191", "114191019", "story_v_out_114191.awb") / 1000

					if var_80_8 + var_80_0 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_8 + var_80_0
					end

					if var_80_3.prefab_name ~= "" and arg_77_1.actors_[var_80_3.prefab_name] ~= nil then
						local var_80_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_3.prefab_name].transform, "story_v_out_114191", "114191019", "story_v_out_114191.awb")

						arg_77_1:RecordAudio("114191019", var_80_9)
						arg_77_1:RecordAudio("114191019", var_80_9)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_114191", "114191019", "story_v_out_114191.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_114191", "114191019", "story_v_out_114191.awb")
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
	Play114191020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 114191020
		arg_81_1.duration_ = 15.466

		local var_81_0 = {
			ja = 9.133,
			ko = 13.6,
			zh = 9.366,
			en = 15.466
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
				arg_81_0:Play114191021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = 0
			local var_84_1 = 1.1

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
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_3 = arg_81_1:GetWordFromCfg(114191020)
				local var_84_4 = arg_81_1:FormatText(var_84_3.content)

				arg_81_1.text_.text = var_84_4

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_5 = 43
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

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191020", "story_v_out_114191.awb") ~= 0 then
					local var_84_8 = manager.audio:GetVoiceLength("story_v_out_114191", "114191020", "story_v_out_114191.awb") / 1000

					if var_84_8 + var_84_0 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_8 + var_84_0
					end

					if var_84_3.prefab_name ~= "" and arg_81_1.actors_[var_84_3.prefab_name] ~= nil then
						local var_84_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_3.prefab_name].transform, "story_v_out_114191", "114191020", "story_v_out_114191.awb")

						arg_81_1:RecordAudio("114191020", var_84_9)
						arg_81_1:RecordAudio("114191020", var_84_9)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_114191", "114191020", "story_v_out_114191.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_114191", "114191020", "story_v_out_114191.awb")
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
	Play114191021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 114191021
		arg_85_1.duration_ = 15.166

		local var_85_0 = {
			ja = 14,
			ko = 15.166,
			zh = 12.166,
			en = 14.433
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
				arg_85_0:Play114191022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 0
			local var_88_1 = 1.225

			if var_88_0 < arg_85_1.time_ and arg_85_1.time_ <= var_88_0 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_2 = arg_85_1:FormatText(StoryNameCfg[205].name)

				arg_85_1.leftNameTxt_.text = var_88_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_3 = arg_85_1:GetWordFromCfg(114191021)
				local var_88_4 = arg_85_1:FormatText(var_88_3.content)

				arg_85_1.text_.text = var_88_4

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_5 = 49
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

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191021", "story_v_out_114191.awb") ~= 0 then
					local var_88_8 = manager.audio:GetVoiceLength("story_v_out_114191", "114191021", "story_v_out_114191.awb") / 1000

					if var_88_8 + var_88_0 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_8 + var_88_0
					end

					if var_88_3.prefab_name ~= "" and arg_85_1.actors_[var_88_3.prefab_name] ~= nil then
						local var_88_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_3.prefab_name].transform, "story_v_out_114191", "114191021", "story_v_out_114191.awb")

						arg_85_1:RecordAudio("114191021", var_88_9)
						arg_85_1:RecordAudio("114191021", var_88_9)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_114191", "114191021", "story_v_out_114191.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_114191", "114191021", "story_v_out_114191.awb")
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
	Play114191022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 114191022
		arg_89_1.duration_ = 23.233

		local var_89_0 = {
			ja = 17.2,
			ko = 16.666,
			zh = 16.533,
			en = 23.233
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
				arg_89_0:Play114191023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = 0
			local var_92_1 = 1.875

			if var_92_0 < arg_89_1.time_ and arg_89_1.time_ <= var_92_0 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_2 = arg_89_1:FormatText(StoryNameCfg[205].name)

				arg_89_1.leftNameTxt_.text = var_92_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_3 = arg_89_1:GetWordFromCfg(114191022)
				local var_92_4 = arg_89_1:FormatText(var_92_3.content)

				arg_89_1.text_.text = var_92_4

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_5 = 75
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

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191022", "story_v_out_114191.awb") ~= 0 then
					local var_92_8 = manager.audio:GetVoiceLength("story_v_out_114191", "114191022", "story_v_out_114191.awb") / 1000

					if var_92_8 + var_92_0 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_8 + var_92_0
					end

					if var_92_3.prefab_name ~= "" and arg_89_1.actors_[var_92_3.prefab_name] ~= nil then
						local var_92_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_3.prefab_name].transform, "story_v_out_114191", "114191022", "story_v_out_114191.awb")

						arg_89_1:RecordAudio("114191022", var_92_9)
						arg_89_1:RecordAudio("114191022", var_92_9)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_114191", "114191022", "story_v_out_114191.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_114191", "114191022", "story_v_out_114191.awb")
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
	Play114191023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 114191023
		arg_93_1.duration_ = 3.766

		local var_93_0 = {
			ja = 2.633,
			ko = 3.766,
			zh = 2.966,
			en = 3.2
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
				arg_93_0:Play114191024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = 0
			local var_96_1 = 0.275

			if var_96_0 < arg_93_1.time_ and arg_93_1.time_ <= var_96_0 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_2 = arg_93_1:FormatText(StoryNameCfg[249].name)

				arg_93_1.leftNameTxt_.text = var_96_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, true)
				arg_93_1.iconController_:SetSelectedState("hero")

				arg_93_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenma")

				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_3 = arg_93_1:GetWordFromCfg(114191023)
				local var_96_4 = arg_93_1:FormatText(var_96_3.content)

				arg_93_1.text_.text = var_96_4

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_5 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191023", "story_v_out_114191.awb") ~= 0 then
					local var_96_8 = manager.audio:GetVoiceLength("story_v_out_114191", "114191023", "story_v_out_114191.awb") / 1000

					if var_96_8 + var_96_0 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_8 + var_96_0
					end

					if var_96_3.prefab_name ~= "" and arg_93_1.actors_[var_96_3.prefab_name] ~= nil then
						local var_96_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_3.prefab_name].transform, "story_v_out_114191", "114191023", "story_v_out_114191.awb")

						arg_93_1:RecordAudio("114191023", var_96_9)
						arg_93_1:RecordAudio("114191023", var_96_9)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_114191", "114191023", "story_v_out_114191.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_114191", "114191023", "story_v_out_114191.awb")
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
	Play114191024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 114191024
		arg_97_1.duration_ = 3.7

		local var_97_0 = {
			ja = 2.866,
			ko = 3.2,
			zh = 2.966,
			en = 3.7
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
				arg_97_0:Play114191025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = 0
			local var_100_1 = 0.4

			if var_100_0 < arg_97_1.time_ and arg_97_1.time_ <= var_100_0 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_2 = arg_97_1:FormatText(StoryNameCfg[250].name)

				arg_97_1.leftNameTxt_.text = var_100_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, true)
				arg_97_1.iconController_:SetSelectedState("hero")

				arg_97_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenwb")

				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_3 = arg_97_1:GetWordFromCfg(114191024)
				local var_100_4 = arg_97_1:FormatText(var_100_3.content)

				arg_97_1.text_.text = var_100_4

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_5 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191024", "story_v_out_114191.awb") ~= 0 then
					local var_100_8 = manager.audio:GetVoiceLength("story_v_out_114191", "114191024", "story_v_out_114191.awb") / 1000

					if var_100_8 + var_100_0 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_8 + var_100_0
					end

					if var_100_3.prefab_name ~= "" and arg_97_1.actors_[var_100_3.prefab_name] ~= nil then
						local var_100_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_3.prefab_name].transform, "story_v_out_114191", "114191024", "story_v_out_114191.awb")

						arg_97_1:RecordAudio("114191024", var_100_9)
						arg_97_1:RecordAudio("114191024", var_100_9)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_114191", "114191024", "story_v_out_114191.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_114191", "114191024", "story_v_out_114191.awb")
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
	Play114191025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 114191025
		arg_101_1.duration_ = 21.733

		local var_101_0 = {
			ja = 11.133,
			ko = 18.8,
			zh = 15.966,
			en = 21.733
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
				arg_101_0:Play114191026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = 0
			local var_104_1 = 1.7

			if var_104_0 < arg_101_1.time_ and arg_101_1.time_ <= var_104_0 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_2 = arg_101_1:FormatText(StoryNameCfg[205].name)

				arg_101_1.leftNameTxt_.text = var_104_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_3 = arg_101_1:GetWordFromCfg(114191025)
				local var_104_4 = arg_101_1:FormatText(var_104_3.content)

				arg_101_1.text_.text = var_104_4

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_5 = 68
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

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191025", "story_v_out_114191.awb") ~= 0 then
					local var_104_8 = manager.audio:GetVoiceLength("story_v_out_114191", "114191025", "story_v_out_114191.awb") / 1000

					if var_104_8 + var_104_0 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_8 + var_104_0
					end

					if var_104_3.prefab_name ~= "" and arg_101_1.actors_[var_104_3.prefab_name] ~= nil then
						local var_104_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_3.prefab_name].transform, "story_v_out_114191", "114191025", "story_v_out_114191.awb")

						arg_101_1:RecordAudio("114191025", var_104_9)
						arg_101_1:RecordAudio("114191025", var_104_9)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_114191", "114191025", "story_v_out_114191.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_114191", "114191025", "story_v_out_114191.awb")
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
	Play114191026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 114191026
		arg_105_1.duration_ = 25.8

		local var_105_0 = {
			ja = 12.8,
			ko = 15.7,
			zh = 11.666,
			en = 25.8
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
				arg_105_0:Play114191027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = 0
			local var_108_1 = 1.225

			if var_108_0 < arg_105_1.time_ and arg_105_1.time_ <= var_108_0 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_2 = arg_105_1:FormatText(StoryNameCfg[205].name)

				arg_105_1.leftNameTxt_.text = var_108_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_3 = arg_105_1:GetWordFromCfg(114191026)
				local var_108_4 = arg_105_1:FormatText(var_108_3.content)

				arg_105_1.text_.text = var_108_4

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_5 = 49
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

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191026", "story_v_out_114191.awb") ~= 0 then
					local var_108_8 = manager.audio:GetVoiceLength("story_v_out_114191", "114191026", "story_v_out_114191.awb") / 1000

					if var_108_8 + var_108_0 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_8 + var_108_0
					end

					if var_108_3.prefab_name ~= "" and arg_105_1.actors_[var_108_3.prefab_name] ~= nil then
						local var_108_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_3.prefab_name].transform, "story_v_out_114191", "114191026", "story_v_out_114191.awb")

						arg_105_1:RecordAudio("114191026", var_108_9)
						arg_105_1:RecordAudio("114191026", var_108_9)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_114191", "114191026", "story_v_out_114191.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_114191", "114191026", "story_v_out_114191.awb")
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
	Play114191027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 114191027
		arg_109_1.duration_ = 25.466

		local var_109_0 = {
			ja = 25.4,
			ko = 19.1,
			zh = 19.166,
			en = 25.466
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
				arg_109_0:Play114191028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 0
			local var_112_1 = 2.05

			if var_112_0 < arg_109_1.time_ and arg_109_1.time_ <= var_112_0 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_2 = arg_109_1:FormatText(StoryNameCfg[205].name)

				arg_109_1.leftNameTxt_.text = var_112_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_3 = arg_109_1:GetWordFromCfg(114191027)
				local var_112_4 = arg_109_1:FormatText(var_112_3.content)

				arg_109_1.text_.text = var_112_4

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_5 = 82
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

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191027", "story_v_out_114191.awb") ~= 0 then
					local var_112_8 = manager.audio:GetVoiceLength("story_v_out_114191", "114191027", "story_v_out_114191.awb") / 1000

					if var_112_8 + var_112_0 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_8 + var_112_0
					end

					if var_112_3.prefab_name ~= "" and arg_109_1.actors_[var_112_3.prefab_name] ~= nil then
						local var_112_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_3.prefab_name].transform, "story_v_out_114191", "114191027", "story_v_out_114191.awb")

						arg_109_1:RecordAudio("114191027", var_112_9)
						arg_109_1:RecordAudio("114191027", var_112_9)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_114191", "114191027", "story_v_out_114191.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_114191", "114191027", "story_v_out_114191.awb")
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
	Play114191028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 114191028
		arg_113_1.duration_ = 15.2

		local var_113_0 = {
			ja = 12.8,
			ko = 10.2,
			zh = 11.1,
			en = 15.2
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
				arg_113_0:Play114191029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0
			local var_116_1 = 1.3

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_2 = arg_113_1:FormatText(StoryNameCfg[205].name)

				arg_113_1.leftNameTxt_.text = var_116_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_3 = arg_113_1:GetWordFromCfg(114191028)
				local var_116_4 = arg_113_1:FormatText(var_116_3.content)

				arg_113_1.text_.text = var_116_4

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_5 = 52
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

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191028", "story_v_out_114191.awb") ~= 0 then
					local var_116_8 = manager.audio:GetVoiceLength("story_v_out_114191", "114191028", "story_v_out_114191.awb") / 1000

					if var_116_8 + var_116_0 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_8 + var_116_0
					end

					if var_116_3.prefab_name ~= "" and arg_113_1.actors_[var_116_3.prefab_name] ~= nil then
						local var_116_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_3.prefab_name].transform, "story_v_out_114191", "114191028", "story_v_out_114191.awb")

						arg_113_1:RecordAudio("114191028", var_116_9)
						arg_113_1:RecordAudio("114191028", var_116_9)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_114191", "114191028", "story_v_out_114191.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_114191", "114191028", "story_v_out_114191.awb")
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
	Play114191029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 114191029
		arg_117_1.duration_ = 27.7

		local var_117_0 = {
			ja = 27.7,
			ko = 19.066,
			zh = 15.7,
			en = 24.466
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
				arg_117_0:Play114191030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = 0
			local var_120_1 = 1.65

			if var_120_0 < arg_117_1.time_ and arg_117_1.time_ <= var_120_0 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_2 = arg_117_1:FormatText(StoryNameCfg[205].name)

				arg_117_1.leftNameTxt_.text = var_120_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_3 = arg_117_1:GetWordFromCfg(114191029)
				local var_120_4 = arg_117_1:FormatText(var_120_3.content)

				arg_117_1.text_.text = var_120_4

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_5 = 66
				local var_120_6 = utf8.len(var_120_4)
				local var_120_7 = var_120_5 <= 0 and var_120_1 or var_120_1 * (var_120_6 / var_120_5)

				if var_120_7 > 0 and var_120_1 < var_120_7 then
					arg_117_1.talkMaxDuration = var_120_7

					if var_120_7 + var_120_0 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_7 + var_120_0
					end
				end

				arg_117_1.text_.text = var_120_4
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191029", "story_v_out_114191.awb") ~= 0 then
					local var_120_8 = manager.audio:GetVoiceLength("story_v_out_114191", "114191029", "story_v_out_114191.awb") / 1000

					if var_120_8 + var_120_0 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_8 + var_120_0
					end

					if var_120_3.prefab_name ~= "" and arg_117_1.actors_[var_120_3.prefab_name] ~= nil then
						local var_120_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_3.prefab_name].transform, "story_v_out_114191", "114191029", "story_v_out_114191.awb")

						arg_117_1:RecordAudio("114191029", var_120_9)
						arg_117_1:RecordAudio("114191029", var_120_9)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_114191", "114191029", "story_v_out_114191.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_114191", "114191029", "story_v_out_114191.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_10 = math.max(var_120_1, arg_117_1.talkMaxDuration)

			if var_120_0 <= arg_117_1.time_ and arg_117_1.time_ < var_120_0 + var_120_10 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_0) / var_120_10

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_0 + var_120_10 and arg_117_1.time_ < var_120_0 + var_120_10 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play114191030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 114191030
		arg_121_1.duration_ = 9

		SetActive(arg_121_1.tipsGo_, false)

		function arg_121_1.onSingleLineFinish_()
			arg_121_1.onSingleLineUpdate_ = nil
			arg_121_1.onSingleLineFinish_ = nil
			arg_121_1.state_ = "waiting"
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play114191031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = "F04"

			if arg_121_1.bgs_[var_124_0] == nil then
				local var_124_1 = Object.Instantiate(arg_121_1.paintGo_)

				var_124_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_124_0)
				var_124_1.name = var_124_0
				var_124_1.transform.parent = arg_121_1.stage_.transform
				var_124_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_121_1.bgs_[var_124_0] = var_124_1
			end

			local var_124_2 = 2

			if var_124_2 < arg_121_1.time_ and arg_121_1.time_ <= var_124_2 + arg_124_0 then
				local var_124_3 = manager.ui.mainCamera.transform.localPosition
				local var_124_4 = Vector3.New(0, 0, 10) + Vector3.New(var_124_3.x, var_124_3.y, 0)
				local var_124_5 = arg_121_1.bgs_.F04

				var_124_5.transform.localPosition = var_124_4
				var_124_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_124_6 = var_124_5:GetComponent("SpriteRenderer")

				if var_124_6 and var_124_6.sprite then
					local var_124_7 = (var_124_5.transform.localPosition - var_124_3).z
					local var_124_8 = manager.ui.mainCameraCom_
					local var_124_9 = 2 * var_124_7 * Mathf.Tan(var_124_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_124_10 = var_124_9 * var_124_8.aspect
					local var_124_11 = var_124_6.sprite.bounds.size.x
					local var_124_12 = var_124_6.sprite.bounds.size.y
					local var_124_13 = var_124_10 / var_124_11
					local var_124_14 = var_124_9 / var_124_12
					local var_124_15 = var_124_14 < var_124_13 and var_124_13 or var_124_14

					var_124_5.transform.localScale = Vector3.New(var_124_15, var_124_15, 0)
				end

				for iter_124_0, iter_124_1 in pairs(arg_121_1.bgs_) do
					if iter_124_0 ~= "F04" then
						iter_124_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_124_16 = 0

			if var_124_16 < arg_121_1.time_ and arg_121_1.time_ <= var_124_16 + arg_124_0 then
				arg_121_1.mask_.enabled = true
				arg_121_1.mask_.raycastTarget = true

				arg_121_1:SetGaussion(false)
			end

			local var_124_17 = 2

			if var_124_16 <= arg_121_1.time_ and arg_121_1.time_ < var_124_16 + var_124_17 then
				local var_124_18 = (arg_121_1.time_ - var_124_16) / var_124_17
				local var_124_19 = Color.New(0, 0, 0)

				var_124_19.a = Mathf.Lerp(0, 1, var_124_18)
				arg_121_1.mask_.color = var_124_19
			end

			if arg_121_1.time_ >= var_124_16 + var_124_17 and arg_121_1.time_ < var_124_16 + var_124_17 + arg_124_0 then
				local var_124_20 = Color.New(0, 0, 0)

				var_124_20.a = 1
				arg_121_1.mask_.color = var_124_20
			end

			local var_124_21 = 2

			if var_124_21 < arg_121_1.time_ and arg_121_1.time_ <= var_124_21 + arg_124_0 then
				arg_121_1.mask_.enabled = true
				arg_121_1.mask_.raycastTarget = true

				arg_121_1:SetGaussion(false)
			end

			local var_124_22 = 2

			if var_124_21 <= arg_121_1.time_ and arg_121_1.time_ < var_124_21 + var_124_22 then
				local var_124_23 = (arg_121_1.time_ - var_124_21) / var_124_22
				local var_124_24 = Color.New(0, 0, 0)

				var_124_24.a = Mathf.Lerp(1, 0, var_124_23)
				arg_121_1.mask_.color = var_124_24
			end

			if arg_121_1.time_ >= var_124_21 + var_124_22 and arg_121_1.time_ < var_124_21 + var_124_22 + arg_124_0 then
				local var_124_25 = Color.New(0, 0, 0)
				local var_124_26 = 0

				arg_121_1.mask_.enabled = false
				var_124_25.a = var_124_26
				arg_121_1.mask_.color = var_124_25
			end

			if arg_121_1.frameCnt_ <= 1 then
				arg_121_1.dialog_:SetActive(false)
			end

			local var_124_27 = 4
			local var_124_28 = 0.1

			if var_124_27 < arg_121_1.time_ and arg_121_1.time_ <= var_124_27 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0

				arg_121_1.dialog_:SetActive(true)

				local var_124_29 = LeanTween.value(arg_121_1.dialog_, 0, 1, 0.3)

				var_124_29:setOnUpdate(LuaHelper.FloatAction(function(arg_125_0)
					arg_121_1.dialogCg_.alpha = arg_125_0
				end))
				var_124_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_121_1.dialog_)
					var_124_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_121_1.duration_ = arg_121_1.duration_ + 0.3

				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_30 = arg_121_1:FormatText(StoryNameCfg[7].name)

				arg_121_1.leftNameTxt_.text = var_124_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_31 = arg_121_1:GetWordFromCfg(114191030)
				local var_124_32 = arg_121_1:FormatText(var_124_31.content)

				arg_121_1.text_.text = var_124_32

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_33 = 4
				local var_124_34 = utf8.len(var_124_32)
				local var_124_35 = var_124_33 <= 0 and var_124_28 or var_124_28 * (var_124_34 / var_124_33)

				if var_124_35 > 0 and var_124_28 < var_124_35 then
					arg_121_1.talkMaxDuration = var_124_35
					var_124_27 = var_124_27 + 0.3

					if var_124_35 + var_124_27 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_35 + var_124_27
					end
				end

				arg_121_1.text_.text = var_124_32
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)
				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_36 = var_124_27 + 0.3
			local var_124_37 = math.max(var_124_28, arg_121_1.talkMaxDuration)

			if var_124_36 <= arg_121_1.time_ and arg_121_1.time_ < var_124_36 + var_124_37 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_36) / var_124_37

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_36 + var_124_37 and arg_121_1.time_ < var_124_36 + var_124_37 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play114191031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 114191031
		arg_127_1.duration_ = 5

		SetActive(arg_127_1.tipsGo_, false)

		function arg_127_1.onSingleLineFinish_()
			arg_127_1.onSingleLineUpdate_ = nil
			arg_127_1.onSingleLineFinish_ = nil
			arg_127_1.state_ = "waiting"
		end

		function arg_127_1.playNext_(arg_129_0)
			if arg_129_0 == 1 then
				arg_127_0:Play114191032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = 0
			local var_130_1 = 0.8

			if var_130_0 < arg_127_1.time_ and arg_127_1.time_ <= var_130_0 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, false)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_2 = arg_127_1:GetWordFromCfg(114191031)
				local var_130_3 = arg_127_1:FormatText(var_130_2.content)

				arg_127_1.text_.text = var_130_3

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_4 = 32
				local var_130_5 = utf8.len(var_130_3)
				local var_130_6 = var_130_4 <= 0 and var_130_1 or var_130_1 * (var_130_5 / var_130_4)

				if var_130_6 > 0 and var_130_1 < var_130_6 then
					arg_127_1.talkMaxDuration = var_130_6

					if var_130_6 + var_130_0 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_6 + var_130_0
					end
				end

				arg_127_1.text_.text = var_130_3
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)
				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_7 = math.max(var_130_1, arg_127_1.talkMaxDuration)

			if var_130_0 <= arg_127_1.time_ and arg_127_1.time_ < var_130_0 + var_130_7 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_0) / var_130_7

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_0 + var_130_7 and arg_127_1.time_ < var_130_0 + var_130_7 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play114191032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 114191032
		arg_131_1.duration_ = 5

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play114191033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = 0
			local var_134_1 = 1.55

			if var_134_0 < arg_131_1.time_ and arg_131_1.time_ <= var_134_0 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, false)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_2 = arg_131_1:GetWordFromCfg(114191032)
				local var_134_3 = arg_131_1:FormatText(var_134_2.content)

				arg_131_1.text_.text = var_134_3

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_4 = 62
				local var_134_5 = utf8.len(var_134_3)
				local var_134_6 = var_134_4 <= 0 and var_134_1 or var_134_1 * (var_134_5 / var_134_4)

				if var_134_6 > 0 and var_134_1 < var_134_6 then
					arg_131_1.talkMaxDuration = var_134_6

					if var_134_6 + var_134_0 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_6 + var_134_0
					end
				end

				arg_131_1.text_.text = var_134_3
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)
				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_7 = math.max(var_134_1, arg_131_1.talkMaxDuration)

			if var_134_0 <= arg_131_1.time_ and arg_131_1.time_ < var_134_0 + var_134_7 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_0) / var_134_7

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_0 + var_134_7 and arg_131_1.time_ < var_134_0 + var_134_7 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play114191033 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 114191033
		arg_135_1.duration_ = 6.433

		local var_135_0 = {
			ja = 6.433,
			ko = 5.2,
			zh = 3.9,
			en = 5.2
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
				arg_135_0:Play114191034(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = "1042ui_story"

			if arg_135_1.actors_[var_138_0] == nil then
				local var_138_1 = Object.Instantiate(Asset.Load("Char/" .. var_138_0), arg_135_1.stage_.transform)

				var_138_1.name = var_138_0
				var_138_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_135_1.actors_[var_138_0] = var_138_1

				local var_138_2 = var_138_1:GetComponentInChildren(typeof(CharacterEffect))

				var_138_2.enabled = true

				local var_138_3 = GameObjectTools.GetOrAddComponent(var_138_1, typeof(DynamicBoneHelper))

				if var_138_3 then
					var_138_3:EnableDynamicBone(false)
				end

				arg_135_1:ShowWeapon(var_138_2.transform, false)

				arg_135_1.var_[var_138_0 .. "Animator"] = var_138_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_135_1.var_[var_138_0 .. "Animator"].applyRootMotion = true
				arg_135_1.var_[var_138_0 .. "LipSync"] = var_138_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_138_4 = arg_135_1.actors_["1042ui_story"].transform
			local var_138_5 = 0

			if var_138_5 < arg_135_1.time_ and arg_135_1.time_ <= var_138_5 + arg_138_0 then
				arg_135_1.var_.moveOldPos1042ui_story = var_138_4.localPosition
			end

			local var_138_6 = 0.001

			if var_138_5 <= arg_135_1.time_ and arg_135_1.time_ < var_138_5 + var_138_6 then
				local var_138_7 = (arg_135_1.time_ - var_138_5) / var_138_6
				local var_138_8 = Vector3.New(-0.7, -1.06, -6.2)

				var_138_4.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1042ui_story, var_138_8, var_138_7)

				local var_138_9 = manager.ui.mainCamera.transform.position - var_138_4.position

				var_138_4.forward = Vector3.New(var_138_9.x, var_138_9.y, var_138_9.z)

				local var_138_10 = var_138_4.localEulerAngles

				var_138_10.z = 0
				var_138_10.x = 0
				var_138_4.localEulerAngles = var_138_10
			end

			if arg_135_1.time_ >= var_138_5 + var_138_6 and arg_135_1.time_ < var_138_5 + var_138_6 + arg_138_0 then
				var_138_4.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_138_11 = manager.ui.mainCamera.transform.position - var_138_4.position

				var_138_4.forward = Vector3.New(var_138_11.x, var_138_11.y, var_138_11.z)

				local var_138_12 = var_138_4.localEulerAngles

				var_138_12.z = 0
				var_138_12.x = 0
				var_138_4.localEulerAngles = var_138_12
			end

			local var_138_13 = 0

			if var_138_13 < arg_135_1.time_ and arg_135_1.time_ <= var_138_13 + arg_138_0 then
				arg_135_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action2_1")
			end

			local var_138_14 = 0

			if var_138_14 < arg_135_1.time_ and arg_135_1.time_ <= var_138_14 + arg_138_0 then
				arg_135_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_138_15 = arg_135_1.actors_["1042ui_story"]
			local var_138_16 = 0

			if var_138_16 < arg_135_1.time_ and arg_135_1.time_ <= var_138_16 + arg_138_0 and arg_135_1.var_.characterEffect1042ui_story == nil then
				arg_135_1.var_.characterEffect1042ui_story = var_138_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_17 = 0.2

			if var_138_16 <= arg_135_1.time_ and arg_135_1.time_ < var_138_16 + var_138_17 then
				local var_138_18 = (arg_135_1.time_ - var_138_16) / var_138_17

				if arg_135_1.var_.characterEffect1042ui_story then
					arg_135_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_135_1.time_ >= var_138_16 + var_138_17 and arg_135_1.time_ < var_138_16 + var_138_17 + arg_138_0 and arg_135_1.var_.characterEffect1042ui_story then
				arg_135_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_138_19 = 0
			local var_138_20 = 0.375

			if var_138_19 < arg_135_1.time_ and arg_135_1.time_ <= var_138_19 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_21 = arg_135_1:FormatText(StoryNameCfg[205].name)

				arg_135_1.leftNameTxt_.text = var_138_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_22 = arg_135_1:GetWordFromCfg(114191033)
				local var_138_23 = arg_135_1:FormatText(var_138_22.content)

				arg_135_1.text_.text = var_138_23

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_24 = 15
				local var_138_25 = utf8.len(var_138_23)
				local var_138_26 = var_138_24 <= 0 and var_138_20 or var_138_20 * (var_138_25 / var_138_24)

				if var_138_26 > 0 and var_138_20 < var_138_26 then
					arg_135_1.talkMaxDuration = var_138_26

					if var_138_26 + var_138_19 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_26 + var_138_19
					end
				end

				arg_135_1.text_.text = var_138_23
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191033", "story_v_out_114191.awb") ~= 0 then
					local var_138_27 = manager.audio:GetVoiceLength("story_v_out_114191", "114191033", "story_v_out_114191.awb") / 1000

					if var_138_27 + var_138_19 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_27 + var_138_19
					end

					if var_138_22.prefab_name ~= "" and arg_135_1.actors_[var_138_22.prefab_name] ~= nil then
						local var_138_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_22.prefab_name].transform, "story_v_out_114191", "114191033", "story_v_out_114191.awb")

						arg_135_1:RecordAudio("114191033", var_138_28)
						arg_135_1:RecordAudio("114191033", var_138_28)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_114191", "114191033", "story_v_out_114191.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_114191", "114191033", "story_v_out_114191.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_29 = math.max(var_138_20, arg_135_1.talkMaxDuration)

			if var_138_19 <= arg_135_1.time_ and arg_135_1.time_ < var_138_19 + var_138_29 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_19) / var_138_29

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_19 + var_138_29 and arg_135_1.time_ < var_138_19 + var_138_29 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play114191034 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 114191034
		arg_139_1.duration_ = 5.533

		local var_139_0 = {
			ja = 5.533,
			ko = 3.966,
			zh = 5,
			en = 4.833
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
				arg_139_0:Play114191035(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["1042ui_story"]
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 and arg_139_1.var_.characterEffect1042ui_story == nil then
				arg_139_1.var_.characterEffect1042ui_story = var_142_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_2 = 0.2

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / var_142_2

				if arg_139_1.var_.characterEffect1042ui_story then
					local var_142_4 = Mathf.Lerp(0, 0.5, var_142_3)

					arg_139_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_139_1.var_.characterEffect1042ui_story.fillRatio = var_142_4
				end
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 and arg_139_1.var_.characterEffect1042ui_story then
				local var_142_5 = 0.5

				arg_139_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_139_1.var_.characterEffect1042ui_story.fillRatio = var_142_5
			end

			local var_142_6 = "1067ui_story"

			if arg_139_1.actors_[var_142_6] == nil then
				local var_142_7 = Object.Instantiate(Asset.Load("Char/" .. var_142_6), arg_139_1.stage_.transform)

				var_142_7.name = var_142_6
				var_142_7.transform.localPosition = Vector3.New(0, 100, 0)
				arg_139_1.actors_[var_142_6] = var_142_7

				local var_142_8 = var_142_7:GetComponentInChildren(typeof(CharacterEffect))

				var_142_8.enabled = true

				local var_142_9 = GameObjectTools.GetOrAddComponent(var_142_7, typeof(DynamicBoneHelper))

				if var_142_9 then
					var_142_9:EnableDynamicBone(false)
				end

				arg_139_1:ShowWeapon(var_142_8.transform, false)

				arg_139_1.var_[var_142_6 .. "Animator"] = var_142_8.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_139_1.var_[var_142_6 .. "Animator"].applyRootMotion = true
				arg_139_1.var_[var_142_6 .. "LipSync"] = var_142_8.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_142_10 = arg_139_1.actors_["1067ui_story"].transform
			local var_142_11 = 0

			if var_142_11 < arg_139_1.time_ and arg_139_1.time_ <= var_142_11 + arg_142_0 then
				arg_139_1.var_.moveOldPos1067ui_story = var_142_10.localPosition
			end

			local var_142_12 = 0.001

			if var_142_11 <= arg_139_1.time_ and arg_139_1.time_ < var_142_11 + var_142_12 then
				local var_142_13 = (arg_139_1.time_ - var_142_11) / var_142_12
				local var_142_14 = Vector3.New(0.7, -1.06, -6.2)

				var_142_10.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos1067ui_story, var_142_14, var_142_13)

				local var_142_15 = manager.ui.mainCamera.transform.position - var_142_10.position

				var_142_10.forward = Vector3.New(var_142_15.x, var_142_15.y, var_142_15.z)

				local var_142_16 = var_142_10.localEulerAngles

				var_142_16.z = 0
				var_142_16.x = 0
				var_142_10.localEulerAngles = var_142_16
			end

			if arg_139_1.time_ >= var_142_11 + var_142_12 and arg_139_1.time_ < var_142_11 + var_142_12 + arg_142_0 then
				var_142_10.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_142_17 = manager.ui.mainCamera.transform.position - var_142_10.position

				var_142_10.forward = Vector3.New(var_142_17.x, var_142_17.y, var_142_17.z)

				local var_142_18 = var_142_10.localEulerAngles

				var_142_18.z = 0
				var_142_18.x = 0
				var_142_10.localEulerAngles = var_142_18
			end

			local var_142_19 = 0

			if var_142_19 < arg_139_1.time_ and arg_139_1.time_ <= var_142_19 + arg_142_0 then
				arg_139_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/1067/1067action/1067action1_1")
			end

			local var_142_20 = 0

			if var_142_20 < arg_139_1.time_ and arg_139_1.time_ <= var_142_20 + arg_142_0 then
				arg_139_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_142_21 = arg_139_1.actors_["1067ui_story"]
			local var_142_22 = 0

			if var_142_22 < arg_139_1.time_ and arg_139_1.time_ <= var_142_22 + arg_142_0 and arg_139_1.var_.characterEffect1067ui_story == nil then
				arg_139_1.var_.characterEffect1067ui_story = var_142_21:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_23 = 0.2

			if var_142_22 <= arg_139_1.time_ and arg_139_1.time_ < var_142_22 + var_142_23 then
				local var_142_24 = (arg_139_1.time_ - var_142_22) / var_142_23

				if arg_139_1.var_.characterEffect1067ui_story then
					arg_139_1.var_.characterEffect1067ui_story.fillFlat = false
				end
			end

			if arg_139_1.time_ >= var_142_22 + var_142_23 and arg_139_1.time_ < var_142_22 + var_142_23 + arg_142_0 and arg_139_1.var_.characterEffect1067ui_story then
				arg_139_1.var_.characterEffect1067ui_story.fillFlat = false
			end

			local var_142_25 = 0
			local var_142_26 = 0.55

			if var_142_25 < arg_139_1.time_ and arg_139_1.time_ <= var_142_25 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_27 = arg_139_1:FormatText(StoryNameCfg[206].name)

				arg_139_1.leftNameTxt_.text = var_142_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_28 = arg_139_1:GetWordFromCfg(114191034)
				local var_142_29 = arg_139_1:FormatText(var_142_28.content)

				arg_139_1.text_.text = var_142_29

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_30 = 22
				local var_142_31 = utf8.len(var_142_29)
				local var_142_32 = var_142_30 <= 0 and var_142_26 or var_142_26 * (var_142_31 / var_142_30)

				if var_142_32 > 0 and var_142_26 < var_142_32 then
					arg_139_1.talkMaxDuration = var_142_32

					if var_142_32 + var_142_25 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_32 + var_142_25
					end
				end

				arg_139_1.text_.text = var_142_29
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191034", "story_v_out_114191.awb") ~= 0 then
					local var_142_33 = manager.audio:GetVoiceLength("story_v_out_114191", "114191034", "story_v_out_114191.awb") / 1000

					if var_142_33 + var_142_25 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_33 + var_142_25
					end

					if var_142_28.prefab_name ~= "" and arg_139_1.actors_[var_142_28.prefab_name] ~= nil then
						local var_142_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_28.prefab_name].transform, "story_v_out_114191", "114191034", "story_v_out_114191.awb")

						arg_139_1:RecordAudio("114191034", var_142_34)
						arg_139_1:RecordAudio("114191034", var_142_34)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_114191", "114191034", "story_v_out_114191.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_114191", "114191034", "story_v_out_114191.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_35 = math.max(var_142_26, arg_139_1.talkMaxDuration)

			if var_142_25 <= arg_139_1.time_ and arg_139_1.time_ < var_142_25 + var_142_35 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_25) / var_142_35

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_25 + var_142_35 and arg_139_1.time_ < var_142_25 + var_142_35 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play114191035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 114191035
		arg_143_1.duration_ = 5

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play114191036(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["1067ui_story"].transform
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 then
				arg_143_1.var_.moveOldPos1067ui_story = var_146_0.localPosition
			end

			local var_146_2 = 0.001

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / var_146_2
				local var_146_4 = Vector3.New(0, 100, 0)

				var_146_0.localPosition = Vector3.Lerp(arg_143_1.var_.moveOldPos1067ui_story, var_146_4, var_146_3)

				local var_146_5 = manager.ui.mainCamera.transform.position - var_146_0.position

				var_146_0.forward = Vector3.New(var_146_5.x, var_146_5.y, var_146_5.z)

				local var_146_6 = var_146_0.localEulerAngles

				var_146_6.z = 0
				var_146_6.x = 0
				var_146_0.localEulerAngles = var_146_6
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 then
				var_146_0.localPosition = Vector3.New(0, 100, 0)

				local var_146_7 = manager.ui.mainCamera.transform.position - var_146_0.position

				var_146_0.forward = Vector3.New(var_146_7.x, var_146_7.y, var_146_7.z)

				local var_146_8 = var_146_0.localEulerAngles

				var_146_8.z = 0
				var_146_8.x = 0
				var_146_0.localEulerAngles = var_146_8
			end

			local var_146_9 = arg_143_1.actors_["1042ui_story"].transform
			local var_146_10 = 0

			if var_146_10 < arg_143_1.time_ and arg_143_1.time_ <= var_146_10 + arg_146_0 then
				arg_143_1.var_.moveOldPos1042ui_story = var_146_9.localPosition
			end

			local var_146_11 = 0.001

			if var_146_10 <= arg_143_1.time_ and arg_143_1.time_ < var_146_10 + var_146_11 then
				local var_146_12 = (arg_143_1.time_ - var_146_10) / var_146_11
				local var_146_13 = Vector3.New(0, 100, 0)

				var_146_9.localPosition = Vector3.Lerp(arg_143_1.var_.moveOldPos1042ui_story, var_146_13, var_146_12)

				local var_146_14 = manager.ui.mainCamera.transform.position - var_146_9.position

				var_146_9.forward = Vector3.New(var_146_14.x, var_146_14.y, var_146_14.z)

				local var_146_15 = var_146_9.localEulerAngles

				var_146_15.z = 0
				var_146_15.x = 0
				var_146_9.localEulerAngles = var_146_15
			end

			if arg_143_1.time_ >= var_146_10 + var_146_11 and arg_143_1.time_ < var_146_10 + var_146_11 + arg_146_0 then
				var_146_9.localPosition = Vector3.New(0, 100, 0)

				local var_146_16 = manager.ui.mainCamera.transform.position - var_146_9.position

				var_146_9.forward = Vector3.New(var_146_16.x, var_146_16.y, var_146_16.z)

				local var_146_17 = var_146_9.localEulerAngles

				var_146_17.z = 0
				var_146_17.x = 0
				var_146_9.localEulerAngles = var_146_17
			end

			local var_146_18 = 0
			local var_146_19 = 1.5

			if var_146_18 < arg_143_1.time_ and arg_143_1.time_ <= var_146_18 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, false)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_20 = arg_143_1:GetWordFromCfg(114191035)
				local var_146_21 = arg_143_1:FormatText(var_146_20.content)

				arg_143_1.text_.text = var_146_21

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_22 = 60
				local var_146_23 = utf8.len(var_146_21)
				local var_146_24 = var_146_22 <= 0 and var_146_19 or var_146_19 * (var_146_23 / var_146_22)

				if var_146_24 > 0 and var_146_19 < var_146_24 then
					arg_143_1.talkMaxDuration = var_146_24

					if var_146_24 + var_146_18 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_24 + var_146_18
					end
				end

				arg_143_1.text_.text = var_146_21
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)
				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_25 = math.max(var_146_19, arg_143_1.talkMaxDuration)

			if var_146_18 <= arg_143_1.time_ and arg_143_1.time_ < var_146_18 + var_146_25 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_18) / var_146_25

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_18 + var_146_25 and arg_143_1.time_ < var_146_18 + var_146_25 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play114191036 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 114191036
		arg_147_1.duration_ = 5.9

		local var_147_0 = {
			ja = 3.633,
			ko = 4.766,
			zh = 4.4,
			en = 5.9
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
				arg_147_0:Play114191037(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = "1184ui_story"

			if arg_147_1.actors_[var_150_0] == nil then
				local var_150_1 = Object.Instantiate(Asset.Load("Char/" .. var_150_0), arg_147_1.stage_.transform)

				var_150_1.name = var_150_0
				var_150_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_147_1.actors_[var_150_0] = var_150_1

				local var_150_2 = var_150_1:GetComponentInChildren(typeof(CharacterEffect))

				var_150_2.enabled = true

				local var_150_3 = GameObjectTools.GetOrAddComponent(var_150_1, typeof(DynamicBoneHelper))

				if var_150_3 then
					var_150_3:EnableDynamicBone(false)
				end

				arg_147_1:ShowWeapon(var_150_2.transform, false)

				arg_147_1.var_[var_150_0 .. "Animator"] = var_150_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_147_1.var_[var_150_0 .. "Animator"].applyRootMotion = true
				arg_147_1.var_[var_150_0 .. "LipSync"] = var_150_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_150_4 = arg_147_1.actors_["1184ui_story"].transform
			local var_150_5 = 0

			if var_150_5 < arg_147_1.time_ and arg_147_1.time_ <= var_150_5 + arg_150_0 then
				arg_147_1.var_.moveOldPos1184ui_story = var_150_4.localPosition
			end

			local var_150_6 = 0.001

			if var_150_5 <= arg_147_1.time_ and arg_147_1.time_ < var_150_5 + var_150_6 then
				local var_150_7 = (arg_147_1.time_ - var_150_5) / var_150_6
				local var_150_8 = Vector3.New(-0.7, -0.97, -6)

				var_150_4.localPosition = Vector3.Lerp(arg_147_1.var_.moveOldPos1184ui_story, var_150_8, var_150_7)

				local var_150_9 = manager.ui.mainCamera.transform.position - var_150_4.position

				var_150_4.forward = Vector3.New(var_150_9.x, var_150_9.y, var_150_9.z)

				local var_150_10 = var_150_4.localEulerAngles

				var_150_10.z = 0
				var_150_10.x = 0
				var_150_4.localEulerAngles = var_150_10
			end

			if arg_147_1.time_ >= var_150_5 + var_150_6 and arg_147_1.time_ < var_150_5 + var_150_6 + arg_150_0 then
				var_150_4.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_150_11 = manager.ui.mainCamera.transform.position - var_150_4.position

				var_150_4.forward = Vector3.New(var_150_11.x, var_150_11.y, var_150_11.z)

				local var_150_12 = var_150_4.localEulerAngles

				var_150_12.z = 0
				var_150_12.x = 0
				var_150_4.localEulerAngles = var_150_12
			end

			local var_150_13 = 0

			if var_150_13 < arg_147_1.time_ and arg_147_1.time_ <= var_150_13 + arg_150_0 then
				arg_147_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_150_14 = 0

			if var_150_14 < arg_147_1.time_ and arg_147_1.time_ <= var_150_14 + arg_150_0 then
				arg_147_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_150_15 = arg_147_1.actors_["1184ui_story"]
			local var_150_16 = 0

			if var_150_16 < arg_147_1.time_ and arg_147_1.time_ <= var_150_16 + arg_150_0 and arg_147_1.var_.characterEffect1184ui_story == nil then
				arg_147_1.var_.characterEffect1184ui_story = var_150_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_17 = 0.2

			if var_150_16 <= arg_147_1.time_ and arg_147_1.time_ < var_150_16 + var_150_17 then
				local var_150_18 = (arg_147_1.time_ - var_150_16) / var_150_17

				if arg_147_1.var_.characterEffect1184ui_story then
					arg_147_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_147_1.time_ >= var_150_16 + var_150_17 and arg_147_1.time_ < var_150_16 + var_150_17 + arg_150_0 and arg_147_1.var_.characterEffect1184ui_story then
				arg_147_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_150_19 = 0
			local var_150_20 = 0.5

			if var_150_19 < arg_147_1.time_ and arg_147_1.time_ <= var_150_19 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_21 = arg_147_1:FormatText(StoryNameCfg[6].name)

				arg_147_1.leftNameTxt_.text = var_150_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_22 = arg_147_1:GetWordFromCfg(114191036)
				local var_150_23 = arg_147_1:FormatText(var_150_22.content)

				arg_147_1.text_.text = var_150_23

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_24 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191036", "story_v_out_114191.awb") ~= 0 then
					local var_150_27 = manager.audio:GetVoiceLength("story_v_out_114191", "114191036", "story_v_out_114191.awb") / 1000

					if var_150_27 + var_150_19 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_27 + var_150_19
					end

					if var_150_22.prefab_name ~= "" and arg_147_1.actors_[var_150_22.prefab_name] ~= nil then
						local var_150_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_22.prefab_name].transform, "story_v_out_114191", "114191036", "story_v_out_114191.awb")

						arg_147_1:RecordAudio("114191036", var_150_28)
						arg_147_1:RecordAudio("114191036", var_150_28)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_114191", "114191036", "story_v_out_114191.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_114191", "114191036", "story_v_out_114191.awb")
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
	Play114191037 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 114191037
		arg_151_1.duration_ = 3.066

		local var_151_0 = {
			ja = 3.066,
			ko = 1.999999999999,
			zh = 2.1,
			en = 1.999999999999
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
				arg_151_0:Play114191038(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = "10006ui_story"

			if arg_151_1.actors_[var_154_0] == nil then
				local var_154_1 = Object.Instantiate(Asset.Load("Char/" .. var_154_0), arg_151_1.stage_.transform)

				var_154_1.name = var_154_0
				var_154_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_151_1.actors_[var_154_0] = var_154_1

				local var_154_2 = var_154_1:GetComponentInChildren(typeof(CharacterEffect))

				var_154_2.enabled = true

				local var_154_3 = GameObjectTools.GetOrAddComponent(var_154_1, typeof(DynamicBoneHelper))

				if var_154_3 then
					var_154_3:EnableDynamicBone(false)
				end

				arg_151_1:ShowWeapon(var_154_2.transform, false)

				arg_151_1.var_[var_154_0 .. "Animator"] = var_154_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_151_1.var_[var_154_0 .. "Animator"].applyRootMotion = true
				arg_151_1.var_[var_154_0 .. "LipSync"] = var_154_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_154_4 = arg_151_1.actors_["10006ui_story"].transform
			local var_154_5 = 0

			if var_154_5 < arg_151_1.time_ and arg_151_1.time_ <= var_154_5 + arg_154_0 then
				arg_151_1.var_.moveOldPos10006ui_story = var_154_4.localPosition
			end

			local var_154_6 = 0.001

			if var_154_5 <= arg_151_1.time_ and arg_151_1.time_ < var_154_5 + var_154_6 then
				local var_154_7 = (arg_151_1.time_ - var_154_5) / var_154_6
				local var_154_8 = Vector3.New(0.7, -0.98, -5.65)

				var_154_4.localPosition = Vector3.Lerp(arg_151_1.var_.moveOldPos10006ui_story, var_154_8, var_154_7)

				local var_154_9 = manager.ui.mainCamera.transform.position - var_154_4.position

				var_154_4.forward = Vector3.New(var_154_9.x, var_154_9.y, var_154_9.z)

				local var_154_10 = var_154_4.localEulerAngles

				var_154_10.z = 0
				var_154_10.x = 0
				var_154_4.localEulerAngles = var_154_10
			end

			if arg_151_1.time_ >= var_154_5 + var_154_6 and arg_151_1.time_ < var_154_5 + var_154_6 + arg_154_0 then
				var_154_4.localPosition = Vector3.New(0.7, -0.98, -5.65)

				local var_154_11 = manager.ui.mainCamera.transform.position - var_154_4.position

				var_154_4.forward = Vector3.New(var_154_11.x, var_154_11.y, var_154_11.z)

				local var_154_12 = var_154_4.localEulerAngles

				var_154_12.z = 0
				var_154_12.x = 0
				var_154_4.localEulerAngles = var_154_12
			end

			local var_154_13 = 0

			if var_154_13 < arg_151_1.time_ and arg_151_1.time_ <= var_154_13 + arg_154_0 then
				arg_151_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/story10006/story10006action/10006action1_1")
			end

			local var_154_14 = 0

			if var_154_14 < arg_151_1.time_ and arg_151_1.time_ <= var_154_14 + arg_154_0 then
				arg_151_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_154_15 = arg_151_1.actors_["10006ui_story"]
			local var_154_16 = 0

			if var_154_16 < arg_151_1.time_ and arg_151_1.time_ <= var_154_16 + arg_154_0 and arg_151_1.var_.characterEffect10006ui_story == nil then
				arg_151_1.var_.characterEffect10006ui_story = var_154_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_17 = 0.2

			if var_154_16 <= arg_151_1.time_ and arg_151_1.time_ < var_154_16 + var_154_17 then
				local var_154_18 = (arg_151_1.time_ - var_154_16) / var_154_17

				if arg_151_1.var_.characterEffect10006ui_story then
					arg_151_1.var_.characterEffect10006ui_story.fillFlat = false
				end
			end

			if arg_151_1.time_ >= var_154_16 + var_154_17 and arg_151_1.time_ < var_154_16 + var_154_17 + arg_154_0 and arg_151_1.var_.characterEffect10006ui_story then
				arg_151_1.var_.characterEffect10006ui_story.fillFlat = false
			end

			local var_154_19 = arg_151_1.actors_["1184ui_story"]
			local var_154_20 = 0

			if var_154_20 < arg_151_1.time_ and arg_151_1.time_ <= var_154_20 + arg_154_0 and arg_151_1.var_.characterEffect1184ui_story == nil then
				arg_151_1.var_.characterEffect1184ui_story = var_154_19:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_21 = 0.2

			if var_154_20 <= arg_151_1.time_ and arg_151_1.time_ < var_154_20 + var_154_21 then
				local var_154_22 = (arg_151_1.time_ - var_154_20) / var_154_21

				if arg_151_1.var_.characterEffect1184ui_story then
					local var_154_23 = Mathf.Lerp(0, 0.5, var_154_22)

					arg_151_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_151_1.var_.characterEffect1184ui_story.fillRatio = var_154_23
				end
			end

			if arg_151_1.time_ >= var_154_20 + var_154_21 and arg_151_1.time_ < var_154_20 + var_154_21 + arg_154_0 and arg_151_1.var_.characterEffect1184ui_story then
				local var_154_24 = 0.5

				arg_151_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_151_1.var_.characterEffect1184ui_story.fillRatio = var_154_24
			end

			local var_154_25 = 0
			local var_154_26 = 0.175

			if var_154_25 < arg_151_1.time_ and arg_151_1.time_ <= var_154_25 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_27 = arg_151_1:FormatText(StoryNameCfg[212].name)

				arg_151_1.leftNameTxt_.text = var_154_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_28 = arg_151_1:GetWordFromCfg(114191037)
				local var_154_29 = arg_151_1:FormatText(var_154_28.content)

				arg_151_1.text_.text = var_154_29

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_30 = 7
				local var_154_31 = utf8.len(var_154_29)
				local var_154_32 = var_154_30 <= 0 and var_154_26 or var_154_26 * (var_154_31 / var_154_30)

				if var_154_32 > 0 and var_154_26 < var_154_32 then
					arg_151_1.talkMaxDuration = var_154_32

					if var_154_32 + var_154_25 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_32 + var_154_25
					end
				end

				arg_151_1.text_.text = var_154_29
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191037", "story_v_out_114191.awb") ~= 0 then
					local var_154_33 = manager.audio:GetVoiceLength("story_v_out_114191", "114191037", "story_v_out_114191.awb") / 1000

					if var_154_33 + var_154_25 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_33 + var_154_25
					end

					if var_154_28.prefab_name ~= "" and arg_151_1.actors_[var_154_28.prefab_name] ~= nil then
						local var_154_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_28.prefab_name].transform, "story_v_out_114191", "114191037", "story_v_out_114191.awb")

						arg_151_1:RecordAudio("114191037", var_154_34)
						arg_151_1:RecordAudio("114191037", var_154_34)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_114191", "114191037", "story_v_out_114191.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_114191", "114191037", "story_v_out_114191.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_35 = math.max(var_154_26, arg_151_1.talkMaxDuration)

			if var_154_25 <= arg_151_1.time_ and arg_151_1.time_ < var_154_25 + var_154_35 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_25) / var_154_35

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_25 + var_154_35 and arg_151_1.time_ < var_154_25 + var_154_35 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play114191038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 114191038
		arg_155_1.duration_ = 11.133

		local var_155_0 = {
			ja = 11.133,
			ko = 5.433,
			zh = 3.666,
			en = 3.533
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
				arg_155_0:Play114191039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = 0

			if var_158_0 < arg_155_1.time_ and arg_155_1.time_ <= var_158_0 + arg_158_0 then
				arg_155_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/story10006/story10006action/10006action6_1")
			end

			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 then
				arg_155_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_158_2 = 0
			local var_158_3 = 0.425

			if var_158_2 < arg_155_1.time_ and arg_155_1.time_ <= var_158_2 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_4 = arg_155_1:FormatText(StoryNameCfg[212].name)

				arg_155_1.leftNameTxt_.text = var_158_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_5 = arg_155_1:GetWordFromCfg(114191038)
				local var_158_6 = arg_155_1:FormatText(var_158_5.content)

				arg_155_1.text_.text = var_158_6

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_7 = 17
				local var_158_8 = utf8.len(var_158_6)
				local var_158_9 = var_158_7 <= 0 and var_158_3 or var_158_3 * (var_158_8 / var_158_7)

				if var_158_9 > 0 and var_158_3 < var_158_9 then
					arg_155_1.talkMaxDuration = var_158_9

					if var_158_9 + var_158_2 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_9 + var_158_2
					end
				end

				arg_155_1.text_.text = var_158_6
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191038", "story_v_out_114191.awb") ~= 0 then
					local var_158_10 = manager.audio:GetVoiceLength("story_v_out_114191", "114191038", "story_v_out_114191.awb") / 1000

					if var_158_10 + var_158_2 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_10 + var_158_2
					end

					if var_158_5.prefab_name ~= "" and arg_155_1.actors_[var_158_5.prefab_name] ~= nil then
						local var_158_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_5.prefab_name].transform, "story_v_out_114191", "114191038", "story_v_out_114191.awb")

						arg_155_1:RecordAudio("114191038", var_158_11)
						arg_155_1:RecordAudio("114191038", var_158_11)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_114191", "114191038", "story_v_out_114191.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_114191", "114191038", "story_v_out_114191.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_12 = math.max(var_158_3, arg_155_1.talkMaxDuration)

			if var_158_2 <= arg_155_1.time_ and arg_155_1.time_ < var_158_2 + var_158_12 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_2) / var_158_12

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_2 + var_158_12 and arg_155_1.time_ < var_158_2 + var_158_12 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play114191039 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 114191039
		arg_159_1.duration_ = 5.7

		local var_159_0 = {
			ja = 5.7,
			ko = 4.866,
			zh = 3.733,
			en = 4.8
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
				arg_159_0:Play114191040(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0

			if var_162_0 < arg_159_1.time_ and arg_159_1.time_ <= var_162_0 + arg_162_0 then
				arg_159_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action8_1")
			end

			local var_162_1 = 0

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 then
				arg_159_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_162_2 = arg_159_1.actors_["1184ui_story"]
			local var_162_3 = 0

			if var_162_3 < arg_159_1.time_ and arg_159_1.time_ <= var_162_3 + arg_162_0 and arg_159_1.var_.characterEffect1184ui_story == nil then
				arg_159_1.var_.characterEffect1184ui_story = var_162_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_4 = 0.2

			if var_162_3 <= arg_159_1.time_ and arg_159_1.time_ < var_162_3 + var_162_4 then
				local var_162_5 = (arg_159_1.time_ - var_162_3) / var_162_4

				if arg_159_1.var_.characterEffect1184ui_story then
					arg_159_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_159_1.time_ >= var_162_3 + var_162_4 and arg_159_1.time_ < var_162_3 + var_162_4 + arg_162_0 and arg_159_1.var_.characterEffect1184ui_story then
				arg_159_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_162_6 = arg_159_1.actors_["10006ui_story"]
			local var_162_7 = 0

			if var_162_7 < arg_159_1.time_ and arg_159_1.time_ <= var_162_7 + arg_162_0 and arg_159_1.var_.characterEffect10006ui_story == nil then
				arg_159_1.var_.characterEffect10006ui_story = var_162_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_8 = 0.2

			if var_162_7 <= arg_159_1.time_ and arg_159_1.time_ < var_162_7 + var_162_8 then
				local var_162_9 = (arg_159_1.time_ - var_162_7) / var_162_8

				if arg_159_1.var_.characterEffect10006ui_story then
					local var_162_10 = Mathf.Lerp(0, 0.5, var_162_9)

					arg_159_1.var_.characterEffect10006ui_story.fillFlat = true
					arg_159_1.var_.characterEffect10006ui_story.fillRatio = var_162_10
				end
			end

			if arg_159_1.time_ >= var_162_7 + var_162_8 and arg_159_1.time_ < var_162_7 + var_162_8 + arg_162_0 and arg_159_1.var_.characterEffect10006ui_story then
				local var_162_11 = 0.5

				arg_159_1.var_.characterEffect10006ui_story.fillFlat = true
				arg_159_1.var_.characterEffect10006ui_story.fillRatio = var_162_11
			end

			local var_162_12 = 0
			local var_162_13 = 0.45

			if var_162_12 < arg_159_1.time_ and arg_159_1.time_ <= var_162_12 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_14 = arg_159_1:FormatText(StoryNameCfg[6].name)

				arg_159_1.leftNameTxt_.text = var_162_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_15 = arg_159_1:GetWordFromCfg(114191039)
				local var_162_16 = arg_159_1:FormatText(var_162_15.content)

				arg_159_1.text_.text = var_162_16

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_17 = 18
				local var_162_18 = utf8.len(var_162_16)
				local var_162_19 = var_162_17 <= 0 and var_162_13 or var_162_13 * (var_162_18 / var_162_17)

				if var_162_19 > 0 and var_162_13 < var_162_19 then
					arg_159_1.talkMaxDuration = var_162_19

					if var_162_19 + var_162_12 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_19 + var_162_12
					end
				end

				arg_159_1.text_.text = var_162_16
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191039", "story_v_out_114191.awb") ~= 0 then
					local var_162_20 = manager.audio:GetVoiceLength("story_v_out_114191", "114191039", "story_v_out_114191.awb") / 1000

					if var_162_20 + var_162_12 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_20 + var_162_12
					end

					if var_162_15.prefab_name ~= "" and arg_159_1.actors_[var_162_15.prefab_name] ~= nil then
						local var_162_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_15.prefab_name].transform, "story_v_out_114191", "114191039", "story_v_out_114191.awb")

						arg_159_1:RecordAudio("114191039", var_162_21)
						arg_159_1:RecordAudio("114191039", var_162_21)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_114191", "114191039", "story_v_out_114191.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_114191", "114191039", "story_v_out_114191.awb")
				end

				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_22 = math.max(var_162_13, arg_159_1.talkMaxDuration)

			if var_162_12 <= arg_159_1.time_ and arg_159_1.time_ < var_162_12 + var_162_22 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_12) / var_162_22

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_12 + var_162_22 and arg_159_1.time_ < var_162_12 + var_162_22 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play114191040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 114191040
		arg_163_1.duration_ = 11.1

		local var_163_0 = {
			ja = 11.1,
			ko = 5.733,
			zh = 4.933,
			en = 5.866
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
				arg_163_0:Play114191041(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["1184ui_story"].transform
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 then
				arg_163_1.var_.moveOldPos1184ui_story = var_166_0.localPosition
			end

			local var_166_2 = 0.001

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_2 then
				local var_166_3 = (arg_163_1.time_ - var_166_1) / var_166_2
				local var_166_4 = Vector3.New(0, 100, 0)

				var_166_0.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos1184ui_story, var_166_4, var_166_3)

				local var_166_5 = manager.ui.mainCamera.transform.position - var_166_0.position

				var_166_0.forward = Vector3.New(var_166_5.x, var_166_5.y, var_166_5.z)

				local var_166_6 = var_166_0.localEulerAngles

				var_166_6.z = 0
				var_166_6.x = 0
				var_166_0.localEulerAngles = var_166_6
			end

			if arg_163_1.time_ >= var_166_1 + var_166_2 and arg_163_1.time_ < var_166_1 + var_166_2 + arg_166_0 then
				var_166_0.localPosition = Vector3.New(0, 100, 0)

				local var_166_7 = manager.ui.mainCamera.transform.position - var_166_0.position

				var_166_0.forward = Vector3.New(var_166_7.x, var_166_7.y, var_166_7.z)

				local var_166_8 = var_166_0.localEulerAngles

				var_166_8.z = 0
				var_166_8.x = 0
				var_166_0.localEulerAngles = var_166_8
			end

			local var_166_9 = "1038ui_story"

			if arg_163_1.actors_[var_166_9] == nil then
				local var_166_10 = Object.Instantiate(Asset.Load("Char/" .. var_166_9), arg_163_1.stage_.transform)

				var_166_10.name = var_166_9
				var_166_10.transform.localPosition = Vector3.New(0, 100, 0)
				arg_163_1.actors_[var_166_9] = var_166_10

				local var_166_11 = var_166_10:GetComponentInChildren(typeof(CharacterEffect))

				var_166_11.enabled = true

				local var_166_12 = GameObjectTools.GetOrAddComponent(var_166_10, typeof(DynamicBoneHelper))

				if var_166_12 then
					var_166_12:EnableDynamicBone(false)
				end

				arg_163_1:ShowWeapon(var_166_11.transform, false)

				arg_163_1.var_[var_166_9 .. "Animator"] = var_166_11.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_163_1.var_[var_166_9 .. "Animator"].applyRootMotion = true
				arg_163_1.var_[var_166_9 .. "LipSync"] = var_166_11.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_166_13 = arg_163_1.actors_["1038ui_story"].transform
			local var_166_14 = 0

			if var_166_14 < arg_163_1.time_ and arg_163_1.time_ <= var_166_14 + arg_166_0 then
				arg_163_1.var_.moveOldPos1038ui_story = var_166_13.localPosition
			end

			local var_166_15 = 0.001

			if var_166_14 <= arg_163_1.time_ and arg_163_1.time_ < var_166_14 + var_166_15 then
				local var_166_16 = (arg_163_1.time_ - var_166_14) / var_166_15
				local var_166_17 = Vector3.New(-0.7, -1.11, -5.9)

				var_166_13.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos1038ui_story, var_166_17, var_166_16)

				local var_166_18 = manager.ui.mainCamera.transform.position - var_166_13.position

				var_166_13.forward = Vector3.New(var_166_18.x, var_166_18.y, var_166_18.z)

				local var_166_19 = var_166_13.localEulerAngles

				var_166_19.z = 0
				var_166_19.x = 0
				var_166_13.localEulerAngles = var_166_19
			end

			if arg_163_1.time_ >= var_166_14 + var_166_15 and arg_163_1.time_ < var_166_14 + var_166_15 + arg_166_0 then
				var_166_13.localPosition = Vector3.New(-0.7, -1.11, -5.9)

				local var_166_20 = manager.ui.mainCamera.transform.position - var_166_13.position

				var_166_13.forward = Vector3.New(var_166_20.x, var_166_20.y, var_166_20.z)

				local var_166_21 = var_166_13.localEulerAngles

				var_166_21.z = 0
				var_166_21.x = 0
				var_166_13.localEulerAngles = var_166_21
			end

			local var_166_22 = 0

			if var_166_22 < arg_163_1.time_ and arg_163_1.time_ <= var_166_22 + arg_166_0 then
				arg_163_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action1_1")
			end

			local var_166_23 = 0

			if var_166_23 < arg_163_1.time_ and arg_163_1.time_ <= var_166_23 + arg_166_0 then
				arg_163_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_166_24 = arg_163_1.actors_["1038ui_story"]
			local var_166_25 = 0

			if var_166_25 < arg_163_1.time_ and arg_163_1.time_ <= var_166_25 + arg_166_0 and arg_163_1.var_.characterEffect1038ui_story == nil then
				arg_163_1.var_.characterEffect1038ui_story = var_166_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_26 = 0.2

			if var_166_25 <= arg_163_1.time_ and arg_163_1.time_ < var_166_25 + var_166_26 then
				local var_166_27 = (arg_163_1.time_ - var_166_25) / var_166_26

				if arg_163_1.var_.characterEffect1038ui_story then
					arg_163_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_163_1.time_ >= var_166_25 + var_166_26 and arg_163_1.time_ < var_166_25 + var_166_26 + arg_166_0 and arg_163_1.var_.characterEffect1038ui_story then
				arg_163_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_166_28 = 0
			local var_166_29 = 0.625

			if var_166_28 < arg_163_1.time_ and arg_163_1.time_ <= var_166_28 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_30 = arg_163_1:FormatText(StoryNameCfg[94].name)

				arg_163_1.leftNameTxt_.text = var_166_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_31 = arg_163_1:GetWordFromCfg(114191040)
				local var_166_32 = arg_163_1:FormatText(var_166_31.content)

				arg_163_1.text_.text = var_166_32

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_33 = 25
				local var_166_34 = utf8.len(var_166_32)
				local var_166_35 = var_166_33 <= 0 and var_166_29 or var_166_29 * (var_166_34 / var_166_33)

				if var_166_35 > 0 and var_166_29 < var_166_35 then
					arg_163_1.talkMaxDuration = var_166_35

					if var_166_35 + var_166_28 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_35 + var_166_28
					end
				end

				arg_163_1.text_.text = var_166_32
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191040", "story_v_out_114191.awb") ~= 0 then
					local var_166_36 = manager.audio:GetVoiceLength("story_v_out_114191", "114191040", "story_v_out_114191.awb") / 1000

					if var_166_36 + var_166_28 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_36 + var_166_28
					end

					if var_166_31.prefab_name ~= "" and arg_163_1.actors_[var_166_31.prefab_name] ~= nil then
						local var_166_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_31.prefab_name].transform, "story_v_out_114191", "114191040", "story_v_out_114191.awb")

						arg_163_1:RecordAudio("114191040", var_166_37)
						arg_163_1:RecordAudio("114191040", var_166_37)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_114191", "114191040", "story_v_out_114191.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_114191", "114191040", "story_v_out_114191.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_38 = math.max(var_166_29, arg_163_1.talkMaxDuration)

			if var_166_28 <= arg_163_1.time_ and arg_163_1.time_ < var_166_28 + var_166_38 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_28) / var_166_38

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_28 + var_166_38 and arg_163_1.time_ < var_166_28 + var_166_38 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play114191041 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 114191041
		arg_167_1.duration_ = 8.766

		local var_167_0 = {
			ja = 8.766,
			ko = 5.7,
			zh = 5.3,
			en = 6.2
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
				arg_167_0:Play114191042(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = 0

			if var_170_0 < arg_167_1.time_ and arg_167_1.time_ <= var_170_0 + arg_170_0 then
				arg_167_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/story10006/story10006actionlink/10006action464")
			end

			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 then
				arg_167_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_170_2 = arg_167_1.actors_["10006ui_story"]
			local var_170_3 = 0

			if var_170_3 < arg_167_1.time_ and arg_167_1.time_ <= var_170_3 + arg_170_0 and arg_167_1.var_.characterEffect10006ui_story == nil then
				arg_167_1.var_.characterEffect10006ui_story = var_170_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_4 = 0.2

			if var_170_3 <= arg_167_1.time_ and arg_167_1.time_ < var_170_3 + var_170_4 then
				local var_170_5 = (arg_167_1.time_ - var_170_3) / var_170_4

				if arg_167_1.var_.characterEffect10006ui_story then
					arg_167_1.var_.characterEffect10006ui_story.fillFlat = false
				end
			end

			if arg_167_1.time_ >= var_170_3 + var_170_4 and arg_167_1.time_ < var_170_3 + var_170_4 + arg_170_0 and arg_167_1.var_.characterEffect10006ui_story then
				arg_167_1.var_.characterEffect10006ui_story.fillFlat = false
			end

			local var_170_6 = arg_167_1.actors_["1038ui_story"]
			local var_170_7 = 0

			if var_170_7 < arg_167_1.time_ and arg_167_1.time_ <= var_170_7 + arg_170_0 and arg_167_1.var_.characterEffect1038ui_story == nil then
				arg_167_1.var_.characterEffect1038ui_story = var_170_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_8 = 0.2

			if var_170_7 <= arg_167_1.time_ and arg_167_1.time_ < var_170_7 + var_170_8 then
				local var_170_9 = (arg_167_1.time_ - var_170_7) / var_170_8

				if arg_167_1.var_.characterEffect1038ui_story then
					local var_170_10 = Mathf.Lerp(0, 0.5, var_170_9)

					arg_167_1.var_.characterEffect1038ui_story.fillFlat = true
					arg_167_1.var_.characterEffect1038ui_story.fillRatio = var_170_10
				end
			end

			if arg_167_1.time_ >= var_170_7 + var_170_8 and arg_167_1.time_ < var_170_7 + var_170_8 + arg_170_0 and arg_167_1.var_.characterEffect1038ui_story then
				local var_170_11 = 0.5

				arg_167_1.var_.characterEffect1038ui_story.fillFlat = true
				arg_167_1.var_.characterEffect1038ui_story.fillRatio = var_170_11
			end

			local var_170_12 = 0
			local var_170_13 = 0.575

			if var_170_12 < arg_167_1.time_ and arg_167_1.time_ <= var_170_12 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_14 = arg_167_1:FormatText(StoryNameCfg[212].name)

				arg_167_1.leftNameTxt_.text = var_170_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_15 = arg_167_1:GetWordFromCfg(114191041)
				local var_170_16 = arg_167_1:FormatText(var_170_15.content)

				arg_167_1.text_.text = var_170_16

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_17 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191041", "story_v_out_114191.awb") ~= 0 then
					local var_170_20 = manager.audio:GetVoiceLength("story_v_out_114191", "114191041", "story_v_out_114191.awb") / 1000

					if var_170_20 + var_170_12 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_20 + var_170_12
					end

					if var_170_15.prefab_name ~= "" and arg_167_1.actors_[var_170_15.prefab_name] ~= nil then
						local var_170_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_15.prefab_name].transform, "story_v_out_114191", "114191041", "story_v_out_114191.awb")

						arg_167_1:RecordAudio("114191041", var_170_21)
						arg_167_1:RecordAudio("114191041", var_170_21)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_114191", "114191041", "story_v_out_114191.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_114191", "114191041", "story_v_out_114191.awb")
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
	Play114191042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 114191042
		arg_171_1.duration_ = 4.866

		local var_171_0 = {
			ja = 4.866,
			ko = 3.4,
			zh = 3,
			en = 2.533
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
				arg_171_0:Play114191043(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["10006ui_story"].transform
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 then
				arg_171_1.var_.moveOldPos10006ui_story = var_174_0.localPosition
			end

			local var_174_2 = 0.001

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_2 then
				local var_174_3 = (arg_171_1.time_ - var_174_1) / var_174_2
				local var_174_4 = Vector3.New(0, 100, 0)

				var_174_0.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos10006ui_story, var_174_4, var_174_3)

				local var_174_5 = manager.ui.mainCamera.transform.position - var_174_0.position

				var_174_0.forward = Vector3.New(var_174_5.x, var_174_5.y, var_174_5.z)

				local var_174_6 = var_174_0.localEulerAngles

				var_174_6.z = 0
				var_174_6.x = 0
				var_174_0.localEulerAngles = var_174_6
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 then
				var_174_0.localPosition = Vector3.New(0, 100, 0)

				local var_174_7 = manager.ui.mainCamera.transform.position - var_174_0.position

				var_174_0.forward = Vector3.New(var_174_7.x, var_174_7.y, var_174_7.z)

				local var_174_8 = var_174_0.localEulerAngles

				var_174_8.z = 0
				var_174_8.x = 0
				var_174_0.localEulerAngles = var_174_8
			end

			local var_174_9 = "1041ui_story"

			if arg_171_1.actors_[var_174_9] == nil then
				local var_174_10 = Object.Instantiate(Asset.Load("Char/" .. var_174_9), arg_171_1.stage_.transform)

				var_174_10.name = var_174_9
				var_174_10.transform.localPosition = Vector3.New(0, 100, 0)
				arg_171_1.actors_[var_174_9] = var_174_10

				local var_174_11 = var_174_10:GetComponentInChildren(typeof(CharacterEffect))

				var_174_11.enabled = true

				local var_174_12 = GameObjectTools.GetOrAddComponent(var_174_10, typeof(DynamicBoneHelper))

				if var_174_12 then
					var_174_12:EnableDynamicBone(false)
				end

				arg_171_1:ShowWeapon(var_174_11.transform, false)

				arg_171_1.var_[var_174_9 .. "Animator"] = var_174_11.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_171_1.var_[var_174_9 .. "Animator"].applyRootMotion = true
				arg_171_1.var_[var_174_9 .. "LipSync"] = var_174_11.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_174_13 = arg_171_1.actors_["1041ui_story"].transform
			local var_174_14 = 0

			if var_174_14 < arg_171_1.time_ and arg_171_1.time_ <= var_174_14 + arg_174_0 then
				arg_171_1.var_.moveOldPos1041ui_story = var_174_13.localPosition
			end

			local var_174_15 = 0.001

			if var_174_14 <= arg_171_1.time_ and arg_171_1.time_ < var_174_14 + var_174_15 then
				local var_174_16 = (arg_171_1.time_ - var_174_14) / var_174_15
				local var_174_17 = Vector3.New(0.7, -1.11, -5.9)

				var_174_13.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos1041ui_story, var_174_17, var_174_16)

				local var_174_18 = manager.ui.mainCamera.transform.position - var_174_13.position

				var_174_13.forward = Vector3.New(var_174_18.x, var_174_18.y, var_174_18.z)

				local var_174_19 = var_174_13.localEulerAngles

				var_174_19.z = 0
				var_174_19.x = 0
				var_174_13.localEulerAngles = var_174_19
			end

			if arg_171_1.time_ >= var_174_14 + var_174_15 and arg_171_1.time_ < var_174_14 + var_174_15 + arg_174_0 then
				var_174_13.localPosition = Vector3.New(0.7, -1.11, -5.9)

				local var_174_20 = manager.ui.mainCamera.transform.position - var_174_13.position

				var_174_13.forward = Vector3.New(var_174_20.x, var_174_20.y, var_174_20.z)

				local var_174_21 = var_174_13.localEulerAngles

				var_174_21.z = 0
				var_174_21.x = 0
				var_174_13.localEulerAngles = var_174_21
			end

			local var_174_22 = 0

			if var_174_22 < arg_171_1.time_ and arg_171_1.time_ <= var_174_22 + arg_174_0 then
				arg_171_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_174_23 = 0

			if var_174_23 < arg_171_1.time_ and arg_171_1.time_ <= var_174_23 + arg_174_0 then
				arg_171_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/1041/1041action/1041action1_1")
			end

			local var_174_24 = arg_171_1.actors_["1041ui_story"]
			local var_174_25 = 0

			if var_174_25 < arg_171_1.time_ and arg_171_1.time_ <= var_174_25 + arg_174_0 and arg_171_1.var_.characterEffect1041ui_story == nil then
				arg_171_1.var_.characterEffect1041ui_story = var_174_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_26 = 0.2

			if var_174_25 <= arg_171_1.time_ and arg_171_1.time_ < var_174_25 + var_174_26 then
				local var_174_27 = (arg_171_1.time_ - var_174_25) / var_174_26

				if arg_171_1.var_.characterEffect1041ui_story then
					arg_171_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_171_1.time_ >= var_174_25 + var_174_26 and arg_171_1.time_ < var_174_25 + var_174_26 + arg_174_0 and arg_171_1.var_.characterEffect1041ui_story then
				arg_171_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_174_28 = 0
			local var_174_29 = 0.325

			if var_174_28 < arg_171_1.time_ and arg_171_1.time_ <= var_174_28 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_30 = arg_171_1:FormatText(StoryNameCfg[208].name)

				arg_171_1.leftNameTxt_.text = var_174_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_31 = arg_171_1:GetWordFromCfg(114191042)
				local var_174_32 = arg_171_1:FormatText(var_174_31.content)

				arg_171_1.text_.text = var_174_32

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_33 = 13
				local var_174_34 = utf8.len(var_174_32)
				local var_174_35 = var_174_33 <= 0 and var_174_29 or var_174_29 * (var_174_34 / var_174_33)

				if var_174_35 > 0 and var_174_29 < var_174_35 then
					arg_171_1.talkMaxDuration = var_174_35

					if var_174_35 + var_174_28 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_35 + var_174_28
					end
				end

				arg_171_1.text_.text = var_174_32
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191042", "story_v_out_114191.awb") ~= 0 then
					local var_174_36 = manager.audio:GetVoiceLength("story_v_out_114191", "114191042", "story_v_out_114191.awb") / 1000

					if var_174_36 + var_174_28 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_36 + var_174_28
					end

					if var_174_31.prefab_name ~= "" and arg_171_1.actors_[var_174_31.prefab_name] ~= nil then
						local var_174_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_31.prefab_name].transform, "story_v_out_114191", "114191042", "story_v_out_114191.awb")

						arg_171_1:RecordAudio("114191042", var_174_37)
						arg_171_1:RecordAudio("114191042", var_174_37)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_114191", "114191042", "story_v_out_114191.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_114191", "114191042", "story_v_out_114191.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_38 = math.max(var_174_29, arg_171_1.talkMaxDuration)

			if var_174_28 <= arg_171_1.time_ and arg_171_1.time_ < var_174_28 + var_174_38 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_28) / var_174_38

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_28 + var_174_38 and arg_171_1.time_ < var_174_28 + var_174_38 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play114191043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 114191043
		arg_175_1.duration_ = 6.833

		local var_175_0 = {
			ja = 5.8,
			ko = 4.533,
			zh = 6.833,
			en = 6.233
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
				arg_175_0:Play114191044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["1041ui_story"]
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 and arg_175_1.var_.characterEffect1041ui_story == nil then
				arg_175_1.var_.characterEffect1041ui_story = var_178_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_2 = 0.2

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2

				if arg_175_1.var_.characterEffect1041ui_story then
					local var_178_4 = Mathf.Lerp(0, 0.5, var_178_3)

					arg_175_1.var_.characterEffect1041ui_story.fillFlat = true
					arg_175_1.var_.characterEffect1041ui_story.fillRatio = var_178_4
				end
			end

			if arg_175_1.time_ >= var_178_1 + var_178_2 and arg_175_1.time_ < var_178_1 + var_178_2 + arg_178_0 and arg_175_1.var_.characterEffect1041ui_story then
				local var_178_5 = 0.5

				arg_175_1.var_.characterEffect1041ui_story.fillFlat = true
				arg_175_1.var_.characterEffect1041ui_story.fillRatio = var_178_5
			end

			local var_178_6 = 0

			if var_178_6 < arg_175_1.time_ and arg_175_1.time_ <= var_178_6 + arg_178_0 then
				arg_175_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action3_1")
			end

			local var_178_7 = 0

			if var_178_7 < arg_175_1.time_ and arg_175_1.time_ <= var_178_7 + arg_178_0 then
				arg_175_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_178_8 = arg_175_1.actors_["1038ui_story"]
			local var_178_9 = 0

			if var_178_9 < arg_175_1.time_ and arg_175_1.time_ <= var_178_9 + arg_178_0 and arg_175_1.var_.characterEffect1038ui_story == nil then
				arg_175_1.var_.characterEffect1038ui_story = var_178_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_10 = 0.2

			if var_178_9 <= arg_175_1.time_ and arg_175_1.time_ < var_178_9 + var_178_10 then
				local var_178_11 = (arg_175_1.time_ - var_178_9) / var_178_10

				if arg_175_1.var_.characterEffect1038ui_story then
					arg_175_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_175_1.time_ >= var_178_9 + var_178_10 and arg_175_1.time_ < var_178_9 + var_178_10 + arg_178_0 and arg_175_1.var_.characterEffect1038ui_story then
				arg_175_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_178_12 = 0
			local var_178_13 = 0.575

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

				local var_178_15 = arg_175_1:GetWordFromCfg(114191043)
				local var_178_16 = arg_175_1:FormatText(var_178_15.content)

				arg_175_1.text_.text = var_178_16

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_17 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191043", "story_v_out_114191.awb") ~= 0 then
					local var_178_20 = manager.audio:GetVoiceLength("story_v_out_114191", "114191043", "story_v_out_114191.awb") / 1000

					if var_178_20 + var_178_12 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_20 + var_178_12
					end

					if var_178_15.prefab_name ~= "" and arg_175_1.actors_[var_178_15.prefab_name] ~= nil then
						local var_178_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_15.prefab_name].transform, "story_v_out_114191", "114191043", "story_v_out_114191.awb")

						arg_175_1:RecordAudio("114191043", var_178_21)
						arg_175_1:RecordAudio("114191043", var_178_21)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_114191", "114191043", "story_v_out_114191.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_114191", "114191043", "story_v_out_114191.awb")
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
	Play114191044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 114191044
		arg_179_1.duration_ = 8.233

		local var_179_0 = {
			ja = 8.233,
			ko = 6.9,
			zh = 6.866,
			en = 7.466
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
				arg_179_0:Play114191045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = 0

			if var_182_0 < arg_179_1.time_ and arg_179_1.time_ <= var_182_0 + arg_182_0 then
				arg_179_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 then
				arg_179_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/1041/1041action/1041action3_1")
			end

			local var_182_2 = arg_179_1.actors_["1041ui_story"]
			local var_182_3 = 0

			if var_182_3 < arg_179_1.time_ and arg_179_1.time_ <= var_182_3 + arg_182_0 and arg_179_1.var_.characterEffect1041ui_story == nil then
				arg_179_1.var_.characterEffect1041ui_story = var_182_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_4 = 0.2

			if var_182_3 <= arg_179_1.time_ and arg_179_1.time_ < var_182_3 + var_182_4 then
				local var_182_5 = (arg_179_1.time_ - var_182_3) / var_182_4

				if arg_179_1.var_.characterEffect1041ui_story then
					arg_179_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_179_1.time_ >= var_182_3 + var_182_4 and arg_179_1.time_ < var_182_3 + var_182_4 + arg_182_0 and arg_179_1.var_.characterEffect1041ui_story then
				arg_179_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_182_6 = arg_179_1.actors_["1038ui_story"]
			local var_182_7 = 0

			if var_182_7 < arg_179_1.time_ and arg_179_1.time_ <= var_182_7 + arg_182_0 and arg_179_1.var_.characterEffect1038ui_story == nil then
				arg_179_1.var_.characterEffect1038ui_story = var_182_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_8 = 0.2

			if var_182_7 <= arg_179_1.time_ and arg_179_1.time_ < var_182_7 + var_182_8 then
				local var_182_9 = (arg_179_1.time_ - var_182_7) / var_182_8

				if arg_179_1.var_.characterEffect1038ui_story then
					local var_182_10 = Mathf.Lerp(0, 0.5, var_182_9)

					arg_179_1.var_.characterEffect1038ui_story.fillFlat = true
					arg_179_1.var_.characterEffect1038ui_story.fillRatio = var_182_10
				end
			end

			if arg_179_1.time_ >= var_182_7 + var_182_8 and arg_179_1.time_ < var_182_7 + var_182_8 + arg_182_0 and arg_179_1.var_.characterEffect1038ui_story then
				local var_182_11 = 0.5

				arg_179_1.var_.characterEffect1038ui_story.fillFlat = true
				arg_179_1.var_.characterEffect1038ui_story.fillRatio = var_182_11
			end

			local var_182_12 = 0
			local var_182_13 = 0.675

			if var_182_12 < arg_179_1.time_ and arg_179_1.time_ <= var_182_12 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_14 = arg_179_1:FormatText(StoryNameCfg[208].name)

				arg_179_1.leftNameTxt_.text = var_182_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_15 = arg_179_1:GetWordFromCfg(114191044)
				local var_182_16 = arg_179_1:FormatText(var_182_15.content)

				arg_179_1.text_.text = var_182_16

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_17 = 27
				local var_182_18 = utf8.len(var_182_16)
				local var_182_19 = var_182_17 <= 0 and var_182_13 or var_182_13 * (var_182_18 / var_182_17)

				if var_182_19 > 0 and var_182_13 < var_182_19 then
					arg_179_1.talkMaxDuration = var_182_19

					if var_182_19 + var_182_12 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_19 + var_182_12
					end
				end

				arg_179_1.text_.text = var_182_16
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191044", "story_v_out_114191.awb") ~= 0 then
					local var_182_20 = manager.audio:GetVoiceLength("story_v_out_114191", "114191044", "story_v_out_114191.awb") / 1000

					if var_182_20 + var_182_12 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_20 + var_182_12
					end

					if var_182_15.prefab_name ~= "" and arg_179_1.actors_[var_182_15.prefab_name] ~= nil then
						local var_182_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_15.prefab_name].transform, "story_v_out_114191", "114191044", "story_v_out_114191.awb")

						arg_179_1:RecordAudio("114191044", var_182_21)
						arg_179_1:RecordAudio("114191044", var_182_21)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_114191", "114191044", "story_v_out_114191.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_114191", "114191044", "story_v_out_114191.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_22 = math.max(var_182_13, arg_179_1.talkMaxDuration)

			if var_182_12 <= arg_179_1.time_ and arg_179_1.time_ < var_182_12 + var_182_22 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_12) / var_182_22

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_12 + var_182_22 and arg_179_1.time_ < var_182_12 + var_182_22 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play114191045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 114191045
		arg_183_1.duration_ = 10

		local var_183_0 = {
			ja = 8.333,
			ko = 9.533,
			zh = 9.3,
			en = 10
		}
		local var_183_1 = manager.audio:GetLocalizationFlag()

		if var_183_0[var_183_1] ~= nil then
			arg_183_1.duration_ = var_183_0[var_183_1]
		end

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play114191046(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["1041ui_story"]
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 and arg_183_1.var_.characterEffect1041ui_story == nil then
				arg_183_1.var_.characterEffect1041ui_story = var_186_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_2 = 0.2

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_2 then
				local var_186_3 = (arg_183_1.time_ - var_186_1) / var_186_2

				if arg_183_1.var_.characterEffect1041ui_story then
					local var_186_4 = Mathf.Lerp(0, 0.5, var_186_3)

					arg_183_1.var_.characterEffect1041ui_story.fillFlat = true
					arg_183_1.var_.characterEffect1041ui_story.fillRatio = var_186_4
				end
			end

			if arg_183_1.time_ >= var_186_1 + var_186_2 and arg_183_1.time_ < var_186_1 + var_186_2 + arg_186_0 and arg_183_1.var_.characterEffect1041ui_story then
				local var_186_5 = 0.5

				arg_183_1.var_.characterEffect1041ui_story.fillFlat = true
				arg_183_1.var_.characterEffect1041ui_story.fillRatio = var_186_5
			end

			local var_186_6 = arg_183_1.actors_["1038ui_story"]
			local var_186_7 = 0

			if var_186_7 < arg_183_1.time_ and arg_183_1.time_ <= var_186_7 + arg_186_0 and arg_183_1.var_.characterEffect1038ui_story == nil then
				arg_183_1.var_.characterEffect1038ui_story = var_186_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_8 = 0.2

			if var_186_7 <= arg_183_1.time_ and arg_183_1.time_ < var_186_7 + var_186_8 then
				local var_186_9 = (arg_183_1.time_ - var_186_7) / var_186_8

				if arg_183_1.var_.characterEffect1038ui_story then
					arg_183_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_183_1.time_ >= var_186_7 + var_186_8 and arg_183_1.time_ < var_186_7 + var_186_8 + arg_186_0 and arg_183_1.var_.characterEffect1038ui_story then
				arg_183_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_186_10 = 0

			if var_186_10 < arg_183_1.time_ and arg_183_1.time_ <= var_186_10 + arg_186_0 then
				arg_183_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action3_2")
			end

			local var_186_11 = 0

			if var_186_11 < arg_183_1.time_ and arg_183_1.time_ <= var_186_11 + arg_186_0 then
				arg_183_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_186_12 = 0
			local var_186_13 = 1.025

			if var_186_12 < arg_183_1.time_ and arg_183_1.time_ <= var_186_12 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_14 = arg_183_1:FormatText(StoryNameCfg[94].name)

				arg_183_1.leftNameTxt_.text = var_186_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_15 = arg_183_1:GetWordFromCfg(114191045)
				local var_186_16 = arg_183_1:FormatText(var_186_15.content)

				arg_183_1.text_.text = var_186_16

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_17 = 41
				local var_186_18 = utf8.len(var_186_16)
				local var_186_19 = var_186_17 <= 0 and var_186_13 or var_186_13 * (var_186_18 / var_186_17)

				if var_186_19 > 0 and var_186_13 < var_186_19 then
					arg_183_1.talkMaxDuration = var_186_19

					if var_186_19 + var_186_12 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_19 + var_186_12
					end
				end

				arg_183_1.text_.text = var_186_16
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191045", "story_v_out_114191.awb") ~= 0 then
					local var_186_20 = manager.audio:GetVoiceLength("story_v_out_114191", "114191045", "story_v_out_114191.awb") / 1000

					if var_186_20 + var_186_12 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_20 + var_186_12
					end

					if var_186_15.prefab_name ~= "" and arg_183_1.actors_[var_186_15.prefab_name] ~= nil then
						local var_186_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_15.prefab_name].transform, "story_v_out_114191", "114191045", "story_v_out_114191.awb")

						arg_183_1:RecordAudio("114191045", var_186_21)
						arg_183_1:RecordAudio("114191045", var_186_21)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_114191", "114191045", "story_v_out_114191.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_114191", "114191045", "story_v_out_114191.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_22 = math.max(var_186_13, arg_183_1.talkMaxDuration)

			if var_186_12 <= arg_183_1.time_ and arg_183_1.time_ < var_186_12 + var_186_22 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_12) / var_186_22

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_12 + var_186_22 and arg_183_1.time_ < var_186_12 + var_186_22 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play114191046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 114191046
		arg_187_1.duration_ = 14.2

		local var_187_0 = {
			ja = 14.2,
			ko = 9.3,
			zh = 7,
			en = 6.833
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
				arg_187_0:Play114191047(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = 0

			if var_190_0 < arg_187_1.time_ and arg_187_1.time_ <= var_190_0 + arg_190_0 then
				arg_187_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_190_1 = 0
			local var_190_2 = 0.875

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_3 = arg_187_1:FormatText(StoryNameCfg[94].name)

				arg_187_1.leftNameTxt_.text = var_190_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_4 = arg_187_1:GetWordFromCfg(114191046)
				local var_190_5 = arg_187_1:FormatText(var_190_4.content)

				arg_187_1.text_.text = var_190_5

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_6 = 35
				local var_190_7 = utf8.len(var_190_5)
				local var_190_8 = var_190_6 <= 0 and var_190_2 or var_190_2 * (var_190_7 / var_190_6)

				if var_190_8 > 0 and var_190_2 < var_190_8 then
					arg_187_1.talkMaxDuration = var_190_8

					if var_190_8 + var_190_1 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_8 + var_190_1
					end
				end

				arg_187_1.text_.text = var_190_5
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191046", "story_v_out_114191.awb") ~= 0 then
					local var_190_9 = manager.audio:GetVoiceLength("story_v_out_114191", "114191046", "story_v_out_114191.awb") / 1000

					if var_190_9 + var_190_1 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_9 + var_190_1
					end

					if var_190_4.prefab_name ~= "" and arg_187_1.actors_[var_190_4.prefab_name] ~= nil then
						local var_190_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_4.prefab_name].transform, "story_v_out_114191", "114191046", "story_v_out_114191.awb")

						arg_187_1:RecordAudio("114191046", var_190_10)
						arg_187_1:RecordAudio("114191046", var_190_10)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_114191", "114191046", "story_v_out_114191.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_114191", "114191046", "story_v_out_114191.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_11 = math.max(var_190_2, arg_187_1.talkMaxDuration)

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_11 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_1) / var_190_11

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_1 + var_190_11 and arg_187_1.time_ < var_190_1 + var_190_11 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play114191047 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 114191047
		arg_191_1.duration_ = 7.4

		local var_191_0 = {
			ja = 7.4,
			ko = 3.3,
			zh = 5.233,
			en = 4.1
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
				arg_191_0:Play114191048(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = 0

			if var_194_0 < arg_191_1.time_ and arg_191_1.time_ <= var_194_0 + arg_194_0 then
				arg_191_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 then
				arg_191_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/1041/1041action/1041action3_2")
			end

			local var_194_2 = arg_191_1.actors_["1041ui_story"]
			local var_194_3 = 0

			if var_194_3 < arg_191_1.time_ and arg_191_1.time_ <= var_194_3 + arg_194_0 and arg_191_1.var_.characterEffect1041ui_story == nil then
				arg_191_1.var_.characterEffect1041ui_story = var_194_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_4 = 0.2

			if var_194_3 <= arg_191_1.time_ and arg_191_1.time_ < var_194_3 + var_194_4 then
				local var_194_5 = (arg_191_1.time_ - var_194_3) / var_194_4

				if arg_191_1.var_.characterEffect1041ui_story then
					arg_191_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_191_1.time_ >= var_194_3 + var_194_4 and arg_191_1.time_ < var_194_3 + var_194_4 + arg_194_0 and arg_191_1.var_.characterEffect1041ui_story then
				arg_191_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_194_6 = arg_191_1.actors_["1038ui_story"]
			local var_194_7 = 0

			if var_194_7 < arg_191_1.time_ and arg_191_1.time_ <= var_194_7 + arg_194_0 and arg_191_1.var_.characterEffect1038ui_story == nil then
				arg_191_1.var_.characterEffect1038ui_story = var_194_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_8 = 0.2

			if var_194_7 <= arg_191_1.time_ and arg_191_1.time_ < var_194_7 + var_194_8 then
				local var_194_9 = (arg_191_1.time_ - var_194_7) / var_194_8

				if arg_191_1.var_.characterEffect1038ui_story then
					local var_194_10 = Mathf.Lerp(0, 0.5, var_194_9)

					arg_191_1.var_.characterEffect1038ui_story.fillFlat = true
					arg_191_1.var_.characterEffect1038ui_story.fillRatio = var_194_10
				end
			end

			if arg_191_1.time_ >= var_194_7 + var_194_8 and arg_191_1.time_ < var_194_7 + var_194_8 + arg_194_0 and arg_191_1.var_.characterEffect1038ui_story then
				local var_194_11 = 0.5

				arg_191_1.var_.characterEffect1038ui_story.fillFlat = true
				arg_191_1.var_.characterEffect1038ui_story.fillRatio = var_194_11
			end

			local var_194_12 = 0
			local var_194_13 = 0.425

			if var_194_12 < arg_191_1.time_ and arg_191_1.time_ <= var_194_12 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_14 = arg_191_1:FormatText(StoryNameCfg[208].name)

				arg_191_1.leftNameTxt_.text = var_194_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_15 = arg_191_1:GetWordFromCfg(114191047)
				local var_194_16 = arg_191_1:FormatText(var_194_15.content)

				arg_191_1.text_.text = var_194_16

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_17 = 17
				local var_194_18 = utf8.len(var_194_16)
				local var_194_19 = var_194_17 <= 0 and var_194_13 or var_194_13 * (var_194_18 / var_194_17)

				if var_194_19 > 0 and var_194_13 < var_194_19 then
					arg_191_1.talkMaxDuration = var_194_19

					if var_194_19 + var_194_12 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_19 + var_194_12
					end
				end

				arg_191_1.text_.text = var_194_16
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191047", "story_v_out_114191.awb") ~= 0 then
					local var_194_20 = manager.audio:GetVoiceLength("story_v_out_114191", "114191047", "story_v_out_114191.awb") / 1000

					if var_194_20 + var_194_12 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_20 + var_194_12
					end

					if var_194_15.prefab_name ~= "" and arg_191_1.actors_[var_194_15.prefab_name] ~= nil then
						local var_194_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_15.prefab_name].transform, "story_v_out_114191", "114191047", "story_v_out_114191.awb")

						arg_191_1:RecordAudio("114191047", var_194_21)
						arg_191_1:RecordAudio("114191047", var_194_21)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_114191", "114191047", "story_v_out_114191.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_114191", "114191047", "story_v_out_114191.awb")
				end

				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_22 = math.max(var_194_13, arg_191_1.talkMaxDuration)

			if var_194_12 <= arg_191_1.time_ and arg_191_1.time_ < var_194_12 + var_194_22 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_12) / var_194_22

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_12 + var_194_22 and arg_191_1.time_ < var_194_12 + var_194_22 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play114191048 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 114191048
		arg_195_1.duration_ = 7.5

		local var_195_0 = {
			ja = 7.5,
			ko = 4.633,
			zh = 5.3,
			en = 5.4
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
				arg_195_0:Play114191049(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["1038ui_story"].transform
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 then
				arg_195_1.var_.moveOldPos1038ui_story = var_198_0.localPosition
			end

			local var_198_2 = 0.001

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_2 then
				local var_198_3 = (arg_195_1.time_ - var_198_1) / var_198_2
				local var_198_4 = Vector3.New(0, 100, 0)

				var_198_0.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos1038ui_story, var_198_4, var_198_3)

				local var_198_5 = manager.ui.mainCamera.transform.position - var_198_0.position

				var_198_0.forward = Vector3.New(var_198_5.x, var_198_5.y, var_198_5.z)

				local var_198_6 = var_198_0.localEulerAngles

				var_198_6.z = 0
				var_198_6.x = 0
				var_198_0.localEulerAngles = var_198_6
			end

			if arg_195_1.time_ >= var_198_1 + var_198_2 and arg_195_1.time_ < var_198_1 + var_198_2 + arg_198_0 then
				var_198_0.localPosition = Vector3.New(0, 100, 0)

				local var_198_7 = manager.ui.mainCamera.transform.position - var_198_0.position

				var_198_0.forward = Vector3.New(var_198_7.x, var_198_7.y, var_198_7.z)

				local var_198_8 = var_198_0.localEulerAngles

				var_198_8.z = 0
				var_198_8.x = 0
				var_198_0.localEulerAngles = var_198_8
			end

			local var_198_9 = arg_195_1.actors_["1041ui_story"].transform
			local var_198_10 = 0

			if var_198_10 < arg_195_1.time_ and arg_195_1.time_ <= var_198_10 + arg_198_0 then
				arg_195_1.var_.moveOldPos1041ui_story = var_198_9.localPosition
			end

			local var_198_11 = 0.001

			if var_198_10 <= arg_195_1.time_ and arg_195_1.time_ < var_198_10 + var_198_11 then
				local var_198_12 = (arg_195_1.time_ - var_198_10) / var_198_11
				local var_198_13 = Vector3.New(0, 100, 0)

				var_198_9.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos1041ui_story, var_198_13, var_198_12)

				local var_198_14 = manager.ui.mainCamera.transform.position - var_198_9.position

				var_198_9.forward = Vector3.New(var_198_14.x, var_198_14.y, var_198_14.z)

				local var_198_15 = var_198_9.localEulerAngles

				var_198_15.z = 0
				var_198_15.x = 0
				var_198_9.localEulerAngles = var_198_15
			end

			if arg_195_1.time_ >= var_198_10 + var_198_11 and arg_195_1.time_ < var_198_10 + var_198_11 + arg_198_0 then
				var_198_9.localPosition = Vector3.New(0, 100, 0)

				local var_198_16 = manager.ui.mainCamera.transform.position - var_198_9.position

				var_198_9.forward = Vector3.New(var_198_16.x, var_198_16.y, var_198_16.z)

				local var_198_17 = var_198_9.localEulerAngles

				var_198_17.z = 0
				var_198_17.x = 0
				var_198_9.localEulerAngles = var_198_17
			end

			local var_198_18 = "1068ui_story"

			if arg_195_1.actors_[var_198_18] == nil then
				local var_198_19 = Object.Instantiate(Asset.Load("Char/" .. var_198_18), arg_195_1.stage_.transform)

				var_198_19.name = var_198_18
				var_198_19.transform.localPosition = Vector3.New(0, 100, 0)
				arg_195_1.actors_[var_198_18] = var_198_19

				local var_198_20 = var_198_19:GetComponentInChildren(typeof(CharacterEffect))

				var_198_20.enabled = true

				local var_198_21 = GameObjectTools.GetOrAddComponent(var_198_19, typeof(DynamicBoneHelper))

				if var_198_21 then
					var_198_21:EnableDynamicBone(false)
				end

				arg_195_1:ShowWeapon(var_198_20.transform, false)

				arg_195_1.var_[var_198_18 .. "Animator"] = var_198_20.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_195_1.var_[var_198_18 .. "Animator"].applyRootMotion = true
				arg_195_1.var_[var_198_18 .. "LipSync"] = var_198_20.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_198_22 = arg_195_1.actors_["1068ui_story"].transform
			local var_198_23 = 0

			if var_198_23 < arg_195_1.time_ and arg_195_1.time_ <= var_198_23 + arg_198_0 then
				arg_195_1.var_.moveOldPos1068ui_story = var_198_22.localPosition
			end

			local var_198_24 = 0.001

			if var_198_23 <= arg_195_1.time_ and arg_195_1.time_ < var_198_23 + var_198_24 then
				local var_198_25 = (arg_195_1.time_ - var_198_23) / var_198_24
				local var_198_26 = Vector3.New(-0.7, -0.95, -5.88)

				var_198_22.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos1068ui_story, var_198_26, var_198_25)

				local var_198_27 = manager.ui.mainCamera.transform.position - var_198_22.position

				var_198_22.forward = Vector3.New(var_198_27.x, var_198_27.y, var_198_27.z)

				local var_198_28 = var_198_22.localEulerAngles

				var_198_28.z = 0
				var_198_28.x = 0
				var_198_22.localEulerAngles = var_198_28
			end

			if arg_195_1.time_ >= var_198_23 + var_198_24 and arg_195_1.time_ < var_198_23 + var_198_24 + arg_198_0 then
				var_198_22.localPosition = Vector3.New(-0.7, -0.95, -5.88)

				local var_198_29 = manager.ui.mainCamera.transform.position - var_198_22.position

				var_198_22.forward = Vector3.New(var_198_29.x, var_198_29.y, var_198_29.z)

				local var_198_30 = var_198_22.localEulerAngles

				var_198_30.z = 0
				var_198_30.x = 0
				var_198_22.localEulerAngles = var_198_30
			end

			local var_198_31 = 0

			if var_198_31 < arg_195_1.time_ and arg_195_1.time_ <= var_198_31 + arg_198_0 then
				arg_195_1:PlayTimeline("1068ui_story", "StoryTimeline/CharAction/1068/1068action/1068action1_1")
			end

			local var_198_32 = 0

			if var_198_32 < arg_195_1.time_ and arg_195_1.time_ <= var_198_32 + arg_198_0 then
				arg_195_1:PlayTimeline("1068ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_198_33 = arg_195_1.actors_["1068ui_story"]
			local var_198_34 = 0

			if var_198_34 < arg_195_1.time_ and arg_195_1.time_ <= var_198_34 + arg_198_0 and arg_195_1.var_.characterEffect1068ui_story == nil then
				arg_195_1.var_.characterEffect1068ui_story = var_198_33:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_35 = 0.2

			if var_198_34 <= arg_195_1.time_ and arg_195_1.time_ < var_198_34 + var_198_35 then
				local var_198_36 = (arg_195_1.time_ - var_198_34) / var_198_35

				if arg_195_1.var_.characterEffect1068ui_story then
					arg_195_1.var_.characterEffect1068ui_story.fillFlat = false
				end
			end

			if arg_195_1.time_ >= var_198_34 + var_198_35 and arg_195_1.time_ < var_198_34 + var_198_35 + arg_198_0 and arg_195_1.var_.characterEffect1068ui_story then
				arg_195_1.var_.characterEffect1068ui_story.fillFlat = false
			end

			local var_198_37 = 0
			local var_198_38 = 0.525

			if var_198_37 < arg_195_1.time_ and arg_195_1.time_ <= var_198_37 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_39 = arg_195_1:FormatText(StoryNameCfg[218].name)

				arg_195_1.leftNameTxt_.text = var_198_39

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_40 = arg_195_1:GetWordFromCfg(114191048)
				local var_198_41 = arg_195_1:FormatText(var_198_40.content)

				arg_195_1.text_.text = var_198_41

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_42 = 21
				local var_198_43 = utf8.len(var_198_41)
				local var_198_44 = var_198_42 <= 0 and var_198_38 or var_198_38 * (var_198_43 / var_198_42)

				if var_198_44 > 0 and var_198_38 < var_198_44 then
					arg_195_1.talkMaxDuration = var_198_44

					if var_198_44 + var_198_37 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_44 + var_198_37
					end
				end

				arg_195_1.text_.text = var_198_41
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191048", "story_v_out_114191.awb") ~= 0 then
					local var_198_45 = manager.audio:GetVoiceLength("story_v_out_114191", "114191048", "story_v_out_114191.awb") / 1000

					if var_198_45 + var_198_37 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_45 + var_198_37
					end

					if var_198_40.prefab_name ~= "" and arg_195_1.actors_[var_198_40.prefab_name] ~= nil then
						local var_198_46 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_40.prefab_name].transform, "story_v_out_114191", "114191048", "story_v_out_114191.awb")

						arg_195_1:RecordAudio("114191048", var_198_46)
						arg_195_1:RecordAudio("114191048", var_198_46)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_114191", "114191048", "story_v_out_114191.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_114191", "114191048", "story_v_out_114191.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_47 = math.max(var_198_38, arg_195_1.talkMaxDuration)

			if var_198_37 <= arg_195_1.time_ and arg_195_1.time_ < var_198_37 + var_198_47 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_37) / var_198_47

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_37 + var_198_47 and arg_195_1.time_ < var_198_37 + var_198_47 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play114191049 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 114191049
		arg_199_1.duration_ = 9.833

		local var_199_0 = {
			ja = 9.833,
			ko = 6.9,
			zh = 6.6,
			en = 6.7
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
				arg_199_0:Play114191050(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["10006ui_story"].transform
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 then
				arg_199_1.var_.moveOldPos10006ui_story = var_202_0.localPosition
			end

			local var_202_2 = 0.001

			if var_202_1 <= arg_199_1.time_ and arg_199_1.time_ < var_202_1 + var_202_2 then
				local var_202_3 = (arg_199_1.time_ - var_202_1) / var_202_2
				local var_202_4 = Vector3.New(0.7, -0.98, -5.65)

				var_202_0.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos10006ui_story, var_202_4, var_202_3)

				local var_202_5 = manager.ui.mainCamera.transform.position - var_202_0.position

				var_202_0.forward = Vector3.New(var_202_5.x, var_202_5.y, var_202_5.z)

				local var_202_6 = var_202_0.localEulerAngles

				var_202_6.z = 0
				var_202_6.x = 0
				var_202_0.localEulerAngles = var_202_6
			end

			if arg_199_1.time_ >= var_202_1 + var_202_2 and arg_199_1.time_ < var_202_1 + var_202_2 + arg_202_0 then
				var_202_0.localPosition = Vector3.New(0.7, -0.98, -5.65)

				local var_202_7 = manager.ui.mainCamera.transform.position - var_202_0.position

				var_202_0.forward = Vector3.New(var_202_7.x, var_202_7.y, var_202_7.z)

				local var_202_8 = var_202_0.localEulerAngles

				var_202_8.z = 0
				var_202_8.x = 0
				var_202_0.localEulerAngles = var_202_8
			end

			local var_202_9 = 0

			if var_202_9 < arg_199_1.time_ and arg_199_1.time_ <= var_202_9 + arg_202_0 then
				arg_199_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/story10006/story10006action/10006action1_1")
			end

			local var_202_10 = 0

			if var_202_10 < arg_199_1.time_ and arg_199_1.time_ <= var_202_10 + arg_202_0 then
				arg_199_1:PlayTimeline("10006ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_202_11 = arg_199_1.actors_["10006ui_story"]
			local var_202_12 = 0

			if var_202_12 < arg_199_1.time_ and arg_199_1.time_ <= var_202_12 + arg_202_0 and arg_199_1.var_.characterEffect10006ui_story == nil then
				arg_199_1.var_.characterEffect10006ui_story = var_202_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_13 = 0.2

			if var_202_12 <= arg_199_1.time_ and arg_199_1.time_ < var_202_12 + var_202_13 then
				local var_202_14 = (arg_199_1.time_ - var_202_12) / var_202_13

				if arg_199_1.var_.characterEffect10006ui_story then
					arg_199_1.var_.characterEffect10006ui_story.fillFlat = false
				end
			end

			if arg_199_1.time_ >= var_202_12 + var_202_13 and arg_199_1.time_ < var_202_12 + var_202_13 + arg_202_0 and arg_199_1.var_.characterEffect10006ui_story then
				arg_199_1.var_.characterEffect10006ui_story.fillFlat = false
			end

			local var_202_15 = arg_199_1.actors_["1068ui_story"]
			local var_202_16 = 0

			if var_202_16 < arg_199_1.time_ and arg_199_1.time_ <= var_202_16 + arg_202_0 and arg_199_1.var_.characterEffect1068ui_story == nil then
				arg_199_1.var_.characterEffect1068ui_story = var_202_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_17 = 0.2

			if var_202_16 <= arg_199_1.time_ and arg_199_1.time_ < var_202_16 + var_202_17 then
				local var_202_18 = (arg_199_1.time_ - var_202_16) / var_202_17

				if arg_199_1.var_.characterEffect1068ui_story then
					local var_202_19 = Mathf.Lerp(0, 0.5, var_202_18)

					arg_199_1.var_.characterEffect1068ui_story.fillFlat = true
					arg_199_1.var_.characterEffect1068ui_story.fillRatio = var_202_19
				end
			end

			if arg_199_1.time_ >= var_202_16 + var_202_17 and arg_199_1.time_ < var_202_16 + var_202_17 + arg_202_0 and arg_199_1.var_.characterEffect1068ui_story then
				local var_202_20 = 0.5

				arg_199_1.var_.characterEffect1068ui_story.fillFlat = true
				arg_199_1.var_.characterEffect1068ui_story.fillRatio = var_202_20
			end

			local var_202_21 = 0
			local var_202_22 = 0.7

			if var_202_21 < arg_199_1.time_ and arg_199_1.time_ <= var_202_21 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_23 = arg_199_1:FormatText(StoryNameCfg[212].name)

				arg_199_1.leftNameTxt_.text = var_202_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_24 = arg_199_1:GetWordFromCfg(114191049)
				local var_202_25 = arg_199_1:FormatText(var_202_24.content)

				arg_199_1.text_.text = var_202_25

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_26 = 28
				local var_202_27 = utf8.len(var_202_25)
				local var_202_28 = var_202_26 <= 0 and var_202_22 or var_202_22 * (var_202_27 / var_202_26)

				if var_202_28 > 0 and var_202_22 < var_202_28 then
					arg_199_1.talkMaxDuration = var_202_28

					if var_202_28 + var_202_21 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_28 + var_202_21
					end
				end

				arg_199_1.text_.text = var_202_25
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191049", "story_v_out_114191.awb") ~= 0 then
					local var_202_29 = manager.audio:GetVoiceLength("story_v_out_114191", "114191049", "story_v_out_114191.awb") / 1000

					if var_202_29 + var_202_21 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_29 + var_202_21
					end

					if var_202_24.prefab_name ~= "" and arg_199_1.actors_[var_202_24.prefab_name] ~= nil then
						local var_202_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_24.prefab_name].transform, "story_v_out_114191", "114191049", "story_v_out_114191.awb")

						arg_199_1:RecordAudio("114191049", var_202_30)
						arg_199_1:RecordAudio("114191049", var_202_30)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_114191", "114191049", "story_v_out_114191.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_114191", "114191049", "story_v_out_114191.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_31 = math.max(var_202_22, arg_199_1.talkMaxDuration)

			if var_202_21 <= arg_199_1.time_ and arg_199_1.time_ < var_202_21 + var_202_31 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_21) / var_202_31

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_21 + var_202_31 and arg_199_1.time_ < var_202_21 + var_202_31 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play114191050 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 114191050
		arg_203_1.duration_ = 7.2

		local var_203_0 = {
			ja = 7.2,
			ko = 2.933,
			zh = 2.7,
			en = 4.5
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
				arg_203_0:Play114191051(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = 0

			if var_206_0 < arg_203_1.time_ and arg_203_1.time_ <= var_206_0 + arg_206_0 then
				arg_203_1:PlayTimeline("1068ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_206_1 = arg_203_1.actors_["1068ui_story"]
			local var_206_2 = 0

			if var_206_2 < arg_203_1.time_ and arg_203_1.time_ <= var_206_2 + arg_206_0 and arg_203_1.var_.characterEffect1068ui_story == nil then
				arg_203_1.var_.characterEffect1068ui_story = var_206_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_206_3 = 0.2

			if var_206_2 <= arg_203_1.time_ and arg_203_1.time_ < var_206_2 + var_206_3 then
				local var_206_4 = (arg_203_1.time_ - var_206_2) / var_206_3

				if arg_203_1.var_.characterEffect1068ui_story then
					arg_203_1.var_.characterEffect1068ui_story.fillFlat = false
				end
			end

			if arg_203_1.time_ >= var_206_2 + var_206_3 and arg_203_1.time_ < var_206_2 + var_206_3 + arg_206_0 and arg_203_1.var_.characterEffect1068ui_story then
				arg_203_1.var_.characterEffect1068ui_story.fillFlat = false
			end

			local var_206_5 = arg_203_1.actors_["10006ui_story"]
			local var_206_6 = 0

			if var_206_6 < arg_203_1.time_ and arg_203_1.time_ <= var_206_6 + arg_206_0 and arg_203_1.var_.characterEffect10006ui_story == nil then
				arg_203_1.var_.characterEffect10006ui_story = var_206_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_206_7 = 0.2

			if var_206_6 <= arg_203_1.time_ and arg_203_1.time_ < var_206_6 + var_206_7 then
				local var_206_8 = (arg_203_1.time_ - var_206_6) / var_206_7

				if arg_203_1.var_.characterEffect10006ui_story then
					local var_206_9 = Mathf.Lerp(0, 0.5, var_206_8)

					arg_203_1.var_.characterEffect10006ui_story.fillFlat = true
					arg_203_1.var_.characterEffect10006ui_story.fillRatio = var_206_9
				end
			end

			if arg_203_1.time_ >= var_206_6 + var_206_7 and arg_203_1.time_ < var_206_6 + var_206_7 + arg_206_0 and arg_203_1.var_.characterEffect10006ui_story then
				local var_206_10 = 0.5

				arg_203_1.var_.characterEffect10006ui_story.fillFlat = true
				arg_203_1.var_.characterEffect10006ui_story.fillRatio = var_206_10
			end

			local var_206_11 = 0
			local var_206_12 = 0.425

			if var_206_11 < arg_203_1.time_ and arg_203_1.time_ <= var_206_11 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_13 = arg_203_1:FormatText(StoryNameCfg[218].name)

				arg_203_1.leftNameTxt_.text = var_206_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_14 = arg_203_1:GetWordFromCfg(114191050)
				local var_206_15 = arg_203_1:FormatText(var_206_14.content)

				arg_203_1.text_.text = var_206_15

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_16 = 17
				local var_206_17 = utf8.len(var_206_15)
				local var_206_18 = var_206_16 <= 0 and var_206_12 or var_206_12 * (var_206_17 / var_206_16)

				if var_206_18 > 0 and var_206_12 < var_206_18 then
					arg_203_1.talkMaxDuration = var_206_18

					if var_206_18 + var_206_11 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_18 + var_206_11
					end
				end

				arg_203_1.text_.text = var_206_15
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191050", "story_v_out_114191.awb") ~= 0 then
					local var_206_19 = manager.audio:GetVoiceLength("story_v_out_114191", "114191050", "story_v_out_114191.awb") / 1000

					if var_206_19 + var_206_11 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_19 + var_206_11
					end

					if var_206_14.prefab_name ~= "" and arg_203_1.actors_[var_206_14.prefab_name] ~= nil then
						local var_206_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_14.prefab_name].transform, "story_v_out_114191", "114191050", "story_v_out_114191.awb")

						arg_203_1:RecordAudio("114191050", var_206_20)
						arg_203_1:RecordAudio("114191050", var_206_20)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_114191", "114191050", "story_v_out_114191.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_114191", "114191050", "story_v_out_114191.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_21 = math.max(var_206_12, arg_203_1.talkMaxDuration)

			if var_206_11 <= arg_203_1.time_ and arg_203_1.time_ < var_206_11 + var_206_21 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_11) / var_206_21

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_11 + var_206_21 and arg_203_1.time_ < var_206_11 + var_206_21 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play114191051 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 114191051
		arg_207_1.duration_ = 9.833

		local var_207_0 = {
			ja = 9.833,
			ko = 5.566,
			zh = 7.066,
			en = 7.6
		}
		local var_207_1 = manager.audio:GetLocalizationFlag()

		if var_207_0[var_207_1] ~= nil then
			arg_207_1.duration_ = var_207_0[var_207_1]
		end

		SetActive(arg_207_1.tipsGo_, false)

		function arg_207_1.onSingleLineFinish_()
			arg_207_1.onSingleLineUpdate_ = nil
			arg_207_1.onSingleLineFinish_ = nil
			arg_207_1.state_ = "waiting"
		end

		function arg_207_1.playNext_(arg_209_0)
			if arg_209_0 == 1 then
				arg_207_0:Play114191052(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["10006ui_story"].transform
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 then
				arg_207_1.var_.moveOldPos10006ui_story = var_210_0.localPosition
			end

			local var_210_2 = 0.001

			if var_210_1 <= arg_207_1.time_ and arg_207_1.time_ < var_210_1 + var_210_2 then
				local var_210_3 = (arg_207_1.time_ - var_210_1) / var_210_2
				local var_210_4 = Vector3.New(0, 100, 0)

				var_210_0.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos10006ui_story, var_210_4, var_210_3)

				local var_210_5 = manager.ui.mainCamera.transform.position - var_210_0.position

				var_210_0.forward = Vector3.New(var_210_5.x, var_210_5.y, var_210_5.z)

				local var_210_6 = var_210_0.localEulerAngles

				var_210_6.z = 0
				var_210_6.x = 0
				var_210_0.localEulerAngles = var_210_6
			end

			if arg_207_1.time_ >= var_210_1 + var_210_2 and arg_207_1.time_ < var_210_1 + var_210_2 + arg_210_0 then
				var_210_0.localPosition = Vector3.New(0, 100, 0)

				local var_210_7 = manager.ui.mainCamera.transform.position - var_210_0.position

				var_210_0.forward = Vector3.New(var_210_7.x, var_210_7.y, var_210_7.z)

				local var_210_8 = var_210_0.localEulerAngles

				var_210_8.z = 0
				var_210_8.x = 0
				var_210_0.localEulerAngles = var_210_8
			end

			local var_210_9 = arg_207_1.actors_["1067ui_story"].transform
			local var_210_10 = 0

			if var_210_10 < arg_207_1.time_ and arg_207_1.time_ <= var_210_10 + arg_210_0 then
				arg_207_1.var_.moveOldPos1067ui_story = var_210_9.localPosition
			end

			local var_210_11 = 0.001

			if var_210_10 <= arg_207_1.time_ and arg_207_1.time_ < var_210_10 + var_210_11 then
				local var_210_12 = (arg_207_1.time_ - var_210_10) / var_210_11
				local var_210_13 = Vector3.New(0.7, -1.06, -6.2)

				var_210_9.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos1067ui_story, var_210_13, var_210_12)

				local var_210_14 = manager.ui.mainCamera.transform.position - var_210_9.position

				var_210_9.forward = Vector3.New(var_210_14.x, var_210_14.y, var_210_14.z)

				local var_210_15 = var_210_9.localEulerAngles

				var_210_15.z = 0
				var_210_15.x = 0
				var_210_9.localEulerAngles = var_210_15
			end

			if arg_207_1.time_ >= var_210_10 + var_210_11 and arg_207_1.time_ < var_210_10 + var_210_11 + arg_210_0 then
				var_210_9.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_210_16 = manager.ui.mainCamera.transform.position - var_210_9.position

				var_210_9.forward = Vector3.New(var_210_16.x, var_210_16.y, var_210_16.z)

				local var_210_17 = var_210_9.localEulerAngles

				var_210_17.z = 0
				var_210_17.x = 0
				var_210_9.localEulerAngles = var_210_17
			end

			local var_210_18 = 0

			if var_210_18 < arg_207_1.time_ and arg_207_1.time_ <= var_210_18 + arg_210_0 then
				arg_207_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/1067/1067action/1067action1_1")
			end

			local var_210_19 = 0

			if var_210_19 < arg_207_1.time_ and arg_207_1.time_ <= var_210_19 + arg_210_0 then
				arg_207_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_210_20 = arg_207_1.actors_["1067ui_story"]
			local var_210_21 = 0

			if var_210_21 < arg_207_1.time_ and arg_207_1.time_ <= var_210_21 + arg_210_0 and arg_207_1.var_.characterEffect1067ui_story == nil then
				arg_207_1.var_.characterEffect1067ui_story = var_210_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_22 = 0.2

			if var_210_21 <= arg_207_1.time_ and arg_207_1.time_ < var_210_21 + var_210_22 then
				local var_210_23 = (arg_207_1.time_ - var_210_21) / var_210_22

				if arg_207_1.var_.characterEffect1067ui_story then
					arg_207_1.var_.characterEffect1067ui_story.fillFlat = false
				end
			end

			if arg_207_1.time_ >= var_210_21 + var_210_22 and arg_207_1.time_ < var_210_21 + var_210_22 + arg_210_0 and arg_207_1.var_.characterEffect1067ui_story then
				arg_207_1.var_.characterEffect1067ui_story.fillFlat = false
			end

			local var_210_24 = arg_207_1.actors_["1068ui_story"]
			local var_210_25 = 0

			if var_210_25 < arg_207_1.time_ and arg_207_1.time_ <= var_210_25 + arg_210_0 and arg_207_1.var_.characterEffect1068ui_story == nil then
				arg_207_1.var_.characterEffect1068ui_story = var_210_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_26 = 0.2

			if var_210_25 <= arg_207_1.time_ and arg_207_1.time_ < var_210_25 + var_210_26 then
				local var_210_27 = (arg_207_1.time_ - var_210_25) / var_210_26

				if arg_207_1.var_.characterEffect1068ui_story then
					local var_210_28 = Mathf.Lerp(0, 0.5, var_210_27)

					arg_207_1.var_.characterEffect1068ui_story.fillFlat = true
					arg_207_1.var_.characterEffect1068ui_story.fillRatio = var_210_28
				end
			end

			if arg_207_1.time_ >= var_210_25 + var_210_26 and arg_207_1.time_ < var_210_25 + var_210_26 + arg_210_0 and arg_207_1.var_.characterEffect1068ui_story then
				local var_210_29 = 0.5

				arg_207_1.var_.characterEffect1068ui_story.fillFlat = true
				arg_207_1.var_.characterEffect1068ui_story.fillRatio = var_210_29
			end

			local var_210_30 = 0
			local var_210_31 = 0.75

			if var_210_30 < arg_207_1.time_ and arg_207_1.time_ <= var_210_30 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_32 = arg_207_1:FormatText(StoryNameCfg[206].name)

				arg_207_1.leftNameTxt_.text = var_210_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_33 = arg_207_1:GetWordFromCfg(114191051)
				local var_210_34 = arg_207_1:FormatText(var_210_33.content)

				arg_207_1.text_.text = var_210_34

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_35 = 30
				local var_210_36 = utf8.len(var_210_34)
				local var_210_37 = var_210_35 <= 0 and var_210_31 or var_210_31 * (var_210_36 / var_210_35)

				if var_210_37 > 0 and var_210_31 < var_210_37 then
					arg_207_1.talkMaxDuration = var_210_37

					if var_210_37 + var_210_30 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_37 + var_210_30
					end
				end

				arg_207_1.text_.text = var_210_34
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191051", "story_v_out_114191.awb") ~= 0 then
					local var_210_38 = manager.audio:GetVoiceLength("story_v_out_114191", "114191051", "story_v_out_114191.awb") / 1000

					if var_210_38 + var_210_30 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_38 + var_210_30
					end

					if var_210_33.prefab_name ~= "" and arg_207_1.actors_[var_210_33.prefab_name] ~= nil then
						local var_210_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_33.prefab_name].transform, "story_v_out_114191", "114191051", "story_v_out_114191.awb")

						arg_207_1:RecordAudio("114191051", var_210_39)
						arg_207_1:RecordAudio("114191051", var_210_39)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_114191", "114191051", "story_v_out_114191.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_114191", "114191051", "story_v_out_114191.awb")
				end

				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_40 = math.max(var_210_31, arg_207_1.talkMaxDuration)

			if var_210_30 <= arg_207_1.time_ and arg_207_1.time_ < var_210_30 + var_210_40 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_30) / var_210_40

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_30 + var_210_40 and arg_207_1.time_ < var_210_30 + var_210_40 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play114191052 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 114191052
		arg_211_1.duration_ = 7.366

		local var_211_0 = {
			ja = 7.366,
			ko = 5.1,
			zh = 5.1,
			en = 4.5
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
				arg_211_0:Play114191053(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = 0

			if var_214_0 < arg_211_1.time_ and arg_211_1.time_ <= var_214_0 + arg_214_0 then
				arg_211_1:PlayTimeline("1068ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_214_1 = arg_211_1.actors_["1068ui_story"]
			local var_214_2 = 0

			if var_214_2 < arg_211_1.time_ and arg_211_1.time_ <= var_214_2 + arg_214_0 and arg_211_1.var_.characterEffect1068ui_story == nil then
				arg_211_1.var_.characterEffect1068ui_story = var_214_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_3 = 0.2

			if var_214_2 <= arg_211_1.time_ and arg_211_1.time_ < var_214_2 + var_214_3 then
				local var_214_4 = (arg_211_1.time_ - var_214_2) / var_214_3

				if arg_211_1.var_.characterEffect1068ui_story then
					arg_211_1.var_.characterEffect1068ui_story.fillFlat = false
				end
			end

			if arg_211_1.time_ >= var_214_2 + var_214_3 and arg_211_1.time_ < var_214_2 + var_214_3 + arg_214_0 and arg_211_1.var_.characterEffect1068ui_story then
				arg_211_1.var_.characterEffect1068ui_story.fillFlat = false
			end

			local var_214_5 = arg_211_1.actors_["1067ui_story"]
			local var_214_6 = 0

			if var_214_6 < arg_211_1.time_ and arg_211_1.time_ <= var_214_6 + arg_214_0 and arg_211_1.var_.characterEffect1067ui_story == nil then
				arg_211_1.var_.characterEffect1067ui_story = var_214_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_7 = 0.2

			if var_214_6 <= arg_211_1.time_ and arg_211_1.time_ < var_214_6 + var_214_7 then
				local var_214_8 = (arg_211_1.time_ - var_214_6) / var_214_7

				if arg_211_1.var_.characterEffect1067ui_story then
					local var_214_9 = Mathf.Lerp(0, 0.5, var_214_8)

					arg_211_1.var_.characterEffect1067ui_story.fillFlat = true
					arg_211_1.var_.characterEffect1067ui_story.fillRatio = var_214_9
				end
			end

			if arg_211_1.time_ >= var_214_6 + var_214_7 and arg_211_1.time_ < var_214_6 + var_214_7 + arg_214_0 and arg_211_1.var_.characterEffect1067ui_story then
				local var_214_10 = 0.5

				arg_211_1.var_.characterEffect1067ui_story.fillFlat = true
				arg_211_1.var_.characterEffect1067ui_story.fillRatio = var_214_10
			end

			local var_214_11 = 0
			local var_214_12 = 0.6

			if var_214_11 < arg_211_1.time_ and arg_211_1.time_ <= var_214_11 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_13 = arg_211_1:FormatText(StoryNameCfg[218].name)

				arg_211_1.leftNameTxt_.text = var_214_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_14 = arg_211_1:GetWordFromCfg(114191052)
				local var_214_15 = arg_211_1:FormatText(var_214_14.content)

				arg_211_1.text_.text = var_214_15

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_16 = 24
				local var_214_17 = utf8.len(var_214_15)
				local var_214_18 = var_214_16 <= 0 and var_214_12 or var_214_12 * (var_214_17 / var_214_16)

				if var_214_18 > 0 and var_214_12 < var_214_18 then
					arg_211_1.talkMaxDuration = var_214_18

					if var_214_18 + var_214_11 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_18 + var_214_11
					end
				end

				arg_211_1.text_.text = var_214_15
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191052", "story_v_out_114191.awb") ~= 0 then
					local var_214_19 = manager.audio:GetVoiceLength("story_v_out_114191", "114191052", "story_v_out_114191.awb") / 1000

					if var_214_19 + var_214_11 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_19 + var_214_11
					end

					if var_214_14.prefab_name ~= "" and arg_211_1.actors_[var_214_14.prefab_name] ~= nil then
						local var_214_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_14.prefab_name].transform, "story_v_out_114191", "114191052", "story_v_out_114191.awb")

						arg_211_1:RecordAudio("114191052", var_214_20)
						arg_211_1:RecordAudio("114191052", var_214_20)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_out_114191", "114191052", "story_v_out_114191.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_out_114191", "114191052", "story_v_out_114191.awb")
				end

				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_21 = math.max(var_214_12, arg_211_1.talkMaxDuration)

			if var_214_11 <= arg_211_1.time_ and arg_211_1.time_ < var_214_11 + var_214_21 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_11) / var_214_21

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_11 + var_214_21 and arg_211_1.time_ < var_214_11 + var_214_21 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play114191053 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 114191053
		arg_215_1.duration_ = 5.1

		local var_215_0 = {
			ja = 4.933,
			ko = 4.833,
			zh = 5.1,
			en = 5.033
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
				arg_215_0:Play114191054(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = arg_215_1.actors_["1068ui_story"]
			local var_218_1 = 0

			if var_218_1 < arg_215_1.time_ and arg_215_1.time_ <= var_218_1 + arg_218_0 and arg_215_1.var_.characterEffect1068ui_story == nil then
				arg_215_1.var_.characterEffect1068ui_story = var_218_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_2 = 0.2

			if var_218_1 <= arg_215_1.time_ and arg_215_1.time_ < var_218_1 + var_218_2 then
				local var_218_3 = (arg_215_1.time_ - var_218_1) / var_218_2

				if arg_215_1.var_.characterEffect1068ui_story then
					local var_218_4 = Mathf.Lerp(0, 0.5, var_218_3)

					arg_215_1.var_.characterEffect1068ui_story.fillFlat = true
					arg_215_1.var_.characterEffect1068ui_story.fillRatio = var_218_4
				end
			end

			if arg_215_1.time_ >= var_218_1 + var_218_2 and arg_215_1.time_ < var_218_1 + var_218_2 + arg_218_0 and arg_215_1.var_.characterEffect1068ui_story then
				local var_218_5 = 0.5

				arg_215_1.var_.characterEffect1068ui_story.fillFlat = true
				arg_215_1.var_.characterEffect1068ui_story.fillRatio = var_218_5
			end

			local var_218_6 = 0
			local var_218_7 = 0.5

			if var_218_6 < arg_215_1.time_ and arg_215_1.time_ <= var_218_6 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_8 = arg_215_1:FormatText(StoryNameCfg[205].name)

				arg_215_1.leftNameTxt_.text = var_218_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, true)
				arg_215_1.iconController_:SetSelectedState("hero")

				arg_215_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1042")

				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_9 = arg_215_1:GetWordFromCfg(114191053)
				local var_218_10 = arg_215_1:FormatText(var_218_9.content)

				arg_215_1.text_.text = var_218_10

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_11 = 20
				local var_218_12 = utf8.len(var_218_10)
				local var_218_13 = var_218_11 <= 0 and var_218_7 or var_218_7 * (var_218_12 / var_218_11)

				if var_218_13 > 0 and var_218_7 < var_218_13 then
					arg_215_1.talkMaxDuration = var_218_13

					if var_218_13 + var_218_6 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_13 + var_218_6
					end
				end

				arg_215_1.text_.text = var_218_10
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191053", "story_v_out_114191.awb") ~= 0 then
					local var_218_14 = manager.audio:GetVoiceLength("story_v_out_114191", "114191053", "story_v_out_114191.awb") / 1000

					if var_218_14 + var_218_6 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_14 + var_218_6
					end

					if var_218_9.prefab_name ~= "" and arg_215_1.actors_[var_218_9.prefab_name] ~= nil then
						local var_218_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_9.prefab_name].transform, "story_v_out_114191", "114191053", "story_v_out_114191.awb")

						arg_215_1:RecordAudio("114191053", var_218_15)
						arg_215_1:RecordAudio("114191053", var_218_15)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_114191", "114191053", "story_v_out_114191.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_114191", "114191053", "story_v_out_114191.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_16 = math.max(var_218_7, arg_215_1.talkMaxDuration)

			if var_218_6 <= arg_215_1.time_ and arg_215_1.time_ < var_218_6 + var_218_16 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_6) / var_218_16

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_6 + var_218_16 and arg_215_1.time_ < var_218_6 + var_218_16 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play114191054 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 114191054
		arg_219_1.duration_ = 2.333

		local var_219_0 = {
			ja = 2.333,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 1.999999999999
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
				arg_219_0:Play114191055(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = 0

			if var_222_0 < arg_219_1.time_ and arg_219_1.time_ <= var_222_0 + arg_222_0 then
				arg_219_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/1067/1067action/1067action2_1")
			end

			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 then
				arg_219_1:PlayTimeline("1067ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_222_2 = arg_219_1.actors_["1067ui_story"]
			local var_222_3 = 0

			if var_222_3 < arg_219_1.time_ and arg_219_1.time_ <= var_222_3 + arg_222_0 and arg_219_1.var_.characterEffect1067ui_story == nil then
				arg_219_1.var_.characterEffect1067ui_story = var_222_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_4 = 0.2

			if var_222_3 <= arg_219_1.time_ and arg_219_1.time_ < var_222_3 + var_222_4 then
				local var_222_5 = (arg_219_1.time_ - var_222_3) / var_222_4

				if arg_219_1.var_.characterEffect1067ui_story then
					arg_219_1.var_.characterEffect1067ui_story.fillFlat = false
				end
			end

			if arg_219_1.time_ >= var_222_3 + var_222_4 and arg_219_1.time_ < var_222_3 + var_222_4 + arg_222_0 and arg_219_1.var_.characterEffect1067ui_story then
				arg_219_1.var_.characterEffect1067ui_story.fillFlat = false
			end

			local var_222_6 = 0
			local var_222_7 = 0.125

			if var_222_6 < arg_219_1.time_ and arg_219_1.time_ <= var_222_6 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_8 = arg_219_1:FormatText(StoryNameCfg[206].name)

				arg_219_1.leftNameTxt_.text = var_222_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_9 = arg_219_1:GetWordFromCfg(114191054)
				local var_222_10 = arg_219_1:FormatText(var_222_9.content)

				arg_219_1.text_.text = var_222_10

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_11 = 5
				local var_222_12 = utf8.len(var_222_10)
				local var_222_13 = var_222_11 <= 0 and var_222_7 or var_222_7 * (var_222_12 / var_222_11)

				if var_222_13 > 0 and var_222_7 < var_222_13 then
					arg_219_1.talkMaxDuration = var_222_13

					if var_222_13 + var_222_6 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_13 + var_222_6
					end
				end

				arg_219_1.text_.text = var_222_10
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191054", "story_v_out_114191.awb") ~= 0 then
					local var_222_14 = manager.audio:GetVoiceLength("story_v_out_114191", "114191054", "story_v_out_114191.awb") / 1000

					if var_222_14 + var_222_6 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_14 + var_222_6
					end

					if var_222_9.prefab_name ~= "" and arg_219_1.actors_[var_222_9.prefab_name] ~= nil then
						local var_222_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_9.prefab_name].transform, "story_v_out_114191", "114191054", "story_v_out_114191.awb")

						arg_219_1:RecordAudio("114191054", var_222_15)
						arg_219_1:RecordAudio("114191054", var_222_15)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_114191", "114191054", "story_v_out_114191.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_114191", "114191054", "story_v_out_114191.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_16 = math.max(var_222_7, arg_219_1.talkMaxDuration)

			if var_222_6 <= arg_219_1.time_ and arg_219_1.time_ < var_222_6 + var_222_16 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_6) / var_222_16

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_6 + var_222_16 and arg_219_1.time_ < var_222_6 + var_222_16 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play114191055 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 114191055
		arg_223_1.duration_ = 10.066

		local var_223_0 = {
			ja = 10.066,
			ko = 4.833,
			zh = 5.666,
			en = 6.666
		}
		local var_223_1 = manager.audio:GetLocalizationFlag()

		if var_223_0[var_223_1] ~= nil then
			arg_223_1.duration_ = var_223_0[var_223_1]
		end

		SetActive(arg_223_1.tipsGo_, false)

		function arg_223_1.onSingleLineFinish_()
			arg_223_1.onSingleLineUpdate_ = nil
			arg_223_1.onSingleLineFinish_ = nil
			arg_223_1.state_ = "waiting"
		end

		function arg_223_1.playNext_(arg_225_0)
			if arg_225_0 == 1 then
				arg_223_0:Play114191056(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["1067ui_story"].transform
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 then
				arg_223_1.var_.moveOldPos1067ui_story = var_226_0.localPosition
			end

			local var_226_2 = 0.001

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_2 then
				local var_226_3 = (arg_223_1.time_ - var_226_1) / var_226_2
				local var_226_4 = Vector3.New(0, 100, 0)

				var_226_0.localPosition = Vector3.Lerp(arg_223_1.var_.moveOldPos1067ui_story, var_226_4, var_226_3)

				local var_226_5 = manager.ui.mainCamera.transform.position - var_226_0.position

				var_226_0.forward = Vector3.New(var_226_5.x, var_226_5.y, var_226_5.z)

				local var_226_6 = var_226_0.localEulerAngles

				var_226_6.z = 0
				var_226_6.x = 0
				var_226_0.localEulerAngles = var_226_6
			end

			if arg_223_1.time_ >= var_226_1 + var_226_2 and arg_223_1.time_ < var_226_1 + var_226_2 + arg_226_0 then
				var_226_0.localPosition = Vector3.New(0, 100, 0)

				local var_226_7 = manager.ui.mainCamera.transform.position - var_226_0.position

				var_226_0.forward = Vector3.New(var_226_7.x, var_226_7.y, var_226_7.z)

				local var_226_8 = var_226_0.localEulerAngles

				var_226_8.z = 0
				var_226_8.x = 0
				var_226_0.localEulerAngles = var_226_8
			end

			local var_226_9 = arg_223_1.actors_["1068ui_story"].transform
			local var_226_10 = 0

			if var_226_10 < arg_223_1.time_ and arg_223_1.time_ <= var_226_10 + arg_226_0 then
				arg_223_1.var_.moveOldPos1068ui_story = var_226_9.localPosition
			end

			local var_226_11 = 0.001

			if var_226_10 <= arg_223_1.time_ and arg_223_1.time_ < var_226_10 + var_226_11 then
				local var_226_12 = (arg_223_1.time_ - var_226_10) / var_226_11
				local var_226_13 = Vector3.New(0, 100, 0)

				var_226_9.localPosition = Vector3.Lerp(arg_223_1.var_.moveOldPos1068ui_story, var_226_13, var_226_12)

				local var_226_14 = manager.ui.mainCamera.transform.position - var_226_9.position

				var_226_9.forward = Vector3.New(var_226_14.x, var_226_14.y, var_226_14.z)

				local var_226_15 = var_226_9.localEulerAngles

				var_226_15.z = 0
				var_226_15.x = 0
				var_226_9.localEulerAngles = var_226_15
			end

			if arg_223_1.time_ >= var_226_10 + var_226_11 and arg_223_1.time_ < var_226_10 + var_226_11 + arg_226_0 then
				var_226_9.localPosition = Vector3.New(0, 100, 0)

				local var_226_16 = manager.ui.mainCamera.transform.position - var_226_9.position

				var_226_9.forward = Vector3.New(var_226_16.x, var_226_16.y, var_226_16.z)

				local var_226_17 = var_226_9.localEulerAngles

				var_226_17.z = 0
				var_226_17.x = 0
				var_226_9.localEulerAngles = var_226_17
			end

			local var_226_18 = arg_223_1.actors_["1042ui_story"].transform
			local var_226_19 = 0

			if var_226_19 < arg_223_1.time_ and arg_223_1.time_ <= var_226_19 + arg_226_0 then
				arg_223_1.var_.moveOldPos1042ui_story = var_226_18.localPosition
			end

			local var_226_20 = 0.001

			if var_226_19 <= arg_223_1.time_ and arg_223_1.time_ < var_226_19 + var_226_20 then
				local var_226_21 = (arg_223_1.time_ - var_226_19) / var_226_20
				local var_226_22 = Vector3.New(-0.7, -1.06, -6.2)

				var_226_18.localPosition = Vector3.Lerp(arg_223_1.var_.moveOldPos1042ui_story, var_226_22, var_226_21)

				local var_226_23 = manager.ui.mainCamera.transform.position - var_226_18.position

				var_226_18.forward = Vector3.New(var_226_23.x, var_226_23.y, var_226_23.z)

				local var_226_24 = var_226_18.localEulerAngles

				var_226_24.z = 0
				var_226_24.x = 0
				var_226_18.localEulerAngles = var_226_24
			end

			if arg_223_1.time_ >= var_226_19 + var_226_20 and arg_223_1.time_ < var_226_19 + var_226_20 + arg_226_0 then
				var_226_18.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_226_25 = manager.ui.mainCamera.transform.position - var_226_18.position

				var_226_18.forward = Vector3.New(var_226_25.x, var_226_25.y, var_226_25.z)

				local var_226_26 = var_226_18.localEulerAngles

				var_226_26.z = 0
				var_226_26.x = 0
				var_226_18.localEulerAngles = var_226_26
			end

			local var_226_27 = 0

			if var_226_27 < arg_223_1.time_ and arg_223_1.time_ <= var_226_27 + arg_226_0 then
				arg_223_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action2_1")
			end

			local var_226_28 = 0

			if var_226_28 < arg_223_1.time_ and arg_223_1.time_ <= var_226_28 + arg_226_0 then
				arg_223_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_226_29 = arg_223_1.actors_["1042ui_story"]
			local var_226_30 = 0

			if var_226_30 < arg_223_1.time_ and arg_223_1.time_ <= var_226_30 + arg_226_0 and arg_223_1.var_.characterEffect1042ui_story == nil then
				arg_223_1.var_.characterEffect1042ui_story = var_226_29:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_31 = 0.2

			if var_226_30 <= arg_223_1.time_ and arg_223_1.time_ < var_226_30 + var_226_31 then
				local var_226_32 = (arg_223_1.time_ - var_226_30) / var_226_31

				if arg_223_1.var_.characterEffect1042ui_story then
					arg_223_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_223_1.time_ >= var_226_30 + var_226_31 and arg_223_1.time_ < var_226_30 + var_226_31 + arg_226_0 and arg_223_1.var_.characterEffect1042ui_story then
				arg_223_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_226_33 = 0
			local var_226_34 = 0.525

			if var_226_33 < arg_223_1.time_ and arg_223_1.time_ <= var_226_33 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_35 = arg_223_1:FormatText(StoryNameCfg[205].name)

				arg_223_1.leftNameTxt_.text = var_226_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_36 = arg_223_1:GetWordFromCfg(114191055)
				local var_226_37 = arg_223_1:FormatText(var_226_36.content)

				arg_223_1.text_.text = var_226_37

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_38 = 21
				local var_226_39 = utf8.len(var_226_37)
				local var_226_40 = var_226_38 <= 0 and var_226_34 or var_226_34 * (var_226_39 / var_226_38)

				if var_226_40 > 0 and var_226_34 < var_226_40 then
					arg_223_1.talkMaxDuration = var_226_40

					if var_226_40 + var_226_33 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_40 + var_226_33
					end
				end

				arg_223_1.text_.text = var_226_37
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191055", "story_v_out_114191.awb") ~= 0 then
					local var_226_41 = manager.audio:GetVoiceLength("story_v_out_114191", "114191055", "story_v_out_114191.awb") / 1000

					if var_226_41 + var_226_33 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_41 + var_226_33
					end

					if var_226_36.prefab_name ~= "" and arg_223_1.actors_[var_226_36.prefab_name] ~= nil then
						local var_226_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_36.prefab_name].transform, "story_v_out_114191", "114191055", "story_v_out_114191.awb")

						arg_223_1:RecordAudio("114191055", var_226_42)
						arg_223_1:RecordAudio("114191055", var_226_42)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_114191", "114191055", "story_v_out_114191.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_114191", "114191055", "story_v_out_114191.awb")
				end

				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_43 = math.max(var_226_34, arg_223_1.talkMaxDuration)

			if var_226_33 <= arg_223_1.time_ and arg_223_1.time_ < var_226_33 + var_226_43 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_33) / var_226_43

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_33 + var_226_43 and arg_223_1.time_ < var_226_33 + var_226_43 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play114191056 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 114191056
		arg_227_1.duration_ = 6.8

		local var_227_0 = {
			ja = 5.733,
			ko = 6.8,
			zh = 5.5,
			en = 5.9
		}
		local var_227_1 = manager.audio:GetLocalizationFlag()

		if var_227_0[var_227_1] ~= nil then
			arg_227_1.duration_ = var_227_0[var_227_1]
		end

		SetActive(arg_227_1.tipsGo_, false)

		function arg_227_1.onSingleLineFinish_()
			arg_227_1.onSingleLineUpdate_ = nil
			arg_227_1.onSingleLineFinish_ = nil
			arg_227_1.state_ = "waiting"
		end

		function arg_227_1.playNext_(arg_229_0)
			if arg_229_0 == 1 then
				arg_227_0:Play114191057(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = 0

			if var_230_0 < arg_227_1.time_ and arg_227_1.time_ <= var_230_0 + arg_230_0 then
				arg_227_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 then
				arg_227_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action2_2")
			end

			local var_230_2 = 0
			local var_230_3 = 0.7

			if var_230_2 < arg_227_1.time_ and arg_227_1.time_ <= var_230_2 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_4 = arg_227_1:FormatText(StoryNameCfg[205].name)

				arg_227_1.leftNameTxt_.text = var_230_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_5 = arg_227_1:GetWordFromCfg(114191056)
				local var_230_6 = arg_227_1:FormatText(var_230_5.content)

				arg_227_1.text_.text = var_230_6

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_7 = 28
				local var_230_8 = utf8.len(var_230_6)
				local var_230_9 = var_230_7 <= 0 and var_230_3 or var_230_3 * (var_230_8 / var_230_7)

				if var_230_9 > 0 and var_230_3 < var_230_9 then
					arg_227_1.talkMaxDuration = var_230_9

					if var_230_9 + var_230_2 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_9 + var_230_2
					end
				end

				arg_227_1.text_.text = var_230_6
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191056", "story_v_out_114191.awb") ~= 0 then
					local var_230_10 = manager.audio:GetVoiceLength("story_v_out_114191", "114191056", "story_v_out_114191.awb") / 1000

					if var_230_10 + var_230_2 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_10 + var_230_2
					end

					if var_230_5.prefab_name ~= "" and arg_227_1.actors_[var_230_5.prefab_name] ~= nil then
						local var_230_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_5.prefab_name].transform, "story_v_out_114191", "114191056", "story_v_out_114191.awb")

						arg_227_1:RecordAudio("114191056", var_230_11)
						arg_227_1:RecordAudio("114191056", var_230_11)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_114191", "114191056", "story_v_out_114191.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_114191", "114191056", "story_v_out_114191.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_12 = math.max(var_230_3, arg_227_1.talkMaxDuration)

			if var_230_2 <= arg_227_1.time_ and arg_227_1.time_ < var_230_2 + var_230_12 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_2) / var_230_12

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_2 + var_230_12 and arg_227_1.time_ < var_230_2 + var_230_12 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play114191057 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 114191057
		arg_231_1.duration_ = 2.933

		local var_231_0 = {
			ja = 2.933,
			ko = 2.5,
			zh = 2.133,
			en = 1.999999999999
		}
		local var_231_1 = manager.audio:GetLocalizationFlag()

		if var_231_0[var_231_1] ~= nil then
			arg_231_1.duration_ = var_231_0[var_231_1]
		end

		SetActive(arg_231_1.tipsGo_, false)

		function arg_231_1.onSingleLineFinish_()
			arg_231_1.onSingleLineUpdate_ = nil
			arg_231_1.onSingleLineFinish_ = nil
			arg_231_1.state_ = "waiting"
		end

		function arg_231_1.playNext_(arg_233_0)
			if arg_233_0 == 1 then
				arg_231_0:Play114191058(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["1184ui_story"].transform
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 then
				arg_231_1.var_.moveOldPos1184ui_story = var_234_0.localPosition
			end

			local var_234_2 = 0.001

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_2 then
				local var_234_3 = (arg_231_1.time_ - var_234_1) / var_234_2
				local var_234_4 = Vector3.New(0.7, -0.97, -6)

				var_234_0.localPosition = Vector3.Lerp(arg_231_1.var_.moveOldPos1184ui_story, var_234_4, var_234_3)

				local var_234_5 = manager.ui.mainCamera.transform.position - var_234_0.position

				var_234_0.forward = Vector3.New(var_234_5.x, var_234_5.y, var_234_5.z)

				local var_234_6 = var_234_0.localEulerAngles

				var_234_6.z = 0
				var_234_6.x = 0
				var_234_0.localEulerAngles = var_234_6
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 then
				var_234_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_234_7 = manager.ui.mainCamera.transform.position - var_234_0.position

				var_234_0.forward = Vector3.New(var_234_7.x, var_234_7.y, var_234_7.z)

				local var_234_8 = var_234_0.localEulerAngles

				var_234_8.z = 0
				var_234_8.x = 0
				var_234_0.localEulerAngles = var_234_8
			end

			local var_234_9 = 0

			if var_234_9 < arg_231_1.time_ and arg_231_1.time_ <= var_234_9 + arg_234_0 then
				arg_231_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_234_10 = 0

			if var_234_10 < arg_231_1.time_ and arg_231_1.time_ <= var_234_10 + arg_234_0 then
				arg_231_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_234_11 = arg_231_1.actors_["1184ui_story"]
			local var_234_12 = 0

			if var_234_12 < arg_231_1.time_ and arg_231_1.time_ <= var_234_12 + arg_234_0 and arg_231_1.var_.characterEffect1184ui_story == nil then
				arg_231_1.var_.characterEffect1184ui_story = var_234_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_13 = 0.2

			if var_234_12 <= arg_231_1.time_ and arg_231_1.time_ < var_234_12 + var_234_13 then
				local var_234_14 = (arg_231_1.time_ - var_234_12) / var_234_13

				if arg_231_1.var_.characterEffect1184ui_story then
					arg_231_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_231_1.time_ >= var_234_12 + var_234_13 and arg_231_1.time_ < var_234_12 + var_234_13 + arg_234_0 and arg_231_1.var_.characterEffect1184ui_story then
				arg_231_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_234_15 = arg_231_1.actors_["1042ui_story"]
			local var_234_16 = 0

			if var_234_16 < arg_231_1.time_ and arg_231_1.time_ <= var_234_16 + arg_234_0 and arg_231_1.var_.characterEffect1042ui_story == nil then
				arg_231_1.var_.characterEffect1042ui_story = var_234_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_17 = 0.2

			if var_234_16 <= arg_231_1.time_ and arg_231_1.time_ < var_234_16 + var_234_17 then
				local var_234_18 = (arg_231_1.time_ - var_234_16) / var_234_17

				if arg_231_1.var_.characterEffect1042ui_story then
					local var_234_19 = Mathf.Lerp(0, 0.5, var_234_18)

					arg_231_1.var_.characterEffect1042ui_story.fillFlat = true
					arg_231_1.var_.characterEffect1042ui_story.fillRatio = var_234_19
				end
			end

			if arg_231_1.time_ >= var_234_16 + var_234_17 and arg_231_1.time_ < var_234_16 + var_234_17 + arg_234_0 and arg_231_1.var_.characterEffect1042ui_story then
				local var_234_20 = 0.5

				arg_231_1.var_.characterEffect1042ui_story.fillFlat = true
				arg_231_1.var_.characterEffect1042ui_story.fillRatio = var_234_20
			end

			local var_234_21 = 0
			local var_234_22 = 0.2

			if var_234_21 < arg_231_1.time_ and arg_231_1.time_ <= var_234_21 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_23 = arg_231_1:FormatText(StoryNameCfg[6].name)

				arg_231_1.leftNameTxt_.text = var_234_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_24 = arg_231_1:GetWordFromCfg(114191057)
				local var_234_25 = arg_231_1:FormatText(var_234_24.content)

				arg_231_1.text_.text = var_234_25

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_26 = 8
				local var_234_27 = utf8.len(var_234_25)
				local var_234_28 = var_234_26 <= 0 and var_234_22 or var_234_22 * (var_234_27 / var_234_26)

				if var_234_28 > 0 and var_234_22 < var_234_28 then
					arg_231_1.talkMaxDuration = var_234_28

					if var_234_28 + var_234_21 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_28 + var_234_21
					end
				end

				arg_231_1.text_.text = var_234_25
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191057", "story_v_out_114191.awb") ~= 0 then
					local var_234_29 = manager.audio:GetVoiceLength("story_v_out_114191", "114191057", "story_v_out_114191.awb") / 1000

					if var_234_29 + var_234_21 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_29 + var_234_21
					end

					if var_234_24.prefab_name ~= "" and arg_231_1.actors_[var_234_24.prefab_name] ~= nil then
						local var_234_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_24.prefab_name].transform, "story_v_out_114191", "114191057", "story_v_out_114191.awb")

						arg_231_1:RecordAudio("114191057", var_234_30)
						arg_231_1:RecordAudio("114191057", var_234_30)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_114191", "114191057", "story_v_out_114191.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_114191", "114191057", "story_v_out_114191.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_31 = math.max(var_234_22, arg_231_1.talkMaxDuration)

			if var_234_21 <= arg_231_1.time_ and arg_231_1.time_ < var_234_21 + var_234_31 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_21) / var_234_31

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_21 + var_234_31 and arg_231_1.time_ < var_234_21 + var_234_31 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play114191058 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 114191058
		arg_235_1.duration_ = 0.199999999999

		SetActive(arg_235_1.tipsGo_, false)

		function arg_235_1.onSingleLineFinish_()
			arg_235_1.onSingleLineUpdate_ = nil
			arg_235_1.onSingleLineFinish_ = nil
			arg_235_1.state_ = "waiting"

			SetActive(arg_235_1.choicesGo_, true)

			for iter_236_0, iter_236_1 in ipairs(arg_235_1.choices_) do
				local var_236_0 = iter_236_0 <= 1

				SetActive(iter_236_1.go, var_236_0)
			end

			arg_235_1.choices_[1].txt.text = arg_235_1:FormatText(StoryChoiceCfg[145].name)
		end

		function arg_235_1.playNext_(arg_237_0)
			if arg_237_0 == 1 then
				arg_235_0:Play114191059(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["1184ui_story"]
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 and arg_235_1.var_.characterEffect1184ui_story == nil then
				arg_235_1.var_.characterEffect1184ui_story = var_238_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_2 = 0.2

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_2 then
				local var_238_3 = (arg_235_1.time_ - var_238_1) / var_238_2

				if arg_235_1.var_.characterEffect1184ui_story then
					local var_238_4 = Mathf.Lerp(0, 0.5, var_238_3)

					arg_235_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_235_1.var_.characterEffect1184ui_story.fillRatio = var_238_4
				end
			end

			if arg_235_1.time_ >= var_238_1 + var_238_2 and arg_235_1.time_ < var_238_1 + var_238_2 + arg_238_0 and arg_235_1.var_.characterEffect1184ui_story then
				local var_238_5 = 0.5

				arg_235_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_235_1.var_.characterEffect1184ui_story.fillRatio = var_238_5
			end
		end
	end,
	Play114191059 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 114191059
		arg_239_1.duration_ = 4.3

		local var_239_0 = {
			ja = 4.166,
			ko = 2.166,
			zh = 3.2,
			en = 4.3
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
				arg_239_0:Play114191060(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = 0

			if var_242_0 < arg_239_1.time_ and arg_239_1.time_ <= var_242_0 + arg_242_0 then
				arg_239_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/1042/1042action/1042action2_1")
			end

			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 then
				arg_239_1:PlayTimeline("1042ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_242_2 = arg_239_1.actors_["1042ui_story"]
			local var_242_3 = 0

			if var_242_3 < arg_239_1.time_ and arg_239_1.time_ <= var_242_3 + arg_242_0 and arg_239_1.var_.characterEffect1042ui_story == nil then
				arg_239_1.var_.characterEffect1042ui_story = var_242_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_4 = 0.2

			if var_242_3 <= arg_239_1.time_ and arg_239_1.time_ < var_242_3 + var_242_4 then
				local var_242_5 = (arg_239_1.time_ - var_242_3) / var_242_4

				if arg_239_1.var_.characterEffect1042ui_story then
					arg_239_1.var_.characterEffect1042ui_story.fillFlat = false
				end
			end

			if arg_239_1.time_ >= var_242_3 + var_242_4 and arg_239_1.time_ < var_242_3 + var_242_4 + arg_242_0 and arg_239_1.var_.characterEffect1042ui_story then
				arg_239_1.var_.characterEffect1042ui_story.fillFlat = false
			end

			local var_242_6 = 0
			local var_242_7 = 0.275

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
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_9 = arg_239_1:GetWordFromCfg(114191059)
				local var_242_10 = arg_239_1:FormatText(var_242_9.content)

				arg_239_1.text_.text = var_242_10

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_11 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191059", "story_v_out_114191.awb") ~= 0 then
					local var_242_14 = manager.audio:GetVoiceLength("story_v_out_114191", "114191059", "story_v_out_114191.awb") / 1000

					if var_242_14 + var_242_6 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_14 + var_242_6
					end

					if var_242_9.prefab_name ~= "" and arg_239_1.actors_[var_242_9.prefab_name] ~= nil then
						local var_242_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_9.prefab_name].transform, "story_v_out_114191", "114191059", "story_v_out_114191.awb")

						arg_239_1:RecordAudio("114191059", var_242_15)
						arg_239_1:RecordAudio("114191059", var_242_15)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_114191", "114191059", "story_v_out_114191.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_114191", "114191059", "story_v_out_114191.awb")
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
	Play114191060 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 114191060
		arg_243_1.duration_ = 9

		SetActive(arg_243_1.tipsGo_, false)

		function arg_243_1.onSingleLineFinish_()
			arg_243_1.onSingleLineUpdate_ = nil
			arg_243_1.onSingleLineFinish_ = nil
			arg_243_1.state_ = "waiting"
		end

		function arg_243_1.playNext_(arg_245_0)
			if arg_245_0 == 1 then
				arg_243_0:Play114191061(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = 2

			if var_246_0 < arg_243_1.time_ and arg_243_1.time_ <= var_246_0 + arg_246_0 then
				local var_246_1 = manager.ui.mainCamera.transform.localPosition
				local var_246_2 = Vector3.New(0, 0, 10) + Vector3.New(var_246_1.x, var_246_1.y, 0)
				local var_246_3 = arg_243_1.bgs_.ST22

				var_246_3.transform.localPosition = var_246_2
				var_246_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_246_4 = var_246_3:GetComponent("SpriteRenderer")

				if var_246_4 and var_246_4.sprite then
					local var_246_5 = (var_246_3.transform.localPosition - var_246_1).z
					local var_246_6 = manager.ui.mainCameraCom_
					local var_246_7 = 2 * var_246_5 * Mathf.Tan(var_246_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_246_8 = var_246_7 * var_246_6.aspect
					local var_246_9 = var_246_4.sprite.bounds.size.x
					local var_246_10 = var_246_4.sprite.bounds.size.y
					local var_246_11 = var_246_8 / var_246_9
					local var_246_12 = var_246_7 / var_246_10
					local var_246_13 = var_246_12 < var_246_11 and var_246_11 or var_246_12

					var_246_3.transform.localScale = Vector3.New(var_246_13, var_246_13, 0)
				end

				for iter_246_0, iter_246_1 in pairs(arg_243_1.bgs_) do
					if iter_246_0 ~= "ST22" then
						iter_246_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_246_14 = 2

			if var_246_14 < arg_243_1.time_ and arg_243_1.time_ <= var_246_14 + arg_246_0 then
				arg_243_1.mask_.enabled = true
				arg_243_1.mask_.raycastTarget = true

				arg_243_1:SetGaussion(false)
			end

			local var_246_15 = 2

			if var_246_14 <= arg_243_1.time_ and arg_243_1.time_ < var_246_14 + var_246_15 then
				local var_246_16 = (arg_243_1.time_ - var_246_14) / var_246_15
				local var_246_17 = Color.New(0, 0, 0)

				var_246_17.a = Mathf.Lerp(1, 0, var_246_16)
				arg_243_1.mask_.color = var_246_17
			end

			if arg_243_1.time_ >= var_246_14 + var_246_15 and arg_243_1.time_ < var_246_14 + var_246_15 + arg_246_0 then
				local var_246_18 = Color.New(0, 0, 0)
				local var_246_19 = 0

				arg_243_1.mask_.enabled = false
				var_246_18.a = var_246_19
				arg_243_1.mask_.color = var_246_18
			end

			local var_246_20 = 0

			if var_246_20 < arg_243_1.time_ and arg_243_1.time_ <= var_246_20 + arg_246_0 then
				arg_243_1.mask_.enabled = true
				arg_243_1.mask_.raycastTarget = true

				arg_243_1:SetGaussion(false)
			end

			local var_246_21 = 2

			if var_246_20 <= arg_243_1.time_ and arg_243_1.time_ < var_246_20 + var_246_21 then
				local var_246_22 = (arg_243_1.time_ - var_246_20) / var_246_21
				local var_246_23 = Color.New(0, 0, 0)

				var_246_23.a = Mathf.Lerp(0, 1, var_246_22)
				arg_243_1.mask_.color = var_246_23
			end

			if arg_243_1.time_ >= var_246_20 + var_246_21 and arg_243_1.time_ < var_246_20 + var_246_21 + arg_246_0 then
				local var_246_24 = Color.New(0, 0, 0)

				var_246_24.a = 1
				arg_243_1.mask_.color = var_246_24
			end

			local var_246_25 = arg_243_1.actors_["1042ui_story"].transform
			local var_246_26 = 1.966

			if var_246_26 < arg_243_1.time_ and arg_243_1.time_ <= var_246_26 + arg_246_0 then
				arg_243_1.var_.moveOldPos1042ui_story = var_246_25.localPosition
			end

			local var_246_27 = 0.001

			if var_246_26 <= arg_243_1.time_ and arg_243_1.time_ < var_246_26 + var_246_27 then
				local var_246_28 = (arg_243_1.time_ - var_246_26) / var_246_27
				local var_246_29 = Vector3.New(0, 100, 0)

				var_246_25.localPosition = Vector3.Lerp(arg_243_1.var_.moveOldPos1042ui_story, var_246_29, var_246_28)

				local var_246_30 = manager.ui.mainCamera.transform.position - var_246_25.position

				var_246_25.forward = Vector3.New(var_246_30.x, var_246_30.y, var_246_30.z)

				local var_246_31 = var_246_25.localEulerAngles

				var_246_31.z = 0
				var_246_31.x = 0
				var_246_25.localEulerAngles = var_246_31
			end

			if arg_243_1.time_ >= var_246_26 + var_246_27 and arg_243_1.time_ < var_246_26 + var_246_27 + arg_246_0 then
				var_246_25.localPosition = Vector3.New(0, 100, 0)

				local var_246_32 = manager.ui.mainCamera.transform.position - var_246_25.position

				var_246_25.forward = Vector3.New(var_246_32.x, var_246_32.y, var_246_32.z)

				local var_246_33 = var_246_25.localEulerAngles

				var_246_33.z = 0
				var_246_33.x = 0
				var_246_25.localEulerAngles = var_246_33
			end

			local var_246_34 = arg_243_1.actors_["1184ui_story"].transform
			local var_246_35 = 1.966

			if var_246_35 < arg_243_1.time_ and arg_243_1.time_ <= var_246_35 + arg_246_0 then
				arg_243_1.var_.moveOldPos1184ui_story = var_246_34.localPosition
			end

			local var_246_36 = 0.001

			if var_246_35 <= arg_243_1.time_ and arg_243_1.time_ < var_246_35 + var_246_36 then
				local var_246_37 = (arg_243_1.time_ - var_246_35) / var_246_36
				local var_246_38 = Vector3.New(0, 100, 0)

				var_246_34.localPosition = Vector3.Lerp(arg_243_1.var_.moveOldPos1184ui_story, var_246_38, var_246_37)

				local var_246_39 = manager.ui.mainCamera.transform.position - var_246_34.position

				var_246_34.forward = Vector3.New(var_246_39.x, var_246_39.y, var_246_39.z)

				local var_246_40 = var_246_34.localEulerAngles

				var_246_40.z = 0
				var_246_40.x = 0
				var_246_34.localEulerAngles = var_246_40
			end

			if arg_243_1.time_ >= var_246_35 + var_246_36 and arg_243_1.time_ < var_246_35 + var_246_36 + arg_246_0 then
				var_246_34.localPosition = Vector3.New(0, 100, 0)

				local var_246_41 = manager.ui.mainCamera.transform.position - var_246_34.position

				var_246_34.forward = Vector3.New(var_246_41.x, var_246_41.y, var_246_41.z)

				local var_246_42 = var_246_34.localEulerAngles

				var_246_42.z = 0
				var_246_42.x = 0
				var_246_34.localEulerAngles = var_246_42
			end

			if arg_243_1.frameCnt_ <= 1 then
				arg_243_1.dialog_:SetActive(false)
			end

			local var_246_43 = 4
			local var_246_44 = 1.4

			if var_246_43 < arg_243_1.time_ and arg_243_1.time_ <= var_246_43 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0

				arg_243_1.dialog_:SetActive(true)

				local var_246_45 = LeanTween.value(arg_243_1.dialog_, 0, 1, 0.3)

				var_246_45:setOnUpdate(LuaHelper.FloatAction(function(arg_247_0)
					arg_243_1.dialogCg_.alpha = arg_247_0
				end))
				var_246_45:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_243_1.dialog_)
					var_246_45:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_243_1.duration_ = arg_243_1.duration_ + 0.3

				SetActive(arg_243_1.leftNameGo_, false)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_46 = arg_243_1:GetWordFromCfg(114191060)
				local var_246_47 = arg_243_1:FormatText(var_246_46.content)

				arg_243_1.text_.text = var_246_47

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_48 = 56
				local var_246_49 = utf8.len(var_246_47)
				local var_246_50 = var_246_48 <= 0 and var_246_44 or var_246_44 * (var_246_49 / var_246_48)

				if var_246_50 > 0 and var_246_44 < var_246_50 then
					arg_243_1.talkMaxDuration = var_246_50
					var_246_43 = var_246_43 + 0.3

					if var_246_50 + var_246_43 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_50 + var_246_43
					end
				end

				arg_243_1.text_.text = var_246_47
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)
				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_51 = var_246_43 + 0.3
			local var_246_52 = math.max(var_246_44, arg_243_1.talkMaxDuration)

			if var_246_51 <= arg_243_1.time_ and arg_243_1.time_ < var_246_51 + var_246_52 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_51) / var_246_52

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_51 + var_246_52 and arg_243_1.time_ < var_246_51 + var_246_52 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play114191061 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 114191061
		arg_249_1.duration_ = 5

		SetActive(arg_249_1.tipsGo_, false)

		function arg_249_1.onSingleLineFinish_()
			arg_249_1.onSingleLineUpdate_ = nil
			arg_249_1.onSingleLineFinish_ = nil
			arg_249_1.state_ = "waiting"
		end

		function arg_249_1.playNext_(arg_251_0)
			if arg_251_0 == 1 then
				arg_249_0:Play114191062(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = 0
			local var_252_1 = 1.625

			if var_252_0 < arg_249_1.time_ and arg_249_1.time_ <= var_252_0 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, false)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_2 = arg_249_1:GetWordFromCfg(114191061)
				local var_252_3 = arg_249_1:FormatText(var_252_2.content)

				arg_249_1.text_.text = var_252_3

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_4 = 65
				local var_252_5 = utf8.len(var_252_3)
				local var_252_6 = var_252_4 <= 0 and var_252_1 or var_252_1 * (var_252_5 / var_252_4)

				if var_252_6 > 0 and var_252_1 < var_252_6 then
					arg_249_1.talkMaxDuration = var_252_6

					if var_252_6 + var_252_0 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_6 + var_252_0
					end
				end

				arg_249_1.text_.text = var_252_3
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)
				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_7 = math.max(var_252_1, arg_249_1.talkMaxDuration)

			if var_252_0 <= arg_249_1.time_ and arg_249_1.time_ < var_252_0 + var_252_7 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_0) / var_252_7

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_0 + var_252_7 and arg_249_1.time_ < var_252_0 + var_252_7 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play114191062 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 114191062
		arg_253_1.duration_ = 5

		SetActive(arg_253_1.tipsGo_, false)

		function arg_253_1.onSingleLineFinish_()
			arg_253_1.onSingleLineUpdate_ = nil
			arg_253_1.onSingleLineFinish_ = nil
			arg_253_1.state_ = "waiting"
		end

		function arg_253_1.playNext_(arg_255_0)
			if arg_255_0 == 1 then
				arg_253_0:Play114191063(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = 0
			local var_256_1 = 1.5

			if var_256_0 < arg_253_1.time_ and arg_253_1.time_ <= var_256_0 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, false)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_2 = arg_253_1:GetWordFromCfg(114191062)
				local var_256_3 = arg_253_1:FormatText(var_256_2.content)

				arg_253_1.text_.text = var_256_3

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_4 = 60
				local var_256_5 = utf8.len(var_256_3)
				local var_256_6 = var_256_4 <= 0 and var_256_1 or var_256_1 * (var_256_5 / var_256_4)

				if var_256_6 > 0 and var_256_1 < var_256_6 then
					arg_253_1.talkMaxDuration = var_256_6

					if var_256_6 + var_256_0 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_6 + var_256_0
					end
				end

				arg_253_1.text_.text = var_256_3
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)
				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_7 = math.max(var_256_1, arg_253_1.talkMaxDuration)

			if var_256_0 <= arg_253_1.time_ and arg_253_1.time_ < var_256_0 + var_256_7 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_0) / var_256_7

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_0 + var_256_7 and arg_253_1.time_ < var_256_0 + var_256_7 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play114191063 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 114191063
		arg_257_1.duration_ = 9

		SetActive(arg_257_1.tipsGo_, false)

		function arg_257_1.onSingleLineFinish_()
			arg_257_1.onSingleLineUpdate_ = nil
			arg_257_1.onSingleLineFinish_ = nil
			arg_257_1.state_ = "waiting"
		end

		function arg_257_1.playNext_(arg_259_0)
			if arg_259_0 == 1 then
				arg_257_0:Play114191064(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = "F02a_1"

			if arg_257_1.bgs_[var_260_0] == nil then
				local var_260_1 = Object.Instantiate(arg_257_1.paintGo_)

				var_260_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_260_0)
				var_260_1.name = var_260_0
				var_260_1.transform.parent = arg_257_1.stage_.transform
				var_260_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_257_1.bgs_[var_260_0] = var_260_1
			end

			local var_260_2 = 2

			if var_260_2 < arg_257_1.time_ and arg_257_1.time_ <= var_260_2 + arg_260_0 then
				local var_260_3 = manager.ui.mainCamera.transform.localPosition
				local var_260_4 = Vector3.New(0, 0, 10) + Vector3.New(var_260_3.x, var_260_3.y, 0)
				local var_260_5 = arg_257_1.bgs_.F02a_1

				var_260_5.transform.localPosition = var_260_4
				var_260_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_260_6 = var_260_5:GetComponent("SpriteRenderer")

				if var_260_6 and var_260_6.sprite then
					local var_260_7 = (var_260_5.transform.localPosition - var_260_3).z
					local var_260_8 = manager.ui.mainCameraCom_
					local var_260_9 = 2 * var_260_7 * Mathf.Tan(var_260_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_260_10 = var_260_9 * var_260_8.aspect
					local var_260_11 = var_260_6.sprite.bounds.size.x
					local var_260_12 = var_260_6.sprite.bounds.size.y
					local var_260_13 = var_260_10 / var_260_11
					local var_260_14 = var_260_9 / var_260_12
					local var_260_15 = var_260_14 < var_260_13 and var_260_13 or var_260_14

					var_260_5.transform.localScale = Vector3.New(var_260_15, var_260_15, 0)
				end

				for iter_260_0, iter_260_1 in pairs(arg_257_1.bgs_) do
					if iter_260_0 ~= "F02a_1" then
						iter_260_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_260_16 = 0

			if var_260_16 < arg_257_1.time_ and arg_257_1.time_ <= var_260_16 + arg_260_0 then
				arg_257_1.mask_.enabled = true
				arg_257_1.mask_.raycastTarget = true

				arg_257_1:SetGaussion(false)
			end

			local var_260_17 = 2

			if var_260_16 <= arg_257_1.time_ and arg_257_1.time_ < var_260_16 + var_260_17 then
				local var_260_18 = (arg_257_1.time_ - var_260_16) / var_260_17
				local var_260_19 = Color.New(0, 0, 0)

				var_260_19.a = Mathf.Lerp(0, 1, var_260_18)
				arg_257_1.mask_.color = var_260_19
			end

			if arg_257_1.time_ >= var_260_16 + var_260_17 and arg_257_1.time_ < var_260_16 + var_260_17 + arg_260_0 then
				local var_260_20 = Color.New(0, 0, 0)

				var_260_20.a = 1
				arg_257_1.mask_.color = var_260_20
			end

			local var_260_21 = 2

			if var_260_21 < arg_257_1.time_ and arg_257_1.time_ <= var_260_21 + arg_260_0 then
				arg_257_1.mask_.enabled = true
				arg_257_1.mask_.raycastTarget = true

				arg_257_1:SetGaussion(false)
			end

			local var_260_22 = 2

			if var_260_21 <= arg_257_1.time_ and arg_257_1.time_ < var_260_21 + var_260_22 then
				local var_260_23 = (arg_257_1.time_ - var_260_21) / var_260_22
				local var_260_24 = Color.New(0, 0, 0)

				var_260_24.a = Mathf.Lerp(1, 0, var_260_23)
				arg_257_1.mask_.color = var_260_24
			end

			if arg_257_1.time_ >= var_260_21 + var_260_22 and arg_257_1.time_ < var_260_21 + var_260_22 + arg_260_0 then
				local var_260_25 = Color.New(0, 0, 0)
				local var_260_26 = 0

				arg_257_1.mask_.enabled = false
				var_260_25.a = var_260_26
				arg_257_1.mask_.color = var_260_25
			end

			if arg_257_1.frameCnt_ <= 1 then
				arg_257_1.dialog_:SetActive(false)
			end

			local var_260_27 = 4
			local var_260_28 = 0.7

			if var_260_27 < arg_257_1.time_ and arg_257_1.time_ <= var_260_27 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0

				arg_257_1.dialog_:SetActive(true)

				local var_260_29 = LeanTween.value(arg_257_1.dialog_, 0, 1, 0.3)

				var_260_29:setOnUpdate(LuaHelper.FloatAction(function(arg_261_0)
					arg_257_1.dialogCg_.alpha = arg_261_0
				end))
				var_260_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_257_1.dialog_)
					var_260_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_257_1.duration_ = arg_257_1.duration_ + 0.3

				SetActive(arg_257_1.leftNameGo_, false)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_30 = arg_257_1:GetWordFromCfg(114191063)
				local var_260_31 = arg_257_1:FormatText(var_260_30.content)

				arg_257_1.text_.text = var_260_31

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_32 = 28
				local var_260_33 = utf8.len(var_260_31)
				local var_260_34 = var_260_32 <= 0 and var_260_28 or var_260_28 * (var_260_33 / var_260_32)

				if var_260_34 > 0 and var_260_28 < var_260_34 then
					arg_257_1.talkMaxDuration = var_260_34
					var_260_27 = var_260_27 + 0.3

					if var_260_34 + var_260_27 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_34 + var_260_27
					end
				end

				arg_257_1.text_.text = var_260_31
				arg_257_1.typewritter.percent = 0

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(false)
				arg_257_1:RecordContent(arg_257_1.text_.text)
			end

			local var_260_35 = var_260_27 + 0.3
			local var_260_36 = math.max(var_260_28, arg_257_1.talkMaxDuration)

			if var_260_35 <= arg_257_1.time_ and arg_257_1.time_ < var_260_35 + var_260_36 then
				arg_257_1.typewritter.percent = (arg_257_1.time_ - var_260_35) / var_260_36

				arg_257_1.typewritter:SetDirty()
			end

			if arg_257_1.time_ >= var_260_35 + var_260_36 and arg_257_1.time_ < var_260_35 + var_260_36 + arg_260_0 then
				arg_257_1.typewritter.percent = 1

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(true)
			end
		end
	end,
	Play114191064 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 114191064
		arg_263_1.duration_ = 5

		SetActive(arg_263_1.tipsGo_, false)

		function arg_263_1.onSingleLineFinish_()
			arg_263_1.onSingleLineUpdate_ = nil
			arg_263_1.onSingleLineFinish_ = nil
			arg_263_1.state_ = "waiting"
		end

		function arg_263_1.playNext_(arg_265_0)
			if arg_265_0 == 1 then
				arg_263_0:Play114191065(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = 0
			local var_266_1 = 1.3

			if var_266_0 < arg_263_1.time_ and arg_263_1.time_ <= var_266_0 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, false)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_2 = arg_263_1:GetWordFromCfg(114191064)
				local var_266_3 = arg_263_1:FormatText(var_266_2.content)

				arg_263_1.text_.text = var_266_3

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_4 = 52
				local var_266_5 = utf8.len(var_266_3)
				local var_266_6 = var_266_4 <= 0 and var_266_1 or var_266_1 * (var_266_5 / var_266_4)

				if var_266_6 > 0 and var_266_1 < var_266_6 then
					arg_263_1.talkMaxDuration = var_266_6

					if var_266_6 + var_266_0 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_6 + var_266_0
					end
				end

				arg_263_1.text_.text = var_266_3
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)
				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_7 = math.max(var_266_1, arg_263_1.talkMaxDuration)

			if var_266_0 <= arg_263_1.time_ and arg_263_1.time_ < var_266_0 + var_266_7 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_0) / var_266_7

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_0 + var_266_7 and arg_263_1.time_ < var_266_0 + var_266_7 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play114191065 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 114191065
		arg_267_1.duration_ = 5

		SetActive(arg_267_1.tipsGo_, false)

		function arg_267_1.onSingleLineFinish_()
			arg_267_1.onSingleLineUpdate_ = nil
			arg_267_1.onSingleLineFinish_ = nil
			arg_267_1.state_ = "waiting"
		end

		function arg_267_1.playNext_(arg_269_0)
			if arg_269_0 == 1 then
				arg_267_0:Play114191066(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = 0
			local var_270_1 = 0.525

			if var_270_0 < arg_267_1.time_ and arg_267_1.time_ <= var_270_0 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_2 = arg_267_1:FormatText(StoryNameCfg[7].name)

				arg_267_1.leftNameTxt_.text = var_270_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_3 = arg_267_1:GetWordFromCfg(114191065)
				local var_270_4 = arg_267_1:FormatText(var_270_3.content)

				arg_267_1.text_.text = var_270_4

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_5 = 21
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
				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_8 = math.max(var_270_1, arg_267_1.talkMaxDuration)

			if var_270_0 <= arg_267_1.time_ and arg_267_1.time_ < var_270_0 + var_270_8 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_0) / var_270_8

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_0 + var_270_8 and arg_267_1.time_ < var_270_0 + var_270_8 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play114191066 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 114191066
		arg_271_1.duration_ = 5.9

		local var_271_0 = {
			ja = 5.9,
			ko = 5.733,
			zh = 4.233,
			en = 3.4
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
				arg_271_0:Play114191067(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = 0
			local var_274_1 = 0.425

			if var_274_0 < arg_271_1.time_ and arg_271_1.time_ <= var_274_0 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_2 = arg_271_1:FormatText(StoryNameCfg[6].name)

				arg_271_1.leftNameTxt_.text = var_274_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, true)
				arg_271_1.iconController_:SetSelectedState("hero")

				arg_271_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1184")

				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_3 = arg_271_1:GetWordFromCfg(114191066)
				local var_274_4 = arg_271_1:FormatText(var_274_3.content)

				arg_271_1.text_.text = var_274_4

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_5 = 17
				local var_274_6 = utf8.len(var_274_4)
				local var_274_7 = var_274_5 <= 0 and var_274_1 or var_274_1 * (var_274_6 / var_274_5)

				if var_274_7 > 0 and var_274_1 < var_274_7 then
					arg_271_1.talkMaxDuration = var_274_7

					if var_274_7 + var_274_0 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_7 + var_274_0
					end
				end

				arg_271_1.text_.text = var_274_4
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191066", "story_v_out_114191.awb") ~= 0 then
					local var_274_8 = manager.audio:GetVoiceLength("story_v_out_114191", "114191066", "story_v_out_114191.awb") / 1000

					if var_274_8 + var_274_0 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_8 + var_274_0
					end

					if var_274_3.prefab_name ~= "" and arg_271_1.actors_[var_274_3.prefab_name] ~= nil then
						local var_274_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_271_1.actors_[var_274_3.prefab_name].transform, "story_v_out_114191", "114191066", "story_v_out_114191.awb")

						arg_271_1:RecordAudio("114191066", var_274_9)
						arg_271_1:RecordAudio("114191066", var_274_9)
					else
						arg_271_1:AudioAction("play", "voice", "story_v_out_114191", "114191066", "story_v_out_114191.awb")
					end

					arg_271_1:RecordHistoryTalkVoice("story_v_out_114191", "114191066", "story_v_out_114191.awb")
				end

				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_10 = math.max(var_274_1, arg_271_1.talkMaxDuration)

			if var_274_0 <= arg_271_1.time_ and arg_271_1.time_ < var_274_0 + var_274_10 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_0) / var_274_10

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_0 + var_274_10 and arg_271_1.time_ < var_274_0 + var_274_10 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play114191067 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 114191067
		arg_275_1.duration_ = 5

		SetActive(arg_275_1.tipsGo_, false)

		function arg_275_1.onSingleLineFinish_()
			arg_275_1.onSingleLineUpdate_ = nil
			arg_275_1.onSingleLineFinish_ = nil
			arg_275_1.state_ = "waiting"
		end

		function arg_275_1.playNext_(arg_277_0)
			if arg_277_0 == 1 then
				arg_275_0:Play114191068(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = 0
			local var_278_1 = 0.775

			if var_278_0 < arg_275_1.time_ and arg_275_1.time_ <= var_278_0 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_2 = arg_275_1:FormatText(StoryNameCfg[7].name)

				arg_275_1.leftNameTxt_.text = var_278_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_3 = arg_275_1:GetWordFromCfg(114191067)
				local var_278_4 = arg_275_1:FormatText(var_278_3.content)

				arg_275_1.text_.text = var_278_4

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_5 = 31
				local var_278_6 = utf8.len(var_278_4)
				local var_278_7 = var_278_5 <= 0 and var_278_1 or var_278_1 * (var_278_6 / var_278_5)

				if var_278_7 > 0 and var_278_1 < var_278_7 then
					arg_275_1.talkMaxDuration = var_278_7

					if var_278_7 + var_278_0 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_7 + var_278_0
					end
				end

				arg_275_1.text_.text = var_278_4
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)
				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_8 = math.max(var_278_1, arg_275_1.talkMaxDuration)

			if var_278_0 <= arg_275_1.time_ and arg_275_1.time_ < var_278_0 + var_278_8 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_0) / var_278_8

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_0 + var_278_8 and arg_275_1.time_ < var_278_0 + var_278_8 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play114191068 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 114191068
		arg_279_1.duration_ = 5

		SetActive(arg_279_1.tipsGo_, false)

		function arg_279_1.onSingleLineFinish_()
			arg_279_1.onSingleLineUpdate_ = nil
			arg_279_1.onSingleLineFinish_ = nil
			arg_279_1.state_ = "waiting"
		end

		function arg_279_1.playNext_(arg_281_0)
			if arg_281_0 == 1 then
				arg_279_0:Play114191069(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = 0
			local var_282_1 = 0.6

			if var_282_0 < arg_279_1.time_ and arg_279_1.time_ <= var_282_0 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, false)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_2 = arg_279_1:GetWordFromCfg(114191068)
				local var_282_3 = arg_279_1:FormatText(var_282_2.content)

				arg_279_1.text_.text = var_282_3

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_4 = 24
				local var_282_5 = utf8.len(var_282_3)
				local var_282_6 = var_282_4 <= 0 and var_282_1 or var_282_1 * (var_282_5 / var_282_4)

				if var_282_6 > 0 and var_282_1 < var_282_6 then
					arg_279_1.talkMaxDuration = var_282_6

					if var_282_6 + var_282_0 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_6 + var_282_0
					end
				end

				arg_279_1.text_.text = var_282_3
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)
				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_7 = math.max(var_282_1, arg_279_1.talkMaxDuration)

			if var_282_0 <= arg_279_1.time_ and arg_279_1.time_ < var_282_0 + var_282_7 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_0) / var_282_7

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_0 + var_282_7 and arg_279_1.time_ < var_282_0 + var_282_7 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play114191069 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 114191069
		arg_283_1.duration_ = 6.1

		local var_283_0 = {
			ja = 3.533,
			ko = 2.833,
			zh = 6.1,
			en = 2.933
		}
		local var_283_1 = manager.audio:GetLocalizationFlag()

		if var_283_0[var_283_1] ~= nil then
			arg_283_1.duration_ = var_283_0[var_283_1]
		end

		SetActive(arg_283_1.tipsGo_, false)

		function arg_283_1.onSingleLineFinish_()
			arg_283_1.onSingleLineUpdate_ = nil
			arg_283_1.onSingleLineFinish_ = nil
			arg_283_1.state_ = "waiting"
		end

		function arg_283_1.playNext_(arg_285_0)
			if arg_285_0 == 1 then
				arg_283_0:Play114191070(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = 0
			local var_286_1 = 0.4

			if var_286_0 < arg_283_1.time_ and arg_283_1.time_ <= var_286_0 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_2 = arg_283_1:FormatText(StoryNameCfg[207].name)

				arg_283_1.leftNameTxt_.text = var_286_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, true)
				arg_283_1.iconController_:SetSelectedState("hero")

				arg_283_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_studentm")

				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_3 = arg_283_1:GetWordFromCfg(114191069)
				local var_286_4 = arg_283_1:FormatText(var_286_3.content)

				arg_283_1.text_.text = var_286_4

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_5 = 16
				local var_286_6 = utf8.len(var_286_4)
				local var_286_7 = var_286_5 <= 0 and var_286_1 or var_286_1 * (var_286_6 / var_286_5)

				if var_286_7 > 0 and var_286_1 < var_286_7 then
					arg_283_1.talkMaxDuration = var_286_7

					if var_286_7 + var_286_0 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_7 + var_286_0
					end
				end

				arg_283_1.text_.text = var_286_4
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191069", "story_v_out_114191.awb") ~= 0 then
					local var_286_8 = manager.audio:GetVoiceLength("story_v_out_114191", "114191069", "story_v_out_114191.awb") / 1000

					if var_286_8 + var_286_0 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_8 + var_286_0
					end

					if var_286_3.prefab_name ~= "" and arg_283_1.actors_[var_286_3.prefab_name] ~= nil then
						local var_286_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_283_1.actors_[var_286_3.prefab_name].transform, "story_v_out_114191", "114191069", "story_v_out_114191.awb")

						arg_283_1:RecordAudio("114191069", var_286_9)
						arg_283_1:RecordAudio("114191069", var_286_9)
					else
						arg_283_1:AudioAction("play", "voice", "story_v_out_114191", "114191069", "story_v_out_114191.awb")
					end

					arg_283_1:RecordHistoryTalkVoice("story_v_out_114191", "114191069", "story_v_out_114191.awb")
				end

				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_10 = math.max(var_286_1, arg_283_1.talkMaxDuration)

			if var_286_0 <= arg_283_1.time_ and arg_283_1.time_ < var_286_0 + var_286_10 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_0) / var_286_10

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_0 + var_286_10 and arg_283_1.time_ < var_286_0 + var_286_10 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play114191070 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 114191070
		arg_287_1.duration_ = 3.7

		local var_287_0 = {
			ja = 3.7,
			ko = 2.266,
			zh = 2.5,
			en = 2.466
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
				arg_287_0:Play114191071(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = 0
			local var_290_1 = 0.25

			if var_290_0 < arg_287_1.time_ and arg_287_1.time_ <= var_290_0 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, true)

				local var_290_2 = arg_287_1:FormatText(StoryNameCfg[207].name)

				arg_287_1.leftNameTxt_.text = var_290_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_287_1.leftNameTxt_.transform)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1.leftNameTxt_.text)
				SetActive(arg_287_1.iconTrs_.gameObject, true)
				arg_287_1.iconController_:SetSelectedState("hero")

				arg_287_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_studentm")

				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_3 = arg_287_1:GetWordFromCfg(114191070)
				local var_290_4 = arg_287_1:FormatText(var_290_3.content)

				arg_287_1.text_.text = var_290_4

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_5 = 10
				local var_290_6 = utf8.len(var_290_4)
				local var_290_7 = var_290_5 <= 0 and var_290_1 or var_290_1 * (var_290_6 / var_290_5)

				if var_290_7 > 0 and var_290_1 < var_290_7 then
					arg_287_1.talkMaxDuration = var_290_7

					if var_290_7 + var_290_0 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_7 + var_290_0
					end
				end

				arg_287_1.text_.text = var_290_4
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191070", "story_v_out_114191.awb") ~= 0 then
					local var_290_8 = manager.audio:GetVoiceLength("story_v_out_114191", "114191070", "story_v_out_114191.awb") / 1000

					if var_290_8 + var_290_0 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_8 + var_290_0
					end

					if var_290_3.prefab_name ~= "" and arg_287_1.actors_[var_290_3.prefab_name] ~= nil then
						local var_290_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_287_1.actors_[var_290_3.prefab_name].transform, "story_v_out_114191", "114191070", "story_v_out_114191.awb")

						arg_287_1:RecordAudio("114191070", var_290_9)
						arg_287_1:RecordAudio("114191070", var_290_9)
					else
						arg_287_1:AudioAction("play", "voice", "story_v_out_114191", "114191070", "story_v_out_114191.awb")
					end

					arg_287_1:RecordHistoryTalkVoice("story_v_out_114191", "114191070", "story_v_out_114191.awb")
				end

				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_10 = math.max(var_290_1, arg_287_1.talkMaxDuration)

			if var_290_0 <= arg_287_1.time_ and arg_287_1.time_ < var_290_0 + var_290_10 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_0) / var_290_10

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_0 + var_290_10 and arg_287_1.time_ < var_290_0 + var_290_10 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play114191071 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 114191071
		arg_291_1.duration_ = 5

		SetActive(arg_291_1.tipsGo_, false)

		function arg_291_1.onSingleLineFinish_()
			arg_291_1.onSingleLineUpdate_ = nil
			arg_291_1.onSingleLineFinish_ = nil
			arg_291_1.state_ = "waiting"
		end

		function arg_291_1.playNext_(arg_293_0)
			if arg_293_0 == 1 then
				arg_291_0:Play114191072(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = 0
			local var_294_1 = 0.35

			if var_294_0 < arg_291_1.time_ and arg_291_1.time_ <= var_294_0 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, true)

				local var_294_2 = arg_291_1:FormatText(StoryNameCfg[7].name)

				arg_291_1.leftNameTxt_.text = var_294_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_291_1.leftNameTxt_.transform)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1.leftNameTxt_.text)
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_3 = arg_291_1:GetWordFromCfg(114191071)
				local var_294_4 = arg_291_1:FormatText(var_294_3.content)

				arg_291_1.text_.text = var_294_4

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_5 = 14
				local var_294_6 = utf8.len(var_294_4)
				local var_294_7 = var_294_5 <= 0 and var_294_1 or var_294_1 * (var_294_6 / var_294_5)

				if var_294_7 > 0 and var_294_1 < var_294_7 then
					arg_291_1.talkMaxDuration = var_294_7

					if var_294_7 + var_294_0 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_7 + var_294_0
					end
				end

				arg_291_1.text_.text = var_294_4
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)
				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_8 = math.max(var_294_1, arg_291_1.talkMaxDuration)

			if var_294_0 <= arg_291_1.time_ and arg_291_1.time_ < var_294_0 + var_294_8 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_0) / var_294_8

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_0 + var_294_8 and arg_291_1.time_ < var_294_0 + var_294_8 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play114191072 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 114191072
		arg_295_1.duration_ = 5

		SetActive(arg_295_1.tipsGo_, false)

		function arg_295_1.onSingleLineFinish_()
			arg_295_1.onSingleLineUpdate_ = nil
			arg_295_1.onSingleLineFinish_ = nil
			arg_295_1.state_ = "waiting"
		end

		function arg_295_1.playNext_(arg_297_0)
			if arg_297_0 == 1 then
				arg_295_0:Play114191073(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = 0
			local var_298_1 = 1.1

			if var_298_0 < arg_295_1.time_ and arg_295_1.time_ <= var_298_0 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, false)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_2 = arg_295_1:GetWordFromCfg(114191072)
				local var_298_3 = arg_295_1:FormatText(var_298_2.content)

				arg_295_1.text_.text = var_298_3

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_4 = 44
				local var_298_5 = utf8.len(var_298_3)
				local var_298_6 = var_298_4 <= 0 and var_298_1 or var_298_1 * (var_298_5 / var_298_4)

				if var_298_6 > 0 and var_298_1 < var_298_6 then
					arg_295_1.talkMaxDuration = var_298_6

					if var_298_6 + var_298_0 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_6 + var_298_0
					end
				end

				arg_295_1.text_.text = var_298_3
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)
				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_7 = math.max(var_298_1, arg_295_1.talkMaxDuration)

			if var_298_0 <= arg_295_1.time_ and arg_295_1.time_ < var_298_0 + var_298_7 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_0) / var_298_7

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_0 + var_298_7 and arg_295_1.time_ < var_298_0 + var_298_7 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play114191073 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 114191073
		arg_299_1.duration_ = 5.3

		local var_299_0 = {
			ja = 5.3,
			ko = 3.333,
			zh = 3.766,
			en = 4.7
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
				arg_299_0:Play114191074(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = 0
			local var_302_1 = 0.35

			if var_302_0 < arg_299_1.time_ and arg_299_1.time_ <= var_302_0 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_2 = arg_299_1:FormatText(StoryNameCfg[207].name)

				arg_299_1.leftNameTxt_.text = var_302_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, true)
				arg_299_1.iconController_:SetSelectedState("hero")

				arg_299_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_studentm")

				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_3 = arg_299_1:GetWordFromCfg(114191073)
				local var_302_4 = arg_299_1:FormatText(var_302_3.content)

				arg_299_1.text_.text = var_302_4

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_5 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191073", "story_v_out_114191.awb") ~= 0 then
					local var_302_8 = manager.audio:GetVoiceLength("story_v_out_114191", "114191073", "story_v_out_114191.awb") / 1000

					if var_302_8 + var_302_0 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_8 + var_302_0
					end

					if var_302_3.prefab_name ~= "" and arg_299_1.actors_[var_302_3.prefab_name] ~= nil then
						local var_302_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_299_1.actors_[var_302_3.prefab_name].transform, "story_v_out_114191", "114191073", "story_v_out_114191.awb")

						arg_299_1:RecordAudio("114191073", var_302_9)
						arg_299_1:RecordAudio("114191073", var_302_9)
					else
						arg_299_1:AudioAction("play", "voice", "story_v_out_114191", "114191073", "story_v_out_114191.awb")
					end

					arg_299_1:RecordHistoryTalkVoice("story_v_out_114191", "114191073", "story_v_out_114191.awb")
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
	Play114191074 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 114191074
		arg_303_1.duration_ = 11.233

		local var_303_0 = {
			ja = 11.233,
			ko = 6.866,
			zh = 7.866,
			en = 6.2
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
				arg_303_0:Play114191075(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = 0
			local var_306_1 = 0.825

			if var_306_0 < arg_303_1.time_ and arg_303_1.time_ <= var_306_0 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, true)

				local var_306_2 = arg_303_1:FormatText(StoryNameCfg[207].name)

				arg_303_1.leftNameTxt_.text = var_306_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_303_1.leftNameTxt_.transform)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1.leftNameTxt_.text)
				SetActive(arg_303_1.iconTrs_.gameObject, true)
				arg_303_1.iconController_:SetSelectedState("hero")

				arg_303_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_studentm")

				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_3 = arg_303_1:GetWordFromCfg(114191074)
				local var_306_4 = arg_303_1:FormatText(var_306_3.content)

				arg_303_1.text_.text = var_306_4

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_5 = 33
				local var_306_6 = utf8.len(var_306_4)
				local var_306_7 = var_306_5 <= 0 and var_306_1 or var_306_1 * (var_306_6 / var_306_5)

				if var_306_7 > 0 and var_306_1 < var_306_7 then
					arg_303_1.talkMaxDuration = var_306_7

					if var_306_7 + var_306_0 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_7 + var_306_0
					end
				end

				arg_303_1.text_.text = var_306_4
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191074", "story_v_out_114191.awb") ~= 0 then
					local var_306_8 = manager.audio:GetVoiceLength("story_v_out_114191", "114191074", "story_v_out_114191.awb") / 1000

					if var_306_8 + var_306_0 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_8 + var_306_0
					end

					if var_306_3.prefab_name ~= "" and arg_303_1.actors_[var_306_3.prefab_name] ~= nil then
						local var_306_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_303_1.actors_[var_306_3.prefab_name].transform, "story_v_out_114191", "114191074", "story_v_out_114191.awb")

						arg_303_1:RecordAudio("114191074", var_306_9)
						arg_303_1:RecordAudio("114191074", var_306_9)
					else
						arg_303_1:AudioAction("play", "voice", "story_v_out_114191", "114191074", "story_v_out_114191.awb")
					end

					arg_303_1:RecordHistoryTalkVoice("story_v_out_114191", "114191074", "story_v_out_114191.awb")
				end

				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_10 = math.max(var_306_1, arg_303_1.talkMaxDuration)

			if var_306_0 <= arg_303_1.time_ and arg_303_1.time_ < var_306_0 + var_306_10 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_0) / var_306_10

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_0 + var_306_10 and arg_303_1.time_ < var_306_0 + var_306_10 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play114191075 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 114191075
		arg_307_1.duration_ = 4.466

		local var_307_0 = {
			ja = 4.466,
			ko = 2.066,
			zh = 1.8,
			en = 2
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
				arg_307_0:Play114191076(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = 0
			local var_310_1 = 0.175

			if var_310_0 < arg_307_1.time_ and arg_307_1.time_ <= var_310_0 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, true)

				local var_310_2 = arg_307_1:FormatText(StoryNameCfg[207].name)

				arg_307_1.leftNameTxt_.text = var_310_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_307_1.leftNameTxt_.transform)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1.leftNameTxt_.text)
				SetActive(arg_307_1.iconTrs_.gameObject, true)
				arg_307_1.iconController_:SetSelectedState("hero")

				arg_307_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_studentm")

				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_3 = arg_307_1:GetWordFromCfg(114191075)
				local var_310_4 = arg_307_1:FormatText(var_310_3.content)

				arg_307_1.text_.text = var_310_4

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_5 = 7
				local var_310_6 = utf8.len(var_310_4)
				local var_310_7 = var_310_5 <= 0 and var_310_1 or var_310_1 * (var_310_6 / var_310_5)

				if var_310_7 > 0 and var_310_1 < var_310_7 then
					arg_307_1.talkMaxDuration = var_310_7

					if var_310_7 + var_310_0 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_7 + var_310_0
					end
				end

				arg_307_1.text_.text = var_310_4
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191075", "story_v_out_114191.awb") ~= 0 then
					local var_310_8 = manager.audio:GetVoiceLength("story_v_out_114191", "114191075", "story_v_out_114191.awb") / 1000

					if var_310_8 + var_310_0 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_8 + var_310_0
					end

					if var_310_3.prefab_name ~= "" and arg_307_1.actors_[var_310_3.prefab_name] ~= nil then
						local var_310_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_307_1.actors_[var_310_3.prefab_name].transform, "story_v_out_114191", "114191075", "story_v_out_114191.awb")

						arg_307_1:RecordAudio("114191075", var_310_9)
						arg_307_1:RecordAudio("114191075", var_310_9)
					else
						arg_307_1:AudioAction("play", "voice", "story_v_out_114191", "114191075", "story_v_out_114191.awb")
					end

					arg_307_1:RecordHistoryTalkVoice("story_v_out_114191", "114191075", "story_v_out_114191.awb")
				end

				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_10 = math.max(var_310_1, arg_307_1.talkMaxDuration)

			if var_310_0 <= arg_307_1.time_ and arg_307_1.time_ < var_310_0 + var_310_10 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_0) / var_310_10

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_0 + var_310_10 and arg_307_1.time_ < var_310_0 + var_310_10 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play114191076 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 114191076
		arg_311_1.duration_ = 5

		SetActive(arg_311_1.tipsGo_, false)

		function arg_311_1.onSingleLineFinish_()
			arg_311_1.onSingleLineUpdate_ = nil
			arg_311_1.onSingleLineFinish_ = nil
			arg_311_1.state_ = "waiting"
		end

		function arg_311_1.playNext_(arg_313_0)
			if arg_313_0 == 1 then
				arg_311_0:Play114191077(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = 0
			local var_314_1 = 0.75

			if var_314_0 < arg_311_1.time_ and arg_311_1.time_ <= var_314_0 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, false)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_2 = arg_311_1:GetWordFromCfg(114191076)
				local var_314_3 = arg_311_1:FormatText(var_314_2.content)

				arg_311_1.text_.text = var_314_3

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_4 = 30
				local var_314_5 = utf8.len(var_314_3)
				local var_314_6 = var_314_4 <= 0 and var_314_1 or var_314_1 * (var_314_5 / var_314_4)

				if var_314_6 > 0 and var_314_1 < var_314_6 then
					arg_311_1.talkMaxDuration = var_314_6

					if var_314_6 + var_314_0 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_6 + var_314_0
					end
				end

				arg_311_1.text_.text = var_314_3
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)
				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_7 = math.max(var_314_1, arg_311_1.talkMaxDuration)

			if var_314_0 <= arg_311_1.time_ and arg_311_1.time_ < var_314_0 + var_314_7 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_0) / var_314_7

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_0 + var_314_7 and arg_311_1.time_ < var_314_0 + var_314_7 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play114191077 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 114191077
		arg_315_1.duration_ = 11.1

		local var_315_0 = {
			ja = 11.1,
			ko = 10.3,
			zh = 10.9,
			en = 10.7
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
				arg_315_0:Play114191078(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = 0
			local var_318_1 = 1.075

			if var_318_0 < arg_315_1.time_ and arg_315_1.time_ <= var_318_0 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, true)

				local var_318_2 = arg_315_1:FormatText(StoryNameCfg[207].name)

				arg_315_1.leftNameTxt_.text = var_318_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_315_1.leftNameTxt_.transform)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1.leftNameTxt_.text)
				SetActive(arg_315_1.iconTrs_.gameObject, true)
				arg_315_1.iconController_:SetSelectedState("hero")

				arg_315_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_studentm")

				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_3 = arg_315_1:GetWordFromCfg(114191077)
				local var_318_4 = arg_315_1:FormatText(var_318_3.content)

				arg_315_1.text_.text = var_318_4

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_5 = 43
				local var_318_6 = utf8.len(var_318_4)
				local var_318_7 = var_318_5 <= 0 and var_318_1 or var_318_1 * (var_318_6 / var_318_5)

				if var_318_7 > 0 and var_318_1 < var_318_7 then
					arg_315_1.talkMaxDuration = var_318_7

					if var_318_7 + var_318_0 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_7 + var_318_0
					end
				end

				arg_315_1.text_.text = var_318_4
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191077", "story_v_out_114191.awb") ~= 0 then
					local var_318_8 = manager.audio:GetVoiceLength("story_v_out_114191", "114191077", "story_v_out_114191.awb") / 1000

					if var_318_8 + var_318_0 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_8 + var_318_0
					end

					if var_318_3.prefab_name ~= "" and arg_315_1.actors_[var_318_3.prefab_name] ~= nil then
						local var_318_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_315_1.actors_[var_318_3.prefab_name].transform, "story_v_out_114191", "114191077", "story_v_out_114191.awb")

						arg_315_1:RecordAudio("114191077", var_318_9)
						arg_315_1:RecordAudio("114191077", var_318_9)
					else
						arg_315_1:AudioAction("play", "voice", "story_v_out_114191", "114191077", "story_v_out_114191.awb")
					end

					arg_315_1:RecordHistoryTalkVoice("story_v_out_114191", "114191077", "story_v_out_114191.awb")
				end

				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_10 = math.max(var_318_1, arg_315_1.talkMaxDuration)

			if var_318_0 <= arg_315_1.time_ and arg_315_1.time_ < var_318_0 + var_318_10 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_0) / var_318_10

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_0 + var_318_10 and arg_315_1.time_ < var_318_0 + var_318_10 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play114191078 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 114191078
		arg_319_1.duration_ = 5

		SetActive(arg_319_1.tipsGo_, false)

		function arg_319_1.onSingleLineFinish_()
			arg_319_1.onSingleLineUpdate_ = nil
			arg_319_1.onSingleLineFinish_ = nil
			arg_319_1.state_ = "waiting"
		end

		function arg_319_1.playNext_(arg_321_0)
			if arg_321_0 == 1 then
				arg_319_0:Play114191079(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = 0
			local var_322_1 = 1.275

			if var_322_0 < arg_319_1.time_ and arg_319_1.time_ <= var_322_0 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0
				arg_319_1.dialogCg_.alpha = 1

				arg_319_1.dialog_:SetActive(true)
				SetActive(arg_319_1.leftNameGo_, false)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_2 = arg_319_1:GetWordFromCfg(114191078)
				local var_322_3 = arg_319_1:FormatText(var_322_2.content)

				arg_319_1.text_.text = var_322_3

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_4 = 51
				local var_322_5 = utf8.len(var_322_3)
				local var_322_6 = var_322_4 <= 0 and var_322_1 or var_322_1 * (var_322_5 / var_322_4)

				if var_322_6 > 0 and var_322_1 < var_322_6 then
					arg_319_1.talkMaxDuration = var_322_6

					if var_322_6 + var_322_0 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_6 + var_322_0
					end
				end

				arg_319_1.text_.text = var_322_3
				arg_319_1.typewritter.percent = 0

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(false)
				arg_319_1:RecordContent(arg_319_1.text_.text)
			end

			local var_322_7 = math.max(var_322_1, arg_319_1.talkMaxDuration)

			if var_322_0 <= arg_319_1.time_ and arg_319_1.time_ < var_322_0 + var_322_7 then
				arg_319_1.typewritter.percent = (arg_319_1.time_ - var_322_0) / var_322_7

				arg_319_1.typewritter:SetDirty()
			end

			if arg_319_1.time_ >= var_322_0 + var_322_7 and arg_319_1.time_ < var_322_0 + var_322_7 + arg_322_0 then
				arg_319_1.typewritter.percent = 1

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(true)
			end
		end
	end,
	Play114191079 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 114191079
		arg_323_1.duration_ = 5

		SetActive(arg_323_1.tipsGo_, false)

		function arg_323_1.onSingleLineFinish_()
			arg_323_1.onSingleLineUpdate_ = nil
			arg_323_1.onSingleLineFinish_ = nil
			arg_323_1.state_ = "waiting"
		end

		function arg_323_1.playNext_(arg_325_0)
			if arg_325_0 == 1 then
				arg_323_0:Play114191080(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = 0
			local var_326_1 = 1.85

			if var_326_0 < arg_323_1.time_ and arg_323_1.time_ <= var_326_0 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0
				arg_323_1.dialogCg_.alpha = 1

				arg_323_1.dialog_:SetActive(true)
				SetActive(arg_323_1.leftNameGo_, false)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_323_1.iconTrs_.gameObject, false)
				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_2 = arg_323_1:GetWordFromCfg(114191079)
				local var_326_3 = arg_323_1:FormatText(var_326_2.content)

				arg_323_1.text_.text = var_326_3

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_4 = 74
				local var_326_5 = utf8.len(var_326_3)
				local var_326_6 = var_326_4 <= 0 and var_326_1 or var_326_1 * (var_326_5 / var_326_4)

				if var_326_6 > 0 and var_326_1 < var_326_6 then
					arg_323_1.talkMaxDuration = var_326_6

					if var_326_6 + var_326_0 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_6 + var_326_0
					end
				end

				arg_323_1.text_.text = var_326_3
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)
				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_7 = math.max(var_326_1, arg_323_1.talkMaxDuration)

			if var_326_0 <= arg_323_1.time_ and arg_323_1.time_ < var_326_0 + var_326_7 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_0) / var_326_7

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_0 + var_326_7 and arg_323_1.time_ < var_326_0 + var_326_7 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	Play114191080 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 114191080
		arg_327_1.duration_ = 5

		SetActive(arg_327_1.tipsGo_, false)

		function arg_327_1.onSingleLineFinish_()
			arg_327_1.onSingleLineUpdate_ = nil
			arg_327_1.onSingleLineFinish_ = nil
			arg_327_1.state_ = "waiting"
		end

		function arg_327_1.playNext_(arg_329_0)
			if arg_329_0 == 1 then
				arg_327_0:Play114191081(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = 0
			local var_330_1 = 0.875

			if var_330_0 < arg_327_1.time_ and arg_327_1.time_ <= var_330_0 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, false)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_2 = arg_327_1:GetWordFromCfg(114191080)
				local var_330_3 = arg_327_1:FormatText(var_330_2.content)

				arg_327_1.text_.text = var_330_3

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_4 = 27
				local var_330_5 = utf8.len(var_330_3)
				local var_330_6 = var_330_4 <= 0 and var_330_1 or var_330_1 * (var_330_5 / var_330_4)

				if var_330_6 > 0 and var_330_1 < var_330_6 then
					arg_327_1.talkMaxDuration = var_330_6

					if var_330_6 + var_330_0 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_6 + var_330_0
					end
				end

				arg_327_1.text_.text = var_330_3
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)
				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_7 = math.max(var_330_1, arg_327_1.talkMaxDuration)

			if var_330_0 <= arg_327_1.time_ and arg_327_1.time_ < var_330_0 + var_330_7 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_0) / var_330_7

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_0 + var_330_7 and arg_327_1.time_ < var_330_0 + var_330_7 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play114191081 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 114191081
		arg_331_1.duration_ = 8.033

		local var_331_0 = {
			ja = 8.033,
			ko = 7.366,
			zh = 6.233,
			en = 6.633
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
				arg_331_0:Play114191082(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = arg_331_1.actors_["1184ui_story"].transform
			local var_334_1 = 0

			if var_334_1 < arg_331_1.time_ and arg_331_1.time_ <= var_334_1 + arg_334_0 then
				arg_331_1.var_.moveOldPos1184ui_story = var_334_0.localPosition
			end

			local var_334_2 = 0.001

			if var_334_1 <= arg_331_1.time_ and arg_331_1.time_ < var_334_1 + var_334_2 then
				local var_334_3 = (arg_331_1.time_ - var_334_1) / var_334_2
				local var_334_4 = Vector3.New(0, -0.97, -6)

				var_334_0.localPosition = Vector3.Lerp(arg_331_1.var_.moveOldPos1184ui_story, var_334_4, var_334_3)

				local var_334_5 = manager.ui.mainCamera.transform.position - var_334_0.position

				var_334_0.forward = Vector3.New(var_334_5.x, var_334_5.y, var_334_5.z)

				local var_334_6 = var_334_0.localEulerAngles

				var_334_6.z = 0
				var_334_6.x = 0
				var_334_0.localEulerAngles = var_334_6
			end

			if arg_331_1.time_ >= var_334_1 + var_334_2 and arg_331_1.time_ < var_334_1 + var_334_2 + arg_334_0 then
				var_334_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_334_7 = manager.ui.mainCamera.transform.position - var_334_0.position

				var_334_0.forward = Vector3.New(var_334_7.x, var_334_7.y, var_334_7.z)

				local var_334_8 = var_334_0.localEulerAngles

				var_334_8.z = 0
				var_334_8.x = 0
				var_334_0.localEulerAngles = var_334_8
			end

			local var_334_9 = 0

			if var_334_9 < arg_331_1.time_ and arg_331_1.time_ <= var_334_9 + arg_334_0 then
				arg_331_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action6_1")
			end

			local var_334_10 = 0

			if var_334_10 < arg_331_1.time_ and arg_331_1.time_ <= var_334_10 + arg_334_0 then
				arg_331_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_334_11 = arg_331_1.actors_["1184ui_story"]
			local var_334_12 = 0

			if var_334_12 < arg_331_1.time_ and arg_331_1.time_ <= var_334_12 + arg_334_0 and arg_331_1.var_.characterEffect1184ui_story == nil then
				arg_331_1.var_.characterEffect1184ui_story = var_334_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_334_13 = 0.2

			if var_334_12 <= arg_331_1.time_ and arg_331_1.time_ < var_334_12 + var_334_13 then
				local var_334_14 = (arg_331_1.time_ - var_334_12) / var_334_13

				if arg_331_1.var_.characterEffect1184ui_story then
					arg_331_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_331_1.time_ >= var_334_12 + var_334_13 and arg_331_1.time_ < var_334_12 + var_334_13 + arg_334_0 and arg_331_1.var_.characterEffect1184ui_story then
				arg_331_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_334_15 = 0
			local var_334_16 = 0.775

			if var_334_15 < arg_331_1.time_ and arg_331_1.time_ <= var_334_15 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_17 = arg_331_1:FormatText(StoryNameCfg[6].name)

				arg_331_1.leftNameTxt_.text = var_334_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_18 = arg_331_1:GetWordFromCfg(114191081)
				local var_334_19 = arg_331_1:FormatText(var_334_18.content)

				arg_331_1.text_.text = var_334_19

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_20 = 31
				local var_334_21 = utf8.len(var_334_19)
				local var_334_22 = var_334_20 <= 0 and var_334_16 or var_334_16 * (var_334_21 / var_334_20)

				if var_334_22 > 0 and var_334_16 < var_334_22 then
					arg_331_1.talkMaxDuration = var_334_22

					if var_334_22 + var_334_15 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_22 + var_334_15
					end
				end

				arg_331_1.text_.text = var_334_19
				arg_331_1.typewritter.percent = 0

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191081", "story_v_out_114191.awb") ~= 0 then
					local var_334_23 = manager.audio:GetVoiceLength("story_v_out_114191", "114191081", "story_v_out_114191.awb") / 1000

					if var_334_23 + var_334_15 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_23 + var_334_15
					end

					if var_334_18.prefab_name ~= "" and arg_331_1.actors_[var_334_18.prefab_name] ~= nil then
						local var_334_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_331_1.actors_[var_334_18.prefab_name].transform, "story_v_out_114191", "114191081", "story_v_out_114191.awb")

						arg_331_1:RecordAudio("114191081", var_334_24)
						arg_331_1:RecordAudio("114191081", var_334_24)
					else
						arg_331_1:AudioAction("play", "voice", "story_v_out_114191", "114191081", "story_v_out_114191.awb")
					end

					arg_331_1:RecordHistoryTalkVoice("story_v_out_114191", "114191081", "story_v_out_114191.awb")
				end

				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_25 = math.max(var_334_16, arg_331_1.talkMaxDuration)

			if var_334_15 <= arg_331_1.time_ and arg_331_1.time_ < var_334_15 + var_334_25 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_15) / var_334_25

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_15 + var_334_25 and arg_331_1.time_ < var_334_15 + var_334_25 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play114191082 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 114191082
		arg_335_1.duration_ = 5

		SetActive(arg_335_1.tipsGo_, false)

		function arg_335_1.onSingleLineFinish_()
			arg_335_1.onSingleLineUpdate_ = nil
			arg_335_1.onSingleLineFinish_ = nil
			arg_335_1.state_ = "waiting"
		end

		function arg_335_1.playNext_(arg_337_0)
			if arg_337_0 == 1 then
				arg_335_0:Play114191083(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = arg_335_1.actors_["1184ui_story"]
			local var_338_1 = 0

			if var_338_1 < arg_335_1.time_ and arg_335_1.time_ <= var_338_1 + arg_338_0 and arg_335_1.var_.characterEffect1184ui_story == nil then
				arg_335_1.var_.characterEffect1184ui_story = var_338_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_338_2 = 0.2

			if var_338_1 <= arg_335_1.time_ and arg_335_1.time_ < var_338_1 + var_338_2 then
				local var_338_3 = (arg_335_1.time_ - var_338_1) / var_338_2

				if arg_335_1.var_.characterEffect1184ui_story then
					local var_338_4 = Mathf.Lerp(0, 0.5, var_338_3)

					arg_335_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_335_1.var_.characterEffect1184ui_story.fillRatio = var_338_4
				end
			end

			if arg_335_1.time_ >= var_338_1 + var_338_2 and arg_335_1.time_ < var_338_1 + var_338_2 + arg_338_0 and arg_335_1.var_.characterEffect1184ui_story then
				local var_338_5 = 0.5

				arg_335_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_335_1.var_.characterEffect1184ui_story.fillRatio = var_338_5
			end

			local var_338_6 = 0
			local var_338_7 = 0.6

			if var_338_6 < arg_335_1.time_ and arg_335_1.time_ <= var_338_6 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0
				arg_335_1.dialogCg_.alpha = 1

				arg_335_1.dialog_:SetActive(true)
				SetActive(arg_335_1.leftNameGo_, true)

				local var_338_8 = arg_335_1:FormatText(StoryNameCfg[7].name)

				arg_335_1.leftNameTxt_.text = var_338_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_335_1.leftNameTxt_.transform)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1.leftNameTxt_.text)
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_9 = arg_335_1:GetWordFromCfg(114191082)
				local var_338_10 = arg_335_1:FormatText(var_338_9.content)

				arg_335_1.text_.text = var_338_10

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_11 = 24
				local var_338_12 = utf8.len(var_338_10)
				local var_338_13 = var_338_11 <= 0 and var_338_7 or var_338_7 * (var_338_12 / var_338_11)

				if var_338_13 > 0 and var_338_7 < var_338_13 then
					arg_335_1.talkMaxDuration = var_338_13

					if var_338_13 + var_338_6 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_13 + var_338_6
					end
				end

				arg_335_1.text_.text = var_338_10
				arg_335_1.typewritter.percent = 0

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(false)
				arg_335_1:RecordContent(arg_335_1.text_.text)
			end

			local var_338_14 = math.max(var_338_7, arg_335_1.talkMaxDuration)

			if var_338_6 <= arg_335_1.time_ and arg_335_1.time_ < var_338_6 + var_338_14 then
				arg_335_1.typewritter.percent = (arg_335_1.time_ - var_338_6) / var_338_14

				arg_335_1.typewritter:SetDirty()
			end

			if arg_335_1.time_ >= var_338_6 + var_338_14 and arg_335_1.time_ < var_338_6 + var_338_14 + arg_338_0 then
				arg_335_1.typewritter.percent = 1

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(true)
			end
		end
	end,
	Play114191083 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 114191083
		arg_339_1.duration_ = 5

		SetActive(arg_339_1.tipsGo_, false)

		function arg_339_1.onSingleLineFinish_()
			arg_339_1.onSingleLineUpdate_ = nil
			arg_339_1.onSingleLineFinish_ = nil
			arg_339_1.state_ = "waiting"
		end

		function arg_339_1.playNext_(arg_341_0)
			if arg_341_0 == 1 then
				arg_339_0:Play114191084(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = 0

			if var_342_0 < arg_339_1.time_ and arg_339_1.time_ <= var_342_0 + arg_342_0 then
				arg_339_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action6_2")
			end

			local var_342_1 = 0

			if var_342_1 < arg_339_1.time_ and arg_339_1.time_ <= var_342_1 + arg_342_0 then
				arg_339_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_342_2 = 0
			local var_342_3 = 1.15

			if var_342_2 < arg_339_1.time_ and arg_339_1.time_ <= var_342_2 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, true)

				local var_342_4 = arg_339_1:FormatText(StoryNameCfg[7].name)

				arg_339_1.leftNameTxt_.text = var_342_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_339_1.leftNameTxt_.transform)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1.leftNameTxt_.text)
				SetActive(arg_339_1.iconTrs_.gameObject, false)
				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_5 = arg_339_1:GetWordFromCfg(114191083)
				local var_342_6 = arg_339_1:FormatText(var_342_5.content)

				arg_339_1.text_.text = var_342_6

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_7 = 46
				local var_342_8 = utf8.len(var_342_6)
				local var_342_9 = var_342_7 <= 0 and var_342_3 or var_342_3 * (var_342_8 / var_342_7)

				if var_342_9 > 0 and var_342_3 < var_342_9 then
					arg_339_1.talkMaxDuration = var_342_9

					if var_342_9 + var_342_2 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_9 + var_342_2
					end
				end

				arg_339_1.text_.text = var_342_6
				arg_339_1.typewritter.percent = 0

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(false)
				arg_339_1:RecordContent(arg_339_1.text_.text)
			end

			local var_342_10 = math.max(var_342_3, arg_339_1.talkMaxDuration)

			if var_342_2 <= arg_339_1.time_ and arg_339_1.time_ < var_342_2 + var_342_10 then
				arg_339_1.typewritter.percent = (arg_339_1.time_ - var_342_2) / var_342_10

				arg_339_1.typewritter:SetDirty()
			end

			if arg_339_1.time_ >= var_342_2 + var_342_10 and arg_339_1.time_ < var_342_2 + var_342_10 + arg_342_0 then
				arg_339_1.typewritter.percent = 1

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(true)
			end
		end
	end,
	Play114191084 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 114191084
		arg_343_1.duration_ = 9.533

		local var_343_0 = {
			ja = 9,
			ko = 7.166,
			zh = 7.333,
			en = 9.533
		}
		local var_343_1 = manager.audio:GetLocalizationFlag()

		if var_343_0[var_343_1] ~= nil then
			arg_343_1.duration_ = var_343_0[var_343_1]
		end

		SetActive(arg_343_1.tipsGo_, false)

		function arg_343_1.onSingleLineFinish_()
			arg_343_1.onSingleLineUpdate_ = nil
			arg_343_1.onSingleLineFinish_ = nil
			arg_343_1.state_ = "waiting"
		end

		function arg_343_1.playNext_(arg_345_0)
			if arg_345_0 == 1 then
				arg_343_0:Play114191085(arg_343_1)
			end
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = 0

			if var_346_0 < arg_343_1.time_ and arg_343_1.time_ <= var_346_0 + arg_346_0 then
				arg_343_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action8_1")
			end

			local var_346_1 = 0

			if var_346_1 < arg_343_1.time_ and arg_343_1.time_ <= var_346_1 + arg_346_0 then
				arg_343_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_346_2 = arg_343_1.actors_["1184ui_story"]
			local var_346_3 = 0

			if var_346_3 < arg_343_1.time_ and arg_343_1.time_ <= var_346_3 + arg_346_0 and arg_343_1.var_.characterEffect1184ui_story == nil then
				arg_343_1.var_.characterEffect1184ui_story = var_346_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_346_4 = 0.2

			if var_346_3 <= arg_343_1.time_ and arg_343_1.time_ < var_346_3 + var_346_4 then
				local var_346_5 = (arg_343_1.time_ - var_346_3) / var_346_4

				if arg_343_1.var_.characterEffect1184ui_story then
					arg_343_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_343_1.time_ >= var_346_3 + var_346_4 and arg_343_1.time_ < var_346_3 + var_346_4 + arg_346_0 and arg_343_1.var_.characterEffect1184ui_story then
				arg_343_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_346_6 = 0
			local var_346_7 = 0.725

			if var_346_6 < arg_343_1.time_ and arg_343_1.time_ <= var_346_6 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0
				arg_343_1.dialogCg_.alpha = 1

				arg_343_1.dialog_:SetActive(true)
				SetActive(arg_343_1.leftNameGo_, true)

				local var_346_8 = arg_343_1:FormatText(StoryNameCfg[6].name)

				arg_343_1.leftNameTxt_.text = var_346_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_343_1.leftNameTxt_.transform)

				arg_343_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_343_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_343_1:RecordName(arg_343_1.leftNameTxt_.text)
				SetActive(arg_343_1.iconTrs_.gameObject, false)
				arg_343_1.callingController_:SetSelectedState("normal")

				local var_346_9 = arg_343_1:GetWordFromCfg(114191084)
				local var_346_10 = arg_343_1:FormatText(var_346_9.content)

				arg_343_1.text_.text = var_346_10

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_11 = 29
				local var_346_12 = utf8.len(var_346_10)
				local var_346_13 = var_346_11 <= 0 and var_346_7 or var_346_7 * (var_346_12 / var_346_11)

				if var_346_13 > 0 and var_346_7 < var_346_13 then
					arg_343_1.talkMaxDuration = var_346_13

					if var_346_13 + var_346_6 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_13 + var_346_6
					end
				end

				arg_343_1.text_.text = var_346_10
				arg_343_1.typewritter.percent = 0

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191084", "story_v_out_114191.awb") ~= 0 then
					local var_346_14 = manager.audio:GetVoiceLength("story_v_out_114191", "114191084", "story_v_out_114191.awb") / 1000

					if var_346_14 + var_346_6 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_14 + var_346_6
					end

					if var_346_9.prefab_name ~= "" and arg_343_1.actors_[var_346_9.prefab_name] ~= nil then
						local var_346_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_343_1.actors_[var_346_9.prefab_name].transform, "story_v_out_114191", "114191084", "story_v_out_114191.awb")

						arg_343_1:RecordAudio("114191084", var_346_15)
						arg_343_1:RecordAudio("114191084", var_346_15)
					else
						arg_343_1:AudioAction("play", "voice", "story_v_out_114191", "114191084", "story_v_out_114191.awb")
					end

					arg_343_1:RecordHistoryTalkVoice("story_v_out_114191", "114191084", "story_v_out_114191.awb")
				end

				arg_343_1:RecordContent(arg_343_1.text_.text)
			end

			local var_346_16 = math.max(var_346_7, arg_343_1.talkMaxDuration)

			if var_346_6 <= arg_343_1.time_ and arg_343_1.time_ < var_346_6 + var_346_16 then
				arg_343_1.typewritter.percent = (arg_343_1.time_ - var_346_6) / var_346_16

				arg_343_1.typewritter:SetDirty()
			end

			if arg_343_1.time_ >= var_346_6 + var_346_16 and arg_343_1.time_ < var_346_6 + var_346_16 + arg_346_0 then
				arg_343_1.typewritter.percent = 1

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(true)
			end
		end
	end,
	Play114191085 = function(arg_347_0, arg_347_1)
		arg_347_1.time_ = 0
		arg_347_1.frameCnt_ = 0
		arg_347_1.state_ = "playing"
		arg_347_1.curTalkId_ = 114191085
		arg_347_1.duration_ = 5

		SetActive(arg_347_1.tipsGo_, false)

		function arg_347_1.onSingleLineFinish_()
			arg_347_1.onSingleLineUpdate_ = nil
			arg_347_1.onSingleLineFinish_ = nil
			arg_347_1.state_ = "waiting"
		end

		function arg_347_1.playNext_(arg_349_0)
			if arg_349_0 == 1 then
				arg_347_0:Play114191086(arg_347_1)
			end
		end

		function arg_347_1.onSingleLineUpdate_(arg_350_0)
			local var_350_0 = arg_347_1.actors_["1184ui_story"]
			local var_350_1 = 0

			if var_350_1 < arg_347_1.time_ and arg_347_1.time_ <= var_350_1 + arg_350_0 and arg_347_1.var_.characterEffect1184ui_story == nil then
				arg_347_1.var_.characterEffect1184ui_story = var_350_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_350_2 = 0.2

			if var_350_1 <= arg_347_1.time_ and arg_347_1.time_ < var_350_1 + var_350_2 then
				local var_350_3 = (arg_347_1.time_ - var_350_1) / var_350_2

				if arg_347_1.var_.characterEffect1184ui_story then
					local var_350_4 = Mathf.Lerp(0, 0.5, var_350_3)

					arg_347_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_347_1.var_.characterEffect1184ui_story.fillRatio = var_350_4
				end
			end

			if arg_347_1.time_ >= var_350_1 + var_350_2 and arg_347_1.time_ < var_350_1 + var_350_2 + arg_350_0 and arg_347_1.var_.characterEffect1184ui_story then
				local var_350_5 = 0.5

				arg_347_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_347_1.var_.characterEffect1184ui_story.fillRatio = var_350_5
			end

			local var_350_6 = 0
			local var_350_7 = 0.85

			if var_350_6 < arg_347_1.time_ and arg_347_1.time_ <= var_350_6 + arg_350_0 then
				arg_347_1.talkMaxDuration = 0
				arg_347_1.dialogCg_.alpha = 1

				arg_347_1.dialog_:SetActive(true)
				SetActive(arg_347_1.leftNameGo_, true)

				local var_350_8 = arg_347_1:FormatText(StoryNameCfg[7].name)

				arg_347_1.leftNameTxt_.text = var_350_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_347_1.leftNameTxt_.transform)

				arg_347_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_347_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_347_1:RecordName(arg_347_1.leftNameTxt_.text)
				SetActive(arg_347_1.iconTrs_.gameObject, false)
				arg_347_1.callingController_:SetSelectedState("normal")

				local var_350_9 = arg_347_1:GetWordFromCfg(114191085)
				local var_350_10 = arg_347_1:FormatText(var_350_9.content)

				arg_347_1.text_.text = var_350_10

				LuaForUtil.ClearLinePrefixSymbol(arg_347_1.text_)

				local var_350_11 = 34
				local var_350_12 = utf8.len(var_350_10)
				local var_350_13 = var_350_11 <= 0 and var_350_7 or var_350_7 * (var_350_12 / var_350_11)

				if var_350_13 > 0 and var_350_7 < var_350_13 then
					arg_347_1.talkMaxDuration = var_350_13

					if var_350_13 + var_350_6 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_13 + var_350_6
					end
				end

				arg_347_1.text_.text = var_350_10
				arg_347_1.typewritter.percent = 0

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(false)
				arg_347_1:RecordContent(arg_347_1.text_.text)
			end

			local var_350_14 = math.max(var_350_7, arg_347_1.talkMaxDuration)

			if var_350_6 <= arg_347_1.time_ and arg_347_1.time_ < var_350_6 + var_350_14 then
				arg_347_1.typewritter.percent = (arg_347_1.time_ - var_350_6) / var_350_14

				arg_347_1.typewritter:SetDirty()
			end

			if arg_347_1.time_ >= var_350_6 + var_350_14 and arg_347_1.time_ < var_350_6 + var_350_14 + arg_350_0 then
				arg_347_1.typewritter.percent = 1

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(true)
			end
		end
	end,
	Play114191086 = function(arg_351_0, arg_351_1)
		arg_351_1.time_ = 0
		arg_351_1.frameCnt_ = 0
		arg_351_1.state_ = "playing"
		arg_351_1.curTalkId_ = 114191086
		arg_351_1.duration_ = 7.766

		local var_351_0 = {
			ja = 3.966,
			ko = 6.833,
			zh = 4.5,
			en = 7.766
		}
		local var_351_1 = manager.audio:GetLocalizationFlag()

		if var_351_0[var_351_1] ~= nil then
			arg_351_1.duration_ = var_351_0[var_351_1]
		end

		SetActive(arg_351_1.tipsGo_, false)

		function arg_351_1.onSingleLineFinish_()
			arg_351_1.onSingleLineUpdate_ = nil
			arg_351_1.onSingleLineFinish_ = nil
			arg_351_1.state_ = "waiting"
		end

		function arg_351_1.playNext_(arg_353_0)
			if arg_353_0 == 1 then
				arg_351_0:Play114191087(arg_351_1)
			end
		end

		function arg_351_1.onSingleLineUpdate_(arg_354_0)
			local var_354_0 = 0

			if var_354_0 < arg_351_1.time_ and arg_351_1.time_ <= var_354_0 + arg_354_0 then
				arg_351_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action485")
			end

			local var_354_1 = 0

			if var_354_1 < arg_351_1.time_ and arg_351_1.time_ <= var_354_1 + arg_354_0 then
				arg_351_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_354_2 = arg_351_1.actors_["1184ui_story"]
			local var_354_3 = 0

			if var_354_3 < arg_351_1.time_ and arg_351_1.time_ <= var_354_3 + arg_354_0 and arg_351_1.var_.characterEffect1184ui_story == nil then
				arg_351_1.var_.characterEffect1184ui_story = var_354_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_354_4 = 0.2

			if var_354_3 <= arg_351_1.time_ and arg_351_1.time_ < var_354_3 + var_354_4 then
				local var_354_5 = (arg_351_1.time_ - var_354_3) / var_354_4

				if arg_351_1.var_.characterEffect1184ui_story then
					arg_351_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_351_1.time_ >= var_354_3 + var_354_4 and arg_351_1.time_ < var_354_3 + var_354_4 + arg_354_0 and arg_351_1.var_.characterEffect1184ui_story then
				arg_351_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_354_6 = 0
			local var_354_7 = 0.55

			if var_354_6 < arg_351_1.time_ and arg_351_1.time_ <= var_354_6 + arg_354_0 then
				arg_351_1.talkMaxDuration = 0
				arg_351_1.dialogCg_.alpha = 1

				arg_351_1.dialog_:SetActive(true)
				SetActive(arg_351_1.leftNameGo_, true)

				local var_354_8 = arg_351_1:FormatText(StoryNameCfg[6].name)

				arg_351_1.leftNameTxt_.text = var_354_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_351_1.leftNameTxt_.transform)

				arg_351_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_351_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_351_1:RecordName(arg_351_1.leftNameTxt_.text)
				SetActive(arg_351_1.iconTrs_.gameObject, false)
				arg_351_1.callingController_:SetSelectedState("normal")

				local var_354_9 = arg_351_1:GetWordFromCfg(114191086)
				local var_354_10 = arg_351_1:FormatText(var_354_9.content)

				arg_351_1.text_.text = var_354_10

				LuaForUtil.ClearLinePrefixSymbol(arg_351_1.text_)

				local var_354_11 = 22
				local var_354_12 = utf8.len(var_354_10)
				local var_354_13 = var_354_11 <= 0 and var_354_7 or var_354_7 * (var_354_12 / var_354_11)

				if var_354_13 > 0 and var_354_7 < var_354_13 then
					arg_351_1.talkMaxDuration = var_354_13

					if var_354_13 + var_354_6 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_13 + var_354_6
					end
				end

				arg_351_1.text_.text = var_354_10
				arg_351_1.typewritter.percent = 0

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114191", "114191086", "story_v_out_114191.awb") ~= 0 then
					local var_354_14 = manager.audio:GetVoiceLength("story_v_out_114191", "114191086", "story_v_out_114191.awb") / 1000

					if var_354_14 + var_354_6 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_14 + var_354_6
					end

					if var_354_9.prefab_name ~= "" and arg_351_1.actors_[var_354_9.prefab_name] ~= nil then
						local var_354_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_351_1.actors_[var_354_9.prefab_name].transform, "story_v_out_114191", "114191086", "story_v_out_114191.awb")

						arg_351_1:RecordAudio("114191086", var_354_15)
						arg_351_1:RecordAudio("114191086", var_354_15)
					else
						arg_351_1:AudioAction("play", "voice", "story_v_out_114191", "114191086", "story_v_out_114191.awb")
					end

					arg_351_1:RecordHistoryTalkVoice("story_v_out_114191", "114191086", "story_v_out_114191.awb")
				end

				arg_351_1:RecordContent(arg_351_1.text_.text)
			end

			local var_354_16 = math.max(var_354_7, arg_351_1.talkMaxDuration)

			if var_354_6 <= arg_351_1.time_ and arg_351_1.time_ < var_354_6 + var_354_16 then
				arg_351_1.typewritter.percent = (arg_351_1.time_ - var_354_6) / var_354_16

				arg_351_1.typewritter:SetDirty()
			end

			if arg_351_1.time_ >= var_354_6 + var_354_16 and arg_351_1.time_ < var_354_6 + var_354_16 + arg_354_0 then
				arg_351_1.typewritter.percent = 1

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(true)
			end
		end
	end,
	Play114191087 = function(arg_355_0, arg_355_1)
		arg_355_1.time_ = 0
		arg_355_1.frameCnt_ = 0
		arg_355_1.state_ = "playing"
		arg_355_1.curTalkId_ = 114191087
		arg_355_1.duration_ = 5

		SetActive(arg_355_1.tipsGo_, false)

		function arg_355_1.onSingleLineFinish_()
			arg_355_1.onSingleLineUpdate_ = nil
			arg_355_1.onSingleLineFinish_ = nil
			arg_355_1.state_ = "waiting"
		end

		function arg_355_1.playNext_(arg_357_0)
			if arg_357_0 == 1 then
				arg_355_0:Play114191088(arg_355_1)
			end
		end

		function arg_355_1.onSingleLineUpdate_(arg_358_0)
			local var_358_0 = arg_355_1.actors_["1184ui_story"].transform
			local var_358_1 = 0

			if var_358_1 < arg_355_1.time_ and arg_355_1.time_ <= var_358_1 + arg_358_0 then
				arg_355_1.var_.moveOldPos1184ui_story = var_358_0.localPosition
			end

			local var_358_2 = 0.001

			if var_358_1 <= arg_355_1.time_ and arg_355_1.time_ < var_358_1 + var_358_2 then
				local var_358_3 = (arg_355_1.time_ - var_358_1) / var_358_2
				local var_358_4 = Vector3.New(0, 100, 0)

				var_358_0.localPosition = Vector3.Lerp(arg_355_1.var_.moveOldPos1184ui_story, var_358_4, var_358_3)

				local var_358_5 = manager.ui.mainCamera.transform.position - var_358_0.position

				var_358_0.forward = Vector3.New(var_358_5.x, var_358_5.y, var_358_5.z)

				local var_358_6 = var_358_0.localEulerAngles

				var_358_6.z = 0
				var_358_6.x = 0
				var_358_0.localEulerAngles = var_358_6
			end

			if arg_355_1.time_ >= var_358_1 + var_358_2 and arg_355_1.time_ < var_358_1 + var_358_2 + arg_358_0 then
				var_358_0.localPosition = Vector3.New(0, 100, 0)

				local var_358_7 = manager.ui.mainCamera.transform.position - var_358_0.position

				var_358_0.forward = Vector3.New(var_358_7.x, var_358_7.y, var_358_7.z)

				local var_358_8 = var_358_0.localEulerAngles

				var_358_8.z = 0
				var_358_8.x = 0
				var_358_0.localEulerAngles = var_358_8
			end

			local var_358_9 = 0
			local var_358_10 = 0.575

			if var_358_9 < arg_355_1.time_ and arg_355_1.time_ <= var_358_9 + arg_358_0 then
				arg_355_1.talkMaxDuration = 0
				arg_355_1.dialogCg_.alpha = 1

				arg_355_1.dialog_:SetActive(true)
				SetActive(arg_355_1.leftNameGo_, false)

				arg_355_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_355_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_355_1:RecordName(arg_355_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_355_1.iconTrs_.gameObject, false)
				arg_355_1.callingController_:SetSelectedState("normal")

				local var_358_11 = arg_355_1:GetWordFromCfg(114191087)
				local var_358_12 = arg_355_1:FormatText(var_358_11.content)

				arg_355_1.text_.text = var_358_12

				LuaForUtil.ClearLinePrefixSymbol(arg_355_1.text_)

				local var_358_13 = 23
				local var_358_14 = utf8.len(var_358_12)
				local var_358_15 = var_358_13 <= 0 and var_358_10 or var_358_10 * (var_358_14 / var_358_13)

				if var_358_15 > 0 and var_358_10 < var_358_15 then
					arg_355_1.talkMaxDuration = var_358_15

					if var_358_15 + var_358_9 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_15 + var_358_9
					end
				end

				arg_355_1.text_.text = var_358_12
				arg_355_1.typewritter.percent = 0

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(false)
				arg_355_1:RecordContent(arg_355_1.text_.text)
			end

			local var_358_16 = math.max(var_358_10, arg_355_1.talkMaxDuration)

			if var_358_9 <= arg_355_1.time_ and arg_355_1.time_ < var_358_9 + var_358_16 then
				arg_355_1.typewritter.percent = (arg_355_1.time_ - var_358_9) / var_358_16

				arg_355_1.typewritter:SetDirty()
			end

			if arg_355_1.time_ >= var_358_9 + var_358_16 and arg_355_1.time_ < var_358_9 + var_358_16 + arg_358_0 then
				arg_355_1.typewritter.percent = 1

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(true)
			end
		end
	end,
	Play114191088 = function(arg_359_0, arg_359_1)
		arg_359_1.time_ = 0
		arg_359_1.frameCnt_ = 0
		arg_359_1.state_ = "playing"
		arg_359_1.curTalkId_ = 114191088
		arg_359_1.duration_ = 12.099999999999

		SetActive(arg_359_1.tipsGo_, false)

		function arg_359_1.onSingleLineFinish_()
			arg_359_1.onSingleLineUpdate_ = nil
			arg_359_1.onSingleLineFinish_ = nil
			arg_359_1.state_ = "waiting"
			arg_359_1.auto_ = false
		end

		function arg_359_1.playNext_(arg_361_0)
			arg_359_1.onStoryFinished_()
		end

		function arg_359_1.onSingleLineUpdate_(arg_362_0)
			local var_362_0 = 2

			if var_362_0 < arg_359_1.time_ and arg_359_1.time_ <= var_362_0 + arg_362_0 then
				arg_359_1.fswbg_:SetActive(true)
				arg_359_1.dialog_:SetActive(false)

				arg_359_1.fswtw_.percent = 0

				local var_362_1 = arg_359_1:GetWordFromCfg(114191088)
				local var_362_2 = arg_359_1:FormatText(var_362_1.content)

				arg_359_1.fswt_.text = var_362_2

				LuaForUtil.ClearLinePrefixSymbol(arg_359_1.fswt_)

				arg_359_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_359_1.fswtw_:SetDirty()

				arg_359_1.typewritterCharCountI18N = 0

				SetActive(arg_359_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_359_1:ShowNextGo(false)
			end

			local var_362_3 = 4

			if var_362_3 < arg_359_1.time_ and arg_359_1.time_ <= var_362_3 + arg_362_0 then
				arg_359_1.var_.oldValueTypewriter = arg_359_1.fswtw_.percent

				arg_359_1:ShowNextGo(false)
			end

			local var_362_4 = 84
			local var_362_5 = 5.73333333333333
			local var_362_6 = arg_359_1:GetWordFromCfg(114191088)
			local var_362_7 = arg_359_1:FormatText(var_362_6.content)
			local var_362_8, var_362_9 = arg_359_1:GetPercentByPara(var_362_7, 1)

			if var_362_3 < arg_359_1.time_ and arg_359_1.time_ <= var_362_3 + arg_362_0 then
				arg_359_1.talkMaxDuration = 0

				local var_362_10 = var_362_4 <= 0 and var_362_5 or var_362_5 * ((var_362_9 - arg_359_1.typewritterCharCountI18N) / var_362_4)

				if var_362_10 > 0 and var_362_5 < var_362_10 then
					arg_359_1.talkMaxDuration = var_362_10

					if var_362_10 + var_362_3 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_10 + var_362_3
					end
				end
			end

			local var_362_11 = 5.73333333333333
			local var_362_12 = math.max(var_362_11, arg_359_1.talkMaxDuration)

			if var_362_3 <= arg_359_1.time_ and arg_359_1.time_ < var_362_3 + var_362_12 then
				local var_362_13 = (arg_359_1.time_ - var_362_3) / var_362_12

				arg_359_1.fswtw_.percent = Mathf.Lerp(arg_359_1.var_.oldValueTypewriter, var_362_8, var_362_13)
				arg_359_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_359_1.fswtw_:SetDirty()
			end

			if arg_359_1.time_ >= var_362_3 + var_362_12 and arg_359_1.time_ < var_362_3 + var_362_12 + arg_362_0 then
				arg_359_1.fswtw_.percent = var_362_8

				arg_359_1.fswtw_:SetDirty()
				arg_359_1:ShowNextGo(true)

				arg_359_1.typewritterCharCountI18N = var_362_9
			end

			local var_362_14 = 2

			if var_362_14 < arg_359_1.time_ and arg_359_1.time_ <= var_362_14 + arg_362_0 then
				local var_362_15 = arg_359_1.fswbg_.transform:Find("textbox/adapt/content") or arg_359_1.fswbg_.transform:Find("textbox/content")
				local var_362_16 = var_362_15:GetComponent("Text")
				local var_362_17 = var_362_15:GetComponent("RectTransform")

				var_362_16.alignment = UnityEngine.TextAnchor.MiddleLeft
				var_362_17.offsetMin = Vector2.New(400, 105)
				var_362_17.offsetMax = Vector2.New(-400, -200)
			end

			local var_362_18 = 0

			if var_362_18 < arg_359_1.time_ and arg_359_1.time_ <= var_362_18 + arg_362_0 then
				arg_359_1.mask_.enabled = true
				arg_359_1.mask_.raycastTarget = true

				arg_359_1:SetGaussion(false)
			end

			local var_362_19 = 2

			if var_362_18 <= arg_359_1.time_ and arg_359_1.time_ < var_362_18 + var_362_19 then
				local var_362_20 = (arg_359_1.time_ - var_362_18) / var_362_19
				local var_362_21 = Color.New(0, 0, 0)

				var_362_21.a = Mathf.Lerp(0, 1, var_362_20)
				arg_359_1.mask_.color = var_362_21
			end

			if arg_359_1.time_ >= var_362_18 + var_362_19 and arg_359_1.time_ < var_362_18 + var_362_19 + arg_362_0 then
				local var_362_22 = Color.New(0, 0, 0)

				var_362_22.a = 1
				arg_359_1.mask_.color = var_362_22
			end

			local var_362_23 = 2

			if var_362_23 < arg_359_1.time_ and arg_359_1.time_ <= var_362_23 + arg_362_0 then
				arg_359_1.mask_.enabled = true
				arg_359_1.mask_.raycastTarget = true

				arg_359_1:SetGaussion(false)
			end

			local var_362_24 = 2

			if var_362_23 <= arg_359_1.time_ and arg_359_1.time_ < var_362_23 + var_362_24 then
				local var_362_25 = (arg_359_1.time_ - var_362_23) / var_362_24
				local var_362_26 = Color.New(0, 0, 0)

				var_362_26.a = Mathf.Lerp(1, 0, var_362_25)
				arg_359_1.mask_.color = var_362_26
			end

			if arg_359_1.time_ >= var_362_23 + var_362_24 and arg_359_1.time_ < var_362_23 + var_362_24 + arg_362_0 then
				local var_362_27 = Color.New(0, 0, 0)
				local var_362_28 = 0

				arg_359_1.mask_.enabled = false
				var_362_27.a = var_362_28
				arg_359_1.mask_.color = var_362_27
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST22",
		"Assets/UIResources/UI_AB/TextureConfig/Background/OM0203",
		"Assets/UIResources/UI_AB/TextureConfig/Background/F04",
		"Assets/UIResources/UI_AB/TextureConfig/Background/F02a_1"
	},
	voices = {
		"story_v_out_114191.awb"
	}
}
