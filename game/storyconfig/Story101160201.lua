return {
	Play116021001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 116021001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play116021002(arg_1_1)
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

			local var_4_22 = 1.36666666666667
			local var_4_23 = 0.858333333333333

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "effect"

				arg_1_1:AudioAction(var_4_24, var_4_25, "se_story_16", "se_story_16_foot", "")
			end

			local var_4_26 = 0
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_30 = 2
			local var_4_31 = 0.733333333333333

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				local var_4_32 = "play"
				local var_4_33 = "music"

				arg_1_1:AudioAction(var_4_32, var_4_33, "bgm_story_office", "bgm_story_office", "bgm_story_office.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_34 = 2
			local var_4_35 = 0.225

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

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_37 = arg_1_1:FormatText(StoryNameCfg[326].name)

				arg_1_1.leftNameTxt_.text = var_4_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_38 = arg_1_1:GetWordFromCfg(116021001)
				local var_4_39 = arg_1_1:FormatText(var_4_38.content)

				arg_1_1.text_.text = var_4_39

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_40 = 9
				local var_4_41 = utf8.len(var_4_39)
				local var_4_42 = var_4_40 <= 0 and var_4_35 or var_4_35 * (var_4_41 / var_4_40)

				if var_4_42 > 0 and var_4_35 < var_4_42 then
					arg_1_1.talkMaxDuration = var_4_42
					var_4_34 = var_4_34 + 0.3

					if var_4_42 + var_4_34 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_42 + var_4_34
					end
				end

				arg_1_1.text_.text = var_4_39
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_43 = var_4_34 + 0.3
			local var_4_44 = math.max(var_4_35, arg_1_1.talkMaxDuration)

			if var_4_43 <= arg_1_1.time_ and arg_1_1.time_ < var_4_43 + var_4_44 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_43) / var_4_44

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_43 + var_4_44 and arg_1_1.time_ < var_4_43 + var_4_44 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play116021002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 116021002
		arg_7_1.duration_ = 1.6

		local var_7_0 = {
			zh = 1.2,
			ja = 1.6
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
				arg_7_0:Play116021003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.125

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_2 = arg_7_1:FormatText(StoryNameCfg[13].name)

				arg_7_1.leftNameTxt_.text = var_10_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, true)
				arg_7_1.iconController_:SetSelectedState("hero")

				arg_7_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019_split_6")

				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_3 = arg_7_1:GetWordFromCfg(116021002)
				local var_10_4 = arg_7_1:FormatText(var_10_3.content)

				arg_7_1.text_.text = var_10_4

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_5 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021002", "story_v_out_116021.awb") ~= 0 then
					local var_10_8 = manager.audio:GetVoiceLength("story_v_out_116021", "116021002", "story_v_out_116021.awb") / 1000

					if var_10_8 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_8 + var_10_0
					end

					if var_10_3.prefab_name ~= "" and arg_7_1.actors_[var_10_3.prefab_name] ~= nil then
						local var_10_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_3.prefab_name].transform, "story_v_out_116021", "116021002", "story_v_out_116021.awb")

						arg_7_1:RecordAudio("116021002", var_10_9)
						arg_7_1:RecordAudio("116021002", var_10_9)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_116021", "116021002", "story_v_out_116021.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_116021", "116021002", "story_v_out_116021.awb")
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
	Play116021003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 116021003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play116021004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 0.775

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

				local var_14_2 = arg_11_1:GetWordFromCfg(116021003)
				local var_14_3 = arg_11_1:FormatText(var_14_2.content)

				arg_11_1.text_.text = var_14_3

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_4 = 31
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
	Play116021004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 116021004
		arg_15_1.duration_ = 10.833

		local var_15_0 = {
			zh = 10.533,
			ja = 10.833
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
				arg_15_0:Play116021005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 1.125

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

				local var_18_3 = arg_15_1:GetWordFromCfg(116021004)
				local var_18_4 = arg_15_1:FormatText(var_18_3.content)

				arg_15_1.text_.text = var_18_4

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_5 = 45
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

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021004", "story_v_out_116021.awb") ~= 0 then
					local var_18_8 = manager.audio:GetVoiceLength("story_v_out_116021", "116021004", "story_v_out_116021.awb") / 1000

					if var_18_8 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_8 + var_18_0
					end

					if var_18_3.prefab_name ~= "" and arg_15_1.actors_[var_18_3.prefab_name] ~= nil then
						local var_18_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_3.prefab_name].transform, "story_v_out_116021", "116021004", "story_v_out_116021.awb")

						arg_15_1:RecordAudio("116021004", var_18_9)
						arg_15_1:RecordAudio("116021004", var_18_9)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_116021", "116021004", "story_v_out_116021.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_116021", "116021004", "story_v_out_116021.awb")
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
	Play116021005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 116021005
		arg_19_1.duration_ = 1.333

		local var_19_0 = {
			zh = 0.999999999999,
			ja = 1.333
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
				arg_19_0:Play116021006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 0.075

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_2 = arg_19_1:FormatText(StoryNameCfg[13].name)

				arg_19_1.leftNameTxt_.text = var_22_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, true)
				arg_19_1.iconController_:SetSelectedState("hero")

				arg_19_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019_split_6")

				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_3 = arg_19_1:GetWordFromCfg(116021005)
				local var_22_4 = arg_19_1:FormatText(var_22_3.content)

				arg_19_1.text_.text = var_22_4

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_5 = 3
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

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021005", "story_v_out_116021.awb") ~= 0 then
					local var_22_8 = manager.audio:GetVoiceLength("story_v_out_116021", "116021005", "story_v_out_116021.awb") / 1000

					if var_22_8 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_8 + var_22_0
					end

					if var_22_3.prefab_name ~= "" and arg_19_1.actors_[var_22_3.prefab_name] ~= nil then
						local var_22_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_3.prefab_name].transform, "story_v_out_116021", "116021005", "story_v_out_116021.awb")

						arg_19_1:RecordAudio("116021005", var_22_9)
						arg_19_1:RecordAudio("116021005", var_22_9)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_116021", "116021005", "story_v_out_116021.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_116021", "116021005", "story_v_out_116021.awb")
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
	Play116021006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 116021006
		arg_23_1.duration_ = 8

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play116021007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = "ST07b"

			if arg_23_1.bgs_[var_26_0] == nil then
				local var_26_1 = Object.Instantiate(arg_23_1.paintGo_)

				var_26_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_26_0)
				var_26_1.name = var_26_0
				var_26_1.transform.parent = arg_23_1.stage_.transform
				var_26_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_23_1.bgs_[var_26_0] = var_26_1
			end

			local var_26_2 = 2

			if var_26_2 < arg_23_1.time_ and arg_23_1.time_ <= var_26_2 + arg_26_0 then
				if arg_23_0.sceneSettingEffect_ then
					arg_23_1.sceneSettingEffect_.enabled = false
				end

				arg_23_1.sceneSettingGo_:SetActive(true)

				local var_26_3 = manager.ui.mainCamera.transform.localPosition
				local var_26_4 = Vector3.New(0, 0, 10) + Vector3.New(var_26_3.x, var_26_3.y, 0)
				local var_26_5 = arg_23_1.bgs_.ST07b

				var_26_5.transform.localPosition = var_26_4
				var_26_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_26_6 = var_26_5:GetComponent("SpriteRenderer")

				if var_26_6 and var_26_6.sprite then
					local var_26_7 = (var_26_5.transform.localPosition - var_26_3).z
					local var_26_8 = manager.ui.mainCameraCom_
					local var_26_9 = 2 * var_26_7 * Mathf.Tan(var_26_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_26_10 = var_26_9 * var_26_8.aspect
					local var_26_11 = var_26_6.sprite.bounds.size.x
					local var_26_12 = var_26_6.sprite.bounds.size.y
					local var_26_13 = var_26_10 / var_26_11
					local var_26_14 = var_26_9 / var_26_12
					local var_26_15 = var_26_14 < var_26_13 and var_26_13 or var_26_14

					var_26_5.transform.localScale = Vector3.New(var_26_15, var_26_15, 0)
				end

				for iter_26_0, iter_26_1 in pairs(arg_23_1.bgs_) do
					if iter_26_0 ~= "ST07b" then
						iter_26_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_26_16 = 0

			if var_26_16 < arg_23_1.time_ and arg_23_1.time_ <= var_26_16 + arg_26_0 then
				arg_23_1.mask_.enabled = true
				arg_23_1.mask_.raycastTarget = true

				arg_23_1:SetGaussion(false)
			end

			local var_26_17 = 2

			if var_26_16 <= arg_23_1.time_ and arg_23_1.time_ < var_26_16 + var_26_17 then
				local var_26_18 = (arg_23_1.time_ - var_26_16) / var_26_17
				local var_26_19 = Color.New(0, 0, 0)

				var_26_19.a = Mathf.Lerp(0, 1, var_26_18)
				arg_23_1.mask_.color = var_26_19
			end

			if arg_23_1.time_ >= var_26_16 + var_26_17 and arg_23_1.time_ < var_26_16 + var_26_17 + arg_26_0 then
				local var_26_20 = Color.New(0, 0, 0)

				var_26_20.a = 1
				arg_23_1.mask_.color = var_26_20
			end

			local var_26_21 = 2

			if var_26_21 < arg_23_1.time_ and arg_23_1.time_ <= var_26_21 + arg_26_0 then
				arg_23_1.mask_.enabled = true
				arg_23_1.mask_.raycastTarget = true

				arg_23_1:SetGaussion(false)
			end

			local var_26_22 = 2

			if var_26_21 <= arg_23_1.time_ and arg_23_1.time_ < var_26_21 + var_26_22 then
				local var_26_23 = (arg_23_1.time_ - var_26_21) / var_26_22
				local var_26_24 = Color.New(0, 0, 0)

				var_26_24.a = Mathf.Lerp(1, 0, var_26_23)
				arg_23_1.mask_.color = var_26_24
			end

			if arg_23_1.time_ >= var_26_21 + var_26_22 and arg_23_1.time_ < var_26_21 + var_26_22 + arg_26_0 then
				local var_26_25 = Color.New(0, 0, 0)
				local var_26_26 = 0

				arg_23_1.mask_.enabled = false
				var_26_25.a = var_26_26
				arg_23_1.mask_.color = var_26_25
			end

			local var_26_27 = "ST07b_blur"

			if arg_23_1.bgs_[var_26_27] == nil then
				local var_26_28 = Object.Instantiate(arg_23_1.blurPaintGo_)
				local var_26_29 = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_26_27)

				var_26_28:GetComponent("SpriteRenderer").sprite = var_26_29
				var_26_28.name = var_26_27
				var_26_28.transform.parent = arg_23_1.stage_.transform
				var_26_28.transform.localPosition = Vector3.New(0, 100, 0)
				arg_23_1.bgs_[var_26_27] = var_26_28
			end

			local var_26_30 = 2
			local var_26_31 = arg_23_1.bgs_[var_26_27]

			if var_26_30 < arg_23_1.time_ and arg_23_1.time_ <= var_26_30 + arg_26_0 then
				local var_26_32 = manager.ui.mainCamera.transform.localPosition
				local var_26_33 = Vector3.New(0, 0, 10) + Vector3.New(var_26_32.x, var_26_32.y, 0)

				var_26_31.transform.localPosition = var_26_33
				var_26_31.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_26_34 = var_26_31:GetComponent("SpriteRenderer")

				if var_26_34 and var_26_34.sprite then
					local var_26_35 = (var_26_31.transform.localPosition - var_26_32).z
					local var_26_36 = manager.ui.mainCameraCom_
					local var_26_37 = 2 * var_26_35 * Mathf.Tan(var_26_36.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_26_38 = var_26_37 * var_26_36.aspect
					local var_26_39 = var_26_34.sprite.bounds.size.x
					local var_26_40 = var_26_34.sprite.bounds.size.y
					local var_26_41 = var_26_38 / var_26_39
					local var_26_42 = var_26_37 / var_26_40
					local var_26_43 = var_26_42 < var_26_41 and var_26_41 or var_26_42

					var_26_31.transform.localScale = Vector3.New(var_26_43, var_26_43, 0)
				end
			end

			local var_26_44 = 1

			if var_26_30 <= arg_23_1.time_ and arg_23_1.time_ < var_26_30 + var_26_44 then
				local var_26_45 = (arg_23_1.time_ - var_26_30) / var_26_44
				local var_26_46 = Color.New(1, 1, 1)

				var_26_46.a = Mathf.Lerp(0, 0.6, var_26_45)

				var_26_31:GetComponent("SpriteRenderer").material:SetColor("_Color", var_26_46)
			end

			if arg_23_1.frameCnt_ <= 1 then
				arg_23_1.dialog_:SetActive(false)
			end

			local var_26_47 = 3
			local var_26_48 = 0.25

			if var_26_47 < arg_23_1.time_ and arg_23_1.time_ <= var_26_47 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0

				arg_23_1.dialog_:SetActive(true)

				local var_26_49 = LeanTween.value(arg_23_1.dialog_, 0, 1, 0.3)

				var_26_49:setOnUpdate(LuaHelper.FloatAction(function(arg_27_0)
					arg_23_1.dialogCg_.alpha = arg_27_0
				end))
				var_26_49:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_23_1.dialog_)
					var_26_49:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_23_1.duration_ = arg_23_1.duration_ + 0.3

				SetActive(arg_23_1.leftNameGo_, false)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_50 = arg_23_1:GetWordFromCfg(116021006)
				local var_26_51 = arg_23_1:FormatText(var_26_50.content)

				arg_23_1.text_.text = var_26_51

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_52 = 10
				local var_26_53 = utf8.len(var_26_51)
				local var_26_54 = var_26_52 <= 0 and var_26_48 or var_26_48 * (var_26_53 / var_26_52)

				if var_26_54 > 0 and var_26_48 < var_26_54 then
					arg_23_1.talkMaxDuration = var_26_54
					var_26_47 = var_26_47 + 0.3

					if var_26_54 + var_26_47 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_54 + var_26_47
					end
				end

				arg_23_1.text_.text = var_26_51
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_55 = var_26_47 + 0.3
			local var_26_56 = math.max(var_26_48, arg_23_1.talkMaxDuration)

			if var_26_55 <= arg_23_1.time_ and arg_23_1.time_ < var_26_55 + var_26_56 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_55) / var_26_56

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_55 + var_26_56 and arg_23_1.time_ < var_26_55 + var_26_56 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play116021007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 116021007
		arg_29_1.duration_ = 5

		SetActive(arg_29_1.tipsGo_, false)

		function arg_29_1.onSingleLineFinish_()
			arg_29_1.onSingleLineUpdate_ = nil
			arg_29_1.onSingleLineFinish_ = nil
			arg_29_1.state_ = "waiting"
		end

		function arg_29_1.playNext_(arg_31_0)
			if arg_31_0 == 1 then
				arg_29_0:Play116021008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = 0
			local var_32_1 = 1.425

			if var_32_0 < arg_29_1.time_ and arg_29_1.time_ <= var_32_0 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, false)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_2 = arg_29_1:GetWordFromCfg(116021007)
				local var_32_3 = arg_29_1:FormatText(var_32_2.content)

				arg_29_1.text_.text = var_32_3

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_4 = 57
				local var_32_5 = utf8.len(var_32_3)
				local var_32_6 = var_32_4 <= 0 and var_32_1 or var_32_1 * (var_32_5 / var_32_4)

				if var_32_6 > 0 and var_32_1 < var_32_6 then
					arg_29_1.talkMaxDuration = var_32_6

					if var_32_6 + var_32_0 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_6 + var_32_0
					end
				end

				arg_29_1.text_.text = var_32_3
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)
				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_7 = math.max(var_32_1, arg_29_1.talkMaxDuration)

			if var_32_0 <= arg_29_1.time_ and arg_29_1.time_ < var_32_0 + var_32_7 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_0) / var_32_7

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_0 + var_32_7 and arg_29_1.time_ < var_32_0 + var_32_7 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play116021008 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 116021008
		arg_33_1.duration_ = 1.999999999999

		SetActive(arg_33_1.tipsGo_, false)

		function arg_33_1.onSingleLineFinish_()
			arg_33_1.onSingleLineUpdate_ = nil
			arg_33_1.onSingleLineFinish_ = nil
			arg_33_1.state_ = "waiting"
		end

		function arg_33_1.playNext_(arg_35_0)
			if arg_35_0 == 1 then
				arg_33_0:Play116021009(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = "1019ui_story"

			if arg_33_1.actors_[var_36_0] == nil then
				local var_36_1 = Object.Instantiate(Asset.Load("Char/" .. var_36_0), arg_33_1.stage_.transform)

				var_36_1.name = var_36_0
				var_36_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_33_1.actors_[var_36_0] = var_36_1

				local var_36_2 = var_36_1:GetComponentInChildren(typeof(CharacterEffect))

				var_36_2.enabled = true

				local var_36_3 = GameObjectTools.GetOrAddComponent(var_36_1, typeof(DynamicBoneHelper))

				if var_36_3 then
					var_36_3:EnableDynamicBone(false)
				end

				arg_33_1:ShowWeapon(var_36_2.transform, false)

				arg_33_1.var_[var_36_0 .. "Animator"] = var_36_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_33_1.var_[var_36_0 .. "Animator"].applyRootMotion = true
				arg_33_1.var_[var_36_0 .. "LipSync"] = var_36_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_36_4 = arg_33_1.actors_["1019ui_story"].transform
			local var_36_5 = 0

			if var_36_5 < arg_33_1.time_ and arg_33_1.time_ <= var_36_5 + arg_36_0 then
				arg_33_1.var_.moveOldPos1019ui_story = var_36_4.localPosition
			end

			local var_36_6 = 0.001

			if var_36_5 <= arg_33_1.time_ and arg_33_1.time_ < var_36_5 + var_36_6 then
				local var_36_7 = (arg_33_1.time_ - var_36_5) / var_36_6
				local var_36_8 = Vector3.New(0, -1.08, -5.9)

				var_36_4.localPosition = Vector3.Lerp(arg_33_1.var_.moveOldPos1019ui_story, var_36_8, var_36_7)

				local var_36_9 = manager.ui.mainCamera.transform.position - var_36_4.position

				var_36_4.forward = Vector3.New(var_36_9.x, var_36_9.y, var_36_9.z)

				local var_36_10 = var_36_4.localEulerAngles

				var_36_10.z = 0
				var_36_10.x = 0
				var_36_4.localEulerAngles = var_36_10
			end

			if arg_33_1.time_ >= var_36_5 + var_36_6 and arg_33_1.time_ < var_36_5 + var_36_6 + arg_36_0 then
				var_36_4.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_36_11 = manager.ui.mainCamera.transform.position - var_36_4.position

				var_36_4.forward = Vector3.New(var_36_11.x, var_36_11.y, var_36_11.z)

				local var_36_12 = var_36_4.localEulerAngles

				var_36_12.z = 0
				var_36_12.x = 0
				var_36_4.localEulerAngles = var_36_12
			end

			local var_36_13 = 0

			if var_36_13 < arg_33_1.time_ and arg_33_1.time_ <= var_36_13 + arg_36_0 then
				arg_33_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action1_1")
			end

			local var_36_14 = 0

			if var_36_14 < arg_33_1.time_ and arg_33_1.time_ <= var_36_14 + arg_36_0 then
				arg_33_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_36_15 = arg_33_1.actors_["1019ui_story"]
			local var_36_16 = 0

			if var_36_16 < arg_33_1.time_ and arg_33_1.time_ <= var_36_16 + arg_36_0 and arg_33_1.var_.characterEffect1019ui_story == nil then
				arg_33_1.var_.characterEffect1019ui_story = var_36_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_36_17 = 0.2

			if var_36_16 <= arg_33_1.time_ and arg_33_1.time_ < var_36_16 + var_36_17 then
				local var_36_18 = (arg_33_1.time_ - var_36_16) / var_36_17

				if arg_33_1.var_.characterEffect1019ui_story then
					arg_33_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_33_1.time_ >= var_36_16 + var_36_17 and arg_33_1.time_ < var_36_16 + var_36_17 + arg_36_0 and arg_33_1.var_.characterEffect1019ui_story then
				arg_33_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_36_19 = 0
			local var_36_20 = 0.125

			if var_36_19 < arg_33_1.time_ and arg_33_1.time_ <= var_36_19 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, true)

				local var_36_21 = arg_33_1:FormatText(StoryNameCfg[13].name)

				arg_33_1.leftNameTxt_.text = var_36_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_33_1.leftNameTxt_.transform)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1.leftNameTxt_.text)
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_22 = arg_33_1:GetWordFromCfg(116021008)
				local var_36_23 = arg_33_1:FormatText(var_36_22.content)

				arg_33_1.text_.text = var_36_23

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_24 = 5
				local var_36_25 = utf8.len(var_36_23)
				local var_36_26 = var_36_24 <= 0 and var_36_20 or var_36_20 * (var_36_25 / var_36_24)

				if var_36_26 > 0 and var_36_20 < var_36_26 then
					arg_33_1.talkMaxDuration = var_36_26

					if var_36_26 + var_36_19 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_26 + var_36_19
					end
				end

				arg_33_1.text_.text = var_36_23
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021008", "story_v_out_116021.awb") ~= 0 then
					local var_36_27 = manager.audio:GetVoiceLength("story_v_out_116021", "116021008", "story_v_out_116021.awb") / 1000

					if var_36_27 + var_36_19 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_27 + var_36_19
					end

					if var_36_22.prefab_name ~= "" and arg_33_1.actors_[var_36_22.prefab_name] ~= nil then
						local var_36_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_33_1.actors_[var_36_22.prefab_name].transform, "story_v_out_116021", "116021008", "story_v_out_116021.awb")

						arg_33_1:RecordAudio("116021008", var_36_28)
						arg_33_1:RecordAudio("116021008", var_36_28)
					else
						arg_33_1:AudioAction("play", "voice", "story_v_out_116021", "116021008", "story_v_out_116021.awb")
					end

					arg_33_1:RecordHistoryTalkVoice("story_v_out_116021", "116021008", "story_v_out_116021.awb")
				end

				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_29 = math.max(var_36_20, arg_33_1.talkMaxDuration)

			if var_36_19 <= arg_33_1.time_ and arg_33_1.time_ < var_36_19 + var_36_29 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_19) / var_36_29

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_19 + var_36_29 and arg_33_1.time_ < var_36_19 + var_36_29 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play116021009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 116021009
		arg_37_1.duration_ = 5

		SetActive(arg_37_1.tipsGo_, false)

		function arg_37_1.onSingleLineFinish_()
			arg_37_1.onSingleLineUpdate_ = nil
			arg_37_1.onSingleLineFinish_ = nil
			arg_37_1.state_ = "waiting"
		end

		function arg_37_1.playNext_(arg_39_0)
			if arg_39_0 == 1 then
				arg_37_0:Play116021010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = arg_37_1.actors_["1019ui_story"]
			local var_40_1 = 0

			if var_40_1 < arg_37_1.time_ and arg_37_1.time_ <= var_40_1 + arg_40_0 and arg_37_1.var_.characterEffect1019ui_story == nil then
				arg_37_1.var_.characterEffect1019ui_story = var_40_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_2 = 0.2

			if var_40_1 <= arg_37_1.time_ and arg_37_1.time_ < var_40_1 + var_40_2 then
				local var_40_3 = (arg_37_1.time_ - var_40_1) / var_40_2

				if arg_37_1.var_.characterEffect1019ui_story then
					local var_40_4 = Mathf.Lerp(0, 0.5, var_40_3)

					arg_37_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_37_1.var_.characterEffect1019ui_story.fillRatio = var_40_4
				end
			end

			if arg_37_1.time_ >= var_40_1 + var_40_2 and arg_37_1.time_ < var_40_1 + var_40_2 + arg_40_0 and arg_37_1.var_.characterEffect1019ui_story then
				local var_40_5 = 0.5

				arg_37_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_37_1.var_.characterEffect1019ui_story.fillRatio = var_40_5
			end

			local var_40_6 = 0
			local var_40_7 = 1.075

			if var_40_6 < arg_37_1.time_ and arg_37_1.time_ <= var_40_6 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, false)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_8 = arg_37_1:GetWordFromCfg(116021009)
				local var_40_9 = arg_37_1:FormatText(var_40_8.content)

				arg_37_1.text_.text = var_40_9

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_10 = 43
				local var_40_11 = utf8.len(var_40_9)
				local var_40_12 = var_40_10 <= 0 and var_40_7 or var_40_7 * (var_40_11 / var_40_10)

				if var_40_12 > 0 and var_40_7 < var_40_12 then
					arg_37_1.talkMaxDuration = var_40_12

					if var_40_12 + var_40_6 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_12 + var_40_6
					end
				end

				arg_37_1.text_.text = var_40_9
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)
				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_13 = math.max(var_40_7, arg_37_1.talkMaxDuration)

			if var_40_6 <= arg_37_1.time_ and arg_37_1.time_ < var_40_6 + var_40_13 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_6) / var_40_13

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_6 + var_40_13 and arg_37_1.time_ < var_40_6 + var_40_13 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play116021010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 116021010
		arg_41_1.duration_ = 5.833

		local var_41_0 = {
			zh = 3.133,
			ja = 5.833
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
				arg_41_0:Play116021011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = 0
			local var_44_1 = 0.325

			if var_44_0 < arg_41_1.time_ and arg_41_1.time_ <= var_44_0 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_2 = arg_41_1:FormatText(StoryNameCfg[9].name)

				arg_41_1.leftNameTxt_.text = var_44_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, true)
				arg_41_1.iconController_:SetSelectedState("hero")

				arg_41_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1039")

				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_3 = arg_41_1:GetWordFromCfg(116021010)
				local var_44_4 = arg_41_1:FormatText(var_44_3.content)

				arg_41_1.text_.text = var_44_4

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_5 = 13
				local var_44_6 = utf8.len(var_44_4)
				local var_44_7 = var_44_5 <= 0 and var_44_1 or var_44_1 * (var_44_6 / var_44_5)

				if var_44_7 > 0 and var_44_1 < var_44_7 then
					arg_41_1.talkMaxDuration = var_44_7

					if var_44_7 + var_44_0 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_7 + var_44_0
					end
				end

				arg_41_1.text_.text = var_44_4
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021010", "story_v_out_116021.awb") ~= 0 then
					local var_44_8 = manager.audio:GetVoiceLength("story_v_out_116021", "116021010", "story_v_out_116021.awb") / 1000

					if var_44_8 + var_44_0 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_8 + var_44_0
					end

					if var_44_3.prefab_name ~= "" and arg_41_1.actors_[var_44_3.prefab_name] ~= nil then
						local var_44_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_3.prefab_name].transform, "story_v_out_116021", "116021010", "story_v_out_116021.awb")

						arg_41_1:RecordAudio("116021010", var_44_9)
						arg_41_1:RecordAudio("116021010", var_44_9)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_out_116021", "116021010", "story_v_out_116021.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_out_116021", "116021010", "story_v_out_116021.awb")
				end

				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_10 = math.max(var_44_1, arg_41_1.talkMaxDuration)

			if var_44_0 <= arg_41_1.time_ and arg_41_1.time_ < var_44_0 + var_44_10 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_0) / var_44_10

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_0 + var_44_10 and arg_41_1.time_ < var_44_0 + var_44_10 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play116021011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 116021011
		arg_45_1.duration_ = 0.016666666666

		SetActive(arg_45_1.tipsGo_, false)

		function arg_45_1.onSingleLineFinish_()
			arg_45_1.onSingleLineUpdate_ = nil
			arg_45_1.onSingleLineFinish_ = nil
			arg_45_1.state_ = "waiting"

			SetActive(arg_45_1.choicesGo_, true)

			for iter_46_0, iter_46_1 in ipairs(arg_45_1.choices_) do
				local var_46_0 = iter_46_0 <= 1

				SetActive(iter_46_1.go, var_46_0)
			end

			arg_45_1.choices_[1].txt.text = arg_45_1:FormatText(StoryChoiceCfg[224].name)
		end

		function arg_45_1.playNext_(arg_47_0)
			if arg_47_0 == 1 then
				arg_45_0:Play116021012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			return
		end
	end,
	Play116021012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 116021012
		arg_49_1.duration_ = 5.9

		local var_49_0 = {
			zh = 5.9,
			ja = 5.866
		}
		local var_49_1 = manager.audio:GetLocalizationFlag()

		if var_49_0[var_49_1] ~= nil then
			arg_49_1.duration_ = var_49_0[var_49_1]
		end

		SetActive(arg_49_1.tipsGo_, false)

		function arg_49_1.onSingleLineFinish_()
			arg_49_1.onSingleLineUpdate_ = nil
			arg_49_1.onSingleLineFinish_ = nil
			arg_49_1.state_ = "waiting"
		end

		function arg_49_1.playNext_(arg_51_0)
			if arg_51_0 == 1 then
				arg_49_0:Play116021013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = 0
			local var_52_1 = 0.525

			if var_52_0 < arg_49_1.time_ and arg_49_1.time_ <= var_52_0 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0

				arg_49_1.dialog_:SetActive(true)

				local var_52_2 = LeanTween.value(arg_49_1.dialog_, 0, 1, 0.3)

				var_52_2:setOnUpdate(LuaHelper.FloatAction(function(arg_53_0)
					arg_49_1.dialogCg_.alpha = arg_53_0
				end))
				var_52_2:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_49_1.dialog_)
					var_52_2:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_49_1.duration_ = arg_49_1.duration_ + 0.3

				SetActive(arg_49_1.leftNameGo_, true)

				local var_52_3 = arg_49_1:FormatText(StoryNameCfg[9].name)

				arg_49_1.leftNameTxt_.text = var_52_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_49_1.leftNameTxt_.transform)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1.leftNameTxt_.text)
				SetActive(arg_49_1.iconTrs_.gameObject, true)
				arg_49_1.iconController_:SetSelectedState("hero")

				arg_49_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1039")

				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_4 = arg_49_1:GetWordFromCfg(116021012)
				local var_52_5 = arg_49_1:FormatText(var_52_4.content)

				arg_49_1.text_.text = var_52_5

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_6 = 21
				local var_52_7 = utf8.len(var_52_5)
				local var_52_8 = var_52_6 <= 0 and var_52_1 or var_52_1 * (var_52_7 / var_52_6)

				if var_52_8 > 0 and var_52_1 < var_52_8 then
					arg_49_1.talkMaxDuration = var_52_8
					var_52_0 = var_52_0 + 0.3

					if var_52_8 + var_52_0 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_8 + var_52_0
					end
				end

				arg_49_1.text_.text = var_52_5
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021012", "story_v_out_116021.awb") ~= 0 then
					local var_52_9 = manager.audio:GetVoiceLength("story_v_out_116021", "116021012", "story_v_out_116021.awb") / 1000

					if var_52_9 + var_52_0 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_9 + var_52_0
					end

					if var_52_4.prefab_name ~= "" and arg_49_1.actors_[var_52_4.prefab_name] ~= nil then
						local var_52_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_49_1.actors_[var_52_4.prefab_name].transform, "story_v_out_116021", "116021012", "story_v_out_116021.awb")

						arg_49_1:RecordAudio("116021012", var_52_10)
						arg_49_1:RecordAudio("116021012", var_52_10)
					else
						arg_49_1:AudioAction("play", "voice", "story_v_out_116021", "116021012", "story_v_out_116021.awb")
					end

					arg_49_1:RecordHistoryTalkVoice("story_v_out_116021", "116021012", "story_v_out_116021.awb")
				end

				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_11 = var_52_0 + 0.3
			local var_52_12 = math.max(var_52_1, arg_49_1.talkMaxDuration)

			if var_52_11 <= arg_49_1.time_ and arg_49_1.time_ < var_52_11 + var_52_12 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_11) / var_52_12

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_11 + var_52_12 and arg_49_1.time_ < var_52_11 + var_52_12 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play116021013 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 116021013
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play116021014(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 1.4

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, false)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_2 = arg_55_1:GetWordFromCfg(116021013)
				local var_58_3 = arg_55_1:FormatText(var_58_2.content)

				arg_55_1.text_.text = var_58_3

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_4 = 56
				local var_58_5 = utf8.len(var_58_3)
				local var_58_6 = var_58_4 <= 0 and var_58_1 or var_58_1 * (var_58_5 / var_58_4)

				if var_58_6 > 0 and var_58_1 < var_58_6 then
					arg_55_1.talkMaxDuration = var_58_6

					if var_58_6 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_6 + var_58_0
					end
				end

				arg_55_1.text_.text = var_58_3
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_7 = math.max(var_58_1, arg_55_1.talkMaxDuration)

			if var_58_0 <= arg_55_1.time_ and arg_55_1.time_ < var_58_0 + var_58_7 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_0) / var_58_7

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_0 + var_58_7 and arg_55_1.time_ < var_58_0 + var_58_7 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play116021014 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 116021014
		arg_59_1.duration_ = 4.2

		local var_59_0 = {
			zh = 4.2,
			ja = 3
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
				arg_59_0:Play116021015(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 0.325

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_2 = arg_59_1:FormatText(StoryNameCfg[9].name)

				arg_59_1.leftNameTxt_.text = var_62_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, true)
				arg_59_1.iconController_:SetSelectedState("hero")

				arg_59_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1039")

				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_3 = arg_59_1:GetWordFromCfg(116021014)
				local var_62_4 = arg_59_1:FormatText(var_62_3.content)

				arg_59_1.text_.text = var_62_4

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_5 = 13
				local var_62_6 = utf8.len(var_62_4)
				local var_62_7 = var_62_5 <= 0 and var_62_1 or var_62_1 * (var_62_6 / var_62_5)

				if var_62_7 > 0 and var_62_1 < var_62_7 then
					arg_59_1.talkMaxDuration = var_62_7

					if var_62_7 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_7 + var_62_0
					end
				end

				arg_59_1.text_.text = var_62_4
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021014", "story_v_out_116021.awb") ~= 0 then
					local var_62_8 = manager.audio:GetVoiceLength("story_v_out_116021", "116021014", "story_v_out_116021.awb") / 1000

					if var_62_8 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_8 + var_62_0
					end

					if var_62_3.prefab_name ~= "" and arg_59_1.actors_[var_62_3.prefab_name] ~= nil then
						local var_62_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_3.prefab_name].transform, "story_v_out_116021", "116021014", "story_v_out_116021.awb")

						arg_59_1:RecordAudio("116021014", var_62_9)
						arg_59_1:RecordAudio("116021014", var_62_9)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_116021", "116021014", "story_v_out_116021.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_116021", "116021014", "story_v_out_116021.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_10 = math.max(var_62_1, arg_59_1.talkMaxDuration)

			if var_62_0 <= arg_59_1.time_ and arg_59_1.time_ < var_62_0 + var_62_10 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_0) / var_62_10

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_0 + var_62_10 and arg_59_1.time_ < var_62_0 + var_62_10 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play116021015 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 116021015
		arg_63_1.duration_ = 9

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play116021016(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = "SK0104"

			if arg_63_1.bgs_[var_66_0] == nil then
				local var_66_1 = Object.Instantiate(arg_63_1.paintGo_)

				var_66_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_66_0)
				var_66_1.name = var_66_0
				var_66_1.transform.parent = arg_63_1.stage_.transform
				var_66_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_63_1.bgs_[var_66_0] = var_66_1
			end

			local var_66_2 = 2

			if var_66_2 < arg_63_1.time_ and arg_63_1.time_ <= var_66_2 + arg_66_0 then
				local var_66_3 = manager.ui.mainCamera.transform.localPosition
				local var_66_4 = Vector3.New(0, 0, 10) + Vector3.New(var_66_3.x, var_66_3.y, 0)
				local var_66_5 = arg_63_1.bgs_.SK0104

				var_66_5.transform.localPosition = var_66_4
				var_66_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_66_6 = var_66_5:GetComponent("SpriteRenderer")

				if var_66_6 and var_66_6.sprite then
					local var_66_7 = (var_66_5.transform.localPosition - var_66_3).z
					local var_66_8 = manager.ui.mainCameraCom_
					local var_66_9 = 2 * var_66_7 * Mathf.Tan(var_66_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_66_10 = var_66_9 * var_66_8.aspect
					local var_66_11 = var_66_6.sprite.bounds.size.x
					local var_66_12 = var_66_6.sprite.bounds.size.y
					local var_66_13 = var_66_10 / var_66_11
					local var_66_14 = var_66_9 / var_66_12
					local var_66_15 = var_66_14 < var_66_13 and var_66_13 or var_66_14

					var_66_5.transform.localScale = Vector3.New(var_66_15, var_66_15, 0)
				end

				for iter_66_0, iter_66_1 in pairs(arg_63_1.bgs_) do
					if iter_66_0 ~= "SK0104" then
						iter_66_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_66_16 = 0

			if var_66_16 < arg_63_1.time_ and arg_63_1.time_ <= var_66_16 + arg_66_0 then
				arg_63_1.mask_.enabled = true
				arg_63_1.mask_.raycastTarget = true

				arg_63_1:SetGaussion(false)
			end

			local var_66_17 = 2

			if var_66_16 <= arg_63_1.time_ and arg_63_1.time_ < var_66_16 + var_66_17 then
				local var_66_18 = (arg_63_1.time_ - var_66_16) / var_66_17
				local var_66_19 = Color.New(0, 0, 0)

				var_66_19.a = Mathf.Lerp(0, 1, var_66_18)
				arg_63_1.mask_.color = var_66_19
			end

			if arg_63_1.time_ >= var_66_16 + var_66_17 and arg_63_1.time_ < var_66_16 + var_66_17 + arg_66_0 then
				local var_66_20 = Color.New(0, 0, 0)

				var_66_20.a = 1
				arg_63_1.mask_.color = var_66_20
			end

			local var_66_21 = 2

			if var_66_21 < arg_63_1.time_ and arg_63_1.time_ <= var_66_21 + arg_66_0 then
				arg_63_1.mask_.enabled = true
				arg_63_1.mask_.raycastTarget = true

				arg_63_1:SetGaussion(false)
			end

			local var_66_22 = 2

			if var_66_21 <= arg_63_1.time_ and arg_63_1.time_ < var_66_21 + var_66_22 then
				local var_66_23 = (arg_63_1.time_ - var_66_21) / var_66_22
				local var_66_24 = Color.New(0, 0, 0)

				var_66_24.a = Mathf.Lerp(1, 0, var_66_23)
				arg_63_1.mask_.color = var_66_24
			end

			if arg_63_1.time_ >= var_66_21 + var_66_22 and arg_63_1.time_ < var_66_21 + var_66_22 + arg_66_0 then
				local var_66_25 = Color.New(0, 0, 0)
				local var_66_26 = 0

				arg_63_1.mask_.enabled = false
				var_66_25.a = var_66_26
				arg_63_1.mask_.color = var_66_25
			end

			local var_66_27 = arg_63_1.bgs_.SK0104.transform
			local var_66_28 = 2

			if var_66_28 < arg_63_1.time_ and arg_63_1.time_ <= var_66_28 + arg_66_0 then
				arg_63_1.var_.moveOldPosSK0104 = var_66_27.localPosition
			end

			local var_66_29 = 2.5

			if var_66_28 <= arg_63_1.time_ and arg_63_1.time_ < var_66_28 + var_66_29 then
				local var_66_30 = (arg_63_1.time_ - var_66_28) / var_66_29
				local var_66_31 = Vector3.New(0, 1, 9.5)

				var_66_27.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPosSK0104, var_66_31, var_66_30)
			end

			if arg_63_1.time_ >= var_66_28 + var_66_29 and arg_63_1.time_ < var_66_28 + var_66_29 + arg_66_0 then
				var_66_27.localPosition = Vector3.New(0, 1, 9.5)
			end

			local var_66_32 = 4

			if var_66_32 < arg_63_1.time_ and arg_63_1.time_ <= var_66_32 + arg_66_0 then
				arg_63_1.allBtn_.enabled = false
			end

			local var_66_33 = 0.5

			if arg_63_1.time_ >= var_66_32 + var_66_33 and arg_63_1.time_ < var_66_32 + var_66_33 + arg_66_0 then
				arg_63_1.allBtn_.enabled = true
			end

			local var_66_34 = arg_63_1.actors_["1019ui_story"].transform
			local var_66_35 = 1.966

			if var_66_35 < arg_63_1.time_ and arg_63_1.time_ <= var_66_35 + arg_66_0 then
				arg_63_1.var_.moveOldPos1019ui_story = var_66_34.localPosition
			end

			local var_66_36 = 0.001

			if var_66_35 <= arg_63_1.time_ and arg_63_1.time_ < var_66_35 + var_66_36 then
				local var_66_37 = (arg_63_1.time_ - var_66_35) / var_66_36
				local var_66_38 = Vector3.New(0, 100, 0)

				var_66_34.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1019ui_story, var_66_38, var_66_37)

				local var_66_39 = manager.ui.mainCamera.transform.position - var_66_34.position

				var_66_34.forward = Vector3.New(var_66_39.x, var_66_39.y, var_66_39.z)

				local var_66_40 = var_66_34.localEulerAngles

				var_66_40.z = 0
				var_66_40.x = 0
				var_66_34.localEulerAngles = var_66_40
			end

			if arg_63_1.time_ >= var_66_35 + var_66_36 and arg_63_1.time_ < var_66_35 + var_66_36 + arg_66_0 then
				var_66_34.localPosition = Vector3.New(0, 100, 0)

				local var_66_41 = manager.ui.mainCamera.transform.position - var_66_34.position

				var_66_34.forward = Vector3.New(var_66_41.x, var_66_41.y, var_66_41.z)

				local var_66_42 = var_66_34.localEulerAngles

				var_66_42.z = 0
				var_66_42.x = 0
				var_66_34.localEulerAngles = var_66_42
			end

			if arg_63_1.frameCnt_ <= 1 then
				arg_63_1.dialog_:SetActive(false)
			end

			local var_66_43 = 4
			local var_66_44 = 1.5

			if var_66_43 < arg_63_1.time_ and arg_63_1.time_ <= var_66_43 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0

				arg_63_1.dialog_:SetActive(true)

				local var_66_45 = LeanTween.value(arg_63_1.dialog_, 0, 1, 0.3)

				var_66_45:setOnUpdate(LuaHelper.FloatAction(function(arg_67_0)
					arg_63_1.dialogCg_.alpha = arg_67_0
				end))
				var_66_45:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_63_1.dialog_)
					var_66_45:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_63_1.duration_ = arg_63_1.duration_ + 0.3

				SetActive(arg_63_1.leftNameGo_, false)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_46 = arg_63_1:GetWordFromCfg(116021015)
				local var_66_47 = arg_63_1:FormatText(var_66_46.content)

				arg_63_1.text_.text = var_66_47

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_48 = 61
				local var_66_49 = utf8.len(var_66_47)
				local var_66_50 = var_66_48 <= 0 and var_66_44 or var_66_44 * (var_66_49 / var_66_48)

				if var_66_50 > 0 and var_66_44 < var_66_50 then
					arg_63_1.talkMaxDuration = var_66_50
					var_66_43 = var_66_43 + 0.3

					if var_66_50 + var_66_43 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_50 + var_66_43
					end
				end

				arg_63_1.text_.text = var_66_47
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)
				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_51 = var_66_43 + 0.3
			local var_66_52 = math.max(var_66_44, arg_63_1.talkMaxDuration)

			if var_66_51 <= arg_63_1.time_ and arg_63_1.time_ < var_66_51 + var_66_52 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_51) / var_66_52

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_51 + var_66_52 and arg_63_1.time_ < var_66_51 + var_66_52 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play116021016 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 116021016
		arg_69_1.duration_ = 8.166

		local var_69_0 = {
			zh = 7.433,
			ja = 8.166
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
				arg_69_0:Play116021017(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = 0
			local var_72_1 = 0.55

			if var_72_0 < arg_69_1.time_ and arg_69_1.time_ <= var_72_0 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_2 = arg_69_1:FormatText(StoryNameCfg[8].name)

				arg_69_1.leftNameTxt_.text = var_72_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_3 = arg_69_1:GetWordFromCfg(116021016)
				local var_72_4 = arg_69_1:FormatText(var_72_3.content)

				arg_69_1.text_.text = var_72_4

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_5 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021016", "story_v_out_116021.awb") ~= 0 then
					local var_72_8 = manager.audio:GetVoiceLength("story_v_out_116021", "116021016", "story_v_out_116021.awb") / 1000

					if var_72_8 + var_72_0 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_8 + var_72_0
					end

					if var_72_3.prefab_name ~= "" and arg_69_1.actors_[var_72_3.prefab_name] ~= nil then
						local var_72_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_3.prefab_name].transform, "story_v_out_116021", "116021016", "story_v_out_116021.awb")

						arg_69_1:RecordAudio("116021016", var_72_9)
						arg_69_1:RecordAudio("116021016", var_72_9)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_116021", "116021016", "story_v_out_116021.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_116021", "116021016", "story_v_out_116021.awb")
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
	Play116021017 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 116021017
		arg_73_1.duration_ = 9.8

		local var_73_0 = {
			zh = 5.433,
			ja = 9.8
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
				arg_73_0:Play116021018(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = 0
			local var_76_1 = 0.4

			if var_76_0 < arg_73_1.time_ and arg_73_1.time_ <= var_76_0 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_2 = arg_73_1:FormatText(StoryNameCfg[8].name)

				arg_73_1.leftNameTxt_.text = var_76_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_3 = arg_73_1:GetWordFromCfg(116021017)
				local var_76_4 = arg_73_1:FormatText(var_76_3.content)

				arg_73_1.text_.text = var_76_4

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_5 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021017", "story_v_out_116021.awb") ~= 0 then
					local var_76_8 = manager.audio:GetVoiceLength("story_v_out_116021", "116021017", "story_v_out_116021.awb") / 1000

					if var_76_8 + var_76_0 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_8 + var_76_0
					end

					if var_76_3.prefab_name ~= "" and arg_73_1.actors_[var_76_3.prefab_name] ~= nil then
						local var_76_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_3.prefab_name].transform, "story_v_out_116021", "116021017", "story_v_out_116021.awb")

						arg_73_1:RecordAudio("116021017", var_76_9)
						arg_73_1:RecordAudio("116021017", var_76_9)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_116021", "116021017", "story_v_out_116021.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_116021", "116021017", "story_v_out_116021.awb")
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
	Play116021018 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 116021018
		arg_77_1.duration_ = 7.1

		local var_77_0 = {
			zh = 7.1,
			ja = 5.6
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
				arg_77_0:Play116021019(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = 0
			local var_80_1 = 0.7

			if var_80_0 < arg_77_1.time_ and arg_77_1.time_ <= var_80_0 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_2 = arg_77_1:FormatText(StoryNameCfg[13].name)

				arg_77_1.leftNameTxt_.text = var_80_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, true)
				arg_77_1.iconController_:SetSelectedState("hero")

				arg_77_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019_split_6")

				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_3 = arg_77_1:GetWordFromCfg(116021018)
				local var_80_4 = arg_77_1:FormatText(var_80_3.content)

				arg_77_1.text_.text = var_80_4

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_5 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021018", "story_v_out_116021.awb") ~= 0 then
					local var_80_8 = manager.audio:GetVoiceLength("story_v_out_116021", "116021018", "story_v_out_116021.awb") / 1000

					if var_80_8 + var_80_0 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_8 + var_80_0
					end

					if var_80_3.prefab_name ~= "" and arg_77_1.actors_[var_80_3.prefab_name] ~= nil then
						local var_80_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_3.prefab_name].transform, "story_v_out_116021", "116021018", "story_v_out_116021.awb")

						arg_77_1:RecordAudio("116021018", var_80_9)
						arg_77_1:RecordAudio("116021018", var_80_9)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_116021", "116021018", "story_v_out_116021.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_116021", "116021018", "story_v_out_116021.awb")
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
	Play116021019 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 116021019
		arg_81_1.duration_ = 5

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play116021020(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["1019ui_story"]
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 and arg_81_1.var_.characterEffect1019ui_story == nil then
				arg_81_1.var_.characterEffect1019ui_story = var_84_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_2 = 0.2

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_2 then
				local var_84_3 = (arg_81_1.time_ - var_84_1) / var_84_2

				if arg_81_1.var_.characterEffect1019ui_story then
					local var_84_4 = Mathf.Lerp(0, 0.5, var_84_3)

					arg_81_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_81_1.var_.characterEffect1019ui_story.fillRatio = var_84_4
				end
			end

			if arg_81_1.time_ >= var_84_1 + var_84_2 and arg_81_1.time_ < var_84_1 + var_84_2 + arg_84_0 and arg_81_1.var_.characterEffect1019ui_story then
				local var_84_5 = 0.5

				arg_81_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_81_1.var_.characterEffect1019ui_story.fillRatio = var_84_5
			end

			local var_84_6 = 0

			if var_84_6 < arg_81_1.time_ and arg_81_1.time_ <= var_84_6 + arg_84_0 then
				arg_81_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_2")
			end

			local var_84_7 = 0
			local var_84_8 = 0.35

			if var_84_7 < arg_81_1.time_ and arg_81_1.time_ <= var_84_7 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_9 = arg_81_1:FormatText(StoryNameCfg[7].name)

				arg_81_1.leftNameTxt_.text = var_84_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_10 = arg_81_1:GetWordFromCfg(116021019)
				local var_84_11 = arg_81_1:FormatText(var_84_10.content)

				arg_81_1.text_.text = var_84_11

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_12 = 14
				local var_84_13 = utf8.len(var_84_11)
				local var_84_14 = var_84_12 <= 0 and var_84_8 or var_84_8 * (var_84_13 / var_84_12)

				if var_84_14 > 0 and var_84_8 < var_84_14 then
					arg_81_1.talkMaxDuration = var_84_14

					if var_84_14 + var_84_7 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_14 + var_84_7
					end
				end

				arg_81_1.text_.text = var_84_11
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)
				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_15 = math.max(var_84_8, arg_81_1.talkMaxDuration)

			if var_84_7 <= arg_81_1.time_ and arg_81_1.time_ < var_84_7 + var_84_15 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_7) / var_84_15

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_7 + var_84_15 and arg_81_1.time_ < var_84_7 + var_84_15 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play116021020 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 116021020
		arg_85_1.duration_ = 12.1

		local var_85_0 = {
			zh = 8.9,
			ja = 12.1
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
				arg_85_0:Play116021021(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 0
			local var_88_1 = 1.1

			if var_88_0 < arg_85_1.time_ and arg_85_1.time_ <= var_88_0 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_2 = arg_85_1:FormatText(StoryNameCfg[9].name)

				arg_85_1.leftNameTxt_.text = var_88_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, true)
				arg_85_1.iconController_:SetSelectedState("hero")

				arg_85_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1039")

				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_3 = arg_85_1:GetWordFromCfg(116021020)
				local var_88_4 = arg_85_1:FormatText(var_88_3.content)

				arg_85_1.text_.text = var_88_4

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_5 = 44
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

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021020", "story_v_out_116021.awb") ~= 0 then
					local var_88_8 = manager.audio:GetVoiceLength("story_v_out_116021", "116021020", "story_v_out_116021.awb") / 1000

					if var_88_8 + var_88_0 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_8 + var_88_0
					end

					if var_88_3.prefab_name ~= "" and arg_85_1.actors_[var_88_3.prefab_name] ~= nil then
						local var_88_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_3.prefab_name].transform, "story_v_out_116021", "116021020", "story_v_out_116021.awb")

						arg_85_1:RecordAudio("116021020", var_88_9)
						arg_85_1:RecordAudio("116021020", var_88_9)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_116021", "116021020", "story_v_out_116021.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_116021", "116021020", "story_v_out_116021.awb")
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
	Play116021021 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 116021021
		arg_89_1.duration_ = 3.4

		local var_89_0 = {
			zh = 1.766,
			ja = 3.4
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
				arg_89_0:Play116021022(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = 0
			local var_92_1 = 0.25

			if var_92_0 < arg_89_1.time_ and arg_89_1.time_ <= var_92_0 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_2 = arg_89_1:FormatText(StoryNameCfg[13].name)

				arg_89_1.leftNameTxt_.text = var_92_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, true)
				arg_89_1.iconController_:SetSelectedState("hero")

				arg_89_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019_split_6")

				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_3 = arg_89_1:GetWordFromCfg(116021021)
				local var_92_4 = arg_89_1:FormatText(var_92_3.content)

				arg_89_1.text_.text = var_92_4

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_5 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021021", "story_v_out_116021.awb") ~= 0 then
					local var_92_8 = manager.audio:GetVoiceLength("story_v_out_116021", "116021021", "story_v_out_116021.awb") / 1000

					if var_92_8 + var_92_0 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_8 + var_92_0
					end

					if var_92_3.prefab_name ~= "" and arg_89_1.actors_[var_92_3.prefab_name] ~= nil then
						local var_92_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_3.prefab_name].transform, "story_v_out_116021", "116021021", "story_v_out_116021.awb")

						arg_89_1:RecordAudio("116021021", var_92_9)
						arg_89_1:RecordAudio("116021021", var_92_9)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_116021", "116021021", "story_v_out_116021.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_116021", "116021021", "story_v_out_116021.awb")
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
	Play116021022 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 116021022
		arg_93_1.duration_ = 7.366

		local var_93_0 = {
			zh = 7.066,
			ja = 7.366
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
				arg_93_0:Play116021023(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["1019ui_story"]
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 and arg_93_1.var_.characterEffect1019ui_story == nil then
				arg_93_1.var_.characterEffect1019ui_story = var_96_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_2 = 0.2

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_2 then
				local var_96_3 = (arg_93_1.time_ - var_96_1) / var_96_2

				if arg_93_1.var_.characterEffect1019ui_story then
					local var_96_4 = Mathf.Lerp(0, 0.5, var_96_3)

					arg_93_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_93_1.var_.characterEffect1019ui_story.fillRatio = var_96_4
				end
			end

			if arg_93_1.time_ >= var_96_1 + var_96_2 and arg_93_1.time_ < var_96_1 + var_96_2 + arg_96_0 and arg_93_1.var_.characterEffect1019ui_story then
				local var_96_5 = 0.5

				arg_93_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_93_1.var_.characterEffect1019ui_story.fillRatio = var_96_5
			end

			local var_96_6 = 0
			local var_96_7 = 0.675

			if var_96_6 < arg_93_1.time_ and arg_93_1.time_ <= var_96_6 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_8 = arg_93_1:FormatText(StoryNameCfg[9].name)

				arg_93_1.leftNameTxt_.text = var_96_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, true)
				arg_93_1.iconController_:SetSelectedState("hero")

				arg_93_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1039")

				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_9 = arg_93_1:GetWordFromCfg(116021022)
				local var_96_10 = arg_93_1:FormatText(var_96_9.content)

				arg_93_1.text_.text = var_96_10

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_11 = 27
				local var_96_12 = utf8.len(var_96_10)
				local var_96_13 = var_96_11 <= 0 and var_96_7 or var_96_7 * (var_96_12 / var_96_11)

				if var_96_13 > 0 and var_96_7 < var_96_13 then
					arg_93_1.talkMaxDuration = var_96_13

					if var_96_13 + var_96_6 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_13 + var_96_6
					end
				end

				arg_93_1.text_.text = var_96_10
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021022", "story_v_out_116021.awb") ~= 0 then
					local var_96_14 = manager.audio:GetVoiceLength("story_v_out_116021", "116021022", "story_v_out_116021.awb") / 1000

					if var_96_14 + var_96_6 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_14 + var_96_6
					end

					if var_96_9.prefab_name ~= "" and arg_93_1.actors_[var_96_9.prefab_name] ~= nil then
						local var_96_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_9.prefab_name].transform, "story_v_out_116021", "116021022", "story_v_out_116021.awb")

						arg_93_1:RecordAudio("116021022", var_96_15)
						arg_93_1:RecordAudio("116021022", var_96_15)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_116021", "116021022", "story_v_out_116021.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_116021", "116021022", "story_v_out_116021.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_16 = math.max(var_96_7, arg_93_1.talkMaxDuration)

			if var_96_6 <= arg_93_1.time_ and arg_93_1.time_ < var_96_6 + var_96_16 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_6) / var_96_16

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_6 + var_96_16 and arg_93_1.time_ < var_96_6 + var_96_16 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play116021023 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 116021023
		arg_97_1.duration_ = 7.166

		local var_97_0 = {
			zh = 7.166,
			ja = 6.366
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
				arg_97_0:Play116021024(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = 0
			local var_100_1 = 0.65

			if var_100_0 < arg_97_1.time_ and arg_97_1.time_ <= var_100_0 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_2 = arg_97_1:FormatText(StoryNameCfg[13].name)

				arg_97_1.leftNameTxt_.text = var_100_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, true)
				arg_97_1.iconController_:SetSelectedState("hero")

				arg_97_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019_split_6")

				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_3 = arg_97_1:GetWordFromCfg(116021023)
				local var_100_4 = arg_97_1:FormatText(var_100_3.content)

				arg_97_1.text_.text = var_100_4

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_5 = 26
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

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021023", "story_v_out_116021.awb") ~= 0 then
					local var_100_8 = manager.audio:GetVoiceLength("story_v_out_116021", "116021023", "story_v_out_116021.awb") / 1000

					if var_100_8 + var_100_0 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_8 + var_100_0
					end

					if var_100_3.prefab_name ~= "" and arg_97_1.actors_[var_100_3.prefab_name] ~= nil then
						local var_100_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_3.prefab_name].transform, "story_v_out_116021", "116021023", "story_v_out_116021.awb")

						arg_97_1:RecordAudio("116021023", var_100_9)
						arg_97_1:RecordAudio("116021023", var_100_9)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_116021", "116021023", "story_v_out_116021.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_116021", "116021023", "story_v_out_116021.awb")
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
	Play116021024 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 116021024
		arg_101_1.duration_ = 6.399999999999

		local var_101_0 = {
			zh = 6.399999999999,
			ja = 6.266666666666
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
				arg_101_0:Play116021025(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = 1.999999999999

			if var_104_0 < arg_101_1.time_ and arg_101_1.time_ <= var_104_0 + arg_104_0 then
				local var_104_1 = manager.ui.mainCamera.transform.localPosition
				local var_104_2 = Vector3.New(0, 0, 10) + Vector3.New(var_104_1.x, var_104_1.y, 0)
				local var_104_3 = arg_101_1.bgs_.ST07b

				var_104_3.transform.localPosition = var_104_2
				var_104_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_104_4 = var_104_3:GetComponent("SpriteRenderer")

				if var_104_4 and var_104_4.sprite then
					local var_104_5 = (var_104_3.transform.localPosition - var_104_1).z
					local var_104_6 = manager.ui.mainCameraCom_
					local var_104_7 = 2 * var_104_5 * Mathf.Tan(var_104_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_104_8 = var_104_7 * var_104_6.aspect
					local var_104_9 = var_104_4.sprite.bounds.size.x
					local var_104_10 = var_104_4.sprite.bounds.size.y
					local var_104_11 = var_104_8 / var_104_9
					local var_104_12 = var_104_7 / var_104_10
					local var_104_13 = var_104_12 < var_104_11 and var_104_11 or var_104_12

					var_104_3.transform.localScale = Vector3.New(var_104_13, var_104_13, 0)
				end

				for iter_104_0, iter_104_1 in pairs(arg_101_1.bgs_) do
					if iter_104_0 ~= "ST07b" then
						iter_104_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_104_14 = "1037ui_story"

			if arg_101_1.actors_[var_104_14] == nil then
				local var_104_15 = Object.Instantiate(Asset.Load("Char/" .. var_104_14), arg_101_1.stage_.transform)

				var_104_15.name = var_104_14
				var_104_15.transform.localPosition = Vector3.New(0, 100, 0)
				arg_101_1.actors_[var_104_14] = var_104_15

				local var_104_16 = var_104_15:GetComponentInChildren(typeof(CharacterEffect))

				var_104_16.enabled = true

				local var_104_17 = GameObjectTools.GetOrAddComponent(var_104_15, typeof(DynamicBoneHelper))

				if var_104_17 then
					var_104_17:EnableDynamicBone(false)
				end

				arg_101_1:ShowWeapon(var_104_16.transform, false)

				arg_101_1.var_[var_104_14 .. "Animator"] = var_104_16.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_101_1.var_[var_104_14 .. "Animator"].applyRootMotion = true
				arg_101_1.var_[var_104_14 .. "LipSync"] = var_104_16.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_104_18 = arg_101_1.actors_["1037ui_story"].transform
			local var_104_19 = 3.8

			if var_104_19 < arg_101_1.time_ and arg_101_1.time_ <= var_104_19 + arg_104_0 then
				arg_101_1.var_.moveOldPos1037ui_story = var_104_18.localPosition
			end

			local var_104_20 = 0.001

			if var_104_19 <= arg_101_1.time_ and arg_101_1.time_ < var_104_19 + var_104_20 then
				local var_104_21 = (arg_101_1.time_ - var_104_19) / var_104_20
				local var_104_22 = Vector3.New(0, -1.09, -5.81)

				var_104_18.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos1037ui_story, var_104_22, var_104_21)

				local var_104_23 = manager.ui.mainCamera.transform.position - var_104_18.position

				var_104_18.forward = Vector3.New(var_104_23.x, var_104_23.y, var_104_23.z)

				local var_104_24 = var_104_18.localEulerAngles

				var_104_24.z = 0
				var_104_24.x = 0
				var_104_18.localEulerAngles = var_104_24
			end

			if arg_101_1.time_ >= var_104_19 + var_104_20 and arg_101_1.time_ < var_104_19 + var_104_20 + arg_104_0 then
				var_104_18.localPosition = Vector3.New(0, -1.09, -5.81)

				local var_104_25 = manager.ui.mainCamera.transform.position - var_104_18.position

				var_104_18.forward = Vector3.New(var_104_25.x, var_104_25.y, var_104_25.z)

				local var_104_26 = var_104_18.localEulerAngles

				var_104_26.z = 0
				var_104_26.x = 0
				var_104_18.localEulerAngles = var_104_26
			end

			local var_104_27 = arg_101_1.actors_["1037ui_story"]
			local var_104_28 = 3.8

			if var_104_28 < arg_101_1.time_ and arg_101_1.time_ <= var_104_28 + arg_104_0 and arg_101_1.var_.characterEffect1037ui_story == nil then
				arg_101_1.var_.characterEffect1037ui_story = var_104_27:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_29 = 0.2

			if var_104_28 <= arg_101_1.time_ and arg_101_1.time_ < var_104_28 + var_104_29 then
				local var_104_30 = (arg_101_1.time_ - var_104_28) / var_104_29

				if arg_101_1.var_.characterEffect1037ui_story then
					arg_101_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_101_1.time_ >= var_104_28 + var_104_29 and arg_101_1.time_ < var_104_28 + var_104_29 + arg_104_0 and arg_101_1.var_.characterEffect1037ui_story then
				arg_101_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_104_31 = 3.8

			if var_104_31 < arg_101_1.time_ and arg_101_1.time_ <= var_104_31 + arg_104_0 then
				arg_101_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037action/1037action2_1")
			end

			local var_104_32 = 3.8

			if var_104_32 < arg_101_1.time_ and arg_101_1.time_ <= var_104_32 + arg_104_0 then
				arg_101_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_104_33 = 0

			if var_104_33 < arg_101_1.time_ and arg_101_1.time_ <= var_104_33 + arg_104_0 then
				arg_101_1.mask_.enabled = true
				arg_101_1.mask_.raycastTarget = true

				arg_101_1:SetGaussion(false)
			end

			local var_104_34 = 2

			if var_104_33 <= arg_101_1.time_ and arg_101_1.time_ < var_104_33 + var_104_34 then
				local var_104_35 = (arg_101_1.time_ - var_104_33) / var_104_34
				local var_104_36 = Color.New(0, 0, 0)

				var_104_36.a = Mathf.Lerp(0, 1, var_104_35)
				arg_101_1.mask_.color = var_104_36
			end

			if arg_101_1.time_ >= var_104_33 + var_104_34 and arg_101_1.time_ < var_104_33 + var_104_34 + arg_104_0 then
				local var_104_37 = Color.New(0, 0, 0)

				var_104_37.a = 1
				arg_101_1.mask_.color = var_104_37
			end

			local var_104_38 = 2

			if var_104_38 < arg_101_1.time_ and arg_101_1.time_ <= var_104_38 + arg_104_0 then
				arg_101_1.mask_.enabled = true
				arg_101_1.mask_.raycastTarget = true

				arg_101_1:SetGaussion(false)
			end

			local var_104_39 = 2

			if var_104_38 <= arg_101_1.time_ and arg_101_1.time_ < var_104_38 + var_104_39 then
				local var_104_40 = (arg_101_1.time_ - var_104_38) / var_104_39
				local var_104_41 = Color.New(0, 0, 0)

				var_104_41.a = Mathf.Lerp(1, 0, var_104_40)
				arg_101_1.mask_.color = var_104_41
			end

			if arg_101_1.time_ >= var_104_38 + var_104_39 and arg_101_1.time_ < var_104_38 + var_104_39 + arg_104_0 then
				local var_104_42 = Color.New(0, 0, 0)
				local var_104_43 = 0

				arg_101_1.mask_.enabled = false
				var_104_42.a = var_104_43
				arg_101_1.mask_.color = var_104_42
			end

			if arg_101_1.frameCnt_ <= 1 then
				arg_101_1.dialog_:SetActive(false)
			end

			local var_104_44 = 3.999999999999
			local var_104_45 = 0.25

			if var_104_44 < arg_101_1.time_ and arg_101_1.time_ <= var_104_44 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0

				arg_101_1.dialog_:SetActive(true)

				local var_104_46 = LeanTween.value(arg_101_1.dialog_, 0, 1, 0.3)

				var_104_46:setOnUpdate(LuaHelper.FloatAction(function(arg_105_0)
					arg_101_1.dialogCg_.alpha = arg_105_0
				end))
				var_104_46:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_101_1.dialog_)
					var_104_46:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_101_1.duration_ = arg_101_1.duration_ + 0.3

				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_47 = arg_101_1:FormatText(StoryNameCfg[15].name)

				arg_101_1.leftNameTxt_.text = var_104_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_48 = arg_101_1:GetWordFromCfg(116021024)
				local var_104_49 = arg_101_1:FormatText(var_104_48.content)

				arg_101_1.text_.text = var_104_49

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_50 = 10
				local var_104_51 = utf8.len(var_104_49)
				local var_104_52 = var_104_50 <= 0 and var_104_45 or var_104_45 * (var_104_51 / var_104_50)

				if var_104_52 > 0 and var_104_45 < var_104_52 then
					arg_101_1.talkMaxDuration = var_104_52
					var_104_44 = var_104_44 + 0.3

					if var_104_52 + var_104_44 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_52 + var_104_44
					end
				end

				arg_101_1.text_.text = var_104_49
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021024", "story_v_out_116021.awb") ~= 0 then
					local var_104_53 = manager.audio:GetVoiceLength("story_v_out_116021", "116021024", "story_v_out_116021.awb") / 1000

					if var_104_53 + var_104_44 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_53 + var_104_44
					end

					if var_104_48.prefab_name ~= "" and arg_101_1.actors_[var_104_48.prefab_name] ~= nil then
						local var_104_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_48.prefab_name].transform, "story_v_out_116021", "116021024", "story_v_out_116021.awb")

						arg_101_1:RecordAudio("116021024", var_104_54)
						arg_101_1:RecordAudio("116021024", var_104_54)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_116021", "116021024", "story_v_out_116021.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_116021", "116021024", "story_v_out_116021.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_55 = var_104_44 + 0.3
			local var_104_56 = math.max(var_104_45, arg_101_1.talkMaxDuration)

			if var_104_55 <= arg_101_1.time_ and arg_101_1.time_ < var_104_55 + var_104_56 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_55) / var_104_56

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_55 + var_104_56 and arg_101_1.time_ < var_104_55 + var_104_56 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play116021025 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 116021025
		arg_107_1.duration_ = 5.366

		local var_107_0 = {
			zh = 5.366,
			ja = 4.966
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
				arg_107_0:Play116021026(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = 0

			if var_110_0 < arg_107_1.time_ and arg_107_1.time_ <= var_110_0 + arg_110_0 then
				arg_107_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037action/1037action2_2")
			end

			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 then
				arg_107_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_110_2 = 0
			local var_110_3 = 0.6

			if var_110_2 < arg_107_1.time_ and arg_107_1.time_ <= var_110_2 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_4 = arg_107_1:FormatText(StoryNameCfg[15].name)

				arg_107_1.leftNameTxt_.text = var_110_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_5 = arg_107_1:GetWordFromCfg(116021025)
				local var_110_6 = arg_107_1:FormatText(var_110_5.content)

				arg_107_1.text_.text = var_110_6

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_7 = 24
				local var_110_8 = utf8.len(var_110_6)
				local var_110_9 = var_110_7 <= 0 and var_110_3 or var_110_3 * (var_110_8 / var_110_7)

				if var_110_9 > 0 and var_110_3 < var_110_9 then
					arg_107_1.talkMaxDuration = var_110_9

					if var_110_9 + var_110_2 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_9 + var_110_2
					end
				end

				arg_107_1.text_.text = var_110_6
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021025", "story_v_out_116021.awb") ~= 0 then
					local var_110_10 = manager.audio:GetVoiceLength("story_v_out_116021", "116021025", "story_v_out_116021.awb") / 1000

					if var_110_10 + var_110_2 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_10 + var_110_2
					end

					if var_110_5.prefab_name ~= "" and arg_107_1.actors_[var_110_5.prefab_name] ~= nil then
						local var_110_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_5.prefab_name].transform, "story_v_out_116021", "116021025", "story_v_out_116021.awb")

						arg_107_1:RecordAudio("116021025", var_110_11)
						arg_107_1:RecordAudio("116021025", var_110_11)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_116021", "116021025", "story_v_out_116021.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_116021", "116021025", "story_v_out_116021.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_12 = math.max(var_110_3, arg_107_1.talkMaxDuration)

			if var_110_2 <= arg_107_1.time_ and arg_107_1.time_ < var_110_2 + var_110_12 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_2) / var_110_12

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_2 + var_110_12 and arg_107_1.time_ < var_110_2 + var_110_12 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play116021026 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 116021026
		arg_111_1.duration_ = 6.833

		local var_111_0 = {
			zh = 5.9,
			ja = 6.833
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
				arg_111_0:Play116021027(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["1037ui_story"]
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 and arg_111_1.var_.characterEffect1037ui_story == nil then
				arg_111_1.var_.characterEffect1037ui_story = var_114_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_2 = 0.2

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2

				if arg_111_1.var_.characterEffect1037ui_story then
					local var_114_4 = Mathf.Lerp(0, 0.5, var_114_3)

					arg_111_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_111_1.var_.characterEffect1037ui_story.fillRatio = var_114_4
				end
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 and arg_111_1.var_.characterEffect1037ui_story then
				local var_114_5 = 0.5

				arg_111_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_111_1.var_.characterEffect1037ui_story.fillRatio = var_114_5
			end

			local var_114_6 = 0
			local var_114_7 = 0.675

			if var_114_6 < arg_111_1.time_ and arg_111_1.time_ <= var_114_6 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_8 = arg_111_1:FormatText(StoryNameCfg[9].name)

				arg_111_1.leftNameTxt_.text = var_114_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, true)
				arg_111_1.iconController_:SetSelectedState("hero")

				arg_111_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1039")

				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_9 = arg_111_1:GetWordFromCfg(116021026)
				local var_114_10 = arg_111_1:FormatText(var_114_9.content)

				arg_111_1.text_.text = var_114_10

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_11 = 27
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

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021026", "story_v_out_116021.awb") ~= 0 then
					local var_114_14 = manager.audio:GetVoiceLength("story_v_out_116021", "116021026", "story_v_out_116021.awb") / 1000

					if var_114_14 + var_114_6 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_14 + var_114_6
					end

					if var_114_9.prefab_name ~= "" and arg_111_1.actors_[var_114_9.prefab_name] ~= nil then
						local var_114_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_9.prefab_name].transform, "story_v_out_116021", "116021026", "story_v_out_116021.awb")

						arg_111_1:RecordAudio("116021026", var_114_15)
						arg_111_1:RecordAudio("116021026", var_114_15)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_116021", "116021026", "story_v_out_116021.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_116021", "116021026", "story_v_out_116021.awb")
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
	Play116021027 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 116021027
		arg_115_1.duration_ = 0.016666666666

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"

			SetActive(arg_115_1.choicesGo_, true)

			for iter_116_0, iter_116_1 in ipairs(arg_115_1.choices_) do
				local var_116_0 = iter_116_0 <= 2

				SetActive(iter_116_1.go, var_116_0)
			end

			arg_115_1.choices_[1].txt.text = arg_115_1:FormatText(StoryChoiceCfg[225].name)
			arg_115_1.choices_[2].txt.text = arg_115_1:FormatText(StoryChoiceCfg[226].name)
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play116021028(arg_115_1)
			end

			if arg_117_0 == 2 then
				arg_115_0:Play116021028(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			return
		end
	end,
	Play116021028 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 116021028
		arg_119_1.duration_ = 3.266

		local var_119_0 = {
			zh = 3.266,
			ja = 2.633
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
				arg_119_0:Play116021029(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0
			local var_122_1 = 0.2

			if var_122_0 < arg_119_1.time_ and arg_119_1.time_ <= var_122_0 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0

				arg_119_1.dialog_:SetActive(true)

				local var_122_2 = LeanTween.value(arg_119_1.dialog_, 0, 1, 0.3)

				var_122_2:setOnUpdate(LuaHelper.FloatAction(function(arg_123_0)
					arg_119_1.dialogCg_.alpha = arg_123_0
				end))
				var_122_2:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_119_1.dialog_)
					var_122_2:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_119_1.duration_ = arg_119_1.duration_ + 0.3

				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_3 = arg_119_1:FormatText(StoryNameCfg[9].name)

				arg_119_1.leftNameTxt_.text = var_122_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, true)
				arg_119_1.iconController_:SetSelectedState("hero")

				arg_119_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1039")

				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_4 = arg_119_1:GetWordFromCfg(116021028)
				local var_122_5 = arg_119_1:FormatText(var_122_4.content)

				arg_119_1.text_.text = var_122_5

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_6 = 8
				local var_122_7 = utf8.len(var_122_5)
				local var_122_8 = var_122_6 <= 0 and var_122_1 or var_122_1 * (var_122_7 / var_122_6)

				if var_122_8 > 0 and var_122_1 < var_122_8 then
					arg_119_1.talkMaxDuration = var_122_8
					var_122_0 = var_122_0 + 0.3

					if var_122_8 + var_122_0 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_8 + var_122_0
					end
				end

				arg_119_1.text_.text = var_122_5
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021028", "story_v_out_116021.awb") ~= 0 then
					local var_122_9 = manager.audio:GetVoiceLength("story_v_out_116021", "116021028", "story_v_out_116021.awb") / 1000

					if var_122_9 + var_122_0 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_9 + var_122_0
					end

					if var_122_4.prefab_name ~= "" and arg_119_1.actors_[var_122_4.prefab_name] ~= nil then
						local var_122_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_4.prefab_name].transform, "story_v_out_116021", "116021028", "story_v_out_116021.awb")

						arg_119_1:RecordAudio("116021028", var_122_10)
						arg_119_1:RecordAudio("116021028", var_122_10)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_116021", "116021028", "story_v_out_116021.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_116021", "116021028", "story_v_out_116021.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_11 = var_122_0 + 0.3
			local var_122_12 = math.max(var_122_1, arg_119_1.talkMaxDuration)

			if var_122_11 <= arg_119_1.time_ and arg_119_1.time_ < var_122_11 + var_122_12 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_11) / var_122_12

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_11 + var_122_12 and arg_119_1.time_ < var_122_11 + var_122_12 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play116021029 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 116021029
		arg_125_1.duration_ = 9

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play116021030(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["1037ui_story"].transform
			local var_128_1 = 1.966

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 then
				arg_125_1.var_.moveOldPos1037ui_story = var_128_0.localPosition
			end

			local var_128_2 = 0.001

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2
				local var_128_4 = Vector3.New(0, 100, 0)

				var_128_0.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos1037ui_story, var_128_4, var_128_3)

				local var_128_5 = manager.ui.mainCamera.transform.position - var_128_0.position

				var_128_0.forward = Vector3.New(var_128_5.x, var_128_5.y, var_128_5.z)

				local var_128_6 = var_128_0.localEulerAngles

				var_128_6.z = 0
				var_128_6.x = 0
				var_128_0.localEulerAngles = var_128_6
			end

			if arg_125_1.time_ >= var_128_1 + var_128_2 and arg_125_1.time_ < var_128_1 + var_128_2 + arg_128_0 then
				var_128_0.localPosition = Vector3.New(0, 100, 0)

				local var_128_7 = manager.ui.mainCamera.transform.position - var_128_0.position

				var_128_0.forward = Vector3.New(var_128_7.x, var_128_7.y, var_128_7.z)

				local var_128_8 = var_128_0.localEulerAngles

				var_128_8.z = 0
				var_128_8.x = 0
				var_128_0.localEulerAngles = var_128_8
			end

			local var_128_9 = 0

			if var_128_9 < arg_125_1.time_ and arg_125_1.time_ <= var_128_9 + arg_128_0 then
				arg_125_1.mask_.enabled = true
				arg_125_1.mask_.raycastTarget = true

				arg_125_1:SetGaussion(false)
			end

			local var_128_10 = 2

			if var_128_9 <= arg_125_1.time_ and arg_125_1.time_ < var_128_9 + var_128_10 then
				local var_128_11 = (arg_125_1.time_ - var_128_9) / var_128_10
				local var_128_12 = Color.New(0, 0, 0)

				var_128_12.a = Mathf.Lerp(0, 1, var_128_11)
				arg_125_1.mask_.color = var_128_12
			end

			if arg_125_1.time_ >= var_128_9 + var_128_10 and arg_125_1.time_ < var_128_9 + var_128_10 + arg_128_0 then
				local var_128_13 = Color.New(0, 0, 0)

				var_128_13.a = 1
				arg_125_1.mask_.color = var_128_13
			end

			local var_128_14 = 2

			if var_128_14 < arg_125_1.time_ and arg_125_1.time_ <= var_128_14 + arg_128_0 then
				arg_125_1.mask_.enabled = true
				arg_125_1.mask_.raycastTarget = true

				arg_125_1:SetGaussion(false)
			end

			local var_128_15 = 2

			if var_128_14 <= arg_125_1.time_ and arg_125_1.time_ < var_128_14 + var_128_15 then
				local var_128_16 = (arg_125_1.time_ - var_128_14) / var_128_15
				local var_128_17 = Color.New(0, 0, 0)

				var_128_17.a = Mathf.Lerp(1, 0, var_128_16)
				arg_125_1.mask_.color = var_128_17
			end

			if arg_125_1.time_ >= var_128_14 + var_128_15 and arg_125_1.time_ < var_128_14 + var_128_15 + arg_128_0 then
				local var_128_18 = Color.New(0, 0, 0)
				local var_128_19 = 0

				arg_125_1.mask_.enabled = false
				var_128_18.a = var_128_19
				arg_125_1.mask_.color = var_128_18
			end

			local var_128_20 = "B13"

			if arg_125_1.bgs_[var_128_20] == nil then
				local var_128_21 = Object.Instantiate(arg_125_1.paintGo_)

				var_128_21:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_128_20)
				var_128_21.name = var_128_20
				var_128_21.transform.parent = arg_125_1.stage_.transform
				var_128_21.transform.localPosition = Vector3.New(0, 100, 0)
				arg_125_1.bgs_[var_128_20] = var_128_21
			end

			local var_128_22 = 2

			if var_128_22 < arg_125_1.time_ and arg_125_1.time_ <= var_128_22 + arg_128_0 then
				local var_128_23 = manager.ui.mainCamera.transform.localPosition
				local var_128_24 = Vector3.New(0, 0, 10) + Vector3.New(var_128_23.x, var_128_23.y, 0)
				local var_128_25 = arg_125_1.bgs_.B13

				var_128_25.transform.localPosition = var_128_24
				var_128_25.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_128_26 = var_128_25:GetComponent("SpriteRenderer")

				if var_128_26 and var_128_26.sprite then
					local var_128_27 = (var_128_25.transform.localPosition - var_128_23).z
					local var_128_28 = manager.ui.mainCameraCom_
					local var_128_29 = 2 * var_128_27 * Mathf.Tan(var_128_28.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_128_30 = var_128_29 * var_128_28.aspect
					local var_128_31 = var_128_26.sprite.bounds.size.x
					local var_128_32 = var_128_26.sprite.bounds.size.y
					local var_128_33 = var_128_30 / var_128_31
					local var_128_34 = var_128_29 / var_128_32
					local var_128_35 = var_128_34 < var_128_33 and var_128_33 or var_128_34

					var_128_25.transform.localScale = Vector3.New(var_128_35, var_128_35, 0)
				end

				for iter_128_0, iter_128_1 in pairs(arg_125_1.bgs_) do
					if iter_128_0 ~= "B13" then
						iter_128_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			if arg_125_1.frameCnt_ <= 1 then
				arg_125_1.dialog_:SetActive(false)
			end

			local var_128_36 = 4
			local var_128_37 = 0.425

			if var_128_36 < arg_125_1.time_ and arg_125_1.time_ <= var_128_36 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0

				arg_125_1.dialog_:SetActive(true)

				local var_128_38 = LeanTween.value(arg_125_1.dialog_, 0, 1, 0.3)

				var_128_38:setOnUpdate(LuaHelper.FloatAction(function(arg_129_0)
					arg_125_1.dialogCg_.alpha = arg_129_0
				end))
				var_128_38:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_125_1.dialog_)
					var_128_38:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_125_1.duration_ = arg_125_1.duration_ + 0.3

				SetActive(arg_125_1.leftNameGo_, false)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_39 = arg_125_1:GetWordFromCfg(116021029)
				local var_128_40 = arg_125_1:FormatText(var_128_39.content)

				arg_125_1.text_.text = var_128_40

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_41 = 17
				local var_128_42 = utf8.len(var_128_40)
				local var_128_43 = var_128_41 <= 0 and var_128_37 or var_128_37 * (var_128_42 / var_128_41)

				if var_128_43 > 0 and var_128_37 < var_128_43 then
					arg_125_1.talkMaxDuration = var_128_43
					var_128_36 = var_128_36 + 0.3

					if var_128_43 + var_128_36 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_43 + var_128_36
					end
				end

				arg_125_1.text_.text = var_128_40
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)
				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_44 = var_128_36 + 0.3
			local var_128_45 = math.max(var_128_37, arg_125_1.talkMaxDuration)

			if var_128_44 <= arg_125_1.time_ and arg_125_1.time_ < var_128_44 + var_128_45 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_44) / var_128_45

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_44 + var_128_45 and arg_125_1.time_ < var_128_44 + var_128_45 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play116021030 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 116021030
		arg_131_1.duration_ = 5

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play116021031(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = 0
			local var_134_1 = 1.475

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

				local var_134_2 = arg_131_1:GetWordFromCfg(116021030)
				local var_134_3 = arg_131_1:FormatText(var_134_2.content)

				arg_131_1.text_.text = var_134_3

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_4 = 59
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
	Play116021031 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 116021031
		arg_135_1.duration_ = 9

		SetActive(arg_135_1.tipsGo_, false)

		function arg_135_1.onSingleLineFinish_()
			arg_135_1.onSingleLineUpdate_ = nil
			arg_135_1.onSingleLineFinish_ = nil
			arg_135_1.state_ = "waiting"
		end

		function arg_135_1.playNext_(arg_137_0)
			if arg_137_0 == 1 then
				arg_135_0:Play116021032(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = "SK0105"

			if arg_135_1.bgs_[var_138_0] == nil then
				local var_138_1 = Object.Instantiate(arg_135_1.paintGo_)

				var_138_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_138_0)
				var_138_1.name = var_138_0
				var_138_1.transform.parent = arg_135_1.stage_.transform
				var_138_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_135_1.bgs_[var_138_0] = var_138_1
			end

			local var_138_2 = 2

			if var_138_2 < arg_135_1.time_ and arg_135_1.time_ <= var_138_2 + arg_138_0 then
				local var_138_3 = manager.ui.mainCamera.transform.localPosition
				local var_138_4 = Vector3.New(0, 0, 10) + Vector3.New(var_138_3.x, var_138_3.y, 0)
				local var_138_5 = arg_135_1.bgs_.SK0105

				var_138_5.transform.localPosition = var_138_4
				var_138_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_138_6 = var_138_5:GetComponent("SpriteRenderer")

				if var_138_6 and var_138_6.sprite then
					local var_138_7 = (var_138_5.transform.localPosition - var_138_3).z
					local var_138_8 = manager.ui.mainCameraCom_
					local var_138_9 = 2 * var_138_7 * Mathf.Tan(var_138_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_138_10 = var_138_9 * var_138_8.aspect
					local var_138_11 = var_138_6.sprite.bounds.size.x
					local var_138_12 = var_138_6.sprite.bounds.size.y
					local var_138_13 = var_138_10 / var_138_11
					local var_138_14 = var_138_9 / var_138_12
					local var_138_15 = var_138_14 < var_138_13 and var_138_13 or var_138_14

					var_138_5.transform.localScale = Vector3.New(var_138_15, var_138_15, 0)
				end

				for iter_138_0, iter_138_1 in pairs(arg_135_1.bgs_) do
					if iter_138_0 ~= "SK0105" then
						iter_138_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_138_16 = 2

			if var_138_16 < arg_135_1.time_ and arg_135_1.time_ <= var_138_16 + arg_138_0 then
				arg_135_1.mask_.enabled = true
				arg_135_1.mask_.raycastTarget = true

				arg_135_1:SetGaussion(false)
			end

			local var_138_17 = 2

			if var_138_16 <= arg_135_1.time_ and arg_135_1.time_ < var_138_16 + var_138_17 then
				local var_138_18 = (arg_135_1.time_ - var_138_16) / var_138_17
				local var_138_19 = Color.New(0, 0, 0)

				var_138_19.a = Mathf.Lerp(1, 0, var_138_18)
				arg_135_1.mask_.color = var_138_19
			end

			if arg_135_1.time_ >= var_138_16 + var_138_17 and arg_135_1.time_ < var_138_16 + var_138_17 + arg_138_0 then
				local var_138_20 = Color.New(0, 0, 0)
				local var_138_21 = 0

				arg_135_1.mask_.enabled = false
				var_138_20.a = var_138_21
				arg_135_1.mask_.color = var_138_20
			end

			local var_138_22 = 0

			if var_138_22 < arg_135_1.time_ and arg_135_1.time_ <= var_138_22 + arg_138_0 then
				arg_135_1.mask_.enabled = true
				arg_135_1.mask_.raycastTarget = true

				arg_135_1:SetGaussion(false)
			end

			local var_138_23 = 2

			if var_138_22 <= arg_135_1.time_ and arg_135_1.time_ < var_138_22 + var_138_23 then
				local var_138_24 = (arg_135_1.time_ - var_138_22) / var_138_23
				local var_138_25 = Color.New(0, 0, 0)

				var_138_25.a = Mathf.Lerp(0, 1, var_138_24)
				arg_135_1.mask_.color = var_138_25
			end

			if arg_135_1.time_ >= var_138_22 + var_138_23 and arg_135_1.time_ < var_138_22 + var_138_23 + arg_138_0 then
				local var_138_26 = Color.New(0, 0, 0)

				var_138_26.a = 1
				arg_135_1.mask_.color = var_138_26
			end

			local var_138_27 = arg_135_1.bgs_.SK0105.transform
			local var_138_28 = 2

			if var_138_28 < arg_135_1.time_ and arg_135_1.time_ <= var_138_28 + arg_138_0 then
				arg_135_1.var_.moveOldPosSK0105 = var_138_27.localPosition
			end

			local var_138_29 = 0.001

			if var_138_28 <= arg_135_1.time_ and arg_135_1.time_ < var_138_28 + var_138_29 then
				local var_138_30 = (arg_135_1.time_ - var_138_28) / var_138_29
				local var_138_31 = Vector3.New(0.5, 2, 1.5)

				var_138_27.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPosSK0105, var_138_31, var_138_30)
			end

			if arg_135_1.time_ >= var_138_28 + var_138_29 and arg_135_1.time_ < var_138_28 + var_138_29 + arg_138_0 then
				var_138_27.localPosition = Vector3.New(0.5, 2, 1.5)
			end

			local var_138_32 = arg_135_1.bgs_.SK0105.transform
			local var_138_33 = 2.034

			if var_138_33 < arg_135_1.time_ and arg_135_1.time_ <= var_138_33 + arg_138_0 then
				arg_135_1.var_.moveOldPosSK0105 = var_138_32.localPosition
			end

			local var_138_34 = 6.5

			if var_138_33 <= arg_135_1.time_ and arg_135_1.time_ < var_138_33 + var_138_34 then
				local var_138_35 = (arg_135_1.time_ - var_138_33) / var_138_34
				local var_138_36 = Vector3.New(0.5, 1, 1.5)

				var_138_32.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPosSK0105, var_138_36, var_138_35)
			end

			if arg_135_1.time_ >= var_138_33 + var_138_34 and arg_135_1.time_ < var_138_33 + var_138_34 + arg_138_0 then
				var_138_32.localPosition = Vector3.New(0.5, 1, 1.5)
			end

			local var_138_37 = 4

			if var_138_37 < arg_135_1.time_ and arg_135_1.time_ <= var_138_37 + arg_138_0 then
				arg_135_1.allBtn_.enabled = false
			end

			local var_138_38 = 4.534

			if arg_135_1.time_ >= var_138_37 + var_138_38 and arg_135_1.time_ < var_138_37 + var_138_38 + arg_138_0 then
				arg_135_1.allBtn_.enabled = true
			end

			if arg_135_1.frameCnt_ <= 1 then
				arg_135_1.dialog_:SetActive(false)
			end

			local var_138_39 = 4
			local var_138_40 = 0.6

			if var_138_39 < arg_135_1.time_ and arg_135_1.time_ <= var_138_39 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0

				arg_135_1.dialog_:SetActive(true)

				local var_138_41 = LeanTween.value(arg_135_1.dialog_, 0, 1, 0.3)

				var_138_41:setOnUpdate(LuaHelper.FloatAction(function(arg_139_0)
					arg_135_1.dialogCg_.alpha = arg_139_0
				end))
				var_138_41:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_135_1.dialog_)
					var_138_41:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_135_1.duration_ = arg_135_1.duration_ + 0.3

				SetActive(arg_135_1.leftNameGo_, false)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_42 = arg_135_1:GetWordFromCfg(116021031)
				local var_138_43 = arg_135_1:FormatText(var_138_42.content)

				arg_135_1.text_.text = var_138_43

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_44 = 44
				local var_138_45 = utf8.len(var_138_43)
				local var_138_46 = var_138_44 <= 0 and var_138_40 or var_138_40 * (var_138_45 / var_138_44)

				if var_138_46 > 0 and var_138_40 < var_138_46 then
					arg_135_1.talkMaxDuration = var_138_46
					var_138_39 = var_138_39 + 0.3

					if var_138_46 + var_138_39 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_46 + var_138_39
					end
				end

				arg_135_1.text_.text = var_138_43
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)
				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_47 = var_138_39 + 0.3
			local var_138_48 = math.max(var_138_40, arg_135_1.talkMaxDuration)

			if var_138_47 <= arg_135_1.time_ and arg_135_1.time_ < var_138_47 + var_138_48 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_47) / var_138_48

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_47 + var_138_48 and arg_135_1.time_ < var_138_47 + var_138_48 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play116021032 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 116021032
		arg_141_1.duration_ = 0.999999999999

		SetActive(arg_141_1.tipsGo_, false)

		function arg_141_1.onSingleLineFinish_()
			arg_141_1.onSingleLineUpdate_ = nil
			arg_141_1.onSingleLineFinish_ = nil
			arg_141_1.state_ = "waiting"
		end

		function arg_141_1.playNext_(arg_143_0)
			if arg_143_0 == 1 then
				arg_141_0:Play116021033(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = 0
			local var_144_1 = 1

			if var_144_0 < arg_141_1.time_ and arg_141_1.time_ <= var_144_0 + arg_144_0 then
				local var_144_2 = "play"
				local var_144_3 = "effect"

				arg_141_1:AudioAction(var_144_2, var_144_3, "se_story_16", "se_story_16_door06", "")
			end

			local var_144_4 = 0
			local var_144_5 = 0.05

			if var_144_4 < arg_141_1.time_ and arg_141_1.time_ <= var_144_4 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_6 = arg_141_1:FormatText(StoryNameCfg[319].name)

				arg_141_1.leftNameTxt_.text = var_144_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, true)
				arg_141_1.iconController_:SetSelectedState("hero")

				arg_141_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1029")

				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_7 = arg_141_1:GetWordFromCfg(116021032)
				local var_144_8 = arg_141_1:FormatText(var_144_7.content)

				arg_141_1.text_.text = var_144_8

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_9 = 2
				local var_144_10 = utf8.len(var_144_8)
				local var_144_11 = var_144_9 <= 0 and var_144_5 or var_144_5 * (var_144_10 / var_144_9)

				if var_144_11 > 0 and var_144_5 < var_144_11 then
					arg_141_1.talkMaxDuration = var_144_11

					if var_144_11 + var_144_4 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_11 + var_144_4
					end
				end

				arg_141_1.text_.text = var_144_8
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021032", "story_v_out_116021.awb") ~= 0 then
					local var_144_12 = manager.audio:GetVoiceLength("story_v_out_116021", "116021032", "story_v_out_116021.awb") / 1000

					if var_144_12 + var_144_4 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_12 + var_144_4
					end

					if var_144_7.prefab_name ~= "" and arg_141_1.actors_[var_144_7.prefab_name] ~= nil then
						local var_144_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_7.prefab_name].transform, "story_v_out_116021", "116021032", "story_v_out_116021.awb")

						arg_141_1:RecordAudio("116021032", var_144_13)
						arg_141_1:RecordAudio("116021032", var_144_13)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_116021", "116021032", "story_v_out_116021.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_116021", "116021032", "story_v_out_116021.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_14 = math.max(var_144_5, arg_141_1.talkMaxDuration)

			if var_144_4 <= arg_141_1.time_ and arg_141_1.time_ < var_144_4 + var_144_14 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_4) / var_144_14

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_4 + var_144_14 and arg_141_1.time_ < var_144_4 + var_144_14 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play116021033 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 116021033
		arg_145_1.duration_ = 5

		SetActive(arg_145_1.tipsGo_, false)

		function arg_145_1.onSingleLineFinish_()
			arg_145_1.onSingleLineUpdate_ = nil
			arg_145_1.onSingleLineFinish_ = nil
			arg_145_1.state_ = "waiting"
		end

		function arg_145_1.playNext_(arg_147_0)
			if arg_147_0 == 1 then
				arg_145_0:Play116021034(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = 0
			local var_148_1 = 1.675

			if var_148_0 < arg_145_1.time_ and arg_145_1.time_ <= var_148_0 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, false)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_2 = arg_145_1:GetWordFromCfg(116021033)
				local var_148_3 = arg_145_1:FormatText(var_148_2.content)

				arg_145_1.text_.text = var_148_3

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_4 = 67
				local var_148_5 = utf8.len(var_148_3)
				local var_148_6 = var_148_4 <= 0 and var_148_1 or var_148_1 * (var_148_5 / var_148_4)

				if var_148_6 > 0 and var_148_1 < var_148_6 then
					arg_145_1.talkMaxDuration = var_148_6

					if var_148_6 + var_148_0 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_6 + var_148_0
					end
				end

				arg_145_1.text_.text = var_148_3
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)
				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_7 = math.max(var_148_1, arg_145_1.talkMaxDuration)

			if var_148_0 <= arg_145_1.time_ and arg_145_1.time_ < var_148_0 + var_148_7 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_0) / var_148_7

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_0 + var_148_7 and arg_145_1.time_ < var_148_0 + var_148_7 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play116021034 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 116021034
		arg_149_1.duration_ = 5

		SetActive(arg_149_1.tipsGo_, false)

		function arg_149_1.onSingleLineFinish_()
			arg_149_1.onSingleLineUpdate_ = nil
			arg_149_1.onSingleLineFinish_ = nil
			arg_149_1.state_ = "waiting"
		end

		function arg_149_1.playNext_(arg_151_0)
			if arg_151_0 == 1 then
				arg_149_0:Play116021035(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = 0
			local var_152_1 = 1.55

			if var_152_0 < arg_149_1.time_ and arg_149_1.time_ <= var_152_0 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, false)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_2 = arg_149_1:GetWordFromCfg(116021034)
				local var_152_3 = arg_149_1:FormatText(var_152_2.content)

				arg_149_1.text_.text = var_152_3

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_4 = 62
				local var_152_5 = utf8.len(var_152_3)
				local var_152_6 = var_152_4 <= 0 and var_152_1 or var_152_1 * (var_152_5 / var_152_4)

				if var_152_6 > 0 and var_152_1 < var_152_6 then
					arg_149_1.talkMaxDuration = var_152_6

					if var_152_6 + var_152_0 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_6 + var_152_0
					end
				end

				arg_149_1.text_.text = var_152_3
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)
				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_7 = math.max(var_152_1, arg_149_1.talkMaxDuration)

			if var_152_0 <= arg_149_1.time_ and arg_149_1.time_ < var_152_0 + var_152_7 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_0) / var_152_7

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_0 + var_152_7 and arg_149_1.time_ < var_152_0 + var_152_7 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play116021035 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 116021035
		arg_153_1.duration_ = 5

		SetActive(arg_153_1.tipsGo_, false)

		function arg_153_1.onSingleLineFinish_()
			arg_153_1.onSingleLineUpdate_ = nil
			arg_153_1.onSingleLineFinish_ = nil
			arg_153_1.state_ = "waiting"
		end

		function arg_153_1.playNext_(arg_155_0)
			if arg_155_0 == 1 then
				arg_153_0:Play116021036(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = 0
			local var_156_1 = 1.4

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

				local var_156_2 = arg_153_1:GetWordFromCfg(116021035)
				local var_156_3 = arg_153_1:FormatText(var_156_2.content)

				arg_153_1.text_.text = var_156_3

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_4 = 56
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
	Play116021036 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 116021036
		arg_157_1.duration_ = 5.499999999999

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play116021037(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.bgs_.SK0105.transform
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 then
				arg_157_1.var_.moveOldPosSK0105 = var_160_0.localPosition
			end

			local var_160_2 = 5

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_2 then
				local var_160_3 = (arg_157_1.time_ - var_160_1) / var_160_2
				local var_160_4 = Vector3.New(0.5, -0.5, 1.5)

				var_160_0.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPosSK0105, var_160_4, var_160_3)
			end

			if arg_157_1.time_ >= var_160_1 + var_160_2 and arg_157_1.time_ < var_160_1 + var_160_2 + arg_160_0 then
				var_160_0.localPosition = Vector3.New(0.5, -0.5, 1.5)
			end

			local var_160_5 = 0

			if var_160_5 < arg_157_1.time_ and arg_157_1.time_ <= var_160_5 + arg_160_0 then
				arg_157_1.allBtn_.enabled = false
			end

			local var_160_6 = 5

			if arg_157_1.time_ >= var_160_5 + var_160_6 and arg_157_1.time_ < var_160_5 + var_160_6 + arg_160_0 then
				arg_157_1.allBtn_.enabled = true
			end

			local var_160_7 = 0
			local var_160_8 = 1.75

			if var_160_7 < arg_157_1.time_ and arg_157_1.time_ <= var_160_7 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, false)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_9 = arg_157_1:GetWordFromCfg(116021036)
				local var_160_10 = arg_157_1:FormatText(var_160_9.content)

				arg_157_1.text_.text = var_160_10

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_11 = 70
				local var_160_12 = utf8.len(var_160_10)
				local var_160_13 = var_160_11 <= 0 and var_160_8 or var_160_8 * (var_160_12 / var_160_11)

				if var_160_13 > 0 and var_160_8 < var_160_13 then
					arg_157_1.talkMaxDuration = var_160_13

					if var_160_13 + var_160_7 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_13 + var_160_7
					end
				end

				arg_157_1.text_.text = var_160_10
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)
				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_14 = math.max(var_160_8, arg_157_1.talkMaxDuration)

			if var_160_7 <= arg_157_1.time_ and arg_157_1.time_ < var_160_7 + var_160_14 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_7) / var_160_14

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_7 + var_160_14 and arg_157_1.time_ < var_160_7 + var_160_14 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play116021037 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 116021037
		arg_161_1.duration_ = 7.9

		local var_161_0 = {
			zh = 6.934,
			ja = 7.9
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
				arg_161_0:Play116021038(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.bgs_.SK0105.transform
			local var_164_1 = 2

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 then
				arg_161_1.var_.moveOldPosSK0105 = var_164_0.localPosition
			end

			local var_164_2 = 4

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_2 then
				local var_164_3 = (arg_161_1.time_ - var_164_1) / var_164_2
				local var_164_4 = Vector3.New(-3, 0, 3.2)

				var_164_0.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPosSK0105, var_164_4, var_164_3)
			end

			if arg_161_1.time_ >= var_164_1 + var_164_2 and arg_161_1.time_ < var_164_1 + var_164_2 + arg_164_0 then
				var_164_0.localPosition = Vector3.New(-3, 0, 3.2)
			end

			local var_164_5 = arg_161_1.bgs_.SK0105.transform
			local var_164_6 = 1.966

			if var_164_6 < arg_161_1.time_ and arg_161_1.time_ <= var_164_6 + arg_164_0 then
				arg_161_1.var_.moveOldPosSK0105 = var_164_5.localPosition
			end

			local var_164_7 = 0.001

			if var_164_6 <= arg_161_1.time_ and arg_161_1.time_ < var_164_6 + var_164_7 then
				local var_164_8 = (arg_161_1.time_ - var_164_6) / var_164_7
				local var_164_9 = Vector3.New(-3, 0.3, 3.2)

				var_164_5.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPosSK0105, var_164_9, var_164_8)
			end

			if arg_161_1.time_ >= var_164_6 + var_164_7 and arg_161_1.time_ < var_164_6 + var_164_7 + arg_164_0 then
				var_164_5.localPosition = Vector3.New(-3, 0.3, 3.2)
			end

			local var_164_10 = 0

			if var_164_10 < arg_161_1.time_ and arg_161_1.time_ <= var_164_10 + arg_164_0 then
				arg_161_1.mask_.enabled = true
				arg_161_1.mask_.raycastTarget = true

				arg_161_1:SetGaussion(false)
			end

			local var_164_11 = 2

			if var_164_10 <= arg_161_1.time_ and arg_161_1.time_ < var_164_10 + var_164_11 then
				local var_164_12 = (arg_161_1.time_ - var_164_10) / var_164_11
				local var_164_13 = Color.New(0, 0, 0)

				var_164_13.a = Mathf.Lerp(0, 1, var_164_12)
				arg_161_1.mask_.color = var_164_13
			end

			if arg_161_1.time_ >= var_164_10 + var_164_11 and arg_161_1.time_ < var_164_10 + var_164_11 + arg_164_0 then
				local var_164_14 = Color.New(0, 0, 0)

				var_164_14.a = 1
				arg_161_1.mask_.color = var_164_14
			end

			local var_164_15 = 2

			if var_164_15 < arg_161_1.time_ and arg_161_1.time_ <= var_164_15 + arg_164_0 then
				arg_161_1.mask_.enabled = true
				arg_161_1.mask_.raycastTarget = true

				arg_161_1:SetGaussion(false)
			end

			local var_164_16 = 2

			if var_164_15 <= arg_161_1.time_ and arg_161_1.time_ < var_164_15 + var_164_16 then
				local var_164_17 = (arg_161_1.time_ - var_164_15) / var_164_16
				local var_164_18 = Color.New(0, 0, 0)

				var_164_18.a = Mathf.Lerp(1, 0, var_164_17)
				arg_161_1.mask_.color = var_164_18
			end

			if arg_161_1.time_ >= var_164_15 + var_164_16 and arg_161_1.time_ < var_164_15 + var_164_16 + arg_164_0 then
				local var_164_19 = Color.New(0, 0, 0)
				local var_164_20 = 0

				arg_161_1.mask_.enabled = false
				var_164_19.a = var_164_20
				arg_161_1.mask_.color = var_164_19
			end

			local var_164_21 = 4

			if var_164_21 < arg_161_1.time_ and arg_161_1.time_ <= var_164_21 + arg_164_0 then
				arg_161_1.allBtn_.enabled = false
			end

			local var_164_22 = 2

			if arg_161_1.time_ >= var_164_21 + var_164_22 and arg_161_1.time_ < var_164_21 + var_164_22 + arg_164_0 then
				arg_161_1.allBtn_.enabled = true
			end

			if arg_161_1.frameCnt_ <= 1 then
				arg_161_1.dialog_:SetActive(false)
			end

			local var_164_23 = 2.034
			local var_164_24 = 0.6

			if var_164_23 < arg_161_1.time_ and arg_161_1.time_ <= var_164_23 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0

				arg_161_1.dialog_:SetActive(true)

				local var_164_25 = LeanTween.value(arg_161_1.dialog_, 0, 1, 0.3)

				var_164_25:setOnUpdate(LuaHelper.FloatAction(function(arg_165_0)
					arg_161_1.dialogCg_.alpha = arg_165_0
				end))
				var_164_25:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_161_1.dialog_)
					var_164_25:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_161_1.duration_ = arg_161_1.duration_ + 0.3

				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_26 = arg_161_1:FormatText(StoryNameCfg[13].name)

				arg_161_1.leftNameTxt_.text = var_164_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, true)
				arg_161_1.iconController_:SetSelectedState("hero")

				arg_161_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019")

				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_27 = arg_161_1:GetWordFromCfg(116021037)
				local var_164_28 = arg_161_1:FormatText(var_164_27.content)

				arg_161_1.text_.text = var_164_28

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_29 = 24
				local var_164_30 = utf8.len(var_164_28)
				local var_164_31 = var_164_29 <= 0 and var_164_24 or var_164_24 * (var_164_30 / var_164_29)

				if var_164_31 > 0 and var_164_24 < var_164_31 then
					arg_161_1.talkMaxDuration = var_164_31
					var_164_23 = var_164_23 + 0.3

					if var_164_31 + var_164_23 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_31 + var_164_23
					end
				end

				arg_161_1.text_.text = var_164_28
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021037", "story_v_out_116021.awb") ~= 0 then
					local var_164_32 = manager.audio:GetVoiceLength("story_v_out_116021", "116021037", "story_v_out_116021.awb") / 1000

					if var_164_32 + var_164_23 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_32 + var_164_23
					end

					if var_164_27.prefab_name ~= "" and arg_161_1.actors_[var_164_27.prefab_name] ~= nil then
						local var_164_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_27.prefab_name].transform, "story_v_out_116021", "116021037", "story_v_out_116021.awb")

						arg_161_1:RecordAudio("116021037", var_164_33)
						arg_161_1:RecordAudio("116021037", var_164_33)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_116021", "116021037", "story_v_out_116021.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_116021", "116021037", "story_v_out_116021.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_34 = var_164_23 + 0.3
			local var_164_35 = math.max(var_164_24, arg_161_1.talkMaxDuration)

			if var_164_34 <= arg_161_1.time_ and arg_161_1.time_ < var_164_34 + var_164_35 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_34) / var_164_35

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_34 + var_164_35 and arg_161_1.time_ < var_164_34 + var_164_35 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play116021038 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 116021038
		arg_167_1.duration_ = 10.9

		local var_167_0 = {
			zh = 6.9,
			ja = 10.9
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
				arg_167_0:Play116021039(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.bgs_.SK0105.transform
			local var_170_1 = 2

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 then
				arg_167_1.var_.moveOldPosSK0105 = var_170_0.localPosition
			end

			local var_170_2 = 0.001

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_2 then
				local var_170_3 = (arg_167_1.time_ - var_170_1) / var_170_2
				local var_170_4 = Vector3.New(3.4, 0, 2.5)

				var_170_0.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPosSK0105, var_170_4, var_170_3)
			end

			if arg_167_1.time_ >= var_170_1 + var_170_2 and arg_167_1.time_ < var_170_1 + var_170_2 + arg_170_0 then
				var_170_0.localPosition = Vector3.New(3.4, 0, 2.5)
			end

			local var_170_5 = arg_167_1.bgs_.SK0105.transform
			local var_170_6 = 2.034

			if var_170_6 < arg_167_1.time_ and arg_167_1.time_ <= var_170_6 + arg_170_0 then
				arg_167_1.var_.moveOldPosSK0105 = var_170_5.localPosition
			end

			local var_170_7 = 2

			if var_170_6 <= arg_167_1.time_ and arg_167_1.time_ < var_170_6 + var_170_7 then
				local var_170_8 = (arg_167_1.time_ - var_170_6) / var_170_7
				local var_170_9 = Vector3.New(3.4, -0.5, 2.5)

				var_170_5.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPosSK0105, var_170_9, var_170_8)
			end

			if arg_167_1.time_ >= var_170_6 + var_170_7 and arg_167_1.time_ < var_170_6 + var_170_7 + arg_170_0 then
				var_170_5.localPosition = Vector3.New(3.4, -0.5, 2.5)
			end

			local var_170_10 = 0

			if var_170_10 < arg_167_1.time_ and arg_167_1.time_ <= var_170_10 + arg_170_0 then
				arg_167_1.mask_.enabled = true
				arg_167_1.mask_.raycastTarget = true

				arg_167_1:SetGaussion(false)
			end

			local var_170_11 = 2

			if var_170_10 <= arg_167_1.time_ and arg_167_1.time_ < var_170_10 + var_170_11 then
				local var_170_12 = (arg_167_1.time_ - var_170_10) / var_170_11
				local var_170_13 = Color.New(0, 0, 0)

				var_170_13.a = Mathf.Lerp(0, 1, var_170_12)
				arg_167_1.mask_.color = var_170_13
			end

			if arg_167_1.time_ >= var_170_10 + var_170_11 and arg_167_1.time_ < var_170_10 + var_170_11 + arg_170_0 then
				local var_170_14 = Color.New(0, 0, 0)

				var_170_14.a = 1
				arg_167_1.mask_.color = var_170_14
			end

			local var_170_15 = 2

			if var_170_15 < arg_167_1.time_ and arg_167_1.time_ <= var_170_15 + arg_170_0 then
				arg_167_1.mask_.enabled = true
				arg_167_1.mask_.raycastTarget = true

				arg_167_1:SetGaussion(false)
			end

			local var_170_16 = 2

			if var_170_15 <= arg_167_1.time_ and arg_167_1.time_ < var_170_15 + var_170_16 then
				local var_170_17 = (arg_167_1.time_ - var_170_15) / var_170_16
				local var_170_18 = Color.New(0, 0, 0)

				var_170_18.a = Mathf.Lerp(1, 0, var_170_17)
				arg_167_1.mask_.color = var_170_18
			end

			if arg_167_1.time_ >= var_170_15 + var_170_16 and arg_167_1.time_ < var_170_15 + var_170_16 + arg_170_0 then
				local var_170_19 = Color.New(0, 0, 0)
				local var_170_20 = 0

				arg_167_1.mask_.enabled = false
				var_170_19.a = var_170_20
				arg_167_1.mask_.color = var_170_19
			end

			if arg_167_1.frameCnt_ <= 1 then
				arg_167_1.dialog_:SetActive(false)
			end

			local var_170_21 = 2
			local var_170_22 = 0.65

			if var_170_21 < arg_167_1.time_ and arg_167_1.time_ <= var_170_21 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0

				arg_167_1.dialog_:SetActive(true)

				local var_170_23 = LeanTween.value(arg_167_1.dialog_, 0, 1, 0.3)

				var_170_23:setOnUpdate(LuaHelper.FloatAction(function(arg_171_0)
					arg_167_1.dialogCg_.alpha = arg_171_0
				end))
				var_170_23:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_167_1.dialog_)
					var_170_23:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_167_1.duration_ = arg_167_1.duration_ + 0.3

				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_24 = arg_167_1:FormatText(StoryNameCfg[13].name)

				arg_167_1.leftNameTxt_.text = var_170_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, true)
				arg_167_1.iconController_:SetSelectedState("hero")

				arg_167_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019")

				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_25 = arg_167_1:GetWordFromCfg(116021038)
				local var_170_26 = arg_167_1:FormatText(var_170_25.content)

				arg_167_1.text_.text = var_170_26

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_27 = 26
				local var_170_28 = utf8.len(var_170_26)
				local var_170_29 = var_170_27 <= 0 and var_170_22 or var_170_22 * (var_170_28 / var_170_27)

				if var_170_29 > 0 and var_170_22 < var_170_29 then
					arg_167_1.talkMaxDuration = var_170_29
					var_170_21 = var_170_21 + 0.3

					if var_170_29 + var_170_21 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_29 + var_170_21
					end
				end

				arg_167_1.text_.text = var_170_26
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021038", "story_v_out_116021.awb") ~= 0 then
					local var_170_30 = manager.audio:GetVoiceLength("story_v_out_116021", "116021038", "story_v_out_116021.awb") / 1000

					if var_170_30 + var_170_21 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_30 + var_170_21
					end

					if var_170_25.prefab_name ~= "" and arg_167_1.actors_[var_170_25.prefab_name] ~= nil then
						local var_170_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_25.prefab_name].transform, "story_v_out_116021", "116021038", "story_v_out_116021.awb")

						arg_167_1:RecordAudio("116021038", var_170_31)
						arg_167_1:RecordAudio("116021038", var_170_31)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_116021", "116021038", "story_v_out_116021.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_116021", "116021038", "story_v_out_116021.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_32 = var_170_21 + 0.3
			local var_170_33 = math.max(var_170_22, arg_167_1.talkMaxDuration)

			if var_170_32 <= arg_167_1.time_ and arg_167_1.time_ < var_170_32 + var_170_33 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_32) / var_170_33

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_32 + var_170_33 and arg_167_1.time_ < var_170_32 + var_170_33 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play116021039 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 116021039
		arg_173_1.duration_ = 9

		SetActive(arg_173_1.tipsGo_, false)

		function arg_173_1.onSingleLineFinish_()
			arg_173_1.onSingleLineUpdate_ = nil
			arg_173_1.onSingleLineFinish_ = nil
			arg_173_1.state_ = "waiting"
		end

		function arg_173_1.playNext_(arg_175_0)
			if arg_175_0 == 1 then
				arg_173_0:Play116021040(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.bgs_.SK0105.transform
			local var_176_1 = 2

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 then
				arg_173_1.var_.moveOldPosSK0105 = var_176_0.localPosition
			end

			local var_176_2 = 0.001

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_2 then
				local var_176_3 = (arg_173_1.time_ - var_176_1) / var_176_2
				local var_176_4 = Vector3.New(0, 1, 10)

				var_176_0.localPosition = Vector3.Lerp(arg_173_1.var_.moveOldPosSK0105, var_176_4, var_176_3)
			end

			if arg_173_1.time_ >= var_176_1 + var_176_2 and arg_173_1.time_ < var_176_1 + var_176_2 + arg_176_0 then
				var_176_0.localPosition = Vector3.New(0, 1, 10)
			end

			local var_176_5 = 0

			if var_176_5 < arg_173_1.time_ and arg_173_1.time_ <= var_176_5 + arg_176_0 then
				arg_173_1.mask_.enabled = true
				arg_173_1.mask_.raycastTarget = true

				arg_173_1:SetGaussion(false)
			end

			local var_176_6 = 2

			if var_176_5 <= arg_173_1.time_ and arg_173_1.time_ < var_176_5 + var_176_6 then
				local var_176_7 = (arg_173_1.time_ - var_176_5) / var_176_6
				local var_176_8 = Color.New(0, 0, 0)

				var_176_8.a = Mathf.Lerp(0, 1, var_176_7)
				arg_173_1.mask_.color = var_176_8
			end

			if arg_173_1.time_ >= var_176_5 + var_176_6 and arg_173_1.time_ < var_176_5 + var_176_6 + arg_176_0 then
				local var_176_9 = Color.New(0, 0, 0)

				var_176_9.a = 1
				arg_173_1.mask_.color = var_176_9
			end

			local var_176_10 = 2

			if var_176_10 < arg_173_1.time_ and arg_173_1.time_ <= var_176_10 + arg_176_0 then
				arg_173_1.mask_.enabled = true
				arg_173_1.mask_.raycastTarget = true

				arg_173_1:SetGaussion(false)
			end

			local var_176_11 = 2

			if var_176_10 <= arg_173_1.time_ and arg_173_1.time_ < var_176_10 + var_176_11 then
				local var_176_12 = (arg_173_1.time_ - var_176_10) / var_176_11
				local var_176_13 = Color.New(0, 0, 0)

				var_176_13.a = Mathf.Lerp(1, 0, var_176_12)
				arg_173_1.mask_.color = var_176_13
			end

			if arg_173_1.time_ >= var_176_10 + var_176_11 and arg_173_1.time_ < var_176_10 + var_176_11 + arg_176_0 then
				local var_176_14 = Color.New(0, 0, 0)
				local var_176_15 = 0

				arg_173_1.mask_.enabled = false
				var_176_14.a = var_176_15
				arg_173_1.mask_.color = var_176_14
			end

			if arg_173_1.frameCnt_ <= 1 then
				arg_173_1.dialog_:SetActive(false)
			end

			local var_176_16 = 4
			local var_176_17 = 0.275

			if var_176_16 < arg_173_1.time_ and arg_173_1.time_ <= var_176_16 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0

				arg_173_1.dialog_:SetActive(true)

				local var_176_18 = LeanTween.value(arg_173_1.dialog_, 0, 1, 0.3)

				var_176_18:setOnUpdate(LuaHelper.FloatAction(function(arg_177_0)
					arg_173_1.dialogCg_.alpha = arg_177_0
				end))
				var_176_18:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_173_1.dialog_)
					var_176_18:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_173_1.duration_ = arg_173_1.duration_ + 0.3

				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_19 = arg_173_1:FormatText(StoryNameCfg[7].name)

				arg_173_1.leftNameTxt_.text = var_176_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_20 = arg_173_1:GetWordFromCfg(116021039)
				local var_176_21 = arg_173_1:FormatText(var_176_20.content)

				arg_173_1.text_.text = var_176_21

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_22 = 19
				local var_176_23 = utf8.len(var_176_21)
				local var_176_24 = var_176_22 <= 0 and var_176_17 or var_176_17 * (var_176_23 / var_176_22)

				if var_176_24 > 0 and var_176_17 < var_176_24 then
					arg_173_1.talkMaxDuration = var_176_24
					var_176_16 = var_176_16 + 0.3

					if var_176_24 + var_176_16 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_24 + var_176_16
					end
				end

				arg_173_1.text_.text = var_176_21
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)
				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_25 = var_176_16 + 0.3
			local var_176_26 = math.max(var_176_17, arg_173_1.talkMaxDuration)

			if var_176_25 <= arg_173_1.time_ and arg_173_1.time_ < var_176_25 + var_176_26 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_25) / var_176_26

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_25 + var_176_26 and arg_173_1.time_ < var_176_25 + var_176_26 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play116021040 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 116021040
		arg_179_1.duration_ = 11.766

		local var_179_0 = {
			zh = 9.833,
			ja = 11.766
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
				arg_179_0:Play116021041(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = 0
			local var_182_1 = 1.05

			if var_182_0 < arg_179_1.time_ and arg_179_1.time_ <= var_182_0 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_2 = arg_179_1:FormatText(StoryNameCfg[327].name)

				arg_179_1.leftNameTxt_.text = var_182_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_3 = arg_179_1:GetWordFromCfg(116021040)
				local var_182_4 = arg_179_1:FormatText(var_182_3.content)

				arg_179_1.text_.text = var_182_4

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_5 = 42
				local var_182_6 = utf8.len(var_182_4)
				local var_182_7 = var_182_5 <= 0 and var_182_1 or var_182_1 * (var_182_6 / var_182_5)

				if var_182_7 > 0 and var_182_1 < var_182_7 then
					arg_179_1.talkMaxDuration = var_182_7

					if var_182_7 + var_182_0 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_7 + var_182_0
					end
				end

				arg_179_1.text_.text = var_182_4
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021040", "story_v_out_116021.awb") ~= 0 then
					local var_182_8 = manager.audio:GetVoiceLength("story_v_out_116021", "116021040", "story_v_out_116021.awb") / 1000

					if var_182_8 + var_182_0 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_8 + var_182_0
					end

					if var_182_3.prefab_name ~= "" and arg_179_1.actors_[var_182_3.prefab_name] ~= nil then
						local var_182_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_3.prefab_name].transform, "story_v_out_116021", "116021040", "story_v_out_116021.awb")

						arg_179_1:RecordAudio("116021040", var_182_9)
						arg_179_1:RecordAudio("116021040", var_182_9)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_116021", "116021040", "story_v_out_116021.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_116021", "116021040", "story_v_out_116021.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_10 = math.max(var_182_1, arg_179_1.talkMaxDuration)

			if var_182_0 <= arg_179_1.time_ and arg_179_1.time_ < var_182_0 + var_182_10 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_0) / var_182_10

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_0 + var_182_10 and arg_179_1.time_ < var_182_0 + var_182_10 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play116021041 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 116021041
		arg_183_1.duration_ = 0.016666666666

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"

			SetActive(arg_183_1.choicesGo_, true)

			for iter_184_0, iter_184_1 in ipairs(arg_183_1.choices_) do
				local var_184_0 = iter_184_0 <= 2

				SetActive(iter_184_1.go, var_184_0)
			end

			arg_183_1.choices_[1].txt.text = arg_183_1:FormatText(StoryChoiceCfg[227].name)
			arg_183_1.choices_[2].txt.text = arg_183_1:FormatText(StoryChoiceCfg[228].name)
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play116021042(arg_183_1)
			end

			if arg_185_0 == 2 then
				arg_183_0:Play116021044(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			return
		end
	end,
	Play116021042 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 116021042
		arg_187_1.duration_ = 9.033

		local var_187_0 = {
			zh = 8.133,
			ja = 9.033
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
				arg_187_0:Play116021043(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = 0
			local var_190_1 = 0.9

			if var_190_0 < arg_187_1.time_ and arg_187_1.time_ <= var_190_0 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_2 = arg_187_1:FormatText(StoryNameCfg[327].name)

				arg_187_1.leftNameTxt_.text = var_190_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_3 = arg_187_1:GetWordFromCfg(116021042)
				local var_190_4 = arg_187_1:FormatText(var_190_3.content)

				arg_187_1.text_.text = var_190_4

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_5 = 36
				local var_190_6 = utf8.len(var_190_4)
				local var_190_7 = var_190_5 <= 0 and var_190_1 or var_190_1 * (var_190_6 / var_190_5)

				if var_190_7 > 0 and var_190_1 < var_190_7 then
					arg_187_1.talkMaxDuration = var_190_7

					if var_190_7 + var_190_0 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_7 + var_190_0
					end
				end

				arg_187_1.text_.text = var_190_4
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021042", "story_v_out_116021.awb") ~= 0 then
					local var_190_8 = manager.audio:GetVoiceLength("story_v_out_116021", "116021042", "story_v_out_116021.awb") / 1000

					if var_190_8 + var_190_0 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_8 + var_190_0
					end

					if var_190_3.prefab_name ~= "" and arg_187_1.actors_[var_190_3.prefab_name] ~= nil then
						local var_190_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_3.prefab_name].transform, "story_v_out_116021", "116021042", "story_v_out_116021.awb")

						arg_187_1:RecordAudio("116021042", var_190_9)
						arg_187_1:RecordAudio("116021042", var_190_9)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_116021", "116021042", "story_v_out_116021.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_116021", "116021042", "story_v_out_116021.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_10 = math.max(var_190_1, arg_187_1.talkMaxDuration)

			if var_190_0 <= arg_187_1.time_ and arg_187_1.time_ < var_190_0 + var_190_10 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_0) / var_190_10

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_0 + var_190_10 and arg_187_1.time_ < var_190_0 + var_190_10 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play116021043 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 116021043
		arg_191_1.duration_ = 5

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play116021045(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = 0
			local var_194_1 = 0.15

			if var_194_0 < arg_191_1.time_ and arg_191_1.time_ <= var_194_0 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_2 = arg_191_1:FormatText(StoryNameCfg[7].name)

				arg_191_1.leftNameTxt_.text = var_194_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_3 = arg_191_1:GetWordFromCfg(116021043)
				local var_194_4 = arg_191_1:FormatText(var_194_3.content)

				arg_191_1.text_.text = var_194_4

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_5 = 6
				local var_194_6 = utf8.len(var_194_4)
				local var_194_7 = var_194_5 <= 0 and var_194_1 or var_194_1 * (var_194_6 / var_194_5)

				if var_194_7 > 0 and var_194_1 < var_194_7 then
					arg_191_1.talkMaxDuration = var_194_7

					if var_194_7 + var_194_0 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_7 + var_194_0
					end
				end

				arg_191_1.text_.text = var_194_4
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)
				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_8 = math.max(var_194_1, arg_191_1.talkMaxDuration)

			if var_194_0 <= arg_191_1.time_ and arg_191_1.time_ < var_194_0 + var_194_8 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_0) / var_194_8

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_0 + var_194_8 and arg_191_1.time_ < var_194_0 + var_194_8 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play116021045 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 116021045
		arg_195_1.duration_ = 12

		local var_195_0 = {
			zh = 12,
			ja = 9.833
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
				arg_195_0:Play116021046(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = "A00"

			if arg_195_1.bgs_[var_198_0] == nil then
				local var_198_1 = Object.Instantiate(arg_195_1.paintGo_)

				var_198_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_198_0)
				var_198_1.name = var_198_0
				var_198_1.transform.parent = arg_195_1.stage_.transform
				var_198_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_195_1.bgs_[var_198_0] = var_198_1
			end

			local var_198_2 = 2

			if var_198_2 < arg_195_1.time_ and arg_195_1.time_ <= var_198_2 + arg_198_0 then
				local var_198_3 = manager.ui.mainCamera.transform.localPosition
				local var_198_4 = Vector3.New(0, 0, 10) + Vector3.New(var_198_3.x, var_198_3.y, 0)
				local var_198_5 = arg_195_1.bgs_.A00

				var_198_5.transform.localPosition = var_198_4
				var_198_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_198_6 = var_198_5:GetComponent("SpriteRenderer")

				if var_198_6 and var_198_6.sprite then
					local var_198_7 = (var_198_5.transform.localPosition - var_198_3).z
					local var_198_8 = manager.ui.mainCameraCom_
					local var_198_9 = 2 * var_198_7 * Mathf.Tan(var_198_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_198_10 = var_198_9 * var_198_8.aspect
					local var_198_11 = var_198_6.sprite.bounds.size.x
					local var_198_12 = var_198_6.sprite.bounds.size.y
					local var_198_13 = var_198_10 / var_198_11
					local var_198_14 = var_198_9 / var_198_12
					local var_198_15 = var_198_14 < var_198_13 and var_198_13 or var_198_14

					var_198_5.transform.localScale = Vector3.New(var_198_15, var_198_15, 0)
				end

				for iter_198_0, iter_198_1 in pairs(arg_195_1.bgs_) do
					if iter_198_0 ~= "A00" then
						iter_198_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_198_16 = "1029ui_story"

			if arg_195_1.actors_[var_198_16] == nil then
				local var_198_17 = Object.Instantiate(Asset.Load("Char/" .. var_198_16), arg_195_1.stage_.transform)

				var_198_17.name = var_198_16
				var_198_17.transform.localPosition = Vector3.New(0, 100, 0)
				arg_195_1.actors_[var_198_16] = var_198_17

				local var_198_18 = var_198_17:GetComponentInChildren(typeof(CharacterEffect))

				var_198_18.enabled = true

				local var_198_19 = GameObjectTools.GetOrAddComponent(var_198_17, typeof(DynamicBoneHelper))

				if var_198_19 then
					var_198_19:EnableDynamicBone(false)
				end

				arg_195_1:ShowWeapon(var_198_18.transform, false)

				arg_195_1.var_[var_198_16 .. "Animator"] = var_198_18.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_195_1.var_[var_198_16 .. "Animator"].applyRootMotion = true
				arg_195_1.var_[var_198_16 .. "LipSync"] = var_198_18.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_198_20 = arg_195_1.actors_["1029ui_story"].transform
			local var_198_21 = 3.8

			if var_198_21 < arg_195_1.time_ and arg_195_1.time_ <= var_198_21 + arg_198_0 then
				arg_195_1.var_.moveOldPos1029ui_story = var_198_20.localPosition
			end

			local var_198_22 = 0.001

			if var_198_21 <= arg_195_1.time_ and arg_195_1.time_ < var_198_21 + var_198_22 then
				local var_198_23 = (arg_195_1.time_ - var_198_21) / var_198_22
				local var_198_24 = Vector3.New(0, -1.09, -6.2)

				var_198_20.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos1029ui_story, var_198_24, var_198_23)

				local var_198_25 = manager.ui.mainCamera.transform.position - var_198_20.position

				var_198_20.forward = Vector3.New(var_198_25.x, var_198_25.y, var_198_25.z)

				local var_198_26 = var_198_20.localEulerAngles

				var_198_26.z = 0
				var_198_26.x = 0
				var_198_20.localEulerAngles = var_198_26
			end

			if arg_195_1.time_ >= var_198_21 + var_198_22 and arg_195_1.time_ < var_198_21 + var_198_22 + arg_198_0 then
				var_198_20.localPosition = Vector3.New(0, -1.09, -6.2)

				local var_198_27 = manager.ui.mainCamera.transform.position - var_198_20.position

				var_198_20.forward = Vector3.New(var_198_27.x, var_198_27.y, var_198_27.z)

				local var_198_28 = var_198_20.localEulerAngles

				var_198_28.z = 0
				var_198_28.x = 0
				var_198_20.localEulerAngles = var_198_28
			end

			local var_198_29 = 3.8

			if var_198_29 < arg_195_1.time_ and arg_195_1.time_ <= var_198_29 + arg_198_0 then
				arg_195_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action1_1")
			end

			local var_198_30 = 3.8

			if var_198_30 < arg_195_1.time_ and arg_195_1.time_ <= var_198_30 + arg_198_0 then
				arg_195_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_198_31 = arg_195_1.actors_["1029ui_story"]
			local var_198_32 = 3.8

			if var_198_32 < arg_195_1.time_ and arg_195_1.time_ <= var_198_32 + arg_198_0 and arg_195_1.var_.characterEffect1029ui_story == nil then
				arg_195_1.var_.characterEffect1029ui_story = var_198_31:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_33 = 0.2

			if var_198_32 <= arg_195_1.time_ and arg_195_1.time_ < var_198_32 + var_198_33 then
				local var_198_34 = (arg_195_1.time_ - var_198_32) / var_198_33

				if arg_195_1.var_.characterEffect1029ui_story then
					arg_195_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_195_1.time_ >= var_198_32 + var_198_33 and arg_195_1.time_ < var_198_32 + var_198_33 + arg_198_0 and arg_195_1.var_.characterEffect1029ui_story then
				arg_195_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_198_35 = 0

			if var_198_35 < arg_195_1.time_ and arg_195_1.time_ <= var_198_35 + arg_198_0 then
				arg_195_1.mask_.enabled = true
				arg_195_1.mask_.raycastTarget = true

				arg_195_1:SetGaussion(false)
			end

			local var_198_36 = 2

			if var_198_35 <= arg_195_1.time_ and arg_195_1.time_ < var_198_35 + var_198_36 then
				local var_198_37 = (arg_195_1.time_ - var_198_35) / var_198_36
				local var_198_38 = Color.New(0, 0, 0)

				var_198_38.a = Mathf.Lerp(0, 1, var_198_37)
				arg_195_1.mask_.color = var_198_38
			end

			if arg_195_1.time_ >= var_198_35 + var_198_36 and arg_195_1.time_ < var_198_35 + var_198_36 + arg_198_0 then
				local var_198_39 = Color.New(0, 0, 0)

				var_198_39.a = 1
				arg_195_1.mask_.color = var_198_39
			end

			local var_198_40 = 2

			if var_198_40 < arg_195_1.time_ and arg_195_1.time_ <= var_198_40 + arg_198_0 then
				arg_195_1.mask_.enabled = true
				arg_195_1.mask_.raycastTarget = true

				arg_195_1:SetGaussion(false)
			end

			local var_198_41 = 2

			if var_198_40 <= arg_195_1.time_ and arg_195_1.time_ < var_198_40 + var_198_41 then
				local var_198_42 = (arg_195_1.time_ - var_198_40) / var_198_41
				local var_198_43 = Color.New(0, 0, 0)

				var_198_43.a = Mathf.Lerp(1, 0, var_198_42)
				arg_195_1.mask_.color = var_198_43
			end

			if arg_195_1.time_ >= var_198_40 + var_198_41 and arg_195_1.time_ < var_198_40 + var_198_41 + arg_198_0 then
				local var_198_44 = Color.New(0, 0, 0)
				local var_198_45 = 0

				arg_195_1.mask_.enabled = false
				var_198_44.a = var_198_45
				arg_195_1.mask_.color = var_198_44
			end

			if arg_195_1.frameCnt_ <= 1 then
				arg_195_1.dialog_:SetActive(false)
			end

			local var_198_46 = 4
			local var_198_47 = 0.75

			if var_198_46 < arg_195_1.time_ and arg_195_1.time_ <= var_198_46 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0

				arg_195_1.dialog_:SetActive(true)

				local var_198_48 = LeanTween.value(arg_195_1.dialog_, 0, 1, 0.3)

				var_198_48:setOnUpdate(LuaHelper.FloatAction(function(arg_199_0)
					arg_195_1.dialogCg_.alpha = arg_199_0
				end))
				var_198_48:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_195_1.dialog_)
					var_198_48:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_195_1.duration_ = arg_195_1.duration_ + 0.3

				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_49 = arg_195_1:FormatText(StoryNameCfg[319].name)

				arg_195_1.leftNameTxt_.text = var_198_49

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_50 = arg_195_1:GetWordFromCfg(116021045)
				local var_198_51 = arg_195_1:FormatText(var_198_50.content)

				arg_195_1.text_.text = var_198_51

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_52 = 38
				local var_198_53 = utf8.len(var_198_51)
				local var_198_54 = var_198_52 <= 0 and var_198_47 or var_198_47 * (var_198_53 / var_198_52)

				if var_198_54 > 0 and var_198_47 < var_198_54 then
					arg_195_1.talkMaxDuration = var_198_54
					var_198_46 = var_198_46 + 0.3

					if var_198_54 + var_198_46 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_54 + var_198_46
					end
				end

				arg_195_1.text_.text = var_198_51
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021045", "story_v_out_116021.awb") ~= 0 then
					local var_198_55 = manager.audio:GetVoiceLength("story_v_out_116021", "116021045", "story_v_out_116021.awb") / 1000

					if var_198_55 + var_198_46 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_55 + var_198_46
					end

					if var_198_50.prefab_name ~= "" and arg_195_1.actors_[var_198_50.prefab_name] ~= nil then
						local var_198_56 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_50.prefab_name].transform, "story_v_out_116021", "116021045", "story_v_out_116021.awb")

						arg_195_1:RecordAudio("116021045", var_198_56)
						arg_195_1:RecordAudio("116021045", var_198_56)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_116021", "116021045", "story_v_out_116021.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_116021", "116021045", "story_v_out_116021.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_57 = var_198_46 + 0.3
			local var_198_58 = math.max(var_198_47, arg_195_1.talkMaxDuration)

			if var_198_57 <= arg_195_1.time_ and arg_195_1.time_ < var_198_57 + var_198_58 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_57) / var_198_58

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_57 + var_198_58 and arg_195_1.time_ < var_198_57 + var_198_58 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play116021046 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 116021046
		arg_201_1.duration_ = 0.199999999999

		SetActive(arg_201_1.tipsGo_, false)

		function arg_201_1.onSingleLineFinish_()
			arg_201_1.onSingleLineUpdate_ = nil
			arg_201_1.onSingleLineFinish_ = nil
			arg_201_1.state_ = "waiting"

			SetActive(arg_201_1.choicesGo_, true)

			for iter_202_0, iter_202_1 in ipairs(arg_201_1.choices_) do
				local var_202_0 = iter_202_0 <= 2

				SetActive(iter_202_1.go, var_202_0)
			end

			arg_201_1.choices_[1].txt.text = arg_201_1:FormatText(StoryChoiceCfg[229].name)
			arg_201_1.choices_[2].txt.text = arg_201_1:FormatText(StoryChoiceCfg[230].name)
		end

		function arg_201_1.playNext_(arg_203_0)
			if arg_203_0 == 1 then
				arg_201_0:Play116021047(arg_201_1)
			end

			if arg_203_0 == 2 then
				arg_201_0:Play116021047(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = arg_201_1.actors_["1029ui_story"]
			local var_204_1 = 0

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 and arg_201_1.var_.characterEffect1029ui_story == nil then
				arg_201_1.var_.characterEffect1029ui_story = var_204_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_2 = 0.2

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_2 then
				local var_204_3 = (arg_201_1.time_ - var_204_1) / var_204_2

				if arg_201_1.var_.characterEffect1029ui_story then
					local var_204_4 = Mathf.Lerp(0, 0.5, var_204_3)

					arg_201_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_201_1.var_.characterEffect1029ui_story.fillRatio = var_204_4
				end
			end

			if arg_201_1.time_ >= var_204_1 + var_204_2 and arg_201_1.time_ < var_204_1 + var_204_2 + arg_204_0 and arg_201_1.var_.characterEffect1029ui_story then
				local var_204_5 = 0.5

				arg_201_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_201_1.var_.characterEffect1029ui_story.fillRatio = var_204_5
			end
		end
	end,
	Play116021047 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 116021047
		arg_205_1.duration_ = 5.933

		local var_205_0 = {
			zh = 5.933,
			ja = 5.633
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
				arg_205_0:Play116021048(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = 0

			if var_208_0 < arg_205_1.time_ and arg_205_1.time_ <= var_208_0 + arg_208_0 then
				arg_205_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_208_1 = arg_205_1.actors_["1029ui_story"]
			local var_208_2 = 0

			if var_208_2 < arg_205_1.time_ and arg_205_1.time_ <= var_208_2 + arg_208_0 and arg_205_1.var_.characterEffect1029ui_story == nil then
				arg_205_1.var_.characterEffect1029ui_story = var_208_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_208_3 = 0.2

			if var_208_2 <= arg_205_1.time_ and arg_205_1.time_ < var_208_2 + var_208_3 then
				local var_208_4 = (arg_205_1.time_ - var_208_2) / var_208_3

				if arg_205_1.var_.characterEffect1029ui_story then
					arg_205_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_205_1.time_ >= var_208_2 + var_208_3 and arg_205_1.time_ < var_208_2 + var_208_3 + arg_208_0 and arg_205_1.var_.characterEffect1029ui_story then
				arg_205_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_208_5 = 0
			local var_208_6 = 0.525

			if var_208_5 < arg_205_1.time_ and arg_205_1.time_ <= var_208_5 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_7 = arg_205_1:FormatText(StoryNameCfg[319].name)

				arg_205_1.leftNameTxt_.text = var_208_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_8 = arg_205_1:GetWordFromCfg(116021047)
				local var_208_9 = arg_205_1:FormatText(var_208_8.content)

				arg_205_1.text_.text = var_208_9

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_10 = 21
				local var_208_11 = utf8.len(var_208_9)
				local var_208_12 = var_208_10 <= 0 and var_208_6 or var_208_6 * (var_208_11 / var_208_10)

				if var_208_12 > 0 and var_208_6 < var_208_12 then
					arg_205_1.talkMaxDuration = var_208_12

					if var_208_12 + var_208_5 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_12 + var_208_5
					end
				end

				arg_205_1.text_.text = var_208_9
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021047", "story_v_out_116021.awb") ~= 0 then
					local var_208_13 = manager.audio:GetVoiceLength("story_v_out_116021", "116021047", "story_v_out_116021.awb") / 1000

					if var_208_13 + var_208_5 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_13 + var_208_5
					end

					if var_208_8.prefab_name ~= "" and arg_205_1.actors_[var_208_8.prefab_name] ~= nil then
						local var_208_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_8.prefab_name].transform, "story_v_out_116021", "116021047", "story_v_out_116021.awb")

						arg_205_1:RecordAudio("116021047", var_208_14)
						arg_205_1:RecordAudio("116021047", var_208_14)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_116021", "116021047", "story_v_out_116021.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_116021", "116021047", "story_v_out_116021.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_15 = math.max(var_208_6, arg_205_1.talkMaxDuration)

			if var_208_5 <= arg_205_1.time_ and arg_205_1.time_ < var_208_5 + var_208_15 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_5) / var_208_15

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_5 + var_208_15 and arg_205_1.time_ < var_208_5 + var_208_15 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play116021048 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 116021048
		arg_209_1.duration_ = 5

		SetActive(arg_209_1.tipsGo_, false)

		function arg_209_1.onSingleLineFinish_()
			arg_209_1.onSingleLineUpdate_ = nil
			arg_209_1.onSingleLineFinish_ = nil
			arg_209_1.state_ = "waiting"
		end

		function arg_209_1.playNext_(arg_211_0)
			if arg_211_0 == 1 then
				arg_209_0:Play116021049(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = arg_209_1.actors_["1029ui_story"].transform
			local var_212_1 = 0

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 then
				arg_209_1.var_.moveOldPos1029ui_story = var_212_0.localPosition
			end

			local var_212_2 = 0.001

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_2 then
				local var_212_3 = (arg_209_1.time_ - var_212_1) / var_212_2
				local var_212_4 = Vector3.New(0, 100, 0)

				var_212_0.localPosition = Vector3.Lerp(arg_209_1.var_.moveOldPos1029ui_story, var_212_4, var_212_3)

				local var_212_5 = manager.ui.mainCamera.transform.position - var_212_0.position

				var_212_0.forward = Vector3.New(var_212_5.x, var_212_5.y, var_212_5.z)

				local var_212_6 = var_212_0.localEulerAngles

				var_212_6.z = 0
				var_212_6.x = 0
				var_212_0.localEulerAngles = var_212_6
			end

			if arg_209_1.time_ >= var_212_1 + var_212_2 and arg_209_1.time_ < var_212_1 + var_212_2 + arg_212_0 then
				var_212_0.localPosition = Vector3.New(0, 100, 0)

				local var_212_7 = manager.ui.mainCamera.transform.position - var_212_0.position

				var_212_0.forward = Vector3.New(var_212_7.x, var_212_7.y, var_212_7.z)

				local var_212_8 = var_212_0.localEulerAngles

				var_212_8.z = 0
				var_212_8.x = 0
				var_212_0.localEulerAngles = var_212_8
			end

			local var_212_9 = 0
			local var_212_10 = 0.9

			if var_212_9 < arg_209_1.time_ and arg_209_1.time_ <= var_212_9 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, false)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_11 = arg_209_1:GetWordFromCfg(116021048)
				local var_212_12 = arg_209_1:FormatText(var_212_11.content)

				arg_209_1.text_.text = var_212_12

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_13 = 36
				local var_212_14 = utf8.len(var_212_12)
				local var_212_15 = var_212_13 <= 0 and var_212_10 or var_212_10 * (var_212_14 / var_212_13)

				if var_212_15 > 0 and var_212_10 < var_212_15 then
					arg_209_1.talkMaxDuration = var_212_15

					if var_212_15 + var_212_9 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_15 + var_212_9
					end
				end

				arg_209_1.text_.text = var_212_12
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)
				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_16 = math.max(var_212_10, arg_209_1.talkMaxDuration)

			if var_212_9 <= arg_209_1.time_ and arg_209_1.time_ < var_212_9 + var_212_16 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_9) / var_212_16

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_9 + var_212_16 and arg_209_1.time_ < var_212_9 + var_212_16 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play116021049 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 116021049
		arg_213_1.duration_ = 5

		SetActive(arg_213_1.tipsGo_, false)

		function arg_213_1.onSingleLineFinish_()
			arg_213_1.onSingleLineUpdate_ = nil
			arg_213_1.onSingleLineFinish_ = nil
			arg_213_1.state_ = "waiting"
		end

		function arg_213_1.playNext_(arg_215_0)
			if arg_215_0 == 1 then
				arg_213_0:Play116021050(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = 0
			local var_216_1 = 1.675

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

				local var_216_2 = arg_213_1:GetWordFromCfg(116021049)
				local var_216_3 = arg_213_1:FormatText(var_216_2.content)

				arg_213_1.text_.text = var_216_3

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_4 = 67
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
	Play116021050 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 116021050
		arg_217_1.duration_ = 5.2

		local var_217_0 = {
			zh = 3.633,
			ja = 5.2
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
				arg_217_0:Play116021051(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = arg_217_1.actors_["1019ui_story"].transform
			local var_220_1 = 0

			if var_220_1 < arg_217_1.time_ and arg_217_1.time_ <= var_220_1 + arg_220_0 then
				arg_217_1.var_.moveOldPos1019ui_story = var_220_0.localPosition
			end

			local var_220_2 = 0.001

			if var_220_1 <= arg_217_1.time_ and arg_217_1.time_ < var_220_1 + var_220_2 then
				local var_220_3 = (arg_217_1.time_ - var_220_1) / var_220_2
				local var_220_4 = Vector3.New(-0.7, -1.08, -5.9)

				var_220_0.localPosition = Vector3.Lerp(arg_217_1.var_.moveOldPos1019ui_story, var_220_4, var_220_3)

				local var_220_5 = manager.ui.mainCamera.transform.position - var_220_0.position

				var_220_0.forward = Vector3.New(var_220_5.x, var_220_5.y, var_220_5.z)

				local var_220_6 = var_220_0.localEulerAngles

				var_220_6.z = 0
				var_220_6.x = 0
				var_220_0.localEulerAngles = var_220_6
			end

			if arg_217_1.time_ >= var_220_1 + var_220_2 and arg_217_1.time_ < var_220_1 + var_220_2 + arg_220_0 then
				var_220_0.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_220_7 = manager.ui.mainCamera.transform.position - var_220_0.position

				var_220_0.forward = Vector3.New(var_220_7.x, var_220_7.y, var_220_7.z)

				local var_220_8 = var_220_0.localEulerAngles

				var_220_8.z = 0
				var_220_8.x = 0
				var_220_0.localEulerAngles = var_220_8
			end

			local var_220_9 = 0

			if var_220_9 < arg_217_1.time_ and arg_217_1.time_ <= var_220_9 + arg_220_0 then
				arg_217_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
			end

			local var_220_10 = 0

			if var_220_10 < arg_217_1.time_ and arg_217_1.time_ <= var_220_10 + arg_220_0 then
				arg_217_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_220_11 = arg_217_1.actors_["1019ui_story"]
			local var_220_12 = 0

			if var_220_12 < arg_217_1.time_ and arg_217_1.time_ <= var_220_12 + arg_220_0 and arg_217_1.var_.characterEffect1019ui_story == nil then
				arg_217_1.var_.characterEffect1019ui_story = var_220_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_220_13 = 0.2

			if var_220_12 <= arg_217_1.time_ and arg_217_1.time_ < var_220_12 + var_220_13 then
				local var_220_14 = (arg_217_1.time_ - var_220_12) / var_220_13

				if arg_217_1.var_.characterEffect1019ui_story then
					arg_217_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_217_1.time_ >= var_220_12 + var_220_13 and arg_217_1.time_ < var_220_12 + var_220_13 + arg_220_0 and arg_217_1.var_.characterEffect1019ui_story then
				arg_217_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_220_15 = 0
			local var_220_16 = 0.4

			if var_220_15 < arg_217_1.time_ and arg_217_1.time_ <= var_220_15 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_17 = arg_217_1:FormatText(StoryNameCfg[13].name)

				arg_217_1.leftNameTxt_.text = var_220_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_18 = arg_217_1:GetWordFromCfg(116021050)
				local var_220_19 = arg_217_1:FormatText(var_220_18.content)

				arg_217_1.text_.text = var_220_19

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_20 = 16
				local var_220_21 = utf8.len(var_220_19)
				local var_220_22 = var_220_20 <= 0 and var_220_16 or var_220_16 * (var_220_21 / var_220_20)

				if var_220_22 > 0 and var_220_16 < var_220_22 then
					arg_217_1.talkMaxDuration = var_220_22

					if var_220_22 + var_220_15 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_22 + var_220_15
					end
				end

				arg_217_1.text_.text = var_220_19
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021050", "story_v_out_116021.awb") ~= 0 then
					local var_220_23 = manager.audio:GetVoiceLength("story_v_out_116021", "116021050", "story_v_out_116021.awb") / 1000

					if var_220_23 + var_220_15 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_23 + var_220_15
					end

					if var_220_18.prefab_name ~= "" and arg_217_1.actors_[var_220_18.prefab_name] ~= nil then
						local var_220_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_18.prefab_name].transform, "story_v_out_116021", "116021050", "story_v_out_116021.awb")

						arg_217_1:RecordAudio("116021050", var_220_24)
						arg_217_1:RecordAudio("116021050", var_220_24)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_out_116021", "116021050", "story_v_out_116021.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_out_116021", "116021050", "story_v_out_116021.awb")
				end

				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_25 = math.max(var_220_16, arg_217_1.talkMaxDuration)

			if var_220_15 <= arg_217_1.time_ and arg_217_1.time_ < var_220_15 + var_220_25 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_15) / var_220_25

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_15 + var_220_25 and arg_217_1.time_ < var_220_15 + var_220_25 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play116021051 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 116021051
		arg_221_1.duration_ = 9.5

		local var_221_0 = {
			zh = 7.3,
			ja = 9.5
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
		end

		function arg_221_1.playNext_(arg_223_0)
			if arg_223_0 == 1 then
				arg_221_0:Play116021052(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = arg_221_1.actors_["1029ui_story"].transform
			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 then
				arg_221_1.var_.moveOldPos1029ui_story = var_224_0.localPosition
			end

			local var_224_2 = 0.001

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_2 then
				local var_224_3 = (arg_221_1.time_ - var_224_1) / var_224_2
				local var_224_4 = Vector3.New(0.7, -1.09, -6.2)

				var_224_0.localPosition = Vector3.Lerp(arg_221_1.var_.moveOldPos1029ui_story, var_224_4, var_224_3)

				local var_224_5 = manager.ui.mainCamera.transform.position - var_224_0.position

				var_224_0.forward = Vector3.New(var_224_5.x, var_224_5.y, var_224_5.z)

				local var_224_6 = var_224_0.localEulerAngles

				var_224_6.z = 0
				var_224_6.x = 0
				var_224_0.localEulerAngles = var_224_6
			end

			if arg_221_1.time_ >= var_224_1 + var_224_2 and arg_221_1.time_ < var_224_1 + var_224_2 + arg_224_0 then
				var_224_0.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_224_7 = manager.ui.mainCamera.transform.position - var_224_0.position

				var_224_0.forward = Vector3.New(var_224_7.x, var_224_7.y, var_224_7.z)

				local var_224_8 = var_224_0.localEulerAngles

				var_224_8.z = 0
				var_224_8.x = 0
				var_224_0.localEulerAngles = var_224_8
			end

			local var_224_9 = 0

			if var_224_9 < arg_221_1.time_ and arg_221_1.time_ <= var_224_9 + arg_224_0 then
				arg_221_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_224_10 = arg_221_1.actors_["1029ui_story"]
			local var_224_11 = 0

			if var_224_11 < arg_221_1.time_ and arg_221_1.time_ <= var_224_11 + arg_224_0 and arg_221_1.var_.characterEffect1029ui_story == nil then
				arg_221_1.var_.characterEffect1029ui_story = var_224_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_224_12 = 0.2

			if var_224_11 <= arg_221_1.time_ and arg_221_1.time_ < var_224_11 + var_224_12 then
				local var_224_13 = (arg_221_1.time_ - var_224_11) / var_224_12

				if arg_221_1.var_.characterEffect1029ui_story then
					arg_221_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_221_1.time_ >= var_224_11 + var_224_12 and arg_221_1.time_ < var_224_11 + var_224_12 + arg_224_0 and arg_221_1.var_.characterEffect1029ui_story then
				arg_221_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_224_14 = arg_221_1.actors_["1019ui_story"]
			local var_224_15 = 0

			if var_224_15 < arg_221_1.time_ and arg_221_1.time_ <= var_224_15 + arg_224_0 and arg_221_1.var_.characterEffect1019ui_story == nil then
				arg_221_1.var_.characterEffect1019ui_story = var_224_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_224_16 = 0.2

			if var_224_15 <= arg_221_1.time_ and arg_221_1.time_ < var_224_15 + var_224_16 then
				local var_224_17 = (arg_221_1.time_ - var_224_15) / var_224_16

				if arg_221_1.var_.characterEffect1019ui_story then
					local var_224_18 = Mathf.Lerp(0, 0.5, var_224_17)

					arg_221_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_221_1.var_.characterEffect1019ui_story.fillRatio = var_224_18
				end
			end

			if arg_221_1.time_ >= var_224_15 + var_224_16 and arg_221_1.time_ < var_224_15 + var_224_16 + arg_224_0 and arg_221_1.var_.characterEffect1019ui_story then
				local var_224_19 = 0.5

				arg_221_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_221_1.var_.characterEffect1019ui_story.fillRatio = var_224_19
			end

			local var_224_20 = 0

			if var_224_20 < arg_221_1.time_ and arg_221_1.time_ <= var_224_20 + arg_224_0 then
				arg_221_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action2_1")
			end

			local var_224_21 = 0

			if var_224_21 < arg_221_1.time_ and arg_221_1.time_ <= var_224_21 + arg_224_0 then
				arg_221_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_224_22 = 0
			local var_224_23 = 0.65

			if var_224_22 < arg_221_1.time_ and arg_221_1.time_ <= var_224_22 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_24 = arg_221_1:FormatText(StoryNameCfg[319].name)

				arg_221_1.leftNameTxt_.text = var_224_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_25 = arg_221_1:GetWordFromCfg(116021051)
				local var_224_26 = arg_221_1:FormatText(var_224_25.content)

				arg_221_1.text_.text = var_224_26

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_27 = 26
				local var_224_28 = utf8.len(var_224_26)
				local var_224_29 = var_224_27 <= 0 and var_224_23 or var_224_23 * (var_224_28 / var_224_27)

				if var_224_29 > 0 and var_224_23 < var_224_29 then
					arg_221_1.talkMaxDuration = var_224_29

					if var_224_29 + var_224_22 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_29 + var_224_22
					end
				end

				arg_221_1.text_.text = var_224_26
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021051", "story_v_out_116021.awb") ~= 0 then
					local var_224_30 = manager.audio:GetVoiceLength("story_v_out_116021", "116021051", "story_v_out_116021.awb") / 1000

					if var_224_30 + var_224_22 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_30 + var_224_22
					end

					if var_224_25.prefab_name ~= "" and arg_221_1.actors_[var_224_25.prefab_name] ~= nil then
						local var_224_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_25.prefab_name].transform, "story_v_out_116021", "116021051", "story_v_out_116021.awb")

						arg_221_1:RecordAudio("116021051", var_224_31)
						arg_221_1:RecordAudio("116021051", var_224_31)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_out_116021", "116021051", "story_v_out_116021.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_out_116021", "116021051", "story_v_out_116021.awb")
				end

				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_32 = math.max(var_224_23, arg_221_1.talkMaxDuration)

			if var_224_22 <= arg_221_1.time_ and arg_221_1.time_ < var_224_22 + var_224_32 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_22) / var_224_32

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_22 + var_224_32 and arg_221_1.time_ < var_224_22 + var_224_32 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play116021052 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 116021052
		arg_225_1.duration_ = 9.7

		local var_225_0 = {
			zh = 6.966,
			ja = 9.7
		}
		local var_225_1 = manager.audio:GetLocalizationFlag()

		if var_225_0[var_225_1] ~= nil then
			arg_225_1.duration_ = var_225_0[var_225_1]
		end

		SetActive(arg_225_1.tipsGo_, false)

		function arg_225_1.onSingleLineFinish_()
			arg_225_1.onSingleLineUpdate_ = nil
			arg_225_1.onSingleLineFinish_ = nil
			arg_225_1.state_ = "waiting"
		end

		function arg_225_1.playNext_(arg_227_0)
			if arg_227_0 == 1 then
				arg_225_0:Play116021053(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = arg_225_1.actors_["1019ui_story"].transform
			local var_228_1 = 0

			if var_228_1 < arg_225_1.time_ and arg_225_1.time_ <= var_228_1 + arg_228_0 then
				arg_225_1.var_.moveOldPos1019ui_story = var_228_0.localPosition
			end

			local var_228_2 = 0.001

			if var_228_1 <= arg_225_1.time_ and arg_225_1.time_ < var_228_1 + var_228_2 then
				local var_228_3 = (arg_225_1.time_ - var_228_1) / var_228_2
				local var_228_4 = Vector3.New(-0.7, -1.08, -5.9)

				var_228_0.localPosition = Vector3.Lerp(arg_225_1.var_.moveOldPos1019ui_story, var_228_4, var_228_3)

				local var_228_5 = manager.ui.mainCamera.transform.position - var_228_0.position

				var_228_0.forward = Vector3.New(var_228_5.x, var_228_5.y, var_228_5.z)

				local var_228_6 = var_228_0.localEulerAngles

				var_228_6.z = 0
				var_228_6.x = 0
				var_228_0.localEulerAngles = var_228_6
			end

			if arg_225_1.time_ >= var_228_1 + var_228_2 and arg_225_1.time_ < var_228_1 + var_228_2 + arg_228_0 then
				var_228_0.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_228_7 = manager.ui.mainCamera.transform.position - var_228_0.position

				var_228_0.forward = Vector3.New(var_228_7.x, var_228_7.y, var_228_7.z)

				local var_228_8 = var_228_0.localEulerAngles

				var_228_8.z = 0
				var_228_8.x = 0
				var_228_0.localEulerAngles = var_228_8
			end

			local var_228_9 = 0

			if var_228_9 < arg_225_1.time_ and arg_225_1.time_ <= var_228_9 + arg_228_0 then
				arg_225_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_228_10 = arg_225_1.actors_["1019ui_story"]
			local var_228_11 = 0

			if var_228_11 < arg_225_1.time_ and arg_225_1.time_ <= var_228_11 + arg_228_0 and arg_225_1.var_.characterEffect1019ui_story == nil then
				arg_225_1.var_.characterEffect1019ui_story = var_228_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_228_12 = 0.2

			if var_228_11 <= arg_225_1.time_ and arg_225_1.time_ < var_228_11 + var_228_12 then
				local var_228_13 = (arg_225_1.time_ - var_228_11) / var_228_12

				if arg_225_1.var_.characterEffect1019ui_story then
					arg_225_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_225_1.time_ >= var_228_11 + var_228_12 and arg_225_1.time_ < var_228_11 + var_228_12 + arg_228_0 and arg_225_1.var_.characterEffect1019ui_story then
				arg_225_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_228_14 = arg_225_1.actors_["1029ui_story"]
			local var_228_15 = 0

			if var_228_15 < arg_225_1.time_ and arg_225_1.time_ <= var_228_15 + arg_228_0 and arg_225_1.var_.characterEffect1029ui_story == nil then
				arg_225_1.var_.characterEffect1029ui_story = var_228_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_228_16 = 0.2

			if var_228_15 <= arg_225_1.time_ and arg_225_1.time_ < var_228_15 + var_228_16 then
				local var_228_17 = (arg_225_1.time_ - var_228_15) / var_228_16

				if arg_225_1.var_.characterEffect1029ui_story then
					local var_228_18 = Mathf.Lerp(0, 0.5, var_228_17)

					arg_225_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_225_1.var_.characterEffect1029ui_story.fillRatio = var_228_18
				end
			end

			if arg_225_1.time_ >= var_228_15 + var_228_16 and arg_225_1.time_ < var_228_15 + var_228_16 + arg_228_0 and arg_225_1.var_.characterEffect1029ui_story then
				local var_228_19 = 0.5

				arg_225_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_225_1.var_.characterEffect1029ui_story.fillRatio = var_228_19
			end

			local var_228_20 = 0

			if var_228_20 < arg_225_1.time_ and arg_225_1.time_ <= var_228_20 + arg_228_0 then
				arg_225_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action2_2")
			end

			local var_228_21 = 0

			if var_228_21 < arg_225_1.time_ and arg_225_1.time_ <= var_228_21 + arg_228_0 then
				arg_225_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_228_22 = 0
			local var_228_23 = 0.75

			if var_228_22 < arg_225_1.time_ and arg_225_1.time_ <= var_228_22 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_24 = arg_225_1:FormatText(StoryNameCfg[13].name)

				arg_225_1.leftNameTxt_.text = var_228_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_25 = arg_225_1:GetWordFromCfg(116021052)
				local var_228_26 = arg_225_1:FormatText(var_228_25.content)

				arg_225_1.text_.text = var_228_26

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_27 = 30
				local var_228_28 = utf8.len(var_228_26)
				local var_228_29 = var_228_27 <= 0 and var_228_23 or var_228_23 * (var_228_28 / var_228_27)

				if var_228_29 > 0 and var_228_23 < var_228_29 then
					arg_225_1.talkMaxDuration = var_228_29

					if var_228_29 + var_228_22 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_29 + var_228_22
					end
				end

				arg_225_1.text_.text = var_228_26
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021052", "story_v_out_116021.awb") ~= 0 then
					local var_228_30 = manager.audio:GetVoiceLength("story_v_out_116021", "116021052", "story_v_out_116021.awb") / 1000

					if var_228_30 + var_228_22 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_30 + var_228_22
					end

					if var_228_25.prefab_name ~= "" and arg_225_1.actors_[var_228_25.prefab_name] ~= nil then
						local var_228_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_25.prefab_name].transform, "story_v_out_116021", "116021052", "story_v_out_116021.awb")

						arg_225_1:RecordAudio("116021052", var_228_31)
						arg_225_1:RecordAudio("116021052", var_228_31)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_out_116021", "116021052", "story_v_out_116021.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_out_116021", "116021052", "story_v_out_116021.awb")
				end

				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_32 = math.max(var_228_23, arg_225_1.talkMaxDuration)

			if var_228_22 <= arg_225_1.time_ and arg_225_1.time_ < var_228_22 + var_228_32 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_22) / var_228_32

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_22 + var_228_32 and arg_225_1.time_ < var_228_22 + var_228_32 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play116021053 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 116021053
		arg_229_1.duration_ = 4

		local var_229_0 = {
			zh = 3.7,
			ja = 4
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
				arg_229_0:Play116021054(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = 0

			if var_232_0 < arg_229_1.time_ and arg_229_1.time_ <= var_232_0 + arg_232_0 then
				arg_229_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_232_1 = arg_229_1.actors_["1029ui_story"]
			local var_232_2 = 0

			if var_232_2 < arg_229_1.time_ and arg_229_1.time_ <= var_232_2 + arg_232_0 and arg_229_1.var_.characterEffect1029ui_story == nil then
				arg_229_1.var_.characterEffect1029ui_story = var_232_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_232_3 = 0.2

			if var_232_2 <= arg_229_1.time_ and arg_229_1.time_ < var_232_2 + var_232_3 then
				local var_232_4 = (arg_229_1.time_ - var_232_2) / var_232_3

				if arg_229_1.var_.characterEffect1029ui_story then
					arg_229_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_229_1.time_ >= var_232_2 + var_232_3 and arg_229_1.time_ < var_232_2 + var_232_3 + arg_232_0 and arg_229_1.var_.characterEffect1029ui_story then
				arg_229_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_232_5 = arg_229_1.actors_["1019ui_story"]
			local var_232_6 = 0

			if var_232_6 < arg_229_1.time_ and arg_229_1.time_ <= var_232_6 + arg_232_0 and arg_229_1.var_.characterEffect1019ui_story == nil then
				arg_229_1.var_.characterEffect1019ui_story = var_232_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_232_7 = 0.2

			if var_232_6 <= arg_229_1.time_ and arg_229_1.time_ < var_232_6 + var_232_7 then
				local var_232_8 = (arg_229_1.time_ - var_232_6) / var_232_7

				if arg_229_1.var_.characterEffect1019ui_story then
					local var_232_9 = Mathf.Lerp(0, 0.5, var_232_8)

					arg_229_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_229_1.var_.characterEffect1019ui_story.fillRatio = var_232_9
				end
			end

			if arg_229_1.time_ >= var_232_6 + var_232_7 and arg_229_1.time_ < var_232_6 + var_232_7 + arg_232_0 and arg_229_1.var_.characterEffect1019ui_story then
				local var_232_10 = 0.5

				arg_229_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_229_1.var_.characterEffect1019ui_story.fillRatio = var_232_10
			end

			local var_232_11 = 0
			local var_232_12 = 0.45

			if var_232_11 < arg_229_1.time_ and arg_229_1.time_ <= var_232_11 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_13 = arg_229_1:FormatText(StoryNameCfg[319].name)

				arg_229_1.leftNameTxt_.text = var_232_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_14 = arg_229_1:GetWordFromCfg(116021053)
				local var_232_15 = arg_229_1:FormatText(var_232_14.content)

				arg_229_1.text_.text = var_232_15

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_16 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021053", "story_v_out_116021.awb") ~= 0 then
					local var_232_19 = manager.audio:GetVoiceLength("story_v_out_116021", "116021053", "story_v_out_116021.awb") / 1000

					if var_232_19 + var_232_11 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_19 + var_232_11
					end

					if var_232_14.prefab_name ~= "" and arg_229_1.actors_[var_232_14.prefab_name] ~= nil then
						local var_232_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_14.prefab_name].transform, "story_v_out_116021", "116021053", "story_v_out_116021.awb")

						arg_229_1:RecordAudio("116021053", var_232_20)
						arg_229_1:RecordAudio("116021053", var_232_20)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_out_116021", "116021053", "story_v_out_116021.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_out_116021", "116021053", "story_v_out_116021.awb")
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
	Play116021054 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 116021054
		arg_233_1.duration_ = 14.533

		local var_233_0 = {
			zh = 9.1,
			ja = 14.533
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
				arg_233_0:Play116021055(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = 0

			if var_236_0 < arg_233_1.time_ and arg_233_1.time_ <= var_236_0 + arg_236_0 then
				arg_233_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_236_1 = arg_233_1.actors_["1019ui_story"]
			local var_236_2 = 0

			if var_236_2 < arg_233_1.time_ and arg_233_1.time_ <= var_236_2 + arg_236_0 and arg_233_1.var_.characterEffect1019ui_story == nil then
				arg_233_1.var_.characterEffect1019ui_story = var_236_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_236_3 = 0.2

			if var_236_2 <= arg_233_1.time_ and arg_233_1.time_ < var_236_2 + var_236_3 then
				local var_236_4 = (arg_233_1.time_ - var_236_2) / var_236_3

				if arg_233_1.var_.characterEffect1019ui_story then
					arg_233_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_233_1.time_ >= var_236_2 + var_236_3 and arg_233_1.time_ < var_236_2 + var_236_3 + arg_236_0 and arg_233_1.var_.characterEffect1019ui_story then
				arg_233_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_236_5 = arg_233_1.actors_["1029ui_story"]
			local var_236_6 = 0

			if var_236_6 < arg_233_1.time_ and arg_233_1.time_ <= var_236_6 + arg_236_0 and arg_233_1.var_.characterEffect1029ui_story == nil then
				arg_233_1.var_.characterEffect1029ui_story = var_236_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_236_7 = 0.2

			if var_236_6 <= arg_233_1.time_ and arg_233_1.time_ < var_236_6 + var_236_7 then
				local var_236_8 = (arg_233_1.time_ - var_236_6) / var_236_7

				if arg_233_1.var_.characterEffect1029ui_story then
					local var_236_9 = Mathf.Lerp(0, 0.5, var_236_8)

					arg_233_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_233_1.var_.characterEffect1029ui_story.fillRatio = var_236_9
				end
			end

			if arg_233_1.time_ >= var_236_6 + var_236_7 and arg_233_1.time_ < var_236_6 + var_236_7 + arg_236_0 and arg_233_1.var_.characterEffect1029ui_story then
				local var_236_10 = 0.5

				arg_233_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_233_1.var_.characterEffect1029ui_story.fillRatio = var_236_10
			end

			local var_236_11 = 0
			local var_236_12 = 1.025

			if var_236_11 < arg_233_1.time_ and arg_233_1.time_ <= var_236_11 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_13 = arg_233_1:FormatText(StoryNameCfg[13].name)

				arg_233_1.leftNameTxt_.text = var_236_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_14 = arg_233_1:GetWordFromCfg(116021054)
				local var_236_15 = arg_233_1:FormatText(var_236_14.content)

				arg_233_1.text_.text = var_236_15

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_16 = 41
				local var_236_17 = utf8.len(var_236_15)
				local var_236_18 = var_236_16 <= 0 and var_236_12 or var_236_12 * (var_236_17 / var_236_16)

				if var_236_18 > 0 and var_236_12 < var_236_18 then
					arg_233_1.talkMaxDuration = var_236_18

					if var_236_18 + var_236_11 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_18 + var_236_11
					end
				end

				arg_233_1.text_.text = var_236_15
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021054", "story_v_out_116021.awb") ~= 0 then
					local var_236_19 = manager.audio:GetVoiceLength("story_v_out_116021", "116021054", "story_v_out_116021.awb") / 1000

					if var_236_19 + var_236_11 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_19 + var_236_11
					end

					if var_236_14.prefab_name ~= "" and arg_233_1.actors_[var_236_14.prefab_name] ~= nil then
						local var_236_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_233_1.actors_[var_236_14.prefab_name].transform, "story_v_out_116021", "116021054", "story_v_out_116021.awb")

						arg_233_1:RecordAudio("116021054", var_236_20)
						arg_233_1:RecordAudio("116021054", var_236_20)
					else
						arg_233_1:AudioAction("play", "voice", "story_v_out_116021", "116021054", "story_v_out_116021.awb")
					end

					arg_233_1:RecordHistoryTalkVoice("story_v_out_116021", "116021054", "story_v_out_116021.awb")
				end

				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_21 = math.max(var_236_12, arg_233_1.talkMaxDuration)

			if var_236_11 <= arg_233_1.time_ and arg_233_1.time_ < var_236_11 + var_236_21 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_11) / var_236_21

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_11 + var_236_21 and arg_233_1.time_ < var_236_11 + var_236_21 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play116021055 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 116021055
		arg_237_1.duration_ = 8.8

		local var_237_0 = {
			zh = 7.066,
			ja = 8.8
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
				arg_237_0:Play116021056(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = 0

			if var_240_0 < arg_237_1.time_ and arg_237_1.time_ <= var_240_0 + arg_240_0 then
				arg_237_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_240_1 = 0
			local var_240_2 = 0.975

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_3 = arg_237_1:FormatText(StoryNameCfg[13].name)

				arg_237_1.leftNameTxt_.text = var_240_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_4 = arg_237_1:GetWordFromCfg(116021055)
				local var_240_5 = arg_237_1:FormatText(var_240_4.content)

				arg_237_1.text_.text = var_240_5

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_6 = 39
				local var_240_7 = utf8.len(var_240_5)
				local var_240_8 = var_240_6 <= 0 and var_240_2 or var_240_2 * (var_240_7 / var_240_6)

				if var_240_8 > 0 and var_240_2 < var_240_8 then
					arg_237_1.talkMaxDuration = var_240_8

					if var_240_8 + var_240_1 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_8 + var_240_1
					end
				end

				arg_237_1.text_.text = var_240_5
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021055", "story_v_out_116021.awb") ~= 0 then
					local var_240_9 = manager.audio:GetVoiceLength("story_v_out_116021", "116021055", "story_v_out_116021.awb") / 1000

					if var_240_9 + var_240_1 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_9 + var_240_1
					end

					if var_240_4.prefab_name ~= "" and arg_237_1.actors_[var_240_4.prefab_name] ~= nil then
						local var_240_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_237_1.actors_[var_240_4.prefab_name].transform, "story_v_out_116021", "116021055", "story_v_out_116021.awb")

						arg_237_1:RecordAudio("116021055", var_240_10)
						arg_237_1:RecordAudio("116021055", var_240_10)
					else
						arg_237_1:AudioAction("play", "voice", "story_v_out_116021", "116021055", "story_v_out_116021.awb")
					end

					arg_237_1:RecordHistoryTalkVoice("story_v_out_116021", "116021055", "story_v_out_116021.awb")
				end

				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_11 = math.max(var_240_2, arg_237_1.talkMaxDuration)

			if var_240_1 <= arg_237_1.time_ and arg_237_1.time_ < var_240_1 + var_240_11 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_1) / var_240_11

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_1 + var_240_11 and arg_237_1.time_ < var_240_1 + var_240_11 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play116021056 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 116021056
		arg_241_1.duration_ = 5.166

		local var_241_0 = {
			zh = 1.999999999999,
			ja = 5.166
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
				arg_241_0:Play116021057(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = 0

			if var_244_0 < arg_241_1.time_ and arg_241_1.time_ <= var_244_0 + arg_244_0 then
				arg_241_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_244_1 = arg_241_1.actors_["1019ui_story"]
			local var_244_2 = 0

			if var_244_2 < arg_241_1.time_ and arg_241_1.time_ <= var_244_2 + arg_244_0 and arg_241_1.var_.characterEffect1019ui_story == nil then
				arg_241_1.var_.characterEffect1019ui_story = var_244_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_244_3 = 0.2

			if var_244_2 <= arg_241_1.time_ and arg_241_1.time_ < var_244_2 + var_244_3 then
				local var_244_4 = (arg_241_1.time_ - var_244_2) / var_244_3

				if arg_241_1.var_.characterEffect1019ui_story then
					local var_244_5 = Mathf.Lerp(0, 0.5, var_244_4)

					arg_241_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_241_1.var_.characterEffect1019ui_story.fillRatio = var_244_5
				end
			end

			if arg_241_1.time_ >= var_244_2 + var_244_3 and arg_241_1.time_ < var_244_2 + var_244_3 + arg_244_0 and arg_241_1.var_.characterEffect1019ui_story then
				local var_244_6 = 0.5

				arg_241_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_241_1.var_.characterEffect1019ui_story.fillRatio = var_244_6
			end

			local var_244_7 = arg_241_1.actors_["1029ui_story"]
			local var_244_8 = 0

			if var_244_8 < arg_241_1.time_ and arg_241_1.time_ <= var_244_8 + arg_244_0 and arg_241_1.var_.characterEffect1029ui_story == nil then
				arg_241_1.var_.characterEffect1029ui_story = var_244_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_244_9 = 0.2

			if var_244_8 <= arg_241_1.time_ and arg_241_1.time_ < var_244_8 + var_244_9 then
				local var_244_10 = (arg_241_1.time_ - var_244_8) / var_244_9

				if arg_241_1.var_.characterEffect1029ui_story then
					arg_241_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_241_1.time_ >= var_244_8 + var_244_9 and arg_241_1.time_ < var_244_8 + var_244_9 + arg_244_0 and arg_241_1.var_.characterEffect1029ui_story then
				arg_241_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_244_11 = 0
			local var_244_12 = 0.075

			if var_244_11 < arg_241_1.time_ and arg_241_1.time_ <= var_244_11 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_13 = arg_241_1:FormatText(StoryNameCfg[319].name)

				arg_241_1.leftNameTxt_.text = var_244_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_14 = arg_241_1:GetWordFromCfg(116021056)
				local var_244_15 = arg_241_1:FormatText(var_244_14.content)

				arg_241_1.text_.text = var_244_15

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_16 = 3
				local var_244_17 = utf8.len(var_244_15)
				local var_244_18 = var_244_16 <= 0 and var_244_12 or var_244_12 * (var_244_17 / var_244_16)

				if var_244_18 > 0 and var_244_12 < var_244_18 then
					arg_241_1.talkMaxDuration = var_244_18

					if var_244_18 + var_244_11 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_18 + var_244_11
					end
				end

				arg_241_1.text_.text = var_244_15
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021056", "story_v_out_116021.awb") ~= 0 then
					local var_244_19 = manager.audio:GetVoiceLength("story_v_out_116021", "116021056", "story_v_out_116021.awb") / 1000

					if var_244_19 + var_244_11 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_19 + var_244_11
					end

					if var_244_14.prefab_name ~= "" and arg_241_1.actors_[var_244_14.prefab_name] ~= nil then
						local var_244_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_241_1.actors_[var_244_14.prefab_name].transform, "story_v_out_116021", "116021056", "story_v_out_116021.awb")

						arg_241_1:RecordAudio("116021056", var_244_20)
						arg_241_1:RecordAudio("116021056", var_244_20)
					else
						arg_241_1:AudioAction("play", "voice", "story_v_out_116021", "116021056", "story_v_out_116021.awb")
					end

					arg_241_1:RecordHistoryTalkVoice("story_v_out_116021", "116021056", "story_v_out_116021.awb")
				end

				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_21 = math.max(var_244_12, arg_241_1.talkMaxDuration)

			if var_244_11 <= arg_241_1.time_ and arg_241_1.time_ < var_244_11 + var_244_21 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_11) / var_244_21

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_11 + var_244_21 and arg_241_1.time_ < var_244_11 + var_244_21 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play116021057 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 116021057
		arg_245_1.duration_ = 6.9

		local var_245_0 = {
			zh = 3.466,
			ja = 6.9
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
				arg_245_0:Play116021058(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = 0

			if var_248_0 < arg_245_1.time_ and arg_245_1.time_ <= var_248_0 + arg_248_0 then
				arg_245_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_248_1 = arg_245_1.actors_["1019ui_story"]
			local var_248_2 = 0

			if var_248_2 < arg_245_1.time_ and arg_245_1.time_ <= var_248_2 + arg_248_0 and arg_245_1.var_.characterEffect1019ui_story == nil then
				arg_245_1.var_.characterEffect1019ui_story = var_248_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_248_3 = 0.2

			if var_248_2 <= arg_245_1.time_ and arg_245_1.time_ < var_248_2 + var_248_3 then
				local var_248_4 = (arg_245_1.time_ - var_248_2) / var_248_3

				if arg_245_1.var_.characterEffect1019ui_story then
					arg_245_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_245_1.time_ >= var_248_2 + var_248_3 and arg_245_1.time_ < var_248_2 + var_248_3 + arg_248_0 and arg_245_1.var_.characterEffect1019ui_story then
				arg_245_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_248_5 = arg_245_1.actors_["1029ui_story"]
			local var_248_6 = 0

			if var_248_6 < arg_245_1.time_ and arg_245_1.time_ <= var_248_6 + arg_248_0 and arg_245_1.var_.characterEffect1029ui_story == nil then
				arg_245_1.var_.characterEffect1029ui_story = var_248_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_248_7 = 0.2

			if var_248_6 <= arg_245_1.time_ and arg_245_1.time_ < var_248_6 + var_248_7 then
				local var_248_8 = (arg_245_1.time_ - var_248_6) / var_248_7

				if arg_245_1.var_.characterEffect1029ui_story then
					local var_248_9 = Mathf.Lerp(0, 0.5, var_248_8)

					arg_245_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_245_1.var_.characterEffect1029ui_story.fillRatio = var_248_9
				end
			end

			if arg_245_1.time_ >= var_248_6 + var_248_7 and arg_245_1.time_ < var_248_6 + var_248_7 + arg_248_0 and arg_245_1.var_.characterEffect1029ui_story then
				local var_248_10 = 0.5

				arg_245_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_245_1.var_.characterEffect1029ui_story.fillRatio = var_248_10
			end

			local var_248_11 = 0
			local var_248_12 = 0.45

			if var_248_11 < arg_245_1.time_ and arg_245_1.time_ <= var_248_11 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_13 = arg_245_1:FormatText(StoryNameCfg[13].name)

				arg_245_1.leftNameTxt_.text = var_248_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_14 = arg_245_1:GetWordFromCfg(116021057)
				local var_248_15 = arg_245_1:FormatText(var_248_14.content)

				arg_245_1.text_.text = var_248_15

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_16 = 18
				local var_248_17 = utf8.len(var_248_15)
				local var_248_18 = var_248_16 <= 0 and var_248_12 or var_248_12 * (var_248_17 / var_248_16)

				if var_248_18 > 0 and var_248_12 < var_248_18 then
					arg_245_1.talkMaxDuration = var_248_18

					if var_248_18 + var_248_11 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_18 + var_248_11
					end
				end

				arg_245_1.text_.text = var_248_15
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021057", "story_v_out_116021.awb") ~= 0 then
					local var_248_19 = manager.audio:GetVoiceLength("story_v_out_116021", "116021057", "story_v_out_116021.awb") / 1000

					if var_248_19 + var_248_11 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_19 + var_248_11
					end

					if var_248_14.prefab_name ~= "" and arg_245_1.actors_[var_248_14.prefab_name] ~= nil then
						local var_248_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_245_1.actors_[var_248_14.prefab_name].transform, "story_v_out_116021", "116021057", "story_v_out_116021.awb")

						arg_245_1:RecordAudio("116021057", var_248_20)
						arg_245_1:RecordAudio("116021057", var_248_20)
					else
						arg_245_1:AudioAction("play", "voice", "story_v_out_116021", "116021057", "story_v_out_116021.awb")
					end

					arg_245_1:RecordHistoryTalkVoice("story_v_out_116021", "116021057", "story_v_out_116021.awb")
				end

				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_21 = math.max(var_248_12, arg_245_1.talkMaxDuration)

			if var_248_11 <= arg_245_1.time_ and arg_245_1.time_ < var_248_11 + var_248_21 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_11) / var_248_21

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_11 + var_248_21 and arg_245_1.time_ < var_248_11 + var_248_21 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play116021058 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 116021058
		arg_249_1.duration_ = 5.5

		local var_249_0 = {
			zh = 4.933,
			ja = 5.5
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
				arg_249_0:Play116021059(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = 0

			if var_252_0 < arg_249_1.time_ and arg_249_1.time_ <= var_252_0 + arg_252_0 then
				arg_249_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action6_1")
			end

			local var_252_1 = 0

			if var_252_1 < arg_249_1.time_ and arg_249_1.time_ <= var_252_1 + arg_252_0 then
				arg_249_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_252_2 = arg_249_1.actors_["1019ui_story"]
			local var_252_3 = 0

			if var_252_3 < arg_249_1.time_ and arg_249_1.time_ <= var_252_3 + arg_252_0 and arg_249_1.var_.characterEffect1019ui_story == nil then
				arg_249_1.var_.characterEffect1019ui_story = var_252_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_252_4 = 0.2

			if var_252_3 <= arg_249_1.time_ and arg_249_1.time_ < var_252_3 + var_252_4 then
				local var_252_5 = (arg_249_1.time_ - var_252_3) / var_252_4

				if arg_249_1.var_.characterEffect1019ui_story then
					local var_252_6 = Mathf.Lerp(0, 0.5, var_252_5)

					arg_249_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_249_1.var_.characterEffect1019ui_story.fillRatio = var_252_6
				end
			end

			if arg_249_1.time_ >= var_252_3 + var_252_4 and arg_249_1.time_ < var_252_3 + var_252_4 + arg_252_0 and arg_249_1.var_.characterEffect1019ui_story then
				local var_252_7 = 0.5

				arg_249_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_249_1.var_.characterEffect1019ui_story.fillRatio = var_252_7
			end

			local var_252_8 = arg_249_1.actors_["1029ui_story"]
			local var_252_9 = 0

			if var_252_9 < arg_249_1.time_ and arg_249_1.time_ <= var_252_9 + arg_252_0 and arg_249_1.var_.characterEffect1029ui_story == nil then
				arg_249_1.var_.characterEffect1029ui_story = var_252_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_252_10 = 0.2

			if var_252_9 <= arg_249_1.time_ and arg_249_1.time_ < var_252_9 + var_252_10 then
				local var_252_11 = (arg_249_1.time_ - var_252_9) / var_252_10

				if arg_249_1.var_.characterEffect1029ui_story then
					arg_249_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_249_1.time_ >= var_252_9 + var_252_10 and arg_249_1.time_ < var_252_9 + var_252_10 + arg_252_0 and arg_249_1.var_.characterEffect1029ui_story then
				arg_249_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_252_12 = 0
			local var_252_13 = 0.4

			if var_252_12 < arg_249_1.time_ and arg_249_1.time_ <= var_252_12 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_14 = arg_249_1:FormatText(StoryNameCfg[319].name)

				arg_249_1.leftNameTxt_.text = var_252_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_15 = arg_249_1:GetWordFromCfg(116021058)
				local var_252_16 = arg_249_1:FormatText(var_252_15.content)

				arg_249_1.text_.text = var_252_16

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_17 = 16
				local var_252_18 = utf8.len(var_252_16)
				local var_252_19 = var_252_17 <= 0 and var_252_13 or var_252_13 * (var_252_18 / var_252_17)

				if var_252_19 > 0 and var_252_13 < var_252_19 then
					arg_249_1.talkMaxDuration = var_252_19

					if var_252_19 + var_252_12 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_19 + var_252_12
					end
				end

				arg_249_1.text_.text = var_252_16
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021058", "story_v_out_116021.awb") ~= 0 then
					local var_252_20 = manager.audio:GetVoiceLength("story_v_out_116021", "116021058", "story_v_out_116021.awb") / 1000

					if var_252_20 + var_252_12 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_20 + var_252_12
					end

					if var_252_15.prefab_name ~= "" and arg_249_1.actors_[var_252_15.prefab_name] ~= nil then
						local var_252_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_249_1.actors_[var_252_15.prefab_name].transform, "story_v_out_116021", "116021058", "story_v_out_116021.awb")

						arg_249_1:RecordAudio("116021058", var_252_21)
						arg_249_1:RecordAudio("116021058", var_252_21)
					else
						arg_249_1:AudioAction("play", "voice", "story_v_out_116021", "116021058", "story_v_out_116021.awb")
					end

					arg_249_1:RecordHistoryTalkVoice("story_v_out_116021", "116021058", "story_v_out_116021.awb")
				end

				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_22 = math.max(var_252_13, arg_249_1.talkMaxDuration)

			if var_252_12 <= arg_249_1.time_ and arg_249_1.time_ < var_252_12 + var_252_22 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_12) / var_252_22

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_12 + var_252_22 and arg_249_1.time_ < var_252_12 + var_252_22 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play116021059 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 116021059
		arg_253_1.duration_ = 6.366

		local var_253_0 = {
			zh = 4.566,
			ja = 6.366
		}
		local var_253_1 = manager.audio:GetLocalizationFlag()

		if var_253_0[var_253_1] ~= nil then
			arg_253_1.duration_ = var_253_0[var_253_1]
		end

		SetActive(arg_253_1.tipsGo_, false)

		function arg_253_1.onSingleLineFinish_()
			arg_253_1.onSingleLineUpdate_ = nil
			arg_253_1.onSingleLineFinish_ = nil
			arg_253_1.state_ = "waiting"
		end

		function arg_253_1.playNext_(arg_255_0)
			if arg_255_0 == 1 then
				arg_253_0:Play116021060(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = 0

			if var_256_0 < arg_253_1.time_ and arg_253_1.time_ <= var_256_0 + arg_256_0 then
				arg_253_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_256_1 = arg_253_1.actors_["1019ui_story"]
			local var_256_2 = 0

			if var_256_2 < arg_253_1.time_ and arg_253_1.time_ <= var_256_2 + arg_256_0 and arg_253_1.var_.characterEffect1019ui_story == nil then
				arg_253_1.var_.characterEffect1019ui_story = var_256_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_256_3 = 0.2

			if var_256_2 <= arg_253_1.time_ and arg_253_1.time_ < var_256_2 + var_256_3 then
				local var_256_4 = (arg_253_1.time_ - var_256_2) / var_256_3

				if arg_253_1.var_.characterEffect1019ui_story then
					arg_253_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_253_1.time_ >= var_256_2 + var_256_3 and arg_253_1.time_ < var_256_2 + var_256_3 + arg_256_0 and arg_253_1.var_.characterEffect1019ui_story then
				arg_253_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_256_5 = arg_253_1.actors_["1029ui_story"]
			local var_256_6 = 0

			if var_256_6 < arg_253_1.time_ and arg_253_1.time_ <= var_256_6 + arg_256_0 and arg_253_1.var_.characterEffect1029ui_story == nil then
				arg_253_1.var_.characterEffect1029ui_story = var_256_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_256_7 = 0.2

			if var_256_6 <= arg_253_1.time_ and arg_253_1.time_ < var_256_6 + var_256_7 then
				local var_256_8 = (arg_253_1.time_ - var_256_6) / var_256_7

				if arg_253_1.var_.characterEffect1029ui_story then
					local var_256_9 = Mathf.Lerp(0, 0.5, var_256_8)

					arg_253_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_253_1.var_.characterEffect1029ui_story.fillRatio = var_256_9
				end
			end

			if arg_253_1.time_ >= var_256_6 + var_256_7 and arg_253_1.time_ < var_256_6 + var_256_7 + arg_256_0 and arg_253_1.var_.characterEffect1029ui_story then
				local var_256_10 = 0.5

				arg_253_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_253_1.var_.characterEffect1029ui_story.fillRatio = var_256_10
			end

			local var_256_11 = 0
			local var_256_12 = 0.475

			if var_256_11 < arg_253_1.time_ and arg_253_1.time_ <= var_256_11 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_13 = arg_253_1:FormatText(StoryNameCfg[13].name)

				arg_253_1.leftNameTxt_.text = var_256_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_14 = arg_253_1:GetWordFromCfg(116021059)
				local var_256_15 = arg_253_1:FormatText(var_256_14.content)

				arg_253_1.text_.text = var_256_15

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_16 = 19
				local var_256_17 = utf8.len(var_256_15)
				local var_256_18 = var_256_16 <= 0 and var_256_12 or var_256_12 * (var_256_17 / var_256_16)

				if var_256_18 > 0 and var_256_12 < var_256_18 then
					arg_253_1.talkMaxDuration = var_256_18

					if var_256_18 + var_256_11 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_18 + var_256_11
					end
				end

				arg_253_1.text_.text = var_256_15
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021059", "story_v_out_116021.awb") ~= 0 then
					local var_256_19 = manager.audio:GetVoiceLength("story_v_out_116021", "116021059", "story_v_out_116021.awb") / 1000

					if var_256_19 + var_256_11 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_19 + var_256_11
					end

					if var_256_14.prefab_name ~= "" and arg_253_1.actors_[var_256_14.prefab_name] ~= nil then
						local var_256_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_253_1.actors_[var_256_14.prefab_name].transform, "story_v_out_116021", "116021059", "story_v_out_116021.awb")

						arg_253_1:RecordAudio("116021059", var_256_20)
						arg_253_1:RecordAudio("116021059", var_256_20)
					else
						arg_253_1:AudioAction("play", "voice", "story_v_out_116021", "116021059", "story_v_out_116021.awb")
					end

					arg_253_1:RecordHistoryTalkVoice("story_v_out_116021", "116021059", "story_v_out_116021.awb")
				end

				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_21 = math.max(var_256_12, arg_253_1.talkMaxDuration)

			if var_256_11 <= arg_253_1.time_ and arg_253_1.time_ < var_256_11 + var_256_21 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_11) / var_256_21

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_11 + var_256_21 and arg_253_1.time_ < var_256_11 + var_256_21 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play116021060 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 116021060
		arg_257_1.duration_ = 17.3

		local var_257_0 = {
			zh = 17.3,
			ja = 12.433
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
				arg_257_0:Play116021061(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = 0

			if var_260_0 < arg_257_1.time_ and arg_257_1.time_ <= var_260_0 + arg_260_0 then
				arg_257_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029actionlink/1029action462")
			end

			local var_260_1 = 0

			if var_260_1 < arg_257_1.time_ and arg_257_1.time_ <= var_260_1 + arg_260_0 then
				arg_257_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_260_2 = arg_257_1.actors_["1019ui_story"]
			local var_260_3 = 0

			if var_260_3 < arg_257_1.time_ and arg_257_1.time_ <= var_260_3 + arg_260_0 and arg_257_1.var_.characterEffect1019ui_story == nil then
				arg_257_1.var_.characterEffect1019ui_story = var_260_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_260_4 = 0.2

			if var_260_3 <= arg_257_1.time_ and arg_257_1.time_ < var_260_3 + var_260_4 then
				local var_260_5 = (arg_257_1.time_ - var_260_3) / var_260_4

				if arg_257_1.var_.characterEffect1019ui_story then
					local var_260_6 = Mathf.Lerp(0, 0.5, var_260_5)

					arg_257_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_257_1.var_.characterEffect1019ui_story.fillRatio = var_260_6
				end
			end

			if arg_257_1.time_ >= var_260_3 + var_260_4 and arg_257_1.time_ < var_260_3 + var_260_4 + arg_260_0 and arg_257_1.var_.characterEffect1019ui_story then
				local var_260_7 = 0.5

				arg_257_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_257_1.var_.characterEffect1019ui_story.fillRatio = var_260_7
			end

			local var_260_8 = arg_257_1.actors_["1029ui_story"]
			local var_260_9 = 0

			if var_260_9 < arg_257_1.time_ and arg_257_1.time_ <= var_260_9 + arg_260_0 and arg_257_1.var_.characterEffect1029ui_story == nil then
				arg_257_1.var_.characterEffect1029ui_story = var_260_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_260_10 = 0.2

			if var_260_9 <= arg_257_1.time_ and arg_257_1.time_ < var_260_9 + var_260_10 then
				local var_260_11 = (arg_257_1.time_ - var_260_9) / var_260_10

				if arg_257_1.var_.characterEffect1029ui_story then
					arg_257_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_257_1.time_ >= var_260_9 + var_260_10 and arg_257_1.time_ < var_260_9 + var_260_10 + arg_260_0 and arg_257_1.var_.characterEffect1029ui_story then
				arg_257_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_260_12 = 0
			local var_260_13 = 2.075

			if var_260_12 < arg_257_1.time_ and arg_257_1.time_ <= var_260_12 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, true)

				local var_260_14 = arg_257_1:FormatText(StoryNameCfg[319].name)

				arg_257_1.leftNameTxt_.text = var_260_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_257_1.leftNameTxt_.transform)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1.leftNameTxt_.text)
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_15 = arg_257_1:GetWordFromCfg(116021060)
				local var_260_16 = arg_257_1:FormatText(var_260_15.content)

				arg_257_1.text_.text = var_260_16

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_17 = 83
				local var_260_18 = utf8.len(var_260_16)
				local var_260_19 = var_260_17 <= 0 and var_260_13 or var_260_13 * (var_260_18 / var_260_17)

				if var_260_19 > 0 and var_260_13 < var_260_19 then
					arg_257_1.talkMaxDuration = var_260_19

					if var_260_19 + var_260_12 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_19 + var_260_12
					end
				end

				arg_257_1.text_.text = var_260_16
				arg_257_1.typewritter.percent = 0

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021060", "story_v_out_116021.awb") ~= 0 then
					local var_260_20 = manager.audio:GetVoiceLength("story_v_out_116021", "116021060", "story_v_out_116021.awb") / 1000

					if var_260_20 + var_260_12 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_20 + var_260_12
					end

					if var_260_15.prefab_name ~= "" and arg_257_1.actors_[var_260_15.prefab_name] ~= nil then
						local var_260_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_257_1.actors_[var_260_15.prefab_name].transform, "story_v_out_116021", "116021060", "story_v_out_116021.awb")

						arg_257_1:RecordAudio("116021060", var_260_21)
						arg_257_1:RecordAudio("116021060", var_260_21)
					else
						arg_257_1:AudioAction("play", "voice", "story_v_out_116021", "116021060", "story_v_out_116021.awb")
					end

					arg_257_1:RecordHistoryTalkVoice("story_v_out_116021", "116021060", "story_v_out_116021.awb")
				end

				arg_257_1:RecordContent(arg_257_1.text_.text)
			end

			local var_260_22 = math.max(var_260_13, arg_257_1.talkMaxDuration)

			if var_260_12 <= arg_257_1.time_ and arg_257_1.time_ < var_260_12 + var_260_22 then
				arg_257_1.typewritter.percent = (arg_257_1.time_ - var_260_12) / var_260_22

				arg_257_1.typewritter:SetDirty()
			end

			if arg_257_1.time_ >= var_260_12 + var_260_22 and arg_257_1.time_ < var_260_12 + var_260_22 + arg_260_0 then
				arg_257_1.typewritter.percent = 1

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(true)
			end
		end
	end,
	Play116021061 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 116021061
		arg_261_1.duration_ = 2.399999999999

		SetActive(arg_261_1.tipsGo_, false)

		function arg_261_1.onSingleLineFinish_()
			arg_261_1.onSingleLineUpdate_ = nil
			arg_261_1.onSingleLineFinish_ = nil
			arg_261_1.state_ = "waiting"
		end

		function arg_261_1.playNext_(arg_263_0)
			if arg_263_0 == 1 then
				arg_261_0:Play116021062(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = 0

			if var_264_0 < arg_261_1.time_ and arg_261_1.time_ <= var_264_0 + arg_264_0 then
				arg_261_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_264_1 = arg_261_1.actors_["1019ui_story"]
			local var_264_2 = 0

			if var_264_2 < arg_261_1.time_ and arg_261_1.time_ <= var_264_2 + arg_264_0 and arg_261_1.var_.characterEffect1019ui_story == nil then
				arg_261_1.var_.characterEffect1019ui_story = var_264_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_264_3 = 0.2

			if var_264_2 <= arg_261_1.time_ and arg_261_1.time_ < var_264_2 + var_264_3 then
				local var_264_4 = (arg_261_1.time_ - var_264_2) / var_264_3

				if arg_261_1.var_.characterEffect1019ui_story then
					arg_261_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_261_1.time_ >= var_264_2 + var_264_3 and arg_261_1.time_ < var_264_2 + var_264_3 + arg_264_0 and arg_261_1.var_.characterEffect1019ui_story then
				arg_261_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_264_5 = arg_261_1.actors_["1029ui_story"]
			local var_264_6 = 0

			if var_264_6 < arg_261_1.time_ and arg_261_1.time_ <= var_264_6 + arg_264_0 and arg_261_1.var_.characterEffect1029ui_story == nil then
				arg_261_1.var_.characterEffect1029ui_story = var_264_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_264_7 = 0.2

			if var_264_6 <= arg_261_1.time_ and arg_261_1.time_ < var_264_6 + var_264_7 then
				local var_264_8 = (arg_261_1.time_ - var_264_6) / var_264_7

				if arg_261_1.var_.characterEffect1029ui_story then
					local var_264_9 = Mathf.Lerp(0, 0.5, var_264_8)

					arg_261_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_261_1.var_.characterEffect1029ui_story.fillRatio = var_264_9
				end
			end

			if arg_261_1.time_ >= var_264_6 + var_264_7 and arg_261_1.time_ < var_264_6 + var_264_7 + arg_264_0 and arg_261_1.var_.characterEffect1029ui_story then
				local var_264_10 = 0.5

				arg_261_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_261_1.var_.characterEffect1029ui_story.fillRatio = var_264_10
			end

			local var_264_11 = 0
			local var_264_12 = 0.05

			if var_264_11 < arg_261_1.time_ and arg_261_1.time_ <= var_264_11 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, true)

				local var_264_13 = arg_261_1:FormatText(StoryNameCfg[13].name)

				arg_261_1.leftNameTxt_.text = var_264_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_261_1.leftNameTxt_.transform)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1.leftNameTxt_.text)
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_14 = arg_261_1:GetWordFromCfg(116021061)
				local var_264_15 = arg_261_1:FormatText(var_264_14.content)

				arg_261_1.text_.text = var_264_15

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_16 = 2
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

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021061", "story_v_out_116021.awb") ~= 0 then
					local var_264_19 = manager.audio:GetVoiceLength("story_v_out_116021", "116021061", "story_v_out_116021.awb") / 1000

					if var_264_19 + var_264_11 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_19 + var_264_11
					end

					if var_264_14.prefab_name ~= "" and arg_261_1.actors_[var_264_14.prefab_name] ~= nil then
						local var_264_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_261_1.actors_[var_264_14.prefab_name].transform, "story_v_out_116021", "116021061", "story_v_out_116021.awb")

						arg_261_1:RecordAudio("116021061", var_264_20)
						arg_261_1:RecordAudio("116021061", var_264_20)
					else
						arg_261_1:AudioAction("play", "voice", "story_v_out_116021", "116021061", "story_v_out_116021.awb")
					end

					arg_261_1:RecordHistoryTalkVoice("story_v_out_116021", "116021061", "story_v_out_116021.awb")
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
	Play116021062 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 116021062
		arg_265_1.duration_ = 12.633

		local var_265_0 = {
			zh = 9.966,
			ja = 12.633
		}
		local var_265_1 = manager.audio:GetLocalizationFlag()

		if var_265_0[var_265_1] ~= nil then
			arg_265_1.duration_ = var_265_0[var_265_1]
		end

		SetActive(arg_265_1.tipsGo_, false)

		function arg_265_1.onSingleLineFinish_()
			arg_265_1.onSingleLineUpdate_ = nil
			arg_265_1.onSingleLineFinish_ = nil
			arg_265_1.state_ = "waiting"
		end

		function arg_265_1.playNext_(arg_267_0)
			if arg_267_0 == 1 then
				arg_265_0:Play116021063(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = 0

			if var_268_0 < arg_265_1.time_ and arg_265_1.time_ <= var_268_0 + arg_268_0 then
				arg_265_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action2_2")
			end

			local var_268_1 = 0

			if var_268_1 < arg_265_1.time_ and arg_265_1.time_ <= var_268_1 + arg_268_0 then
				arg_265_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_268_2 = arg_265_1.actors_["1019ui_story"]
			local var_268_3 = 0

			if var_268_3 < arg_265_1.time_ and arg_265_1.time_ <= var_268_3 + arg_268_0 and arg_265_1.var_.characterEffect1019ui_story == nil then
				arg_265_1.var_.characterEffect1019ui_story = var_268_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_268_4 = 0.2

			if var_268_3 <= arg_265_1.time_ and arg_265_1.time_ < var_268_3 + var_268_4 then
				local var_268_5 = (arg_265_1.time_ - var_268_3) / var_268_4

				if arg_265_1.var_.characterEffect1019ui_story then
					local var_268_6 = Mathf.Lerp(0, 0.5, var_268_5)

					arg_265_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_265_1.var_.characterEffect1019ui_story.fillRatio = var_268_6
				end
			end

			if arg_265_1.time_ >= var_268_3 + var_268_4 and arg_265_1.time_ < var_268_3 + var_268_4 + arg_268_0 and arg_265_1.var_.characterEffect1019ui_story then
				local var_268_7 = 0.5

				arg_265_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_265_1.var_.characterEffect1019ui_story.fillRatio = var_268_7
			end

			local var_268_8 = arg_265_1.actors_["1029ui_story"]
			local var_268_9 = 0

			if var_268_9 < arg_265_1.time_ and arg_265_1.time_ <= var_268_9 + arg_268_0 and arg_265_1.var_.characterEffect1029ui_story == nil then
				arg_265_1.var_.characterEffect1029ui_story = var_268_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_268_10 = 0.2

			if var_268_9 <= arg_265_1.time_ and arg_265_1.time_ < var_268_9 + var_268_10 then
				local var_268_11 = (arg_265_1.time_ - var_268_9) / var_268_10

				if arg_265_1.var_.characterEffect1029ui_story then
					arg_265_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_265_1.time_ >= var_268_9 + var_268_10 and arg_265_1.time_ < var_268_9 + var_268_10 + arg_268_0 and arg_265_1.var_.characterEffect1029ui_story then
				arg_265_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_268_12 = 0
			local var_268_13 = 1.025

			if var_268_12 < arg_265_1.time_ and arg_265_1.time_ <= var_268_12 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, true)

				local var_268_14 = arg_265_1:FormatText(StoryNameCfg[319].name)

				arg_265_1.leftNameTxt_.text = var_268_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_265_1.leftNameTxt_.transform)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1.leftNameTxt_.text)
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_15 = arg_265_1:GetWordFromCfg(116021062)
				local var_268_16 = arg_265_1:FormatText(var_268_15.content)

				arg_265_1.text_.text = var_268_16

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_17 = 42
				local var_268_18 = utf8.len(var_268_16)
				local var_268_19 = var_268_17 <= 0 and var_268_13 or var_268_13 * (var_268_18 / var_268_17)

				if var_268_19 > 0 and var_268_13 < var_268_19 then
					arg_265_1.talkMaxDuration = var_268_19

					if var_268_19 + var_268_12 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_19 + var_268_12
					end
				end

				arg_265_1.text_.text = var_268_16
				arg_265_1.typewritter.percent = 0

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021062", "story_v_out_116021.awb") ~= 0 then
					local var_268_20 = manager.audio:GetVoiceLength("story_v_out_116021", "116021062", "story_v_out_116021.awb") / 1000

					if var_268_20 + var_268_12 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_20 + var_268_12
					end

					if var_268_15.prefab_name ~= "" and arg_265_1.actors_[var_268_15.prefab_name] ~= nil then
						local var_268_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_265_1.actors_[var_268_15.prefab_name].transform, "story_v_out_116021", "116021062", "story_v_out_116021.awb")

						arg_265_1:RecordAudio("116021062", var_268_21)
						arg_265_1:RecordAudio("116021062", var_268_21)
					else
						arg_265_1:AudioAction("play", "voice", "story_v_out_116021", "116021062", "story_v_out_116021.awb")
					end

					arg_265_1:RecordHistoryTalkVoice("story_v_out_116021", "116021062", "story_v_out_116021.awb")
				end

				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_22 = math.max(var_268_13, arg_265_1.talkMaxDuration)

			if var_268_12 <= arg_265_1.time_ and arg_265_1.time_ < var_268_12 + var_268_22 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_12) / var_268_22

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_12 + var_268_22 and arg_265_1.time_ < var_268_12 + var_268_22 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play116021063 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 116021063
		arg_269_1.duration_ = 3.966

		local var_269_0 = {
			zh = 3.666,
			ja = 3.966
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
				arg_269_0:Play116021064(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = 0

			if var_272_0 < arg_269_1.time_ and arg_269_1.time_ <= var_272_0 + arg_272_0 then
				arg_269_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_272_1 = arg_269_1.actors_["1019ui_story"]
			local var_272_2 = 0

			if var_272_2 < arg_269_1.time_ and arg_269_1.time_ <= var_272_2 + arg_272_0 and arg_269_1.var_.characterEffect1019ui_story == nil then
				arg_269_1.var_.characterEffect1019ui_story = var_272_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_272_3 = 0.2

			if var_272_2 <= arg_269_1.time_ and arg_269_1.time_ < var_272_2 + var_272_3 then
				local var_272_4 = (arg_269_1.time_ - var_272_2) / var_272_3

				if arg_269_1.var_.characterEffect1019ui_story then
					arg_269_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_269_1.time_ >= var_272_2 + var_272_3 and arg_269_1.time_ < var_272_2 + var_272_3 + arg_272_0 and arg_269_1.var_.characterEffect1019ui_story then
				arg_269_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_272_5 = arg_269_1.actors_["1029ui_story"]
			local var_272_6 = 0

			if var_272_6 < arg_269_1.time_ and arg_269_1.time_ <= var_272_6 + arg_272_0 and arg_269_1.var_.characterEffect1029ui_story == nil then
				arg_269_1.var_.characterEffect1029ui_story = var_272_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_272_7 = 0.2

			if var_272_6 <= arg_269_1.time_ and arg_269_1.time_ < var_272_6 + var_272_7 then
				local var_272_8 = (arg_269_1.time_ - var_272_6) / var_272_7

				if arg_269_1.var_.characterEffect1029ui_story then
					local var_272_9 = Mathf.Lerp(0, 0.5, var_272_8)

					arg_269_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_269_1.var_.characterEffect1029ui_story.fillRatio = var_272_9
				end
			end

			if arg_269_1.time_ >= var_272_6 + var_272_7 and arg_269_1.time_ < var_272_6 + var_272_7 + arg_272_0 and arg_269_1.var_.characterEffect1029ui_story then
				local var_272_10 = 0.5

				arg_269_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_269_1.var_.characterEffect1029ui_story.fillRatio = var_272_10
			end

			local var_272_11 = 0
			local var_272_12 = 0.25

			if var_272_11 < arg_269_1.time_ and arg_269_1.time_ <= var_272_11 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, true)

				local var_272_13 = arg_269_1:FormatText(StoryNameCfg[13].name)

				arg_269_1.leftNameTxt_.text = var_272_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_269_1.leftNameTxt_.transform)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1.leftNameTxt_.text)
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_14 = arg_269_1:GetWordFromCfg(116021063)
				local var_272_15 = arg_269_1:FormatText(var_272_14.content)

				arg_269_1.text_.text = var_272_15

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_16 = 10
				local var_272_17 = utf8.len(var_272_15)
				local var_272_18 = var_272_16 <= 0 and var_272_12 or var_272_12 * (var_272_17 / var_272_16)

				if var_272_18 > 0 and var_272_12 < var_272_18 then
					arg_269_1.talkMaxDuration = var_272_18

					if var_272_18 + var_272_11 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_18 + var_272_11
					end
				end

				arg_269_1.text_.text = var_272_15
				arg_269_1.typewritter.percent = 0

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021063", "story_v_out_116021.awb") ~= 0 then
					local var_272_19 = manager.audio:GetVoiceLength("story_v_out_116021", "116021063", "story_v_out_116021.awb") / 1000

					if var_272_19 + var_272_11 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_19 + var_272_11
					end

					if var_272_14.prefab_name ~= "" and arg_269_1.actors_[var_272_14.prefab_name] ~= nil then
						local var_272_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_269_1.actors_[var_272_14.prefab_name].transform, "story_v_out_116021", "116021063", "story_v_out_116021.awb")

						arg_269_1:RecordAudio("116021063", var_272_20)
						arg_269_1:RecordAudio("116021063", var_272_20)
					else
						arg_269_1:AudioAction("play", "voice", "story_v_out_116021", "116021063", "story_v_out_116021.awb")
					end

					arg_269_1:RecordHistoryTalkVoice("story_v_out_116021", "116021063", "story_v_out_116021.awb")
				end

				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_21 = math.max(var_272_12, arg_269_1.talkMaxDuration)

			if var_272_11 <= arg_269_1.time_ and arg_269_1.time_ < var_272_11 + var_272_21 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_11) / var_272_21

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_11 + var_272_21 and arg_269_1.time_ < var_272_11 + var_272_21 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play116021064 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 116021064
		arg_273_1.duration_ = 10

		local var_273_0 = {
			zh = 10,
			ja = 7.533
		}
		local var_273_1 = manager.audio:GetLocalizationFlag()

		if var_273_0[var_273_1] ~= nil then
			arg_273_1.duration_ = var_273_0[var_273_1]
		end

		SetActive(arg_273_1.tipsGo_, false)

		function arg_273_1.onSingleLineFinish_()
			arg_273_1.onSingleLineUpdate_ = nil
			arg_273_1.onSingleLineFinish_ = nil
			arg_273_1.state_ = "waiting"
		end

		function arg_273_1.playNext_(arg_275_0)
			if arg_275_0 == 1 then
				arg_273_0:Play116021065(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = 0

			if var_276_0 < arg_273_1.time_ and arg_273_1.time_ <= var_276_0 + arg_276_0 then
				arg_273_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_276_1 = arg_273_1.actors_["1019ui_story"]
			local var_276_2 = 0

			if var_276_2 < arg_273_1.time_ and arg_273_1.time_ <= var_276_2 + arg_276_0 and arg_273_1.var_.characterEffect1019ui_story == nil then
				arg_273_1.var_.characterEffect1019ui_story = var_276_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_276_3 = 0.2

			if var_276_2 <= arg_273_1.time_ and arg_273_1.time_ < var_276_2 + var_276_3 then
				local var_276_4 = (arg_273_1.time_ - var_276_2) / var_276_3

				if arg_273_1.var_.characterEffect1019ui_story then
					local var_276_5 = Mathf.Lerp(0, 0.5, var_276_4)

					arg_273_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_273_1.var_.characterEffect1019ui_story.fillRatio = var_276_5
				end
			end

			if arg_273_1.time_ >= var_276_2 + var_276_3 and arg_273_1.time_ < var_276_2 + var_276_3 + arg_276_0 and arg_273_1.var_.characterEffect1019ui_story then
				local var_276_6 = 0.5

				arg_273_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_273_1.var_.characterEffect1019ui_story.fillRatio = var_276_6
			end

			local var_276_7 = arg_273_1.actors_["1029ui_story"]
			local var_276_8 = 0

			if var_276_8 < arg_273_1.time_ and arg_273_1.time_ <= var_276_8 + arg_276_0 and arg_273_1.var_.characterEffect1029ui_story == nil then
				arg_273_1.var_.characterEffect1029ui_story = var_276_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_276_9 = 0.2

			if var_276_8 <= arg_273_1.time_ and arg_273_1.time_ < var_276_8 + var_276_9 then
				local var_276_10 = (arg_273_1.time_ - var_276_8) / var_276_9

				if arg_273_1.var_.characterEffect1029ui_story then
					arg_273_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_273_1.time_ >= var_276_8 + var_276_9 and arg_273_1.time_ < var_276_8 + var_276_9 + arg_276_0 and arg_273_1.var_.characterEffect1029ui_story then
				arg_273_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_276_11 = 0
			local var_276_12 = 1.125

			if var_276_11 < arg_273_1.time_ and arg_273_1.time_ <= var_276_11 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, true)

				local var_276_13 = arg_273_1:FormatText(StoryNameCfg[319].name)

				arg_273_1.leftNameTxt_.text = var_276_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_273_1.leftNameTxt_.transform)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1.leftNameTxt_.text)
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_14 = arg_273_1:GetWordFromCfg(116021064)
				local var_276_15 = arg_273_1:FormatText(var_276_14.content)

				arg_273_1.text_.text = var_276_15

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_16 = 45
				local var_276_17 = utf8.len(var_276_15)
				local var_276_18 = var_276_16 <= 0 and var_276_12 or var_276_12 * (var_276_17 / var_276_16)

				if var_276_18 > 0 and var_276_12 < var_276_18 then
					arg_273_1.talkMaxDuration = var_276_18

					if var_276_18 + var_276_11 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_18 + var_276_11
					end
				end

				arg_273_1.text_.text = var_276_15
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021064", "story_v_out_116021.awb") ~= 0 then
					local var_276_19 = manager.audio:GetVoiceLength("story_v_out_116021", "116021064", "story_v_out_116021.awb") / 1000

					if var_276_19 + var_276_11 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_19 + var_276_11
					end

					if var_276_14.prefab_name ~= "" and arg_273_1.actors_[var_276_14.prefab_name] ~= nil then
						local var_276_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_273_1.actors_[var_276_14.prefab_name].transform, "story_v_out_116021", "116021064", "story_v_out_116021.awb")

						arg_273_1:RecordAudio("116021064", var_276_20)
						arg_273_1:RecordAudio("116021064", var_276_20)
					else
						arg_273_1:AudioAction("play", "voice", "story_v_out_116021", "116021064", "story_v_out_116021.awb")
					end

					arg_273_1:RecordHistoryTalkVoice("story_v_out_116021", "116021064", "story_v_out_116021.awb")
				end

				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_21 = math.max(var_276_12, arg_273_1.talkMaxDuration)

			if var_276_11 <= arg_273_1.time_ and arg_273_1.time_ < var_276_11 + var_276_21 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_11) / var_276_21

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_11 + var_276_21 and arg_273_1.time_ < var_276_11 + var_276_21 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play116021065 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 116021065
		arg_277_1.duration_ = 4.733

		local var_277_0 = {
			zh = 4.166,
			ja = 4.733
		}
		local var_277_1 = manager.audio:GetLocalizationFlag()

		if var_277_0[var_277_1] ~= nil then
			arg_277_1.duration_ = var_277_0[var_277_1]
		end

		SetActive(arg_277_1.tipsGo_, false)

		function arg_277_1.onSingleLineFinish_()
			arg_277_1.onSingleLineUpdate_ = nil
			arg_277_1.onSingleLineFinish_ = nil
			arg_277_1.state_ = "waiting"
		end

		function arg_277_1.playNext_(arg_279_0)
			if arg_279_0 == 1 then
				arg_277_0:Play116021066(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = 0

			if var_280_0 < arg_277_1.time_ and arg_277_1.time_ <= var_280_0 + arg_280_0 then
				arg_277_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_280_1 = arg_277_1.actors_["1019ui_story"]
			local var_280_2 = 0

			if var_280_2 < arg_277_1.time_ and arg_277_1.time_ <= var_280_2 + arg_280_0 and arg_277_1.var_.characterEffect1019ui_story == nil then
				arg_277_1.var_.characterEffect1019ui_story = var_280_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_280_3 = 0.2

			if var_280_2 <= arg_277_1.time_ and arg_277_1.time_ < var_280_2 + var_280_3 then
				local var_280_4 = (arg_277_1.time_ - var_280_2) / var_280_3

				if arg_277_1.var_.characterEffect1019ui_story then
					arg_277_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_277_1.time_ >= var_280_2 + var_280_3 and arg_277_1.time_ < var_280_2 + var_280_3 + arg_280_0 and arg_277_1.var_.characterEffect1019ui_story then
				arg_277_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_280_5 = arg_277_1.actors_["1029ui_story"]
			local var_280_6 = 0

			if var_280_6 < arg_277_1.time_ and arg_277_1.time_ <= var_280_6 + arg_280_0 and arg_277_1.var_.characterEffect1029ui_story == nil then
				arg_277_1.var_.characterEffect1029ui_story = var_280_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_280_7 = 0.2

			if var_280_6 <= arg_277_1.time_ and arg_277_1.time_ < var_280_6 + var_280_7 then
				local var_280_8 = (arg_277_1.time_ - var_280_6) / var_280_7

				if arg_277_1.var_.characterEffect1029ui_story then
					local var_280_9 = Mathf.Lerp(0, 0.5, var_280_8)

					arg_277_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_277_1.var_.characterEffect1029ui_story.fillRatio = var_280_9
				end
			end

			if arg_277_1.time_ >= var_280_6 + var_280_7 and arg_277_1.time_ < var_280_6 + var_280_7 + arg_280_0 and arg_277_1.var_.characterEffect1029ui_story then
				local var_280_10 = 0.5

				arg_277_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_277_1.var_.characterEffect1029ui_story.fillRatio = var_280_10
			end

			local var_280_11 = 0
			local var_280_12 = 0.55

			if var_280_11 < arg_277_1.time_ and arg_277_1.time_ <= var_280_11 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_13 = arg_277_1:FormatText(StoryNameCfg[13].name)

				arg_277_1.leftNameTxt_.text = var_280_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_14 = arg_277_1:GetWordFromCfg(116021065)
				local var_280_15 = arg_277_1:FormatText(var_280_14.content)

				arg_277_1.text_.text = var_280_15

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_16 = 22
				local var_280_17 = utf8.len(var_280_15)
				local var_280_18 = var_280_16 <= 0 and var_280_12 or var_280_12 * (var_280_17 / var_280_16)

				if var_280_18 > 0 and var_280_12 < var_280_18 then
					arg_277_1.talkMaxDuration = var_280_18

					if var_280_18 + var_280_11 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_18 + var_280_11
					end
				end

				arg_277_1.text_.text = var_280_15
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021065", "story_v_out_116021.awb") ~= 0 then
					local var_280_19 = manager.audio:GetVoiceLength("story_v_out_116021", "116021065", "story_v_out_116021.awb") / 1000

					if var_280_19 + var_280_11 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_19 + var_280_11
					end

					if var_280_14.prefab_name ~= "" and arg_277_1.actors_[var_280_14.prefab_name] ~= nil then
						local var_280_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_277_1.actors_[var_280_14.prefab_name].transform, "story_v_out_116021", "116021065", "story_v_out_116021.awb")

						arg_277_1:RecordAudio("116021065", var_280_20)
						arg_277_1:RecordAudio("116021065", var_280_20)
					else
						arg_277_1:AudioAction("play", "voice", "story_v_out_116021", "116021065", "story_v_out_116021.awb")
					end

					arg_277_1:RecordHistoryTalkVoice("story_v_out_116021", "116021065", "story_v_out_116021.awb")
				end

				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_21 = math.max(var_280_12, arg_277_1.talkMaxDuration)

			if var_280_11 <= arg_277_1.time_ and arg_277_1.time_ < var_280_11 + var_280_21 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_11) / var_280_21

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_11 + var_280_21 and arg_277_1.time_ < var_280_11 + var_280_21 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play116021066 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 116021066
		arg_281_1.duration_ = 9.566

		local var_281_0 = {
			zh = 5.8,
			ja = 9.566
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
				arg_281_0:Play116021067(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = 0

			if var_284_0 < arg_281_1.time_ and arg_281_1.time_ <= var_284_0 + arg_284_0 then
				arg_281_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_284_1 = arg_281_1.actors_["1019ui_story"]
			local var_284_2 = 0

			if var_284_2 < arg_281_1.time_ and arg_281_1.time_ <= var_284_2 + arg_284_0 and arg_281_1.var_.characterEffect1019ui_story == nil then
				arg_281_1.var_.characterEffect1019ui_story = var_284_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_284_3 = 0.2

			if var_284_2 <= arg_281_1.time_ and arg_281_1.time_ < var_284_2 + var_284_3 then
				local var_284_4 = (arg_281_1.time_ - var_284_2) / var_284_3

				if arg_281_1.var_.characterEffect1019ui_story then
					local var_284_5 = Mathf.Lerp(0, 0.5, var_284_4)

					arg_281_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_281_1.var_.characterEffect1019ui_story.fillRatio = var_284_5
				end
			end

			if arg_281_1.time_ >= var_284_2 + var_284_3 and arg_281_1.time_ < var_284_2 + var_284_3 + arg_284_0 and arg_281_1.var_.characterEffect1019ui_story then
				local var_284_6 = 0.5

				arg_281_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_281_1.var_.characterEffect1019ui_story.fillRatio = var_284_6
			end

			local var_284_7 = arg_281_1.actors_["1029ui_story"]
			local var_284_8 = 0

			if var_284_8 < arg_281_1.time_ and arg_281_1.time_ <= var_284_8 + arg_284_0 and arg_281_1.var_.characterEffect1029ui_story == nil then
				arg_281_1.var_.characterEffect1029ui_story = var_284_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_284_9 = 0.2

			if var_284_8 <= arg_281_1.time_ and arg_281_1.time_ < var_284_8 + var_284_9 then
				local var_284_10 = (arg_281_1.time_ - var_284_8) / var_284_9

				if arg_281_1.var_.characterEffect1029ui_story then
					arg_281_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_281_1.time_ >= var_284_8 + var_284_9 and arg_281_1.time_ < var_284_8 + var_284_9 + arg_284_0 and arg_281_1.var_.characterEffect1029ui_story then
				arg_281_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_284_11 = 0
			local var_284_12 = 0.5

			if var_284_11 < arg_281_1.time_ and arg_281_1.time_ <= var_284_11 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_13 = arg_281_1:FormatText(StoryNameCfg[319].name)

				arg_281_1.leftNameTxt_.text = var_284_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_14 = arg_281_1:GetWordFromCfg(116021066)
				local var_284_15 = arg_281_1:FormatText(var_284_14.content)

				arg_281_1.text_.text = var_284_15

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_16 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021066", "story_v_out_116021.awb") ~= 0 then
					local var_284_19 = manager.audio:GetVoiceLength("story_v_out_116021", "116021066", "story_v_out_116021.awb") / 1000

					if var_284_19 + var_284_11 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_19 + var_284_11
					end

					if var_284_14.prefab_name ~= "" and arg_281_1.actors_[var_284_14.prefab_name] ~= nil then
						local var_284_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_14.prefab_name].transform, "story_v_out_116021", "116021066", "story_v_out_116021.awb")

						arg_281_1:RecordAudio("116021066", var_284_20)
						arg_281_1:RecordAudio("116021066", var_284_20)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_out_116021", "116021066", "story_v_out_116021.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_out_116021", "116021066", "story_v_out_116021.awb")
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
	Play116021067 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 116021067
		arg_285_1.duration_ = 15.233

		local var_285_0 = {
			zh = 15.233,
			ja = 12.266
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
				arg_285_0:Play116021068(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = 0

			if var_288_0 < arg_285_1.time_ and arg_285_1.time_ <= var_288_0 + arg_288_0 then
				arg_285_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_288_1 = arg_285_1.actors_["1019ui_story"]
			local var_288_2 = 0

			if var_288_2 < arg_285_1.time_ and arg_285_1.time_ <= var_288_2 + arg_288_0 and arg_285_1.var_.characterEffect1019ui_story == nil then
				arg_285_1.var_.characterEffect1019ui_story = var_288_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_288_3 = 0.2

			if var_288_2 <= arg_285_1.time_ and arg_285_1.time_ < var_288_2 + var_288_3 then
				local var_288_4 = (arg_285_1.time_ - var_288_2) / var_288_3

				if arg_285_1.var_.characterEffect1019ui_story then
					arg_285_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_285_1.time_ >= var_288_2 + var_288_3 and arg_285_1.time_ < var_288_2 + var_288_3 + arg_288_0 and arg_285_1.var_.characterEffect1019ui_story then
				arg_285_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_288_5 = arg_285_1.actors_["1029ui_story"]
			local var_288_6 = 0

			if var_288_6 < arg_285_1.time_ and arg_285_1.time_ <= var_288_6 + arg_288_0 and arg_285_1.var_.characterEffect1029ui_story == nil then
				arg_285_1.var_.characterEffect1029ui_story = var_288_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_288_7 = 0.2

			if var_288_6 <= arg_285_1.time_ and arg_285_1.time_ < var_288_6 + var_288_7 then
				local var_288_8 = (arg_285_1.time_ - var_288_6) / var_288_7

				if arg_285_1.var_.characterEffect1029ui_story then
					local var_288_9 = Mathf.Lerp(0, 0.5, var_288_8)

					arg_285_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_285_1.var_.characterEffect1029ui_story.fillRatio = var_288_9
				end
			end

			if arg_285_1.time_ >= var_288_6 + var_288_7 and arg_285_1.time_ < var_288_6 + var_288_7 + arg_288_0 and arg_285_1.var_.characterEffect1029ui_story then
				local var_288_10 = 0.5

				arg_285_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_285_1.var_.characterEffect1029ui_story.fillRatio = var_288_10
			end

			local var_288_11 = 0
			local var_288_12 = 1.375

			if var_288_11 < arg_285_1.time_ and arg_285_1.time_ <= var_288_11 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_13 = arg_285_1:FormatText(StoryNameCfg[13].name)

				arg_285_1.leftNameTxt_.text = var_288_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, false)
				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_14 = arg_285_1:GetWordFromCfg(116021067)
				local var_288_15 = arg_285_1:FormatText(var_288_14.content)

				arg_285_1.text_.text = var_288_15

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_16 = 54
				local var_288_17 = utf8.len(var_288_15)
				local var_288_18 = var_288_16 <= 0 and var_288_12 or var_288_12 * (var_288_17 / var_288_16)

				if var_288_18 > 0 and var_288_12 < var_288_18 then
					arg_285_1.talkMaxDuration = var_288_18

					if var_288_18 + var_288_11 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_18 + var_288_11
					end
				end

				arg_285_1.text_.text = var_288_15
				arg_285_1.typewritter.percent = 0

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021067", "story_v_out_116021.awb") ~= 0 then
					local var_288_19 = manager.audio:GetVoiceLength("story_v_out_116021", "116021067", "story_v_out_116021.awb") / 1000

					if var_288_19 + var_288_11 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_19 + var_288_11
					end

					if var_288_14.prefab_name ~= "" and arg_285_1.actors_[var_288_14.prefab_name] ~= nil then
						local var_288_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_285_1.actors_[var_288_14.prefab_name].transform, "story_v_out_116021", "116021067", "story_v_out_116021.awb")

						arg_285_1:RecordAudio("116021067", var_288_20)
						arg_285_1:RecordAudio("116021067", var_288_20)
					else
						arg_285_1:AudioAction("play", "voice", "story_v_out_116021", "116021067", "story_v_out_116021.awb")
					end

					arg_285_1:RecordHistoryTalkVoice("story_v_out_116021", "116021067", "story_v_out_116021.awb")
				end

				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_21 = math.max(var_288_12, arg_285_1.talkMaxDuration)

			if var_288_11 <= arg_285_1.time_ and arg_285_1.time_ < var_288_11 + var_288_21 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_11) / var_288_21

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_11 + var_288_21 and arg_285_1.time_ < var_288_11 + var_288_21 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	Play116021068 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 116021068
		arg_289_1.duration_ = 5

		SetActive(arg_289_1.tipsGo_, false)

		function arg_289_1.onSingleLineFinish_()
			arg_289_1.onSingleLineUpdate_ = nil
			arg_289_1.onSingleLineFinish_ = nil
			arg_289_1.state_ = "waiting"
		end

		function arg_289_1.playNext_(arg_291_0)
			if arg_291_0 == 1 then
				arg_289_0:Play116021069(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = arg_289_1.actors_["1019ui_story"]
			local var_292_1 = 0

			if var_292_1 < arg_289_1.time_ and arg_289_1.time_ <= var_292_1 + arg_292_0 and arg_289_1.var_.characterEffect1019ui_story == nil then
				arg_289_1.var_.characterEffect1019ui_story = var_292_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_292_2 = 0.2

			if var_292_1 <= arg_289_1.time_ and arg_289_1.time_ < var_292_1 + var_292_2 then
				local var_292_3 = (arg_289_1.time_ - var_292_1) / var_292_2

				if arg_289_1.var_.characterEffect1019ui_story then
					local var_292_4 = Mathf.Lerp(0, 0.5, var_292_3)

					arg_289_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_289_1.var_.characterEffect1019ui_story.fillRatio = var_292_4
				end
			end

			if arg_289_1.time_ >= var_292_1 + var_292_2 and arg_289_1.time_ < var_292_1 + var_292_2 + arg_292_0 and arg_289_1.var_.characterEffect1019ui_story then
				local var_292_5 = 0.5

				arg_289_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_289_1.var_.characterEffect1019ui_story.fillRatio = var_292_5
			end

			local var_292_6 = 0
			local var_292_7 = 0.9

			if var_292_6 < arg_289_1.time_ and arg_289_1.time_ <= var_292_6 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, false)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_8 = arg_289_1:GetWordFromCfg(116021068)
				local var_292_9 = arg_289_1:FormatText(var_292_8.content)

				arg_289_1.text_.text = var_292_9

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_10 = 36
				local var_292_11 = utf8.len(var_292_9)
				local var_292_12 = var_292_10 <= 0 and var_292_7 or var_292_7 * (var_292_11 / var_292_10)

				if var_292_12 > 0 and var_292_7 < var_292_12 then
					arg_289_1.talkMaxDuration = var_292_12

					if var_292_12 + var_292_6 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_12 + var_292_6
					end
				end

				arg_289_1.text_.text = var_292_9
				arg_289_1.typewritter.percent = 0

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(false)
				arg_289_1:RecordContent(arg_289_1.text_.text)
			end

			local var_292_13 = math.max(var_292_7, arg_289_1.talkMaxDuration)

			if var_292_6 <= arg_289_1.time_ and arg_289_1.time_ < var_292_6 + var_292_13 then
				arg_289_1.typewritter.percent = (arg_289_1.time_ - var_292_6) / var_292_13

				arg_289_1.typewritter:SetDirty()
			end

			if arg_289_1.time_ >= var_292_6 + var_292_13 and arg_289_1.time_ < var_292_6 + var_292_13 + arg_292_0 then
				arg_289_1.typewritter.percent = 1

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(true)
			end
		end
	end,
	Play116021069 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 116021069
		arg_293_1.duration_ = 5

		SetActive(arg_293_1.tipsGo_, false)

		function arg_293_1.onSingleLineFinish_()
			arg_293_1.onSingleLineUpdate_ = nil
			arg_293_1.onSingleLineFinish_ = nil
			arg_293_1.state_ = "waiting"
		end

		function arg_293_1.playNext_(arg_295_0)
			if arg_295_0 == 1 then
				arg_293_0:Play116021070(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = 0
			local var_296_1 = 0.175

			if var_296_0 < arg_293_1.time_ and arg_293_1.time_ <= var_296_0 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0
				arg_293_1.dialogCg_.alpha = 1

				arg_293_1.dialog_:SetActive(true)
				SetActive(arg_293_1.leftNameGo_, false)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_293_1.iconTrs_.gameObject, false)
				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_2 = arg_293_1:GetWordFromCfg(116021069)
				local var_296_3 = arg_293_1:FormatText(var_296_2.content)

				arg_293_1.text_.text = var_296_3

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_4 = 7
				local var_296_5 = utf8.len(var_296_3)
				local var_296_6 = var_296_4 <= 0 and var_296_1 or var_296_1 * (var_296_5 / var_296_4)

				if var_296_6 > 0 and var_296_1 < var_296_6 then
					arg_293_1.talkMaxDuration = var_296_6

					if var_296_6 + var_296_0 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_6 + var_296_0
					end
				end

				arg_293_1.text_.text = var_296_3
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)
				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_7 = math.max(var_296_1, arg_293_1.talkMaxDuration)

			if var_296_0 <= arg_293_1.time_ and arg_293_1.time_ < var_296_0 + var_296_7 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_0) / var_296_7

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_0 + var_296_7 and arg_293_1.time_ < var_296_0 + var_296_7 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play116021070 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 116021070
		arg_297_1.duration_ = 3.966

		local var_297_0 = {
			zh = 2.166,
			ja = 3.966
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
				arg_297_0:Play116021071(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = 0

			if var_300_0 < arg_297_1.time_ and arg_297_1.time_ <= var_300_0 + arg_300_0 then
				arg_297_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_300_1 = 0

			if var_300_1 < arg_297_1.time_ and arg_297_1.time_ <= var_300_1 + arg_300_0 then
				arg_297_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_2")
			end

			local var_300_2 = arg_297_1.actors_["1019ui_story"]
			local var_300_3 = 0

			if var_300_3 < arg_297_1.time_ and arg_297_1.time_ <= var_300_3 + arg_300_0 and arg_297_1.var_.characterEffect1019ui_story == nil then
				arg_297_1.var_.characterEffect1019ui_story = var_300_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_300_4 = 0.2

			if var_300_3 <= arg_297_1.time_ and arg_297_1.time_ < var_300_3 + var_300_4 then
				local var_300_5 = (arg_297_1.time_ - var_300_3) / var_300_4

				if arg_297_1.var_.characterEffect1019ui_story then
					arg_297_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_297_1.time_ >= var_300_3 + var_300_4 and arg_297_1.time_ < var_300_3 + var_300_4 + arg_300_0 and arg_297_1.var_.characterEffect1019ui_story then
				arg_297_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_300_6 = 0
			local var_300_7 = 0.225

			if var_300_6 < arg_297_1.time_ and arg_297_1.time_ <= var_300_6 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, true)

				local var_300_8 = arg_297_1:FormatText(StoryNameCfg[13].name)

				arg_297_1.leftNameTxt_.text = var_300_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_297_1.leftNameTxt_.transform)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1.leftNameTxt_.text)
				SetActive(arg_297_1.iconTrs_.gameObject, false)
				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_9 = arg_297_1:GetWordFromCfg(116021070)
				local var_300_10 = arg_297_1:FormatText(var_300_9.content)

				arg_297_1.text_.text = var_300_10

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_11 = 9
				local var_300_12 = utf8.len(var_300_10)
				local var_300_13 = var_300_11 <= 0 and var_300_7 or var_300_7 * (var_300_12 / var_300_11)

				if var_300_13 > 0 and var_300_7 < var_300_13 then
					arg_297_1.talkMaxDuration = var_300_13

					if var_300_13 + var_300_6 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_13 + var_300_6
					end
				end

				arg_297_1.text_.text = var_300_10
				arg_297_1.typewritter.percent = 0

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021070", "story_v_out_116021.awb") ~= 0 then
					local var_300_14 = manager.audio:GetVoiceLength("story_v_out_116021", "116021070", "story_v_out_116021.awb") / 1000

					if var_300_14 + var_300_6 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_14 + var_300_6
					end

					if var_300_9.prefab_name ~= "" and arg_297_1.actors_[var_300_9.prefab_name] ~= nil then
						local var_300_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_297_1.actors_[var_300_9.prefab_name].transform, "story_v_out_116021", "116021070", "story_v_out_116021.awb")

						arg_297_1:RecordAudio("116021070", var_300_15)
						arg_297_1:RecordAudio("116021070", var_300_15)
					else
						arg_297_1:AudioAction("play", "voice", "story_v_out_116021", "116021070", "story_v_out_116021.awb")
					end

					arg_297_1:RecordHistoryTalkVoice("story_v_out_116021", "116021070", "story_v_out_116021.awb")
				end

				arg_297_1:RecordContent(arg_297_1.text_.text)
			end

			local var_300_16 = math.max(var_300_7, arg_297_1.talkMaxDuration)

			if var_300_6 <= arg_297_1.time_ and arg_297_1.time_ < var_300_6 + var_300_16 then
				arg_297_1.typewritter.percent = (arg_297_1.time_ - var_300_6) / var_300_16

				arg_297_1.typewritter:SetDirty()
			end

			if arg_297_1.time_ >= var_300_6 + var_300_16 and arg_297_1.time_ < var_300_6 + var_300_16 + arg_300_0 then
				arg_297_1.typewritter.percent = 1

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(true)
			end
		end
	end,
	Play116021071 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 116021071
		arg_301_1.duration_ = 5

		SetActive(arg_301_1.tipsGo_, false)

		function arg_301_1.onSingleLineFinish_()
			arg_301_1.onSingleLineUpdate_ = nil
			arg_301_1.onSingleLineFinish_ = nil
			arg_301_1.state_ = "waiting"
		end

		function arg_301_1.playNext_(arg_303_0)
			if arg_303_0 == 1 then
				arg_301_0:Play116021072(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = arg_301_1.actors_["1019ui_story"]
			local var_304_1 = 0

			if var_304_1 < arg_301_1.time_ and arg_301_1.time_ <= var_304_1 + arg_304_0 and arg_301_1.var_.characterEffect1019ui_story == nil then
				arg_301_1.var_.characterEffect1019ui_story = var_304_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_304_2 = 0.2

			if var_304_1 <= arg_301_1.time_ and arg_301_1.time_ < var_304_1 + var_304_2 then
				local var_304_3 = (arg_301_1.time_ - var_304_1) / var_304_2

				if arg_301_1.var_.characterEffect1019ui_story then
					local var_304_4 = Mathf.Lerp(0, 0.5, var_304_3)

					arg_301_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_301_1.var_.characterEffect1019ui_story.fillRatio = var_304_4
				end
			end

			if arg_301_1.time_ >= var_304_1 + var_304_2 and arg_301_1.time_ < var_304_1 + var_304_2 + arg_304_0 and arg_301_1.var_.characterEffect1019ui_story then
				local var_304_5 = 0.5

				arg_301_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_301_1.var_.characterEffect1019ui_story.fillRatio = var_304_5
			end

			local var_304_6 = 0
			local var_304_7 = 0.425

			if var_304_6 < arg_301_1.time_ and arg_301_1.time_ <= var_304_6 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, false)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_8 = arg_301_1:GetWordFromCfg(116021071)
				local var_304_9 = arg_301_1:FormatText(var_304_8.content)

				arg_301_1.text_.text = var_304_9

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_10 = 17
				local var_304_11 = utf8.len(var_304_9)
				local var_304_12 = var_304_10 <= 0 and var_304_7 or var_304_7 * (var_304_11 / var_304_10)

				if var_304_12 > 0 and var_304_7 < var_304_12 then
					arg_301_1.talkMaxDuration = var_304_12

					if var_304_12 + var_304_6 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_12 + var_304_6
					end
				end

				arg_301_1.text_.text = var_304_9
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)
				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_13 = math.max(var_304_7, arg_301_1.talkMaxDuration)

			if var_304_6 <= arg_301_1.time_ and arg_301_1.time_ < var_304_6 + var_304_13 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_6) / var_304_13

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_6 + var_304_13 and arg_301_1.time_ < var_304_6 + var_304_13 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play116021072 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 116021072
		arg_305_1.duration_ = 2.733

		local var_305_0 = {
			zh = 2.733,
			ja = 1.999999999999
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
				arg_305_0:Play116021073(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = 0

			if var_308_0 < arg_305_1.time_ and arg_305_1.time_ <= var_308_0 + arg_308_0 then
				arg_305_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action1_1")
			end

			local var_308_1 = 0

			if var_308_1 < arg_305_1.time_ and arg_305_1.time_ <= var_308_1 + arg_308_0 then
				arg_305_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_308_2 = arg_305_1.actors_["1029ui_story"]
			local var_308_3 = 0

			if var_308_3 < arg_305_1.time_ and arg_305_1.time_ <= var_308_3 + arg_308_0 and arg_305_1.var_.characterEffect1029ui_story == nil then
				arg_305_1.var_.characterEffect1029ui_story = var_308_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_308_4 = 0.2

			if var_308_3 <= arg_305_1.time_ and arg_305_1.time_ < var_308_3 + var_308_4 then
				local var_308_5 = (arg_305_1.time_ - var_308_3) / var_308_4

				if arg_305_1.var_.characterEffect1029ui_story then
					arg_305_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_305_1.time_ >= var_308_3 + var_308_4 and arg_305_1.time_ < var_308_3 + var_308_4 + arg_308_0 and arg_305_1.var_.characterEffect1029ui_story then
				arg_305_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_308_6 = 0
			local var_308_7 = 0.125

			if var_308_6 < arg_305_1.time_ and arg_305_1.time_ <= var_308_6 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, true)

				local var_308_8 = arg_305_1:FormatText(StoryNameCfg[319].name)

				arg_305_1.leftNameTxt_.text = var_308_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_305_1.leftNameTxt_.transform)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1.leftNameTxt_.text)
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_9 = arg_305_1:GetWordFromCfg(116021072)
				local var_308_10 = arg_305_1:FormatText(var_308_9.content)

				arg_305_1.text_.text = var_308_10

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_11 = 5
				local var_308_12 = utf8.len(var_308_10)
				local var_308_13 = var_308_11 <= 0 and var_308_7 or var_308_7 * (var_308_12 / var_308_11)

				if var_308_13 > 0 and var_308_7 < var_308_13 then
					arg_305_1.talkMaxDuration = var_308_13

					if var_308_13 + var_308_6 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_13 + var_308_6
					end
				end

				arg_305_1.text_.text = var_308_10
				arg_305_1.typewritter.percent = 0

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021072", "story_v_out_116021.awb") ~= 0 then
					local var_308_14 = manager.audio:GetVoiceLength("story_v_out_116021", "116021072", "story_v_out_116021.awb") / 1000

					if var_308_14 + var_308_6 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_14 + var_308_6
					end

					if var_308_9.prefab_name ~= "" and arg_305_1.actors_[var_308_9.prefab_name] ~= nil then
						local var_308_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_305_1.actors_[var_308_9.prefab_name].transform, "story_v_out_116021", "116021072", "story_v_out_116021.awb")

						arg_305_1:RecordAudio("116021072", var_308_15)
						arg_305_1:RecordAudio("116021072", var_308_15)
					else
						arg_305_1:AudioAction("play", "voice", "story_v_out_116021", "116021072", "story_v_out_116021.awb")
					end

					arg_305_1:RecordHistoryTalkVoice("story_v_out_116021", "116021072", "story_v_out_116021.awb")
				end

				arg_305_1:RecordContent(arg_305_1.text_.text)
			end

			local var_308_16 = math.max(var_308_7, arg_305_1.talkMaxDuration)

			if var_308_6 <= arg_305_1.time_ and arg_305_1.time_ < var_308_6 + var_308_16 then
				arg_305_1.typewritter.percent = (arg_305_1.time_ - var_308_6) / var_308_16

				arg_305_1.typewritter:SetDirty()
			end

			if arg_305_1.time_ >= var_308_6 + var_308_16 and arg_305_1.time_ < var_308_6 + var_308_16 + arg_308_0 then
				arg_305_1.typewritter.percent = 1

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(true)
			end
		end
	end,
	Play116021073 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 116021073
		arg_309_1.duration_ = 5

		SetActive(arg_309_1.tipsGo_, false)

		function arg_309_1.onSingleLineFinish_()
			arg_309_1.onSingleLineUpdate_ = nil
			arg_309_1.onSingleLineFinish_ = nil
			arg_309_1.state_ = "waiting"
		end

		function arg_309_1.playNext_(arg_311_0)
			if arg_311_0 == 1 then
				arg_309_0:Play116021074(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = arg_309_1.actors_["1029ui_story"]
			local var_312_1 = 0

			if var_312_1 < arg_309_1.time_ and arg_309_1.time_ <= var_312_1 + arg_312_0 and arg_309_1.var_.characterEffect1029ui_story == nil then
				arg_309_1.var_.characterEffect1029ui_story = var_312_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_312_2 = 0.2

			if var_312_1 <= arg_309_1.time_ and arg_309_1.time_ < var_312_1 + var_312_2 then
				local var_312_3 = (arg_309_1.time_ - var_312_1) / var_312_2

				if arg_309_1.var_.characterEffect1029ui_story then
					local var_312_4 = Mathf.Lerp(0, 0.5, var_312_3)

					arg_309_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_309_1.var_.characterEffect1029ui_story.fillRatio = var_312_4
				end
			end

			if arg_309_1.time_ >= var_312_1 + var_312_2 and arg_309_1.time_ < var_312_1 + var_312_2 + arg_312_0 and arg_309_1.var_.characterEffect1029ui_story then
				local var_312_5 = 0.5

				arg_309_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_309_1.var_.characterEffect1029ui_story.fillRatio = var_312_5
			end

			local var_312_6 = 0
			local var_312_7 = 0.325

			if var_312_6 < arg_309_1.time_ and arg_309_1.time_ <= var_312_6 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_8 = arg_309_1:FormatText(StoryNameCfg[7].name)

				arg_309_1.leftNameTxt_.text = var_312_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_9 = arg_309_1:GetWordFromCfg(116021073)
				local var_312_10 = arg_309_1:FormatText(var_312_9.content)

				arg_309_1.text_.text = var_312_10

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_11 = 13
				local var_312_12 = utf8.len(var_312_10)
				local var_312_13 = var_312_11 <= 0 and var_312_7 or var_312_7 * (var_312_12 / var_312_11)

				if var_312_13 > 0 and var_312_7 < var_312_13 then
					arg_309_1.talkMaxDuration = var_312_13

					if var_312_13 + var_312_6 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_13 + var_312_6
					end
				end

				arg_309_1.text_.text = var_312_10
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)
				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_14 = math.max(var_312_7, arg_309_1.talkMaxDuration)

			if var_312_6 <= arg_309_1.time_ and arg_309_1.time_ < var_312_6 + var_312_14 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_6) / var_312_14

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_6 + var_312_14 and arg_309_1.time_ < var_312_6 + var_312_14 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play116021074 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 116021074
		arg_313_1.duration_ = 4.2

		local var_313_0 = {
			zh = 3.966,
			ja = 4.2
		}
		local var_313_1 = manager.audio:GetLocalizationFlag()

		if var_313_0[var_313_1] ~= nil then
			arg_313_1.duration_ = var_313_0[var_313_1]
		end

		SetActive(arg_313_1.tipsGo_, false)

		function arg_313_1.onSingleLineFinish_()
			arg_313_1.onSingleLineUpdate_ = nil
			arg_313_1.onSingleLineFinish_ = nil
			arg_313_1.state_ = "waiting"
		end

		function arg_313_1.playNext_(arg_315_0)
			if arg_315_0 == 1 then
				arg_313_0:Play116021075(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = 0

			if var_316_0 < arg_313_1.time_ and arg_313_1.time_ <= var_316_0 + arg_316_0 then
				arg_313_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_316_1 = arg_313_1.actors_["1019ui_story"]
			local var_316_2 = 0

			if var_316_2 < arg_313_1.time_ and arg_313_1.time_ <= var_316_2 + arg_316_0 and arg_313_1.var_.characterEffect1019ui_story == nil then
				arg_313_1.var_.characterEffect1019ui_story = var_316_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_316_3 = 0.2

			if var_316_2 <= arg_313_1.time_ and arg_313_1.time_ < var_316_2 + var_316_3 then
				local var_316_4 = (arg_313_1.time_ - var_316_2) / var_316_3

				if arg_313_1.var_.characterEffect1019ui_story then
					arg_313_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_313_1.time_ >= var_316_2 + var_316_3 and arg_313_1.time_ < var_316_2 + var_316_3 + arg_316_0 and arg_313_1.var_.characterEffect1019ui_story then
				arg_313_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_316_5 = 0
			local var_316_6 = 0.55

			if var_316_5 < arg_313_1.time_ and arg_313_1.time_ <= var_316_5 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, true)

				local var_316_7 = arg_313_1:FormatText(StoryNameCfg[13].name)

				arg_313_1.leftNameTxt_.text = var_316_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_313_1.leftNameTxt_.transform)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1.leftNameTxt_.text)
				SetActive(arg_313_1.iconTrs_.gameObject, false)
				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_8 = arg_313_1:GetWordFromCfg(116021074)
				local var_316_9 = arg_313_1:FormatText(var_316_8.content)

				arg_313_1.text_.text = var_316_9

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_10 = 32
				local var_316_11 = utf8.len(var_316_9)
				local var_316_12 = var_316_10 <= 0 and var_316_6 or var_316_6 * (var_316_11 / var_316_10)

				if var_316_12 > 0 and var_316_6 < var_316_12 then
					arg_313_1.talkMaxDuration = var_316_12

					if var_316_12 + var_316_5 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_12 + var_316_5
					end
				end

				arg_313_1.text_.text = var_316_9
				arg_313_1.typewritter.percent = 0

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021074", "story_v_out_116021.awb") ~= 0 then
					local var_316_13 = manager.audio:GetVoiceLength("story_v_out_116021", "116021074", "story_v_out_116021.awb") / 1000

					if var_316_13 + var_316_5 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_13 + var_316_5
					end

					if var_316_8.prefab_name ~= "" and arg_313_1.actors_[var_316_8.prefab_name] ~= nil then
						local var_316_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_313_1.actors_[var_316_8.prefab_name].transform, "story_v_out_116021", "116021074", "story_v_out_116021.awb")

						arg_313_1:RecordAudio("116021074", var_316_14)
						arg_313_1:RecordAudio("116021074", var_316_14)
					else
						arg_313_1:AudioAction("play", "voice", "story_v_out_116021", "116021074", "story_v_out_116021.awb")
					end

					arg_313_1:RecordHistoryTalkVoice("story_v_out_116021", "116021074", "story_v_out_116021.awb")
				end

				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_15 = math.max(var_316_6, arg_313_1.talkMaxDuration)

			if var_316_5 <= arg_313_1.time_ and arg_313_1.time_ < var_316_5 + var_316_15 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_5) / var_316_15

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_5 + var_316_15 and arg_313_1.time_ < var_316_5 + var_316_15 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play116021075 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 116021075
		arg_317_1.duration_ = 4.3

		local var_317_0 = {
			zh = 4.3,
			ja = 4.266
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
				arg_317_0:Play116021076(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = 0

			if var_320_0 < arg_317_1.time_ and arg_317_1.time_ <= var_320_0 + arg_320_0 then
				arg_317_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action4_1")
			end

			local var_320_1 = 0

			if var_320_1 < arg_317_1.time_ and arg_317_1.time_ <= var_320_1 + arg_320_0 then
				arg_317_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_320_2 = arg_317_1.actors_["1029ui_story"]
			local var_320_3 = 0

			if var_320_3 < arg_317_1.time_ and arg_317_1.time_ <= var_320_3 + arg_320_0 and arg_317_1.var_.characterEffect1029ui_story == nil then
				arg_317_1.var_.characterEffect1029ui_story = var_320_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_320_4 = 0.2

			if var_320_3 <= arg_317_1.time_ and arg_317_1.time_ < var_320_3 + var_320_4 then
				local var_320_5 = (arg_317_1.time_ - var_320_3) / var_320_4

				if arg_317_1.var_.characterEffect1029ui_story then
					arg_317_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_317_1.time_ >= var_320_3 + var_320_4 and arg_317_1.time_ < var_320_3 + var_320_4 + arg_320_0 and arg_317_1.var_.characterEffect1029ui_story then
				arg_317_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_320_6 = arg_317_1.actors_["1019ui_story"]
			local var_320_7 = 0

			if var_320_7 < arg_317_1.time_ and arg_317_1.time_ <= var_320_7 + arg_320_0 and arg_317_1.var_.characterEffect1019ui_story == nil then
				arg_317_1.var_.characterEffect1019ui_story = var_320_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_320_8 = 0.2

			if var_320_7 <= arg_317_1.time_ and arg_317_1.time_ < var_320_7 + var_320_8 then
				local var_320_9 = (arg_317_1.time_ - var_320_7) / var_320_8

				if arg_317_1.var_.characterEffect1019ui_story then
					local var_320_10 = Mathf.Lerp(0, 0.5, var_320_9)

					arg_317_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_317_1.var_.characterEffect1019ui_story.fillRatio = var_320_10
				end
			end

			if arg_317_1.time_ >= var_320_7 + var_320_8 and arg_317_1.time_ < var_320_7 + var_320_8 + arg_320_0 and arg_317_1.var_.characterEffect1019ui_story then
				local var_320_11 = 0.5

				arg_317_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_317_1.var_.characterEffect1019ui_story.fillRatio = var_320_11
			end

			local var_320_12 = 0
			local var_320_13 = 0.225

			if var_320_12 < arg_317_1.time_ and arg_317_1.time_ <= var_320_12 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, true)

				local var_320_14 = arg_317_1:FormatText(StoryNameCfg[319].name)

				arg_317_1.leftNameTxt_.text = var_320_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_317_1.leftNameTxt_.transform)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1.leftNameTxt_.text)
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_15 = arg_317_1:GetWordFromCfg(116021075)
				local var_320_16 = arg_317_1:FormatText(var_320_15.content)

				arg_317_1.text_.text = var_320_16

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_17 = 10
				local var_320_18 = utf8.len(var_320_16)
				local var_320_19 = var_320_17 <= 0 and var_320_13 or var_320_13 * (var_320_18 / var_320_17)

				if var_320_19 > 0 and var_320_13 < var_320_19 then
					arg_317_1.talkMaxDuration = var_320_19

					if var_320_19 + var_320_12 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_19 + var_320_12
					end
				end

				arg_317_1.text_.text = var_320_16
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021075", "story_v_out_116021.awb") ~= 0 then
					local var_320_20 = manager.audio:GetVoiceLength("story_v_out_116021", "116021075", "story_v_out_116021.awb") / 1000

					if var_320_20 + var_320_12 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_20 + var_320_12
					end

					if var_320_15.prefab_name ~= "" and arg_317_1.actors_[var_320_15.prefab_name] ~= nil then
						local var_320_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_317_1.actors_[var_320_15.prefab_name].transform, "story_v_out_116021", "116021075", "story_v_out_116021.awb")

						arg_317_1:RecordAudio("116021075", var_320_21)
						arg_317_1:RecordAudio("116021075", var_320_21)
					else
						arg_317_1:AudioAction("play", "voice", "story_v_out_116021", "116021075", "story_v_out_116021.awb")
					end

					arg_317_1:RecordHistoryTalkVoice("story_v_out_116021", "116021075", "story_v_out_116021.awb")
				end

				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_22 = math.max(var_320_13, arg_317_1.talkMaxDuration)

			if var_320_12 <= arg_317_1.time_ and arg_317_1.time_ < var_320_12 + var_320_22 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_12) / var_320_22

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_12 + var_320_22 and arg_317_1.time_ < var_320_12 + var_320_22 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play116021076 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 116021076
		arg_321_1.duration_ = 9.133

		local var_321_0 = {
			zh = 9.133,
			ja = 6.166
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
				arg_321_0:Play116021077(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = "1028ui_story"

			if arg_321_1.actors_[var_324_0] == nil then
				local var_324_1 = Object.Instantiate(Asset.Load("Char/" .. var_324_0), arg_321_1.stage_.transform)

				var_324_1.name = var_324_0
				var_324_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_321_1.actors_[var_324_0] = var_324_1

				local var_324_2 = var_324_1:GetComponentInChildren(typeof(CharacterEffect))

				var_324_2.enabled = true

				local var_324_3 = GameObjectTools.GetOrAddComponent(var_324_1, typeof(DynamicBoneHelper))

				if var_324_3 then
					var_324_3:EnableDynamicBone(false)
				end

				arg_321_1:ShowWeapon(var_324_2.transform, false)

				arg_321_1.var_[var_324_0 .. "Animator"] = var_324_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_321_1.var_[var_324_0 .. "Animator"].applyRootMotion = true
				arg_321_1.var_[var_324_0 .. "LipSync"] = var_324_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_324_4 = arg_321_1.actors_["1028ui_story"].transform
			local var_324_5 = 0

			if var_324_5 < arg_321_1.time_ and arg_321_1.time_ <= var_324_5 + arg_324_0 then
				arg_321_1.var_.moveOldPos1028ui_story = var_324_4.localPosition
			end

			local var_324_6 = 0.001

			if var_324_5 <= arg_321_1.time_ and arg_321_1.time_ < var_324_5 + var_324_6 then
				local var_324_7 = (arg_321_1.time_ - var_324_5) / var_324_6
				local var_324_8 = Vector3.New(-0.7, -0.9, -5.9)

				var_324_4.localPosition = Vector3.Lerp(arg_321_1.var_.moveOldPos1028ui_story, var_324_8, var_324_7)

				local var_324_9 = manager.ui.mainCamera.transform.position - var_324_4.position

				var_324_4.forward = Vector3.New(var_324_9.x, var_324_9.y, var_324_9.z)

				local var_324_10 = var_324_4.localEulerAngles

				var_324_10.z = 0
				var_324_10.x = 0
				var_324_4.localEulerAngles = var_324_10
			end

			if arg_321_1.time_ >= var_324_5 + var_324_6 and arg_321_1.time_ < var_324_5 + var_324_6 + arg_324_0 then
				var_324_4.localPosition = Vector3.New(-0.7, -0.9, -5.9)

				local var_324_11 = manager.ui.mainCamera.transform.position - var_324_4.position

				var_324_4.forward = Vector3.New(var_324_11.x, var_324_11.y, var_324_11.z)

				local var_324_12 = var_324_4.localEulerAngles

				var_324_12.z = 0
				var_324_12.x = 0
				var_324_4.localEulerAngles = var_324_12
			end

			local var_324_13 = arg_321_1.actors_["1019ui_story"].transform
			local var_324_14 = 0

			if var_324_14 < arg_321_1.time_ and arg_321_1.time_ <= var_324_14 + arg_324_0 then
				arg_321_1.var_.moveOldPos1019ui_story = var_324_13.localPosition
			end

			local var_324_15 = 0.001

			if var_324_14 <= arg_321_1.time_ and arg_321_1.time_ < var_324_14 + var_324_15 then
				local var_324_16 = (arg_321_1.time_ - var_324_14) / var_324_15
				local var_324_17 = Vector3.New(0, 100, 0)

				var_324_13.localPosition = Vector3.Lerp(arg_321_1.var_.moveOldPos1019ui_story, var_324_17, var_324_16)

				local var_324_18 = manager.ui.mainCamera.transform.position - var_324_13.position

				var_324_13.forward = Vector3.New(var_324_18.x, var_324_18.y, var_324_18.z)

				local var_324_19 = var_324_13.localEulerAngles

				var_324_19.z = 0
				var_324_19.x = 0
				var_324_13.localEulerAngles = var_324_19
			end

			if arg_321_1.time_ >= var_324_14 + var_324_15 and arg_321_1.time_ < var_324_14 + var_324_15 + arg_324_0 then
				var_324_13.localPosition = Vector3.New(0, 100, 0)

				local var_324_20 = manager.ui.mainCamera.transform.position - var_324_13.position

				var_324_13.forward = Vector3.New(var_324_20.x, var_324_20.y, var_324_20.z)

				local var_324_21 = var_324_13.localEulerAngles

				var_324_21.z = 0
				var_324_21.x = 0
				var_324_13.localEulerAngles = var_324_21
			end

			local var_324_22 = 0

			if var_324_22 < arg_321_1.time_ and arg_321_1.time_ <= var_324_22 + arg_324_0 then
				arg_321_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_324_23 = 0

			if var_324_23 < arg_321_1.time_ and arg_321_1.time_ <= var_324_23 + arg_324_0 then
				arg_321_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1303cva")
			end

			local var_324_24 = arg_321_1.actors_["1028ui_story"]
			local var_324_25 = 0

			if var_324_25 < arg_321_1.time_ and arg_321_1.time_ <= var_324_25 + arg_324_0 and arg_321_1.var_.characterEffect1028ui_story == nil then
				arg_321_1.var_.characterEffect1028ui_story = var_324_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_324_26 = 0.2

			if var_324_25 <= arg_321_1.time_ and arg_321_1.time_ < var_324_25 + var_324_26 then
				local var_324_27 = (arg_321_1.time_ - var_324_25) / var_324_26

				if arg_321_1.var_.characterEffect1028ui_story then
					arg_321_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_321_1.time_ >= var_324_25 + var_324_26 and arg_321_1.time_ < var_324_25 + var_324_26 + arg_324_0 and arg_321_1.var_.characterEffect1028ui_story then
				arg_321_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_324_28 = arg_321_1.actors_["1029ui_story"]
			local var_324_29 = 0

			if var_324_29 < arg_321_1.time_ and arg_321_1.time_ <= var_324_29 + arg_324_0 and arg_321_1.var_.characterEffect1029ui_story == nil then
				arg_321_1.var_.characterEffect1029ui_story = var_324_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_324_30 = 0.2

			if var_324_29 <= arg_321_1.time_ and arg_321_1.time_ < var_324_29 + var_324_30 then
				local var_324_31 = (arg_321_1.time_ - var_324_29) / var_324_30

				if arg_321_1.var_.characterEffect1029ui_story then
					local var_324_32 = Mathf.Lerp(0, 0.5, var_324_31)

					arg_321_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_321_1.var_.characterEffect1029ui_story.fillRatio = var_324_32
				end
			end

			if arg_321_1.time_ >= var_324_29 + var_324_30 and arg_321_1.time_ < var_324_29 + var_324_30 + arg_324_0 and arg_321_1.var_.characterEffect1029ui_story then
				local var_324_33 = 0.5

				arg_321_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_321_1.var_.characterEffect1029ui_story.fillRatio = var_324_33
			end

			local var_324_34 = 0
			local var_324_35 = 1.2

			if var_324_34 < arg_321_1.time_ and arg_321_1.time_ <= var_324_34 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, true)

				local var_324_36 = arg_321_1:FormatText(StoryNameCfg[327].name)

				arg_321_1.leftNameTxt_.text = var_324_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_321_1.leftNameTxt_.transform)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1.leftNameTxt_.text)
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_37 = arg_321_1:GetWordFromCfg(116021076)
				local var_324_38 = arg_321_1:FormatText(var_324_37.content)

				arg_321_1.text_.text = var_324_38

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_39 = 48
				local var_324_40 = utf8.len(var_324_38)
				local var_324_41 = var_324_39 <= 0 and var_324_35 or var_324_35 * (var_324_40 / var_324_39)

				if var_324_41 > 0 and var_324_35 < var_324_41 then
					arg_321_1.talkMaxDuration = var_324_41

					if var_324_41 + var_324_34 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_41 + var_324_34
					end
				end

				arg_321_1.text_.text = var_324_38
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021076", "story_v_out_116021.awb") ~= 0 then
					local var_324_42 = manager.audio:GetVoiceLength("story_v_out_116021", "116021076", "story_v_out_116021.awb") / 1000

					if var_324_42 + var_324_34 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_42 + var_324_34
					end

					if var_324_37.prefab_name ~= "" and arg_321_1.actors_[var_324_37.prefab_name] ~= nil then
						local var_324_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_321_1.actors_[var_324_37.prefab_name].transform, "story_v_out_116021", "116021076", "story_v_out_116021.awb")

						arg_321_1:RecordAudio("116021076", var_324_43)
						arg_321_1:RecordAudio("116021076", var_324_43)
					else
						arg_321_1:AudioAction("play", "voice", "story_v_out_116021", "116021076", "story_v_out_116021.awb")
					end

					arg_321_1:RecordHistoryTalkVoice("story_v_out_116021", "116021076", "story_v_out_116021.awb")
				end

				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_44 = math.max(var_324_35, arg_321_1.talkMaxDuration)

			if var_324_34 <= arg_321_1.time_ and arg_321_1.time_ < var_324_34 + var_324_44 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_34) / var_324_44

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_34 + var_324_44 and arg_321_1.time_ < var_324_34 + var_324_44 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play116021077 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 116021077
		arg_325_1.duration_ = 5.3

		local var_325_0 = {
			zh = 3.466,
			ja = 5.3
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
				arg_325_0:Play116021078(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = 0

			if var_328_0 < arg_325_1.time_ and arg_325_1.time_ <= var_328_0 + arg_328_0 then
				arg_325_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action4_2")
			end

			local var_328_1 = 0

			if var_328_1 < arg_325_1.time_ and arg_325_1.time_ <= var_328_1 + arg_328_0 then
				arg_325_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_328_2 = arg_325_1.actors_["1029ui_story"]
			local var_328_3 = 0

			if var_328_3 < arg_325_1.time_ and arg_325_1.time_ <= var_328_3 + arg_328_0 and arg_325_1.var_.characterEffect1029ui_story == nil then
				arg_325_1.var_.characterEffect1029ui_story = var_328_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_328_4 = 0.2

			if var_328_3 <= arg_325_1.time_ and arg_325_1.time_ < var_328_3 + var_328_4 then
				local var_328_5 = (arg_325_1.time_ - var_328_3) / var_328_4

				if arg_325_1.var_.characterEffect1029ui_story then
					arg_325_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_325_1.time_ >= var_328_3 + var_328_4 and arg_325_1.time_ < var_328_3 + var_328_4 + arg_328_0 and arg_325_1.var_.characterEffect1029ui_story then
				arg_325_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_328_6 = arg_325_1.actors_["1028ui_story"]
			local var_328_7 = 0

			if var_328_7 < arg_325_1.time_ and arg_325_1.time_ <= var_328_7 + arg_328_0 and arg_325_1.var_.characterEffect1028ui_story == nil then
				arg_325_1.var_.characterEffect1028ui_story = var_328_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_328_8 = 0.2

			if var_328_7 <= arg_325_1.time_ and arg_325_1.time_ < var_328_7 + var_328_8 then
				local var_328_9 = (arg_325_1.time_ - var_328_7) / var_328_8

				if arg_325_1.var_.characterEffect1028ui_story then
					local var_328_10 = Mathf.Lerp(0, 0.5, var_328_9)

					arg_325_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_325_1.var_.characterEffect1028ui_story.fillRatio = var_328_10
				end
			end

			if arg_325_1.time_ >= var_328_7 + var_328_8 and arg_325_1.time_ < var_328_7 + var_328_8 + arg_328_0 and arg_325_1.var_.characterEffect1028ui_story then
				local var_328_11 = 0.5

				arg_325_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_325_1.var_.characterEffect1028ui_story.fillRatio = var_328_11
			end

			local var_328_12 = 0
			local var_328_13 = 0.3

			if var_328_12 < arg_325_1.time_ and arg_325_1.time_ <= var_328_12 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, true)

				local var_328_14 = arg_325_1:FormatText(StoryNameCfg[319].name)

				arg_325_1.leftNameTxt_.text = var_328_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_325_1.leftNameTxt_.transform)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1.leftNameTxt_.text)
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_15 = arg_325_1:GetWordFromCfg(116021077)
				local var_328_16 = arg_325_1:FormatText(var_328_15.content)

				arg_325_1.text_.text = var_328_16

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_17 = 12
				local var_328_18 = utf8.len(var_328_16)
				local var_328_19 = var_328_17 <= 0 and var_328_13 or var_328_13 * (var_328_18 / var_328_17)

				if var_328_19 > 0 and var_328_13 < var_328_19 then
					arg_325_1.talkMaxDuration = var_328_19

					if var_328_19 + var_328_12 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_19 + var_328_12
					end
				end

				arg_325_1.text_.text = var_328_16
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021077", "story_v_out_116021.awb") ~= 0 then
					local var_328_20 = manager.audio:GetVoiceLength("story_v_out_116021", "116021077", "story_v_out_116021.awb") / 1000

					if var_328_20 + var_328_12 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_20 + var_328_12
					end

					if var_328_15.prefab_name ~= "" and arg_325_1.actors_[var_328_15.prefab_name] ~= nil then
						local var_328_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_325_1.actors_[var_328_15.prefab_name].transform, "story_v_out_116021", "116021077", "story_v_out_116021.awb")

						arg_325_1:RecordAudio("116021077", var_328_21)
						arg_325_1:RecordAudio("116021077", var_328_21)
					else
						arg_325_1:AudioAction("play", "voice", "story_v_out_116021", "116021077", "story_v_out_116021.awb")
					end

					arg_325_1:RecordHistoryTalkVoice("story_v_out_116021", "116021077", "story_v_out_116021.awb")
				end

				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_22 = math.max(var_328_13, arg_325_1.talkMaxDuration)

			if var_328_12 <= arg_325_1.time_ and arg_325_1.time_ < var_328_12 + var_328_22 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_12) / var_328_22

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_12 + var_328_22 and arg_325_1.time_ < var_328_12 + var_328_22 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play116021078 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 116021078
		arg_329_1.duration_ = 5.266

		local var_329_0 = {
			zh = 5.266,
			ja = 3.633
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
				arg_329_0:Play116021079(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = arg_329_1.actors_["1029ui_story"]
			local var_332_1 = 0

			if var_332_1 < arg_329_1.time_ and arg_329_1.time_ <= var_332_1 + arg_332_0 and arg_329_1.var_.characterEffect1029ui_story == nil then
				arg_329_1.var_.characterEffect1029ui_story = var_332_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_332_2 = 0.2

			if var_332_1 <= arg_329_1.time_ and arg_329_1.time_ < var_332_1 + var_332_2 then
				local var_332_3 = (arg_329_1.time_ - var_332_1) / var_332_2

				if arg_329_1.var_.characterEffect1029ui_story then
					local var_332_4 = Mathf.Lerp(0, 0.5, var_332_3)

					arg_329_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_329_1.var_.characterEffect1029ui_story.fillRatio = var_332_4
				end
			end

			if arg_329_1.time_ >= var_332_1 + var_332_2 and arg_329_1.time_ < var_332_1 + var_332_2 + arg_332_0 and arg_329_1.var_.characterEffect1029ui_story then
				local var_332_5 = 0.5

				arg_329_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_329_1.var_.characterEffect1029ui_story.fillRatio = var_332_5
			end

			local var_332_6 = 0
			local var_332_7 = 0.6

			if var_332_6 < arg_329_1.time_ and arg_329_1.time_ <= var_332_6 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, true)

				local var_332_8 = arg_329_1:FormatText(StoryNameCfg[13].name)

				arg_329_1.leftNameTxt_.text = var_332_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_329_1.leftNameTxt_.transform)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1.leftNameTxt_.text)
				SetActive(arg_329_1.iconTrs_.gameObject, true)
				arg_329_1.iconController_:SetSelectedState("hero")

				arg_329_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019")

				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_9 = arg_329_1:GetWordFromCfg(116021078)
				local var_332_10 = arg_329_1:FormatText(var_332_9.content)

				arg_329_1.text_.text = var_332_10

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_11 = 24
				local var_332_12 = utf8.len(var_332_10)
				local var_332_13 = var_332_11 <= 0 and var_332_7 or var_332_7 * (var_332_12 / var_332_11)

				if var_332_13 > 0 and var_332_7 < var_332_13 then
					arg_329_1.talkMaxDuration = var_332_13

					if var_332_13 + var_332_6 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_13 + var_332_6
					end
				end

				arg_329_1.text_.text = var_332_10
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021078", "story_v_out_116021.awb") ~= 0 then
					local var_332_14 = manager.audio:GetVoiceLength("story_v_out_116021", "116021078", "story_v_out_116021.awb") / 1000

					if var_332_14 + var_332_6 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_14 + var_332_6
					end

					if var_332_9.prefab_name ~= "" and arg_329_1.actors_[var_332_9.prefab_name] ~= nil then
						local var_332_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_329_1.actors_[var_332_9.prefab_name].transform, "story_v_out_116021", "116021078", "story_v_out_116021.awb")

						arg_329_1:RecordAudio("116021078", var_332_15)
						arg_329_1:RecordAudio("116021078", var_332_15)
					else
						arg_329_1:AudioAction("play", "voice", "story_v_out_116021", "116021078", "story_v_out_116021.awb")
					end

					arg_329_1:RecordHistoryTalkVoice("story_v_out_116021", "116021078", "story_v_out_116021.awb")
				end

				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_16 = math.max(var_332_7, arg_329_1.talkMaxDuration)

			if var_332_6 <= arg_329_1.time_ and arg_329_1.time_ < var_332_6 + var_332_16 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_6) / var_332_16

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_6 + var_332_16 and arg_329_1.time_ < var_332_6 + var_332_16 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play116021079 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 116021079
		arg_333_1.duration_ = 12

		local var_333_0 = {
			zh = 10,
			ja = 12
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
				arg_333_0:Play116021080(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = 0
			local var_336_1 = 1.1

			if var_336_0 < arg_333_1.time_ and arg_333_1.time_ <= var_336_0 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, true)

				local var_336_2 = arg_333_1:FormatText(StoryNameCfg[13].name)

				arg_333_1.leftNameTxt_.text = var_336_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_333_1.leftNameTxt_.transform)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1.leftNameTxt_.text)
				SetActive(arg_333_1.iconTrs_.gameObject, true)
				arg_333_1.iconController_:SetSelectedState("hero")

				arg_333_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019")

				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_3 = arg_333_1:GetWordFromCfg(116021079)
				local var_336_4 = arg_333_1:FormatText(var_336_3.content)

				arg_333_1.text_.text = var_336_4

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_5 = 45
				local var_336_6 = utf8.len(var_336_4)
				local var_336_7 = var_336_5 <= 0 and var_336_1 or var_336_1 * (var_336_6 / var_336_5)

				if var_336_7 > 0 and var_336_1 < var_336_7 then
					arg_333_1.talkMaxDuration = var_336_7

					if var_336_7 + var_336_0 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_7 + var_336_0
					end
				end

				arg_333_1.text_.text = var_336_4
				arg_333_1.typewritter.percent = 0

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021079", "story_v_out_116021.awb") ~= 0 then
					local var_336_8 = manager.audio:GetVoiceLength("story_v_out_116021", "116021079", "story_v_out_116021.awb") / 1000

					if var_336_8 + var_336_0 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_8 + var_336_0
					end

					if var_336_3.prefab_name ~= "" and arg_333_1.actors_[var_336_3.prefab_name] ~= nil then
						local var_336_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_333_1.actors_[var_336_3.prefab_name].transform, "story_v_out_116021", "116021079", "story_v_out_116021.awb")

						arg_333_1:RecordAudio("116021079", var_336_9)
						arg_333_1:RecordAudio("116021079", var_336_9)
					else
						arg_333_1:AudioAction("play", "voice", "story_v_out_116021", "116021079", "story_v_out_116021.awb")
					end

					arg_333_1:RecordHistoryTalkVoice("story_v_out_116021", "116021079", "story_v_out_116021.awb")
				end

				arg_333_1:RecordContent(arg_333_1.text_.text)
			end

			local var_336_10 = math.max(var_336_1, arg_333_1.talkMaxDuration)

			if var_336_0 <= arg_333_1.time_ and arg_333_1.time_ < var_336_0 + var_336_10 then
				arg_333_1.typewritter.percent = (arg_333_1.time_ - var_336_0) / var_336_10

				arg_333_1.typewritter:SetDirty()
			end

			if arg_333_1.time_ >= var_336_0 + var_336_10 and arg_333_1.time_ < var_336_0 + var_336_10 + arg_336_0 then
				arg_333_1.typewritter.percent = 1

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(true)
			end
		end
	end,
	Play116021080 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 116021080
		arg_337_1.duration_ = 6.033

		local var_337_0 = {
			zh = 5.133,
			ja = 6.033
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
				arg_337_0:Play116021081(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = arg_337_1.actors_["1028ui_story"]
			local var_340_1 = 0

			if var_340_1 < arg_337_1.time_ and arg_337_1.time_ <= var_340_1 + arg_340_0 and arg_337_1.var_.characterEffect1028ui_story == nil then
				arg_337_1.var_.characterEffect1028ui_story = var_340_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_340_2 = 0.2

			if var_340_1 <= arg_337_1.time_ and arg_337_1.time_ < var_340_1 + var_340_2 then
				local var_340_3 = (arg_337_1.time_ - var_340_1) / var_340_2

				if arg_337_1.var_.characterEffect1028ui_story then
					arg_337_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_337_1.time_ >= var_340_1 + var_340_2 and arg_337_1.time_ < var_340_1 + var_340_2 + arg_340_0 and arg_337_1.var_.characterEffect1028ui_story then
				arg_337_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_340_4 = 0

			if var_340_4 < arg_337_1.time_ and arg_337_1.time_ <= var_340_4 + arg_340_0 then
				arg_337_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_340_5 = 0
			local var_340_6 = 0.6

			if var_340_5 < arg_337_1.time_ and arg_337_1.time_ <= var_340_5 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, true)

				local var_340_7 = arg_337_1:FormatText(StoryNameCfg[327].name)

				arg_337_1.leftNameTxt_.text = var_340_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_337_1.leftNameTxt_.transform)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1.leftNameTxt_.text)
				SetActive(arg_337_1.iconTrs_.gameObject, false)
				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_8 = arg_337_1:GetWordFromCfg(116021080)
				local var_340_9 = arg_337_1:FormatText(var_340_8.content)

				arg_337_1.text_.text = var_340_9

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_10 = 24
				local var_340_11 = utf8.len(var_340_9)
				local var_340_12 = var_340_10 <= 0 and var_340_6 or var_340_6 * (var_340_11 / var_340_10)

				if var_340_12 > 0 and var_340_6 < var_340_12 then
					arg_337_1.talkMaxDuration = var_340_12

					if var_340_12 + var_340_5 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_12 + var_340_5
					end
				end

				arg_337_1.text_.text = var_340_9
				arg_337_1.typewritter.percent = 0

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021080", "story_v_out_116021.awb") ~= 0 then
					local var_340_13 = manager.audio:GetVoiceLength("story_v_out_116021", "116021080", "story_v_out_116021.awb") / 1000

					if var_340_13 + var_340_5 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_13 + var_340_5
					end

					if var_340_8.prefab_name ~= "" and arg_337_1.actors_[var_340_8.prefab_name] ~= nil then
						local var_340_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_337_1.actors_[var_340_8.prefab_name].transform, "story_v_out_116021", "116021080", "story_v_out_116021.awb")

						arg_337_1:RecordAudio("116021080", var_340_14)
						arg_337_1:RecordAudio("116021080", var_340_14)
					else
						arg_337_1:AudioAction("play", "voice", "story_v_out_116021", "116021080", "story_v_out_116021.awb")
					end

					arg_337_1:RecordHistoryTalkVoice("story_v_out_116021", "116021080", "story_v_out_116021.awb")
				end

				arg_337_1:RecordContent(arg_337_1.text_.text)
			end

			local var_340_15 = math.max(var_340_6, arg_337_1.talkMaxDuration)

			if var_340_5 <= arg_337_1.time_ and arg_337_1.time_ < var_340_5 + var_340_15 then
				arg_337_1.typewritter.percent = (arg_337_1.time_ - var_340_5) / var_340_15

				arg_337_1.typewritter:SetDirty()
			end

			if arg_337_1.time_ >= var_340_5 + var_340_15 and arg_337_1.time_ < var_340_5 + var_340_15 + arg_340_0 then
				arg_337_1.typewritter.percent = 1

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(true)
			end
		end
	end,
	Play116021081 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 116021081
		arg_341_1.duration_ = 4.833

		local var_341_0 = {
			zh = 1.566,
			ja = 4.833
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
				arg_341_0:Play116021082(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = arg_341_1.actors_["1028ui_story"]
			local var_344_1 = 0

			if var_344_1 < arg_341_1.time_ and arg_341_1.time_ <= var_344_1 + arg_344_0 and arg_341_1.var_.characterEffect1028ui_story == nil then
				arg_341_1.var_.characterEffect1028ui_story = var_344_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_344_2 = 0.2

			if var_344_1 <= arg_341_1.time_ and arg_341_1.time_ < var_344_1 + var_344_2 then
				local var_344_3 = (arg_341_1.time_ - var_344_1) / var_344_2

				if arg_341_1.var_.characterEffect1028ui_story then
					local var_344_4 = Mathf.Lerp(0, 0.5, var_344_3)

					arg_341_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_341_1.var_.characterEffect1028ui_story.fillRatio = var_344_4
				end
			end

			if arg_341_1.time_ >= var_344_1 + var_344_2 and arg_341_1.time_ < var_344_1 + var_344_2 + arg_344_0 and arg_341_1.var_.characterEffect1028ui_story then
				local var_344_5 = 0.5

				arg_341_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_341_1.var_.characterEffect1028ui_story.fillRatio = var_344_5
			end

			local var_344_6 = 0
			local var_344_7 = 0.15

			if var_344_6 < arg_341_1.time_ and arg_341_1.time_ <= var_344_6 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, true)

				local var_344_8 = arg_341_1:FormatText(StoryNameCfg[13].name)

				arg_341_1.leftNameTxt_.text = var_344_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_341_1.leftNameTxt_.transform)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1.leftNameTxt_.text)
				SetActive(arg_341_1.iconTrs_.gameObject, true)
				arg_341_1.iconController_:SetSelectedState("hero")

				arg_341_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019_split_6")

				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_9 = arg_341_1:GetWordFromCfg(116021081)
				local var_344_10 = arg_341_1:FormatText(var_344_9.content)

				arg_341_1.text_.text = var_344_10

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_11 = 6
				local var_344_12 = utf8.len(var_344_10)
				local var_344_13 = var_344_11 <= 0 and var_344_7 or var_344_7 * (var_344_12 / var_344_11)

				if var_344_13 > 0 and var_344_7 < var_344_13 then
					arg_341_1.talkMaxDuration = var_344_13

					if var_344_13 + var_344_6 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_13 + var_344_6
					end
				end

				arg_341_1.text_.text = var_344_10
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021081", "story_v_out_116021.awb") ~= 0 then
					local var_344_14 = manager.audio:GetVoiceLength("story_v_out_116021", "116021081", "story_v_out_116021.awb") / 1000

					if var_344_14 + var_344_6 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_14 + var_344_6
					end

					if var_344_9.prefab_name ~= "" and arg_341_1.actors_[var_344_9.prefab_name] ~= nil then
						local var_344_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_341_1.actors_[var_344_9.prefab_name].transform, "story_v_out_116021", "116021081", "story_v_out_116021.awb")

						arg_341_1:RecordAudio("116021081", var_344_15)
						arg_341_1:RecordAudio("116021081", var_344_15)
					else
						arg_341_1:AudioAction("play", "voice", "story_v_out_116021", "116021081", "story_v_out_116021.awb")
					end

					arg_341_1:RecordHistoryTalkVoice("story_v_out_116021", "116021081", "story_v_out_116021.awb")
				end

				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_16 = math.max(var_344_7, arg_341_1.talkMaxDuration)

			if var_344_6 <= arg_341_1.time_ and arg_341_1.time_ < var_344_6 + var_344_16 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_6) / var_344_16

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_6 + var_344_16 and arg_341_1.time_ < var_344_6 + var_344_16 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play116021082 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 116021082
		arg_345_1.duration_ = 5.233

		local var_345_0 = {
			zh = 4.4,
			ja = 5.233
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
				arg_345_0:Play116021083(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = 0

			if var_348_0 < arg_345_1.time_ and arg_345_1.time_ <= var_348_0 + arg_348_0 then
				arg_345_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action7_1")
			end

			local var_348_1 = 0

			if var_348_1 < arg_345_1.time_ and arg_345_1.time_ <= var_348_1 + arg_348_0 then
				arg_345_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_348_2 = arg_345_1.actors_["1029ui_story"]
			local var_348_3 = 0

			if var_348_3 < arg_345_1.time_ and arg_345_1.time_ <= var_348_3 + arg_348_0 and arg_345_1.var_.characterEffect1029ui_story == nil then
				arg_345_1.var_.characterEffect1029ui_story = var_348_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_348_4 = 0.2

			if var_348_3 <= arg_345_1.time_ and arg_345_1.time_ < var_348_3 + var_348_4 then
				local var_348_5 = (arg_345_1.time_ - var_348_3) / var_348_4

				if arg_345_1.var_.characterEffect1029ui_story then
					arg_345_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_345_1.time_ >= var_348_3 + var_348_4 and arg_345_1.time_ < var_348_3 + var_348_4 + arg_348_0 and arg_345_1.var_.characterEffect1029ui_story then
				arg_345_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_348_6 = arg_345_1.actors_["1028ui_story"]
			local var_348_7 = 0

			if var_348_7 < arg_345_1.time_ and arg_345_1.time_ <= var_348_7 + arg_348_0 and arg_345_1.var_.characterEffect1028ui_story == nil then
				arg_345_1.var_.characterEffect1028ui_story = var_348_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_348_8 = 0.2

			if var_348_7 <= arg_345_1.time_ and arg_345_1.time_ < var_348_7 + var_348_8 then
				local var_348_9 = (arg_345_1.time_ - var_348_7) / var_348_8

				if arg_345_1.var_.characterEffect1028ui_story then
					local var_348_10 = Mathf.Lerp(0, 0.5, var_348_9)

					arg_345_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_345_1.var_.characterEffect1028ui_story.fillRatio = var_348_10
				end
			end

			if arg_345_1.time_ >= var_348_7 + var_348_8 and arg_345_1.time_ < var_348_7 + var_348_8 + arg_348_0 and arg_345_1.var_.characterEffect1028ui_story then
				local var_348_11 = 0.5

				arg_345_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_345_1.var_.characterEffect1028ui_story.fillRatio = var_348_11
			end

			local var_348_12 = 0
			local var_348_13 = 0.425

			if var_348_12 < arg_345_1.time_ and arg_345_1.time_ <= var_348_12 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0
				arg_345_1.dialogCg_.alpha = 1

				arg_345_1.dialog_:SetActive(true)
				SetActive(arg_345_1.leftNameGo_, true)

				local var_348_14 = arg_345_1:FormatText(StoryNameCfg[319].name)

				arg_345_1.leftNameTxt_.text = var_348_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_345_1.leftNameTxt_.transform)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1.leftNameTxt_.text)
				SetActive(arg_345_1.iconTrs_.gameObject, false)
				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_15 = arg_345_1:GetWordFromCfg(116021082)
				local var_348_16 = arg_345_1:FormatText(var_348_15.content)

				arg_345_1.text_.text = var_348_16

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_17 = 17
				local var_348_18 = utf8.len(var_348_16)
				local var_348_19 = var_348_17 <= 0 and var_348_13 or var_348_13 * (var_348_18 / var_348_17)

				if var_348_19 > 0 and var_348_13 < var_348_19 then
					arg_345_1.talkMaxDuration = var_348_19

					if var_348_19 + var_348_12 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_19 + var_348_12
					end
				end

				arg_345_1.text_.text = var_348_16
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021082", "story_v_out_116021.awb") ~= 0 then
					local var_348_20 = manager.audio:GetVoiceLength("story_v_out_116021", "116021082", "story_v_out_116021.awb") / 1000

					if var_348_20 + var_348_12 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_20 + var_348_12
					end

					if var_348_15.prefab_name ~= "" and arg_345_1.actors_[var_348_15.prefab_name] ~= nil then
						local var_348_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_345_1.actors_[var_348_15.prefab_name].transform, "story_v_out_116021", "116021082", "story_v_out_116021.awb")

						arg_345_1:RecordAudio("116021082", var_348_21)
						arg_345_1:RecordAudio("116021082", var_348_21)
					else
						arg_345_1:AudioAction("play", "voice", "story_v_out_116021", "116021082", "story_v_out_116021.awb")
					end

					arg_345_1:RecordHistoryTalkVoice("story_v_out_116021", "116021082", "story_v_out_116021.awb")
				end

				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_22 = math.max(var_348_13, arg_345_1.talkMaxDuration)

			if var_348_12 <= arg_345_1.time_ and arg_345_1.time_ < var_348_12 + var_348_22 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_12) / var_348_22

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_12 + var_348_22 and arg_345_1.time_ < var_348_12 + var_348_22 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play116021083 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 116021083
		arg_349_1.duration_ = 5

		SetActive(arg_349_1.tipsGo_, false)

		function arg_349_1.onSingleLineFinish_()
			arg_349_1.onSingleLineUpdate_ = nil
			arg_349_1.onSingleLineFinish_ = nil
			arg_349_1.state_ = "waiting"
		end

		function arg_349_1.playNext_(arg_351_0)
			if arg_351_0 == 1 then
				arg_349_0:Play116021084(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = arg_349_1.actors_["1029ui_story"]
			local var_352_1 = 0

			if var_352_1 < arg_349_1.time_ and arg_349_1.time_ <= var_352_1 + arg_352_0 and arg_349_1.var_.characterEffect1029ui_story == nil then
				arg_349_1.var_.characterEffect1029ui_story = var_352_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_352_2 = 0.2

			if var_352_1 <= arg_349_1.time_ and arg_349_1.time_ < var_352_1 + var_352_2 then
				local var_352_3 = (arg_349_1.time_ - var_352_1) / var_352_2

				if arg_349_1.var_.characterEffect1029ui_story then
					local var_352_4 = Mathf.Lerp(0, 0.5, var_352_3)

					arg_349_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_349_1.var_.characterEffect1029ui_story.fillRatio = var_352_4
				end
			end

			if arg_349_1.time_ >= var_352_1 + var_352_2 and arg_349_1.time_ < var_352_1 + var_352_2 + arg_352_0 and arg_349_1.var_.characterEffect1029ui_story then
				local var_352_5 = 0.5

				arg_349_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_349_1.var_.characterEffect1029ui_story.fillRatio = var_352_5
			end

			local var_352_6 = arg_349_1.actors_["1029ui_story"].transform
			local var_352_7 = 0

			if var_352_7 < arg_349_1.time_ and arg_349_1.time_ <= var_352_7 + arg_352_0 then
				arg_349_1.var_.moveOldPos1029ui_story = var_352_6.localPosition
			end

			local var_352_8 = 0.001

			if var_352_7 <= arg_349_1.time_ and arg_349_1.time_ < var_352_7 + var_352_8 then
				local var_352_9 = (arg_349_1.time_ - var_352_7) / var_352_8
				local var_352_10 = Vector3.New(0, 100, 0)

				var_352_6.localPosition = Vector3.Lerp(arg_349_1.var_.moveOldPos1029ui_story, var_352_10, var_352_9)

				local var_352_11 = manager.ui.mainCamera.transform.position - var_352_6.position

				var_352_6.forward = Vector3.New(var_352_11.x, var_352_11.y, var_352_11.z)

				local var_352_12 = var_352_6.localEulerAngles

				var_352_12.z = 0
				var_352_12.x = 0
				var_352_6.localEulerAngles = var_352_12
			end

			if arg_349_1.time_ >= var_352_7 + var_352_8 and arg_349_1.time_ < var_352_7 + var_352_8 + arg_352_0 then
				var_352_6.localPosition = Vector3.New(0, 100, 0)

				local var_352_13 = manager.ui.mainCamera.transform.position - var_352_6.position

				var_352_6.forward = Vector3.New(var_352_13.x, var_352_13.y, var_352_13.z)

				local var_352_14 = var_352_6.localEulerAngles

				var_352_14.z = 0
				var_352_14.x = 0
				var_352_6.localEulerAngles = var_352_14
			end

			local var_352_15 = arg_349_1.actors_["1028ui_story"].transform
			local var_352_16 = 0

			if var_352_16 < arg_349_1.time_ and arg_349_1.time_ <= var_352_16 + arg_352_0 then
				arg_349_1.var_.moveOldPos1028ui_story = var_352_15.localPosition
			end

			local var_352_17 = 0.001

			if var_352_16 <= arg_349_1.time_ and arg_349_1.time_ < var_352_16 + var_352_17 then
				local var_352_18 = (arg_349_1.time_ - var_352_16) / var_352_17
				local var_352_19 = Vector3.New(0, 100, 0)

				var_352_15.localPosition = Vector3.Lerp(arg_349_1.var_.moveOldPos1028ui_story, var_352_19, var_352_18)

				local var_352_20 = manager.ui.mainCamera.transform.position - var_352_15.position

				var_352_15.forward = Vector3.New(var_352_20.x, var_352_20.y, var_352_20.z)

				local var_352_21 = var_352_15.localEulerAngles

				var_352_21.z = 0
				var_352_21.x = 0
				var_352_15.localEulerAngles = var_352_21
			end

			if arg_349_1.time_ >= var_352_16 + var_352_17 and arg_349_1.time_ < var_352_16 + var_352_17 + arg_352_0 then
				var_352_15.localPosition = Vector3.New(0, 100, 0)

				local var_352_22 = manager.ui.mainCamera.transform.position - var_352_15.position

				var_352_15.forward = Vector3.New(var_352_22.x, var_352_22.y, var_352_22.z)

				local var_352_23 = var_352_15.localEulerAngles

				var_352_23.z = 0
				var_352_23.x = 0
				var_352_15.localEulerAngles = var_352_23
			end

			local var_352_24 = 0
			local var_352_25 = 1.1

			if var_352_24 < arg_349_1.time_ and arg_349_1.time_ <= var_352_24 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0
				arg_349_1.dialogCg_.alpha = 1

				arg_349_1.dialog_:SetActive(true)
				SetActive(arg_349_1.leftNameGo_, false)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_349_1.iconTrs_.gameObject, false)
				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_26 = arg_349_1:GetWordFromCfg(116021083)
				local var_352_27 = arg_349_1:FormatText(var_352_26.content)

				arg_349_1.text_.text = var_352_27

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_28 = 44
				local var_352_29 = utf8.len(var_352_27)
				local var_352_30 = var_352_28 <= 0 and var_352_25 or var_352_25 * (var_352_29 / var_352_28)

				if var_352_30 > 0 and var_352_25 < var_352_30 then
					arg_349_1.talkMaxDuration = var_352_30

					if var_352_30 + var_352_24 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_30 + var_352_24
					end
				end

				arg_349_1.text_.text = var_352_27
				arg_349_1.typewritter.percent = 0

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(false)
				arg_349_1:RecordContent(arg_349_1.text_.text)
			end

			local var_352_31 = math.max(var_352_25, arg_349_1.talkMaxDuration)

			if var_352_24 <= arg_349_1.time_ and arg_349_1.time_ < var_352_24 + var_352_31 then
				arg_349_1.typewritter.percent = (arg_349_1.time_ - var_352_24) / var_352_31

				arg_349_1.typewritter:SetDirty()
			end

			if arg_349_1.time_ >= var_352_24 + var_352_31 and arg_349_1.time_ < var_352_24 + var_352_31 + arg_352_0 then
				arg_349_1.typewritter.percent = 1

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(true)
			end
		end
	end,
	Play116021084 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 116021084
		arg_353_1.duration_ = 9.066

		local var_353_0 = {
			zh = 9.066,
			ja = 5.233
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
				arg_353_0:Play116021085(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = 0

			if var_356_0 < arg_353_1.time_ and arg_353_1.time_ <= var_356_0 + arg_356_0 then
				arg_353_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action1_1")
			end

			local var_356_1 = 0

			if var_356_1 < arg_353_1.time_ and arg_353_1.time_ <= var_356_1 + arg_356_0 then
				arg_353_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_356_2 = arg_353_1.actors_["1029ui_story"]
			local var_356_3 = 0

			if var_356_3 < arg_353_1.time_ and arg_353_1.time_ <= var_356_3 + arg_356_0 and arg_353_1.var_.characterEffect1029ui_story == nil then
				arg_353_1.var_.characterEffect1029ui_story = var_356_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_356_4 = 0.2

			if var_356_3 <= arg_353_1.time_ and arg_353_1.time_ < var_356_3 + var_356_4 then
				local var_356_5 = (arg_353_1.time_ - var_356_3) / var_356_4

				if arg_353_1.var_.characterEffect1029ui_story then
					arg_353_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_353_1.time_ >= var_356_3 + var_356_4 and arg_353_1.time_ < var_356_3 + var_356_4 + arg_356_0 and arg_353_1.var_.characterEffect1029ui_story then
				arg_353_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_356_6 = arg_353_1.actors_["1029ui_story"].transform
			local var_356_7 = 0

			if var_356_7 < arg_353_1.time_ and arg_353_1.time_ <= var_356_7 + arg_356_0 then
				arg_353_1.var_.moveOldPos1029ui_story = var_356_6.localPosition
			end

			local var_356_8 = 0.001

			if var_356_7 <= arg_353_1.time_ and arg_353_1.time_ < var_356_7 + var_356_8 then
				local var_356_9 = (arg_353_1.time_ - var_356_7) / var_356_8
				local var_356_10 = Vector3.New(0, -1.09, -6.2)

				var_356_6.localPosition = Vector3.Lerp(arg_353_1.var_.moveOldPos1029ui_story, var_356_10, var_356_9)

				local var_356_11 = manager.ui.mainCamera.transform.position - var_356_6.position

				var_356_6.forward = Vector3.New(var_356_11.x, var_356_11.y, var_356_11.z)

				local var_356_12 = var_356_6.localEulerAngles

				var_356_12.z = 0
				var_356_12.x = 0
				var_356_6.localEulerAngles = var_356_12
			end

			if arg_353_1.time_ >= var_356_7 + var_356_8 and arg_353_1.time_ < var_356_7 + var_356_8 + arg_356_0 then
				var_356_6.localPosition = Vector3.New(0, -1.09, -6.2)

				local var_356_13 = manager.ui.mainCamera.transform.position - var_356_6.position

				var_356_6.forward = Vector3.New(var_356_13.x, var_356_13.y, var_356_13.z)

				local var_356_14 = var_356_6.localEulerAngles

				var_356_14.z = 0
				var_356_14.x = 0
				var_356_6.localEulerAngles = var_356_14
			end

			local var_356_15 = 0
			local var_356_16 = 0.775

			if var_356_15 < arg_353_1.time_ and arg_353_1.time_ <= var_356_15 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0
				arg_353_1.dialogCg_.alpha = 1

				arg_353_1.dialog_:SetActive(true)
				SetActive(arg_353_1.leftNameGo_, true)

				local var_356_17 = arg_353_1:FormatText(StoryNameCfg[319].name)

				arg_353_1.leftNameTxt_.text = var_356_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_353_1.leftNameTxt_.transform)

				arg_353_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_353_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_353_1:RecordName(arg_353_1.leftNameTxt_.text)
				SetActive(arg_353_1.iconTrs_.gameObject, false)
				arg_353_1.callingController_:SetSelectedState("normal")

				local var_356_18 = arg_353_1:GetWordFromCfg(116021084)
				local var_356_19 = arg_353_1:FormatText(var_356_18.content)

				arg_353_1.text_.text = var_356_19

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.text_)

				local var_356_20 = 31
				local var_356_21 = utf8.len(var_356_19)
				local var_356_22 = var_356_20 <= 0 and var_356_16 or var_356_16 * (var_356_21 / var_356_20)

				if var_356_22 > 0 and var_356_16 < var_356_22 then
					arg_353_1.talkMaxDuration = var_356_22

					if var_356_22 + var_356_15 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_22 + var_356_15
					end
				end

				arg_353_1.text_.text = var_356_19
				arg_353_1.typewritter.percent = 0

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021084", "story_v_out_116021.awb") ~= 0 then
					local var_356_23 = manager.audio:GetVoiceLength("story_v_out_116021", "116021084", "story_v_out_116021.awb") / 1000

					if var_356_23 + var_356_15 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_23 + var_356_15
					end

					if var_356_18.prefab_name ~= "" and arg_353_1.actors_[var_356_18.prefab_name] ~= nil then
						local var_356_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_353_1.actors_[var_356_18.prefab_name].transform, "story_v_out_116021", "116021084", "story_v_out_116021.awb")

						arg_353_1:RecordAudio("116021084", var_356_24)
						arg_353_1:RecordAudio("116021084", var_356_24)
					else
						arg_353_1:AudioAction("play", "voice", "story_v_out_116021", "116021084", "story_v_out_116021.awb")
					end

					arg_353_1:RecordHistoryTalkVoice("story_v_out_116021", "116021084", "story_v_out_116021.awb")
				end

				arg_353_1:RecordContent(arg_353_1.text_.text)
			end

			local var_356_25 = math.max(var_356_16, arg_353_1.talkMaxDuration)

			if var_356_15 <= arg_353_1.time_ and arg_353_1.time_ < var_356_15 + var_356_25 then
				arg_353_1.typewritter.percent = (arg_353_1.time_ - var_356_15) / var_356_25

				arg_353_1.typewritter:SetDirty()
			end

			if arg_353_1.time_ >= var_356_15 + var_356_25 and arg_353_1.time_ < var_356_15 + var_356_25 + arg_356_0 then
				arg_353_1.typewritter.percent = 1

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(true)
			end
		end
	end,
	Play116021085 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 116021085
		arg_357_1.duration_ = 0.016666666666

		SetActive(arg_357_1.tipsGo_, false)

		function arg_357_1.onSingleLineFinish_()
			arg_357_1.onSingleLineUpdate_ = nil
			arg_357_1.onSingleLineFinish_ = nil
			arg_357_1.state_ = "waiting"

			SetActive(arg_357_1.choicesGo_, true)

			for iter_358_0, iter_358_1 in ipairs(arg_357_1.choices_) do
				local var_358_0 = iter_358_0 <= 2

				SetActive(iter_358_1.go, var_358_0)
			end

			arg_357_1.choices_[1].txt.text = arg_357_1:FormatText(StoryChoiceCfg[231].name)
			arg_357_1.choices_[2].txt.text = arg_357_1:FormatText(StoryChoiceCfg[232].name)
		end

		function arg_357_1.playNext_(arg_359_0)
			if arg_359_0 == 1 then
				arg_357_0:Play116021086(arg_357_1)
			end

			if arg_359_0 == 2 then
				arg_357_0:Play116021086(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			return
		end
	end,
	Play116021086 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 116021086
		arg_361_1.duration_ = 5.933

		local var_361_0 = {
			zh = 5.933,
			ja = 1.999999999999
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
				arg_361_0:Play116021087(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = 0

			if var_364_0 < arg_361_1.time_ and arg_361_1.time_ <= var_364_0 + arg_364_0 then
				arg_361_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action2_1")
			end

			local var_364_1 = 0

			if var_364_1 < arg_361_1.time_ and arg_361_1.time_ <= var_364_1 + arg_364_0 then
				arg_361_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_364_2 = 0
			local var_364_3 = 0.475

			if var_364_2 < arg_361_1.time_ and arg_361_1.time_ <= var_364_2 + arg_364_0 then
				arg_361_1.talkMaxDuration = 0
				arg_361_1.dialogCg_.alpha = 1

				arg_361_1.dialog_:SetActive(true)
				SetActive(arg_361_1.leftNameGo_, true)

				local var_364_4 = arg_361_1:FormatText(StoryNameCfg[319].name)

				arg_361_1.leftNameTxt_.text = var_364_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_361_1.leftNameTxt_.transform)

				arg_361_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_361_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_361_1:RecordName(arg_361_1.leftNameTxt_.text)
				SetActive(arg_361_1.iconTrs_.gameObject, false)
				arg_361_1.callingController_:SetSelectedState("normal")

				local var_364_5 = arg_361_1:GetWordFromCfg(116021086)
				local var_364_6 = arg_361_1:FormatText(var_364_5.content)

				arg_361_1.text_.text = var_364_6

				LuaForUtil.ClearLinePrefixSymbol(arg_361_1.text_)

				local var_364_7 = 19
				local var_364_8 = utf8.len(var_364_6)
				local var_364_9 = var_364_7 <= 0 and var_364_3 or var_364_3 * (var_364_8 / var_364_7)

				if var_364_9 > 0 and var_364_3 < var_364_9 then
					arg_361_1.talkMaxDuration = var_364_9

					if var_364_9 + var_364_2 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_9 + var_364_2
					end
				end

				arg_361_1.text_.text = var_364_6
				arg_361_1.typewritter.percent = 0

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021086", "story_v_out_116021.awb") ~= 0 then
					local var_364_10 = manager.audio:GetVoiceLength("story_v_out_116021", "116021086", "story_v_out_116021.awb") / 1000

					if var_364_10 + var_364_2 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_10 + var_364_2
					end

					if var_364_5.prefab_name ~= "" and arg_361_1.actors_[var_364_5.prefab_name] ~= nil then
						local var_364_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_361_1.actors_[var_364_5.prefab_name].transform, "story_v_out_116021", "116021086", "story_v_out_116021.awb")

						arg_361_1:RecordAudio("116021086", var_364_11)
						arg_361_1:RecordAudio("116021086", var_364_11)
					else
						arg_361_1:AudioAction("play", "voice", "story_v_out_116021", "116021086", "story_v_out_116021.awb")
					end

					arg_361_1:RecordHistoryTalkVoice("story_v_out_116021", "116021086", "story_v_out_116021.awb")
				end

				arg_361_1:RecordContent(arg_361_1.text_.text)
			end

			local var_364_12 = math.max(var_364_3, arg_361_1.talkMaxDuration)

			if var_364_2 <= arg_361_1.time_ and arg_361_1.time_ < var_364_2 + var_364_12 then
				arg_361_1.typewritter.percent = (arg_361_1.time_ - var_364_2) / var_364_12

				arg_361_1.typewritter:SetDirty()
			end

			if arg_361_1.time_ >= var_364_2 + var_364_12 and arg_361_1.time_ < var_364_2 + var_364_12 + arg_364_0 then
				arg_361_1.typewritter.percent = 1

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(true)
			end
		end
	end,
	Play116021087 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 116021087
		arg_365_1.duration_ = 3.266

		local var_365_0 = {
			zh = 3.266,
			ja = 2.9
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
				arg_365_0:Play116021088(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = arg_365_1.actors_["1029ui_story"]
			local var_368_1 = 0

			if var_368_1 < arg_365_1.time_ and arg_365_1.time_ <= var_368_1 + arg_368_0 and arg_365_1.var_.characterEffect1029ui_story == nil then
				arg_365_1.var_.characterEffect1029ui_story = var_368_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_368_2 = 0.2

			if var_368_1 <= arg_365_1.time_ and arg_365_1.time_ < var_368_1 + var_368_2 then
				local var_368_3 = (arg_365_1.time_ - var_368_1) / var_368_2

				if arg_365_1.var_.characterEffect1029ui_story then
					local var_368_4 = Mathf.Lerp(0, 0.5, var_368_3)

					arg_365_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_365_1.var_.characterEffect1029ui_story.fillRatio = var_368_4
				end
			end

			if arg_365_1.time_ >= var_368_1 + var_368_2 and arg_365_1.time_ < var_368_1 + var_368_2 + arg_368_0 and arg_365_1.var_.characterEffect1029ui_story then
				local var_368_5 = 0.5

				arg_365_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_365_1.var_.characterEffect1029ui_story.fillRatio = var_368_5
			end

			local var_368_6 = 0
			local var_368_7 = 0.375

			if var_368_6 < arg_365_1.time_ and arg_365_1.time_ <= var_368_6 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0
				arg_365_1.dialogCg_.alpha = 1

				arg_365_1.dialog_:SetActive(true)
				SetActive(arg_365_1.leftNameGo_, true)

				local var_368_8 = arg_365_1:FormatText(StoryNameCfg[13].name)

				arg_365_1.leftNameTxt_.text = var_368_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_365_1.leftNameTxt_.transform)

				arg_365_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_365_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_365_1:RecordName(arg_365_1.leftNameTxt_.text)
				SetActive(arg_365_1.iconTrs_.gameObject, true)
				arg_365_1.iconController_:SetSelectedState("hero")

				arg_365_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019")

				arg_365_1.callingController_:SetSelectedState("normal")

				local var_368_9 = arg_365_1:GetWordFromCfg(116021087)
				local var_368_10 = arg_365_1:FormatText(var_368_9.content)

				arg_365_1.text_.text = var_368_10

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.text_)

				local var_368_11 = 15
				local var_368_12 = utf8.len(var_368_10)
				local var_368_13 = var_368_11 <= 0 and var_368_7 or var_368_7 * (var_368_12 / var_368_11)

				if var_368_13 > 0 and var_368_7 < var_368_13 then
					arg_365_1.talkMaxDuration = var_368_13

					if var_368_13 + var_368_6 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_13 + var_368_6
					end
				end

				arg_365_1.text_.text = var_368_10
				arg_365_1.typewritter.percent = 0

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021087", "story_v_out_116021.awb") ~= 0 then
					local var_368_14 = manager.audio:GetVoiceLength("story_v_out_116021", "116021087", "story_v_out_116021.awb") / 1000

					if var_368_14 + var_368_6 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_14 + var_368_6
					end

					if var_368_9.prefab_name ~= "" and arg_365_1.actors_[var_368_9.prefab_name] ~= nil then
						local var_368_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_365_1.actors_[var_368_9.prefab_name].transform, "story_v_out_116021", "116021087", "story_v_out_116021.awb")

						arg_365_1:RecordAudio("116021087", var_368_15)
						arg_365_1:RecordAudio("116021087", var_368_15)
					else
						arg_365_1:AudioAction("play", "voice", "story_v_out_116021", "116021087", "story_v_out_116021.awb")
					end

					arg_365_1:RecordHistoryTalkVoice("story_v_out_116021", "116021087", "story_v_out_116021.awb")
				end

				arg_365_1:RecordContent(arg_365_1.text_.text)
			end

			local var_368_16 = math.max(var_368_7, arg_365_1.talkMaxDuration)

			if var_368_6 <= arg_365_1.time_ and arg_365_1.time_ < var_368_6 + var_368_16 then
				arg_365_1.typewritter.percent = (arg_365_1.time_ - var_368_6) / var_368_16

				arg_365_1.typewritter:SetDirty()
			end

			if arg_365_1.time_ >= var_368_6 + var_368_16 and arg_365_1.time_ < var_368_6 + var_368_16 + arg_368_0 then
				arg_365_1.typewritter.percent = 1

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(true)
			end
		end
	end,
	Play116021088 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 116021088
		arg_369_1.duration_ = 10.5

		local var_369_0 = {
			zh = 9.933,
			ja = 10.5
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
				arg_369_0:Play116021089(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = 0

			if var_372_0 < arg_369_1.time_ and arg_369_1.time_ <= var_372_0 + arg_372_0 then
				arg_369_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action2_2")
			end

			local var_372_1 = 0

			if var_372_1 < arg_369_1.time_ and arg_369_1.time_ <= var_372_1 + arg_372_0 then
				arg_369_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_372_2 = arg_369_1.actors_["1029ui_story"]
			local var_372_3 = 0

			if var_372_3 < arg_369_1.time_ and arg_369_1.time_ <= var_372_3 + arg_372_0 and arg_369_1.var_.characterEffect1029ui_story == nil then
				arg_369_1.var_.characterEffect1029ui_story = var_372_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_372_4 = 0.2

			if var_372_3 <= arg_369_1.time_ and arg_369_1.time_ < var_372_3 + var_372_4 then
				local var_372_5 = (arg_369_1.time_ - var_372_3) / var_372_4

				if arg_369_1.var_.characterEffect1029ui_story then
					arg_369_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_369_1.time_ >= var_372_3 + var_372_4 and arg_369_1.time_ < var_372_3 + var_372_4 + arg_372_0 and arg_369_1.var_.characterEffect1029ui_story then
				arg_369_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_372_6 = 0
			local var_372_7 = 1.1

			if var_372_6 < arg_369_1.time_ and arg_369_1.time_ <= var_372_6 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0
				arg_369_1.dialogCg_.alpha = 1

				arg_369_1.dialog_:SetActive(true)
				SetActive(arg_369_1.leftNameGo_, true)

				local var_372_8 = arg_369_1:FormatText(StoryNameCfg[319].name)

				arg_369_1.leftNameTxt_.text = var_372_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_369_1.leftNameTxt_.transform)

				arg_369_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_369_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_369_1:RecordName(arg_369_1.leftNameTxt_.text)
				SetActive(arg_369_1.iconTrs_.gameObject, false)
				arg_369_1.callingController_:SetSelectedState("normal")

				local var_372_9 = arg_369_1:GetWordFromCfg(116021088)
				local var_372_10 = arg_369_1:FormatText(var_372_9.content)

				arg_369_1.text_.text = var_372_10

				LuaForUtil.ClearLinePrefixSymbol(arg_369_1.text_)

				local var_372_11 = 44
				local var_372_12 = utf8.len(var_372_10)
				local var_372_13 = var_372_11 <= 0 and var_372_7 or var_372_7 * (var_372_12 / var_372_11)

				if var_372_13 > 0 and var_372_7 < var_372_13 then
					arg_369_1.talkMaxDuration = var_372_13

					if var_372_13 + var_372_6 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_13 + var_372_6
					end
				end

				arg_369_1.text_.text = var_372_10
				arg_369_1.typewritter.percent = 0

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021088", "story_v_out_116021.awb") ~= 0 then
					local var_372_14 = manager.audio:GetVoiceLength("story_v_out_116021", "116021088", "story_v_out_116021.awb") / 1000

					if var_372_14 + var_372_6 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_14 + var_372_6
					end

					if var_372_9.prefab_name ~= "" and arg_369_1.actors_[var_372_9.prefab_name] ~= nil then
						local var_372_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_369_1.actors_[var_372_9.prefab_name].transform, "story_v_out_116021", "116021088", "story_v_out_116021.awb")

						arg_369_1:RecordAudio("116021088", var_372_15)
						arg_369_1:RecordAudio("116021088", var_372_15)
					else
						arg_369_1:AudioAction("play", "voice", "story_v_out_116021", "116021088", "story_v_out_116021.awb")
					end

					arg_369_1:RecordHistoryTalkVoice("story_v_out_116021", "116021088", "story_v_out_116021.awb")
				end

				arg_369_1:RecordContent(arg_369_1.text_.text)
			end

			local var_372_16 = math.max(var_372_7, arg_369_1.talkMaxDuration)

			if var_372_6 <= arg_369_1.time_ and arg_369_1.time_ < var_372_6 + var_372_16 then
				arg_369_1.typewritter.percent = (arg_369_1.time_ - var_372_6) / var_372_16

				arg_369_1.typewritter:SetDirty()
			end

			if arg_369_1.time_ >= var_372_6 + var_372_16 and arg_369_1.time_ < var_372_6 + var_372_16 + arg_372_0 then
				arg_369_1.typewritter.percent = 1

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(true)
			end
		end
	end,
	Play116021089 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 116021089
		arg_373_1.duration_ = 4.9

		local var_373_0 = {
			zh = 1.999999999999,
			ja = 4.9
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
				arg_373_0:Play116021090(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = 0

			if var_376_0 < arg_373_1.time_ and arg_373_1.time_ <= var_376_0 + arg_376_0 then
				arg_373_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action1_1")
			end

			local var_376_1 = 0

			if var_376_1 < arg_373_1.time_ and arg_373_1.time_ <= var_376_1 + arg_376_0 then
				arg_373_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_376_2 = 0
			local var_376_3 = 0.15

			if var_376_2 < arg_373_1.time_ and arg_373_1.time_ <= var_376_2 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0
				arg_373_1.dialogCg_.alpha = 1

				arg_373_1.dialog_:SetActive(true)
				SetActive(arg_373_1.leftNameGo_, true)

				local var_376_4 = arg_373_1:FormatText(StoryNameCfg[319].name)

				arg_373_1.leftNameTxt_.text = var_376_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_373_1.leftNameTxt_.transform)

				arg_373_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_373_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_373_1:RecordName(arg_373_1.leftNameTxt_.text)
				SetActive(arg_373_1.iconTrs_.gameObject, false)
				arg_373_1.callingController_:SetSelectedState("normal")

				local var_376_5 = arg_373_1:GetWordFromCfg(116021089)
				local var_376_6 = arg_373_1:FormatText(var_376_5.content)

				arg_373_1.text_.text = var_376_6

				LuaForUtil.ClearLinePrefixSymbol(arg_373_1.text_)

				local var_376_7 = 6
				local var_376_8 = utf8.len(var_376_6)
				local var_376_9 = var_376_7 <= 0 and var_376_3 or var_376_3 * (var_376_8 / var_376_7)

				if var_376_9 > 0 and var_376_3 < var_376_9 then
					arg_373_1.talkMaxDuration = var_376_9

					if var_376_9 + var_376_2 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_9 + var_376_2
					end
				end

				arg_373_1.text_.text = var_376_6
				arg_373_1.typewritter.percent = 0

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021089", "story_v_out_116021.awb") ~= 0 then
					local var_376_10 = manager.audio:GetVoiceLength("story_v_out_116021", "116021089", "story_v_out_116021.awb") / 1000

					if var_376_10 + var_376_2 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_10 + var_376_2
					end

					if var_376_5.prefab_name ~= "" and arg_373_1.actors_[var_376_5.prefab_name] ~= nil then
						local var_376_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_373_1.actors_[var_376_5.prefab_name].transform, "story_v_out_116021", "116021089", "story_v_out_116021.awb")

						arg_373_1:RecordAudio("116021089", var_376_11)
						arg_373_1:RecordAudio("116021089", var_376_11)
					else
						arg_373_1:AudioAction("play", "voice", "story_v_out_116021", "116021089", "story_v_out_116021.awb")
					end

					arg_373_1:RecordHistoryTalkVoice("story_v_out_116021", "116021089", "story_v_out_116021.awb")
				end

				arg_373_1:RecordContent(arg_373_1.text_.text)
			end

			local var_376_12 = math.max(var_376_3, arg_373_1.talkMaxDuration)

			if var_376_2 <= arg_373_1.time_ and arg_373_1.time_ < var_376_2 + var_376_12 then
				arg_373_1.typewritter.percent = (arg_373_1.time_ - var_376_2) / var_376_12

				arg_373_1.typewritter:SetDirty()
			end

			if arg_373_1.time_ >= var_376_2 + var_376_12 and arg_373_1.time_ < var_376_2 + var_376_12 + arg_376_0 then
				arg_373_1.typewritter.percent = 1

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(true)
			end
		end
	end,
	Play116021090 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 116021090
		arg_377_1.duration_ = 3.9

		local var_377_0 = {
			zh = 3.9,
			ja = 2
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
			arg_377_1.auto_ = false
		end

		function arg_377_1.playNext_(arg_379_0)
			arg_377_1.onStoryFinished_()
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = arg_377_1.actors_["1029ui_story"]
			local var_380_1 = 0

			if var_380_1 < arg_377_1.time_ and arg_377_1.time_ <= var_380_1 + arg_380_0 and arg_377_1.var_.characterEffect1029ui_story == nil then
				arg_377_1.var_.characterEffect1029ui_story = var_380_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_380_2 = 0.2

			if var_380_1 <= arg_377_1.time_ and arg_377_1.time_ < var_380_1 + var_380_2 then
				local var_380_3 = (arg_377_1.time_ - var_380_1) / var_380_2

				if arg_377_1.var_.characterEffect1029ui_story then
					local var_380_4 = Mathf.Lerp(0, 0.5, var_380_3)

					arg_377_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_377_1.var_.characterEffect1029ui_story.fillRatio = var_380_4
				end
			end

			if arg_377_1.time_ >= var_380_1 + var_380_2 and arg_377_1.time_ < var_380_1 + var_380_2 + arg_380_0 and arg_377_1.var_.characterEffect1029ui_story then
				local var_380_5 = 0.5

				arg_377_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_377_1.var_.characterEffect1029ui_story.fillRatio = var_380_5
			end

			local var_380_6 = 0
			local var_380_7 = 0.175

			if var_380_6 < arg_377_1.time_ and arg_377_1.time_ <= var_380_6 + arg_380_0 then
				arg_377_1.talkMaxDuration = 0
				arg_377_1.dialogCg_.alpha = 1

				arg_377_1.dialog_:SetActive(true)
				SetActive(arg_377_1.leftNameGo_, true)

				local var_380_8 = arg_377_1:FormatText(StoryNameCfg[13].name)

				arg_377_1.leftNameTxt_.text = var_380_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_377_1.leftNameTxt_.transform)

				arg_377_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_377_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_377_1:RecordName(arg_377_1.leftNameTxt_.text)
				SetActive(arg_377_1.iconTrs_.gameObject, true)
				arg_377_1.iconController_:SetSelectedState("hero")

				arg_377_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019")

				arg_377_1.callingController_:SetSelectedState("normal")

				local var_380_9 = arg_377_1:GetWordFromCfg(116021090)
				local var_380_10 = arg_377_1:FormatText(var_380_9.content)

				arg_377_1.text_.text = var_380_10

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_11 = 7
				local var_380_12 = utf8.len(var_380_10)
				local var_380_13 = var_380_11 <= 0 and var_380_7 or var_380_7 * (var_380_12 / var_380_11)

				if var_380_13 > 0 and var_380_7 < var_380_13 then
					arg_377_1.talkMaxDuration = var_380_13

					if var_380_13 + var_380_6 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_13 + var_380_6
					end
				end

				arg_377_1.text_.text = var_380_10
				arg_377_1.typewritter.percent = 0

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021090", "story_v_out_116021.awb") ~= 0 then
					local var_380_14 = manager.audio:GetVoiceLength("story_v_out_116021", "116021090", "story_v_out_116021.awb") / 1000

					if var_380_14 + var_380_6 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_14 + var_380_6
					end

					if var_380_9.prefab_name ~= "" and arg_377_1.actors_[var_380_9.prefab_name] ~= nil then
						local var_380_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_377_1.actors_[var_380_9.prefab_name].transform, "story_v_out_116021", "116021090", "story_v_out_116021.awb")

						arg_377_1:RecordAudio("116021090", var_380_15)
						arg_377_1:RecordAudio("116021090", var_380_15)
					else
						arg_377_1:AudioAction("play", "voice", "story_v_out_116021", "116021090", "story_v_out_116021.awb")
					end

					arg_377_1:RecordHistoryTalkVoice("story_v_out_116021", "116021090", "story_v_out_116021.awb")
				end

				arg_377_1:RecordContent(arg_377_1.text_.text)
			end

			local var_380_16 = math.max(var_380_7, arg_377_1.talkMaxDuration)

			if var_380_6 <= arg_377_1.time_ and arg_377_1.time_ < var_380_6 + var_380_16 then
				arg_377_1.typewritter.percent = (arg_377_1.time_ - var_380_6) / var_380_16

				arg_377_1.typewritter:SetDirty()
			end

			if arg_377_1.time_ >= var_380_6 + var_380_16 and arg_377_1.time_ < var_380_6 + var_380_16 + arg_380_0 then
				arg_377_1.typewritter.percent = 1

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(true)
			end
		end
	end,
	Play116021044 = function(arg_381_0, arg_381_1)
		arg_381_1.time_ = 0
		arg_381_1.frameCnt_ = 0
		arg_381_1.state_ = "playing"
		arg_381_1.curTalkId_ = 116021044
		arg_381_1.duration_ = 7.833

		local var_381_0 = {
			zh = 7.5,
			ja = 7.833
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
				arg_381_0:Play116021045(arg_381_1)
			end
		end

		function arg_381_1.onSingleLineUpdate_(arg_384_0)
			local var_384_0 = 0
			local var_384_1 = 0.925

			if var_384_0 < arg_381_1.time_ and arg_381_1.time_ <= var_384_0 + arg_384_0 then
				arg_381_1.talkMaxDuration = 0
				arg_381_1.dialogCg_.alpha = 1

				arg_381_1.dialog_:SetActive(true)
				SetActive(arg_381_1.leftNameGo_, true)

				local var_384_2 = arg_381_1:FormatText(StoryNameCfg[327].name)

				arg_381_1.leftNameTxt_.text = var_384_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_381_1.leftNameTxt_.transform)

				arg_381_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_381_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_381_1:RecordName(arg_381_1.leftNameTxt_.text)
				SetActive(arg_381_1.iconTrs_.gameObject, false)
				arg_381_1.callingController_:SetSelectedState("normal")

				local var_384_3 = arg_381_1:GetWordFromCfg(116021044)
				local var_384_4 = arg_381_1:FormatText(var_384_3.content)

				arg_381_1.text_.text = var_384_4

				LuaForUtil.ClearLinePrefixSymbol(arg_381_1.text_)

				local var_384_5 = 37
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

				if manager.audio:GetVoiceLength("story_v_out_116021", "116021044", "story_v_out_116021.awb") ~= 0 then
					local var_384_8 = manager.audio:GetVoiceLength("story_v_out_116021", "116021044", "story_v_out_116021.awb") / 1000

					if var_384_8 + var_384_0 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_8 + var_384_0
					end

					if var_384_3.prefab_name ~= "" and arg_381_1.actors_[var_384_3.prefab_name] ~= nil then
						local var_384_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_381_1.actors_[var_384_3.prefab_name].transform, "story_v_out_116021", "116021044", "story_v_out_116021.awb")

						arg_381_1:RecordAudio("116021044", var_384_9)
						arg_381_1:RecordAudio("116021044", var_384_9)
					else
						arg_381_1:AudioAction("play", "voice", "story_v_out_116021", "116021044", "story_v_out_116021.awb")
					end

					arg_381_1:RecordHistoryTalkVoice("story_v_out_116021", "116021044", "story_v_out_116021.awb")
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
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/I02",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST07b",
		"Assets/UIResources/UI_AB/TextureConfig/Background/SK0104",
		"Assets/UIResources/UI_AB/TextureConfig/Background/B13",
		"Assets/UIResources/UI_AB/TextureConfig/Background/SK0105",
		"Assets/UIResources/UI_AB/TextureConfig/Background/A00"
	},
	voices = {
		"story_v_out_116021.awb"
	}
}
