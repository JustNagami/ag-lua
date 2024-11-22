return {
	Play116431001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 116431001
		arg_1_1.duration_ = 8.133

		local var_1_0 = {
			zh = 5.933,
			ja = 8.133
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
				arg_1_0:Play116431002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "I02"

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
				local var_4_5 = arg_1_1.bgs_.I02

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
					if iter_4_0 ~= "I02" then
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
			local var_4_23 = 0.666666666666667

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 0.866666666666667
			local var_4_27 = 1.13333333333333

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_story_office", "bgm_story_office", "bgm_story_office.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 0.375

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

				local var_4_33 = arg_1_1:FormatText(StoryNameCfg[348].name)

				arg_1_1.leftNameTxt_.text = var_4_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, true)
				arg_1_1.iconController_:SetSelectedState("hero")

				arg_1_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_soundonly")

				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_34 = arg_1_1:GetWordFromCfg(116431001)
				local var_4_35 = arg_1_1:FormatText(var_4_34.content)

				arg_1_1.text_.text = var_4_35

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_36 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431001", "story_v_out_116431.awb") ~= 0 then
					local var_4_39 = manager.audio:GetVoiceLength("story_v_out_116431", "116431001", "story_v_out_116431.awb") / 1000

					if var_4_39 + var_4_30 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_39 + var_4_30
					end

					if var_4_34.prefab_name ~= "" and arg_1_1.actors_[var_4_34.prefab_name] ~= nil then
						local var_4_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_34.prefab_name].transform, "story_v_out_116431", "116431001", "story_v_out_116431.awb")

						arg_1_1:RecordAudio("116431001", var_4_40)
						arg_1_1:RecordAudio("116431001", var_4_40)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_116431", "116431001", "story_v_out_116431.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_116431", "116431001", "story_v_out_116431.awb")
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
	Play116431002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 116431002
		arg_7_1.duration_ = 7.566

		local var_7_0 = {
			zh = 4.8,
			ja = 7.566
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
				arg_7_0:Play116431003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.475

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_2 = arg_7_1:FormatText(StoryNameCfg[52].name)

				arg_7_1.leftNameTxt_.text = var_10_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, true)
				arg_7_1.iconController_:SetSelectedState("hero")

				arg_7_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_6061")

				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_3 = arg_7_1:GetWordFromCfg(116431002)
				local var_10_4 = arg_7_1:FormatText(var_10_3.content)

				arg_7_1.text_.text = var_10_4

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_5 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431002", "story_v_out_116431.awb") ~= 0 then
					local var_10_8 = manager.audio:GetVoiceLength("story_v_out_116431", "116431002", "story_v_out_116431.awb") / 1000

					if var_10_8 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_8 + var_10_0
					end

					if var_10_3.prefab_name ~= "" and arg_7_1.actors_[var_10_3.prefab_name] ~= nil then
						local var_10_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_3.prefab_name].transform, "story_v_out_116431", "116431002", "story_v_out_116431.awb")

						arg_7_1:RecordAudio("116431002", var_10_9)
						arg_7_1:RecordAudio("116431002", var_10_9)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_116431", "116431002", "story_v_out_116431.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_116431", "116431002", "story_v_out_116431.awb")
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
	Play116431003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 116431003
		arg_11_1.duration_ = 0.016666666666

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"

			SetActive(arg_11_1.choicesGo_, true)

			for iter_12_0, iter_12_1 in ipairs(arg_11_1.choices_) do
				local var_12_0 = iter_12_0 <= 1

				SetActive(iter_12_1.go, var_12_0)
			end

			arg_11_1.choices_[1].txt.text = arg_11_1:FormatText(StoryChoiceCfg[273].name)
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play116431004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			return
		end
	end,
	Play116431004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 116431004
		arg_15_1.duration_ = 11.9

		local var_15_0 = {
			zh = 8.833,
			ja = 11.9
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
				arg_15_0:Play116431005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 0.975

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_2 = arg_15_1:FormatText(StoryNameCfg[52].name)

				arg_15_1.leftNameTxt_.text = var_18_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, true)
				arg_15_1.iconController_:SetSelectedState("hero")

				arg_15_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_6061")

				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_3 = arg_15_1:GetWordFromCfg(116431004)
				local var_18_4 = arg_15_1:FormatText(var_18_3.content)

				arg_15_1.text_.text = var_18_4

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_5 = 39
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

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431004", "story_v_out_116431.awb") ~= 0 then
					local var_18_8 = manager.audio:GetVoiceLength("story_v_out_116431", "116431004", "story_v_out_116431.awb") / 1000

					if var_18_8 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_8 + var_18_0
					end

					if var_18_3.prefab_name ~= "" and arg_15_1.actors_[var_18_3.prefab_name] ~= nil then
						local var_18_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_3.prefab_name].transform, "story_v_out_116431", "116431004", "story_v_out_116431.awb")

						arg_15_1:RecordAudio("116431004", var_18_9)
						arg_15_1:RecordAudio("116431004", var_18_9)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_116431", "116431004", "story_v_out_116431.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_116431", "116431004", "story_v_out_116431.awb")
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
	Play116431005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 116431005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play116431006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 0.275

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
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_3 = arg_19_1:GetWordFromCfg(116431005)
				local var_22_4 = arg_19_1:FormatText(var_22_3.content)

				arg_19_1.text_.text = var_22_4

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_5 = 11
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
	Play116431006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 116431006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play116431007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 0.375

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_2 = arg_23_1:FormatText(StoryNameCfg[7].name)

				arg_23_1.leftNameTxt_.text = var_26_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_3 = arg_23_1:GetWordFromCfg(116431006)
				local var_26_4 = arg_23_1:FormatText(var_26_3.content)

				arg_23_1.text_.text = var_26_4

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_5 = 15
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
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_8 = math.max(var_26_1, arg_23_1.talkMaxDuration)

			if var_26_0 <= arg_23_1.time_ and arg_23_1.time_ < var_26_0 + var_26_8 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_0) / var_26_8

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_0 + var_26_8 and arg_23_1.time_ < var_26_0 + var_26_8 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play116431007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 116431007
		arg_27_1.duration_ = 12.966

		local var_27_0 = {
			zh = 8.6,
			ja = 12.966
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
				arg_27_0:Play116431008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0
			local var_30_1 = 0.9

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_2 = arg_27_1:FormatText(StoryNameCfg[52].name)

				arg_27_1.leftNameTxt_.text = var_30_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, true)
				arg_27_1.iconController_:SetSelectedState("hero")

				arg_27_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_6061")

				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_3 = arg_27_1:GetWordFromCfg(116431007)
				local var_30_4 = arg_27_1:FormatText(var_30_3.content)

				arg_27_1.text_.text = var_30_4

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_5 = 36
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

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431007", "story_v_out_116431.awb") ~= 0 then
					local var_30_8 = manager.audio:GetVoiceLength("story_v_out_116431", "116431007", "story_v_out_116431.awb") / 1000

					if var_30_8 + var_30_0 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_8 + var_30_0
					end

					if var_30_3.prefab_name ~= "" and arg_27_1.actors_[var_30_3.prefab_name] ~= nil then
						local var_30_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_3.prefab_name].transform, "story_v_out_116431", "116431007", "story_v_out_116431.awb")

						arg_27_1:RecordAudio("116431007", var_30_9)
						arg_27_1:RecordAudio("116431007", var_30_9)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_116431", "116431007", "story_v_out_116431.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_116431", "116431007", "story_v_out_116431.awb")
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
	Play116431008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 116431008
		arg_31_1.duration_ = 9.9

		local var_31_0 = {
			zh = 8.633,
			ja = 9.9
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
				arg_31_0:Play116431009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 0.825

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_2 = arg_31_1:FormatText(StoryNameCfg[52].name)

				arg_31_1.leftNameTxt_.text = var_34_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, true)
				arg_31_1.iconController_:SetSelectedState("hero")

				arg_31_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_6061")

				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_3 = arg_31_1:GetWordFromCfg(116431008)
				local var_34_4 = arg_31_1:FormatText(var_34_3.content)

				arg_31_1.text_.text = var_34_4

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_5 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431008", "story_v_out_116431.awb") ~= 0 then
					local var_34_8 = manager.audio:GetVoiceLength("story_v_out_116431", "116431008", "story_v_out_116431.awb") / 1000

					if var_34_8 + var_34_0 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_8 + var_34_0
					end

					if var_34_3.prefab_name ~= "" and arg_31_1.actors_[var_34_3.prefab_name] ~= nil then
						local var_34_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_3.prefab_name].transform, "story_v_out_116431", "116431008", "story_v_out_116431.awb")

						arg_31_1:RecordAudio("116431008", var_34_9)
						arg_31_1:RecordAudio("116431008", var_34_9)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_116431", "116431008", "story_v_out_116431.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_116431", "116431008", "story_v_out_116431.awb")
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
	Play116431009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 116431009
		arg_35_1.duration_ = 5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play116431010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 0.2

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_2 = arg_35_1:FormatText(StoryNameCfg[7].name)

				arg_35_1.leftNameTxt_.text = var_38_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_3 = arg_35_1:GetWordFromCfg(116431009)
				local var_38_4 = arg_35_1:FormatText(var_38_3.content)

				arg_35_1.text_.text = var_38_4

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_5 = 8
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
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_8 = math.max(var_38_1, arg_35_1.talkMaxDuration)

			if var_38_0 <= arg_35_1.time_ and arg_35_1.time_ < var_38_0 + var_38_8 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_0) / var_38_8

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_0 + var_38_8 and arg_35_1.time_ < var_38_0 + var_38_8 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play116431010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 116431010
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play116431011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0
			local var_42_1 = 0.5

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

				local var_42_2 = arg_39_1:GetWordFromCfg(116431010)
				local var_42_3 = arg_39_1:FormatText(var_42_2.content)

				arg_39_1.text_.text = var_42_3

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_4 = 20
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
	Play116431011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 116431011
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play116431012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0
			local var_46_1 = 0.225

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

				local var_46_2 = arg_43_1:GetWordFromCfg(116431011)
				local var_46_3 = arg_43_1:FormatText(var_46_2.content)

				arg_43_1.text_.text = var_46_3

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_4 = 9
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
	Play116431012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 116431012
		arg_47_1.duration_ = 7.6

		local var_47_0 = {
			zh = 6.533,
			ja = 7.6
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
				arg_47_0:Play116431013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = "1028ui_story"

			if arg_47_1.actors_[var_50_0] == nil then
				local var_50_1 = Object.Instantiate(Asset.Load("Char/" .. var_50_0), arg_47_1.stage_.transform)

				var_50_1.name = var_50_0
				var_50_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_47_1.actors_[var_50_0] = var_50_1

				local var_50_2 = var_50_1:GetComponentInChildren(typeof(CharacterEffect))

				var_50_2.enabled = true

				local var_50_3 = GameObjectTools.GetOrAddComponent(var_50_1, typeof(DynamicBoneHelper))

				if var_50_3 then
					var_50_3:EnableDynamicBone(false)
				end

				arg_47_1:ShowWeapon(var_50_2.transform, false)

				arg_47_1.var_[var_50_0 .. "Animator"] = var_50_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_47_1.var_[var_50_0 .. "Animator"].applyRootMotion = true
				arg_47_1.var_[var_50_0 .. "LipSync"] = var_50_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_50_4 = arg_47_1.actors_["1028ui_story"].transform
			local var_50_5 = 0

			if var_50_5 < arg_47_1.time_ and arg_47_1.time_ <= var_50_5 + arg_50_0 then
				arg_47_1.var_.moveOldPos1028ui_story = var_50_4.localPosition
			end

			local var_50_6 = 0.001

			if var_50_5 <= arg_47_1.time_ and arg_47_1.time_ < var_50_5 + var_50_6 then
				local var_50_7 = (arg_47_1.time_ - var_50_5) / var_50_6
				local var_50_8 = Vector3.New(0, -0.9, -5.9)

				var_50_4.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1028ui_story, var_50_8, var_50_7)

				local var_50_9 = manager.ui.mainCamera.transform.position - var_50_4.position

				var_50_4.forward = Vector3.New(var_50_9.x, var_50_9.y, var_50_9.z)

				local var_50_10 = var_50_4.localEulerAngles

				var_50_10.z = 0
				var_50_10.x = 0
				var_50_4.localEulerAngles = var_50_10
			end

			if arg_47_1.time_ >= var_50_5 + var_50_6 and arg_47_1.time_ < var_50_5 + var_50_6 + arg_50_0 then
				var_50_4.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_50_11 = manager.ui.mainCamera.transform.position - var_50_4.position

				var_50_4.forward = Vector3.New(var_50_11.x, var_50_11.y, var_50_11.z)

				local var_50_12 = var_50_4.localEulerAngles

				var_50_12.z = 0
				var_50_12.x = 0
				var_50_4.localEulerAngles = var_50_12
			end

			local var_50_13 = arg_47_1.actors_["1028ui_story"]
			local var_50_14 = 0

			if var_50_14 < arg_47_1.time_ and arg_47_1.time_ <= var_50_14 + arg_50_0 and arg_47_1.var_.characterEffect1028ui_story == nil then
				arg_47_1.var_.characterEffect1028ui_story = var_50_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_15 = 0.2

			if var_50_14 <= arg_47_1.time_ and arg_47_1.time_ < var_50_14 + var_50_15 then
				local var_50_16 = (arg_47_1.time_ - var_50_14) / var_50_15

				if arg_47_1.var_.characterEffect1028ui_story then
					arg_47_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_14 + var_50_15 and arg_47_1.time_ < var_50_14 + var_50_15 + arg_50_0 and arg_47_1.var_.characterEffect1028ui_story then
				arg_47_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_50_17 = 0

			if var_50_17 < arg_47_1.time_ and arg_47_1.time_ <= var_50_17 + arg_50_0 then
				arg_47_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action7_1")
			end

			local var_50_18 = 0

			if var_50_18 < arg_47_1.time_ and arg_47_1.time_ <= var_50_18 + arg_50_0 then
				arg_47_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_50_19 = 0
			local var_50_20 = 0.675

			if var_50_19 < arg_47_1.time_ and arg_47_1.time_ <= var_50_19 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_21 = arg_47_1:FormatText(StoryNameCfg[327].name)

				arg_47_1.leftNameTxt_.text = var_50_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_22 = arg_47_1:GetWordFromCfg(116431012)
				local var_50_23 = arg_47_1:FormatText(var_50_22.content)

				arg_47_1.text_.text = var_50_23

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_24 = 27
				local var_50_25 = utf8.len(var_50_23)
				local var_50_26 = var_50_24 <= 0 and var_50_20 or var_50_20 * (var_50_25 / var_50_24)

				if var_50_26 > 0 and var_50_20 < var_50_26 then
					arg_47_1.talkMaxDuration = var_50_26

					if var_50_26 + var_50_19 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_26 + var_50_19
					end
				end

				arg_47_1.text_.text = var_50_23
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431012", "story_v_out_116431.awb") ~= 0 then
					local var_50_27 = manager.audio:GetVoiceLength("story_v_out_116431", "116431012", "story_v_out_116431.awb") / 1000

					if var_50_27 + var_50_19 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_27 + var_50_19
					end

					if var_50_22.prefab_name ~= "" and arg_47_1.actors_[var_50_22.prefab_name] ~= nil then
						local var_50_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_22.prefab_name].transform, "story_v_out_116431", "116431012", "story_v_out_116431.awb")

						arg_47_1:RecordAudio("116431012", var_50_28)
						arg_47_1:RecordAudio("116431012", var_50_28)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_116431", "116431012", "story_v_out_116431.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_116431", "116431012", "story_v_out_116431.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_29 = math.max(var_50_20, arg_47_1.talkMaxDuration)

			if var_50_19 <= arg_47_1.time_ and arg_47_1.time_ < var_50_19 + var_50_29 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_19) / var_50_29

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_19 + var_50_29 and arg_47_1.time_ < var_50_19 + var_50_29 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play116431013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 116431013
		arg_51_1.duration_ = 7.5

		local var_51_0 = {
			zh = 4.133,
			ja = 7.5
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
				arg_51_0:Play116431014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1028ui_story"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect1028ui_story == nil then
				arg_51_1.var_.characterEffect1028ui_story = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.2

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect1028ui_story then
					local var_54_4 = Mathf.Lerp(0, 0.5, var_54_3)

					arg_51_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_51_1.var_.characterEffect1028ui_story.fillRatio = var_54_4
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect1028ui_story then
				local var_54_5 = 0.5

				arg_51_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_51_1.var_.characterEffect1028ui_story.fillRatio = var_54_5
			end

			local var_54_6 = 0
			local var_54_7 = 0.475

			if var_54_6 < arg_51_1.time_ and arg_51_1.time_ <= var_54_6 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_8 = arg_51_1:FormatText(StoryNameCfg[8].name)

				arg_51_1.leftNameTxt_.text = var_54_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, true)
				arg_51_1.iconController_:SetSelectedState("hero")

				arg_51_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1148")

				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_9 = arg_51_1:GetWordFromCfg(116431013)
				local var_54_10 = arg_51_1:FormatText(var_54_9.content)

				arg_51_1.text_.text = var_54_10

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_11 = 19
				local var_54_12 = utf8.len(var_54_10)
				local var_54_13 = var_54_11 <= 0 and var_54_7 or var_54_7 * (var_54_12 / var_54_11)

				if var_54_13 > 0 and var_54_7 < var_54_13 then
					arg_51_1.talkMaxDuration = var_54_13

					if var_54_13 + var_54_6 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_13 + var_54_6
					end
				end

				arg_51_1.text_.text = var_54_10
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431013", "story_v_out_116431.awb") ~= 0 then
					local var_54_14 = manager.audio:GetVoiceLength("story_v_out_116431", "116431013", "story_v_out_116431.awb") / 1000

					if var_54_14 + var_54_6 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_14 + var_54_6
					end

					if var_54_9.prefab_name ~= "" and arg_51_1.actors_[var_54_9.prefab_name] ~= nil then
						local var_54_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_9.prefab_name].transform, "story_v_out_116431", "116431013", "story_v_out_116431.awb")

						arg_51_1:RecordAudio("116431013", var_54_15)
						arg_51_1:RecordAudio("116431013", var_54_15)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_116431", "116431013", "story_v_out_116431.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_116431", "116431013", "story_v_out_116431.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_16 = math.max(var_54_7, arg_51_1.talkMaxDuration)

			if var_54_6 <= arg_51_1.time_ and arg_51_1.time_ < var_54_6 + var_54_16 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_6) / var_54_16

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_6 + var_54_16 and arg_51_1.time_ < var_54_6 + var_54_16 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play116431014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 116431014
		arg_55_1.duration_ = 8.466

		local var_55_0 = {
			zh = 8.466,
			ja = 7.833
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
				arg_55_0:Play116431015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1028ui_story"].transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPos1028ui_story = var_58_0.localPosition
			end

			local var_58_2 = 0.001

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2
				local var_58_4 = Vector3.New(0, -0.9, -5.9)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1028ui_story, var_58_4, var_58_3)

				local var_58_5 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_5.x, var_58_5.y, var_58_5.z)

				local var_58_6 = var_58_0.localEulerAngles

				var_58_6.z = 0
				var_58_6.x = 0
				var_58_0.localEulerAngles = var_58_6
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_58_7 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_7.x, var_58_7.y, var_58_7.z)

				local var_58_8 = var_58_0.localEulerAngles

				var_58_8.z = 0
				var_58_8.x = 0
				var_58_0.localEulerAngles = var_58_8
			end

			local var_58_9 = arg_55_1.actors_["1028ui_story"]
			local var_58_10 = 0

			if var_58_10 < arg_55_1.time_ and arg_55_1.time_ <= var_58_10 + arg_58_0 and arg_55_1.var_.characterEffect1028ui_story == nil then
				arg_55_1.var_.characterEffect1028ui_story = var_58_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_11 = 0.2

			if var_58_10 <= arg_55_1.time_ and arg_55_1.time_ < var_58_10 + var_58_11 then
				local var_58_12 = (arg_55_1.time_ - var_58_10) / var_58_11

				if arg_55_1.var_.characterEffect1028ui_story then
					arg_55_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_10 + var_58_11 and arg_55_1.time_ < var_58_10 + var_58_11 + arg_58_0 and arg_55_1.var_.characterEffect1028ui_story then
				arg_55_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_58_13 = 0

			if var_58_13 < arg_55_1.time_ and arg_55_1.time_ <= var_58_13 + arg_58_0 then
				arg_55_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028actionlink/1028action473")
			end

			local var_58_14 = 0

			if var_58_14 < arg_55_1.time_ and arg_55_1.time_ <= var_58_14 + arg_58_0 then
				arg_55_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_58_15 = 0
			local var_58_16 = 1.05

			if var_58_15 < arg_55_1.time_ and arg_55_1.time_ <= var_58_15 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_17 = arg_55_1:FormatText(StoryNameCfg[327].name)

				arg_55_1.leftNameTxt_.text = var_58_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_18 = arg_55_1:GetWordFromCfg(116431014)
				local var_58_19 = arg_55_1:FormatText(var_58_18.content)

				arg_55_1.text_.text = var_58_19

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_20 = 42
				local var_58_21 = utf8.len(var_58_19)
				local var_58_22 = var_58_20 <= 0 and var_58_16 or var_58_16 * (var_58_21 / var_58_20)

				if var_58_22 > 0 and var_58_16 < var_58_22 then
					arg_55_1.talkMaxDuration = var_58_22

					if var_58_22 + var_58_15 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_22 + var_58_15
					end
				end

				arg_55_1.text_.text = var_58_19
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431014", "story_v_out_116431.awb") ~= 0 then
					local var_58_23 = manager.audio:GetVoiceLength("story_v_out_116431", "116431014", "story_v_out_116431.awb") / 1000

					if var_58_23 + var_58_15 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_23 + var_58_15
					end

					if var_58_18.prefab_name ~= "" and arg_55_1.actors_[var_58_18.prefab_name] ~= nil then
						local var_58_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_18.prefab_name].transform, "story_v_out_116431", "116431014", "story_v_out_116431.awb")

						arg_55_1:RecordAudio("116431014", var_58_24)
						arg_55_1:RecordAudio("116431014", var_58_24)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_116431", "116431014", "story_v_out_116431.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_116431", "116431014", "story_v_out_116431.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_25 = math.max(var_58_16, arg_55_1.talkMaxDuration)

			if var_58_15 <= arg_55_1.time_ and arg_55_1.time_ < var_58_15 + var_58_25 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_15) / var_58_25

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_15 + var_58_25 and arg_55_1.time_ < var_58_15 + var_58_25 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play116431015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 116431015
		arg_59_1.duration_ = 5.766

		local var_59_0 = {
			zh = 4.766,
			ja = 5.766
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
				arg_59_0:Play116431016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1028ui_story"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.characterEffect1028ui_story == nil then
				arg_59_1.var_.characterEffect1028ui_story = var_62_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_2 = 0.2

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.characterEffect1028ui_story then
					local var_62_4 = Mathf.Lerp(0, 0.5, var_62_3)

					arg_59_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_59_1.var_.characterEffect1028ui_story.fillRatio = var_62_4
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.characterEffect1028ui_story then
				local var_62_5 = 0.5

				arg_59_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_59_1.var_.characterEffect1028ui_story.fillRatio = var_62_5
			end

			local var_62_6 = 0
			local var_62_7 = 0.475

			if var_62_6 < arg_59_1.time_ and arg_59_1.time_ <= var_62_6 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_8 = arg_59_1:FormatText(StoryNameCfg[28].name)

				arg_59_1.leftNameTxt_.text = var_62_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, true)
				arg_59_1.iconController_:SetSelectedState("hero")

				arg_59_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1059")

				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_9 = arg_59_1:GetWordFromCfg(116431015)
				local var_62_10 = arg_59_1:FormatText(var_62_9.content)

				arg_59_1.text_.text = var_62_10

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_11 = 19
				local var_62_12 = utf8.len(var_62_10)
				local var_62_13 = var_62_11 <= 0 and var_62_7 or var_62_7 * (var_62_12 / var_62_11)

				if var_62_13 > 0 and var_62_7 < var_62_13 then
					arg_59_1.talkMaxDuration = var_62_13

					if var_62_13 + var_62_6 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_13 + var_62_6
					end
				end

				arg_59_1.text_.text = var_62_10
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431015", "story_v_out_116431.awb") ~= 0 then
					local var_62_14 = manager.audio:GetVoiceLength("story_v_out_116431", "116431015", "story_v_out_116431.awb") / 1000

					if var_62_14 + var_62_6 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_14 + var_62_6
					end

					if var_62_9.prefab_name ~= "" and arg_59_1.actors_[var_62_9.prefab_name] ~= nil then
						local var_62_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_9.prefab_name].transform, "story_v_out_116431", "116431015", "story_v_out_116431.awb")

						arg_59_1:RecordAudio("116431015", var_62_15)
						arg_59_1:RecordAudio("116431015", var_62_15)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_116431", "116431015", "story_v_out_116431.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_116431", "116431015", "story_v_out_116431.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_16 = math.max(var_62_7, arg_59_1.talkMaxDuration)

			if var_62_6 <= arg_59_1.time_ and arg_59_1.time_ < var_62_6 + var_62_16 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_6) / var_62_16

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_6 + var_62_16 and arg_59_1.time_ < var_62_6 + var_62_16 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play116431016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 116431016
		arg_63_1.duration_ = 5

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play116431017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1028ui_story"].transform
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				arg_63_1.var_.moveOldPos1028ui_story = var_66_0.localPosition
			end

			local var_66_2 = 0.001

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2
				local var_66_4 = Vector3.New(0, 100, 0)

				var_66_0.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1028ui_story, var_66_4, var_66_3)

				local var_66_5 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_5.x, var_66_5.y, var_66_5.z)

				local var_66_6 = var_66_0.localEulerAngles

				var_66_6.z = 0
				var_66_6.x = 0
				var_66_0.localEulerAngles = var_66_6
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 then
				var_66_0.localPosition = Vector3.New(0, 100, 0)

				local var_66_7 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_7.x, var_66_7.y, var_66_7.z)

				local var_66_8 = var_66_0.localEulerAngles

				var_66_8.z = 0
				var_66_8.x = 0
				var_66_0.localEulerAngles = var_66_8
			end

			local var_66_9 = 0
			local var_66_10 = 0.275

			if var_66_9 < arg_63_1.time_ and arg_63_1.time_ <= var_66_9 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, false)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_11 = arg_63_1:GetWordFromCfg(116431016)
				local var_66_12 = arg_63_1:FormatText(var_66_11.content)

				arg_63_1.text_.text = var_66_12

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_13 = 11
				local var_66_14 = utf8.len(var_66_12)
				local var_66_15 = var_66_13 <= 0 and var_66_10 or var_66_10 * (var_66_14 / var_66_13)

				if var_66_15 > 0 and var_66_10 < var_66_15 then
					arg_63_1.talkMaxDuration = var_66_15

					if var_66_15 + var_66_9 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_15 + var_66_9
					end
				end

				arg_63_1.text_.text = var_66_12
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)
				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_16 = math.max(var_66_10, arg_63_1.talkMaxDuration)

			if var_66_9 <= arg_63_1.time_ and arg_63_1.time_ < var_66_9 + var_66_16 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_9) / var_66_16

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_9 + var_66_16 and arg_63_1.time_ < var_66_9 + var_66_16 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play116431017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 116431017
		arg_67_1.duration_ = 3.6

		local var_67_0 = {
			zh = 2.2,
			ja = 3.6
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
				arg_67_0:Play116431018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = "1029ui_story"

			if arg_67_1.actors_[var_70_0] == nil then
				local var_70_1 = Object.Instantiate(Asset.Load("Char/" .. var_70_0), arg_67_1.stage_.transform)

				var_70_1.name = var_70_0
				var_70_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_67_1.actors_[var_70_0] = var_70_1

				local var_70_2 = var_70_1:GetComponentInChildren(typeof(CharacterEffect))

				var_70_2.enabled = true

				local var_70_3 = GameObjectTools.GetOrAddComponent(var_70_1, typeof(DynamicBoneHelper))

				if var_70_3 then
					var_70_3:EnableDynamicBone(false)
				end

				arg_67_1:ShowWeapon(var_70_2.transform, false)

				arg_67_1.var_[var_70_0 .. "Animator"] = var_70_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_67_1.var_[var_70_0 .. "Animator"].applyRootMotion = true
				arg_67_1.var_[var_70_0 .. "LipSync"] = var_70_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_70_4 = arg_67_1.actors_["1029ui_story"].transform
			local var_70_5 = 0

			if var_70_5 < arg_67_1.time_ and arg_67_1.time_ <= var_70_5 + arg_70_0 then
				arg_67_1.var_.moveOldPos1029ui_story = var_70_4.localPosition
			end

			local var_70_6 = 0.001

			if var_70_5 <= arg_67_1.time_ and arg_67_1.time_ < var_70_5 + var_70_6 then
				local var_70_7 = (arg_67_1.time_ - var_70_5) / var_70_6
				local var_70_8 = Vector3.New(0, -1.09, -6.2)

				var_70_4.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1029ui_story, var_70_8, var_70_7)

				local var_70_9 = manager.ui.mainCamera.transform.position - var_70_4.position

				var_70_4.forward = Vector3.New(var_70_9.x, var_70_9.y, var_70_9.z)

				local var_70_10 = var_70_4.localEulerAngles

				var_70_10.z = 0
				var_70_10.x = 0
				var_70_4.localEulerAngles = var_70_10
			end

			if arg_67_1.time_ >= var_70_5 + var_70_6 and arg_67_1.time_ < var_70_5 + var_70_6 + arg_70_0 then
				var_70_4.localPosition = Vector3.New(0, -1.09, -6.2)

				local var_70_11 = manager.ui.mainCamera.transform.position - var_70_4.position

				var_70_4.forward = Vector3.New(var_70_11.x, var_70_11.y, var_70_11.z)

				local var_70_12 = var_70_4.localEulerAngles

				var_70_12.z = 0
				var_70_12.x = 0
				var_70_4.localEulerAngles = var_70_12
			end

			local var_70_13 = arg_67_1.actors_["1029ui_story"]
			local var_70_14 = 0

			if var_70_14 < arg_67_1.time_ and arg_67_1.time_ <= var_70_14 + arg_70_0 and arg_67_1.var_.characterEffect1029ui_story == nil then
				arg_67_1.var_.characterEffect1029ui_story = var_70_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_15 = 0.2

			if var_70_14 <= arg_67_1.time_ and arg_67_1.time_ < var_70_14 + var_70_15 then
				local var_70_16 = (arg_67_1.time_ - var_70_14) / var_70_15

				if arg_67_1.var_.characterEffect1029ui_story then
					arg_67_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_14 + var_70_15 and arg_67_1.time_ < var_70_14 + var_70_15 + arg_70_0 and arg_67_1.var_.characterEffect1029ui_story then
				arg_67_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_70_17 = 0

			if var_70_17 < arg_67_1.time_ and arg_67_1.time_ <= var_70_17 + arg_70_0 then
				arg_67_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action1_1")
			end

			local var_70_18 = 0

			if var_70_18 < arg_67_1.time_ and arg_67_1.time_ <= var_70_18 + arg_70_0 then
				arg_67_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_70_19 = 0
			local var_70_20 = 0.225

			if var_70_19 < arg_67_1.time_ and arg_67_1.time_ <= var_70_19 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_21 = arg_67_1:FormatText(StoryNameCfg[319].name)

				arg_67_1.leftNameTxt_.text = var_70_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_22 = arg_67_1:GetWordFromCfg(116431017)
				local var_70_23 = arg_67_1:FormatText(var_70_22.content)

				arg_67_1.text_.text = var_70_23

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_24 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431017", "story_v_out_116431.awb") ~= 0 then
					local var_70_27 = manager.audio:GetVoiceLength("story_v_out_116431", "116431017", "story_v_out_116431.awb") / 1000

					if var_70_27 + var_70_19 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_27 + var_70_19
					end

					if var_70_22.prefab_name ~= "" and arg_67_1.actors_[var_70_22.prefab_name] ~= nil then
						local var_70_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_22.prefab_name].transform, "story_v_out_116431", "116431017", "story_v_out_116431.awb")

						arg_67_1:RecordAudio("116431017", var_70_28)
						arg_67_1:RecordAudio("116431017", var_70_28)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_116431", "116431017", "story_v_out_116431.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_116431", "116431017", "story_v_out_116431.awb")
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
	Play116431018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 116431018
		arg_71_1.duration_ = 0.016666666666

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"

			SetActive(arg_71_1.choicesGo_, true)

			for iter_72_0, iter_72_1 in ipairs(arg_71_1.choices_) do
				local var_72_0 = iter_72_0 <= 1

				SetActive(iter_72_1.go, var_72_0)
			end

			arg_71_1.choices_[1].txt.text = arg_71_1:FormatText(StoryChoiceCfg[274].name)
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play116431019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			return
		end
	end,
	Play116431019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 116431019
		arg_75_1.duration_ = 3.833

		local var_75_0 = {
			zh = 3.833,
			ja = 3.533
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
				arg_75_0:Play116431020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1029ui_story"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos1029ui_story = var_78_0.localPosition
			end

			local var_78_2 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2
				local var_78_4 = Vector3.New(0, -1.09, -6.2)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1029ui_story, var_78_4, var_78_3)

				local var_78_5 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_5.x, var_78_5.y, var_78_5.z)

				local var_78_6 = var_78_0.localEulerAngles

				var_78_6.z = 0
				var_78_6.x = 0
				var_78_0.localEulerAngles = var_78_6
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 then
				var_78_0.localPosition = Vector3.New(0, -1.09, -6.2)

				local var_78_7 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_7.x, var_78_7.y, var_78_7.z)

				local var_78_8 = var_78_0.localEulerAngles

				var_78_8.z = 0
				var_78_8.x = 0
				var_78_0.localEulerAngles = var_78_8
			end

			local var_78_9 = 0

			if var_78_9 < arg_75_1.time_ and arg_75_1.time_ <= var_78_9 + arg_78_0 then
				arg_75_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action1_1")
			end

			local var_78_10 = 0

			if var_78_10 < arg_75_1.time_ and arg_75_1.time_ <= var_78_10 + arg_78_0 then
				arg_75_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_78_11 = 0
			local var_78_12 = 0.475

			if var_78_11 < arg_75_1.time_ and arg_75_1.time_ <= var_78_11 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_13 = arg_75_1:FormatText(StoryNameCfg[319].name)

				arg_75_1.leftNameTxt_.text = var_78_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_14 = arg_75_1:GetWordFromCfg(116431019)
				local var_78_15 = arg_75_1:FormatText(var_78_14.content)

				arg_75_1.text_.text = var_78_15

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_16 = 19
				local var_78_17 = utf8.len(var_78_15)
				local var_78_18 = var_78_16 <= 0 and var_78_12 or var_78_12 * (var_78_17 / var_78_16)

				if var_78_18 > 0 and var_78_12 < var_78_18 then
					arg_75_1.talkMaxDuration = var_78_18

					if var_78_18 + var_78_11 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_18 + var_78_11
					end
				end

				arg_75_1.text_.text = var_78_15
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431019", "story_v_out_116431.awb") ~= 0 then
					local var_78_19 = manager.audio:GetVoiceLength("story_v_out_116431", "116431019", "story_v_out_116431.awb") / 1000

					if var_78_19 + var_78_11 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_19 + var_78_11
					end

					if var_78_14.prefab_name ~= "" and arg_75_1.actors_[var_78_14.prefab_name] ~= nil then
						local var_78_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_14.prefab_name].transform, "story_v_out_116431", "116431019", "story_v_out_116431.awb")

						arg_75_1:RecordAudio("116431019", var_78_20)
						arg_75_1:RecordAudio("116431019", var_78_20)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_116431", "116431019", "story_v_out_116431.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_116431", "116431019", "story_v_out_116431.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_21 = math.max(var_78_12, arg_75_1.talkMaxDuration)

			if var_78_11 <= arg_75_1.time_ and arg_75_1.time_ < var_78_11 + var_78_21 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_11) / var_78_21

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_11 + var_78_21 and arg_75_1.time_ < var_78_11 + var_78_21 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play116431020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 116431020
		arg_79_1.duration_ = 8

		local var_79_0 = {
			zh = 6.066,
			ja = 8
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
				arg_79_0:Play116431021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1029ui_story"].transform
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1.var_.moveOldPos1029ui_story = var_82_0.localPosition
			end

			local var_82_2 = 0.001

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2
				local var_82_4 = Vector3.New(0, -1.09, -6.2)

				var_82_0.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1029ui_story, var_82_4, var_82_3)

				local var_82_5 = manager.ui.mainCamera.transform.position - var_82_0.position

				var_82_0.forward = Vector3.New(var_82_5.x, var_82_5.y, var_82_5.z)

				local var_82_6 = var_82_0.localEulerAngles

				var_82_6.z = 0
				var_82_6.x = 0
				var_82_0.localEulerAngles = var_82_6
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 then
				var_82_0.localPosition = Vector3.New(0, -1.09, -6.2)

				local var_82_7 = manager.ui.mainCamera.transform.position - var_82_0.position

				var_82_0.forward = Vector3.New(var_82_7.x, var_82_7.y, var_82_7.z)

				local var_82_8 = var_82_0.localEulerAngles

				var_82_8.z = 0
				var_82_8.x = 0
				var_82_0.localEulerAngles = var_82_8
			end

			local var_82_9 = 0

			if var_82_9 < arg_79_1.time_ and arg_79_1.time_ <= var_82_9 + arg_82_0 then
				arg_79_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action4_1")
			end

			local var_82_10 = 0

			if var_82_10 < arg_79_1.time_ and arg_79_1.time_ <= var_82_10 + arg_82_0 then
				arg_79_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_82_11 = 0
			local var_82_12 = 0.675

			if var_82_11 < arg_79_1.time_ and arg_79_1.time_ <= var_82_11 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_13 = arg_79_1:FormatText(StoryNameCfg[319].name)

				arg_79_1.leftNameTxt_.text = var_82_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_14 = arg_79_1:GetWordFromCfg(116431020)
				local var_82_15 = arg_79_1:FormatText(var_82_14.content)

				arg_79_1.text_.text = var_82_15

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_16 = 27
				local var_82_17 = utf8.len(var_82_15)
				local var_82_18 = var_82_16 <= 0 and var_82_12 or var_82_12 * (var_82_17 / var_82_16)

				if var_82_18 > 0 and var_82_12 < var_82_18 then
					arg_79_1.talkMaxDuration = var_82_18

					if var_82_18 + var_82_11 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_18 + var_82_11
					end
				end

				arg_79_1.text_.text = var_82_15
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431020", "story_v_out_116431.awb") ~= 0 then
					local var_82_19 = manager.audio:GetVoiceLength("story_v_out_116431", "116431020", "story_v_out_116431.awb") / 1000

					if var_82_19 + var_82_11 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_19 + var_82_11
					end

					if var_82_14.prefab_name ~= "" and arg_79_1.actors_[var_82_14.prefab_name] ~= nil then
						local var_82_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_14.prefab_name].transform, "story_v_out_116431", "116431020", "story_v_out_116431.awb")

						arg_79_1:RecordAudio("116431020", var_82_20)
						arg_79_1:RecordAudio("116431020", var_82_20)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_116431", "116431020", "story_v_out_116431.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_116431", "116431020", "story_v_out_116431.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_21 = math.max(var_82_12, arg_79_1.talkMaxDuration)

			if var_82_11 <= arg_79_1.time_ and arg_79_1.time_ < var_82_11 + var_82_21 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_11) / var_82_21

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_11 + var_82_21 and arg_79_1.time_ < var_82_11 + var_82_21 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play116431021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 116431021
		arg_83_1.duration_ = 5

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play116431022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1029ui_story"]
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 and arg_83_1.var_.characterEffect1029ui_story == nil then
				arg_83_1.var_.characterEffect1029ui_story = var_86_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_2 = 0.2

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2

				if arg_83_1.var_.characterEffect1029ui_story then
					local var_86_4 = Mathf.Lerp(0, 0.5, var_86_3)

					arg_83_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_83_1.var_.characterEffect1029ui_story.fillRatio = var_86_4
				end
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 and arg_83_1.var_.characterEffect1029ui_story then
				local var_86_5 = 0.5

				arg_83_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_83_1.var_.characterEffect1029ui_story.fillRatio = var_86_5
			end

			local var_86_6 = 0
			local var_86_7 = 0.125

			if var_86_6 < arg_83_1.time_ and arg_83_1.time_ <= var_86_6 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_8 = arg_83_1:FormatText(StoryNameCfg[7].name)

				arg_83_1.leftNameTxt_.text = var_86_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_9 = arg_83_1:GetWordFromCfg(116431021)
				local var_86_10 = arg_83_1:FormatText(var_86_9.content)

				arg_83_1.text_.text = var_86_10

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_11 = 5
				local var_86_12 = utf8.len(var_86_10)
				local var_86_13 = var_86_11 <= 0 and var_86_7 or var_86_7 * (var_86_12 / var_86_11)

				if var_86_13 > 0 and var_86_7 < var_86_13 then
					arg_83_1.talkMaxDuration = var_86_13

					if var_86_13 + var_86_6 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_13 + var_86_6
					end
				end

				arg_83_1.text_.text = var_86_10
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)
				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_14 = math.max(var_86_7, arg_83_1.talkMaxDuration)

			if var_86_6 <= arg_83_1.time_ and arg_83_1.time_ < var_86_6 + var_86_14 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_6) / var_86_14

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_6 + var_86_14 and arg_83_1.time_ < var_86_6 + var_86_14 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play116431022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 116431022
		arg_87_1.duration_ = 5

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
		end

		function arg_87_1.playNext_(arg_89_0)
			if arg_89_0 == 1 then
				arg_87_0:Play116431023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 0
			local var_90_1 = 0.7

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_2 = arg_87_1:FormatText(StoryNameCfg[7].name)

				arg_87_1.leftNameTxt_.text = var_90_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_3 = arg_87_1:GetWordFromCfg(116431022)
				local var_90_4 = arg_87_1:FormatText(var_90_3.content)

				arg_87_1.text_.text = var_90_4

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_5 = 28
				local var_90_6 = utf8.len(var_90_4)
				local var_90_7 = var_90_5 <= 0 and var_90_1 or var_90_1 * (var_90_6 / var_90_5)

				if var_90_7 > 0 and var_90_1 < var_90_7 then
					arg_87_1.talkMaxDuration = var_90_7

					if var_90_7 + var_90_0 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_7 + var_90_0
					end
				end

				arg_87_1.text_.text = var_90_4
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)
				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_8 = math.max(var_90_1, arg_87_1.talkMaxDuration)

			if var_90_0 <= arg_87_1.time_ and arg_87_1.time_ < var_90_0 + var_90_8 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_0) / var_90_8

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_0 + var_90_8 and arg_87_1.time_ < var_90_0 + var_90_8 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play116431023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 116431023
		arg_91_1.duration_ = 6.966

		local var_91_0 = {
			zh = 6.633,
			ja = 6.966
		}
		local var_91_1 = manager.audio:GetLocalizationFlag()

		if var_91_0[var_91_1] ~= nil then
			arg_91_1.duration_ = var_91_0[var_91_1]
		end

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play116431024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1029ui_story"].transform
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				arg_91_1.var_.moveOldPos1029ui_story = var_94_0.localPosition
			end

			local var_94_2 = 0.001

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2
				local var_94_4 = Vector3.New(0, -1.09, -6.2)

				var_94_0.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1029ui_story, var_94_4, var_94_3)

				local var_94_5 = manager.ui.mainCamera.transform.position - var_94_0.position

				var_94_0.forward = Vector3.New(var_94_5.x, var_94_5.y, var_94_5.z)

				local var_94_6 = var_94_0.localEulerAngles

				var_94_6.z = 0
				var_94_6.x = 0
				var_94_0.localEulerAngles = var_94_6
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 then
				var_94_0.localPosition = Vector3.New(0, -1.09, -6.2)

				local var_94_7 = manager.ui.mainCamera.transform.position - var_94_0.position

				var_94_0.forward = Vector3.New(var_94_7.x, var_94_7.y, var_94_7.z)

				local var_94_8 = var_94_0.localEulerAngles

				var_94_8.z = 0
				var_94_8.x = 0
				var_94_0.localEulerAngles = var_94_8
			end

			local var_94_9 = arg_91_1.actors_["1029ui_story"]
			local var_94_10 = 0

			if var_94_10 < arg_91_1.time_ and arg_91_1.time_ <= var_94_10 + arg_94_0 and arg_91_1.var_.characterEffect1029ui_story == nil then
				arg_91_1.var_.characterEffect1029ui_story = var_94_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_11 = 0.2

			if var_94_10 <= arg_91_1.time_ and arg_91_1.time_ < var_94_10 + var_94_11 then
				local var_94_12 = (arg_91_1.time_ - var_94_10) / var_94_11

				if arg_91_1.var_.characterEffect1029ui_story then
					arg_91_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_10 + var_94_11 and arg_91_1.time_ < var_94_10 + var_94_11 + arg_94_0 and arg_91_1.var_.characterEffect1029ui_story then
				arg_91_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_94_13 = 0

			if var_94_13 < arg_91_1.time_ and arg_91_1.time_ <= var_94_13 + arg_94_0 then
				arg_91_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_94_14 = 0
			local var_94_15 = 0.625

			if var_94_14 < arg_91_1.time_ and arg_91_1.time_ <= var_94_14 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_16 = arg_91_1:FormatText(StoryNameCfg[319].name)

				arg_91_1.leftNameTxt_.text = var_94_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_17 = arg_91_1:GetWordFromCfg(116431023)
				local var_94_18 = arg_91_1:FormatText(var_94_17.content)

				arg_91_1.text_.text = var_94_18

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_19 = 25
				local var_94_20 = utf8.len(var_94_18)
				local var_94_21 = var_94_19 <= 0 and var_94_15 or var_94_15 * (var_94_20 / var_94_19)

				if var_94_21 > 0 and var_94_15 < var_94_21 then
					arg_91_1.talkMaxDuration = var_94_21

					if var_94_21 + var_94_14 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_21 + var_94_14
					end
				end

				arg_91_1.text_.text = var_94_18
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431023", "story_v_out_116431.awb") ~= 0 then
					local var_94_22 = manager.audio:GetVoiceLength("story_v_out_116431", "116431023", "story_v_out_116431.awb") / 1000

					if var_94_22 + var_94_14 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_22 + var_94_14
					end

					if var_94_17.prefab_name ~= "" and arg_91_1.actors_[var_94_17.prefab_name] ~= nil then
						local var_94_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_17.prefab_name].transform, "story_v_out_116431", "116431023", "story_v_out_116431.awb")

						arg_91_1:RecordAudio("116431023", var_94_23)
						arg_91_1:RecordAudio("116431023", var_94_23)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_116431", "116431023", "story_v_out_116431.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_116431", "116431023", "story_v_out_116431.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_24 = math.max(var_94_15, arg_91_1.talkMaxDuration)

			if var_94_14 <= arg_91_1.time_ and arg_91_1.time_ < var_94_14 + var_94_24 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_14) / var_94_24

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_14 + var_94_24 and arg_91_1.time_ < var_94_14 + var_94_24 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play116431024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 116431024
		arg_95_1.duration_ = 9.466

		local var_95_0 = {
			zh = 8.5,
			ja = 9.466
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
				arg_95_0:Play116431025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1029ui_story"].transform
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				arg_95_1.var_.moveOldPos1029ui_story = var_98_0.localPosition
			end

			local var_98_2 = 0.001

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2
				local var_98_4 = Vector3.New(0, -1.09, -6.2)

				var_98_0.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1029ui_story, var_98_4, var_98_3)

				local var_98_5 = manager.ui.mainCamera.transform.position - var_98_0.position

				var_98_0.forward = Vector3.New(var_98_5.x, var_98_5.y, var_98_5.z)

				local var_98_6 = var_98_0.localEulerAngles

				var_98_6.z = 0
				var_98_6.x = 0
				var_98_0.localEulerAngles = var_98_6
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 then
				var_98_0.localPosition = Vector3.New(0, -1.09, -6.2)

				local var_98_7 = manager.ui.mainCamera.transform.position - var_98_0.position

				var_98_0.forward = Vector3.New(var_98_7.x, var_98_7.y, var_98_7.z)

				local var_98_8 = var_98_0.localEulerAngles

				var_98_8.z = 0
				var_98_8.x = 0
				var_98_0.localEulerAngles = var_98_8
			end

			local var_98_9 = arg_95_1.actors_["1029ui_story"]
			local var_98_10 = 0

			if var_98_10 < arg_95_1.time_ and arg_95_1.time_ <= var_98_10 + arg_98_0 and arg_95_1.var_.characterEffect1029ui_story == nil then
				arg_95_1.var_.characterEffect1029ui_story = var_98_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_11 = 0.2

			if var_98_10 <= arg_95_1.time_ and arg_95_1.time_ < var_98_10 + var_98_11 then
				local var_98_12 = (arg_95_1.time_ - var_98_10) / var_98_11

				if arg_95_1.var_.characterEffect1029ui_story then
					arg_95_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_95_1.time_ >= var_98_10 + var_98_11 and arg_95_1.time_ < var_98_10 + var_98_11 + arg_98_0 and arg_95_1.var_.characterEffect1029ui_story then
				arg_95_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_98_13 = 0

			if var_98_13 < arg_95_1.time_ and arg_95_1.time_ <= var_98_13 + arg_98_0 then
				arg_95_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_98_14 = 0
			local var_98_15 = 1.075

			if var_98_14 < arg_95_1.time_ and arg_95_1.time_ <= var_98_14 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_16 = arg_95_1:FormatText(StoryNameCfg[319].name)

				arg_95_1.leftNameTxt_.text = var_98_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_17 = arg_95_1:GetWordFromCfg(116431024)
				local var_98_18 = arg_95_1:FormatText(var_98_17.content)

				arg_95_1.text_.text = var_98_18

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_19 = 43
				local var_98_20 = utf8.len(var_98_18)
				local var_98_21 = var_98_19 <= 0 and var_98_15 or var_98_15 * (var_98_20 / var_98_19)

				if var_98_21 > 0 and var_98_15 < var_98_21 then
					arg_95_1.talkMaxDuration = var_98_21

					if var_98_21 + var_98_14 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_21 + var_98_14
					end
				end

				arg_95_1.text_.text = var_98_18
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431024", "story_v_out_116431.awb") ~= 0 then
					local var_98_22 = manager.audio:GetVoiceLength("story_v_out_116431", "116431024", "story_v_out_116431.awb") / 1000

					if var_98_22 + var_98_14 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_22 + var_98_14
					end

					if var_98_17.prefab_name ~= "" and arg_95_1.actors_[var_98_17.prefab_name] ~= nil then
						local var_98_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_17.prefab_name].transform, "story_v_out_116431", "116431024", "story_v_out_116431.awb")

						arg_95_1:RecordAudio("116431024", var_98_23)
						arg_95_1:RecordAudio("116431024", var_98_23)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_116431", "116431024", "story_v_out_116431.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_116431", "116431024", "story_v_out_116431.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_24 = math.max(var_98_15, arg_95_1.talkMaxDuration)

			if var_98_14 <= arg_95_1.time_ and arg_95_1.time_ < var_98_14 + var_98_24 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_14) / var_98_24

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_14 + var_98_24 and arg_95_1.time_ < var_98_14 + var_98_24 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play116431025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 116431025
		arg_99_1.duration_ = 5

		SetActive(arg_99_1.tipsGo_, false)

		function arg_99_1.onSingleLineFinish_()
			arg_99_1.onSingleLineUpdate_ = nil
			arg_99_1.onSingleLineFinish_ = nil
			arg_99_1.state_ = "waiting"
		end

		function arg_99_1.playNext_(arg_101_0)
			if arg_101_0 == 1 then
				arg_99_0:Play116431026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1029ui_story"]
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 and arg_99_1.var_.characterEffect1029ui_story == nil then
				arg_99_1.var_.characterEffect1029ui_story = var_102_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_2 = 0.2

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2

				if arg_99_1.var_.characterEffect1029ui_story then
					local var_102_4 = Mathf.Lerp(0, 0.5, var_102_3)

					arg_99_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_99_1.var_.characterEffect1029ui_story.fillRatio = var_102_4
				end
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 and arg_99_1.var_.characterEffect1029ui_story then
				local var_102_5 = 0.5

				arg_99_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_99_1.var_.characterEffect1029ui_story.fillRatio = var_102_5
			end

			local var_102_6 = 0
			local var_102_7 = 0.075

			if var_102_6 < arg_99_1.time_ and arg_99_1.time_ <= var_102_6 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_8 = arg_99_1:FormatText(StoryNameCfg[7].name)

				arg_99_1.leftNameTxt_.text = var_102_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_9 = arg_99_1:GetWordFromCfg(116431025)
				local var_102_10 = arg_99_1:FormatText(var_102_9.content)

				arg_99_1.text_.text = var_102_10

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_11 = 3
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
				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_14 = math.max(var_102_7, arg_99_1.talkMaxDuration)

			if var_102_6 <= arg_99_1.time_ and arg_99_1.time_ < var_102_6 + var_102_14 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_6) / var_102_14

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_6 + var_102_14 and arg_99_1.time_ < var_102_6 + var_102_14 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play116431026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 116431026
		arg_103_1.duration_ = 1.999999999999

		SetActive(arg_103_1.tipsGo_, false)

		function arg_103_1.onSingleLineFinish_()
			arg_103_1.onSingleLineUpdate_ = nil
			arg_103_1.onSingleLineFinish_ = nil
			arg_103_1.state_ = "waiting"
		end

		function arg_103_1.playNext_(arg_105_0)
			if arg_105_0 == 1 then
				arg_103_0:Play116431027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["1029ui_story"].transform
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1.var_.moveOldPos1029ui_story = var_106_0.localPosition
			end

			local var_106_2 = 0.001

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2
				local var_106_4 = Vector3.New(0, -1.09, -6.2)

				var_106_0.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos1029ui_story, var_106_4, var_106_3)

				local var_106_5 = manager.ui.mainCamera.transform.position - var_106_0.position

				var_106_0.forward = Vector3.New(var_106_5.x, var_106_5.y, var_106_5.z)

				local var_106_6 = var_106_0.localEulerAngles

				var_106_6.z = 0
				var_106_6.x = 0
				var_106_0.localEulerAngles = var_106_6
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 then
				var_106_0.localPosition = Vector3.New(0, -1.09, -6.2)

				local var_106_7 = manager.ui.mainCamera.transform.position - var_106_0.position

				var_106_0.forward = Vector3.New(var_106_7.x, var_106_7.y, var_106_7.z)

				local var_106_8 = var_106_0.localEulerAngles

				var_106_8.z = 0
				var_106_8.x = 0
				var_106_0.localEulerAngles = var_106_8
			end

			local var_106_9 = arg_103_1.actors_["1029ui_story"]
			local var_106_10 = 0

			if var_106_10 < arg_103_1.time_ and arg_103_1.time_ <= var_106_10 + arg_106_0 and arg_103_1.var_.characterEffect1029ui_story == nil then
				arg_103_1.var_.characterEffect1029ui_story = var_106_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_11 = 0.2

			if var_106_10 <= arg_103_1.time_ and arg_103_1.time_ < var_106_10 + var_106_11 then
				local var_106_12 = (arg_103_1.time_ - var_106_10) / var_106_11

				if arg_103_1.var_.characterEffect1029ui_story then
					arg_103_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_103_1.time_ >= var_106_10 + var_106_11 and arg_103_1.time_ < var_106_10 + var_106_11 + arg_106_0 and arg_103_1.var_.characterEffect1029ui_story then
				arg_103_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_106_13 = 0

			if var_106_13 < arg_103_1.time_ and arg_103_1.time_ <= var_106_13 + arg_106_0 then
				arg_103_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_106_14 = 0

			if var_106_14 < arg_103_1.time_ and arg_103_1.time_ <= var_106_14 + arg_106_0 then
				arg_103_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action4_2")
			end

			local var_106_15 = 0
			local var_106_16 = 0.25

			if var_106_15 < arg_103_1.time_ and arg_103_1.time_ <= var_106_15 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_17 = arg_103_1:FormatText(StoryNameCfg[319].name)

				arg_103_1.leftNameTxt_.text = var_106_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_18 = arg_103_1:GetWordFromCfg(116431026)
				local var_106_19 = arg_103_1:FormatText(var_106_18.content)

				arg_103_1.text_.text = var_106_19

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_20 = 10
				local var_106_21 = utf8.len(var_106_19)
				local var_106_22 = var_106_20 <= 0 and var_106_16 or var_106_16 * (var_106_21 / var_106_20)

				if var_106_22 > 0 and var_106_16 < var_106_22 then
					arg_103_1.talkMaxDuration = var_106_22

					if var_106_22 + var_106_15 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_22 + var_106_15
					end
				end

				arg_103_1.text_.text = var_106_19
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431026", "story_v_out_116431.awb") ~= 0 then
					local var_106_23 = manager.audio:GetVoiceLength("story_v_out_116431", "116431026", "story_v_out_116431.awb") / 1000

					if var_106_23 + var_106_15 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_23 + var_106_15
					end

					if var_106_18.prefab_name ~= "" and arg_103_1.actors_[var_106_18.prefab_name] ~= nil then
						local var_106_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_18.prefab_name].transform, "story_v_out_116431", "116431026", "story_v_out_116431.awb")

						arg_103_1:RecordAudio("116431026", var_106_24)
						arg_103_1:RecordAudio("116431026", var_106_24)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_116431", "116431026", "story_v_out_116431.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_116431", "116431026", "story_v_out_116431.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_25 = math.max(var_106_16, arg_103_1.talkMaxDuration)

			if var_106_15 <= arg_103_1.time_ and arg_103_1.time_ < var_106_15 + var_106_25 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_15) / var_106_25

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_15 + var_106_25 and arg_103_1.time_ < var_106_15 + var_106_25 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play116431027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 116431027
		arg_107_1.duration_ = 5

		SetActive(arg_107_1.tipsGo_, false)

		function arg_107_1.onSingleLineFinish_()
			arg_107_1.onSingleLineUpdate_ = nil
			arg_107_1.onSingleLineFinish_ = nil
			arg_107_1.state_ = "waiting"
		end

		function arg_107_1.playNext_(arg_109_0)
			if arg_109_0 == 1 then
				arg_107_0:Play116431028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1029ui_story"]
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 and arg_107_1.var_.characterEffect1029ui_story == nil then
				arg_107_1.var_.characterEffect1029ui_story = var_110_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_2 = 0.2

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2

				if arg_107_1.var_.characterEffect1029ui_story then
					local var_110_4 = Mathf.Lerp(0, 0.5, var_110_3)

					arg_107_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_107_1.var_.characterEffect1029ui_story.fillRatio = var_110_4
				end
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 and arg_107_1.var_.characterEffect1029ui_story then
				local var_110_5 = 0.5

				arg_107_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_107_1.var_.characterEffect1029ui_story.fillRatio = var_110_5
			end

			local var_110_6 = 0
			local var_110_7 = 0.85

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

				local var_110_9 = arg_107_1:GetWordFromCfg(116431027)
				local var_110_10 = arg_107_1:FormatText(var_110_9.content)

				arg_107_1.text_.text = var_110_10

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_11 = 34
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
	Play116431028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 116431028
		arg_111_1.duration_ = 7.066

		local var_111_0 = {
			zh = 5.2,
			ja = 7.066
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
				arg_111_0:Play116431029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["1029ui_story"].transform
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 then
				arg_111_1.var_.moveOldPos1029ui_story = var_114_0.localPosition
			end

			local var_114_2 = 0.001

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2
				local var_114_4 = Vector3.New(0, -1.09, -6.2)

				var_114_0.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos1029ui_story, var_114_4, var_114_3)

				local var_114_5 = manager.ui.mainCamera.transform.position - var_114_0.position

				var_114_0.forward = Vector3.New(var_114_5.x, var_114_5.y, var_114_5.z)

				local var_114_6 = var_114_0.localEulerAngles

				var_114_6.z = 0
				var_114_6.x = 0
				var_114_0.localEulerAngles = var_114_6
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 then
				var_114_0.localPosition = Vector3.New(0, -1.09, -6.2)

				local var_114_7 = manager.ui.mainCamera.transform.position - var_114_0.position

				var_114_0.forward = Vector3.New(var_114_7.x, var_114_7.y, var_114_7.z)

				local var_114_8 = var_114_0.localEulerAngles

				var_114_8.z = 0
				var_114_8.x = 0
				var_114_0.localEulerAngles = var_114_8
			end

			local var_114_9 = arg_111_1.actors_["1029ui_story"]
			local var_114_10 = 0

			if var_114_10 < arg_111_1.time_ and arg_111_1.time_ <= var_114_10 + arg_114_0 and arg_111_1.var_.characterEffect1029ui_story == nil then
				arg_111_1.var_.characterEffect1029ui_story = var_114_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_11 = 0.2

			if var_114_10 <= arg_111_1.time_ and arg_111_1.time_ < var_114_10 + var_114_11 then
				local var_114_12 = (arg_111_1.time_ - var_114_10) / var_114_11

				if arg_111_1.var_.characterEffect1029ui_story then
					arg_111_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_111_1.time_ >= var_114_10 + var_114_11 and arg_111_1.time_ < var_114_10 + var_114_11 + arg_114_0 and arg_111_1.var_.characterEffect1029ui_story then
				arg_111_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_114_13 = 0

			if var_114_13 < arg_111_1.time_ and arg_111_1.time_ <= var_114_13 + arg_114_0 then
				arg_111_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_114_14 = 0
			local var_114_15 = 0.525

			if var_114_14 < arg_111_1.time_ and arg_111_1.time_ <= var_114_14 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_16 = arg_111_1:FormatText(StoryNameCfg[319].name)

				arg_111_1.leftNameTxt_.text = var_114_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_17 = arg_111_1:GetWordFromCfg(116431028)
				local var_114_18 = arg_111_1:FormatText(var_114_17.content)

				arg_111_1.text_.text = var_114_18

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_19 = 21
				local var_114_20 = utf8.len(var_114_18)
				local var_114_21 = var_114_19 <= 0 and var_114_15 or var_114_15 * (var_114_20 / var_114_19)

				if var_114_21 > 0 and var_114_15 < var_114_21 then
					arg_111_1.talkMaxDuration = var_114_21

					if var_114_21 + var_114_14 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_21 + var_114_14
					end
				end

				arg_111_1.text_.text = var_114_18
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431028", "story_v_out_116431.awb") ~= 0 then
					local var_114_22 = manager.audio:GetVoiceLength("story_v_out_116431", "116431028", "story_v_out_116431.awb") / 1000

					if var_114_22 + var_114_14 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_22 + var_114_14
					end

					if var_114_17.prefab_name ~= "" and arg_111_1.actors_[var_114_17.prefab_name] ~= nil then
						local var_114_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_17.prefab_name].transform, "story_v_out_116431", "116431028", "story_v_out_116431.awb")

						arg_111_1:RecordAudio("116431028", var_114_23)
						arg_111_1:RecordAudio("116431028", var_114_23)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_116431", "116431028", "story_v_out_116431.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_116431", "116431028", "story_v_out_116431.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_24 = math.max(var_114_15, arg_111_1.talkMaxDuration)

			if var_114_14 <= arg_111_1.time_ and arg_111_1.time_ < var_114_14 + var_114_24 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_14) / var_114_24

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_14 + var_114_24 and arg_111_1.time_ < var_114_14 + var_114_24 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play116431029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 116431029
		arg_115_1.duration_ = 5

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play116431030(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["1029ui_story"]
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 and arg_115_1.var_.characterEffect1029ui_story == nil then
				arg_115_1.var_.characterEffect1029ui_story = var_118_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_2 = 0.2

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_2 then
				local var_118_3 = (arg_115_1.time_ - var_118_1) / var_118_2

				if arg_115_1.var_.characterEffect1029ui_story then
					local var_118_4 = Mathf.Lerp(0, 0.5, var_118_3)

					arg_115_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_115_1.var_.characterEffect1029ui_story.fillRatio = var_118_4
				end
			end

			if arg_115_1.time_ >= var_118_1 + var_118_2 and arg_115_1.time_ < var_118_1 + var_118_2 + arg_118_0 and arg_115_1.var_.characterEffect1029ui_story then
				local var_118_5 = 0.5

				arg_115_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_115_1.var_.characterEffect1029ui_story.fillRatio = var_118_5
			end

			local var_118_6 = 0
			local var_118_7 = 0.425

			if var_118_6 < arg_115_1.time_ and arg_115_1.time_ <= var_118_6 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_8 = arg_115_1:FormatText(StoryNameCfg[7].name)

				arg_115_1.leftNameTxt_.text = var_118_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_9 = arg_115_1:GetWordFromCfg(116431029)
				local var_118_10 = arg_115_1:FormatText(var_118_9.content)

				arg_115_1.text_.text = var_118_10

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_11 = 17
				local var_118_12 = utf8.len(var_118_10)
				local var_118_13 = var_118_11 <= 0 and var_118_7 or var_118_7 * (var_118_12 / var_118_11)

				if var_118_13 > 0 and var_118_7 < var_118_13 then
					arg_115_1.talkMaxDuration = var_118_13

					if var_118_13 + var_118_6 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_13 + var_118_6
					end
				end

				arg_115_1.text_.text = var_118_10
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)
				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_14 = math.max(var_118_7, arg_115_1.talkMaxDuration)

			if var_118_6 <= arg_115_1.time_ and arg_115_1.time_ < var_118_6 + var_118_14 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_6) / var_118_14

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_6 + var_118_14 and arg_115_1.time_ < var_118_6 + var_118_14 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play116431030 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 116431030
		arg_119_1.duration_ = 2.966

		local var_119_0 = {
			zh = 2.966,
			ja = 2.6
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
				arg_119_0:Play116431031(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["1029ui_story"].transform
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 then
				arg_119_1.var_.moveOldPos1029ui_story = var_122_0.localPosition
			end

			local var_122_2 = 0.001

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2
				local var_122_4 = Vector3.New(0, -1.09, -6.2)

				var_122_0.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos1029ui_story, var_122_4, var_122_3)

				local var_122_5 = manager.ui.mainCamera.transform.position - var_122_0.position

				var_122_0.forward = Vector3.New(var_122_5.x, var_122_5.y, var_122_5.z)

				local var_122_6 = var_122_0.localEulerAngles

				var_122_6.z = 0
				var_122_6.x = 0
				var_122_0.localEulerAngles = var_122_6
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 then
				var_122_0.localPosition = Vector3.New(0, -1.09, -6.2)

				local var_122_7 = manager.ui.mainCamera.transform.position - var_122_0.position

				var_122_0.forward = Vector3.New(var_122_7.x, var_122_7.y, var_122_7.z)

				local var_122_8 = var_122_0.localEulerAngles

				var_122_8.z = 0
				var_122_8.x = 0
				var_122_0.localEulerAngles = var_122_8
			end

			local var_122_9 = arg_119_1.actors_["1029ui_story"]
			local var_122_10 = 0

			if var_122_10 < arg_119_1.time_ and arg_119_1.time_ <= var_122_10 + arg_122_0 and arg_119_1.var_.characterEffect1029ui_story == nil then
				arg_119_1.var_.characterEffect1029ui_story = var_122_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_11 = 0.2

			if var_122_10 <= arg_119_1.time_ and arg_119_1.time_ < var_122_10 + var_122_11 then
				local var_122_12 = (arg_119_1.time_ - var_122_10) / var_122_11

				if arg_119_1.var_.characterEffect1029ui_story then
					arg_119_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_119_1.time_ >= var_122_10 + var_122_11 and arg_119_1.time_ < var_122_10 + var_122_11 + arg_122_0 and arg_119_1.var_.characterEffect1029ui_story then
				arg_119_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_122_13 = 0

			if var_122_13 < arg_119_1.time_ and arg_119_1.time_ <= var_122_13 + arg_122_0 then
				arg_119_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action6_1")
			end

			local var_122_14 = 0

			if var_122_14 < arg_119_1.time_ and arg_119_1.time_ <= var_122_14 + arg_122_0 then
				arg_119_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_122_15 = 0
			local var_122_16 = 0.25

			if var_122_15 < arg_119_1.time_ and arg_119_1.time_ <= var_122_15 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_17 = arg_119_1:FormatText(StoryNameCfg[319].name)

				arg_119_1.leftNameTxt_.text = var_122_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_18 = arg_119_1:GetWordFromCfg(116431030)
				local var_122_19 = arg_119_1:FormatText(var_122_18.content)

				arg_119_1.text_.text = var_122_19

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_20 = 10
				local var_122_21 = utf8.len(var_122_19)
				local var_122_22 = var_122_20 <= 0 and var_122_16 or var_122_16 * (var_122_21 / var_122_20)

				if var_122_22 > 0 and var_122_16 < var_122_22 then
					arg_119_1.talkMaxDuration = var_122_22

					if var_122_22 + var_122_15 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_22 + var_122_15
					end
				end

				arg_119_1.text_.text = var_122_19
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431030", "story_v_out_116431.awb") ~= 0 then
					local var_122_23 = manager.audio:GetVoiceLength("story_v_out_116431", "116431030", "story_v_out_116431.awb") / 1000

					if var_122_23 + var_122_15 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_23 + var_122_15
					end

					if var_122_18.prefab_name ~= "" and arg_119_1.actors_[var_122_18.prefab_name] ~= nil then
						local var_122_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_18.prefab_name].transform, "story_v_out_116431", "116431030", "story_v_out_116431.awb")

						arg_119_1:RecordAudio("116431030", var_122_24)
						arg_119_1:RecordAudio("116431030", var_122_24)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_116431", "116431030", "story_v_out_116431.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_116431", "116431030", "story_v_out_116431.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_25 = math.max(var_122_16, arg_119_1.talkMaxDuration)

			if var_122_15 <= arg_119_1.time_ and arg_119_1.time_ < var_122_15 + var_122_25 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_15) / var_122_25

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_15 + var_122_25 and arg_119_1.time_ < var_122_15 + var_122_25 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play116431031 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 116431031
		arg_123_1.duration_ = 5

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play116431032(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["1029ui_story"]
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 and arg_123_1.var_.characterEffect1029ui_story == nil then
				arg_123_1.var_.characterEffect1029ui_story = var_126_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_2 = 0.2

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2

				if arg_123_1.var_.characterEffect1029ui_story then
					local var_126_4 = Mathf.Lerp(0, 0.5, var_126_3)

					arg_123_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_123_1.var_.characterEffect1029ui_story.fillRatio = var_126_4
				end
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 and arg_123_1.var_.characterEffect1029ui_story then
				local var_126_5 = 0.5

				arg_123_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_123_1.var_.characterEffect1029ui_story.fillRatio = var_126_5
			end

			local var_126_6 = 0
			local var_126_7 = 0.675

			if var_126_6 < arg_123_1.time_ and arg_123_1.time_ <= var_126_6 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_8 = arg_123_1:FormatText(StoryNameCfg[7].name)

				arg_123_1.leftNameTxt_.text = var_126_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_9 = arg_123_1:GetWordFromCfg(116431031)
				local var_126_10 = arg_123_1:FormatText(var_126_9.content)

				arg_123_1.text_.text = var_126_10

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_11 = 27
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
				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_14 = math.max(var_126_7, arg_123_1.talkMaxDuration)

			if var_126_6 <= arg_123_1.time_ and arg_123_1.time_ < var_126_6 + var_126_14 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_6) / var_126_14

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_6 + var_126_14 and arg_123_1.time_ < var_126_6 + var_126_14 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play116431032 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 116431032
		arg_127_1.duration_ = 7.133

		local var_127_0 = {
			zh = 5.5,
			ja = 7.133
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
				arg_127_0:Play116431033(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = "ST02"

			if arg_127_1.bgs_[var_130_0] == nil then
				local var_130_1 = Object.Instantiate(arg_127_1.paintGo_)

				var_130_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_130_0)
				var_130_1.name = var_130_0
				var_130_1.transform.parent = arg_127_1.stage_.transform
				var_130_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_127_1.bgs_[var_130_0] = var_130_1
			end

			local var_130_2 = 2

			if var_130_2 < arg_127_1.time_ and arg_127_1.time_ <= var_130_2 + arg_130_0 then
				local var_130_3 = manager.ui.mainCamera.transform.localPosition
				local var_130_4 = Vector3.New(0, 0, 10) + Vector3.New(var_130_3.x, var_130_3.y, 0)
				local var_130_5 = arg_127_1.bgs_.ST02

				var_130_5.transform.localPosition = var_130_4
				var_130_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_130_6 = var_130_5:GetComponent("SpriteRenderer")

				if var_130_6 and var_130_6.sprite then
					local var_130_7 = (var_130_5.transform.localPosition - var_130_3).z
					local var_130_8 = manager.ui.mainCameraCom_
					local var_130_9 = 2 * var_130_7 * Mathf.Tan(var_130_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_130_10 = var_130_9 * var_130_8.aspect
					local var_130_11 = var_130_6.sprite.bounds.size.x
					local var_130_12 = var_130_6.sprite.bounds.size.y
					local var_130_13 = var_130_10 / var_130_11
					local var_130_14 = var_130_9 / var_130_12
					local var_130_15 = var_130_14 < var_130_13 and var_130_13 or var_130_14

					var_130_5.transform.localScale = Vector3.New(var_130_15, var_130_15, 0)
				end

				for iter_130_0, iter_130_1 in pairs(arg_127_1.bgs_) do
					if iter_130_0 ~= "ST02" then
						iter_130_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_130_16 = 0

			if var_130_16 < arg_127_1.time_ and arg_127_1.time_ <= var_130_16 + arg_130_0 then
				arg_127_1.mask_.enabled = true
				arg_127_1.mask_.raycastTarget = true

				arg_127_1:SetGaussion(false)
			end

			local var_130_17 = 2

			if var_130_16 <= arg_127_1.time_ and arg_127_1.time_ < var_130_16 + var_130_17 then
				local var_130_18 = (arg_127_1.time_ - var_130_16) / var_130_17
				local var_130_19 = Color.New(0, 0, 0)

				var_130_19.a = Mathf.Lerp(0, 1, var_130_18)
				arg_127_1.mask_.color = var_130_19
			end

			if arg_127_1.time_ >= var_130_16 + var_130_17 and arg_127_1.time_ < var_130_16 + var_130_17 + arg_130_0 then
				local var_130_20 = Color.New(0, 0, 0)

				var_130_20.a = 1
				arg_127_1.mask_.color = var_130_20
			end

			local var_130_21 = 2

			if var_130_21 < arg_127_1.time_ and arg_127_1.time_ <= var_130_21 + arg_130_0 then
				arg_127_1.mask_.enabled = true
				arg_127_1.mask_.raycastTarget = true

				arg_127_1:SetGaussion(false)
			end

			local var_130_22 = 2

			if var_130_21 <= arg_127_1.time_ and arg_127_1.time_ < var_130_21 + var_130_22 then
				local var_130_23 = (arg_127_1.time_ - var_130_21) / var_130_22
				local var_130_24 = Color.New(0, 0, 0)

				var_130_24.a = Mathf.Lerp(1, 0, var_130_23)
				arg_127_1.mask_.color = var_130_24
			end

			if arg_127_1.time_ >= var_130_21 + var_130_22 and arg_127_1.time_ < var_130_21 + var_130_22 + arg_130_0 then
				local var_130_25 = Color.New(0, 0, 0)
				local var_130_26 = 0

				arg_127_1.mask_.enabled = false
				var_130_25.a = var_130_26
				arg_127_1.mask_.color = var_130_25
			end

			local var_130_27 = arg_127_1.actors_["1029ui_story"].transform
			local var_130_28 = 2

			if var_130_28 < arg_127_1.time_ and arg_127_1.time_ <= var_130_28 + arg_130_0 then
				arg_127_1.var_.moveOldPos1029ui_story = var_130_27.localPosition
			end

			local var_130_29 = 0.001

			if var_130_28 <= arg_127_1.time_ and arg_127_1.time_ < var_130_28 + var_130_29 then
				local var_130_30 = (arg_127_1.time_ - var_130_28) / var_130_29
				local var_130_31 = Vector3.New(0, 100, 0)

				var_130_27.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos1029ui_story, var_130_31, var_130_30)

				local var_130_32 = manager.ui.mainCamera.transform.position - var_130_27.position

				var_130_27.forward = Vector3.New(var_130_32.x, var_130_32.y, var_130_32.z)

				local var_130_33 = var_130_27.localEulerAngles

				var_130_33.z = 0
				var_130_33.x = 0
				var_130_27.localEulerAngles = var_130_33
			end

			if arg_127_1.time_ >= var_130_28 + var_130_29 and arg_127_1.time_ < var_130_28 + var_130_29 + arg_130_0 then
				var_130_27.localPosition = Vector3.New(0, 100, 0)

				local var_130_34 = manager.ui.mainCamera.transform.position - var_130_27.position

				var_130_27.forward = Vector3.New(var_130_34.x, var_130_34.y, var_130_34.z)

				local var_130_35 = var_130_27.localEulerAngles

				var_130_35.z = 0
				var_130_35.x = 0
				var_130_27.localEulerAngles = var_130_35
			end

			local var_130_36 = 0
			local var_130_37 = 0.666666666666667

			if var_130_36 < arg_127_1.time_ and arg_127_1.time_ <= var_130_36 + arg_130_0 then
				local var_130_38 = "play"
				local var_130_39 = "music"

				arg_127_1:AudioAction(var_130_38, var_130_39, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_130_40 = 0.866666666666667
			local var_130_41 = 1.13333333333333

			if var_130_40 < arg_127_1.time_ and arg_127_1.time_ <= var_130_40 + arg_130_0 then
				local var_130_42 = "play"
				local var_130_43 = "music"

				arg_127_1:AudioAction(var_130_42, var_130_43, "bgm_side_daily03", "bgm_side_daily03", "bgm_side_daily03.awb")
			end

			local var_130_44 = 0

			if var_130_44 < arg_127_1.time_ and arg_127_1.time_ <= var_130_44 + arg_130_0 then
				arg_127_1.allBtn_.enabled = false
			end

			local var_130_45 = 4.225

			if arg_127_1.time_ >= var_130_44 + var_130_45 and arg_127_1.time_ < var_130_44 + var_130_45 + arg_130_0 then
				arg_127_1.allBtn_.enabled = true
			end

			if arg_127_1.frameCnt_ <= 1 then
				arg_127_1.dialog_:SetActive(false)
			end

			local var_130_46 = 4
			local var_130_47 = 0.225

			if var_130_46 < arg_127_1.time_ and arg_127_1.time_ <= var_130_46 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0

				arg_127_1.dialog_:SetActive(true)

				local var_130_48 = LeanTween.value(arg_127_1.dialog_, 0, 1, 0.3)

				var_130_48:setOnUpdate(LuaHelper.FloatAction(function(arg_131_0)
					arg_127_1.dialogCg_.alpha = arg_131_0
				end))
				var_130_48:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_127_1.dialog_)
					var_130_48:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_127_1.duration_ = arg_127_1.duration_ + 0.3

				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_49 = arg_127_1:FormatText(StoryNameCfg[6].name)

				arg_127_1.leftNameTxt_.text = var_130_49

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, true)
				arg_127_1.iconController_:SetSelectedState("hero")

				arg_127_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1084")

				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_50 = arg_127_1:GetWordFromCfg(116431032)
				local var_130_51 = arg_127_1:FormatText(var_130_50.content)

				arg_127_1.text_.text = var_130_51

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_52 = 9
				local var_130_53 = utf8.len(var_130_51)
				local var_130_54 = var_130_52 <= 0 and var_130_47 or var_130_47 * (var_130_53 / var_130_52)

				if var_130_54 > 0 and var_130_47 < var_130_54 then
					arg_127_1.talkMaxDuration = var_130_54
					var_130_46 = var_130_46 + 0.3

					if var_130_54 + var_130_46 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_54 + var_130_46
					end
				end

				arg_127_1.text_.text = var_130_51
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431032", "story_v_out_116431.awb") ~= 0 then
					local var_130_55 = manager.audio:GetVoiceLength("story_v_out_116431", "116431032", "story_v_out_116431.awb") / 1000

					if var_130_55 + var_130_46 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_55 + var_130_46
					end

					if var_130_50.prefab_name ~= "" and arg_127_1.actors_[var_130_50.prefab_name] ~= nil then
						local var_130_56 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_50.prefab_name].transform, "story_v_out_116431", "116431032", "story_v_out_116431.awb")

						arg_127_1:RecordAudio("116431032", var_130_56)
						arg_127_1:RecordAudio("116431032", var_130_56)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_116431", "116431032", "story_v_out_116431.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_116431", "116431032", "story_v_out_116431.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_57 = var_130_46 + 0.3
			local var_130_58 = math.max(var_130_47, arg_127_1.talkMaxDuration)

			if var_130_57 <= arg_127_1.time_ and arg_127_1.time_ < var_130_57 + var_130_58 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_57) / var_130_58

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_57 + var_130_58 and arg_127_1.time_ < var_130_57 + var_130_58 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play116431033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 116431033
		arg_133_1.duration_ = 5

		SetActive(arg_133_1.tipsGo_, false)

		function arg_133_1.onSingleLineFinish_()
			arg_133_1.onSingleLineUpdate_ = nil
			arg_133_1.onSingleLineFinish_ = nil
			arg_133_1.state_ = "waiting"
		end

		function arg_133_1.playNext_(arg_135_0)
			if arg_135_0 == 1 then
				arg_133_0:Play116431034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = 0
			local var_136_1 = 1.025

			if var_136_0 < arg_133_1.time_ and arg_133_1.time_ <= var_136_0 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, false)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_2 = arg_133_1:GetWordFromCfg(116431033)
				local var_136_3 = arg_133_1:FormatText(var_136_2.content)

				arg_133_1.text_.text = var_136_3

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_4 = 41
				local var_136_5 = utf8.len(var_136_3)
				local var_136_6 = var_136_4 <= 0 and var_136_1 or var_136_1 * (var_136_5 / var_136_4)

				if var_136_6 > 0 and var_136_1 < var_136_6 then
					arg_133_1.talkMaxDuration = var_136_6

					if var_136_6 + var_136_0 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_6 + var_136_0
					end
				end

				arg_133_1.text_.text = var_136_3
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)
				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_7 = math.max(var_136_1, arg_133_1.talkMaxDuration)

			if var_136_0 <= arg_133_1.time_ and arg_133_1.time_ < var_136_0 + var_136_7 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_0) / var_136_7

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_0 + var_136_7 and arg_133_1.time_ < var_136_0 + var_136_7 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play116431034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 116431034
		arg_137_1.duration_ = 5

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play116431035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = 0
			local var_140_1 = 1.3

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

				local var_140_2 = arg_137_1:GetWordFromCfg(116431034)
				local var_140_3 = arg_137_1:FormatText(var_140_2.content)

				arg_137_1.text_.text = var_140_3

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_4 = 52
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
	Play116431035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 116431035
		arg_141_1.duration_ = 9.833

		local var_141_0 = {
			zh = 5.1,
			ja = 9.833
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
				arg_141_0:Play116431036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = "1084ui_story"

			if arg_141_1.actors_[var_144_0] == nil then
				local var_144_1 = Object.Instantiate(Asset.Load("Char/" .. var_144_0), arg_141_1.stage_.transform)

				var_144_1.name = var_144_0
				var_144_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_141_1.actors_[var_144_0] = var_144_1

				local var_144_2 = var_144_1:GetComponentInChildren(typeof(CharacterEffect))

				var_144_2.enabled = true

				local var_144_3 = GameObjectTools.GetOrAddComponent(var_144_1, typeof(DynamicBoneHelper))

				if var_144_3 then
					var_144_3:EnableDynamicBone(false)
				end

				arg_141_1:ShowWeapon(var_144_2.transform, false)

				arg_141_1.var_[var_144_0 .. "Animator"] = var_144_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_141_1.var_[var_144_0 .. "Animator"].applyRootMotion = true
				arg_141_1.var_[var_144_0 .. "LipSync"] = var_144_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_144_4 = arg_141_1.actors_["1084ui_story"]
			local var_144_5 = 0

			if var_144_5 < arg_141_1.time_ and arg_141_1.time_ <= var_144_5 + arg_144_0 and arg_141_1.var_.characterEffect1084ui_story == nil then
				arg_141_1.var_.characterEffect1084ui_story = var_144_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_6 = 0.2

			if var_144_5 <= arg_141_1.time_ and arg_141_1.time_ < var_144_5 + var_144_6 then
				local var_144_7 = (arg_141_1.time_ - var_144_5) / var_144_6

				if arg_141_1.var_.characterEffect1084ui_story then
					arg_141_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_141_1.time_ >= var_144_5 + var_144_6 and arg_141_1.time_ < var_144_5 + var_144_6 + arg_144_0 and arg_141_1.var_.characterEffect1084ui_story then
				arg_141_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_144_8 = "1011ui_story"

			if arg_141_1.actors_[var_144_8] == nil then
				local var_144_9 = Object.Instantiate(Asset.Load("Char/" .. var_144_8), arg_141_1.stage_.transform)

				var_144_9.name = var_144_8
				var_144_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_141_1.actors_[var_144_8] = var_144_9

				local var_144_10 = var_144_9:GetComponentInChildren(typeof(CharacterEffect))

				var_144_10.enabled = true

				local var_144_11 = GameObjectTools.GetOrAddComponent(var_144_9, typeof(DynamicBoneHelper))

				if var_144_11 then
					var_144_11:EnableDynamicBone(false)
				end

				arg_141_1:ShowWeapon(var_144_10.transform, false)

				arg_141_1.var_[var_144_8 .. "Animator"] = var_144_10.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_141_1.var_[var_144_8 .. "Animator"].applyRootMotion = true
				arg_141_1.var_[var_144_8 .. "LipSync"] = var_144_10.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_144_12 = arg_141_1.actors_["1011ui_story"]
			local var_144_13 = 0

			if var_144_13 < arg_141_1.time_ and arg_141_1.time_ <= var_144_13 + arg_144_0 and arg_141_1.var_.characterEffect1011ui_story == nil then
				arg_141_1.var_.characterEffect1011ui_story = var_144_12:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_14 = 0.0166666666666667

			if var_144_13 <= arg_141_1.time_ and arg_141_1.time_ < var_144_13 + var_144_14 then
				local var_144_15 = (arg_141_1.time_ - var_144_13) / var_144_14

				if arg_141_1.var_.characterEffect1011ui_story then
					local var_144_16 = Mathf.Lerp(0, 0.5, var_144_15)

					arg_141_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_141_1.var_.characterEffect1011ui_story.fillRatio = var_144_16
				end
			end

			if arg_141_1.time_ >= var_144_13 + var_144_14 and arg_141_1.time_ < var_144_13 + var_144_14 + arg_144_0 and arg_141_1.var_.characterEffect1011ui_story then
				local var_144_17 = 0.5

				arg_141_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_141_1.var_.characterEffect1011ui_story.fillRatio = var_144_17
			end

			local var_144_18 = 0

			if var_144_18 < arg_141_1.time_ and arg_141_1.time_ <= var_144_18 + arg_144_0 then
				arg_141_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action8_1")
			end

			local var_144_19 = 0

			if var_144_19 < arg_141_1.time_ and arg_141_1.time_ <= var_144_19 + arg_144_0 then
				arg_141_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_144_20 = arg_141_1.actors_["1011ui_story"].transform
			local var_144_21 = 0

			if var_144_21 < arg_141_1.time_ and arg_141_1.time_ <= var_144_21 + arg_144_0 then
				arg_141_1.var_.moveOldPos1011ui_story = var_144_20.localPosition
			end

			local var_144_22 = 0.001

			if var_144_21 <= arg_141_1.time_ and arg_141_1.time_ < var_144_21 + var_144_22 then
				local var_144_23 = (arg_141_1.time_ - var_144_21) / var_144_22
				local var_144_24 = Vector3.New(0.7, -0.71, -6)

				var_144_20.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos1011ui_story, var_144_24, var_144_23)

				local var_144_25 = manager.ui.mainCamera.transform.position - var_144_20.position

				var_144_20.forward = Vector3.New(var_144_25.x, var_144_25.y, var_144_25.z)

				local var_144_26 = var_144_20.localEulerAngles

				var_144_26.z = 0
				var_144_26.x = 0
				var_144_20.localEulerAngles = var_144_26
			end

			if arg_141_1.time_ >= var_144_21 + var_144_22 and arg_141_1.time_ < var_144_21 + var_144_22 + arg_144_0 then
				var_144_20.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_144_27 = manager.ui.mainCamera.transform.position - var_144_20.position

				var_144_20.forward = Vector3.New(var_144_27.x, var_144_27.y, var_144_27.z)

				local var_144_28 = var_144_20.localEulerAngles

				var_144_28.z = 0
				var_144_28.x = 0
				var_144_20.localEulerAngles = var_144_28
			end

			local var_144_29 = arg_141_1.actors_["1084ui_story"].transform
			local var_144_30 = 0

			if var_144_30 < arg_141_1.time_ and arg_141_1.time_ <= var_144_30 + arg_144_0 then
				arg_141_1.var_.moveOldPos1084ui_story = var_144_29.localPosition
			end

			local var_144_31 = 0.001

			if var_144_30 <= arg_141_1.time_ and arg_141_1.time_ < var_144_30 + var_144_31 then
				local var_144_32 = (arg_141_1.time_ - var_144_30) / var_144_31
				local var_144_33 = Vector3.New(-0.7, -0.97, -6)

				var_144_29.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos1084ui_story, var_144_33, var_144_32)

				local var_144_34 = manager.ui.mainCamera.transform.position - var_144_29.position

				var_144_29.forward = Vector3.New(var_144_34.x, var_144_34.y, var_144_34.z)

				local var_144_35 = var_144_29.localEulerAngles

				var_144_35.z = 0
				var_144_35.x = 0
				var_144_29.localEulerAngles = var_144_35
			end

			if arg_141_1.time_ >= var_144_30 + var_144_31 and arg_141_1.time_ < var_144_30 + var_144_31 + arg_144_0 then
				var_144_29.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_144_36 = manager.ui.mainCamera.transform.position - var_144_29.position

				var_144_29.forward = Vector3.New(var_144_36.x, var_144_36.y, var_144_36.z)

				local var_144_37 = var_144_29.localEulerAngles

				var_144_37.z = 0
				var_144_37.x = 0
				var_144_29.localEulerAngles = var_144_37
			end

			local var_144_38 = 0
			local var_144_39 = 0.65

			if var_144_38 < arg_141_1.time_ and arg_141_1.time_ <= var_144_38 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_40 = arg_141_1:FormatText(StoryNameCfg[6].name)

				arg_141_1.leftNameTxt_.text = var_144_40

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_41 = arg_141_1:GetWordFromCfg(116431035)
				local var_144_42 = arg_141_1:FormatText(var_144_41.content)

				arg_141_1.text_.text = var_144_42

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_43 = 26
				local var_144_44 = utf8.len(var_144_42)
				local var_144_45 = var_144_43 <= 0 and var_144_39 or var_144_39 * (var_144_44 / var_144_43)

				if var_144_45 > 0 and var_144_39 < var_144_45 then
					arg_141_1.talkMaxDuration = var_144_45

					if var_144_45 + var_144_38 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_45 + var_144_38
					end
				end

				arg_141_1.text_.text = var_144_42
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431035", "story_v_out_116431.awb") ~= 0 then
					local var_144_46 = manager.audio:GetVoiceLength("story_v_out_116431", "116431035", "story_v_out_116431.awb") / 1000

					if var_144_46 + var_144_38 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_46 + var_144_38
					end

					if var_144_41.prefab_name ~= "" and arg_141_1.actors_[var_144_41.prefab_name] ~= nil then
						local var_144_47 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_41.prefab_name].transform, "story_v_out_116431", "116431035", "story_v_out_116431.awb")

						arg_141_1:RecordAudio("116431035", var_144_47)
						arg_141_1:RecordAudio("116431035", var_144_47)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_116431", "116431035", "story_v_out_116431.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_116431", "116431035", "story_v_out_116431.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_48 = math.max(var_144_39, arg_141_1.talkMaxDuration)

			if var_144_38 <= arg_141_1.time_ and arg_141_1.time_ < var_144_38 + var_144_48 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_38) / var_144_48

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_38 + var_144_48 and arg_141_1.time_ < var_144_38 + var_144_48 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play116431036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 116431036
		arg_145_1.duration_ = 5

		SetActive(arg_145_1.tipsGo_, false)

		function arg_145_1.onSingleLineFinish_()
			arg_145_1.onSingleLineUpdate_ = nil
			arg_145_1.onSingleLineFinish_ = nil
			arg_145_1.state_ = "waiting"
		end

		function arg_145_1.playNext_(arg_147_0)
			if arg_147_0 == 1 then
				arg_145_0:Play116431037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["1084ui_story"]
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 and arg_145_1.var_.characterEffect1084ui_story == nil then
				arg_145_1.var_.characterEffect1084ui_story = var_148_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_2 = 0.2

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_2 then
				local var_148_3 = (arg_145_1.time_ - var_148_1) / var_148_2

				if arg_145_1.var_.characterEffect1084ui_story then
					local var_148_4 = Mathf.Lerp(0, 0.5, var_148_3)

					arg_145_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_145_1.var_.characterEffect1084ui_story.fillRatio = var_148_4
				end
			end

			if arg_145_1.time_ >= var_148_1 + var_148_2 and arg_145_1.time_ < var_148_1 + var_148_2 + arg_148_0 and arg_145_1.var_.characterEffect1084ui_story then
				local var_148_5 = 0.5

				arg_145_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_145_1.var_.characterEffect1084ui_story.fillRatio = var_148_5
			end

			local var_148_6 = 0
			local var_148_7 = 0.375

			if var_148_6 < arg_145_1.time_ and arg_145_1.time_ <= var_148_6 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_8 = arg_145_1:FormatText(StoryNameCfg[7].name)

				arg_145_1.leftNameTxt_.text = var_148_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_9 = arg_145_1:GetWordFromCfg(116431036)
				local var_148_10 = arg_145_1:FormatText(var_148_9.content)

				arg_145_1.text_.text = var_148_10

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_11 = 15
				local var_148_12 = utf8.len(var_148_10)
				local var_148_13 = var_148_11 <= 0 and var_148_7 or var_148_7 * (var_148_12 / var_148_11)

				if var_148_13 > 0 and var_148_7 < var_148_13 then
					arg_145_1.talkMaxDuration = var_148_13

					if var_148_13 + var_148_6 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_13 + var_148_6
					end
				end

				arg_145_1.text_.text = var_148_10
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)
				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_14 = math.max(var_148_7, arg_145_1.talkMaxDuration)

			if var_148_6 <= arg_145_1.time_ and arg_145_1.time_ < var_148_6 + var_148_14 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_6) / var_148_14

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_6 + var_148_14 and arg_145_1.time_ < var_148_6 + var_148_14 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play116431037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 116431037
		arg_149_1.duration_ = 6.9

		local var_149_0 = {
			zh = 6.5,
			ja = 6.9
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
				arg_149_0:Play116431038(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["1011ui_story"].transform
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 then
				arg_149_1.var_.moveOldPos1011ui_story = var_152_0.localPosition
			end

			local var_152_2 = 0.001

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_2 then
				local var_152_3 = (arg_149_1.time_ - var_152_1) / var_152_2
				local var_152_4 = Vector3.New(0.7, -0.71, -6)

				var_152_0.localPosition = Vector3.Lerp(arg_149_1.var_.moveOldPos1011ui_story, var_152_4, var_152_3)

				local var_152_5 = manager.ui.mainCamera.transform.position - var_152_0.position

				var_152_0.forward = Vector3.New(var_152_5.x, var_152_5.y, var_152_5.z)

				local var_152_6 = var_152_0.localEulerAngles

				var_152_6.z = 0
				var_152_6.x = 0
				var_152_0.localEulerAngles = var_152_6
			end

			if arg_149_1.time_ >= var_152_1 + var_152_2 and arg_149_1.time_ < var_152_1 + var_152_2 + arg_152_0 then
				var_152_0.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_152_7 = manager.ui.mainCamera.transform.position - var_152_0.position

				var_152_0.forward = Vector3.New(var_152_7.x, var_152_7.y, var_152_7.z)

				local var_152_8 = var_152_0.localEulerAngles

				var_152_8.z = 0
				var_152_8.x = 0
				var_152_0.localEulerAngles = var_152_8
			end

			local var_152_9 = arg_149_1.actors_["1084ui_story"].transform
			local var_152_10 = 0

			if var_152_10 < arg_149_1.time_ and arg_149_1.time_ <= var_152_10 + arg_152_0 then
				arg_149_1.var_.moveOldPos1084ui_story = var_152_9.localPosition
			end

			local var_152_11 = 0.001

			if var_152_10 <= arg_149_1.time_ and arg_149_1.time_ < var_152_10 + var_152_11 then
				local var_152_12 = (arg_149_1.time_ - var_152_10) / var_152_11
				local var_152_13 = Vector3.New(-0.7, -0.97, -6)

				var_152_9.localPosition = Vector3.Lerp(arg_149_1.var_.moveOldPos1084ui_story, var_152_13, var_152_12)

				local var_152_14 = manager.ui.mainCamera.transform.position - var_152_9.position

				var_152_9.forward = Vector3.New(var_152_14.x, var_152_14.y, var_152_14.z)

				local var_152_15 = var_152_9.localEulerAngles

				var_152_15.z = 0
				var_152_15.x = 0
				var_152_9.localEulerAngles = var_152_15
			end

			if arg_149_1.time_ >= var_152_10 + var_152_11 and arg_149_1.time_ < var_152_10 + var_152_11 + arg_152_0 then
				var_152_9.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_152_16 = manager.ui.mainCamera.transform.position - var_152_9.position

				var_152_9.forward = Vector3.New(var_152_16.x, var_152_16.y, var_152_16.z)

				local var_152_17 = var_152_9.localEulerAngles

				var_152_17.z = 0
				var_152_17.x = 0
				var_152_9.localEulerAngles = var_152_17
			end

			local var_152_18 = 0

			if var_152_18 < arg_149_1.time_ and arg_149_1.time_ <= var_152_18 + arg_152_0 then
				arg_149_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_152_19 = 0

			if var_152_19 < arg_149_1.time_ and arg_149_1.time_ <= var_152_19 + arg_152_0 then
				arg_149_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_152_20 = arg_149_1.actors_["1011ui_story"]
			local var_152_21 = 0

			if var_152_21 < arg_149_1.time_ and arg_149_1.time_ <= var_152_21 + arg_152_0 and arg_149_1.var_.characterEffect1011ui_story == nil then
				arg_149_1.var_.characterEffect1011ui_story = var_152_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_22 = 0.2

			if var_152_21 <= arg_149_1.time_ and arg_149_1.time_ < var_152_21 + var_152_22 then
				local var_152_23 = (arg_149_1.time_ - var_152_21) / var_152_22

				if arg_149_1.var_.characterEffect1011ui_story then
					arg_149_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_149_1.time_ >= var_152_21 + var_152_22 and arg_149_1.time_ < var_152_21 + var_152_22 + arg_152_0 and arg_149_1.var_.characterEffect1011ui_story then
				arg_149_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_152_24 = 0
			local var_152_25 = 0.65

			if var_152_24 < arg_149_1.time_ and arg_149_1.time_ <= var_152_24 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_26 = arg_149_1:FormatText(StoryNameCfg[37].name)

				arg_149_1.leftNameTxt_.text = var_152_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_27 = arg_149_1:GetWordFromCfg(116431037)
				local var_152_28 = arg_149_1:FormatText(var_152_27.content)

				arg_149_1.text_.text = var_152_28

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_29 = 26
				local var_152_30 = utf8.len(var_152_28)
				local var_152_31 = var_152_29 <= 0 and var_152_25 or var_152_25 * (var_152_30 / var_152_29)

				if var_152_31 > 0 and var_152_25 < var_152_31 then
					arg_149_1.talkMaxDuration = var_152_31

					if var_152_31 + var_152_24 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_31 + var_152_24
					end
				end

				arg_149_1.text_.text = var_152_28
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431037", "story_v_out_116431.awb") ~= 0 then
					local var_152_32 = manager.audio:GetVoiceLength("story_v_out_116431", "116431037", "story_v_out_116431.awb") / 1000

					if var_152_32 + var_152_24 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_32 + var_152_24
					end

					if var_152_27.prefab_name ~= "" and arg_149_1.actors_[var_152_27.prefab_name] ~= nil then
						local var_152_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_27.prefab_name].transform, "story_v_out_116431", "116431037", "story_v_out_116431.awb")

						arg_149_1:RecordAudio("116431037", var_152_33)
						arg_149_1:RecordAudio("116431037", var_152_33)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_116431", "116431037", "story_v_out_116431.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_116431", "116431037", "story_v_out_116431.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_34 = math.max(var_152_25, arg_149_1.talkMaxDuration)

			if var_152_24 <= arg_149_1.time_ and arg_149_1.time_ < var_152_24 + var_152_34 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_24) / var_152_34

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_24 + var_152_34 and arg_149_1.time_ < var_152_24 + var_152_34 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play116431038 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 116431038
		arg_153_1.duration_ = 3.8

		local var_153_0 = {
			zh = 3.8,
			ja = 2.833
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
				arg_153_0:Play116431039(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["1084ui_story"].transform
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 then
				arg_153_1.var_.moveOldPos1084ui_story = var_156_0.localPosition
			end

			local var_156_2 = 0.001

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_2 then
				local var_156_3 = (arg_153_1.time_ - var_156_1) / var_156_2
				local var_156_4 = Vector3.New(-0.7, -0.97, -6)

				var_156_0.localPosition = Vector3.Lerp(arg_153_1.var_.moveOldPos1084ui_story, var_156_4, var_156_3)

				local var_156_5 = manager.ui.mainCamera.transform.position - var_156_0.position

				var_156_0.forward = Vector3.New(var_156_5.x, var_156_5.y, var_156_5.z)

				local var_156_6 = var_156_0.localEulerAngles

				var_156_6.z = 0
				var_156_6.x = 0
				var_156_0.localEulerAngles = var_156_6
			end

			if arg_153_1.time_ >= var_156_1 + var_156_2 and arg_153_1.time_ < var_156_1 + var_156_2 + arg_156_0 then
				var_156_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_156_7 = manager.ui.mainCamera.transform.position - var_156_0.position

				var_156_0.forward = Vector3.New(var_156_7.x, var_156_7.y, var_156_7.z)

				local var_156_8 = var_156_0.localEulerAngles

				var_156_8.z = 0
				var_156_8.x = 0
				var_156_0.localEulerAngles = var_156_8
			end

			local var_156_9 = arg_153_1.actors_["1084ui_story"]
			local var_156_10 = 0

			if var_156_10 < arg_153_1.time_ and arg_153_1.time_ <= var_156_10 + arg_156_0 and arg_153_1.var_.characterEffect1084ui_story == nil then
				arg_153_1.var_.characterEffect1084ui_story = var_156_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_11 = 0.2

			if var_156_10 <= arg_153_1.time_ and arg_153_1.time_ < var_156_10 + var_156_11 then
				local var_156_12 = (arg_153_1.time_ - var_156_10) / var_156_11

				if arg_153_1.var_.characterEffect1084ui_story then
					arg_153_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_153_1.time_ >= var_156_10 + var_156_11 and arg_153_1.time_ < var_156_10 + var_156_11 + arg_156_0 and arg_153_1.var_.characterEffect1084ui_story then
				arg_153_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_156_13 = arg_153_1.actors_["1011ui_story"]
			local var_156_14 = 0

			if var_156_14 < arg_153_1.time_ and arg_153_1.time_ <= var_156_14 + arg_156_0 and arg_153_1.var_.characterEffect1011ui_story == nil then
				arg_153_1.var_.characterEffect1011ui_story = var_156_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_15 = 0.2

			if var_156_14 <= arg_153_1.time_ and arg_153_1.time_ < var_156_14 + var_156_15 then
				local var_156_16 = (arg_153_1.time_ - var_156_14) / var_156_15

				if arg_153_1.var_.characterEffect1011ui_story then
					local var_156_17 = Mathf.Lerp(0, 0.5, var_156_16)

					arg_153_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_153_1.var_.characterEffect1011ui_story.fillRatio = var_156_17
				end
			end

			if arg_153_1.time_ >= var_156_14 + var_156_15 and arg_153_1.time_ < var_156_14 + var_156_15 + arg_156_0 and arg_153_1.var_.characterEffect1011ui_story then
				local var_156_18 = 0.5

				arg_153_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_153_1.var_.characterEffect1011ui_story.fillRatio = var_156_18
			end

			local var_156_19 = 0

			if var_156_19 < arg_153_1.time_ and arg_153_1.time_ <= var_156_19 + arg_156_0 then
				arg_153_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action8_2")
			end

			local var_156_20 = 0

			if var_156_20 < arg_153_1.time_ and arg_153_1.time_ <= var_156_20 + arg_156_0 then
				arg_153_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_156_21 = 0
			local var_156_22 = 0.425

			if var_156_21 < arg_153_1.time_ and arg_153_1.time_ <= var_156_21 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_23 = arg_153_1:FormatText(StoryNameCfg[6].name)

				arg_153_1.leftNameTxt_.text = var_156_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_24 = arg_153_1:GetWordFromCfg(116431038)
				local var_156_25 = arg_153_1:FormatText(var_156_24.content)

				arg_153_1.text_.text = var_156_25

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_26 = 17
				local var_156_27 = utf8.len(var_156_25)
				local var_156_28 = var_156_26 <= 0 and var_156_22 or var_156_22 * (var_156_27 / var_156_26)

				if var_156_28 > 0 and var_156_22 < var_156_28 then
					arg_153_1.talkMaxDuration = var_156_28

					if var_156_28 + var_156_21 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_28 + var_156_21
					end
				end

				arg_153_1.text_.text = var_156_25
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431038", "story_v_out_116431.awb") ~= 0 then
					local var_156_29 = manager.audio:GetVoiceLength("story_v_out_116431", "116431038", "story_v_out_116431.awb") / 1000

					if var_156_29 + var_156_21 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_29 + var_156_21
					end

					if var_156_24.prefab_name ~= "" and arg_153_1.actors_[var_156_24.prefab_name] ~= nil then
						local var_156_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_24.prefab_name].transform, "story_v_out_116431", "116431038", "story_v_out_116431.awb")

						arg_153_1:RecordAudio("116431038", var_156_30)
						arg_153_1:RecordAudio("116431038", var_156_30)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_116431", "116431038", "story_v_out_116431.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_116431", "116431038", "story_v_out_116431.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_31 = math.max(var_156_22, arg_153_1.talkMaxDuration)

			if var_156_21 <= arg_153_1.time_ and arg_153_1.time_ < var_156_21 + var_156_31 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_21) / var_156_31

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_21 + var_156_31 and arg_153_1.time_ < var_156_21 + var_156_31 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play116431039 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 116431039
		arg_157_1.duration_ = 5

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play116431040(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["1084ui_story"]
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 and arg_157_1.var_.characterEffect1084ui_story == nil then
				arg_157_1.var_.characterEffect1084ui_story = var_160_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_2 = 0.2

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_2 then
				local var_160_3 = (arg_157_1.time_ - var_160_1) / var_160_2

				if arg_157_1.var_.characterEffect1084ui_story then
					local var_160_4 = Mathf.Lerp(0, 0.5, var_160_3)

					arg_157_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_157_1.var_.characterEffect1084ui_story.fillRatio = var_160_4
				end
			end

			if arg_157_1.time_ >= var_160_1 + var_160_2 and arg_157_1.time_ < var_160_1 + var_160_2 + arg_160_0 and arg_157_1.var_.characterEffect1084ui_story then
				local var_160_5 = 0.5

				arg_157_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_157_1.var_.characterEffect1084ui_story.fillRatio = var_160_5
			end

			local var_160_6 = 0
			local var_160_7 = 0.425

			if var_160_6 < arg_157_1.time_ and arg_157_1.time_ <= var_160_6 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, false)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_8 = arg_157_1:GetWordFromCfg(116431039)
				local var_160_9 = arg_157_1:FormatText(var_160_8.content)

				arg_157_1.text_.text = var_160_9

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_10 = 17
				local var_160_11 = utf8.len(var_160_9)
				local var_160_12 = var_160_10 <= 0 and var_160_7 or var_160_7 * (var_160_11 / var_160_10)

				if var_160_12 > 0 and var_160_7 < var_160_12 then
					arg_157_1.talkMaxDuration = var_160_12

					if var_160_12 + var_160_6 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_12 + var_160_6
					end
				end

				arg_157_1.text_.text = var_160_9
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)
				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_13 = math.max(var_160_7, arg_157_1.talkMaxDuration)

			if var_160_6 <= arg_157_1.time_ and arg_157_1.time_ < var_160_6 + var_160_13 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_6) / var_160_13

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_6 + var_160_13 and arg_157_1.time_ < var_160_6 + var_160_13 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play116431040 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 116431040
		arg_161_1.duration_ = 6.366

		local var_161_0 = {
			zh = 6.133,
			ja = 6.366
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
				arg_161_0:Play116431041(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["1084ui_story"].transform
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 then
				arg_161_1.var_.moveOldPos1084ui_story = var_164_0.localPosition
			end

			local var_164_2 = 0.001

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_2 then
				local var_164_3 = (arg_161_1.time_ - var_164_1) / var_164_2
				local var_164_4 = Vector3.New(-0.7, -0.97, -6)

				var_164_0.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos1084ui_story, var_164_4, var_164_3)

				local var_164_5 = manager.ui.mainCamera.transform.position - var_164_0.position

				var_164_0.forward = Vector3.New(var_164_5.x, var_164_5.y, var_164_5.z)

				local var_164_6 = var_164_0.localEulerAngles

				var_164_6.z = 0
				var_164_6.x = 0
				var_164_0.localEulerAngles = var_164_6
			end

			if arg_161_1.time_ >= var_164_1 + var_164_2 and arg_161_1.time_ < var_164_1 + var_164_2 + arg_164_0 then
				var_164_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_164_7 = manager.ui.mainCamera.transform.position - var_164_0.position

				var_164_0.forward = Vector3.New(var_164_7.x, var_164_7.y, var_164_7.z)

				local var_164_8 = var_164_0.localEulerAngles

				var_164_8.z = 0
				var_164_8.x = 0
				var_164_0.localEulerAngles = var_164_8
			end

			local var_164_9 = arg_161_1.actors_["1084ui_story"]
			local var_164_10 = 0

			if var_164_10 < arg_161_1.time_ and arg_161_1.time_ <= var_164_10 + arg_164_0 and arg_161_1.var_.characterEffect1084ui_story == nil then
				arg_161_1.var_.characterEffect1084ui_story = var_164_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_11 = 0.2

			if var_164_10 <= arg_161_1.time_ and arg_161_1.time_ < var_164_10 + var_164_11 then
				local var_164_12 = (arg_161_1.time_ - var_164_10) / var_164_11

				if arg_161_1.var_.characterEffect1084ui_story then
					arg_161_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_161_1.time_ >= var_164_10 + var_164_11 and arg_161_1.time_ < var_164_10 + var_164_11 + arg_164_0 and arg_161_1.var_.characterEffect1084ui_story then
				arg_161_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_164_13 = 0

			if var_164_13 < arg_161_1.time_ and arg_161_1.time_ <= var_164_13 + arg_164_0 then
				arg_161_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_164_14 = 0

			if var_164_14 < arg_161_1.time_ and arg_161_1.time_ <= var_164_14 + arg_164_0 then
				arg_161_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_164_15 = 0
			local var_164_16 = 0.55

			if var_164_15 < arg_161_1.time_ and arg_161_1.time_ <= var_164_15 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_17 = arg_161_1:FormatText(StoryNameCfg[6].name)

				arg_161_1.leftNameTxt_.text = var_164_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_18 = arg_161_1:GetWordFromCfg(116431040)
				local var_164_19 = arg_161_1:FormatText(var_164_18.content)

				arg_161_1.text_.text = var_164_19

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_20 = 22
				local var_164_21 = utf8.len(var_164_19)
				local var_164_22 = var_164_20 <= 0 and var_164_16 or var_164_16 * (var_164_21 / var_164_20)

				if var_164_22 > 0 and var_164_16 < var_164_22 then
					arg_161_1.talkMaxDuration = var_164_22

					if var_164_22 + var_164_15 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_22 + var_164_15
					end
				end

				arg_161_1.text_.text = var_164_19
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431040", "story_v_out_116431.awb") ~= 0 then
					local var_164_23 = manager.audio:GetVoiceLength("story_v_out_116431", "116431040", "story_v_out_116431.awb") / 1000

					if var_164_23 + var_164_15 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_23 + var_164_15
					end

					if var_164_18.prefab_name ~= "" and arg_161_1.actors_[var_164_18.prefab_name] ~= nil then
						local var_164_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_18.prefab_name].transform, "story_v_out_116431", "116431040", "story_v_out_116431.awb")

						arg_161_1:RecordAudio("116431040", var_164_24)
						arg_161_1:RecordAudio("116431040", var_164_24)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_116431", "116431040", "story_v_out_116431.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_116431", "116431040", "story_v_out_116431.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_25 = math.max(var_164_16, arg_161_1.talkMaxDuration)

			if var_164_15 <= arg_161_1.time_ and arg_161_1.time_ < var_164_15 + var_164_25 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_15) / var_164_25

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_15 + var_164_25 and arg_161_1.time_ < var_164_15 + var_164_25 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play116431041 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 116431041
		arg_165_1.duration_ = 5

		SetActive(arg_165_1.tipsGo_, false)

		function arg_165_1.onSingleLineFinish_()
			arg_165_1.onSingleLineUpdate_ = nil
			arg_165_1.onSingleLineFinish_ = nil
			arg_165_1.state_ = "waiting"
		end

		function arg_165_1.playNext_(arg_167_0)
			if arg_167_0 == 1 then
				arg_165_0:Play116431042(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = arg_165_1.actors_["1084ui_story"]
			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 and arg_165_1.var_.characterEffect1084ui_story == nil then
				arg_165_1.var_.characterEffect1084ui_story = var_168_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_2 = 0.2

			if var_168_1 <= arg_165_1.time_ and arg_165_1.time_ < var_168_1 + var_168_2 then
				local var_168_3 = (arg_165_1.time_ - var_168_1) / var_168_2

				if arg_165_1.var_.characterEffect1084ui_story then
					local var_168_4 = Mathf.Lerp(0, 0.5, var_168_3)

					arg_165_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_165_1.var_.characterEffect1084ui_story.fillRatio = var_168_4
				end
			end

			if arg_165_1.time_ >= var_168_1 + var_168_2 and arg_165_1.time_ < var_168_1 + var_168_2 + arg_168_0 and arg_165_1.var_.characterEffect1084ui_story then
				local var_168_5 = 0.5

				arg_165_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_165_1.var_.characterEffect1084ui_story.fillRatio = var_168_5
			end

			local var_168_6 = 0
			local var_168_7 = 0.325

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

				local var_168_8 = arg_165_1:GetWordFromCfg(116431041)
				local var_168_9 = arg_165_1:FormatText(var_168_8.content)

				arg_165_1.text_.text = var_168_9

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_10 = 13
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
	Play116431042 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 116431042
		arg_169_1.duration_ = 11.533

		local var_169_0 = {
			zh = 8.166,
			ja = 11.533
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
				arg_169_0:Play116431043(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["1011ui_story"].transform
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 then
				arg_169_1.var_.moveOldPos1011ui_story = var_172_0.localPosition
			end

			local var_172_2 = 0.001

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_2 then
				local var_172_3 = (arg_169_1.time_ - var_172_1) / var_172_2
				local var_172_4 = Vector3.New(0.7, -0.71, -6)

				var_172_0.localPosition = Vector3.Lerp(arg_169_1.var_.moveOldPos1011ui_story, var_172_4, var_172_3)

				local var_172_5 = manager.ui.mainCamera.transform.position - var_172_0.position

				var_172_0.forward = Vector3.New(var_172_5.x, var_172_5.y, var_172_5.z)

				local var_172_6 = var_172_0.localEulerAngles

				var_172_6.z = 0
				var_172_6.x = 0
				var_172_0.localEulerAngles = var_172_6
			end

			if arg_169_1.time_ >= var_172_1 + var_172_2 and arg_169_1.time_ < var_172_1 + var_172_2 + arg_172_0 then
				var_172_0.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_172_7 = manager.ui.mainCamera.transform.position - var_172_0.position

				var_172_0.forward = Vector3.New(var_172_7.x, var_172_7.y, var_172_7.z)

				local var_172_8 = var_172_0.localEulerAngles

				var_172_8.z = 0
				var_172_8.x = 0
				var_172_0.localEulerAngles = var_172_8
			end

			local var_172_9 = arg_169_1.actors_["1084ui_story"].transform
			local var_172_10 = 0

			if var_172_10 < arg_169_1.time_ and arg_169_1.time_ <= var_172_10 + arg_172_0 then
				arg_169_1.var_.moveOldPos1084ui_story = var_172_9.localPosition
			end

			local var_172_11 = 0.001

			if var_172_10 <= arg_169_1.time_ and arg_169_1.time_ < var_172_10 + var_172_11 then
				local var_172_12 = (arg_169_1.time_ - var_172_10) / var_172_11
				local var_172_13 = Vector3.New(-0.7, -0.97, -6)

				var_172_9.localPosition = Vector3.Lerp(arg_169_1.var_.moveOldPos1084ui_story, var_172_13, var_172_12)

				local var_172_14 = manager.ui.mainCamera.transform.position - var_172_9.position

				var_172_9.forward = Vector3.New(var_172_14.x, var_172_14.y, var_172_14.z)

				local var_172_15 = var_172_9.localEulerAngles

				var_172_15.z = 0
				var_172_15.x = 0
				var_172_9.localEulerAngles = var_172_15
			end

			if arg_169_1.time_ >= var_172_10 + var_172_11 and arg_169_1.time_ < var_172_10 + var_172_11 + arg_172_0 then
				var_172_9.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_172_16 = manager.ui.mainCamera.transform.position - var_172_9.position

				var_172_9.forward = Vector3.New(var_172_16.x, var_172_16.y, var_172_16.z)

				local var_172_17 = var_172_9.localEulerAngles

				var_172_17.z = 0
				var_172_17.x = 0
				var_172_9.localEulerAngles = var_172_17
			end

			local var_172_18 = 0

			if var_172_18 < arg_169_1.time_ and arg_169_1.time_ <= var_172_18 + arg_172_0 then
				arg_169_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011actionlink/1011action423")
			end

			local var_172_19 = 0

			if var_172_19 < arg_169_1.time_ and arg_169_1.time_ <= var_172_19 + arg_172_0 then
				arg_169_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_172_20 = arg_169_1.actors_["1011ui_story"]
			local var_172_21 = 0

			if var_172_21 < arg_169_1.time_ and arg_169_1.time_ <= var_172_21 + arg_172_0 and arg_169_1.var_.characterEffect1011ui_story == nil then
				arg_169_1.var_.characterEffect1011ui_story = var_172_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_22 = 0.2

			if var_172_21 <= arg_169_1.time_ and arg_169_1.time_ < var_172_21 + var_172_22 then
				local var_172_23 = (arg_169_1.time_ - var_172_21) / var_172_22

				if arg_169_1.var_.characterEffect1011ui_story then
					arg_169_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_169_1.time_ >= var_172_21 + var_172_22 and arg_169_1.time_ < var_172_21 + var_172_22 + arg_172_0 and arg_169_1.var_.characterEffect1011ui_story then
				arg_169_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_172_24 = 0
			local var_172_25 = 0.875

			if var_172_24 < arg_169_1.time_ and arg_169_1.time_ <= var_172_24 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_26 = arg_169_1:FormatText(StoryNameCfg[37].name)

				arg_169_1.leftNameTxt_.text = var_172_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_27 = arg_169_1:GetWordFromCfg(116431042)
				local var_172_28 = arg_169_1:FormatText(var_172_27.content)

				arg_169_1.text_.text = var_172_28

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_29 = 35
				local var_172_30 = utf8.len(var_172_28)
				local var_172_31 = var_172_29 <= 0 and var_172_25 or var_172_25 * (var_172_30 / var_172_29)

				if var_172_31 > 0 and var_172_25 < var_172_31 then
					arg_169_1.talkMaxDuration = var_172_31

					if var_172_31 + var_172_24 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_31 + var_172_24
					end
				end

				arg_169_1.text_.text = var_172_28
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431042", "story_v_out_116431.awb") ~= 0 then
					local var_172_32 = manager.audio:GetVoiceLength("story_v_out_116431", "116431042", "story_v_out_116431.awb") / 1000

					if var_172_32 + var_172_24 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_32 + var_172_24
					end

					if var_172_27.prefab_name ~= "" and arg_169_1.actors_[var_172_27.prefab_name] ~= nil then
						local var_172_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_27.prefab_name].transform, "story_v_out_116431", "116431042", "story_v_out_116431.awb")

						arg_169_1:RecordAudio("116431042", var_172_33)
						arg_169_1:RecordAudio("116431042", var_172_33)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_out_116431", "116431042", "story_v_out_116431.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_out_116431", "116431042", "story_v_out_116431.awb")
				end

				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_34 = math.max(var_172_25, arg_169_1.talkMaxDuration)

			if var_172_24 <= arg_169_1.time_ and arg_169_1.time_ < var_172_24 + var_172_34 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_24) / var_172_34

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_24 + var_172_34 and arg_169_1.time_ < var_172_24 + var_172_34 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play116431043 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 116431043
		arg_173_1.duration_ = 3.6

		local var_173_0 = {
			zh = 2.8,
			ja = 3.6
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
				arg_173_0:Play116431044(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.actors_["1084ui_story"].transform
			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 then
				arg_173_1.var_.moveOldPos1084ui_story = var_176_0.localPosition
			end

			local var_176_2 = 0.001

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_2 then
				local var_176_3 = (arg_173_1.time_ - var_176_1) / var_176_2
				local var_176_4 = Vector3.New(-0.7, -0.97, -6)

				var_176_0.localPosition = Vector3.Lerp(arg_173_1.var_.moveOldPos1084ui_story, var_176_4, var_176_3)

				local var_176_5 = manager.ui.mainCamera.transform.position - var_176_0.position

				var_176_0.forward = Vector3.New(var_176_5.x, var_176_5.y, var_176_5.z)

				local var_176_6 = var_176_0.localEulerAngles

				var_176_6.z = 0
				var_176_6.x = 0
				var_176_0.localEulerAngles = var_176_6
			end

			if arg_173_1.time_ >= var_176_1 + var_176_2 and arg_173_1.time_ < var_176_1 + var_176_2 + arg_176_0 then
				var_176_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_176_7 = manager.ui.mainCamera.transform.position - var_176_0.position

				var_176_0.forward = Vector3.New(var_176_7.x, var_176_7.y, var_176_7.z)

				local var_176_8 = var_176_0.localEulerAngles

				var_176_8.z = 0
				var_176_8.x = 0
				var_176_0.localEulerAngles = var_176_8
			end

			local var_176_9 = arg_173_1.actors_["1084ui_story"]
			local var_176_10 = 0

			if var_176_10 < arg_173_1.time_ and arg_173_1.time_ <= var_176_10 + arg_176_0 and arg_173_1.var_.characterEffect1084ui_story == nil then
				arg_173_1.var_.characterEffect1084ui_story = var_176_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_11 = 0.2

			if var_176_10 <= arg_173_1.time_ and arg_173_1.time_ < var_176_10 + var_176_11 then
				local var_176_12 = (arg_173_1.time_ - var_176_10) / var_176_11

				if arg_173_1.var_.characterEffect1084ui_story then
					arg_173_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_173_1.time_ >= var_176_10 + var_176_11 and arg_173_1.time_ < var_176_10 + var_176_11 + arg_176_0 and arg_173_1.var_.characterEffect1084ui_story then
				arg_173_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_176_13 = arg_173_1.actors_["1011ui_story"]
			local var_176_14 = 0

			if var_176_14 < arg_173_1.time_ and arg_173_1.time_ <= var_176_14 + arg_176_0 and arg_173_1.var_.characterEffect1011ui_story == nil then
				arg_173_1.var_.characterEffect1011ui_story = var_176_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_15 = 0.2

			if var_176_14 <= arg_173_1.time_ and arg_173_1.time_ < var_176_14 + var_176_15 then
				local var_176_16 = (arg_173_1.time_ - var_176_14) / var_176_15

				if arg_173_1.var_.characterEffect1011ui_story then
					local var_176_17 = Mathf.Lerp(0, 0.5, var_176_16)

					arg_173_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_173_1.var_.characterEffect1011ui_story.fillRatio = var_176_17
				end
			end

			if arg_173_1.time_ >= var_176_14 + var_176_15 and arg_173_1.time_ < var_176_14 + var_176_15 + arg_176_0 and arg_173_1.var_.characterEffect1011ui_story then
				local var_176_18 = 0.5

				arg_173_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_173_1.var_.characterEffect1011ui_story.fillRatio = var_176_18
			end

			local var_176_19 = 0

			if var_176_19 < arg_173_1.time_ and arg_173_1.time_ <= var_176_19 + arg_176_0 then
				arg_173_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_2")
			end

			local var_176_20 = 0

			if var_176_20 < arg_173_1.time_ and arg_173_1.time_ <= var_176_20 + arg_176_0 then
				arg_173_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_176_21 = 0
			local var_176_22 = 0.3

			if var_176_21 < arg_173_1.time_ and arg_173_1.time_ <= var_176_21 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_23 = arg_173_1:FormatText(StoryNameCfg[6].name)

				arg_173_1.leftNameTxt_.text = var_176_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_24 = arg_173_1:GetWordFromCfg(116431043)
				local var_176_25 = arg_173_1:FormatText(var_176_24.content)

				arg_173_1.text_.text = var_176_25

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_26 = 12
				local var_176_27 = utf8.len(var_176_25)
				local var_176_28 = var_176_26 <= 0 and var_176_22 or var_176_22 * (var_176_27 / var_176_26)

				if var_176_28 > 0 and var_176_22 < var_176_28 then
					arg_173_1.talkMaxDuration = var_176_28

					if var_176_28 + var_176_21 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_28 + var_176_21
					end
				end

				arg_173_1.text_.text = var_176_25
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431043", "story_v_out_116431.awb") ~= 0 then
					local var_176_29 = manager.audio:GetVoiceLength("story_v_out_116431", "116431043", "story_v_out_116431.awb") / 1000

					if var_176_29 + var_176_21 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_29 + var_176_21
					end

					if var_176_24.prefab_name ~= "" and arg_173_1.actors_[var_176_24.prefab_name] ~= nil then
						local var_176_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_24.prefab_name].transform, "story_v_out_116431", "116431043", "story_v_out_116431.awb")

						arg_173_1:RecordAudio("116431043", var_176_30)
						arg_173_1:RecordAudio("116431043", var_176_30)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_116431", "116431043", "story_v_out_116431.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_116431", "116431043", "story_v_out_116431.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_31 = math.max(var_176_22, arg_173_1.talkMaxDuration)

			if var_176_21 <= arg_173_1.time_ and arg_173_1.time_ < var_176_21 + var_176_31 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_21) / var_176_31

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_21 + var_176_31 and arg_173_1.time_ < var_176_21 + var_176_31 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play116431044 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 116431044
		arg_177_1.duration_ = 5

		SetActive(arg_177_1.tipsGo_, false)

		function arg_177_1.onSingleLineFinish_()
			arg_177_1.onSingleLineUpdate_ = nil
			arg_177_1.onSingleLineFinish_ = nil
			arg_177_1.state_ = "waiting"
		end

		function arg_177_1.playNext_(arg_179_0)
			if arg_179_0 == 1 then
				arg_177_0:Play116431045(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = arg_177_1.actors_["1011ui_story"].transform
			local var_180_1 = 0

			if var_180_1 < arg_177_1.time_ and arg_177_1.time_ <= var_180_1 + arg_180_0 then
				arg_177_1.var_.moveOldPos1011ui_story = var_180_0.localPosition
			end

			local var_180_2 = 0.001

			if var_180_1 <= arg_177_1.time_ and arg_177_1.time_ < var_180_1 + var_180_2 then
				local var_180_3 = (arg_177_1.time_ - var_180_1) / var_180_2
				local var_180_4 = Vector3.New(0, 100, 0)

				var_180_0.localPosition = Vector3.Lerp(arg_177_1.var_.moveOldPos1011ui_story, var_180_4, var_180_3)

				local var_180_5 = manager.ui.mainCamera.transform.position - var_180_0.position

				var_180_0.forward = Vector3.New(var_180_5.x, var_180_5.y, var_180_5.z)

				local var_180_6 = var_180_0.localEulerAngles

				var_180_6.z = 0
				var_180_6.x = 0
				var_180_0.localEulerAngles = var_180_6
			end

			if arg_177_1.time_ >= var_180_1 + var_180_2 and arg_177_1.time_ < var_180_1 + var_180_2 + arg_180_0 then
				var_180_0.localPosition = Vector3.New(0, 100, 0)

				local var_180_7 = manager.ui.mainCamera.transform.position - var_180_0.position

				var_180_0.forward = Vector3.New(var_180_7.x, var_180_7.y, var_180_7.z)

				local var_180_8 = var_180_0.localEulerAngles

				var_180_8.z = 0
				var_180_8.x = 0
				var_180_0.localEulerAngles = var_180_8
			end

			local var_180_9 = arg_177_1.actors_["1084ui_story"].transform
			local var_180_10 = 0

			if var_180_10 < arg_177_1.time_ and arg_177_1.time_ <= var_180_10 + arg_180_0 then
				arg_177_1.var_.moveOldPos1084ui_story = var_180_9.localPosition
			end

			local var_180_11 = 0.001

			if var_180_10 <= arg_177_1.time_ and arg_177_1.time_ < var_180_10 + var_180_11 then
				local var_180_12 = (arg_177_1.time_ - var_180_10) / var_180_11
				local var_180_13 = Vector3.New(0, 100, 0)

				var_180_9.localPosition = Vector3.Lerp(arg_177_1.var_.moveOldPos1084ui_story, var_180_13, var_180_12)

				local var_180_14 = manager.ui.mainCamera.transform.position - var_180_9.position

				var_180_9.forward = Vector3.New(var_180_14.x, var_180_14.y, var_180_14.z)

				local var_180_15 = var_180_9.localEulerAngles

				var_180_15.z = 0
				var_180_15.x = 0
				var_180_9.localEulerAngles = var_180_15
			end

			if arg_177_1.time_ >= var_180_10 + var_180_11 and arg_177_1.time_ < var_180_10 + var_180_11 + arg_180_0 then
				var_180_9.localPosition = Vector3.New(0, 100, 0)

				local var_180_16 = manager.ui.mainCamera.transform.position - var_180_9.position

				var_180_9.forward = Vector3.New(var_180_16.x, var_180_16.y, var_180_16.z)

				local var_180_17 = var_180_9.localEulerAngles

				var_180_17.z = 0
				var_180_17.x = 0
				var_180_9.localEulerAngles = var_180_17
			end

			local var_180_18 = 0
			local var_180_19 = 0.175

			if var_180_18 < arg_177_1.time_ and arg_177_1.time_ <= var_180_18 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_20 = arg_177_1:FormatText(StoryNameCfg[7].name)

				arg_177_1.leftNameTxt_.text = var_180_20

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_21 = arg_177_1:GetWordFromCfg(116431044)
				local var_180_22 = arg_177_1:FormatText(var_180_21.content)

				arg_177_1.text_.text = var_180_22

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_23 = 7
				local var_180_24 = utf8.len(var_180_22)
				local var_180_25 = var_180_23 <= 0 and var_180_19 or var_180_19 * (var_180_24 / var_180_23)

				if var_180_25 > 0 and var_180_19 < var_180_25 then
					arg_177_1.talkMaxDuration = var_180_25

					if var_180_25 + var_180_18 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_25 + var_180_18
					end
				end

				arg_177_1.text_.text = var_180_22
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)
				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_26 = math.max(var_180_19, arg_177_1.talkMaxDuration)

			if var_180_18 <= arg_177_1.time_ and arg_177_1.time_ < var_180_18 + var_180_26 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_18) / var_180_26

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_18 + var_180_26 and arg_177_1.time_ < var_180_18 + var_180_26 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play116431045 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 116431045
		arg_181_1.duration_ = 7

		SetActive(arg_181_1.tipsGo_, false)

		function arg_181_1.onSingleLineFinish_()
			arg_181_1.onSingleLineUpdate_ = nil
			arg_181_1.onSingleLineFinish_ = nil
			arg_181_1.state_ = "waiting"
		end

		function arg_181_1.playNext_(arg_183_0)
			if arg_183_0 == 1 then
				arg_181_0:Play116431046(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = "SK0202"

			if arg_181_1.bgs_[var_184_0] == nil then
				local var_184_1 = Object.Instantiate(arg_181_1.paintGo_)

				var_184_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_184_0)
				var_184_1.name = var_184_0
				var_184_1.transform.parent = arg_181_1.stage_.transform
				var_184_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_181_1.bgs_[var_184_0] = var_184_1
			end

			local var_184_2 = 0

			if var_184_2 < arg_181_1.time_ and arg_181_1.time_ <= var_184_2 + arg_184_0 then
				local var_184_3 = manager.ui.mainCamera.transform.localPosition
				local var_184_4 = Vector3.New(0, 0, 10) + Vector3.New(var_184_3.x, var_184_3.y, 0)
				local var_184_5 = arg_181_1.bgs_.SK0202

				var_184_5.transform.localPosition = var_184_4
				var_184_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_184_6 = var_184_5:GetComponent("SpriteRenderer")

				if var_184_6 and var_184_6.sprite then
					local var_184_7 = (var_184_5.transform.localPosition - var_184_3).z
					local var_184_8 = manager.ui.mainCameraCom_
					local var_184_9 = 2 * var_184_7 * Mathf.Tan(var_184_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_184_10 = var_184_9 * var_184_8.aspect
					local var_184_11 = var_184_6.sprite.bounds.size.x
					local var_184_12 = var_184_6.sprite.bounds.size.y
					local var_184_13 = var_184_10 / var_184_11
					local var_184_14 = var_184_9 / var_184_12
					local var_184_15 = var_184_14 < var_184_13 and var_184_13 or var_184_14

					var_184_5.transform.localScale = Vector3.New(var_184_15, var_184_15, 0)
				end

				for iter_184_0, iter_184_1 in pairs(arg_181_1.bgs_) do
					if iter_184_0 ~= "SK0202" then
						iter_184_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_184_16 = 0

			if var_184_16 < arg_181_1.time_ and arg_181_1.time_ <= var_184_16 + arg_184_0 then
				arg_181_1.mask_.enabled = true
				arg_181_1.mask_.raycastTarget = true

				arg_181_1:SetGaussion(false)
			end

			local var_184_17 = 2

			if var_184_16 <= arg_181_1.time_ and arg_181_1.time_ < var_184_16 + var_184_17 then
				local var_184_18 = (arg_181_1.time_ - var_184_16) / var_184_17
				local var_184_19 = Color.New(1, 1, 1)

				var_184_19.a = Mathf.Lerp(1, 0, var_184_18)
				arg_181_1.mask_.color = var_184_19
			end

			if arg_181_1.time_ >= var_184_16 + var_184_17 and arg_181_1.time_ < var_184_16 + var_184_17 + arg_184_0 then
				local var_184_20 = Color.New(1, 1, 1)
				local var_184_21 = 0

				arg_181_1.mask_.enabled = false
				var_184_20.a = var_184_21
				arg_181_1.mask_.color = var_184_20
			end

			local var_184_22 = "SK0202_blur"

			if arg_181_1.bgs_[var_184_22] == nil then
				local var_184_23 = Object.Instantiate(arg_181_1.blurPaintGo_)
				local var_184_24 = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_184_22)

				var_184_23:GetComponent("SpriteRenderer").sprite = var_184_24
				var_184_23.name = var_184_22
				var_184_23.transform.parent = arg_181_1.stage_.transform
				var_184_23.transform.localPosition = Vector3.New(0, 100, 0)
				arg_181_1.bgs_[var_184_22] = var_184_23
			end

			local var_184_25 = 0
			local var_184_26 = arg_181_1.bgs_[var_184_22]

			if var_184_25 < arg_181_1.time_ and arg_181_1.time_ <= var_184_25 + arg_184_0 then
				local var_184_27 = manager.ui.mainCamera.transform.localPosition
				local var_184_28 = Vector3.New(0, 0, 10) + Vector3.New(var_184_27.x, var_184_27.y, 0)

				var_184_26.transform.localPosition = var_184_28
				var_184_26.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_184_29 = var_184_26:GetComponent("SpriteRenderer")

				if var_184_29 and var_184_29.sprite then
					local var_184_30 = (var_184_26.transform.localPosition - var_184_27).z
					local var_184_31 = manager.ui.mainCameraCom_
					local var_184_32 = 2 * var_184_30 * Mathf.Tan(var_184_31.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_184_33 = var_184_32 * var_184_31.aspect
					local var_184_34 = var_184_29.sprite.bounds.size.x
					local var_184_35 = var_184_29.sprite.bounds.size.y
					local var_184_36 = var_184_33 / var_184_34
					local var_184_37 = var_184_32 / var_184_35
					local var_184_38 = var_184_37 < var_184_36 and var_184_36 or var_184_37

					var_184_26.transform.localScale = Vector3.New(var_184_38, var_184_38, 0)
				end
			end

			local var_184_39 = 1

			if var_184_25 <= arg_181_1.time_ and arg_181_1.time_ < var_184_25 + var_184_39 then
				local var_184_40 = (arg_181_1.time_ - var_184_25) / var_184_39
				local var_184_41 = Color.New(1, 1, 1)

				var_184_41.a = Mathf.Lerp(0, 1, var_184_40)

				var_184_26:GetComponent("SpriteRenderer").material:SetColor("_Color", var_184_41)
			end

			if arg_181_1.frameCnt_ <= 1 then
				arg_181_1.dialog_:SetActive(false)
			end

			local var_184_42 = 2
			local var_184_43 = 0.9

			if var_184_42 < arg_181_1.time_ and arg_181_1.time_ <= var_184_42 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0

				arg_181_1.dialog_:SetActive(true)

				local var_184_44 = LeanTween.value(arg_181_1.dialog_, 0, 1, 0.3)

				var_184_44:setOnUpdate(LuaHelper.FloatAction(function(arg_185_0)
					arg_181_1.dialogCg_.alpha = arg_185_0
				end))
				var_184_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_181_1.dialog_)
					var_184_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_181_1.duration_ = arg_181_1.duration_ + 0.3

				SetActive(arg_181_1.leftNameGo_, false)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_45 = arg_181_1:GetWordFromCfg(116431045)
				local var_184_46 = arg_181_1:FormatText(var_184_45.content)

				arg_181_1.text_.text = var_184_46

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_47 = 36
				local var_184_48 = utf8.len(var_184_46)
				local var_184_49 = var_184_47 <= 0 and var_184_43 or var_184_43 * (var_184_48 / var_184_47)

				if var_184_49 > 0 and var_184_43 < var_184_49 then
					arg_181_1.talkMaxDuration = var_184_49
					var_184_42 = var_184_42 + 0.3

					if var_184_49 + var_184_42 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_49 + var_184_42
					end
				end

				arg_181_1.text_.text = var_184_46
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)
				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_50 = var_184_42 + 0.3
			local var_184_51 = math.max(var_184_43, arg_181_1.talkMaxDuration)

			if var_184_50 <= arg_181_1.time_ and arg_181_1.time_ < var_184_50 + var_184_51 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_50) / var_184_51

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_50 + var_184_51 and arg_181_1.time_ < var_184_50 + var_184_51 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play116431046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 116431046
		arg_187_1.duration_ = 7

		SetActive(arg_187_1.tipsGo_, false)

		function arg_187_1.onSingleLineFinish_()
			arg_187_1.onSingleLineUpdate_ = nil
			arg_187_1.onSingleLineFinish_ = nil
			arg_187_1.state_ = "waiting"
		end

		function arg_187_1.playNext_(arg_189_0)
			if arg_189_0 == 1 then
				arg_187_0:Play116431047(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = "SK0205"

			if arg_187_1.bgs_[var_190_0] == nil then
				local var_190_1 = Object.Instantiate(arg_187_1.paintGo_)

				var_190_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_190_0)
				var_190_1.name = var_190_0
				var_190_1.transform.parent = arg_187_1.stage_.transform
				var_190_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_187_1.bgs_[var_190_0] = var_190_1
			end

			local var_190_2 = 0

			if var_190_2 < arg_187_1.time_ and arg_187_1.time_ <= var_190_2 + arg_190_0 then
				local var_190_3 = manager.ui.mainCamera.transform.localPosition
				local var_190_4 = Vector3.New(0, 0, 10) + Vector3.New(var_190_3.x, var_190_3.y, 0)
				local var_190_5 = arg_187_1.bgs_.SK0205

				var_190_5.transform.localPosition = var_190_4
				var_190_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_190_6 = var_190_5:GetComponent("SpriteRenderer")

				if var_190_6 and var_190_6.sprite then
					local var_190_7 = (var_190_5.transform.localPosition - var_190_3).z
					local var_190_8 = manager.ui.mainCameraCom_
					local var_190_9 = 2 * var_190_7 * Mathf.Tan(var_190_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_190_10 = var_190_9 * var_190_8.aspect
					local var_190_11 = var_190_6.sprite.bounds.size.x
					local var_190_12 = var_190_6.sprite.bounds.size.y
					local var_190_13 = var_190_10 / var_190_11
					local var_190_14 = var_190_9 / var_190_12
					local var_190_15 = var_190_14 < var_190_13 and var_190_13 or var_190_14

					var_190_5.transform.localScale = Vector3.New(var_190_15, var_190_15, 0)
				end

				for iter_190_0, iter_190_1 in pairs(arg_187_1.bgs_) do
					if iter_190_0 ~= "SK0205" then
						iter_190_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_190_16 = 0

			if var_190_16 < arg_187_1.time_ and arg_187_1.time_ <= var_190_16 + arg_190_0 then
				arg_187_1.mask_.enabled = true
				arg_187_1.mask_.raycastTarget = true

				arg_187_1:SetGaussion(false)
			end

			local var_190_17 = 2

			if var_190_16 <= arg_187_1.time_ and arg_187_1.time_ < var_190_16 + var_190_17 then
				local var_190_18 = (arg_187_1.time_ - var_190_16) / var_190_17
				local var_190_19 = Color.New(1, 1, 1)

				var_190_19.a = Mathf.Lerp(1, 0, var_190_18)
				arg_187_1.mask_.color = var_190_19
			end

			if arg_187_1.time_ >= var_190_16 + var_190_17 and arg_187_1.time_ < var_190_16 + var_190_17 + arg_190_0 then
				local var_190_20 = Color.New(1, 1, 1)
				local var_190_21 = 0

				arg_187_1.mask_.enabled = false
				var_190_20.a = var_190_21
				arg_187_1.mask_.color = var_190_20
			end

			local var_190_22 = "SK0205_blur"

			if arg_187_1.bgs_[var_190_22] == nil then
				local var_190_23 = Object.Instantiate(arg_187_1.blurPaintGo_)
				local var_190_24 = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_190_22)

				var_190_23:GetComponent("SpriteRenderer").sprite = var_190_24
				var_190_23.name = var_190_22
				var_190_23.transform.parent = arg_187_1.stage_.transform
				var_190_23.transform.localPosition = Vector3.New(0, 100, 0)
				arg_187_1.bgs_[var_190_22] = var_190_23
			end

			local var_190_25 = 0
			local var_190_26 = arg_187_1.bgs_[var_190_22]

			if var_190_25 < arg_187_1.time_ and arg_187_1.time_ <= var_190_25 + arg_190_0 then
				local var_190_27 = manager.ui.mainCamera.transform.localPosition
				local var_190_28 = Vector3.New(0, 0, 10) + Vector3.New(var_190_27.x, var_190_27.y, 0)

				var_190_26.transform.localPosition = var_190_28
				var_190_26.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_190_29 = var_190_26:GetComponent("SpriteRenderer")

				if var_190_29 and var_190_29.sprite then
					local var_190_30 = (var_190_26.transform.localPosition - var_190_27).z
					local var_190_31 = manager.ui.mainCameraCom_
					local var_190_32 = 2 * var_190_30 * Mathf.Tan(var_190_31.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_190_33 = var_190_32 * var_190_31.aspect
					local var_190_34 = var_190_29.sprite.bounds.size.x
					local var_190_35 = var_190_29.sprite.bounds.size.y
					local var_190_36 = var_190_33 / var_190_34
					local var_190_37 = var_190_32 / var_190_35
					local var_190_38 = var_190_37 < var_190_36 and var_190_36 or var_190_37

					var_190_26.transform.localScale = Vector3.New(var_190_38, var_190_38, 0)
				end
			end

			local var_190_39 = 1

			if var_190_25 <= arg_187_1.time_ and arg_187_1.time_ < var_190_25 + var_190_39 then
				local var_190_40 = (arg_187_1.time_ - var_190_25) / var_190_39
				local var_190_41 = Color.New(1, 1, 1)

				var_190_41.a = Mathf.Lerp(0, 1, var_190_40)

				var_190_26:GetComponent("SpriteRenderer").material:SetColor("_Color", var_190_41)
			end

			if arg_187_1.frameCnt_ <= 1 then
				arg_187_1.dialog_:SetActive(false)
			end

			local var_190_42 = 2
			local var_190_43 = 0.425

			if var_190_42 < arg_187_1.time_ and arg_187_1.time_ <= var_190_42 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0

				arg_187_1.dialog_:SetActive(true)

				local var_190_44 = LeanTween.value(arg_187_1.dialog_, 0, 1, 0.3)

				var_190_44:setOnUpdate(LuaHelper.FloatAction(function(arg_191_0)
					arg_187_1.dialogCg_.alpha = arg_191_0
				end))
				var_190_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_187_1.dialog_)
					var_190_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_187_1.duration_ = arg_187_1.duration_ + 0.3

				SetActive(arg_187_1.leftNameGo_, false)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_45 = arg_187_1:GetWordFromCfg(116431046)
				local var_190_46 = arg_187_1:FormatText(var_190_45.content)

				arg_187_1.text_.text = var_190_46

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_47 = 17
				local var_190_48 = utf8.len(var_190_46)
				local var_190_49 = var_190_47 <= 0 and var_190_43 or var_190_43 * (var_190_48 / var_190_47)

				if var_190_49 > 0 and var_190_43 < var_190_49 then
					arg_187_1.talkMaxDuration = var_190_49
					var_190_42 = var_190_42 + 0.3

					if var_190_49 + var_190_42 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_49 + var_190_42
					end
				end

				arg_187_1.text_.text = var_190_46
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)
				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_50 = var_190_42 + 0.3
			local var_190_51 = math.max(var_190_43, arg_187_1.talkMaxDuration)

			if var_190_50 <= arg_187_1.time_ and arg_187_1.time_ < var_190_50 + var_190_51 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_50) / var_190_51

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_50 + var_190_51 and arg_187_1.time_ < var_190_50 + var_190_51 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play116431047 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 116431047
		arg_193_1.duration_ = 7

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
		end

		function arg_193_1.playNext_(arg_195_0)
			if arg_195_0 == 1 then
				arg_193_0:Play116431048(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = "SK0106"

			if arg_193_1.bgs_[var_196_0] == nil then
				local var_196_1 = Object.Instantiate(arg_193_1.paintGo_)

				var_196_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_196_0)
				var_196_1.name = var_196_0
				var_196_1.transform.parent = arg_193_1.stage_.transform
				var_196_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_193_1.bgs_[var_196_0] = var_196_1
			end

			local var_196_2 = 0

			if var_196_2 < arg_193_1.time_ and arg_193_1.time_ <= var_196_2 + arg_196_0 then
				local var_196_3 = manager.ui.mainCamera.transform.localPosition
				local var_196_4 = Vector3.New(0, 0, 10) + Vector3.New(var_196_3.x, var_196_3.y, 0)
				local var_196_5 = arg_193_1.bgs_.SK0106

				var_196_5.transform.localPosition = var_196_4
				var_196_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_196_6 = var_196_5:GetComponent("SpriteRenderer")

				if var_196_6 and var_196_6.sprite then
					local var_196_7 = (var_196_5.transform.localPosition - var_196_3).z
					local var_196_8 = manager.ui.mainCameraCom_
					local var_196_9 = 2 * var_196_7 * Mathf.Tan(var_196_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_196_10 = var_196_9 * var_196_8.aspect
					local var_196_11 = var_196_6.sprite.bounds.size.x
					local var_196_12 = var_196_6.sprite.bounds.size.y
					local var_196_13 = var_196_10 / var_196_11
					local var_196_14 = var_196_9 / var_196_12
					local var_196_15 = var_196_14 < var_196_13 and var_196_13 or var_196_14

					var_196_5.transform.localScale = Vector3.New(var_196_15, var_196_15, 0)
				end

				for iter_196_0, iter_196_1 in pairs(arg_193_1.bgs_) do
					if iter_196_0 ~= "SK0106" then
						iter_196_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_196_16 = 0

			if var_196_16 < arg_193_1.time_ and arg_193_1.time_ <= var_196_16 + arg_196_0 then
				arg_193_1.mask_.enabled = true
				arg_193_1.mask_.raycastTarget = true

				arg_193_1:SetGaussion(false)
			end

			local var_196_17 = 2

			if var_196_16 <= arg_193_1.time_ and arg_193_1.time_ < var_196_16 + var_196_17 then
				local var_196_18 = (arg_193_1.time_ - var_196_16) / var_196_17
				local var_196_19 = Color.New(1, 1, 1)

				var_196_19.a = Mathf.Lerp(1, 0, var_196_18)
				arg_193_1.mask_.color = var_196_19
			end

			if arg_193_1.time_ >= var_196_16 + var_196_17 and arg_193_1.time_ < var_196_16 + var_196_17 + arg_196_0 then
				local var_196_20 = Color.New(1, 1, 1)
				local var_196_21 = 0

				arg_193_1.mask_.enabled = false
				var_196_20.a = var_196_21
				arg_193_1.mask_.color = var_196_20
			end

			local var_196_22 = "SK0106_blur"

			if arg_193_1.bgs_[var_196_22] == nil then
				local var_196_23 = Object.Instantiate(arg_193_1.blurPaintGo_)
				local var_196_24 = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_196_22)

				var_196_23:GetComponent("SpriteRenderer").sprite = var_196_24
				var_196_23.name = var_196_22
				var_196_23.transform.parent = arg_193_1.stage_.transform
				var_196_23.transform.localPosition = Vector3.New(0, 100, 0)
				arg_193_1.bgs_[var_196_22] = var_196_23
			end

			local var_196_25 = 0
			local var_196_26 = arg_193_1.bgs_[var_196_22]

			if var_196_25 < arg_193_1.time_ and arg_193_1.time_ <= var_196_25 + arg_196_0 then
				local var_196_27 = manager.ui.mainCamera.transform.localPosition
				local var_196_28 = Vector3.New(0, 0, 10) + Vector3.New(var_196_27.x, var_196_27.y, 0)

				var_196_26.transform.localPosition = var_196_28
				var_196_26.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_196_29 = var_196_26:GetComponent("SpriteRenderer")

				if var_196_29 and var_196_29.sprite then
					local var_196_30 = (var_196_26.transform.localPosition - var_196_27).z
					local var_196_31 = manager.ui.mainCameraCom_
					local var_196_32 = 2 * var_196_30 * Mathf.Tan(var_196_31.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_196_33 = var_196_32 * var_196_31.aspect
					local var_196_34 = var_196_29.sprite.bounds.size.x
					local var_196_35 = var_196_29.sprite.bounds.size.y
					local var_196_36 = var_196_33 / var_196_34
					local var_196_37 = var_196_32 / var_196_35
					local var_196_38 = var_196_37 < var_196_36 and var_196_36 or var_196_37

					var_196_26.transform.localScale = Vector3.New(var_196_38, var_196_38, 0)
				end
			end

			local var_196_39 = 1

			if var_196_25 <= arg_193_1.time_ and arg_193_1.time_ < var_196_25 + var_196_39 then
				local var_196_40 = (arg_193_1.time_ - var_196_25) / var_196_39
				local var_196_41 = Color.New(1, 1, 1)

				var_196_41.a = Mathf.Lerp(0, 1, var_196_40)

				var_196_26:GetComponent("SpriteRenderer").material:SetColor("_Color", var_196_41)
			end

			if arg_193_1.frameCnt_ <= 1 then
				arg_193_1.dialog_:SetActive(false)
			end

			local var_196_42 = 2
			local var_196_43 = 0.425

			if var_196_42 < arg_193_1.time_ and arg_193_1.time_ <= var_196_42 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0

				arg_193_1.dialog_:SetActive(true)

				local var_196_44 = LeanTween.value(arg_193_1.dialog_, 0, 1, 0.3)

				var_196_44:setOnUpdate(LuaHelper.FloatAction(function(arg_197_0)
					arg_193_1.dialogCg_.alpha = arg_197_0
				end))
				var_196_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_193_1.dialog_)
					var_196_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_193_1.duration_ = arg_193_1.duration_ + 0.3

				SetActive(arg_193_1.leftNameGo_, false)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_45 = arg_193_1:GetWordFromCfg(116431047)
				local var_196_46 = arg_193_1:FormatText(var_196_45.content)

				arg_193_1.text_.text = var_196_46

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_47 = 17
				local var_196_48 = utf8.len(var_196_46)
				local var_196_49 = var_196_47 <= 0 and var_196_43 or var_196_43 * (var_196_48 / var_196_47)

				if var_196_49 > 0 and var_196_43 < var_196_49 then
					arg_193_1.talkMaxDuration = var_196_49
					var_196_42 = var_196_42 + 0.3

					if var_196_49 + var_196_42 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_49 + var_196_42
					end
				end

				arg_193_1.text_.text = var_196_46
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)
				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_50 = var_196_42 + 0.3
			local var_196_51 = math.max(var_196_43, arg_193_1.talkMaxDuration)

			if var_196_50 <= arg_193_1.time_ and arg_193_1.time_ < var_196_50 + var_196_51 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_50) / var_196_51

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_50 + var_196_51 and arg_193_1.time_ < var_196_50 + var_196_51 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play116431048 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 116431048
		arg_199_1.duration_ = 7

		SetActive(arg_199_1.tipsGo_, false)

		function arg_199_1.onSingleLineFinish_()
			arg_199_1.onSingleLineUpdate_ = nil
			arg_199_1.onSingleLineFinish_ = nil
			arg_199_1.state_ = "waiting"
		end

		function arg_199_1.playNext_(arg_201_0)
			if arg_201_0 == 1 then
				arg_199_0:Play116431049(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = "SK0206"

			if arg_199_1.bgs_[var_202_0] == nil then
				local var_202_1 = Object.Instantiate(arg_199_1.paintGo_)

				var_202_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_202_0)
				var_202_1.name = var_202_0
				var_202_1.transform.parent = arg_199_1.stage_.transform
				var_202_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_199_1.bgs_[var_202_0] = var_202_1
			end

			local var_202_2 = 0

			if var_202_2 < arg_199_1.time_ and arg_199_1.time_ <= var_202_2 + arg_202_0 then
				local var_202_3 = manager.ui.mainCamera.transform.localPosition
				local var_202_4 = Vector3.New(0, 0, 10) + Vector3.New(var_202_3.x, var_202_3.y, 0)
				local var_202_5 = arg_199_1.bgs_.SK0206

				var_202_5.transform.localPosition = var_202_4
				var_202_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_202_6 = var_202_5:GetComponent("SpriteRenderer")

				if var_202_6 and var_202_6.sprite then
					local var_202_7 = (var_202_5.transform.localPosition - var_202_3).z
					local var_202_8 = manager.ui.mainCameraCom_
					local var_202_9 = 2 * var_202_7 * Mathf.Tan(var_202_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_202_10 = var_202_9 * var_202_8.aspect
					local var_202_11 = var_202_6.sprite.bounds.size.x
					local var_202_12 = var_202_6.sprite.bounds.size.y
					local var_202_13 = var_202_10 / var_202_11
					local var_202_14 = var_202_9 / var_202_12
					local var_202_15 = var_202_14 < var_202_13 and var_202_13 or var_202_14

					var_202_5.transform.localScale = Vector3.New(var_202_15, var_202_15, 0)
				end

				for iter_202_0, iter_202_1 in pairs(arg_199_1.bgs_) do
					if iter_202_0 ~= "SK0206" then
						iter_202_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_202_16 = 0

			if var_202_16 < arg_199_1.time_ and arg_199_1.time_ <= var_202_16 + arg_202_0 then
				arg_199_1.mask_.enabled = true
				arg_199_1.mask_.raycastTarget = true

				arg_199_1:SetGaussion(false)
			end

			local var_202_17 = 2

			if var_202_16 <= arg_199_1.time_ and arg_199_1.time_ < var_202_16 + var_202_17 then
				local var_202_18 = (arg_199_1.time_ - var_202_16) / var_202_17
				local var_202_19 = Color.New(1, 1, 1)

				var_202_19.a = Mathf.Lerp(1, 0, var_202_18)
				arg_199_1.mask_.color = var_202_19
			end

			if arg_199_1.time_ >= var_202_16 + var_202_17 and arg_199_1.time_ < var_202_16 + var_202_17 + arg_202_0 then
				local var_202_20 = Color.New(1, 1, 1)
				local var_202_21 = 0

				arg_199_1.mask_.enabled = false
				var_202_20.a = var_202_21
				arg_199_1.mask_.color = var_202_20
			end

			local var_202_22 = "SK0206_blur"

			if arg_199_1.bgs_[var_202_22] == nil then
				local var_202_23 = Object.Instantiate(arg_199_1.blurPaintGo_)
				local var_202_24 = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_202_22)

				var_202_23:GetComponent("SpriteRenderer").sprite = var_202_24
				var_202_23.name = var_202_22
				var_202_23.transform.parent = arg_199_1.stage_.transform
				var_202_23.transform.localPosition = Vector3.New(0, 100, 0)
				arg_199_1.bgs_[var_202_22] = var_202_23
			end

			local var_202_25 = 0
			local var_202_26 = arg_199_1.bgs_[var_202_22]

			if var_202_25 < arg_199_1.time_ and arg_199_1.time_ <= var_202_25 + arg_202_0 then
				local var_202_27 = manager.ui.mainCamera.transform.localPosition
				local var_202_28 = Vector3.New(0, 0, 10) + Vector3.New(var_202_27.x, var_202_27.y, 0)

				var_202_26.transform.localPosition = var_202_28
				var_202_26.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_202_29 = var_202_26:GetComponent("SpriteRenderer")

				if var_202_29 and var_202_29.sprite then
					local var_202_30 = (var_202_26.transform.localPosition - var_202_27).z
					local var_202_31 = manager.ui.mainCameraCom_
					local var_202_32 = 2 * var_202_30 * Mathf.Tan(var_202_31.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_202_33 = var_202_32 * var_202_31.aspect
					local var_202_34 = var_202_29.sprite.bounds.size.x
					local var_202_35 = var_202_29.sprite.bounds.size.y
					local var_202_36 = var_202_33 / var_202_34
					local var_202_37 = var_202_32 / var_202_35
					local var_202_38 = var_202_37 < var_202_36 and var_202_36 or var_202_37

					var_202_26.transform.localScale = Vector3.New(var_202_38, var_202_38, 0)
				end
			end

			local var_202_39 = 1

			if var_202_25 <= arg_199_1.time_ and arg_199_1.time_ < var_202_25 + var_202_39 then
				local var_202_40 = (arg_199_1.time_ - var_202_25) / var_202_39
				local var_202_41 = Color.New(1, 1, 1)

				var_202_41.a = Mathf.Lerp(0, 1, var_202_40)

				var_202_26:GetComponent("SpriteRenderer").material:SetColor("_Color", var_202_41)
			end

			if arg_199_1.frameCnt_ <= 1 then
				arg_199_1.dialog_:SetActive(false)
			end

			local var_202_42 = 2
			local var_202_43 = 0.425

			if var_202_42 < arg_199_1.time_ and arg_199_1.time_ <= var_202_42 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0

				arg_199_1.dialog_:SetActive(true)

				local var_202_44 = LeanTween.value(arg_199_1.dialog_, 0, 1, 0.3)

				var_202_44:setOnUpdate(LuaHelper.FloatAction(function(arg_203_0)
					arg_199_1.dialogCg_.alpha = arg_203_0
				end))
				var_202_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_199_1.dialog_)
					var_202_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_199_1.duration_ = arg_199_1.duration_ + 0.3

				SetActive(arg_199_1.leftNameGo_, false)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_45 = arg_199_1:GetWordFromCfg(116431048)
				local var_202_46 = arg_199_1:FormatText(var_202_45.content)

				arg_199_1.text_.text = var_202_46

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_47 = 17
				local var_202_48 = utf8.len(var_202_46)
				local var_202_49 = var_202_47 <= 0 and var_202_43 or var_202_43 * (var_202_48 / var_202_47)

				if var_202_49 > 0 and var_202_43 < var_202_49 then
					arg_199_1.talkMaxDuration = var_202_49
					var_202_42 = var_202_42 + 0.3

					if var_202_49 + var_202_42 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_49 + var_202_42
					end
				end

				arg_199_1.text_.text = var_202_46
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)
				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_50 = var_202_42 + 0.3
			local var_202_51 = math.max(var_202_43, arg_199_1.talkMaxDuration)

			if var_202_50 <= arg_199_1.time_ and arg_199_1.time_ < var_202_50 + var_202_51 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_50) / var_202_51

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_50 + var_202_51 and arg_199_1.time_ < var_202_50 + var_202_51 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play116431049 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 116431049
		arg_205_1.duration_ = 8.666

		local var_205_0 = {
			zh = 8.666,
			ja = 8.1
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
				arg_205_0:Play116431050(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = "I05e"

			if arg_205_1.bgs_[var_208_0] == nil then
				local var_208_1 = Object.Instantiate(arg_205_1.paintGo_)

				var_208_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_208_0)
				var_208_1.name = var_208_0
				var_208_1.transform.parent = arg_205_1.stage_.transform
				var_208_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_205_1.bgs_[var_208_0] = var_208_1
			end

			local var_208_2 = 0

			if var_208_2 < arg_205_1.time_ and arg_205_1.time_ <= var_208_2 + arg_208_0 then
				local var_208_3 = manager.ui.mainCamera.transform.localPosition
				local var_208_4 = Vector3.New(0, 0, 10) + Vector3.New(var_208_3.x, var_208_3.y, 0)
				local var_208_5 = arg_205_1.bgs_.I05e

				var_208_5.transform.localPosition = var_208_4
				var_208_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_208_6 = var_208_5:GetComponent("SpriteRenderer")

				if var_208_6 and var_208_6.sprite then
					local var_208_7 = (var_208_5.transform.localPosition - var_208_3).z
					local var_208_8 = manager.ui.mainCameraCom_
					local var_208_9 = 2 * var_208_7 * Mathf.Tan(var_208_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_208_10 = var_208_9 * var_208_8.aspect
					local var_208_11 = var_208_6.sprite.bounds.size.x
					local var_208_12 = var_208_6.sprite.bounds.size.y
					local var_208_13 = var_208_10 / var_208_11
					local var_208_14 = var_208_9 / var_208_12
					local var_208_15 = var_208_14 < var_208_13 and var_208_13 or var_208_14

					var_208_5.transform.localScale = Vector3.New(var_208_15, var_208_15, 0)
				end

				for iter_208_0, iter_208_1 in pairs(arg_205_1.bgs_) do
					if iter_208_0 ~= "I05e" then
						iter_208_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_208_16 = 0

			if var_208_16 < arg_205_1.time_ and arg_205_1.time_ <= var_208_16 + arg_208_0 then
				arg_205_1.mask_.enabled = true
				arg_205_1.mask_.raycastTarget = true

				arg_205_1:SetGaussion(false)
			end

			local var_208_17 = 2

			if var_208_16 <= arg_205_1.time_ and arg_205_1.time_ < var_208_16 + var_208_17 then
				local var_208_18 = (arg_205_1.time_ - var_208_16) / var_208_17
				local var_208_19 = Color.New(1, 1, 1)

				var_208_19.a = Mathf.Lerp(1, 0, var_208_18)
				arg_205_1.mask_.color = var_208_19
			end

			if arg_205_1.time_ >= var_208_16 + var_208_17 and arg_205_1.time_ < var_208_16 + var_208_17 + arg_208_0 then
				local var_208_20 = Color.New(1, 1, 1)
				local var_208_21 = 0

				arg_205_1.mask_.enabled = false
				var_208_20.a = var_208_21
				arg_205_1.mask_.color = var_208_20
			end

			local var_208_22 = "10025ui_story"

			if arg_205_1.actors_[var_208_22] == nil then
				local var_208_23 = Object.Instantiate(Asset.Load("Char/" .. var_208_22), arg_205_1.stage_.transform)

				var_208_23.name = var_208_22
				var_208_23.transform.localPosition = Vector3.New(0, 100, 0)
				arg_205_1.actors_[var_208_22] = var_208_23

				local var_208_24 = var_208_23:GetComponentInChildren(typeof(CharacterEffect))

				var_208_24.enabled = true

				local var_208_25 = GameObjectTools.GetOrAddComponent(var_208_23, typeof(DynamicBoneHelper))

				if var_208_25 then
					var_208_25:EnableDynamicBone(false)
				end

				arg_205_1:ShowWeapon(var_208_24.transform, false)

				arg_205_1.var_[var_208_22 .. "Animator"] = var_208_24.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_205_1.var_[var_208_22 .. "Animator"].applyRootMotion = true
				arg_205_1.var_[var_208_22 .. "LipSync"] = var_208_24.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_208_26 = arg_205_1.actors_["10025ui_story"].transform
			local var_208_27 = 0.7

			if var_208_27 < arg_205_1.time_ and arg_205_1.time_ <= var_208_27 + arg_208_0 then
				arg_205_1.var_.moveOldPos10025ui_story = var_208_26.localPosition
			end

			local var_208_28 = 0.001

			if var_208_27 <= arg_205_1.time_ and arg_205_1.time_ < var_208_27 + var_208_28 then
				local var_208_29 = (arg_205_1.time_ - var_208_27) / var_208_28
				local var_208_30 = Vector3.New(0, -1.1, -5.9)

				var_208_26.localPosition = Vector3.Lerp(arg_205_1.var_.moveOldPos10025ui_story, var_208_30, var_208_29)

				local var_208_31 = manager.ui.mainCamera.transform.position - var_208_26.position

				var_208_26.forward = Vector3.New(var_208_31.x, var_208_31.y, var_208_31.z)

				local var_208_32 = var_208_26.localEulerAngles

				var_208_32.z = 0
				var_208_32.x = 0
				var_208_26.localEulerAngles = var_208_32
			end

			if arg_205_1.time_ >= var_208_27 + var_208_28 and arg_205_1.time_ < var_208_27 + var_208_28 + arg_208_0 then
				var_208_26.localPosition = Vector3.New(0, -1.1, -5.9)

				local var_208_33 = manager.ui.mainCamera.transform.position - var_208_26.position

				var_208_26.forward = Vector3.New(var_208_33.x, var_208_33.y, var_208_33.z)

				local var_208_34 = var_208_26.localEulerAngles

				var_208_34.z = 0
				var_208_34.x = 0
				var_208_26.localEulerAngles = var_208_34
			end

			local var_208_35 = arg_205_1.actors_["10025ui_story"]
			local var_208_36 = 0.7

			if var_208_36 < arg_205_1.time_ and arg_205_1.time_ <= var_208_36 + arg_208_0 and arg_205_1.var_.characterEffect10025ui_story == nil then
				arg_205_1.var_.characterEffect10025ui_story = var_208_35:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_208_37 = 0.2

			if var_208_36 <= arg_205_1.time_ and arg_205_1.time_ < var_208_36 + var_208_37 then
				local var_208_38 = (arg_205_1.time_ - var_208_36) / var_208_37

				if arg_205_1.var_.characterEffect10025ui_story then
					arg_205_1.var_.characterEffect10025ui_story.fillFlat = false
				end
			end

			if arg_205_1.time_ >= var_208_36 + var_208_37 and arg_205_1.time_ < var_208_36 + var_208_37 + arg_208_0 and arg_205_1.var_.characterEffect10025ui_story then
				arg_205_1.var_.characterEffect10025ui_story.fillFlat = false
			end

			local var_208_39 = 0.7

			if var_208_39 < arg_205_1.time_ and arg_205_1.time_ <= var_208_39 + arg_208_0 then
				arg_205_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action7_1")
			end

			local var_208_40 = 0.7

			if var_208_40 < arg_205_1.time_ and arg_205_1.time_ <= var_208_40 + arg_208_0 then
				arg_205_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_208_41 = "I05e_blur"

			if arg_205_1.bgs_[var_208_41] == nil then
				local var_208_42 = Object.Instantiate(arg_205_1.blurPaintGo_)
				local var_208_43 = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_208_41)

				var_208_42:GetComponent("SpriteRenderer").sprite = var_208_43
				var_208_42.name = var_208_41
				var_208_42.transform.parent = arg_205_1.stage_.transform
				var_208_42.transform.localPosition = Vector3.New(0, 100, 0)
				arg_205_1.bgs_[var_208_41] = var_208_42
			end

			local var_208_44 = 0.7
			local var_208_45 = arg_205_1.bgs_[var_208_41]

			if var_208_44 < arg_205_1.time_ and arg_205_1.time_ <= var_208_44 + arg_208_0 then
				local var_208_46 = manager.ui.mainCamera.transform.localPosition
				local var_208_47 = Vector3.New(0, 0, 10) + Vector3.New(var_208_46.x, var_208_46.y, 0)

				var_208_45.transform.localPosition = var_208_47
				var_208_45.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_208_48 = var_208_45:GetComponent("SpriteRenderer")

				if var_208_48 and var_208_48.sprite then
					local var_208_49 = (var_208_45.transform.localPosition - var_208_46).z
					local var_208_50 = manager.ui.mainCameraCom_
					local var_208_51 = 2 * var_208_49 * Mathf.Tan(var_208_50.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_208_52 = var_208_51 * var_208_50.aspect
					local var_208_53 = var_208_48.sprite.bounds.size.x
					local var_208_54 = var_208_48.sprite.bounds.size.y
					local var_208_55 = var_208_52 / var_208_53
					local var_208_56 = var_208_51 / var_208_54
					local var_208_57 = var_208_56 < var_208_55 and var_208_55 or var_208_56

					var_208_45.transform.localScale = Vector3.New(var_208_57, var_208_57, 0)
				end
			end

			local var_208_58 = 2

			if var_208_44 <= arg_205_1.time_ and arg_205_1.time_ < var_208_44 + var_208_58 then
				local var_208_59 = (arg_205_1.time_ - var_208_44) / var_208_58
				local var_208_60 = Color.New(1, 1, 1)

				var_208_60.a = Mathf.Lerp(0, 1, var_208_59)

				var_208_45:GetComponent("SpriteRenderer").material:SetColor("_Color", var_208_60)
			end

			if arg_205_1.frameCnt_ <= 1 then
				arg_205_1.dialog_:SetActive(false)
			end

			local var_208_61 = 2
			local var_208_62 = 0.35

			if var_208_61 < arg_205_1.time_ and arg_205_1.time_ <= var_208_61 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0

				arg_205_1.dialog_:SetActive(true)

				local var_208_63 = LeanTween.value(arg_205_1.dialog_, 0, 1, 0.3)

				var_208_63:setOnUpdate(LuaHelper.FloatAction(function(arg_209_0)
					arg_205_1.dialogCg_.alpha = arg_209_0
				end))
				var_208_63:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_205_1.dialog_)
					var_208_63:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_205_1.duration_ = arg_205_1.duration_ + 0.3

				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_64 = arg_205_1:FormatText(StoryNameCfg[36].name)

				arg_205_1.leftNameTxt_.text = var_208_64

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_65 = arg_205_1:GetWordFromCfg(116431049)
				local var_208_66 = arg_205_1:FormatText(var_208_65.content)

				arg_205_1.text_.text = var_208_66

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_67 = 14
				local var_208_68 = utf8.len(var_208_66)
				local var_208_69 = var_208_67 <= 0 and var_208_62 or var_208_62 * (var_208_68 / var_208_67)

				if var_208_69 > 0 and var_208_62 < var_208_69 then
					arg_205_1.talkMaxDuration = var_208_69
					var_208_61 = var_208_61 + 0.3

					if var_208_69 + var_208_61 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_69 + var_208_61
					end
				end

				arg_205_1.text_.text = var_208_66
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431049", "story_v_out_116431.awb") ~= 0 then
					local var_208_70 = manager.audio:GetVoiceLength("story_v_out_116431", "116431049", "story_v_out_116431.awb") / 1000

					if var_208_70 + var_208_61 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_70 + var_208_61
					end

					if var_208_65.prefab_name ~= "" and arg_205_1.actors_[var_208_65.prefab_name] ~= nil then
						local var_208_71 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_65.prefab_name].transform, "story_v_out_116431", "116431049", "story_v_out_116431.awb")

						arg_205_1:RecordAudio("116431049", var_208_71)
						arg_205_1:RecordAudio("116431049", var_208_71)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_116431", "116431049", "story_v_out_116431.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_116431", "116431049", "story_v_out_116431.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_72 = var_208_61 + 0.3
			local var_208_73 = math.max(var_208_62, arg_205_1.talkMaxDuration)

			if var_208_72 <= arg_205_1.time_ and arg_205_1.time_ < var_208_72 + var_208_73 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_72) / var_208_73

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_72 + var_208_73 and arg_205_1.time_ < var_208_72 + var_208_73 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play116431050 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 116431050
		arg_211_1.duration_ = 7

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play116431051(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = "SK0211"

			if arg_211_1.bgs_[var_214_0] == nil then
				local var_214_1 = Object.Instantiate(arg_211_1.paintGo_)

				var_214_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_214_0)
				var_214_1.name = var_214_0
				var_214_1.transform.parent = arg_211_1.stage_.transform
				var_214_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_211_1.bgs_[var_214_0] = var_214_1
			end

			local var_214_2 = 0

			if var_214_2 < arg_211_1.time_ and arg_211_1.time_ <= var_214_2 + arg_214_0 then
				local var_214_3 = manager.ui.mainCamera.transform.localPosition
				local var_214_4 = Vector3.New(0, 0, 10) + Vector3.New(var_214_3.x, var_214_3.y, 0)
				local var_214_5 = arg_211_1.bgs_.SK0211

				var_214_5.transform.localPosition = var_214_4
				var_214_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_214_6 = var_214_5:GetComponent("SpriteRenderer")

				if var_214_6 and var_214_6.sprite then
					local var_214_7 = (var_214_5.transform.localPosition - var_214_3).z
					local var_214_8 = manager.ui.mainCameraCom_
					local var_214_9 = 2 * var_214_7 * Mathf.Tan(var_214_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_214_10 = var_214_9 * var_214_8.aspect
					local var_214_11 = var_214_6.sprite.bounds.size.x
					local var_214_12 = var_214_6.sprite.bounds.size.y
					local var_214_13 = var_214_10 / var_214_11
					local var_214_14 = var_214_9 / var_214_12
					local var_214_15 = var_214_14 < var_214_13 and var_214_13 or var_214_14

					var_214_5.transform.localScale = Vector3.New(var_214_15, var_214_15, 0)
				end

				for iter_214_0, iter_214_1 in pairs(arg_211_1.bgs_) do
					if iter_214_0 ~= "SK0211" then
						iter_214_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_214_16 = 0

			if var_214_16 < arg_211_1.time_ and arg_211_1.time_ <= var_214_16 + arg_214_0 then
				arg_211_1.mask_.enabled = true
				arg_211_1.mask_.raycastTarget = true

				arg_211_1:SetGaussion(false)
			end

			local var_214_17 = 2

			if var_214_16 <= arg_211_1.time_ and arg_211_1.time_ < var_214_16 + var_214_17 then
				local var_214_18 = (arg_211_1.time_ - var_214_16) / var_214_17
				local var_214_19 = Color.New(1, 1, 1)

				var_214_19.a = Mathf.Lerp(1, 0, var_214_18)
				arg_211_1.mask_.color = var_214_19
			end

			if arg_211_1.time_ >= var_214_16 + var_214_17 and arg_211_1.time_ < var_214_16 + var_214_17 + arg_214_0 then
				local var_214_20 = Color.New(1, 1, 1)
				local var_214_21 = 0

				arg_211_1.mask_.enabled = false
				var_214_20.a = var_214_21
				arg_211_1.mask_.color = var_214_20
			end

			local var_214_22 = arg_211_1.actors_["10025ui_story"].transform
			local var_214_23 = 0

			if var_214_23 < arg_211_1.time_ and arg_211_1.time_ <= var_214_23 + arg_214_0 then
				arg_211_1.var_.moveOldPos10025ui_story = var_214_22.localPosition
			end

			local var_214_24 = 0.001

			if var_214_23 <= arg_211_1.time_ and arg_211_1.time_ < var_214_23 + var_214_24 then
				local var_214_25 = (arg_211_1.time_ - var_214_23) / var_214_24
				local var_214_26 = Vector3.New(0, 100, 0)

				var_214_22.localPosition = Vector3.Lerp(arg_211_1.var_.moveOldPos10025ui_story, var_214_26, var_214_25)

				local var_214_27 = manager.ui.mainCamera.transform.position - var_214_22.position

				var_214_22.forward = Vector3.New(var_214_27.x, var_214_27.y, var_214_27.z)

				local var_214_28 = var_214_22.localEulerAngles

				var_214_28.z = 0
				var_214_28.x = 0
				var_214_22.localEulerAngles = var_214_28
			end

			if arg_211_1.time_ >= var_214_23 + var_214_24 and arg_211_1.time_ < var_214_23 + var_214_24 + arg_214_0 then
				var_214_22.localPosition = Vector3.New(0, 100, 0)

				local var_214_29 = manager.ui.mainCamera.transform.position - var_214_22.position

				var_214_22.forward = Vector3.New(var_214_29.x, var_214_29.y, var_214_29.z)

				local var_214_30 = var_214_22.localEulerAngles

				var_214_30.z = 0
				var_214_30.x = 0
				var_214_22.localEulerAngles = var_214_30
			end

			local var_214_31 = 0
			local var_214_32 = 0.666666666666667

			if var_214_31 < arg_211_1.time_ and arg_211_1.time_ <= var_214_31 + arg_214_0 then
				local var_214_33 = "play"
				local var_214_34 = "music"

				arg_211_1:AudioAction(var_214_33, var_214_34, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_211_1.frameCnt_ <= 1 then
				arg_211_1.dialog_:SetActive(false)
			end

			local var_214_35 = 2
			local var_214_36 = 0.375

			if var_214_35 < arg_211_1.time_ and arg_211_1.time_ <= var_214_35 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0

				arg_211_1.dialog_:SetActive(true)

				local var_214_37 = LeanTween.value(arg_211_1.dialog_, 0, 1, 0.3)

				var_214_37:setOnUpdate(LuaHelper.FloatAction(function(arg_215_0)
					arg_211_1.dialogCg_.alpha = arg_215_0
				end))
				var_214_37:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_211_1.dialog_)
					var_214_37:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_211_1.duration_ = arg_211_1.duration_ + 0.3

				SetActive(arg_211_1.leftNameGo_, false)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_38 = arg_211_1:GetWordFromCfg(116431050)
				local var_214_39 = arg_211_1:FormatText(var_214_38.content)

				arg_211_1.text_.text = var_214_39

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_40 = 15
				local var_214_41 = utf8.len(var_214_39)
				local var_214_42 = var_214_40 <= 0 and var_214_36 or var_214_36 * (var_214_41 / var_214_40)

				if var_214_42 > 0 and var_214_36 < var_214_42 then
					arg_211_1.talkMaxDuration = var_214_42
					var_214_35 = var_214_35 + 0.3

					if var_214_42 + var_214_35 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_42 + var_214_35
					end
				end

				arg_211_1.text_.text = var_214_39
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)
				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_43 = var_214_35 + 0.3
			local var_214_44 = math.max(var_214_36, arg_211_1.talkMaxDuration)

			if var_214_43 <= arg_211_1.time_ and arg_211_1.time_ < var_214_43 + var_214_44 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_43) / var_214_44

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_43 + var_214_44 and arg_211_1.time_ < var_214_43 + var_214_44 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play116431051 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 116431051
		arg_217_1.duration_ = 5.299999999999

		SetActive(arg_217_1.tipsGo_, false)

		function arg_217_1.onSingleLineFinish_()
			arg_217_1.onSingleLineUpdate_ = nil
			arg_217_1.onSingleLineFinish_ = nil
			arg_217_1.state_ = "waiting"
		end

		function arg_217_1.playNext_(arg_219_0)
			if arg_219_0 == 1 then
				arg_217_0:Play116431052(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = "STblack"

			if arg_217_1.bgs_[var_220_0] == nil then
				local var_220_1 = Object.Instantiate(arg_217_1.paintGo_)

				var_220_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_220_0)
				var_220_1.name = var_220_0
				var_220_1.transform.parent = arg_217_1.stage_.transform
				var_220_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_217_1.bgs_[var_220_0] = var_220_1
			end

			local var_220_2 = 2

			if var_220_2 < arg_217_1.time_ and arg_217_1.time_ <= var_220_2 + arg_220_0 then
				local var_220_3 = manager.ui.mainCamera.transform.localPosition
				local var_220_4 = Vector3.New(0, 0, 10) + Vector3.New(var_220_3.x, var_220_3.y, 0)
				local var_220_5 = arg_217_1.bgs_.STblack

				var_220_5.transform.localPosition = var_220_4
				var_220_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_220_6 = var_220_5:GetComponent("SpriteRenderer")

				if var_220_6 and var_220_6.sprite then
					local var_220_7 = (var_220_5.transform.localPosition - var_220_3).z
					local var_220_8 = manager.ui.mainCameraCom_
					local var_220_9 = 2 * var_220_7 * Mathf.Tan(var_220_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_220_10 = var_220_9 * var_220_8.aspect
					local var_220_11 = var_220_6.sprite.bounds.size.x
					local var_220_12 = var_220_6.sprite.bounds.size.y
					local var_220_13 = var_220_10 / var_220_11
					local var_220_14 = var_220_9 / var_220_12
					local var_220_15 = var_220_14 < var_220_13 and var_220_13 or var_220_14

					var_220_5.transform.localScale = Vector3.New(var_220_15, var_220_15, 0)
				end

				for iter_220_0, iter_220_1 in pairs(arg_217_1.bgs_) do
					if iter_220_0 ~= "STblack" then
						iter_220_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_220_16 = 0

			if var_220_16 < arg_217_1.time_ and arg_217_1.time_ <= var_220_16 + arg_220_0 then
				arg_217_1.mask_.enabled = true
				arg_217_1.mask_.raycastTarget = true

				arg_217_1:SetGaussion(false)
			end

			local var_220_17 = 2

			if var_220_16 <= arg_217_1.time_ and arg_217_1.time_ < var_220_16 + var_220_17 then
				local var_220_18 = (arg_217_1.time_ - var_220_16) / var_220_17
				local var_220_19 = Color.New(0, 0, 0)

				var_220_19.a = Mathf.Lerp(0, 1, var_220_18)
				arg_217_1.mask_.color = var_220_19
			end

			if arg_217_1.time_ >= var_220_16 + var_220_17 and arg_217_1.time_ < var_220_16 + var_220_17 + arg_220_0 then
				local var_220_20 = Color.New(0, 0, 0)

				var_220_20.a = 1
				arg_217_1.mask_.color = var_220_20
			end

			local var_220_21 = 2

			if var_220_21 < arg_217_1.time_ and arg_217_1.time_ <= var_220_21 + arg_220_0 then
				arg_217_1.mask_.enabled = true
				arg_217_1.mask_.raycastTarget = true

				arg_217_1:SetGaussion(false)
			end

			local var_220_22 = 2

			if var_220_21 <= arg_217_1.time_ and arg_217_1.time_ < var_220_21 + var_220_22 then
				local var_220_23 = (arg_217_1.time_ - var_220_21) / var_220_22
				local var_220_24 = Color.New(0, 0, 0)

				var_220_24.a = Mathf.Lerp(1, 0, var_220_23)
				arg_217_1.mask_.color = var_220_24
			end

			if arg_217_1.time_ >= var_220_21 + var_220_22 and arg_217_1.time_ < var_220_21 + var_220_22 + arg_220_0 then
				local var_220_25 = Color.New(0, 0, 0)
				local var_220_26 = 0

				arg_217_1.mask_.enabled = false
				var_220_25.a = var_220_26
				arg_217_1.mask_.color = var_220_25
			end

			local var_220_27 = 2

			if var_220_27 < arg_217_1.time_ and arg_217_1.time_ <= var_220_27 + arg_220_0 then
				arg_217_1.fswbg_:SetActive(true)
				arg_217_1.dialog_:SetActive(false)

				arg_217_1.fswtw_.percent = 0

				local var_220_28 = arg_217_1:GetWordFromCfg(116431051)
				local var_220_29 = arg_217_1:FormatText(var_220_28.content)

				arg_217_1.fswt_.text = var_220_29

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.fswt_)

				arg_217_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_217_1.fswtw_:SetDirty()

				arg_217_1.typewritterCharCountI18N = 0

				SetActive(arg_217_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_217_1:ShowNextGo(false)
			end

			local var_220_30 = 2.01666666666667

			if var_220_30 < arg_217_1.time_ and arg_217_1.time_ <= var_220_30 + arg_220_0 then
				arg_217_1.var_.oldValueTypewriter = arg_217_1.fswtw_.percent

				arg_217_1:ShowNextGo(false)
			end

			local var_220_31 = 6
			local var_220_32 = 0.4
			local var_220_33 = arg_217_1:GetWordFromCfg(116431051)
			local var_220_34 = arg_217_1:FormatText(var_220_33.content)
			local var_220_35, var_220_36 = arg_217_1:GetPercentByPara(var_220_34, 1)

			if var_220_30 < arg_217_1.time_ and arg_217_1.time_ <= var_220_30 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0

				local var_220_37 = var_220_31 <= 0 and var_220_32 or var_220_32 * ((var_220_36 - arg_217_1.typewritterCharCountI18N) / var_220_31)

				if var_220_37 > 0 and var_220_32 < var_220_37 then
					arg_217_1.talkMaxDuration = var_220_37

					if var_220_37 + var_220_30 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_37 + var_220_30
					end
				end
			end

			local var_220_38 = 0.4
			local var_220_39 = math.max(var_220_38, arg_217_1.talkMaxDuration)

			if var_220_30 <= arg_217_1.time_ and arg_217_1.time_ < var_220_30 + var_220_39 then
				local var_220_40 = (arg_217_1.time_ - var_220_30) / var_220_39

				arg_217_1.fswtw_.percent = Mathf.Lerp(arg_217_1.var_.oldValueTypewriter, var_220_35, var_220_40)
				arg_217_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_217_1.fswtw_:SetDirty()
			end

			if arg_217_1.time_ >= var_220_30 + var_220_39 and arg_217_1.time_ < var_220_30 + var_220_39 + arg_220_0 then
				arg_217_1.fswtw_.percent = var_220_35

				arg_217_1.fswtw_:SetDirty()
				arg_217_1:ShowNextGo(true)

				arg_217_1.typewritterCharCountI18N = var_220_36
			end

			local var_220_41 = 2

			if var_220_41 < arg_217_1.time_ and arg_217_1.time_ <= var_220_41 + arg_220_0 then
				local var_220_42 = arg_217_1.fswbg_.transform:Find("textbox/adapt/content") or arg_217_1.fswbg_.transform:Find("textbox/content")
				local var_220_43 = var_220_42:GetComponent("Text")
				local var_220_44 = var_220_42:GetComponent("RectTransform")

				var_220_43.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_220_44.offsetMin = Vector2.New(0, 0)
				var_220_44.offsetMax = Vector2.New(0, 0)
			end

			local var_220_45 = 2
			local var_220_46 = 2.825
			local var_220_47 = manager.audio:GetVoiceLength("story_v_out_116431", "116431051", "story_v_out_116431.awb") / 1000

			if var_220_47 > 0 and var_220_46 < var_220_47 and var_220_47 + var_220_45 > arg_217_1.duration_ then
				local var_220_48 = var_220_47

				arg_217_1.duration_ = var_220_47 + var_220_45
			end

			if var_220_45 < arg_217_1.time_ and arg_217_1.time_ <= var_220_45 + arg_220_0 then
				local var_220_49 = "play"
				local var_220_50 = "voice"

				arg_217_1:AudioAction(var_220_49, var_220_50, "story_v_out_116431", "116431051", "story_v_out_116431.awb")
			end

			local var_220_51 = 2

			if var_220_51 < arg_217_1.time_ and arg_217_1.time_ <= var_220_51 + arg_220_0 then
				arg_217_1.allBtn_.enabled = false
			end

			local var_220_52 = 0.416666666666667

			if arg_217_1.time_ >= var_220_51 + var_220_52 and arg_217_1.time_ < var_220_51 + var_220_52 + arg_220_0 then
				arg_217_1.allBtn_.enabled = true
			end
		end
	end,
	Play116431052 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 116431052
		arg_221_1.duration_ = 5

		SetActive(arg_221_1.tipsGo_, false)

		function arg_221_1.onSingleLineFinish_()
			arg_221_1.onSingleLineUpdate_ = nil
			arg_221_1.onSingleLineFinish_ = nil
			arg_221_1.state_ = "waiting"
		end

		function arg_221_1.playNext_(arg_223_0)
			if arg_223_0 == 1 then
				arg_221_0:Play116431053(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = 0

			if var_224_0 < arg_221_1.time_ and arg_221_1.time_ <= var_224_0 + arg_224_0 then
				arg_221_1.fswbg_:SetActive(false)
				arg_221_1.dialog_:SetActive(true)
				arg_221_1:ShowNextGo(false)
			end

			local var_224_1 = 0
			local var_224_2 = 0.075

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0

				arg_221_1.dialog_:SetActive(true)

				local var_224_3 = LeanTween.value(arg_221_1.dialog_, 0, 1, 0.3)

				var_224_3:setOnUpdate(LuaHelper.FloatAction(function(arg_225_0)
					arg_221_1.dialogCg_.alpha = arg_225_0
				end))
				var_224_3:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_221_1.dialog_)
					var_224_3:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_221_1.duration_ = arg_221_1.duration_ + 0.3

				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_4 = arg_221_1:FormatText(StoryNameCfg[7].name)

				arg_221_1.leftNameTxt_.text = var_224_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_5 = arg_221_1:GetWordFromCfg(116431052)
				local var_224_6 = arg_221_1:FormatText(var_224_5.content)

				arg_221_1.text_.text = var_224_6

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_7 = 3
				local var_224_8 = utf8.len(var_224_6)
				local var_224_9 = var_224_7 <= 0 and var_224_2 or var_224_2 * (var_224_8 / var_224_7)

				if var_224_9 > 0 and var_224_2 < var_224_9 then
					arg_221_1.talkMaxDuration = var_224_9
					var_224_1 = var_224_1 + 0.3

					if var_224_9 + var_224_1 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_9 + var_224_1
					end
				end

				arg_221_1.text_.text = var_224_6
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)
				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_10 = var_224_1 + 0.3
			local var_224_11 = math.max(var_224_2, arg_221_1.talkMaxDuration)

			if var_224_10 <= arg_221_1.time_ and arg_221_1.time_ < var_224_10 + var_224_11 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_10) / var_224_11

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_10 + var_224_11 and arg_221_1.time_ < var_224_10 + var_224_11 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play116431053 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 116431053
		arg_227_1.duration_ = 5

		SetActive(arg_227_1.tipsGo_, false)

		function arg_227_1.onSingleLineFinish_()
			arg_227_1.onSingleLineUpdate_ = nil
			arg_227_1.onSingleLineFinish_ = nil
			arg_227_1.state_ = "waiting"
		end

		function arg_227_1.playNext_(arg_229_0)
			if arg_229_0 == 1 then
				arg_227_0:Play116431054(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = 0
			local var_230_1 = 0.85

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

				local var_230_2 = arg_227_1:GetWordFromCfg(116431053)
				local var_230_3 = arg_227_1:FormatText(var_230_2.content)

				arg_227_1.text_.text = var_230_3

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_4 = 34
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
	Play116431054 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 116431054
		arg_231_1.duration_ = 5

		SetActive(arg_231_1.tipsGo_, false)

		function arg_231_1.onSingleLineFinish_()
			arg_231_1.onSingleLineUpdate_ = nil
			arg_231_1.onSingleLineFinish_ = nil
			arg_231_1.state_ = "waiting"
		end

		function arg_231_1.playNext_(arg_233_0)
			if arg_233_0 == 1 then
				arg_231_0:Play116431055(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = 0
			local var_234_1 = 0.7

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

				local var_234_2 = arg_231_1:GetWordFromCfg(116431054)
				local var_234_3 = arg_231_1:FormatText(var_234_2.content)

				arg_231_1.text_.text = var_234_3

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_4 = 28
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
	Play116431055 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 116431055
		arg_235_1.duration_ = 10.010999999999

		SetActive(arg_235_1.tipsGo_, false)

		function arg_235_1.onSingleLineFinish_()
			arg_235_1.onSingleLineUpdate_ = nil
			arg_235_1.onSingleLineFinish_ = nil
			arg_235_1.state_ = "waiting"
		end

		function arg_235_1.playNext_(arg_237_0)
			if arg_237_0 == 1 then
				arg_235_0:Play116431056(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = 0

			if var_238_0 < arg_235_1.time_ and arg_235_1.time_ <= var_238_0 + arg_238_0 then
				arg_235_1.fswbg_:SetActive(true)
				arg_235_1.dialog_:SetActive(false)

				arg_235_1.fswtw_.percent = 0

				local var_238_1 = arg_235_1:GetWordFromCfg(116431055)
				local var_238_2 = arg_235_1:FormatText(var_238_1.content)

				arg_235_1.fswt_.text = var_238_2

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.fswt_)

				arg_235_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_235_1.fswtw_:SetDirty()

				arg_235_1.typewritterCharCountI18N = 0

				SetActive(arg_235_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_235_1:ShowNextGo(false)
			end

			local var_238_3 = 0.0166666666666667

			if var_238_3 < arg_235_1.time_ and arg_235_1.time_ <= var_238_3 + arg_238_0 then
				arg_235_1.var_.oldValueTypewriter = arg_235_1.fswtw_.percent

				arg_235_1:ShowNextGo(false)
			end

			local var_238_4 = 49
			local var_238_5 = 3.53333333333333
			local var_238_6 = arg_235_1:GetWordFromCfg(116431055)
			local var_238_7 = arg_235_1:FormatText(var_238_6.content)
			local var_238_8, var_238_9 = arg_235_1:GetPercentByPara(var_238_7, 2)

			if var_238_3 < arg_235_1.time_ and arg_235_1.time_ <= var_238_3 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0

				local var_238_10 = var_238_4 <= 0 and var_238_5 or var_238_5 * ((var_238_9 - arg_235_1.typewritterCharCountI18N) / var_238_4)

				if var_238_10 > 0 and var_238_5 < var_238_10 then
					arg_235_1.talkMaxDuration = var_238_10

					if var_238_10 + var_238_3 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_10 + var_238_3
					end
				end
			end

			local var_238_11 = 3.53333333333333
			local var_238_12 = math.max(var_238_11, arg_235_1.talkMaxDuration)

			if var_238_3 <= arg_235_1.time_ and arg_235_1.time_ < var_238_3 + var_238_12 then
				local var_238_13 = (arg_235_1.time_ - var_238_3) / var_238_12

				arg_235_1.fswtw_.percent = Mathf.Lerp(arg_235_1.var_.oldValueTypewriter, var_238_8, var_238_13)
				arg_235_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_235_1.fswtw_:SetDirty()
			end

			if arg_235_1.time_ >= var_238_3 + var_238_12 and arg_235_1.time_ < var_238_3 + var_238_12 + arg_238_0 then
				arg_235_1.fswtw_.percent = var_238_8

				arg_235_1.fswtw_:SetDirty()
				arg_235_1:ShowNextGo(true)

				arg_235_1.typewritterCharCountI18N = var_238_9
			end

			local var_238_14 = 0
			local var_238_15 = 10.011
			local var_238_16 = manager.audio:GetVoiceLength("story_v_out_116431", "116431055", "story_v_out_116431.awb") / 1000

			if var_238_16 > 0 and var_238_15 < var_238_16 and var_238_16 + var_238_14 > arg_235_1.duration_ then
				local var_238_17 = var_238_16

				arg_235_1.duration_ = var_238_16 + var_238_14
			end

			if var_238_14 < arg_235_1.time_ and arg_235_1.time_ <= var_238_14 + arg_238_0 then
				local var_238_18 = "play"
				local var_238_19 = "voice"

				arg_235_1:AudioAction(var_238_18, var_238_19, "story_v_out_116431", "116431055", "story_v_out_116431.awb")
			end

			local var_238_20 = 0

			if var_238_20 < arg_235_1.time_ and arg_235_1.time_ <= var_238_20 + arg_238_0 then
				arg_235_1.allBtn_.enabled = false
			end

			local var_238_21 = 3.55

			if arg_235_1.time_ >= var_238_20 + var_238_21 and arg_235_1.time_ < var_238_20 + var_238_21 + arg_238_0 then
				arg_235_1.allBtn_.enabled = true
			end
		end
	end,
	Play116431056 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 116431056
		arg_239_1.duration_ = 5

		SetActive(arg_239_1.tipsGo_, false)

		function arg_239_1.onSingleLineFinish_()
			arg_239_1.onSingleLineUpdate_ = nil
			arg_239_1.onSingleLineFinish_ = nil
			arg_239_1.state_ = "waiting"
		end

		function arg_239_1.playNext_(arg_241_0)
			if arg_241_0 == 1 then
				arg_239_0:Play116431057(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = 0

			if var_242_0 < arg_239_1.time_ and arg_239_1.time_ <= var_242_0 + arg_242_0 then
				arg_239_1.fswbg_:SetActive(false)
				arg_239_1.dialog_:SetActive(true)
				arg_239_1:ShowNextGo(false)
			end

			local var_242_1 = 0
			local var_242_2 = 0.25

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0

				arg_239_1.dialog_:SetActive(true)

				local var_242_3 = LeanTween.value(arg_239_1.dialog_, 0, 1, 0.3)

				var_242_3:setOnUpdate(LuaHelper.FloatAction(function(arg_243_0)
					arg_239_1.dialogCg_.alpha = arg_243_0
				end))
				var_242_3:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_239_1.dialog_)
					var_242_3:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_239_1.duration_ = arg_239_1.duration_ + 0.3

				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_4 = arg_239_1:FormatText(StoryNameCfg[7].name)

				arg_239_1.leftNameTxt_.text = var_242_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_5 = arg_239_1:GetWordFromCfg(116431056)
				local var_242_6 = arg_239_1:FormatText(var_242_5.content)

				arg_239_1.text_.text = var_242_6

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_7 = 10
				local var_242_8 = utf8.len(var_242_6)
				local var_242_9 = var_242_7 <= 0 and var_242_2 or var_242_2 * (var_242_8 / var_242_7)

				if var_242_9 > 0 and var_242_2 < var_242_9 then
					arg_239_1.talkMaxDuration = var_242_9
					var_242_1 = var_242_1 + 0.3

					if var_242_9 + var_242_1 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_9 + var_242_1
					end
				end

				arg_239_1.text_.text = var_242_6
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)
				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_10 = var_242_1 + 0.3
			local var_242_11 = math.max(var_242_2, arg_239_1.talkMaxDuration)

			if var_242_10 <= arg_239_1.time_ and arg_239_1.time_ < var_242_10 + var_242_11 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_10) / var_242_11

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_10 + var_242_11 and arg_239_1.time_ < var_242_10 + var_242_11 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play116431057 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 116431057
		arg_245_1.duration_ = 9.459999999999

		SetActive(arg_245_1.tipsGo_, false)

		function arg_245_1.onSingleLineFinish_()
			arg_245_1.onSingleLineUpdate_ = nil
			arg_245_1.onSingleLineFinish_ = nil
			arg_245_1.state_ = "waiting"
		end

		function arg_245_1.playNext_(arg_247_0)
			if arg_247_0 == 1 then
				arg_245_0:Play116431058(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = 0

			if var_248_0 < arg_245_1.time_ and arg_245_1.time_ <= var_248_0 + arg_248_0 then
				arg_245_1.fswbg_:SetActive(true)
				arg_245_1.dialog_:SetActive(false)

				arg_245_1.fswtw_.percent = 0

				local var_248_1 = arg_245_1:GetWordFromCfg(116431057)
				local var_248_2 = arg_245_1:FormatText(var_248_1.content)

				arg_245_1.fswt_.text = var_248_2

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.fswt_)

				arg_245_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_245_1.fswtw_:SetDirty()

				arg_245_1.typewritterCharCountI18N = 0

				SetActive(arg_245_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_245_1:ShowNextGo(false)
			end

			local var_248_3 = 0.0166666666666667

			if var_248_3 < arg_245_1.time_ and arg_245_1.time_ <= var_248_3 + arg_248_0 then
				arg_245_1.var_.oldValueTypewriter = arg_245_1.fswtw_.percent

				arg_245_1:ShowNextGo(false)
			end

			local var_248_4 = 29
			local var_248_5 = 1.93333333333333
			local var_248_6 = arg_245_1:GetWordFromCfg(116431057)
			local var_248_7 = arg_245_1:FormatText(var_248_6.content)
			local var_248_8, var_248_9 = arg_245_1:GetPercentByPara(var_248_7, 1)

			if var_248_3 < arg_245_1.time_ and arg_245_1.time_ <= var_248_3 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0

				local var_248_10 = var_248_4 <= 0 and var_248_5 or var_248_5 * ((var_248_9 - arg_245_1.typewritterCharCountI18N) / var_248_4)

				if var_248_10 > 0 and var_248_5 < var_248_10 then
					arg_245_1.talkMaxDuration = var_248_10

					if var_248_10 + var_248_3 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_10 + var_248_3
					end
				end
			end

			local var_248_11 = 1.93333333333333
			local var_248_12 = math.max(var_248_11, arg_245_1.talkMaxDuration)

			if var_248_3 <= arg_245_1.time_ and arg_245_1.time_ < var_248_3 + var_248_12 then
				local var_248_13 = (arg_245_1.time_ - var_248_3) / var_248_12

				arg_245_1.fswtw_.percent = Mathf.Lerp(arg_245_1.var_.oldValueTypewriter, var_248_8, var_248_13)
				arg_245_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_245_1.fswtw_:SetDirty()
			end

			if arg_245_1.time_ >= var_248_3 + var_248_12 and arg_245_1.time_ < var_248_3 + var_248_12 + arg_248_0 then
				arg_245_1.fswtw_.percent = var_248_8

				arg_245_1.fswtw_:SetDirty()
				arg_245_1:ShowNextGo(true)

				arg_245_1.typewritterCharCountI18N = var_248_9
			end

			local var_248_14 = 0
			local var_248_15 = 9.46
			local var_248_16 = manager.audio:GetVoiceLength("story_v_out_116431", "116431057", "story_v_out_116431.awb") / 1000

			if var_248_16 > 0 and var_248_15 < var_248_16 and var_248_16 + var_248_14 > arg_245_1.duration_ then
				local var_248_17 = var_248_16

				arg_245_1.duration_ = var_248_16 + var_248_14
			end

			if var_248_14 < arg_245_1.time_ and arg_245_1.time_ <= var_248_14 + arg_248_0 then
				local var_248_18 = "play"
				local var_248_19 = "voice"

				arg_245_1:AudioAction(var_248_18, var_248_19, "story_v_out_116431", "116431057", "story_v_out_116431.awb")
			end

			local var_248_20 = 0

			if var_248_20 < arg_245_1.time_ and arg_245_1.time_ <= var_248_20 + arg_248_0 then
				arg_245_1.allBtn_.enabled = false
			end

			local var_248_21 = 1.95

			if arg_245_1.time_ >= var_248_20 + var_248_21 and arg_245_1.time_ < var_248_20 + var_248_21 + arg_248_0 then
				arg_245_1.allBtn_.enabled = true
			end
		end
	end,
	Play116431058 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 116431058
		arg_249_1.duration_ = 8.917999999999

		SetActive(arg_249_1.tipsGo_, false)

		function arg_249_1.onSingleLineFinish_()
			arg_249_1.onSingleLineUpdate_ = nil
			arg_249_1.onSingleLineFinish_ = nil
			arg_249_1.state_ = "waiting"
		end

		function arg_249_1.playNext_(arg_251_0)
			if arg_251_0 == 1 then
				arg_249_0:Play116431059(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = 0

			if var_252_0 < arg_249_1.time_ and arg_249_1.time_ <= var_252_0 + arg_252_0 then
				arg_249_1.var_.oldValueTypewriter = arg_249_1.fswtw_.percent

				arg_249_1:ShowNextGo(false)
			end

			local var_252_1 = 36
			local var_252_2 = 2.4
			local var_252_3 = arg_249_1:GetWordFromCfg(116431057)
			local var_252_4 = arg_249_1:FormatText(var_252_3.content)
			local var_252_5, var_252_6 = arg_249_1:GetPercentByPara(var_252_4, 2)

			if var_252_0 < arg_249_1.time_ and arg_249_1.time_ <= var_252_0 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0

				local var_252_7 = var_252_1 <= 0 and var_252_2 or var_252_2 * ((var_252_6 - arg_249_1.typewritterCharCountI18N) / var_252_1)

				if var_252_7 > 0 and var_252_2 < var_252_7 then
					arg_249_1.talkMaxDuration = var_252_7

					if var_252_7 + var_252_0 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_7 + var_252_0
					end
				end
			end

			local var_252_8 = 2.4
			local var_252_9 = math.max(var_252_8, arg_249_1.talkMaxDuration)

			if var_252_0 <= arg_249_1.time_ and arg_249_1.time_ < var_252_0 + var_252_9 then
				local var_252_10 = (arg_249_1.time_ - var_252_0) / var_252_9

				arg_249_1.fswtw_.percent = Mathf.Lerp(arg_249_1.var_.oldValueTypewriter, var_252_5, var_252_10)
				arg_249_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_249_1.fswtw_:SetDirty()
			end

			if arg_249_1.time_ >= var_252_0 + var_252_9 and arg_249_1.time_ < var_252_0 + var_252_9 + arg_252_0 then
				arg_249_1.fswtw_.percent = var_252_5

				arg_249_1.fswtw_:SetDirty()
				arg_249_1:ShowNextGo(true)

				arg_249_1.typewritterCharCountI18N = var_252_6
			end

			local var_252_11 = 0
			local var_252_12 = 8.918
			local var_252_13 = manager.audio:GetVoiceLength("story_v_out_116431", "116431058", "story_v_out_116431.awb") / 1000

			if var_252_13 > 0 and var_252_12 < var_252_13 and var_252_13 + var_252_11 > arg_249_1.duration_ then
				local var_252_14 = var_252_13

				arg_249_1.duration_ = var_252_13 + var_252_11
			end

			if var_252_11 < arg_249_1.time_ and arg_249_1.time_ <= var_252_11 + arg_252_0 then
				local var_252_15 = "play"
				local var_252_16 = "voice"

				arg_249_1:AudioAction(var_252_15, var_252_16, "story_v_out_116431", "116431058", "story_v_out_116431.awb")
			end

			local var_252_17 = 0

			if var_252_17 < arg_249_1.time_ and arg_249_1.time_ <= var_252_17 + arg_252_0 then
				arg_249_1.allBtn_.enabled = false
			end

			local var_252_18 = 2.4

			if arg_249_1.time_ >= var_252_17 + var_252_18 and arg_249_1.time_ < var_252_17 + var_252_18 + arg_252_0 then
				arg_249_1.allBtn_.enabled = true
			end
		end
	end,
	Play116431059 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 116431059
		arg_253_1.duration_ = 9.932999999999

		SetActive(arg_253_1.tipsGo_, false)

		function arg_253_1.onSingleLineFinish_()
			arg_253_1.onSingleLineUpdate_ = nil
			arg_253_1.onSingleLineFinish_ = nil
			arg_253_1.state_ = "waiting"
		end

		function arg_253_1.playNext_(arg_255_0)
			if arg_255_0 == 1 then
				arg_253_0:Play116431060(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = 0

			if var_256_0 < arg_253_1.time_ and arg_253_1.time_ <= var_256_0 + arg_256_0 then
				arg_253_1.var_.oldValueTypewriter = arg_253_1.fswtw_.percent

				arg_253_1:ShowNextGo(false)
			end

			local var_256_1 = 41
			local var_256_2 = 2.73333333333333
			local var_256_3 = arg_253_1:GetWordFromCfg(116431057)
			local var_256_4 = arg_253_1:FormatText(var_256_3.content)
			local var_256_5, var_256_6 = arg_253_1:GetPercentByPara(var_256_4, 3)

			if var_256_0 < arg_253_1.time_ and arg_253_1.time_ <= var_256_0 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0

				local var_256_7 = var_256_1 <= 0 and var_256_2 or var_256_2 * ((var_256_6 - arg_253_1.typewritterCharCountI18N) / var_256_1)

				if var_256_7 > 0 and var_256_2 < var_256_7 then
					arg_253_1.talkMaxDuration = var_256_7

					if var_256_7 + var_256_0 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_7 + var_256_0
					end
				end
			end

			local var_256_8 = 2.73333333333333
			local var_256_9 = math.max(var_256_8, arg_253_1.talkMaxDuration)

			if var_256_0 <= arg_253_1.time_ and arg_253_1.time_ < var_256_0 + var_256_9 then
				local var_256_10 = (arg_253_1.time_ - var_256_0) / var_256_9

				arg_253_1.fswtw_.percent = Mathf.Lerp(arg_253_1.var_.oldValueTypewriter, var_256_5, var_256_10)
				arg_253_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_253_1.fswtw_:SetDirty()
			end

			if arg_253_1.time_ >= var_256_0 + var_256_9 and arg_253_1.time_ < var_256_0 + var_256_9 + arg_256_0 then
				arg_253_1.fswtw_.percent = var_256_5

				arg_253_1.fswtw_:SetDirty()
				arg_253_1:ShowNextGo(true)

				arg_253_1.typewritterCharCountI18N = var_256_6
			end

			local var_256_11 = 0
			local var_256_12 = 9.933
			local var_256_13 = manager.audio:GetVoiceLength("story_v_out_116431", "116431059", "story_v_out_116431.awb") / 1000

			if var_256_13 > 0 and var_256_12 < var_256_13 and var_256_13 + var_256_11 > arg_253_1.duration_ then
				local var_256_14 = var_256_13

				arg_253_1.duration_ = var_256_13 + var_256_11
			end

			if var_256_11 < arg_253_1.time_ and arg_253_1.time_ <= var_256_11 + arg_256_0 then
				local var_256_15 = "play"
				local var_256_16 = "voice"

				arg_253_1:AudioAction(var_256_15, var_256_16, "story_v_out_116431", "116431059", "story_v_out_116431.awb")
			end

			local var_256_17 = 0

			if var_256_17 < arg_253_1.time_ and arg_253_1.time_ <= var_256_17 + arg_256_0 then
				arg_253_1.allBtn_.enabled = false
			end

			local var_256_18 = 2.73333333333333

			if arg_253_1.time_ >= var_256_17 + var_256_18 and arg_253_1.time_ < var_256_17 + var_256_18 + arg_256_0 then
				arg_253_1.allBtn_.enabled = true
			end
		end
	end,
	Play116431060 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 116431060
		arg_257_1.duration_ = 5.028999999999

		SetActive(arg_257_1.tipsGo_, false)

		function arg_257_1.onSingleLineFinish_()
			arg_257_1.onSingleLineUpdate_ = nil
			arg_257_1.onSingleLineFinish_ = nil
			arg_257_1.state_ = "waiting"
		end

		function arg_257_1.playNext_(arg_259_0)
			if arg_259_0 == 1 then
				arg_257_0:Play116431061(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = 0

			if var_260_0 < arg_257_1.time_ and arg_257_1.time_ <= var_260_0 + arg_260_0 then
				arg_257_1.var_.oldValueTypewriter = arg_257_1.fswtw_.percent

				arg_257_1:ShowNextGo(false)
			end

			local var_260_1 = 12
			local var_260_2 = 0.8
			local var_260_3 = arg_257_1:GetWordFromCfg(116431057)
			local var_260_4 = arg_257_1:FormatText(var_260_3.content)
			local var_260_5, var_260_6 = arg_257_1:GetPercentByPara(var_260_4, 4)

			if var_260_0 < arg_257_1.time_ and arg_257_1.time_ <= var_260_0 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0

				local var_260_7 = var_260_1 <= 0 and var_260_2 or var_260_2 * ((var_260_6 - arg_257_1.typewritterCharCountI18N) / var_260_1)

				if var_260_7 > 0 and var_260_2 < var_260_7 then
					arg_257_1.talkMaxDuration = var_260_7

					if var_260_7 + var_260_0 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_7 + var_260_0
					end
				end
			end

			local var_260_8 = 0.8
			local var_260_9 = math.max(var_260_8, arg_257_1.talkMaxDuration)

			if var_260_0 <= arg_257_1.time_ and arg_257_1.time_ < var_260_0 + var_260_9 then
				local var_260_10 = (arg_257_1.time_ - var_260_0) / var_260_9

				arg_257_1.fswtw_.percent = Mathf.Lerp(arg_257_1.var_.oldValueTypewriter, var_260_5, var_260_10)
				arg_257_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_257_1.fswtw_:SetDirty()
			end

			if arg_257_1.time_ >= var_260_0 + var_260_9 and arg_257_1.time_ < var_260_0 + var_260_9 + arg_260_0 then
				arg_257_1.fswtw_.percent = var_260_5

				arg_257_1.fswtw_:SetDirty()
				arg_257_1:ShowNextGo(true)

				arg_257_1.typewritterCharCountI18N = var_260_6
			end

			local var_260_11 = 0
			local var_260_12 = 5.029
			local var_260_13 = manager.audio:GetVoiceLength("story_v_out_116431", "116431060", "story_v_out_116431.awb") / 1000

			if var_260_13 > 0 and var_260_12 < var_260_13 and var_260_13 + var_260_11 > arg_257_1.duration_ then
				local var_260_14 = var_260_13

				arg_257_1.duration_ = var_260_13 + var_260_11
			end

			if var_260_11 < arg_257_1.time_ and arg_257_1.time_ <= var_260_11 + arg_260_0 then
				local var_260_15 = "play"
				local var_260_16 = "voice"

				arg_257_1:AudioAction(var_260_15, var_260_16, "story_v_out_116431", "116431060", "story_v_out_116431.awb")
			end

			local var_260_17 = 0

			if var_260_17 < arg_257_1.time_ and arg_257_1.time_ <= var_260_17 + arg_260_0 then
				arg_257_1.allBtn_.enabled = false
			end

			local var_260_18 = 0.8

			if arg_257_1.time_ >= var_260_17 + var_260_18 and arg_257_1.time_ < var_260_17 + var_260_18 + arg_260_0 then
				arg_257_1.allBtn_.enabled = true
			end
		end
	end,
	Play116431061 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 116431061
		arg_261_1.duration_ = 5

		SetActive(arg_261_1.tipsGo_, false)

		function arg_261_1.onSingleLineFinish_()
			arg_261_1.onSingleLineUpdate_ = nil
			arg_261_1.onSingleLineFinish_ = nil
			arg_261_1.state_ = "waiting"
		end

		function arg_261_1.playNext_(arg_263_0)
			if arg_263_0 == 1 then
				arg_261_0:Play116431062(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = 0

			if var_264_0 < arg_261_1.time_ and arg_261_1.time_ <= var_264_0 + arg_264_0 then
				arg_261_1.fswbg_:SetActive(false)
				arg_261_1.dialog_:SetActive(true)
				arg_261_1:ShowNextGo(false)
			end

			local var_264_1 = 0
			local var_264_2 = 0.275

			if var_264_1 < arg_261_1.time_ and arg_261_1.time_ <= var_264_1 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0

				arg_261_1.dialog_:SetActive(true)

				local var_264_3 = LeanTween.value(arg_261_1.dialog_, 0, 1, 0.3)

				var_264_3:setOnUpdate(LuaHelper.FloatAction(function(arg_265_0)
					arg_261_1.dialogCg_.alpha = arg_265_0
				end))
				var_264_3:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_261_1.dialog_)
					var_264_3:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_261_1.duration_ = arg_261_1.duration_ + 0.3

				SetActive(arg_261_1.leftNameGo_, true)

				local var_264_4 = arg_261_1:FormatText(StoryNameCfg[7].name)

				arg_261_1.leftNameTxt_.text = var_264_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_261_1.leftNameTxt_.transform)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1.leftNameTxt_.text)
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_5 = arg_261_1:GetWordFromCfg(116431061)
				local var_264_6 = arg_261_1:FormatText(var_264_5.content)

				arg_261_1.text_.text = var_264_6

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_7 = 11
				local var_264_8 = utf8.len(var_264_6)
				local var_264_9 = var_264_7 <= 0 and var_264_2 or var_264_2 * (var_264_8 / var_264_7)

				if var_264_9 > 0 and var_264_2 < var_264_9 then
					arg_261_1.talkMaxDuration = var_264_9
					var_264_1 = var_264_1 + 0.3

					if var_264_9 + var_264_1 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_9 + var_264_1
					end
				end

				arg_261_1.text_.text = var_264_6
				arg_261_1.typewritter.percent = 0

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(false)
				arg_261_1:RecordContent(arg_261_1.text_.text)
			end

			local var_264_10 = var_264_1 + 0.3
			local var_264_11 = math.max(var_264_2, arg_261_1.talkMaxDuration)

			if var_264_10 <= arg_261_1.time_ and arg_261_1.time_ < var_264_10 + var_264_11 then
				arg_261_1.typewritter.percent = (arg_261_1.time_ - var_264_10) / var_264_11

				arg_261_1.typewritter:SetDirty()
			end

			if arg_261_1.time_ >= var_264_10 + var_264_11 and arg_261_1.time_ < var_264_10 + var_264_11 + arg_264_0 then
				arg_261_1.typewritter.percent = 1

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(true)
			end
		end
	end,
	Play116431062 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 116431062
		arg_267_1.duration_ = 9.258999999999

		SetActive(arg_267_1.tipsGo_, false)

		function arg_267_1.onSingleLineFinish_()
			arg_267_1.onSingleLineUpdate_ = nil
			arg_267_1.onSingleLineFinish_ = nil
			arg_267_1.state_ = "waiting"
		end

		function arg_267_1.playNext_(arg_269_0)
			if arg_269_0 == 1 then
				arg_267_0:Play116431063(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = 0

			if var_270_0 < arg_267_1.time_ and arg_267_1.time_ <= var_270_0 + arg_270_0 then
				arg_267_1.fswbg_:SetActive(true)
				arg_267_1.dialog_:SetActive(false)

				arg_267_1.fswtw_.percent = 0

				local var_270_1 = arg_267_1:GetWordFromCfg(116431062)
				local var_270_2 = arg_267_1:FormatText(var_270_1.content)

				arg_267_1.fswt_.text = var_270_2

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.fswt_)

				arg_267_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_267_1.fswtw_:SetDirty()

				arg_267_1.typewritterCharCountI18N = 0

				SetActive(arg_267_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_267_1:ShowNextGo(false)
			end

			local var_270_3 = 0.0166666666666667

			if var_270_3 < arg_267_1.time_ and arg_267_1.time_ <= var_270_3 + arg_270_0 then
				arg_267_1.var_.oldValueTypewriter = arg_267_1.fswtw_.percent

				arg_267_1:ShowNextGo(false)
			end

			local var_270_4 = 36
			local var_270_5 = 2.4
			local var_270_6 = arg_267_1:GetWordFromCfg(116431062)
			local var_270_7 = arg_267_1:FormatText(var_270_6.content)
			local var_270_8, var_270_9 = arg_267_1:GetPercentByPara(var_270_7, 1)

			if var_270_3 < arg_267_1.time_ and arg_267_1.time_ <= var_270_3 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0

				local var_270_10 = var_270_4 <= 0 and var_270_5 or var_270_5 * ((var_270_9 - arg_267_1.typewritterCharCountI18N) / var_270_4)

				if var_270_10 > 0 and var_270_5 < var_270_10 then
					arg_267_1.talkMaxDuration = var_270_10

					if var_270_10 + var_270_3 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_10 + var_270_3
					end
				end
			end

			local var_270_11 = 2.4
			local var_270_12 = math.max(var_270_11, arg_267_1.talkMaxDuration)

			if var_270_3 <= arg_267_1.time_ and arg_267_1.time_ < var_270_3 + var_270_12 then
				local var_270_13 = (arg_267_1.time_ - var_270_3) / var_270_12

				arg_267_1.fswtw_.percent = Mathf.Lerp(arg_267_1.var_.oldValueTypewriter, var_270_8, var_270_13)
				arg_267_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_267_1.fswtw_:SetDirty()
			end

			if arg_267_1.time_ >= var_270_3 + var_270_12 and arg_267_1.time_ < var_270_3 + var_270_12 + arg_270_0 then
				arg_267_1.fswtw_.percent = var_270_8

				arg_267_1.fswtw_:SetDirty()
				arg_267_1:ShowNextGo(true)

				arg_267_1.typewritterCharCountI18N = var_270_9
			end

			local var_270_14 = 0
			local var_270_15 = 9.259
			local var_270_16 = manager.audio:GetVoiceLength("story_v_out_116431", "116431062", "story_v_out_116431.awb") / 1000

			if var_270_16 > 0 and var_270_15 < var_270_16 and var_270_16 + var_270_14 > arg_267_1.duration_ then
				local var_270_17 = var_270_16

				arg_267_1.duration_ = var_270_16 + var_270_14
			end

			if var_270_14 < arg_267_1.time_ and arg_267_1.time_ <= var_270_14 + arg_270_0 then
				local var_270_18 = "play"
				local var_270_19 = "voice"

				arg_267_1:AudioAction(var_270_18, var_270_19, "story_v_out_116431", "116431062", "story_v_out_116431.awb")
			end

			local var_270_20 = 0

			if var_270_20 < arg_267_1.time_ and arg_267_1.time_ <= var_270_20 + arg_270_0 then
				arg_267_1.allBtn_.enabled = false
			end

			local var_270_21 = 2.41666666666667

			if arg_267_1.time_ >= var_270_20 + var_270_21 and arg_267_1.time_ < var_270_20 + var_270_21 + arg_270_0 then
				arg_267_1.allBtn_.enabled = true
			end
		end
	end,
	Play116431063 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 116431063
		arg_271_1.duration_ = 5

		SetActive(arg_271_1.tipsGo_, false)

		function arg_271_1.onSingleLineFinish_()
			arg_271_1.onSingleLineUpdate_ = nil
			arg_271_1.onSingleLineFinish_ = nil
			arg_271_1.state_ = "waiting"
		end

		function arg_271_1.playNext_(arg_273_0)
			if arg_273_0 == 1 then
				arg_271_0:Play116431064(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = 0

			if var_274_0 < arg_271_1.time_ and arg_271_1.time_ <= var_274_0 + arg_274_0 then
				arg_271_1.fswbg_:SetActive(false)
				arg_271_1.dialog_:SetActive(true)
				arg_271_1:ShowNextGo(false)
			end

			local var_274_1 = 0
			local var_274_2 = 0.325

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0

				arg_271_1.dialog_:SetActive(true)

				local var_274_3 = LeanTween.value(arg_271_1.dialog_, 0, 1, 0.3)

				var_274_3:setOnUpdate(LuaHelper.FloatAction(function(arg_275_0)
					arg_271_1.dialogCg_.alpha = arg_275_0
				end))
				var_274_3:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_271_1.dialog_)
					var_274_3:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_271_1.duration_ = arg_271_1.duration_ + 0.3

				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_4 = arg_271_1:FormatText(StoryNameCfg[7].name)

				arg_271_1.leftNameTxt_.text = var_274_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_5 = arg_271_1:GetWordFromCfg(116431063)
				local var_274_6 = arg_271_1:FormatText(var_274_5.content)

				arg_271_1.text_.text = var_274_6

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_7 = 13
				local var_274_8 = utf8.len(var_274_6)
				local var_274_9 = var_274_7 <= 0 and var_274_2 or var_274_2 * (var_274_8 / var_274_7)

				if var_274_9 > 0 and var_274_2 < var_274_9 then
					arg_271_1.talkMaxDuration = var_274_9
					var_274_1 = var_274_1 + 0.3

					if var_274_9 + var_274_1 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_9 + var_274_1
					end
				end

				arg_271_1.text_.text = var_274_6
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)
				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_10 = var_274_1 + 0.3
			local var_274_11 = math.max(var_274_2, arg_271_1.talkMaxDuration)

			if var_274_10 <= arg_271_1.time_ and arg_271_1.time_ < var_274_10 + var_274_11 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_10) / var_274_11

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_10 + var_274_11 and arg_271_1.time_ < var_274_10 + var_274_11 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play116431064 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 116431064
		arg_277_1.duration_ = 1.572999999999

		SetActive(arg_277_1.tipsGo_, false)

		function arg_277_1.onSingleLineFinish_()
			arg_277_1.onSingleLineUpdate_ = nil
			arg_277_1.onSingleLineFinish_ = nil
			arg_277_1.state_ = "waiting"
		end

		function arg_277_1.playNext_(arg_279_0)
			if arg_279_0 == 1 then
				arg_277_0:Play116431065(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = 0

			if var_280_0 < arg_277_1.time_ and arg_277_1.time_ <= var_280_0 + arg_280_0 then
				arg_277_1.fswbg_:SetActive(true)
				arg_277_1.dialog_:SetActive(false)

				arg_277_1.fswtw_.percent = 0

				local var_280_1 = arg_277_1:GetWordFromCfg(116431064)
				local var_280_2 = arg_277_1:FormatText(var_280_1.content)

				arg_277_1.fswt_.text = var_280_2

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.fswt_)

				arg_277_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_277_1.fswtw_:SetDirty()

				arg_277_1.typewritterCharCountI18N = 0

				SetActive(arg_277_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_277_1:ShowNextGo(false)
			end

			local var_280_3 = 0.0166666666666666

			if var_280_3 < arg_277_1.time_ and arg_277_1.time_ <= var_280_3 + arg_280_0 then
				arg_277_1.var_.oldValueTypewriter = arg_277_1.fswtw_.percent

				arg_277_1:ShowNextGo(false)
			end

			local var_280_4 = 4
			local var_280_5 = 0.266666666666667
			local var_280_6 = arg_277_1:GetWordFromCfg(116431064)
			local var_280_7 = arg_277_1:FormatText(var_280_6.content)
			local var_280_8, var_280_9 = arg_277_1:GetPercentByPara(var_280_7, 1)

			if var_280_3 < arg_277_1.time_ and arg_277_1.time_ <= var_280_3 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0

				local var_280_10 = var_280_4 <= 0 and var_280_5 or var_280_5 * ((var_280_9 - arg_277_1.typewritterCharCountI18N) / var_280_4)

				if var_280_10 > 0 and var_280_5 < var_280_10 then
					arg_277_1.talkMaxDuration = var_280_10

					if var_280_10 + var_280_3 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_10 + var_280_3
					end
				end
			end

			local var_280_11 = 0.266666666666667
			local var_280_12 = math.max(var_280_11, arg_277_1.talkMaxDuration)

			if var_280_3 <= arg_277_1.time_ and arg_277_1.time_ < var_280_3 + var_280_12 then
				local var_280_13 = (arg_277_1.time_ - var_280_3) / var_280_12

				arg_277_1.fswtw_.percent = Mathf.Lerp(arg_277_1.var_.oldValueTypewriter, var_280_8, var_280_13)
				arg_277_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_277_1.fswtw_:SetDirty()
			end

			if arg_277_1.time_ >= var_280_3 + var_280_12 and arg_277_1.time_ < var_280_3 + var_280_12 + arg_280_0 then
				arg_277_1.fswtw_.percent = var_280_8

				arg_277_1.fswtw_:SetDirty()
				arg_277_1:ShowNextGo(true)

				arg_277_1.typewritterCharCountI18N = var_280_9
			end

			local var_280_14 = 0
			local var_280_15 = 1.573
			local var_280_16 = manager.audio:GetVoiceLength("story_v_out_116431", "116431064", "story_v_out_116431.awb") / 1000

			if var_280_16 > 0 and var_280_15 < var_280_16 and var_280_16 + var_280_14 > arg_277_1.duration_ then
				local var_280_17 = var_280_16

				arg_277_1.duration_ = var_280_16 + var_280_14
			end

			if var_280_14 < arg_277_1.time_ and arg_277_1.time_ <= var_280_14 + arg_280_0 then
				local var_280_18 = "play"
				local var_280_19 = "voice"

				arg_277_1:AudioAction(var_280_18, var_280_19, "story_v_out_116431", "116431064", "story_v_out_116431.awb")
			end

			local var_280_20 = 0

			if var_280_20 < arg_277_1.time_ and arg_277_1.time_ <= var_280_20 + arg_280_0 then
				arg_277_1.allBtn_.enabled = false
			end

			local var_280_21 = 0.283333333333333

			if arg_277_1.time_ >= var_280_20 + var_280_21 and arg_277_1.time_ < var_280_20 + var_280_21 + arg_280_0 then
				arg_277_1.allBtn_.enabled = true
			end
		end
	end,
	Play116431065 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 116431065
		arg_281_1.duration_ = 5

		SetActive(arg_281_1.tipsGo_, false)

		function arg_281_1.onSingleLineFinish_()
			arg_281_1.onSingleLineUpdate_ = nil
			arg_281_1.onSingleLineFinish_ = nil
			arg_281_1.state_ = "waiting"
		end

		function arg_281_1.playNext_(arg_283_0)
			if arg_283_0 == 1 then
				arg_281_0:Play116431066(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = 0

			if var_284_0 < arg_281_1.time_ and arg_281_1.time_ <= var_284_0 + arg_284_0 then
				arg_281_1.fswbg_:SetActive(false)
				arg_281_1.dialog_:SetActive(true)
				arg_281_1:ShowNextGo(false)
			end

			local var_284_1 = 0
			local var_284_2 = 0.25

			if var_284_1 < arg_281_1.time_ and arg_281_1.time_ <= var_284_1 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0

				arg_281_1.dialog_:SetActive(true)

				local var_284_3 = LeanTween.value(arg_281_1.dialog_, 0, 1, 0.3)

				var_284_3:setOnUpdate(LuaHelper.FloatAction(function(arg_285_0)
					arg_281_1.dialogCg_.alpha = arg_285_0
				end))
				var_284_3:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_281_1.dialog_)
					var_284_3:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_281_1.duration_ = arg_281_1.duration_ + 0.3

				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_4 = arg_281_1:FormatText(StoryNameCfg[7].name)

				arg_281_1.leftNameTxt_.text = var_284_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_5 = arg_281_1:GetWordFromCfg(116431065)
				local var_284_6 = arg_281_1:FormatText(var_284_5.content)

				arg_281_1.text_.text = var_284_6

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_7 = 10
				local var_284_8 = utf8.len(var_284_6)
				local var_284_9 = var_284_7 <= 0 and var_284_2 or var_284_2 * (var_284_8 / var_284_7)

				if var_284_9 > 0 and var_284_2 < var_284_9 then
					arg_281_1.talkMaxDuration = var_284_9
					var_284_1 = var_284_1 + 0.3

					if var_284_9 + var_284_1 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_9 + var_284_1
					end
				end

				arg_281_1.text_.text = var_284_6
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)
				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_10 = var_284_1 + 0.3
			local var_284_11 = math.max(var_284_2, arg_281_1.talkMaxDuration)

			if var_284_10 <= arg_281_1.time_ and arg_281_1.time_ < var_284_10 + var_284_11 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_10) / var_284_11

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_10 + var_284_11 and arg_281_1.time_ < var_284_10 + var_284_11 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play116431066 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 116431066
		arg_287_1.duration_ = 15.532999999999

		SetActive(arg_287_1.tipsGo_, false)

		function arg_287_1.onSingleLineFinish_()
			arg_287_1.onSingleLineUpdate_ = nil
			arg_287_1.onSingleLineFinish_ = nil
			arg_287_1.state_ = "waiting"
		end

		function arg_287_1.playNext_(arg_289_0)
			if arg_289_0 == 1 then
				arg_287_0:Play116431067(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = 0

			if var_290_0 < arg_287_1.time_ and arg_287_1.time_ <= var_290_0 + arg_290_0 then
				arg_287_1.fswbg_:SetActive(true)
				arg_287_1.dialog_:SetActive(false)

				arg_287_1.fswtw_.percent = 0

				local var_290_1 = arg_287_1:GetWordFromCfg(116431066)
				local var_290_2 = arg_287_1:FormatText(var_290_1.content)

				arg_287_1.fswt_.text = var_290_2

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.fswt_)

				arg_287_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_287_1.fswtw_:SetDirty()

				arg_287_1.typewritterCharCountI18N = 0

				SetActive(arg_287_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_287_1:ShowNextGo(false)
			end

			local var_290_3 = 0.0166666666666667

			if var_290_3 < arg_287_1.time_ and arg_287_1.time_ <= var_290_3 + arg_290_0 then
				arg_287_1.var_.oldValueTypewriter = arg_287_1.fswtw_.percent

				arg_287_1:ShowNextGo(false)
			end

			local var_290_4 = 63
			local var_290_5 = 4.2
			local var_290_6 = arg_287_1:GetWordFromCfg(116431066)
			local var_290_7 = arg_287_1:FormatText(var_290_6.content)
			local var_290_8, var_290_9 = arg_287_1:GetPercentByPara(var_290_7, 2)

			if var_290_3 < arg_287_1.time_ and arg_287_1.time_ <= var_290_3 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0

				local var_290_10 = var_290_4 <= 0 and var_290_5 or var_290_5 * ((var_290_9 - arg_287_1.typewritterCharCountI18N) / var_290_4)

				if var_290_10 > 0 and var_290_5 < var_290_10 then
					arg_287_1.talkMaxDuration = var_290_10

					if var_290_10 + var_290_3 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_10 + var_290_3
					end
				end
			end

			local var_290_11 = 4.2
			local var_290_12 = math.max(var_290_11, arg_287_1.talkMaxDuration)

			if var_290_3 <= arg_287_1.time_ and arg_287_1.time_ < var_290_3 + var_290_12 then
				local var_290_13 = (arg_287_1.time_ - var_290_3) / var_290_12

				arg_287_1.fswtw_.percent = Mathf.Lerp(arg_287_1.var_.oldValueTypewriter, var_290_8, var_290_13)
				arg_287_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_287_1.fswtw_:SetDirty()
			end

			if arg_287_1.time_ >= var_290_3 + var_290_12 and arg_287_1.time_ < var_290_3 + var_290_12 + arg_290_0 then
				arg_287_1.fswtw_.percent = var_290_8

				arg_287_1.fswtw_:SetDirty()
				arg_287_1:ShowNextGo(true)

				arg_287_1.typewritterCharCountI18N = var_290_9
			end

			local var_290_14 = 0
			local var_290_15 = 15.533
			local var_290_16 = manager.audio:GetVoiceLength("story_v_out_116431", "116431066", "story_v_out_116431.awb") / 1000

			if var_290_16 > 0 and var_290_15 < var_290_16 and var_290_16 + var_290_14 > arg_287_1.duration_ then
				local var_290_17 = var_290_16

				arg_287_1.duration_ = var_290_16 + var_290_14
			end

			if var_290_14 < arg_287_1.time_ and arg_287_1.time_ <= var_290_14 + arg_290_0 then
				local var_290_18 = "play"
				local var_290_19 = "voice"

				arg_287_1:AudioAction(var_290_18, var_290_19, "story_v_out_116431", "116431066", "story_v_out_116431.awb")
			end

			local var_290_20 = 0

			if var_290_20 < arg_287_1.time_ and arg_287_1.time_ <= var_290_20 + arg_290_0 then
				arg_287_1.allBtn_.enabled = false
			end

			local var_290_21 = 4.21666666666667

			if arg_287_1.time_ >= var_290_20 + var_290_21 and arg_287_1.time_ < var_290_20 + var_290_21 + arg_290_0 then
				arg_287_1.allBtn_.enabled = true
			end
		end
	end,
	Play116431067 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 116431067
		arg_291_1.duration_ = 5.775999999999

		SetActive(arg_291_1.tipsGo_, false)

		function arg_291_1.onSingleLineFinish_()
			arg_291_1.onSingleLineUpdate_ = nil
			arg_291_1.onSingleLineFinish_ = nil
			arg_291_1.state_ = "waiting"
		end

		function arg_291_1.playNext_(arg_293_0)
			if arg_293_0 == 1 then
				arg_291_0:Play116431068(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = 0

			if var_294_0 < arg_291_1.time_ and arg_291_1.time_ <= var_294_0 + arg_294_0 then
				arg_291_1.var_.oldValueTypewriter = arg_291_1.fswtw_.percent

				arg_291_1:ShowNextGo(false)
			end

			local var_294_1 = 22
			local var_294_2 = 1.46666666666667
			local var_294_3 = arg_291_1:GetWordFromCfg(116431066)
			local var_294_4 = arg_291_1:FormatText(var_294_3.content)
			local var_294_5, var_294_6 = arg_291_1:GetPercentByPara(var_294_4, 3)

			if var_294_0 < arg_291_1.time_ and arg_291_1.time_ <= var_294_0 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0

				local var_294_7 = var_294_1 <= 0 and var_294_2 or var_294_2 * ((var_294_6 - arg_291_1.typewritterCharCountI18N) / var_294_1)

				if var_294_7 > 0 and var_294_2 < var_294_7 then
					arg_291_1.talkMaxDuration = var_294_7

					if var_294_7 + var_294_0 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_7 + var_294_0
					end
				end
			end

			local var_294_8 = 1.46666666666667
			local var_294_9 = math.max(var_294_8, arg_291_1.talkMaxDuration)

			if var_294_0 <= arg_291_1.time_ and arg_291_1.time_ < var_294_0 + var_294_9 then
				local var_294_10 = (arg_291_1.time_ - var_294_0) / var_294_9

				arg_291_1.fswtw_.percent = Mathf.Lerp(arg_291_1.var_.oldValueTypewriter, var_294_5, var_294_10)
				arg_291_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_291_1.fswtw_:SetDirty()
			end

			if arg_291_1.time_ >= var_294_0 + var_294_9 and arg_291_1.time_ < var_294_0 + var_294_9 + arg_294_0 then
				arg_291_1.fswtw_.percent = var_294_5

				arg_291_1.fswtw_:SetDirty()
				arg_291_1:ShowNextGo(true)

				arg_291_1.typewritterCharCountI18N = var_294_6
			end

			local var_294_11 = 0
			local var_294_12 = 5.776
			local var_294_13 = manager.audio:GetVoiceLength("story_v_out_116431", "116431067", "story_v_out_116431.awb") / 1000

			if var_294_13 > 0 and var_294_12 < var_294_13 and var_294_13 + var_294_11 > arg_291_1.duration_ then
				local var_294_14 = var_294_13

				arg_291_1.duration_ = var_294_13 + var_294_11
			end

			if var_294_11 < arg_291_1.time_ and arg_291_1.time_ <= var_294_11 + arg_294_0 then
				local var_294_15 = "play"
				local var_294_16 = "voice"

				arg_291_1:AudioAction(var_294_15, var_294_16, "story_v_out_116431", "116431067", "story_v_out_116431.awb")
			end

			local var_294_17 = 0

			if var_294_17 < arg_291_1.time_ and arg_291_1.time_ <= var_294_17 + arg_294_0 then
				arg_291_1.allBtn_.enabled = false
			end

			local var_294_18 = 1.46666666666667

			if arg_291_1.time_ >= var_294_17 + var_294_18 and arg_291_1.time_ < var_294_17 + var_294_18 + arg_294_0 then
				arg_291_1.allBtn_.enabled = true
			end
		end
	end,
	Play116431068 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 116431068
		arg_295_1.duration_ = 4.676999999999

		SetActive(arg_295_1.tipsGo_, false)

		function arg_295_1.onSingleLineFinish_()
			arg_295_1.onSingleLineUpdate_ = nil
			arg_295_1.onSingleLineFinish_ = nil
			arg_295_1.state_ = "waiting"
		end

		function arg_295_1.playNext_(arg_297_0)
			if arg_297_0 == 1 then
				arg_295_0:Play116431069(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = 0

			if var_298_0 < arg_295_1.time_ and arg_295_1.time_ <= var_298_0 + arg_298_0 then
				arg_295_1.var_.oldValueTypewriter = arg_295_1.fswtw_.percent

				arg_295_1:ShowNextGo(false)
			end

			local var_298_1 = 19
			local var_298_2 = 1.26666666666667
			local var_298_3 = arg_295_1:GetWordFromCfg(116431066)
			local var_298_4 = arg_295_1:FormatText(var_298_3.content)
			local var_298_5, var_298_6 = arg_295_1:GetPercentByPara(var_298_4, 4)

			if var_298_0 < arg_295_1.time_ and arg_295_1.time_ <= var_298_0 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0

				local var_298_7 = var_298_1 <= 0 and var_298_2 or var_298_2 * ((var_298_6 - arg_295_1.typewritterCharCountI18N) / var_298_1)

				if var_298_7 > 0 and var_298_2 < var_298_7 then
					arg_295_1.talkMaxDuration = var_298_7

					if var_298_7 + var_298_0 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_7 + var_298_0
					end
				end
			end

			local var_298_8 = 1.26666666666667
			local var_298_9 = math.max(var_298_8, arg_295_1.talkMaxDuration)

			if var_298_0 <= arg_295_1.time_ and arg_295_1.time_ < var_298_0 + var_298_9 then
				local var_298_10 = (arg_295_1.time_ - var_298_0) / var_298_9

				arg_295_1.fswtw_.percent = Mathf.Lerp(arg_295_1.var_.oldValueTypewriter, var_298_5, var_298_10)
				arg_295_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_295_1.fswtw_:SetDirty()
			end

			if arg_295_1.time_ >= var_298_0 + var_298_9 and arg_295_1.time_ < var_298_0 + var_298_9 + arg_298_0 then
				arg_295_1.fswtw_.percent = var_298_5

				arg_295_1.fswtw_:SetDirty()
				arg_295_1:ShowNextGo(true)

				arg_295_1.typewritterCharCountI18N = var_298_6
			end

			local var_298_11 = 0
			local var_298_12 = 4.677
			local var_298_13 = manager.audio:GetVoiceLength("story_v_out_116431", "116431068", "story_v_out_116431.awb") / 1000

			if var_298_13 > 0 and var_298_12 < var_298_13 and var_298_13 + var_298_11 > arg_295_1.duration_ then
				local var_298_14 = var_298_13

				arg_295_1.duration_ = var_298_13 + var_298_11
			end

			if var_298_11 < arg_295_1.time_ and arg_295_1.time_ <= var_298_11 + arg_298_0 then
				local var_298_15 = "play"
				local var_298_16 = "voice"

				arg_295_1:AudioAction(var_298_15, var_298_16, "story_v_out_116431", "116431068", "story_v_out_116431.awb")
			end

			local var_298_17 = 0

			if var_298_17 < arg_295_1.time_ and arg_295_1.time_ <= var_298_17 + arg_298_0 then
				arg_295_1.allBtn_.enabled = false
			end

			local var_298_18 = 1.26666666666667

			if arg_295_1.time_ >= var_298_17 + var_298_18 and arg_295_1.time_ < var_298_17 + var_298_18 + arg_298_0 then
				arg_295_1.allBtn_.enabled = true
			end
		end
	end,
	Play116431069 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 116431069
		arg_299_1.duration_ = 10.618999999999

		SetActive(arg_299_1.tipsGo_, false)

		function arg_299_1.onSingleLineFinish_()
			arg_299_1.onSingleLineUpdate_ = nil
			arg_299_1.onSingleLineFinish_ = nil
			arg_299_1.state_ = "waiting"
		end

		function arg_299_1.playNext_(arg_301_0)
			if arg_301_0 == 1 then
				arg_299_0:Play116431070(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = 0

			if var_302_0 < arg_299_1.time_ and arg_299_1.time_ <= var_302_0 + arg_302_0 then
				arg_299_1.var_.oldValueTypewriter = arg_299_1.fswtw_.percent

				arg_299_1:ShowNextGo(false)
			end

			local var_302_1 = 45
			local var_302_2 = 3
			local var_302_3 = arg_299_1:GetWordFromCfg(116431066)
			local var_302_4 = arg_299_1:FormatText(var_302_3.content)
			local var_302_5, var_302_6 = arg_299_1:GetPercentByPara(var_302_4, 5)

			if var_302_0 < arg_299_1.time_ and arg_299_1.time_ <= var_302_0 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0

				local var_302_7 = var_302_1 <= 0 and var_302_2 or var_302_2 * ((var_302_6 - arg_299_1.typewritterCharCountI18N) / var_302_1)

				if var_302_7 > 0 and var_302_2 < var_302_7 then
					arg_299_1.talkMaxDuration = var_302_7

					if var_302_7 + var_302_0 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_7 + var_302_0
					end
				end
			end

			local var_302_8 = 3
			local var_302_9 = math.max(var_302_8, arg_299_1.talkMaxDuration)

			if var_302_0 <= arg_299_1.time_ and arg_299_1.time_ < var_302_0 + var_302_9 then
				local var_302_10 = (arg_299_1.time_ - var_302_0) / var_302_9

				arg_299_1.fswtw_.percent = Mathf.Lerp(arg_299_1.var_.oldValueTypewriter, var_302_5, var_302_10)
				arg_299_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_299_1.fswtw_:SetDirty()
			end

			if arg_299_1.time_ >= var_302_0 + var_302_9 and arg_299_1.time_ < var_302_0 + var_302_9 + arg_302_0 then
				arg_299_1.fswtw_.percent = var_302_5

				arg_299_1.fswtw_:SetDirty()
				arg_299_1:ShowNextGo(true)

				arg_299_1.typewritterCharCountI18N = var_302_6
			end

			local var_302_11 = 0
			local var_302_12 = 10.619
			local var_302_13 = manager.audio:GetVoiceLength("story_v_out_116431", "116431069", "story_v_out_116431.awb") / 1000

			if var_302_13 > 0 and var_302_12 < var_302_13 and var_302_13 + var_302_11 > arg_299_1.duration_ then
				local var_302_14 = var_302_13

				arg_299_1.duration_ = var_302_13 + var_302_11
			end

			if var_302_11 < arg_299_1.time_ and arg_299_1.time_ <= var_302_11 + arg_302_0 then
				local var_302_15 = "play"
				local var_302_16 = "voice"

				arg_299_1:AudioAction(var_302_15, var_302_16, "story_v_out_116431", "116431069", "story_v_out_116431.awb")
			end

			local var_302_17 = 0

			if var_302_17 < arg_299_1.time_ and arg_299_1.time_ <= var_302_17 + arg_302_0 then
				arg_299_1.allBtn_.enabled = false
			end

			local var_302_18 = 3

			if arg_299_1.time_ >= var_302_17 + var_302_18 and arg_299_1.time_ < var_302_17 + var_302_18 + arg_302_0 then
				arg_299_1.allBtn_.enabled = true
			end
		end
	end,
	Play116431070 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 116431070
		arg_303_1.duration_ = 0.016666666666

		SetActive(arg_303_1.tipsGo_, false)

		function arg_303_1.onSingleLineFinish_()
			arg_303_1.onSingleLineUpdate_ = nil
			arg_303_1.onSingleLineFinish_ = nil
			arg_303_1.state_ = "waiting"

			SetActive(arg_303_1.choicesGo_, true)

			for iter_304_0, iter_304_1 in ipairs(arg_303_1.choices_) do
				local var_304_0 = iter_304_0 <= 1

				SetActive(iter_304_1.go, var_304_0)
			end

			arg_303_1.choices_[1].txt.text = arg_303_1:FormatText(StoryChoiceCfg[275].name)
		end

		function arg_303_1.playNext_(arg_305_0)
			if arg_305_0 == 1 then
				arg_303_0:Play116431071(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			return
		end
	end,
	Play116431071 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 116431071
		arg_307_1.duration_ = 5.755999999999

		SetActive(arg_307_1.tipsGo_, false)

		function arg_307_1.onSingleLineFinish_()
			arg_307_1.onSingleLineUpdate_ = nil
			arg_307_1.onSingleLineFinish_ = nil
			arg_307_1.state_ = "waiting"
		end

		function arg_307_1.playNext_(arg_309_0)
			if arg_309_0 == 1 then
				arg_307_0:Play116431072(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = 0

			if var_310_0 < arg_307_1.time_ and arg_307_1.time_ <= var_310_0 + arg_310_0 then
				arg_307_1.fswbg_:SetActive(true)
				arg_307_1.dialog_:SetActive(false)

				arg_307_1.fswtw_.percent = 0

				local var_310_1 = arg_307_1:GetWordFromCfg(116431071)
				local var_310_2 = arg_307_1:FormatText(var_310_1.content)

				arg_307_1.fswt_.text = var_310_2

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.fswt_)

				arg_307_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_307_1.fswtw_:SetDirty()

				arg_307_1.typewritterCharCountI18N = 0

				SetActive(arg_307_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_307_1:ShowNextGo(false)
			end

			local var_310_3 = 0.0166666666666667

			if var_310_3 < arg_307_1.time_ and arg_307_1.time_ <= var_310_3 + arg_310_0 then
				arg_307_1.var_.oldValueTypewriter = arg_307_1.fswtw_.percent

				arg_307_1:ShowNextGo(false)
			end

			local var_310_4 = 17
			local var_310_5 = 1.13333333333333
			local var_310_6 = arg_307_1:GetWordFromCfg(116431071)
			local var_310_7 = arg_307_1:FormatText(var_310_6.content)
			local var_310_8, var_310_9 = arg_307_1:GetPercentByPara(var_310_7, 1)

			if var_310_3 < arg_307_1.time_ and arg_307_1.time_ <= var_310_3 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0

				local var_310_10 = var_310_4 <= 0 and var_310_5 or var_310_5 * ((var_310_9 - arg_307_1.typewritterCharCountI18N) / var_310_4)

				if var_310_10 > 0 and var_310_5 < var_310_10 then
					arg_307_1.talkMaxDuration = var_310_10

					if var_310_10 + var_310_3 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_10 + var_310_3
					end
				end
			end

			local var_310_11 = 1.13333333333333
			local var_310_12 = math.max(var_310_11, arg_307_1.talkMaxDuration)

			if var_310_3 <= arg_307_1.time_ and arg_307_1.time_ < var_310_3 + var_310_12 then
				local var_310_13 = (arg_307_1.time_ - var_310_3) / var_310_12

				arg_307_1.fswtw_.percent = Mathf.Lerp(arg_307_1.var_.oldValueTypewriter, var_310_8, var_310_13)
				arg_307_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_307_1.fswtw_:SetDirty()
			end

			if arg_307_1.time_ >= var_310_3 + var_310_12 and arg_307_1.time_ < var_310_3 + var_310_12 + arg_310_0 then
				arg_307_1.fswtw_.percent = var_310_8

				arg_307_1.fswtw_:SetDirty()
				arg_307_1:ShowNextGo(true)

				arg_307_1.typewritterCharCountI18N = var_310_9
			end

			local var_310_14 = 0
			local var_310_15 = 5.756
			local var_310_16 = manager.audio:GetVoiceLength("story_v_out_116431", "116431071", "story_v_out_116431.awb") / 1000

			if var_310_16 > 0 and var_310_15 < var_310_16 and var_310_16 + var_310_14 > arg_307_1.duration_ then
				local var_310_17 = var_310_16

				arg_307_1.duration_ = var_310_16 + var_310_14
			end

			if var_310_14 < arg_307_1.time_ and arg_307_1.time_ <= var_310_14 + arg_310_0 then
				local var_310_18 = "play"
				local var_310_19 = "voice"

				arg_307_1:AudioAction(var_310_18, var_310_19, "story_v_out_116431", "116431071", "story_v_out_116431.awb")
			end

			local var_310_20 = 0

			if var_310_20 < arg_307_1.time_ and arg_307_1.time_ <= var_310_20 + arg_310_0 then
				arg_307_1.allBtn_.enabled = false
			end

			local var_310_21 = 1.15

			if arg_307_1.time_ >= var_310_20 + var_310_21 and arg_307_1.time_ < var_310_20 + var_310_21 + arg_310_0 then
				arg_307_1.allBtn_.enabled = true
			end
		end
	end,
	Play116431072 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 116431072
		arg_311_1.duration_ = 9

		SetActive(arg_311_1.tipsGo_, false)

		function arg_311_1.onSingleLineFinish_()
			arg_311_1.onSingleLineUpdate_ = nil
			arg_311_1.onSingleLineFinish_ = nil
			arg_311_1.state_ = "waiting"
		end

		function arg_311_1.playNext_(arg_313_0)
			if arg_313_0 == 1 then
				arg_311_0:Play116431073(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = "A00"

			if arg_311_1.bgs_[var_314_0] == nil then
				local var_314_1 = Object.Instantiate(arg_311_1.paintGo_)

				var_314_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_314_0)
				var_314_1.name = var_314_0
				var_314_1.transform.parent = arg_311_1.stage_.transform
				var_314_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_311_1.bgs_[var_314_0] = var_314_1
			end

			local var_314_2 = 2

			if var_314_2 < arg_311_1.time_ and arg_311_1.time_ <= var_314_2 + arg_314_0 then
				local var_314_3 = manager.ui.mainCamera.transform.localPosition
				local var_314_4 = Vector3.New(0, 0, 10) + Vector3.New(var_314_3.x, var_314_3.y, 0)
				local var_314_5 = arg_311_1.bgs_.A00

				var_314_5.transform.localPosition = var_314_4
				var_314_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_314_6 = var_314_5:GetComponent("SpriteRenderer")

				if var_314_6 and var_314_6.sprite then
					local var_314_7 = (var_314_5.transform.localPosition - var_314_3).z
					local var_314_8 = manager.ui.mainCameraCom_
					local var_314_9 = 2 * var_314_7 * Mathf.Tan(var_314_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_314_10 = var_314_9 * var_314_8.aspect
					local var_314_11 = var_314_6.sprite.bounds.size.x
					local var_314_12 = var_314_6.sprite.bounds.size.y
					local var_314_13 = var_314_10 / var_314_11
					local var_314_14 = var_314_9 / var_314_12
					local var_314_15 = var_314_14 < var_314_13 and var_314_13 or var_314_14

					var_314_5.transform.localScale = Vector3.New(var_314_15, var_314_15, 0)
				end

				for iter_314_0, iter_314_1 in pairs(arg_311_1.bgs_) do
					if iter_314_0 ~= "A00" then
						iter_314_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_314_16 = 0

			if var_314_16 < arg_311_1.time_ and arg_311_1.time_ <= var_314_16 + arg_314_0 then
				arg_311_1.mask_.enabled = true
				arg_311_1.mask_.raycastTarget = true

				arg_311_1:SetGaussion(false)
			end

			local var_314_17 = 2

			if var_314_16 <= arg_311_1.time_ and arg_311_1.time_ < var_314_16 + var_314_17 then
				local var_314_18 = (arg_311_1.time_ - var_314_16) / var_314_17
				local var_314_19 = Color.New(0, 0, 0)

				var_314_19.a = Mathf.Lerp(0, 1, var_314_18)
				arg_311_1.mask_.color = var_314_19
			end

			if arg_311_1.time_ >= var_314_16 + var_314_17 and arg_311_1.time_ < var_314_16 + var_314_17 + arg_314_0 then
				local var_314_20 = Color.New(0, 0, 0)

				var_314_20.a = 1
				arg_311_1.mask_.color = var_314_20
			end

			local var_314_21 = 2

			if var_314_21 < arg_311_1.time_ and arg_311_1.time_ <= var_314_21 + arg_314_0 then
				arg_311_1.mask_.enabled = true
				arg_311_1.mask_.raycastTarget = true

				arg_311_1:SetGaussion(false)
			end

			local var_314_22 = 2

			if var_314_21 <= arg_311_1.time_ and arg_311_1.time_ < var_314_21 + var_314_22 then
				local var_314_23 = (arg_311_1.time_ - var_314_21) / var_314_22
				local var_314_24 = Color.New(0, 0, 0)

				var_314_24.a = Mathf.Lerp(1, 0, var_314_23)
				arg_311_1.mask_.color = var_314_24
			end

			if arg_311_1.time_ >= var_314_21 + var_314_22 and arg_311_1.time_ < var_314_21 + var_314_22 + arg_314_0 then
				local var_314_25 = Color.New(0, 0, 0)
				local var_314_26 = 0

				arg_311_1.mask_.enabled = false
				var_314_25.a = var_314_26
				arg_311_1.mask_.color = var_314_25
			end

			local var_314_27 = 2

			if var_314_27 < arg_311_1.time_ and arg_311_1.time_ <= var_314_27 + arg_314_0 then
				arg_311_1.fswbg_:SetActive(false)
				arg_311_1.dialog_:SetActive(false)
				arg_311_1:ShowNextGo(false)
			end

			local var_314_28 = 0
			local var_314_29 = 0.666666666666667

			if var_314_28 < arg_311_1.time_ and arg_311_1.time_ <= var_314_28 + arg_314_0 then
				local var_314_30 = "play"
				local var_314_31 = "music"

				arg_311_1:AudioAction(var_314_30, var_314_31, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_314_32 = 0.866666666666667
			local var_314_33 = 1.13333333333333

			if var_314_32 < arg_311_1.time_ and arg_311_1.time_ <= var_314_32 + arg_314_0 then
				local var_314_34 = "play"
				local var_314_35 = "music"

				arg_311_1:AudioAction(var_314_34, var_314_35, "bgm_story_office", "bgm_story_office", "bgm_story_office.awb")
			end

			if arg_311_1.frameCnt_ <= 1 then
				arg_311_1.dialog_:SetActive(false)
			end

			local var_314_36 = 4
			local var_314_37 = 0.35

			if var_314_36 < arg_311_1.time_ and arg_311_1.time_ <= var_314_36 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0

				arg_311_1.dialog_:SetActive(true)

				local var_314_38 = LeanTween.value(arg_311_1.dialog_, 0, 1, 0.3)

				var_314_38:setOnUpdate(LuaHelper.FloatAction(function(arg_315_0)
					arg_311_1.dialogCg_.alpha = arg_315_0
				end))
				var_314_38:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_311_1.dialog_)
					var_314_38:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_311_1.duration_ = arg_311_1.duration_ + 0.3

				SetActive(arg_311_1.leftNameGo_, false)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_39 = arg_311_1:GetWordFromCfg(116431072)
				local var_314_40 = arg_311_1:FormatText(var_314_39.content)

				arg_311_1.text_.text = var_314_40

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_41 = 14
				local var_314_42 = utf8.len(var_314_40)
				local var_314_43 = var_314_41 <= 0 and var_314_37 or var_314_37 * (var_314_42 / var_314_41)

				if var_314_43 > 0 and var_314_37 < var_314_43 then
					arg_311_1.talkMaxDuration = var_314_43
					var_314_36 = var_314_36 + 0.3

					if var_314_43 + var_314_36 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_43 + var_314_36
					end
				end

				arg_311_1.text_.text = var_314_40
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)
				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_44 = var_314_36 + 0.3
			local var_314_45 = math.max(var_314_37, arg_311_1.talkMaxDuration)

			if var_314_44 <= arg_311_1.time_ and arg_311_1.time_ < var_314_44 + var_314_45 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_44) / var_314_45

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_44 + var_314_45 and arg_311_1.time_ < var_314_44 + var_314_45 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play116431073 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 116431073
		arg_317_1.duration_ = 3.966

		local var_317_0 = {
			zh = 3.933,
			ja = 3.966
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
				arg_317_0:Play116431074(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = "1019ui_story"

			if arg_317_1.actors_[var_320_0] == nil then
				local var_320_1 = Object.Instantiate(Asset.Load("Char/" .. var_320_0), arg_317_1.stage_.transform)

				var_320_1.name = var_320_0
				var_320_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_317_1.actors_[var_320_0] = var_320_1

				local var_320_2 = var_320_1:GetComponentInChildren(typeof(CharacterEffect))

				var_320_2.enabled = true

				local var_320_3 = GameObjectTools.GetOrAddComponent(var_320_1, typeof(DynamicBoneHelper))

				if var_320_3 then
					var_320_3:EnableDynamicBone(false)
				end

				arg_317_1:ShowWeapon(var_320_2.transform, false)

				arg_317_1.var_[var_320_0 .. "Animator"] = var_320_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_317_1.var_[var_320_0 .. "Animator"].applyRootMotion = true
				arg_317_1.var_[var_320_0 .. "LipSync"] = var_320_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_320_4 = arg_317_1.actors_["1019ui_story"]
			local var_320_5 = 0

			if var_320_5 < arg_317_1.time_ and arg_317_1.time_ <= var_320_5 + arg_320_0 and arg_317_1.var_.characterEffect1019ui_story == nil then
				arg_317_1.var_.characterEffect1019ui_story = var_320_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_320_6 = 0.2

			if var_320_5 <= arg_317_1.time_ and arg_317_1.time_ < var_320_5 + var_320_6 then
				local var_320_7 = (arg_317_1.time_ - var_320_5) / var_320_6

				if arg_317_1.var_.characterEffect1019ui_story then
					arg_317_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_317_1.time_ >= var_320_5 + var_320_6 and arg_317_1.time_ < var_320_5 + var_320_6 + arg_320_0 and arg_317_1.var_.characterEffect1019ui_story then
				arg_317_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_320_8 = arg_317_1.actors_["1029ui_story"]
			local var_320_9 = 0

			if var_320_9 < arg_317_1.time_ and arg_317_1.time_ <= var_320_9 + arg_320_0 and arg_317_1.var_.characterEffect1029ui_story == nil then
				arg_317_1.var_.characterEffect1029ui_story = var_320_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_320_10 = 0.0166666666666667

			if var_320_9 <= arg_317_1.time_ and arg_317_1.time_ < var_320_9 + var_320_10 then
				local var_320_11 = (arg_317_1.time_ - var_320_9) / var_320_10

				if arg_317_1.var_.characterEffect1029ui_story then
					local var_320_12 = Mathf.Lerp(0, 0.5, var_320_11)

					arg_317_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_317_1.var_.characterEffect1029ui_story.fillRatio = var_320_12
				end
			end

			if arg_317_1.time_ >= var_320_9 + var_320_10 and arg_317_1.time_ < var_320_9 + var_320_10 + arg_320_0 and arg_317_1.var_.characterEffect1029ui_story then
				local var_320_13 = 0.5

				arg_317_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_317_1.var_.characterEffect1029ui_story.fillRatio = var_320_13
			end

			local var_320_14 = 0

			if var_320_14 < arg_317_1.time_ and arg_317_1.time_ <= var_320_14 + arg_320_0 then
				arg_317_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action2_1")
			end

			local var_320_15 = 0

			if var_320_15 < arg_317_1.time_ and arg_317_1.time_ <= var_320_15 + arg_320_0 then
				arg_317_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_320_16 = arg_317_1.actors_["1019ui_story"].transform
			local var_320_17 = 0

			if var_320_17 < arg_317_1.time_ and arg_317_1.time_ <= var_320_17 + arg_320_0 then
				arg_317_1.var_.moveOldPos1019ui_story = var_320_16.localPosition
			end

			local var_320_18 = 0.001

			if var_320_17 <= arg_317_1.time_ and arg_317_1.time_ < var_320_17 + var_320_18 then
				local var_320_19 = (arg_317_1.time_ - var_320_17) / var_320_18
				local var_320_20 = Vector3.New(-0.7, -1.08, -5.9)

				var_320_16.localPosition = Vector3.Lerp(arg_317_1.var_.moveOldPos1019ui_story, var_320_20, var_320_19)

				local var_320_21 = manager.ui.mainCamera.transform.position - var_320_16.position

				var_320_16.forward = Vector3.New(var_320_21.x, var_320_21.y, var_320_21.z)

				local var_320_22 = var_320_16.localEulerAngles

				var_320_22.z = 0
				var_320_22.x = 0
				var_320_16.localEulerAngles = var_320_22
			end

			if arg_317_1.time_ >= var_320_17 + var_320_18 and arg_317_1.time_ < var_320_17 + var_320_18 + arg_320_0 then
				var_320_16.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_320_23 = manager.ui.mainCamera.transform.position - var_320_16.position

				var_320_16.forward = Vector3.New(var_320_23.x, var_320_23.y, var_320_23.z)

				local var_320_24 = var_320_16.localEulerAngles

				var_320_24.z = 0
				var_320_24.x = 0
				var_320_16.localEulerAngles = var_320_24
			end

			local var_320_25 = arg_317_1.actors_["1029ui_story"].transform
			local var_320_26 = 0

			if var_320_26 < arg_317_1.time_ and arg_317_1.time_ <= var_320_26 + arg_320_0 then
				arg_317_1.var_.moveOldPos1029ui_story = var_320_25.localPosition
			end

			local var_320_27 = 0.001

			if var_320_26 <= arg_317_1.time_ and arg_317_1.time_ < var_320_26 + var_320_27 then
				local var_320_28 = (arg_317_1.time_ - var_320_26) / var_320_27
				local var_320_29 = Vector3.New(0.7, -1.09, -6.2)

				var_320_25.localPosition = Vector3.Lerp(arg_317_1.var_.moveOldPos1029ui_story, var_320_29, var_320_28)

				local var_320_30 = manager.ui.mainCamera.transform.position - var_320_25.position

				var_320_25.forward = Vector3.New(var_320_30.x, var_320_30.y, var_320_30.z)

				local var_320_31 = var_320_25.localEulerAngles

				var_320_31.z = 0
				var_320_31.x = 0
				var_320_25.localEulerAngles = var_320_31
			end

			if arg_317_1.time_ >= var_320_26 + var_320_27 and arg_317_1.time_ < var_320_26 + var_320_27 + arg_320_0 then
				var_320_25.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_320_32 = manager.ui.mainCamera.transform.position - var_320_25.position

				var_320_25.forward = Vector3.New(var_320_32.x, var_320_32.y, var_320_32.z)

				local var_320_33 = var_320_25.localEulerAngles

				var_320_33.z = 0
				var_320_33.x = 0
				var_320_25.localEulerAngles = var_320_33
			end

			local var_320_34 = 0

			if var_320_34 < arg_317_1.time_ and arg_317_1.time_ <= var_320_34 + arg_320_0 then
				arg_317_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action1_1")
			end

			local var_320_35 = 0
			local var_320_36 = 0.425

			if var_320_35 < arg_317_1.time_ and arg_317_1.time_ <= var_320_35 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, true)

				local var_320_37 = arg_317_1:FormatText(StoryNameCfg[47].name)

				arg_317_1.leftNameTxt_.text = var_320_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_317_1.leftNameTxt_.transform)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1.leftNameTxt_.text)
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_38 = arg_317_1:GetWordFromCfg(116431073)
				local var_320_39 = arg_317_1:FormatText(var_320_38.content)

				arg_317_1.text_.text = var_320_39

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_40 = 17
				local var_320_41 = utf8.len(var_320_39)
				local var_320_42 = var_320_40 <= 0 and var_320_36 or var_320_36 * (var_320_41 / var_320_40)

				if var_320_42 > 0 and var_320_36 < var_320_42 then
					arg_317_1.talkMaxDuration = var_320_42

					if var_320_42 + var_320_35 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_42 + var_320_35
					end
				end

				arg_317_1.text_.text = var_320_39
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431073", "story_v_out_116431.awb") ~= 0 then
					local var_320_43 = manager.audio:GetVoiceLength("story_v_out_116431", "116431073", "story_v_out_116431.awb") / 1000

					if var_320_43 + var_320_35 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_43 + var_320_35
					end

					if var_320_38.prefab_name ~= "" and arg_317_1.actors_[var_320_38.prefab_name] ~= nil then
						local var_320_44 = LuaForUtil.PlayVoiceWithCriLipsync(arg_317_1.actors_[var_320_38.prefab_name].transform, "story_v_out_116431", "116431073", "story_v_out_116431.awb")

						arg_317_1:RecordAudio("116431073", var_320_44)
						arg_317_1:RecordAudio("116431073", var_320_44)
					else
						arg_317_1:AudioAction("play", "voice", "story_v_out_116431", "116431073", "story_v_out_116431.awb")
					end

					arg_317_1:RecordHistoryTalkVoice("story_v_out_116431", "116431073", "story_v_out_116431.awb")
				end

				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_45 = math.max(var_320_36, arg_317_1.talkMaxDuration)

			if var_320_35 <= arg_317_1.time_ and arg_317_1.time_ < var_320_35 + var_320_45 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_35) / var_320_45

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_35 + var_320_45 and arg_317_1.time_ < var_320_35 + var_320_45 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play116431074 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 116431074
		arg_321_1.duration_ = 4.5

		local var_321_0 = {
			zh = 4.366,
			ja = 4.5
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
				arg_321_0:Play116431075(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = arg_321_1.actors_["1019ui_story"].transform
			local var_324_1 = 0

			if var_324_1 < arg_321_1.time_ and arg_321_1.time_ <= var_324_1 + arg_324_0 then
				arg_321_1.var_.moveOldPos1019ui_story = var_324_0.localPosition
			end

			local var_324_2 = 0.001

			if var_324_1 <= arg_321_1.time_ and arg_321_1.time_ < var_324_1 + var_324_2 then
				local var_324_3 = (arg_321_1.time_ - var_324_1) / var_324_2
				local var_324_4 = Vector3.New(-0.7, -1.08, -5.9)

				var_324_0.localPosition = Vector3.Lerp(arg_321_1.var_.moveOldPos1019ui_story, var_324_4, var_324_3)

				local var_324_5 = manager.ui.mainCamera.transform.position - var_324_0.position

				var_324_0.forward = Vector3.New(var_324_5.x, var_324_5.y, var_324_5.z)

				local var_324_6 = var_324_0.localEulerAngles

				var_324_6.z = 0
				var_324_6.x = 0
				var_324_0.localEulerAngles = var_324_6
			end

			if arg_321_1.time_ >= var_324_1 + var_324_2 and arg_321_1.time_ < var_324_1 + var_324_2 + arg_324_0 then
				var_324_0.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_324_7 = manager.ui.mainCamera.transform.position - var_324_0.position

				var_324_0.forward = Vector3.New(var_324_7.x, var_324_7.y, var_324_7.z)

				local var_324_8 = var_324_0.localEulerAngles

				var_324_8.z = 0
				var_324_8.x = 0
				var_324_0.localEulerAngles = var_324_8
			end

			local var_324_9 = arg_321_1.actors_["1029ui_story"].transform
			local var_324_10 = 0

			if var_324_10 < arg_321_1.time_ and arg_321_1.time_ <= var_324_10 + arg_324_0 then
				arg_321_1.var_.moveOldPos1029ui_story = var_324_9.localPosition
			end

			local var_324_11 = 0.001

			if var_324_10 <= arg_321_1.time_ and arg_321_1.time_ < var_324_10 + var_324_11 then
				local var_324_12 = (arg_321_1.time_ - var_324_10) / var_324_11
				local var_324_13 = Vector3.New(0.7, -1.09, -6.2)

				var_324_9.localPosition = Vector3.Lerp(arg_321_1.var_.moveOldPos1029ui_story, var_324_13, var_324_12)

				local var_324_14 = manager.ui.mainCamera.transform.position - var_324_9.position

				var_324_9.forward = Vector3.New(var_324_14.x, var_324_14.y, var_324_14.z)

				local var_324_15 = var_324_9.localEulerAngles

				var_324_15.z = 0
				var_324_15.x = 0
				var_324_9.localEulerAngles = var_324_15
			end

			if arg_321_1.time_ >= var_324_10 + var_324_11 and arg_321_1.time_ < var_324_10 + var_324_11 + arg_324_0 then
				var_324_9.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_324_16 = manager.ui.mainCamera.transform.position - var_324_9.position

				var_324_9.forward = Vector3.New(var_324_16.x, var_324_16.y, var_324_16.z)

				local var_324_17 = var_324_9.localEulerAngles

				var_324_17.z = 0
				var_324_17.x = 0
				var_324_9.localEulerAngles = var_324_17
			end

			local var_324_18 = arg_321_1.actors_["1019ui_story"]
			local var_324_19 = 0

			if var_324_19 < arg_321_1.time_ and arg_321_1.time_ <= var_324_19 + arg_324_0 and arg_321_1.var_.characterEffect1019ui_story == nil then
				arg_321_1.var_.characterEffect1019ui_story = var_324_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_324_20 = 0.2

			if var_324_19 <= arg_321_1.time_ and arg_321_1.time_ < var_324_19 + var_324_20 then
				local var_324_21 = (arg_321_1.time_ - var_324_19) / var_324_20

				if arg_321_1.var_.characterEffect1019ui_story then
					local var_324_22 = Mathf.Lerp(0, 0.5, var_324_21)

					arg_321_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_321_1.var_.characterEffect1019ui_story.fillRatio = var_324_22
				end
			end

			if arg_321_1.time_ >= var_324_19 + var_324_20 and arg_321_1.time_ < var_324_19 + var_324_20 + arg_324_0 and arg_321_1.var_.characterEffect1019ui_story then
				local var_324_23 = 0.5

				arg_321_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_321_1.var_.characterEffect1019ui_story.fillRatio = var_324_23
			end

			local var_324_24 = arg_321_1.actors_["1029ui_story"]
			local var_324_25 = 0

			if var_324_25 < arg_321_1.time_ and arg_321_1.time_ <= var_324_25 + arg_324_0 and arg_321_1.var_.characterEffect1029ui_story == nil then
				arg_321_1.var_.characterEffect1029ui_story = var_324_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_324_26 = 0.2

			if var_324_25 <= arg_321_1.time_ and arg_321_1.time_ < var_324_25 + var_324_26 then
				local var_324_27 = (arg_321_1.time_ - var_324_25) / var_324_26

				if arg_321_1.var_.characterEffect1029ui_story then
					arg_321_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_321_1.time_ >= var_324_25 + var_324_26 and arg_321_1.time_ < var_324_25 + var_324_26 + arg_324_0 and arg_321_1.var_.characterEffect1029ui_story then
				arg_321_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_324_28 = 0

			if var_324_28 < arg_321_1.time_ and arg_321_1.time_ <= var_324_28 + arg_324_0 then
				arg_321_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action4_1")
			end

			local var_324_29 = 0

			if var_324_29 < arg_321_1.time_ and arg_321_1.time_ <= var_324_29 + arg_324_0 then
				arg_321_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_324_30 = 0
			local var_324_31 = 0.375

			if var_324_30 < arg_321_1.time_ and arg_321_1.time_ <= var_324_30 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, true)

				local var_324_32 = arg_321_1:FormatText(StoryNameCfg[319].name)

				arg_321_1.leftNameTxt_.text = var_324_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_321_1.leftNameTxt_.transform)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1.leftNameTxt_.text)
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_33 = arg_321_1:GetWordFromCfg(116431074)
				local var_324_34 = arg_321_1:FormatText(var_324_33.content)

				arg_321_1.text_.text = var_324_34

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_35 = 15
				local var_324_36 = utf8.len(var_324_34)
				local var_324_37 = var_324_35 <= 0 and var_324_31 or var_324_31 * (var_324_36 / var_324_35)

				if var_324_37 > 0 and var_324_31 < var_324_37 then
					arg_321_1.talkMaxDuration = var_324_37

					if var_324_37 + var_324_30 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_37 + var_324_30
					end
				end

				arg_321_1.text_.text = var_324_34
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431074", "story_v_out_116431.awb") ~= 0 then
					local var_324_38 = manager.audio:GetVoiceLength("story_v_out_116431", "116431074", "story_v_out_116431.awb") / 1000

					if var_324_38 + var_324_30 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_38 + var_324_30
					end

					if var_324_33.prefab_name ~= "" and arg_321_1.actors_[var_324_33.prefab_name] ~= nil then
						local var_324_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_321_1.actors_[var_324_33.prefab_name].transform, "story_v_out_116431", "116431074", "story_v_out_116431.awb")

						arg_321_1:RecordAudio("116431074", var_324_39)
						arg_321_1:RecordAudio("116431074", var_324_39)
					else
						arg_321_1:AudioAction("play", "voice", "story_v_out_116431", "116431074", "story_v_out_116431.awb")
					end

					arg_321_1:RecordHistoryTalkVoice("story_v_out_116431", "116431074", "story_v_out_116431.awb")
				end

				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_40 = math.max(var_324_31, arg_321_1.talkMaxDuration)

			if var_324_30 <= arg_321_1.time_ and arg_321_1.time_ < var_324_30 + var_324_40 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_30) / var_324_40

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_30 + var_324_40 and arg_321_1.time_ < var_324_30 + var_324_40 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play116431075 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 116431075
		arg_325_1.duration_ = 10

		local var_325_0 = {
			zh = 8.733,
			ja = 10
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
				arg_325_0:Play116431076(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = arg_325_1.actors_["1019ui_story"].transform
			local var_328_1 = 0

			if var_328_1 < arg_325_1.time_ and arg_325_1.time_ <= var_328_1 + arg_328_0 then
				arg_325_1.var_.moveOldPos1019ui_story = var_328_0.localPosition
			end

			local var_328_2 = 0.001

			if var_328_1 <= arg_325_1.time_ and arg_325_1.time_ < var_328_1 + var_328_2 then
				local var_328_3 = (arg_325_1.time_ - var_328_1) / var_328_2
				local var_328_4 = Vector3.New(-0.7, -1.08, -5.9)

				var_328_0.localPosition = Vector3.Lerp(arg_325_1.var_.moveOldPos1019ui_story, var_328_4, var_328_3)

				local var_328_5 = manager.ui.mainCamera.transform.position - var_328_0.position

				var_328_0.forward = Vector3.New(var_328_5.x, var_328_5.y, var_328_5.z)

				local var_328_6 = var_328_0.localEulerAngles

				var_328_6.z = 0
				var_328_6.x = 0
				var_328_0.localEulerAngles = var_328_6
			end

			if arg_325_1.time_ >= var_328_1 + var_328_2 and arg_325_1.time_ < var_328_1 + var_328_2 + arg_328_0 then
				var_328_0.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_328_7 = manager.ui.mainCamera.transform.position - var_328_0.position

				var_328_0.forward = Vector3.New(var_328_7.x, var_328_7.y, var_328_7.z)

				local var_328_8 = var_328_0.localEulerAngles

				var_328_8.z = 0
				var_328_8.x = 0
				var_328_0.localEulerAngles = var_328_8
			end

			local var_328_9 = arg_325_1.actors_["1029ui_story"].transform
			local var_328_10 = 0

			if var_328_10 < arg_325_1.time_ and arg_325_1.time_ <= var_328_10 + arg_328_0 then
				arg_325_1.var_.moveOldPos1029ui_story = var_328_9.localPosition
			end

			local var_328_11 = 0.001

			if var_328_10 <= arg_325_1.time_ and arg_325_1.time_ < var_328_10 + var_328_11 then
				local var_328_12 = (arg_325_1.time_ - var_328_10) / var_328_11
				local var_328_13 = Vector3.New(0.7, -1.09, -6.2)

				var_328_9.localPosition = Vector3.Lerp(arg_325_1.var_.moveOldPos1029ui_story, var_328_13, var_328_12)

				local var_328_14 = manager.ui.mainCamera.transform.position - var_328_9.position

				var_328_9.forward = Vector3.New(var_328_14.x, var_328_14.y, var_328_14.z)

				local var_328_15 = var_328_9.localEulerAngles

				var_328_15.z = 0
				var_328_15.x = 0
				var_328_9.localEulerAngles = var_328_15
			end

			if arg_325_1.time_ >= var_328_10 + var_328_11 and arg_325_1.time_ < var_328_10 + var_328_11 + arg_328_0 then
				var_328_9.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_328_16 = manager.ui.mainCamera.transform.position - var_328_9.position

				var_328_9.forward = Vector3.New(var_328_16.x, var_328_16.y, var_328_16.z)

				local var_328_17 = var_328_9.localEulerAngles

				var_328_17.z = 0
				var_328_17.x = 0
				var_328_9.localEulerAngles = var_328_17
			end

			local var_328_18 = 0

			if var_328_18 < arg_325_1.time_ and arg_325_1.time_ <= var_328_18 + arg_328_0 then
				arg_325_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_328_19 = 0
			local var_328_20 = 0.875

			if var_328_19 < arg_325_1.time_ and arg_325_1.time_ <= var_328_19 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, true)

				local var_328_21 = arg_325_1:FormatText(StoryNameCfg[319].name)

				arg_325_1.leftNameTxt_.text = var_328_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_325_1.leftNameTxt_.transform)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1.leftNameTxt_.text)
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_22 = arg_325_1:GetWordFromCfg(116431075)
				local var_328_23 = arg_325_1:FormatText(var_328_22.content)

				arg_325_1.text_.text = var_328_23

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_24 = 35
				local var_328_25 = utf8.len(var_328_23)
				local var_328_26 = var_328_24 <= 0 and var_328_20 or var_328_20 * (var_328_25 / var_328_24)

				if var_328_26 > 0 and var_328_20 < var_328_26 then
					arg_325_1.talkMaxDuration = var_328_26

					if var_328_26 + var_328_19 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_26 + var_328_19
					end
				end

				arg_325_1.text_.text = var_328_23
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431075", "story_v_out_116431.awb") ~= 0 then
					local var_328_27 = manager.audio:GetVoiceLength("story_v_out_116431", "116431075", "story_v_out_116431.awb") / 1000

					if var_328_27 + var_328_19 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_27 + var_328_19
					end

					if var_328_22.prefab_name ~= "" and arg_325_1.actors_[var_328_22.prefab_name] ~= nil then
						local var_328_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_325_1.actors_[var_328_22.prefab_name].transform, "story_v_out_116431", "116431075", "story_v_out_116431.awb")

						arg_325_1:RecordAudio("116431075", var_328_28)
						arg_325_1:RecordAudio("116431075", var_328_28)
					else
						arg_325_1:AudioAction("play", "voice", "story_v_out_116431", "116431075", "story_v_out_116431.awb")
					end

					arg_325_1:RecordHistoryTalkVoice("story_v_out_116431", "116431075", "story_v_out_116431.awb")
				end

				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_29 = math.max(var_328_20, arg_325_1.talkMaxDuration)

			if var_328_19 <= arg_325_1.time_ and arg_325_1.time_ < var_328_19 + var_328_29 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_19) / var_328_29

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_19 + var_328_29 and arg_325_1.time_ < var_328_19 + var_328_29 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play116431076 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 116431076
		arg_329_1.duration_ = 7.6

		local var_329_0 = {
			zh = 5.033,
			ja = 7.6
		}
		local var_329_1 = manager.audio:GetLocalizationFlag()

		if var_329_0[var_329_1] ~= nil then
			arg_329_1.duration_ = var_329_0[var_329_1]
		end

		SetActive(arg_329_1.tipsGo_, false)

		function arg_329_1.onSingleLineFinish_()
			arg_329_1.onSingleLineUpdate_ = nil
			arg_329_1.onSingleLineFinish_ = nil
			arg_329_1.state_ = "waiting"
		end

		function arg_329_1.playNext_(arg_331_0)
			if arg_331_0 == 1 then
				arg_329_0:Play116431077(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = arg_329_1.actors_["1019ui_story"].transform
			local var_332_1 = 0

			if var_332_1 < arg_329_1.time_ and arg_329_1.time_ <= var_332_1 + arg_332_0 then
				arg_329_1.var_.moveOldPos1019ui_story = var_332_0.localPosition
			end

			local var_332_2 = 0.001

			if var_332_1 <= arg_329_1.time_ and arg_329_1.time_ < var_332_1 + var_332_2 then
				local var_332_3 = (arg_329_1.time_ - var_332_1) / var_332_2
				local var_332_4 = Vector3.New(-0.7, -1.08, -5.9)

				var_332_0.localPosition = Vector3.Lerp(arg_329_1.var_.moveOldPos1019ui_story, var_332_4, var_332_3)

				local var_332_5 = manager.ui.mainCamera.transform.position - var_332_0.position

				var_332_0.forward = Vector3.New(var_332_5.x, var_332_5.y, var_332_5.z)

				local var_332_6 = var_332_0.localEulerAngles

				var_332_6.z = 0
				var_332_6.x = 0
				var_332_0.localEulerAngles = var_332_6
			end

			if arg_329_1.time_ >= var_332_1 + var_332_2 and arg_329_1.time_ < var_332_1 + var_332_2 + arg_332_0 then
				var_332_0.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_332_7 = manager.ui.mainCamera.transform.position - var_332_0.position

				var_332_0.forward = Vector3.New(var_332_7.x, var_332_7.y, var_332_7.z)

				local var_332_8 = var_332_0.localEulerAngles

				var_332_8.z = 0
				var_332_8.x = 0
				var_332_0.localEulerAngles = var_332_8
			end

			local var_332_9 = arg_329_1.actors_["1029ui_story"].transform
			local var_332_10 = 0

			if var_332_10 < arg_329_1.time_ and arg_329_1.time_ <= var_332_10 + arg_332_0 then
				arg_329_1.var_.moveOldPos1029ui_story = var_332_9.localPosition
			end

			local var_332_11 = 0.001

			if var_332_10 <= arg_329_1.time_ and arg_329_1.time_ < var_332_10 + var_332_11 then
				local var_332_12 = (arg_329_1.time_ - var_332_10) / var_332_11
				local var_332_13 = Vector3.New(0.7, -1.09, -6.2)

				var_332_9.localPosition = Vector3.Lerp(arg_329_1.var_.moveOldPos1029ui_story, var_332_13, var_332_12)

				local var_332_14 = manager.ui.mainCamera.transform.position - var_332_9.position

				var_332_9.forward = Vector3.New(var_332_14.x, var_332_14.y, var_332_14.z)

				local var_332_15 = var_332_9.localEulerAngles

				var_332_15.z = 0
				var_332_15.x = 0
				var_332_9.localEulerAngles = var_332_15
			end

			if arg_329_1.time_ >= var_332_10 + var_332_11 and arg_329_1.time_ < var_332_10 + var_332_11 + arg_332_0 then
				var_332_9.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_332_16 = manager.ui.mainCamera.transform.position - var_332_9.position

				var_332_9.forward = Vector3.New(var_332_16.x, var_332_16.y, var_332_16.z)

				local var_332_17 = var_332_9.localEulerAngles

				var_332_17.z = 0
				var_332_17.x = 0
				var_332_9.localEulerAngles = var_332_17
			end

			local var_332_18 = 0

			if var_332_18 < arg_329_1.time_ and arg_329_1.time_ <= var_332_18 + arg_332_0 then
				arg_329_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_332_19 = 0
			local var_332_20 = 0.5

			if var_332_19 < arg_329_1.time_ and arg_329_1.time_ <= var_332_19 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, true)

				local var_332_21 = arg_329_1:FormatText(StoryNameCfg[319].name)

				arg_329_1.leftNameTxt_.text = var_332_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_329_1.leftNameTxt_.transform)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1.leftNameTxt_.text)
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_22 = arg_329_1:GetWordFromCfg(116431076)
				local var_332_23 = arg_329_1:FormatText(var_332_22.content)

				arg_329_1.text_.text = var_332_23

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_24 = 20
				local var_332_25 = utf8.len(var_332_23)
				local var_332_26 = var_332_24 <= 0 and var_332_20 or var_332_20 * (var_332_25 / var_332_24)

				if var_332_26 > 0 and var_332_20 < var_332_26 then
					arg_329_1.talkMaxDuration = var_332_26

					if var_332_26 + var_332_19 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_26 + var_332_19
					end
				end

				arg_329_1.text_.text = var_332_23
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431076", "story_v_out_116431.awb") ~= 0 then
					local var_332_27 = manager.audio:GetVoiceLength("story_v_out_116431", "116431076", "story_v_out_116431.awb") / 1000

					if var_332_27 + var_332_19 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_27 + var_332_19
					end

					if var_332_22.prefab_name ~= "" and arg_329_1.actors_[var_332_22.prefab_name] ~= nil then
						local var_332_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_329_1.actors_[var_332_22.prefab_name].transform, "story_v_out_116431", "116431076", "story_v_out_116431.awb")

						arg_329_1:RecordAudio("116431076", var_332_28)
						arg_329_1:RecordAudio("116431076", var_332_28)
					else
						arg_329_1:AudioAction("play", "voice", "story_v_out_116431", "116431076", "story_v_out_116431.awb")
					end

					arg_329_1:RecordHistoryTalkVoice("story_v_out_116431", "116431076", "story_v_out_116431.awb")
				end

				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_29 = math.max(var_332_20, arg_329_1.talkMaxDuration)

			if var_332_19 <= arg_329_1.time_ and arg_329_1.time_ < var_332_19 + var_332_29 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_19) / var_332_29

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_19 + var_332_29 and arg_329_1.time_ < var_332_19 + var_332_29 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play116431077 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 116431077
		arg_333_1.duration_ = 9.233

		local var_333_0 = {
			zh = 5.6,
			ja = 9.233
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
				arg_333_0:Play116431078(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = arg_333_1.actors_["1019ui_story"].transform
			local var_336_1 = 0

			if var_336_1 < arg_333_1.time_ and arg_333_1.time_ <= var_336_1 + arg_336_0 then
				arg_333_1.var_.moveOldPos1019ui_story = var_336_0.localPosition
			end

			local var_336_2 = 0.001

			if var_336_1 <= arg_333_1.time_ and arg_333_1.time_ < var_336_1 + var_336_2 then
				local var_336_3 = (arg_333_1.time_ - var_336_1) / var_336_2
				local var_336_4 = Vector3.New(-0.7, -1.08, -5.9)

				var_336_0.localPosition = Vector3.Lerp(arg_333_1.var_.moveOldPos1019ui_story, var_336_4, var_336_3)

				local var_336_5 = manager.ui.mainCamera.transform.position - var_336_0.position

				var_336_0.forward = Vector3.New(var_336_5.x, var_336_5.y, var_336_5.z)

				local var_336_6 = var_336_0.localEulerAngles

				var_336_6.z = 0
				var_336_6.x = 0
				var_336_0.localEulerAngles = var_336_6
			end

			if arg_333_1.time_ >= var_336_1 + var_336_2 and arg_333_1.time_ < var_336_1 + var_336_2 + arg_336_0 then
				var_336_0.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_336_7 = manager.ui.mainCamera.transform.position - var_336_0.position

				var_336_0.forward = Vector3.New(var_336_7.x, var_336_7.y, var_336_7.z)

				local var_336_8 = var_336_0.localEulerAngles

				var_336_8.z = 0
				var_336_8.x = 0
				var_336_0.localEulerAngles = var_336_8
			end

			local var_336_9 = arg_333_1.actors_["1029ui_story"].transform
			local var_336_10 = 0

			if var_336_10 < arg_333_1.time_ and arg_333_1.time_ <= var_336_10 + arg_336_0 then
				arg_333_1.var_.moveOldPos1029ui_story = var_336_9.localPosition
			end

			local var_336_11 = 0.001

			if var_336_10 <= arg_333_1.time_ and arg_333_1.time_ < var_336_10 + var_336_11 then
				local var_336_12 = (arg_333_1.time_ - var_336_10) / var_336_11
				local var_336_13 = Vector3.New(0.7, -1.09, -6.2)

				var_336_9.localPosition = Vector3.Lerp(arg_333_1.var_.moveOldPos1029ui_story, var_336_13, var_336_12)

				local var_336_14 = manager.ui.mainCamera.transform.position - var_336_9.position

				var_336_9.forward = Vector3.New(var_336_14.x, var_336_14.y, var_336_14.z)

				local var_336_15 = var_336_9.localEulerAngles

				var_336_15.z = 0
				var_336_15.x = 0
				var_336_9.localEulerAngles = var_336_15
			end

			if arg_333_1.time_ >= var_336_10 + var_336_11 and arg_333_1.time_ < var_336_10 + var_336_11 + arg_336_0 then
				var_336_9.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_336_16 = manager.ui.mainCamera.transform.position - var_336_9.position

				var_336_9.forward = Vector3.New(var_336_16.x, var_336_16.y, var_336_16.z)

				local var_336_17 = var_336_9.localEulerAngles

				var_336_17.z = 0
				var_336_17.x = 0
				var_336_9.localEulerAngles = var_336_17
			end

			local var_336_18 = 0

			if var_336_18 < arg_333_1.time_ and arg_333_1.time_ <= var_336_18 + arg_336_0 then
				arg_333_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_336_19 = 0
			local var_336_20 = 0.725

			if var_336_19 < arg_333_1.time_ and arg_333_1.time_ <= var_336_19 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, true)

				local var_336_21 = arg_333_1:FormatText(StoryNameCfg[319].name)

				arg_333_1.leftNameTxt_.text = var_336_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_333_1.leftNameTxt_.transform)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1.leftNameTxt_.text)
				SetActive(arg_333_1.iconTrs_.gameObject, false)
				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_22 = arg_333_1:GetWordFromCfg(116431077)
				local var_336_23 = arg_333_1:FormatText(var_336_22.content)

				arg_333_1.text_.text = var_336_23

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_24 = 29
				local var_336_25 = utf8.len(var_336_23)
				local var_336_26 = var_336_24 <= 0 and var_336_20 or var_336_20 * (var_336_25 / var_336_24)

				if var_336_26 > 0 and var_336_20 < var_336_26 then
					arg_333_1.talkMaxDuration = var_336_26

					if var_336_26 + var_336_19 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_26 + var_336_19
					end
				end

				arg_333_1.text_.text = var_336_23
				arg_333_1.typewritter.percent = 0

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431077", "story_v_out_116431.awb") ~= 0 then
					local var_336_27 = manager.audio:GetVoiceLength("story_v_out_116431", "116431077", "story_v_out_116431.awb") / 1000

					if var_336_27 + var_336_19 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_27 + var_336_19
					end

					if var_336_22.prefab_name ~= "" and arg_333_1.actors_[var_336_22.prefab_name] ~= nil then
						local var_336_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_333_1.actors_[var_336_22.prefab_name].transform, "story_v_out_116431", "116431077", "story_v_out_116431.awb")

						arg_333_1:RecordAudio("116431077", var_336_28)
						arg_333_1:RecordAudio("116431077", var_336_28)
					else
						arg_333_1:AudioAction("play", "voice", "story_v_out_116431", "116431077", "story_v_out_116431.awb")
					end

					arg_333_1:RecordHistoryTalkVoice("story_v_out_116431", "116431077", "story_v_out_116431.awb")
				end

				arg_333_1:RecordContent(arg_333_1.text_.text)
			end

			local var_336_29 = math.max(var_336_20, arg_333_1.talkMaxDuration)

			if var_336_19 <= arg_333_1.time_ and arg_333_1.time_ < var_336_19 + var_336_29 then
				arg_333_1.typewritter.percent = (arg_333_1.time_ - var_336_19) / var_336_29

				arg_333_1.typewritter:SetDirty()
			end

			if arg_333_1.time_ >= var_336_19 + var_336_29 and arg_333_1.time_ < var_336_19 + var_336_29 + arg_336_0 then
				arg_333_1.typewritter.percent = 1

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(true)
			end
		end
	end,
	Play116431078 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 116431078
		arg_337_1.duration_ = 5.866

		local var_337_0 = {
			zh = 5.866,
			ja = 5.2
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
				arg_337_0:Play116431079(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = arg_337_1.actors_["1019ui_story"].transform
			local var_340_1 = 0

			if var_340_1 < arg_337_1.time_ and arg_337_1.time_ <= var_340_1 + arg_340_0 then
				arg_337_1.var_.moveOldPos1019ui_story = var_340_0.localPosition
			end

			local var_340_2 = 0.001

			if var_340_1 <= arg_337_1.time_ and arg_337_1.time_ < var_340_1 + var_340_2 then
				local var_340_3 = (arg_337_1.time_ - var_340_1) / var_340_2
				local var_340_4 = Vector3.New(-0.7, -1.08, -5.9)

				var_340_0.localPosition = Vector3.Lerp(arg_337_1.var_.moveOldPos1019ui_story, var_340_4, var_340_3)

				local var_340_5 = manager.ui.mainCamera.transform.position - var_340_0.position

				var_340_0.forward = Vector3.New(var_340_5.x, var_340_5.y, var_340_5.z)

				local var_340_6 = var_340_0.localEulerAngles

				var_340_6.z = 0
				var_340_6.x = 0
				var_340_0.localEulerAngles = var_340_6
			end

			if arg_337_1.time_ >= var_340_1 + var_340_2 and arg_337_1.time_ < var_340_1 + var_340_2 + arg_340_0 then
				var_340_0.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_340_7 = manager.ui.mainCamera.transform.position - var_340_0.position

				var_340_0.forward = Vector3.New(var_340_7.x, var_340_7.y, var_340_7.z)

				local var_340_8 = var_340_0.localEulerAngles

				var_340_8.z = 0
				var_340_8.x = 0
				var_340_0.localEulerAngles = var_340_8
			end

			local var_340_9 = arg_337_1.actors_["1019ui_story"]
			local var_340_10 = 0

			if var_340_10 < arg_337_1.time_ and arg_337_1.time_ <= var_340_10 + arg_340_0 and arg_337_1.var_.characterEffect1019ui_story == nil then
				arg_337_1.var_.characterEffect1019ui_story = var_340_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_340_11 = 0.2

			if var_340_10 <= arg_337_1.time_ and arg_337_1.time_ < var_340_10 + var_340_11 then
				local var_340_12 = (arg_337_1.time_ - var_340_10) / var_340_11

				if arg_337_1.var_.characterEffect1019ui_story then
					arg_337_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_337_1.time_ >= var_340_10 + var_340_11 and arg_337_1.time_ < var_340_10 + var_340_11 + arg_340_0 and arg_337_1.var_.characterEffect1019ui_story then
				arg_337_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_340_13 = arg_337_1.actors_["1029ui_story"]
			local var_340_14 = 0

			if var_340_14 < arg_337_1.time_ and arg_337_1.time_ <= var_340_14 + arg_340_0 and arg_337_1.var_.characterEffect1029ui_story == nil then
				arg_337_1.var_.characterEffect1029ui_story = var_340_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_340_15 = 0.2

			if var_340_14 <= arg_337_1.time_ and arg_337_1.time_ < var_340_14 + var_340_15 then
				local var_340_16 = (arg_337_1.time_ - var_340_14) / var_340_15

				if arg_337_1.var_.characterEffect1029ui_story then
					local var_340_17 = Mathf.Lerp(0, 0.5, var_340_16)

					arg_337_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_337_1.var_.characterEffect1029ui_story.fillRatio = var_340_17
				end
			end

			if arg_337_1.time_ >= var_340_14 + var_340_15 and arg_337_1.time_ < var_340_14 + var_340_15 + arg_340_0 and arg_337_1.var_.characterEffect1029ui_story then
				local var_340_18 = 0.5

				arg_337_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_337_1.var_.characterEffect1029ui_story.fillRatio = var_340_18
			end

			local var_340_19 = 0

			if var_340_19 < arg_337_1.time_ and arg_337_1.time_ <= var_340_19 + arg_340_0 then
				arg_337_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action2_2")
			end

			local var_340_20 = 0

			if var_340_20 < arg_337_1.time_ and arg_337_1.time_ <= var_340_20 + arg_340_0 then
				arg_337_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_340_21 = 0
			local var_340_22 = 0.725

			if var_340_21 < arg_337_1.time_ and arg_337_1.time_ <= var_340_21 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, true)

				local var_340_23 = arg_337_1:FormatText(StoryNameCfg[47].name)

				arg_337_1.leftNameTxt_.text = var_340_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_337_1.leftNameTxt_.transform)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1.leftNameTxt_.text)
				SetActive(arg_337_1.iconTrs_.gameObject, false)
				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_24 = arg_337_1:GetWordFromCfg(116431078)
				local var_340_25 = arg_337_1:FormatText(var_340_24.content)

				arg_337_1.text_.text = var_340_25

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_26 = 29
				local var_340_27 = utf8.len(var_340_25)
				local var_340_28 = var_340_26 <= 0 and var_340_22 or var_340_22 * (var_340_27 / var_340_26)

				if var_340_28 > 0 and var_340_22 < var_340_28 then
					arg_337_1.talkMaxDuration = var_340_28

					if var_340_28 + var_340_21 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_28 + var_340_21
					end
				end

				arg_337_1.text_.text = var_340_25
				arg_337_1.typewritter.percent = 0

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431078", "story_v_out_116431.awb") ~= 0 then
					local var_340_29 = manager.audio:GetVoiceLength("story_v_out_116431", "116431078", "story_v_out_116431.awb") / 1000

					if var_340_29 + var_340_21 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_29 + var_340_21
					end

					if var_340_24.prefab_name ~= "" and arg_337_1.actors_[var_340_24.prefab_name] ~= nil then
						local var_340_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_337_1.actors_[var_340_24.prefab_name].transform, "story_v_out_116431", "116431078", "story_v_out_116431.awb")

						arg_337_1:RecordAudio("116431078", var_340_30)
						arg_337_1:RecordAudio("116431078", var_340_30)
					else
						arg_337_1:AudioAction("play", "voice", "story_v_out_116431", "116431078", "story_v_out_116431.awb")
					end

					arg_337_1:RecordHistoryTalkVoice("story_v_out_116431", "116431078", "story_v_out_116431.awb")
				end

				arg_337_1:RecordContent(arg_337_1.text_.text)
			end

			local var_340_31 = math.max(var_340_22, arg_337_1.talkMaxDuration)

			if var_340_21 <= arg_337_1.time_ and arg_337_1.time_ < var_340_21 + var_340_31 then
				arg_337_1.typewritter.percent = (arg_337_1.time_ - var_340_21) / var_340_31

				arg_337_1.typewritter:SetDirty()
			end

			if arg_337_1.time_ >= var_340_21 + var_340_31 and arg_337_1.time_ < var_340_21 + var_340_31 + arg_340_0 then
				arg_337_1.typewritter.percent = 1

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(true)
			end
		end
	end,
	Play116431079 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 116431079
		arg_341_1.duration_ = 6.933

		local var_341_0 = {
			zh = 6.933,
			ja = 6.6
		}
		local var_341_1 = manager.audio:GetLocalizationFlag()

		if var_341_0[var_341_1] ~= nil then
			arg_341_1.duration_ = var_341_0[var_341_1]
		end

		SetActive(arg_341_1.tipsGo_, false)

		function arg_341_1.onSingleLineFinish_()
			arg_341_1.onSingleLineUpdate_ = nil
			arg_341_1.onSingleLineFinish_ = nil
			arg_341_1.state_ = "waiting"
		end

		function arg_341_1.playNext_(arg_343_0)
			if arg_343_0 == 1 then
				arg_341_0:Play116431080(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = arg_341_1.actors_["1019ui_story"].transform
			local var_344_1 = 0

			if var_344_1 < arg_341_1.time_ and arg_341_1.time_ <= var_344_1 + arg_344_0 then
				arg_341_1.var_.moveOldPos1019ui_story = var_344_0.localPosition
			end

			local var_344_2 = 0.001

			if var_344_1 <= arg_341_1.time_ and arg_341_1.time_ < var_344_1 + var_344_2 then
				local var_344_3 = (arg_341_1.time_ - var_344_1) / var_344_2
				local var_344_4 = Vector3.New(-0.7, -1.08, -5.9)

				var_344_0.localPosition = Vector3.Lerp(arg_341_1.var_.moveOldPos1019ui_story, var_344_4, var_344_3)

				local var_344_5 = manager.ui.mainCamera.transform.position - var_344_0.position

				var_344_0.forward = Vector3.New(var_344_5.x, var_344_5.y, var_344_5.z)

				local var_344_6 = var_344_0.localEulerAngles

				var_344_6.z = 0
				var_344_6.x = 0
				var_344_0.localEulerAngles = var_344_6
			end

			if arg_341_1.time_ >= var_344_1 + var_344_2 and arg_341_1.time_ < var_344_1 + var_344_2 + arg_344_0 then
				var_344_0.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_344_7 = manager.ui.mainCamera.transform.position - var_344_0.position

				var_344_0.forward = Vector3.New(var_344_7.x, var_344_7.y, var_344_7.z)

				local var_344_8 = var_344_0.localEulerAngles

				var_344_8.z = 0
				var_344_8.x = 0
				var_344_0.localEulerAngles = var_344_8
			end

			local var_344_9 = arg_341_1.actors_["1029ui_story"].transform
			local var_344_10 = 0

			if var_344_10 < arg_341_1.time_ and arg_341_1.time_ <= var_344_10 + arg_344_0 then
				arg_341_1.var_.moveOldPos1029ui_story = var_344_9.localPosition
			end

			local var_344_11 = 0.001

			if var_344_10 <= arg_341_1.time_ and arg_341_1.time_ < var_344_10 + var_344_11 then
				local var_344_12 = (arg_341_1.time_ - var_344_10) / var_344_11
				local var_344_13 = Vector3.New(0.7, -1.09, -6.2)

				var_344_9.localPosition = Vector3.Lerp(arg_341_1.var_.moveOldPos1029ui_story, var_344_13, var_344_12)

				local var_344_14 = manager.ui.mainCamera.transform.position - var_344_9.position

				var_344_9.forward = Vector3.New(var_344_14.x, var_344_14.y, var_344_14.z)

				local var_344_15 = var_344_9.localEulerAngles

				var_344_15.z = 0
				var_344_15.x = 0
				var_344_9.localEulerAngles = var_344_15
			end

			if arg_341_1.time_ >= var_344_10 + var_344_11 and arg_341_1.time_ < var_344_10 + var_344_11 + arg_344_0 then
				var_344_9.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_344_16 = manager.ui.mainCamera.transform.position - var_344_9.position

				var_344_9.forward = Vector3.New(var_344_16.x, var_344_16.y, var_344_16.z)

				local var_344_17 = var_344_9.localEulerAngles

				var_344_17.z = 0
				var_344_17.x = 0
				var_344_9.localEulerAngles = var_344_17
			end

			local var_344_18 = arg_341_1.actors_["1019ui_story"]
			local var_344_19 = 0

			if var_344_19 < arg_341_1.time_ and arg_341_1.time_ <= var_344_19 + arg_344_0 and arg_341_1.var_.characterEffect1019ui_story == nil then
				arg_341_1.var_.characterEffect1019ui_story = var_344_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_344_20 = 0.2

			if var_344_19 <= arg_341_1.time_ and arg_341_1.time_ < var_344_19 + var_344_20 then
				local var_344_21 = (arg_341_1.time_ - var_344_19) / var_344_20

				if arg_341_1.var_.characterEffect1019ui_story then
					local var_344_22 = Mathf.Lerp(0, 0.5, var_344_21)

					arg_341_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_341_1.var_.characterEffect1019ui_story.fillRatio = var_344_22
				end
			end

			if arg_341_1.time_ >= var_344_19 + var_344_20 and arg_341_1.time_ < var_344_19 + var_344_20 + arg_344_0 and arg_341_1.var_.characterEffect1019ui_story then
				local var_344_23 = 0.5

				arg_341_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_341_1.var_.characterEffect1019ui_story.fillRatio = var_344_23
			end

			local var_344_24 = arg_341_1.actors_["1029ui_story"]
			local var_344_25 = 0

			if var_344_25 < arg_341_1.time_ and arg_341_1.time_ <= var_344_25 + arg_344_0 and arg_341_1.var_.characterEffect1029ui_story == nil then
				arg_341_1.var_.characterEffect1029ui_story = var_344_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_344_26 = 0.2

			if var_344_25 <= arg_341_1.time_ and arg_341_1.time_ < var_344_25 + var_344_26 then
				local var_344_27 = (arg_341_1.time_ - var_344_25) / var_344_26

				if arg_341_1.var_.characterEffect1029ui_story then
					arg_341_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_341_1.time_ >= var_344_25 + var_344_26 and arg_341_1.time_ < var_344_25 + var_344_26 + arg_344_0 and arg_341_1.var_.characterEffect1029ui_story then
				arg_341_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_344_28 = 0

			if var_344_28 < arg_341_1.time_ and arg_341_1.time_ <= var_344_28 + arg_344_0 then
				arg_341_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_344_29 = 0
			local var_344_30 = 0.775

			if var_344_29 < arg_341_1.time_ and arg_341_1.time_ <= var_344_29 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, true)

				local var_344_31 = arg_341_1:FormatText(StoryNameCfg[319].name)

				arg_341_1.leftNameTxt_.text = var_344_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_341_1.leftNameTxt_.transform)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1.leftNameTxt_.text)
				SetActive(arg_341_1.iconTrs_.gameObject, false)
				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_32 = arg_341_1:GetWordFromCfg(116431079)
				local var_344_33 = arg_341_1:FormatText(var_344_32.content)

				arg_341_1.text_.text = var_344_33

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_34 = 31
				local var_344_35 = utf8.len(var_344_33)
				local var_344_36 = var_344_34 <= 0 and var_344_30 or var_344_30 * (var_344_35 / var_344_34)

				if var_344_36 > 0 and var_344_30 < var_344_36 then
					arg_341_1.talkMaxDuration = var_344_36

					if var_344_36 + var_344_29 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_36 + var_344_29
					end
				end

				arg_341_1.text_.text = var_344_33
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431079", "story_v_out_116431.awb") ~= 0 then
					local var_344_37 = manager.audio:GetVoiceLength("story_v_out_116431", "116431079", "story_v_out_116431.awb") / 1000

					if var_344_37 + var_344_29 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_37 + var_344_29
					end

					if var_344_32.prefab_name ~= "" and arg_341_1.actors_[var_344_32.prefab_name] ~= nil then
						local var_344_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_341_1.actors_[var_344_32.prefab_name].transform, "story_v_out_116431", "116431079", "story_v_out_116431.awb")

						arg_341_1:RecordAudio("116431079", var_344_38)
						arg_341_1:RecordAudio("116431079", var_344_38)
					else
						arg_341_1:AudioAction("play", "voice", "story_v_out_116431", "116431079", "story_v_out_116431.awb")
					end

					arg_341_1:RecordHistoryTalkVoice("story_v_out_116431", "116431079", "story_v_out_116431.awb")
				end

				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_39 = math.max(var_344_30, arg_341_1.talkMaxDuration)

			if var_344_29 <= arg_341_1.time_ and arg_341_1.time_ < var_344_29 + var_344_39 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_29) / var_344_39

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_29 + var_344_39 and arg_341_1.time_ < var_344_29 + var_344_39 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play116431080 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 116431080
		arg_345_1.duration_ = 8.8

		local var_345_0 = {
			zh = 7.933,
			ja = 8.8
		}
		local var_345_1 = manager.audio:GetLocalizationFlag()

		if var_345_0[var_345_1] ~= nil then
			arg_345_1.duration_ = var_345_0[var_345_1]
		end

		SetActive(arg_345_1.tipsGo_, false)

		function arg_345_1.onSingleLineFinish_()
			arg_345_1.onSingleLineUpdate_ = nil
			arg_345_1.onSingleLineFinish_ = nil
			arg_345_1.state_ = "waiting"
		end

		function arg_345_1.playNext_(arg_347_0)
			if arg_347_0 == 1 then
				arg_345_0:Play116431081(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = arg_345_1.actors_["1019ui_story"].transform
			local var_348_1 = 0

			if var_348_1 < arg_345_1.time_ and arg_345_1.time_ <= var_348_1 + arg_348_0 then
				arg_345_1.var_.moveOldPos1019ui_story = var_348_0.localPosition
			end

			local var_348_2 = 0.001

			if var_348_1 <= arg_345_1.time_ and arg_345_1.time_ < var_348_1 + var_348_2 then
				local var_348_3 = (arg_345_1.time_ - var_348_1) / var_348_2
				local var_348_4 = Vector3.New(-0.7, -1.08, -5.9)

				var_348_0.localPosition = Vector3.Lerp(arg_345_1.var_.moveOldPos1019ui_story, var_348_4, var_348_3)

				local var_348_5 = manager.ui.mainCamera.transform.position - var_348_0.position

				var_348_0.forward = Vector3.New(var_348_5.x, var_348_5.y, var_348_5.z)

				local var_348_6 = var_348_0.localEulerAngles

				var_348_6.z = 0
				var_348_6.x = 0
				var_348_0.localEulerAngles = var_348_6
			end

			if arg_345_1.time_ >= var_348_1 + var_348_2 and arg_345_1.time_ < var_348_1 + var_348_2 + arg_348_0 then
				var_348_0.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_348_7 = manager.ui.mainCamera.transform.position - var_348_0.position

				var_348_0.forward = Vector3.New(var_348_7.x, var_348_7.y, var_348_7.z)

				local var_348_8 = var_348_0.localEulerAngles

				var_348_8.z = 0
				var_348_8.x = 0
				var_348_0.localEulerAngles = var_348_8
			end

			local var_348_9 = arg_345_1.actors_["1019ui_story"]
			local var_348_10 = 0

			if var_348_10 < arg_345_1.time_ and arg_345_1.time_ <= var_348_10 + arg_348_0 and arg_345_1.var_.characterEffect1019ui_story == nil then
				arg_345_1.var_.characterEffect1019ui_story = var_348_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_348_11 = 0.2

			if var_348_10 <= arg_345_1.time_ and arg_345_1.time_ < var_348_10 + var_348_11 then
				local var_348_12 = (arg_345_1.time_ - var_348_10) / var_348_11

				if arg_345_1.var_.characterEffect1019ui_story then
					arg_345_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_345_1.time_ >= var_348_10 + var_348_11 and arg_345_1.time_ < var_348_10 + var_348_11 + arg_348_0 and arg_345_1.var_.characterEffect1019ui_story then
				arg_345_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_348_13 = arg_345_1.actors_["1029ui_story"]
			local var_348_14 = 0

			if var_348_14 < arg_345_1.time_ and arg_345_1.time_ <= var_348_14 + arg_348_0 and arg_345_1.var_.characterEffect1029ui_story == nil then
				arg_345_1.var_.characterEffect1029ui_story = var_348_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_348_15 = 0.2

			if var_348_14 <= arg_345_1.time_ and arg_345_1.time_ < var_348_14 + var_348_15 then
				local var_348_16 = (arg_345_1.time_ - var_348_14) / var_348_15

				if arg_345_1.var_.characterEffect1029ui_story then
					local var_348_17 = Mathf.Lerp(0, 0.5, var_348_16)

					arg_345_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_345_1.var_.characterEffect1029ui_story.fillRatio = var_348_17
				end
			end

			if arg_345_1.time_ >= var_348_14 + var_348_15 and arg_345_1.time_ < var_348_14 + var_348_15 + arg_348_0 and arg_345_1.var_.characterEffect1029ui_story then
				local var_348_18 = 0.5

				arg_345_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_345_1.var_.characterEffect1029ui_story.fillRatio = var_348_18
			end

			local var_348_19 = 0

			if var_348_19 < arg_345_1.time_ and arg_345_1.time_ <= var_348_19 + arg_348_0 then
				arg_345_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action1_1")
			end

			local var_348_20 = 0

			if var_348_20 < arg_345_1.time_ and arg_345_1.time_ <= var_348_20 + arg_348_0 then
				arg_345_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_348_21 = 0
			local var_348_22 = 1.05

			if var_348_21 < arg_345_1.time_ and arg_345_1.time_ <= var_348_21 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0
				arg_345_1.dialogCg_.alpha = 1

				arg_345_1.dialog_:SetActive(true)
				SetActive(arg_345_1.leftNameGo_, true)

				local var_348_23 = arg_345_1:FormatText(StoryNameCfg[47].name)

				arg_345_1.leftNameTxt_.text = var_348_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_345_1.leftNameTxt_.transform)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1.leftNameTxt_.text)
				SetActive(arg_345_1.iconTrs_.gameObject, false)
				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_24 = arg_345_1:GetWordFromCfg(116431080)
				local var_348_25 = arg_345_1:FormatText(var_348_24.content)

				arg_345_1.text_.text = var_348_25

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_26 = 42
				local var_348_27 = utf8.len(var_348_25)
				local var_348_28 = var_348_26 <= 0 and var_348_22 or var_348_22 * (var_348_27 / var_348_26)

				if var_348_28 > 0 and var_348_22 < var_348_28 then
					arg_345_1.talkMaxDuration = var_348_28

					if var_348_28 + var_348_21 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_28 + var_348_21
					end
				end

				arg_345_1.text_.text = var_348_25
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431080", "story_v_out_116431.awb") ~= 0 then
					local var_348_29 = manager.audio:GetVoiceLength("story_v_out_116431", "116431080", "story_v_out_116431.awb") / 1000

					if var_348_29 + var_348_21 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_29 + var_348_21
					end

					if var_348_24.prefab_name ~= "" and arg_345_1.actors_[var_348_24.prefab_name] ~= nil then
						local var_348_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_345_1.actors_[var_348_24.prefab_name].transform, "story_v_out_116431", "116431080", "story_v_out_116431.awb")

						arg_345_1:RecordAudio("116431080", var_348_30)
						arg_345_1:RecordAudio("116431080", var_348_30)
					else
						arg_345_1:AudioAction("play", "voice", "story_v_out_116431", "116431080", "story_v_out_116431.awb")
					end

					arg_345_1:RecordHistoryTalkVoice("story_v_out_116431", "116431080", "story_v_out_116431.awb")
				end

				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_31 = math.max(var_348_22, arg_345_1.talkMaxDuration)

			if var_348_21 <= arg_345_1.time_ and arg_345_1.time_ < var_348_21 + var_348_31 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_21) / var_348_31

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_21 + var_348_31 and arg_345_1.time_ < var_348_21 + var_348_31 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play116431081 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 116431081
		arg_349_1.duration_ = 7.533

		local var_349_0 = {
			zh = 7.533,
			ja = 7.133
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
				arg_349_0:Play116431082(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = arg_349_1.actors_["1019ui_story"].transform
			local var_352_1 = 0

			if var_352_1 < arg_349_1.time_ and arg_349_1.time_ <= var_352_1 + arg_352_0 then
				arg_349_1.var_.moveOldPos1019ui_story = var_352_0.localPosition
			end

			local var_352_2 = 0.001

			if var_352_1 <= arg_349_1.time_ and arg_349_1.time_ < var_352_1 + var_352_2 then
				local var_352_3 = (arg_349_1.time_ - var_352_1) / var_352_2
				local var_352_4 = Vector3.New(-0.7, -1.08, -5.9)

				var_352_0.localPosition = Vector3.Lerp(arg_349_1.var_.moveOldPos1019ui_story, var_352_4, var_352_3)

				local var_352_5 = manager.ui.mainCamera.transform.position - var_352_0.position

				var_352_0.forward = Vector3.New(var_352_5.x, var_352_5.y, var_352_5.z)

				local var_352_6 = var_352_0.localEulerAngles

				var_352_6.z = 0
				var_352_6.x = 0
				var_352_0.localEulerAngles = var_352_6
			end

			if arg_349_1.time_ >= var_352_1 + var_352_2 and arg_349_1.time_ < var_352_1 + var_352_2 + arg_352_0 then
				var_352_0.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_352_7 = manager.ui.mainCamera.transform.position - var_352_0.position

				var_352_0.forward = Vector3.New(var_352_7.x, var_352_7.y, var_352_7.z)

				local var_352_8 = var_352_0.localEulerAngles

				var_352_8.z = 0
				var_352_8.x = 0
				var_352_0.localEulerAngles = var_352_8
			end

			local var_352_9 = arg_349_1.actors_["1029ui_story"].transform
			local var_352_10 = 0

			if var_352_10 < arg_349_1.time_ and arg_349_1.time_ <= var_352_10 + arg_352_0 then
				arg_349_1.var_.moveOldPos1029ui_story = var_352_9.localPosition
			end

			local var_352_11 = 0.001

			if var_352_10 <= arg_349_1.time_ and arg_349_1.time_ < var_352_10 + var_352_11 then
				local var_352_12 = (arg_349_1.time_ - var_352_10) / var_352_11
				local var_352_13 = Vector3.New(0.7, -1.09, -6.2)

				var_352_9.localPosition = Vector3.Lerp(arg_349_1.var_.moveOldPos1029ui_story, var_352_13, var_352_12)

				local var_352_14 = manager.ui.mainCamera.transform.position - var_352_9.position

				var_352_9.forward = Vector3.New(var_352_14.x, var_352_14.y, var_352_14.z)

				local var_352_15 = var_352_9.localEulerAngles

				var_352_15.z = 0
				var_352_15.x = 0
				var_352_9.localEulerAngles = var_352_15
			end

			if arg_349_1.time_ >= var_352_10 + var_352_11 and arg_349_1.time_ < var_352_10 + var_352_11 + arg_352_0 then
				var_352_9.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_352_16 = manager.ui.mainCamera.transform.position - var_352_9.position

				var_352_9.forward = Vector3.New(var_352_16.x, var_352_16.y, var_352_16.z)

				local var_352_17 = var_352_9.localEulerAngles

				var_352_17.z = 0
				var_352_17.x = 0
				var_352_9.localEulerAngles = var_352_17
			end

			local var_352_18 = arg_349_1.actors_["1019ui_story"]
			local var_352_19 = 0

			if var_352_19 < arg_349_1.time_ and arg_349_1.time_ <= var_352_19 + arg_352_0 and arg_349_1.var_.characterEffect1019ui_story == nil then
				arg_349_1.var_.characterEffect1019ui_story = var_352_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_352_20 = 0.2

			if var_352_19 <= arg_349_1.time_ and arg_349_1.time_ < var_352_19 + var_352_20 then
				local var_352_21 = (arg_349_1.time_ - var_352_19) / var_352_20

				if arg_349_1.var_.characterEffect1019ui_story then
					local var_352_22 = Mathf.Lerp(0, 0.5, var_352_21)

					arg_349_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_349_1.var_.characterEffect1019ui_story.fillRatio = var_352_22
				end
			end

			if arg_349_1.time_ >= var_352_19 + var_352_20 and arg_349_1.time_ < var_352_19 + var_352_20 + arg_352_0 and arg_349_1.var_.characterEffect1019ui_story then
				local var_352_23 = 0.5

				arg_349_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_349_1.var_.characterEffect1019ui_story.fillRatio = var_352_23
			end

			local var_352_24 = arg_349_1.actors_["1029ui_story"]
			local var_352_25 = 0

			if var_352_25 < arg_349_1.time_ and arg_349_1.time_ <= var_352_25 + arg_352_0 and arg_349_1.var_.characterEffect1029ui_story == nil then
				arg_349_1.var_.characterEffect1029ui_story = var_352_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_352_26 = 0.2

			if var_352_25 <= arg_349_1.time_ and arg_349_1.time_ < var_352_25 + var_352_26 then
				local var_352_27 = (arg_349_1.time_ - var_352_25) / var_352_26

				if arg_349_1.var_.characterEffect1029ui_story then
					arg_349_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_349_1.time_ >= var_352_25 + var_352_26 and arg_349_1.time_ < var_352_25 + var_352_26 + arg_352_0 and arg_349_1.var_.characterEffect1029ui_story then
				arg_349_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_352_28 = 0

			if var_352_28 < arg_349_1.time_ and arg_349_1.time_ <= var_352_28 + arg_352_0 then
				arg_349_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_352_29 = 0
			local var_352_30 = 0.775

			if var_352_29 < arg_349_1.time_ and arg_349_1.time_ <= var_352_29 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0
				arg_349_1.dialogCg_.alpha = 1

				arg_349_1.dialog_:SetActive(true)
				SetActive(arg_349_1.leftNameGo_, true)

				local var_352_31 = arg_349_1:FormatText(StoryNameCfg[319].name)

				arg_349_1.leftNameTxt_.text = var_352_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_349_1.leftNameTxt_.transform)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1.leftNameTxt_.text)
				SetActive(arg_349_1.iconTrs_.gameObject, false)
				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_32 = arg_349_1:GetWordFromCfg(116431081)
				local var_352_33 = arg_349_1:FormatText(var_352_32.content)

				arg_349_1.text_.text = var_352_33

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_34 = 31
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

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431081", "story_v_out_116431.awb") ~= 0 then
					local var_352_37 = manager.audio:GetVoiceLength("story_v_out_116431", "116431081", "story_v_out_116431.awb") / 1000

					if var_352_37 + var_352_29 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_37 + var_352_29
					end

					if var_352_32.prefab_name ~= "" and arg_349_1.actors_[var_352_32.prefab_name] ~= nil then
						local var_352_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_349_1.actors_[var_352_32.prefab_name].transform, "story_v_out_116431", "116431081", "story_v_out_116431.awb")

						arg_349_1:RecordAudio("116431081", var_352_38)
						arg_349_1:RecordAudio("116431081", var_352_38)
					else
						arg_349_1:AudioAction("play", "voice", "story_v_out_116431", "116431081", "story_v_out_116431.awb")
					end

					arg_349_1:RecordHistoryTalkVoice("story_v_out_116431", "116431081", "story_v_out_116431.awb")
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
	Play116431082 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 116431082
		arg_353_1.duration_ = 1.999999999999

		SetActive(arg_353_1.tipsGo_, false)

		function arg_353_1.onSingleLineFinish_()
			arg_353_1.onSingleLineUpdate_ = nil
			arg_353_1.onSingleLineFinish_ = nil
			arg_353_1.state_ = "waiting"
		end

		function arg_353_1.playNext_(arg_355_0)
			if arg_355_0 == 1 then
				arg_353_0:Play116431083(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = arg_353_1.actors_["1019ui_story"].transform
			local var_356_1 = 0

			if var_356_1 < arg_353_1.time_ and arg_353_1.time_ <= var_356_1 + arg_356_0 then
				arg_353_1.var_.moveOldPos1019ui_story = var_356_0.localPosition
			end

			local var_356_2 = 0.001

			if var_356_1 <= arg_353_1.time_ and arg_353_1.time_ < var_356_1 + var_356_2 then
				local var_356_3 = (arg_353_1.time_ - var_356_1) / var_356_2
				local var_356_4 = Vector3.New(-0.7, -1.08, -5.9)

				var_356_0.localPosition = Vector3.Lerp(arg_353_1.var_.moveOldPos1019ui_story, var_356_4, var_356_3)

				local var_356_5 = manager.ui.mainCamera.transform.position - var_356_0.position

				var_356_0.forward = Vector3.New(var_356_5.x, var_356_5.y, var_356_5.z)

				local var_356_6 = var_356_0.localEulerAngles

				var_356_6.z = 0
				var_356_6.x = 0
				var_356_0.localEulerAngles = var_356_6
			end

			if arg_353_1.time_ >= var_356_1 + var_356_2 and arg_353_1.time_ < var_356_1 + var_356_2 + arg_356_0 then
				var_356_0.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_356_7 = manager.ui.mainCamera.transform.position - var_356_0.position

				var_356_0.forward = Vector3.New(var_356_7.x, var_356_7.y, var_356_7.z)

				local var_356_8 = var_356_0.localEulerAngles

				var_356_8.z = 0
				var_356_8.x = 0
				var_356_0.localEulerAngles = var_356_8
			end

			local var_356_9 = arg_353_1.actors_["1019ui_story"]
			local var_356_10 = 0

			if var_356_10 < arg_353_1.time_ and arg_353_1.time_ <= var_356_10 + arg_356_0 and arg_353_1.var_.characterEffect1019ui_story == nil then
				arg_353_1.var_.characterEffect1019ui_story = var_356_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_356_11 = 0.2

			if var_356_10 <= arg_353_1.time_ and arg_353_1.time_ < var_356_10 + var_356_11 then
				local var_356_12 = (arg_353_1.time_ - var_356_10) / var_356_11

				if arg_353_1.var_.characterEffect1019ui_story then
					arg_353_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_353_1.time_ >= var_356_10 + var_356_11 and arg_353_1.time_ < var_356_10 + var_356_11 + arg_356_0 and arg_353_1.var_.characterEffect1019ui_story then
				arg_353_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_356_13 = arg_353_1.actors_["1029ui_story"]
			local var_356_14 = 0

			if var_356_14 < arg_353_1.time_ and arg_353_1.time_ <= var_356_14 + arg_356_0 and arg_353_1.var_.characterEffect1029ui_story == nil then
				arg_353_1.var_.characterEffect1029ui_story = var_356_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_356_15 = 0.2

			if var_356_14 <= arg_353_1.time_ and arg_353_1.time_ < var_356_14 + var_356_15 then
				local var_356_16 = (arg_353_1.time_ - var_356_14) / var_356_15

				if arg_353_1.var_.characterEffect1029ui_story then
					local var_356_17 = Mathf.Lerp(0, 0.5, var_356_16)

					arg_353_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_353_1.var_.characterEffect1029ui_story.fillRatio = var_356_17
				end
			end

			if arg_353_1.time_ >= var_356_14 + var_356_15 and arg_353_1.time_ < var_356_14 + var_356_15 + arg_356_0 and arg_353_1.var_.characterEffect1029ui_story then
				local var_356_18 = 0.5

				arg_353_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_353_1.var_.characterEffect1029ui_story.fillRatio = var_356_18
			end

			local var_356_19 = 0

			if var_356_19 < arg_353_1.time_ and arg_353_1.time_ <= var_356_19 + arg_356_0 then
				arg_353_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_356_20 = 0
			local var_356_21 = 0.125

			if var_356_20 < arg_353_1.time_ and arg_353_1.time_ <= var_356_20 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0
				arg_353_1.dialogCg_.alpha = 1

				arg_353_1.dialog_:SetActive(true)
				SetActive(arg_353_1.leftNameGo_, true)

				local var_356_22 = arg_353_1:FormatText(StoryNameCfg[47].name)

				arg_353_1.leftNameTxt_.text = var_356_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_353_1.leftNameTxt_.transform)

				arg_353_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_353_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_353_1:RecordName(arg_353_1.leftNameTxt_.text)
				SetActive(arg_353_1.iconTrs_.gameObject, false)
				arg_353_1.callingController_:SetSelectedState("normal")

				local var_356_23 = arg_353_1:GetWordFromCfg(116431082)
				local var_356_24 = arg_353_1:FormatText(var_356_23.content)

				arg_353_1.text_.text = var_356_24

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.text_)

				local var_356_25 = 5
				local var_356_26 = utf8.len(var_356_24)
				local var_356_27 = var_356_25 <= 0 and var_356_21 or var_356_21 * (var_356_26 / var_356_25)

				if var_356_27 > 0 and var_356_21 < var_356_27 then
					arg_353_1.talkMaxDuration = var_356_27

					if var_356_27 + var_356_20 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_27 + var_356_20
					end
				end

				arg_353_1.text_.text = var_356_24
				arg_353_1.typewritter.percent = 0

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431082", "story_v_out_116431.awb") ~= 0 then
					local var_356_28 = manager.audio:GetVoiceLength("story_v_out_116431", "116431082", "story_v_out_116431.awb") / 1000

					if var_356_28 + var_356_20 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_28 + var_356_20
					end

					if var_356_23.prefab_name ~= "" and arg_353_1.actors_[var_356_23.prefab_name] ~= nil then
						local var_356_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_353_1.actors_[var_356_23.prefab_name].transform, "story_v_out_116431", "116431082", "story_v_out_116431.awb")

						arg_353_1:RecordAudio("116431082", var_356_29)
						arg_353_1:RecordAudio("116431082", var_356_29)
					else
						arg_353_1:AudioAction("play", "voice", "story_v_out_116431", "116431082", "story_v_out_116431.awb")
					end

					arg_353_1:RecordHistoryTalkVoice("story_v_out_116431", "116431082", "story_v_out_116431.awb")
				end

				arg_353_1:RecordContent(arg_353_1.text_.text)
			end

			local var_356_30 = math.max(var_356_21, arg_353_1.talkMaxDuration)

			if var_356_20 <= arg_353_1.time_ and arg_353_1.time_ < var_356_20 + var_356_30 then
				arg_353_1.typewritter.percent = (arg_353_1.time_ - var_356_20) / var_356_30

				arg_353_1.typewritter:SetDirty()
			end

			if arg_353_1.time_ >= var_356_20 + var_356_30 and arg_353_1.time_ < var_356_20 + var_356_30 + arg_356_0 then
				arg_353_1.typewritter.percent = 1

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(true)
			end
		end
	end,
	Play116431083 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 116431083
		arg_357_1.duration_ = 4.133

		local var_357_0 = {
			zh = 3.866,
			ja = 4.133
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
				arg_357_0:Play116431084(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = arg_357_1.actors_["1019ui_story"].transform
			local var_360_1 = 0

			if var_360_1 < arg_357_1.time_ and arg_357_1.time_ <= var_360_1 + arg_360_0 then
				arg_357_1.var_.moveOldPos1019ui_story = var_360_0.localPosition
			end

			local var_360_2 = 0.001

			if var_360_1 <= arg_357_1.time_ and arg_357_1.time_ < var_360_1 + var_360_2 then
				local var_360_3 = (arg_357_1.time_ - var_360_1) / var_360_2
				local var_360_4 = Vector3.New(-0.7, -1.08, -5.9)

				var_360_0.localPosition = Vector3.Lerp(arg_357_1.var_.moveOldPos1019ui_story, var_360_4, var_360_3)

				local var_360_5 = manager.ui.mainCamera.transform.position - var_360_0.position

				var_360_0.forward = Vector3.New(var_360_5.x, var_360_5.y, var_360_5.z)

				local var_360_6 = var_360_0.localEulerAngles

				var_360_6.z = 0
				var_360_6.x = 0
				var_360_0.localEulerAngles = var_360_6
			end

			if arg_357_1.time_ >= var_360_1 + var_360_2 and arg_357_1.time_ < var_360_1 + var_360_2 + arg_360_0 then
				var_360_0.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_360_7 = manager.ui.mainCamera.transform.position - var_360_0.position

				var_360_0.forward = Vector3.New(var_360_7.x, var_360_7.y, var_360_7.z)

				local var_360_8 = var_360_0.localEulerAngles

				var_360_8.z = 0
				var_360_8.x = 0
				var_360_0.localEulerAngles = var_360_8
			end

			local var_360_9 = arg_357_1.actors_["1029ui_story"].transform
			local var_360_10 = 0

			if var_360_10 < arg_357_1.time_ and arg_357_1.time_ <= var_360_10 + arg_360_0 then
				arg_357_1.var_.moveOldPos1029ui_story = var_360_9.localPosition
			end

			local var_360_11 = 0.001

			if var_360_10 <= arg_357_1.time_ and arg_357_1.time_ < var_360_10 + var_360_11 then
				local var_360_12 = (arg_357_1.time_ - var_360_10) / var_360_11
				local var_360_13 = Vector3.New(0.7, -1.09, -6.2)

				var_360_9.localPosition = Vector3.Lerp(arg_357_1.var_.moveOldPos1029ui_story, var_360_13, var_360_12)

				local var_360_14 = manager.ui.mainCamera.transform.position - var_360_9.position

				var_360_9.forward = Vector3.New(var_360_14.x, var_360_14.y, var_360_14.z)

				local var_360_15 = var_360_9.localEulerAngles

				var_360_15.z = 0
				var_360_15.x = 0
				var_360_9.localEulerAngles = var_360_15
			end

			if arg_357_1.time_ >= var_360_10 + var_360_11 and arg_357_1.time_ < var_360_10 + var_360_11 + arg_360_0 then
				var_360_9.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_360_16 = manager.ui.mainCamera.transform.position - var_360_9.position

				var_360_9.forward = Vector3.New(var_360_16.x, var_360_16.y, var_360_16.z)

				local var_360_17 = var_360_9.localEulerAngles

				var_360_17.z = 0
				var_360_17.x = 0
				var_360_9.localEulerAngles = var_360_17
			end

			local var_360_18 = arg_357_1.actors_["1019ui_story"]
			local var_360_19 = 0

			if var_360_19 < arg_357_1.time_ and arg_357_1.time_ <= var_360_19 + arg_360_0 and arg_357_1.var_.characterEffect1019ui_story == nil then
				arg_357_1.var_.characterEffect1019ui_story = var_360_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_360_20 = 0.2

			if var_360_19 <= arg_357_1.time_ and arg_357_1.time_ < var_360_19 + var_360_20 then
				local var_360_21 = (arg_357_1.time_ - var_360_19) / var_360_20

				if arg_357_1.var_.characterEffect1019ui_story then
					local var_360_22 = Mathf.Lerp(0, 0.5, var_360_21)

					arg_357_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_357_1.var_.characterEffect1019ui_story.fillRatio = var_360_22
				end
			end

			if arg_357_1.time_ >= var_360_19 + var_360_20 and arg_357_1.time_ < var_360_19 + var_360_20 + arg_360_0 and arg_357_1.var_.characterEffect1019ui_story then
				local var_360_23 = 0.5

				arg_357_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_357_1.var_.characterEffect1019ui_story.fillRatio = var_360_23
			end

			local var_360_24 = arg_357_1.actors_["1029ui_story"]
			local var_360_25 = 0

			if var_360_25 < arg_357_1.time_ and arg_357_1.time_ <= var_360_25 + arg_360_0 and arg_357_1.var_.characterEffect1029ui_story == nil then
				arg_357_1.var_.characterEffect1029ui_story = var_360_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_360_26 = 0.2

			if var_360_25 <= arg_357_1.time_ and arg_357_1.time_ < var_360_25 + var_360_26 then
				local var_360_27 = (arg_357_1.time_ - var_360_25) / var_360_26

				if arg_357_1.var_.characterEffect1029ui_story then
					arg_357_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_357_1.time_ >= var_360_25 + var_360_26 and arg_357_1.time_ < var_360_25 + var_360_26 + arg_360_0 and arg_357_1.var_.characterEffect1029ui_story then
				arg_357_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_360_28 = 0

			if var_360_28 < arg_357_1.time_ and arg_357_1.time_ <= var_360_28 + arg_360_0 then
				arg_357_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029actionlink/1029action446")
			end

			local var_360_29 = 0

			if var_360_29 < arg_357_1.time_ and arg_357_1.time_ <= var_360_29 + arg_360_0 then
				arg_357_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_360_30 = 0
			local var_360_31 = 0.375

			if var_360_30 < arg_357_1.time_ and arg_357_1.time_ <= var_360_30 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0
				arg_357_1.dialogCg_.alpha = 1

				arg_357_1.dialog_:SetActive(true)
				SetActive(arg_357_1.leftNameGo_, true)

				local var_360_32 = arg_357_1:FormatText(StoryNameCfg[319].name)

				arg_357_1.leftNameTxt_.text = var_360_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_357_1.leftNameTxt_.transform)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1.leftNameTxt_.text)
				SetActive(arg_357_1.iconTrs_.gameObject, false)
				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_33 = arg_357_1:GetWordFromCfg(116431083)
				local var_360_34 = arg_357_1:FormatText(var_360_33.content)

				arg_357_1.text_.text = var_360_34

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_35 = 15
				local var_360_36 = utf8.len(var_360_34)
				local var_360_37 = var_360_35 <= 0 and var_360_31 or var_360_31 * (var_360_36 / var_360_35)

				if var_360_37 > 0 and var_360_31 < var_360_37 then
					arg_357_1.talkMaxDuration = var_360_37

					if var_360_37 + var_360_30 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_37 + var_360_30
					end
				end

				arg_357_1.text_.text = var_360_34
				arg_357_1.typewritter.percent = 0

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431083", "story_v_out_116431.awb") ~= 0 then
					local var_360_38 = manager.audio:GetVoiceLength("story_v_out_116431", "116431083", "story_v_out_116431.awb") / 1000

					if var_360_38 + var_360_30 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_38 + var_360_30
					end

					if var_360_33.prefab_name ~= "" and arg_357_1.actors_[var_360_33.prefab_name] ~= nil then
						local var_360_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_357_1.actors_[var_360_33.prefab_name].transform, "story_v_out_116431", "116431083", "story_v_out_116431.awb")

						arg_357_1:RecordAudio("116431083", var_360_39)
						arg_357_1:RecordAudio("116431083", var_360_39)
					else
						arg_357_1:AudioAction("play", "voice", "story_v_out_116431", "116431083", "story_v_out_116431.awb")
					end

					arg_357_1:RecordHistoryTalkVoice("story_v_out_116431", "116431083", "story_v_out_116431.awb")
				end

				arg_357_1:RecordContent(arg_357_1.text_.text)
			end

			local var_360_40 = math.max(var_360_31, arg_357_1.talkMaxDuration)

			if var_360_30 <= arg_357_1.time_ and arg_357_1.time_ < var_360_30 + var_360_40 then
				arg_357_1.typewritter.percent = (arg_357_1.time_ - var_360_30) / var_360_40

				arg_357_1.typewritter:SetDirty()
			end

			if arg_357_1.time_ >= var_360_30 + var_360_40 and arg_357_1.time_ < var_360_30 + var_360_40 + arg_360_0 then
				arg_357_1.typewritter.percent = 1

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(true)
			end
		end
	end,
	Play116431084 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 116431084
		arg_361_1.duration_ = 4.833

		local var_361_0 = {
			zh = 4.833,
			ja = 2.9
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
				arg_361_0:Play116431085(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = arg_361_1.actors_["1019ui_story"].transform
			local var_364_1 = 0

			if var_364_1 < arg_361_1.time_ and arg_361_1.time_ <= var_364_1 + arg_364_0 then
				arg_361_1.var_.moveOldPos1019ui_story = var_364_0.localPosition
			end

			local var_364_2 = 0.001

			if var_364_1 <= arg_361_1.time_ and arg_361_1.time_ < var_364_1 + var_364_2 then
				local var_364_3 = (arg_361_1.time_ - var_364_1) / var_364_2
				local var_364_4 = Vector3.New(-0.7, -1.08, -5.9)

				var_364_0.localPosition = Vector3.Lerp(arg_361_1.var_.moveOldPos1019ui_story, var_364_4, var_364_3)

				local var_364_5 = manager.ui.mainCamera.transform.position - var_364_0.position

				var_364_0.forward = Vector3.New(var_364_5.x, var_364_5.y, var_364_5.z)

				local var_364_6 = var_364_0.localEulerAngles

				var_364_6.z = 0
				var_364_6.x = 0
				var_364_0.localEulerAngles = var_364_6
			end

			if arg_361_1.time_ >= var_364_1 + var_364_2 and arg_361_1.time_ < var_364_1 + var_364_2 + arg_364_0 then
				var_364_0.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_364_7 = manager.ui.mainCamera.transform.position - var_364_0.position

				var_364_0.forward = Vector3.New(var_364_7.x, var_364_7.y, var_364_7.z)

				local var_364_8 = var_364_0.localEulerAngles

				var_364_8.z = 0
				var_364_8.x = 0
				var_364_0.localEulerAngles = var_364_8
			end

			local var_364_9 = arg_361_1.actors_["1029ui_story"].transform
			local var_364_10 = 0

			if var_364_10 < arg_361_1.time_ and arg_361_1.time_ <= var_364_10 + arg_364_0 then
				arg_361_1.var_.moveOldPos1029ui_story = var_364_9.localPosition
			end

			local var_364_11 = 0.001

			if var_364_10 <= arg_361_1.time_ and arg_361_1.time_ < var_364_10 + var_364_11 then
				local var_364_12 = (arg_361_1.time_ - var_364_10) / var_364_11
				local var_364_13 = Vector3.New(0.7, -1.09, -6.2)

				var_364_9.localPosition = Vector3.Lerp(arg_361_1.var_.moveOldPos1029ui_story, var_364_13, var_364_12)

				local var_364_14 = manager.ui.mainCamera.transform.position - var_364_9.position

				var_364_9.forward = Vector3.New(var_364_14.x, var_364_14.y, var_364_14.z)

				local var_364_15 = var_364_9.localEulerAngles

				var_364_15.z = 0
				var_364_15.x = 0
				var_364_9.localEulerAngles = var_364_15
			end

			if arg_361_1.time_ >= var_364_10 + var_364_11 and arg_361_1.time_ < var_364_10 + var_364_11 + arg_364_0 then
				var_364_9.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_364_16 = manager.ui.mainCamera.transform.position - var_364_9.position

				var_364_9.forward = Vector3.New(var_364_16.x, var_364_16.y, var_364_16.z)

				local var_364_17 = var_364_9.localEulerAngles

				var_364_17.z = 0
				var_364_17.x = 0
				var_364_9.localEulerAngles = var_364_17
			end

			local var_364_18 = 0

			if var_364_18 < arg_361_1.time_ and arg_361_1.time_ <= var_364_18 + arg_364_0 then
				arg_361_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_364_19 = 0
			local var_364_20 = 0.266666666666667

			if var_364_19 < arg_361_1.time_ and arg_361_1.time_ <= var_364_19 + arg_364_0 then
				local var_364_21 = "play"
				local var_364_22 = "music"

				arg_361_1:AudioAction(var_364_21, var_364_22, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_364_23 = 0
			local var_364_24 = 0.325

			if var_364_23 < arg_361_1.time_ and arg_361_1.time_ <= var_364_23 + arg_364_0 then
				arg_361_1.talkMaxDuration = 0
				arg_361_1.dialogCg_.alpha = 1

				arg_361_1.dialog_:SetActive(true)
				SetActive(arg_361_1.leftNameGo_, true)

				local var_364_25 = arg_361_1:FormatText(StoryNameCfg[319].name)

				arg_361_1.leftNameTxt_.text = var_364_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_361_1.leftNameTxt_.transform)

				arg_361_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_361_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_361_1:RecordName(arg_361_1.leftNameTxt_.text)
				SetActive(arg_361_1.iconTrs_.gameObject, false)
				arg_361_1.callingController_:SetSelectedState("normal")

				local var_364_26 = arg_361_1:GetWordFromCfg(116431084)
				local var_364_27 = arg_361_1:FormatText(var_364_26.content)

				arg_361_1.text_.text = var_364_27

				LuaForUtil.ClearLinePrefixSymbol(arg_361_1.text_)

				local var_364_28 = 13
				local var_364_29 = utf8.len(var_364_27)
				local var_364_30 = var_364_28 <= 0 and var_364_24 or var_364_24 * (var_364_29 / var_364_28)

				if var_364_30 > 0 and var_364_24 < var_364_30 then
					arg_361_1.talkMaxDuration = var_364_30

					if var_364_30 + var_364_23 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_30 + var_364_23
					end
				end

				arg_361_1.text_.text = var_364_27
				arg_361_1.typewritter.percent = 0

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431084", "story_v_out_116431.awb") ~= 0 then
					local var_364_31 = manager.audio:GetVoiceLength("story_v_out_116431", "116431084", "story_v_out_116431.awb") / 1000

					if var_364_31 + var_364_23 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_31 + var_364_23
					end

					if var_364_26.prefab_name ~= "" and arg_361_1.actors_[var_364_26.prefab_name] ~= nil then
						local var_364_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_361_1.actors_[var_364_26.prefab_name].transform, "story_v_out_116431", "116431084", "story_v_out_116431.awb")

						arg_361_1:RecordAudio("116431084", var_364_32)
						arg_361_1:RecordAudio("116431084", var_364_32)
					else
						arg_361_1:AudioAction("play", "voice", "story_v_out_116431", "116431084", "story_v_out_116431.awb")
					end

					arg_361_1:RecordHistoryTalkVoice("story_v_out_116431", "116431084", "story_v_out_116431.awb")
				end

				arg_361_1:RecordContent(arg_361_1.text_.text)
			end

			local var_364_33 = math.max(var_364_24, arg_361_1.talkMaxDuration)

			if var_364_23 <= arg_361_1.time_ and arg_361_1.time_ < var_364_23 + var_364_33 then
				arg_361_1.typewritter.percent = (arg_361_1.time_ - var_364_23) / var_364_33

				arg_361_1.typewritter:SetDirty()
			end

			if arg_361_1.time_ >= var_364_23 + var_364_33 and arg_361_1.time_ < var_364_23 + var_364_33 + arg_364_0 then
				arg_361_1.typewritter.percent = 1

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(true)
			end
		end
	end,
	Play116431085 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 116431085
		arg_365_1.duration_ = 13.582666666666

		SetActive(arg_365_1.tipsGo_, false)

		function arg_365_1.onSingleLineFinish_()
			arg_365_1.onSingleLineUpdate_ = nil
			arg_365_1.onSingleLineFinish_ = nil
			arg_365_1.state_ = "waiting"
		end

		function arg_365_1.playNext_(arg_367_0)
			if arg_367_0 == 1 then
				arg_365_0:Play116431086(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = 2

			if var_368_0 < arg_365_1.time_ and arg_365_1.time_ <= var_368_0 + arg_368_0 then
				local var_368_1 = manager.ui.mainCamera.transform.localPosition
				local var_368_2 = Vector3.New(0, 0, 10) + Vector3.New(var_368_1.x, var_368_1.y, 0)
				local var_368_3 = arg_365_1.bgs_.STblack

				var_368_3.transform.localPosition = var_368_2
				var_368_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_368_4 = var_368_3:GetComponent("SpriteRenderer")

				if var_368_4 and var_368_4.sprite then
					local var_368_5 = (var_368_3.transform.localPosition - var_368_1).z
					local var_368_6 = manager.ui.mainCameraCom_
					local var_368_7 = 2 * var_368_5 * Mathf.Tan(var_368_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_368_8 = var_368_7 * var_368_6.aspect
					local var_368_9 = var_368_4.sprite.bounds.size.x
					local var_368_10 = var_368_4.sprite.bounds.size.y
					local var_368_11 = var_368_8 / var_368_9
					local var_368_12 = var_368_7 / var_368_10
					local var_368_13 = var_368_12 < var_368_11 and var_368_11 or var_368_12

					var_368_3.transform.localScale = Vector3.New(var_368_13, var_368_13, 0)
				end

				for iter_368_0, iter_368_1 in pairs(arg_365_1.bgs_) do
					if iter_368_0 ~= "STblack" then
						iter_368_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_368_14 = 0

			if var_368_14 < arg_365_1.time_ and arg_365_1.time_ <= var_368_14 + arg_368_0 then
				arg_365_1.mask_.enabled = true
				arg_365_1.mask_.raycastTarget = true

				arg_365_1:SetGaussion(false)
			end

			local var_368_15 = 2

			if var_368_14 <= arg_365_1.time_ and arg_365_1.time_ < var_368_14 + var_368_15 then
				local var_368_16 = (arg_365_1.time_ - var_368_14) / var_368_15
				local var_368_17 = Color.New(0, 0, 0)

				var_368_17.a = Mathf.Lerp(0, 1, var_368_16)
				arg_365_1.mask_.color = var_368_17
			end

			if arg_365_1.time_ >= var_368_14 + var_368_15 and arg_365_1.time_ < var_368_14 + var_368_15 + arg_368_0 then
				local var_368_18 = Color.New(0, 0, 0)

				var_368_18.a = 1
				arg_365_1.mask_.color = var_368_18
			end

			local var_368_19 = 2

			if var_368_19 < arg_365_1.time_ and arg_365_1.time_ <= var_368_19 + arg_368_0 then
				arg_365_1.mask_.enabled = true
				arg_365_1.mask_.raycastTarget = true

				arg_365_1:SetGaussion(false)
			end

			local var_368_20 = 2

			if var_368_19 <= arg_365_1.time_ and arg_365_1.time_ < var_368_19 + var_368_20 then
				local var_368_21 = (arg_365_1.time_ - var_368_19) / var_368_20
				local var_368_22 = Color.New(0, 0, 0)

				var_368_22.a = Mathf.Lerp(1, 0, var_368_21)
				arg_365_1.mask_.color = var_368_22
			end

			if arg_365_1.time_ >= var_368_19 + var_368_20 and arg_365_1.time_ < var_368_19 + var_368_20 + arg_368_0 then
				local var_368_23 = Color.New(0, 0, 0)
				local var_368_24 = 0

				arg_365_1.mask_.enabled = false
				var_368_23.a = var_368_24
				arg_365_1.mask_.color = var_368_23
			end

			local var_368_25 = arg_365_1.actors_["1019ui_story"].transform
			local var_368_26 = 1.966

			if var_368_26 < arg_365_1.time_ and arg_365_1.time_ <= var_368_26 + arg_368_0 then
				arg_365_1.var_.moveOldPos1019ui_story = var_368_25.localPosition
			end

			local var_368_27 = 0.001

			if var_368_26 <= arg_365_1.time_ and arg_365_1.time_ < var_368_26 + var_368_27 then
				local var_368_28 = (arg_365_1.time_ - var_368_26) / var_368_27
				local var_368_29 = Vector3.New(0, 100, 0)

				var_368_25.localPosition = Vector3.Lerp(arg_365_1.var_.moveOldPos1019ui_story, var_368_29, var_368_28)

				local var_368_30 = manager.ui.mainCamera.transform.position - var_368_25.position

				var_368_25.forward = Vector3.New(var_368_30.x, var_368_30.y, var_368_30.z)

				local var_368_31 = var_368_25.localEulerAngles

				var_368_31.z = 0
				var_368_31.x = 0
				var_368_25.localEulerAngles = var_368_31
			end

			if arg_365_1.time_ >= var_368_26 + var_368_27 and arg_365_1.time_ < var_368_26 + var_368_27 + arg_368_0 then
				var_368_25.localPosition = Vector3.New(0, 100, 0)

				local var_368_32 = manager.ui.mainCamera.transform.position - var_368_25.position

				var_368_25.forward = Vector3.New(var_368_32.x, var_368_32.y, var_368_32.z)

				local var_368_33 = var_368_25.localEulerAngles

				var_368_33.z = 0
				var_368_33.x = 0
				var_368_25.localEulerAngles = var_368_33
			end

			local var_368_34 = arg_365_1.actors_["1029ui_story"].transform
			local var_368_35 = 1.966

			if var_368_35 < arg_365_1.time_ and arg_365_1.time_ <= var_368_35 + arg_368_0 then
				arg_365_1.var_.moveOldPos1029ui_story = var_368_34.localPosition
			end

			local var_368_36 = 0.001

			if var_368_35 <= arg_365_1.time_ and arg_365_1.time_ < var_368_35 + var_368_36 then
				local var_368_37 = (arg_365_1.time_ - var_368_35) / var_368_36
				local var_368_38 = Vector3.New(0, 100, 0)

				var_368_34.localPosition = Vector3.Lerp(arg_365_1.var_.moveOldPos1029ui_story, var_368_38, var_368_37)

				local var_368_39 = manager.ui.mainCamera.transform.position - var_368_34.position

				var_368_34.forward = Vector3.New(var_368_39.x, var_368_39.y, var_368_39.z)

				local var_368_40 = var_368_34.localEulerAngles

				var_368_40.z = 0
				var_368_40.x = 0
				var_368_34.localEulerAngles = var_368_40
			end

			if arg_365_1.time_ >= var_368_35 + var_368_36 and arg_365_1.time_ < var_368_35 + var_368_36 + arg_368_0 then
				var_368_34.localPosition = Vector3.New(0, 100, 0)

				local var_368_41 = manager.ui.mainCamera.transform.position - var_368_34.position

				var_368_34.forward = Vector3.New(var_368_41.x, var_368_41.y, var_368_41.z)

				local var_368_42 = var_368_34.localEulerAngles

				var_368_42.z = 0
				var_368_42.x = 0
				var_368_34.localEulerAngles = var_368_42
			end

			local var_368_43 = 0

			if var_368_43 < arg_365_1.time_ and arg_365_1.time_ <= var_368_43 + arg_368_0 then
				arg_365_1.fswbg_:SetActive(true)
				arg_365_1.dialog_:SetActive(false)

				arg_365_1.fswtw_.percent = 0

				local var_368_44 = arg_365_1:GetWordFromCfg(116431085)
				local var_368_45 = arg_365_1:FormatText(var_368_44.content)

				arg_365_1.fswt_.text = var_368_45

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.fswt_)

				arg_365_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_365_1.fswtw_:SetDirty()

				arg_365_1.typewritterCharCountI18N = 0

				SetActive(arg_365_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_365_1:ShowNextGo(false)
			end

			local var_368_46 = 4.01666666666667

			if var_368_46 < arg_365_1.time_ and arg_365_1.time_ <= var_368_46 + arg_368_0 then
				arg_365_1.var_.oldValueTypewriter = arg_365_1.fswtw_.percent

				arg_365_1:ShowNextGo(false)
			end

			local var_368_47 = 37
			local var_368_48 = 2.46666666666667
			local var_368_49 = arg_365_1:GetWordFromCfg(116431085)
			local var_368_50 = arg_365_1:FormatText(var_368_49.content)
			local var_368_51, var_368_52 = arg_365_1:GetPercentByPara(var_368_50, 1)

			if var_368_46 < arg_365_1.time_ and arg_365_1.time_ <= var_368_46 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0

				local var_368_53 = var_368_47 <= 0 and var_368_48 or var_368_48 * ((var_368_52 - arg_365_1.typewritterCharCountI18N) / var_368_47)

				if var_368_53 > 0 and var_368_48 < var_368_53 then
					arg_365_1.talkMaxDuration = var_368_53

					if var_368_53 + var_368_46 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_53 + var_368_46
					end
				end
			end

			local var_368_54 = 2.46666666666667
			local var_368_55 = math.max(var_368_54, arg_365_1.talkMaxDuration)

			if var_368_46 <= arg_365_1.time_ and arg_365_1.time_ < var_368_46 + var_368_55 then
				local var_368_56 = (arg_365_1.time_ - var_368_46) / var_368_55

				arg_365_1.fswtw_.percent = Mathf.Lerp(arg_365_1.var_.oldValueTypewriter, var_368_51, var_368_56)
				arg_365_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_365_1.fswtw_:SetDirty()
			end

			if arg_365_1.time_ >= var_368_46 + var_368_55 and arg_365_1.time_ < var_368_46 + var_368_55 + arg_368_0 then
				arg_365_1.fswtw_.percent = var_368_51

				arg_365_1.fswtw_:SetDirty()
				arg_365_1:ShowNextGo(true)

				arg_365_1.typewritterCharCountI18N = var_368_52
			end

			local var_368_57 = 4.01666666666667
			local var_368_58 = 9.566
			local var_368_59 = manager.audio:GetVoiceLength("story_v_out_116431", "116431085", "story_v_out_116431.awb") / 1000

			if var_368_59 > 0 and var_368_58 < var_368_59 and var_368_59 + var_368_57 > arg_365_1.duration_ then
				local var_368_60 = var_368_59

				arg_365_1.duration_ = var_368_59 + var_368_57
			end

			if var_368_57 < arg_365_1.time_ and arg_365_1.time_ <= var_368_57 + arg_368_0 then
				local var_368_61 = "play"
				local var_368_62 = "voice"

				arg_365_1:AudioAction(var_368_61, var_368_62, "story_v_out_116431", "116431085", "story_v_out_116431.awb")
			end

			local var_368_63 = 0
			local var_368_64 = 0.666666666666667

			if var_368_63 < arg_365_1.time_ and arg_365_1.time_ <= var_368_63 + arg_368_0 then
				local var_368_65 = "play"
				local var_368_66 = "music"

				arg_365_1:AudioAction(var_368_65, var_368_66, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_368_67 = 0.866666666666667
			local var_368_68 = 1.13333333333333

			if var_368_67 < arg_365_1.time_ and arg_365_1.time_ <= var_368_67 + arg_368_0 then
				local var_368_69 = "play"
				local var_368_70 = "music"

				arg_365_1:AudioAction(var_368_69, var_368_70, "bgm_side_daily04", "bgm_side_daily04", "bgm_side_daily04.awb")
			end

			local var_368_71 = 4.08333333333333

			if var_368_71 < arg_365_1.time_ and arg_365_1.time_ <= var_368_71 + arg_368_0 then
				arg_365_1.allBtn_.enabled = false
			end

			local var_368_72 = 2.4

			if arg_365_1.time_ >= var_368_71 + var_368_72 and arg_365_1.time_ < var_368_71 + var_368_72 + arg_368_0 then
				arg_365_1.allBtn_.enabled = true
			end
		end
	end,
	Play116431086 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 116431086
		arg_369_1.duration_ = 13.746999999999

		SetActive(arg_369_1.tipsGo_, false)

		function arg_369_1.onSingleLineFinish_()
			arg_369_1.onSingleLineUpdate_ = nil
			arg_369_1.onSingleLineFinish_ = nil
			arg_369_1.state_ = "waiting"
		end

		function arg_369_1.playNext_(arg_371_0)
			if arg_371_0 == 1 then
				arg_369_0:Play116431087(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = 0

			if var_372_0 < arg_369_1.time_ and arg_369_1.time_ <= var_372_0 + arg_372_0 then
				arg_369_1.var_.oldValueTypewriter = arg_369_1.fswtw_.percent

				arg_369_1:ShowNextGo(false)
			end

			local var_372_1 = 62
			local var_372_2 = 4.13333333333333
			local var_372_3 = arg_369_1:GetWordFromCfg(116431085)
			local var_372_4 = arg_369_1:FormatText(var_372_3.content)
			local var_372_5, var_372_6 = arg_369_1:GetPercentByPara(var_372_4, 3)

			if var_372_0 < arg_369_1.time_ and arg_369_1.time_ <= var_372_0 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0

				local var_372_7 = var_372_1 <= 0 and var_372_2 or var_372_2 * ((var_372_6 - arg_369_1.typewritterCharCountI18N) / var_372_1)

				if var_372_7 > 0 and var_372_2 < var_372_7 then
					arg_369_1.talkMaxDuration = var_372_7

					if var_372_7 + var_372_0 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_7 + var_372_0
					end
				end
			end

			local var_372_8 = 4.13333333333333
			local var_372_9 = math.max(var_372_8, arg_369_1.talkMaxDuration)

			if var_372_0 <= arg_369_1.time_ and arg_369_1.time_ < var_372_0 + var_372_9 then
				local var_372_10 = (arg_369_1.time_ - var_372_0) / var_372_9

				arg_369_1.fswtw_.percent = Mathf.Lerp(arg_369_1.var_.oldValueTypewriter, var_372_5, var_372_10)
				arg_369_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_369_1.fswtw_:SetDirty()
			end

			if arg_369_1.time_ >= var_372_0 + var_372_9 and arg_369_1.time_ < var_372_0 + var_372_9 + arg_372_0 then
				arg_369_1.fswtw_.percent = var_372_5

				arg_369_1.fswtw_:SetDirty()
				arg_369_1:ShowNextGo(true)

				arg_369_1.typewritterCharCountI18N = var_372_6
			end

			local var_372_11 = 0
			local var_372_12 = 13.747
			local var_372_13 = manager.audio:GetVoiceLength("story_v_out_116431", "116431086", "story_v_out_116431.awb") / 1000

			if var_372_13 > 0 and var_372_12 < var_372_13 and var_372_13 + var_372_11 > arg_369_1.duration_ then
				local var_372_14 = var_372_13

				arg_369_1.duration_ = var_372_13 + var_372_11
			end

			if var_372_11 < arg_369_1.time_ and arg_369_1.time_ <= var_372_11 + arg_372_0 then
				local var_372_15 = "play"
				local var_372_16 = "voice"

				arg_369_1:AudioAction(var_372_15, var_372_16, "story_v_out_116431", "116431086", "story_v_out_116431.awb")
			end

			local var_372_17 = 0

			if var_372_17 < arg_369_1.time_ and arg_369_1.time_ <= var_372_17 + arg_372_0 then
				arg_369_1.allBtn_.enabled = false
			end

			local var_372_18 = 4.1

			if arg_369_1.time_ >= var_372_17 + var_372_18 and arg_369_1.time_ < var_372_17 + var_372_18 + arg_372_0 then
				arg_369_1.allBtn_.enabled = true
			end
		end
	end,
	Play116431087 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 116431087
		arg_373_1.duration_ = 14.609999999999

		SetActive(arg_373_1.tipsGo_, false)

		function arg_373_1.onSingleLineFinish_()
			arg_373_1.onSingleLineUpdate_ = nil
			arg_373_1.onSingleLineFinish_ = nil
			arg_373_1.state_ = "waiting"
		end

		function arg_373_1.playNext_(arg_375_0)
			if arg_375_0 == 1 then
				arg_373_0:Play116431088(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = 0

			if var_376_0 < arg_373_1.time_ and arg_373_1.time_ <= var_376_0 + arg_376_0 then
				arg_373_1.var_.oldValueTypewriter = arg_373_1.fswtw_.percent

				arg_373_1:ShowNextGo(false)
			end

			local var_376_1 = 61
			local var_376_2 = 4.06666666666667
			local var_376_3 = arg_373_1:GetWordFromCfg(116431085)
			local var_376_4 = arg_373_1:FormatText(var_376_3.content)
			local var_376_5, var_376_6 = arg_373_1:GetPercentByPara(var_376_4, 5)

			if var_376_0 < arg_373_1.time_ and arg_373_1.time_ <= var_376_0 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0

				local var_376_7 = var_376_1 <= 0 and var_376_2 or var_376_2 * ((var_376_6 - arg_373_1.typewritterCharCountI18N) / var_376_1)

				if var_376_7 > 0 and var_376_2 < var_376_7 then
					arg_373_1.talkMaxDuration = var_376_7

					if var_376_7 + var_376_0 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_7 + var_376_0
					end
				end
			end

			local var_376_8 = 4.06666666666667
			local var_376_9 = math.max(var_376_8, arg_373_1.talkMaxDuration)

			if var_376_0 <= arg_373_1.time_ and arg_373_1.time_ < var_376_0 + var_376_9 then
				local var_376_10 = (arg_373_1.time_ - var_376_0) / var_376_9

				arg_373_1.fswtw_.percent = Mathf.Lerp(arg_373_1.var_.oldValueTypewriter, var_376_5, var_376_10)
				arg_373_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_373_1.fswtw_:SetDirty()
			end

			if arg_373_1.time_ >= var_376_0 + var_376_9 and arg_373_1.time_ < var_376_0 + var_376_9 + arg_376_0 then
				arg_373_1.fswtw_.percent = var_376_5

				arg_373_1.fswtw_:SetDirty()
				arg_373_1:ShowNextGo(true)

				arg_373_1.typewritterCharCountI18N = var_376_6
			end

			local var_376_11 = 0
			local var_376_12 = 14.61
			local var_376_13 = manager.audio:GetVoiceLength("story_v_out_116431", "116431087", "story_v_out_116431.awb") / 1000

			if var_376_13 > 0 and var_376_12 < var_376_13 and var_376_13 + var_376_11 > arg_373_1.duration_ then
				local var_376_14 = var_376_13

				arg_373_1.duration_ = var_376_13 + var_376_11
			end

			if var_376_11 < arg_373_1.time_ and arg_373_1.time_ <= var_376_11 + arg_376_0 then
				local var_376_15 = "play"
				local var_376_16 = "voice"

				arg_373_1:AudioAction(var_376_15, var_376_16, "story_v_out_116431", "116431087", "story_v_out_116431.awb")
			end

			local var_376_17 = 0

			if var_376_17 < arg_373_1.time_ and arg_373_1.time_ <= var_376_17 + arg_376_0 then
				arg_373_1.allBtn_.enabled = false
			end

			local var_376_18 = 4.06666666666667

			if arg_373_1.time_ >= var_376_17 + var_376_18 and arg_373_1.time_ < var_376_17 + var_376_18 + arg_376_0 then
				arg_373_1.allBtn_.enabled = true
			end
		end
	end,
	Play116431088 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 116431088
		arg_377_1.duration_ = 5

		SetActive(arg_377_1.tipsGo_, false)

		function arg_377_1.onSingleLineFinish_()
			arg_377_1.onSingleLineUpdate_ = nil
			arg_377_1.onSingleLineFinish_ = nil
			arg_377_1.state_ = "waiting"
		end

		function arg_377_1.playNext_(arg_379_0)
			if arg_379_0 == 1 then
				arg_377_0:Play116431089(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = 0

			if var_380_0 < arg_377_1.time_ and arg_377_1.time_ <= var_380_0 + arg_380_0 then
				arg_377_1.fswbg_:SetActive(false)
				arg_377_1.dialog_:SetActive(true)
				arg_377_1:ShowNextGo(false)
			end

			local var_380_1 = 0
			local var_380_2 = 0.175

			if var_380_1 < arg_377_1.time_ and arg_377_1.time_ <= var_380_1 + arg_380_0 then
				arg_377_1.talkMaxDuration = 0

				arg_377_1.dialog_:SetActive(true)

				local var_380_3 = LeanTween.value(arg_377_1.dialog_, 0, 1, 0.3)

				var_380_3:setOnUpdate(LuaHelper.FloatAction(function(arg_381_0)
					arg_377_1.dialogCg_.alpha = arg_381_0
				end))
				var_380_3:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_377_1.dialog_)
					var_380_3:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_377_1.duration_ = arg_377_1.duration_ + 0.3

				SetActive(arg_377_1.leftNameGo_, true)

				local var_380_4 = arg_377_1:FormatText(StoryNameCfg[7].name)

				arg_377_1.leftNameTxt_.text = var_380_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_377_1.leftNameTxt_.transform)

				arg_377_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_377_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_377_1:RecordName(arg_377_1.leftNameTxt_.text)
				SetActive(arg_377_1.iconTrs_.gameObject, false)
				arg_377_1.callingController_:SetSelectedState("normal")

				local var_380_5 = arg_377_1:GetWordFromCfg(116431088)
				local var_380_6 = arg_377_1:FormatText(var_380_5.content)

				arg_377_1.text_.text = var_380_6

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_7 = 7
				local var_380_8 = utf8.len(var_380_6)
				local var_380_9 = var_380_7 <= 0 and var_380_2 or var_380_2 * (var_380_8 / var_380_7)

				if var_380_9 > 0 and var_380_2 < var_380_9 then
					arg_377_1.talkMaxDuration = var_380_9
					var_380_1 = var_380_1 + 0.3

					if var_380_9 + var_380_1 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_9 + var_380_1
					end
				end

				arg_377_1.text_.text = var_380_6
				arg_377_1.typewritter.percent = 0

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(false)
				arg_377_1:RecordContent(arg_377_1.text_.text)
			end

			local var_380_10 = var_380_1 + 0.3
			local var_380_11 = math.max(var_380_2, arg_377_1.talkMaxDuration)

			if var_380_10 <= arg_377_1.time_ and arg_377_1.time_ < var_380_10 + var_380_11 then
				arg_377_1.typewritter.percent = (arg_377_1.time_ - var_380_10) / var_380_11

				arg_377_1.typewritter:SetDirty()
			end

			if arg_377_1.time_ >= var_380_10 + var_380_11 and arg_377_1.time_ < var_380_10 + var_380_11 + arg_380_0 then
				arg_377_1.typewritter.percent = 1

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(true)
			end
		end
	end,
	Play116431089 = function(arg_383_0, arg_383_1)
		arg_383_1.time_ = 0
		arg_383_1.frameCnt_ = 0
		arg_383_1.state_ = "playing"
		arg_383_1.curTalkId_ = 116431089
		arg_383_1.duration_ = 1.274999999999

		SetActive(arg_383_1.tipsGo_, false)

		function arg_383_1.onSingleLineFinish_()
			arg_383_1.onSingleLineUpdate_ = nil
			arg_383_1.onSingleLineFinish_ = nil
			arg_383_1.state_ = "waiting"
		end

		function arg_383_1.playNext_(arg_385_0)
			if arg_385_0 == 1 then
				arg_383_0:Play116431090(arg_383_1)
			end
		end

		function arg_383_1.onSingleLineUpdate_(arg_386_0)
			local var_386_0 = 0

			if var_386_0 < arg_383_1.time_ and arg_383_1.time_ <= var_386_0 + arg_386_0 then
				arg_383_1.fswbg_:SetActive(true)
				arg_383_1.dialog_:SetActive(false)

				arg_383_1.fswtw_.percent = 0

				local var_386_1 = arg_383_1:GetWordFromCfg(116431089)
				local var_386_2 = arg_383_1:FormatText(var_386_1.content)

				arg_383_1.fswt_.text = var_386_2

				LuaForUtil.ClearLinePrefixSymbol(arg_383_1.fswt_)

				arg_383_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_383_1.fswtw_:SetDirty()

				arg_383_1.typewritterCharCountI18N = 0

				SetActive(arg_383_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_383_1:ShowNextGo(false)
			end

			local var_386_3 = 0.0166666666666667

			if var_386_3 < arg_383_1.time_ and arg_383_1.time_ <= var_386_3 + arg_386_0 then
				arg_383_1.var_.oldValueTypewriter = arg_383_1.fswtw_.percent

				arg_383_1:ShowNextGo(false)
			end

			local var_386_4 = 3
			local var_386_5 = 0.2
			local var_386_6 = arg_383_1:GetWordFromCfg(116431089)
			local var_386_7 = arg_383_1:FormatText(var_386_6.content)
			local var_386_8, var_386_9 = arg_383_1:GetPercentByPara(var_386_7, 1)

			if var_386_3 < arg_383_1.time_ and arg_383_1.time_ <= var_386_3 + arg_386_0 then
				arg_383_1.talkMaxDuration = 0

				local var_386_10 = var_386_4 <= 0 and var_386_5 or var_386_5 * ((var_386_9 - arg_383_1.typewritterCharCountI18N) / var_386_4)

				if var_386_10 > 0 and var_386_5 < var_386_10 then
					arg_383_1.talkMaxDuration = var_386_10

					if var_386_10 + var_386_3 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_10 + var_386_3
					end
				end
			end

			local var_386_11 = 0.2
			local var_386_12 = math.max(var_386_11, arg_383_1.talkMaxDuration)

			if var_386_3 <= arg_383_1.time_ and arg_383_1.time_ < var_386_3 + var_386_12 then
				local var_386_13 = (arg_383_1.time_ - var_386_3) / var_386_12

				arg_383_1.fswtw_.percent = Mathf.Lerp(arg_383_1.var_.oldValueTypewriter, var_386_8, var_386_13)
				arg_383_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_383_1.fswtw_:SetDirty()
			end

			if arg_383_1.time_ >= var_386_3 + var_386_12 and arg_383_1.time_ < var_386_3 + var_386_12 + arg_386_0 then
				arg_383_1.fswtw_.percent = var_386_8

				arg_383_1.fswtw_:SetDirty()
				arg_383_1:ShowNextGo(true)

				arg_383_1.typewritterCharCountI18N = var_386_9
			end

			local var_386_14 = 0
			local var_386_15 = 1.275
			local var_386_16 = manager.audio:GetVoiceLength("story_v_out_116431", "116431089", "story_v_out_116431.awb") / 1000

			if var_386_16 > 0 and var_386_15 < var_386_16 and var_386_16 + var_386_14 > arg_383_1.duration_ then
				local var_386_17 = var_386_16

				arg_383_1.duration_ = var_386_16 + var_386_14
			end

			if var_386_14 < arg_383_1.time_ and arg_383_1.time_ <= var_386_14 + arg_386_0 then
				local var_386_18 = "play"
				local var_386_19 = "voice"

				arg_383_1:AudioAction(var_386_18, var_386_19, "story_v_out_116431", "116431089", "story_v_out_116431.awb")
			end

			local var_386_20 = 0

			if var_386_20 < arg_383_1.time_ and arg_383_1.time_ <= var_386_20 + arg_386_0 then
				arg_383_1.allBtn_.enabled = false
			end

			local var_386_21 = 0.216666666666667

			if arg_383_1.time_ >= var_386_20 + var_386_21 and arg_383_1.time_ < var_386_20 + var_386_21 + arg_386_0 then
				arg_383_1.allBtn_.enabled = true
			end
		end
	end,
	Play116431090 = function(arg_387_0, arg_387_1)
		arg_387_1.time_ = 0
		arg_387_1.frameCnt_ = 0
		arg_387_1.state_ = "playing"
		arg_387_1.curTalkId_ = 116431090
		arg_387_1.duration_ = 5

		SetActive(arg_387_1.tipsGo_, false)

		function arg_387_1.onSingleLineFinish_()
			arg_387_1.onSingleLineUpdate_ = nil
			arg_387_1.onSingleLineFinish_ = nil
			arg_387_1.state_ = "waiting"
		end

		function arg_387_1.playNext_(arg_389_0)
			if arg_389_0 == 1 then
				arg_387_0:Play116431091(arg_387_1)
			end
		end

		function arg_387_1.onSingleLineUpdate_(arg_390_0)
			local var_390_0 = 0

			if var_390_0 < arg_387_1.time_ and arg_387_1.time_ <= var_390_0 + arg_390_0 then
				arg_387_1.fswbg_:SetActive(false)
				arg_387_1.dialog_:SetActive(true)
				arg_387_1:ShowNextGo(false)
			end

			local var_390_1 = 0
			local var_390_2 = 0.15

			if var_390_1 < arg_387_1.time_ and arg_387_1.time_ <= var_390_1 + arg_390_0 then
				arg_387_1.talkMaxDuration = 0

				arg_387_1.dialog_:SetActive(true)

				local var_390_3 = LeanTween.value(arg_387_1.dialog_, 0, 1, 0.3)

				var_390_3:setOnUpdate(LuaHelper.FloatAction(function(arg_391_0)
					arg_387_1.dialogCg_.alpha = arg_391_0
				end))
				var_390_3:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_387_1.dialog_)
					var_390_3:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_387_1.duration_ = arg_387_1.duration_ + 0.3

				SetActive(arg_387_1.leftNameGo_, true)

				local var_390_4 = arg_387_1:FormatText(StoryNameCfg[7].name)

				arg_387_1.leftNameTxt_.text = var_390_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_387_1.leftNameTxt_.transform)

				arg_387_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_387_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_387_1:RecordName(arg_387_1.leftNameTxt_.text)
				SetActive(arg_387_1.iconTrs_.gameObject, false)
				arg_387_1.callingController_:SetSelectedState("normal")

				local var_390_5 = arg_387_1:GetWordFromCfg(116431090)
				local var_390_6 = arg_387_1:FormatText(var_390_5.content)

				arg_387_1.text_.text = var_390_6

				LuaForUtil.ClearLinePrefixSymbol(arg_387_1.text_)

				local var_390_7 = 6
				local var_390_8 = utf8.len(var_390_6)
				local var_390_9 = var_390_7 <= 0 and var_390_2 or var_390_2 * (var_390_8 / var_390_7)

				if var_390_9 > 0 and var_390_2 < var_390_9 then
					arg_387_1.talkMaxDuration = var_390_9
					var_390_1 = var_390_1 + 0.3

					if var_390_9 + var_390_1 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_9 + var_390_1
					end
				end

				arg_387_1.text_.text = var_390_6
				arg_387_1.typewritter.percent = 0

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(false)
				arg_387_1:RecordContent(arg_387_1.text_.text)
			end

			local var_390_10 = var_390_1 + 0.3
			local var_390_11 = math.max(var_390_2, arg_387_1.talkMaxDuration)

			if var_390_10 <= arg_387_1.time_ and arg_387_1.time_ < var_390_10 + var_390_11 then
				arg_387_1.typewritter.percent = (arg_387_1.time_ - var_390_10) / var_390_11

				arg_387_1.typewritter:SetDirty()
			end

			if arg_387_1.time_ >= var_390_10 + var_390_11 and arg_387_1.time_ < var_390_10 + var_390_11 + arg_390_0 then
				arg_387_1.typewritter.percent = 1

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(true)
			end
		end
	end,
	Play116431091 = function(arg_393_0, arg_393_1)
		arg_393_1.time_ = 0
		arg_393_1.frameCnt_ = 0
		arg_393_1.state_ = "playing"
		arg_393_1.curTalkId_ = 116431091
		arg_393_1.duration_ = 4.292999999999

		SetActive(arg_393_1.tipsGo_, false)

		function arg_393_1.onSingleLineFinish_()
			arg_393_1.onSingleLineUpdate_ = nil
			arg_393_1.onSingleLineFinish_ = nil
			arg_393_1.state_ = "waiting"
		end

		function arg_393_1.playNext_(arg_395_0)
			if arg_395_0 == 1 then
				arg_393_0:Play116431092(arg_393_1)
			end
		end

		function arg_393_1.onSingleLineUpdate_(arg_396_0)
			local var_396_0 = 0

			if var_396_0 < arg_393_1.time_ and arg_393_1.time_ <= var_396_0 + arg_396_0 then
				arg_393_1.fswbg_:SetActive(true)
				arg_393_1.dialog_:SetActive(false)

				arg_393_1.fswtw_.percent = 0

				local var_396_1 = arg_393_1:GetWordFromCfg(116431091)
				local var_396_2 = arg_393_1:FormatText(var_396_1.content)

				arg_393_1.fswt_.text = var_396_2

				LuaForUtil.ClearLinePrefixSymbol(arg_393_1.fswt_)

				arg_393_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_393_1.fswtw_:SetDirty()

				arg_393_1.typewritterCharCountI18N = 0

				SetActive(arg_393_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_393_1:ShowNextGo(false)
			end

			local var_396_3 = 0.0166666666666667

			if var_396_3 < arg_393_1.time_ and arg_393_1.time_ <= var_396_3 + arg_396_0 then
				arg_393_1.var_.oldValueTypewriter = arg_393_1.fswtw_.percent

				arg_393_1:ShowNextGo(false)
			end

			local var_396_4 = 10
			local var_396_5 = 0.666666666666667
			local var_396_6 = arg_393_1:GetWordFromCfg(116431091)
			local var_396_7 = arg_393_1:FormatText(var_396_6.content)
			local var_396_8, var_396_9 = arg_393_1:GetPercentByPara(var_396_7, 1)

			if var_396_3 < arg_393_1.time_ and arg_393_1.time_ <= var_396_3 + arg_396_0 then
				arg_393_1.talkMaxDuration = 0

				local var_396_10 = var_396_4 <= 0 and var_396_5 or var_396_5 * ((var_396_9 - arg_393_1.typewritterCharCountI18N) / var_396_4)

				if var_396_10 > 0 and var_396_5 < var_396_10 then
					arg_393_1.talkMaxDuration = var_396_10

					if var_396_10 + var_396_3 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_10 + var_396_3
					end
				end
			end

			local var_396_11 = 0.666666666666667
			local var_396_12 = math.max(var_396_11, arg_393_1.talkMaxDuration)

			if var_396_3 <= arg_393_1.time_ and arg_393_1.time_ < var_396_3 + var_396_12 then
				local var_396_13 = (arg_393_1.time_ - var_396_3) / var_396_12

				arg_393_1.fswtw_.percent = Mathf.Lerp(arg_393_1.var_.oldValueTypewriter, var_396_8, var_396_13)
				arg_393_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_393_1.fswtw_:SetDirty()
			end

			if arg_393_1.time_ >= var_396_3 + var_396_12 and arg_393_1.time_ < var_396_3 + var_396_12 + arg_396_0 then
				arg_393_1.fswtw_.percent = var_396_8

				arg_393_1.fswtw_:SetDirty()
				arg_393_1:ShowNextGo(true)

				arg_393_1.typewritterCharCountI18N = var_396_9
			end

			local var_396_14 = 0
			local var_396_15 = 4.293
			local var_396_16 = manager.audio:GetVoiceLength("story_v_out_116431", "116431091", "story_v_out_116431.awb") / 1000

			if var_396_16 > 0 and var_396_15 < var_396_16 and var_396_16 + var_396_14 > arg_393_1.duration_ then
				local var_396_17 = var_396_16

				arg_393_1.duration_ = var_396_16 + var_396_14
			end

			if var_396_14 < arg_393_1.time_ and arg_393_1.time_ <= var_396_14 + arg_396_0 then
				local var_396_18 = "play"
				local var_396_19 = "voice"

				arg_393_1:AudioAction(var_396_18, var_396_19, "story_v_out_116431", "116431091", "story_v_out_116431.awb")
			end

			local var_396_20 = 0

			if var_396_20 < arg_393_1.time_ and arg_393_1.time_ <= var_396_20 + arg_396_0 then
				arg_393_1.allBtn_.enabled = false
			end

			local var_396_21 = 0.683333333333333

			if arg_393_1.time_ >= var_396_20 + var_396_21 and arg_393_1.time_ < var_396_20 + var_396_21 + arg_396_0 then
				arg_393_1.allBtn_.enabled = true
			end
		end
	end,
	Play116431092 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 116431092
		arg_397_1.duration_ = 12.347999999999

		SetActive(arg_397_1.tipsGo_, false)

		function arg_397_1.onSingleLineFinish_()
			arg_397_1.onSingleLineUpdate_ = nil
			arg_397_1.onSingleLineFinish_ = nil
			arg_397_1.state_ = "waiting"
		end

		function arg_397_1.playNext_(arg_399_0)
			if arg_399_0 == 1 then
				arg_397_0:Play116431093(arg_397_1)
			end
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = 0

			if var_400_0 < arg_397_1.time_ and arg_397_1.time_ <= var_400_0 + arg_400_0 then
				arg_397_1.var_.oldValueTypewriter = arg_397_1.fswtw_.percent

				arg_397_1:ShowNextGo(false)
			end

			local var_400_1 = 49
			local var_400_2 = 3.26666666666667
			local var_400_3 = arg_397_1:GetWordFromCfg(116431091)
			local var_400_4 = arg_397_1:FormatText(var_400_3.content)
			local var_400_5, var_400_6 = arg_397_1:GetPercentByPara(var_400_4, 3)

			if var_400_0 < arg_397_1.time_ and arg_397_1.time_ <= var_400_0 + arg_400_0 then
				arg_397_1.talkMaxDuration = 0

				local var_400_7 = var_400_1 <= 0 and var_400_2 or var_400_2 * ((var_400_6 - arg_397_1.typewritterCharCountI18N) / var_400_1)

				if var_400_7 > 0 and var_400_2 < var_400_7 then
					arg_397_1.talkMaxDuration = var_400_7

					if var_400_7 + var_400_0 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_7 + var_400_0
					end
				end
			end

			local var_400_8 = 3.26666666666667
			local var_400_9 = math.max(var_400_8, arg_397_1.talkMaxDuration)

			if var_400_0 <= arg_397_1.time_ and arg_397_1.time_ < var_400_0 + var_400_9 then
				local var_400_10 = (arg_397_1.time_ - var_400_0) / var_400_9

				arg_397_1.fswtw_.percent = Mathf.Lerp(arg_397_1.var_.oldValueTypewriter, var_400_5, var_400_10)
				arg_397_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_397_1.fswtw_:SetDirty()
			end

			if arg_397_1.time_ >= var_400_0 + var_400_9 and arg_397_1.time_ < var_400_0 + var_400_9 + arg_400_0 then
				arg_397_1.fswtw_.percent = var_400_5

				arg_397_1.fswtw_:SetDirty()
				arg_397_1:ShowNextGo(true)

				arg_397_1.typewritterCharCountI18N = var_400_6
			end

			local var_400_11 = 0
			local var_400_12 = 12.348
			local var_400_13 = manager.audio:GetVoiceLength("story_v_out_116431", "116431092", "story_v_out_116431.awb") / 1000

			if var_400_13 > 0 and var_400_12 < var_400_13 and var_400_13 + var_400_11 > arg_397_1.duration_ then
				local var_400_14 = var_400_13

				arg_397_1.duration_ = var_400_13 + var_400_11
			end

			if var_400_11 < arg_397_1.time_ and arg_397_1.time_ <= var_400_11 + arg_400_0 then
				local var_400_15 = "play"
				local var_400_16 = "voice"

				arg_397_1:AudioAction(var_400_15, var_400_16, "story_v_out_116431", "116431092", "story_v_out_116431.awb")
			end

			local var_400_17 = 0

			if var_400_17 < arg_397_1.time_ and arg_397_1.time_ <= var_400_17 + arg_400_0 then
				arg_397_1.allBtn_.enabled = false
			end

			local var_400_18 = 3.2

			if arg_397_1.time_ >= var_400_17 + var_400_18 and arg_397_1.time_ < var_400_17 + var_400_18 + arg_400_0 then
				arg_397_1.allBtn_.enabled = true
			end
		end
	end,
	Play116431093 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 116431093
		arg_401_1.duration_ = 4.066999999999

		SetActive(arg_401_1.tipsGo_, false)

		function arg_401_1.onSingleLineFinish_()
			arg_401_1.onSingleLineUpdate_ = nil
			arg_401_1.onSingleLineFinish_ = nil
			arg_401_1.state_ = "waiting"
		end

		function arg_401_1.playNext_(arg_403_0)
			if arg_403_0 == 1 then
				arg_401_0:Play116431094(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = 0

			if var_404_0 < arg_401_1.time_ and arg_401_1.time_ <= var_404_0 + arg_404_0 then
				arg_401_1.var_.oldValueTypewriter = arg_401_1.fswtw_.percent

				arg_401_1:ShowNextGo(false)
			end

			local var_404_1 = 0
			local var_404_2 = 1.13333333333333
			local var_404_3 = arg_401_1:GetWordFromCfg(116431091)
			local var_404_4 = arg_401_1:FormatText(var_404_3.content)
			local var_404_5, var_404_6 = arg_401_1:GetPercentByPara(var_404_4, 3)

			if var_404_0 < arg_401_1.time_ and arg_401_1.time_ <= var_404_0 + arg_404_0 then
				arg_401_1.talkMaxDuration = 0

				local var_404_7 = var_404_1 <= 0 and var_404_2 or var_404_2 * ((var_404_6 - arg_401_1.typewritterCharCountI18N) / var_404_1)

				if var_404_7 > 0 and var_404_2 < var_404_7 then
					arg_401_1.talkMaxDuration = var_404_7

					if var_404_7 + var_404_0 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_7 + var_404_0
					end
				end
			end

			local var_404_8 = 1.13333333333333
			local var_404_9 = math.max(var_404_8, arg_401_1.talkMaxDuration)

			if var_404_0 <= arg_401_1.time_ and arg_401_1.time_ < var_404_0 + var_404_9 then
				local var_404_10 = (arg_401_1.time_ - var_404_0) / var_404_9

				arg_401_1.fswtw_.percent = Mathf.Lerp(arg_401_1.var_.oldValueTypewriter, var_404_5, var_404_10)
				arg_401_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_401_1.fswtw_:SetDirty()
			end

			if arg_401_1.time_ >= var_404_0 + var_404_9 and arg_401_1.time_ < var_404_0 + var_404_9 + arg_404_0 then
				arg_401_1.fswtw_.percent = var_404_5

				arg_401_1.fswtw_:SetDirty()
				arg_401_1:ShowNextGo(true)

				arg_401_1.typewritterCharCountI18N = var_404_6
			end

			local var_404_11 = 0
			local var_404_12 = 4.067
			local var_404_13 = manager.audio:GetVoiceLength("story_v_out_116431", "116431093", "story_v_out_116431.awb") / 1000

			if var_404_13 > 0 and var_404_12 < var_404_13 and var_404_13 + var_404_11 > arg_401_1.duration_ then
				local var_404_14 = var_404_13

				arg_401_1.duration_ = var_404_13 + var_404_11
			end

			if var_404_11 < arg_401_1.time_ and arg_401_1.time_ <= var_404_11 + arg_404_0 then
				local var_404_15 = "play"
				local var_404_16 = "voice"

				arg_401_1:AudioAction(var_404_15, var_404_16, "story_v_out_116431", "116431093", "story_v_out_116431.awb")
			end

			local var_404_17 = 0

			if var_404_17 < arg_401_1.time_ and arg_401_1.time_ <= var_404_17 + arg_404_0 then
				arg_401_1.allBtn_.enabled = false
			end

			local var_404_18 = 1.13333333333333

			if arg_401_1.time_ >= var_404_17 + var_404_18 and arg_401_1.time_ < var_404_17 + var_404_18 + arg_404_0 then
				arg_401_1.allBtn_.enabled = true
			end
		end
	end,
	Play116431094 = function(arg_405_0, arg_405_1)
		arg_405_1.time_ = 0
		arg_405_1.frameCnt_ = 0
		arg_405_1.state_ = "playing"
		arg_405_1.curTalkId_ = 116431094
		arg_405_1.duration_ = 7.191999999999

		SetActive(arg_405_1.tipsGo_, false)

		function arg_405_1.onSingleLineFinish_()
			arg_405_1.onSingleLineUpdate_ = nil
			arg_405_1.onSingleLineFinish_ = nil
			arg_405_1.state_ = "waiting"
		end

		function arg_405_1.playNext_(arg_407_0)
			if arg_407_0 == 1 then
				arg_405_0:Play116431095(arg_405_1)
			end
		end

		function arg_405_1.onSingleLineUpdate_(arg_408_0)
			local var_408_0 = 0

			if var_408_0 < arg_405_1.time_ and arg_405_1.time_ <= var_408_0 + arg_408_0 then
				arg_405_1.var_.oldValueTypewriter = arg_405_1.fswtw_.percent

				arg_405_1:ShowNextGo(false)
			end

			local var_408_1 = 47
			local var_408_2 = 2
			local var_408_3 = arg_405_1:GetWordFromCfg(116431091)
			local var_408_4 = arg_405_1:FormatText(var_408_3.content)
			local var_408_5, var_408_6 = arg_405_1:GetPercentByPara(var_408_4, 5)

			if var_408_0 < arg_405_1.time_ and arg_405_1.time_ <= var_408_0 + arg_408_0 then
				arg_405_1.talkMaxDuration = 0

				local var_408_7 = var_408_1 <= 0 and var_408_2 or var_408_2 * ((var_408_6 - arg_405_1.typewritterCharCountI18N) / var_408_1)

				if var_408_7 > 0 and var_408_2 < var_408_7 then
					arg_405_1.talkMaxDuration = var_408_7

					if var_408_7 + var_408_0 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_7 + var_408_0
					end
				end
			end

			local var_408_8 = 2
			local var_408_9 = math.max(var_408_8, arg_405_1.talkMaxDuration)

			if var_408_0 <= arg_405_1.time_ and arg_405_1.time_ < var_408_0 + var_408_9 then
				local var_408_10 = (arg_405_1.time_ - var_408_0) / var_408_9

				arg_405_1.fswtw_.percent = Mathf.Lerp(arg_405_1.var_.oldValueTypewriter, var_408_5, var_408_10)
				arg_405_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_405_1.fswtw_:SetDirty()
			end

			if arg_405_1.time_ >= var_408_0 + var_408_9 and arg_405_1.time_ < var_408_0 + var_408_9 + arg_408_0 then
				arg_405_1.fswtw_.percent = var_408_5

				arg_405_1.fswtw_:SetDirty()
				arg_405_1:ShowNextGo(true)

				arg_405_1.typewritterCharCountI18N = var_408_6
			end

			local var_408_11 = 0
			local var_408_12 = 7.192
			local var_408_13 = manager.audio:GetVoiceLength("story_v_out_116431", "116431094", "story_v_out_116431.awb") / 1000

			if var_408_13 > 0 and var_408_12 < var_408_13 and var_408_13 + var_408_11 > arg_405_1.duration_ then
				local var_408_14 = var_408_13

				arg_405_1.duration_ = var_408_13 + var_408_11
			end

			if var_408_11 < arg_405_1.time_ and arg_405_1.time_ <= var_408_11 + arg_408_0 then
				local var_408_15 = "play"
				local var_408_16 = "voice"

				arg_405_1:AudioAction(var_408_15, var_408_16, "story_v_out_116431", "116431094", "story_v_out_116431.awb")
			end

			local var_408_17 = 0

			if var_408_17 < arg_405_1.time_ and arg_405_1.time_ <= var_408_17 + arg_408_0 then
				arg_405_1.allBtn_.enabled = false
			end

			local var_408_18 = 2

			if arg_405_1.time_ >= var_408_17 + var_408_18 and arg_405_1.time_ < var_408_17 + var_408_18 + arg_408_0 then
				arg_405_1.allBtn_.enabled = true
			end
		end
	end,
	Play116431095 = function(arg_409_0, arg_409_1)
		arg_409_1.time_ = 0
		arg_409_1.frameCnt_ = 0
		arg_409_1.state_ = "playing"
		arg_409_1.curTalkId_ = 116431095
		arg_409_1.duration_ = 5

		SetActive(arg_409_1.tipsGo_, false)

		function arg_409_1.onSingleLineFinish_()
			arg_409_1.onSingleLineUpdate_ = nil
			arg_409_1.onSingleLineFinish_ = nil
			arg_409_1.state_ = "waiting"
		end

		function arg_409_1.playNext_(arg_411_0)
			if arg_411_0 == 1 then
				arg_409_0:Play116431096(arg_409_1)
			end
		end

		function arg_409_1.onSingleLineUpdate_(arg_412_0)
			local var_412_0 = 0

			if var_412_0 < arg_409_1.time_ and arg_409_1.time_ <= var_412_0 + arg_412_0 then
				arg_409_1.fswbg_:SetActive(false)
				arg_409_1.dialog_:SetActive(true)
				arg_409_1:ShowNextGo(false)
			end

			local var_412_1 = 0
			local var_412_2 = 0.125

			if var_412_1 < arg_409_1.time_ and arg_409_1.time_ <= var_412_1 + arg_412_0 then
				arg_409_1.talkMaxDuration = 0

				arg_409_1.dialog_:SetActive(true)

				local var_412_3 = LeanTween.value(arg_409_1.dialog_, 0, 1, 0.3)

				var_412_3:setOnUpdate(LuaHelper.FloatAction(function(arg_413_0)
					arg_409_1.dialogCg_.alpha = arg_413_0
				end))
				var_412_3:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_409_1.dialog_)
					var_412_3:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_409_1.duration_ = arg_409_1.duration_ + 0.3

				SetActive(arg_409_1.leftNameGo_, true)

				local var_412_4 = arg_409_1:FormatText(StoryNameCfg[7].name)

				arg_409_1.leftNameTxt_.text = var_412_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_409_1.leftNameTxt_.transform)

				arg_409_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_409_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_409_1:RecordName(arg_409_1.leftNameTxt_.text)
				SetActive(arg_409_1.iconTrs_.gameObject, false)
				arg_409_1.callingController_:SetSelectedState("normal")

				local var_412_5 = arg_409_1:GetWordFromCfg(116431095)
				local var_412_6 = arg_409_1:FormatText(var_412_5.content)

				arg_409_1.text_.text = var_412_6

				LuaForUtil.ClearLinePrefixSymbol(arg_409_1.text_)

				local var_412_7 = 5
				local var_412_8 = utf8.len(var_412_6)
				local var_412_9 = var_412_7 <= 0 and var_412_2 or var_412_2 * (var_412_8 / var_412_7)

				if var_412_9 > 0 and var_412_2 < var_412_9 then
					arg_409_1.talkMaxDuration = var_412_9
					var_412_1 = var_412_1 + 0.3

					if var_412_9 + var_412_1 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_9 + var_412_1
					end
				end

				arg_409_1.text_.text = var_412_6
				arg_409_1.typewritter.percent = 0

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(false)
				arg_409_1:RecordContent(arg_409_1.text_.text)
			end

			local var_412_10 = var_412_1 + 0.3
			local var_412_11 = math.max(var_412_2, arg_409_1.talkMaxDuration)

			if var_412_10 <= arg_409_1.time_ and arg_409_1.time_ < var_412_10 + var_412_11 then
				arg_409_1.typewritter.percent = (arg_409_1.time_ - var_412_10) / var_412_11

				arg_409_1.typewritter:SetDirty()
			end

			if arg_409_1.time_ >= var_412_10 + var_412_11 and arg_409_1.time_ < var_412_10 + var_412_11 + arg_412_0 then
				arg_409_1.typewritter.percent = 1

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(true)
			end
		end
	end,
	Play116431096 = function(arg_415_0, arg_415_1)
		arg_415_1.time_ = 0
		arg_415_1.frameCnt_ = 0
		arg_415_1.state_ = "playing"
		arg_415_1.curTalkId_ = 116431096
		arg_415_1.duration_ = 2.362999999999

		SetActive(arg_415_1.tipsGo_, false)

		function arg_415_1.onSingleLineFinish_()
			arg_415_1.onSingleLineUpdate_ = nil
			arg_415_1.onSingleLineFinish_ = nil
			arg_415_1.state_ = "waiting"
		end

		function arg_415_1.playNext_(arg_417_0)
			if arg_417_0 == 1 then
				arg_415_0:Play116431097(arg_415_1)
			end
		end

		function arg_415_1.onSingleLineUpdate_(arg_418_0)
			local var_418_0 = 0

			if var_418_0 < arg_415_1.time_ and arg_415_1.time_ <= var_418_0 + arg_418_0 then
				arg_415_1.fswbg_:SetActive(true)
				arg_415_1.dialog_:SetActive(false)

				arg_415_1.fswtw_.percent = 0

				local var_418_1 = arg_415_1:GetWordFromCfg(116431096)
				local var_418_2 = arg_415_1:FormatText(var_418_1.content)

				arg_415_1.fswt_.text = var_418_2

				LuaForUtil.ClearLinePrefixSymbol(arg_415_1.fswt_)

				arg_415_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_415_1.fswtw_:SetDirty()

				arg_415_1.typewritterCharCountI18N = 0

				SetActive(arg_415_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_415_1:ShowNextGo(false)
			end

			local var_418_3 = 0.0166666666666667

			if var_418_3 < arg_415_1.time_ and arg_415_1.time_ <= var_418_3 + arg_418_0 then
				arg_415_1.var_.oldValueTypewriter = arg_415_1.fswtw_.percent

				arg_415_1:ShowNextGo(false)
			end

			local var_418_4 = 10
			local var_418_5 = 0.666666666666667
			local var_418_6 = arg_415_1:GetWordFromCfg(116431096)
			local var_418_7 = arg_415_1:FormatText(var_418_6.content)
			local var_418_8, var_418_9 = arg_415_1:GetPercentByPara(var_418_7, 1)

			if var_418_3 < arg_415_1.time_ and arg_415_1.time_ <= var_418_3 + arg_418_0 then
				arg_415_1.talkMaxDuration = 0

				local var_418_10 = var_418_4 <= 0 and var_418_5 or var_418_5 * ((var_418_9 - arg_415_1.typewritterCharCountI18N) / var_418_4)

				if var_418_10 > 0 and var_418_5 < var_418_10 then
					arg_415_1.talkMaxDuration = var_418_10

					if var_418_10 + var_418_3 > arg_415_1.duration_ then
						arg_415_1.duration_ = var_418_10 + var_418_3
					end
				end
			end

			local var_418_11 = 0.666666666666667
			local var_418_12 = math.max(var_418_11, arg_415_1.talkMaxDuration)

			if var_418_3 <= arg_415_1.time_ and arg_415_1.time_ < var_418_3 + var_418_12 then
				local var_418_13 = (arg_415_1.time_ - var_418_3) / var_418_12

				arg_415_1.fswtw_.percent = Mathf.Lerp(arg_415_1.var_.oldValueTypewriter, var_418_8, var_418_13)
				arg_415_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_415_1.fswtw_:SetDirty()
			end

			if arg_415_1.time_ >= var_418_3 + var_418_12 and arg_415_1.time_ < var_418_3 + var_418_12 + arg_418_0 then
				arg_415_1.fswtw_.percent = var_418_8

				arg_415_1.fswtw_:SetDirty()
				arg_415_1:ShowNextGo(true)

				arg_415_1.typewritterCharCountI18N = var_418_9
			end

			local var_418_14 = 0
			local var_418_15 = 2.363
			local var_418_16 = manager.audio:GetVoiceLength("story_v_out_116431", "116431096", "story_v_out_116431.awb") / 1000

			if var_418_16 > 0 and var_418_15 < var_418_16 and var_418_16 + var_418_14 > arg_415_1.duration_ then
				local var_418_17 = var_418_16

				arg_415_1.duration_ = var_418_16 + var_418_14
			end

			if var_418_14 < arg_415_1.time_ and arg_415_1.time_ <= var_418_14 + arg_418_0 then
				local var_418_18 = "play"
				local var_418_19 = "voice"

				arg_415_1:AudioAction(var_418_18, var_418_19, "story_v_out_116431", "116431096", "story_v_out_116431.awb")
			end

			local var_418_20 = 0

			if var_418_20 < arg_415_1.time_ and arg_415_1.time_ <= var_418_20 + arg_418_0 then
				arg_415_1.allBtn_.enabled = false
			end

			local var_418_21 = 0.683333333333333

			if arg_415_1.time_ >= var_418_20 + var_418_21 and arg_415_1.time_ < var_418_20 + var_418_21 + arg_418_0 then
				arg_415_1.allBtn_.enabled = true
			end
		end
	end,
	Play116431097 = function(arg_419_0, arg_419_1)
		arg_419_1.time_ = 0
		arg_419_1.frameCnt_ = 0
		arg_419_1.state_ = "playing"
		arg_419_1.curTalkId_ = 116431097
		arg_419_1.duration_ = 5

		SetActive(arg_419_1.tipsGo_, false)

		function arg_419_1.onSingleLineFinish_()
			arg_419_1.onSingleLineUpdate_ = nil
			arg_419_1.onSingleLineFinish_ = nil
			arg_419_1.state_ = "waiting"
		end

		function arg_419_1.playNext_(arg_421_0)
			if arg_421_0 == 1 then
				arg_419_0:Play116431098(arg_419_1)
			end
		end

		function arg_419_1.onSingleLineUpdate_(arg_422_0)
			local var_422_0 = 0

			if var_422_0 < arg_419_1.time_ and arg_419_1.time_ <= var_422_0 + arg_422_0 then
				arg_419_1.fswbg_:SetActive(false)
				arg_419_1.dialog_:SetActive(true)
				arg_419_1:ShowNextGo(false)
			end

			local var_422_1 = 0
			local var_422_2 = 0.1

			if var_422_1 < arg_419_1.time_ and arg_419_1.time_ <= var_422_1 + arg_422_0 then
				arg_419_1.talkMaxDuration = 0

				arg_419_1.dialog_:SetActive(true)

				local var_422_3 = LeanTween.value(arg_419_1.dialog_, 0, 1, 0.3)

				var_422_3:setOnUpdate(LuaHelper.FloatAction(function(arg_423_0)
					arg_419_1.dialogCg_.alpha = arg_423_0
				end))
				var_422_3:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_419_1.dialog_)
					var_422_3:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_419_1.duration_ = arg_419_1.duration_ + 0.3

				SetActive(arg_419_1.leftNameGo_, true)

				local var_422_4 = arg_419_1:FormatText(StoryNameCfg[7].name)

				arg_419_1.leftNameTxt_.text = var_422_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_419_1.leftNameTxt_.transform)

				arg_419_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_419_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_419_1:RecordName(arg_419_1.leftNameTxt_.text)
				SetActive(arg_419_1.iconTrs_.gameObject, false)
				arg_419_1.callingController_:SetSelectedState("normal")

				local var_422_5 = arg_419_1:GetWordFromCfg(116431097)
				local var_422_6 = arg_419_1:FormatText(var_422_5.content)

				arg_419_1.text_.text = var_422_6

				LuaForUtil.ClearLinePrefixSymbol(arg_419_1.text_)

				local var_422_7 = 4
				local var_422_8 = utf8.len(var_422_6)
				local var_422_9 = var_422_7 <= 0 and var_422_2 or var_422_2 * (var_422_8 / var_422_7)

				if var_422_9 > 0 and var_422_2 < var_422_9 then
					arg_419_1.talkMaxDuration = var_422_9
					var_422_1 = var_422_1 + 0.3

					if var_422_9 + var_422_1 > arg_419_1.duration_ then
						arg_419_1.duration_ = var_422_9 + var_422_1
					end
				end

				arg_419_1.text_.text = var_422_6
				arg_419_1.typewritter.percent = 0

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(false)
				arg_419_1:RecordContent(arg_419_1.text_.text)
			end

			local var_422_10 = var_422_1 + 0.3
			local var_422_11 = math.max(var_422_2, arg_419_1.talkMaxDuration)

			if var_422_10 <= arg_419_1.time_ and arg_419_1.time_ < var_422_10 + var_422_11 then
				arg_419_1.typewritter.percent = (arg_419_1.time_ - var_422_10) / var_422_11

				arg_419_1.typewritter:SetDirty()
			end

			if arg_419_1.time_ >= var_422_10 + var_422_11 and arg_419_1.time_ < var_422_10 + var_422_11 + arg_422_0 then
				arg_419_1.typewritter.percent = 1

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(true)
			end
		end
	end,
	Play116431098 = function(arg_425_0, arg_425_1)
		arg_425_1.time_ = 0
		arg_425_1.frameCnt_ = 0
		arg_425_1.state_ = "playing"
		arg_425_1.curTalkId_ = 116431098
		arg_425_1.duration_ = 5

		SetActive(arg_425_1.tipsGo_, false)

		function arg_425_1.onSingleLineFinish_()
			arg_425_1.onSingleLineUpdate_ = nil
			arg_425_1.onSingleLineFinish_ = nil
			arg_425_1.state_ = "waiting"
		end

		function arg_425_1.playNext_(arg_427_0)
			if arg_427_0 == 1 then
				arg_425_0:Play116431099(arg_425_1)
			end
		end

		function arg_425_1.onSingleLineUpdate_(arg_428_0)
			local var_428_0 = 0
			local var_428_1 = 0.95

			if var_428_0 < arg_425_1.time_ and arg_425_1.time_ <= var_428_0 + arg_428_0 then
				arg_425_1.talkMaxDuration = 0
				arg_425_1.dialogCg_.alpha = 1

				arg_425_1.dialog_:SetActive(true)
				SetActive(arg_425_1.leftNameGo_, true)

				local var_428_2 = arg_425_1:FormatText(StoryNameCfg[7].name)

				arg_425_1.leftNameTxt_.text = var_428_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_425_1.leftNameTxt_.transform)

				arg_425_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_425_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_425_1:RecordName(arg_425_1.leftNameTxt_.text)
				SetActive(arg_425_1.iconTrs_.gameObject, false)
				arg_425_1.callingController_:SetSelectedState("normal")

				local var_428_3 = arg_425_1:GetWordFromCfg(116431098)
				local var_428_4 = arg_425_1:FormatText(var_428_3.content)

				arg_425_1.text_.text = var_428_4

				LuaForUtil.ClearLinePrefixSymbol(arg_425_1.text_)

				local var_428_5 = 38
				local var_428_6 = utf8.len(var_428_4)
				local var_428_7 = var_428_5 <= 0 and var_428_1 or var_428_1 * (var_428_6 / var_428_5)

				if var_428_7 > 0 and var_428_1 < var_428_7 then
					arg_425_1.talkMaxDuration = var_428_7

					if var_428_7 + var_428_0 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_7 + var_428_0
					end
				end

				arg_425_1.text_.text = var_428_4
				arg_425_1.typewritter.percent = 0

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(false)
				arg_425_1:RecordContent(arg_425_1.text_.text)
			end

			local var_428_8 = math.max(var_428_1, arg_425_1.talkMaxDuration)

			if var_428_0 <= arg_425_1.time_ and arg_425_1.time_ < var_428_0 + var_428_8 then
				arg_425_1.typewritter.percent = (arg_425_1.time_ - var_428_0) / var_428_8

				arg_425_1.typewritter:SetDirty()
			end

			if arg_425_1.time_ >= var_428_0 + var_428_8 and arg_425_1.time_ < var_428_0 + var_428_8 + arg_428_0 then
				arg_425_1.typewritter.percent = 1

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(true)
			end
		end
	end,
	Play116431099 = function(arg_429_0, arg_429_1)
		arg_429_1.time_ = 0
		arg_429_1.frameCnt_ = 0
		arg_429_1.state_ = "playing"
		arg_429_1.curTalkId_ = 116431099
		arg_429_1.duration_ = 3.614999999999

		SetActive(arg_429_1.tipsGo_, false)

		function arg_429_1.onSingleLineFinish_()
			arg_429_1.onSingleLineUpdate_ = nil
			arg_429_1.onSingleLineFinish_ = nil
			arg_429_1.state_ = "waiting"
		end

		function arg_429_1.playNext_(arg_431_0)
			if arg_431_0 == 1 then
				arg_429_0:Play116431100(arg_429_1)
			end
		end

		function arg_429_1.onSingleLineUpdate_(arg_432_0)
			local var_432_0 = 0

			if var_432_0 < arg_429_1.time_ and arg_429_1.time_ <= var_432_0 + arg_432_0 then
				arg_429_1.fswbg_:SetActive(true)
				arg_429_1.dialog_:SetActive(false)

				arg_429_1.fswtw_.percent = 0

				local var_432_1 = arg_429_1:GetWordFromCfg(116431099)
				local var_432_2 = arg_429_1:FormatText(var_432_1.content)

				arg_429_1.fswt_.text = var_432_2

				LuaForUtil.ClearLinePrefixSymbol(arg_429_1.fswt_)

				arg_429_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_429_1.fswtw_:SetDirty()

				arg_429_1.typewritterCharCountI18N = 0

				SetActive(arg_429_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_429_1:ShowNextGo(false)
			end

			local var_432_3 = 0.0166666666666667

			if var_432_3 < arg_429_1.time_ and arg_429_1.time_ <= var_432_3 + arg_432_0 then
				arg_429_1.var_.oldValueTypewriter = arg_429_1.fswtw_.percent

				arg_429_1:ShowNextGo(false)
			end

			local var_432_4 = 12
			local var_432_5 = 0.8
			local var_432_6 = arg_429_1:GetWordFromCfg(116431099)
			local var_432_7 = arg_429_1:FormatText(var_432_6.content)
			local var_432_8, var_432_9 = arg_429_1:GetPercentByPara(var_432_7, 1)

			if var_432_3 < arg_429_1.time_ and arg_429_1.time_ <= var_432_3 + arg_432_0 then
				arg_429_1.talkMaxDuration = 0

				local var_432_10 = var_432_4 <= 0 and var_432_5 or var_432_5 * ((var_432_9 - arg_429_1.typewritterCharCountI18N) / var_432_4)

				if var_432_10 > 0 and var_432_5 < var_432_10 then
					arg_429_1.talkMaxDuration = var_432_10

					if var_432_10 + var_432_3 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_10 + var_432_3
					end
				end
			end

			local var_432_11 = 0.8
			local var_432_12 = math.max(var_432_11, arg_429_1.talkMaxDuration)

			if var_432_3 <= arg_429_1.time_ and arg_429_1.time_ < var_432_3 + var_432_12 then
				local var_432_13 = (arg_429_1.time_ - var_432_3) / var_432_12

				arg_429_1.fswtw_.percent = Mathf.Lerp(arg_429_1.var_.oldValueTypewriter, var_432_8, var_432_13)
				arg_429_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_429_1.fswtw_:SetDirty()
			end

			if arg_429_1.time_ >= var_432_3 + var_432_12 and arg_429_1.time_ < var_432_3 + var_432_12 + arg_432_0 then
				arg_429_1.fswtw_.percent = var_432_8

				arg_429_1.fswtw_:SetDirty()
				arg_429_1:ShowNextGo(true)

				arg_429_1.typewritterCharCountI18N = var_432_9
			end

			local var_432_14 = 0
			local var_432_15 = 3.615
			local var_432_16 = manager.audio:GetVoiceLength("story_v_out_116431", "116431099", "story_v_out_116431.awb") / 1000

			if var_432_16 > 0 and var_432_15 < var_432_16 and var_432_16 + var_432_14 > arg_429_1.duration_ then
				local var_432_17 = var_432_16

				arg_429_1.duration_ = var_432_16 + var_432_14
			end

			if var_432_14 < arg_429_1.time_ and arg_429_1.time_ <= var_432_14 + arg_432_0 then
				local var_432_18 = "play"
				local var_432_19 = "voice"

				arg_429_1:AudioAction(var_432_18, var_432_19, "story_v_out_116431", "116431099", "story_v_out_116431.awb")
			end

			local var_432_20 = 0

			if var_432_20 < arg_429_1.time_ and arg_429_1.time_ <= var_432_20 + arg_432_0 then
				arg_429_1.allBtn_.enabled = false
			end

			local var_432_21 = 0.816666666666667

			if arg_429_1.time_ >= var_432_20 + var_432_21 and arg_429_1.time_ < var_432_20 + var_432_21 + arg_432_0 then
				arg_429_1.allBtn_.enabled = true
			end
		end
	end,
	Play116431100 = function(arg_433_0, arg_433_1)
		arg_433_1.time_ = 0
		arg_433_1.frameCnt_ = 0
		arg_433_1.state_ = "playing"
		arg_433_1.curTalkId_ = 116431100
		arg_433_1.duration_ = 0.999999999999

		SetActive(arg_433_1.tipsGo_, false)

		function arg_433_1.onSingleLineFinish_()
			arg_433_1.onSingleLineUpdate_ = nil
			arg_433_1.onSingleLineFinish_ = nil
			arg_433_1.state_ = "waiting"

			SetActive(arg_433_1.choicesGo_, true)

			for iter_434_0, iter_434_1 in ipairs(arg_433_1.choices_) do
				local var_434_0 = iter_434_0 <= 2

				SetActive(iter_434_1.go, var_434_0)
			end

			arg_433_1.choices_[1].txt.text = arg_433_1:FormatText(StoryChoiceCfg[276].name)
			arg_433_1.choices_[2].txt.text = arg_433_1:FormatText(StoryChoiceCfg[276].name)
		end

		function arg_433_1.playNext_(arg_435_0)
			if arg_435_0 == 1 then
				arg_433_0:Play116431101(arg_433_1)
			end

			if arg_435_0 == 2 then
				arg_433_0:Play116431101(arg_433_1)
			end
		end

		function arg_433_1.onSingleLineUpdate_(arg_436_0)
			return
		end
	end,
	Play116431101 = function(arg_437_0, arg_437_1)
		arg_437_1.time_ = 0
		arg_437_1.frameCnt_ = 0
		arg_437_1.state_ = "playing"
		arg_437_1.curTalkId_ = 116431101
		arg_437_1.duration_ = 8.952999999999

		SetActive(arg_437_1.tipsGo_, false)

		function arg_437_1.onSingleLineFinish_()
			arg_437_1.onSingleLineUpdate_ = nil
			arg_437_1.onSingleLineFinish_ = nil
			arg_437_1.state_ = "waiting"
		end

		function arg_437_1.playNext_(arg_439_0)
			if arg_439_0 == 1 then
				arg_437_0:Play116431102(arg_437_1)
			end
		end

		function arg_437_1.onSingleLineUpdate_(arg_440_0)
			local var_440_0 = 0

			if var_440_0 < arg_437_1.time_ and arg_437_1.time_ <= var_440_0 + arg_440_0 then
				arg_437_1.fswbg_:SetActive(true)
				arg_437_1.dialog_:SetActive(false)

				arg_437_1.fswtw_.percent = 0

				local var_440_1 = arg_437_1:GetWordFromCfg(116431101)
				local var_440_2 = arg_437_1:FormatText(var_440_1.content)

				arg_437_1.fswt_.text = var_440_2

				LuaForUtil.ClearLinePrefixSymbol(arg_437_1.fswt_)

				arg_437_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_437_1.fswtw_:SetDirty()

				arg_437_1.typewritterCharCountI18N = 0

				SetActive(arg_437_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_437_1:ShowNextGo(false)
			end

			local var_440_3 = 0.0166666666666667

			if var_440_3 < arg_437_1.time_ and arg_437_1.time_ <= var_440_3 + arg_440_0 then
				arg_437_1.var_.oldValueTypewriter = arg_437_1.fswtw_.percent

				arg_437_1:ShowNextGo(false)
			end

			local var_440_4 = 31
			local var_440_5 = 2.06666666666667
			local var_440_6 = arg_437_1:GetWordFromCfg(116431101)
			local var_440_7 = arg_437_1:FormatText(var_440_6.content)
			local var_440_8, var_440_9 = arg_437_1:GetPercentByPara(var_440_7, 1)

			if var_440_3 < arg_437_1.time_ and arg_437_1.time_ <= var_440_3 + arg_440_0 then
				arg_437_1.talkMaxDuration = 0

				local var_440_10 = var_440_4 <= 0 and var_440_5 or var_440_5 * ((var_440_9 - arg_437_1.typewritterCharCountI18N) / var_440_4)

				if var_440_10 > 0 and var_440_5 < var_440_10 then
					arg_437_1.talkMaxDuration = var_440_10

					if var_440_10 + var_440_3 > arg_437_1.duration_ then
						arg_437_1.duration_ = var_440_10 + var_440_3
					end
				end
			end

			local var_440_11 = 2.06666666666667
			local var_440_12 = math.max(var_440_11, arg_437_1.talkMaxDuration)

			if var_440_3 <= arg_437_1.time_ and arg_437_1.time_ < var_440_3 + var_440_12 then
				local var_440_13 = (arg_437_1.time_ - var_440_3) / var_440_12

				arg_437_1.fswtw_.percent = Mathf.Lerp(arg_437_1.var_.oldValueTypewriter, var_440_8, var_440_13)
				arg_437_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_437_1.fswtw_:SetDirty()
			end

			if arg_437_1.time_ >= var_440_3 + var_440_12 and arg_437_1.time_ < var_440_3 + var_440_12 + arg_440_0 then
				arg_437_1.fswtw_.percent = var_440_8

				arg_437_1.fswtw_:SetDirty()
				arg_437_1:ShowNextGo(true)

				arg_437_1.typewritterCharCountI18N = var_440_9
			end

			local var_440_14 = 0
			local var_440_15 = 8.953
			local var_440_16 = manager.audio:GetVoiceLength("story_v_out_116431", "116431101", "story_v_out_116431.awb") / 1000

			if var_440_16 > 0 and var_440_15 < var_440_16 and var_440_16 + var_440_14 > arg_437_1.duration_ then
				local var_440_17 = var_440_16

				arg_437_1.duration_ = var_440_16 + var_440_14
			end

			if var_440_14 < arg_437_1.time_ and arg_437_1.time_ <= var_440_14 + arg_440_0 then
				local var_440_18 = "play"
				local var_440_19 = "voice"

				arg_437_1:AudioAction(var_440_18, var_440_19, "story_v_out_116431", "116431101", "story_v_out_116431.awb")
			end

			local var_440_20 = 0

			if var_440_20 < arg_437_1.time_ and arg_437_1.time_ <= var_440_20 + arg_440_0 then
				arg_437_1.allBtn_.enabled = false
			end

			local var_440_21 = 2.08333333333333

			if arg_437_1.time_ >= var_440_20 + var_440_21 and arg_437_1.time_ < var_440_20 + var_440_21 + arg_440_0 then
				arg_437_1.allBtn_.enabled = true
			end
		end
	end,
	Play116431102 = function(arg_441_0, arg_441_1)
		arg_441_1.time_ = 0
		arg_441_1.frameCnt_ = 0
		arg_441_1.state_ = "playing"
		arg_441_1.curTalkId_ = 116431102
		arg_441_1.duration_ = 13.081999999999

		SetActive(arg_441_1.tipsGo_, false)

		function arg_441_1.onSingleLineFinish_()
			arg_441_1.onSingleLineUpdate_ = nil
			arg_441_1.onSingleLineFinish_ = nil
			arg_441_1.state_ = "waiting"
		end

		function arg_441_1.playNext_(arg_443_0)
			if arg_443_0 == 1 then
				arg_441_0:Play116431103(arg_441_1)
			end
		end

		function arg_441_1.onSingleLineUpdate_(arg_444_0)
			local var_444_0 = 0

			if var_444_0 < arg_441_1.time_ and arg_441_1.time_ <= var_444_0 + arg_444_0 then
				arg_441_1.var_.oldValueTypewriter = arg_441_1.fswtw_.percent

				arg_441_1:ShowNextGo(false)
			end

			local var_444_1 = 51
			local var_444_2 = 3.4
			local var_444_3 = arg_441_1:GetWordFromCfg(116431101)
			local var_444_4 = arg_441_1:FormatText(var_444_3.content)
			local var_444_5, var_444_6 = arg_441_1:GetPercentByPara(var_444_4, 3)

			if var_444_0 < arg_441_1.time_ and arg_441_1.time_ <= var_444_0 + arg_444_0 then
				arg_441_1.talkMaxDuration = 0

				local var_444_7 = var_444_1 <= 0 and var_444_2 or var_444_2 * ((var_444_6 - arg_441_1.typewritterCharCountI18N) / var_444_1)

				if var_444_7 > 0 and var_444_2 < var_444_7 then
					arg_441_1.talkMaxDuration = var_444_7

					if var_444_7 + var_444_0 > arg_441_1.duration_ then
						arg_441_1.duration_ = var_444_7 + var_444_0
					end
				end
			end

			local var_444_8 = 3.4
			local var_444_9 = math.max(var_444_8, arg_441_1.talkMaxDuration)

			if var_444_0 <= arg_441_1.time_ and arg_441_1.time_ < var_444_0 + var_444_9 then
				local var_444_10 = (arg_441_1.time_ - var_444_0) / var_444_9

				arg_441_1.fswtw_.percent = Mathf.Lerp(arg_441_1.var_.oldValueTypewriter, var_444_5, var_444_10)
				arg_441_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_441_1.fswtw_:SetDirty()
			end

			if arg_441_1.time_ >= var_444_0 + var_444_9 and arg_441_1.time_ < var_444_0 + var_444_9 + arg_444_0 then
				arg_441_1.fswtw_.percent = var_444_5

				arg_441_1.fswtw_:SetDirty()
				arg_441_1:ShowNextGo(true)

				arg_441_1.typewritterCharCountI18N = var_444_6
			end

			local var_444_11 = 0
			local var_444_12 = 13.082
			local var_444_13 = manager.audio:GetVoiceLength("story_v_out_116431", "116431102", "story_v_out_116431.awb") / 1000

			if var_444_13 > 0 and var_444_12 < var_444_13 and var_444_13 + var_444_11 > arg_441_1.duration_ then
				local var_444_14 = var_444_13

				arg_441_1.duration_ = var_444_13 + var_444_11
			end

			if var_444_11 < arg_441_1.time_ and arg_441_1.time_ <= var_444_11 + arg_444_0 then
				local var_444_15 = "play"
				local var_444_16 = "voice"

				arg_441_1:AudioAction(var_444_15, var_444_16, "story_v_out_116431", "116431102", "story_v_out_116431.awb")
			end

			local var_444_17 = 0

			if var_444_17 < arg_441_1.time_ and arg_441_1.time_ <= var_444_17 + arg_444_0 then
				arg_441_1.allBtn_.enabled = false
			end

			local var_444_18 = 3.4

			if arg_441_1.time_ >= var_444_17 + var_444_18 and arg_441_1.time_ < var_444_17 + var_444_18 + arg_444_0 then
				arg_441_1.allBtn_.enabled = true
			end
		end
	end,
	Play116431103 = function(arg_445_0, arg_445_1)
		arg_445_1.time_ = 0
		arg_445_1.frameCnt_ = 0
		arg_445_1.state_ = "playing"
		arg_445_1.curTalkId_ = 116431103
		arg_445_1.duration_ = 5

		SetActive(arg_445_1.tipsGo_, false)

		function arg_445_1.onSingleLineFinish_()
			arg_445_1.onSingleLineUpdate_ = nil
			arg_445_1.onSingleLineFinish_ = nil
			arg_445_1.state_ = "waiting"
		end

		function arg_445_1.playNext_(arg_447_0)
			if arg_447_0 == 1 then
				arg_445_0:Play116431104(arg_445_1)
			end
		end

		function arg_445_1.onSingleLineUpdate_(arg_448_0)
			local var_448_0 = 0

			if var_448_0 < arg_445_1.time_ and arg_445_1.time_ <= var_448_0 + arg_448_0 then
				arg_445_1.fswbg_:SetActive(false)
				arg_445_1.dialog_:SetActive(true)
				arg_445_1:ShowNextGo(false)
			end

			local var_448_1 = 0
			local var_448_2 = 0.175

			if var_448_1 < arg_445_1.time_ and arg_445_1.time_ <= var_448_1 + arg_448_0 then
				arg_445_1.talkMaxDuration = 0

				arg_445_1.dialog_:SetActive(true)

				local var_448_3 = LeanTween.value(arg_445_1.dialog_, 0, 1, 0.3)

				var_448_3:setOnUpdate(LuaHelper.FloatAction(function(arg_449_0)
					arg_445_1.dialogCg_.alpha = arg_449_0
				end))
				var_448_3:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_445_1.dialog_)
					var_448_3:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_445_1.duration_ = arg_445_1.duration_ + 0.3

				SetActive(arg_445_1.leftNameGo_, true)

				local var_448_4 = arg_445_1:FormatText(StoryNameCfg[7].name)

				arg_445_1.leftNameTxt_.text = var_448_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_445_1.leftNameTxt_.transform)

				arg_445_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_445_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_445_1:RecordName(arg_445_1.leftNameTxt_.text)
				SetActive(arg_445_1.iconTrs_.gameObject, false)
				arg_445_1.callingController_:SetSelectedState("normal")

				local var_448_5 = arg_445_1:GetWordFromCfg(116431103)
				local var_448_6 = arg_445_1:FormatText(var_448_5.content)

				arg_445_1.text_.text = var_448_6

				LuaForUtil.ClearLinePrefixSymbol(arg_445_1.text_)

				local var_448_7 = 7
				local var_448_8 = utf8.len(var_448_6)
				local var_448_9 = var_448_7 <= 0 and var_448_2 or var_448_2 * (var_448_8 / var_448_7)

				if var_448_9 > 0 and var_448_2 < var_448_9 then
					arg_445_1.talkMaxDuration = var_448_9
					var_448_1 = var_448_1 + 0.3

					if var_448_9 + var_448_1 > arg_445_1.duration_ then
						arg_445_1.duration_ = var_448_9 + var_448_1
					end
				end

				arg_445_1.text_.text = var_448_6
				arg_445_1.typewritter.percent = 0

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(false)
				arg_445_1:RecordContent(arg_445_1.text_.text)
			end

			local var_448_10 = var_448_1 + 0.3
			local var_448_11 = math.max(var_448_2, arg_445_1.talkMaxDuration)

			if var_448_10 <= arg_445_1.time_ and arg_445_1.time_ < var_448_10 + var_448_11 then
				arg_445_1.typewritter.percent = (arg_445_1.time_ - var_448_10) / var_448_11

				arg_445_1.typewritter:SetDirty()
			end

			if arg_445_1.time_ >= var_448_10 + var_448_11 and arg_445_1.time_ < var_448_10 + var_448_11 + arg_448_0 then
				arg_445_1.typewritter.percent = 1

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(true)
			end
		end
	end,
	Play116431104 = function(arg_451_0, arg_451_1)
		arg_451_1.time_ = 0
		arg_451_1.frameCnt_ = 0
		arg_451_1.state_ = "playing"
		arg_451_1.curTalkId_ = 116431104
		arg_451_1.duration_ = 11.867999999999

		SetActive(arg_451_1.tipsGo_, false)

		function arg_451_1.onSingleLineFinish_()
			arg_451_1.onSingleLineUpdate_ = nil
			arg_451_1.onSingleLineFinish_ = nil
			arg_451_1.state_ = "waiting"
		end

		function arg_451_1.playNext_(arg_453_0)
			if arg_453_0 == 1 then
				arg_451_0:Play116431105(arg_451_1)
			end
		end

		function arg_451_1.onSingleLineUpdate_(arg_454_0)
			local var_454_0 = 0

			if var_454_0 < arg_451_1.time_ and arg_451_1.time_ <= var_454_0 + arg_454_0 then
				arg_451_1.fswbg_:SetActive(true)
				arg_451_1.dialog_:SetActive(false)

				arg_451_1.fswtw_.percent = 0

				local var_454_1 = arg_451_1:GetWordFromCfg(116431104)
				local var_454_2 = arg_451_1:FormatText(var_454_1.content)

				arg_451_1.fswt_.text = var_454_2

				LuaForUtil.ClearLinePrefixSymbol(arg_451_1.fswt_)

				arg_451_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_451_1.fswtw_:SetDirty()

				arg_451_1.typewritterCharCountI18N = 0

				SetActive(arg_451_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_451_1:ShowNextGo(false)
			end

			local var_454_3 = 0.0166666666666667

			if var_454_3 < arg_451_1.time_ and arg_451_1.time_ <= var_454_3 + arg_454_0 then
				arg_451_1.var_.oldValueTypewriter = arg_451_1.fswtw_.percent

				arg_451_1:ShowNextGo(false)
			end

			local var_454_4 = 50
			local var_454_5 = 3.33333333333333
			local var_454_6 = arg_451_1:GetWordFromCfg(116431104)
			local var_454_7 = arg_451_1:FormatText(var_454_6.content)
			local var_454_8, var_454_9 = arg_451_1:GetPercentByPara(var_454_7, 1)

			if var_454_3 < arg_451_1.time_ and arg_451_1.time_ <= var_454_3 + arg_454_0 then
				arg_451_1.talkMaxDuration = 0

				local var_454_10 = var_454_4 <= 0 and var_454_5 or var_454_5 * ((var_454_9 - arg_451_1.typewritterCharCountI18N) / var_454_4)

				if var_454_10 > 0 and var_454_5 < var_454_10 then
					arg_451_1.talkMaxDuration = var_454_10

					if var_454_10 + var_454_3 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_10 + var_454_3
					end
				end
			end

			local var_454_11 = 3.33333333333333
			local var_454_12 = math.max(var_454_11, arg_451_1.talkMaxDuration)

			if var_454_3 <= arg_451_1.time_ and arg_451_1.time_ < var_454_3 + var_454_12 then
				local var_454_13 = (arg_451_1.time_ - var_454_3) / var_454_12

				arg_451_1.fswtw_.percent = Mathf.Lerp(arg_451_1.var_.oldValueTypewriter, var_454_8, var_454_13)
				arg_451_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_451_1.fswtw_:SetDirty()
			end

			if arg_451_1.time_ >= var_454_3 + var_454_12 and arg_451_1.time_ < var_454_3 + var_454_12 + arg_454_0 then
				arg_451_1.fswtw_.percent = var_454_8

				arg_451_1.fswtw_:SetDirty()
				arg_451_1:ShowNextGo(true)

				arg_451_1.typewritterCharCountI18N = var_454_9
			end

			local var_454_14 = 0
			local var_454_15 = 11.868
			local var_454_16 = manager.audio:GetVoiceLength("story_v_out_116431", "116431104", "story_v_out_116431.awb") / 1000

			if var_454_16 > 0 and var_454_15 < var_454_16 and var_454_16 + var_454_14 > arg_451_1.duration_ then
				local var_454_17 = var_454_16

				arg_451_1.duration_ = var_454_16 + var_454_14
			end

			if var_454_14 < arg_451_1.time_ and arg_451_1.time_ <= var_454_14 + arg_454_0 then
				local var_454_18 = "play"
				local var_454_19 = "voice"

				arg_451_1:AudioAction(var_454_18, var_454_19, "story_v_out_116431", "116431104", "story_v_out_116431.awb")
			end

			local var_454_20 = 0

			if var_454_20 < arg_451_1.time_ and arg_451_1.time_ <= var_454_20 + arg_454_0 then
				arg_451_1.allBtn_.enabled = false
			end

			local var_454_21 = 3.35

			if arg_451_1.time_ >= var_454_20 + var_454_21 and arg_451_1.time_ < var_454_20 + var_454_21 + arg_454_0 then
				arg_451_1.allBtn_.enabled = true
			end
		end
	end,
	Play116431105 = function(arg_455_0, arg_455_1)
		arg_455_1.time_ = 0
		arg_455_1.frameCnt_ = 0
		arg_455_1.state_ = "playing"
		arg_455_1.curTalkId_ = 116431105
		arg_455_1.duration_ = 6.262999999999

		SetActive(arg_455_1.tipsGo_, false)

		function arg_455_1.onSingleLineFinish_()
			arg_455_1.onSingleLineUpdate_ = nil
			arg_455_1.onSingleLineFinish_ = nil
			arg_455_1.state_ = "waiting"
		end

		function arg_455_1.playNext_(arg_457_0)
			if arg_457_0 == 1 then
				arg_455_0:Play116431106(arg_455_1)
			end
		end

		function arg_455_1.onSingleLineUpdate_(arg_458_0)
			local var_458_0 = 0

			if var_458_0 < arg_455_1.time_ and arg_455_1.time_ <= var_458_0 + arg_458_0 then
				arg_455_1.var_.oldValueTypewriter = arg_455_1.fswtw_.percent

				arg_455_1:ShowNextGo(false)
			end

			local var_458_1 = 28
			local var_458_2 = 1.86666666666667
			local var_458_3 = arg_455_1:GetWordFromCfg(116431104)
			local var_458_4 = arg_455_1:FormatText(var_458_3.content)
			local var_458_5, var_458_6 = arg_455_1:GetPercentByPara(var_458_4, 2)

			if var_458_0 < arg_455_1.time_ and arg_455_1.time_ <= var_458_0 + arg_458_0 then
				arg_455_1.talkMaxDuration = 0

				local var_458_7 = var_458_1 <= 0 and var_458_2 or var_458_2 * ((var_458_6 - arg_455_1.typewritterCharCountI18N) / var_458_1)

				if var_458_7 > 0 and var_458_2 < var_458_7 then
					arg_455_1.talkMaxDuration = var_458_7

					if var_458_7 + var_458_0 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_7 + var_458_0
					end
				end
			end

			local var_458_8 = 1.86666666666667
			local var_458_9 = math.max(var_458_8, arg_455_1.talkMaxDuration)

			if var_458_0 <= arg_455_1.time_ and arg_455_1.time_ < var_458_0 + var_458_9 then
				local var_458_10 = (arg_455_1.time_ - var_458_0) / var_458_9

				arg_455_1.fswtw_.percent = Mathf.Lerp(arg_455_1.var_.oldValueTypewriter, var_458_5, var_458_10)
				arg_455_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_455_1.fswtw_:SetDirty()
			end

			if arg_455_1.time_ >= var_458_0 + var_458_9 and arg_455_1.time_ < var_458_0 + var_458_9 + arg_458_0 then
				arg_455_1.fswtw_.percent = var_458_5

				arg_455_1.fswtw_:SetDirty()
				arg_455_1:ShowNextGo(true)

				arg_455_1.typewritterCharCountI18N = var_458_6
			end

			local var_458_11 = 0
			local var_458_12 = 6.263
			local var_458_13 = manager.audio:GetVoiceLength("story_v_out_116431", "116431105", "story_v_out_116431.awb") / 1000

			if var_458_13 > 0 and var_458_12 < var_458_13 and var_458_13 + var_458_11 > arg_455_1.duration_ then
				local var_458_14 = var_458_13

				arg_455_1.duration_ = var_458_13 + var_458_11
			end

			if var_458_11 < arg_455_1.time_ and arg_455_1.time_ <= var_458_11 + arg_458_0 then
				local var_458_15 = "play"
				local var_458_16 = "voice"

				arg_455_1:AudioAction(var_458_15, var_458_16, "story_v_out_116431", "116431105", "story_v_out_116431.awb")
			end

			local var_458_17 = 0

			if var_458_17 < arg_455_1.time_ and arg_455_1.time_ <= var_458_17 + arg_458_0 then
				arg_455_1.allBtn_.enabled = false
			end

			local var_458_18 = 1.86666666666667

			if arg_455_1.time_ >= var_458_17 + var_458_18 and arg_455_1.time_ < var_458_17 + var_458_18 + arg_458_0 then
				arg_455_1.allBtn_.enabled = true
			end
		end
	end,
	Play116431106 = function(arg_459_0, arg_459_1)
		arg_459_1.time_ = 0
		arg_459_1.frameCnt_ = 0
		arg_459_1.state_ = "playing"
		arg_459_1.curTalkId_ = 116431106
		arg_459_1.duration_ = 8.708999999999

		SetActive(arg_459_1.tipsGo_, false)

		function arg_459_1.onSingleLineFinish_()
			arg_459_1.onSingleLineUpdate_ = nil
			arg_459_1.onSingleLineFinish_ = nil
			arg_459_1.state_ = "waiting"
		end

		function arg_459_1.playNext_(arg_461_0)
			if arg_461_0 == 1 then
				arg_459_0:Play116431107(arg_459_1)
			end
		end

		function arg_459_1.onSingleLineUpdate_(arg_462_0)
			local var_462_0 = 0

			if var_462_0 < arg_459_1.time_ and arg_459_1.time_ <= var_462_0 + arg_462_0 then
				arg_459_1.var_.oldValueTypewriter = arg_459_1.fswtw_.percent

				arg_459_1:ShowNextGo(false)
			end

			local var_462_1 = 35
			local var_462_2 = 2.33333333333333
			local var_462_3 = arg_459_1:GetWordFromCfg(116431104)
			local var_462_4 = arg_459_1:FormatText(var_462_3.content)
			local var_462_5, var_462_6 = arg_459_1:GetPercentByPara(var_462_4, 3)

			if var_462_0 < arg_459_1.time_ and arg_459_1.time_ <= var_462_0 + arg_462_0 then
				arg_459_1.talkMaxDuration = 0

				local var_462_7 = var_462_1 <= 0 and var_462_2 or var_462_2 * ((var_462_6 - arg_459_1.typewritterCharCountI18N) / var_462_1)

				if var_462_7 > 0 and var_462_2 < var_462_7 then
					arg_459_1.talkMaxDuration = var_462_7

					if var_462_7 + var_462_0 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_7 + var_462_0
					end
				end
			end

			local var_462_8 = 2.33333333333333
			local var_462_9 = math.max(var_462_8, arg_459_1.talkMaxDuration)

			if var_462_0 <= arg_459_1.time_ and arg_459_1.time_ < var_462_0 + var_462_9 then
				local var_462_10 = (arg_459_1.time_ - var_462_0) / var_462_9

				arg_459_1.fswtw_.percent = Mathf.Lerp(arg_459_1.var_.oldValueTypewriter, var_462_5, var_462_10)
				arg_459_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_459_1.fswtw_:SetDirty()
			end

			if arg_459_1.time_ >= var_462_0 + var_462_9 and arg_459_1.time_ < var_462_0 + var_462_9 + arg_462_0 then
				arg_459_1.fswtw_.percent = var_462_5

				arg_459_1.fswtw_:SetDirty()
				arg_459_1:ShowNextGo(true)

				arg_459_1.typewritterCharCountI18N = var_462_6
			end

			local var_462_11 = 0
			local var_462_12 = 8.709
			local var_462_13 = manager.audio:GetVoiceLength("story_v_out_116431", "116431106", "story_v_out_116431.awb") / 1000

			if var_462_13 > 0 and var_462_12 < var_462_13 and var_462_13 + var_462_11 > arg_459_1.duration_ then
				local var_462_14 = var_462_13

				arg_459_1.duration_ = var_462_13 + var_462_11
			end

			if var_462_11 < arg_459_1.time_ and arg_459_1.time_ <= var_462_11 + arg_462_0 then
				local var_462_15 = "play"
				local var_462_16 = "voice"

				arg_459_1:AudioAction(var_462_15, var_462_16, "story_v_out_116431", "116431106", "story_v_out_116431.awb")
			end

			local var_462_17 = 0

			if var_462_17 < arg_459_1.time_ and arg_459_1.time_ <= var_462_17 + arg_462_0 then
				arg_459_1.allBtn_.enabled = false
			end

			local var_462_18 = 2.33333333333333

			if arg_459_1.time_ >= var_462_17 + var_462_18 and arg_459_1.time_ < var_462_17 + var_462_18 + arg_462_0 then
				arg_459_1.allBtn_.enabled = true
			end
		end
	end,
	Play116431107 = function(arg_463_0, arg_463_1)
		arg_463_1.time_ = 0
		arg_463_1.frameCnt_ = 0
		arg_463_1.state_ = "playing"
		arg_463_1.curTalkId_ = 116431107
		arg_463_1.duration_ = 5.566999999999

		SetActive(arg_463_1.tipsGo_, false)

		function arg_463_1.onSingleLineFinish_()
			arg_463_1.onSingleLineUpdate_ = nil
			arg_463_1.onSingleLineFinish_ = nil
			arg_463_1.state_ = "waiting"
		end

		function arg_463_1.playNext_(arg_465_0)
			if arg_465_0 == 1 then
				arg_463_0:Play116431108(arg_463_1)
			end
		end

		function arg_463_1.onSingleLineUpdate_(arg_466_0)
			local var_466_0 = 0

			if var_466_0 < arg_463_1.time_ and arg_463_1.time_ <= var_466_0 + arg_466_0 then
				arg_463_1.var_.oldValueTypewriter = arg_463_1.fswtw_.percent

				arg_463_1:ShowNextGo(false)
			end

			local var_466_1 = 19
			local var_466_2 = 1.26666666666667
			local var_466_3 = arg_463_1:GetWordFromCfg(116431104)
			local var_466_4 = arg_463_1:FormatText(var_466_3.content)
			local var_466_5, var_466_6 = arg_463_1:GetPercentByPara(var_466_4, 4)

			if var_466_0 < arg_463_1.time_ and arg_463_1.time_ <= var_466_0 + arg_466_0 then
				arg_463_1.talkMaxDuration = 0

				local var_466_7 = var_466_1 <= 0 and var_466_2 or var_466_2 * ((var_466_6 - arg_463_1.typewritterCharCountI18N) / var_466_1)

				if var_466_7 > 0 and var_466_2 < var_466_7 then
					arg_463_1.talkMaxDuration = var_466_7

					if var_466_7 + var_466_0 > arg_463_1.duration_ then
						arg_463_1.duration_ = var_466_7 + var_466_0
					end
				end
			end

			local var_466_8 = 1.26666666666667
			local var_466_9 = math.max(var_466_8, arg_463_1.talkMaxDuration)

			if var_466_0 <= arg_463_1.time_ and arg_463_1.time_ < var_466_0 + var_466_9 then
				local var_466_10 = (arg_463_1.time_ - var_466_0) / var_466_9

				arg_463_1.fswtw_.percent = Mathf.Lerp(arg_463_1.var_.oldValueTypewriter, var_466_5, var_466_10)
				arg_463_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_463_1.fswtw_:SetDirty()
			end

			if arg_463_1.time_ >= var_466_0 + var_466_9 and arg_463_1.time_ < var_466_0 + var_466_9 + arg_466_0 then
				arg_463_1.fswtw_.percent = var_466_5

				arg_463_1.fswtw_:SetDirty()
				arg_463_1:ShowNextGo(true)

				arg_463_1.typewritterCharCountI18N = var_466_6
			end

			local var_466_11 = 0
			local var_466_12 = 5.567
			local var_466_13 = manager.audio:GetVoiceLength("story_v_out_116431", "116431107", "story_v_out_116431.awb") / 1000

			if var_466_13 > 0 and var_466_12 < var_466_13 and var_466_13 + var_466_11 > arg_463_1.duration_ then
				local var_466_14 = var_466_13

				arg_463_1.duration_ = var_466_13 + var_466_11
			end

			if var_466_11 < arg_463_1.time_ and arg_463_1.time_ <= var_466_11 + arg_466_0 then
				local var_466_15 = "play"
				local var_466_16 = "voice"

				arg_463_1:AudioAction(var_466_15, var_466_16, "story_v_out_116431", "116431107", "story_v_out_116431.awb")
			end

			local var_466_17 = 0

			if var_466_17 < arg_463_1.time_ and arg_463_1.time_ <= var_466_17 + arg_466_0 then
				arg_463_1.allBtn_.enabled = false
			end

			local var_466_18 = 1.26666666666667

			if arg_463_1.time_ >= var_466_17 + var_466_18 and arg_463_1.time_ < var_466_17 + var_466_18 + arg_466_0 then
				arg_463_1.allBtn_.enabled = true
			end
		end
	end,
	Play116431108 = function(arg_467_0, arg_467_1)
		arg_467_1.time_ = 0
		arg_467_1.frameCnt_ = 0
		arg_467_1.state_ = "playing"
		arg_467_1.curTalkId_ = 116431108
		arg_467_1.duration_ = 0.499999999999

		SetActive(arg_467_1.tipsGo_, false)

		function arg_467_1.onSingleLineFinish_()
			arg_467_1.onSingleLineUpdate_ = nil
			arg_467_1.onSingleLineFinish_ = nil
			arg_467_1.state_ = "waiting"

			SetActive(arg_467_1.choicesGo_, true)

			for iter_468_0, iter_468_1 in ipairs(arg_467_1.choices_) do
				local var_468_0 = iter_468_0 <= 1

				SetActive(iter_468_1.go, var_468_0)
			end

			arg_467_1.choices_[1].txt.text = arg_467_1:FormatText(StoryChoiceCfg[277].name)
		end

		function arg_467_1.playNext_(arg_469_0)
			if arg_469_0 == 1 then
				arg_467_0:Play116431109(arg_467_1)
			end
		end

		function arg_467_1.onSingleLineUpdate_(arg_470_0)
			return
		end
	end,
	Play116431109 = function(arg_471_0, arg_471_1)
		arg_471_1.time_ = 0
		arg_471_1.frameCnt_ = 0
		arg_471_1.state_ = "playing"
		arg_471_1.curTalkId_ = 116431109
		arg_471_1.duration_ = 11.766

		local var_471_0 = {
			zh = 10.333,
			ja = 11.766
		}
		local var_471_1 = manager.audio:GetLocalizationFlag()

		if var_471_0[var_471_1] ~= nil then
			arg_471_1.duration_ = var_471_0[var_471_1]
		end

		SetActive(arg_471_1.tipsGo_, false)

		function arg_471_1.onSingleLineFinish_()
			arg_471_1.onSingleLineUpdate_ = nil
			arg_471_1.onSingleLineFinish_ = nil
			arg_471_1.state_ = "waiting"
		end

		function arg_471_1.playNext_(arg_473_0)
			if arg_473_0 == 1 then
				arg_471_0:Play116431110(arg_471_1)
			end
		end

		function arg_471_1.onSingleLineUpdate_(arg_474_0)
			local var_474_0 = 2

			if var_474_0 < arg_471_1.time_ and arg_471_1.time_ <= var_474_0 + arg_474_0 then
				local var_474_1 = manager.ui.mainCamera.transform.localPosition
				local var_474_2 = Vector3.New(0, 0, 10) + Vector3.New(var_474_1.x, var_474_1.y, 0)
				local var_474_3 = arg_471_1.bgs_.A00

				var_474_3.transform.localPosition = var_474_2
				var_474_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_474_4 = var_474_3:GetComponent("SpriteRenderer")

				if var_474_4 and var_474_4.sprite then
					local var_474_5 = (var_474_3.transform.localPosition - var_474_1).z
					local var_474_6 = manager.ui.mainCameraCom_
					local var_474_7 = 2 * var_474_5 * Mathf.Tan(var_474_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_474_8 = var_474_7 * var_474_6.aspect
					local var_474_9 = var_474_4.sprite.bounds.size.x
					local var_474_10 = var_474_4.sprite.bounds.size.y
					local var_474_11 = var_474_8 / var_474_9
					local var_474_12 = var_474_7 / var_474_10
					local var_474_13 = var_474_12 < var_474_11 and var_474_11 or var_474_12

					var_474_3.transform.localScale = Vector3.New(var_474_13, var_474_13, 0)
				end

				for iter_474_0, iter_474_1 in pairs(arg_471_1.bgs_) do
					if iter_474_0 ~= "A00" then
						iter_474_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_474_14 = 2

			if var_474_14 < arg_471_1.time_ and arg_471_1.time_ <= var_474_14 + arg_474_0 then
				arg_471_1.mask_.enabled = true
				arg_471_1.mask_.raycastTarget = true

				arg_471_1:SetGaussion(false)
			end

			local var_474_15 = 2

			if var_474_14 <= arg_471_1.time_ and arg_471_1.time_ < var_474_14 + var_474_15 then
				local var_474_16 = (arg_471_1.time_ - var_474_14) / var_474_15
				local var_474_17 = Color.New(0, 0, 0)

				var_474_17.a = Mathf.Lerp(1, 0, var_474_16)
				arg_471_1.mask_.color = var_474_17
			end

			if arg_471_1.time_ >= var_474_14 + var_474_15 and arg_471_1.time_ < var_474_14 + var_474_15 + arg_474_0 then
				local var_474_18 = Color.New(0, 0, 0)
				local var_474_19 = 0

				arg_471_1.mask_.enabled = false
				var_474_18.a = var_474_19
				arg_471_1.mask_.color = var_474_18
			end

			local var_474_20 = 0

			if var_474_20 < arg_471_1.time_ and arg_471_1.time_ <= var_474_20 + arg_474_0 then
				arg_471_1.mask_.enabled = true
				arg_471_1.mask_.raycastTarget = true

				arg_471_1:SetGaussion(false)
			end

			local var_474_21 = 2

			if var_474_20 <= arg_471_1.time_ and arg_471_1.time_ < var_474_20 + var_474_21 then
				local var_474_22 = (arg_471_1.time_ - var_474_20) / var_474_21
				local var_474_23 = Color.New(0, 0, 0)

				var_474_23.a = Mathf.Lerp(0, 1, var_474_22)
				arg_471_1.mask_.color = var_474_23
			end

			if arg_471_1.time_ >= var_474_20 + var_474_21 and arg_471_1.time_ < var_474_20 + var_474_21 + arg_474_0 then
				local var_474_24 = Color.New(0, 0, 0)

				var_474_24.a = 1
				arg_471_1.mask_.color = var_474_24
			end

			local var_474_25 = arg_471_1.actors_["1019ui_story"].transform
			local var_474_26 = 4

			if var_474_26 < arg_471_1.time_ and arg_471_1.time_ <= var_474_26 + arg_474_0 then
				arg_471_1.var_.moveOldPos1019ui_story = var_474_25.localPosition
			end

			local var_474_27 = 0.001

			if var_474_26 <= arg_471_1.time_ and arg_471_1.time_ < var_474_26 + var_474_27 then
				local var_474_28 = (arg_471_1.time_ - var_474_26) / var_474_27
				local var_474_29 = Vector3.New(-0.7, -1.08, -5.9)

				var_474_25.localPosition = Vector3.Lerp(arg_471_1.var_.moveOldPos1019ui_story, var_474_29, var_474_28)

				local var_474_30 = manager.ui.mainCamera.transform.position - var_474_25.position

				var_474_25.forward = Vector3.New(var_474_30.x, var_474_30.y, var_474_30.z)

				local var_474_31 = var_474_25.localEulerAngles

				var_474_31.z = 0
				var_474_31.x = 0
				var_474_25.localEulerAngles = var_474_31
			end

			if arg_471_1.time_ >= var_474_26 + var_474_27 and arg_471_1.time_ < var_474_26 + var_474_27 + arg_474_0 then
				var_474_25.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_474_32 = manager.ui.mainCamera.transform.position - var_474_25.position

				var_474_25.forward = Vector3.New(var_474_32.x, var_474_32.y, var_474_32.z)

				local var_474_33 = var_474_25.localEulerAngles

				var_474_33.z = 0
				var_474_33.x = 0
				var_474_25.localEulerAngles = var_474_33
			end

			local var_474_34 = arg_471_1.actors_["1029ui_story"].transform
			local var_474_35 = 4

			if var_474_35 < arg_471_1.time_ and arg_471_1.time_ <= var_474_35 + arg_474_0 then
				arg_471_1.var_.moveOldPos1029ui_story = var_474_34.localPosition
			end

			local var_474_36 = 0.001

			if var_474_35 <= arg_471_1.time_ and arg_471_1.time_ < var_474_35 + var_474_36 then
				local var_474_37 = (arg_471_1.time_ - var_474_35) / var_474_36
				local var_474_38 = Vector3.New(0.7, -1.09, -6.2)

				var_474_34.localPosition = Vector3.Lerp(arg_471_1.var_.moveOldPos1029ui_story, var_474_38, var_474_37)

				local var_474_39 = manager.ui.mainCamera.transform.position - var_474_34.position

				var_474_34.forward = Vector3.New(var_474_39.x, var_474_39.y, var_474_39.z)

				local var_474_40 = var_474_34.localEulerAngles

				var_474_40.z = 0
				var_474_40.x = 0
				var_474_34.localEulerAngles = var_474_40
			end

			if arg_471_1.time_ >= var_474_35 + var_474_36 and arg_471_1.time_ < var_474_35 + var_474_36 + arg_474_0 then
				var_474_34.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_474_41 = manager.ui.mainCamera.transform.position - var_474_34.position

				var_474_34.forward = Vector3.New(var_474_41.x, var_474_41.y, var_474_41.z)

				local var_474_42 = var_474_34.localEulerAngles

				var_474_42.z = 0
				var_474_42.x = 0
				var_474_34.localEulerAngles = var_474_42
			end

			local var_474_43 = arg_471_1.actors_["1019ui_story"]
			local var_474_44 = 4

			if var_474_44 < arg_471_1.time_ and arg_471_1.time_ <= var_474_44 + arg_474_0 and arg_471_1.var_.characterEffect1019ui_story == nil then
				arg_471_1.var_.characterEffect1019ui_story = var_474_43:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_474_45 = 0.2

			if var_474_44 <= arg_471_1.time_ and arg_471_1.time_ < var_474_44 + var_474_45 then
				local var_474_46 = (arg_471_1.time_ - var_474_44) / var_474_45

				if arg_471_1.var_.characterEffect1019ui_story then
					local var_474_47 = Mathf.Lerp(0, 0.5, var_474_46)

					arg_471_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_471_1.var_.characterEffect1019ui_story.fillRatio = var_474_47
				end
			end

			if arg_471_1.time_ >= var_474_44 + var_474_45 and arg_471_1.time_ < var_474_44 + var_474_45 + arg_474_0 and arg_471_1.var_.characterEffect1019ui_story then
				local var_474_48 = 0.5

				arg_471_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_471_1.var_.characterEffect1019ui_story.fillRatio = var_474_48
			end

			local var_474_49 = arg_471_1.actors_["1029ui_story"]
			local var_474_50 = 4

			if var_474_50 < arg_471_1.time_ and arg_471_1.time_ <= var_474_50 + arg_474_0 and arg_471_1.var_.characterEffect1029ui_story == nil then
				arg_471_1.var_.characterEffect1029ui_story = var_474_49:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_474_51 = 0.2

			if var_474_50 <= arg_471_1.time_ and arg_471_1.time_ < var_474_50 + var_474_51 then
				local var_474_52 = (arg_471_1.time_ - var_474_50) / var_474_51

				if arg_471_1.var_.characterEffect1029ui_story then
					arg_471_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_471_1.time_ >= var_474_50 + var_474_51 and arg_471_1.time_ < var_474_50 + var_474_51 + arg_474_0 and arg_471_1.var_.characterEffect1029ui_story then
				arg_471_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_474_53 = 4

			if var_474_53 < arg_471_1.time_ and arg_471_1.time_ <= var_474_53 + arg_474_0 then
				arg_471_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_474_54 = 2

			if var_474_54 < arg_471_1.time_ and arg_471_1.time_ <= var_474_54 + arg_474_0 then
				arg_471_1.fswbg_:SetActive(false)
				arg_471_1.dialog_:SetActive(false)
				arg_471_1:ShowNextGo(false)
			end

			local var_474_55 = 0
			local var_474_56 = 0.666666666666667

			if var_474_55 < arg_471_1.time_ and arg_471_1.time_ <= var_474_55 + arg_474_0 then
				local var_474_57 = "play"
				local var_474_58 = "music"

				arg_471_1:AudioAction(var_474_57, var_474_58, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_471_1.frameCnt_ <= 1 then
				arg_471_1.dialog_:SetActive(false)
			end

			local var_474_59 = 4
			local var_474_60 = 0.725

			if var_474_59 < arg_471_1.time_ and arg_471_1.time_ <= var_474_59 + arg_474_0 then
				arg_471_1.talkMaxDuration = 0

				arg_471_1.dialog_:SetActive(true)

				local var_474_61 = LeanTween.value(arg_471_1.dialog_, 0, 1, 0.3)

				var_474_61:setOnUpdate(LuaHelper.FloatAction(function(arg_475_0)
					arg_471_1.dialogCg_.alpha = arg_475_0
				end))
				var_474_61:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_471_1.dialog_)
					var_474_61:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_471_1.duration_ = arg_471_1.duration_ + 0.3

				SetActive(arg_471_1.leftNameGo_, true)

				local var_474_62 = arg_471_1:FormatText(StoryNameCfg[319].name)

				arg_471_1.leftNameTxt_.text = var_474_62

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_471_1.leftNameTxt_.transform)

				arg_471_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_471_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_471_1:RecordName(arg_471_1.leftNameTxt_.text)
				SetActive(arg_471_1.iconTrs_.gameObject, false)
				arg_471_1.callingController_:SetSelectedState("normal")

				local var_474_63 = arg_471_1:GetWordFromCfg(116431109)
				local var_474_64 = arg_471_1:FormatText(var_474_63.content)

				arg_471_1.text_.text = var_474_64

				LuaForUtil.ClearLinePrefixSymbol(arg_471_1.text_)

				local var_474_65 = 29
				local var_474_66 = utf8.len(var_474_64)
				local var_474_67 = var_474_65 <= 0 and var_474_60 or var_474_60 * (var_474_66 / var_474_65)

				if var_474_67 > 0 and var_474_60 < var_474_67 then
					arg_471_1.talkMaxDuration = var_474_67
					var_474_59 = var_474_59 + 0.3

					if var_474_67 + var_474_59 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_67 + var_474_59
					end
				end

				arg_471_1.text_.text = var_474_64
				arg_471_1.typewritter.percent = 0

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431109", "story_v_out_116431.awb") ~= 0 then
					local var_474_68 = manager.audio:GetVoiceLength("story_v_out_116431", "116431109", "story_v_out_116431.awb") / 1000

					if var_474_68 + var_474_59 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_68 + var_474_59
					end

					if var_474_63.prefab_name ~= "" and arg_471_1.actors_[var_474_63.prefab_name] ~= nil then
						local var_474_69 = LuaForUtil.PlayVoiceWithCriLipsync(arg_471_1.actors_[var_474_63.prefab_name].transform, "story_v_out_116431", "116431109", "story_v_out_116431.awb")

						arg_471_1:RecordAudio("116431109", var_474_69)
						arg_471_1:RecordAudio("116431109", var_474_69)
					else
						arg_471_1:AudioAction("play", "voice", "story_v_out_116431", "116431109", "story_v_out_116431.awb")
					end

					arg_471_1:RecordHistoryTalkVoice("story_v_out_116431", "116431109", "story_v_out_116431.awb")
				end

				arg_471_1:RecordContent(arg_471_1.text_.text)
			end

			local var_474_70 = var_474_59 + 0.3
			local var_474_71 = math.max(var_474_60, arg_471_1.talkMaxDuration)

			if var_474_70 <= arg_471_1.time_ and arg_471_1.time_ < var_474_70 + var_474_71 then
				arg_471_1.typewritter.percent = (arg_471_1.time_ - var_474_70) / var_474_71

				arg_471_1.typewritter:SetDirty()
			end

			if arg_471_1.time_ >= var_474_70 + var_474_71 and arg_471_1.time_ < var_474_70 + var_474_71 + arg_474_0 then
				arg_471_1.typewritter.percent = 1

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(true)
			end
		end
	end,
	Play116431110 = function(arg_477_0, arg_477_1)
		arg_477_1.time_ = 0
		arg_477_1.frameCnt_ = 0
		arg_477_1.state_ = "playing"
		arg_477_1.curTalkId_ = 116431110
		arg_477_1.duration_ = 4.533

		local var_477_0 = {
			zh = 2.3,
			ja = 4.533
		}
		local var_477_1 = manager.audio:GetLocalizationFlag()

		if var_477_0[var_477_1] ~= nil then
			arg_477_1.duration_ = var_477_0[var_477_1]
		end

		SetActive(arg_477_1.tipsGo_, false)

		function arg_477_1.onSingleLineFinish_()
			arg_477_1.onSingleLineUpdate_ = nil
			arg_477_1.onSingleLineFinish_ = nil
			arg_477_1.state_ = "waiting"
		end

		function arg_477_1.playNext_(arg_479_0)
			if arg_479_0 == 1 then
				arg_477_0:Play116431111(arg_477_1)
			end
		end

		function arg_477_1.onSingleLineUpdate_(arg_480_0)
			local var_480_0 = arg_477_1.actors_["1019ui_story"].transform
			local var_480_1 = 0

			if var_480_1 < arg_477_1.time_ and arg_477_1.time_ <= var_480_1 + arg_480_0 then
				arg_477_1.var_.moveOldPos1019ui_story = var_480_0.localPosition
			end

			local var_480_2 = 0.001

			if var_480_1 <= arg_477_1.time_ and arg_477_1.time_ < var_480_1 + var_480_2 then
				local var_480_3 = (arg_477_1.time_ - var_480_1) / var_480_2
				local var_480_4 = Vector3.New(-0.7, -1.08, -5.9)

				var_480_0.localPosition = Vector3.Lerp(arg_477_1.var_.moveOldPos1019ui_story, var_480_4, var_480_3)

				local var_480_5 = manager.ui.mainCamera.transform.position - var_480_0.position

				var_480_0.forward = Vector3.New(var_480_5.x, var_480_5.y, var_480_5.z)

				local var_480_6 = var_480_0.localEulerAngles

				var_480_6.z = 0
				var_480_6.x = 0
				var_480_0.localEulerAngles = var_480_6
			end

			if arg_477_1.time_ >= var_480_1 + var_480_2 and arg_477_1.time_ < var_480_1 + var_480_2 + arg_480_0 then
				var_480_0.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_480_7 = manager.ui.mainCamera.transform.position - var_480_0.position

				var_480_0.forward = Vector3.New(var_480_7.x, var_480_7.y, var_480_7.z)

				local var_480_8 = var_480_0.localEulerAngles

				var_480_8.z = 0
				var_480_8.x = 0
				var_480_0.localEulerAngles = var_480_8
			end

			local var_480_9 = arg_477_1.actors_["1019ui_story"]
			local var_480_10 = 0

			if var_480_10 < arg_477_1.time_ and arg_477_1.time_ <= var_480_10 + arg_480_0 and arg_477_1.var_.characterEffect1019ui_story == nil then
				arg_477_1.var_.characterEffect1019ui_story = var_480_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_480_11 = 0.2

			if var_480_10 <= arg_477_1.time_ and arg_477_1.time_ < var_480_10 + var_480_11 then
				local var_480_12 = (arg_477_1.time_ - var_480_10) / var_480_11

				if arg_477_1.var_.characterEffect1019ui_story then
					arg_477_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_477_1.time_ >= var_480_10 + var_480_11 and arg_477_1.time_ < var_480_10 + var_480_11 + arg_480_0 and arg_477_1.var_.characterEffect1019ui_story then
				arg_477_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_480_13 = arg_477_1.actors_["1029ui_story"]
			local var_480_14 = 0

			if var_480_14 < arg_477_1.time_ and arg_477_1.time_ <= var_480_14 + arg_480_0 and arg_477_1.var_.characterEffect1029ui_story == nil then
				arg_477_1.var_.characterEffect1029ui_story = var_480_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_480_15 = 0.2

			if var_480_14 <= arg_477_1.time_ and arg_477_1.time_ < var_480_14 + var_480_15 then
				local var_480_16 = (arg_477_1.time_ - var_480_14) / var_480_15

				if arg_477_1.var_.characterEffect1029ui_story then
					local var_480_17 = Mathf.Lerp(0, 0.5, var_480_16)

					arg_477_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_477_1.var_.characterEffect1029ui_story.fillRatio = var_480_17
				end
			end

			if arg_477_1.time_ >= var_480_14 + var_480_15 and arg_477_1.time_ < var_480_14 + var_480_15 + arg_480_0 and arg_477_1.var_.characterEffect1029ui_story then
				local var_480_18 = 0.5

				arg_477_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_477_1.var_.characterEffect1029ui_story.fillRatio = var_480_18
			end

			local var_480_19 = 0

			if var_480_19 < arg_477_1.time_ and arg_477_1.time_ <= var_480_19 + arg_480_0 then
				arg_477_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_480_20 = 0
			local var_480_21 = 0.275

			if var_480_20 < arg_477_1.time_ and arg_477_1.time_ <= var_480_20 + arg_480_0 then
				arg_477_1.talkMaxDuration = 0
				arg_477_1.dialogCg_.alpha = 1

				arg_477_1.dialog_:SetActive(true)
				SetActive(arg_477_1.leftNameGo_, true)

				local var_480_22 = arg_477_1:FormatText(StoryNameCfg[47].name)

				arg_477_1.leftNameTxt_.text = var_480_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_477_1.leftNameTxt_.transform)

				arg_477_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_477_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_477_1:RecordName(arg_477_1.leftNameTxt_.text)
				SetActive(arg_477_1.iconTrs_.gameObject, false)
				arg_477_1.callingController_:SetSelectedState("normal")

				local var_480_23 = arg_477_1:GetWordFromCfg(116431110)
				local var_480_24 = arg_477_1:FormatText(var_480_23.content)

				arg_477_1.text_.text = var_480_24

				LuaForUtil.ClearLinePrefixSymbol(arg_477_1.text_)

				local var_480_25 = 11
				local var_480_26 = utf8.len(var_480_24)
				local var_480_27 = var_480_25 <= 0 and var_480_21 or var_480_21 * (var_480_26 / var_480_25)

				if var_480_27 > 0 and var_480_21 < var_480_27 then
					arg_477_1.talkMaxDuration = var_480_27

					if var_480_27 + var_480_20 > arg_477_1.duration_ then
						arg_477_1.duration_ = var_480_27 + var_480_20
					end
				end

				arg_477_1.text_.text = var_480_24
				arg_477_1.typewritter.percent = 0

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431110", "story_v_out_116431.awb") ~= 0 then
					local var_480_28 = manager.audio:GetVoiceLength("story_v_out_116431", "116431110", "story_v_out_116431.awb") / 1000

					if var_480_28 + var_480_20 > arg_477_1.duration_ then
						arg_477_1.duration_ = var_480_28 + var_480_20
					end

					if var_480_23.prefab_name ~= "" and arg_477_1.actors_[var_480_23.prefab_name] ~= nil then
						local var_480_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_477_1.actors_[var_480_23.prefab_name].transform, "story_v_out_116431", "116431110", "story_v_out_116431.awb")

						arg_477_1:RecordAudio("116431110", var_480_29)
						arg_477_1:RecordAudio("116431110", var_480_29)
					else
						arg_477_1:AudioAction("play", "voice", "story_v_out_116431", "116431110", "story_v_out_116431.awb")
					end

					arg_477_1:RecordHistoryTalkVoice("story_v_out_116431", "116431110", "story_v_out_116431.awb")
				end

				arg_477_1:RecordContent(arg_477_1.text_.text)
			end

			local var_480_30 = math.max(var_480_21, arg_477_1.talkMaxDuration)

			if var_480_20 <= arg_477_1.time_ and arg_477_1.time_ < var_480_20 + var_480_30 then
				arg_477_1.typewritter.percent = (arg_477_1.time_ - var_480_20) / var_480_30

				arg_477_1.typewritter:SetDirty()
			end

			if arg_477_1.time_ >= var_480_20 + var_480_30 and arg_477_1.time_ < var_480_20 + var_480_30 + arg_480_0 then
				arg_477_1.typewritter.percent = 1

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(true)
			end
		end
	end,
	Play116431111 = function(arg_481_0, arg_481_1)
		arg_481_1.time_ = 0
		arg_481_1.frameCnt_ = 0
		arg_481_1.state_ = "playing"
		arg_481_1.curTalkId_ = 116431111
		arg_481_1.duration_ = 26.016666666666

		SetActive(arg_481_1.tipsGo_, false)

		function arg_481_1.onSingleLineFinish_()
			arg_481_1.onSingleLineUpdate_ = nil
			arg_481_1.onSingleLineFinish_ = nil
			arg_481_1.state_ = "waiting"
		end

		function arg_481_1.playNext_(arg_483_0)
			if arg_483_0 == 1 then
				arg_481_0:Play116431117(arg_481_1)
			end
		end

		function arg_481_1.onSingleLineUpdate_(arg_484_0)
			local var_484_0 = 2.01666666666667

			if var_484_0 < arg_481_1.time_ and arg_481_1.time_ <= var_484_0 + arg_484_0 then
				SetActive(arg_481_1.dialog_, false)
				SetActive(arg_481_1.allBtn_.gameObject, false)
				arg_481_1.hideBtnsController_:SetSelectedIndex(1)
				manager.video:Play("SofdecAsset/story/101164301.usm", function(arg_485_0)
					if arg_481_1.state_ == "playing" then
						arg_481_1:JumpToEnd()
					end

					if arg_481_1.playNext_ and not arg_481_1.auto_ then
						arg_481_1.playNext_(1)
					end

					manager.video:Dispose()
				end, nil, nil, function(arg_486_0)
					if arg_486_0 then
						arg_481_1.state_ = "pause"
					else
						arg_481_1.state_ = "playing"
					end
				end, 101164301)
				manager.video.transform_:SetSiblingIndex(1)
			end

			local var_484_1 = 24

			if var_484_0 <= arg_481_1.time_ and arg_481_1.time_ < var_484_0 + var_484_1 then
				-- block empty
			end

			if arg_481_1.time_ >= var_484_0 + var_484_1 and arg_481_1.time_ < var_484_0 + var_484_1 + arg_484_0 then
				-- block empty
			end

			local var_484_2 = arg_481_1.actors_["1019ui_story"].transform
			local var_484_3 = 2

			if var_484_3 < arg_481_1.time_ and arg_481_1.time_ <= var_484_3 + arg_484_0 then
				arg_481_1.var_.moveOldPos1019ui_story = var_484_2.localPosition
			end

			local var_484_4 = 0.001

			if var_484_3 <= arg_481_1.time_ and arg_481_1.time_ < var_484_3 + var_484_4 then
				local var_484_5 = (arg_481_1.time_ - var_484_3) / var_484_4
				local var_484_6 = Vector3.New(0, 100, 0)

				var_484_2.localPosition = Vector3.Lerp(arg_481_1.var_.moveOldPos1019ui_story, var_484_6, var_484_5)

				local var_484_7 = manager.ui.mainCamera.transform.position - var_484_2.position

				var_484_2.forward = Vector3.New(var_484_7.x, var_484_7.y, var_484_7.z)

				local var_484_8 = var_484_2.localEulerAngles

				var_484_8.z = 0
				var_484_8.x = 0
				var_484_2.localEulerAngles = var_484_8
			end

			if arg_481_1.time_ >= var_484_3 + var_484_4 and arg_481_1.time_ < var_484_3 + var_484_4 + arg_484_0 then
				var_484_2.localPosition = Vector3.New(0, 100, 0)

				local var_484_9 = manager.ui.mainCamera.transform.position - var_484_2.position

				var_484_2.forward = Vector3.New(var_484_9.x, var_484_9.y, var_484_9.z)

				local var_484_10 = var_484_2.localEulerAngles

				var_484_10.z = 0
				var_484_10.x = 0
				var_484_2.localEulerAngles = var_484_10
			end

			local var_484_11 = arg_481_1.actors_["1029ui_story"].transform
			local var_484_12 = 2

			if var_484_12 < arg_481_1.time_ and arg_481_1.time_ <= var_484_12 + arg_484_0 then
				arg_481_1.var_.moveOldPos1029ui_story = var_484_11.localPosition
			end

			local var_484_13 = 0.001

			if var_484_12 <= arg_481_1.time_ and arg_481_1.time_ < var_484_12 + var_484_13 then
				local var_484_14 = (arg_481_1.time_ - var_484_12) / var_484_13
				local var_484_15 = Vector3.New(0, 100, 0)

				var_484_11.localPosition = Vector3.Lerp(arg_481_1.var_.moveOldPos1029ui_story, var_484_15, var_484_14)

				local var_484_16 = manager.ui.mainCamera.transform.position - var_484_11.position

				var_484_11.forward = Vector3.New(var_484_16.x, var_484_16.y, var_484_16.z)

				local var_484_17 = var_484_11.localEulerAngles

				var_484_17.z = 0
				var_484_17.x = 0
				var_484_11.localEulerAngles = var_484_17
			end

			if arg_481_1.time_ >= var_484_12 + var_484_13 and arg_481_1.time_ < var_484_12 + var_484_13 + arg_484_0 then
				var_484_11.localPosition = Vector3.New(0, 100, 0)

				local var_484_18 = manager.ui.mainCamera.transform.position - var_484_11.position

				var_484_11.forward = Vector3.New(var_484_18.x, var_484_18.y, var_484_18.z)

				local var_484_19 = var_484_11.localEulerAngles

				var_484_19.z = 0
				var_484_19.x = 0
				var_484_11.localEulerAngles = var_484_19
			end

			local var_484_20 = 0

			if var_484_20 < arg_481_1.time_ and arg_481_1.time_ <= var_484_20 + arg_484_0 then
				arg_481_1.mask_.enabled = true
				arg_481_1.mask_.raycastTarget = true

				arg_481_1:SetGaussion(false)
			end

			local var_484_21 = 2

			if var_484_20 <= arg_481_1.time_ and arg_481_1.time_ < var_484_20 + var_484_21 then
				local var_484_22 = (arg_481_1.time_ - var_484_20) / var_484_21
				local var_484_23 = Color.New(0, 0, 0)

				var_484_23.a = Mathf.Lerp(0, 1, var_484_22)
				arg_481_1.mask_.color = var_484_23
			end

			if arg_481_1.time_ >= var_484_20 + var_484_21 and arg_481_1.time_ < var_484_20 + var_484_21 + arg_484_0 then
				local var_484_24 = Color.New(0, 0, 0)

				var_484_24.a = 1
				arg_481_1.mask_.color = var_484_24
			end

			local var_484_25 = 2

			if var_484_25 < arg_481_1.time_ and arg_481_1.time_ <= var_484_25 + arg_484_0 then
				arg_481_1.mask_.enabled = true
				arg_481_1.mask_.raycastTarget = true

				arg_481_1:SetGaussion(false)
			end

			local var_484_26 = 0.0166666666666667

			if var_484_25 <= arg_481_1.time_ and arg_481_1.time_ < var_484_25 + var_484_26 then
				local var_484_27 = (arg_481_1.time_ - var_484_25) / var_484_26
				local var_484_28 = Color.New(0, 0, 0)

				var_484_28.a = Mathf.Lerp(1, 0, var_484_27)
				arg_481_1.mask_.color = var_484_28
			end

			if arg_481_1.time_ >= var_484_25 + var_484_26 and arg_481_1.time_ < var_484_25 + var_484_26 + arg_484_0 then
				local var_484_29 = Color.New(0, 0, 0)
				local var_484_30 = 0

				arg_481_1.mask_.enabled = false
				var_484_29.a = var_484_30
				arg_481_1.mask_.color = var_484_29
			end
		end
	end,
	Play116431117 = function(arg_487_0, arg_487_1)
		arg_487_1.time_ = 0
		arg_487_1.frameCnt_ = 0
		arg_487_1.state_ = "playing"
		arg_487_1.curTalkId_ = 116431117
		arg_487_1.duration_ = 7

		SetActive(arg_487_1.tipsGo_, false)

		function arg_487_1.onSingleLineFinish_()
			arg_487_1.onSingleLineUpdate_ = nil
			arg_487_1.onSingleLineFinish_ = nil
			arg_487_1.state_ = "waiting"
		end

		function arg_487_1.playNext_(arg_489_0)
			if arg_489_0 == 1 then
				arg_487_0:Play116431118(arg_487_1)
			end
		end

		function arg_487_1.onSingleLineUpdate_(arg_490_0)
			local var_490_0 = 0

			if var_490_0 < arg_487_1.time_ and arg_487_1.time_ <= var_490_0 + arg_490_0 then
				local var_490_1 = manager.ui.mainCamera.transform.localPosition
				local var_490_2 = Vector3.New(0, 0, 10) + Vector3.New(var_490_1.x, var_490_1.y, 0)
				local var_490_3 = arg_487_1.bgs_.I05e

				var_490_3.transform.localPosition = var_490_2
				var_490_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_490_4 = var_490_3:GetComponent("SpriteRenderer")

				if var_490_4 and var_490_4.sprite then
					local var_490_5 = (var_490_3.transform.localPosition - var_490_1).z
					local var_490_6 = manager.ui.mainCameraCom_
					local var_490_7 = 2 * var_490_5 * Mathf.Tan(var_490_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_490_8 = var_490_7 * var_490_6.aspect
					local var_490_9 = var_490_4.sprite.bounds.size.x
					local var_490_10 = var_490_4.sprite.bounds.size.y
					local var_490_11 = var_490_8 / var_490_9
					local var_490_12 = var_490_7 / var_490_10
					local var_490_13 = var_490_12 < var_490_11 and var_490_11 or var_490_12

					var_490_3.transform.localScale = Vector3.New(var_490_13, var_490_13, 0)
				end

				for iter_490_0, iter_490_1 in pairs(arg_487_1.bgs_) do
					if iter_490_0 ~= "I05e" then
						iter_490_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_490_14 = 0

			if var_490_14 < arg_487_1.time_ and arg_487_1.time_ <= var_490_14 + arg_490_0 then
				arg_487_1.mask_.enabled = true
				arg_487_1.mask_.raycastTarget = true

				arg_487_1:SetGaussion(false)
			end

			local var_490_15 = 2

			if var_490_14 <= arg_487_1.time_ and arg_487_1.time_ < var_490_14 + var_490_15 then
				local var_490_16 = (arg_487_1.time_ - var_490_14) / var_490_15
				local var_490_17 = Color.New(0, 0, 0)

				var_490_17.a = Mathf.Lerp(1, 0, var_490_16)
				arg_487_1.mask_.color = var_490_17
			end

			if arg_487_1.time_ >= var_490_14 + var_490_15 and arg_487_1.time_ < var_490_14 + var_490_15 + arg_490_0 then
				local var_490_18 = Color.New(0, 0, 0)
				local var_490_19 = 0

				arg_487_1.mask_.enabled = false
				var_490_18.a = var_490_19
				arg_487_1.mask_.color = var_490_18
			end

			local var_490_20 = 0
			local var_490_21 = 1

			if var_490_20 < arg_487_1.time_ and arg_487_1.time_ <= var_490_20 + arg_490_0 then
				local var_490_22 = "play"
				local var_490_23 = "effect"

				arg_487_1:AudioAction(var_490_22, var_490_23, "se_story_16", "se_story_16_thunder02", "")
			end

			local var_490_24 = 0
			local var_490_25 = 1

			if var_490_24 < arg_487_1.time_ and arg_487_1.time_ <= var_490_24 + arg_490_0 then
				local var_490_26 = "play"
				local var_490_27 = "effect"

				arg_487_1:AudioAction(var_490_26, var_490_27, "se_story_16", "se_story_16_rain01_loop", "")
			end

			local var_490_28 = manager.ui.mainCamera.transform
			local var_490_29 = 0.999999999999999

			if var_490_29 < arg_487_1.time_ and arg_487_1.time_ <= var_490_29 + arg_490_0 then
				local var_490_30 = arg_487_1.var_.effectI05exiayula1

				if not var_490_30 then
					var_490_30 = Object.Instantiate(Asset.Load("Effect/Scene/fx_raindrop"))
					var_490_30.name = "xiayula1"
					arg_487_1.var_.effectI05exiayula1 = var_490_30
				end

				local var_490_31 = var_490_28:Find("")

				if var_490_31 then
					var_490_30.transform.parent = var_490_31
				else
					var_490_30.transform.parent = var_490_28
				end

				var_490_30.transform.localPosition = Vector3.New(0, 0, 0)
				var_490_30.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_490_32 = 0

			if var_490_32 < arg_487_1.time_ and arg_487_1.time_ <= var_490_32 + arg_490_0 then
				SetActive(arg_487_1.dialog_, false)
				SetActive(arg_487_1.allBtn_.gameObject, true)
				arg_487_1.hideBtnsController_:SetSelectedIndex(0)
				manager.video:Dispose()
			end

			local var_490_33 = 0.0166666666666667

			if var_490_32 <= arg_487_1.time_ and arg_487_1.time_ < var_490_32 + var_490_33 then
				-- block empty
			end

			if arg_487_1.time_ >= var_490_32 + var_490_33 and arg_487_1.time_ < var_490_32 + var_490_33 + arg_490_0 then
				-- block empty
			end

			if arg_487_1.frameCnt_ <= 1 then
				arg_487_1.dialog_:SetActive(false)
			end

			local var_490_34 = 2
			local var_490_35 = 1.3

			if var_490_34 < arg_487_1.time_ and arg_487_1.time_ <= var_490_34 + arg_490_0 then
				arg_487_1.talkMaxDuration = 0

				arg_487_1.dialog_:SetActive(true)

				local var_490_36 = LeanTween.value(arg_487_1.dialog_, 0, 1, 0.3)

				var_490_36:setOnUpdate(LuaHelper.FloatAction(function(arg_491_0)
					arg_487_1.dialogCg_.alpha = arg_491_0
				end))
				var_490_36:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_487_1.dialog_)
					var_490_36:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_487_1.duration_ = arg_487_1.duration_ + 0.3

				SetActive(arg_487_1.leftNameGo_, false)

				arg_487_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_487_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_487_1:RecordName(arg_487_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_487_1.iconTrs_.gameObject, false)
				arg_487_1.callingController_:SetSelectedState("normal")

				local var_490_37 = arg_487_1:GetWordFromCfg(116431117)
				local var_490_38 = arg_487_1:FormatText(var_490_37.content)

				arg_487_1.text_.text = var_490_38

				LuaForUtil.ClearLinePrefixSymbol(arg_487_1.text_)

				local var_490_39 = 52
				local var_490_40 = utf8.len(var_490_38)
				local var_490_41 = var_490_39 <= 0 and var_490_35 or var_490_35 * (var_490_40 / var_490_39)

				if var_490_41 > 0 and var_490_35 < var_490_41 then
					arg_487_1.talkMaxDuration = var_490_41
					var_490_34 = var_490_34 + 0.3

					if var_490_41 + var_490_34 > arg_487_1.duration_ then
						arg_487_1.duration_ = var_490_41 + var_490_34
					end
				end

				arg_487_1.text_.text = var_490_38
				arg_487_1.typewritter.percent = 0

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(false)
				arg_487_1:RecordContent(arg_487_1.text_.text)
			end

			local var_490_42 = var_490_34 + 0.3
			local var_490_43 = math.max(var_490_35, arg_487_1.talkMaxDuration)

			if var_490_42 <= arg_487_1.time_ and arg_487_1.time_ < var_490_42 + var_490_43 then
				arg_487_1.typewritter.percent = (arg_487_1.time_ - var_490_42) / var_490_43

				arg_487_1.typewritter:SetDirty()
			end

			if arg_487_1.time_ >= var_490_42 + var_490_43 and arg_487_1.time_ < var_490_42 + var_490_43 + arg_490_0 then
				arg_487_1.typewritter.percent = 1

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(true)
			end
		end
	end,
	Play116431118 = function(arg_493_0, arg_493_1)
		arg_493_1.time_ = 0
		arg_493_1.frameCnt_ = 0
		arg_493_1.state_ = "playing"
		arg_493_1.curTalkId_ = 116431118
		arg_493_1.duration_ = 5

		SetActive(arg_493_1.tipsGo_, false)

		function arg_493_1.onSingleLineFinish_()
			arg_493_1.onSingleLineUpdate_ = nil
			arg_493_1.onSingleLineFinish_ = nil
			arg_493_1.state_ = "waiting"
		end

		function arg_493_1.playNext_(arg_495_0)
			if arg_495_0 == 1 then
				arg_493_0:Play116431119(arg_493_1)
			end
		end

		function arg_493_1.onSingleLineUpdate_(arg_496_0)
			local var_496_0 = 0
			local var_496_1 = 0.9

			if var_496_0 < arg_493_1.time_ and arg_493_1.time_ <= var_496_0 + arg_496_0 then
				arg_493_1.talkMaxDuration = 0
				arg_493_1.dialogCg_.alpha = 1

				arg_493_1.dialog_:SetActive(true)
				SetActive(arg_493_1.leftNameGo_, false)

				arg_493_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_493_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_493_1:RecordName(arg_493_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_493_1.iconTrs_.gameObject, false)
				arg_493_1.callingController_:SetSelectedState("normal")

				local var_496_2 = arg_493_1:GetWordFromCfg(116431118)
				local var_496_3 = arg_493_1:FormatText(var_496_2.content)

				arg_493_1.text_.text = var_496_3

				LuaForUtil.ClearLinePrefixSymbol(arg_493_1.text_)

				local var_496_4 = 36
				local var_496_5 = utf8.len(var_496_3)
				local var_496_6 = var_496_4 <= 0 and var_496_1 or var_496_1 * (var_496_5 / var_496_4)

				if var_496_6 > 0 and var_496_1 < var_496_6 then
					arg_493_1.talkMaxDuration = var_496_6

					if var_496_6 + var_496_0 > arg_493_1.duration_ then
						arg_493_1.duration_ = var_496_6 + var_496_0
					end
				end

				arg_493_1.text_.text = var_496_3
				arg_493_1.typewritter.percent = 0

				arg_493_1.typewritter:SetDirty()
				arg_493_1:ShowNextGo(false)
				arg_493_1:RecordContent(arg_493_1.text_.text)
			end

			local var_496_7 = math.max(var_496_1, arg_493_1.talkMaxDuration)

			if var_496_0 <= arg_493_1.time_ and arg_493_1.time_ < var_496_0 + var_496_7 then
				arg_493_1.typewritter.percent = (arg_493_1.time_ - var_496_0) / var_496_7

				arg_493_1.typewritter:SetDirty()
			end

			if arg_493_1.time_ >= var_496_0 + var_496_7 and arg_493_1.time_ < var_496_0 + var_496_7 + arg_496_0 then
				arg_493_1.typewritter.percent = 1

				arg_493_1.typewritter:SetDirty()
				arg_493_1:ShowNextGo(true)
			end
		end
	end,
	Play116431119 = function(arg_497_0, arg_497_1)
		arg_497_1.time_ = 0
		arg_497_1.frameCnt_ = 0
		arg_497_1.state_ = "playing"
		arg_497_1.curTalkId_ = 116431119
		arg_497_1.duration_ = 10.4

		local var_497_0 = {
			zh = 10.4,
			ja = 10
		}
		local var_497_1 = manager.audio:GetLocalizationFlag()

		if var_497_0[var_497_1] ~= nil then
			arg_497_1.duration_ = var_497_0[var_497_1]
		end

		SetActive(arg_497_1.tipsGo_, false)

		function arg_497_1.onSingleLineFinish_()
			arg_497_1.onSingleLineUpdate_ = nil
			arg_497_1.onSingleLineFinish_ = nil
			arg_497_1.state_ = "waiting"
		end

		function arg_497_1.playNext_(arg_499_0)
			if arg_499_0 == 1 then
				arg_497_0:Play116431120(arg_497_1)
			end
		end

		function arg_497_1.onSingleLineUpdate_(arg_500_0)
			local var_500_0 = 0
			local var_500_1 = 1.2

			if var_500_0 < arg_497_1.time_ and arg_497_1.time_ <= var_500_0 + arg_500_0 then
				arg_497_1.talkMaxDuration = 0
				arg_497_1.dialogCg_.alpha = 1

				arg_497_1.dialog_:SetActive(true)
				SetActive(arg_497_1.leftNameGo_, true)

				local var_500_2 = arg_497_1:FormatText(StoryNameCfg[264].name)

				arg_497_1.leftNameTxt_.text = var_500_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_497_1.leftNameTxt_.transform)

				arg_497_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_497_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_497_1:RecordName(arg_497_1.leftNameTxt_.text)
				SetActive(arg_497_1.iconTrs_.gameObject, true)
				arg_497_1.iconController_:SetSelectedState("hero")

				arg_497_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10014")

				arg_497_1.callingController_:SetSelectedState("normal")

				local var_500_3 = arg_497_1:GetWordFromCfg(116431119)
				local var_500_4 = arg_497_1:FormatText(var_500_3.content)

				arg_497_1.text_.text = var_500_4

				LuaForUtil.ClearLinePrefixSymbol(arg_497_1.text_)

				local var_500_5 = 48
				local var_500_6 = utf8.len(var_500_4)
				local var_500_7 = var_500_5 <= 0 and var_500_1 or var_500_1 * (var_500_6 / var_500_5)

				if var_500_7 > 0 and var_500_1 < var_500_7 then
					arg_497_1.talkMaxDuration = var_500_7

					if var_500_7 + var_500_0 > arg_497_1.duration_ then
						arg_497_1.duration_ = var_500_7 + var_500_0
					end
				end

				arg_497_1.text_.text = var_500_4
				arg_497_1.typewritter.percent = 0

				arg_497_1.typewritter:SetDirty()
				arg_497_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431119", "story_v_out_116431.awb") ~= 0 then
					local var_500_8 = manager.audio:GetVoiceLength("story_v_out_116431", "116431119", "story_v_out_116431.awb") / 1000

					if var_500_8 + var_500_0 > arg_497_1.duration_ then
						arg_497_1.duration_ = var_500_8 + var_500_0
					end

					if var_500_3.prefab_name ~= "" and arg_497_1.actors_[var_500_3.prefab_name] ~= nil then
						local var_500_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_497_1.actors_[var_500_3.prefab_name].transform, "story_v_out_116431", "116431119", "story_v_out_116431.awb")

						arg_497_1:RecordAudio("116431119", var_500_9)
						arg_497_1:RecordAudio("116431119", var_500_9)
					else
						arg_497_1:AudioAction("play", "voice", "story_v_out_116431", "116431119", "story_v_out_116431.awb")
					end

					arg_497_1:RecordHistoryTalkVoice("story_v_out_116431", "116431119", "story_v_out_116431.awb")
				end

				arg_497_1:RecordContent(arg_497_1.text_.text)
			end

			local var_500_10 = math.max(var_500_1, arg_497_1.talkMaxDuration)

			if var_500_0 <= arg_497_1.time_ and arg_497_1.time_ < var_500_0 + var_500_10 then
				arg_497_1.typewritter.percent = (arg_497_1.time_ - var_500_0) / var_500_10

				arg_497_1.typewritter:SetDirty()
			end

			if arg_497_1.time_ >= var_500_0 + var_500_10 and arg_497_1.time_ < var_500_0 + var_500_10 + arg_500_0 then
				arg_497_1.typewritter.percent = 1

				arg_497_1.typewritter:SetDirty()
				arg_497_1:ShowNextGo(true)
			end
		end
	end,
	Play116431120 = function(arg_501_0, arg_501_1)
		arg_501_1.time_ = 0
		arg_501_1.frameCnt_ = 0
		arg_501_1.state_ = "playing"
		arg_501_1.curTalkId_ = 116431120
		arg_501_1.duration_ = 1.999999999999

		SetActive(arg_501_1.tipsGo_, false)

		function arg_501_1.onSingleLineFinish_()
			arg_501_1.onSingleLineUpdate_ = nil
			arg_501_1.onSingleLineFinish_ = nil
			arg_501_1.state_ = "waiting"
		end

		function arg_501_1.playNext_(arg_503_0)
			if arg_503_0 == 1 then
				arg_501_0:Play116431121(arg_501_1)
			end
		end

		function arg_501_1.onSingleLineUpdate_(arg_504_0)
			local var_504_0 = "2079ui_story"

			if arg_501_1.actors_[var_504_0] == nil then
				local var_504_1 = Object.Instantiate(Asset.Load("Char/" .. var_504_0), arg_501_1.stage_.transform)

				var_504_1.name = var_504_0
				var_504_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_501_1.actors_[var_504_0] = var_504_1

				local var_504_2 = var_504_1:GetComponentInChildren(typeof(CharacterEffect))

				var_504_2.enabled = true

				local var_504_3 = GameObjectTools.GetOrAddComponent(var_504_1, typeof(DynamicBoneHelper))

				if var_504_3 then
					var_504_3:EnableDynamicBone(false)
				end

				arg_501_1:ShowWeapon(var_504_2.transform, false)

				arg_501_1.var_[var_504_0 .. "Animator"] = var_504_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_501_1.var_[var_504_0 .. "Animator"].applyRootMotion = true
				arg_501_1.var_[var_504_0 .. "LipSync"] = var_504_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_504_4 = arg_501_1.actors_["2079ui_story"].transform
			local var_504_5 = 0

			if var_504_5 < arg_501_1.time_ and arg_501_1.time_ <= var_504_5 + arg_504_0 then
				arg_501_1.var_.moveOldPos2079ui_story = var_504_4.localPosition
			end

			local var_504_6 = 0.001

			if var_504_5 <= arg_501_1.time_ and arg_501_1.time_ < var_504_5 + var_504_6 then
				local var_504_7 = (arg_501_1.time_ - var_504_5) / var_504_6
				local var_504_8 = Vector3.New(0, -1.28, -5.6)

				var_504_4.localPosition = Vector3.Lerp(arg_501_1.var_.moveOldPos2079ui_story, var_504_8, var_504_7)

				local var_504_9 = manager.ui.mainCamera.transform.position - var_504_4.position

				var_504_4.forward = Vector3.New(var_504_9.x, var_504_9.y, var_504_9.z)

				local var_504_10 = var_504_4.localEulerAngles

				var_504_10.z = 0
				var_504_10.x = 0
				var_504_4.localEulerAngles = var_504_10
			end

			if arg_501_1.time_ >= var_504_5 + var_504_6 and arg_501_1.time_ < var_504_5 + var_504_6 + arg_504_0 then
				var_504_4.localPosition = Vector3.New(0, -1.28, -5.6)

				local var_504_11 = manager.ui.mainCamera.transform.position - var_504_4.position

				var_504_4.forward = Vector3.New(var_504_11.x, var_504_11.y, var_504_11.z)

				local var_504_12 = var_504_4.localEulerAngles

				var_504_12.z = 0
				var_504_12.x = 0
				var_504_4.localEulerAngles = var_504_12
			end

			local var_504_13 = 0

			if var_504_13 < arg_501_1.time_ and arg_501_1.time_ <= var_504_13 + arg_504_0 then
				arg_501_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_504_14 = arg_501_1.actors_["2079ui_story"]
			local var_504_15 = 0

			if var_504_15 < arg_501_1.time_ and arg_501_1.time_ <= var_504_15 + arg_504_0 and arg_501_1.var_.characterEffect2079ui_story == nil then
				arg_501_1.var_.characterEffect2079ui_story = var_504_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_504_16 = 0.2

			if var_504_15 <= arg_501_1.time_ and arg_501_1.time_ < var_504_15 + var_504_16 then
				local var_504_17 = (arg_501_1.time_ - var_504_15) / var_504_16

				if arg_501_1.var_.characterEffect2079ui_story then
					arg_501_1.var_.characterEffect2079ui_story.fillFlat = false
				end
			end

			if arg_501_1.time_ >= var_504_15 + var_504_16 and arg_501_1.time_ < var_504_15 + var_504_16 + arg_504_0 and arg_501_1.var_.characterEffect2079ui_story then
				arg_501_1.var_.characterEffect2079ui_story.fillFlat = false
			end

			local var_504_18 = 0
			local var_504_19 = 0.075

			if var_504_18 < arg_501_1.time_ and arg_501_1.time_ <= var_504_18 + arg_504_0 then
				arg_501_1.talkMaxDuration = 0
				arg_501_1.dialogCg_.alpha = 1

				arg_501_1.dialog_:SetActive(true)
				SetActive(arg_501_1.leftNameGo_, true)

				local var_504_20 = arg_501_1:FormatText(StoryNameCfg[323].name)

				arg_501_1.leftNameTxt_.text = var_504_20

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_501_1.leftNameTxt_.transform)

				arg_501_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_501_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_501_1:RecordName(arg_501_1.leftNameTxt_.text)
				SetActive(arg_501_1.iconTrs_.gameObject, false)
				arg_501_1.callingController_:SetSelectedState("normal")

				local var_504_21 = arg_501_1:GetWordFromCfg(116431120)
				local var_504_22 = arg_501_1:FormatText(var_504_21.content)

				arg_501_1.text_.text = var_504_22

				LuaForUtil.ClearLinePrefixSymbol(arg_501_1.text_)

				local var_504_23 = 3
				local var_504_24 = utf8.len(var_504_22)
				local var_504_25 = var_504_23 <= 0 and var_504_19 or var_504_19 * (var_504_24 / var_504_23)

				if var_504_25 > 0 and var_504_19 < var_504_25 then
					arg_501_1.talkMaxDuration = var_504_25

					if var_504_25 + var_504_18 > arg_501_1.duration_ then
						arg_501_1.duration_ = var_504_25 + var_504_18
					end
				end

				arg_501_1.text_.text = var_504_22
				arg_501_1.typewritter.percent = 0

				arg_501_1.typewritter:SetDirty()
				arg_501_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431120", "story_v_out_116431.awb") ~= 0 then
					local var_504_26 = manager.audio:GetVoiceLength("story_v_out_116431", "116431120", "story_v_out_116431.awb") / 1000

					if var_504_26 + var_504_18 > arg_501_1.duration_ then
						arg_501_1.duration_ = var_504_26 + var_504_18
					end

					if var_504_21.prefab_name ~= "" and arg_501_1.actors_[var_504_21.prefab_name] ~= nil then
						local var_504_27 = LuaForUtil.PlayVoiceWithCriLipsync(arg_501_1.actors_[var_504_21.prefab_name].transform, "story_v_out_116431", "116431120", "story_v_out_116431.awb")

						arg_501_1:RecordAudio("116431120", var_504_27)
						arg_501_1:RecordAudio("116431120", var_504_27)
					else
						arg_501_1:AudioAction("play", "voice", "story_v_out_116431", "116431120", "story_v_out_116431.awb")
					end

					arg_501_1:RecordHistoryTalkVoice("story_v_out_116431", "116431120", "story_v_out_116431.awb")
				end

				arg_501_1:RecordContent(arg_501_1.text_.text)
			end

			local var_504_28 = math.max(var_504_19, arg_501_1.talkMaxDuration)

			if var_504_18 <= arg_501_1.time_ and arg_501_1.time_ < var_504_18 + var_504_28 then
				arg_501_1.typewritter.percent = (arg_501_1.time_ - var_504_18) / var_504_28

				arg_501_1.typewritter:SetDirty()
			end

			if arg_501_1.time_ >= var_504_18 + var_504_28 and arg_501_1.time_ < var_504_18 + var_504_28 + arg_504_0 then
				arg_501_1.typewritter.percent = 1

				arg_501_1.typewritter:SetDirty()
				arg_501_1:ShowNextGo(true)
			end
		end
	end,
	Play116431121 = function(arg_505_0, arg_505_1)
		arg_505_1.time_ = 0
		arg_505_1.frameCnt_ = 0
		arg_505_1.state_ = "playing"
		arg_505_1.curTalkId_ = 116431121
		arg_505_1.duration_ = 10.3

		local var_505_0 = {
			zh = 7.166,
			ja = 10.3
		}
		local var_505_1 = manager.audio:GetLocalizationFlag()

		if var_505_0[var_505_1] ~= nil then
			arg_505_1.duration_ = var_505_0[var_505_1]
		end

		SetActive(arg_505_1.tipsGo_, false)

		function arg_505_1.onSingleLineFinish_()
			arg_505_1.onSingleLineUpdate_ = nil
			arg_505_1.onSingleLineFinish_ = nil
			arg_505_1.state_ = "waiting"
		end

		function arg_505_1.playNext_(arg_507_0)
			if arg_507_0 == 1 then
				arg_505_0:Play116431122(arg_505_1)
			end
		end

		function arg_505_1.onSingleLineUpdate_(arg_508_0)
			local var_508_0 = "I05c"

			if arg_505_1.bgs_[var_508_0] == nil then
				local var_508_1 = Object.Instantiate(arg_505_1.paintGo_)

				var_508_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_508_0)
				var_508_1.name = var_508_0
				var_508_1.transform.parent = arg_505_1.stage_.transform
				var_508_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_505_1.bgs_[var_508_0] = var_508_1
			end

			local var_508_2 = 2

			if var_508_2 < arg_505_1.time_ and arg_505_1.time_ <= var_508_2 + arg_508_0 then
				local var_508_3 = manager.ui.mainCamera.transform.localPosition
				local var_508_4 = Vector3.New(0, 0, 10) + Vector3.New(var_508_3.x, var_508_3.y, 0)
				local var_508_5 = arg_505_1.bgs_.I05c

				var_508_5.transform.localPosition = var_508_4
				var_508_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_508_6 = var_508_5:GetComponent("SpriteRenderer")

				if var_508_6 and var_508_6.sprite then
					local var_508_7 = (var_508_5.transform.localPosition - var_508_3).z
					local var_508_8 = manager.ui.mainCameraCom_
					local var_508_9 = 2 * var_508_7 * Mathf.Tan(var_508_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_508_10 = var_508_9 * var_508_8.aspect
					local var_508_11 = var_508_6.sprite.bounds.size.x
					local var_508_12 = var_508_6.sprite.bounds.size.y
					local var_508_13 = var_508_10 / var_508_11
					local var_508_14 = var_508_9 / var_508_12
					local var_508_15 = var_508_14 < var_508_13 and var_508_13 or var_508_14

					var_508_5.transform.localScale = Vector3.New(var_508_15, var_508_15, 0)
				end

				for iter_508_0, iter_508_1 in pairs(arg_505_1.bgs_) do
					if iter_508_0 ~= "I05c" then
						iter_508_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_508_16 = 0

			if var_508_16 < arg_505_1.time_ and arg_505_1.time_ <= var_508_16 + arg_508_0 then
				arg_505_1.mask_.enabled = true
				arg_505_1.mask_.raycastTarget = true

				arg_505_1:SetGaussion(false)
			end

			local var_508_17 = 2

			if var_508_16 <= arg_505_1.time_ and arg_505_1.time_ < var_508_16 + var_508_17 then
				local var_508_18 = (arg_505_1.time_ - var_508_16) / var_508_17
				local var_508_19 = Color.New(0, 0, 0)

				var_508_19.a = Mathf.Lerp(0, 1, var_508_18)
				arg_505_1.mask_.color = var_508_19
			end

			if arg_505_1.time_ >= var_508_16 + var_508_17 and arg_505_1.time_ < var_508_16 + var_508_17 + arg_508_0 then
				local var_508_20 = Color.New(0, 0, 0)

				var_508_20.a = 1
				arg_505_1.mask_.color = var_508_20
			end

			local var_508_21 = 2

			if var_508_21 < arg_505_1.time_ and arg_505_1.time_ <= var_508_21 + arg_508_0 then
				arg_505_1.mask_.enabled = true
				arg_505_1.mask_.raycastTarget = true

				arg_505_1:SetGaussion(false)
			end

			local var_508_22 = 2

			if var_508_21 <= arg_505_1.time_ and arg_505_1.time_ < var_508_21 + var_508_22 then
				local var_508_23 = (arg_505_1.time_ - var_508_21) / var_508_22
				local var_508_24 = Color.New(0, 0, 0)

				var_508_24.a = Mathf.Lerp(1, 0, var_508_23)
				arg_505_1.mask_.color = var_508_24
			end

			if arg_505_1.time_ >= var_508_21 + var_508_22 and arg_505_1.time_ < var_508_21 + var_508_22 + arg_508_0 then
				local var_508_25 = Color.New(0, 0, 0)
				local var_508_26 = 0

				arg_505_1.mask_.enabled = false
				var_508_25.a = var_508_26
				arg_505_1.mask_.color = var_508_25
			end

			local var_508_27 = arg_505_1.actors_["2079ui_story"].transform
			local var_508_28 = 1.966

			if var_508_28 < arg_505_1.time_ and arg_505_1.time_ <= var_508_28 + arg_508_0 then
				arg_505_1.var_.moveOldPos2079ui_story = var_508_27.localPosition
			end

			local var_508_29 = 0.001

			if var_508_28 <= arg_505_1.time_ and arg_505_1.time_ < var_508_28 + var_508_29 then
				local var_508_30 = (arg_505_1.time_ - var_508_28) / var_508_29
				local var_508_31 = Vector3.New(0, 100, 0)

				var_508_27.localPosition = Vector3.Lerp(arg_505_1.var_.moveOldPos2079ui_story, var_508_31, var_508_30)

				local var_508_32 = manager.ui.mainCamera.transform.position - var_508_27.position

				var_508_27.forward = Vector3.New(var_508_32.x, var_508_32.y, var_508_32.z)

				local var_508_33 = var_508_27.localEulerAngles

				var_508_33.z = 0
				var_508_33.x = 0
				var_508_27.localEulerAngles = var_508_33
			end

			if arg_505_1.time_ >= var_508_28 + var_508_29 and arg_505_1.time_ < var_508_28 + var_508_29 + arg_508_0 then
				var_508_27.localPosition = Vector3.New(0, 100, 0)

				local var_508_34 = manager.ui.mainCamera.transform.position - var_508_27.position

				var_508_27.forward = Vector3.New(var_508_34.x, var_508_34.y, var_508_34.z)

				local var_508_35 = var_508_27.localEulerAngles

				var_508_35.z = 0
				var_508_35.x = 0
				var_508_27.localEulerAngles = var_508_35
			end

			local var_508_36 = arg_505_1.actors_["1028ui_story"].transform
			local var_508_37 = 4

			if var_508_37 < arg_505_1.time_ and arg_505_1.time_ <= var_508_37 + arg_508_0 then
				arg_505_1.var_.moveOldPos1028ui_story = var_508_36.localPosition
			end

			local var_508_38 = 0.001

			if var_508_37 <= arg_505_1.time_ and arg_505_1.time_ < var_508_37 + var_508_38 then
				local var_508_39 = (arg_505_1.time_ - var_508_37) / var_508_38
				local var_508_40 = Vector3.New(0, -0.9, -5.9)

				var_508_36.localPosition = Vector3.Lerp(arg_505_1.var_.moveOldPos1028ui_story, var_508_40, var_508_39)

				local var_508_41 = manager.ui.mainCamera.transform.position - var_508_36.position

				var_508_36.forward = Vector3.New(var_508_41.x, var_508_41.y, var_508_41.z)

				local var_508_42 = var_508_36.localEulerAngles

				var_508_42.z = 0
				var_508_42.x = 0
				var_508_36.localEulerAngles = var_508_42
			end

			if arg_505_1.time_ >= var_508_37 + var_508_38 and arg_505_1.time_ < var_508_37 + var_508_38 + arg_508_0 then
				var_508_36.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_508_43 = manager.ui.mainCamera.transform.position - var_508_36.position

				var_508_36.forward = Vector3.New(var_508_43.x, var_508_43.y, var_508_43.z)

				local var_508_44 = var_508_36.localEulerAngles

				var_508_44.z = 0
				var_508_44.x = 0
				var_508_36.localEulerAngles = var_508_44
			end

			local var_508_45 = arg_505_1.actors_["1028ui_story"]
			local var_508_46 = 4

			if var_508_46 < arg_505_1.time_ and arg_505_1.time_ <= var_508_46 + arg_508_0 and arg_505_1.var_.characterEffect1028ui_story == nil then
				arg_505_1.var_.characterEffect1028ui_story = var_508_45:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_508_47 = 0.2

			if var_508_46 <= arg_505_1.time_ and arg_505_1.time_ < var_508_46 + var_508_47 then
				local var_508_48 = (arg_505_1.time_ - var_508_46) / var_508_47

				if arg_505_1.var_.characterEffect1028ui_story then
					arg_505_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_505_1.time_ >= var_508_46 + var_508_47 and arg_505_1.time_ < var_508_46 + var_508_47 + arg_508_0 and arg_505_1.var_.characterEffect1028ui_story then
				arg_505_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_508_49 = 4

			if var_508_49 < arg_505_1.time_ and arg_505_1.time_ <= var_508_49 + arg_508_0 then
				arg_505_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_508_50 = 4

			if var_508_50 < arg_505_1.time_ and arg_505_1.time_ <= var_508_50 + arg_508_0 then
				arg_505_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			if arg_505_1.frameCnt_ <= 1 then
				arg_505_1.dialog_:SetActive(false)
			end

			local var_508_51 = 4
			local var_508_52 = 0.275

			if var_508_51 < arg_505_1.time_ and arg_505_1.time_ <= var_508_51 + arg_508_0 then
				arg_505_1.talkMaxDuration = 0

				arg_505_1.dialog_:SetActive(true)

				local var_508_53 = LeanTween.value(arg_505_1.dialog_, 0, 1, 0.3)

				var_508_53:setOnUpdate(LuaHelper.FloatAction(function(arg_509_0)
					arg_505_1.dialogCg_.alpha = arg_509_0
				end))
				var_508_53:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_505_1.dialog_)
					var_508_53:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_505_1.duration_ = arg_505_1.duration_ + 0.3

				SetActive(arg_505_1.leftNameGo_, true)

				local var_508_54 = arg_505_1:FormatText(StoryNameCfg[327].name)

				arg_505_1.leftNameTxt_.text = var_508_54

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_505_1.leftNameTxt_.transform)

				arg_505_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_505_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_505_1:RecordName(arg_505_1.leftNameTxt_.text)
				SetActive(arg_505_1.iconTrs_.gameObject, false)
				arg_505_1.callingController_:SetSelectedState("normal")

				local var_508_55 = arg_505_1:GetWordFromCfg(116431121)
				local var_508_56 = arg_505_1:FormatText(var_508_55.content)

				arg_505_1.text_.text = var_508_56

				LuaForUtil.ClearLinePrefixSymbol(arg_505_1.text_)

				local var_508_57 = 11
				local var_508_58 = utf8.len(var_508_56)
				local var_508_59 = var_508_57 <= 0 and var_508_52 or var_508_52 * (var_508_58 / var_508_57)

				if var_508_59 > 0 and var_508_52 < var_508_59 then
					arg_505_1.talkMaxDuration = var_508_59
					var_508_51 = var_508_51 + 0.3

					if var_508_59 + var_508_51 > arg_505_1.duration_ then
						arg_505_1.duration_ = var_508_59 + var_508_51
					end
				end

				arg_505_1.text_.text = var_508_56
				arg_505_1.typewritter.percent = 0

				arg_505_1.typewritter:SetDirty()
				arg_505_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431121", "story_v_out_116431.awb") ~= 0 then
					local var_508_60 = manager.audio:GetVoiceLength("story_v_out_116431", "116431121", "story_v_out_116431.awb") / 1000

					if var_508_60 + var_508_51 > arg_505_1.duration_ then
						arg_505_1.duration_ = var_508_60 + var_508_51
					end

					if var_508_55.prefab_name ~= "" and arg_505_1.actors_[var_508_55.prefab_name] ~= nil then
						local var_508_61 = LuaForUtil.PlayVoiceWithCriLipsync(arg_505_1.actors_[var_508_55.prefab_name].transform, "story_v_out_116431", "116431121", "story_v_out_116431.awb")

						arg_505_1:RecordAudio("116431121", var_508_61)
						arg_505_1:RecordAudio("116431121", var_508_61)
					else
						arg_505_1:AudioAction("play", "voice", "story_v_out_116431", "116431121", "story_v_out_116431.awb")
					end

					arg_505_1:RecordHistoryTalkVoice("story_v_out_116431", "116431121", "story_v_out_116431.awb")
				end

				arg_505_1:RecordContent(arg_505_1.text_.text)
			end

			local var_508_62 = var_508_51 + 0.3
			local var_508_63 = math.max(var_508_52, arg_505_1.talkMaxDuration)

			if var_508_62 <= arg_505_1.time_ and arg_505_1.time_ < var_508_62 + var_508_63 then
				arg_505_1.typewritter.percent = (arg_505_1.time_ - var_508_62) / var_508_63

				arg_505_1.typewritter:SetDirty()
			end

			if arg_505_1.time_ >= var_508_62 + var_508_63 and arg_505_1.time_ < var_508_62 + var_508_63 + arg_508_0 then
				arg_505_1.typewritter.percent = 1

				arg_505_1.typewritter:SetDirty()
				arg_505_1:ShowNextGo(true)
			end
		end
	end,
	Play116431122 = function(arg_511_0, arg_511_1)
		arg_511_1.time_ = 0
		arg_511_1.frameCnt_ = 0
		arg_511_1.state_ = "playing"
		arg_511_1.curTalkId_ = 116431122
		arg_511_1.duration_ = 5

		local var_511_0 = {
			zh = 4.833,
			ja = 5
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
				arg_511_0:Play116431123(arg_511_1)
			end
		end

		function arg_511_1.onSingleLineUpdate_(arg_514_0)
			local var_514_0 = 0

			if var_514_0 < arg_511_1.time_ and arg_511_1.time_ <= var_514_0 + arg_514_0 then
				arg_511_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action6_1")
			end

			local var_514_1 = 0

			if var_514_1 < arg_511_1.time_ and arg_511_1.time_ <= var_514_1 + arg_514_0 then
				arg_511_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_514_2 = 0
			local var_514_3 = 0.525

			if var_514_2 < arg_511_1.time_ and arg_511_1.time_ <= var_514_2 + arg_514_0 then
				arg_511_1.talkMaxDuration = 0
				arg_511_1.dialogCg_.alpha = 1

				arg_511_1.dialog_:SetActive(true)
				SetActive(arg_511_1.leftNameGo_, true)

				local var_514_4 = arg_511_1:FormatText(StoryNameCfg[327].name)

				arg_511_1.leftNameTxt_.text = var_514_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_511_1.leftNameTxt_.transform)

				arg_511_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_511_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_511_1:RecordName(arg_511_1.leftNameTxt_.text)
				SetActive(arg_511_1.iconTrs_.gameObject, false)
				arg_511_1.callingController_:SetSelectedState("normal")

				local var_514_5 = arg_511_1:GetWordFromCfg(116431122)
				local var_514_6 = arg_511_1:FormatText(var_514_5.content)

				arg_511_1.text_.text = var_514_6

				LuaForUtil.ClearLinePrefixSymbol(arg_511_1.text_)

				local var_514_7 = 21
				local var_514_8 = utf8.len(var_514_6)
				local var_514_9 = var_514_7 <= 0 and var_514_3 or var_514_3 * (var_514_8 / var_514_7)

				if var_514_9 > 0 and var_514_3 < var_514_9 then
					arg_511_1.talkMaxDuration = var_514_9

					if var_514_9 + var_514_2 > arg_511_1.duration_ then
						arg_511_1.duration_ = var_514_9 + var_514_2
					end
				end

				arg_511_1.text_.text = var_514_6
				arg_511_1.typewritter.percent = 0

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431122", "story_v_out_116431.awb") ~= 0 then
					local var_514_10 = manager.audio:GetVoiceLength("story_v_out_116431", "116431122", "story_v_out_116431.awb") / 1000

					if var_514_10 + var_514_2 > arg_511_1.duration_ then
						arg_511_1.duration_ = var_514_10 + var_514_2
					end

					if var_514_5.prefab_name ~= "" and arg_511_1.actors_[var_514_5.prefab_name] ~= nil then
						local var_514_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_511_1.actors_[var_514_5.prefab_name].transform, "story_v_out_116431", "116431122", "story_v_out_116431.awb")

						arg_511_1:RecordAudio("116431122", var_514_11)
						arg_511_1:RecordAudio("116431122", var_514_11)
					else
						arg_511_1:AudioAction("play", "voice", "story_v_out_116431", "116431122", "story_v_out_116431.awb")
					end

					arg_511_1:RecordHistoryTalkVoice("story_v_out_116431", "116431122", "story_v_out_116431.awb")
				end

				arg_511_1:RecordContent(arg_511_1.text_.text)
			end

			local var_514_12 = math.max(var_514_3, arg_511_1.talkMaxDuration)

			if var_514_2 <= arg_511_1.time_ and arg_511_1.time_ < var_514_2 + var_514_12 then
				arg_511_1.typewritter.percent = (arg_511_1.time_ - var_514_2) / var_514_12

				arg_511_1.typewritter:SetDirty()
			end

			if arg_511_1.time_ >= var_514_2 + var_514_12 and arg_511_1.time_ < var_514_2 + var_514_12 + arg_514_0 then
				arg_511_1.typewritter.percent = 1

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(true)
			end
		end
	end,
	Play116431123 = function(arg_515_0, arg_515_1)
		arg_515_1.time_ = 0
		arg_515_1.frameCnt_ = 0
		arg_515_1.state_ = "playing"
		arg_515_1.curTalkId_ = 116431123
		arg_515_1.duration_ = 2.699999999999

		SetActive(arg_515_1.tipsGo_, false)

		function arg_515_1.onSingleLineFinish_()
			arg_515_1.onSingleLineUpdate_ = nil
			arg_515_1.onSingleLineFinish_ = nil
			arg_515_1.state_ = "waiting"
		end

		function arg_515_1.playNext_(arg_517_0)
			if arg_517_0 == 1 then
				arg_515_0:Play116431124(arg_515_1)
			end
		end

		function arg_515_1.onSingleLineUpdate_(arg_518_0)
			local var_518_0 = arg_515_1.actors_["1029ui_story"].transform
			local var_518_1 = 0

			if var_518_1 < arg_515_1.time_ and arg_515_1.time_ <= var_518_1 + arg_518_0 then
				arg_515_1.var_.moveOldPos1029ui_story = var_518_0.localPosition
			end

			local var_518_2 = 0.001

			if var_518_1 <= arg_515_1.time_ and arg_515_1.time_ < var_518_1 + var_518_2 then
				local var_518_3 = (arg_515_1.time_ - var_518_1) / var_518_2
				local var_518_4 = Vector3.New(0.7, -1.09, -6.2)

				var_518_0.localPosition = Vector3.Lerp(arg_515_1.var_.moveOldPos1029ui_story, var_518_4, var_518_3)

				local var_518_5 = manager.ui.mainCamera.transform.position - var_518_0.position

				var_518_0.forward = Vector3.New(var_518_5.x, var_518_5.y, var_518_5.z)

				local var_518_6 = var_518_0.localEulerAngles

				var_518_6.z = 0
				var_518_6.x = 0
				var_518_0.localEulerAngles = var_518_6
			end

			if arg_515_1.time_ >= var_518_1 + var_518_2 and arg_515_1.time_ < var_518_1 + var_518_2 + arg_518_0 then
				var_518_0.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_518_7 = manager.ui.mainCamera.transform.position - var_518_0.position

				var_518_0.forward = Vector3.New(var_518_7.x, var_518_7.y, var_518_7.z)

				local var_518_8 = var_518_0.localEulerAngles

				var_518_8.z = 0
				var_518_8.x = 0
				var_518_0.localEulerAngles = var_518_8
			end

			local var_518_9 = arg_515_1.actors_["1028ui_story"]
			local var_518_10 = 0

			if var_518_10 < arg_515_1.time_ and arg_515_1.time_ <= var_518_10 + arg_518_0 and arg_515_1.var_.characterEffect1028ui_story == nil then
				arg_515_1.var_.characterEffect1028ui_story = var_518_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_518_11 = 0.2

			if var_518_10 <= arg_515_1.time_ and arg_515_1.time_ < var_518_10 + var_518_11 then
				local var_518_12 = (arg_515_1.time_ - var_518_10) / var_518_11

				if arg_515_1.var_.characterEffect1028ui_story then
					local var_518_13 = Mathf.Lerp(0, 0.5, var_518_12)

					arg_515_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_515_1.var_.characterEffect1028ui_story.fillRatio = var_518_13
				end
			end

			if arg_515_1.time_ >= var_518_10 + var_518_11 and arg_515_1.time_ < var_518_10 + var_518_11 + arg_518_0 and arg_515_1.var_.characterEffect1028ui_story then
				local var_518_14 = 0.5

				arg_515_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_515_1.var_.characterEffect1028ui_story.fillRatio = var_518_14
			end

			local var_518_15 = arg_515_1.actors_["1029ui_story"]
			local var_518_16 = 0

			if var_518_16 < arg_515_1.time_ and arg_515_1.time_ <= var_518_16 + arg_518_0 and arg_515_1.var_.characterEffect1029ui_story == nil then
				arg_515_1.var_.characterEffect1029ui_story = var_518_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_518_17 = 0.2

			if var_518_16 <= arg_515_1.time_ and arg_515_1.time_ < var_518_16 + var_518_17 then
				local var_518_18 = (arg_515_1.time_ - var_518_16) / var_518_17

				if arg_515_1.var_.characterEffect1029ui_story then
					arg_515_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_515_1.time_ >= var_518_16 + var_518_17 and arg_515_1.time_ < var_518_16 + var_518_17 + arg_518_0 and arg_515_1.var_.characterEffect1029ui_story then
				arg_515_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_518_19 = 0

			if var_518_19 < arg_515_1.time_ and arg_515_1.time_ <= var_518_19 + arg_518_0 then
				arg_515_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action6_1")
			end

			local var_518_20 = 0

			if var_518_20 < arg_515_1.time_ and arg_515_1.time_ <= var_518_20 + arg_518_0 then
				arg_515_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_518_21 = arg_515_1.actors_["1028ui_story"].transform
			local var_518_22 = 0

			if var_518_22 < arg_515_1.time_ and arg_515_1.time_ <= var_518_22 + arg_518_0 then
				arg_515_1.var_.moveOldPos1028ui_story = var_518_21.localPosition
			end

			local var_518_23 = 0.001

			if var_518_22 <= arg_515_1.time_ and arg_515_1.time_ < var_518_22 + var_518_23 then
				local var_518_24 = (arg_515_1.time_ - var_518_22) / var_518_23
				local var_518_25 = Vector3.New(-0.7, -0.9, -5.9)

				var_518_21.localPosition = Vector3.Lerp(arg_515_1.var_.moveOldPos1028ui_story, var_518_25, var_518_24)

				local var_518_26 = manager.ui.mainCamera.transform.position - var_518_21.position

				var_518_21.forward = Vector3.New(var_518_26.x, var_518_26.y, var_518_26.z)

				local var_518_27 = var_518_21.localEulerAngles

				var_518_27.z = 0
				var_518_27.x = 0
				var_518_21.localEulerAngles = var_518_27
			end

			if arg_515_1.time_ >= var_518_22 + var_518_23 and arg_515_1.time_ < var_518_22 + var_518_23 + arg_518_0 then
				var_518_21.localPosition = Vector3.New(-0.7, -0.9, -5.9)

				local var_518_28 = manager.ui.mainCamera.transform.position - var_518_21.position

				var_518_21.forward = Vector3.New(var_518_28.x, var_518_28.y, var_518_28.z)

				local var_518_29 = var_518_21.localEulerAngles

				var_518_29.z = 0
				var_518_29.x = 0
				var_518_21.localEulerAngles = var_518_29
			end

			local var_518_30 = 0
			local var_518_31 = 0.05

			if var_518_30 < arg_515_1.time_ and arg_515_1.time_ <= var_518_30 + arg_518_0 then
				arg_515_1.talkMaxDuration = 0
				arg_515_1.dialogCg_.alpha = 1

				arg_515_1.dialog_:SetActive(true)
				SetActive(arg_515_1.leftNameGo_, true)

				local var_518_32 = arg_515_1:FormatText(StoryNameCfg[319].name)

				arg_515_1.leftNameTxt_.text = var_518_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_515_1.leftNameTxt_.transform)

				arg_515_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_515_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_515_1:RecordName(arg_515_1.leftNameTxt_.text)
				SetActive(arg_515_1.iconTrs_.gameObject, false)
				arg_515_1.callingController_:SetSelectedState("normal")

				local var_518_33 = arg_515_1:GetWordFromCfg(116431123)
				local var_518_34 = arg_515_1:FormatText(var_518_33.content)

				arg_515_1.text_.text = var_518_34

				LuaForUtil.ClearLinePrefixSymbol(arg_515_1.text_)

				local var_518_35 = 2
				local var_518_36 = utf8.len(var_518_34)
				local var_518_37 = var_518_35 <= 0 and var_518_31 or var_518_31 * (var_518_36 / var_518_35)

				if var_518_37 > 0 and var_518_31 < var_518_37 then
					arg_515_1.talkMaxDuration = var_518_37

					if var_518_37 + var_518_30 > arg_515_1.duration_ then
						arg_515_1.duration_ = var_518_37 + var_518_30
					end
				end

				arg_515_1.text_.text = var_518_34
				arg_515_1.typewritter.percent = 0

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431123", "story_v_out_116431.awb") ~= 0 then
					local var_518_38 = manager.audio:GetVoiceLength("story_v_out_116431", "116431123", "story_v_out_116431.awb") / 1000

					if var_518_38 + var_518_30 > arg_515_1.duration_ then
						arg_515_1.duration_ = var_518_38 + var_518_30
					end

					if var_518_33.prefab_name ~= "" and arg_515_1.actors_[var_518_33.prefab_name] ~= nil then
						local var_518_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_515_1.actors_[var_518_33.prefab_name].transform, "story_v_out_116431", "116431123", "story_v_out_116431.awb")

						arg_515_1:RecordAudio("116431123", var_518_39)
						arg_515_1:RecordAudio("116431123", var_518_39)
					else
						arg_515_1:AudioAction("play", "voice", "story_v_out_116431", "116431123", "story_v_out_116431.awb")
					end

					arg_515_1:RecordHistoryTalkVoice("story_v_out_116431", "116431123", "story_v_out_116431.awb")
				end

				arg_515_1:RecordContent(arg_515_1.text_.text)
			end

			local var_518_40 = math.max(var_518_31, arg_515_1.talkMaxDuration)

			if var_518_30 <= arg_515_1.time_ and arg_515_1.time_ < var_518_30 + var_518_40 then
				arg_515_1.typewritter.percent = (arg_515_1.time_ - var_518_30) / var_518_40

				arg_515_1.typewritter:SetDirty()
			end

			if arg_515_1.time_ >= var_518_30 + var_518_40 and arg_515_1.time_ < var_518_30 + var_518_40 + arg_518_0 then
				arg_515_1.typewritter.percent = 1

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(true)
			end
		end
	end,
	Play116431124 = function(arg_519_0, arg_519_1)
		arg_519_1.time_ = 0
		arg_519_1.frameCnt_ = 0
		arg_519_1.state_ = "playing"
		arg_519_1.curTalkId_ = 116431124
		arg_519_1.duration_ = 3.666

		local var_519_0 = {
			zh = 3.6,
			ja = 3.666
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
				arg_519_0:Play116431125(arg_519_1)
			end
		end

		function arg_519_1.onSingleLineUpdate_(arg_522_0)
			local var_522_0 = arg_519_1.actors_["1028ui_story"].transform
			local var_522_1 = 0

			if var_522_1 < arg_519_1.time_ and arg_519_1.time_ <= var_522_1 + arg_522_0 then
				arg_519_1.var_.moveOldPos1028ui_story = var_522_0.localPosition
			end

			local var_522_2 = 0.001

			if var_522_1 <= arg_519_1.time_ and arg_519_1.time_ < var_522_1 + var_522_2 then
				local var_522_3 = (arg_519_1.time_ - var_522_1) / var_522_2
				local var_522_4 = Vector3.New(-0.7, -0.9, -5.9)

				var_522_0.localPosition = Vector3.Lerp(arg_519_1.var_.moveOldPos1028ui_story, var_522_4, var_522_3)

				local var_522_5 = manager.ui.mainCamera.transform.position - var_522_0.position

				var_522_0.forward = Vector3.New(var_522_5.x, var_522_5.y, var_522_5.z)

				local var_522_6 = var_522_0.localEulerAngles

				var_522_6.z = 0
				var_522_6.x = 0
				var_522_0.localEulerAngles = var_522_6
			end

			if arg_519_1.time_ >= var_522_1 + var_522_2 and arg_519_1.time_ < var_522_1 + var_522_2 + arg_522_0 then
				var_522_0.localPosition = Vector3.New(-0.7, -0.9, -5.9)

				local var_522_7 = manager.ui.mainCamera.transform.position - var_522_0.position

				var_522_0.forward = Vector3.New(var_522_7.x, var_522_7.y, var_522_7.z)

				local var_522_8 = var_522_0.localEulerAngles

				var_522_8.z = 0
				var_522_8.x = 0
				var_522_0.localEulerAngles = var_522_8
			end

			local var_522_9 = arg_519_1.actors_["1029ui_story"].transform
			local var_522_10 = 0

			if var_522_10 < arg_519_1.time_ and arg_519_1.time_ <= var_522_10 + arg_522_0 then
				arg_519_1.var_.moveOldPos1029ui_story = var_522_9.localPosition
			end

			local var_522_11 = 0.001

			if var_522_10 <= arg_519_1.time_ and arg_519_1.time_ < var_522_10 + var_522_11 then
				local var_522_12 = (arg_519_1.time_ - var_522_10) / var_522_11
				local var_522_13 = Vector3.New(0.7, -1.09, -6.2)

				var_522_9.localPosition = Vector3.Lerp(arg_519_1.var_.moveOldPos1029ui_story, var_522_13, var_522_12)

				local var_522_14 = manager.ui.mainCamera.transform.position - var_522_9.position

				var_522_9.forward = Vector3.New(var_522_14.x, var_522_14.y, var_522_14.z)

				local var_522_15 = var_522_9.localEulerAngles

				var_522_15.z = 0
				var_522_15.x = 0
				var_522_9.localEulerAngles = var_522_15
			end

			if arg_519_1.time_ >= var_522_10 + var_522_11 and arg_519_1.time_ < var_522_10 + var_522_11 + arg_522_0 then
				var_522_9.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_522_16 = manager.ui.mainCamera.transform.position - var_522_9.position

				var_522_9.forward = Vector3.New(var_522_16.x, var_522_16.y, var_522_16.z)

				local var_522_17 = var_522_9.localEulerAngles

				var_522_17.z = 0
				var_522_17.x = 0
				var_522_9.localEulerAngles = var_522_17
			end

			local var_522_18 = 0

			if var_522_18 < arg_519_1.time_ and arg_519_1.time_ <= var_522_18 + arg_522_0 then
				arg_519_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_522_19 = 0
			local var_522_20 = 0.425

			if var_522_19 < arg_519_1.time_ and arg_519_1.time_ <= var_522_19 + arg_522_0 then
				arg_519_1.talkMaxDuration = 0
				arg_519_1.dialogCg_.alpha = 1

				arg_519_1.dialog_:SetActive(true)
				SetActive(arg_519_1.leftNameGo_, true)

				local var_522_21 = arg_519_1:FormatText(StoryNameCfg[319].name)

				arg_519_1.leftNameTxt_.text = var_522_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_519_1.leftNameTxt_.transform)

				arg_519_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_519_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_519_1:RecordName(arg_519_1.leftNameTxt_.text)
				SetActive(arg_519_1.iconTrs_.gameObject, false)
				arg_519_1.callingController_:SetSelectedState("normal")

				local var_522_22 = arg_519_1:GetWordFromCfg(116431124)
				local var_522_23 = arg_519_1:FormatText(var_522_22.content)

				arg_519_1.text_.text = var_522_23

				LuaForUtil.ClearLinePrefixSymbol(arg_519_1.text_)

				local var_522_24 = 17
				local var_522_25 = utf8.len(var_522_23)
				local var_522_26 = var_522_24 <= 0 and var_522_20 or var_522_20 * (var_522_25 / var_522_24)

				if var_522_26 > 0 and var_522_20 < var_522_26 then
					arg_519_1.talkMaxDuration = var_522_26

					if var_522_26 + var_522_19 > arg_519_1.duration_ then
						arg_519_1.duration_ = var_522_26 + var_522_19
					end
				end

				arg_519_1.text_.text = var_522_23
				arg_519_1.typewritter.percent = 0

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431124", "story_v_out_116431.awb") ~= 0 then
					local var_522_27 = manager.audio:GetVoiceLength("story_v_out_116431", "116431124", "story_v_out_116431.awb") / 1000

					if var_522_27 + var_522_19 > arg_519_1.duration_ then
						arg_519_1.duration_ = var_522_27 + var_522_19
					end

					if var_522_22.prefab_name ~= "" and arg_519_1.actors_[var_522_22.prefab_name] ~= nil then
						local var_522_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_519_1.actors_[var_522_22.prefab_name].transform, "story_v_out_116431", "116431124", "story_v_out_116431.awb")

						arg_519_1:RecordAudio("116431124", var_522_28)
						arg_519_1:RecordAudio("116431124", var_522_28)
					else
						arg_519_1:AudioAction("play", "voice", "story_v_out_116431", "116431124", "story_v_out_116431.awb")
					end

					arg_519_1:RecordHistoryTalkVoice("story_v_out_116431", "116431124", "story_v_out_116431.awb")
				end

				arg_519_1:RecordContent(arg_519_1.text_.text)
			end

			local var_522_29 = math.max(var_522_20, arg_519_1.talkMaxDuration)

			if var_522_19 <= arg_519_1.time_ and arg_519_1.time_ < var_522_19 + var_522_29 then
				arg_519_1.typewritter.percent = (arg_519_1.time_ - var_522_19) / var_522_29

				arg_519_1.typewritter:SetDirty()
			end

			if arg_519_1.time_ >= var_522_19 + var_522_29 and arg_519_1.time_ < var_522_19 + var_522_29 + arg_522_0 then
				arg_519_1.typewritter.percent = 1

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(true)
			end
		end
	end,
	Play116431125 = function(arg_523_0, arg_523_1)
		arg_523_1.time_ = 0
		arg_523_1.frameCnt_ = 0
		arg_523_1.state_ = "playing"
		arg_523_1.curTalkId_ = 116431125
		arg_523_1.duration_ = 5

		SetActive(arg_523_1.tipsGo_, false)

		function arg_523_1.onSingleLineFinish_()
			arg_523_1.onSingleLineUpdate_ = nil
			arg_523_1.onSingleLineFinish_ = nil
			arg_523_1.state_ = "waiting"
		end

		function arg_523_1.playNext_(arg_525_0)
			if arg_525_0 == 1 then
				arg_523_0:Play116431126(arg_523_1)
			end
		end

		function arg_523_1.onSingleLineUpdate_(arg_526_0)
			local var_526_0 = arg_523_1.actors_["1028ui_story"].transform
			local var_526_1 = 0

			if var_526_1 < arg_523_1.time_ and arg_523_1.time_ <= var_526_1 + arg_526_0 then
				arg_523_1.var_.moveOldPos1028ui_story = var_526_0.localPosition
			end

			local var_526_2 = 0.001

			if var_526_1 <= arg_523_1.time_ and arg_523_1.time_ < var_526_1 + var_526_2 then
				local var_526_3 = (arg_523_1.time_ - var_526_1) / var_526_2
				local var_526_4 = Vector3.New(0, 100, 0)

				var_526_0.localPosition = Vector3.Lerp(arg_523_1.var_.moveOldPos1028ui_story, var_526_4, var_526_3)

				local var_526_5 = manager.ui.mainCamera.transform.position - var_526_0.position

				var_526_0.forward = Vector3.New(var_526_5.x, var_526_5.y, var_526_5.z)

				local var_526_6 = var_526_0.localEulerAngles

				var_526_6.z = 0
				var_526_6.x = 0
				var_526_0.localEulerAngles = var_526_6
			end

			if arg_523_1.time_ >= var_526_1 + var_526_2 and arg_523_1.time_ < var_526_1 + var_526_2 + arg_526_0 then
				var_526_0.localPosition = Vector3.New(0, 100, 0)

				local var_526_7 = manager.ui.mainCamera.transform.position - var_526_0.position

				var_526_0.forward = Vector3.New(var_526_7.x, var_526_7.y, var_526_7.z)

				local var_526_8 = var_526_0.localEulerAngles

				var_526_8.z = 0
				var_526_8.x = 0
				var_526_0.localEulerAngles = var_526_8
			end

			local var_526_9 = arg_523_1.actors_["1029ui_story"].transform
			local var_526_10 = 0

			if var_526_10 < arg_523_1.time_ and arg_523_1.time_ <= var_526_10 + arg_526_0 then
				arg_523_1.var_.moveOldPos1029ui_story = var_526_9.localPosition
			end

			local var_526_11 = 0.001

			if var_526_10 <= arg_523_1.time_ and arg_523_1.time_ < var_526_10 + var_526_11 then
				local var_526_12 = (arg_523_1.time_ - var_526_10) / var_526_11
				local var_526_13 = Vector3.New(0, 100, 0)

				var_526_9.localPosition = Vector3.Lerp(arg_523_1.var_.moveOldPos1029ui_story, var_526_13, var_526_12)

				local var_526_14 = manager.ui.mainCamera.transform.position - var_526_9.position

				var_526_9.forward = Vector3.New(var_526_14.x, var_526_14.y, var_526_14.z)

				local var_526_15 = var_526_9.localEulerAngles

				var_526_15.z = 0
				var_526_15.x = 0
				var_526_9.localEulerAngles = var_526_15
			end

			if arg_523_1.time_ >= var_526_10 + var_526_11 and arg_523_1.time_ < var_526_10 + var_526_11 + arg_526_0 then
				var_526_9.localPosition = Vector3.New(0, 100, 0)

				local var_526_16 = manager.ui.mainCamera.transform.position - var_526_9.position

				var_526_9.forward = Vector3.New(var_526_16.x, var_526_16.y, var_526_16.z)

				local var_526_17 = var_526_9.localEulerAngles

				var_526_17.z = 0
				var_526_17.x = 0
				var_526_9.localEulerAngles = var_526_17
			end

			local var_526_18 = 0
			local var_526_19 = 1.225

			if var_526_18 < arg_523_1.time_ and arg_523_1.time_ <= var_526_18 + arg_526_0 then
				arg_523_1.talkMaxDuration = 0
				arg_523_1.dialogCg_.alpha = 1

				arg_523_1.dialog_:SetActive(true)
				SetActive(arg_523_1.leftNameGo_, false)

				arg_523_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_523_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_523_1:RecordName(arg_523_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_523_1.iconTrs_.gameObject, false)
				arg_523_1.callingController_:SetSelectedState("normal")

				local var_526_20 = arg_523_1:GetWordFromCfg(116431125)
				local var_526_21 = arg_523_1:FormatText(var_526_20.content)

				arg_523_1.text_.text = var_526_21

				LuaForUtil.ClearLinePrefixSymbol(arg_523_1.text_)

				local var_526_22 = 49
				local var_526_23 = utf8.len(var_526_21)
				local var_526_24 = var_526_22 <= 0 and var_526_19 or var_526_19 * (var_526_23 / var_526_22)

				if var_526_24 > 0 and var_526_19 < var_526_24 then
					arg_523_1.talkMaxDuration = var_526_24

					if var_526_24 + var_526_18 > arg_523_1.duration_ then
						arg_523_1.duration_ = var_526_24 + var_526_18
					end
				end

				arg_523_1.text_.text = var_526_21
				arg_523_1.typewritter.percent = 0

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(false)
				arg_523_1:RecordContent(arg_523_1.text_.text)
			end

			local var_526_25 = math.max(var_526_19, arg_523_1.talkMaxDuration)

			if var_526_18 <= arg_523_1.time_ and arg_523_1.time_ < var_526_18 + var_526_25 then
				arg_523_1.typewritter.percent = (arg_523_1.time_ - var_526_18) / var_526_25

				arg_523_1.typewritter:SetDirty()
			end

			if arg_523_1.time_ >= var_526_18 + var_526_25 and arg_523_1.time_ < var_526_18 + var_526_25 + arg_526_0 then
				arg_523_1.typewritter.percent = 1

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(true)
			end
		end
	end,
	Play116431126 = function(arg_527_0, arg_527_1)
		arg_527_1.time_ = 0
		arg_527_1.frameCnt_ = 0
		arg_527_1.state_ = "playing"
		arg_527_1.curTalkId_ = 116431126
		arg_527_1.duration_ = 5

		SetActive(arg_527_1.tipsGo_, false)

		function arg_527_1.onSingleLineFinish_()
			arg_527_1.onSingleLineUpdate_ = nil
			arg_527_1.onSingleLineFinish_ = nil
			arg_527_1.state_ = "waiting"
		end

		function arg_527_1.playNext_(arg_529_0)
			if arg_529_0 == 1 then
				arg_527_0:Play116431127(arg_527_1)
			end
		end

		function arg_527_1.onSingleLineUpdate_(arg_530_0)
			local var_530_0 = 0
			local var_530_1 = 0.7

			if var_530_0 < arg_527_1.time_ and arg_527_1.time_ <= var_530_0 + arg_530_0 then
				arg_527_1.talkMaxDuration = 0
				arg_527_1.dialogCg_.alpha = 1

				arg_527_1.dialog_:SetActive(true)
				SetActive(arg_527_1.leftNameGo_, false)

				arg_527_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_527_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_527_1:RecordName(arg_527_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_527_1.iconTrs_.gameObject, false)
				arg_527_1.callingController_:SetSelectedState("normal")

				local var_530_2 = arg_527_1:GetWordFromCfg(116431126)
				local var_530_3 = arg_527_1:FormatText(var_530_2.content)

				arg_527_1.text_.text = var_530_3

				LuaForUtil.ClearLinePrefixSymbol(arg_527_1.text_)

				local var_530_4 = 28
				local var_530_5 = utf8.len(var_530_3)
				local var_530_6 = var_530_4 <= 0 and var_530_1 or var_530_1 * (var_530_5 / var_530_4)

				if var_530_6 > 0 and var_530_1 < var_530_6 then
					arg_527_1.talkMaxDuration = var_530_6

					if var_530_6 + var_530_0 > arg_527_1.duration_ then
						arg_527_1.duration_ = var_530_6 + var_530_0
					end
				end

				arg_527_1.text_.text = var_530_3
				arg_527_1.typewritter.percent = 0

				arg_527_1.typewritter:SetDirty()
				arg_527_1:ShowNextGo(false)
				arg_527_1:RecordContent(arg_527_1.text_.text)
			end

			local var_530_7 = math.max(var_530_1, arg_527_1.talkMaxDuration)

			if var_530_0 <= arg_527_1.time_ and arg_527_1.time_ < var_530_0 + var_530_7 then
				arg_527_1.typewritter.percent = (arg_527_1.time_ - var_530_0) / var_530_7

				arg_527_1.typewritter:SetDirty()
			end

			if arg_527_1.time_ >= var_530_0 + var_530_7 and arg_527_1.time_ < var_530_0 + var_530_7 + arg_530_0 then
				arg_527_1.typewritter.percent = 1

				arg_527_1.typewritter:SetDirty()
				arg_527_1:ShowNextGo(true)
			end
		end
	end,
	Play116431127 = function(arg_531_0, arg_531_1)
		arg_531_1.time_ = 0
		arg_531_1.frameCnt_ = 0
		arg_531_1.state_ = "playing"
		arg_531_1.curTalkId_ = 116431127
		arg_531_1.duration_ = 9

		SetActive(arg_531_1.tipsGo_, false)

		function arg_531_1.onSingleLineFinish_()
			arg_531_1.onSingleLineUpdate_ = nil
			arg_531_1.onSingleLineFinish_ = nil
			arg_531_1.state_ = "waiting"
		end

		function arg_531_1.playNext_(arg_533_0)
			if arg_533_0 == 1 then
				arg_531_0:Play116431128(arg_531_1)
			end
		end

		function arg_531_1.onSingleLineUpdate_(arg_534_0)
			local var_534_0 = 2

			if var_534_0 < arg_531_1.time_ and arg_531_1.time_ <= var_534_0 + arg_534_0 then
				local var_534_1 = manager.ui.mainCamera.transform.localPosition
				local var_534_2 = Vector3.New(0, 0, 10) + Vector3.New(var_534_1.x, var_534_1.y, 0)
				local var_534_3 = arg_531_1.bgs_.I05e

				var_534_3.transform.localPosition = var_534_2
				var_534_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_534_4 = var_534_3:GetComponent("SpriteRenderer")

				if var_534_4 and var_534_4.sprite then
					local var_534_5 = (var_534_3.transform.localPosition - var_534_1).z
					local var_534_6 = manager.ui.mainCameraCom_
					local var_534_7 = 2 * var_534_5 * Mathf.Tan(var_534_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_534_8 = var_534_7 * var_534_6.aspect
					local var_534_9 = var_534_4.sprite.bounds.size.x
					local var_534_10 = var_534_4.sprite.bounds.size.y
					local var_534_11 = var_534_8 / var_534_9
					local var_534_12 = var_534_7 / var_534_10
					local var_534_13 = var_534_12 < var_534_11 and var_534_11 or var_534_12

					var_534_3.transform.localScale = Vector3.New(var_534_13, var_534_13, 0)
				end

				for iter_534_0, iter_534_1 in pairs(arg_531_1.bgs_) do
					if iter_534_0 ~= "I05e" then
						iter_534_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_534_14 = 2

			if var_534_14 < arg_531_1.time_ and arg_531_1.time_ <= var_534_14 + arg_534_0 then
				arg_531_1.mask_.enabled = true
				arg_531_1.mask_.raycastTarget = true

				arg_531_1:SetGaussion(false)
			end

			local var_534_15 = 2

			if var_534_14 <= arg_531_1.time_ and arg_531_1.time_ < var_534_14 + var_534_15 then
				local var_534_16 = (arg_531_1.time_ - var_534_14) / var_534_15
				local var_534_17 = Color.New(0, 0, 0)

				var_534_17.a = Mathf.Lerp(1, 0, var_534_16)
				arg_531_1.mask_.color = var_534_17
			end

			if arg_531_1.time_ >= var_534_14 + var_534_15 and arg_531_1.time_ < var_534_14 + var_534_15 + arg_534_0 then
				local var_534_18 = Color.New(0, 0, 0)
				local var_534_19 = 0

				arg_531_1.mask_.enabled = false
				var_534_18.a = var_534_19
				arg_531_1.mask_.color = var_534_18
			end

			local var_534_20 = 0

			if var_534_20 < arg_531_1.time_ and arg_531_1.time_ <= var_534_20 + arg_534_0 then
				arg_531_1.mask_.enabled = true
				arg_531_1.mask_.raycastTarget = true

				arg_531_1:SetGaussion(false)
			end

			local var_534_21 = 2

			if var_534_20 <= arg_531_1.time_ and arg_531_1.time_ < var_534_20 + var_534_21 then
				local var_534_22 = (arg_531_1.time_ - var_534_20) / var_534_21
				local var_534_23 = Color.New(0, 0, 0)

				var_534_23.a = Mathf.Lerp(0, 1, var_534_22)
				arg_531_1.mask_.color = var_534_23
			end

			if arg_531_1.time_ >= var_534_20 + var_534_21 and arg_531_1.time_ < var_534_20 + var_534_21 + arg_534_0 then
				local var_534_24 = Color.New(0, 0, 0)

				var_534_24.a = 1
				arg_531_1.mask_.color = var_534_24
			end

			local var_534_25 = 0
			local var_534_26 = 1

			if var_534_25 < arg_531_1.time_ and arg_531_1.time_ <= var_534_25 + arg_534_0 then
				local var_534_27 = "stop"
				local var_534_28 = "music"

				arg_531_1:AudioAction(var_534_27, var_534_28, "se_story_16", "se_story_16_rain01_loop", "")
			end

			local var_534_29 = 0
			local var_534_30 = 1

			if var_534_29 < arg_531_1.time_ and arg_531_1.time_ <= var_534_29 + arg_534_0 then
				local var_534_31 = "play"
				local var_534_32 = "effect"

				arg_531_1:AudioAction(var_534_31, var_534_32, "se_story_16", "se_story_16_thunder02", "")
			end

			local var_534_33 = 0
			local var_534_34 = 1

			if var_534_33 < arg_531_1.time_ and arg_531_1.time_ <= var_534_33 + arg_534_0 then
				local var_534_35 = "play"
				local var_534_36 = "effect"

				arg_531_1:AudioAction(var_534_35, var_534_36, "se_story_16", "se_story_16_rain02_loop", "")
			end

			if arg_531_1.frameCnt_ <= 1 then
				arg_531_1.dialog_:SetActive(false)
			end

			local var_534_37 = 4
			local var_534_38 = 1.225

			if var_534_37 < arg_531_1.time_ and arg_531_1.time_ <= var_534_37 + arg_534_0 then
				arg_531_1.talkMaxDuration = 0

				arg_531_1.dialog_:SetActive(true)

				local var_534_39 = LeanTween.value(arg_531_1.dialog_, 0, 1, 0.3)

				var_534_39:setOnUpdate(LuaHelper.FloatAction(function(arg_535_0)
					arg_531_1.dialogCg_.alpha = arg_535_0
				end))
				var_534_39:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_531_1.dialog_)
					var_534_39:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_531_1.duration_ = arg_531_1.duration_ + 0.3

				SetActive(arg_531_1.leftNameGo_, false)

				arg_531_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_531_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_531_1:RecordName(arg_531_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_531_1.iconTrs_.gameObject, false)
				arg_531_1.callingController_:SetSelectedState("normal")

				local var_534_40 = arg_531_1:GetWordFromCfg(116431127)
				local var_534_41 = arg_531_1:FormatText(var_534_40.content)

				arg_531_1.text_.text = var_534_41

				LuaForUtil.ClearLinePrefixSymbol(arg_531_1.text_)

				local var_534_42 = 49
				local var_534_43 = utf8.len(var_534_41)
				local var_534_44 = var_534_42 <= 0 and var_534_38 or var_534_38 * (var_534_43 / var_534_42)

				if var_534_44 > 0 and var_534_38 < var_534_44 then
					arg_531_1.talkMaxDuration = var_534_44
					var_534_37 = var_534_37 + 0.3

					if var_534_44 + var_534_37 > arg_531_1.duration_ then
						arg_531_1.duration_ = var_534_44 + var_534_37
					end
				end

				arg_531_1.text_.text = var_534_41
				arg_531_1.typewritter.percent = 0

				arg_531_1.typewritter:SetDirty()
				arg_531_1:ShowNextGo(false)
				arg_531_1:RecordContent(arg_531_1.text_.text)
			end

			local var_534_45 = var_534_37 + 0.3
			local var_534_46 = math.max(var_534_38, arg_531_1.talkMaxDuration)

			if var_534_45 <= arg_531_1.time_ and arg_531_1.time_ < var_534_45 + var_534_46 then
				arg_531_1.typewritter.percent = (arg_531_1.time_ - var_534_45) / var_534_46

				arg_531_1.typewritter:SetDirty()
			end

			if arg_531_1.time_ >= var_534_45 + var_534_46 and arg_531_1.time_ < var_534_45 + var_534_46 + arg_534_0 then
				arg_531_1.typewritter.percent = 1

				arg_531_1.typewritter:SetDirty()
				arg_531_1:ShowNextGo(true)
			end
		end
	end,
	Play116431128 = function(arg_537_0, arg_537_1)
		arg_537_1.time_ = 0
		arg_537_1.frameCnt_ = 0
		arg_537_1.state_ = "playing"
		arg_537_1.curTalkId_ = 116431128
		arg_537_1.duration_ = 6.666

		local var_537_0 = {
			zh = 6.666,
			ja = 6.1
		}
		local var_537_1 = manager.audio:GetLocalizationFlag()

		if var_537_0[var_537_1] ~= nil then
			arg_537_1.duration_ = var_537_0[var_537_1]
		end

		SetActive(arg_537_1.tipsGo_, false)

		function arg_537_1.onSingleLineFinish_()
			arg_537_1.onSingleLineUpdate_ = nil
			arg_537_1.onSingleLineFinish_ = nil
			arg_537_1.state_ = "waiting"
		end

		function arg_537_1.playNext_(arg_539_0)
			if arg_539_0 == 1 then
				arg_537_0:Play116431129(arg_537_1)
			end
		end

		function arg_537_1.onSingleLineUpdate_(arg_540_0)
			local var_540_0 = arg_537_1.actors_["10025ui_story"].transform
			local var_540_1 = 0

			if var_540_1 < arg_537_1.time_ and arg_537_1.time_ <= var_540_1 + arg_540_0 then
				arg_537_1.var_.moveOldPos10025ui_story = var_540_0.localPosition
			end

			local var_540_2 = 0.001

			if var_540_1 <= arg_537_1.time_ and arg_537_1.time_ < var_540_1 + var_540_2 then
				local var_540_3 = (arg_537_1.time_ - var_540_1) / var_540_2
				local var_540_4 = Vector3.New(0, -1.1, -5.9)

				var_540_0.localPosition = Vector3.Lerp(arg_537_1.var_.moveOldPos10025ui_story, var_540_4, var_540_3)

				local var_540_5 = manager.ui.mainCamera.transform.position - var_540_0.position

				var_540_0.forward = Vector3.New(var_540_5.x, var_540_5.y, var_540_5.z)

				local var_540_6 = var_540_0.localEulerAngles

				var_540_6.z = 0
				var_540_6.x = 0
				var_540_0.localEulerAngles = var_540_6
			end

			if arg_537_1.time_ >= var_540_1 + var_540_2 and arg_537_1.time_ < var_540_1 + var_540_2 + arg_540_0 then
				var_540_0.localPosition = Vector3.New(0, -1.1, -5.9)

				local var_540_7 = manager.ui.mainCamera.transform.position - var_540_0.position

				var_540_0.forward = Vector3.New(var_540_7.x, var_540_7.y, var_540_7.z)

				local var_540_8 = var_540_0.localEulerAngles

				var_540_8.z = 0
				var_540_8.x = 0
				var_540_0.localEulerAngles = var_540_8
			end

			local var_540_9 = arg_537_1.actors_["10025ui_story"]
			local var_540_10 = 0

			if var_540_10 < arg_537_1.time_ and arg_537_1.time_ <= var_540_10 + arg_540_0 and arg_537_1.var_.characterEffect10025ui_story == nil then
				arg_537_1.var_.characterEffect10025ui_story = var_540_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_540_11 = 0.2

			if var_540_10 <= arg_537_1.time_ and arg_537_1.time_ < var_540_10 + var_540_11 then
				local var_540_12 = (arg_537_1.time_ - var_540_10) / var_540_11

				if arg_537_1.var_.characterEffect10025ui_story then
					arg_537_1.var_.characterEffect10025ui_story.fillFlat = false
				end
			end

			if arg_537_1.time_ >= var_540_10 + var_540_11 and arg_537_1.time_ < var_540_10 + var_540_11 + arg_540_0 and arg_537_1.var_.characterEffect10025ui_story then
				arg_537_1.var_.characterEffect10025ui_story.fillFlat = false
			end

			local var_540_13 = 0

			if var_540_13 < arg_537_1.time_ and arg_537_1.time_ <= var_540_13 + arg_540_0 then
				arg_537_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action7_1")
			end

			local var_540_14 = 0

			if var_540_14 < arg_537_1.time_ and arg_537_1.time_ <= var_540_14 + arg_540_0 then
				arg_537_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_540_15 = 0
			local var_540_16 = 0.266666666666667

			if var_540_15 < arg_537_1.time_ and arg_537_1.time_ <= var_540_15 + arg_540_0 then
				local var_540_17 = "play"
				local var_540_18 = "music"

				arg_537_1:AudioAction(var_540_17, var_540_18, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_540_19 = 0.4
			local var_540_20 = 0.6

			if var_540_19 < arg_537_1.time_ and arg_537_1.time_ <= var_540_19 + arg_540_0 then
				local var_540_21 = "play"
				local var_540_22 = "music"

				arg_537_1:AudioAction(var_540_21, var_540_22, "bgm_activity_1_6_story_skuld", "bgm_activity_1_6_story_skuld", "bgm_activity_1_6_story_skuld.awb")
			end

			local var_540_23 = 0
			local var_540_24 = 0.35

			if var_540_23 < arg_537_1.time_ and arg_537_1.time_ <= var_540_23 + arg_540_0 then
				arg_537_1.talkMaxDuration = 0
				arg_537_1.dialogCg_.alpha = 1

				arg_537_1.dialog_:SetActive(true)
				SetActive(arg_537_1.leftNameGo_, true)

				local var_540_25 = arg_537_1:FormatText(StoryNameCfg[36].name)

				arg_537_1.leftNameTxt_.text = var_540_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_537_1.leftNameTxt_.transform)

				arg_537_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_537_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_537_1:RecordName(arg_537_1.leftNameTxt_.text)
				SetActive(arg_537_1.iconTrs_.gameObject, false)
				arg_537_1.callingController_:SetSelectedState("normal")

				local var_540_26 = arg_537_1:GetWordFromCfg(116431128)
				local var_540_27 = arg_537_1:FormatText(var_540_26.content)

				arg_537_1.text_.text = var_540_27

				LuaForUtil.ClearLinePrefixSymbol(arg_537_1.text_)

				local var_540_28 = 14
				local var_540_29 = utf8.len(var_540_27)
				local var_540_30 = var_540_28 <= 0 and var_540_24 or var_540_24 * (var_540_29 / var_540_28)

				if var_540_30 > 0 and var_540_24 < var_540_30 then
					arg_537_1.talkMaxDuration = var_540_30

					if var_540_30 + var_540_23 > arg_537_1.duration_ then
						arg_537_1.duration_ = var_540_30 + var_540_23
					end
				end

				arg_537_1.text_.text = var_540_27
				arg_537_1.typewritter.percent = 0

				arg_537_1.typewritter:SetDirty()
				arg_537_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431128", "story_v_out_116431.awb") ~= 0 then
					local var_540_31 = manager.audio:GetVoiceLength("story_v_out_116431", "116431128", "story_v_out_116431.awb") / 1000

					if var_540_31 + var_540_23 > arg_537_1.duration_ then
						arg_537_1.duration_ = var_540_31 + var_540_23
					end

					if var_540_26.prefab_name ~= "" and arg_537_1.actors_[var_540_26.prefab_name] ~= nil then
						local var_540_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_537_1.actors_[var_540_26.prefab_name].transform, "story_v_out_116431", "116431128", "story_v_out_116431.awb")

						arg_537_1:RecordAudio("116431128", var_540_32)
						arg_537_1:RecordAudio("116431128", var_540_32)
					else
						arg_537_1:AudioAction("play", "voice", "story_v_out_116431", "116431128", "story_v_out_116431.awb")
					end

					arg_537_1:RecordHistoryTalkVoice("story_v_out_116431", "116431128", "story_v_out_116431.awb")
				end

				arg_537_1:RecordContent(arg_537_1.text_.text)
			end

			local var_540_33 = math.max(var_540_24, arg_537_1.talkMaxDuration)

			if var_540_23 <= arg_537_1.time_ and arg_537_1.time_ < var_540_23 + var_540_33 then
				arg_537_1.typewritter.percent = (arg_537_1.time_ - var_540_23) / var_540_33

				arg_537_1.typewritter:SetDirty()
			end

			if arg_537_1.time_ >= var_540_23 + var_540_33 and arg_537_1.time_ < var_540_23 + var_540_33 + arg_540_0 then
				arg_537_1.typewritter.percent = 1

				arg_537_1.typewritter:SetDirty()
				arg_537_1:ShowNextGo(true)
			end
		end
	end,
	Play116431129 = function(arg_541_0, arg_541_1)
		arg_541_1.time_ = 0
		arg_541_1.frameCnt_ = 0
		arg_541_1.state_ = "playing"
		arg_541_1.curTalkId_ = 116431129
		arg_541_1.duration_ = 9.1

		local var_541_0 = {
			zh = 8.966,
			ja = 9.1
		}
		local var_541_1 = manager.audio:GetLocalizationFlag()

		if var_541_0[var_541_1] ~= nil then
			arg_541_1.duration_ = var_541_0[var_541_1]
		end

		SetActive(arg_541_1.tipsGo_, false)

		function arg_541_1.onSingleLineFinish_()
			arg_541_1.onSingleLineUpdate_ = nil
			arg_541_1.onSingleLineFinish_ = nil
			arg_541_1.state_ = "waiting"
		end

		function arg_541_1.playNext_(arg_543_0)
			if arg_543_0 == 1 then
				arg_541_0:Play116431130(arg_541_1)
			end
		end

		function arg_541_1.onSingleLineUpdate_(arg_544_0)
			local var_544_0 = arg_541_1.actors_["10025ui_story"].transform
			local var_544_1 = 0

			if var_544_1 < arg_541_1.time_ and arg_541_1.time_ <= var_544_1 + arg_544_0 then
				arg_541_1.var_.moveOldPos10025ui_story = var_544_0.localPosition
			end

			local var_544_2 = 0.001

			if var_544_1 <= arg_541_1.time_ and arg_541_1.time_ < var_544_1 + var_544_2 then
				local var_544_3 = (arg_541_1.time_ - var_544_1) / var_544_2
				local var_544_4 = Vector3.New(0, -1.1, -5.9)

				var_544_0.localPosition = Vector3.Lerp(arg_541_1.var_.moveOldPos10025ui_story, var_544_4, var_544_3)

				local var_544_5 = manager.ui.mainCamera.transform.position - var_544_0.position

				var_544_0.forward = Vector3.New(var_544_5.x, var_544_5.y, var_544_5.z)

				local var_544_6 = var_544_0.localEulerAngles

				var_544_6.z = 0
				var_544_6.x = 0
				var_544_0.localEulerAngles = var_544_6
			end

			if arg_541_1.time_ >= var_544_1 + var_544_2 and arg_541_1.time_ < var_544_1 + var_544_2 + arg_544_0 then
				var_544_0.localPosition = Vector3.New(0, -1.1, -5.9)

				local var_544_7 = manager.ui.mainCamera.transform.position - var_544_0.position

				var_544_0.forward = Vector3.New(var_544_7.x, var_544_7.y, var_544_7.z)

				local var_544_8 = var_544_0.localEulerAngles

				var_544_8.z = 0
				var_544_8.x = 0
				var_544_0.localEulerAngles = var_544_8
			end

			local var_544_9 = 0

			if var_544_9 < arg_541_1.time_ and arg_541_1.time_ <= var_544_9 + arg_544_0 then
				arg_541_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/story10025/story10025actionlink/10025action478")
			end

			local var_544_10 = 0

			if var_544_10 < arg_541_1.time_ and arg_541_1.time_ <= var_544_10 + arg_544_0 then
				arg_541_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_544_11 = 0
			local var_544_12 = 0.55

			if var_544_11 < arg_541_1.time_ and arg_541_1.time_ <= var_544_11 + arg_544_0 then
				arg_541_1.talkMaxDuration = 0
				arg_541_1.dialogCg_.alpha = 1

				arg_541_1.dialog_:SetActive(true)
				SetActive(arg_541_1.leftNameGo_, true)

				local var_544_13 = arg_541_1:FormatText(StoryNameCfg[36].name)

				arg_541_1.leftNameTxt_.text = var_544_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_541_1.leftNameTxt_.transform)

				arg_541_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_541_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_541_1:RecordName(arg_541_1.leftNameTxt_.text)
				SetActive(arg_541_1.iconTrs_.gameObject, false)
				arg_541_1.callingController_:SetSelectedState("normal")

				local var_544_14 = arg_541_1:GetWordFromCfg(116431129)
				local var_544_15 = arg_541_1:FormatText(var_544_14.content)

				arg_541_1.text_.text = var_544_15

				LuaForUtil.ClearLinePrefixSymbol(arg_541_1.text_)

				local var_544_16 = 22
				local var_544_17 = utf8.len(var_544_15)
				local var_544_18 = var_544_16 <= 0 and var_544_12 or var_544_12 * (var_544_17 / var_544_16)

				if var_544_18 > 0 and var_544_12 < var_544_18 then
					arg_541_1.talkMaxDuration = var_544_18

					if var_544_18 + var_544_11 > arg_541_1.duration_ then
						arg_541_1.duration_ = var_544_18 + var_544_11
					end
				end

				arg_541_1.text_.text = var_544_15
				arg_541_1.typewritter.percent = 0

				arg_541_1.typewritter:SetDirty()
				arg_541_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431129", "story_v_out_116431.awb") ~= 0 then
					local var_544_19 = manager.audio:GetVoiceLength("story_v_out_116431", "116431129", "story_v_out_116431.awb") / 1000

					if var_544_19 + var_544_11 > arg_541_1.duration_ then
						arg_541_1.duration_ = var_544_19 + var_544_11
					end

					if var_544_14.prefab_name ~= "" and arg_541_1.actors_[var_544_14.prefab_name] ~= nil then
						local var_544_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_541_1.actors_[var_544_14.prefab_name].transform, "story_v_out_116431", "116431129", "story_v_out_116431.awb")

						arg_541_1:RecordAudio("116431129", var_544_20)
						arg_541_1:RecordAudio("116431129", var_544_20)
					else
						arg_541_1:AudioAction("play", "voice", "story_v_out_116431", "116431129", "story_v_out_116431.awb")
					end

					arg_541_1:RecordHistoryTalkVoice("story_v_out_116431", "116431129", "story_v_out_116431.awb")
				end

				arg_541_1:RecordContent(arg_541_1.text_.text)
			end

			local var_544_21 = math.max(var_544_12, arg_541_1.talkMaxDuration)

			if var_544_11 <= arg_541_1.time_ and arg_541_1.time_ < var_544_11 + var_544_21 then
				arg_541_1.typewritter.percent = (arg_541_1.time_ - var_544_11) / var_544_21

				arg_541_1.typewritter:SetDirty()
			end

			if arg_541_1.time_ >= var_544_11 + var_544_21 and arg_541_1.time_ < var_544_11 + var_544_21 + arg_544_0 then
				arg_541_1.typewritter.percent = 1

				arg_541_1.typewritter:SetDirty()
				arg_541_1:ShowNextGo(true)
			end
		end
	end,
	Play116431130 = function(arg_545_0, arg_545_1)
		arg_545_1.time_ = 0
		arg_545_1.frameCnt_ = 0
		arg_545_1.state_ = "playing"
		arg_545_1.curTalkId_ = 116431130
		arg_545_1.duration_ = 5

		SetActive(arg_545_1.tipsGo_, false)

		function arg_545_1.onSingleLineFinish_()
			arg_545_1.onSingleLineUpdate_ = nil
			arg_545_1.onSingleLineFinish_ = nil
			arg_545_1.state_ = "waiting"
		end

		function arg_545_1.playNext_(arg_547_0)
			if arg_547_0 == 1 then
				arg_545_0:Play116431131(arg_545_1)
			end
		end

		function arg_545_1.onSingleLineUpdate_(arg_548_0)
			local var_548_0 = arg_545_1.actors_["10025ui_story"].transform
			local var_548_1 = 0

			if var_548_1 < arg_545_1.time_ and arg_545_1.time_ <= var_548_1 + arg_548_0 then
				arg_545_1.var_.moveOldPos10025ui_story = var_548_0.localPosition
			end

			local var_548_2 = 0.001

			if var_548_1 <= arg_545_1.time_ and arg_545_1.time_ < var_548_1 + var_548_2 then
				local var_548_3 = (arg_545_1.time_ - var_548_1) / var_548_2
				local var_548_4 = Vector3.New(0, 100, 0)

				var_548_0.localPosition = Vector3.Lerp(arg_545_1.var_.moveOldPos10025ui_story, var_548_4, var_548_3)

				local var_548_5 = manager.ui.mainCamera.transform.position - var_548_0.position

				var_548_0.forward = Vector3.New(var_548_5.x, var_548_5.y, var_548_5.z)

				local var_548_6 = var_548_0.localEulerAngles

				var_548_6.z = 0
				var_548_6.x = 0
				var_548_0.localEulerAngles = var_548_6
			end

			if arg_545_1.time_ >= var_548_1 + var_548_2 and arg_545_1.time_ < var_548_1 + var_548_2 + arg_548_0 then
				var_548_0.localPosition = Vector3.New(0, 100, 0)

				local var_548_7 = manager.ui.mainCamera.transform.position - var_548_0.position

				var_548_0.forward = Vector3.New(var_548_7.x, var_548_7.y, var_548_7.z)

				local var_548_8 = var_548_0.localEulerAngles

				var_548_8.z = 0
				var_548_8.x = 0
				var_548_0.localEulerAngles = var_548_8
			end

			local var_548_9 = 0
			local var_548_10 = 0.65

			if var_548_9 < arg_545_1.time_ and arg_545_1.time_ <= var_548_9 + arg_548_0 then
				arg_545_1.talkMaxDuration = 0
				arg_545_1.dialogCg_.alpha = 1

				arg_545_1.dialog_:SetActive(true)
				SetActive(arg_545_1.leftNameGo_, false)

				arg_545_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_545_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_545_1:RecordName(arg_545_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_545_1.iconTrs_.gameObject, false)
				arg_545_1.callingController_:SetSelectedState("normal")

				local var_548_11 = arg_545_1:GetWordFromCfg(116431130)
				local var_548_12 = arg_545_1:FormatText(var_548_11.content)

				arg_545_1.text_.text = var_548_12

				LuaForUtil.ClearLinePrefixSymbol(arg_545_1.text_)

				local var_548_13 = 26
				local var_548_14 = utf8.len(var_548_12)
				local var_548_15 = var_548_13 <= 0 and var_548_10 or var_548_10 * (var_548_14 / var_548_13)

				if var_548_15 > 0 and var_548_10 < var_548_15 then
					arg_545_1.talkMaxDuration = var_548_15

					if var_548_15 + var_548_9 > arg_545_1.duration_ then
						arg_545_1.duration_ = var_548_15 + var_548_9
					end
				end

				arg_545_1.text_.text = var_548_12
				arg_545_1.typewritter.percent = 0

				arg_545_1.typewritter:SetDirty()
				arg_545_1:ShowNextGo(false)
				arg_545_1:RecordContent(arg_545_1.text_.text)
			end

			local var_548_16 = math.max(var_548_10, arg_545_1.talkMaxDuration)

			if var_548_9 <= arg_545_1.time_ and arg_545_1.time_ < var_548_9 + var_548_16 then
				arg_545_1.typewritter.percent = (arg_545_1.time_ - var_548_9) / var_548_16

				arg_545_1.typewritter:SetDirty()
			end

			if arg_545_1.time_ >= var_548_9 + var_548_16 and arg_545_1.time_ < var_548_9 + var_548_16 + arg_548_0 then
				arg_545_1.typewritter.percent = 1

				arg_545_1.typewritter:SetDirty()
				arg_545_1:ShowNextGo(true)
			end
		end
	end,
	Play116431131 = function(arg_549_0, arg_549_1)
		arg_549_1.time_ = 0
		arg_549_1.frameCnt_ = 0
		arg_549_1.state_ = "playing"
		arg_549_1.curTalkId_ = 116431131
		arg_549_1.duration_ = 5

		SetActive(arg_549_1.tipsGo_, false)

		function arg_549_1.onSingleLineFinish_()
			arg_549_1.onSingleLineUpdate_ = nil
			arg_549_1.onSingleLineFinish_ = nil
			arg_549_1.state_ = "waiting"
		end

		function arg_549_1.playNext_(arg_551_0)
			if arg_551_0 == 1 then
				arg_549_0:Play116431132(arg_549_1)
			end
		end

		function arg_549_1.onSingleLineUpdate_(arg_552_0)
			local var_552_0 = 0
			local var_552_1 = 0.85

			if var_552_0 < arg_549_1.time_ and arg_549_1.time_ <= var_552_0 + arg_552_0 then
				arg_549_1.talkMaxDuration = 0
				arg_549_1.dialogCg_.alpha = 1

				arg_549_1.dialog_:SetActive(true)
				SetActive(arg_549_1.leftNameGo_, false)

				arg_549_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_549_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_549_1:RecordName(arg_549_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_549_1.iconTrs_.gameObject, false)
				arg_549_1.callingController_:SetSelectedState("normal")

				local var_552_2 = arg_549_1:GetWordFromCfg(116431131)
				local var_552_3 = arg_549_1:FormatText(var_552_2.content)

				arg_549_1.text_.text = var_552_3

				LuaForUtil.ClearLinePrefixSymbol(arg_549_1.text_)

				local var_552_4 = 34
				local var_552_5 = utf8.len(var_552_3)
				local var_552_6 = var_552_4 <= 0 and var_552_1 or var_552_1 * (var_552_5 / var_552_4)

				if var_552_6 > 0 and var_552_1 < var_552_6 then
					arg_549_1.talkMaxDuration = var_552_6

					if var_552_6 + var_552_0 > arg_549_1.duration_ then
						arg_549_1.duration_ = var_552_6 + var_552_0
					end
				end

				arg_549_1.text_.text = var_552_3
				arg_549_1.typewritter.percent = 0

				arg_549_1.typewritter:SetDirty()
				arg_549_1:ShowNextGo(false)
				arg_549_1:RecordContent(arg_549_1.text_.text)
			end

			local var_552_7 = math.max(var_552_1, arg_549_1.talkMaxDuration)

			if var_552_0 <= arg_549_1.time_ and arg_549_1.time_ < var_552_0 + var_552_7 then
				arg_549_1.typewritter.percent = (arg_549_1.time_ - var_552_0) / var_552_7

				arg_549_1.typewritter:SetDirty()
			end

			if arg_549_1.time_ >= var_552_0 + var_552_7 and arg_549_1.time_ < var_552_0 + var_552_7 + arg_552_0 then
				arg_549_1.typewritter.percent = 1

				arg_549_1.typewritter:SetDirty()
				arg_549_1:ShowNextGo(true)
			end
		end
	end,
	Play116431132 = function(arg_553_0, arg_553_1)
		arg_553_1.time_ = 0
		arg_553_1.frameCnt_ = 0
		arg_553_1.state_ = "playing"
		arg_553_1.curTalkId_ = 116431132
		arg_553_1.duration_ = 5

		SetActive(arg_553_1.tipsGo_, false)

		function arg_553_1.onSingleLineFinish_()
			arg_553_1.onSingleLineUpdate_ = nil
			arg_553_1.onSingleLineFinish_ = nil
			arg_553_1.state_ = "waiting"
		end

		function arg_553_1.playNext_(arg_555_0)
			if arg_555_0 == 1 then
				arg_553_0:Play116431133(arg_553_1)
			end
		end

		function arg_553_1.onSingleLineUpdate_(arg_556_0)
			local var_556_0 = manager.ui.mainCamera.transform
			local var_556_1 = 0

			if var_556_1 < arg_553_1.time_ and arg_553_1.time_ <= var_556_1 + arg_556_0 then
				arg_553_1.var_.shakeOldPos = var_556_0.localPosition
			end

			local var_556_2 = 0.6

			if var_556_1 <= arg_553_1.time_ and arg_553_1.time_ < var_556_1 + var_556_2 then
				local var_556_3 = (arg_553_1.time_ - var_556_1) / 0.066
				local var_556_4, var_556_5 = math.modf(var_556_3)

				var_556_0.localPosition = Vector3.New(var_556_5 * 0.13, var_556_5 * 0.13, var_556_5 * 0.13) + arg_553_1.var_.shakeOldPos
			end

			if arg_553_1.time_ >= var_556_1 + var_556_2 and arg_553_1.time_ < var_556_1 + var_556_2 + arg_556_0 then
				var_556_0.localPosition = arg_553_1.var_.shakeOldPos
			end

			local var_556_6 = 0

			if var_556_6 < arg_553_1.time_ and arg_553_1.time_ <= var_556_6 + arg_556_0 then
				arg_553_1.allBtn_.enabled = false
			end

			local var_556_7 = 0.6

			if arg_553_1.time_ >= var_556_6 + var_556_7 and arg_553_1.time_ < var_556_6 + var_556_7 + arg_556_0 then
				arg_553_1.allBtn_.enabled = true
			end

			local var_556_8 = 0
			local var_556_9 = 0.575

			if var_556_8 < arg_553_1.time_ and arg_553_1.time_ <= var_556_8 + arg_556_0 then
				arg_553_1.talkMaxDuration = 0
				arg_553_1.dialogCg_.alpha = 1

				arg_553_1.dialog_:SetActive(true)
				SetActive(arg_553_1.leftNameGo_, false)

				arg_553_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_553_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_553_1:RecordName(arg_553_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_553_1.iconTrs_.gameObject, false)
				arg_553_1.callingController_:SetSelectedState("normal")

				local var_556_10 = arg_553_1:GetWordFromCfg(116431132)
				local var_556_11 = arg_553_1:FormatText(var_556_10.content)

				arg_553_1.text_.text = var_556_11

				LuaForUtil.ClearLinePrefixSymbol(arg_553_1.text_)

				local var_556_12 = 23
				local var_556_13 = utf8.len(var_556_11)
				local var_556_14 = var_556_12 <= 0 and var_556_9 or var_556_9 * (var_556_13 / var_556_12)

				if var_556_14 > 0 and var_556_9 < var_556_14 then
					arg_553_1.talkMaxDuration = var_556_14

					if var_556_14 + var_556_8 > arg_553_1.duration_ then
						arg_553_1.duration_ = var_556_14 + var_556_8
					end
				end

				arg_553_1.text_.text = var_556_11
				arg_553_1.typewritter.percent = 0

				arg_553_1.typewritter:SetDirty()
				arg_553_1:ShowNextGo(false)
				arg_553_1:RecordContent(arg_553_1.text_.text)
			end

			local var_556_15 = math.max(var_556_9, arg_553_1.talkMaxDuration)

			if var_556_8 <= arg_553_1.time_ and arg_553_1.time_ < var_556_8 + var_556_15 then
				arg_553_1.typewritter.percent = (arg_553_1.time_ - var_556_8) / var_556_15

				arg_553_1.typewritter:SetDirty()
			end

			if arg_553_1.time_ >= var_556_8 + var_556_15 and arg_553_1.time_ < var_556_8 + var_556_15 + arg_556_0 then
				arg_553_1.typewritter.percent = 1

				arg_553_1.typewritter:SetDirty()
				arg_553_1:ShowNextGo(true)
			end
		end
	end,
	Play116431133 = function(arg_557_0, arg_557_1)
		arg_557_1.time_ = 0
		arg_557_1.frameCnt_ = 0
		arg_557_1.state_ = "playing"
		arg_557_1.curTalkId_ = 116431133
		arg_557_1.duration_ = 5

		SetActive(arg_557_1.tipsGo_, false)

		function arg_557_1.onSingleLineFinish_()
			arg_557_1.onSingleLineUpdate_ = nil
			arg_557_1.onSingleLineFinish_ = nil
			arg_557_1.state_ = "waiting"
		end

		function arg_557_1.playNext_(arg_559_0)
			if arg_559_0 == 1 then
				arg_557_0:Play116431134(arg_557_1)
			end
		end

		function arg_557_1.onSingleLineUpdate_(arg_560_0)
			local var_560_0 = 0
			local var_560_1 = 0.65

			if var_560_0 < arg_557_1.time_ and arg_557_1.time_ <= var_560_0 + arg_560_0 then
				arg_557_1.talkMaxDuration = 0
				arg_557_1.dialogCg_.alpha = 1

				arg_557_1.dialog_:SetActive(true)
				SetActive(arg_557_1.leftNameGo_, false)

				arg_557_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_557_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_557_1:RecordName(arg_557_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_557_1.iconTrs_.gameObject, false)
				arg_557_1.callingController_:SetSelectedState("normal")

				local var_560_2 = arg_557_1:GetWordFromCfg(116431133)
				local var_560_3 = arg_557_1:FormatText(var_560_2.content)

				arg_557_1.text_.text = var_560_3

				LuaForUtil.ClearLinePrefixSymbol(arg_557_1.text_)

				local var_560_4 = 26
				local var_560_5 = utf8.len(var_560_3)
				local var_560_6 = var_560_4 <= 0 and var_560_1 or var_560_1 * (var_560_5 / var_560_4)

				if var_560_6 > 0 and var_560_1 < var_560_6 then
					arg_557_1.talkMaxDuration = var_560_6

					if var_560_6 + var_560_0 > arg_557_1.duration_ then
						arg_557_1.duration_ = var_560_6 + var_560_0
					end
				end

				arg_557_1.text_.text = var_560_3
				arg_557_1.typewritter.percent = 0

				arg_557_1.typewritter:SetDirty()
				arg_557_1:ShowNextGo(false)
				arg_557_1:RecordContent(arg_557_1.text_.text)
			end

			local var_560_7 = math.max(var_560_1, arg_557_1.talkMaxDuration)

			if var_560_0 <= arg_557_1.time_ and arg_557_1.time_ < var_560_0 + var_560_7 then
				arg_557_1.typewritter.percent = (arg_557_1.time_ - var_560_0) / var_560_7

				arg_557_1.typewritter:SetDirty()
			end

			if arg_557_1.time_ >= var_560_0 + var_560_7 and arg_557_1.time_ < var_560_0 + var_560_7 + arg_560_0 then
				arg_557_1.typewritter.percent = 1

				arg_557_1.typewritter:SetDirty()
				arg_557_1:ShowNextGo(true)
			end
		end
	end,
	Play116431134 = function(arg_561_0, arg_561_1)
		arg_561_1.time_ = 0
		arg_561_1.frameCnt_ = 0
		arg_561_1.state_ = "playing"
		arg_561_1.curTalkId_ = 116431134
		arg_561_1.duration_ = 5.133

		local var_561_0 = {
			zh = 5.133,
			ja = 1.999999999999
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
				arg_561_0:Play116431135(arg_561_1)
			end
		end

		function arg_561_1.onSingleLineUpdate_(arg_564_0)
			local var_564_0 = arg_561_1.actors_["10025ui_story"].transform
			local var_564_1 = 0

			if var_564_1 < arg_561_1.time_ and arg_561_1.time_ <= var_564_1 + arg_564_0 then
				arg_561_1.var_.moveOldPos10025ui_story = var_564_0.localPosition
			end

			local var_564_2 = 0.001

			if var_564_1 <= arg_561_1.time_ and arg_561_1.time_ < var_564_1 + var_564_2 then
				local var_564_3 = (arg_561_1.time_ - var_564_1) / var_564_2
				local var_564_4 = Vector3.New(0, -1.1, -5.9)

				var_564_0.localPosition = Vector3.Lerp(arg_561_1.var_.moveOldPos10025ui_story, var_564_4, var_564_3)

				local var_564_5 = manager.ui.mainCamera.transform.position - var_564_0.position

				var_564_0.forward = Vector3.New(var_564_5.x, var_564_5.y, var_564_5.z)

				local var_564_6 = var_564_0.localEulerAngles

				var_564_6.z = 0
				var_564_6.x = 0
				var_564_0.localEulerAngles = var_564_6
			end

			if arg_561_1.time_ >= var_564_1 + var_564_2 and arg_561_1.time_ < var_564_1 + var_564_2 + arg_564_0 then
				var_564_0.localPosition = Vector3.New(0, -1.1, -5.9)

				local var_564_7 = manager.ui.mainCamera.transform.position - var_564_0.position

				var_564_0.forward = Vector3.New(var_564_7.x, var_564_7.y, var_564_7.z)

				local var_564_8 = var_564_0.localEulerAngles

				var_564_8.z = 0
				var_564_8.x = 0
				var_564_0.localEulerAngles = var_564_8
			end

			local var_564_9 = arg_561_1.actors_["10025ui_story"]
			local var_564_10 = 0

			if var_564_10 < arg_561_1.time_ and arg_561_1.time_ <= var_564_10 + arg_564_0 and arg_561_1.var_.characterEffect10025ui_story == nil then
				arg_561_1.var_.characterEffect10025ui_story = var_564_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_564_11 = 0.2

			if var_564_10 <= arg_561_1.time_ and arg_561_1.time_ < var_564_10 + var_564_11 then
				local var_564_12 = (arg_561_1.time_ - var_564_10) / var_564_11

				if arg_561_1.var_.characterEffect10025ui_story then
					arg_561_1.var_.characterEffect10025ui_story.fillFlat = false
				end
			end

			if arg_561_1.time_ >= var_564_10 + var_564_11 and arg_561_1.time_ < var_564_10 + var_564_11 + arg_564_0 and arg_561_1.var_.characterEffect10025ui_story then
				arg_561_1.var_.characterEffect10025ui_story.fillFlat = false
			end

			local var_564_13 = 0

			if var_564_13 < arg_561_1.time_ and arg_561_1.time_ <= var_564_13 + arg_564_0 then
				arg_561_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action9_2")
			end

			local var_564_14 = 0

			if var_564_14 < arg_561_1.time_ and arg_561_1.time_ <= var_564_14 + arg_564_0 then
				arg_561_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_564_15 = 0
			local var_564_16 = 0.175

			if var_564_15 < arg_561_1.time_ and arg_561_1.time_ <= var_564_15 + arg_564_0 then
				arg_561_1.talkMaxDuration = 0
				arg_561_1.dialogCg_.alpha = 1

				arg_561_1.dialog_:SetActive(true)
				SetActive(arg_561_1.leftNameGo_, true)

				local var_564_17 = arg_561_1:FormatText(StoryNameCfg[36].name)

				arg_561_1.leftNameTxt_.text = var_564_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_561_1.leftNameTxt_.transform)

				arg_561_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_561_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_561_1:RecordName(arg_561_1.leftNameTxt_.text)
				SetActive(arg_561_1.iconTrs_.gameObject, false)
				arg_561_1.callingController_:SetSelectedState("normal")

				local var_564_18 = arg_561_1:GetWordFromCfg(116431134)
				local var_564_19 = arg_561_1:FormatText(var_564_18.content)

				arg_561_1.text_.text = var_564_19

				LuaForUtil.ClearLinePrefixSymbol(arg_561_1.text_)

				local var_564_20 = 7
				local var_564_21 = utf8.len(var_564_19)
				local var_564_22 = var_564_20 <= 0 and var_564_16 or var_564_16 * (var_564_21 / var_564_20)

				if var_564_22 > 0 and var_564_16 < var_564_22 then
					arg_561_1.talkMaxDuration = var_564_22

					if var_564_22 + var_564_15 > arg_561_1.duration_ then
						arg_561_1.duration_ = var_564_22 + var_564_15
					end
				end

				arg_561_1.text_.text = var_564_19
				arg_561_1.typewritter.percent = 0

				arg_561_1.typewritter:SetDirty()
				arg_561_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431134", "story_v_out_116431.awb") ~= 0 then
					local var_564_23 = manager.audio:GetVoiceLength("story_v_out_116431", "116431134", "story_v_out_116431.awb") / 1000

					if var_564_23 + var_564_15 > arg_561_1.duration_ then
						arg_561_1.duration_ = var_564_23 + var_564_15
					end

					if var_564_18.prefab_name ~= "" and arg_561_1.actors_[var_564_18.prefab_name] ~= nil then
						local var_564_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_561_1.actors_[var_564_18.prefab_name].transform, "story_v_out_116431", "116431134", "story_v_out_116431.awb")

						arg_561_1:RecordAudio("116431134", var_564_24)
						arg_561_1:RecordAudio("116431134", var_564_24)
					else
						arg_561_1:AudioAction("play", "voice", "story_v_out_116431", "116431134", "story_v_out_116431.awb")
					end

					arg_561_1:RecordHistoryTalkVoice("story_v_out_116431", "116431134", "story_v_out_116431.awb")
				end

				arg_561_1:RecordContent(arg_561_1.text_.text)
			end

			local var_564_25 = math.max(var_564_16, arg_561_1.talkMaxDuration)

			if var_564_15 <= arg_561_1.time_ and arg_561_1.time_ < var_564_15 + var_564_25 then
				arg_561_1.typewritter.percent = (arg_561_1.time_ - var_564_15) / var_564_25

				arg_561_1.typewritter:SetDirty()
			end

			if arg_561_1.time_ >= var_564_15 + var_564_25 and arg_561_1.time_ < var_564_15 + var_564_25 + arg_564_0 then
				arg_561_1.typewritter.percent = 1

				arg_561_1.typewritter:SetDirty()
				arg_561_1:ShowNextGo(true)
			end
		end
	end,
	Play116431135 = function(arg_565_0, arg_565_1)
		arg_565_1.time_ = 0
		arg_565_1.frameCnt_ = 0
		arg_565_1.state_ = "playing"
		arg_565_1.curTalkId_ = 116431135
		arg_565_1.duration_ = 5

		SetActive(arg_565_1.tipsGo_, false)

		function arg_565_1.onSingleLineFinish_()
			arg_565_1.onSingleLineUpdate_ = nil
			arg_565_1.onSingleLineFinish_ = nil
			arg_565_1.state_ = "waiting"
		end

		function arg_565_1.playNext_(arg_567_0)
			if arg_567_0 == 1 then
				arg_565_0:Play116431136(arg_565_1)
			end
		end

		function arg_565_1.onSingleLineUpdate_(arg_568_0)
			local var_568_0 = arg_565_1.actors_["10025ui_story"].transform
			local var_568_1 = 0

			if var_568_1 < arg_565_1.time_ and arg_565_1.time_ <= var_568_1 + arg_568_0 then
				arg_565_1.var_.moveOldPos10025ui_story = var_568_0.localPosition
			end

			local var_568_2 = 0.001

			if var_568_1 <= arg_565_1.time_ and arg_565_1.time_ < var_568_1 + var_568_2 then
				local var_568_3 = (arg_565_1.time_ - var_568_1) / var_568_2
				local var_568_4 = Vector3.New(0, 100, 0)

				var_568_0.localPosition = Vector3.Lerp(arg_565_1.var_.moveOldPos10025ui_story, var_568_4, var_568_3)

				local var_568_5 = manager.ui.mainCamera.transform.position - var_568_0.position

				var_568_0.forward = Vector3.New(var_568_5.x, var_568_5.y, var_568_5.z)

				local var_568_6 = var_568_0.localEulerAngles

				var_568_6.z = 0
				var_568_6.x = 0
				var_568_0.localEulerAngles = var_568_6
			end

			if arg_565_1.time_ >= var_568_1 + var_568_2 and arg_565_1.time_ < var_568_1 + var_568_2 + arg_568_0 then
				var_568_0.localPosition = Vector3.New(0, 100, 0)

				local var_568_7 = manager.ui.mainCamera.transform.position - var_568_0.position

				var_568_0.forward = Vector3.New(var_568_7.x, var_568_7.y, var_568_7.z)

				local var_568_8 = var_568_0.localEulerAngles

				var_568_8.z = 0
				var_568_8.x = 0
				var_568_0.localEulerAngles = var_568_8
			end

			local var_568_9 = 0
			local var_568_10 = 1.5

			if var_568_9 < arg_565_1.time_ and arg_565_1.time_ <= var_568_9 + arg_568_0 then
				arg_565_1.talkMaxDuration = 0
				arg_565_1.dialogCg_.alpha = 1

				arg_565_1.dialog_:SetActive(true)
				SetActive(arg_565_1.leftNameGo_, false)

				arg_565_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_565_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_565_1:RecordName(arg_565_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_565_1.iconTrs_.gameObject, false)
				arg_565_1.callingController_:SetSelectedState("normal")

				local var_568_11 = arg_565_1:GetWordFromCfg(116431135)
				local var_568_12 = arg_565_1:FormatText(var_568_11.content)

				arg_565_1.text_.text = var_568_12

				LuaForUtil.ClearLinePrefixSymbol(arg_565_1.text_)

				local var_568_13 = 60
				local var_568_14 = utf8.len(var_568_12)
				local var_568_15 = var_568_13 <= 0 and var_568_10 or var_568_10 * (var_568_14 / var_568_13)

				if var_568_15 > 0 and var_568_10 < var_568_15 then
					arg_565_1.talkMaxDuration = var_568_15

					if var_568_15 + var_568_9 > arg_565_1.duration_ then
						arg_565_1.duration_ = var_568_15 + var_568_9
					end
				end

				arg_565_1.text_.text = var_568_12
				arg_565_1.typewritter.percent = 0

				arg_565_1.typewritter:SetDirty()
				arg_565_1:ShowNextGo(false)
				arg_565_1:RecordContent(arg_565_1.text_.text)
			end

			local var_568_16 = math.max(var_568_10, arg_565_1.talkMaxDuration)

			if var_568_9 <= arg_565_1.time_ and arg_565_1.time_ < var_568_9 + var_568_16 then
				arg_565_1.typewritter.percent = (arg_565_1.time_ - var_568_9) / var_568_16

				arg_565_1.typewritter:SetDirty()
			end

			if arg_565_1.time_ >= var_568_9 + var_568_16 and arg_565_1.time_ < var_568_9 + var_568_16 + arg_568_0 then
				arg_565_1.typewritter.percent = 1

				arg_565_1.typewritter:SetDirty()
				arg_565_1:ShowNextGo(true)
			end
		end
	end,
	Play116431136 = function(arg_569_0, arg_569_1)
		arg_569_1.time_ = 0
		arg_569_1.frameCnt_ = 0
		arg_569_1.state_ = "playing"
		arg_569_1.curTalkId_ = 116431136
		arg_569_1.duration_ = 13.1

		local var_569_0 = {
			zh = 13.1,
			ja = 8.2
		}
		local var_569_1 = manager.audio:GetLocalizationFlag()

		if var_569_0[var_569_1] ~= nil then
			arg_569_1.duration_ = var_569_0[var_569_1]
		end

		SetActive(arg_569_1.tipsGo_, false)

		function arg_569_1.onSingleLineFinish_()
			arg_569_1.onSingleLineUpdate_ = nil
			arg_569_1.onSingleLineFinish_ = nil
			arg_569_1.state_ = "waiting"
		end

		function arg_569_1.playNext_(arg_571_0)
			if arg_571_0 == 1 then
				arg_569_0:Play116431137(arg_569_1)
			end
		end

		function arg_569_1.onSingleLineUpdate_(arg_572_0)
			local var_572_0 = 0
			local var_572_1 = 0.675

			if var_572_0 < arg_569_1.time_ and arg_569_1.time_ <= var_572_0 + arg_572_0 then
				arg_569_1.talkMaxDuration = 0
				arg_569_1.dialogCg_.alpha = 1

				arg_569_1.dialog_:SetActive(true)
				SetActive(arg_569_1.leftNameGo_, true)

				local var_572_2 = arg_569_1:FormatText(StoryNameCfg[36].name)

				arg_569_1.leftNameTxt_.text = var_572_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_569_1.leftNameTxt_.transform)

				arg_569_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_569_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_569_1:RecordName(arg_569_1.leftNameTxt_.text)
				SetActive(arg_569_1.iconTrs_.gameObject, true)
				arg_569_1.iconController_:SetSelectedState("hero")

				arg_569_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10025")

				arg_569_1.callingController_:SetSelectedState("normal")

				local var_572_3 = arg_569_1:GetWordFromCfg(116431136)
				local var_572_4 = arg_569_1:FormatText(var_572_3.content)

				arg_569_1.text_.text = var_572_4

				LuaForUtil.ClearLinePrefixSymbol(arg_569_1.text_)

				local var_572_5 = 27
				local var_572_6 = utf8.len(var_572_4)
				local var_572_7 = var_572_5 <= 0 and var_572_1 or var_572_1 * (var_572_6 / var_572_5)

				if var_572_7 > 0 and var_572_1 < var_572_7 then
					arg_569_1.talkMaxDuration = var_572_7

					if var_572_7 + var_572_0 > arg_569_1.duration_ then
						arg_569_1.duration_ = var_572_7 + var_572_0
					end
				end

				arg_569_1.text_.text = var_572_4
				arg_569_1.typewritter.percent = 0

				arg_569_1.typewritter:SetDirty()
				arg_569_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431136", "story_v_out_116431.awb") ~= 0 then
					local var_572_8 = manager.audio:GetVoiceLength("story_v_out_116431", "116431136", "story_v_out_116431.awb") / 1000

					if var_572_8 + var_572_0 > arg_569_1.duration_ then
						arg_569_1.duration_ = var_572_8 + var_572_0
					end

					if var_572_3.prefab_name ~= "" and arg_569_1.actors_[var_572_3.prefab_name] ~= nil then
						local var_572_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_569_1.actors_[var_572_3.prefab_name].transform, "story_v_out_116431", "116431136", "story_v_out_116431.awb")

						arg_569_1:RecordAudio("116431136", var_572_9)
						arg_569_1:RecordAudio("116431136", var_572_9)
					else
						arg_569_1:AudioAction("play", "voice", "story_v_out_116431", "116431136", "story_v_out_116431.awb")
					end

					arg_569_1:RecordHistoryTalkVoice("story_v_out_116431", "116431136", "story_v_out_116431.awb")
				end

				arg_569_1:RecordContent(arg_569_1.text_.text)
			end

			local var_572_10 = math.max(var_572_1, arg_569_1.talkMaxDuration)

			if var_572_0 <= arg_569_1.time_ and arg_569_1.time_ < var_572_0 + var_572_10 then
				arg_569_1.typewritter.percent = (arg_569_1.time_ - var_572_0) / var_572_10

				arg_569_1.typewritter:SetDirty()
			end

			if arg_569_1.time_ >= var_572_0 + var_572_10 and arg_569_1.time_ < var_572_0 + var_572_10 + arg_572_0 then
				arg_569_1.typewritter.percent = 1

				arg_569_1.typewritter:SetDirty()
				arg_569_1:ShowNextGo(true)
			end
		end
	end,
	Play116431137 = function(arg_573_0, arg_573_1)
		arg_573_1.time_ = 0
		arg_573_1.frameCnt_ = 0
		arg_573_1.state_ = "playing"
		arg_573_1.curTalkId_ = 116431137
		arg_573_1.duration_ = 5

		SetActive(arg_573_1.tipsGo_, false)

		function arg_573_1.onSingleLineFinish_()
			arg_573_1.onSingleLineUpdate_ = nil
			arg_573_1.onSingleLineFinish_ = nil
			arg_573_1.state_ = "waiting"
		end

		function arg_573_1.playNext_(arg_575_0)
			if arg_575_0 == 1 then
				arg_573_0:Play116431138(arg_573_1)
			end
		end

		function arg_573_1.onSingleLineUpdate_(arg_576_0)
			local var_576_0 = 0
			local var_576_1 = 0.65

			if var_576_0 < arg_573_1.time_ and arg_573_1.time_ <= var_576_0 + arg_576_0 then
				arg_573_1.talkMaxDuration = 0
				arg_573_1.dialogCg_.alpha = 1

				arg_573_1.dialog_:SetActive(true)
				SetActive(arg_573_1.leftNameGo_, true)

				local var_576_2 = arg_573_1:FormatText(StoryNameCfg[7].name)

				arg_573_1.leftNameTxt_.text = var_576_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_573_1.leftNameTxt_.transform)

				arg_573_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_573_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_573_1:RecordName(arg_573_1.leftNameTxt_.text)
				SetActive(arg_573_1.iconTrs_.gameObject, false)
				arg_573_1.callingController_:SetSelectedState("normal")

				local var_576_3 = arg_573_1:GetWordFromCfg(116431137)
				local var_576_4 = arg_573_1:FormatText(var_576_3.content)

				arg_573_1.text_.text = var_576_4

				LuaForUtil.ClearLinePrefixSymbol(arg_573_1.text_)

				local var_576_5 = 26
				local var_576_6 = utf8.len(var_576_4)
				local var_576_7 = var_576_5 <= 0 and var_576_1 or var_576_1 * (var_576_6 / var_576_5)

				if var_576_7 > 0 and var_576_1 < var_576_7 then
					arg_573_1.talkMaxDuration = var_576_7

					if var_576_7 + var_576_0 > arg_573_1.duration_ then
						arg_573_1.duration_ = var_576_7 + var_576_0
					end
				end

				arg_573_1.text_.text = var_576_4
				arg_573_1.typewritter.percent = 0

				arg_573_1.typewritter:SetDirty()
				arg_573_1:ShowNextGo(false)
				arg_573_1:RecordContent(arg_573_1.text_.text)
			end

			local var_576_8 = math.max(var_576_1, arg_573_1.talkMaxDuration)

			if var_576_0 <= arg_573_1.time_ and arg_573_1.time_ < var_576_0 + var_576_8 then
				arg_573_1.typewritter.percent = (arg_573_1.time_ - var_576_0) / var_576_8

				arg_573_1.typewritter:SetDirty()
			end

			if arg_573_1.time_ >= var_576_0 + var_576_8 and arg_573_1.time_ < var_576_0 + var_576_8 + arg_576_0 then
				arg_573_1.typewritter.percent = 1

				arg_573_1.typewritter:SetDirty()
				arg_573_1:ShowNextGo(true)
			end
		end
	end,
	Play116431138 = function(arg_577_0, arg_577_1)
		arg_577_1.time_ = 0
		arg_577_1.frameCnt_ = 0
		arg_577_1.state_ = "playing"
		arg_577_1.curTalkId_ = 116431138
		arg_577_1.duration_ = 2.7

		local var_577_0 = {
			zh = 2.7,
			ja = 1.6
		}
		local var_577_1 = manager.audio:GetLocalizationFlag()

		if var_577_0[var_577_1] ~= nil then
			arg_577_1.duration_ = var_577_0[var_577_1]
		end

		SetActive(arg_577_1.tipsGo_, false)

		function arg_577_1.onSingleLineFinish_()
			arg_577_1.onSingleLineUpdate_ = nil
			arg_577_1.onSingleLineFinish_ = nil
			arg_577_1.state_ = "waiting"
		end

		function arg_577_1.playNext_(arg_579_0)
			if arg_579_0 == 1 then
				arg_577_0:Play116431139(arg_577_1)
			end
		end

		function arg_577_1.onSingleLineUpdate_(arg_580_0)
			local var_580_0 = 0
			local var_580_1 = 0.1

			if var_580_0 < arg_577_1.time_ and arg_577_1.time_ <= var_580_0 + arg_580_0 then
				arg_577_1.talkMaxDuration = 0
				arg_577_1.dialogCg_.alpha = 1

				arg_577_1.dialog_:SetActive(true)
				SetActive(arg_577_1.leftNameGo_, true)

				local var_580_2 = arg_577_1:FormatText(StoryNameCfg[36].name)

				arg_577_1.leftNameTxt_.text = var_580_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_577_1.leftNameTxt_.transform)

				arg_577_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_577_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_577_1:RecordName(arg_577_1.leftNameTxt_.text)
				SetActive(arg_577_1.iconTrs_.gameObject, true)
				arg_577_1.iconController_:SetSelectedState("hero")

				arg_577_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10025")

				arg_577_1.callingController_:SetSelectedState("normal")

				local var_580_3 = arg_577_1:GetWordFromCfg(116431138)
				local var_580_4 = arg_577_1:FormatText(var_580_3.content)

				arg_577_1.text_.text = var_580_4

				LuaForUtil.ClearLinePrefixSymbol(arg_577_1.text_)

				local var_580_5 = 4
				local var_580_6 = utf8.len(var_580_4)
				local var_580_7 = var_580_5 <= 0 and var_580_1 or var_580_1 * (var_580_6 / var_580_5)

				if var_580_7 > 0 and var_580_1 < var_580_7 then
					arg_577_1.talkMaxDuration = var_580_7

					if var_580_7 + var_580_0 > arg_577_1.duration_ then
						arg_577_1.duration_ = var_580_7 + var_580_0
					end
				end

				arg_577_1.text_.text = var_580_4
				arg_577_1.typewritter.percent = 0

				arg_577_1.typewritter:SetDirty()
				arg_577_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431138", "story_v_out_116431.awb") ~= 0 then
					local var_580_8 = manager.audio:GetVoiceLength("story_v_out_116431", "116431138", "story_v_out_116431.awb") / 1000

					if var_580_8 + var_580_0 > arg_577_1.duration_ then
						arg_577_1.duration_ = var_580_8 + var_580_0
					end

					if var_580_3.prefab_name ~= "" and arg_577_1.actors_[var_580_3.prefab_name] ~= nil then
						local var_580_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_577_1.actors_[var_580_3.prefab_name].transform, "story_v_out_116431", "116431138", "story_v_out_116431.awb")

						arg_577_1:RecordAudio("116431138", var_580_9)
						arg_577_1:RecordAudio("116431138", var_580_9)
					else
						arg_577_1:AudioAction("play", "voice", "story_v_out_116431", "116431138", "story_v_out_116431.awb")
					end

					arg_577_1:RecordHistoryTalkVoice("story_v_out_116431", "116431138", "story_v_out_116431.awb")
				end

				arg_577_1:RecordContent(arg_577_1.text_.text)
			end

			local var_580_10 = math.max(var_580_1, arg_577_1.talkMaxDuration)

			if var_580_0 <= arg_577_1.time_ and arg_577_1.time_ < var_580_0 + var_580_10 then
				arg_577_1.typewritter.percent = (arg_577_1.time_ - var_580_0) / var_580_10

				arg_577_1.typewritter:SetDirty()
			end

			if arg_577_1.time_ >= var_580_0 + var_580_10 and arg_577_1.time_ < var_580_0 + var_580_10 + arg_580_0 then
				arg_577_1.typewritter.percent = 1

				arg_577_1.typewritter:SetDirty()
				arg_577_1:ShowNextGo(true)
			end
		end
	end,
	Play116431139 = function(arg_581_0, arg_581_1)
		arg_581_1.time_ = 0
		arg_581_1.frameCnt_ = 0
		arg_581_1.state_ = "playing"
		arg_581_1.curTalkId_ = 116431139
		arg_581_1.duration_ = 5

		SetActive(arg_581_1.tipsGo_, false)

		function arg_581_1.onSingleLineFinish_()
			arg_581_1.onSingleLineUpdate_ = nil
			arg_581_1.onSingleLineFinish_ = nil
			arg_581_1.state_ = "waiting"
		end

		function arg_581_1.playNext_(arg_583_0)
			if arg_583_0 == 1 then
				arg_581_0:Play116431140(arg_581_1)
			end
		end

		function arg_581_1.onSingleLineUpdate_(arg_584_0)
			local var_584_0 = 0
			local var_584_1 = 0.6

			if var_584_0 < arg_581_1.time_ and arg_581_1.time_ <= var_584_0 + arg_584_0 then
				arg_581_1.talkMaxDuration = 0
				arg_581_1.dialogCg_.alpha = 1

				arg_581_1.dialog_:SetActive(true)
				SetActive(arg_581_1.leftNameGo_, true)

				local var_584_2 = arg_581_1:FormatText(StoryNameCfg[7].name)

				arg_581_1.leftNameTxt_.text = var_584_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_581_1.leftNameTxt_.transform)

				arg_581_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_581_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_581_1:RecordName(arg_581_1.leftNameTxt_.text)
				SetActive(arg_581_1.iconTrs_.gameObject, false)
				arg_581_1.callingController_:SetSelectedState("normal")

				local var_584_3 = arg_581_1:GetWordFromCfg(116431139)
				local var_584_4 = arg_581_1:FormatText(var_584_3.content)

				arg_581_1.text_.text = var_584_4

				LuaForUtil.ClearLinePrefixSymbol(arg_581_1.text_)

				local var_584_5 = 24
				local var_584_6 = utf8.len(var_584_4)
				local var_584_7 = var_584_5 <= 0 and var_584_1 or var_584_1 * (var_584_6 / var_584_5)

				if var_584_7 > 0 and var_584_1 < var_584_7 then
					arg_581_1.talkMaxDuration = var_584_7

					if var_584_7 + var_584_0 > arg_581_1.duration_ then
						arg_581_1.duration_ = var_584_7 + var_584_0
					end
				end

				arg_581_1.text_.text = var_584_4
				arg_581_1.typewritter.percent = 0

				arg_581_1.typewritter:SetDirty()
				arg_581_1:ShowNextGo(false)
				arg_581_1:RecordContent(arg_581_1.text_.text)
			end

			local var_584_8 = math.max(var_584_1, arg_581_1.talkMaxDuration)

			if var_584_0 <= arg_581_1.time_ and arg_581_1.time_ < var_584_0 + var_584_8 then
				arg_581_1.typewritter.percent = (arg_581_1.time_ - var_584_0) / var_584_8

				arg_581_1.typewritter:SetDirty()
			end

			if arg_581_1.time_ >= var_584_0 + var_584_8 and arg_581_1.time_ < var_584_0 + var_584_8 + arg_584_0 then
				arg_581_1.typewritter.percent = 1

				arg_581_1.typewritter:SetDirty()
				arg_581_1:ShowNextGo(true)
			end
		end
	end,
	Play116431140 = function(arg_585_0, arg_585_1)
		arg_585_1.time_ = 0
		arg_585_1.frameCnt_ = 0
		arg_585_1.state_ = "playing"
		arg_585_1.curTalkId_ = 116431140
		arg_585_1.duration_ = 3.266

		local var_585_0 = {
			zh = 2.7,
			ja = 3.266
		}
		local var_585_1 = manager.audio:GetLocalizationFlag()

		if var_585_0[var_585_1] ~= nil then
			arg_585_1.duration_ = var_585_0[var_585_1]
		end

		SetActive(arg_585_1.tipsGo_, false)

		function arg_585_1.onSingleLineFinish_()
			arg_585_1.onSingleLineUpdate_ = nil
			arg_585_1.onSingleLineFinish_ = nil
			arg_585_1.state_ = "waiting"
		end

		function arg_585_1.playNext_(arg_587_0)
			if arg_587_0 == 1 then
				arg_585_0:Play116431141(arg_585_1)
			end
		end

		function arg_585_1.onSingleLineUpdate_(arg_588_0)
			local var_588_0 = 0
			local var_588_1 = 0.15

			if var_588_0 < arg_585_1.time_ and arg_585_1.time_ <= var_588_0 + arg_588_0 then
				arg_585_1.talkMaxDuration = 0
				arg_585_1.dialogCg_.alpha = 1

				arg_585_1.dialog_:SetActive(true)
				SetActive(arg_585_1.leftNameGo_, true)

				local var_588_2 = arg_585_1:FormatText(StoryNameCfg[36].name)

				arg_585_1.leftNameTxt_.text = var_588_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_585_1.leftNameTxt_.transform)

				arg_585_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_585_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_585_1:RecordName(arg_585_1.leftNameTxt_.text)
				SetActive(arg_585_1.iconTrs_.gameObject, true)
				arg_585_1.iconController_:SetSelectedState("hero")

				arg_585_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10025")

				arg_585_1.callingController_:SetSelectedState("normal")

				local var_588_3 = arg_585_1:GetWordFromCfg(116431140)
				local var_588_4 = arg_585_1:FormatText(var_588_3.content)

				arg_585_1.text_.text = var_588_4

				LuaForUtil.ClearLinePrefixSymbol(arg_585_1.text_)

				local var_588_5 = 6
				local var_588_6 = utf8.len(var_588_4)
				local var_588_7 = var_588_5 <= 0 and var_588_1 or var_588_1 * (var_588_6 / var_588_5)

				if var_588_7 > 0 and var_588_1 < var_588_7 then
					arg_585_1.talkMaxDuration = var_588_7

					if var_588_7 + var_588_0 > arg_585_1.duration_ then
						arg_585_1.duration_ = var_588_7 + var_588_0
					end
				end

				arg_585_1.text_.text = var_588_4
				arg_585_1.typewritter.percent = 0

				arg_585_1.typewritter:SetDirty()
				arg_585_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431140", "story_v_out_116431.awb") ~= 0 then
					local var_588_8 = manager.audio:GetVoiceLength("story_v_out_116431", "116431140", "story_v_out_116431.awb") / 1000

					if var_588_8 + var_588_0 > arg_585_1.duration_ then
						arg_585_1.duration_ = var_588_8 + var_588_0
					end

					if var_588_3.prefab_name ~= "" and arg_585_1.actors_[var_588_3.prefab_name] ~= nil then
						local var_588_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_585_1.actors_[var_588_3.prefab_name].transform, "story_v_out_116431", "116431140", "story_v_out_116431.awb")

						arg_585_1:RecordAudio("116431140", var_588_9)
						arg_585_1:RecordAudio("116431140", var_588_9)
					else
						arg_585_1:AudioAction("play", "voice", "story_v_out_116431", "116431140", "story_v_out_116431.awb")
					end

					arg_585_1:RecordHistoryTalkVoice("story_v_out_116431", "116431140", "story_v_out_116431.awb")
				end

				arg_585_1:RecordContent(arg_585_1.text_.text)
			end

			local var_588_10 = math.max(var_588_1, arg_585_1.talkMaxDuration)

			if var_588_0 <= arg_585_1.time_ and arg_585_1.time_ < var_588_0 + var_588_10 then
				arg_585_1.typewritter.percent = (arg_585_1.time_ - var_588_0) / var_588_10

				arg_585_1.typewritter:SetDirty()
			end

			if arg_585_1.time_ >= var_588_0 + var_588_10 and arg_585_1.time_ < var_588_0 + var_588_10 + arg_588_0 then
				arg_585_1.typewritter.percent = 1

				arg_585_1.typewritter:SetDirty()
				arg_585_1:ShowNextGo(true)
			end
		end
	end,
	Play116431141 = function(arg_589_0, arg_589_1)
		arg_589_1.time_ = 0
		arg_589_1.frameCnt_ = 0
		arg_589_1.state_ = "playing"
		arg_589_1.curTalkId_ = 116431141
		arg_589_1.duration_ = 5

		SetActive(arg_589_1.tipsGo_, false)

		function arg_589_1.onSingleLineFinish_()
			arg_589_1.onSingleLineUpdate_ = nil
			arg_589_1.onSingleLineFinish_ = nil
			arg_589_1.state_ = "waiting"
		end

		function arg_589_1.playNext_(arg_591_0)
			if arg_591_0 == 1 then
				arg_589_0:Play116431142(arg_589_1)
			end
		end

		function arg_589_1.onSingleLineUpdate_(arg_592_0)
			local var_592_0 = 0
			local var_592_1 = 1

			if var_592_0 < arg_589_1.time_ and arg_589_1.time_ <= var_592_0 + arg_592_0 then
				arg_589_1.talkMaxDuration = 0
				arg_589_1.dialogCg_.alpha = 1

				arg_589_1.dialog_:SetActive(true)
				SetActive(arg_589_1.leftNameGo_, false)

				arg_589_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_589_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_589_1:RecordName(arg_589_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_589_1.iconTrs_.gameObject, false)
				arg_589_1.callingController_:SetSelectedState("normal")

				local var_592_2 = arg_589_1:GetWordFromCfg(116431141)
				local var_592_3 = arg_589_1:FormatText(var_592_2.content)

				arg_589_1.text_.text = var_592_3

				LuaForUtil.ClearLinePrefixSymbol(arg_589_1.text_)

				local var_592_4 = 40
				local var_592_5 = utf8.len(var_592_3)
				local var_592_6 = var_592_4 <= 0 and var_592_1 or var_592_1 * (var_592_5 / var_592_4)

				if var_592_6 > 0 and var_592_1 < var_592_6 then
					arg_589_1.talkMaxDuration = var_592_6

					if var_592_6 + var_592_0 > arg_589_1.duration_ then
						arg_589_1.duration_ = var_592_6 + var_592_0
					end
				end

				arg_589_1.text_.text = var_592_3
				arg_589_1.typewritter.percent = 0

				arg_589_1.typewritter:SetDirty()
				arg_589_1:ShowNextGo(false)
				arg_589_1:RecordContent(arg_589_1.text_.text)
			end

			local var_592_7 = math.max(var_592_1, arg_589_1.talkMaxDuration)

			if var_592_0 <= arg_589_1.time_ and arg_589_1.time_ < var_592_0 + var_592_7 then
				arg_589_1.typewritter.percent = (arg_589_1.time_ - var_592_0) / var_592_7

				arg_589_1.typewritter:SetDirty()
			end

			if arg_589_1.time_ >= var_592_0 + var_592_7 and arg_589_1.time_ < var_592_0 + var_592_7 + arg_592_0 then
				arg_589_1.typewritter.percent = 1

				arg_589_1.typewritter:SetDirty()
				arg_589_1:ShowNextGo(true)
			end
		end
	end,
	Play116431142 = function(arg_593_0, arg_593_1)
		arg_593_1.time_ = 0
		arg_593_1.frameCnt_ = 0
		arg_593_1.state_ = "playing"
		arg_593_1.curTalkId_ = 116431142
		arg_593_1.duration_ = 5

		SetActive(arg_593_1.tipsGo_, false)

		function arg_593_1.onSingleLineFinish_()
			arg_593_1.onSingleLineUpdate_ = nil
			arg_593_1.onSingleLineFinish_ = nil
			arg_593_1.state_ = "waiting"
		end

		function arg_593_1.playNext_(arg_595_0)
			if arg_595_0 == 1 then
				arg_593_0:Play116431143(arg_593_1)
			end
		end

		function arg_593_1.onSingleLineUpdate_(arg_596_0)
			local var_596_0 = 0
			local var_596_1 = 1

			if var_596_0 < arg_593_1.time_ and arg_593_1.time_ <= var_596_0 + arg_596_0 then
				local var_596_2 = "play"
				local var_596_3 = "effect"

				arg_593_1:AudioAction(var_596_2, var_596_3, "se_story_16", "se_story_16_loading", "")
			end

			local var_596_4 = 0
			local var_596_5 = 0.375

			if var_596_4 < arg_593_1.time_ and arg_593_1.time_ <= var_596_4 + arg_596_0 then
				arg_593_1.talkMaxDuration = 0
				arg_593_1.dialogCg_.alpha = 1

				arg_593_1.dialog_:SetActive(true)
				SetActive(arg_593_1.leftNameGo_, false)

				arg_593_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_593_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_593_1:RecordName(arg_593_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_593_1.iconTrs_.gameObject, false)
				arg_593_1.callingController_:SetSelectedState("normal")

				local var_596_6 = arg_593_1:GetWordFromCfg(116431142)
				local var_596_7 = arg_593_1:FormatText(var_596_6.content)

				arg_593_1.text_.text = var_596_7

				LuaForUtil.ClearLinePrefixSymbol(arg_593_1.text_)

				local var_596_8 = 15
				local var_596_9 = utf8.len(var_596_7)
				local var_596_10 = var_596_8 <= 0 and var_596_5 or var_596_5 * (var_596_9 / var_596_8)

				if var_596_10 > 0 and var_596_5 < var_596_10 then
					arg_593_1.talkMaxDuration = var_596_10

					if var_596_10 + var_596_4 > arg_593_1.duration_ then
						arg_593_1.duration_ = var_596_10 + var_596_4
					end
				end

				arg_593_1.text_.text = var_596_7
				arg_593_1.typewritter.percent = 0

				arg_593_1.typewritter:SetDirty()
				arg_593_1:ShowNextGo(false)
				arg_593_1:RecordContent(arg_593_1.text_.text)
			end

			local var_596_11 = math.max(var_596_5, arg_593_1.talkMaxDuration)

			if var_596_4 <= arg_593_1.time_ and arg_593_1.time_ < var_596_4 + var_596_11 then
				arg_593_1.typewritter.percent = (arg_593_1.time_ - var_596_4) / var_596_11

				arg_593_1.typewritter:SetDirty()
			end

			if arg_593_1.time_ >= var_596_4 + var_596_11 and arg_593_1.time_ < var_596_4 + var_596_11 + arg_596_0 then
				arg_593_1.typewritter.percent = 1

				arg_593_1.typewritter:SetDirty()
				arg_593_1:ShowNextGo(true)
			end
		end
	end,
	Play116431143 = function(arg_597_0, arg_597_1)
		arg_597_1.time_ = 0
		arg_597_1.frameCnt_ = 0
		arg_597_1.state_ = "playing"
		arg_597_1.curTalkId_ = 116431143
		arg_597_1.duration_ = 5

		SetActive(arg_597_1.tipsGo_, false)

		function arg_597_1.onSingleLineFinish_()
			arg_597_1.onSingleLineUpdate_ = nil
			arg_597_1.onSingleLineFinish_ = nil
			arg_597_1.state_ = "waiting"
		end

		function arg_597_1.playNext_(arg_599_0)
			if arg_599_0 == 1 then
				arg_597_0:Play116431144(arg_597_1)
			end
		end

		function arg_597_1.onSingleLineUpdate_(arg_600_0)
			local var_600_0 = 0
			local var_600_1 = 0.95

			if var_600_0 < arg_597_1.time_ and arg_597_1.time_ <= var_600_0 + arg_600_0 then
				arg_597_1.talkMaxDuration = 0
				arg_597_1.dialogCg_.alpha = 1

				arg_597_1.dialog_:SetActive(true)
				SetActive(arg_597_1.leftNameGo_, true)

				local var_600_2 = arg_597_1:FormatText(StoryNameCfg[7].name)

				arg_597_1.leftNameTxt_.text = var_600_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_597_1.leftNameTxt_.transform)

				arg_597_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_597_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_597_1:RecordName(arg_597_1.leftNameTxt_.text)
				SetActive(arg_597_1.iconTrs_.gameObject, false)
				arg_597_1.callingController_:SetSelectedState("normal")

				local var_600_3 = arg_597_1:GetWordFromCfg(116431143)
				local var_600_4 = arg_597_1:FormatText(var_600_3.content)

				arg_597_1.text_.text = var_600_4

				LuaForUtil.ClearLinePrefixSymbol(arg_597_1.text_)

				local var_600_5 = 38
				local var_600_6 = utf8.len(var_600_4)
				local var_600_7 = var_600_5 <= 0 and var_600_1 or var_600_1 * (var_600_6 / var_600_5)

				if var_600_7 > 0 and var_600_1 < var_600_7 then
					arg_597_1.talkMaxDuration = var_600_7

					if var_600_7 + var_600_0 > arg_597_1.duration_ then
						arg_597_1.duration_ = var_600_7 + var_600_0
					end
				end

				arg_597_1.text_.text = var_600_4
				arg_597_1.typewritter.percent = 0

				arg_597_1.typewritter:SetDirty()
				arg_597_1:ShowNextGo(false)
				arg_597_1:RecordContent(arg_597_1.text_.text)
			end

			local var_600_8 = math.max(var_600_1, arg_597_1.talkMaxDuration)

			if var_600_0 <= arg_597_1.time_ and arg_597_1.time_ < var_600_0 + var_600_8 then
				arg_597_1.typewritter.percent = (arg_597_1.time_ - var_600_0) / var_600_8

				arg_597_1.typewritter:SetDirty()
			end

			if arg_597_1.time_ >= var_600_0 + var_600_8 and arg_597_1.time_ < var_600_0 + var_600_8 + arg_600_0 then
				arg_597_1.typewritter.percent = 1

				arg_597_1.typewritter:SetDirty()
				arg_597_1:ShowNextGo(true)
			end
		end
	end,
	Play116431144 = function(arg_601_0, arg_601_1)
		arg_601_1.time_ = 0
		arg_601_1.frameCnt_ = 0
		arg_601_1.state_ = "playing"
		arg_601_1.curTalkId_ = 116431144
		arg_601_1.duration_ = 5

		SetActive(arg_601_1.tipsGo_, false)

		function arg_601_1.onSingleLineFinish_()
			arg_601_1.onSingleLineUpdate_ = nil
			arg_601_1.onSingleLineFinish_ = nil
			arg_601_1.state_ = "waiting"
		end

		function arg_601_1.playNext_(arg_603_0)
			if arg_603_0 == 1 then
				arg_601_0:Play116431145(arg_601_1)
			end
		end

		function arg_601_1.onSingleLineUpdate_(arg_604_0)
			local var_604_0 = 0
			local var_604_1 = 1.3

			if var_604_0 < arg_601_1.time_ and arg_601_1.time_ <= var_604_0 + arg_604_0 then
				arg_601_1.talkMaxDuration = 0
				arg_601_1.dialogCg_.alpha = 1

				arg_601_1.dialog_:SetActive(true)
				SetActive(arg_601_1.leftNameGo_, false)

				arg_601_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_601_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_601_1:RecordName(arg_601_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_601_1.iconTrs_.gameObject, false)
				arg_601_1.callingController_:SetSelectedState("normal")

				local var_604_2 = arg_601_1:GetWordFromCfg(116431144)
				local var_604_3 = arg_601_1:FormatText(var_604_2.content)

				arg_601_1.text_.text = var_604_3

				LuaForUtil.ClearLinePrefixSymbol(arg_601_1.text_)

				local var_604_4 = 52
				local var_604_5 = utf8.len(var_604_3)
				local var_604_6 = var_604_4 <= 0 and var_604_1 or var_604_1 * (var_604_5 / var_604_4)

				if var_604_6 > 0 and var_604_1 < var_604_6 then
					arg_601_1.talkMaxDuration = var_604_6

					if var_604_6 + var_604_0 > arg_601_1.duration_ then
						arg_601_1.duration_ = var_604_6 + var_604_0
					end
				end

				arg_601_1.text_.text = var_604_3
				arg_601_1.typewritter.percent = 0

				arg_601_1.typewritter:SetDirty()
				arg_601_1:ShowNextGo(false)
				arg_601_1:RecordContent(arg_601_1.text_.text)
			end

			local var_604_7 = math.max(var_604_1, arg_601_1.talkMaxDuration)

			if var_604_0 <= arg_601_1.time_ and arg_601_1.time_ < var_604_0 + var_604_7 then
				arg_601_1.typewritter.percent = (arg_601_1.time_ - var_604_0) / var_604_7

				arg_601_1.typewritter:SetDirty()
			end

			if arg_601_1.time_ >= var_604_0 + var_604_7 and arg_601_1.time_ < var_604_0 + var_604_7 + arg_604_0 then
				arg_601_1.typewritter.percent = 1

				arg_601_1.typewritter:SetDirty()
				arg_601_1:ShowNextGo(true)
			end
		end
	end,
	Play116431145 = function(arg_605_0, arg_605_1)
		arg_605_1.time_ = 0
		arg_605_1.frameCnt_ = 0
		arg_605_1.state_ = "playing"
		arg_605_1.curTalkId_ = 116431145
		arg_605_1.duration_ = 3.233

		local var_605_0 = {
			zh = 2.4,
			ja = 3.233
		}
		local var_605_1 = manager.audio:GetLocalizationFlag()

		if var_605_0[var_605_1] ~= nil then
			arg_605_1.duration_ = var_605_0[var_605_1]
		end

		SetActive(arg_605_1.tipsGo_, false)

		function arg_605_1.onSingleLineFinish_()
			arg_605_1.onSingleLineUpdate_ = nil
			arg_605_1.onSingleLineFinish_ = nil
			arg_605_1.state_ = "waiting"
		end

		function arg_605_1.playNext_(arg_607_0)
			if arg_607_0 == 1 then
				arg_605_0:Play116431146(arg_605_1)
			end
		end

		function arg_605_1.onSingleLineUpdate_(arg_608_0)
			local var_608_0 = arg_605_1.actors_["10025ui_story"].transform
			local var_608_1 = 0

			if var_608_1 < arg_605_1.time_ and arg_605_1.time_ <= var_608_1 + arg_608_0 then
				arg_605_1.var_.moveOldPos10025ui_story = var_608_0.localPosition
			end

			local var_608_2 = 0.001

			if var_608_1 <= arg_605_1.time_ and arg_605_1.time_ < var_608_1 + var_608_2 then
				local var_608_3 = (arg_605_1.time_ - var_608_1) / var_608_2
				local var_608_4 = Vector3.New(0, -1.1, -5.9)

				var_608_0.localPosition = Vector3.Lerp(arg_605_1.var_.moveOldPos10025ui_story, var_608_4, var_608_3)

				local var_608_5 = manager.ui.mainCamera.transform.position - var_608_0.position

				var_608_0.forward = Vector3.New(var_608_5.x, var_608_5.y, var_608_5.z)

				local var_608_6 = var_608_0.localEulerAngles

				var_608_6.z = 0
				var_608_6.x = 0
				var_608_0.localEulerAngles = var_608_6
			end

			if arg_605_1.time_ >= var_608_1 + var_608_2 and arg_605_1.time_ < var_608_1 + var_608_2 + arg_608_0 then
				var_608_0.localPosition = Vector3.New(0, -1.1, -5.9)

				local var_608_7 = manager.ui.mainCamera.transform.position - var_608_0.position

				var_608_0.forward = Vector3.New(var_608_7.x, var_608_7.y, var_608_7.z)

				local var_608_8 = var_608_0.localEulerAngles

				var_608_8.z = 0
				var_608_8.x = 0
				var_608_0.localEulerAngles = var_608_8
			end

			local var_608_9 = arg_605_1.actors_["10025ui_story"]
			local var_608_10 = 0

			if var_608_10 < arg_605_1.time_ and arg_605_1.time_ <= var_608_10 + arg_608_0 and arg_605_1.var_.characterEffect10025ui_story == nil then
				arg_605_1.var_.characterEffect10025ui_story = var_608_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_608_11 = 0.2

			if var_608_10 <= arg_605_1.time_ and arg_605_1.time_ < var_608_10 + var_608_11 then
				local var_608_12 = (arg_605_1.time_ - var_608_10) / var_608_11

				if arg_605_1.var_.characterEffect10025ui_story then
					arg_605_1.var_.characterEffect10025ui_story.fillFlat = false
				end
			end

			if arg_605_1.time_ >= var_608_10 + var_608_11 and arg_605_1.time_ < var_608_10 + var_608_11 + arg_608_0 and arg_605_1.var_.characterEffect10025ui_story then
				arg_605_1.var_.characterEffect10025ui_story.fillFlat = false
			end

			local var_608_13 = 0

			if var_608_13 < arg_605_1.time_ and arg_605_1.time_ <= var_608_13 + arg_608_0 then
				arg_605_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action4_1")
			end

			local var_608_14 = 0

			if var_608_14 < arg_605_1.time_ and arg_605_1.time_ <= var_608_14 + arg_608_0 then
				arg_605_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_608_15 = 0
			local var_608_16 = 0.125

			if var_608_15 < arg_605_1.time_ and arg_605_1.time_ <= var_608_15 + arg_608_0 then
				arg_605_1.talkMaxDuration = 0
				arg_605_1.dialogCg_.alpha = 1

				arg_605_1.dialog_:SetActive(true)
				SetActive(arg_605_1.leftNameGo_, true)

				local var_608_17 = arg_605_1:FormatText(StoryNameCfg[36].name)

				arg_605_1.leftNameTxt_.text = var_608_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_605_1.leftNameTxt_.transform)

				arg_605_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_605_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_605_1:RecordName(arg_605_1.leftNameTxt_.text)
				SetActive(arg_605_1.iconTrs_.gameObject, false)
				arg_605_1.callingController_:SetSelectedState("normal")

				local var_608_18 = arg_605_1:GetWordFromCfg(116431145)
				local var_608_19 = arg_605_1:FormatText(var_608_18.content)

				arg_605_1.text_.text = var_608_19

				LuaForUtil.ClearLinePrefixSymbol(arg_605_1.text_)

				local var_608_20 = 5
				local var_608_21 = utf8.len(var_608_19)
				local var_608_22 = var_608_20 <= 0 and var_608_16 or var_608_16 * (var_608_21 / var_608_20)

				if var_608_22 > 0 and var_608_16 < var_608_22 then
					arg_605_1.talkMaxDuration = var_608_22

					if var_608_22 + var_608_15 > arg_605_1.duration_ then
						arg_605_1.duration_ = var_608_22 + var_608_15
					end
				end

				arg_605_1.text_.text = var_608_19
				arg_605_1.typewritter.percent = 0

				arg_605_1.typewritter:SetDirty()
				arg_605_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431145", "story_v_out_116431.awb") ~= 0 then
					local var_608_23 = manager.audio:GetVoiceLength("story_v_out_116431", "116431145", "story_v_out_116431.awb") / 1000

					if var_608_23 + var_608_15 > arg_605_1.duration_ then
						arg_605_1.duration_ = var_608_23 + var_608_15
					end

					if var_608_18.prefab_name ~= "" and arg_605_1.actors_[var_608_18.prefab_name] ~= nil then
						local var_608_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_605_1.actors_[var_608_18.prefab_name].transform, "story_v_out_116431", "116431145", "story_v_out_116431.awb")

						arg_605_1:RecordAudio("116431145", var_608_24)
						arg_605_1:RecordAudio("116431145", var_608_24)
					else
						arg_605_1:AudioAction("play", "voice", "story_v_out_116431", "116431145", "story_v_out_116431.awb")
					end

					arg_605_1:RecordHistoryTalkVoice("story_v_out_116431", "116431145", "story_v_out_116431.awb")
				end

				arg_605_1:RecordContent(arg_605_1.text_.text)
			end

			local var_608_25 = math.max(var_608_16, arg_605_1.talkMaxDuration)

			if var_608_15 <= arg_605_1.time_ and arg_605_1.time_ < var_608_15 + var_608_25 then
				arg_605_1.typewritter.percent = (arg_605_1.time_ - var_608_15) / var_608_25

				arg_605_1.typewritter:SetDirty()
			end

			if arg_605_1.time_ >= var_608_15 + var_608_25 and arg_605_1.time_ < var_608_15 + var_608_25 + arg_608_0 then
				arg_605_1.typewritter.percent = 1

				arg_605_1.typewritter:SetDirty()
				arg_605_1:ShowNextGo(true)
			end
		end
	end,
	Play116431146 = function(arg_609_0, arg_609_1)
		arg_609_1.time_ = 0
		arg_609_1.frameCnt_ = 0
		arg_609_1.state_ = "playing"
		arg_609_1.curTalkId_ = 116431146
		arg_609_1.duration_ = 8.2

		local var_609_0 = {
			zh = 6,
			ja = 8.2
		}
		local var_609_1 = manager.audio:GetLocalizationFlag()

		if var_609_0[var_609_1] ~= nil then
			arg_609_1.duration_ = var_609_0[var_609_1]
		end

		SetActive(arg_609_1.tipsGo_, false)

		function arg_609_1.onSingleLineFinish_()
			arg_609_1.onSingleLineUpdate_ = nil
			arg_609_1.onSingleLineFinish_ = nil
			arg_609_1.state_ = "waiting"
		end

		function arg_609_1.playNext_(arg_611_0)
			if arg_611_0 == 1 then
				arg_609_0:Play116431147(arg_609_1)
			end
		end

		function arg_609_1.onSingleLineUpdate_(arg_612_0)
			local var_612_0 = arg_609_1.actors_["10025ui_story"].transform
			local var_612_1 = 0

			if var_612_1 < arg_609_1.time_ and arg_609_1.time_ <= var_612_1 + arg_612_0 then
				arg_609_1.var_.moveOldPos10025ui_story = var_612_0.localPosition
			end

			local var_612_2 = 0.001

			if var_612_1 <= arg_609_1.time_ and arg_609_1.time_ < var_612_1 + var_612_2 then
				local var_612_3 = (arg_609_1.time_ - var_612_1) / var_612_2
				local var_612_4 = Vector3.New(0, -1.1, -5.9)

				var_612_0.localPosition = Vector3.Lerp(arg_609_1.var_.moveOldPos10025ui_story, var_612_4, var_612_3)

				local var_612_5 = manager.ui.mainCamera.transform.position - var_612_0.position

				var_612_0.forward = Vector3.New(var_612_5.x, var_612_5.y, var_612_5.z)

				local var_612_6 = var_612_0.localEulerAngles

				var_612_6.z = 0
				var_612_6.x = 0
				var_612_0.localEulerAngles = var_612_6
			end

			if arg_609_1.time_ >= var_612_1 + var_612_2 and arg_609_1.time_ < var_612_1 + var_612_2 + arg_612_0 then
				var_612_0.localPosition = Vector3.New(0, -1.1, -5.9)

				local var_612_7 = manager.ui.mainCamera.transform.position - var_612_0.position

				var_612_0.forward = Vector3.New(var_612_7.x, var_612_7.y, var_612_7.z)

				local var_612_8 = var_612_0.localEulerAngles

				var_612_8.z = 0
				var_612_8.x = 0
				var_612_0.localEulerAngles = var_612_8
			end

			local var_612_9 = 0

			if var_612_9 < arg_609_1.time_ and arg_609_1.time_ <= var_612_9 + arg_612_0 then
				arg_609_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action4_2")
			end

			local var_612_10 = 0

			if var_612_10 < arg_609_1.time_ and arg_609_1.time_ <= var_612_10 + arg_612_0 then
				arg_609_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_612_11 = 0

			if var_612_11 < arg_609_1.time_ and arg_609_1.time_ <= var_612_11 + arg_612_0 then
				arg_609_1.allBtn_.enabled = false
			end

			local var_612_12 = 2

			if arg_609_1.time_ >= var_612_11 + var_612_12 and arg_609_1.time_ < var_612_11 + var_612_12 + arg_612_0 then
				arg_609_1.allBtn_.enabled = true
			end

			local var_612_13 = 0
			local var_612_14 = 0.45

			if var_612_13 < arg_609_1.time_ and arg_609_1.time_ <= var_612_13 + arg_612_0 then
				arg_609_1.talkMaxDuration = 0
				arg_609_1.dialogCg_.alpha = 1

				arg_609_1.dialog_:SetActive(true)
				SetActive(arg_609_1.leftNameGo_, true)

				local var_612_15 = arg_609_1:FormatText(StoryNameCfg[36].name)

				arg_609_1.leftNameTxt_.text = var_612_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_609_1.leftNameTxt_.transform)

				arg_609_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_609_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_609_1:RecordName(arg_609_1.leftNameTxt_.text)
				SetActive(arg_609_1.iconTrs_.gameObject, false)
				arg_609_1.callingController_:SetSelectedState("normal")

				local var_612_16 = arg_609_1:GetWordFromCfg(116431146)
				local var_612_17 = arg_609_1:FormatText(var_612_16.content)

				arg_609_1.text_.text = var_612_17

				LuaForUtil.ClearLinePrefixSymbol(arg_609_1.text_)

				local var_612_18 = 18
				local var_612_19 = utf8.len(var_612_17)
				local var_612_20 = var_612_18 <= 0 and var_612_14 or var_612_14 * (var_612_19 / var_612_18)

				if var_612_20 > 0 and var_612_14 < var_612_20 then
					arg_609_1.talkMaxDuration = var_612_20

					if var_612_20 + var_612_13 > arg_609_1.duration_ then
						arg_609_1.duration_ = var_612_20 + var_612_13
					end
				end

				arg_609_1.text_.text = var_612_17
				arg_609_1.typewritter.percent = 0

				arg_609_1.typewritter:SetDirty()
				arg_609_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431146", "story_v_out_116431.awb") ~= 0 then
					local var_612_21 = manager.audio:GetVoiceLength("story_v_out_116431", "116431146", "story_v_out_116431.awb") / 1000

					if var_612_21 + var_612_13 > arg_609_1.duration_ then
						arg_609_1.duration_ = var_612_21 + var_612_13
					end

					if var_612_16.prefab_name ~= "" and arg_609_1.actors_[var_612_16.prefab_name] ~= nil then
						local var_612_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_609_1.actors_[var_612_16.prefab_name].transform, "story_v_out_116431", "116431146", "story_v_out_116431.awb")

						arg_609_1:RecordAudio("116431146", var_612_22)
						arg_609_1:RecordAudio("116431146", var_612_22)
					else
						arg_609_1:AudioAction("play", "voice", "story_v_out_116431", "116431146", "story_v_out_116431.awb")
					end

					arg_609_1:RecordHistoryTalkVoice("story_v_out_116431", "116431146", "story_v_out_116431.awb")
				end

				arg_609_1:RecordContent(arg_609_1.text_.text)
			end

			local var_612_23 = math.max(var_612_14, arg_609_1.talkMaxDuration)

			if var_612_13 <= arg_609_1.time_ and arg_609_1.time_ < var_612_13 + var_612_23 then
				arg_609_1.typewritter.percent = (arg_609_1.time_ - var_612_13) / var_612_23

				arg_609_1.typewritter:SetDirty()
			end

			if arg_609_1.time_ >= var_612_13 + var_612_23 and arg_609_1.time_ < var_612_13 + var_612_23 + arg_612_0 then
				arg_609_1.typewritter.percent = 1

				arg_609_1.typewritter:SetDirty()
				arg_609_1:ShowNextGo(true)
			end
		end
	end,
	Play116431147 = function(arg_613_0, arg_613_1)
		arg_613_1.time_ = 0
		arg_613_1.frameCnt_ = 0
		arg_613_1.state_ = "playing"
		arg_613_1.curTalkId_ = 116431147
		arg_613_1.duration_ = 5

		SetActive(arg_613_1.tipsGo_, false)

		function arg_613_1.onSingleLineFinish_()
			arg_613_1.onSingleLineUpdate_ = nil
			arg_613_1.onSingleLineFinish_ = nil
			arg_613_1.state_ = "waiting"
		end

		function arg_613_1.playNext_(arg_615_0)
			if arg_615_0 == 1 then
				arg_613_0:Play116431148(arg_613_1)
			end
		end

		function arg_613_1.onSingleLineUpdate_(arg_616_0)
			local var_616_0 = arg_613_1.actors_["10025ui_story"].transform
			local var_616_1 = 0

			if var_616_1 < arg_613_1.time_ and arg_613_1.time_ <= var_616_1 + arg_616_0 then
				arg_613_1.var_.moveOldPos10025ui_story = var_616_0.localPosition
			end

			local var_616_2 = 0.001

			if var_616_1 <= arg_613_1.time_ and arg_613_1.time_ < var_616_1 + var_616_2 then
				local var_616_3 = (arg_613_1.time_ - var_616_1) / var_616_2
				local var_616_4 = Vector3.New(0, 100, 0)

				var_616_0.localPosition = Vector3.Lerp(arg_613_1.var_.moveOldPos10025ui_story, var_616_4, var_616_3)

				local var_616_5 = manager.ui.mainCamera.transform.position - var_616_0.position

				var_616_0.forward = Vector3.New(var_616_5.x, var_616_5.y, var_616_5.z)

				local var_616_6 = var_616_0.localEulerAngles

				var_616_6.z = 0
				var_616_6.x = 0
				var_616_0.localEulerAngles = var_616_6
			end

			if arg_613_1.time_ >= var_616_1 + var_616_2 and arg_613_1.time_ < var_616_1 + var_616_2 + arg_616_0 then
				var_616_0.localPosition = Vector3.New(0, 100, 0)

				local var_616_7 = manager.ui.mainCamera.transform.position - var_616_0.position

				var_616_0.forward = Vector3.New(var_616_7.x, var_616_7.y, var_616_7.z)

				local var_616_8 = var_616_0.localEulerAngles

				var_616_8.z = 0
				var_616_8.x = 0
				var_616_0.localEulerAngles = var_616_8
			end

			local var_616_9 = 0
			local var_616_10 = 1.175

			if var_616_9 < arg_613_1.time_ and arg_613_1.time_ <= var_616_9 + arg_616_0 then
				arg_613_1.talkMaxDuration = 0
				arg_613_1.dialogCg_.alpha = 1

				arg_613_1.dialog_:SetActive(true)
				SetActive(arg_613_1.leftNameGo_, false)

				arg_613_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_613_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_613_1:RecordName(arg_613_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_613_1.iconTrs_.gameObject, false)
				arg_613_1.callingController_:SetSelectedState("normal")

				local var_616_11 = arg_613_1:GetWordFromCfg(116431147)
				local var_616_12 = arg_613_1:FormatText(var_616_11.content)

				arg_613_1.text_.text = var_616_12

				LuaForUtil.ClearLinePrefixSymbol(arg_613_1.text_)

				local var_616_13 = 47
				local var_616_14 = utf8.len(var_616_12)
				local var_616_15 = var_616_13 <= 0 and var_616_10 or var_616_10 * (var_616_14 / var_616_13)

				if var_616_15 > 0 and var_616_10 < var_616_15 then
					arg_613_1.talkMaxDuration = var_616_15

					if var_616_15 + var_616_9 > arg_613_1.duration_ then
						arg_613_1.duration_ = var_616_15 + var_616_9
					end
				end

				arg_613_1.text_.text = var_616_12
				arg_613_1.typewritter.percent = 0

				arg_613_1.typewritter:SetDirty()
				arg_613_1:ShowNextGo(false)
				arg_613_1:RecordContent(arg_613_1.text_.text)
			end

			local var_616_16 = math.max(var_616_10, arg_613_1.talkMaxDuration)

			if var_616_9 <= arg_613_1.time_ and arg_613_1.time_ < var_616_9 + var_616_16 then
				arg_613_1.typewritter.percent = (arg_613_1.time_ - var_616_9) / var_616_16

				arg_613_1.typewritter:SetDirty()
			end

			if arg_613_1.time_ >= var_616_9 + var_616_16 and arg_613_1.time_ < var_616_9 + var_616_16 + arg_616_0 then
				arg_613_1.typewritter.percent = 1

				arg_613_1.typewritter:SetDirty()
				arg_613_1:ShowNextGo(true)
			end
		end
	end,
	Play116431148 = function(arg_617_0, arg_617_1)
		arg_617_1.time_ = 0
		arg_617_1.frameCnt_ = 0
		arg_617_1.state_ = "playing"
		arg_617_1.curTalkId_ = 116431148
		arg_617_1.duration_ = 5

		SetActive(arg_617_1.tipsGo_, false)

		function arg_617_1.onSingleLineFinish_()
			arg_617_1.onSingleLineUpdate_ = nil
			arg_617_1.onSingleLineFinish_ = nil
			arg_617_1.state_ = "waiting"
		end

		function arg_617_1.playNext_(arg_619_0)
			if arg_619_0 == 1 then
				arg_617_0:Play116431149(arg_617_1)
			end
		end

		function arg_617_1.onSingleLineUpdate_(arg_620_0)
			local var_620_0 = 0
			local var_620_1 = 0.05

			if var_620_0 < arg_617_1.time_ and arg_617_1.time_ <= var_620_0 + arg_620_0 then
				arg_617_1.talkMaxDuration = 0
				arg_617_1.dialogCg_.alpha = 1

				arg_617_1.dialog_:SetActive(true)
				SetActive(arg_617_1.leftNameGo_, true)

				local var_620_2 = arg_617_1:FormatText(StoryNameCfg[7].name)

				arg_617_1.leftNameTxt_.text = var_620_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_617_1.leftNameTxt_.transform)

				arg_617_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_617_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_617_1:RecordName(arg_617_1.leftNameTxt_.text)
				SetActive(arg_617_1.iconTrs_.gameObject, false)
				arg_617_1.callingController_:SetSelectedState("normal")

				local var_620_3 = arg_617_1:GetWordFromCfg(116431148)
				local var_620_4 = arg_617_1:FormatText(var_620_3.content)

				arg_617_1.text_.text = var_620_4

				LuaForUtil.ClearLinePrefixSymbol(arg_617_1.text_)

				local var_620_5 = 2
				local var_620_6 = utf8.len(var_620_4)
				local var_620_7 = var_620_5 <= 0 and var_620_1 or var_620_1 * (var_620_6 / var_620_5)

				if var_620_7 > 0 and var_620_1 < var_620_7 then
					arg_617_1.talkMaxDuration = var_620_7

					if var_620_7 + var_620_0 > arg_617_1.duration_ then
						arg_617_1.duration_ = var_620_7 + var_620_0
					end
				end

				arg_617_1.text_.text = var_620_4
				arg_617_1.typewritter.percent = 0

				arg_617_1.typewritter:SetDirty()
				arg_617_1:ShowNextGo(false)
				arg_617_1:RecordContent(arg_617_1.text_.text)
			end

			local var_620_8 = math.max(var_620_1, arg_617_1.talkMaxDuration)

			if var_620_0 <= arg_617_1.time_ and arg_617_1.time_ < var_620_0 + var_620_8 then
				arg_617_1.typewritter.percent = (arg_617_1.time_ - var_620_0) / var_620_8

				arg_617_1.typewritter:SetDirty()
			end

			if arg_617_1.time_ >= var_620_0 + var_620_8 and arg_617_1.time_ < var_620_0 + var_620_8 + arg_620_0 then
				arg_617_1.typewritter.percent = 1

				arg_617_1.typewritter:SetDirty()
				arg_617_1:ShowNextGo(true)
			end
		end
	end,
	Play116431149 = function(arg_621_0, arg_621_1)
		arg_621_1.time_ = 0
		arg_621_1.frameCnt_ = 0
		arg_621_1.state_ = "playing"
		arg_621_1.curTalkId_ = 116431149
		arg_621_1.duration_ = 5

		SetActive(arg_621_1.tipsGo_, false)

		function arg_621_1.onSingleLineFinish_()
			arg_621_1.onSingleLineUpdate_ = nil
			arg_621_1.onSingleLineFinish_ = nil
			arg_621_1.state_ = "waiting"
		end

		function arg_621_1.playNext_(arg_623_0)
			if arg_623_0 == 1 then
				arg_621_0:Play116431150(arg_621_1)
			end
		end

		function arg_621_1.onSingleLineUpdate_(arg_624_0)
			local var_624_0 = 0
			local var_624_1 = 0.1

			if var_624_0 < arg_621_1.time_ and arg_621_1.time_ <= var_624_0 + arg_624_0 then
				arg_621_1.talkMaxDuration = 0
				arg_621_1.dialogCg_.alpha = 1

				arg_621_1.dialog_:SetActive(true)
				SetActive(arg_621_1.leftNameGo_, true)

				local var_624_2 = arg_621_1:FormatText(StoryNameCfg[7].name)

				arg_621_1.leftNameTxt_.text = var_624_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_621_1.leftNameTxt_.transform)

				arg_621_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_621_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_621_1:RecordName(arg_621_1.leftNameTxt_.text)
				SetActive(arg_621_1.iconTrs_.gameObject, false)
				arg_621_1.callingController_:SetSelectedState("normal")

				local var_624_3 = arg_621_1:GetWordFromCfg(116431149)
				local var_624_4 = arg_621_1:FormatText(var_624_3.content)

				arg_621_1.text_.text = var_624_4

				LuaForUtil.ClearLinePrefixSymbol(arg_621_1.text_)

				local var_624_5 = 4
				local var_624_6 = utf8.len(var_624_4)
				local var_624_7 = var_624_5 <= 0 and var_624_1 or var_624_1 * (var_624_6 / var_624_5)

				if var_624_7 > 0 and var_624_1 < var_624_7 then
					arg_621_1.talkMaxDuration = var_624_7

					if var_624_7 + var_624_0 > arg_621_1.duration_ then
						arg_621_1.duration_ = var_624_7 + var_624_0
					end
				end

				arg_621_1.text_.text = var_624_4
				arg_621_1.typewritter.percent = 0

				arg_621_1.typewritter:SetDirty()
				arg_621_1:ShowNextGo(false)
				arg_621_1:RecordContent(arg_621_1.text_.text)
			end

			local var_624_8 = math.max(var_624_1, arg_621_1.talkMaxDuration)

			if var_624_0 <= arg_621_1.time_ and arg_621_1.time_ < var_624_0 + var_624_8 then
				arg_621_1.typewritter.percent = (arg_621_1.time_ - var_624_0) / var_624_8

				arg_621_1.typewritter:SetDirty()
			end

			if arg_621_1.time_ >= var_624_0 + var_624_8 and arg_621_1.time_ < var_624_0 + var_624_8 + arg_624_0 then
				arg_621_1.typewritter.percent = 1

				arg_621_1.typewritter:SetDirty()
				arg_621_1:ShowNextGo(true)
			end
		end
	end,
	Play116431150 = function(arg_625_0, arg_625_1)
		arg_625_1.time_ = 0
		arg_625_1.frameCnt_ = 0
		arg_625_1.state_ = "playing"
		arg_625_1.curTalkId_ = 116431150
		arg_625_1.duration_ = 5

		SetActive(arg_625_1.tipsGo_, false)

		function arg_625_1.onSingleLineFinish_()
			arg_625_1.onSingleLineUpdate_ = nil
			arg_625_1.onSingleLineFinish_ = nil
			arg_625_1.state_ = "waiting"
		end

		function arg_625_1.playNext_(arg_627_0)
			if arg_627_0 == 1 then
				arg_625_0:Play116431151(arg_625_1)
			end
		end

		function arg_625_1.onSingleLineUpdate_(arg_628_0)
			local var_628_0 = 0
			local var_628_1 = 0.55

			if var_628_0 < arg_625_1.time_ and arg_625_1.time_ <= var_628_0 + arg_628_0 then
				arg_625_1.talkMaxDuration = 0
				arg_625_1.dialogCg_.alpha = 1

				arg_625_1.dialog_:SetActive(true)
				SetActive(arg_625_1.leftNameGo_, false)

				arg_625_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_625_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_625_1:RecordName(arg_625_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_625_1.iconTrs_.gameObject, false)
				arg_625_1.callingController_:SetSelectedState("normal")

				local var_628_2 = arg_625_1:GetWordFromCfg(116431150)
				local var_628_3 = arg_625_1:FormatText(var_628_2.content)

				arg_625_1.text_.text = var_628_3

				LuaForUtil.ClearLinePrefixSymbol(arg_625_1.text_)

				local var_628_4 = 22
				local var_628_5 = utf8.len(var_628_3)
				local var_628_6 = var_628_4 <= 0 and var_628_1 or var_628_1 * (var_628_5 / var_628_4)

				if var_628_6 > 0 and var_628_1 < var_628_6 then
					arg_625_1.talkMaxDuration = var_628_6

					if var_628_6 + var_628_0 > arg_625_1.duration_ then
						arg_625_1.duration_ = var_628_6 + var_628_0
					end
				end

				arg_625_1.text_.text = var_628_3
				arg_625_1.typewritter.percent = 0

				arg_625_1.typewritter:SetDirty()
				arg_625_1:ShowNextGo(false)
				arg_625_1:RecordContent(arg_625_1.text_.text)
			end

			local var_628_7 = math.max(var_628_1, arg_625_1.talkMaxDuration)

			if var_628_0 <= arg_625_1.time_ and arg_625_1.time_ < var_628_0 + var_628_7 then
				arg_625_1.typewritter.percent = (arg_625_1.time_ - var_628_0) / var_628_7

				arg_625_1.typewritter:SetDirty()
			end

			if arg_625_1.time_ >= var_628_0 + var_628_7 and arg_625_1.time_ < var_628_0 + var_628_7 + arg_628_0 then
				arg_625_1.typewritter.percent = 1

				arg_625_1.typewritter:SetDirty()
				arg_625_1:ShowNextGo(true)
			end
		end
	end,
	Play116431151 = function(arg_629_0, arg_629_1)
		arg_629_1.time_ = 0
		arg_629_1.frameCnt_ = 0
		arg_629_1.state_ = "playing"
		arg_629_1.curTalkId_ = 116431151
		arg_629_1.duration_ = 8.5

		SetActive(arg_629_1.tipsGo_, false)

		function arg_629_1.onSingleLineFinish_()
			arg_629_1.onSingleLineUpdate_ = nil
			arg_629_1.onSingleLineFinish_ = nil
			arg_629_1.state_ = "waiting"
		end

		function arg_629_1.playNext_(arg_631_0)
			if arg_631_0 == 1 then
				arg_629_0:Play116431152(arg_629_1)
			end
		end

		function arg_629_1.onSingleLineUpdate_(arg_632_0)
			local var_632_0 = 1.5

			if var_632_0 < arg_629_1.time_ and arg_629_1.time_ <= var_632_0 + arg_632_0 then
				local var_632_1 = manager.ui.mainCamera.transform.localPosition
				local var_632_2 = Vector3.New(0, 0, 10) + Vector3.New(var_632_1.x, var_632_1.y, 0)
				local var_632_3 = arg_629_1.bgs_.STblack

				var_632_3.transform.localPosition = var_632_2
				var_632_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_632_4 = var_632_3:GetComponent("SpriteRenderer")

				if var_632_4 and var_632_4.sprite then
					local var_632_5 = (var_632_3.transform.localPosition - var_632_1).z
					local var_632_6 = manager.ui.mainCameraCom_
					local var_632_7 = 2 * var_632_5 * Mathf.Tan(var_632_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_632_8 = var_632_7 * var_632_6.aspect
					local var_632_9 = var_632_4.sprite.bounds.size.x
					local var_632_10 = var_632_4.sprite.bounds.size.y
					local var_632_11 = var_632_8 / var_632_9
					local var_632_12 = var_632_7 / var_632_10
					local var_632_13 = var_632_12 < var_632_11 and var_632_11 or var_632_12

					var_632_3.transform.localScale = Vector3.New(var_632_13, var_632_13, 0)
				end

				for iter_632_0, iter_632_1 in pairs(arg_629_1.bgs_) do
					if iter_632_0 ~= "STblack" then
						iter_632_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_632_14 = 1.5

			if var_632_14 < arg_629_1.time_ and arg_629_1.time_ <= var_632_14 + arg_632_0 then
				arg_629_1.mask_.enabled = true
				arg_629_1.mask_.raycastTarget = true

				arg_629_1:SetGaussion(false)
			end

			local var_632_15 = 2

			if var_632_14 <= arg_629_1.time_ and arg_629_1.time_ < var_632_14 + var_632_15 then
				local var_632_16 = (arg_629_1.time_ - var_632_14) / var_632_15
				local var_632_17 = Color.New(0, 0, 0)

				var_632_17.a = Mathf.Lerp(1, 0, var_632_16)
				arg_629_1.mask_.color = var_632_17
			end

			if arg_629_1.time_ >= var_632_14 + var_632_15 and arg_629_1.time_ < var_632_14 + var_632_15 + arg_632_0 then
				local var_632_18 = Color.New(0, 0, 0)
				local var_632_19 = 0

				arg_629_1.mask_.enabled = false
				var_632_18.a = var_632_19
				arg_629_1.mask_.color = var_632_18
			end

			local var_632_20 = 0

			if var_632_20 < arg_629_1.time_ and arg_629_1.time_ <= var_632_20 + arg_632_0 then
				arg_629_1.mask_.enabled = true
				arg_629_1.mask_.raycastTarget = true

				arg_629_1:SetGaussion(false)
			end

			local var_632_21 = 1.5

			if var_632_20 <= arg_629_1.time_ and arg_629_1.time_ < var_632_20 + var_632_21 then
				local var_632_22 = (arg_629_1.time_ - var_632_20) / var_632_21
				local var_632_23 = Color.New(0, 0, 0)

				var_632_23.a = Mathf.Lerp(0, 1, var_632_22)
				arg_629_1.mask_.color = var_632_23
			end

			if arg_629_1.time_ >= var_632_20 + var_632_21 and arg_629_1.time_ < var_632_20 + var_632_21 + arg_632_0 then
				local var_632_24 = Color.New(0, 0, 0)

				var_632_24.a = 1
				arg_629_1.mask_.color = var_632_24
			end

			local var_632_25 = 3.5
			local var_632_26 = 1

			if var_632_25 < arg_629_1.time_ and arg_629_1.time_ <= var_632_25 + arg_632_0 then
				local var_632_27 = "play"
				local var_632_28 = "effect"

				arg_629_1:AudioAction(var_632_27, var_632_28, "se_story_16", "se_story_16_gun", "")
			end

			local var_632_29 = manager.ui.mainCamera.transform
			local var_632_30 = 3.5

			if var_632_30 < arg_629_1.time_ and arg_629_1.time_ <= var_632_30 + arg_632_0 then
				arg_629_1.var_.shakeOldPos = var_632_29.localPosition
			end

			local var_632_31 = 1

			if var_632_30 <= arg_629_1.time_ and arg_629_1.time_ < var_632_30 + var_632_31 then
				local var_632_32 = (arg_629_1.time_ - var_632_30) / 0.066
				local var_632_33, var_632_34 = math.modf(var_632_32)

				var_632_29.localPosition = Vector3.New(var_632_34 * 0.13, var_632_34 * 0.13, var_632_34 * 0.13) + arg_629_1.var_.shakeOldPos
			end

			if arg_629_1.time_ >= var_632_30 + var_632_31 and arg_629_1.time_ < var_632_30 + var_632_31 + arg_632_0 then
				var_632_29.localPosition = arg_629_1.var_.shakeOldPos
			end

			local var_632_35 = arg_629_1.bgs_.I05e.transform
			local var_632_36 = 0

			if var_632_36 < arg_629_1.time_ and arg_629_1.time_ <= var_632_36 + arg_632_0 then
				local var_632_37 = arg_629_1.var_.effectI05exiayula1

				if var_632_37 then
					Object.Destroy(var_632_37)

					arg_629_1.var_.effectI05exiayula1 = nil
				end
			end

			if arg_629_1.frameCnt_ <= 1 then
				arg_629_1.dialog_:SetActive(false)
			end

			local var_632_38 = 3.5
			local var_632_39 = 0.1

			if var_632_38 < arg_629_1.time_ and arg_629_1.time_ <= var_632_38 + arg_632_0 then
				arg_629_1.talkMaxDuration = 0

				arg_629_1.dialog_:SetActive(true)

				local var_632_40 = LeanTween.value(arg_629_1.dialog_, 0, 1, 0.3)

				var_632_40:setOnUpdate(LuaHelper.FloatAction(function(arg_633_0)
					arg_629_1.dialogCg_.alpha = arg_633_0
				end))
				var_632_40:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_629_1.dialog_)
					var_632_40:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_629_1.duration_ = arg_629_1.duration_ + 0.3

				SetActive(arg_629_1.leftNameGo_, false)

				arg_629_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_629_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_629_1:RecordName(arg_629_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_629_1.iconTrs_.gameObject, false)
				arg_629_1.callingController_:SetSelectedState("normal")

				local var_632_41 = arg_629_1:GetWordFromCfg(116431151)
				local var_632_42 = arg_629_1:FormatText(var_632_41.content)

				arg_629_1.text_.text = var_632_42

				LuaForUtil.ClearLinePrefixSymbol(arg_629_1.text_)

				local var_632_43 = 4
				local var_632_44 = utf8.len(var_632_42)
				local var_632_45 = var_632_43 <= 0 and var_632_39 or var_632_39 * (var_632_44 / var_632_43)

				if var_632_45 > 0 and var_632_39 < var_632_45 then
					arg_629_1.talkMaxDuration = var_632_45
					var_632_38 = var_632_38 + 0.3

					if var_632_45 + var_632_38 > arg_629_1.duration_ then
						arg_629_1.duration_ = var_632_45 + var_632_38
					end
				end

				arg_629_1.text_.text = var_632_42
				arg_629_1.typewritter.percent = 0

				arg_629_1.typewritter:SetDirty()
				arg_629_1:ShowNextGo(false)
				arg_629_1:RecordContent(arg_629_1.text_.text)
			end

			local var_632_46 = var_632_38 + 0.3
			local var_632_47 = math.max(var_632_39, arg_629_1.talkMaxDuration)

			if var_632_46 <= arg_629_1.time_ and arg_629_1.time_ < var_632_46 + var_632_47 then
				arg_629_1.typewritter.percent = (arg_629_1.time_ - var_632_46) / var_632_47

				arg_629_1.typewritter:SetDirty()
			end

			if arg_629_1.time_ >= var_632_46 + var_632_47 and arg_629_1.time_ < var_632_46 + var_632_47 + arg_632_0 then
				arg_629_1.typewritter.percent = 1

				arg_629_1.typewritter:SetDirty()
				arg_629_1:ShowNextGo(true)
			end
		end
	end,
	Play116431152 = function(arg_635_0, arg_635_1)
		arg_635_1.time_ = 0
		arg_635_1.frameCnt_ = 0
		arg_635_1.state_ = "playing"
		arg_635_1.curTalkId_ = 116431152
		arg_635_1.duration_ = 5

		SetActive(arg_635_1.tipsGo_, false)

		function arg_635_1.onSingleLineFinish_()
			arg_635_1.onSingleLineUpdate_ = nil
			arg_635_1.onSingleLineFinish_ = nil
			arg_635_1.state_ = "waiting"
		end

		function arg_635_1.playNext_(arg_637_0)
			if arg_637_0 == 1 then
				arg_635_0:Play116431153(arg_635_1)
			end
		end

		function arg_635_1.onSingleLineUpdate_(arg_638_0)
			local var_638_0 = 0
			local var_638_1 = 0.3

			if var_638_0 < arg_635_1.time_ and arg_635_1.time_ <= var_638_0 + arg_638_0 then
				local var_638_2 = "play"
				local var_638_3 = "effect"

				arg_635_1:AudioAction(var_638_2, var_638_3, "se_story_16", "se_story_16_gun", "")
			end

			local var_638_4 = 0.233333333333333
			local var_638_5 = 0.433333333333333

			if var_638_4 < arg_635_1.time_ and arg_635_1.time_ <= var_638_4 + arg_638_0 then
				local var_638_6 = "play"
				local var_638_7 = "effect"

				arg_635_1:AudioAction(var_638_6, var_638_7, "se_story_16", "se_story_16_gun", "")
			end

			local var_638_8 = 0.533333333333333
			local var_638_9 = 0.466666666666667

			if var_638_8 < arg_635_1.time_ and arg_635_1.time_ <= var_638_8 + arg_638_0 then
				local var_638_10 = "play"
				local var_638_11 = "effect"

				arg_635_1:AudioAction(var_638_10, var_638_11, "se_story_16", "se_story_16_gun", "")
			end

			local var_638_12 = manager.ui.mainCamera.transform
			local var_638_13 = 0

			if var_638_13 < arg_635_1.time_ and arg_635_1.time_ <= var_638_13 + arg_638_0 then
				arg_635_1.var_.shakeOldPos = var_638_12.localPosition
			end

			local var_638_14 = 0.3

			if var_638_13 <= arg_635_1.time_ and arg_635_1.time_ < var_638_13 + var_638_14 then
				local var_638_15 = (arg_635_1.time_ - var_638_13) / 0.066
				local var_638_16, var_638_17 = math.modf(var_638_15)

				var_638_12.localPosition = Vector3.New(var_638_17 * 0.13, var_638_17 * 0.13, var_638_17 * 0.13) + arg_635_1.var_.shakeOldPos
			end

			if arg_635_1.time_ >= var_638_13 + var_638_14 and arg_635_1.time_ < var_638_13 + var_638_14 + arg_638_0 then
				var_638_12.localPosition = arg_635_1.var_.shakeOldPos
			end

			local var_638_18 = manager.ui.mainCamera.transform
			local var_638_19 = 0.233333333333333

			if var_638_19 < arg_635_1.time_ and arg_635_1.time_ <= var_638_19 + arg_638_0 then
				arg_635_1.var_.shakeOldPos = var_638_18.localPosition
			end

			local var_638_20 = 0.433333333333333

			if var_638_19 <= arg_635_1.time_ and arg_635_1.time_ < var_638_19 + var_638_20 then
				local var_638_21 = (arg_635_1.time_ - var_638_19) / 0.066
				local var_638_22, var_638_23 = math.modf(var_638_21)

				var_638_18.localPosition = Vector3.New(var_638_23 * 0.13, var_638_23 * 0.13, var_638_23 * 0.13) + arg_635_1.var_.shakeOldPos
			end

			if arg_635_1.time_ >= var_638_19 + var_638_20 and arg_635_1.time_ < var_638_19 + var_638_20 + arg_638_0 then
				var_638_18.localPosition = arg_635_1.var_.shakeOldPos
			end

			local var_638_24 = manager.ui.mainCamera.transform
			local var_638_25 = 0.533333333333333

			if var_638_25 < arg_635_1.time_ and arg_635_1.time_ <= var_638_25 + arg_638_0 then
				arg_635_1.var_.shakeOldPos = var_638_24.localPosition
			end

			local var_638_26 = 0.433333333333333

			if var_638_25 <= arg_635_1.time_ and arg_635_1.time_ < var_638_25 + var_638_26 then
				local var_638_27 = (arg_635_1.time_ - var_638_25) / 0.066
				local var_638_28, var_638_29 = math.modf(var_638_27)

				var_638_24.localPosition = Vector3.New(var_638_29 * 0.13, var_638_29 * 0.13, var_638_29 * 0.13) + arg_635_1.var_.shakeOldPos
			end

			if arg_635_1.time_ >= var_638_25 + var_638_26 and arg_635_1.time_ < var_638_25 + var_638_26 + arg_638_0 then
				var_638_24.localPosition = arg_635_1.var_.shakeOldPos
			end

			local var_638_30 = 0
			local var_638_31 = 0.266666666666667

			if var_638_30 < arg_635_1.time_ and arg_635_1.time_ <= var_638_30 + arg_638_0 then
				local var_638_32 = "play"
				local var_638_33 = "music"

				arg_635_1:AudioAction(var_638_32, var_638_33, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_638_34 = 0.4
			local var_638_35 = 0.6

			if var_638_34 < arg_635_1.time_ and arg_635_1.time_ <= var_638_34 + arg_638_0 then
				local var_638_36 = "play"
				local var_638_37 = "music"

				arg_635_1:AudioAction(var_638_36, var_638_37, "bgm_activity_1_6_ui", "bgm_activity_1_6_ui", "bgm_activity_1_6_ui.awb")
			end

			local var_638_38 = 0
			local var_638_39 = 0.3

			if var_638_38 < arg_635_1.time_ and arg_635_1.time_ <= var_638_38 + arg_638_0 then
				arg_635_1.talkMaxDuration = 0
				arg_635_1.dialogCg_.alpha = 1

				arg_635_1.dialog_:SetActive(true)
				SetActive(arg_635_1.leftNameGo_, false)

				arg_635_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_635_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_635_1:RecordName(arg_635_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_635_1.iconTrs_.gameObject, false)
				arg_635_1.callingController_:SetSelectedState("normal")

				local var_638_40 = arg_635_1:GetWordFromCfg(116431152)
				local var_638_41 = arg_635_1:FormatText(var_638_40.content)

				arg_635_1.text_.text = var_638_41

				LuaForUtil.ClearLinePrefixSymbol(arg_635_1.text_)

				local var_638_42 = 12
				local var_638_43 = utf8.len(var_638_41)
				local var_638_44 = var_638_42 <= 0 and var_638_39 or var_638_39 * (var_638_43 / var_638_42)

				if var_638_44 > 0 and var_638_39 < var_638_44 then
					arg_635_1.talkMaxDuration = var_638_44

					if var_638_44 + var_638_38 > arg_635_1.duration_ then
						arg_635_1.duration_ = var_638_44 + var_638_38
					end
				end

				arg_635_1.text_.text = var_638_41
				arg_635_1.typewritter.percent = 0

				arg_635_1.typewritter:SetDirty()
				arg_635_1:ShowNextGo(false)
				arg_635_1:RecordContent(arg_635_1.text_.text)
			end

			local var_638_45 = math.max(var_638_39, arg_635_1.talkMaxDuration)

			if var_638_38 <= arg_635_1.time_ and arg_635_1.time_ < var_638_38 + var_638_45 then
				arg_635_1.typewritter.percent = (arg_635_1.time_ - var_638_38) / var_638_45

				arg_635_1.typewritter:SetDirty()
			end

			if arg_635_1.time_ >= var_638_38 + var_638_45 and arg_635_1.time_ < var_638_38 + var_638_45 + arg_638_0 then
				arg_635_1.typewritter.percent = 1

				arg_635_1.typewritter:SetDirty()
				arg_635_1:ShowNextGo(true)
			end
		end
	end,
	Play116431153 = function(arg_639_0, arg_639_1)
		arg_639_1.time_ = 0
		arg_639_1.frameCnt_ = 0
		arg_639_1.state_ = "playing"
		arg_639_1.curTalkId_ = 116431153
		arg_639_1.duration_ = 10

		SetActive(arg_639_1.tipsGo_, false)

		function arg_639_1.onSingleLineFinish_()
			arg_639_1.onSingleLineUpdate_ = nil
			arg_639_1.onSingleLineFinish_ = nil
			arg_639_1.state_ = "waiting"
		end

		function arg_639_1.playNext_(arg_641_0)
			if arg_641_0 == 1 then
				arg_639_0:Play116431154(arg_639_1)
			end
		end

		function arg_639_1.onSingleLineUpdate_(arg_642_0)
			local var_642_0 = "SK0208"

			if arg_639_1.bgs_[var_642_0] == nil then
				local var_642_1 = Object.Instantiate(arg_639_1.paintGo_)

				var_642_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_642_0)
				var_642_1.name = var_642_0
				var_642_1.transform.parent = arg_639_1.stage_.transform
				var_642_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_639_1.bgs_[var_642_0] = var_642_1
			end

			local var_642_2 = 2

			if var_642_2 < arg_639_1.time_ and arg_639_1.time_ <= var_642_2 + arg_642_0 then
				local var_642_3 = manager.ui.mainCamera.transform.localPosition
				local var_642_4 = Vector3.New(0, 0, 10) + Vector3.New(var_642_3.x, var_642_3.y, 0)
				local var_642_5 = arg_639_1.bgs_.SK0208

				var_642_5.transform.localPosition = var_642_4
				var_642_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_642_6 = var_642_5:GetComponent("SpriteRenderer")

				if var_642_6 and var_642_6.sprite then
					local var_642_7 = (var_642_5.transform.localPosition - var_642_3).z
					local var_642_8 = manager.ui.mainCameraCom_
					local var_642_9 = 2 * var_642_7 * Mathf.Tan(var_642_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_642_10 = var_642_9 * var_642_8.aspect
					local var_642_11 = var_642_6.sprite.bounds.size.x
					local var_642_12 = var_642_6.sprite.bounds.size.y
					local var_642_13 = var_642_10 / var_642_11
					local var_642_14 = var_642_9 / var_642_12
					local var_642_15 = var_642_14 < var_642_13 and var_642_13 or var_642_14

					var_642_5.transform.localScale = Vector3.New(var_642_15, var_642_15, 0)
				end

				for iter_642_0, iter_642_1 in pairs(arg_639_1.bgs_) do
					if iter_642_0 ~= "SK0208" then
						iter_642_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_642_16 = 0

			if var_642_16 < arg_639_1.time_ and arg_639_1.time_ <= var_642_16 + arg_642_0 then
				arg_639_1.mask_.enabled = true
				arg_639_1.mask_.raycastTarget = true

				arg_639_1:SetGaussion(false)
			end

			local var_642_17 = 2

			if var_642_16 <= arg_639_1.time_ and arg_639_1.time_ < var_642_16 + var_642_17 then
				local var_642_18 = (arg_639_1.time_ - var_642_16) / var_642_17
				local var_642_19 = Color.New(0, 0, 0)

				var_642_19.a = Mathf.Lerp(0, 1, var_642_18)
				arg_639_1.mask_.color = var_642_19
			end

			if arg_639_1.time_ >= var_642_16 + var_642_17 and arg_639_1.time_ < var_642_16 + var_642_17 + arg_642_0 then
				local var_642_20 = Color.New(0, 0, 0)

				var_642_20.a = 1
				arg_639_1.mask_.color = var_642_20
			end

			local var_642_21 = 2

			if var_642_21 < arg_639_1.time_ and arg_639_1.time_ <= var_642_21 + arg_642_0 then
				arg_639_1.mask_.enabled = true
				arg_639_1.mask_.raycastTarget = true

				arg_639_1:SetGaussion(false)
			end

			local var_642_22 = 2

			if var_642_21 <= arg_639_1.time_ and arg_639_1.time_ < var_642_21 + var_642_22 then
				local var_642_23 = (arg_639_1.time_ - var_642_21) / var_642_22
				local var_642_24 = Color.New(0, 0, 0)

				var_642_24.a = Mathf.Lerp(1, 0, var_642_23)
				arg_639_1.mask_.color = var_642_24
			end

			if arg_639_1.time_ >= var_642_21 + var_642_22 and arg_639_1.time_ < var_642_21 + var_642_22 + arg_642_0 then
				local var_642_25 = Color.New(0, 0, 0)
				local var_642_26 = 0

				arg_639_1.mask_.enabled = false
				var_642_25.a = var_642_26
				arg_639_1.mask_.color = var_642_25
			end

			local var_642_27 = 0
			local var_642_28 = 1

			if var_642_27 < arg_639_1.time_ and arg_639_1.time_ <= var_642_27 + arg_642_0 then
				local var_642_29 = "stop"
				local var_642_30 = "music"

				arg_639_1:AudioAction(var_642_29, var_642_30, "se_story_16", "se_story_16_rain02_loop", "")
			end

			local var_642_31 = 0
			local var_642_32 = 1

			if var_642_31 < arg_639_1.time_ and arg_639_1.time_ <= var_642_31 + arg_642_0 then
				local var_642_33 = "play"
				local var_642_34 = "effect"

				arg_639_1:AudioAction(var_642_33, var_642_34, "se_story_16", "se_story_16_rain01_loop", "")
			end

			local var_642_35 = 0

			if var_642_35 < arg_639_1.time_ and arg_639_1.time_ <= var_642_35 + arg_642_0 then
				arg_639_1.allBtn_.enabled = false
			end

			local var_642_36 = 5.05

			if arg_639_1.time_ >= var_642_35 + var_642_36 and arg_639_1.time_ < var_642_35 + var_642_36 + arg_642_0 then
				arg_639_1.allBtn_.enabled = true
			end

			if arg_639_1.frameCnt_ <= 1 then
				arg_639_1.dialog_:SetActive(false)
			end

			local var_642_37 = 5
			local var_642_38 = 0.05

			if var_642_37 < arg_639_1.time_ and arg_639_1.time_ <= var_642_37 + arg_642_0 then
				arg_639_1.talkMaxDuration = 0

				arg_639_1.dialog_:SetActive(true)

				local var_642_39 = LeanTween.value(arg_639_1.dialog_, 0, 1, 0.3)

				var_642_39:setOnUpdate(LuaHelper.FloatAction(function(arg_643_0)
					arg_639_1.dialogCg_.alpha = arg_643_0
				end))
				var_642_39:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_639_1.dialog_)
					var_642_39:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_639_1.duration_ = arg_639_1.duration_ + 0.3

				SetActive(arg_639_1.leftNameGo_, false)

				arg_639_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_639_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_639_1:RecordName(arg_639_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_639_1.iconTrs_.gameObject, false)
				arg_639_1.callingController_:SetSelectedState("normal")

				local var_642_40 = arg_639_1:GetWordFromCfg(116431153)
				local var_642_41 = arg_639_1:FormatText(var_642_40.content)

				arg_639_1.text_.text = var_642_41

				LuaForUtil.ClearLinePrefixSymbol(arg_639_1.text_)

				local var_642_42 = 2
				local var_642_43 = utf8.len(var_642_41)
				local var_642_44 = var_642_42 <= 0 and var_642_38 or var_642_38 * (var_642_43 / var_642_42)

				if var_642_44 > 0 and var_642_38 < var_642_44 then
					arg_639_1.talkMaxDuration = var_642_44
					var_642_37 = var_642_37 + 0.3

					if var_642_44 + var_642_37 > arg_639_1.duration_ then
						arg_639_1.duration_ = var_642_44 + var_642_37
					end
				end

				arg_639_1.text_.text = var_642_41
				arg_639_1.typewritter.percent = 0

				arg_639_1.typewritter:SetDirty()
				arg_639_1:ShowNextGo(false)
				arg_639_1:RecordContent(arg_639_1.text_.text)
			end

			local var_642_45 = var_642_37 + 0.3
			local var_642_46 = math.max(var_642_38, arg_639_1.talkMaxDuration)

			if var_642_45 <= arg_639_1.time_ and arg_639_1.time_ < var_642_45 + var_642_46 then
				arg_639_1.typewritter.percent = (arg_639_1.time_ - var_642_45) / var_642_46

				arg_639_1.typewritter:SetDirty()
			end

			if arg_639_1.time_ >= var_642_45 + var_642_46 and arg_639_1.time_ < var_642_45 + var_642_46 + arg_642_0 then
				arg_639_1.typewritter.percent = 1

				arg_639_1.typewritter:SetDirty()
				arg_639_1:ShowNextGo(true)
			end
		end
	end,
	Play116431154 = function(arg_645_0, arg_645_1)
		arg_645_1.time_ = 0
		arg_645_1.frameCnt_ = 0
		arg_645_1.state_ = "playing"
		arg_645_1.curTalkId_ = 116431154
		arg_645_1.duration_ = 7.9

		local var_645_0 = {
			zh = 5.033,
			ja = 7.9
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
				arg_645_0:Play116431155(arg_645_1)
			end
		end

		function arg_645_1.onSingleLineUpdate_(arg_648_0)
			local var_648_0 = 0
			local var_648_1 = 0.625

			if var_648_0 < arg_645_1.time_ and arg_645_1.time_ <= var_648_0 + arg_648_0 then
				arg_645_1.talkMaxDuration = 0
				arg_645_1.dialogCg_.alpha = 1

				arg_645_1.dialog_:SetActive(true)
				SetActive(arg_645_1.leftNameGo_, true)

				local var_648_2 = arg_645_1:FormatText(StoryNameCfg[349].name)

				arg_645_1.leftNameTxt_.text = var_648_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_645_1.leftNameTxt_.transform)

				arg_645_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_645_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_645_1:RecordName(arg_645_1.leftNameTxt_.text)
				SetActive(arg_645_1.iconTrs_.gameObject, true)
				arg_645_1.iconController_:SetSelectedState("hero")

				arg_645_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadowm")

				arg_645_1.callingController_:SetSelectedState("normal")

				local var_648_3 = arg_645_1:GetWordFromCfg(116431154)
				local var_648_4 = arg_645_1:FormatText(var_648_3.content)

				arg_645_1.text_.text = var_648_4

				LuaForUtil.ClearLinePrefixSymbol(arg_645_1.text_)

				local var_648_5 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431154", "story_v_out_116431.awb") ~= 0 then
					local var_648_8 = manager.audio:GetVoiceLength("story_v_out_116431", "116431154", "story_v_out_116431.awb") / 1000

					if var_648_8 + var_648_0 > arg_645_1.duration_ then
						arg_645_1.duration_ = var_648_8 + var_648_0
					end

					if var_648_3.prefab_name ~= "" and arg_645_1.actors_[var_648_3.prefab_name] ~= nil then
						local var_648_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_645_1.actors_[var_648_3.prefab_name].transform, "story_v_out_116431", "116431154", "story_v_out_116431.awb")

						arg_645_1:RecordAudio("116431154", var_648_9)
						arg_645_1:RecordAudio("116431154", var_648_9)
					else
						arg_645_1:AudioAction("play", "voice", "story_v_out_116431", "116431154", "story_v_out_116431.awb")
					end

					arg_645_1:RecordHistoryTalkVoice("story_v_out_116431", "116431154", "story_v_out_116431.awb")
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
	Play116431155 = function(arg_649_0, arg_649_1)
		arg_649_1.time_ = 0
		arg_649_1.frameCnt_ = 0
		arg_649_1.state_ = "playing"
		arg_649_1.curTalkId_ = 116431155
		arg_649_1.duration_ = 5.8

		local var_649_0 = {
			zh = 5.8,
			ja = 4.833
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
				arg_649_0:Play116431156(arg_649_1)
			end
		end

		function arg_649_1.onSingleLineUpdate_(arg_652_0)
			local var_652_0 = 0
			local var_652_1 = 0.8

			if var_652_0 < arg_649_1.time_ and arg_649_1.time_ <= var_652_0 + arg_652_0 then
				arg_649_1.talkMaxDuration = 0
				arg_649_1.dialogCg_.alpha = 1

				arg_649_1.dialog_:SetActive(true)
				SetActive(arg_649_1.leftNameGo_, true)

				local var_652_2 = arg_649_1:FormatText(StoryNameCfg[349].name)

				arg_649_1.leftNameTxt_.text = var_652_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_649_1.leftNameTxt_.transform)

				arg_649_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_649_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_649_1:RecordName(arg_649_1.leftNameTxt_.text)
				SetActive(arg_649_1.iconTrs_.gameObject, true)
				arg_649_1.iconController_:SetSelectedState("hero")

				arg_649_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadowm")

				arg_649_1.callingController_:SetSelectedState("normal")

				local var_652_3 = arg_649_1:GetWordFromCfg(116431155)
				local var_652_4 = arg_649_1:FormatText(var_652_3.content)

				arg_649_1.text_.text = var_652_4

				LuaForUtil.ClearLinePrefixSymbol(arg_649_1.text_)

				local var_652_5 = 32
				local var_652_6 = utf8.len(var_652_4)
				local var_652_7 = var_652_5 <= 0 and var_652_1 or var_652_1 * (var_652_6 / var_652_5)

				if var_652_7 > 0 and var_652_1 < var_652_7 then
					arg_649_1.talkMaxDuration = var_652_7

					if var_652_7 + var_652_0 > arg_649_1.duration_ then
						arg_649_1.duration_ = var_652_7 + var_652_0
					end
				end

				arg_649_1.text_.text = var_652_4
				arg_649_1.typewritter.percent = 0

				arg_649_1.typewritter:SetDirty()
				arg_649_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431155", "story_v_out_116431.awb") ~= 0 then
					local var_652_8 = manager.audio:GetVoiceLength("story_v_out_116431", "116431155", "story_v_out_116431.awb") / 1000

					if var_652_8 + var_652_0 > arg_649_1.duration_ then
						arg_649_1.duration_ = var_652_8 + var_652_0
					end

					if var_652_3.prefab_name ~= "" and arg_649_1.actors_[var_652_3.prefab_name] ~= nil then
						local var_652_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_649_1.actors_[var_652_3.prefab_name].transform, "story_v_out_116431", "116431155", "story_v_out_116431.awb")

						arg_649_1:RecordAudio("116431155", var_652_9)
						arg_649_1:RecordAudio("116431155", var_652_9)
					else
						arg_649_1:AudioAction("play", "voice", "story_v_out_116431", "116431155", "story_v_out_116431.awb")
					end

					arg_649_1:RecordHistoryTalkVoice("story_v_out_116431", "116431155", "story_v_out_116431.awb")
				end

				arg_649_1:RecordContent(arg_649_1.text_.text)
			end

			local var_652_10 = math.max(var_652_1, arg_649_1.talkMaxDuration)

			if var_652_0 <= arg_649_1.time_ and arg_649_1.time_ < var_652_0 + var_652_10 then
				arg_649_1.typewritter.percent = (arg_649_1.time_ - var_652_0) / var_652_10

				arg_649_1.typewritter:SetDirty()
			end

			if arg_649_1.time_ >= var_652_0 + var_652_10 and arg_649_1.time_ < var_652_0 + var_652_10 + arg_652_0 then
				arg_649_1.typewritter.percent = 1

				arg_649_1.typewritter:SetDirty()
				arg_649_1:ShowNextGo(true)
			end
		end
	end,
	Play116431156 = function(arg_653_0, arg_653_1)
		arg_653_1.time_ = 0
		arg_653_1.frameCnt_ = 0
		arg_653_1.state_ = "playing"
		arg_653_1.curTalkId_ = 116431156
		arg_653_1.duration_ = 8.866

		local var_653_0 = {
			zh = 8.866,
			ja = 3.266
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
				arg_653_0:Play116431157(arg_653_1)
			end
		end

		function arg_653_1.onSingleLineUpdate_(arg_656_0)
			local var_656_0 = 0
			local var_656_1 = 1.075

			if var_656_0 < arg_653_1.time_ and arg_653_1.time_ <= var_656_0 + arg_656_0 then
				arg_653_1.talkMaxDuration = 0
				arg_653_1.dialogCg_.alpha = 1

				arg_653_1.dialog_:SetActive(true)
				SetActive(arg_653_1.leftNameGo_, true)

				local var_656_2 = arg_653_1:FormatText(StoryNameCfg[264].name)

				arg_653_1.leftNameTxt_.text = var_656_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_653_1.leftNameTxt_.transform)

				arg_653_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_653_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_653_1:RecordName(arg_653_1.leftNameTxt_.text)
				SetActive(arg_653_1.iconTrs_.gameObject, true)
				arg_653_1.iconController_:SetSelectedState("hero")

				arg_653_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10014")

				arg_653_1.callingController_:SetSelectedState("normal")

				local var_656_3 = arg_653_1:GetWordFromCfg(116431156)
				local var_656_4 = arg_653_1:FormatText(var_656_3.content)

				arg_653_1.text_.text = var_656_4

				LuaForUtil.ClearLinePrefixSymbol(arg_653_1.text_)

				local var_656_5 = 43
				local var_656_6 = utf8.len(var_656_4)
				local var_656_7 = var_656_5 <= 0 and var_656_1 or var_656_1 * (var_656_6 / var_656_5)

				if var_656_7 > 0 and var_656_1 < var_656_7 then
					arg_653_1.talkMaxDuration = var_656_7

					if var_656_7 + var_656_0 > arg_653_1.duration_ then
						arg_653_1.duration_ = var_656_7 + var_656_0
					end
				end

				arg_653_1.text_.text = var_656_4
				arg_653_1.typewritter.percent = 0

				arg_653_1.typewritter:SetDirty()
				arg_653_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431156", "story_v_out_116431.awb") ~= 0 then
					local var_656_8 = manager.audio:GetVoiceLength("story_v_out_116431", "116431156", "story_v_out_116431.awb") / 1000

					if var_656_8 + var_656_0 > arg_653_1.duration_ then
						arg_653_1.duration_ = var_656_8 + var_656_0
					end

					if var_656_3.prefab_name ~= "" and arg_653_1.actors_[var_656_3.prefab_name] ~= nil then
						local var_656_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_653_1.actors_[var_656_3.prefab_name].transform, "story_v_out_116431", "116431156", "story_v_out_116431.awb")

						arg_653_1:RecordAudio("116431156", var_656_9)
						arg_653_1:RecordAudio("116431156", var_656_9)
					else
						arg_653_1:AudioAction("play", "voice", "story_v_out_116431", "116431156", "story_v_out_116431.awb")
					end

					arg_653_1:RecordHistoryTalkVoice("story_v_out_116431", "116431156", "story_v_out_116431.awb")
				end

				arg_653_1:RecordContent(arg_653_1.text_.text)
			end

			local var_656_10 = math.max(var_656_1, arg_653_1.talkMaxDuration)

			if var_656_0 <= arg_653_1.time_ and arg_653_1.time_ < var_656_0 + var_656_10 then
				arg_653_1.typewritter.percent = (arg_653_1.time_ - var_656_0) / var_656_10

				arg_653_1.typewritter:SetDirty()
			end

			if arg_653_1.time_ >= var_656_0 + var_656_10 and arg_653_1.time_ < var_656_0 + var_656_10 + arg_656_0 then
				arg_653_1.typewritter.percent = 1

				arg_653_1.typewritter:SetDirty()
				arg_653_1:ShowNextGo(true)
			end
		end
	end,
	Play116431157 = function(arg_657_0, arg_657_1)
		arg_657_1.time_ = 0
		arg_657_1.frameCnt_ = 0
		arg_657_1.state_ = "playing"
		arg_657_1.curTalkId_ = 116431157
		arg_657_1.duration_ = 4.233

		local var_657_0 = {
			zh = 3.7,
			ja = 4.233
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
				arg_657_0:Play116431158(arg_657_1)
			end
		end

		function arg_657_1.onSingleLineUpdate_(arg_660_0)
			local var_660_0 = 0
			local var_660_1 = 0.425

			if var_660_0 < arg_657_1.time_ and arg_657_1.time_ <= var_660_0 + arg_660_0 then
				arg_657_1.talkMaxDuration = 0
				arg_657_1.dialogCg_.alpha = 1

				arg_657_1.dialog_:SetActive(true)
				SetActive(arg_657_1.leftNameGo_, true)

				local var_660_2 = arg_657_1:FormatText(StoryNameCfg[264].name)

				arg_657_1.leftNameTxt_.text = var_660_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_657_1.leftNameTxt_.transform)

				arg_657_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_657_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_657_1:RecordName(arg_657_1.leftNameTxt_.text)
				SetActive(arg_657_1.iconTrs_.gameObject, true)
				arg_657_1.iconController_:SetSelectedState("hero")

				arg_657_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10014")

				arg_657_1.callingController_:SetSelectedState("normal")

				local var_660_3 = arg_657_1:GetWordFromCfg(116431157)
				local var_660_4 = arg_657_1:FormatText(var_660_3.content)

				arg_657_1.text_.text = var_660_4

				LuaForUtil.ClearLinePrefixSymbol(arg_657_1.text_)

				local var_660_5 = 17
				local var_660_6 = utf8.len(var_660_4)
				local var_660_7 = var_660_5 <= 0 and var_660_1 or var_660_1 * (var_660_6 / var_660_5)

				if var_660_7 > 0 and var_660_1 < var_660_7 then
					arg_657_1.talkMaxDuration = var_660_7

					if var_660_7 + var_660_0 > arg_657_1.duration_ then
						arg_657_1.duration_ = var_660_7 + var_660_0
					end
				end

				arg_657_1.text_.text = var_660_4
				arg_657_1.typewritter.percent = 0

				arg_657_1.typewritter:SetDirty()
				arg_657_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431157", "story_v_out_116431.awb") ~= 0 then
					local var_660_8 = manager.audio:GetVoiceLength("story_v_out_116431", "116431157", "story_v_out_116431.awb") / 1000

					if var_660_8 + var_660_0 > arg_657_1.duration_ then
						arg_657_1.duration_ = var_660_8 + var_660_0
					end

					if var_660_3.prefab_name ~= "" and arg_657_1.actors_[var_660_3.prefab_name] ~= nil then
						local var_660_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_657_1.actors_[var_660_3.prefab_name].transform, "story_v_out_116431", "116431157", "story_v_out_116431.awb")

						arg_657_1:RecordAudio("116431157", var_660_9)
						arg_657_1:RecordAudio("116431157", var_660_9)
					else
						arg_657_1:AudioAction("play", "voice", "story_v_out_116431", "116431157", "story_v_out_116431.awb")
					end

					arg_657_1:RecordHistoryTalkVoice("story_v_out_116431", "116431157", "story_v_out_116431.awb")
				end

				arg_657_1:RecordContent(arg_657_1.text_.text)
			end

			local var_660_10 = math.max(var_660_1, arg_657_1.talkMaxDuration)

			if var_660_0 <= arg_657_1.time_ and arg_657_1.time_ < var_660_0 + var_660_10 then
				arg_657_1.typewritter.percent = (arg_657_1.time_ - var_660_0) / var_660_10

				arg_657_1.typewritter:SetDirty()
			end

			if arg_657_1.time_ >= var_660_0 + var_660_10 and arg_657_1.time_ < var_660_0 + var_660_10 + arg_660_0 then
				arg_657_1.typewritter.percent = 1

				arg_657_1.typewritter:SetDirty()
				arg_657_1:ShowNextGo(true)
			end
		end
	end,
	Play116431158 = function(arg_661_0, arg_661_1)
		arg_661_1.time_ = 0
		arg_661_1.frameCnt_ = 0
		arg_661_1.state_ = "playing"
		arg_661_1.curTalkId_ = 116431158
		arg_661_1.duration_ = 3.4

		local var_661_0 = {
			zh = 1.466,
			ja = 3.4
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
				arg_661_0:Play116431159(arg_661_1)
			end
		end

		function arg_661_1.onSingleLineUpdate_(arg_664_0)
			local var_664_0 = 0
			local var_664_1 = 0.15

			if var_664_0 < arg_661_1.time_ and arg_661_1.time_ <= var_664_0 + arg_664_0 then
				arg_661_1.talkMaxDuration = 0
				arg_661_1.dialogCg_.alpha = 1

				arg_661_1.dialog_:SetActive(true)
				SetActive(arg_661_1.leftNameGo_, true)

				local var_664_2 = arg_661_1:FormatText(StoryNameCfg[319].name)

				arg_661_1.leftNameTxt_.text = var_664_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_661_1.leftNameTxt_.transform)

				arg_661_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_661_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_661_1:RecordName(arg_661_1.leftNameTxt_.text)
				SetActive(arg_661_1.iconTrs_.gameObject, true)
				arg_661_1.iconController_:SetSelectedState("hero")

				arg_661_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1029")

				arg_661_1.callingController_:SetSelectedState("normal")

				local var_664_3 = arg_661_1:GetWordFromCfg(116431158)
				local var_664_4 = arg_661_1:FormatText(var_664_3.content)

				arg_661_1.text_.text = var_664_4

				LuaForUtil.ClearLinePrefixSymbol(arg_661_1.text_)

				local var_664_5 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431158", "story_v_out_116431.awb") ~= 0 then
					local var_664_8 = manager.audio:GetVoiceLength("story_v_out_116431", "116431158", "story_v_out_116431.awb") / 1000

					if var_664_8 + var_664_0 > arg_661_1.duration_ then
						arg_661_1.duration_ = var_664_8 + var_664_0
					end

					if var_664_3.prefab_name ~= "" and arg_661_1.actors_[var_664_3.prefab_name] ~= nil then
						local var_664_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_661_1.actors_[var_664_3.prefab_name].transform, "story_v_out_116431", "116431158", "story_v_out_116431.awb")

						arg_661_1:RecordAudio("116431158", var_664_9)
						arg_661_1:RecordAudio("116431158", var_664_9)
					else
						arg_661_1:AudioAction("play", "voice", "story_v_out_116431", "116431158", "story_v_out_116431.awb")
					end

					arg_661_1:RecordHistoryTalkVoice("story_v_out_116431", "116431158", "story_v_out_116431.awb")
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
	Play116431159 = function(arg_665_0, arg_665_1)
		arg_665_1.time_ = 0
		arg_665_1.frameCnt_ = 0
		arg_665_1.state_ = "playing"
		arg_665_1.curTalkId_ = 116431159
		arg_665_1.duration_ = 2.433

		local var_665_0 = {
			zh = 2.433,
			ja = 1.133
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
				arg_665_0:Play116431160(arg_665_1)
			end
		end

		function arg_665_1.onSingleLineUpdate_(arg_668_0)
			local var_668_0 = 0
			local var_668_1 = 0.2

			if var_668_0 < arg_665_1.time_ and arg_665_1.time_ <= var_668_0 + arg_668_0 then
				arg_665_1.talkMaxDuration = 0
				arg_665_1.dialogCg_.alpha = 1

				arg_665_1.dialog_:SetActive(true)
				SetActive(arg_665_1.leftNameGo_, true)

				local var_668_2 = arg_665_1:FormatText(StoryNameCfg[264].name)

				arg_665_1.leftNameTxt_.text = var_668_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_665_1.leftNameTxt_.transform)

				arg_665_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_665_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_665_1:RecordName(arg_665_1.leftNameTxt_.text)
				SetActive(arg_665_1.iconTrs_.gameObject, true)
				arg_665_1.iconController_:SetSelectedState("hero")

				arg_665_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10014")

				arg_665_1.callingController_:SetSelectedState("normal")

				local var_668_3 = arg_665_1:GetWordFromCfg(116431159)
				local var_668_4 = arg_665_1:FormatText(var_668_3.content)

				arg_665_1.text_.text = var_668_4

				LuaForUtil.ClearLinePrefixSymbol(arg_665_1.text_)

				local var_668_5 = 8
				local var_668_6 = utf8.len(var_668_4)
				local var_668_7 = var_668_5 <= 0 and var_668_1 or var_668_1 * (var_668_6 / var_668_5)

				if var_668_7 > 0 and var_668_1 < var_668_7 then
					arg_665_1.talkMaxDuration = var_668_7

					if var_668_7 + var_668_0 > arg_665_1.duration_ then
						arg_665_1.duration_ = var_668_7 + var_668_0
					end
				end

				arg_665_1.text_.text = var_668_4
				arg_665_1.typewritter.percent = 0

				arg_665_1.typewritter:SetDirty()
				arg_665_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431159", "story_v_out_116431.awb") ~= 0 then
					local var_668_8 = manager.audio:GetVoiceLength("story_v_out_116431", "116431159", "story_v_out_116431.awb") / 1000

					if var_668_8 + var_668_0 > arg_665_1.duration_ then
						arg_665_1.duration_ = var_668_8 + var_668_0
					end

					if var_668_3.prefab_name ~= "" and arg_665_1.actors_[var_668_3.prefab_name] ~= nil then
						local var_668_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_665_1.actors_[var_668_3.prefab_name].transform, "story_v_out_116431", "116431159", "story_v_out_116431.awb")

						arg_665_1:RecordAudio("116431159", var_668_9)
						arg_665_1:RecordAudio("116431159", var_668_9)
					else
						arg_665_1:AudioAction("play", "voice", "story_v_out_116431", "116431159", "story_v_out_116431.awb")
					end

					arg_665_1:RecordHistoryTalkVoice("story_v_out_116431", "116431159", "story_v_out_116431.awb")
				end

				arg_665_1:RecordContent(arg_665_1.text_.text)
			end

			local var_668_10 = math.max(var_668_1, arg_665_1.talkMaxDuration)

			if var_668_0 <= arg_665_1.time_ and arg_665_1.time_ < var_668_0 + var_668_10 then
				arg_665_1.typewritter.percent = (arg_665_1.time_ - var_668_0) / var_668_10

				arg_665_1.typewritter:SetDirty()
			end

			if arg_665_1.time_ >= var_668_0 + var_668_10 and arg_665_1.time_ < var_668_0 + var_668_10 + arg_668_0 then
				arg_665_1.typewritter.percent = 1

				arg_665_1.typewritter:SetDirty()
				arg_665_1:ShowNextGo(true)
			end
		end
	end,
	Play116431160 = function(arg_669_0, arg_669_1)
		arg_669_1.time_ = 0
		arg_669_1.frameCnt_ = 0
		arg_669_1.state_ = "playing"
		arg_669_1.curTalkId_ = 116431160
		arg_669_1.duration_ = 4.233

		local var_669_0 = {
			zh = 3.333,
			ja = 4.233
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
				arg_669_0:Play116431161(arg_669_1)
			end
		end

		function arg_669_1.onSingleLineUpdate_(arg_672_0)
			local var_672_0 = 0
			local var_672_1 = 0.45

			if var_672_0 < arg_669_1.time_ and arg_669_1.time_ <= var_672_0 + arg_672_0 then
				arg_669_1.talkMaxDuration = 0
				arg_669_1.dialogCg_.alpha = 1

				arg_669_1.dialog_:SetActive(true)
				SetActive(arg_669_1.leftNameGo_, true)

				local var_672_2 = arg_669_1:FormatText(StoryNameCfg[319].name)

				arg_669_1.leftNameTxt_.text = var_672_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_669_1.leftNameTxt_.transform)

				arg_669_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_669_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_669_1:RecordName(arg_669_1.leftNameTxt_.text)
				SetActive(arg_669_1.iconTrs_.gameObject, true)
				arg_669_1.iconController_:SetSelectedState("hero")

				arg_669_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1029")

				arg_669_1.callingController_:SetSelectedState("normal")

				local var_672_3 = arg_669_1:GetWordFromCfg(116431160)
				local var_672_4 = arg_669_1:FormatText(var_672_3.content)

				arg_669_1.text_.text = var_672_4

				LuaForUtil.ClearLinePrefixSymbol(arg_669_1.text_)

				local var_672_5 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431160", "story_v_out_116431.awb") ~= 0 then
					local var_672_8 = manager.audio:GetVoiceLength("story_v_out_116431", "116431160", "story_v_out_116431.awb") / 1000

					if var_672_8 + var_672_0 > arg_669_1.duration_ then
						arg_669_1.duration_ = var_672_8 + var_672_0
					end

					if var_672_3.prefab_name ~= "" and arg_669_1.actors_[var_672_3.prefab_name] ~= nil then
						local var_672_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_669_1.actors_[var_672_3.prefab_name].transform, "story_v_out_116431", "116431160", "story_v_out_116431.awb")

						arg_669_1:RecordAudio("116431160", var_672_9)
						arg_669_1:RecordAudio("116431160", var_672_9)
					else
						arg_669_1:AudioAction("play", "voice", "story_v_out_116431", "116431160", "story_v_out_116431.awb")
					end

					arg_669_1:RecordHistoryTalkVoice("story_v_out_116431", "116431160", "story_v_out_116431.awb")
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
	Play116431161 = function(arg_673_0, arg_673_1)
		arg_673_1.time_ = 0
		arg_673_1.frameCnt_ = 0
		arg_673_1.state_ = "playing"
		arg_673_1.curTalkId_ = 116431161
		arg_673_1.duration_ = 10.033

		local var_673_0 = {
			zh = 5.933,
			ja = 10.033
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
				arg_673_0:Play116431162(arg_673_1)
			end
		end

		function arg_673_1.onSingleLineUpdate_(arg_676_0)
			local var_676_0 = 0
			local var_676_1 = 0.675

			if var_676_0 < arg_673_1.time_ and arg_673_1.time_ <= var_676_0 + arg_676_0 then
				arg_673_1.talkMaxDuration = 0
				arg_673_1.dialogCg_.alpha = 1

				arg_673_1.dialog_:SetActive(true)
				SetActive(arg_673_1.leftNameGo_, true)

				local var_676_2 = arg_673_1:FormatText(StoryNameCfg[349].name)

				arg_673_1.leftNameTxt_.text = var_676_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_673_1.leftNameTxt_.transform)

				arg_673_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_673_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_673_1:RecordName(arg_673_1.leftNameTxt_.text)
				SetActive(arg_673_1.iconTrs_.gameObject, true)
				arg_673_1.iconController_:SetSelectedState("hero")

				arg_673_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadowm")

				arg_673_1.callingController_:SetSelectedState("normal")

				local var_676_3 = arg_673_1:GetWordFromCfg(116431161)
				local var_676_4 = arg_673_1:FormatText(var_676_3.content)

				arg_673_1.text_.text = var_676_4

				LuaForUtil.ClearLinePrefixSymbol(arg_673_1.text_)

				local var_676_5 = 27
				local var_676_6 = utf8.len(var_676_4)
				local var_676_7 = var_676_5 <= 0 and var_676_1 or var_676_1 * (var_676_6 / var_676_5)

				if var_676_7 > 0 and var_676_1 < var_676_7 then
					arg_673_1.talkMaxDuration = var_676_7

					if var_676_7 + var_676_0 > arg_673_1.duration_ then
						arg_673_1.duration_ = var_676_7 + var_676_0
					end
				end

				arg_673_1.text_.text = var_676_4
				arg_673_1.typewritter.percent = 0

				arg_673_1.typewritter:SetDirty()
				arg_673_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431161", "story_v_out_116431.awb") ~= 0 then
					local var_676_8 = manager.audio:GetVoiceLength("story_v_out_116431", "116431161", "story_v_out_116431.awb") / 1000

					if var_676_8 + var_676_0 > arg_673_1.duration_ then
						arg_673_1.duration_ = var_676_8 + var_676_0
					end

					if var_676_3.prefab_name ~= "" and arg_673_1.actors_[var_676_3.prefab_name] ~= nil then
						local var_676_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_673_1.actors_[var_676_3.prefab_name].transform, "story_v_out_116431", "116431161", "story_v_out_116431.awb")

						arg_673_1:RecordAudio("116431161", var_676_9)
						arg_673_1:RecordAudio("116431161", var_676_9)
					else
						arg_673_1:AudioAction("play", "voice", "story_v_out_116431", "116431161", "story_v_out_116431.awb")
					end

					arg_673_1:RecordHistoryTalkVoice("story_v_out_116431", "116431161", "story_v_out_116431.awb")
				end

				arg_673_1:RecordContent(arg_673_1.text_.text)
			end

			local var_676_10 = math.max(var_676_1, arg_673_1.talkMaxDuration)

			if var_676_0 <= arg_673_1.time_ and arg_673_1.time_ < var_676_0 + var_676_10 then
				arg_673_1.typewritter.percent = (arg_673_1.time_ - var_676_0) / var_676_10

				arg_673_1.typewritter:SetDirty()
			end

			if arg_673_1.time_ >= var_676_0 + var_676_10 and arg_673_1.time_ < var_676_0 + var_676_10 + arg_676_0 then
				arg_673_1.typewritter.percent = 1

				arg_673_1.typewritter:SetDirty()
				arg_673_1:ShowNextGo(true)
			end
		end
	end,
	Play116431162 = function(arg_677_0, arg_677_1)
		arg_677_1.time_ = 0
		arg_677_1.frameCnt_ = 0
		arg_677_1.state_ = "playing"
		arg_677_1.curTalkId_ = 116431162
		arg_677_1.duration_ = 1.433

		local var_677_0 = {
			zh = 1.2,
			ja = 1.433
		}
		local var_677_1 = manager.audio:GetLocalizationFlag()

		if var_677_0[var_677_1] ~= nil then
			arg_677_1.duration_ = var_677_0[var_677_1]
		end

		SetActive(arg_677_1.tipsGo_, false)

		function arg_677_1.onSingleLineFinish_()
			arg_677_1.onSingleLineUpdate_ = nil
			arg_677_1.onSingleLineFinish_ = nil
			arg_677_1.state_ = "waiting"
		end

		function arg_677_1.playNext_(arg_679_0)
			if arg_679_0 == 1 then
				arg_677_0:Play116431163(arg_677_1)
			end
		end

		function arg_677_1.onSingleLineUpdate_(arg_680_0)
			local var_680_0 = 0
			local var_680_1 = 0.125

			if var_680_0 < arg_677_1.time_ and arg_677_1.time_ <= var_680_0 + arg_680_0 then
				arg_677_1.talkMaxDuration = 0
				arg_677_1.dialogCg_.alpha = 1

				arg_677_1.dialog_:SetActive(true)
				SetActive(arg_677_1.leftNameGo_, true)

				local var_680_2 = arg_677_1:FormatText(StoryNameCfg[264].name)

				arg_677_1.leftNameTxt_.text = var_680_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_677_1.leftNameTxt_.transform)

				arg_677_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_677_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_677_1:RecordName(arg_677_1.leftNameTxt_.text)
				SetActive(arg_677_1.iconTrs_.gameObject, true)
				arg_677_1.iconController_:SetSelectedState("hero")

				arg_677_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10014")

				arg_677_1.callingController_:SetSelectedState("normal")

				local var_680_3 = arg_677_1:GetWordFromCfg(116431162)
				local var_680_4 = arg_677_1:FormatText(var_680_3.content)

				arg_677_1.text_.text = var_680_4

				LuaForUtil.ClearLinePrefixSymbol(arg_677_1.text_)

				local var_680_5 = 5
				local var_680_6 = utf8.len(var_680_4)
				local var_680_7 = var_680_5 <= 0 and var_680_1 or var_680_1 * (var_680_6 / var_680_5)

				if var_680_7 > 0 and var_680_1 < var_680_7 then
					arg_677_1.talkMaxDuration = var_680_7

					if var_680_7 + var_680_0 > arg_677_1.duration_ then
						arg_677_1.duration_ = var_680_7 + var_680_0
					end
				end

				arg_677_1.text_.text = var_680_4
				arg_677_1.typewritter.percent = 0

				arg_677_1.typewritter:SetDirty()
				arg_677_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431162", "story_v_out_116431.awb") ~= 0 then
					local var_680_8 = manager.audio:GetVoiceLength("story_v_out_116431", "116431162", "story_v_out_116431.awb") / 1000

					if var_680_8 + var_680_0 > arg_677_1.duration_ then
						arg_677_1.duration_ = var_680_8 + var_680_0
					end

					if var_680_3.prefab_name ~= "" and arg_677_1.actors_[var_680_3.prefab_name] ~= nil then
						local var_680_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_677_1.actors_[var_680_3.prefab_name].transform, "story_v_out_116431", "116431162", "story_v_out_116431.awb")

						arg_677_1:RecordAudio("116431162", var_680_9)
						arg_677_1:RecordAudio("116431162", var_680_9)
					else
						arg_677_1:AudioAction("play", "voice", "story_v_out_116431", "116431162", "story_v_out_116431.awb")
					end

					arg_677_1:RecordHistoryTalkVoice("story_v_out_116431", "116431162", "story_v_out_116431.awb")
				end

				arg_677_1:RecordContent(arg_677_1.text_.text)
			end

			local var_680_10 = math.max(var_680_1, arg_677_1.talkMaxDuration)

			if var_680_0 <= arg_677_1.time_ and arg_677_1.time_ < var_680_0 + var_680_10 then
				arg_677_1.typewritter.percent = (arg_677_1.time_ - var_680_0) / var_680_10

				arg_677_1.typewritter:SetDirty()
			end

			if arg_677_1.time_ >= var_680_0 + var_680_10 and arg_677_1.time_ < var_680_0 + var_680_10 + arg_680_0 then
				arg_677_1.typewritter.percent = 1

				arg_677_1.typewritter:SetDirty()
				arg_677_1:ShowNextGo(true)
			end
		end
	end,
	Play116431163 = function(arg_681_0, arg_681_1)
		arg_681_1.time_ = 0
		arg_681_1.frameCnt_ = 0
		arg_681_1.state_ = "playing"
		arg_681_1.curTalkId_ = 116431163
		arg_681_1.duration_ = 13.3

		local var_681_0 = {
			zh = 9.033,
			ja = 13.3
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
				arg_681_0:Play116431164(arg_681_1)
			end
		end

		function arg_681_1.onSingleLineUpdate_(arg_684_0)
			local var_684_0 = 0
			local var_684_1 = 1.2

			if var_684_0 < arg_681_1.time_ and arg_681_1.time_ <= var_684_0 + arg_684_0 then
				arg_681_1.talkMaxDuration = 0
				arg_681_1.dialogCg_.alpha = 1

				arg_681_1.dialog_:SetActive(true)
				SetActive(arg_681_1.leftNameGo_, true)

				local var_684_2 = arg_681_1:FormatText(StoryNameCfg[349].name)

				arg_681_1.leftNameTxt_.text = var_684_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_681_1.leftNameTxt_.transform)

				arg_681_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_681_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_681_1:RecordName(arg_681_1.leftNameTxt_.text)
				SetActive(arg_681_1.iconTrs_.gameObject, true)
				arg_681_1.iconController_:SetSelectedState("hero")

				arg_681_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadowm")

				arg_681_1.callingController_:SetSelectedState("normal")

				local var_684_3 = arg_681_1:GetWordFromCfg(116431163)
				local var_684_4 = arg_681_1:FormatText(var_684_3.content)

				arg_681_1.text_.text = var_684_4

				LuaForUtil.ClearLinePrefixSymbol(arg_681_1.text_)

				local var_684_5 = 48
				local var_684_6 = utf8.len(var_684_4)
				local var_684_7 = var_684_5 <= 0 and var_684_1 or var_684_1 * (var_684_6 / var_684_5)

				if var_684_7 > 0 and var_684_1 < var_684_7 then
					arg_681_1.talkMaxDuration = var_684_7

					if var_684_7 + var_684_0 > arg_681_1.duration_ then
						arg_681_1.duration_ = var_684_7 + var_684_0
					end
				end

				arg_681_1.text_.text = var_684_4
				arg_681_1.typewritter.percent = 0

				arg_681_1.typewritter:SetDirty()
				arg_681_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431163", "story_v_out_116431.awb") ~= 0 then
					local var_684_8 = manager.audio:GetVoiceLength("story_v_out_116431", "116431163", "story_v_out_116431.awb") / 1000

					if var_684_8 + var_684_0 > arg_681_1.duration_ then
						arg_681_1.duration_ = var_684_8 + var_684_0
					end

					if var_684_3.prefab_name ~= "" and arg_681_1.actors_[var_684_3.prefab_name] ~= nil then
						local var_684_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_681_1.actors_[var_684_3.prefab_name].transform, "story_v_out_116431", "116431163", "story_v_out_116431.awb")

						arg_681_1:RecordAudio("116431163", var_684_9)
						arg_681_1:RecordAudio("116431163", var_684_9)
					else
						arg_681_1:AudioAction("play", "voice", "story_v_out_116431", "116431163", "story_v_out_116431.awb")
					end

					arg_681_1:RecordHistoryTalkVoice("story_v_out_116431", "116431163", "story_v_out_116431.awb")
				end

				arg_681_1:RecordContent(arg_681_1.text_.text)
			end

			local var_684_10 = math.max(var_684_1, arg_681_1.talkMaxDuration)

			if var_684_0 <= arg_681_1.time_ and arg_681_1.time_ < var_684_0 + var_684_10 then
				arg_681_1.typewritter.percent = (arg_681_1.time_ - var_684_0) / var_684_10

				arg_681_1.typewritter:SetDirty()
			end

			if arg_681_1.time_ >= var_684_0 + var_684_10 and arg_681_1.time_ < var_684_0 + var_684_10 + arg_684_0 then
				arg_681_1.typewritter.percent = 1

				arg_681_1.typewritter:SetDirty()
				arg_681_1:ShowNextGo(true)
			end
		end
	end,
	Play116431164 = function(arg_685_0, arg_685_1)
		arg_685_1.time_ = 0
		arg_685_1.frameCnt_ = 0
		arg_685_1.state_ = "playing"
		arg_685_1.curTalkId_ = 116431164
		arg_685_1.duration_ = 2.6

		local var_685_0 = {
			zh = 1.1,
			ja = 2.6
		}
		local var_685_1 = manager.audio:GetLocalizationFlag()

		if var_685_0[var_685_1] ~= nil then
			arg_685_1.duration_ = var_685_0[var_685_1]
		end

		SetActive(arg_685_1.tipsGo_, false)

		function arg_685_1.onSingleLineFinish_()
			arg_685_1.onSingleLineUpdate_ = nil
			arg_685_1.onSingleLineFinish_ = nil
			arg_685_1.state_ = "waiting"
		end

		function arg_685_1.playNext_(arg_687_0)
			if arg_687_0 == 1 then
				arg_685_0:Play116431165(arg_685_1)
			end
		end

		function arg_685_1.onSingleLineUpdate_(arg_688_0)
			local var_688_0 = 0
			local var_688_1 = 0.125

			if var_688_0 < arg_685_1.time_ and arg_685_1.time_ <= var_688_0 + arg_688_0 then
				arg_685_1.talkMaxDuration = 0
				arg_685_1.dialogCg_.alpha = 1

				arg_685_1.dialog_:SetActive(true)
				SetActive(arg_685_1.leftNameGo_, true)

				local var_688_2 = arg_685_1:FormatText(StoryNameCfg[264].name)

				arg_685_1.leftNameTxt_.text = var_688_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_685_1.leftNameTxt_.transform)

				arg_685_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_685_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_685_1:RecordName(arg_685_1.leftNameTxt_.text)
				SetActive(arg_685_1.iconTrs_.gameObject, true)
				arg_685_1.iconController_:SetSelectedState("hero")

				arg_685_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10014")

				arg_685_1.callingController_:SetSelectedState("normal")

				local var_688_3 = arg_685_1:GetWordFromCfg(116431164)
				local var_688_4 = arg_685_1:FormatText(var_688_3.content)

				arg_685_1.text_.text = var_688_4

				LuaForUtil.ClearLinePrefixSymbol(arg_685_1.text_)

				local var_688_5 = 5
				local var_688_6 = utf8.len(var_688_4)
				local var_688_7 = var_688_5 <= 0 and var_688_1 or var_688_1 * (var_688_6 / var_688_5)

				if var_688_7 > 0 and var_688_1 < var_688_7 then
					arg_685_1.talkMaxDuration = var_688_7

					if var_688_7 + var_688_0 > arg_685_1.duration_ then
						arg_685_1.duration_ = var_688_7 + var_688_0
					end
				end

				arg_685_1.text_.text = var_688_4
				arg_685_1.typewritter.percent = 0

				arg_685_1.typewritter:SetDirty()
				arg_685_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431164", "story_v_out_116431.awb") ~= 0 then
					local var_688_8 = manager.audio:GetVoiceLength("story_v_out_116431", "116431164", "story_v_out_116431.awb") / 1000

					if var_688_8 + var_688_0 > arg_685_1.duration_ then
						arg_685_1.duration_ = var_688_8 + var_688_0
					end

					if var_688_3.prefab_name ~= "" and arg_685_1.actors_[var_688_3.prefab_name] ~= nil then
						local var_688_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_685_1.actors_[var_688_3.prefab_name].transform, "story_v_out_116431", "116431164", "story_v_out_116431.awb")

						arg_685_1:RecordAudio("116431164", var_688_9)
						arg_685_1:RecordAudio("116431164", var_688_9)
					else
						arg_685_1:AudioAction("play", "voice", "story_v_out_116431", "116431164", "story_v_out_116431.awb")
					end

					arg_685_1:RecordHistoryTalkVoice("story_v_out_116431", "116431164", "story_v_out_116431.awb")
				end

				arg_685_1:RecordContent(arg_685_1.text_.text)
			end

			local var_688_10 = math.max(var_688_1, arg_685_1.talkMaxDuration)

			if var_688_0 <= arg_685_1.time_ and arg_685_1.time_ < var_688_0 + var_688_10 then
				arg_685_1.typewritter.percent = (arg_685_1.time_ - var_688_0) / var_688_10

				arg_685_1.typewritter:SetDirty()
			end

			if arg_685_1.time_ >= var_688_0 + var_688_10 and arg_685_1.time_ < var_688_0 + var_688_10 + arg_688_0 then
				arg_685_1.typewritter.percent = 1

				arg_685_1.typewritter:SetDirty()
				arg_685_1:ShowNextGo(true)
			end
		end
	end,
	Play116431165 = function(arg_689_0, arg_689_1)
		arg_689_1.time_ = 0
		arg_689_1.frameCnt_ = 0
		arg_689_1.state_ = "playing"
		arg_689_1.curTalkId_ = 116431165
		arg_689_1.duration_ = 11.6

		local var_689_0 = {
			zh = 10.2,
			ja = 11.6
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
				arg_689_0:Play116431166(arg_689_1)
			end
		end

		function arg_689_1.onSingleLineUpdate_(arg_692_0)
			local var_692_0 = 0
			local var_692_1 = 0.975

			if var_692_0 < arg_689_1.time_ and arg_689_1.time_ <= var_692_0 + arg_692_0 then
				arg_689_1.talkMaxDuration = 0
				arg_689_1.dialogCg_.alpha = 1

				arg_689_1.dialog_:SetActive(true)
				SetActive(arg_689_1.leftNameGo_, true)

				local var_692_2 = arg_689_1:FormatText(StoryNameCfg[264].name)

				arg_689_1.leftNameTxt_.text = var_692_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_689_1.leftNameTxt_.transform)

				arg_689_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_689_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_689_1:RecordName(arg_689_1.leftNameTxt_.text)
				SetActive(arg_689_1.iconTrs_.gameObject, true)
				arg_689_1.iconController_:SetSelectedState("hero")

				arg_689_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10014")

				arg_689_1.callingController_:SetSelectedState("normal")

				local var_692_3 = arg_689_1:GetWordFromCfg(116431165)
				local var_692_4 = arg_689_1:FormatText(var_692_3.content)

				arg_689_1.text_.text = var_692_4

				LuaForUtil.ClearLinePrefixSymbol(arg_689_1.text_)

				local var_692_5 = 39
				local var_692_6 = utf8.len(var_692_4)
				local var_692_7 = var_692_5 <= 0 and var_692_1 or var_692_1 * (var_692_6 / var_692_5)

				if var_692_7 > 0 and var_692_1 < var_692_7 then
					arg_689_1.talkMaxDuration = var_692_7

					if var_692_7 + var_692_0 > arg_689_1.duration_ then
						arg_689_1.duration_ = var_692_7 + var_692_0
					end
				end

				arg_689_1.text_.text = var_692_4
				arg_689_1.typewritter.percent = 0

				arg_689_1.typewritter:SetDirty()
				arg_689_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431165", "story_v_out_116431.awb") ~= 0 then
					local var_692_8 = manager.audio:GetVoiceLength("story_v_out_116431", "116431165", "story_v_out_116431.awb") / 1000

					if var_692_8 + var_692_0 > arg_689_1.duration_ then
						arg_689_1.duration_ = var_692_8 + var_692_0
					end

					if var_692_3.prefab_name ~= "" and arg_689_1.actors_[var_692_3.prefab_name] ~= nil then
						local var_692_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_689_1.actors_[var_692_3.prefab_name].transform, "story_v_out_116431", "116431165", "story_v_out_116431.awb")

						arg_689_1:RecordAudio("116431165", var_692_9)
						arg_689_1:RecordAudio("116431165", var_692_9)
					else
						arg_689_1:AudioAction("play", "voice", "story_v_out_116431", "116431165", "story_v_out_116431.awb")
					end

					arg_689_1:RecordHistoryTalkVoice("story_v_out_116431", "116431165", "story_v_out_116431.awb")
				end

				arg_689_1:RecordContent(arg_689_1.text_.text)
			end

			local var_692_10 = math.max(var_692_1, arg_689_1.talkMaxDuration)

			if var_692_0 <= arg_689_1.time_ and arg_689_1.time_ < var_692_0 + var_692_10 then
				arg_689_1.typewritter.percent = (arg_689_1.time_ - var_692_0) / var_692_10

				arg_689_1.typewritter:SetDirty()
			end

			if arg_689_1.time_ >= var_692_0 + var_692_10 and arg_689_1.time_ < var_692_0 + var_692_10 + arg_692_0 then
				arg_689_1.typewritter.percent = 1

				arg_689_1.typewritter:SetDirty()
				arg_689_1:ShowNextGo(true)
			end
		end
	end,
	Play116431166 = function(arg_693_0, arg_693_1)
		arg_693_1.time_ = 0
		arg_693_1.frameCnt_ = 0
		arg_693_1.state_ = "playing"
		arg_693_1.curTalkId_ = 116431166
		arg_693_1.duration_ = 5.4

		local var_693_0 = {
			zh = 5.4,
			ja = 5.1
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
				arg_693_0:Play116431167(arg_693_1)
			end
		end

		function arg_693_1.onSingleLineUpdate_(arg_696_0)
			local var_696_0 = 2

			if var_696_0 < arg_693_1.time_ and arg_693_1.time_ <= var_696_0 + arg_696_0 then
				local var_696_1 = manager.ui.mainCamera.transform.localPosition
				local var_696_2 = Vector3.New(0, 0, 10) + Vector3.New(var_696_1.x, var_696_1.y, 0)
				local var_696_3 = arg_693_1.bgs_.I05c

				var_696_3.transform.localPosition = var_696_2
				var_696_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_696_4 = var_696_3:GetComponent("SpriteRenderer")

				if var_696_4 and var_696_4.sprite then
					local var_696_5 = (var_696_3.transform.localPosition - var_696_1).z
					local var_696_6 = manager.ui.mainCameraCom_
					local var_696_7 = 2 * var_696_5 * Mathf.Tan(var_696_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_696_8 = var_696_7 * var_696_6.aspect
					local var_696_9 = var_696_4.sprite.bounds.size.x
					local var_696_10 = var_696_4.sprite.bounds.size.y
					local var_696_11 = var_696_8 / var_696_9
					local var_696_12 = var_696_7 / var_696_10
					local var_696_13 = var_696_12 < var_696_11 and var_696_11 or var_696_12

					var_696_3.transform.localScale = Vector3.New(var_696_13, var_696_13, 0)
				end

				for iter_696_0, iter_696_1 in pairs(arg_693_1.bgs_) do
					if iter_696_0 ~= "I05c" then
						iter_696_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_696_14 = 0

			if var_696_14 < arg_693_1.time_ and arg_693_1.time_ <= var_696_14 + arg_696_0 then
				arg_693_1.mask_.enabled = true
				arg_693_1.mask_.raycastTarget = true

				arg_693_1:SetGaussion(false)
			end

			local var_696_15 = 2

			if var_696_14 <= arg_693_1.time_ and arg_693_1.time_ < var_696_14 + var_696_15 then
				local var_696_16 = (arg_693_1.time_ - var_696_14) / var_696_15
				local var_696_17 = Color.New(0, 0, 0)

				var_696_17.a = Mathf.Lerp(0, 1, var_696_16)
				arg_693_1.mask_.color = var_696_17
			end

			if arg_693_1.time_ >= var_696_14 + var_696_15 and arg_693_1.time_ < var_696_14 + var_696_15 + arg_696_0 then
				local var_696_18 = Color.New(0, 0, 0)

				var_696_18.a = 1
				arg_693_1.mask_.color = var_696_18
			end

			local var_696_19 = 2

			if var_696_19 < arg_693_1.time_ and arg_693_1.time_ <= var_696_19 + arg_696_0 then
				arg_693_1.mask_.enabled = true
				arg_693_1.mask_.raycastTarget = true

				arg_693_1:SetGaussion(false)
			end

			local var_696_20 = 2

			if var_696_19 <= arg_693_1.time_ and arg_693_1.time_ < var_696_19 + var_696_20 then
				local var_696_21 = (arg_693_1.time_ - var_696_19) / var_696_20
				local var_696_22 = Color.New(0, 0, 0)

				var_696_22.a = Mathf.Lerp(1, 0, var_696_21)
				arg_693_1.mask_.color = var_696_22
			end

			if arg_693_1.time_ >= var_696_19 + var_696_20 and arg_693_1.time_ < var_696_19 + var_696_20 + arg_696_0 then
				local var_696_23 = Color.New(0, 0, 0)
				local var_696_24 = 0

				arg_693_1.mask_.enabled = false
				var_696_23.a = var_696_24
				arg_693_1.mask_.color = var_696_23
			end

			local var_696_25 = 2
			local var_696_26 = 1

			if var_696_25 < arg_693_1.time_ and arg_693_1.time_ <= var_696_25 + arg_696_0 then
				local var_696_27 = "stop"
				local var_696_28 = "effect"

				arg_693_1:AudioAction(var_696_27, var_696_28, "se_story_16", "se_story_16_rain01_loop", "")
			end

			if arg_693_1.frameCnt_ <= 1 then
				arg_693_1.dialog_:SetActive(false)
			end

			local var_696_29 = 4
			local var_696_30 = 0.05

			if var_696_29 < arg_693_1.time_ and arg_693_1.time_ <= var_696_29 + arg_696_0 then
				arg_693_1.talkMaxDuration = 0

				arg_693_1.dialog_:SetActive(true)

				local var_696_31 = LeanTween.value(arg_693_1.dialog_, 0, 1, 0.3)

				var_696_31:setOnUpdate(LuaHelper.FloatAction(function(arg_697_0)
					arg_693_1.dialogCg_.alpha = arg_697_0
				end))
				var_696_31:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_693_1.dialog_)
					var_696_31:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_693_1.duration_ = arg_693_1.duration_ + 0.3

				SetActive(arg_693_1.leftNameGo_, true)

				local var_696_32 = arg_693_1:FormatText(StoryNameCfg[319].name)

				arg_693_1.leftNameTxt_.text = var_696_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_693_1.leftNameTxt_.transform)

				arg_693_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_693_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_693_1:RecordName(arg_693_1.leftNameTxt_.text)
				SetActive(arg_693_1.iconTrs_.gameObject, true)
				arg_693_1.iconController_:SetSelectedState("hero")

				arg_693_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1029")

				arg_693_1.callingController_:SetSelectedState("normal")

				local var_696_33 = arg_693_1:GetWordFromCfg(116431166)
				local var_696_34 = arg_693_1:FormatText(var_696_33.content)

				arg_693_1.text_.text = var_696_34

				LuaForUtil.ClearLinePrefixSymbol(arg_693_1.text_)

				local var_696_35 = 2
				local var_696_36 = utf8.len(var_696_34)
				local var_696_37 = var_696_35 <= 0 and var_696_30 or var_696_30 * (var_696_36 / var_696_35)

				if var_696_37 > 0 and var_696_30 < var_696_37 then
					arg_693_1.talkMaxDuration = var_696_37
					var_696_29 = var_696_29 + 0.3

					if var_696_37 + var_696_29 > arg_693_1.duration_ then
						arg_693_1.duration_ = var_696_37 + var_696_29
					end
				end

				arg_693_1.text_.text = var_696_34
				arg_693_1.typewritter.percent = 0

				arg_693_1.typewritter:SetDirty()
				arg_693_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431166", "story_v_out_116431.awb") ~= 0 then
					local var_696_38 = manager.audio:GetVoiceLength("story_v_out_116431", "116431166", "story_v_out_116431.awb") / 1000

					if var_696_38 + var_696_29 > arg_693_1.duration_ then
						arg_693_1.duration_ = var_696_38 + var_696_29
					end

					if var_696_33.prefab_name ~= "" and arg_693_1.actors_[var_696_33.prefab_name] ~= nil then
						local var_696_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_693_1.actors_[var_696_33.prefab_name].transform, "story_v_out_116431", "116431166", "story_v_out_116431.awb")

						arg_693_1:RecordAudio("116431166", var_696_39)
						arg_693_1:RecordAudio("116431166", var_696_39)
					else
						arg_693_1:AudioAction("play", "voice", "story_v_out_116431", "116431166", "story_v_out_116431.awb")
					end

					arg_693_1:RecordHistoryTalkVoice("story_v_out_116431", "116431166", "story_v_out_116431.awb")
				end

				arg_693_1:RecordContent(arg_693_1.text_.text)
			end

			local var_696_40 = var_696_29 + 0.3
			local var_696_41 = math.max(var_696_30, arg_693_1.talkMaxDuration)

			if var_696_40 <= arg_693_1.time_ and arg_693_1.time_ < var_696_40 + var_696_41 then
				arg_693_1.typewritter.percent = (arg_693_1.time_ - var_696_40) / var_696_41

				arg_693_1.typewritter:SetDirty()
			end

			if arg_693_1.time_ >= var_696_40 + var_696_41 and arg_693_1.time_ < var_696_40 + var_696_41 + arg_696_0 then
				arg_693_1.typewritter.percent = 1

				arg_693_1.typewritter:SetDirty()
				arg_693_1:ShowNextGo(true)
			end
		end
	end,
	Play116431167 = function(arg_699_0, arg_699_1)
		arg_699_1.time_ = 0
		arg_699_1.frameCnt_ = 0
		arg_699_1.state_ = "playing"
		arg_699_1.curTalkId_ = 116431167
		arg_699_1.duration_ = 5

		SetActive(arg_699_1.tipsGo_, false)

		function arg_699_1.onSingleLineFinish_()
			arg_699_1.onSingleLineUpdate_ = nil
			arg_699_1.onSingleLineFinish_ = nil
			arg_699_1.state_ = "waiting"
		end

		function arg_699_1.playNext_(arg_701_0)
			if arg_701_0 == 1 then
				arg_699_0:Play116431168(arg_699_1)
			end
		end

		function arg_699_1.onSingleLineUpdate_(arg_702_0)
			local var_702_0 = 0
			local var_702_1 = 0.775

			if var_702_0 < arg_699_1.time_ and arg_699_1.time_ <= var_702_0 + arg_702_0 then
				arg_699_1.talkMaxDuration = 0
				arg_699_1.dialogCg_.alpha = 1

				arg_699_1.dialog_:SetActive(true)
				SetActive(arg_699_1.leftNameGo_, false)

				arg_699_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_699_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_699_1:RecordName(arg_699_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_699_1.iconTrs_.gameObject, false)
				arg_699_1.callingController_:SetSelectedState("normal")

				local var_702_2 = arg_699_1:GetWordFromCfg(116431167)
				local var_702_3 = arg_699_1:FormatText(var_702_2.content)

				arg_699_1.text_.text = var_702_3

				LuaForUtil.ClearLinePrefixSymbol(arg_699_1.text_)

				local var_702_4 = 31
				local var_702_5 = utf8.len(var_702_3)
				local var_702_6 = var_702_4 <= 0 and var_702_1 or var_702_1 * (var_702_5 / var_702_4)

				if var_702_6 > 0 and var_702_1 < var_702_6 then
					arg_699_1.talkMaxDuration = var_702_6

					if var_702_6 + var_702_0 > arg_699_1.duration_ then
						arg_699_1.duration_ = var_702_6 + var_702_0
					end
				end

				arg_699_1.text_.text = var_702_3
				arg_699_1.typewritter.percent = 0

				arg_699_1.typewritter:SetDirty()
				arg_699_1:ShowNextGo(false)
				arg_699_1:RecordContent(arg_699_1.text_.text)
			end

			local var_702_7 = math.max(var_702_1, arg_699_1.talkMaxDuration)

			if var_702_0 <= arg_699_1.time_ and arg_699_1.time_ < var_702_0 + var_702_7 then
				arg_699_1.typewritter.percent = (arg_699_1.time_ - var_702_0) / var_702_7

				arg_699_1.typewritter:SetDirty()
			end

			if arg_699_1.time_ >= var_702_0 + var_702_7 and arg_699_1.time_ < var_702_0 + var_702_7 + arg_702_0 then
				arg_699_1.typewritter.percent = 1

				arg_699_1.typewritter:SetDirty()
				arg_699_1:ShowNextGo(true)
			end
		end
	end,
	Play116431168 = function(arg_703_0, arg_703_1)
		arg_703_1.time_ = 0
		arg_703_1.frameCnt_ = 0
		arg_703_1.state_ = "playing"
		arg_703_1.curTalkId_ = 116431168
		arg_703_1.duration_ = 2.2

		local var_703_0 = {
			zh = 2.2,
			ja = 1.366
		}
		local var_703_1 = manager.audio:GetLocalizationFlag()

		if var_703_0[var_703_1] ~= nil then
			arg_703_1.duration_ = var_703_0[var_703_1]
		end

		SetActive(arg_703_1.tipsGo_, false)

		function arg_703_1.onSingleLineFinish_()
			arg_703_1.onSingleLineUpdate_ = nil
			arg_703_1.onSingleLineFinish_ = nil
			arg_703_1.state_ = "waiting"
		end

		function arg_703_1.playNext_(arg_705_0)
			if arg_705_0 == 1 then
				arg_703_0:Play116431169(arg_703_1)
			end
		end

		function arg_703_1.onSingleLineUpdate_(arg_706_0)
			local var_706_0 = 0
			local var_706_1 = 0.225

			if var_706_0 < arg_703_1.time_ and arg_703_1.time_ <= var_706_0 + arg_706_0 then
				arg_703_1.talkMaxDuration = 0
				arg_703_1.dialogCg_.alpha = 1

				arg_703_1.dialog_:SetActive(true)
				SetActive(arg_703_1.leftNameGo_, true)

				local var_706_2 = arg_703_1:FormatText(StoryNameCfg[319].name)

				arg_703_1.leftNameTxt_.text = var_706_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_703_1.leftNameTxt_.transform)

				arg_703_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_703_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_703_1:RecordName(arg_703_1.leftNameTxt_.text)
				SetActive(arg_703_1.iconTrs_.gameObject, true)
				arg_703_1.iconController_:SetSelectedState("hero")

				arg_703_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1029")

				arg_703_1.callingController_:SetSelectedState("normal")

				local var_706_3 = arg_703_1:GetWordFromCfg(116431168)
				local var_706_4 = arg_703_1:FormatText(var_706_3.content)

				arg_703_1.text_.text = var_706_4

				LuaForUtil.ClearLinePrefixSymbol(arg_703_1.text_)

				local var_706_5 = 9
				local var_706_6 = utf8.len(var_706_4)
				local var_706_7 = var_706_5 <= 0 and var_706_1 or var_706_1 * (var_706_6 / var_706_5)

				if var_706_7 > 0 and var_706_1 < var_706_7 then
					arg_703_1.talkMaxDuration = var_706_7

					if var_706_7 + var_706_0 > arg_703_1.duration_ then
						arg_703_1.duration_ = var_706_7 + var_706_0
					end
				end

				arg_703_1.text_.text = var_706_4
				arg_703_1.typewritter.percent = 0

				arg_703_1.typewritter:SetDirty()
				arg_703_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431168", "story_v_out_116431.awb") ~= 0 then
					local var_706_8 = manager.audio:GetVoiceLength("story_v_out_116431", "116431168", "story_v_out_116431.awb") / 1000

					if var_706_8 + var_706_0 > arg_703_1.duration_ then
						arg_703_1.duration_ = var_706_8 + var_706_0
					end

					if var_706_3.prefab_name ~= "" and arg_703_1.actors_[var_706_3.prefab_name] ~= nil then
						local var_706_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_703_1.actors_[var_706_3.prefab_name].transform, "story_v_out_116431", "116431168", "story_v_out_116431.awb")

						arg_703_1:RecordAudio("116431168", var_706_9)
						arg_703_1:RecordAudio("116431168", var_706_9)
					else
						arg_703_1:AudioAction("play", "voice", "story_v_out_116431", "116431168", "story_v_out_116431.awb")
					end

					arg_703_1:RecordHistoryTalkVoice("story_v_out_116431", "116431168", "story_v_out_116431.awb")
				end

				arg_703_1:RecordContent(arg_703_1.text_.text)
			end

			local var_706_10 = math.max(var_706_1, arg_703_1.talkMaxDuration)

			if var_706_0 <= arg_703_1.time_ and arg_703_1.time_ < var_706_0 + var_706_10 then
				arg_703_1.typewritter.percent = (arg_703_1.time_ - var_706_0) / var_706_10

				arg_703_1.typewritter:SetDirty()
			end

			if arg_703_1.time_ >= var_706_0 + var_706_10 and arg_703_1.time_ < var_706_0 + var_706_10 + arg_706_0 then
				arg_703_1.typewritter.percent = 1

				arg_703_1.typewritter:SetDirty()
				arg_703_1:ShowNextGo(true)
			end
		end
	end,
	Play116431169 = function(arg_707_0, arg_707_1)
		arg_707_1.time_ = 0
		arg_707_1.frameCnt_ = 0
		arg_707_1.state_ = "playing"
		arg_707_1.curTalkId_ = 116431169
		arg_707_1.duration_ = 7.3

		local var_707_0 = {
			zh = 7.3,
			ja = 4.333
		}
		local var_707_1 = manager.audio:GetLocalizationFlag()

		if var_707_0[var_707_1] ~= nil then
			arg_707_1.duration_ = var_707_0[var_707_1]
		end

		SetActive(arg_707_1.tipsGo_, false)

		function arg_707_1.onSingleLineFinish_()
			arg_707_1.onSingleLineUpdate_ = nil
			arg_707_1.onSingleLineFinish_ = nil
			arg_707_1.state_ = "waiting"
			arg_707_1.auto_ = false
		end

		function arg_707_1.playNext_(arg_709_0)
			arg_707_1.onStoryFinished_()
		end

		function arg_707_1.onSingleLineUpdate_(arg_710_0)
			local var_710_0 = 0
			local var_710_1 = 0.575

			if var_710_0 < arg_707_1.time_ and arg_707_1.time_ <= var_710_0 + arg_710_0 then
				arg_707_1.talkMaxDuration = 0
				arg_707_1.dialogCg_.alpha = 1

				arg_707_1.dialog_:SetActive(true)
				SetActive(arg_707_1.leftNameGo_, true)

				local var_710_2 = arg_707_1:FormatText(StoryNameCfg[319].name)

				arg_707_1.leftNameTxt_.text = var_710_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_707_1.leftNameTxt_.transform)

				arg_707_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_707_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_707_1:RecordName(arg_707_1.leftNameTxt_.text)
				SetActive(arg_707_1.iconTrs_.gameObject, true)
				arg_707_1.iconController_:SetSelectedState("hero")

				arg_707_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1029")

				arg_707_1.callingController_:SetSelectedState("normal")

				local var_710_3 = arg_707_1:GetWordFromCfg(116431169)
				local var_710_4 = arg_707_1:FormatText(var_710_3.content)

				arg_707_1.text_.text = var_710_4

				LuaForUtil.ClearLinePrefixSymbol(arg_707_1.text_)

				local var_710_5 = 23
				local var_710_6 = utf8.len(var_710_4)
				local var_710_7 = var_710_5 <= 0 and var_710_1 or var_710_1 * (var_710_6 / var_710_5)

				if var_710_7 > 0 and var_710_1 < var_710_7 then
					arg_707_1.talkMaxDuration = var_710_7

					if var_710_7 + var_710_0 > arg_707_1.duration_ then
						arg_707_1.duration_ = var_710_7 + var_710_0
					end
				end

				arg_707_1.text_.text = var_710_4
				arg_707_1.typewritter.percent = 0

				arg_707_1.typewritter:SetDirty()
				arg_707_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116431", "116431169", "story_v_out_116431.awb") ~= 0 then
					local var_710_8 = manager.audio:GetVoiceLength("story_v_out_116431", "116431169", "story_v_out_116431.awb") / 1000

					if var_710_8 + var_710_0 > arg_707_1.duration_ then
						arg_707_1.duration_ = var_710_8 + var_710_0
					end

					if var_710_3.prefab_name ~= "" and arg_707_1.actors_[var_710_3.prefab_name] ~= nil then
						local var_710_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_707_1.actors_[var_710_3.prefab_name].transform, "story_v_out_116431", "116431169", "story_v_out_116431.awb")

						arg_707_1:RecordAudio("116431169", var_710_9)
						arg_707_1:RecordAudio("116431169", var_710_9)
					else
						arg_707_1:AudioAction("play", "voice", "story_v_out_116431", "116431169", "story_v_out_116431.awb")
					end

					arg_707_1:RecordHistoryTalkVoice("story_v_out_116431", "116431169", "story_v_out_116431.awb")
				end

				arg_707_1:RecordContent(arg_707_1.text_.text)
			end

			local var_710_10 = math.max(var_710_1, arg_707_1.talkMaxDuration)

			if var_710_0 <= arg_707_1.time_ and arg_707_1.time_ < var_710_0 + var_710_10 then
				arg_707_1.typewritter.percent = (arg_707_1.time_ - var_710_0) / var_710_10

				arg_707_1.typewritter:SetDirty()
			end

			if arg_707_1.time_ >= var_710_0 + var_710_10 and arg_707_1.time_ < var_710_0 + var_710_10 + arg_710_0 then
				arg_707_1.typewritter.percent = 1

				arg_707_1.typewritter:SetDirty()
				arg_707_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/I02",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST02",
		"Assets/UIResources/UI_AB/TextureConfig/Background/SK0202",
		"Assets/UIResources/UI_AB/TextureConfig/Background/SK0205",
		"Assets/UIResources/UI_AB/TextureConfig/Background/SK0106",
		"Assets/UIResources/UI_AB/TextureConfig/Background/SK0206",
		"Assets/UIResources/UI_AB/TextureConfig/Background/I05e",
		"Assets/UIResources/UI_AB/TextureConfig/Background/SK0211",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/A00",
		"SofdecAsset/story/101164301.usm",
		"Assets/UIResources/UI_AB/TextureConfig/Background/I05c",
		"Assets/UIResources/UI_AB/TextureConfig/Background/SK0208"
	},
	voices = {
		"story_v_out_116431.awb"
	}
}
