return {
	Play121481001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 121481001
		arg_1_1.duration_ = 7.066

		local var_1_0 = {
			ja = 7.066,
			ko = 5.633,
			zh = 5.633
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
				arg_1_0:Play121481002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST41"

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
				local var_4_5 = arg_1_1.bgs_.ST41

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
					if iter_4_0 ~= "ST41" then
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

			local var_4_22 = 0.266666666666667
			local var_4_23 = 0.633333333333333

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "bgm_activity_2_1_story_sifangyuan", "bgm_activity_2_1_story_sifangyuan", "bgm_activity_2_1_story_sifangyuan.awb")
			end

			local var_4_26 = 0
			local var_4_27 = 0.133333333333333

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 0.35

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

				local var_4_33 = arg_1_1:FormatText(StoryNameCfg[379].name)

				arg_1_1.leftNameTxt_.text = var_4_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, true)
				arg_1_1.iconController_:SetSelectedState("hero")

				arg_1_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1072")

				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_34 = arg_1_1:GetWordFromCfg(121481001)
				local var_4_35 = arg_1_1:FormatText(var_4_34.content)

				arg_1_1.text_.text = var_4_35

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_36 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481001", "story_v_out_121481.awb") ~= 0 then
					local var_4_39 = manager.audio:GetVoiceLength("story_v_out_121481", "121481001", "story_v_out_121481.awb") / 1000

					if var_4_39 + var_4_30 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_39 + var_4_30
					end

					if var_4_34.prefab_name ~= "" and arg_1_1.actors_[var_4_34.prefab_name] ~= nil then
						local var_4_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_34.prefab_name].transform, "story_v_out_121481", "121481001", "story_v_out_121481.awb")

						arg_1_1:RecordAudio("121481001", var_4_40)
						arg_1_1:RecordAudio("121481001", var_4_40)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_121481", "121481001", "story_v_out_121481.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_121481", "121481001", "story_v_out_121481.awb")
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
	Play121481002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 121481002
		arg_7_1.duration_ = 2.633

		local var_7_0 = {
			ja = 2.633,
			ko = 1.566,
			zh = 1.566
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
				arg_7_0:Play121481003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.175

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_2 = arg_7_1:FormatText(StoryNameCfg[389].name)

				arg_7_1.leftNameTxt_.text = var_10_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, true)
				arg_7_1.iconController_:SetSelectedState("hero")

				arg_7_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1076")

				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_3 = arg_7_1:GetWordFromCfg(121481002)
				local var_10_4 = arg_7_1:FormatText(var_10_3.content)

				arg_7_1.text_.text = var_10_4

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_5 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481002", "story_v_out_121481.awb") ~= 0 then
					local var_10_8 = manager.audio:GetVoiceLength("story_v_out_121481", "121481002", "story_v_out_121481.awb") / 1000

					if var_10_8 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_8 + var_10_0
					end

					if var_10_3.prefab_name ~= "" and arg_7_1.actors_[var_10_3.prefab_name] ~= nil then
						local var_10_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_3.prefab_name].transform, "story_v_out_121481", "121481002", "story_v_out_121481.awb")

						arg_7_1:RecordAudio("121481002", var_10_9)
						arg_7_1:RecordAudio("121481002", var_10_9)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_121481", "121481002", "story_v_out_121481.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_121481", "121481002", "story_v_out_121481.awb")
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
	Play121481003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 121481003
		arg_11_1.duration_ = 3.6

		local var_11_0 = {
			ja = 3.6,
			ko = 1.733,
			zh = 1.733
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
				arg_11_0:Play121481004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = manager.ui.mainCamera.transform
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				arg_11_1.var_.shakeOldPos = var_14_0.localPosition
			end

			local var_14_2 = 0.6

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / 0.066
				local var_14_4, var_14_5 = math.modf(var_14_3)

				var_14_0.localPosition = Vector3.New(var_14_5 * 0.13, var_14_5 * 0.13, var_14_5 * 0.13) + arg_11_1.var_.shakeOldPos
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 then
				var_14_0.localPosition = arg_11_1.var_.shakeOldPos
			end

			local var_14_6 = 0

			if var_14_6 < arg_11_1.time_ and arg_11_1.time_ <= var_14_6 + arg_14_0 then
				arg_11_1.allBtn_.enabled = false
			end

			local var_14_7 = 0.6

			if arg_11_1.time_ >= var_14_6 + var_14_7 and arg_11_1.time_ < var_14_6 + var_14_7 + arg_14_0 then
				arg_11_1.allBtn_.enabled = true
			end

			local var_14_8 = 0
			local var_14_9 = 0.15

			if var_14_8 < arg_11_1.time_ and arg_11_1.time_ <= var_14_8 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_10 = arg_11_1:FormatText(StoryNameCfg[379].name)

				arg_11_1.leftNameTxt_.text = var_14_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, true)
				arg_11_1.iconController_:SetSelectedState("hero")

				arg_11_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1072")

				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_11 = arg_11_1:GetWordFromCfg(121481003)
				local var_14_12 = arg_11_1:FormatText(var_14_11.content)

				arg_11_1.text_.text = var_14_12

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_13 = 6
				local var_14_14 = utf8.len(var_14_12)
				local var_14_15 = var_14_13 <= 0 and var_14_9 or var_14_9 * (var_14_14 / var_14_13)

				if var_14_15 > 0 and var_14_9 < var_14_15 then
					arg_11_1.talkMaxDuration = var_14_15

					if var_14_15 + var_14_8 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_15 + var_14_8
					end
				end

				arg_11_1.text_.text = var_14_12
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481003", "story_v_out_121481.awb") ~= 0 then
					local var_14_16 = manager.audio:GetVoiceLength("story_v_out_121481", "121481003", "story_v_out_121481.awb") / 1000

					if var_14_16 + var_14_8 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_16 + var_14_8
					end

					if var_14_11.prefab_name ~= "" and arg_11_1.actors_[var_14_11.prefab_name] ~= nil then
						local var_14_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_11.prefab_name].transform, "story_v_out_121481", "121481003", "story_v_out_121481.awb")

						arg_11_1:RecordAudio("121481003", var_14_17)
						arg_11_1:RecordAudio("121481003", var_14_17)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_121481", "121481003", "story_v_out_121481.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_121481", "121481003", "story_v_out_121481.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_18 = math.max(var_14_9, arg_11_1.talkMaxDuration)

			if var_14_8 <= arg_11_1.time_ and arg_11_1.time_ < var_14_8 + var_14_18 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_8) / var_14_18

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_8 + var_14_18 and arg_11_1.time_ < var_14_8 + var_14_18 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play121481004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 121481004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play121481005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 1.5

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

				local var_18_2 = arg_15_1:GetWordFromCfg(121481004)
				local var_18_3 = arg_15_1:FormatText(var_18_2.content)

				arg_15_1.text_.text = var_18_3

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_4 = 60
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
	Play121481005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 121481005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play121481006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 0.875

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

				local var_22_2 = arg_19_1:GetWordFromCfg(121481005)
				local var_22_3 = arg_19_1:FormatText(var_22_2.content)

				arg_19_1.text_.text = var_22_3

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_4 = 35
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
	Play121481006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 121481006
		arg_23_1.duration_ = 11.366

		local var_23_0 = {
			ja = 11.366,
			ko = 7.3,
			zh = 7.3
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
				arg_23_0:Play121481007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = "1072ui_story"

			if arg_23_1.actors_[var_26_0] == nil then
				local var_26_1 = Object.Instantiate(Asset.Load("Char/" .. var_26_0), arg_23_1.stage_.transform)

				var_26_1.name = var_26_0
				var_26_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_23_1.actors_[var_26_0] = var_26_1

				local var_26_2 = var_26_1:GetComponentInChildren(typeof(CharacterEffect))

				var_26_2.enabled = true

				local var_26_3 = GameObjectTools.GetOrAddComponent(var_26_1, typeof(DynamicBoneHelper))

				if var_26_3 then
					var_26_3:EnableDynamicBone(false)
				end

				arg_23_1:ShowWeapon(var_26_2.transform, false)

				arg_23_1.var_[var_26_0 .. "Animator"] = var_26_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_23_1.var_[var_26_0 .. "Animator"].applyRootMotion = true
				arg_23_1.var_[var_26_0 .. "LipSync"] = var_26_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_26_4 = arg_23_1.actors_["1072ui_story"].transform
			local var_26_5 = 0

			if var_26_5 < arg_23_1.time_ and arg_23_1.time_ <= var_26_5 + arg_26_0 then
				arg_23_1.var_.moveOldPos1072ui_story = var_26_4.localPosition
			end

			local var_26_6 = 0.001

			if var_26_5 <= arg_23_1.time_ and arg_23_1.time_ < var_26_5 + var_26_6 then
				local var_26_7 = (arg_23_1.time_ - var_26_5) / var_26_6
				local var_26_8 = Vector3.New(-0.7, -0.71, -6)

				var_26_4.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1072ui_story, var_26_8, var_26_7)

				local var_26_9 = manager.ui.mainCamera.transform.position - var_26_4.position

				var_26_4.forward = Vector3.New(var_26_9.x, var_26_9.y, var_26_9.z)

				local var_26_10 = var_26_4.localEulerAngles

				var_26_10.z = 0
				var_26_10.x = 0
				var_26_4.localEulerAngles = var_26_10
			end

			if arg_23_1.time_ >= var_26_5 + var_26_6 and arg_23_1.time_ < var_26_5 + var_26_6 + arg_26_0 then
				var_26_4.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_26_11 = manager.ui.mainCamera.transform.position - var_26_4.position

				var_26_4.forward = Vector3.New(var_26_11.x, var_26_11.y, var_26_11.z)

				local var_26_12 = var_26_4.localEulerAngles

				var_26_12.z = 0
				var_26_12.x = 0
				var_26_4.localEulerAngles = var_26_12
			end

			local var_26_13 = arg_23_1.actors_["1072ui_story"]
			local var_26_14 = 0

			if var_26_14 < arg_23_1.time_ and arg_23_1.time_ <= var_26_14 + arg_26_0 and arg_23_1.var_.characterEffect1072ui_story == nil then
				arg_23_1.var_.characterEffect1072ui_story = var_26_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_15 = 0.200000002980232

			if var_26_14 <= arg_23_1.time_ and arg_23_1.time_ < var_26_14 + var_26_15 then
				local var_26_16 = (arg_23_1.time_ - var_26_14) / var_26_15

				if arg_23_1.var_.characterEffect1072ui_story then
					arg_23_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_14 + var_26_15 and arg_23_1.time_ < var_26_14 + var_26_15 + arg_26_0 and arg_23_1.var_.characterEffect1072ui_story then
				arg_23_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_26_17 = 0

			if var_26_17 < arg_23_1.time_ and arg_23_1.time_ <= var_26_17 + arg_26_0 then
				arg_23_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action1_1")
			end

			local var_26_18 = 0

			if var_26_18 < arg_23_1.time_ and arg_23_1.time_ <= var_26_18 + arg_26_0 then
				arg_23_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_26_19 = "1076ui_story"

			if arg_23_1.actors_[var_26_19] == nil then
				local var_26_20 = Object.Instantiate(Asset.Load("Char/" .. var_26_19), arg_23_1.stage_.transform)

				var_26_20.name = var_26_19
				var_26_20.transform.localPosition = Vector3.New(0, 100, 0)
				arg_23_1.actors_[var_26_19] = var_26_20

				local var_26_21 = var_26_20:GetComponentInChildren(typeof(CharacterEffect))

				var_26_21.enabled = true

				local var_26_22 = GameObjectTools.GetOrAddComponent(var_26_20, typeof(DynamicBoneHelper))

				if var_26_22 then
					var_26_22:EnableDynamicBone(false)
				end

				arg_23_1:ShowWeapon(var_26_21.transform, false)

				arg_23_1.var_[var_26_19 .. "Animator"] = var_26_21.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_23_1.var_[var_26_19 .. "Animator"].applyRootMotion = true
				arg_23_1.var_[var_26_19 .. "LipSync"] = var_26_21.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_26_23 = arg_23_1.actors_["1076ui_story"].transform
			local var_26_24 = 0

			if var_26_24 < arg_23_1.time_ and arg_23_1.time_ <= var_26_24 + arg_26_0 then
				arg_23_1.var_.moveOldPos1076ui_story = var_26_23.localPosition
			end

			local var_26_25 = 0.001

			if var_26_24 <= arg_23_1.time_ and arg_23_1.time_ < var_26_24 + var_26_25 then
				local var_26_26 = (arg_23_1.time_ - var_26_24) / var_26_25
				local var_26_27 = Vector3.New(0.7, -1.06, -6.2)

				var_26_23.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1076ui_story, var_26_27, var_26_26)

				local var_26_28 = manager.ui.mainCamera.transform.position - var_26_23.position

				var_26_23.forward = Vector3.New(var_26_28.x, var_26_28.y, var_26_28.z)

				local var_26_29 = var_26_23.localEulerAngles

				var_26_29.z = 0
				var_26_29.x = 0
				var_26_23.localEulerAngles = var_26_29
			end

			if arg_23_1.time_ >= var_26_24 + var_26_25 and arg_23_1.time_ < var_26_24 + var_26_25 + arg_26_0 then
				var_26_23.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_26_30 = manager.ui.mainCamera.transform.position - var_26_23.position

				var_26_23.forward = Vector3.New(var_26_30.x, var_26_30.y, var_26_30.z)

				local var_26_31 = var_26_23.localEulerAngles

				var_26_31.z = 0
				var_26_31.x = 0
				var_26_23.localEulerAngles = var_26_31
			end

			local var_26_32 = arg_23_1.actors_["1076ui_story"]
			local var_26_33 = 0

			if var_26_33 < arg_23_1.time_ and arg_23_1.time_ <= var_26_33 + arg_26_0 and arg_23_1.var_.characterEffect1076ui_story == nil then
				arg_23_1.var_.characterEffect1076ui_story = var_26_32:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_34 = 0.200000002980232

			if var_26_33 <= arg_23_1.time_ and arg_23_1.time_ < var_26_33 + var_26_34 then
				local var_26_35 = (arg_23_1.time_ - var_26_33) / var_26_34

				if arg_23_1.var_.characterEffect1076ui_story then
					local var_26_36 = Mathf.Lerp(0, 0.5, var_26_35)

					arg_23_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1076ui_story.fillRatio = var_26_36
				end
			end

			if arg_23_1.time_ >= var_26_33 + var_26_34 and arg_23_1.time_ < var_26_33 + var_26_34 + arg_26_0 and arg_23_1.var_.characterEffect1076ui_story then
				local var_26_37 = 0.5

				arg_23_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1076ui_story.fillRatio = var_26_37
			end

			local var_26_38 = 0

			if var_26_38 < arg_23_1.time_ and arg_23_1.time_ <= var_26_38 + arg_26_0 then
				arg_23_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action1_1")
			end

			local var_26_39 = 0
			local var_26_40 = 0.6

			if var_26_39 < arg_23_1.time_ and arg_23_1.time_ <= var_26_39 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_41 = arg_23_1:FormatText(StoryNameCfg[379].name)

				arg_23_1.leftNameTxt_.text = var_26_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_42 = arg_23_1:GetWordFromCfg(121481006)
				local var_26_43 = arg_23_1:FormatText(var_26_42.content)

				arg_23_1.text_.text = var_26_43

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_44 = 24
				local var_26_45 = utf8.len(var_26_43)
				local var_26_46 = var_26_44 <= 0 and var_26_40 or var_26_40 * (var_26_45 / var_26_44)

				if var_26_46 > 0 and var_26_40 < var_26_46 then
					arg_23_1.talkMaxDuration = var_26_46

					if var_26_46 + var_26_39 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_46 + var_26_39
					end
				end

				arg_23_1.text_.text = var_26_43
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481006", "story_v_out_121481.awb") ~= 0 then
					local var_26_47 = manager.audio:GetVoiceLength("story_v_out_121481", "121481006", "story_v_out_121481.awb") / 1000

					if var_26_47 + var_26_39 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_47 + var_26_39
					end

					if var_26_42.prefab_name ~= "" and arg_23_1.actors_[var_26_42.prefab_name] ~= nil then
						local var_26_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_42.prefab_name].transform, "story_v_out_121481", "121481006", "story_v_out_121481.awb")

						arg_23_1:RecordAudio("121481006", var_26_48)
						arg_23_1:RecordAudio("121481006", var_26_48)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_121481", "121481006", "story_v_out_121481.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_121481", "121481006", "story_v_out_121481.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_49 = math.max(var_26_40, arg_23_1.talkMaxDuration)

			if var_26_39 <= arg_23_1.time_ and arg_23_1.time_ < var_26_39 + var_26_49 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_39) / var_26_49

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_39 + var_26_49 and arg_23_1.time_ < var_26_39 + var_26_49 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play121481007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 121481007
		arg_27_1.duration_ = 6.266

		local var_27_0 = {
			ja = 6.266,
			ko = 3.133,
			zh = 3.133
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
				arg_27_0:Play121481008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1072ui_story"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.characterEffect1072ui_story == nil then
				arg_27_1.var_.characterEffect1072ui_story = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.200000002980232

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect1072ui_story then
					local var_30_4 = Mathf.Lerp(0, 0.5, var_30_3)

					arg_27_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1072ui_story.fillRatio = var_30_4
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect1072ui_story then
				local var_30_5 = 0.5

				arg_27_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1072ui_story.fillRatio = var_30_5
			end

			local var_30_6 = 0

			if var_30_6 < arg_27_1.time_ and arg_27_1.time_ <= var_30_6 + arg_30_0 then
				arg_27_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action1_1")
			end

			local var_30_7 = arg_27_1.actors_["1076ui_story"]
			local var_30_8 = 0

			if var_30_8 < arg_27_1.time_ and arg_27_1.time_ <= var_30_8 + arg_30_0 and arg_27_1.var_.characterEffect1076ui_story == nil then
				arg_27_1.var_.characterEffect1076ui_story = var_30_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_9 = 0.200000002980232

			if var_30_8 <= arg_27_1.time_ and arg_27_1.time_ < var_30_8 + var_30_9 then
				local var_30_10 = (arg_27_1.time_ - var_30_8) / var_30_9

				if arg_27_1.var_.characterEffect1076ui_story then
					arg_27_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_8 + var_30_9 and arg_27_1.time_ < var_30_8 + var_30_9 + arg_30_0 and arg_27_1.var_.characterEffect1076ui_story then
				arg_27_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_30_11 = 0
			local var_30_12 = 0.375

			if var_30_11 < arg_27_1.time_ and arg_27_1.time_ <= var_30_11 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_13 = arg_27_1:FormatText(StoryNameCfg[389].name)

				arg_27_1.leftNameTxt_.text = var_30_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_14 = arg_27_1:GetWordFromCfg(121481007)
				local var_30_15 = arg_27_1:FormatText(var_30_14.content)

				arg_27_1.text_.text = var_30_15

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_16 = 15
				local var_30_17 = utf8.len(var_30_15)
				local var_30_18 = var_30_16 <= 0 and var_30_12 or var_30_12 * (var_30_17 / var_30_16)

				if var_30_18 > 0 and var_30_12 < var_30_18 then
					arg_27_1.talkMaxDuration = var_30_18

					if var_30_18 + var_30_11 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_18 + var_30_11
					end
				end

				arg_27_1.text_.text = var_30_15
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481007", "story_v_out_121481.awb") ~= 0 then
					local var_30_19 = manager.audio:GetVoiceLength("story_v_out_121481", "121481007", "story_v_out_121481.awb") / 1000

					if var_30_19 + var_30_11 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_19 + var_30_11
					end

					if var_30_14.prefab_name ~= "" and arg_27_1.actors_[var_30_14.prefab_name] ~= nil then
						local var_30_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_14.prefab_name].transform, "story_v_out_121481", "121481007", "story_v_out_121481.awb")

						arg_27_1:RecordAudio("121481007", var_30_20)
						arg_27_1:RecordAudio("121481007", var_30_20)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_121481", "121481007", "story_v_out_121481.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_121481", "121481007", "story_v_out_121481.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_21 = math.max(var_30_12, arg_27_1.talkMaxDuration)

			if var_30_11 <= arg_27_1.time_ and arg_27_1.time_ < var_30_11 + var_30_21 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_11) / var_30_21

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_11 + var_30_21 and arg_27_1.time_ < var_30_11 + var_30_21 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play121481008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 121481008
		arg_31_1.duration_ = 5.3

		local var_31_0 = {
			ja = 5.3,
			ko = 1.7,
			zh = 1.7
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
				arg_31_0:Play121481009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 0.2

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_2 = arg_31_1:FormatText(StoryNameCfg[389].name)

				arg_31_1.leftNameTxt_.text = var_34_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_3 = arg_31_1:GetWordFromCfg(121481008)
				local var_34_4 = arg_31_1:FormatText(var_34_3.content)

				arg_31_1.text_.text = var_34_4

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_5 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481008", "story_v_out_121481.awb") ~= 0 then
					local var_34_8 = manager.audio:GetVoiceLength("story_v_out_121481", "121481008", "story_v_out_121481.awb") / 1000

					if var_34_8 + var_34_0 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_8 + var_34_0
					end

					if var_34_3.prefab_name ~= "" and arg_31_1.actors_[var_34_3.prefab_name] ~= nil then
						local var_34_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_3.prefab_name].transform, "story_v_out_121481", "121481008", "story_v_out_121481.awb")

						arg_31_1:RecordAudio("121481008", var_34_9)
						arg_31_1:RecordAudio("121481008", var_34_9)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_121481", "121481008", "story_v_out_121481.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_121481", "121481008", "story_v_out_121481.awb")
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
	Play121481009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 121481009
		arg_35_1.duration_ = 8.2

		local var_35_0 = {
			ja = 8.2,
			ko = 7,
			zh = 7
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
				arg_35_0:Play121481010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1072ui_story"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect1072ui_story == nil then
				arg_35_1.var_.characterEffect1072ui_story = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.200000002980232

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect1072ui_story then
					arg_35_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect1072ui_story then
				arg_35_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_38_4 = arg_35_1.actors_["1076ui_story"]
			local var_38_5 = 0

			if var_38_5 < arg_35_1.time_ and arg_35_1.time_ <= var_38_5 + arg_38_0 and arg_35_1.var_.characterEffect1076ui_story == nil then
				arg_35_1.var_.characterEffect1076ui_story = var_38_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_6 = 0.200000002980232

			if var_38_5 <= arg_35_1.time_ and arg_35_1.time_ < var_38_5 + var_38_6 then
				local var_38_7 = (arg_35_1.time_ - var_38_5) / var_38_6

				if arg_35_1.var_.characterEffect1076ui_story then
					local var_38_8 = Mathf.Lerp(0, 0.5, var_38_7)

					arg_35_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1076ui_story.fillRatio = var_38_8
				end
			end

			if arg_35_1.time_ >= var_38_5 + var_38_6 and arg_35_1.time_ < var_38_5 + var_38_6 + arg_38_0 and arg_35_1.var_.characterEffect1076ui_story then
				local var_38_9 = 0.5

				arg_35_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1076ui_story.fillRatio = var_38_9
			end

			local var_38_10 = 0
			local var_38_11 = 0.85

			if var_38_10 < arg_35_1.time_ and arg_35_1.time_ <= var_38_10 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_12 = arg_35_1:FormatText(StoryNameCfg[379].name)

				arg_35_1.leftNameTxt_.text = var_38_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_13 = arg_35_1:GetWordFromCfg(121481009)
				local var_38_14 = arg_35_1:FormatText(var_38_13.content)

				arg_35_1.text_.text = var_38_14

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_15 = 34
				local var_38_16 = utf8.len(var_38_14)
				local var_38_17 = var_38_15 <= 0 and var_38_11 or var_38_11 * (var_38_16 / var_38_15)

				if var_38_17 > 0 and var_38_11 < var_38_17 then
					arg_35_1.talkMaxDuration = var_38_17

					if var_38_17 + var_38_10 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_17 + var_38_10
					end
				end

				arg_35_1.text_.text = var_38_14
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481009", "story_v_out_121481.awb") ~= 0 then
					local var_38_18 = manager.audio:GetVoiceLength("story_v_out_121481", "121481009", "story_v_out_121481.awb") / 1000

					if var_38_18 + var_38_10 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_18 + var_38_10
					end

					if var_38_13.prefab_name ~= "" and arg_35_1.actors_[var_38_13.prefab_name] ~= nil then
						local var_38_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_13.prefab_name].transform, "story_v_out_121481", "121481009", "story_v_out_121481.awb")

						arg_35_1:RecordAudio("121481009", var_38_19)
						arg_35_1:RecordAudio("121481009", var_38_19)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_121481", "121481009", "story_v_out_121481.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_121481", "121481009", "story_v_out_121481.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_20 = math.max(var_38_11, arg_35_1.talkMaxDuration)

			if var_38_10 <= arg_35_1.time_ and arg_35_1.time_ < var_38_10 + var_38_20 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_10) / var_38_20

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_10 + var_38_20 and arg_35_1.time_ < var_38_10 + var_38_20 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play121481010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 121481010
		arg_39_1.duration_ = 14.9

		local var_39_0 = {
			ja = 14.9,
			ko = 7.666,
			zh = 7.666
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
				arg_39_0:Play121481011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				arg_39_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action3_1")
			end

			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				arg_39_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_42_2 = 0
			local var_42_3 = 1.025

			if var_42_2 < arg_39_1.time_ and arg_39_1.time_ <= var_42_2 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_4 = arg_39_1:FormatText(StoryNameCfg[379].name)

				arg_39_1.leftNameTxt_.text = var_42_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_5 = arg_39_1:GetWordFromCfg(121481010)
				local var_42_6 = arg_39_1:FormatText(var_42_5.content)

				arg_39_1.text_.text = var_42_6

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_7 = 41
				local var_42_8 = utf8.len(var_42_6)
				local var_42_9 = var_42_7 <= 0 and var_42_3 or var_42_3 * (var_42_8 / var_42_7)

				if var_42_9 > 0 and var_42_3 < var_42_9 then
					arg_39_1.talkMaxDuration = var_42_9

					if var_42_9 + var_42_2 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_9 + var_42_2
					end
				end

				arg_39_1.text_.text = var_42_6
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481010", "story_v_out_121481.awb") ~= 0 then
					local var_42_10 = manager.audio:GetVoiceLength("story_v_out_121481", "121481010", "story_v_out_121481.awb") / 1000

					if var_42_10 + var_42_2 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_10 + var_42_2
					end

					if var_42_5.prefab_name ~= "" and arg_39_1.actors_[var_42_5.prefab_name] ~= nil then
						local var_42_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_5.prefab_name].transform, "story_v_out_121481", "121481010", "story_v_out_121481.awb")

						arg_39_1:RecordAudio("121481010", var_42_11)
						arg_39_1:RecordAudio("121481010", var_42_11)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_121481", "121481010", "story_v_out_121481.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_121481", "121481010", "story_v_out_121481.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_12 = math.max(var_42_3, arg_39_1.talkMaxDuration)

			if var_42_2 <= arg_39_1.time_ and arg_39_1.time_ < var_42_2 + var_42_12 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_2) / var_42_12

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_2 + var_42_12 and arg_39_1.time_ < var_42_2 + var_42_12 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play121481011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 121481011
		arg_43_1.duration_ = 3.9

		local var_43_0 = {
			ja = 3.9,
			ko = 3.366,
			zh = 3.366
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
				arg_43_0:Play121481012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1072ui_story"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.characterEffect1072ui_story == nil then
				arg_43_1.var_.characterEffect1072ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.200000002980232

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect1072ui_story then
					local var_46_4 = Mathf.Lerp(0, 0.5, var_46_3)

					arg_43_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_43_1.var_.characterEffect1072ui_story.fillRatio = var_46_4
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect1072ui_story then
				local var_46_5 = 0.5

				arg_43_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_43_1.var_.characterEffect1072ui_story.fillRatio = var_46_5
			end

			local var_46_6 = arg_43_1.actors_["1076ui_story"]
			local var_46_7 = 0

			if var_46_7 < arg_43_1.time_ and arg_43_1.time_ <= var_46_7 + arg_46_0 and arg_43_1.var_.characterEffect1076ui_story == nil then
				arg_43_1.var_.characterEffect1076ui_story = var_46_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_8 = 0.200000002980232

			if var_46_7 <= arg_43_1.time_ and arg_43_1.time_ < var_46_7 + var_46_8 then
				local var_46_9 = (arg_43_1.time_ - var_46_7) / var_46_8

				if arg_43_1.var_.characterEffect1076ui_story then
					arg_43_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_7 + var_46_8 and arg_43_1.time_ < var_46_7 + var_46_8 + arg_46_0 and arg_43_1.var_.characterEffect1076ui_story then
				arg_43_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_46_10 = 0
			local var_46_11 = 0.45

			if var_46_10 < arg_43_1.time_ and arg_43_1.time_ <= var_46_10 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_12 = arg_43_1:FormatText(StoryNameCfg[389].name)

				arg_43_1.leftNameTxt_.text = var_46_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_13 = arg_43_1:GetWordFromCfg(121481011)
				local var_46_14 = arg_43_1:FormatText(var_46_13.content)

				arg_43_1.text_.text = var_46_14

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_15 = 18
				local var_46_16 = utf8.len(var_46_14)
				local var_46_17 = var_46_15 <= 0 and var_46_11 or var_46_11 * (var_46_16 / var_46_15)

				if var_46_17 > 0 and var_46_11 < var_46_17 then
					arg_43_1.talkMaxDuration = var_46_17

					if var_46_17 + var_46_10 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_17 + var_46_10
					end
				end

				arg_43_1.text_.text = var_46_14
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481011", "story_v_out_121481.awb") ~= 0 then
					local var_46_18 = manager.audio:GetVoiceLength("story_v_out_121481", "121481011", "story_v_out_121481.awb") / 1000

					if var_46_18 + var_46_10 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_18 + var_46_10
					end

					if var_46_13.prefab_name ~= "" and arg_43_1.actors_[var_46_13.prefab_name] ~= nil then
						local var_46_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_13.prefab_name].transform, "story_v_out_121481", "121481011", "story_v_out_121481.awb")

						arg_43_1:RecordAudio("121481011", var_46_19)
						arg_43_1:RecordAudio("121481011", var_46_19)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_121481", "121481011", "story_v_out_121481.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_121481", "121481011", "story_v_out_121481.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_20 = math.max(var_46_11, arg_43_1.talkMaxDuration)

			if var_46_10 <= arg_43_1.time_ and arg_43_1.time_ < var_46_10 + var_46_20 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_10) / var_46_20

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_10 + var_46_20 and arg_43_1.time_ < var_46_10 + var_46_20 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play121481012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 121481012
		arg_47_1.duration_ = 11.566

		local var_47_0 = {
			ja = 11.566,
			ko = 7.9,
			zh = 7.9
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
				arg_47_0:Play121481013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				arg_47_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action3_2")
			end

			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_50_2 = arg_47_1.actors_["1072ui_story"]
			local var_50_3 = 0

			if var_50_3 < arg_47_1.time_ and arg_47_1.time_ <= var_50_3 + arg_50_0 and arg_47_1.var_.characterEffect1072ui_story == nil then
				arg_47_1.var_.characterEffect1072ui_story = var_50_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_4 = 0.200000002980232

			if var_50_3 <= arg_47_1.time_ and arg_47_1.time_ < var_50_3 + var_50_4 then
				local var_50_5 = (arg_47_1.time_ - var_50_3) / var_50_4

				if arg_47_1.var_.characterEffect1072ui_story then
					arg_47_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_3 + var_50_4 and arg_47_1.time_ < var_50_3 + var_50_4 + arg_50_0 and arg_47_1.var_.characterEffect1072ui_story then
				arg_47_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_50_6 = arg_47_1.actors_["1076ui_story"]
			local var_50_7 = 0

			if var_50_7 < arg_47_1.time_ and arg_47_1.time_ <= var_50_7 + arg_50_0 and arg_47_1.var_.characterEffect1076ui_story == nil then
				arg_47_1.var_.characterEffect1076ui_story = var_50_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_8 = 0.200000002980232

			if var_50_7 <= arg_47_1.time_ and arg_47_1.time_ < var_50_7 + var_50_8 then
				local var_50_9 = (arg_47_1.time_ - var_50_7) / var_50_8

				if arg_47_1.var_.characterEffect1076ui_story then
					local var_50_10 = Mathf.Lerp(0, 0.5, var_50_9)

					arg_47_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_47_1.var_.characterEffect1076ui_story.fillRatio = var_50_10
				end
			end

			if arg_47_1.time_ >= var_50_7 + var_50_8 and arg_47_1.time_ < var_50_7 + var_50_8 + arg_50_0 and arg_47_1.var_.characterEffect1076ui_story then
				local var_50_11 = 0.5

				arg_47_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_47_1.var_.characterEffect1076ui_story.fillRatio = var_50_11
			end

			local var_50_12 = 0
			local var_50_13 = 0.975

			if var_50_12 < arg_47_1.time_ and arg_47_1.time_ <= var_50_12 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_14 = arg_47_1:FormatText(StoryNameCfg[379].name)

				arg_47_1.leftNameTxt_.text = var_50_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_15 = arg_47_1:GetWordFromCfg(121481012)
				local var_50_16 = arg_47_1:FormatText(var_50_15.content)

				arg_47_1.text_.text = var_50_16

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_17 = 39
				local var_50_18 = utf8.len(var_50_16)
				local var_50_19 = var_50_17 <= 0 and var_50_13 or var_50_13 * (var_50_18 / var_50_17)

				if var_50_19 > 0 and var_50_13 < var_50_19 then
					arg_47_1.talkMaxDuration = var_50_19

					if var_50_19 + var_50_12 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_19 + var_50_12
					end
				end

				arg_47_1.text_.text = var_50_16
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481012", "story_v_out_121481.awb") ~= 0 then
					local var_50_20 = manager.audio:GetVoiceLength("story_v_out_121481", "121481012", "story_v_out_121481.awb") / 1000

					if var_50_20 + var_50_12 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_20 + var_50_12
					end

					if var_50_15.prefab_name ~= "" and arg_47_1.actors_[var_50_15.prefab_name] ~= nil then
						local var_50_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_15.prefab_name].transform, "story_v_out_121481", "121481012", "story_v_out_121481.awb")

						arg_47_1:RecordAudio("121481012", var_50_21)
						arg_47_1:RecordAudio("121481012", var_50_21)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_121481", "121481012", "story_v_out_121481.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_121481", "121481012", "story_v_out_121481.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_22 = math.max(var_50_13, arg_47_1.talkMaxDuration)

			if var_50_12 <= arg_47_1.time_ and arg_47_1.time_ < var_50_12 + var_50_22 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_12) / var_50_22

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_12 + var_50_22 and arg_47_1.time_ < var_50_12 + var_50_22 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play121481013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 121481013
		arg_51_1.duration_ = 5.533

		local var_51_0 = {
			ja = 5.533,
			ko = 1.866,
			zh = 1.866
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
				arg_51_0:Play121481014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1072ui_story"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect1072ui_story == nil then
				arg_51_1.var_.characterEffect1072ui_story = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.200000002980232

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect1072ui_story then
					local var_54_4 = Mathf.Lerp(0, 0.5, var_54_3)

					arg_51_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_51_1.var_.characterEffect1072ui_story.fillRatio = var_54_4
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect1072ui_story then
				local var_54_5 = 0.5

				arg_51_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_51_1.var_.characterEffect1072ui_story.fillRatio = var_54_5
			end

			local var_54_6 = arg_51_1.actors_["1076ui_story"]
			local var_54_7 = 0

			if var_54_7 < arg_51_1.time_ and arg_51_1.time_ <= var_54_7 + arg_54_0 and arg_51_1.var_.characterEffect1076ui_story == nil then
				arg_51_1.var_.characterEffect1076ui_story = var_54_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_8 = 0.200000002980232

			if var_54_7 <= arg_51_1.time_ and arg_51_1.time_ < var_54_7 + var_54_8 then
				local var_54_9 = (arg_51_1.time_ - var_54_7) / var_54_8

				if arg_51_1.var_.characterEffect1076ui_story then
					arg_51_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_7 + var_54_8 and arg_51_1.time_ < var_54_7 + var_54_8 + arg_54_0 and arg_51_1.var_.characterEffect1076ui_story then
				arg_51_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_54_10 = 0
			local var_54_11 = 0.275

			if var_54_10 < arg_51_1.time_ and arg_51_1.time_ <= var_54_10 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_12 = arg_51_1:FormatText(StoryNameCfg[389].name)

				arg_51_1.leftNameTxt_.text = var_54_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_13 = arg_51_1:GetWordFromCfg(121481013)
				local var_54_14 = arg_51_1:FormatText(var_54_13.content)

				arg_51_1.text_.text = var_54_14

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_15 = 11
				local var_54_16 = utf8.len(var_54_14)
				local var_54_17 = var_54_15 <= 0 and var_54_11 or var_54_11 * (var_54_16 / var_54_15)

				if var_54_17 > 0 and var_54_11 < var_54_17 then
					arg_51_1.talkMaxDuration = var_54_17

					if var_54_17 + var_54_10 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_17 + var_54_10
					end
				end

				arg_51_1.text_.text = var_54_14
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481013", "story_v_out_121481.awb") ~= 0 then
					local var_54_18 = manager.audio:GetVoiceLength("story_v_out_121481", "121481013", "story_v_out_121481.awb") / 1000

					if var_54_18 + var_54_10 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_18 + var_54_10
					end

					if var_54_13.prefab_name ~= "" and arg_51_1.actors_[var_54_13.prefab_name] ~= nil then
						local var_54_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_13.prefab_name].transform, "story_v_out_121481", "121481013", "story_v_out_121481.awb")

						arg_51_1:RecordAudio("121481013", var_54_19)
						arg_51_1:RecordAudio("121481013", var_54_19)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_121481", "121481013", "story_v_out_121481.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_121481", "121481013", "story_v_out_121481.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_20 = math.max(var_54_11, arg_51_1.talkMaxDuration)

			if var_54_10 <= arg_51_1.time_ and arg_51_1.time_ < var_54_10 + var_54_20 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_10) / var_54_20

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_10 + var_54_20 and arg_51_1.time_ < var_54_10 + var_54_20 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play121481014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 121481014
		arg_55_1.duration_ = 10.3

		local var_55_0 = {
			ja = 10.3,
			ko = 6.666,
			zh = 6.666
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
				arg_55_0:Play121481015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action6_1")
			end

			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_58_2 = arg_55_1.actors_["1072ui_story"]
			local var_58_3 = 0

			if var_58_3 < arg_55_1.time_ and arg_55_1.time_ <= var_58_3 + arg_58_0 and arg_55_1.var_.characterEffect1072ui_story == nil then
				arg_55_1.var_.characterEffect1072ui_story = var_58_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_4 = 0.200000002980232

			if var_58_3 <= arg_55_1.time_ and arg_55_1.time_ < var_58_3 + var_58_4 then
				local var_58_5 = (arg_55_1.time_ - var_58_3) / var_58_4

				if arg_55_1.var_.characterEffect1072ui_story then
					arg_55_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_3 + var_58_4 and arg_55_1.time_ < var_58_3 + var_58_4 + arg_58_0 and arg_55_1.var_.characterEffect1072ui_story then
				arg_55_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_58_6 = arg_55_1.actors_["1076ui_story"]
			local var_58_7 = 0

			if var_58_7 < arg_55_1.time_ and arg_55_1.time_ <= var_58_7 + arg_58_0 and arg_55_1.var_.characterEffect1076ui_story == nil then
				arg_55_1.var_.characterEffect1076ui_story = var_58_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_8 = 0.200000002980232

			if var_58_7 <= arg_55_1.time_ and arg_55_1.time_ < var_58_7 + var_58_8 then
				local var_58_9 = (arg_55_1.time_ - var_58_7) / var_58_8

				if arg_55_1.var_.characterEffect1076ui_story then
					local var_58_10 = Mathf.Lerp(0, 0.5, var_58_9)

					arg_55_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_55_1.var_.characterEffect1076ui_story.fillRatio = var_58_10
				end
			end

			if arg_55_1.time_ >= var_58_7 + var_58_8 and arg_55_1.time_ < var_58_7 + var_58_8 + arg_58_0 and arg_55_1.var_.characterEffect1076ui_story then
				local var_58_11 = 0.5

				arg_55_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_55_1.var_.characterEffect1076ui_story.fillRatio = var_58_11
			end

			local var_58_12 = 0
			local var_58_13 = 1

			if var_58_12 < arg_55_1.time_ and arg_55_1.time_ <= var_58_12 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_14 = arg_55_1:FormatText(StoryNameCfg[379].name)

				arg_55_1.leftNameTxt_.text = var_58_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_15 = arg_55_1:GetWordFromCfg(121481014)
				local var_58_16 = arg_55_1:FormatText(var_58_15.content)

				arg_55_1.text_.text = var_58_16

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_17 = 40
				local var_58_18 = utf8.len(var_58_16)
				local var_58_19 = var_58_17 <= 0 and var_58_13 or var_58_13 * (var_58_18 / var_58_17)

				if var_58_19 > 0 and var_58_13 < var_58_19 then
					arg_55_1.talkMaxDuration = var_58_19

					if var_58_19 + var_58_12 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_19 + var_58_12
					end
				end

				arg_55_1.text_.text = var_58_16
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481014", "story_v_out_121481.awb") ~= 0 then
					local var_58_20 = manager.audio:GetVoiceLength("story_v_out_121481", "121481014", "story_v_out_121481.awb") / 1000

					if var_58_20 + var_58_12 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_20 + var_58_12
					end

					if var_58_15.prefab_name ~= "" and arg_55_1.actors_[var_58_15.prefab_name] ~= nil then
						local var_58_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_15.prefab_name].transform, "story_v_out_121481", "121481014", "story_v_out_121481.awb")

						arg_55_1:RecordAudio("121481014", var_58_21)
						arg_55_1:RecordAudio("121481014", var_58_21)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_121481", "121481014", "story_v_out_121481.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_121481", "121481014", "story_v_out_121481.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_22 = math.max(var_58_13, arg_55_1.talkMaxDuration)

			if var_58_12 <= arg_55_1.time_ and arg_55_1.time_ < var_58_12 + var_58_22 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_12) / var_58_22

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_12 + var_58_22 and arg_55_1.time_ < var_58_12 + var_58_22 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play121481015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 121481015
		arg_59_1.duration_ = 10.4

		local var_59_0 = {
			ja = 10.4,
			ko = 7.766,
			zh = 7.766
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
				arg_59_0:Play121481016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action6_2")
			end

			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 then
				arg_59_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_62_2 = arg_59_1.actors_["1072ui_story"]
			local var_62_3 = 0

			if var_62_3 < arg_59_1.time_ and arg_59_1.time_ <= var_62_3 + arg_62_0 and arg_59_1.var_.characterEffect1072ui_story == nil then
				arg_59_1.var_.characterEffect1072ui_story = var_62_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_4 = 0.200000002980232

			if var_62_3 <= arg_59_1.time_ and arg_59_1.time_ < var_62_3 + var_62_4 then
				local var_62_5 = (arg_59_1.time_ - var_62_3) / var_62_4

				if arg_59_1.var_.characterEffect1072ui_story then
					arg_59_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_3 + var_62_4 and arg_59_1.time_ < var_62_3 + var_62_4 + arg_62_0 and arg_59_1.var_.characterEffect1072ui_story then
				arg_59_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_62_6 = arg_59_1.actors_["1076ui_story"]
			local var_62_7 = 0

			if var_62_7 < arg_59_1.time_ and arg_59_1.time_ <= var_62_7 + arg_62_0 and arg_59_1.var_.characterEffect1076ui_story == nil then
				arg_59_1.var_.characterEffect1076ui_story = var_62_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_8 = 0.200000002980232

			if var_62_7 <= arg_59_1.time_ and arg_59_1.time_ < var_62_7 + var_62_8 then
				local var_62_9 = (arg_59_1.time_ - var_62_7) / var_62_8

				if arg_59_1.var_.characterEffect1076ui_story then
					local var_62_10 = Mathf.Lerp(0, 0.5, var_62_9)

					arg_59_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_59_1.var_.characterEffect1076ui_story.fillRatio = var_62_10
				end
			end

			if arg_59_1.time_ >= var_62_7 + var_62_8 and arg_59_1.time_ < var_62_7 + var_62_8 + arg_62_0 and arg_59_1.var_.characterEffect1076ui_story then
				local var_62_11 = 0.5

				arg_59_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_59_1.var_.characterEffect1076ui_story.fillRatio = var_62_11
			end

			local var_62_12 = 0
			local var_62_13 = 1.05

			if var_62_12 < arg_59_1.time_ and arg_59_1.time_ <= var_62_12 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_14 = arg_59_1:FormatText(StoryNameCfg[379].name)

				arg_59_1.leftNameTxt_.text = var_62_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_15 = arg_59_1:GetWordFromCfg(121481015)
				local var_62_16 = arg_59_1:FormatText(var_62_15.content)

				arg_59_1.text_.text = var_62_16

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_17 = 42
				local var_62_18 = utf8.len(var_62_16)
				local var_62_19 = var_62_17 <= 0 and var_62_13 or var_62_13 * (var_62_18 / var_62_17)

				if var_62_19 > 0 and var_62_13 < var_62_19 then
					arg_59_1.talkMaxDuration = var_62_19

					if var_62_19 + var_62_12 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_19 + var_62_12
					end
				end

				arg_59_1.text_.text = var_62_16
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481015", "story_v_out_121481.awb") ~= 0 then
					local var_62_20 = manager.audio:GetVoiceLength("story_v_out_121481", "121481015", "story_v_out_121481.awb") / 1000

					if var_62_20 + var_62_12 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_20 + var_62_12
					end

					if var_62_15.prefab_name ~= "" and arg_59_1.actors_[var_62_15.prefab_name] ~= nil then
						local var_62_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_15.prefab_name].transform, "story_v_out_121481", "121481015", "story_v_out_121481.awb")

						arg_59_1:RecordAudio("121481015", var_62_21)
						arg_59_1:RecordAudio("121481015", var_62_21)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_121481", "121481015", "story_v_out_121481.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_121481", "121481015", "story_v_out_121481.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_22 = math.max(var_62_13, arg_59_1.talkMaxDuration)

			if var_62_12 <= arg_59_1.time_ and arg_59_1.time_ < var_62_12 + var_62_22 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_12) / var_62_22

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_12 + var_62_22 and arg_59_1.time_ < var_62_12 + var_62_22 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play121481016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 121481016
		arg_63_1.duration_ = 4.8

		local var_63_0 = {
			ja = 4.8,
			ko = 3.4,
			zh = 3.4
		}
		local var_63_1 = manager.audio:GetLocalizationFlag()

		if var_63_0[var_63_1] ~= nil then
			arg_63_1.duration_ = var_63_0[var_63_1]
		end

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play121481017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1072ui_story"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.characterEffect1072ui_story == nil then
				arg_63_1.var_.characterEffect1072ui_story = var_66_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_2 = 0.200000002980232

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.characterEffect1072ui_story then
					local var_66_4 = Mathf.Lerp(0, 0.5, var_66_3)

					arg_63_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_63_1.var_.characterEffect1072ui_story.fillRatio = var_66_4
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.characterEffect1072ui_story then
				local var_66_5 = 0.5

				arg_63_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_63_1.var_.characterEffect1072ui_story.fillRatio = var_66_5
			end

			local var_66_6 = arg_63_1.actors_["1076ui_story"]
			local var_66_7 = 0

			if var_66_7 < arg_63_1.time_ and arg_63_1.time_ <= var_66_7 + arg_66_0 and arg_63_1.var_.characterEffect1076ui_story == nil then
				arg_63_1.var_.characterEffect1076ui_story = var_66_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_8 = 0.200000002980232

			if var_66_7 <= arg_63_1.time_ and arg_63_1.time_ < var_66_7 + var_66_8 then
				local var_66_9 = (arg_63_1.time_ - var_66_7) / var_66_8

				if arg_63_1.var_.characterEffect1076ui_story then
					arg_63_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_7 + var_66_8 and arg_63_1.time_ < var_66_7 + var_66_8 + arg_66_0 and arg_63_1.var_.characterEffect1076ui_story then
				arg_63_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_66_10 = 0
			local var_66_11 = 0.3

			if var_66_10 < arg_63_1.time_ and arg_63_1.time_ <= var_66_10 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_12 = arg_63_1:FormatText(StoryNameCfg[389].name)

				arg_63_1.leftNameTxt_.text = var_66_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_13 = arg_63_1:GetWordFromCfg(121481016)
				local var_66_14 = arg_63_1:FormatText(var_66_13.content)

				arg_63_1.text_.text = var_66_14

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_15 = 12
				local var_66_16 = utf8.len(var_66_14)
				local var_66_17 = var_66_15 <= 0 and var_66_11 or var_66_11 * (var_66_16 / var_66_15)

				if var_66_17 > 0 and var_66_11 < var_66_17 then
					arg_63_1.talkMaxDuration = var_66_17

					if var_66_17 + var_66_10 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_17 + var_66_10
					end
				end

				arg_63_1.text_.text = var_66_14
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481016", "story_v_out_121481.awb") ~= 0 then
					local var_66_18 = manager.audio:GetVoiceLength("story_v_out_121481", "121481016", "story_v_out_121481.awb") / 1000

					if var_66_18 + var_66_10 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_18 + var_66_10
					end

					if var_66_13.prefab_name ~= "" and arg_63_1.actors_[var_66_13.prefab_name] ~= nil then
						local var_66_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_13.prefab_name].transform, "story_v_out_121481", "121481016", "story_v_out_121481.awb")

						arg_63_1:RecordAudio("121481016", var_66_19)
						arg_63_1:RecordAudio("121481016", var_66_19)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_121481", "121481016", "story_v_out_121481.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_121481", "121481016", "story_v_out_121481.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_20 = math.max(var_66_11, arg_63_1.talkMaxDuration)

			if var_66_10 <= arg_63_1.time_ and arg_63_1.time_ < var_66_10 + var_66_20 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_10) / var_66_20

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_10 + var_66_20 and arg_63_1.time_ < var_66_10 + var_66_20 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play121481017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 121481017
		arg_67_1.duration_ = 12.633

		local var_67_0 = {
			ja = 12.633,
			ko = 11.4,
			zh = 11.4
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
				arg_67_0:Play121481018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1072ui_story"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.characterEffect1072ui_story == nil then
				arg_67_1.var_.characterEffect1072ui_story = var_70_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_2 = 0.200000002980232

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.characterEffect1072ui_story then
					arg_67_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.characterEffect1072ui_story then
				arg_67_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_70_4 = arg_67_1.actors_["1076ui_story"]
			local var_70_5 = 0

			if var_70_5 < arg_67_1.time_ and arg_67_1.time_ <= var_70_5 + arg_70_0 and arg_67_1.var_.characterEffect1076ui_story == nil then
				arg_67_1.var_.characterEffect1076ui_story = var_70_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_6 = 0.200000002980232

			if var_70_5 <= arg_67_1.time_ and arg_67_1.time_ < var_70_5 + var_70_6 then
				local var_70_7 = (arg_67_1.time_ - var_70_5) / var_70_6

				if arg_67_1.var_.characterEffect1076ui_story then
					local var_70_8 = Mathf.Lerp(0, 0.5, var_70_7)

					arg_67_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_67_1.var_.characterEffect1076ui_story.fillRatio = var_70_8
				end
			end

			if arg_67_1.time_ >= var_70_5 + var_70_6 and arg_67_1.time_ < var_70_5 + var_70_6 + arg_70_0 and arg_67_1.var_.characterEffect1076ui_story then
				local var_70_9 = 0.5

				arg_67_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_67_1.var_.characterEffect1076ui_story.fillRatio = var_70_9
			end

			local var_70_10 = 0
			local var_70_11 = 1.325

			if var_70_10 < arg_67_1.time_ and arg_67_1.time_ <= var_70_10 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_12 = arg_67_1:FormatText(StoryNameCfg[379].name)

				arg_67_1.leftNameTxt_.text = var_70_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_13 = arg_67_1:GetWordFromCfg(121481017)
				local var_70_14 = arg_67_1:FormatText(var_70_13.content)

				arg_67_1.text_.text = var_70_14

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_15 = 53
				local var_70_16 = utf8.len(var_70_14)
				local var_70_17 = var_70_15 <= 0 and var_70_11 or var_70_11 * (var_70_16 / var_70_15)

				if var_70_17 > 0 and var_70_11 < var_70_17 then
					arg_67_1.talkMaxDuration = var_70_17

					if var_70_17 + var_70_10 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_17 + var_70_10
					end
				end

				arg_67_1.text_.text = var_70_14
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481017", "story_v_out_121481.awb") ~= 0 then
					local var_70_18 = manager.audio:GetVoiceLength("story_v_out_121481", "121481017", "story_v_out_121481.awb") / 1000

					if var_70_18 + var_70_10 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_18 + var_70_10
					end

					if var_70_13.prefab_name ~= "" and arg_67_1.actors_[var_70_13.prefab_name] ~= nil then
						local var_70_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_13.prefab_name].transform, "story_v_out_121481", "121481017", "story_v_out_121481.awb")

						arg_67_1:RecordAudio("121481017", var_70_19)
						arg_67_1:RecordAudio("121481017", var_70_19)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_121481", "121481017", "story_v_out_121481.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_121481", "121481017", "story_v_out_121481.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_20 = math.max(var_70_11, arg_67_1.talkMaxDuration)

			if var_70_10 <= arg_67_1.time_ and arg_67_1.time_ < var_70_10 + var_70_20 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_10) / var_70_20

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_10 + var_70_20 and arg_67_1.time_ < var_70_10 + var_70_20 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play121481018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 121481018
		arg_71_1.duration_ = 11.466

		local var_71_0 = {
			ja = 11.466,
			ko = 7.433,
			zh = 7.433
		}
		local var_71_1 = manager.audio:GetLocalizationFlag()

		if var_71_0[var_71_1] ~= nil then
			arg_71_1.duration_ = var_71_0[var_71_1]
		end

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play121481019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0
			local var_74_1 = 1

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_2 = arg_71_1:FormatText(StoryNameCfg[379].name)

				arg_71_1.leftNameTxt_.text = var_74_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_3 = arg_71_1:GetWordFromCfg(121481018)
				local var_74_4 = arg_71_1:FormatText(var_74_3.content)

				arg_71_1.text_.text = var_74_4

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_5 = 40
				local var_74_6 = utf8.len(var_74_4)
				local var_74_7 = var_74_5 <= 0 and var_74_1 or var_74_1 * (var_74_6 / var_74_5)

				if var_74_7 > 0 and var_74_1 < var_74_7 then
					arg_71_1.talkMaxDuration = var_74_7

					if var_74_7 + var_74_0 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_7 + var_74_0
					end
				end

				arg_71_1.text_.text = var_74_4
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481018", "story_v_out_121481.awb") ~= 0 then
					local var_74_8 = manager.audio:GetVoiceLength("story_v_out_121481", "121481018", "story_v_out_121481.awb") / 1000

					if var_74_8 + var_74_0 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_8 + var_74_0
					end

					if var_74_3.prefab_name ~= "" and arg_71_1.actors_[var_74_3.prefab_name] ~= nil then
						local var_74_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_3.prefab_name].transform, "story_v_out_121481", "121481018", "story_v_out_121481.awb")

						arg_71_1:RecordAudio("121481018", var_74_9)
						arg_71_1:RecordAudio("121481018", var_74_9)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_121481", "121481018", "story_v_out_121481.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_121481", "121481018", "story_v_out_121481.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_10 = math.max(var_74_1, arg_71_1.talkMaxDuration)

			if var_74_0 <= arg_71_1.time_ and arg_71_1.time_ < var_74_0 + var_74_10 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_0) / var_74_10

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_0 + var_74_10 and arg_71_1.time_ < var_74_0 + var_74_10 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play121481019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 121481019
		arg_75_1.duration_ = 12.933

		local var_75_0 = {
			ja = 12.933,
			ko = 9.666,
			zh = 9.666
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
				arg_75_0:Play121481020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = 0
			local var_78_1 = 1.15

			if var_78_0 < arg_75_1.time_ and arg_75_1.time_ <= var_78_0 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_2 = arg_75_1:FormatText(StoryNameCfg[379].name)

				arg_75_1.leftNameTxt_.text = var_78_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_3 = arg_75_1:GetWordFromCfg(121481019)
				local var_78_4 = arg_75_1:FormatText(var_78_3.content)

				arg_75_1.text_.text = var_78_4

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_5 = 46
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

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481019", "story_v_out_121481.awb") ~= 0 then
					local var_78_8 = manager.audio:GetVoiceLength("story_v_out_121481", "121481019", "story_v_out_121481.awb") / 1000

					if var_78_8 + var_78_0 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_8 + var_78_0
					end

					if var_78_3.prefab_name ~= "" and arg_75_1.actors_[var_78_3.prefab_name] ~= nil then
						local var_78_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_3.prefab_name].transform, "story_v_out_121481", "121481019", "story_v_out_121481.awb")

						arg_75_1:RecordAudio("121481019", var_78_9)
						arg_75_1:RecordAudio("121481019", var_78_9)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_121481", "121481019", "story_v_out_121481.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_121481", "121481019", "story_v_out_121481.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_10 = math.max(var_78_1, arg_75_1.talkMaxDuration)

			if var_78_0 <= arg_75_1.time_ and arg_75_1.time_ < var_78_0 + var_78_10 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_0) / var_78_10

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_0 + var_78_10 and arg_75_1.time_ < var_78_0 + var_78_10 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play121481020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 121481020
		arg_79_1.duration_ = 6.633

		local var_79_0 = {
			ja = 6.633,
			ko = 2.5,
			zh = 2.5
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
				arg_79_0:Play121481021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1072ui_story"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect1072ui_story == nil then
				arg_79_1.var_.characterEffect1072ui_story = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.200000002980232

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.characterEffect1072ui_story then
					local var_82_4 = Mathf.Lerp(0, 0.5, var_82_3)

					arg_79_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_79_1.var_.characterEffect1072ui_story.fillRatio = var_82_4
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect1072ui_story then
				local var_82_5 = 0.5

				arg_79_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_79_1.var_.characterEffect1072ui_story.fillRatio = var_82_5
			end

			local var_82_6 = arg_79_1.actors_["1076ui_story"]
			local var_82_7 = 0

			if var_82_7 < arg_79_1.time_ and arg_79_1.time_ <= var_82_7 + arg_82_0 and arg_79_1.var_.characterEffect1076ui_story == nil then
				arg_79_1.var_.characterEffect1076ui_story = var_82_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_8 = 0.200000002980232

			if var_82_7 <= arg_79_1.time_ and arg_79_1.time_ < var_82_7 + var_82_8 then
				local var_82_9 = (arg_79_1.time_ - var_82_7) / var_82_8

				if arg_79_1.var_.characterEffect1076ui_story then
					arg_79_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_7 + var_82_8 and arg_79_1.time_ < var_82_7 + var_82_8 + arg_82_0 and arg_79_1.var_.characterEffect1076ui_story then
				arg_79_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_82_10 = 0
			local var_82_11 = 0.2

			if var_82_10 < arg_79_1.time_ and arg_79_1.time_ <= var_82_10 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_12 = arg_79_1:FormatText(StoryNameCfg[389].name)

				arg_79_1.leftNameTxt_.text = var_82_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_13 = arg_79_1:GetWordFromCfg(121481020)
				local var_82_14 = arg_79_1:FormatText(var_82_13.content)

				arg_79_1.text_.text = var_82_14

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_15 = 8
				local var_82_16 = utf8.len(var_82_14)
				local var_82_17 = var_82_15 <= 0 and var_82_11 or var_82_11 * (var_82_16 / var_82_15)

				if var_82_17 > 0 and var_82_11 < var_82_17 then
					arg_79_1.talkMaxDuration = var_82_17

					if var_82_17 + var_82_10 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_17 + var_82_10
					end
				end

				arg_79_1.text_.text = var_82_14
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481020", "story_v_out_121481.awb") ~= 0 then
					local var_82_18 = manager.audio:GetVoiceLength("story_v_out_121481", "121481020", "story_v_out_121481.awb") / 1000

					if var_82_18 + var_82_10 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_18 + var_82_10
					end

					if var_82_13.prefab_name ~= "" and arg_79_1.actors_[var_82_13.prefab_name] ~= nil then
						local var_82_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_13.prefab_name].transform, "story_v_out_121481", "121481020", "story_v_out_121481.awb")

						arg_79_1:RecordAudio("121481020", var_82_19)
						arg_79_1:RecordAudio("121481020", var_82_19)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_121481", "121481020", "story_v_out_121481.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_121481", "121481020", "story_v_out_121481.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_20 = math.max(var_82_11, arg_79_1.talkMaxDuration)

			if var_82_10 <= arg_79_1.time_ and arg_79_1.time_ < var_82_10 + var_82_20 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_10) / var_82_20

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_10 + var_82_20 and arg_79_1.time_ < var_82_10 + var_82_20 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play121481021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 121481021
		arg_83_1.duration_ = 12.2

		local var_83_0 = {
			ja = 12.2,
			ko = 10.433,
			zh = 10.433
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
				arg_83_0:Play121481022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1072ui_story"]
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 and arg_83_1.var_.characterEffect1072ui_story == nil then
				arg_83_1.var_.characterEffect1072ui_story = var_86_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_2 = 0.200000002980232

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2

				if arg_83_1.var_.characterEffect1072ui_story then
					arg_83_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 and arg_83_1.var_.characterEffect1072ui_story then
				arg_83_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_86_4 = arg_83_1.actors_["1076ui_story"]
			local var_86_5 = 0

			if var_86_5 < arg_83_1.time_ and arg_83_1.time_ <= var_86_5 + arg_86_0 and arg_83_1.var_.characterEffect1076ui_story == nil then
				arg_83_1.var_.characterEffect1076ui_story = var_86_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_6 = 0.200000002980232

			if var_86_5 <= arg_83_1.time_ and arg_83_1.time_ < var_86_5 + var_86_6 then
				local var_86_7 = (arg_83_1.time_ - var_86_5) / var_86_6

				if arg_83_1.var_.characterEffect1076ui_story then
					local var_86_8 = Mathf.Lerp(0, 0.5, var_86_7)

					arg_83_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_83_1.var_.characterEffect1076ui_story.fillRatio = var_86_8
				end
			end

			if arg_83_1.time_ >= var_86_5 + var_86_6 and arg_83_1.time_ < var_86_5 + var_86_6 + arg_86_0 and arg_83_1.var_.characterEffect1076ui_story then
				local var_86_9 = 0.5

				arg_83_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_83_1.var_.characterEffect1076ui_story.fillRatio = var_86_9
			end

			local var_86_10 = 0
			local var_86_11 = 1.225

			if var_86_10 < arg_83_1.time_ and arg_83_1.time_ <= var_86_10 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_12 = arg_83_1:FormatText(StoryNameCfg[379].name)

				arg_83_1.leftNameTxt_.text = var_86_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_13 = arg_83_1:GetWordFromCfg(121481021)
				local var_86_14 = arg_83_1:FormatText(var_86_13.content)

				arg_83_1.text_.text = var_86_14

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_15 = 49
				local var_86_16 = utf8.len(var_86_14)
				local var_86_17 = var_86_15 <= 0 and var_86_11 or var_86_11 * (var_86_16 / var_86_15)

				if var_86_17 > 0 and var_86_11 < var_86_17 then
					arg_83_1.talkMaxDuration = var_86_17

					if var_86_17 + var_86_10 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_17 + var_86_10
					end
				end

				arg_83_1.text_.text = var_86_14
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481021", "story_v_out_121481.awb") ~= 0 then
					local var_86_18 = manager.audio:GetVoiceLength("story_v_out_121481", "121481021", "story_v_out_121481.awb") / 1000

					if var_86_18 + var_86_10 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_18 + var_86_10
					end

					if var_86_13.prefab_name ~= "" and arg_83_1.actors_[var_86_13.prefab_name] ~= nil then
						local var_86_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_13.prefab_name].transform, "story_v_out_121481", "121481021", "story_v_out_121481.awb")

						arg_83_1:RecordAudio("121481021", var_86_19)
						arg_83_1:RecordAudio("121481021", var_86_19)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_121481", "121481021", "story_v_out_121481.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_121481", "121481021", "story_v_out_121481.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_20 = math.max(var_86_11, arg_83_1.talkMaxDuration)

			if var_86_10 <= arg_83_1.time_ and arg_83_1.time_ < var_86_10 + var_86_20 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_10) / var_86_20

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_10 + var_86_20 and arg_83_1.time_ < var_86_10 + var_86_20 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play121481022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 121481022
		arg_87_1.duration_ = 7.766

		local var_87_0 = {
			ja = 7.766,
			ko = 7.433,
			zh = 7.433
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
				arg_87_0:Play121481023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 0
			local var_90_1 = 0.975

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_2 = arg_87_1:FormatText(StoryNameCfg[379].name)

				arg_87_1.leftNameTxt_.text = var_90_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_3 = arg_87_1:GetWordFromCfg(121481022)
				local var_90_4 = arg_87_1:FormatText(var_90_3.content)

				arg_87_1.text_.text = var_90_4

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_5 = 39
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

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481022", "story_v_out_121481.awb") ~= 0 then
					local var_90_8 = manager.audio:GetVoiceLength("story_v_out_121481", "121481022", "story_v_out_121481.awb") / 1000

					if var_90_8 + var_90_0 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_8 + var_90_0
					end

					if var_90_3.prefab_name ~= "" and arg_87_1.actors_[var_90_3.prefab_name] ~= nil then
						local var_90_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_3.prefab_name].transform, "story_v_out_121481", "121481022", "story_v_out_121481.awb")

						arg_87_1:RecordAudio("121481022", var_90_9)
						arg_87_1:RecordAudio("121481022", var_90_9)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_121481", "121481022", "story_v_out_121481.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_121481", "121481022", "story_v_out_121481.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_10 = math.max(var_90_1, arg_87_1.talkMaxDuration)

			if var_90_0 <= arg_87_1.time_ and arg_87_1.time_ < var_90_0 + var_90_10 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_0) / var_90_10

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_0 + var_90_10 and arg_87_1.time_ < var_90_0 + var_90_10 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play121481023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 121481023
		arg_91_1.duration_ = 13.066

		local var_91_0 = {
			ja = 7.733,
			ko = 13.066,
			zh = 13.066
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
				arg_91_0:Play121481024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0
			local var_94_1 = 1.7

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_2 = arg_91_1:FormatText(StoryNameCfg[379].name)

				arg_91_1.leftNameTxt_.text = var_94_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_3 = arg_91_1:GetWordFromCfg(121481023)
				local var_94_4 = arg_91_1:FormatText(var_94_3.content)

				arg_91_1.text_.text = var_94_4

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_5 = 68
				local var_94_6 = utf8.len(var_94_4)
				local var_94_7 = var_94_5 <= 0 and var_94_1 or var_94_1 * (var_94_6 / var_94_5)

				if var_94_7 > 0 and var_94_1 < var_94_7 then
					arg_91_1.talkMaxDuration = var_94_7

					if var_94_7 + var_94_0 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_7 + var_94_0
					end
				end

				arg_91_1.text_.text = var_94_4
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481023", "story_v_out_121481.awb") ~= 0 then
					local var_94_8 = manager.audio:GetVoiceLength("story_v_out_121481", "121481023", "story_v_out_121481.awb") / 1000

					if var_94_8 + var_94_0 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_8 + var_94_0
					end

					if var_94_3.prefab_name ~= "" and arg_91_1.actors_[var_94_3.prefab_name] ~= nil then
						local var_94_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_3.prefab_name].transform, "story_v_out_121481", "121481023", "story_v_out_121481.awb")

						arg_91_1:RecordAudio("121481023", var_94_9)
						arg_91_1:RecordAudio("121481023", var_94_9)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_121481", "121481023", "story_v_out_121481.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_121481", "121481023", "story_v_out_121481.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_10 = math.max(var_94_1, arg_91_1.talkMaxDuration)

			if var_94_0 <= arg_91_1.time_ and arg_91_1.time_ < var_94_0 + var_94_10 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_0) / var_94_10

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_0 + var_94_10 and arg_91_1.time_ < var_94_0 + var_94_10 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play121481024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 121481024
		arg_95_1.duration_ = 13.1

		local var_95_0 = {
			ja = 13.1,
			ko = 11.866,
			zh = 11.866
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
				arg_95_0:Play121481025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 0
			local var_98_1 = 1.4

			if var_98_0 < arg_95_1.time_ and arg_95_1.time_ <= var_98_0 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_2 = arg_95_1:FormatText(StoryNameCfg[379].name)

				arg_95_1.leftNameTxt_.text = var_98_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_3 = arg_95_1:GetWordFromCfg(121481024)
				local var_98_4 = arg_95_1:FormatText(var_98_3.content)

				arg_95_1.text_.text = var_98_4

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_5 = 56
				local var_98_6 = utf8.len(var_98_4)
				local var_98_7 = var_98_5 <= 0 and var_98_1 or var_98_1 * (var_98_6 / var_98_5)

				if var_98_7 > 0 and var_98_1 < var_98_7 then
					arg_95_1.talkMaxDuration = var_98_7

					if var_98_7 + var_98_0 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_7 + var_98_0
					end
				end

				arg_95_1.text_.text = var_98_4
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481024", "story_v_out_121481.awb") ~= 0 then
					local var_98_8 = manager.audio:GetVoiceLength("story_v_out_121481", "121481024", "story_v_out_121481.awb") / 1000

					if var_98_8 + var_98_0 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_8 + var_98_0
					end

					if var_98_3.prefab_name ~= "" and arg_95_1.actors_[var_98_3.prefab_name] ~= nil then
						local var_98_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_3.prefab_name].transform, "story_v_out_121481", "121481024", "story_v_out_121481.awb")

						arg_95_1:RecordAudio("121481024", var_98_9)
						arg_95_1:RecordAudio("121481024", var_98_9)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_121481", "121481024", "story_v_out_121481.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_121481", "121481024", "story_v_out_121481.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_10 = math.max(var_98_1, arg_95_1.talkMaxDuration)

			if var_98_0 <= arg_95_1.time_ and arg_95_1.time_ < var_98_0 + var_98_10 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_0) / var_98_10

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_0 + var_98_10 and arg_95_1.time_ < var_98_0 + var_98_10 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play121481025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 121481025
		arg_99_1.duration_ = 9.1

		local var_99_0 = {
			ja = 4.5,
			ko = 9.1,
			zh = 9.1
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
				arg_99_0:Play121481026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = 0

			if var_102_0 < arg_99_1.time_ and arg_99_1.time_ <= var_102_0 + arg_102_0 then
				arg_99_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action5_1")
			end

			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_102_2 = 0
			local var_102_3 = 0.75

			if var_102_2 < arg_99_1.time_ and arg_99_1.time_ <= var_102_2 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_4 = arg_99_1:FormatText(StoryNameCfg[379].name)

				arg_99_1.leftNameTxt_.text = var_102_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_5 = arg_99_1:GetWordFromCfg(121481025)
				local var_102_6 = arg_99_1:FormatText(var_102_5.content)

				arg_99_1.text_.text = var_102_6

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_7 = 30
				local var_102_8 = utf8.len(var_102_6)
				local var_102_9 = var_102_7 <= 0 and var_102_3 or var_102_3 * (var_102_8 / var_102_7)

				if var_102_9 > 0 and var_102_3 < var_102_9 then
					arg_99_1.talkMaxDuration = var_102_9

					if var_102_9 + var_102_2 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_9 + var_102_2
					end
				end

				arg_99_1.text_.text = var_102_6
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481025", "story_v_out_121481.awb") ~= 0 then
					local var_102_10 = manager.audio:GetVoiceLength("story_v_out_121481", "121481025", "story_v_out_121481.awb") / 1000

					if var_102_10 + var_102_2 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_10 + var_102_2
					end

					if var_102_5.prefab_name ~= "" and arg_99_1.actors_[var_102_5.prefab_name] ~= nil then
						local var_102_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_5.prefab_name].transform, "story_v_out_121481", "121481025", "story_v_out_121481.awb")

						arg_99_1:RecordAudio("121481025", var_102_11)
						arg_99_1:RecordAudio("121481025", var_102_11)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_121481", "121481025", "story_v_out_121481.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_121481", "121481025", "story_v_out_121481.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_12 = math.max(var_102_3, arg_99_1.talkMaxDuration)

			if var_102_2 <= arg_99_1.time_ and arg_99_1.time_ < var_102_2 + var_102_12 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_2) / var_102_12

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_2 + var_102_12 and arg_99_1.time_ < var_102_2 + var_102_12 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play121481026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 121481026
		arg_103_1.duration_ = 7.433

		local var_103_0 = {
			ja = 7.433,
			ko = 3.366,
			zh = 3.366
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
				arg_103_0:Play121481027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["1072ui_story"]
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 and arg_103_1.var_.characterEffect1072ui_story == nil then
				arg_103_1.var_.characterEffect1072ui_story = var_106_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_2 = 0.200000002980232

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2

				if arg_103_1.var_.characterEffect1072ui_story then
					local var_106_4 = Mathf.Lerp(0, 0.5, var_106_3)

					arg_103_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_103_1.var_.characterEffect1072ui_story.fillRatio = var_106_4
				end
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 and arg_103_1.var_.characterEffect1072ui_story then
				local var_106_5 = 0.5

				arg_103_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_103_1.var_.characterEffect1072ui_story.fillRatio = var_106_5
			end

			local var_106_6 = arg_103_1.actors_["1076ui_story"]
			local var_106_7 = 0

			if var_106_7 < arg_103_1.time_ and arg_103_1.time_ <= var_106_7 + arg_106_0 and arg_103_1.var_.characterEffect1076ui_story == nil then
				arg_103_1.var_.characterEffect1076ui_story = var_106_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_8 = 0.200000002980232

			if var_106_7 <= arg_103_1.time_ and arg_103_1.time_ < var_106_7 + var_106_8 then
				local var_106_9 = (arg_103_1.time_ - var_106_7) / var_106_8

				if arg_103_1.var_.characterEffect1076ui_story then
					arg_103_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_103_1.time_ >= var_106_7 + var_106_8 and arg_103_1.time_ < var_106_7 + var_106_8 + arg_106_0 and arg_103_1.var_.characterEffect1076ui_story then
				arg_103_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_106_10 = 0
			local var_106_11 = 0.3

			if var_106_10 < arg_103_1.time_ and arg_103_1.time_ <= var_106_10 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_12 = arg_103_1:FormatText(StoryNameCfg[389].name)

				arg_103_1.leftNameTxt_.text = var_106_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_13 = arg_103_1:GetWordFromCfg(121481026)
				local var_106_14 = arg_103_1:FormatText(var_106_13.content)

				arg_103_1.text_.text = var_106_14

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_15 = 12
				local var_106_16 = utf8.len(var_106_14)
				local var_106_17 = var_106_15 <= 0 and var_106_11 or var_106_11 * (var_106_16 / var_106_15)

				if var_106_17 > 0 and var_106_11 < var_106_17 then
					arg_103_1.talkMaxDuration = var_106_17

					if var_106_17 + var_106_10 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_17 + var_106_10
					end
				end

				arg_103_1.text_.text = var_106_14
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481026", "story_v_out_121481.awb") ~= 0 then
					local var_106_18 = manager.audio:GetVoiceLength("story_v_out_121481", "121481026", "story_v_out_121481.awb") / 1000

					if var_106_18 + var_106_10 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_18 + var_106_10
					end

					if var_106_13.prefab_name ~= "" and arg_103_1.actors_[var_106_13.prefab_name] ~= nil then
						local var_106_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_13.prefab_name].transform, "story_v_out_121481", "121481026", "story_v_out_121481.awb")

						arg_103_1:RecordAudio("121481026", var_106_19)
						arg_103_1:RecordAudio("121481026", var_106_19)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_121481", "121481026", "story_v_out_121481.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_121481", "121481026", "story_v_out_121481.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_20 = math.max(var_106_11, arg_103_1.talkMaxDuration)

			if var_106_10 <= arg_103_1.time_ and arg_103_1.time_ < var_106_10 + var_106_20 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_10) / var_106_20

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_10 + var_106_20 and arg_103_1.time_ < var_106_10 + var_106_20 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play121481027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 121481027
		arg_107_1.duration_ = 2.566

		local var_107_0 = {
			ja = 2.2,
			ko = 2.566,
			zh = 2.566
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
				arg_107_0:Play121481028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1072ui_story"]
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 and arg_107_1.var_.characterEffect1072ui_story == nil then
				arg_107_1.var_.characterEffect1072ui_story = var_110_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_2 = 0.200000002980232

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2

				if arg_107_1.var_.characterEffect1072ui_story then
					arg_107_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 and arg_107_1.var_.characterEffect1072ui_story then
				arg_107_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_110_4 = arg_107_1.actors_["1076ui_story"]
			local var_110_5 = 0

			if var_110_5 < arg_107_1.time_ and arg_107_1.time_ <= var_110_5 + arg_110_0 and arg_107_1.var_.characterEffect1076ui_story == nil then
				arg_107_1.var_.characterEffect1076ui_story = var_110_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_6 = 0.200000002980232

			if var_110_5 <= arg_107_1.time_ and arg_107_1.time_ < var_110_5 + var_110_6 then
				local var_110_7 = (arg_107_1.time_ - var_110_5) / var_110_6

				if arg_107_1.var_.characterEffect1076ui_story then
					local var_110_8 = Mathf.Lerp(0, 0.5, var_110_7)

					arg_107_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_107_1.var_.characterEffect1076ui_story.fillRatio = var_110_8
				end
			end

			if arg_107_1.time_ >= var_110_5 + var_110_6 and arg_107_1.time_ < var_110_5 + var_110_6 + arg_110_0 and arg_107_1.var_.characterEffect1076ui_story then
				local var_110_9 = 0.5

				arg_107_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_107_1.var_.characterEffect1076ui_story.fillRatio = var_110_9
			end

			local var_110_10 = 0
			local var_110_11 = 0.15

			if var_110_10 < arg_107_1.time_ and arg_107_1.time_ <= var_110_10 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_12 = arg_107_1:FormatText(StoryNameCfg[379].name)

				arg_107_1.leftNameTxt_.text = var_110_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_13 = arg_107_1:GetWordFromCfg(121481027)
				local var_110_14 = arg_107_1:FormatText(var_110_13.content)

				arg_107_1.text_.text = var_110_14

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_15 = 6
				local var_110_16 = utf8.len(var_110_14)
				local var_110_17 = var_110_15 <= 0 and var_110_11 or var_110_11 * (var_110_16 / var_110_15)

				if var_110_17 > 0 and var_110_11 < var_110_17 then
					arg_107_1.talkMaxDuration = var_110_17

					if var_110_17 + var_110_10 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_17 + var_110_10
					end
				end

				arg_107_1.text_.text = var_110_14
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481027", "story_v_out_121481.awb") ~= 0 then
					local var_110_18 = manager.audio:GetVoiceLength("story_v_out_121481", "121481027", "story_v_out_121481.awb") / 1000

					if var_110_18 + var_110_10 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_18 + var_110_10
					end

					if var_110_13.prefab_name ~= "" and arg_107_1.actors_[var_110_13.prefab_name] ~= nil then
						local var_110_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_13.prefab_name].transform, "story_v_out_121481", "121481027", "story_v_out_121481.awb")

						arg_107_1:RecordAudio("121481027", var_110_19)
						arg_107_1:RecordAudio("121481027", var_110_19)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_121481", "121481027", "story_v_out_121481.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_121481", "121481027", "story_v_out_121481.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_20 = math.max(var_110_11, arg_107_1.talkMaxDuration)

			if var_110_10 <= arg_107_1.time_ and arg_107_1.time_ < var_110_10 + var_110_20 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_10) / var_110_20

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_10 + var_110_20 and arg_107_1.time_ < var_110_10 + var_110_20 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play121481028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 121481028
		arg_111_1.duration_ = 11.1

		local var_111_0 = {
			ja = 11.1,
			ko = 10.366,
			zh = 10.366
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
				arg_111_0:Play121481029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = 0
			local var_114_1 = 1.35

			if var_114_0 < arg_111_1.time_ and arg_111_1.time_ <= var_114_0 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_2 = arg_111_1:FormatText(StoryNameCfg[379].name)

				arg_111_1.leftNameTxt_.text = var_114_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_3 = arg_111_1:GetWordFromCfg(121481028)
				local var_114_4 = arg_111_1:FormatText(var_114_3.content)

				arg_111_1.text_.text = var_114_4

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_5 = 54
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

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481028", "story_v_out_121481.awb") ~= 0 then
					local var_114_8 = manager.audio:GetVoiceLength("story_v_out_121481", "121481028", "story_v_out_121481.awb") / 1000

					if var_114_8 + var_114_0 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_8 + var_114_0
					end

					if var_114_3.prefab_name ~= "" and arg_111_1.actors_[var_114_3.prefab_name] ~= nil then
						local var_114_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_3.prefab_name].transform, "story_v_out_121481", "121481028", "story_v_out_121481.awb")

						arg_111_1:RecordAudio("121481028", var_114_9)
						arg_111_1:RecordAudio("121481028", var_114_9)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_121481", "121481028", "story_v_out_121481.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_121481", "121481028", "story_v_out_121481.awb")
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
	Play121481029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 121481029
		arg_115_1.duration_ = 9.733

		local var_115_0 = {
			ja = 9.733,
			ko = 7.233,
			zh = 7.233
		}
		local var_115_1 = manager.audio:GetLocalizationFlag()

		if var_115_0[var_115_1] ~= nil then
			arg_115_1.duration_ = var_115_0[var_115_1]
		end

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play121481030(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = 0

			if var_118_0 < arg_115_1.time_ and arg_115_1.time_ <= var_118_0 + arg_118_0 then
				arg_115_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action5_2")
			end

			local var_118_1 = 0
			local var_118_2 = 0.85

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_3 = arg_115_1:FormatText(StoryNameCfg[379].name)

				arg_115_1.leftNameTxt_.text = var_118_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_4 = arg_115_1:GetWordFromCfg(121481029)
				local var_118_5 = arg_115_1:FormatText(var_118_4.content)

				arg_115_1.text_.text = var_118_5

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_6 = 34
				local var_118_7 = utf8.len(var_118_5)
				local var_118_8 = var_118_6 <= 0 and var_118_2 or var_118_2 * (var_118_7 / var_118_6)

				if var_118_8 > 0 and var_118_2 < var_118_8 then
					arg_115_1.talkMaxDuration = var_118_8

					if var_118_8 + var_118_1 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_8 + var_118_1
					end
				end

				arg_115_1.text_.text = var_118_5
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481029", "story_v_out_121481.awb") ~= 0 then
					local var_118_9 = manager.audio:GetVoiceLength("story_v_out_121481", "121481029", "story_v_out_121481.awb") / 1000

					if var_118_9 + var_118_1 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_9 + var_118_1
					end

					if var_118_4.prefab_name ~= "" and arg_115_1.actors_[var_118_4.prefab_name] ~= nil then
						local var_118_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_4.prefab_name].transform, "story_v_out_121481", "121481029", "story_v_out_121481.awb")

						arg_115_1:RecordAudio("121481029", var_118_10)
						arg_115_1:RecordAudio("121481029", var_118_10)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_121481", "121481029", "story_v_out_121481.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_121481", "121481029", "story_v_out_121481.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_11 = math.max(var_118_2, arg_115_1.talkMaxDuration)

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_11 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_1) / var_118_11

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_1 + var_118_11 and arg_115_1.time_ < var_118_1 + var_118_11 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play121481030 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 121481030
		arg_119_1.duration_ = 5

		SetActive(arg_119_1.tipsGo_, false)

		function arg_119_1.onSingleLineFinish_()
			arg_119_1.onSingleLineUpdate_ = nil
			arg_119_1.onSingleLineFinish_ = nil
			arg_119_1.state_ = "waiting"
		end

		function arg_119_1.playNext_(arg_121_0)
			if arg_121_0 == 1 then
				arg_119_0:Play121481031(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["1072ui_story"]
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 and arg_119_1.var_.characterEffect1072ui_story == nil then
				arg_119_1.var_.characterEffect1072ui_story = var_122_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_2 = 0.200000002980232

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2

				if arg_119_1.var_.characterEffect1072ui_story then
					local var_122_4 = Mathf.Lerp(0, 0.5, var_122_3)

					arg_119_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_119_1.var_.characterEffect1072ui_story.fillRatio = var_122_4
				end
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 and arg_119_1.var_.characterEffect1072ui_story then
				local var_122_5 = 0.5

				arg_119_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_119_1.var_.characterEffect1072ui_story.fillRatio = var_122_5
			end

			local var_122_6 = 0
			local var_122_7 = 0.625

			if var_122_6 < arg_119_1.time_ and arg_119_1.time_ <= var_122_6 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, false)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_8 = arg_119_1:GetWordFromCfg(121481030)
				local var_122_9 = arg_119_1:FormatText(var_122_8.content)

				arg_119_1.text_.text = var_122_9

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_10 = 25
				local var_122_11 = utf8.len(var_122_9)
				local var_122_12 = var_122_10 <= 0 and var_122_7 or var_122_7 * (var_122_11 / var_122_10)

				if var_122_12 > 0 and var_122_7 < var_122_12 then
					arg_119_1.talkMaxDuration = var_122_12

					if var_122_12 + var_122_6 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_12 + var_122_6
					end
				end

				arg_119_1.text_.text = var_122_9
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)
				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_13 = math.max(var_122_7, arg_119_1.talkMaxDuration)

			if var_122_6 <= arg_119_1.time_ and arg_119_1.time_ < var_122_6 + var_122_13 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_6) / var_122_13

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_6 + var_122_13 and arg_119_1.time_ < var_122_6 + var_122_13 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play121481031 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 121481031
		arg_123_1.duration_ = 8.133

		local var_123_0 = {
			ja = 5.433,
			ko = 8.133,
			zh = 8.133
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
				arg_123_0:Play121481032(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["1072ui_story"]
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 and arg_123_1.var_.characterEffect1072ui_story == nil then
				arg_123_1.var_.characterEffect1072ui_story = var_126_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_2 = 0.200000002980232

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2

				if arg_123_1.var_.characterEffect1072ui_story then
					arg_123_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 and arg_123_1.var_.characterEffect1072ui_story then
				arg_123_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_126_4 = 0
			local var_126_5 = 1.1

			if var_126_4 < arg_123_1.time_ and arg_123_1.time_ <= var_126_4 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_6 = arg_123_1:FormatText(StoryNameCfg[379].name)

				arg_123_1.leftNameTxt_.text = var_126_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_7 = arg_123_1:GetWordFromCfg(121481031)
				local var_126_8 = arg_123_1:FormatText(var_126_7.content)

				arg_123_1.text_.text = var_126_8

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_9 = 44
				local var_126_10 = utf8.len(var_126_8)
				local var_126_11 = var_126_9 <= 0 and var_126_5 or var_126_5 * (var_126_10 / var_126_9)

				if var_126_11 > 0 and var_126_5 < var_126_11 then
					arg_123_1.talkMaxDuration = var_126_11

					if var_126_11 + var_126_4 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_11 + var_126_4
					end
				end

				arg_123_1.text_.text = var_126_8
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481031", "story_v_out_121481.awb") ~= 0 then
					local var_126_12 = manager.audio:GetVoiceLength("story_v_out_121481", "121481031", "story_v_out_121481.awb") / 1000

					if var_126_12 + var_126_4 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_12 + var_126_4
					end

					if var_126_7.prefab_name ~= "" and arg_123_1.actors_[var_126_7.prefab_name] ~= nil then
						local var_126_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_7.prefab_name].transform, "story_v_out_121481", "121481031", "story_v_out_121481.awb")

						arg_123_1:RecordAudio("121481031", var_126_13)
						arg_123_1:RecordAudio("121481031", var_126_13)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_121481", "121481031", "story_v_out_121481.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_121481", "121481031", "story_v_out_121481.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_14 = math.max(var_126_5, arg_123_1.talkMaxDuration)

			if var_126_4 <= arg_123_1.time_ and arg_123_1.time_ < var_126_4 + var_126_14 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_4) / var_126_14

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_4 + var_126_14 and arg_123_1.time_ < var_126_4 + var_126_14 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play121481032 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 121481032
		arg_127_1.duration_ = 5

		SetActive(arg_127_1.tipsGo_, false)

		function arg_127_1.onSingleLineFinish_()
			arg_127_1.onSingleLineUpdate_ = nil
			arg_127_1.onSingleLineFinish_ = nil
			arg_127_1.state_ = "waiting"
		end

		function arg_127_1.playNext_(arg_129_0)
			if arg_129_0 == 1 then
				arg_127_0:Play121481033(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["1072ui_story"]
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 and arg_127_1.var_.characterEffect1072ui_story == nil then
				arg_127_1.var_.characterEffect1072ui_story = var_130_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_2 = 0.200000002980232

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / var_130_2

				if arg_127_1.var_.characterEffect1072ui_story then
					local var_130_4 = Mathf.Lerp(0, 0.5, var_130_3)

					arg_127_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_127_1.var_.characterEffect1072ui_story.fillRatio = var_130_4
				end
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 and arg_127_1.var_.characterEffect1072ui_story then
				local var_130_5 = 0.5

				arg_127_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_127_1.var_.characterEffect1072ui_story.fillRatio = var_130_5
			end

			local var_130_6 = 0
			local var_130_7 = 1.225

			if var_130_6 < arg_127_1.time_ and arg_127_1.time_ <= var_130_6 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, false)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_8 = arg_127_1:GetWordFromCfg(121481032)
				local var_130_9 = arg_127_1:FormatText(var_130_8.content)

				arg_127_1.text_.text = var_130_9

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_10 = 49
				local var_130_11 = utf8.len(var_130_9)
				local var_130_12 = var_130_10 <= 0 and var_130_7 or var_130_7 * (var_130_11 / var_130_10)

				if var_130_12 > 0 and var_130_7 < var_130_12 then
					arg_127_1.talkMaxDuration = var_130_12

					if var_130_12 + var_130_6 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_12 + var_130_6
					end
				end

				arg_127_1.text_.text = var_130_9
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)
				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_13 = math.max(var_130_7, arg_127_1.talkMaxDuration)

			if var_130_6 <= arg_127_1.time_ and arg_127_1.time_ < var_130_6 + var_130_13 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_6) / var_130_13

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_6 + var_130_13 and arg_127_1.time_ < var_130_6 + var_130_13 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play121481033 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 121481033
		arg_131_1.duration_ = 5

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play121481034(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = 0
			local var_134_1 = 1

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

				local var_134_2 = arg_131_1:GetWordFromCfg(121481033)
				local var_134_3 = arg_131_1:FormatText(var_134_2.content)

				arg_131_1.text_.text = var_134_3

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_4 = 40
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
	Play121481034 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 121481034
		arg_135_1.duration_ = 1.999999999999

		SetActive(arg_135_1.tipsGo_, false)

		function arg_135_1.onSingleLineFinish_()
			arg_135_1.onSingleLineUpdate_ = nil
			arg_135_1.onSingleLineFinish_ = nil
			arg_135_1.state_ = "waiting"
		end

		function arg_135_1.playNext_(arg_137_0)
			if arg_137_0 == 1 then
				arg_135_0:Play121481035(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["1076ui_story"]
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 and arg_135_1.var_.characterEffect1076ui_story == nil then
				arg_135_1.var_.characterEffect1076ui_story = var_138_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_2 = 0.200000002980232

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2

				if arg_135_1.var_.characterEffect1076ui_story then
					arg_135_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_135_1.time_ >= var_138_1 + var_138_2 and arg_135_1.time_ < var_138_1 + var_138_2 + arg_138_0 and arg_135_1.var_.characterEffect1076ui_story then
				arg_135_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_138_4 = 0

			if var_138_4 < arg_135_1.time_ and arg_135_1.time_ <= var_138_4 + arg_138_0 then
				arg_135_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_138_5 = 0
			local var_138_6 = 0.125

			if var_138_5 < arg_135_1.time_ and arg_135_1.time_ <= var_138_5 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_7 = arg_135_1:FormatText(StoryNameCfg[389].name)

				arg_135_1.leftNameTxt_.text = var_138_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_8 = arg_135_1:GetWordFromCfg(121481034)
				local var_138_9 = arg_135_1:FormatText(var_138_8.content)

				arg_135_1.text_.text = var_138_9

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_10 = 5
				local var_138_11 = utf8.len(var_138_9)
				local var_138_12 = var_138_10 <= 0 and var_138_6 or var_138_6 * (var_138_11 / var_138_10)

				if var_138_12 > 0 and var_138_6 < var_138_12 then
					arg_135_1.talkMaxDuration = var_138_12

					if var_138_12 + var_138_5 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_12 + var_138_5
					end
				end

				arg_135_1.text_.text = var_138_9
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481034", "story_v_out_121481.awb") ~= 0 then
					local var_138_13 = manager.audio:GetVoiceLength("story_v_out_121481", "121481034", "story_v_out_121481.awb") / 1000

					if var_138_13 + var_138_5 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_13 + var_138_5
					end

					if var_138_8.prefab_name ~= "" and arg_135_1.actors_[var_138_8.prefab_name] ~= nil then
						local var_138_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_8.prefab_name].transform, "story_v_out_121481", "121481034", "story_v_out_121481.awb")

						arg_135_1:RecordAudio("121481034", var_138_14)
						arg_135_1:RecordAudio("121481034", var_138_14)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_121481", "121481034", "story_v_out_121481.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_121481", "121481034", "story_v_out_121481.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_15 = math.max(var_138_6, arg_135_1.talkMaxDuration)

			if var_138_5 <= arg_135_1.time_ and arg_135_1.time_ < var_138_5 + var_138_15 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_5) / var_138_15

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_5 + var_138_15 and arg_135_1.time_ < var_138_5 + var_138_15 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play121481035 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 121481035
		arg_139_1.duration_ = 6.733

		local var_139_0 = {
			ja = 6.733,
			ko = 3.766,
			zh = 3.766
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
				arg_139_0:Play121481036(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["1072ui_story"]
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 and arg_139_1.var_.characterEffect1072ui_story == nil then
				arg_139_1.var_.characterEffect1072ui_story = var_142_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_2 = 0.200000002980232

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / var_142_2

				if arg_139_1.var_.characterEffect1072ui_story then
					arg_139_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 and arg_139_1.var_.characterEffect1072ui_story then
				arg_139_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_142_4 = arg_139_1.actors_["1076ui_story"]
			local var_142_5 = 0

			if var_142_5 < arg_139_1.time_ and arg_139_1.time_ <= var_142_5 + arg_142_0 and arg_139_1.var_.characterEffect1076ui_story == nil then
				arg_139_1.var_.characterEffect1076ui_story = var_142_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_6 = 0.200000002980232

			if var_142_5 <= arg_139_1.time_ and arg_139_1.time_ < var_142_5 + var_142_6 then
				local var_142_7 = (arg_139_1.time_ - var_142_5) / var_142_6

				if arg_139_1.var_.characterEffect1076ui_story then
					local var_142_8 = Mathf.Lerp(0, 0.5, var_142_7)

					arg_139_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_139_1.var_.characterEffect1076ui_story.fillRatio = var_142_8
				end
			end

			if arg_139_1.time_ >= var_142_5 + var_142_6 and arg_139_1.time_ < var_142_5 + var_142_6 + arg_142_0 and arg_139_1.var_.characterEffect1076ui_story then
				local var_142_9 = 0.5

				arg_139_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_139_1.var_.characterEffect1076ui_story.fillRatio = var_142_9
			end

			local var_142_10 = 0
			local var_142_11 = 0.475

			if var_142_10 < arg_139_1.time_ and arg_139_1.time_ <= var_142_10 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_12 = arg_139_1:FormatText(StoryNameCfg[379].name)

				arg_139_1.leftNameTxt_.text = var_142_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_13 = arg_139_1:GetWordFromCfg(121481035)
				local var_142_14 = arg_139_1:FormatText(var_142_13.content)

				arg_139_1.text_.text = var_142_14

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_15 = 19
				local var_142_16 = utf8.len(var_142_14)
				local var_142_17 = var_142_15 <= 0 and var_142_11 or var_142_11 * (var_142_16 / var_142_15)

				if var_142_17 > 0 and var_142_11 < var_142_17 then
					arg_139_1.talkMaxDuration = var_142_17

					if var_142_17 + var_142_10 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_17 + var_142_10
					end
				end

				arg_139_1.text_.text = var_142_14
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481035", "story_v_out_121481.awb") ~= 0 then
					local var_142_18 = manager.audio:GetVoiceLength("story_v_out_121481", "121481035", "story_v_out_121481.awb") / 1000

					if var_142_18 + var_142_10 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_18 + var_142_10
					end

					if var_142_13.prefab_name ~= "" and arg_139_1.actors_[var_142_13.prefab_name] ~= nil then
						local var_142_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_13.prefab_name].transform, "story_v_out_121481", "121481035", "story_v_out_121481.awb")

						arg_139_1:RecordAudio("121481035", var_142_19)
						arg_139_1:RecordAudio("121481035", var_142_19)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_121481", "121481035", "story_v_out_121481.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_121481", "121481035", "story_v_out_121481.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_20 = math.max(var_142_11, arg_139_1.talkMaxDuration)

			if var_142_10 <= arg_139_1.time_ and arg_139_1.time_ < var_142_10 + var_142_20 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_10) / var_142_20

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_10 + var_142_20 and arg_139_1.time_ < var_142_10 + var_142_20 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play121481036 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 121481036
		arg_143_1.duration_ = 12.3

		local var_143_0 = {
			ja = 12.3,
			ko = 8.933,
			zh = 8.933
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
				arg_143_0:Play121481037(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = 0
			local var_146_1 = 1.175

			if var_146_0 < arg_143_1.time_ and arg_143_1.time_ <= var_146_0 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_2 = arg_143_1:FormatText(StoryNameCfg[379].name)

				arg_143_1.leftNameTxt_.text = var_146_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_3 = arg_143_1:GetWordFromCfg(121481036)
				local var_146_4 = arg_143_1:FormatText(var_146_3.content)

				arg_143_1.text_.text = var_146_4

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_5 = 46
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

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481036", "story_v_out_121481.awb") ~= 0 then
					local var_146_8 = manager.audio:GetVoiceLength("story_v_out_121481", "121481036", "story_v_out_121481.awb") / 1000

					if var_146_8 + var_146_0 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_8 + var_146_0
					end

					if var_146_3.prefab_name ~= "" and arg_143_1.actors_[var_146_3.prefab_name] ~= nil then
						local var_146_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_3.prefab_name].transform, "story_v_out_121481", "121481036", "story_v_out_121481.awb")

						arg_143_1:RecordAudio("121481036", var_146_9)
						arg_143_1:RecordAudio("121481036", var_146_9)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_121481", "121481036", "story_v_out_121481.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_121481", "121481036", "story_v_out_121481.awb")
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
	Play121481037 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 121481037
		arg_147_1.duration_ = 8.6

		local var_147_0 = {
			ja = 8.6,
			ko = 4.666,
			zh = 4.666
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
				arg_147_0:Play121481038(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["1072ui_story"]
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 and arg_147_1.var_.characterEffect1072ui_story == nil then
				arg_147_1.var_.characterEffect1072ui_story = var_150_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_2 = 0.200000002980232

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_2 then
				local var_150_3 = (arg_147_1.time_ - var_150_1) / var_150_2

				if arg_147_1.var_.characterEffect1072ui_story then
					local var_150_4 = Mathf.Lerp(0, 0.5, var_150_3)

					arg_147_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_147_1.var_.characterEffect1072ui_story.fillRatio = var_150_4
				end
			end

			if arg_147_1.time_ >= var_150_1 + var_150_2 and arg_147_1.time_ < var_150_1 + var_150_2 + arg_150_0 and arg_147_1.var_.characterEffect1072ui_story then
				local var_150_5 = 0.5

				arg_147_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_147_1.var_.characterEffect1072ui_story.fillRatio = var_150_5
			end

			local var_150_6 = arg_147_1.actors_["1076ui_story"]
			local var_150_7 = 0

			if var_150_7 < arg_147_1.time_ and arg_147_1.time_ <= var_150_7 + arg_150_0 and arg_147_1.var_.characterEffect1076ui_story == nil then
				arg_147_1.var_.characterEffect1076ui_story = var_150_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_8 = 0.200000002980232

			if var_150_7 <= arg_147_1.time_ and arg_147_1.time_ < var_150_7 + var_150_8 then
				local var_150_9 = (arg_147_1.time_ - var_150_7) / var_150_8

				if arg_147_1.var_.characterEffect1076ui_story then
					arg_147_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_147_1.time_ >= var_150_7 + var_150_8 and arg_147_1.time_ < var_150_7 + var_150_8 + arg_150_0 and arg_147_1.var_.characterEffect1076ui_story then
				arg_147_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_150_10 = 0

			if var_150_10 < arg_147_1.time_ and arg_147_1.time_ <= var_150_10 + arg_150_0 then
				arg_147_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_150_11 = 0
			local var_150_12 = 0.6

			if var_150_11 < arg_147_1.time_ and arg_147_1.time_ <= var_150_11 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_13 = arg_147_1:FormatText(StoryNameCfg[389].name)

				arg_147_1.leftNameTxt_.text = var_150_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_14 = arg_147_1:GetWordFromCfg(121481037)
				local var_150_15 = arg_147_1:FormatText(var_150_14.content)

				arg_147_1.text_.text = var_150_15

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_16 = 24
				local var_150_17 = utf8.len(var_150_15)
				local var_150_18 = var_150_16 <= 0 and var_150_12 or var_150_12 * (var_150_17 / var_150_16)

				if var_150_18 > 0 and var_150_12 < var_150_18 then
					arg_147_1.talkMaxDuration = var_150_18

					if var_150_18 + var_150_11 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_18 + var_150_11
					end
				end

				arg_147_1.text_.text = var_150_15
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481037", "story_v_out_121481.awb") ~= 0 then
					local var_150_19 = manager.audio:GetVoiceLength("story_v_out_121481", "121481037", "story_v_out_121481.awb") / 1000

					if var_150_19 + var_150_11 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_19 + var_150_11
					end

					if var_150_14.prefab_name ~= "" and arg_147_1.actors_[var_150_14.prefab_name] ~= nil then
						local var_150_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_14.prefab_name].transform, "story_v_out_121481", "121481037", "story_v_out_121481.awb")

						arg_147_1:RecordAudio("121481037", var_150_20)
						arg_147_1:RecordAudio("121481037", var_150_20)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_121481", "121481037", "story_v_out_121481.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_121481", "121481037", "story_v_out_121481.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_21 = math.max(var_150_12, arg_147_1.talkMaxDuration)

			if var_150_11 <= arg_147_1.time_ and arg_147_1.time_ < var_150_11 + var_150_21 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_11) / var_150_21

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_11 + var_150_21 and arg_147_1.time_ < var_150_11 + var_150_21 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play121481038 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 121481038
		arg_151_1.duration_ = 8.933

		local var_151_0 = {
			ja = 8.933,
			ko = 5.366,
			zh = 5.366
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
				arg_151_0:Play121481039(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["1072ui_story"]
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 and arg_151_1.var_.characterEffect1072ui_story == nil then
				arg_151_1.var_.characterEffect1072ui_story = var_154_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_2 = 0.200000002980232

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_2 then
				local var_154_3 = (arg_151_1.time_ - var_154_1) / var_154_2

				if arg_151_1.var_.characterEffect1072ui_story then
					arg_151_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_151_1.time_ >= var_154_1 + var_154_2 and arg_151_1.time_ < var_154_1 + var_154_2 + arg_154_0 and arg_151_1.var_.characterEffect1072ui_story then
				arg_151_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_154_4 = arg_151_1.actors_["1076ui_story"]
			local var_154_5 = 0

			if var_154_5 < arg_151_1.time_ and arg_151_1.time_ <= var_154_5 + arg_154_0 and arg_151_1.var_.characterEffect1076ui_story == nil then
				arg_151_1.var_.characterEffect1076ui_story = var_154_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_6 = 0.200000002980232

			if var_154_5 <= arg_151_1.time_ and arg_151_1.time_ < var_154_5 + var_154_6 then
				local var_154_7 = (arg_151_1.time_ - var_154_5) / var_154_6

				if arg_151_1.var_.characterEffect1076ui_story then
					local var_154_8 = Mathf.Lerp(0, 0.5, var_154_7)

					arg_151_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_151_1.var_.characterEffect1076ui_story.fillRatio = var_154_8
				end
			end

			if arg_151_1.time_ >= var_154_5 + var_154_6 and arg_151_1.time_ < var_154_5 + var_154_6 + arg_154_0 and arg_151_1.var_.characterEffect1076ui_story then
				local var_154_9 = 0.5

				arg_151_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_151_1.var_.characterEffect1076ui_story.fillRatio = var_154_9
			end

			local var_154_10 = 0
			local var_154_11 = 0.55

			if var_154_10 < arg_151_1.time_ and arg_151_1.time_ <= var_154_10 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_12 = arg_151_1:FormatText(StoryNameCfg[379].name)

				arg_151_1.leftNameTxt_.text = var_154_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_13 = arg_151_1:GetWordFromCfg(121481038)
				local var_154_14 = arg_151_1:FormatText(var_154_13.content)

				arg_151_1.text_.text = var_154_14

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_15 = 21
				local var_154_16 = utf8.len(var_154_14)
				local var_154_17 = var_154_15 <= 0 and var_154_11 or var_154_11 * (var_154_16 / var_154_15)

				if var_154_17 > 0 and var_154_11 < var_154_17 then
					arg_151_1.talkMaxDuration = var_154_17

					if var_154_17 + var_154_10 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_17 + var_154_10
					end
				end

				arg_151_1.text_.text = var_154_14
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481038", "story_v_out_121481.awb") ~= 0 then
					local var_154_18 = manager.audio:GetVoiceLength("story_v_out_121481", "121481038", "story_v_out_121481.awb") / 1000

					if var_154_18 + var_154_10 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_18 + var_154_10
					end

					if var_154_13.prefab_name ~= "" and arg_151_1.actors_[var_154_13.prefab_name] ~= nil then
						local var_154_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_13.prefab_name].transform, "story_v_out_121481", "121481038", "story_v_out_121481.awb")

						arg_151_1:RecordAudio("121481038", var_154_19)
						arg_151_1:RecordAudio("121481038", var_154_19)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_121481", "121481038", "story_v_out_121481.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_121481", "121481038", "story_v_out_121481.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_20 = math.max(var_154_11, arg_151_1.talkMaxDuration)

			if var_154_10 <= arg_151_1.time_ and arg_151_1.time_ < var_154_10 + var_154_20 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_10) / var_154_20

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_10 + var_154_20 and arg_151_1.time_ < var_154_10 + var_154_20 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play121481039 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 121481039
		arg_155_1.duration_ = 10.833

		local var_155_0 = {
			ja = 4.166,
			ko = 10.833,
			zh = 10.833
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
				arg_155_0:Play121481040(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = 0
			local var_158_1 = 1.275

			if var_158_0 < arg_155_1.time_ and arg_155_1.time_ <= var_158_0 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_2 = arg_155_1:FormatText(StoryNameCfg[379].name)

				arg_155_1.leftNameTxt_.text = var_158_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_3 = arg_155_1:GetWordFromCfg(121481039)
				local var_158_4 = arg_155_1:FormatText(var_158_3.content)

				arg_155_1.text_.text = var_158_4

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_5 = 51
				local var_158_6 = utf8.len(var_158_4)
				local var_158_7 = var_158_5 <= 0 and var_158_1 or var_158_1 * (var_158_6 / var_158_5)

				if var_158_7 > 0 and var_158_1 < var_158_7 then
					arg_155_1.talkMaxDuration = var_158_7

					if var_158_7 + var_158_0 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_7 + var_158_0
					end
				end

				arg_155_1.text_.text = var_158_4
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481039", "story_v_out_121481.awb") ~= 0 then
					local var_158_8 = manager.audio:GetVoiceLength("story_v_out_121481", "121481039", "story_v_out_121481.awb") / 1000

					if var_158_8 + var_158_0 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_8 + var_158_0
					end

					if var_158_3.prefab_name ~= "" and arg_155_1.actors_[var_158_3.prefab_name] ~= nil then
						local var_158_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_3.prefab_name].transform, "story_v_out_121481", "121481039", "story_v_out_121481.awb")

						arg_155_1:RecordAudio("121481039", var_158_9)
						arg_155_1:RecordAudio("121481039", var_158_9)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_121481", "121481039", "story_v_out_121481.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_121481", "121481039", "story_v_out_121481.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_10 = math.max(var_158_1, arg_155_1.talkMaxDuration)

			if var_158_0 <= arg_155_1.time_ and arg_155_1.time_ < var_158_0 + var_158_10 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_0) / var_158_10

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_0 + var_158_10 and arg_155_1.time_ < var_158_0 + var_158_10 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play121481040 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 121481040
		arg_159_1.duration_ = 12.4

		local var_159_0 = {
			ja = 12.4,
			ko = 6.8,
			zh = 6.8
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
				arg_159_0:Play121481041(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0
			local var_162_1 = 0.875

			if var_162_0 < arg_159_1.time_ and arg_159_1.time_ <= var_162_0 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_2 = arg_159_1:FormatText(StoryNameCfg[379].name)

				arg_159_1.leftNameTxt_.text = var_162_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_3 = arg_159_1:GetWordFromCfg(121481040)
				local var_162_4 = arg_159_1:FormatText(var_162_3.content)

				arg_159_1.text_.text = var_162_4

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_5 = 35
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

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481040", "story_v_out_121481.awb") ~= 0 then
					local var_162_8 = manager.audio:GetVoiceLength("story_v_out_121481", "121481040", "story_v_out_121481.awb") / 1000

					if var_162_8 + var_162_0 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_8 + var_162_0
					end

					if var_162_3.prefab_name ~= "" and arg_159_1.actors_[var_162_3.prefab_name] ~= nil then
						local var_162_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_3.prefab_name].transform, "story_v_out_121481", "121481040", "story_v_out_121481.awb")

						arg_159_1:RecordAudio("121481040", var_162_9)
						arg_159_1:RecordAudio("121481040", var_162_9)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_121481", "121481040", "story_v_out_121481.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_121481", "121481040", "story_v_out_121481.awb")
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
	Play121481041 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 121481041
		arg_163_1.duration_ = 4.2

		local var_163_0 = {
			ja = 3.966,
			ko = 4.2,
			zh = 4.2
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
				arg_163_0:Play121481042(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["1072ui_story"]
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 and arg_163_1.var_.characterEffect1072ui_story == nil then
				arg_163_1.var_.characterEffect1072ui_story = var_166_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_2 = 0.200000002980232

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_2 then
				local var_166_3 = (arg_163_1.time_ - var_166_1) / var_166_2

				if arg_163_1.var_.characterEffect1072ui_story then
					local var_166_4 = Mathf.Lerp(0, 0.5, var_166_3)

					arg_163_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_163_1.var_.characterEffect1072ui_story.fillRatio = var_166_4
				end
			end

			if arg_163_1.time_ >= var_166_1 + var_166_2 and arg_163_1.time_ < var_166_1 + var_166_2 + arg_166_0 and arg_163_1.var_.characterEffect1072ui_story then
				local var_166_5 = 0.5

				arg_163_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_163_1.var_.characterEffect1072ui_story.fillRatio = var_166_5
			end

			local var_166_6 = arg_163_1.actors_["1076ui_story"]
			local var_166_7 = 0

			if var_166_7 < arg_163_1.time_ and arg_163_1.time_ <= var_166_7 + arg_166_0 and arg_163_1.var_.characterEffect1076ui_story == nil then
				arg_163_1.var_.characterEffect1076ui_story = var_166_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_8 = 0.200000002980232

			if var_166_7 <= arg_163_1.time_ and arg_163_1.time_ < var_166_7 + var_166_8 then
				local var_166_9 = (arg_163_1.time_ - var_166_7) / var_166_8

				if arg_163_1.var_.characterEffect1076ui_story then
					arg_163_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_163_1.time_ >= var_166_7 + var_166_8 and arg_163_1.time_ < var_166_7 + var_166_8 + arg_166_0 and arg_163_1.var_.characterEffect1076ui_story then
				arg_163_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_166_10 = 0
			local var_166_11 = 0.35

			if var_166_10 < arg_163_1.time_ and arg_163_1.time_ <= var_166_10 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_12 = arg_163_1:FormatText(StoryNameCfg[389].name)

				arg_163_1.leftNameTxt_.text = var_166_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_13 = arg_163_1:GetWordFromCfg(121481041)
				local var_166_14 = arg_163_1:FormatText(var_166_13.content)

				arg_163_1.text_.text = var_166_14

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_15 = 14
				local var_166_16 = utf8.len(var_166_14)
				local var_166_17 = var_166_15 <= 0 and var_166_11 or var_166_11 * (var_166_16 / var_166_15)

				if var_166_17 > 0 and var_166_11 < var_166_17 then
					arg_163_1.talkMaxDuration = var_166_17

					if var_166_17 + var_166_10 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_17 + var_166_10
					end
				end

				arg_163_1.text_.text = var_166_14
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481041", "story_v_out_121481.awb") ~= 0 then
					local var_166_18 = manager.audio:GetVoiceLength("story_v_out_121481", "121481041", "story_v_out_121481.awb") / 1000

					if var_166_18 + var_166_10 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_18 + var_166_10
					end

					if var_166_13.prefab_name ~= "" and arg_163_1.actors_[var_166_13.prefab_name] ~= nil then
						local var_166_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_13.prefab_name].transform, "story_v_out_121481", "121481041", "story_v_out_121481.awb")

						arg_163_1:RecordAudio("121481041", var_166_19)
						arg_163_1:RecordAudio("121481041", var_166_19)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_121481", "121481041", "story_v_out_121481.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_121481", "121481041", "story_v_out_121481.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_20 = math.max(var_166_11, arg_163_1.talkMaxDuration)

			if var_166_10 <= arg_163_1.time_ and arg_163_1.time_ < var_166_10 + var_166_20 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_10) / var_166_20

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_10 + var_166_20 and arg_163_1.time_ < var_166_10 + var_166_20 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play121481042 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 121481042
		arg_167_1.duration_ = 5

		SetActive(arg_167_1.tipsGo_, false)

		function arg_167_1.onSingleLineFinish_()
			arg_167_1.onSingleLineUpdate_ = nil
			arg_167_1.onSingleLineFinish_ = nil
			arg_167_1.state_ = "waiting"
		end

		function arg_167_1.playNext_(arg_169_0)
			if arg_169_0 == 1 then
				arg_167_0:Play121481043(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["1072ui_story"].transform
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 then
				arg_167_1.var_.moveOldPos1072ui_story = var_170_0.localPosition
			end

			local var_170_2 = 0.001

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_2 then
				local var_170_3 = (arg_167_1.time_ - var_170_1) / var_170_2
				local var_170_4 = Vector3.New(0, 100, 0)

				var_170_0.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos1072ui_story, var_170_4, var_170_3)

				local var_170_5 = manager.ui.mainCamera.transform.position - var_170_0.position

				var_170_0.forward = Vector3.New(var_170_5.x, var_170_5.y, var_170_5.z)

				local var_170_6 = var_170_0.localEulerAngles

				var_170_6.z = 0
				var_170_6.x = 0
				var_170_0.localEulerAngles = var_170_6
			end

			if arg_167_1.time_ >= var_170_1 + var_170_2 and arg_167_1.time_ < var_170_1 + var_170_2 + arg_170_0 then
				var_170_0.localPosition = Vector3.New(0, 100, 0)

				local var_170_7 = manager.ui.mainCamera.transform.position - var_170_0.position

				var_170_0.forward = Vector3.New(var_170_7.x, var_170_7.y, var_170_7.z)

				local var_170_8 = var_170_0.localEulerAngles

				var_170_8.z = 0
				var_170_8.x = 0
				var_170_0.localEulerAngles = var_170_8
			end

			local var_170_9 = arg_167_1.actors_["1072ui_story"]
			local var_170_10 = 0

			if var_170_10 < arg_167_1.time_ and arg_167_1.time_ <= var_170_10 + arg_170_0 and arg_167_1.var_.characterEffect1072ui_story == nil then
				arg_167_1.var_.characterEffect1072ui_story = var_170_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_11 = 0.200000002980232

			if var_170_10 <= arg_167_1.time_ and arg_167_1.time_ < var_170_10 + var_170_11 then
				local var_170_12 = (arg_167_1.time_ - var_170_10) / var_170_11

				if arg_167_1.var_.characterEffect1072ui_story then
					local var_170_13 = Mathf.Lerp(0, 0.5, var_170_12)

					arg_167_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_167_1.var_.characterEffect1072ui_story.fillRatio = var_170_13
				end
			end

			if arg_167_1.time_ >= var_170_10 + var_170_11 and arg_167_1.time_ < var_170_10 + var_170_11 + arg_170_0 and arg_167_1.var_.characterEffect1072ui_story then
				local var_170_14 = 0.5

				arg_167_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_167_1.var_.characterEffect1072ui_story.fillRatio = var_170_14
			end

			local var_170_15 = arg_167_1.actors_["1076ui_story"].transform
			local var_170_16 = 0

			if var_170_16 < arg_167_1.time_ and arg_167_1.time_ <= var_170_16 + arg_170_0 then
				arg_167_1.var_.moveOldPos1076ui_story = var_170_15.localPosition
			end

			local var_170_17 = 0.001

			if var_170_16 <= arg_167_1.time_ and arg_167_1.time_ < var_170_16 + var_170_17 then
				local var_170_18 = (arg_167_1.time_ - var_170_16) / var_170_17
				local var_170_19 = Vector3.New(0, 100, 0)

				var_170_15.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos1076ui_story, var_170_19, var_170_18)

				local var_170_20 = manager.ui.mainCamera.transform.position - var_170_15.position

				var_170_15.forward = Vector3.New(var_170_20.x, var_170_20.y, var_170_20.z)

				local var_170_21 = var_170_15.localEulerAngles

				var_170_21.z = 0
				var_170_21.x = 0
				var_170_15.localEulerAngles = var_170_21
			end

			if arg_167_1.time_ >= var_170_16 + var_170_17 and arg_167_1.time_ < var_170_16 + var_170_17 + arg_170_0 then
				var_170_15.localPosition = Vector3.New(0, 100, 0)

				local var_170_22 = manager.ui.mainCamera.transform.position - var_170_15.position

				var_170_15.forward = Vector3.New(var_170_22.x, var_170_22.y, var_170_22.z)

				local var_170_23 = var_170_15.localEulerAngles

				var_170_23.z = 0
				var_170_23.x = 0
				var_170_15.localEulerAngles = var_170_23
			end

			local var_170_24 = arg_167_1.actors_["1076ui_story"]
			local var_170_25 = 0

			if var_170_25 < arg_167_1.time_ and arg_167_1.time_ <= var_170_25 + arg_170_0 and arg_167_1.var_.characterEffect1076ui_story == nil then
				arg_167_1.var_.characterEffect1076ui_story = var_170_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_26 = 0.200000002980232

			if var_170_25 <= arg_167_1.time_ and arg_167_1.time_ < var_170_25 + var_170_26 then
				local var_170_27 = (arg_167_1.time_ - var_170_25) / var_170_26

				if arg_167_1.var_.characterEffect1076ui_story then
					local var_170_28 = Mathf.Lerp(0, 0.5, var_170_27)

					arg_167_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_167_1.var_.characterEffect1076ui_story.fillRatio = var_170_28
				end
			end

			if arg_167_1.time_ >= var_170_25 + var_170_26 and arg_167_1.time_ < var_170_25 + var_170_26 + arg_170_0 and arg_167_1.var_.characterEffect1076ui_story then
				local var_170_29 = 0.5

				arg_167_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_167_1.var_.characterEffect1076ui_story.fillRatio = var_170_29
			end

			local var_170_30 = 0
			local var_170_31 = 0.975

			if var_170_30 < arg_167_1.time_ and arg_167_1.time_ <= var_170_30 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, false)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_32 = arg_167_1:GetWordFromCfg(121481042)
				local var_170_33 = arg_167_1:FormatText(var_170_32.content)

				arg_167_1.text_.text = var_170_33

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_34 = 39
				local var_170_35 = utf8.len(var_170_33)
				local var_170_36 = var_170_34 <= 0 and var_170_31 or var_170_31 * (var_170_35 / var_170_34)

				if var_170_36 > 0 and var_170_31 < var_170_36 then
					arg_167_1.talkMaxDuration = var_170_36

					if var_170_36 + var_170_30 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_36 + var_170_30
					end
				end

				arg_167_1.text_.text = var_170_33
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)
				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_37 = math.max(var_170_31, arg_167_1.talkMaxDuration)

			if var_170_30 <= arg_167_1.time_ and arg_167_1.time_ < var_170_30 + var_170_37 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_30) / var_170_37

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_30 + var_170_37 and arg_167_1.time_ < var_170_30 + var_170_37 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play121481043 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 121481043
		arg_171_1.duration_ = 1.999999999999

		SetActive(arg_171_1.tipsGo_, false)

		function arg_171_1.onSingleLineFinish_()
			arg_171_1.onSingleLineUpdate_ = nil
			arg_171_1.onSingleLineFinish_ = nil
			arg_171_1.state_ = "waiting"
		end

		function arg_171_1.playNext_(arg_173_0)
			if arg_173_0 == 1 then
				arg_171_0:Play121481044(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["1072ui_story"].transform
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 then
				arg_171_1.var_.moveOldPos1072ui_story = var_174_0.localPosition
			end

			local var_174_2 = 0.001

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_2 then
				local var_174_3 = (arg_171_1.time_ - var_174_1) / var_174_2
				local var_174_4 = Vector3.New(0, -0.71, -6)

				var_174_0.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos1072ui_story, var_174_4, var_174_3)

				local var_174_5 = manager.ui.mainCamera.transform.position - var_174_0.position

				var_174_0.forward = Vector3.New(var_174_5.x, var_174_5.y, var_174_5.z)

				local var_174_6 = var_174_0.localEulerAngles

				var_174_6.z = 0
				var_174_6.x = 0
				var_174_0.localEulerAngles = var_174_6
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 then
				var_174_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_174_7 = manager.ui.mainCamera.transform.position - var_174_0.position

				var_174_0.forward = Vector3.New(var_174_7.x, var_174_7.y, var_174_7.z)

				local var_174_8 = var_174_0.localEulerAngles

				var_174_8.z = 0
				var_174_8.x = 0
				var_174_0.localEulerAngles = var_174_8
			end

			local var_174_9 = arg_171_1.actors_["1072ui_story"]
			local var_174_10 = 0

			if var_174_10 < arg_171_1.time_ and arg_171_1.time_ <= var_174_10 + arg_174_0 and arg_171_1.var_.characterEffect1072ui_story == nil then
				arg_171_1.var_.characterEffect1072ui_story = var_174_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_11 = 0.200000002980232

			if var_174_10 <= arg_171_1.time_ and arg_171_1.time_ < var_174_10 + var_174_11 then
				local var_174_12 = (arg_171_1.time_ - var_174_10) / var_174_11

				if arg_171_1.var_.characterEffect1072ui_story then
					arg_171_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_171_1.time_ >= var_174_10 + var_174_11 and arg_171_1.time_ < var_174_10 + var_174_11 + arg_174_0 and arg_171_1.var_.characterEffect1072ui_story then
				arg_171_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_174_13 = 0

			if var_174_13 < arg_171_1.time_ and arg_171_1.time_ <= var_174_13 + arg_174_0 then
				arg_171_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action1_1")
			end

			local var_174_14 = 0

			if var_174_14 < arg_171_1.time_ and arg_171_1.time_ <= var_174_14 + arg_174_0 then
				arg_171_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_174_15 = 0
			local var_174_16 = 0.075

			if var_174_15 < arg_171_1.time_ and arg_171_1.time_ <= var_174_15 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_17 = arg_171_1:FormatText(StoryNameCfg[379].name)

				arg_171_1.leftNameTxt_.text = var_174_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_18 = arg_171_1:GetWordFromCfg(121481043)
				local var_174_19 = arg_171_1:FormatText(var_174_18.content)

				arg_171_1.text_.text = var_174_19

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_20 = 3
				local var_174_21 = utf8.len(var_174_19)
				local var_174_22 = var_174_20 <= 0 and var_174_16 or var_174_16 * (var_174_21 / var_174_20)

				if var_174_22 > 0 and var_174_16 < var_174_22 then
					arg_171_1.talkMaxDuration = var_174_22

					if var_174_22 + var_174_15 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_22 + var_174_15
					end
				end

				arg_171_1.text_.text = var_174_19
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481043", "story_v_out_121481.awb") ~= 0 then
					local var_174_23 = manager.audio:GetVoiceLength("story_v_out_121481", "121481043", "story_v_out_121481.awb") / 1000

					if var_174_23 + var_174_15 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_23 + var_174_15
					end

					if var_174_18.prefab_name ~= "" and arg_171_1.actors_[var_174_18.prefab_name] ~= nil then
						local var_174_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_18.prefab_name].transform, "story_v_out_121481", "121481043", "story_v_out_121481.awb")

						arg_171_1:RecordAudio("121481043", var_174_24)
						arg_171_1:RecordAudio("121481043", var_174_24)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_121481", "121481043", "story_v_out_121481.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_121481", "121481043", "story_v_out_121481.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_25 = math.max(var_174_16, arg_171_1.talkMaxDuration)

			if var_174_15 <= arg_171_1.time_ and arg_171_1.time_ < var_174_15 + var_174_25 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_15) / var_174_25

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_15 + var_174_25 and arg_171_1.time_ < var_174_15 + var_174_25 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play121481044 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 121481044
		arg_175_1.duration_ = 7.999999999999

		SetActive(arg_175_1.tipsGo_, false)

		function arg_175_1.onSingleLineFinish_()
			arg_175_1.onSingleLineUpdate_ = nil
			arg_175_1.onSingleLineFinish_ = nil
			arg_175_1.state_ = "waiting"
		end

		function arg_175_1.playNext_(arg_177_0)
			if arg_177_0 == 1 then
				arg_175_0:Play121481045(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["1072ui_story"].transform
			local var_178_1 = 1.96599999815226

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 then
				arg_175_1.var_.moveOldPos1072ui_story = var_178_0.localPosition
			end

			local var_178_2 = 0.001

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2
				local var_178_4 = Vector3.New(0, 100, 0)

				var_178_0.localPosition = Vector3.Lerp(arg_175_1.var_.moveOldPos1072ui_story, var_178_4, var_178_3)

				local var_178_5 = manager.ui.mainCamera.transform.position - var_178_0.position

				var_178_0.forward = Vector3.New(var_178_5.x, var_178_5.y, var_178_5.z)

				local var_178_6 = var_178_0.localEulerAngles

				var_178_6.z = 0
				var_178_6.x = 0
				var_178_0.localEulerAngles = var_178_6
			end

			if arg_175_1.time_ >= var_178_1 + var_178_2 and arg_175_1.time_ < var_178_1 + var_178_2 + arg_178_0 then
				var_178_0.localPosition = Vector3.New(0, 100, 0)

				local var_178_7 = manager.ui.mainCamera.transform.position - var_178_0.position

				var_178_0.forward = Vector3.New(var_178_7.x, var_178_7.y, var_178_7.z)

				local var_178_8 = var_178_0.localEulerAngles

				var_178_8.z = 0
				var_178_8.x = 0
				var_178_0.localEulerAngles = var_178_8
			end

			local var_178_9 = arg_175_1.actors_["1072ui_story"]
			local var_178_10 = 1.96599999815226

			if var_178_10 < arg_175_1.time_ and arg_175_1.time_ <= var_178_10 + arg_178_0 and arg_175_1.var_.characterEffect1072ui_story == nil then
				arg_175_1.var_.characterEffect1072ui_story = var_178_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_11 = 0.034000001847744

			if var_178_10 <= arg_175_1.time_ and arg_175_1.time_ < var_178_10 + var_178_11 then
				local var_178_12 = (arg_175_1.time_ - var_178_10) / var_178_11

				if arg_175_1.var_.characterEffect1072ui_story then
					local var_178_13 = Mathf.Lerp(0, 0.5, var_178_12)

					arg_175_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_175_1.var_.characterEffect1072ui_story.fillRatio = var_178_13
				end
			end

			if arg_175_1.time_ >= var_178_10 + var_178_11 and arg_175_1.time_ < var_178_10 + var_178_11 + arg_178_0 and arg_175_1.var_.characterEffect1072ui_story then
				local var_178_14 = 0.5

				arg_175_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_175_1.var_.characterEffect1072ui_story.fillRatio = var_178_14
			end

			local var_178_15 = 0

			if var_178_15 < arg_175_1.time_ and arg_175_1.time_ <= var_178_15 + arg_178_0 then
				arg_175_1.mask_.enabled = true
				arg_175_1.mask_.raycastTarget = true

				arg_175_1:SetGaussion(false)
			end

			local var_178_16 = 2

			if var_178_15 <= arg_175_1.time_ and arg_175_1.time_ < var_178_15 + var_178_16 then
				local var_178_17 = (arg_175_1.time_ - var_178_15) / var_178_16
				local var_178_18 = Color.New(0, 0, 0)

				var_178_18.a = Mathf.Lerp(0, 1, var_178_17)
				arg_175_1.mask_.color = var_178_18
			end

			if arg_175_1.time_ >= var_178_15 + var_178_16 and arg_175_1.time_ < var_178_15 + var_178_16 + arg_178_0 then
				local var_178_19 = Color.New(0, 0, 0)

				var_178_19.a = 1
				arg_175_1.mask_.color = var_178_19
			end

			local var_178_20 = 2

			if var_178_20 < arg_175_1.time_ and arg_175_1.time_ <= var_178_20 + arg_178_0 then
				arg_175_1.mask_.enabled = true
				arg_175_1.mask_.raycastTarget = true

				arg_175_1:SetGaussion(false)
			end

			local var_178_21 = 2

			if var_178_20 <= arg_175_1.time_ and arg_175_1.time_ < var_178_20 + var_178_21 then
				local var_178_22 = (arg_175_1.time_ - var_178_20) / var_178_21
				local var_178_23 = Color.New(0, 0, 0)

				var_178_23.a = Mathf.Lerp(1, 0, var_178_22)
				arg_175_1.mask_.color = var_178_23
			end

			if arg_175_1.time_ >= var_178_20 + var_178_21 and arg_175_1.time_ < var_178_20 + var_178_21 + arg_178_0 then
				local var_178_24 = Color.New(0, 0, 0)
				local var_178_25 = 0

				arg_175_1.mask_.enabled = false
				var_178_24.a = var_178_25
				arg_175_1.mask_.color = var_178_24
			end

			local var_178_26 = "1071ui_story"

			if arg_175_1.actors_[var_178_26] == nil then
				local var_178_27 = Object.Instantiate(Asset.Load("Char/" .. var_178_26), arg_175_1.stage_.transform)

				var_178_27.name = var_178_26
				var_178_27.transform.localPosition = Vector3.New(0, 100, 0)
				arg_175_1.actors_[var_178_26] = var_178_27

				local var_178_28 = var_178_27:GetComponentInChildren(typeof(CharacterEffect))

				var_178_28.enabled = true

				local var_178_29 = GameObjectTools.GetOrAddComponent(var_178_27, typeof(DynamicBoneHelper))

				if var_178_29 then
					var_178_29:EnableDynamicBone(false)
				end

				arg_175_1:ShowWeapon(var_178_28.transform, false)

				arg_175_1.var_[var_178_26 .. "Animator"] = var_178_28.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_175_1.var_[var_178_26 .. "Animator"].applyRootMotion = true
				arg_175_1.var_[var_178_26 .. "LipSync"] = var_178_28.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_178_30 = 0

			if var_178_30 < arg_175_1.time_ and arg_175_1.time_ <= var_178_30 + arg_178_0 then
				arg_175_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_178_31 = 1.3
			local var_178_32 = 0.633333333333333

			if var_178_31 < arg_175_1.time_ and arg_175_1.time_ <= var_178_31 + arg_178_0 then
				local var_178_33 = "play"
				local var_178_34 = "effect"

				arg_175_1:AudioAction(var_178_33, var_178_34, "se_story_121_04", "se_story_121_04_door", "")
			end

			if arg_175_1.frameCnt_ <= 1 then
				arg_175_1.dialog_:SetActive(false)
			end

			local var_178_35 = 2.999999999999
			local var_178_36 = 1

			if var_178_35 < arg_175_1.time_ and arg_175_1.time_ <= var_178_35 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0

				arg_175_1.dialog_:SetActive(true)

				local var_178_37 = LeanTween.value(arg_175_1.dialog_, 0, 1, 0.3)

				var_178_37:setOnUpdate(LuaHelper.FloatAction(function(arg_179_0)
					arg_175_1.dialogCg_.alpha = arg_179_0
				end))
				var_178_37:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_175_1.dialog_)
					var_178_37:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_175_1.duration_ = arg_175_1.duration_ + 0.3

				SetActive(arg_175_1.leftNameGo_, false)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_38 = arg_175_1:GetWordFromCfg(121481044)
				local var_178_39 = arg_175_1:FormatText(var_178_38.content)

				arg_175_1.text_.text = var_178_39

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_40 = 40
				local var_178_41 = utf8.len(var_178_39)
				local var_178_42 = var_178_40 <= 0 and var_178_36 or var_178_36 * (var_178_41 / var_178_40)

				if var_178_42 > 0 and var_178_36 < var_178_42 then
					arg_175_1.talkMaxDuration = var_178_42
					var_178_35 = var_178_35 + 0.3

					if var_178_42 + var_178_35 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_42 + var_178_35
					end
				end

				arg_175_1.text_.text = var_178_39
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)
				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_43 = var_178_35 + 0.3
			local var_178_44 = math.max(var_178_36, arg_175_1.talkMaxDuration)

			if var_178_43 <= arg_175_1.time_ and arg_175_1.time_ < var_178_43 + var_178_44 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_43) / var_178_44

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_43 + var_178_44 and arg_175_1.time_ < var_178_43 + var_178_44 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play121481045 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 121481045
		arg_181_1.duration_ = 9.166

		local var_181_0 = {
			ja = 6.4,
			ko = 9.166,
			zh = 9.166
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
				arg_181_0:Play121481046(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = arg_181_1.actors_["1071ui_story"].transform
			local var_184_1 = 0

			if var_184_1 < arg_181_1.time_ and arg_181_1.time_ <= var_184_1 + arg_184_0 then
				arg_181_1.var_.moveOldPos1071ui_story = var_184_0.localPosition
			end

			local var_184_2 = 0.001

			if var_184_1 <= arg_181_1.time_ and arg_181_1.time_ < var_184_1 + var_184_2 then
				local var_184_3 = (arg_181_1.time_ - var_184_1) / var_184_2
				local var_184_4 = Vector3.New(-0.7, -1.05, -6.2)

				var_184_0.localPosition = Vector3.Lerp(arg_181_1.var_.moveOldPos1071ui_story, var_184_4, var_184_3)

				local var_184_5 = manager.ui.mainCamera.transform.position - var_184_0.position

				var_184_0.forward = Vector3.New(var_184_5.x, var_184_5.y, var_184_5.z)

				local var_184_6 = var_184_0.localEulerAngles

				var_184_6.z = 0
				var_184_6.x = 0
				var_184_0.localEulerAngles = var_184_6
			end

			if arg_181_1.time_ >= var_184_1 + var_184_2 and arg_181_1.time_ < var_184_1 + var_184_2 + arg_184_0 then
				var_184_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_184_7 = manager.ui.mainCamera.transform.position - var_184_0.position

				var_184_0.forward = Vector3.New(var_184_7.x, var_184_7.y, var_184_7.z)

				local var_184_8 = var_184_0.localEulerAngles

				var_184_8.z = 0
				var_184_8.x = 0
				var_184_0.localEulerAngles = var_184_8
			end

			local var_184_9 = arg_181_1.actors_["1071ui_story"]
			local var_184_10 = 0

			if var_184_10 < arg_181_1.time_ and arg_181_1.time_ <= var_184_10 + arg_184_0 and arg_181_1.var_.characterEffect1071ui_story == nil then
				arg_181_1.var_.characterEffect1071ui_story = var_184_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_184_11 = 0.200000002980232

			if var_184_10 <= arg_181_1.time_ and arg_181_1.time_ < var_184_10 + var_184_11 then
				local var_184_12 = (arg_181_1.time_ - var_184_10) / var_184_11

				if arg_181_1.var_.characterEffect1071ui_story then
					arg_181_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_181_1.time_ >= var_184_10 + var_184_11 and arg_181_1.time_ < var_184_10 + var_184_11 + arg_184_0 and arg_181_1.var_.characterEffect1071ui_story then
				arg_181_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_184_13 = 0

			if var_184_13 < arg_181_1.time_ and arg_181_1.time_ <= var_184_13 + arg_184_0 then
				arg_181_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action1_1")
			end

			local var_184_14 = arg_181_1.actors_["1076ui_story"].transform
			local var_184_15 = 0

			if var_184_15 < arg_181_1.time_ and arg_181_1.time_ <= var_184_15 + arg_184_0 then
				arg_181_1.var_.moveOldPos1076ui_story = var_184_14.localPosition
			end

			local var_184_16 = 0.001

			if var_184_15 <= arg_181_1.time_ and arg_181_1.time_ < var_184_15 + var_184_16 then
				local var_184_17 = (arg_181_1.time_ - var_184_15) / var_184_16
				local var_184_18 = Vector3.New(0.7, -1.06, -6.2)

				var_184_14.localPosition = Vector3.Lerp(arg_181_1.var_.moveOldPos1076ui_story, var_184_18, var_184_17)

				local var_184_19 = manager.ui.mainCamera.transform.position - var_184_14.position

				var_184_14.forward = Vector3.New(var_184_19.x, var_184_19.y, var_184_19.z)

				local var_184_20 = var_184_14.localEulerAngles

				var_184_20.z = 0
				var_184_20.x = 0
				var_184_14.localEulerAngles = var_184_20
			end

			if arg_181_1.time_ >= var_184_15 + var_184_16 and arg_181_1.time_ < var_184_15 + var_184_16 + arg_184_0 then
				var_184_14.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_184_21 = manager.ui.mainCamera.transform.position - var_184_14.position

				var_184_14.forward = Vector3.New(var_184_21.x, var_184_21.y, var_184_21.z)

				local var_184_22 = var_184_14.localEulerAngles

				var_184_22.z = 0
				var_184_22.x = 0
				var_184_14.localEulerAngles = var_184_22
			end

			local var_184_23 = arg_181_1.actors_["1076ui_story"]
			local var_184_24 = 0

			if var_184_24 < arg_181_1.time_ and arg_181_1.time_ <= var_184_24 + arg_184_0 and arg_181_1.var_.characterEffect1076ui_story == nil then
				arg_181_1.var_.characterEffect1076ui_story = var_184_23:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_184_25 = 0.200000002980232

			if var_184_24 <= arg_181_1.time_ and arg_181_1.time_ < var_184_24 + var_184_25 then
				local var_184_26 = (arg_181_1.time_ - var_184_24) / var_184_25

				if arg_181_1.var_.characterEffect1076ui_story then
					local var_184_27 = Mathf.Lerp(0, 0.5, var_184_26)

					arg_181_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_181_1.var_.characterEffect1076ui_story.fillRatio = var_184_27
				end
			end

			if arg_181_1.time_ >= var_184_24 + var_184_25 and arg_181_1.time_ < var_184_24 + var_184_25 + arg_184_0 and arg_181_1.var_.characterEffect1076ui_story then
				local var_184_28 = 0.5

				arg_181_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_181_1.var_.characterEffect1076ui_story.fillRatio = var_184_28
			end

			local var_184_29 = arg_181_1.actors_["1071ui_story"]
			local var_184_30 = 0

			if var_184_30 < arg_181_1.time_ and arg_181_1.time_ <= var_184_30 + arg_184_0 then
				if arg_181_1.var_.characterEffect1071ui_story == nil then
					arg_181_1.var_.characterEffect1071ui_story = var_184_29:GetComponentInChildren(typeof(CharacterEffect))
				end

				local var_184_31 = arg_181_1.var_.characterEffect1071ui_story

				var_184_31.imageEffect:turnOff()

				var_184_31.interferenceEffect.enabled = true
				var_184_31.interferenceEffect.noise = 0.001
				var_184_31.interferenceEffect.simTimeScale = 1
				var_184_31.interferenceEffect.geometryOutlineColor = Color.New(0.3725, 0.88, 1, 1)
			end

			local var_184_32 = arg_181_1.actors_["1071ui_story"]
			local var_184_33 = 0
			local var_184_34 = 0.2

			if var_184_33 < arg_181_1.time_ and arg_181_1.time_ <= var_184_33 + arg_184_0 then
				if arg_181_1.var_.characterEffect1071ui_story == nil then
					arg_181_1.var_.characterEffect1071ui_story = var_184_32:GetComponentInChildren(typeof(CharacterEffect))
				end

				arg_181_1.var_.characterEffect1071ui_story.imageEffect:turnOn(false)
			end

			local var_184_35 = 0
			local var_184_36 = 0.775

			if var_184_35 < arg_181_1.time_ and arg_181_1.time_ <= var_184_35 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_37 = arg_181_1:FormatText(StoryNameCfg[384].name)

				arg_181_1.leftNameTxt_.text = var_184_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_38 = arg_181_1:GetWordFromCfg(121481045)
				local var_184_39 = arg_181_1:FormatText(var_184_38.content)

				arg_181_1.text_.text = var_184_39

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_40 = 31
				local var_184_41 = utf8.len(var_184_39)
				local var_184_42 = var_184_40 <= 0 and var_184_36 or var_184_36 * (var_184_41 / var_184_40)

				if var_184_42 > 0 and var_184_36 < var_184_42 then
					arg_181_1.talkMaxDuration = var_184_42

					if var_184_42 + var_184_35 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_42 + var_184_35
					end
				end

				arg_181_1.text_.text = var_184_39
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481045", "story_v_out_121481.awb") ~= 0 then
					local var_184_43 = manager.audio:GetVoiceLength("story_v_out_121481", "121481045", "story_v_out_121481.awb") / 1000

					if var_184_43 + var_184_35 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_43 + var_184_35
					end

					if var_184_38.prefab_name ~= "" and arg_181_1.actors_[var_184_38.prefab_name] ~= nil then
						local var_184_44 = LuaForUtil.PlayVoiceWithCriLipsync(arg_181_1.actors_[var_184_38.prefab_name].transform, "story_v_out_121481", "121481045", "story_v_out_121481.awb")

						arg_181_1:RecordAudio("121481045", var_184_44)
						arg_181_1:RecordAudio("121481045", var_184_44)
					else
						arg_181_1:AudioAction("play", "voice", "story_v_out_121481", "121481045", "story_v_out_121481.awb")
					end

					arg_181_1:RecordHistoryTalkVoice("story_v_out_121481", "121481045", "story_v_out_121481.awb")
				end

				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_45 = math.max(var_184_36, arg_181_1.talkMaxDuration)

			if var_184_35 <= arg_181_1.time_ and arg_181_1.time_ < var_184_35 + var_184_45 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_35) / var_184_45

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_35 + var_184_45 and arg_181_1.time_ < var_184_35 + var_184_45 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play121481046 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 121481046
		arg_185_1.duration_ = 9.166

		local var_185_0 = {
			ja = 9.166,
			ko = 4.666,
			zh = 4.666
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
				arg_185_0:Play121481047(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = arg_185_1.actors_["1076ui_story"]
			local var_188_1 = 0

			if var_188_1 < arg_185_1.time_ and arg_185_1.time_ <= var_188_1 + arg_188_0 and arg_185_1.var_.characterEffect1076ui_story == nil then
				arg_185_1.var_.characterEffect1076ui_story = var_188_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_2 = 0.200000002980232

			if var_188_1 <= arg_185_1.time_ and arg_185_1.time_ < var_188_1 + var_188_2 then
				local var_188_3 = (arg_185_1.time_ - var_188_1) / var_188_2

				if arg_185_1.var_.characterEffect1076ui_story then
					arg_185_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_185_1.time_ >= var_188_1 + var_188_2 and arg_185_1.time_ < var_188_1 + var_188_2 + arg_188_0 and arg_185_1.var_.characterEffect1076ui_story then
				arg_185_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_188_4 = arg_185_1.actors_["1071ui_story"]
			local var_188_5 = 0

			if var_188_5 < arg_185_1.time_ and arg_185_1.time_ <= var_188_5 + arg_188_0 and arg_185_1.var_.characterEffect1071ui_story == nil then
				arg_185_1.var_.characterEffect1071ui_story = var_188_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_6 = 0.200000002980232

			if var_188_5 <= arg_185_1.time_ and arg_185_1.time_ < var_188_5 + var_188_6 then
				local var_188_7 = (arg_185_1.time_ - var_188_5) / var_188_6

				if arg_185_1.var_.characterEffect1071ui_story then
					local var_188_8 = Mathf.Lerp(0, 0.5, var_188_7)

					arg_185_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_185_1.var_.characterEffect1071ui_story.fillRatio = var_188_8
				end
			end

			if arg_185_1.time_ >= var_188_5 + var_188_6 and arg_185_1.time_ < var_188_5 + var_188_6 + arg_188_0 and arg_185_1.var_.characterEffect1071ui_story then
				local var_188_9 = 0.5

				arg_185_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_185_1.var_.characterEffect1071ui_story.fillRatio = var_188_9
			end

			local var_188_10 = 0
			local var_188_11 = 0.4

			if var_188_10 < arg_185_1.time_ and arg_185_1.time_ <= var_188_10 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_12 = arg_185_1:FormatText(StoryNameCfg[389].name)

				arg_185_1.leftNameTxt_.text = var_188_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_13 = arg_185_1:GetWordFromCfg(121481046)
				local var_188_14 = arg_185_1:FormatText(var_188_13.content)

				arg_185_1.text_.text = var_188_14

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_15 = 16
				local var_188_16 = utf8.len(var_188_14)
				local var_188_17 = var_188_15 <= 0 and var_188_11 or var_188_11 * (var_188_16 / var_188_15)

				if var_188_17 > 0 and var_188_11 < var_188_17 then
					arg_185_1.talkMaxDuration = var_188_17

					if var_188_17 + var_188_10 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_17 + var_188_10
					end
				end

				arg_185_1.text_.text = var_188_14
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481046", "story_v_out_121481.awb") ~= 0 then
					local var_188_18 = manager.audio:GetVoiceLength("story_v_out_121481", "121481046", "story_v_out_121481.awb") / 1000

					if var_188_18 + var_188_10 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_18 + var_188_10
					end

					if var_188_13.prefab_name ~= "" and arg_185_1.actors_[var_188_13.prefab_name] ~= nil then
						local var_188_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_13.prefab_name].transform, "story_v_out_121481", "121481046", "story_v_out_121481.awb")

						arg_185_1:RecordAudio("121481046", var_188_19)
						arg_185_1:RecordAudio("121481046", var_188_19)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_121481", "121481046", "story_v_out_121481.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_121481", "121481046", "story_v_out_121481.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_20 = math.max(var_188_11, arg_185_1.talkMaxDuration)

			if var_188_10 <= arg_185_1.time_ and arg_185_1.time_ < var_188_10 + var_188_20 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_10) / var_188_20

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_10 + var_188_20 and arg_185_1.time_ < var_188_10 + var_188_20 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play121481047 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 121481047
		arg_189_1.duration_ = 7.3

		local var_189_0 = {
			ja = 2.066,
			ko = 7.3,
			zh = 7.3
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
				arg_189_0:Play121481048(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = arg_189_1.actors_["1076ui_story"]
			local var_192_1 = 0

			if var_192_1 < arg_189_1.time_ and arg_189_1.time_ <= var_192_1 + arg_192_0 and arg_189_1.var_.characterEffect1076ui_story == nil then
				arg_189_1.var_.characterEffect1076ui_story = var_192_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_192_2 = 0.200000002980232

			if var_192_1 <= arg_189_1.time_ and arg_189_1.time_ < var_192_1 + var_192_2 then
				local var_192_3 = (arg_189_1.time_ - var_192_1) / var_192_2

				if arg_189_1.var_.characterEffect1076ui_story then
					local var_192_4 = Mathf.Lerp(0, 0.5, var_192_3)

					arg_189_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_189_1.var_.characterEffect1076ui_story.fillRatio = var_192_4
				end
			end

			if arg_189_1.time_ >= var_192_1 + var_192_2 and arg_189_1.time_ < var_192_1 + var_192_2 + arg_192_0 and arg_189_1.var_.characterEffect1076ui_story then
				local var_192_5 = 0.5

				arg_189_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_189_1.var_.characterEffect1076ui_story.fillRatio = var_192_5
			end

			local var_192_6 = arg_189_1.actors_["1071ui_story"]
			local var_192_7 = 0

			if var_192_7 < arg_189_1.time_ and arg_189_1.time_ <= var_192_7 + arg_192_0 and arg_189_1.var_.characterEffect1071ui_story == nil then
				arg_189_1.var_.characterEffect1071ui_story = var_192_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_192_8 = 0.200000002980232

			if var_192_7 <= arg_189_1.time_ and arg_189_1.time_ < var_192_7 + var_192_8 then
				local var_192_9 = (arg_189_1.time_ - var_192_7) / var_192_8

				if arg_189_1.var_.characterEffect1071ui_story then
					arg_189_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_189_1.time_ >= var_192_7 + var_192_8 and arg_189_1.time_ < var_192_7 + var_192_8 + arg_192_0 and arg_189_1.var_.characterEffect1071ui_story then
				arg_189_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_192_10 = 0
			local var_192_11 = 0.475

			if var_192_10 < arg_189_1.time_ and arg_189_1.time_ <= var_192_10 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_12 = arg_189_1:FormatText(StoryNameCfg[384].name)

				arg_189_1.leftNameTxt_.text = var_192_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_13 = arg_189_1:GetWordFromCfg(121481047)
				local var_192_14 = arg_189_1:FormatText(var_192_13.content)

				arg_189_1.text_.text = var_192_14

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_15 = 19
				local var_192_16 = utf8.len(var_192_14)
				local var_192_17 = var_192_15 <= 0 and var_192_11 or var_192_11 * (var_192_16 / var_192_15)

				if var_192_17 > 0 and var_192_11 < var_192_17 then
					arg_189_1.talkMaxDuration = var_192_17

					if var_192_17 + var_192_10 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_17 + var_192_10
					end
				end

				arg_189_1.text_.text = var_192_14
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481047", "story_v_out_121481.awb") ~= 0 then
					local var_192_18 = manager.audio:GetVoiceLength("story_v_out_121481", "121481047", "story_v_out_121481.awb") / 1000

					if var_192_18 + var_192_10 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_18 + var_192_10
					end

					if var_192_13.prefab_name ~= "" and arg_189_1.actors_[var_192_13.prefab_name] ~= nil then
						local var_192_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_13.prefab_name].transform, "story_v_out_121481", "121481047", "story_v_out_121481.awb")

						arg_189_1:RecordAudio("121481047", var_192_19)
						arg_189_1:RecordAudio("121481047", var_192_19)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_out_121481", "121481047", "story_v_out_121481.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_out_121481", "121481047", "story_v_out_121481.awb")
				end

				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_20 = math.max(var_192_11, arg_189_1.talkMaxDuration)

			if var_192_10 <= arg_189_1.time_ and arg_189_1.time_ < var_192_10 + var_192_20 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_10) / var_192_20

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_10 + var_192_20 and arg_189_1.time_ < var_192_10 + var_192_20 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play121481048 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 121481048
		arg_193_1.duration_ = 4.966

		local var_193_0 = {
			ja = 4.966,
			ko = 3.133,
			zh = 3.133
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
				arg_193_0:Play121481049(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = arg_193_1.actors_["1076ui_story"]
			local var_196_1 = 0

			if var_196_1 < arg_193_1.time_ and arg_193_1.time_ <= var_196_1 + arg_196_0 and arg_193_1.var_.characterEffect1076ui_story == nil then
				arg_193_1.var_.characterEffect1076ui_story = var_196_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_2 = 0.200000002980232

			if var_196_1 <= arg_193_1.time_ and arg_193_1.time_ < var_196_1 + var_196_2 then
				local var_196_3 = (arg_193_1.time_ - var_196_1) / var_196_2

				if arg_193_1.var_.characterEffect1076ui_story then
					arg_193_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_193_1.time_ >= var_196_1 + var_196_2 and arg_193_1.time_ < var_196_1 + var_196_2 + arg_196_0 and arg_193_1.var_.characterEffect1076ui_story then
				arg_193_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_196_4 = arg_193_1.actors_["1071ui_story"]
			local var_196_5 = 0

			if var_196_5 < arg_193_1.time_ and arg_193_1.time_ <= var_196_5 + arg_196_0 and arg_193_1.var_.characterEffect1071ui_story == nil then
				arg_193_1.var_.characterEffect1071ui_story = var_196_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_6 = 0.200000002980232

			if var_196_5 <= arg_193_1.time_ and arg_193_1.time_ < var_196_5 + var_196_6 then
				local var_196_7 = (arg_193_1.time_ - var_196_5) / var_196_6

				if arg_193_1.var_.characterEffect1071ui_story then
					local var_196_8 = Mathf.Lerp(0, 0.5, var_196_7)

					arg_193_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_193_1.var_.characterEffect1071ui_story.fillRatio = var_196_8
				end
			end

			if arg_193_1.time_ >= var_196_5 + var_196_6 and arg_193_1.time_ < var_196_5 + var_196_6 + arg_196_0 and arg_193_1.var_.characterEffect1071ui_story then
				local var_196_9 = 0.5

				arg_193_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_193_1.var_.characterEffect1071ui_story.fillRatio = var_196_9
			end

			local var_196_10 = 0
			local var_196_11 = 0.3

			if var_196_10 < arg_193_1.time_ and arg_193_1.time_ <= var_196_10 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_12 = arg_193_1:FormatText(StoryNameCfg[389].name)

				arg_193_1.leftNameTxt_.text = var_196_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_13 = arg_193_1:GetWordFromCfg(121481048)
				local var_196_14 = arg_193_1:FormatText(var_196_13.content)

				arg_193_1.text_.text = var_196_14

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_15 = 12
				local var_196_16 = utf8.len(var_196_14)
				local var_196_17 = var_196_15 <= 0 and var_196_11 or var_196_11 * (var_196_16 / var_196_15)

				if var_196_17 > 0 and var_196_11 < var_196_17 then
					arg_193_1.talkMaxDuration = var_196_17

					if var_196_17 + var_196_10 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_17 + var_196_10
					end
				end

				arg_193_1.text_.text = var_196_14
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481048", "story_v_out_121481.awb") ~= 0 then
					local var_196_18 = manager.audio:GetVoiceLength("story_v_out_121481", "121481048", "story_v_out_121481.awb") / 1000

					if var_196_18 + var_196_10 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_18 + var_196_10
					end

					if var_196_13.prefab_name ~= "" and arg_193_1.actors_[var_196_13.prefab_name] ~= nil then
						local var_196_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_193_1.actors_[var_196_13.prefab_name].transform, "story_v_out_121481", "121481048", "story_v_out_121481.awb")

						arg_193_1:RecordAudio("121481048", var_196_19)
						arg_193_1:RecordAudio("121481048", var_196_19)
					else
						arg_193_1:AudioAction("play", "voice", "story_v_out_121481", "121481048", "story_v_out_121481.awb")
					end

					arg_193_1:RecordHistoryTalkVoice("story_v_out_121481", "121481048", "story_v_out_121481.awb")
				end

				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_20 = math.max(var_196_11, arg_193_1.talkMaxDuration)

			if var_196_10 <= arg_193_1.time_ and arg_193_1.time_ < var_196_10 + var_196_20 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_10) / var_196_20

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_10 + var_196_20 and arg_193_1.time_ < var_196_10 + var_196_20 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play121481049 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 121481049
		arg_197_1.duration_ = 7.733

		local var_197_0 = {
			ja = 7.733,
			ko = 5.466,
			zh = 5.466
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
				arg_197_0:Play121481050(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = arg_197_1.actors_["1071ui_story"]
			local var_200_1 = 0

			if var_200_1 < arg_197_1.time_ and arg_197_1.time_ <= var_200_1 + arg_200_0 and arg_197_1.var_.characterEffect1071ui_story == nil then
				arg_197_1.var_.characterEffect1071ui_story = var_200_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_200_2 = 0.200000002980232

			if var_200_1 <= arg_197_1.time_ and arg_197_1.time_ < var_200_1 + var_200_2 then
				local var_200_3 = (arg_197_1.time_ - var_200_1) / var_200_2

				if arg_197_1.var_.characterEffect1071ui_story then
					arg_197_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_197_1.time_ >= var_200_1 + var_200_2 and arg_197_1.time_ < var_200_1 + var_200_2 + arg_200_0 and arg_197_1.var_.characterEffect1071ui_story then
				arg_197_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_200_4 = 0

			if var_200_4 < arg_197_1.time_ and arg_197_1.time_ <= var_200_4 + arg_200_0 then
				arg_197_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action2_1")
			end

			local var_200_5 = arg_197_1.actors_["1076ui_story"]
			local var_200_6 = 0

			if var_200_6 < arg_197_1.time_ and arg_197_1.time_ <= var_200_6 + arg_200_0 and arg_197_1.var_.characterEffect1076ui_story == nil then
				arg_197_1.var_.characterEffect1076ui_story = var_200_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_200_7 = 0.200000002980232

			if var_200_6 <= arg_197_1.time_ and arg_197_1.time_ < var_200_6 + var_200_7 then
				local var_200_8 = (arg_197_1.time_ - var_200_6) / var_200_7

				if arg_197_1.var_.characterEffect1076ui_story then
					local var_200_9 = Mathf.Lerp(0, 0.5, var_200_8)

					arg_197_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_197_1.var_.characterEffect1076ui_story.fillRatio = var_200_9
				end
			end

			if arg_197_1.time_ >= var_200_6 + var_200_7 and arg_197_1.time_ < var_200_6 + var_200_7 + arg_200_0 and arg_197_1.var_.characterEffect1076ui_story then
				local var_200_10 = 0.5

				arg_197_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_197_1.var_.characterEffect1076ui_story.fillRatio = var_200_10
			end

			local var_200_11 = 0
			local var_200_12 = 0.625

			if var_200_11 < arg_197_1.time_ and arg_197_1.time_ <= var_200_11 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_13 = arg_197_1:FormatText(StoryNameCfg[384].name)

				arg_197_1.leftNameTxt_.text = var_200_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_14 = arg_197_1:GetWordFromCfg(121481049)
				local var_200_15 = arg_197_1:FormatText(var_200_14.content)

				arg_197_1.text_.text = var_200_15

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_16 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481049", "story_v_out_121481.awb") ~= 0 then
					local var_200_19 = manager.audio:GetVoiceLength("story_v_out_121481", "121481049", "story_v_out_121481.awb") / 1000

					if var_200_19 + var_200_11 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_19 + var_200_11
					end

					if var_200_14.prefab_name ~= "" and arg_197_1.actors_[var_200_14.prefab_name] ~= nil then
						local var_200_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_197_1.actors_[var_200_14.prefab_name].transform, "story_v_out_121481", "121481049", "story_v_out_121481.awb")

						arg_197_1:RecordAudio("121481049", var_200_20)
						arg_197_1:RecordAudio("121481049", var_200_20)
					else
						arg_197_1:AudioAction("play", "voice", "story_v_out_121481", "121481049", "story_v_out_121481.awb")
					end

					arg_197_1:RecordHistoryTalkVoice("story_v_out_121481", "121481049", "story_v_out_121481.awb")
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
	Play121481050 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 121481050
		arg_201_1.duration_ = 12.7

		local var_201_0 = {
			ja = 12.7,
			ko = 7.8,
			zh = 7.8
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
				arg_201_0:Play121481051(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = 0

			if var_204_0 < arg_201_1.time_ and arg_201_1.time_ <= var_204_0 + arg_204_0 then
				arg_201_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action2_2")
			end

			local var_204_1 = 0
			local var_204_2 = 1.025

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_3 = arg_201_1:FormatText(StoryNameCfg[384].name)

				arg_201_1.leftNameTxt_.text = var_204_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_4 = arg_201_1:GetWordFromCfg(121481050)
				local var_204_5 = arg_201_1:FormatText(var_204_4.content)

				arg_201_1.text_.text = var_204_5

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_6 = 41
				local var_204_7 = utf8.len(var_204_5)
				local var_204_8 = var_204_6 <= 0 and var_204_2 or var_204_2 * (var_204_7 / var_204_6)

				if var_204_8 > 0 and var_204_2 < var_204_8 then
					arg_201_1.talkMaxDuration = var_204_8

					if var_204_8 + var_204_1 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_8 + var_204_1
					end
				end

				arg_201_1.text_.text = var_204_5
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481050", "story_v_out_121481.awb") ~= 0 then
					local var_204_9 = manager.audio:GetVoiceLength("story_v_out_121481", "121481050", "story_v_out_121481.awb") / 1000

					if var_204_9 + var_204_1 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_9 + var_204_1
					end

					if var_204_4.prefab_name ~= "" and arg_201_1.actors_[var_204_4.prefab_name] ~= nil then
						local var_204_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_4.prefab_name].transform, "story_v_out_121481", "121481050", "story_v_out_121481.awb")

						arg_201_1:RecordAudio("121481050", var_204_10)
						arg_201_1:RecordAudio("121481050", var_204_10)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_out_121481", "121481050", "story_v_out_121481.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_out_121481", "121481050", "story_v_out_121481.awb")
				end

				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_11 = math.max(var_204_2, arg_201_1.talkMaxDuration)

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_11 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_1) / var_204_11

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_1 + var_204_11 and arg_201_1.time_ < var_204_1 + var_204_11 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play121481051 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 121481051
		arg_205_1.duration_ = 11.9

		local var_205_0 = {
			ja = 11.9,
			ko = 8,
			zh = 8
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
				arg_205_0:Play121481052(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = 0
			local var_208_1 = 0.95

			if var_208_0 < arg_205_1.time_ and arg_205_1.time_ <= var_208_0 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_2 = arg_205_1:FormatText(StoryNameCfg[384].name)

				arg_205_1.leftNameTxt_.text = var_208_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_3 = arg_205_1:GetWordFromCfg(121481051)
				local var_208_4 = arg_205_1:FormatText(var_208_3.content)

				arg_205_1.text_.text = var_208_4

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_5 = 38
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

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481051", "story_v_out_121481.awb") ~= 0 then
					local var_208_8 = manager.audio:GetVoiceLength("story_v_out_121481", "121481051", "story_v_out_121481.awb") / 1000

					if var_208_8 + var_208_0 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_8 + var_208_0
					end

					if var_208_3.prefab_name ~= "" and arg_205_1.actors_[var_208_3.prefab_name] ~= nil then
						local var_208_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_3.prefab_name].transform, "story_v_out_121481", "121481051", "story_v_out_121481.awb")

						arg_205_1:RecordAudio("121481051", var_208_9)
						arg_205_1:RecordAudio("121481051", var_208_9)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_121481", "121481051", "story_v_out_121481.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_121481", "121481051", "story_v_out_121481.awb")
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
	Play121481052 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 121481052
		arg_209_1.duration_ = 10.8

		local var_209_0 = {
			ja = 10.8,
			ko = 9.1,
			zh = 9.1
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
				arg_209_0:Play121481053(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = 0
			local var_212_1 = 1.025

			if var_212_0 < arg_209_1.time_ and arg_209_1.time_ <= var_212_0 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_2 = arg_209_1:FormatText(StoryNameCfg[384].name)

				arg_209_1.leftNameTxt_.text = var_212_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_3 = arg_209_1:GetWordFromCfg(121481052)
				local var_212_4 = arg_209_1:FormatText(var_212_3.content)

				arg_209_1.text_.text = var_212_4

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_5 = 41
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

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481052", "story_v_out_121481.awb") ~= 0 then
					local var_212_8 = manager.audio:GetVoiceLength("story_v_out_121481", "121481052", "story_v_out_121481.awb") / 1000

					if var_212_8 + var_212_0 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_8 + var_212_0
					end

					if var_212_3.prefab_name ~= "" and arg_209_1.actors_[var_212_3.prefab_name] ~= nil then
						local var_212_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_3.prefab_name].transform, "story_v_out_121481", "121481052", "story_v_out_121481.awb")

						arg_209_1:RecordAudio("121481052", var_212_9)
						arg_209_1:RecordAudio("121481052", var_212_9)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_out_121481", "121481052", "story_v_out_121481.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_out_121481", "121481052", "story_v_out_121481.awb")
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
	Play121481053 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 121481053
		arg_213_1.duration_ = 8.633

		local var_213_0 = {
			ja = 8.633,
			ko = 5.5,
			zh = 5.5
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
				arg_213_0:Play121481054(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["1076ui_story"]
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 and arg_213_1.var_.characterEffect1076ui_story == nil then
				arg_213_1.var_.characterEffect1076ui_story = var_216_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_2 = 0.200000002980232

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_2 then
				local var_216_3 = (arg_213_1.time_ - var_216_1) / var_216_2

				if arg_213_1.var_.characterEffect1076ui_story then
					arg_213_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_213_1.time_ >= var_216_1 + var_216_2 and arg_213_1.time_ < var_216_1 + var_216_2 + arg_216_0 and arg_213_1.var_.characterEffect1076ui_story then
				arg_213_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_216_4 = arg_213_1.actors_["1071ui_story"]
			local var_216_5 = 0

			if var_216_5 < arg_213_1.time_ and arg_213_1.time_ <= var_216_5 + arg_216_0 and arg_213_1.var_.characterEffect1071ui_story == nil then
				arg_213_1.var_.characterEffect1071ui_story = var_216_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_6 = 0.200000002980232

			if var_216_5 <= arg_213_1.time_ and arg_213_1.time_ < var_216_5 + var_216_6 then
				local var_216_7 = (arg_213_1.time_ - var_216_5) / var_216_6

				if arg_213_1.var_.characterEffect1071ui_story then
					local var_216_8 = Mathf.Lerp(0, 0.5, var_216_7)

					arg_213_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_213_1.var_.characterEffect1071ui_story.fillRatio = var_216_8
				end
			end

			if arg_213_1.time_ >= var_216_5 + var_216_6 and arg_213_1.time_ < var_216_5 + var_216_6 + arg_216_0 and arg_213_1.var_.characterEffect1071ui_story then
				local var_216_9 = 0.5

				arg_213_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_213_1.var_.characterEffect1071ui_story.fillRatio = var_216_9
			end

			local var_216_10 = 0
			local var_216_11 = 0.525

			if var_216_10 < arg_213_1.time_ and arg_213_1.time_ <= var_216_10 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, true)

				local var_216_12 = arg_213_1:FormatText(StoryNameCfg[389].name)

				arg_213_1.leftNameTxt_.text = var_216_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_213_1.leftNameTxt_.transform)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1.leftNameTxt_.text)
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_13 = arg_213_1:GetWordFromCfg(121481053)
				local var_216_14 = arg_213_1:FormatText(var_216_13.content)

				arg_213_1.text_.text = var_216_14

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_15 = 20
				local var_216_16 = utf8.len(var_216_14)
				local var_216_17 = var_216_15 <= 0 and var_216_11 or var_216_11 * (var_216_16 / var_216_15)

				if var_216_17 > 0 and var_216_11 < var_216_17 then
					arg_213_1.talkMaxDuration = var_216_17

					if var_216_17 + var_216_10 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_17 + var_216_10
					end
				end

				arg_213_1.text_.text = var_216_14
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481053", "story_v_out_121481.awb") ~= 0 then
					local var_216_18 = manager.audio:GetVoiceLength("story_v_out_121481", "121481053", "story_v_out_121481.awb") / 1000

					if var_216_18 + var_216_10 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_18 + var_216_10
					end

					if var_216_13.prefab_name ~= "" and arg_213_1.actors_[var_216_13.prefab_name] ~= nil then
						local var_216_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_213_1.actors_[var_216_13.prefab_name].transform, "story_v_out_121481", "121481053", "story_v_out_121481.awb")

						arg_213_1:RecordAudio("121481053", var_216_19)
						arg_213_1:RecordAudio("121481053", var_216_19)
					else
						arg_213_1:AudioAction("play", "voice", "story_v_out_121481", "121481053", "story_v_out_121481.awb")
					end

					arg_213_1:RecordHistoryTalkVoice("story_v_out_121481", "121481053", "story_v_out_121481.awb")
				end

				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_20 = math.max(var_216_11, arg_213_1.talkMaxDuration)

			if var_216_10 <= arg_213_1.time_ and arg_213_1.time_ < var_216_10 + var_216_20 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_10) / var_216_20

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_10 + var_216_20 and arg_213_1.time_ < var_216_10 + var_216_20 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play121481054 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 121481054
		arg_217_1.duration_ = 5

		SetActive(arg_217_1.tipsGo_, false)

		function arg_217_1.onSingleLineFinish_()
			arg_217_1.onSingleLineUpdate_ = nil
			arg_217_1.onSingleLineFinish_ = nil
			arg_217_1.state_ = "waiting"
		end

		function arg_217_1.playNext_(arg_219_0)
			if arg_219_0 == 1 then
				arg_217_0:Play121481055(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = arg_217_1.actors_["1076ui_story"]
			local var_220_1 = 0

			if var_220_1 < arg_217_1.time_ and arg_217_1.time_ <= var_220_1 + arg_220_0 and arg_217_1.var_.characterEffect1076ui_story == nil then
				arg_217_1.var_.characterEffect1076ui_story = var_220_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_220_2 = 0.200000002980232

			if var_220_1 <= arg_217_1.time_ and arg_217_1.time_ < var_220_1 + var_220_2 then
				local var_220_3 = (arg_217_1.time_ - var_220_1) / var_220_2

				if arg_217_1.var_.characterEffect1076ui_story then
					local var_220_4 = Mathf.Lerp(0, 0.5, var_220_3)

					arg_217_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_217_1.var_.characterEffect1076ui_story.fillRatio = var_220_4
				end
			end

			if arg_217_1.time_ >= var_220_1 + var_220_2 and arg_217_1.time_ < var_220_1 + var_220_2 + arg_220_0 and arg_217_1.var_.characterEffect1076ui_story then
				local var_220_5 = 0.5

				arg_217_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_217_1.var_.characterEffect1076ui_story.fillRatio = var_220_5
			end

			local var_220_6 = 0
			local var_220_7 = 0.7

			if var_220_6 < arg_217_1.time_ and arg_217_1.time_ <= var_220_6 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, false)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_8 = arg_217_1:GetWordFromCfg(121481054)
				local var_220_9 = arg_217_1:FormatText(var_220_8.content)

				arg_217_1.text_.text = var_220_9

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_10 = 28
				local var_220_11 = utf8.len(var_220_9)
				local var_220_12 = var_220_10 <= 0 and var_220_7 or var_220_7 * (var_220_11 / var_220_10)

				if var_220_12 > 0 and var_220_7 < var_220_12 then
					arg_217_1.talkMaxDuration = var_220_12

					if var_220_12 + var_220_6 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_12 + var_220_6
					end
				end

				arg_217_1.text_.text = var_220_9
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)
				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_13 = math.max(var_220_7, arg_217_1.talkMaxDuration)

			if var_220_6 <= arg_217_1.time_ and arg_217_1.time_ < var_220_6 + var_220_13 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_6) / var_220_13

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_6 + var_220_13 and arg_217_1.time_ < var_220_6 + var_220_13 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play121481055 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 121481055
		arg_221_1.duration_ = 6.1

		local var_221_0 = {
			ja = 6.1,
			ko = 5.5,
			zh = 5.5
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
				arg_221_0:Play121481056(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = arg_221_1.actors_["1076ui_story"]
			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 and arg_221_1.var_.characterEffect1076ui_story == nil then
				arg_221_1.var_.characterEffect1076ui_story = var_224_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_224_2 = 0.200000002980232

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_2 then
				local var_224_3 = (arg_221_1.time_ - var_224_1) / var_224_2

				if arg_221_1.var_.characterEffect1076ui_story then
					arg_221_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_221_1.time_ >= var_224_1 + var_224_2 and arg_221_1.time_ < var_224_1 + var_224_2 + arg_224_0 and arg_221_1.var_.characterEffect1076ui_story then
				arg_221_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_224_4 = 0

			if var_224_4 < arg_221_1.time_ and arg_221_1.time_ <= var_224_4 + arg_224_0 then
				arg_221_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action3_1")
			end

			local var_224_5 = 0

			if var_224_5 < arg_221_1.time_ and arg_221_1.time_ <= var_224_5 + arg_224_0 then
				arg_221_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_224_6 = 0
			local var_224_7 = 0.525

			if var_224_6 < arg_221_1.time_ and arg_221_1.time_ <= var_224_6 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_8 = arg_221_1:FormatText(StoryNameCfg[389].name)

				arg_221_1.leftNameTxt_.text = var_224_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_9 = arg_221_1:GetWordFromCfg(121481055)
				local var_224_10 = arg_221_1:FormatText(var_224_9.content)

				arg_221_1.text_.text = var_224_10

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_11 = 21
				local var_224_12 = utf8.len(var_224_10)
				local var_224_13 = var_224_11 <= 0 and var_224_7 or var_224_7 * (var_224_12 / var_224_11)

				if var_224_13 > 0 and var_224_7 < var_224_13 then
					arg_221_1.talkMaxDuration = var_224_13

					if var_224_13 + var_224_6 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_13 + var_224_6
					end
				end

				arg_221_1.text_.text = var_224_10
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481055", "story_v_out_121481.awb") ~= 0 then
					local var_224_14 = manager.audio:GetVoiceLength("story_v_out_121481", "121481055", "story_v_out_121481.awb") / 1000

					if var_224_14 + var_224_6 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_14 + var_224_6
					end

					if var_224_9.prefab_name ~= "" and arg_221_1.actors_[var_224_9.prefab_name] ~= nil then
						local var_224_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_9.prefab_name].transform, "story_v_out_121481", "121481055", "story_v_out_121481.awb")

						arg_221_1:RecordAudio("121481055", var_224_15)
						arg_221_1:RecordAudio("121481055", var_224_15)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_out_121481", "121481055", "story_v_out_121481.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_out_121481", "121481055", "story_v_out_121481.awb")
				end

				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_16 = math.max(var_224_7, arg_221_1.talkMaxDuration)

			if var_224_6 <= arg_221_1.time_ and arg_221_1.time_ < var_224_6 + var_224_16 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_6) / var_224_16

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_6 + var_224_16 and arg_221_1.time_ < var_224_6 + var_224_16 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play121481056 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 121481056
		arg_225_1.duration_ = 11.9

		local var_225_0 = {
			ja = 10.566,
			ko = 11.9,
			zh = 11.9
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
				arg_225_0:Play121481057(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = arg_225_1.actors_["1071ui_story"]
			local var_228_1 = 0

			if var_228_1 < arg_225_1.time_ and arg_225_1.time_ <= var_228_1 + arg_228_0 and arg_225_1.var_.characterEffect1071ui_story == nil then
				arg_225_1.var_.characterEffect1071ui_story = var_228_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_228_2 = 0.200000002980232

			if var_228_1 <= arg_225_1.time_ and arg_225_1.time_ < var_228_1 + var_228_2 then
				local var_228_3 = (arg_225_1.time_ - var_228_1) / var_228_2

				if arg_225_1.var_.characterEffect1071ui_story then
					arg_225_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_225_1.time_ >= var_228_1 + var_228_2 and arg_225_1.time_ < var_228_1 + var_228_2 + arg_228_0 and arg_225_1.var_.characterEffect1071ui_story then
				arg_225_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_228_4 = 0

			if var_228_4 < arg_225_1.time_ and arg_225_1.time_ <= var_228_4 + arg_228_0 then
				arg_225_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action6_1")
			end

			local var_228_5 = arg_225_1.actors_["1076ui_story"]
			local var_228_6 = 0

			if var_228_6 < arg_225_1.time_ and arg_225_1.time_ <= var_228_6 + arg_228_0 and arg_225_1.var_.characterEffect1076ui_story == nil then
				arg_225_1.var_.characterEffect1076ui_story = var_228_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_228_7 = 0.200000002980232

			if var_228_6 <= arg_225_1.time_ and arg_225_1.time_ < var_228_6 + var_228_7 then
				local var_228_8 = (arg_225_1.time_ - var_228_6) / var_228_7

				if arg_225_1.var_.characterEffect1076ui_story then
					local var_228_9 = Mathf.Lerp(0, 0.5, var_228_8)

					arg_225_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_225_1.var_.characterEffect1076ui_story.fillRatio = var_228_9
				end
			end

			if arg_225_1.time_ >= var_228_6 + var_228_7 and arg_225_1.time_ < var_228_6 + var_228_7 + arg_228_0 and arg_225_1.var_.characterEffect1076ui_story then
				local var_228_10 = 0.5

				arg_225_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_225_1.var_.characterEffect1076ui_story.fillRatio = var_228_10
			end

			local var_228_11 = 0
			local var_228_12 = 1

			if var_228_11 < arg_225_1.time_ and arg_225_1.time_ <= var_228_11 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_13 = arg_225_1:FormatText(StoryNameCfg[384].name)

				arg_225_1.leftNameTxt_.text = var_228_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_14 = arg_225_1:GetWordFromCfg(121481056)
				local var_228_15 = arg_225_1:FormatText(var_228_14.content)

				arg_225_1.text_.text = var_228_15

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_16 = 40
				local var_228_17 = utf8.len(var_228_15)
				local var_228_18 = var_228_16 <= 0 and var_228_12 or var_228_12 * (var_228_17 / var_228_16)

				if var_228_18 > 0 and var_228_12 < var_228_18 then
					arg_225_1.talkMaxDuration = var_228_18

					if var_228_18 + var_228_11 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_18 + var_228_11
					end
				end

				arg_225_1.text_.text = var_228_15
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481056", "story_v_out_121481.awb") ~= 0 then
					local var_228_19 = manager.audio:GetVoiceLength("story_v_out_121481", "121481056", "story_v_out_121481.awb") / 1000

					if var_228_19 + var_228_11 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_19 + var_228_11
					end

					if var_228_14.prefab_name ~= "" and arg_225_1.actors_[var_228_14.prefab_name] ~= nil then
						local var_228_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_14.prefab_name].transform, "story_v_out_121481", "121481056", "story_v_out_121481.awb")

						arg_225_1:RecordAudio("121481056", var_228_20)
						arg_225_1:RecordAudio("121481056", var_228_20)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_out_121481", "121481056", "story_v_out_121481.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_out_121481", "121481056", "story_v_out_121481.awb")
				end

				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_21 = math.max(var_228_12, arg_225_1.talkMaxDuration)

			if var_228_11 <= arg_225_1.time_ and arg_225_1.time_ < var_228_11 + var_228_21 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_11) / var_228_21

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_11 + var_228_21 and arg_225_1.time_ < var_228_11 + var_228_21 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play121481057 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 121481057
		arg_229_1.duration_ = 3.9

		local var_229_0 = {
			ja = 3.9,
			ko = 3.1,
			zh = 3.1
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
				arg_229_0:Play121481058(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = arg_229_1.actors_["1076ui_story"]
			local var_232_1 = 0

			if var_232_1 < arg_229_1.time_ and arg_229_1.time_ <= var_232_1 + arg_232_0 and arg_229_1.var_.characterEffect1076ui_story == nil then
				arg_229_1.var_.characterEffect1076ui_story = var_232_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_232_2 = 0.200000002980232

			if var_232_1 <= arg_229_1.time_ and arg_229_1.time_ < var_232_1 + var_232_2 then
				local var_232_3 = (arg_229_1.time_ - var_232_1) / var_232_2

				if arg_229_1.var_.characterEffect1076ui_story then
					arg_229_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_229_1.time_ >= var_232_1 + var_232_2 and arg_229_1.time_ < var_232_1 + var_232_2 + arg_232_0 and arg_229_1.var_.characterEffect1076ui_story then
				arg_229_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_232_4 = arg_229_1.actors_["1071ui_story"]
			local var_232_5 = 0

			if var_232_5 < arg_229_1.time_ and arg_229_1.time_ <= var_232_5 + arg_232_0 and arg_229_1.var_.characterEffect1071ui_story == nil then
				arg_229_1.var_.characterEffect1071ui_story = var_232_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_232_6 = 0.200000002980232

			if var_232_5 <= arg_229_1.time_ and arg_229_1.time_ < var_232_5 + var_232_6 then
				local var_232_7 = (arg_229_1.time_ - var_232_5) / var_232_6

				if arg_229_1.var_.characterEffect1071ui_story then
					local var_232_8 = Mathf.Lerp(0, 0.5, var_232_7)

					arg_229_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_229_1.var_.characterEffect1071ui_story.fillRatio = var_232_8
				end
			end

			if arg_229_1.time_ >= var_232_5 + var_232_6 and arg_229_1.time_ < var_232_5 + var_232_6 + arg_232_0 and arg_229_1.var_.characterEffect1071ui_story then
				local var_232_9 = 0.5

				arg_229_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_229_1.var_.characterEffect1071ui_story.fillRatio = var_232_9
			end

			local var_232_10 = 0

			if var_232_10 < arg_229_1.time_ and arg_229_1.time_ <= var_232_10 + arg_232_0 then
				arg_229_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action3_2")
			end

			local var_232_11 = 0
			local var_232_12 = 0.325

			if var_232_11 < arg_229_1.time_ and arg_229_1.time_ <= var_232_11 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_13 = arg_229_1:FormatText(StoryNameCfg[389].name)

				arg_229_1.leftNameTxt_.text = var_232_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_14 = arg_229_1:GetWordFromCfg(121481057)
				local var_232_15 = arg_229_1:FormatText(var_232_14.content)

				arg_229_1.text_.text = var_232_15

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_16 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481057", "story_v_out_121481.awb") ~= 0 then
					local var_232_19 = manager.audio:GetVoiceLength("story_v_out_121481", "121481057", "story_v_out_121481.awb") / 1000

					if var_232_19 + var_232_11 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_19 + var_232_11
					end

					if var_232_14.prefab_name ~= "" and arg_229_1.actors_[var_232_14.prefab_name] ~= nil then
						local var_232_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_14.prefab_name].transform, "story_v_out_121481", "121481057", "story_v_out_121481.awb")

						arg_229_1:RecordAudio("121481057", var_232_20)
						arg_229_1:RecordAudio("121481057", var_232_20)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_out_121481", "121481057", "story_v_out_121481.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_out_121481", "121481057", "story_v_out_121481.awb")
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
	Play121481058 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 121481058
		arg_233_1.duration_ = 12.566

		local var_233_0 = {
			ja = 12.566,
			ko = 9.366,
			zh = 9.366
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
				arg_233_0:Play121481059(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = arg_233_1.actors_["1071ui_story"]
			local var_236_1 = 0

			if var_236_1 < arg_233_1.time_ and arg_233_1.time_ <= var_236_1 + arg_236_0 and arg_233_1.var_.characterEffect1071ui_story == nil then
				arg_233_1.var_.characterEffect1071ui_story = var_236_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_236_2 = 0.200000002980232

			if var_236_1 <= arg_233_1.time_ and arg_233_1.time_ < var_236_1 + var_236_2 then
				local var_236_3 = (arg_233_1.time_ - var_236_1) / var_236_2

				if arg_233_1.var_.characterEffect1071ui_story then
					arg_233_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_233_1.time_ >= var_236_1 + var_236_2 and arg_233_1.time_ < var_236_1 + var_236_2 + arg_236_0 and arg_233_1.var_.characterEffect1071ui_story then
				arg_233_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_236_4 = 0

			if var_236_4 < arg_233_1.time_ and arg_233_1.time_ <= var_236_4 + arg_236_0 then
				arg_233_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action6_2")
			end

			local var_236_5 = arg_233_1.actors_["1076ui_story"]
			local var_236_6 = 0

			if var_236_6 < arg_233_1.time_ and arg_233_1.time_ <= var_236_6 + arg_236_0 and arg_233_1.var_.characterEffect1076ui_story == nil then
				arg_233_1.var_.characterEffect1076ui_story = var_236_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_236_7 = 0.200000002980232

			if var_236_6 <= arg_233_1.time_ and arg_233_1.time_ < var_236_6 + var_236_7 then
				local var_236_8 = (arg_233_1.time_ - var_236_6) / var_236_7

				if arg_233_1.var_.characterEffect1076ui_story then
					local var_236_9 = Mathf.Lerp(0, 0.5, var_236_8)

					arg_233_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_233_1.var_.characterEffect1076ui_story.fillRatio = var_236_9
				end
			end

			if arg_233_1.time_ >= var_236_6 + var_236_7 and arg_233_1.time_ < var_236_6 + var_236_7 + arg_236_0 and arg_233_1.var_.characterEffect1076ui_story then
				local var_236_10 = 0.5

				arg_233_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_233_1.var_.characterEffect1076ui_story.fillRatio = var_236_10
			end

			local var_236_11 = 0
			local var_236_12 = 1.125

			if var_236_11 < arg_233_1.time_ and arg_233_1.time_ <= var_236_11 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_13 = arg_233_1:FormatText(StoryNameCfg[384].name)

				arg_233_1.leftNameTxt_.text = var_236_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_14 = arg_233_1:GetWordFromCfg(121481058)
				local var_236_15 = arg_233_1:FormatText(var_236_14.content)

				arg_233_1.text_.text = var_236_15

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_16 = 45
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

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481058", "story_v_out_121481.awb") ~= 0 then
					local var_236_19 = manager.audio:GetVoiceLength("story_v_out_121481", "121481058", "story_v_out_121481.awb") / 1000

					if var_236_19 + var_236_11 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_19 + var_236_11
					end

					if var_236_14.prefab_name ~= "" and arg_233_1.actors_[var_236_14.prefab_name] ~= nil then
						local var_236_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_233_1.actors_[var_236_14.prefab_name].transform, "story_v_out_121481", "121481058", "story_v_out_121481.awb")

						arg_233_1:RecordAudio("121481058", var_236_20)
						arg_233_1:RecordAudio("121481058", var_236_20)
					else
						arg_233_1:AudioAction("play", "voice", "story_v_out_121481", "121481058", "story_v_out_121481.awb")
					end

					arg_233_1:RecordHistoryTalkVoice("story_v_out_121481", "121481058", "story_v_out_121481.awb")
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
	Play121481059 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 121481059
		arg_237_1.duration_ = 7.333

		local var_237_0 = {
			ja = 7.333,
			ko = 6.866,
			zh = 6.866
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
				arg_237_0:Play121481060(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = arg_237_1.actors_["1071ui_story"]
			local var_240_1 = 0

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 and arg_237_1.var_.characterEffect1071ui_story == nil then
				arg_237_1.var_.characterEffect1071ui_story = var_240_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_240_2 = 0.200000002980232

			if var_240_1 <= arg_237_1.time_ and arg_237_1.time_ < var_240_1 + var_240_2 then
				local var_240_3 = (arg_237_1.time_ - var_240_1) / var_240_2

				if arg_237_1.var_.characterEffect1071ui_story then
					arg_237_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_237_1.time_ >= var_240_1 + var_240_2 and arg_237_1.time_ < var_240_1 + var_240_2 + arg_240_0 and arg_237_1.var_.characterEffect1071ui_story then
				arg_237_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_240_4 = 0

			if var_240_4 < arg_237_1.time_ and arg_237_1.time_ <= var_240_4 + arg_240_0 then
				arg_237_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action3_1")
			end

			local var_240_5 = 0
			local var_240_6 = 0.725

			if var_240_5 < arg_237_1.time_ and arg_237_1.time_ <= var_240_5 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_7 = arg_237_1:FormatText(StoryNameCfg[384].name)

				arg_237_1.leftNameTxt_.text = var_240_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_8 = arg_237_1:GetWordFromCfg(121481059)
				local var_240_9 = arg_237_1:FormatText(var_240_8.content)

				arg_237_1.text_.text = var_240_9

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_10 = 29
				local var_240_11 = utf8.len(var_240_9)
				local var_240_12 = var_240_10 <= 0 and var_240_6 or var_240_6 * (var_240_11 / var_240_10)

				if var_240_12 > 0 and var_240_6 < var_240_12 then
					arg_237_1.talkMaxDuration = var_240_12

					if var_240_12 + var_240_5 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_12 + var_240_5
					end
				end

				arg_237_1.text_.text = var_240_9
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481059", "story_v_out_121481.awb") ~= 0 then
					local var_240_13 = manager.audio:GetVoiceLength("story_v_out_121481", "121481059", "story_v_out_121481.awb") / 1000

					if var_240_13 + var_240_5 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_13 + var_240_5
					end

					if var_240_8.prefab_name ~= "" and arg_237_1.actors_[var_240_8.prefab_name] ~= nil then
						local var_240_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_237_1.actors_[var_240_8.prefab_name].transform, "story_v_out_121481", "121481059", "story_v_out_121481.awb")

						arg_237_1:RecordAudio("121481059", var_240_14)
						arg_237_1:RecordAudio("121481059", var_240_14)
					else
						arg_237_1:AudioAction("play", "voice", "story_v_out_121481", "121481059", "story_v_out_121481.awb")
					end

					arg_237_1:RecordHistoryTalkVoice("story_v_out_121481", "121481059", "story_v_out_121481.awb")
				end

				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_15 = math.max(var_240_6, arg_237_1.talkMaxDuration)

			if var_240_5 <= arg_237_1.time_ and arg_237_1.time_ < var_240_5 + var_240_15 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_5) / var_240_15

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_5 + var_240_15 and arg_237_1.time_ < var_240_5 + var_240_15 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play121481060 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 121481060
		arg_241_1.duration_ = 9

		SetActive(arg_241_1.tipsGo_, false)

		function arg_241_1.onSingleLineFinish_()
			arg_241_1.onSingleLineUpdate_ = nil
			arg_241_1.onSingleLineFinish_ = nil
			arg_241_1.state_ = "waiting"
		end

		function arg_241_1.playNext_(arg_243_0)
			if arg_243_0 == 1 then
				arg_241_0:Play121481061(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = "ST31"

			if arg_241_1.bgs_[var_244_0] == nil then
				local var_244_1 = Object.Instantiate(arg_241_1.paintGo_)

				var_244_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_244_0)
				var_244_1.name = var_244_0
				var_244_1.transform.parent = arg_241_1.stage_.transform
				var_244_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_241_1.bgs_[var_244_0] = var_244_1
			end

			local var_244_2 = 2

			if var_244_2 < arg_241_1.time_ and arg_241_1.time_ <= var_244_2 + arg_244_0 then
				local var_244_3 = manager.ui.mainCamera.transform.localPosition
				local var_244_4 = Vector3.New(0, 0, 10) + Vector3.New(var_244_3.x, var_244_3.y, 0)
				local var_244_5 = arg_241_1.bgs_.ST31

				var_244_5.transform.localPosition = var_244_4
				var_244_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_244_6 = var_244_5:GetComponent("SpriteRenderer")

				if var_244_6 and var_244_6.sprite then
					local var_244_7 = (var_244_5.transform.localPosition - var_244_3).z
					local var_244_8 = manager.ui.mainCameraCom_
					local var_244_9 = 2 * var_244_7 * Mathf.Tan(var_244_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_244_10 = var_244_9 * var_244_8.aspect
					local var_244_11 = var_244_6.sprite.bounds.size.x
					local var_244_12 = var_244_6.sprite.bounds.size.y
					local var_244_13 = var_244_10 / var_244_11
					local var_244_14 = var_244_9 / var_244_12
					local var_244_15 = var_244_14 < var_244_13 and var_244_13 or var_244_14

					var_244_5.transform.localScale = Vector3.New(var_244_15, var_244_15, 0)
				end

				for iter_244_0, iter_244_1 in pairs(arg_241_1.bgs_) do
					if iter_244_0 ~= "ST31" then
						iter_244_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_244_16 = 0

			if var_244_16 < arg_241_1.time_ and arg_241_1.time_ <= var_244_16 + arg_244_0 then
				arg_241_1.mask_.enabled = true
				arg_241_1.mask_.raycastTarget = true

				arg_241_1:SetGaussion(false)
			end

			local var_244_17 = 2

			if var_244_16 <= arg_241_1.time_ and arg_241_1.time_ < var_244_16 + var_244_17 then
				local var_244_18 = (arg_241_1.time_ - var_244_16) / var_244_17
				local var_244_19 = Color.New(0, 0, 0)

				var_244_19.a = Mathf.Lerp(0, 1, var_244_18)
				arg_241_1.mask_.color = var_244_19
			end

			if arg_241_1.time_ >= var_244_16 + var_244_17 and arg_241_1.time_ < var_244_16 + var_244_17 + arg_244_0 then
				local var_244_20 = Color.New(0, 0, 0)

				var_244_20.a = 1
				arg_241_1.mask_.color = var_244_20
			end

			local var_244_21 = 2

			if var_244_21 < arg_241_1.time_ and arg_241_1.time_ <= var_244_21 + arg_244_0 then
				arg_241_1.mask_.enabled = true
				arg_241_1.mask_.raycastTarget = true

				arg_241_1:SetGaussion(false)
			end

			local var_244_22 = 2

			if var_244_21 <= arg_241_1.time_ and arg_241_1.time_ < var_244_21 + var_244_22 then
				local var_244_23 = (arg_241_1.time_ - var_244_21) / var_244_22
				local var_244_24 = Color.New(0, 0, 0)

				var_244_24.a = Mathf.Lerp(1, 0, var_244_23)
				arg_241_1.mask_.color = var_244_24
			end

			if arg_241_1.time_ >= var_244_21 + var_244_22 and arg_241_1.time_ < var_244_21 + var_244_22 + arg_244_0 then
				local var_244_25 = Color.New(0, 0, 0)
				local var_244_26 = 0

				arg_241_1.mask_.enabled = false
				var_244_25.a = var_244_26
				arg_241_1.mask_.color = var_244_25
			end

			local var_244_27 = arg_241_1.actors_["1071ui_story"].transform
			local var_244_28 = 1.96599999815226

			if var_244_28 < arg_241_1.time_ and arg_241_1.time_ <= var_244_28 + arg_244_0 then
				arg_241_1.var_.moveOldPos1071ui_story = var_244_27.localPosition
			end

			local var_244_29 = 0.001

			if var_244_28 <= arg_241_1.time_ and arg_241_1.time_ < var_244_28 + var_244_29 then
				local var_244_30 = (arg_241_1.time_ - var_244_28) / var_244_29
				local var_244_31 = Vector3.New(0, 100, 0)

				var_244_27.localPosition = Vector3.Lerp(arg_241_1.var_.moveOldPos1071ui_story, var_244_31, var_244_30)

				local var_244_32 = manager.ui.mainCamera.transform.position - var_244_27.position

				var_244_27.forward = Vector3.New(var_244_32.x, var_244_32.y, var_244_32.z)

				local var_244_33 = var_244_27.localEulerAngles

				var_244_33.z = 0
				var_244_33.x = 0
				var_244_27.localEulerAngles = var_244_33
			end

			if arg_241_1.time_ >= var_244_28 + var_244_29 and arg_241_1.time_ < var_244_28 + var_244_29 + arg_244_0 then
				var_244_27.localPosition = Vector3.New(0, 100, 0)

				local var_244_34 = manager.ui.mainCamera.transform.position - var_244_27.position

				var_244_27.forward = Vector3.New(var_244_34.x, var_244_34.y, var_244_34.z)

				local var_244_35 = var_244_27.localEulerAngles

				var_244_35.z = 0
				var_244_35.x = 0
				var_244_27.localEulerAngles = var_244_35
			end

			local var_244_36 = arg_241_1.actors_["1071ui_story"]
			local var_244_37 = 1.96599999815226

			if var_244_37 < arg_241_1.time_ and arg_241_1.time_ <= var_244_37 + arg_244_0 and arg_241_1.var_.characterEffect1071ui_story == nil then
				arg_241_1.var_.characterEffect1071ui_story = var_244_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_244_38 = 0.034000001847744

			if var_244_37 <= arg_241_1.time_ and arg_241_1.time_ < var_244_37 + var_244_38 then
				local var_244_39 = (arg_241_1.time_ - var_244_37) / var_244_38

				if arg_241_1.var_.characterEffect1071ui_story then
					local var_244_40 = Mathf.Lerp(0, 0.5, var_244_39)

					arg_241_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_241_1.var_.characterEffect1071ui_story.fillRatio = var_244_40
				end
			end

			if arg_241_1.time_ >= var_244_37 + var_244_38 and arg_241_1.time_ < var_244_37 + var_244_38 + arg_244_0 and arg_241_1.var_.characterEffect1071ui_story then
				local var_244_41 = 0.5

				arg_241_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_241_1.var_.characterEffect1071ui_story.fillRatio = var_244_41
			end

			local var_244_42 = arg_241_1.actors_["1076ui_story"].transform
			local var_244_43 = 1.96599999815226

			if var_244_43 < arg_241_1.time_ and arg_241_1.time_ <= var_244_43 + arg_244_0 then
				arg_241_1.var_.moveOldPos1076ui_story = var_244_42.localPosition
			end

			local var_244_44 = 0.001

			if var_244_43 <= arg_241_1.time_ and arg_241_1.time_ < var_244_43 + var_244_44 then
				local var_244_45 = (arg_241_1.time_ - var_244_43) / var_244_44
				local var_244_46 = Vector3.New(0, 100, 0)

				var_244_42.localPosition = Vector3.Lerp(arg_241_1.var_.moveOldPos1076ui_story, var_244_46, var_244_45)

				local var_244_47 = manager.ui.mainCamera.transform.position - var_244_42.position

				var_244_42.forward = Vector3.New(var_244_47.x, var_244_47.y, var_244_47.z)

				local var_244_48 = var_244_42.localEulerAngles

				var_244_48.z = 0
				var_244_48.x = 0
				var_244_42.localEulerAngles = var_244_48
			end

			if arg_241_1.time_ >= var_244_43 + var_244_44 and arg_241_1.time_ < var_244_43 + var_244_44 + arg_244_0 then
				var_244_42.localPosition = Vector3.New(0, 100, 0)

				local var_244_49 = manager.ui.mainCamera.transform.position - var_244_42.position

				var_244_42.forward = Vector3.New(var_244_49.x, var_244_49.y, var_244_49.z)

				local var_244_50 = var_244_42.localEulerAngles

				var_244_50.z = 0
				var_244_50.x = 0
				var_244_42.localEulerAngles = var_244_50
			end

			local var_244_51 = arg_241_1.actors_["1076ui_story"]
			local var_244_52 = 1.96599999815226

			if var_244_52 < arg_241_1.time_ and arg_241_1.time_ <= var_244_52 + arg_244_0 and arg_241_1.var_.characterEffect1076ui_story == nil then
				arg_241_1.var_.characterEffect1076ui_story = var_244_51:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_244_53 = 0.034000001847744

			if var_244_52 <= arg_241_1.time_ and arg_241_1.time_ < var_244_52 + var_244_53 then
				local var_244_54 = (arg_241_1.time_ - var_244_52) / var_244_53

				if arg_241_1.var_.characterEffect1076ui_story then
					local var_244_55 = Mathf.Lerp(0, 0.5, var_244_54)

					arg_241_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_241_1.var_.characterEffect1076ui_story.fillRatio = var_244_55
				end
			end

			if arg_241_1.time_ >= var_244_52 + var_244_53 and arg_241_1.time_ < var_244_52 + var_244_53 + arg_244_0 and arg_241_1.var_.characterEffect1076ui_story then
				local var_244_56 = 0.5

				arg_241_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_241_1.var_.characterEffect1076ui_story.fillRatio = var_244_56
			end

			if arg_241_1.frameCnt_ <= 1 then
				arg_241_1.dialog_:SetActive(false)
			end

			local var_244_57 = 4
			local var_244_58 = 0.75

			if var_244_57 < arg_241_1.time_ and arg_241_1.time_ <= var_244_57 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0

				arg_241_1.dialog_:SetActive(true)

				local var_244_59 = LeanTween.value(arg_241_1.dialog_, 0, 1, 0.3)

				var_244_59:setOnUpdate(LuaHelper.FloatAction(function(arg_245_0)
					arg_241_1.dialogCg_.alpha = arg_245_0
				end))
				var_244_59:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_241_1.dialog_)
					var_244_59:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_241_1.duration_ = arg_241_1.duration_ + 0.3

				SetActive(arg_241_1.leftNameGo_, false)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_60 = arg_241_1:GetWordFromCfg(121481060)
				local var_244_61 = arg_241_1:FormatText(var_244_60.content)

				arg_241_1.text_.text = var_244_61

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_62 = 30
				local var_244_63 = utf8.len(var_244_61)
				local var_244_64 = var_244_62 <= 0 and var_244_58 or var_244_58 * (var_244_63 / var_244_62)

				if var_244_64 > 0 and var_244_58 < var_244_64 then
					arg_241_1.talkMaxDuration = var_244_64
					var_244_57 = var_244_57 + 0.3

					if var_244_64 + var_244_57 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_64 + var_244_57
					end
				end

				arg_241_1.text_.text = var_244_61
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)
				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_65 = var_244_57 + 0.3
			local var_244_66 = math.max(var_244_58, arg_241_1.talkMaxDuration)

			if var_244_65 <= arg_241_1.time_ and arg_241_1.time_ < var_244_65 + var_244_66 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_65) / var_244_66

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_65 + var_244_66 and arg_241_1.time_ < var_244_65 + var_244_66 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play121481061 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 121481061
		arg_247_1.duration_ = 5

		SetActive(arg_247_1.tipsGo_, false)

		function arg_247_1.onSingleLineFinish_()
			arg_247_1.onSingleLineUpdate_ = nil
			arg_247_1.onSingleLineFinish_ = nil
			arg_247_1.state_ = "waiting"
		end

		function arg_247_1.playNext_(arg_249_0)
			if arg_249_0 == 1 then
				arg_247_0:Play121481062(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = 0
			local var_250_1 = 1

			if var_250_0 < arg_247_1.time_ and arg_247_1.time_ <= var_250_0 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, false)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_2 = arg_247_1:GetWordFromCfg(121481061)
				local var_250_3 = arg_247_1:FormatText(var_250_2.content)

				arg_247_1.text_.text = var_250_3

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_4 = 40
				local var_250_5 = utf8.len(var_250_3)
				local var_250_6 = var_250_4 <= 0 and var_250_1 or var_250_1 * (var_250_5 / var_250_4)

				if var_250_6 > 0 and var_250_1 < var_250_6 then
					arg_247_1.talkMaxDuration = var_250_6

					if var_250_6 + var_250_0 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_6 + var_250_0
					end
				end

				arg_247_1.text_.text = var_250_3
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)
				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_7 = math.max(var_250_1, arg_247_1.talkMaxDuration)

			if var_250_0 <= arg_247_1.time_ and arg_247_1.time_ < var_250_0 + var_250_7 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_0) / var_250_7

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_0 + var_250_7 and arg_247_1.time_ < var_250_0 + var_250_7 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play121481062 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 121481062
		arg_251_1.duration_ = 3.966

		local var_251_0 = {
			ja = 3.966,
			ko = 3.366,
			zh = 3.366
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
				arg_251_0:Play121481063(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = "1084ui_story"

			if arg_251_1.actors_[var_254_0] == nil then
				local var_254_1 = Object.Instantiate(Asset.Load("Char/" .. var_254_0), arg_251_1.stage_.transform)

				var_254_1.name = var_254_0
				var_254_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_251_1.actors_[var_254_0] = var_254_1

				local var_254_2 = var_254_1:GetComponentInChildren(typeof(CharacterEffect))

				var_254_2.enabled = true

				local var_254_3 = GameObjectTools.GetOrAddComponent(var_254_1, typeof(DynamicBoneHelper))

				if var_254_3 then
					var_254_3:EnableDynamicBone(false)
				end

				arg_251_1:ShowWeapon(var_254_2.transform, false)

				arg_251_1.var_[var_254_0 .. "Animator"] = var_254_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_251_1.var_[var_254_0 .. "Animator"].applyRootMotion = true
				arg_251_1.var_[var_254_0 .. "LipSync"] = var_254_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_254_4 = arg_251_1.actors_["1084ui_story"].transform
			local var_254_5 = 0

			if var_254_5 < arg_251_1.time_ and arg_251_1.time_ <= var_254_5 + arg_254_0 then
				arg_251_1.var_.moveOldPos1084ui_story = var_254_4.localPosition
			end

			local var_254_6 = 0.001

			if var_254_5 <= arg_251_1.time_ and arg_251_1.time_ < var_254_5 + var_254_6 then
				local var_254_7 = (arg_251_1.time_ - var_254_5) / var_254_6
				local var_254_8 = Vector3.New(0, -0.97, -6)

				var_254_4.localPosition = Vector3.Lerp(arg_251_1.var_.moveOldPos1084ui_story, var_254_8, var_254_7)

				local var_254_9 = manager.ui.mainCamera.transform.position - var_254_4.position

				var_254_4.forward = Vector3.New(var_254_9.x, var_254_9.y, var_254_9.z)

				local var_254_10 = var_254_4.localEulerAngles

				var_254_10.z = 0
				var_254_10.x = 0
				var_254_4.localEulerAngles = var_254_10
			end

			if arg_251_1.time_ >= var_254_5 + var_254_6 and arg_251_1.time_ < var_254_5 + var_254_6 + arg_254_0 then
				var_254_4.localPosition = Vector3.New(0, -0.97, -6)

				local var_254_11 = manager.ui.mainCamera.transform.position - var_254_4.position

				var_254_4.forward = Vector3.New(var_254_11.x, var_254_11.y, var_254_11.z)

				local var_254_12 = var_254_4.localEulerAngles

				var_254_12.z = 0
				var_254_12.x = 0
				var_254_4.localEulerAngles = var_254_12
			end

			local var_254_13 = arg_251_1.actors_["1084ui_story"]
			local var_254_14 = 0

			if var_254_14 < arg_251_1.time_ and arg_251_1.time_ <= var_254_14 + arg_254_0 and arg_251_1.var_.characterEffect1084ui_story == nil then
				arg_251_1.var_.characterEffect1084ui_story = var_254_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_254_15 = 0.200000002980232

			if var_254_14 <= arg_251_1.time_ and arg_251_1.time_ < var_254_14 + var_254_15 then
				local var_254_16 = (arg_251_1.time_ - var_254_14) / var_254_15

				if arg_251_1.var_.characterEffect1084ui_story then
					arg_251_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_251_1.time_ >= var_254_14 + var_254_15 and arg_251_1.time_ < var_254_14 + var_254_15 + arg_254_0 and arg_251_1.var_.characterEffect1084ui_story then
				arg_251_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_254_17 = 0

			if var_254_17 < arg_251_1.time_ and arg_251_1.time_ <= var_254_17 + arg_254_0 then
				arg_251_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_254_18 = 0

			if var_254_18 < arg_251_1.time_ and arg_251_1.time_ <= var_254_18 + arg_254_0 then
				arg_251_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_254_19 = 0
			local var_254_20 = 0.375

			if var_254_19 < arg_251_1.time_ and arg_251_1.time_ <= var_254_19 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_21 = arg_251_1:FormatText(StoryNameCfg[6].name)

				arg_251_1.leftNameTxt_.text = var_254_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_22 = arg_251_1:GetWordFromCfg(121481062)
				local var_254_23 = arg_251_1:FormatText(var_254_22.content)

				arg_251_1.text_.text = var_254_23

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_24 = 15
				local var_254_25 = utf8.len(var_254_23)
				local var_254_26 = var_254_24 <= 0 and var_254_20 or var_254_20 * (var_254_25 / var_254_24)

				if var_254_26 > 0 and var_254_20 < var_254_26 then
					arg_251_1.talkMaxDuration = var_254_26

					if var_254_26 + var_254_19 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_26 + var_254_19
					end
				end

				arg_251_1.text_.text = var_254_23
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481062", "story_v_out_121481.awb") ~= 0 then
					local var_254_27 = manager.audio:GetVoiceLength("story_v_out_121481", "121481062", "story_v_out_121481.awb") / 1000

					if var_254_27 + var_254_19 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_27 + var_254_19
					end

					if var_254_22.prefab_name ~= "" and arg_251_1.actors_[var_254_22.prefab_name] ~= nil then
						local var_254_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_22.prefab_name].transform, "story_v_out_121481", "121481062", "story_v_out_121481.awb")

						arg_251_1:RecordAudio("121481062", var_254_28)
						arg_251_1:RecordAudio("121481062", var_254_28)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_121481", "121481062", "story_v_out_121481.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_121481", "121481062", "story_v_out_121481.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_29 = math.max(var_254_20, arg_251_1.talkMaxDuration)

			if var_254_19 <= arg_251_1.time_ and arg_251_1.time_ < var_254_19 + var_254_29 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_19) / var_254_29

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_19 + var_254_29 and arg_251_1.time_ < var_254_19 + var_254_29 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play121481063 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 121481063
		arg_255_1.duration_ = 5

		SetActive(arg_255_1.tipsGo_, false)

		function arg_255_1.onSingleLineFinish_()
			arg_255_1.onSingleLineUpdate_ = nil
			arg_255_1.onSingleLineFinish_ = nil
			arg_255_1.state_ = "waiting"
		end

		function arg_255_1.playNext_(arg_257_0)
			if arg_257_0 == 1 then
				arg_255_0:Play121481064(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = arg_255_1.actors_["1084ui_story"]
			local var_258_1 = 0

			if var_258_1 < arg_255_1.time_ and arg_255_1.time_ <= var_258_1 + arg_258_0 and arg_255_1.var_.characterEffect1084ui_story == nil then
				arg_255_1.var_.characterEffect1084ui_story = var_258_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_258_2 = 0.200000002980232

			if var_258_1 <= arg_255_1.time_ and arg_255_1.time_ < var_258_1 + var_258_2 then
				local var_258_3 = (arg_255_1.time_ - var_258_1) / var_258_2

				if arg_255_1.var_.characterEffect1084ui_story then
					local var_258_4 = Mathf.Lerp(0, 0.5, var_258_3)

					arg_255_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_255_1.var_.characterEffect1084ui_story.fillRatio = var_258_4
				end
			end

			if arg_255_1.time_ >= var_258_1 + var_258_2 and arg_255_1.time_ < var_258_1 + var_258_2 + arg_258_0 and arg_255_1.var_.characterEffect1084ui_story then
				local var_258_5 = 0.5

				arg_255_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_255_1.var_.characterEffect1084ui_story.fillRatio = var_258_5
			end

			local var_258_6 = 0
			local var_258_7 = 0.125

			if var_258_6 < arg_255_1.time_ and arg_255_1.time_ <= var_258_6 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_8 = arg_255_1:FormatText(StoryNameCfg[7].name)

				arg_255_1.leftNameTxt_.text = var_258_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_9 = arg_255_1:GetWordFromCfg(121481063)
				local var_258_10 = arg_255_1:FormatText(var_258_9.content)

				arg_255_1.text_.text = var_258_10

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_11 = 5
				local var_258_12 = utf8.len(var_258_10)
				local var_258_13 = var_258_11 <= 0 and var_258_7 or var_258_7 * (var_258_12 / var_258_11)

				if var_258_13 > 0 and var_258_7 < var_258_13 then
					arg_255_1.talkMaxDuration = var_258_13

					if var_258_13 + var_258_6 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_13 + var_258_6
					end
				end

				arg_255_1.text_.text = var_258_10
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)
				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_14 = math.max(var_258_7, arg_255_1.talkMaxDuration)

			if var_258_6 <= arg_255_1.time_ and arg_255_1.time_ < var_258_6 + var_258_14 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_6) / var_258_14

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_6 + var_258_14 and arg_255_1.time_ < var_258_6 + var_258_14 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play121481064 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 121481064
		arg_259_1.duration_ = 5

		SetActive(arg_259_1.tipsGo_, false)

		function arg_259_1.onSingleLineFinish_()
			arg_259_1.onSingleLineUpdate_ = nil
			arg_259_1.onSingleLineFinish_ = nil
			arg_259_1.state_ = "waiting"
		end

		function arg_259_1.playNext_(arg_261_0)
			if arg_261_0 == 1 then
				arg_259_0:Play121481065(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = 0
			local var_262_1 = 0.85

			if var_262_0 < arg_259_1.time_ and arg_259_1.time_ <= var_262_0 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_2 = arg_259_1:FormatText(StoryNameCfg[7].name)

				arg_259_1.leftNameTxt_.text = var_262_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_3 = arg_259_1:GetWordFromCfg(121481064)
				local var_262_4 = arg_259_1:FormatText(var_262_3.content)

				arg_259_1.text_.text = var_262_4

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_5 = 34
				local var_262_6 = utf8.len(var_262_4)
				local var_262_7 = var_262_5 <= 0 and var_262_1 or var_262_1 * (var_262_6 / var_262_5)

				if var_262_7 > 0 and var_262_1 < var_262_7 then
					arg_259_1.talkMaxDuration = var_262_7

					if var_262_7 + var_262_0 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_7 + var_262_0
					end
				end

				arg_259_1.text_.text = var_262_4
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)
				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_8 = math.max(var_262_1, arg_259_1.talkMaxDuration)

			if var_262_0 <= arg_259_1.time_ and arg_259_1.time_ < var_262_0 + var_262_8 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_0) / var_262_8

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_0 + var_262_8 and arg_259_1.time_ < var_262_0 + var_262_8 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play121481065 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 121481065
		arg_263_1.duration_ = 3.5

		local var_263_0 = {
			ja = 3.4,
			ko = 3.5,
			zh = 3.5
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
				arg_263_0:Play121481066(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = arg_263_1.actors_["1084ui_story"]
			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 and arg_263_1.var_.characterEffect1084ui_story == nil then
				arg_263_1.var_.characterEffect1084ui_story = var_266_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_266_2 = 0.200000002980232

			if var_266_1 <= arg_263_1.time_ and arg_263_1.time_ < var_266_1 + var_266_2 then
				local var_266_3 = (arg_263_1.time_ - var_266_1) / var_266_2

				if arg_263_1.var_.characterEffect1084ui_story then
					arg_263_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_263_1.time_ >= var_266_1 + var_266_2 and arg_263_1.time_ < var_266_1 + var_266_2 + arg_266_0 and arg_263_1.var_.characterEffect1084ui_story then
				arg_263_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_266_4 = 0

			if var_266_4 < arg_263_1.time_ and arg_263_1.time_ <= var_266_4 + arg_266_0 then
				arg_263_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_266_5 = 0

			if var_266_5 < arg_263_1.time_ and arg_263_1.time_ <= var_266_5 + arg_266_0 then
				arg_263_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_266_6 = 0
			local var_266_7 = 0.35

			if var_266_6 < arg_263_1.time_ and arg_263_1.time_ <= var_266_6 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_8 = arg_263_1:FormatText(StoryNameCfg[6].name)

				arg_263_1.leftNameTxt_.text = var_266_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_9 = arg_263_1:GetWordFromCfg(121481065)
				local var_266_10 = arg_263_1:FormatText(var_266_9.content)

				arg_263_1.text_.text = var_266_10

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_11 = 14
				local var_266_12 = utf8.len(var_266_10)
				local var_266_13 = var_266_11 <= 0 and var_266_7 or var_266_7 * (var_266_12 / var_266_11)

				if var_266_13 > 0 and var_266_7 < var_266_13 then
					arg_263_1.talkMaxDuration = var_266_13

					if var_266_13 + var_266_6 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_13 + var_266_6
					end
				end

				arg_263_1.text_.text = var_266_10
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481065", "story_v_out_121481.awb") ~= 0 then
					local var_266_14 = manager.audio:GetVoiceLength("story_v_out_121481", "121481065", "story_v_out_121481.awb") / 1000

					if var_266_14 + var_266_6 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_14 + var_266_6
					end

					if var_266_9.prefab_name ~= "" and arg_263_1.actors_[var_266_9.prefab_name] ~= nil then
						local var_266_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_9.prefab_name].transform, "story_v_out_121481", "121481065", "story_v_out_121481.awb")

						arg_263_1:RecordAudio("121481065", var_266_15)
						arg_263_1:RecordAudio("121481065", var_266_15)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_out_121481", "121481065", "story_v_out_121481.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_out_121481", "121481065", "story_v_out_121481.awb")
				end

				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_16 = math.max(var_266_7, arg_263_1.talkMaxDuration)

			if var_266_6 <= arg_263_1.time_ and arg_263_1.time_ < var_266_6 + var_266_16 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_6) / var_266_16

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_6 + var_266_16 and arg_263_1.time_ < var_266_6 + var_266_16 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play121481066 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 121481066
		arg_267_1.duration_ = 5

		SetActive(arg_267_1.tipsGo_, false)

		function arg_267_1.onSingleLineFinish_()
			arg_267_1.onSingleLineUpdate_ = nil
			arg_267_1.onSingleLineFinish_ = nil
			arg_267_1.state_ = "waiting"
		end

		function arg_267_1.playNext_(arg_269_0)
			if arg_269_0 == 1 then
				arg_267_0:Play121481067(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = arg_267_1.actors_["1084ui_story"].transform
			local var_270_1 = 0

			if var_270_1 < arg_267_1.time_ and arg_267_1.time_ <= var_270_1 + arg_270_0 then
				arg_267_1.var_.moveOldPos1084ui_story = var_270_0.localPosition
			end

			local var_270_2 = 0.001

			if var_270_1 <= arg_267_1.time_ and arg_267_1.time_ < var_270_1 + var_270_2 then
				local var_270_3 = (arg_267_1.time_ - var_270_1) / var_270_2
				local var_270_4 = Vector3.New(0, 100, 0)

				var_270_0.localPosition = Vector3.Lerp(arg_267_1.var_.moveOldPos1084ui_story, var_270_4, var_270_3)

				local var_270_5 = manager.ui.mainCamera.transform.position - var_270_0.position

				var_270_0.forward = Vector3.New(var_270_5.x, var_270_5.y, var_270_5.z)

				local var_270_6 = var_270_0.localEulerAngles

				var_270_6.z = 0
				var_270_6.x = 0
				var_270_0.localEulerAngles = var_270_6
			end

			if arg_267_1.time_ >= var_270_1 + var_270_2 and arg_267_1.time_ < var_270_1 + var_270_2 + arg_270_0 then
				var_270_0.localPosition = Vector3.New(0, 100, 0)

				local var_270_7 = manager.ui.mainCamera.transform.position - var_270_0.position

				var_270_0.forward = Vector3.New(var_270_7.x, var_270_7.y, var_270_7.z)

				local var_270_8 = var_270_0.localEulerAngles

				var_270_8.z = 0
				var_270_8.x = 0
				var_270_0.localEulerAngles = var_270_8
			end

			local var_270_9 = arg_267_1.actors_["1084ui_story"]
			local var_270_10 = 0

			if var_270_10 < arg_267_1.time_ and arg_267_1.time_ <= var_270_10 + arg_270_0 and arg_267_1.var_.characterEffect1084ui_story == nil then
				arg_267_1.var_.characterEffect1084ui_story = var_270_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_270_11 = 0.200000002980232

			if var_270_10 <= arg_267_1.time_ and arg_267_1.time_ < var_270_10 + var_270_11 then
				local var_270_12 = (arg_267_1.time_ - var_270_10) / var_270_11

				if arg_267_1.var_.characterEffect1084ui_story then
					local var_270_13 = Mathf.Lerp(0, 0.5, var_270_12)

					arg_267_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_267_1.var_.characterEffect1084ui_story.fillRatio = var_270_13
				end
			end

			if arg_267_1.time_ >= var_270_10 + var_270_11 and arg_267_1.time_ < var_270_10 + var_270_11 + arg_270_0 and arg_267_1.var_.characterEffect1084ui_story then
				local var_270_14 = 0.5

				arg_267_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_267_1.var_.characterEffect1084ui_story.fillRatio = var_270_14
			end

			local var_270_15 = 0
			local var_270_16 = 0.9

			if var_270_15 < arg_267_1.time_ and arg_267_1.time_ <= var_270_15 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, false)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_17 = arg_267_1:GetWordFromCfg(121481066)
				local var_270_18 = arg_267_1:FormatText(var_270_17.content)

				arg_267_1.text_.text = var_270_18

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_19 = 36
				local var_270_20 = utf8.len(var_270_18)
				local var_270_21 = var_270_19 <= 0 and var_270_16 or var_270_16 * (var_270_20 / var_270_19)

				if var_270_21 > 0 and var_270_16 < var_270_21 then
					arg_267_1.talkMaxDuration = var_270_21

					if var_270_21 + var_270_15 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_21 + var_270_15
					end
				end

				arg_267_1.text_.text = var_270_18
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)
				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_22 = math.max(var_270_16, arg_267_1.talkMaxDuration)

			if var_270_15 <= arg_267_1.time_ and arg_267_1.time_ < var_270_15 + var_270_22 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_15) / var_270_22

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_15 + var_270_22 and arg_267_1.time_ < var_270_15 + var_270_22 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play121481067 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 121481067
		arg_271_1.duration_ = 5

		SetActive(arg_271_1.tipsGo_, false)

		function arg_271_1.onSingleLineFinish_()
			arg_271_1.onSingleLineUpdate_ = nil
			arg_271_1.onSingleLineFinish_ = nil
			arg_271_1.state_ = "waiting"
		end

		function arg_271_1.playNext_(arg_273_0)
			if arg_273_0 == 1 then
				arg_271_0:Play121481068(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = 0
			local var_274_1 = 1.025

			if var_274_0 < arg_271_1.time_ and arg_271_1.time_ <= var_274_0 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, false)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_2 = arg_271_1:GetWordFromCfg(121481067)
				local var_274_3 = arg_271_1:FormatText(var_274_2.content)

				arg_271_1.text_.text = var_274_3

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_4 = 41
				local var_274_5 = utf8.len(var_274_3)
				local var_274_6 = var_274_4 <= 0 and var_274_1 or var_274_1 * (var_274_5 / var_274_4)

				if var_274_6 > 0 and var_274_1 < var_274_6 then
					arg_271_1.talkMaxDuration = var_274_6

					if var_274_6 + var_274_0 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_6 + var_274_0
					end
				end

				arg_271_1.text_.text = var_274_3
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)
				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_7 = math.max(var_274_1, arg_271_1.talkMaxDuration)

			if var_274_0 <= arg_271_1.time_ and arg_271_1.time_ < var_274_0 + var_274_7 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_0) / var_274_7

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_0 + var_274_7 and arg_271_1.time_ < var_274_0 + var_274_7 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play121481068 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 121481068
		arg_275_1.duration_ = 3.366

		local var_275_0 = {
			ja = 3.366,
			ko = 3.166,
			zh = 3.166
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
				arg_275_0:Play121481069(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = "1069ui_story"

			if arg_275_1.actors_[var_278_0] == nil then
				local var_278_1 = Object.Instantiate(Asset.Load("Char/" .. var_278_0), arg_275_1.stage_.transform)

				var_278_1.name = var_278_0
				var_278_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_275_1.actors_[var_278_0] = var_278_1

				local var_278_2 = var_278_1:GetComponentInChildren(typeof(CharacterEffect))

				var_278_2.enabled = true

				local var_278_3 = GameObjectTools.GetOrAddComponent(var_278_1, typeof(DynamicBoneHelper))

				if var_278_3 then
					var_278_3:EnableDynamicBone(false)
				end

				arg_275_1:ShowWeapon(var_278_2.transform, false)

				arg_275_1.var_[var_278_0 .. "Animator"] = var_278_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_275_1.var_[var_278_0 .. "Animator"].applyRootMotion = true
				arg_275_1.var_[var_278_0 .. "LipSync"] = var_278_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_278_4 = arg_275_1.actors_["1069ui_story"].transform
			local var_278_5 = 0

			if var_278_5 < arg_275_1.time_ and arg_275_1.time_ <= var_278_5 + arg_278_0 then
				arg_275_1.var_.moveOldPos1069ui_story = var_278_4.localPosition
			end

			local var_278_6 = 0.001

			if var_278_5 <= arg_275_1.time_ and arg_275_1.time_ < var_278_5 + var_278_6 then
				local var_278_7 = (arg_275_1.time_ - var_278_5) / var_278_6
				local var_278_8 = Vector3.New(-0.7, -1, -6)

				var_278_4.localPosition = Vector3.Lerp(arg_275_1.var_.moveOldPos1069ui_story, var_278_8, var_278_7)

				local var_278_9 = manager.ui.mainCamera.transform.position - var_278_4.position

				var_278_4.forward = Vector3.New(var_278_9.x, var_278_9.y, var_278_9.z)

				local var_278_10 = var_278_4.localEulerAngles

				var_278_10.z = 0
				var_278_10.x = 0
				var_278_4.localEulerAngles = var_278_10
			end

			if arg_275_1.time_ >= var_278_5 + var_278_6 and arg_275_1.time_ < var_278_5 + var_278_6 + arg_278_0 then
				var_278_4.localPosition = Vector3.New(-0.7, -1, -6)

				local var_278_11 = manager.ui.mainCamera.transform.position - var_278_4.position

				var_278_4.forward = Vector3.New(var_278_11.x, var_278_11.y, var_278_11.z)

				local var_278_12 = var_278_4.localEulerAngles

				var_278_12.z = 0
				var_278_12.x = 0
				var_278_4.localEulerAngles = var_278_12
			end

			local var_278_13 = arg_275_1.actors_["1069ui_story"]
			local var_278_14 = 0

			if var_278_14 < arg_275_1.time_ and arg_275_1.time_ <= var_278_14 + arg_278_0 and arg_275_1.var_.characterEffect1069ui_story == nil then
				arg_275_1.var_.characterEffect1069ui_story = var_278_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_278_15 = 0.200000002980232

			if var_278_14 <= arg_275_1.time_ and arg_275_1.time_ < var_278_14 + var_278_15 then
				local var_278_16 = (arg_275_1.time_ - var_278_14) / var_278_15

				if arg_275_1.var_.characterEffect1069ui_story then
					arg_275_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_275_1.time_ >= var_278_14 + var_278_15 and arg_275_1.time_ < var_278_14 + var_278_15 + arg_278_0 and arg_275_1.var_.characterEffect1069ui_story then
				arg_275_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_278_17 = 0

			if var_278_17 < arg_275_1.time_ and arg_275_1.time_ <= var_278_17 + arg_278_0 then
				arg_275_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action1_1")
			end

			local var_278_18 = 0

			if var_278_18 < arg_275_1.time_ and arg_275_1.time_ <= var_278_18 + arg_278_0 then
				arg_275_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_278_19 = arg_275_1.actors_["1084ui_story"].transform
			local var_278_20 = 0

			if var_278_20 < arg_275_1.time_ and arg_275_1.time_ <= var_278_20 + arg_278_0 then
				arg_275_1.var_.moveOldPos1084ui_story = var_278_19.localPosition
			end

			local var_278_21 = 0.001

			if var_278_20 <= arg_275_1.time_ and arg_275_1.time_ < var_278_20 + var_278_21 then
				local var_278_22 = (arg_275_1.time_ - var_278_20) / var_278_21
				local var_278_23 = Vector3.New(0.7, -0.97, -6)

				var_278_19.localPosition = Vector3.Lerp(arg_275_1.var_.moveOldPos1084ui_story, var_278_23, var_278_22)

				local var_278_24 = manager.ui.mainCamera.transform.position - var_278_19.position

				var_278_19.forward = Vector3.New(var_278_24.x, var_278_24.y, var_278_24.z)

				local var_278_25 = var_278_19.localEulerAngles

				var_278_25.z = 0
				var_278_25.x = 0
				var_278_19.localEulerAngles = var_278_25
			end

			if arg_275_1.time_ >= var_278_20 + var_278_21 and arg_275_1.time_ < var_278_20 + var_278_21 + arg_278_0 then
				var_278_19.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_278_26 = manager.ui.mainCamera.transform.position - var_278_19.position

				var_278_19.forward = Vector3.New(var_278_26.x, var_278_26.y, var_278_26.z)

				local var_278_27 = var_278_19.localEulerAngles

				var_278_27.z = 0
				var_278_27.x = 0
				var_278_19.localEulerAngles = var_278_27
			end

			local var_278_28 = arg_275_1.actors_["1084ui_story"]
			local var_278_29 = 0

			if var_278_29 < arg_275_1.time_ and arg_275_1.time_ <= var_278_29 + arg_278_0 and arg_275_1.var_.characterEffect1084ui_story == nil then
				arg_275_1.var_.characterEffect1084ui_story = var_278_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_278_30 = 0.200000002980232

			if var_278_29 <= arg_275_1.time_ and arg_275_1.time_ < var_278_29 + var_278_30 then
				local var_278_31 = (arg_275_1.time_ - var_278_29) / var_278_30

				if arg_275_1.var_.characterEffect1084ui_story then
					local var_278_32 = Mathf.Lerp(0, 0.5, var_278_31)

					arg_275_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_275_1.var_.characterEffect1084ui_story.fillRatio = var_278_32
				end
			end

			if arg_275_1.time_ >= var_278_29 + var_278_30 and arg_275_1.time_ < var_278_29 + var_278_30 + arg_278_0 and arg_275_1.var_.characterEffect1084ui_story then
				local var_278_33 = 0.5

				arg_275_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_275_1.var_.characterEffect1084ui_story.fillRatio = var_278_33
			end

			local var_278_34 = 0
			local var_278_35 = 0.4

			if var_278_34 < arg_275_1.time_ and arg_275_1.time_ <= var_278_34 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_36 = arg_275_1:FormatText(StoryNameCfg[378].name)

				arg_275_1.leftNameTxt_.text = var_278_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_37 = arg_275_1:GetWordFromCfg(121481068)
				local var_278_38 = arg_275_1:FormatText(var_278_37.content)

				arg_275_1.text_.text = var_278_38

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_39 = 16
				local var_278_40 = utf8.len(var_278_38)
				local var_278_41 = var_278_39 <= 0 and var_278_35 or var_278_35 * (var_278_40 / var_278_39)

				if var_278_41 > 0 and var_278_35 < var_278_41 then
					arg_275_1.talkMaxDuration = var_278_41

					if var_278_41 + var_278_34 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_41 + var_278_34
					end
				end

				arg_275_1.text_.text = var_278_38
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481068", "story_v_out_121481.awb") ~= 0 then
					local var_278_42 = manager.audio:GetVoiceLength("story_v_out_121481", "121481068", "story_v_out_121481.awb") / 1000

					if var_278_42 + var_278_34 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_42 + var_278_34
					end

					if var_278_37.prefab_name ~= "" and arg_275_1.actors_[var_278_37.prefab_name] ~= nil then
						local var_278_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_275_1.actors_[var_278_37.prefab_name].transform, "story_v_out_121481", "121481068", "story_v_out_121481.awb")

						arg_275_1:RecordAudio("121481068", var_278_43)
						arg_275_1:RecordAudio("121481068", var_278_43)
					else
						arg_275_1:AudioAction("play", "voice", "story_v_out_121481", "121481068", "story_v_out_121481.awb")
					end

					arg_275_1:RecordHistoryTalkVoice("story_v_out_121481", "121481068", "story_v_out_121481.awb")
				end

				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_44 = math.max(var_278_35, arg_275_1.talkMaxDuration)

			if var_278_34 <= arg_275_1.time_ and arg_275_1.time_ < var_278_34 + var_278_44 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_34) / var_278_44

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_34 + var_278_44 and arg_275_1.time_ < var_278_34 + var_278_44 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play121481069 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 121481069
		arg_279_1.duration_ = 8.766

		local var_279_0 = {
			ja = 8.766,
			ko = 5.366,
			zh = 5.366
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
				arg_279_0:Play121481070(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = arg_279_1.actors_["1084ui_story"]
			local var_282_1 = 0

			if var_282_1 < arg_279_1.time_ and arg_279_1.time_ <= var_282_1 + arg_282_0 and arg_279_1.var_.characterEffect1084ui_story == nil then
				arg_279_1.var_.characterEffect1084ui_story = var_282_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_282_2 = 0.200000002980232

			if var_282_1 <= arg_279_1.time_ and arg_279_1.time_ < var_282_1 + var_282_2 then
				local var_282_3 = (arg_279_1.time_ - var_282_1) / var_282_2

				if arg_279_1.var_.characterEffect1084ui_story then
					arg_279_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_279_1.time_ >= var_282_1 + var_282_2 and arg_279_1.time_ < var_282_1 + var_282_2 + arg_282_0 and arg_279_1.var_.characterEffect1084ui_story then
				arg_279_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_282_4 = 0

			if var_282_4 < arg_279_1.time_ and arg_279_1.time_ <= var_282_4 + arg_282_0 then
				arg_279_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_2")
			end

			local var_282_5 = 0

			if var_282_5 < arg_279_1.time_ and arg_279_1.time_ <= var_282_5 + arg_282_0 then
				arg_279_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_282_6 = arg_279_1.actors_["1069ui_story"]
			local var_282_7 = 0

			if var_282_7 < arg_279_1.time_ and arg_279_1.time_ <= var_282_7 + arg_282_0 and arg_279_1.var_.characterEffect1069ui_story == nil then
				arg_279_1.var_.characterEffect1069ui_story = var_282_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_282_8 = 0.200000002980232

			if var_282_7 <= arg_279_1.time_ and arg_279_1.time_ < var_282_7 + var_282_8 then
				local var_282_9 = (arg_279_1.time_ - var_282_7) / var_282_8

				if arg_279_1.var_.characterEffect1069ui_story then
					local var_282_10 = Mathf.Lerp(0, 0.5, var_282_9)

					arg_279_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_279_1.var_.characterEffect1069ui_story.fillRatio = var_282_10
				end
			end

			if arg_279_1.time_ >= var_282_7 + var_282_8 and arg_279_1.time_ < var_282_7 + var_282_8 + arg_282_0 and arg_279_1.var_.characterEffect1069ui_story then
				local var_282_11 = 0.5

				arg_279_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_279_1.var_.characterEffect1069ui_story.fillRatio = var_282_11
			end

			local var_282_12 = 0
			local var_282_13 = 0.75

			if var_282_12 < arg_279_1.time_ and arg_279_1.time_ <= var_282_12 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_14 = arg_279_1:FormatText(StoryNameCfg[6].name)

				arg_279_1.leftNameTxt_.text = var_282_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_15 = arg_279_1:GetWordFromCfg(121481069)
				local var_282_16 = arg_279_1:FormatText(var_282_15.content)

				arg_279_1.text_.text = var_282_16

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_17 = 30
				local var_282_18 = utf8.len(var_282_16)
				local var_282_19 = var_282_17 <= 0 and var_282_13 or var_282_13 * (var_282_18 / var_282_17)

				if var_282_19 > 0 and var_282_13 < var_282_19 then
					arg_279_1.talkMaxDuration = var_282_19

					if var_282_19 + var_282_12 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_19 + var_282_12
					end
				end

				arg_279_1.text_.text = var_282_16
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481069", "story_v_out_121481.awb") ~= 0 then
					local var_282_20 = manager.audio:GetVoiceLength("story_v_out_121481", "121481069", "story_v_out_121481.awb") / 1000

					if var_282_20 + var_282_12 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_20 + var_282_12
					end

					if var_282_15.prefab_name ~= "" and arg_279_1.actors_[var_282_15.prefab_name] ~= nil then
						local var_282_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_279_1.actors_[var_282_15.prefab_name].transform, "story_v_out_121481", "121481069", "story_v_out_121481.awb")

						arg_279_1:RecordAudio("121481069", var_282_21)
						arg_279_1:RecordAudio("121481069", var_282_21)
					else
						arg_279_1:AudioAction("play", "voice", "story_v_out_121481", "121481069", "story_v_out_121481.awb")
					end

					arg_279_1:RecordHistoryTalkVoice("story_v_out_121481", "121481069", "story_v_out_121481.awb")
				end

				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_22 = math.max(var_282_13, arg_279_1.talkMaxDuration)

			if var_282_12 <= arg_279_1.time_ and arg_279_1.time_ < var_282_12 + var_282_22 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_12) / var_282_22

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_12 + var_282_22 and arg_279_1.time_ < var_282_12 + var_282_22 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play121481070 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 121481070
		arg_283_1.duration_ = 4.9

		local var_283_0 = {
			ja = 4.9,
			ko = 3,
			zh = 3
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
				arg_283_0:Play121481071(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = arg_283_1.actors_["1069ui_story"]
			local var_286_1 = 0

			if var_286_1 < arg_283_1.time_ and arg_283_1.time_ <= var_286_1 + arg_286_0 and arg_283_1.var_.characterEffect1069ui_story == nil then
				arg_283_1.var_.characterEffect1069ui_story = var_286_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_286_2 = 0.200000002980232

			if var_286_1 <= arg_283_1.time_ and arg_283_1.time_ < var_286_1 + var_286_2 then
				local var_286_3 = (arg_283_1.time_ - var_286_1) / var_286_2

				if arg_283_1.var_.characterEffect1069ui_story then
					arg_283_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_283_1.time_ >= var_286_1 + var_286_2 and arg_283_1.time_ < var_286_1 + var_286_2 + arg_286_0 and arg_283_1.var_.characterEffect1069ui_story then
				arg_283_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_286_4 = 0

			if var_286_4 < arg_283_1.time_ and arg_283_1.time_ <= var_286_4 + arg_286_0 then
				arg_283_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action3_1")
			end

			local var_286_5 = 0

			if var_286_5 < arg_283_1.time_ and arg_283_1.time_ <= var_286_5 + arg_286_0 then
				arg_283_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_286_6 = arg_283_1.actors_["1084ui_story"]
			local var_286_7 = 0

			if var_286_7 < arg_283_1.time_ and arg_283_1.time_ <= var_286_7 + arg_286_0 and arg_283_1.var_.characterEffect1084ui_story == nil then
				arg_283_1.var_.characterEffect1084ui_story = var_286_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_286_8 = 0.200000002980232

			if var_286_7 <= arg_283_1.time_ and arg_283_1.time_ < var_286_7 + var_286_8 then
				local var_286_9 = (arg_283_1.time_ - var_286_7) / var_286_8

				if arg_283_1.var_.characterEffect1084ui_story then
					local var_286_10 = Mathf.Lerp(0, 0.5, var_286_9)

					arg_283_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_283_1.var_.characterEffect1084ui_story.fillRatio = var_286_10
				end
			end

			if arg_283_1.time_ >= var_286_7 + var_286_8 and arg_283_1.time_ < var_286_7 + var_286_8 + arg_286_0 and arg_283_1.var_.characterEffect1084ui_story then
				local var_286_11 = 0.5

				arg_283_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_283_1.var_.characterEffect1084ui_story.fillRatio = var_286_11
			end

			local var_286_12 = 0
			local var_286_13 = 0.4

			if var_286_12 < arg_283_1.time_ and arg_283_1.time_ <= var_286_12 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_14 = arg_283_1:FormatText(StoryNameCfg[378].name)

				arg_283_1.leftNameTxt_.text = var_286_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_15 = arg_283_1:GetWordFromCfg(121481070)
				local var_286_16 = arg_283_1:FormatText(var_286_15.content)

				arg_283_1.text_.text = var_286_16

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_17 = 16
				local var_286_18 = utf8.len(var_286_16)
				local var_286_19 = var_286_17 <= 0 and var_286_13 or var_286_13 * (var_286_18 / var_286_17)

				if var_286_19 > 0 and var_286_13 < var_286_19 then
					arg_283_1.talkMaxDuration = var_286_19

					if var_286_19 + var_286_12 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_19 + var_286_12
					end
				end

				arg_283_1.text_.text = var_286_16
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481070", "story_v_out_121481.awb") ~= 0 then
					local var_286_20 = manager.audio:GetVoiceLength("story_v_out_121481", "121481070", "story_v_out_121481.awb") / 1000

					if var_286_20 + var_286_12 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_20 + var_286_12
					end

					if var_286_15.prefab_name ~= "" and arg_283_1.actors_[var_286_15.prefab_name] ~= nil then
						local var_286_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_283_1.actors_[var_286_15.prefab_name].transform, "story_v_out_121481", "121481070", "story_v_out_121481.awb")

						arg_283_1:RecordAudio("121481070", var_286_21)
						arg_283_1:RecordAudio("121481070", var_286_21)
					else
						arg_283_1:AudioAction("play", "voice", "story_v_out_121481", "121481070", "story_v_out_121481.awb")
					end

					arg_283_1:RecordHistoryTalkVoice("story_v_out_121481", "121481070", "story_v_out_121481.awb")
				end

				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_22 = math.max(var_286_13, arg_283_1.talkMaxDuration)

			if var_286_12 <= arg_283_1.time_ and arg_283_1.time_ < var_286_12 + var_286_22 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_12) / var_286_22

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_12 + var_286_22 and arg_283_1.time_ < var_286_12 + var_286_22 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play121481071 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 121481071
		arg_287_1.duration_ = 7.3

		local var_287_0 = {
			ja = 5.166,
			ko = 7.3,
			zh = 7.3
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
				arg_287_0:Play121481072(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = 0

			if var_290_0 < arg_287_1.time_ and arg_287_1.time_ <= var_290_0 + arg_290_0 then
				arg_287_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action3_2")
			end

			local var_290_1 = 0

			if var_290_1 < arg_287_1.time_ and arg_287_1.time_ <= var_290_1 + arg_290_0 then
				arg_287_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_290_2 = 0
			local var_290_3 = 0.85

			if var_290_2 < arg_287_1.time_ and arg_287_1.time_ <= var_290_2 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, true)

				local var_290_4 = arg_287_1:FormatText(StoryNameCfg[378].name)

				arg_287_1.leftNameTxt_.text = var_290_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_287_1.leftNameTxt_.transform)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1.leftNameTxt_.text)
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_5 = arg_287_1:GetWordFromCfg(121481071)
				local var_290_6 = arg_287_1:FormatText(var_290_5.content)

				arg_287_1.text_.text = var_290_6

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_7 = 34
				local var_290_8 = utf8.len(var_290_6)
				local var_290_9 = var_290_7 <= 0 and var_290_3 or var_290_3 * (var_290_8 / var_290_7)

				if var_290_9 > 0 and var_290_3 < var_290_9 then
					arg_287_1.talkMaxDuration = var_290_9

					if var_290_9 + var_290_2 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_9 + var_290_2
					end
				end

				arg_287_1.text_.text = var_290_6
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481071", "story_v_out_121481.awb") ~= 0 then
					local var_290_10 = manager.audio:GetVoiceLength("story_v_out_121481", "121481071", "story_v_out_121481.awb") / 1000

					if var_290_10 + var_290_2 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_10 + var_290_2
					end

					if var_290_5.prefab_name ~= "" and arg_287_1.actors_[var_290_5.prefab_name] ~= nil then
						local var_290_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_287_1.actors_[var_290_5.prefab_name].transform, "story_v_out_121481", "121481071", "story_v_out_121481.awb")

						arg_287_1:RecordAudio("121481071", var_290_11)
						arg_287_1:RecordAudio("121481071", var_290_11)
					else
						arg_287_1:AudioAction("play", "voice", "story_v_out_121481", "121481071", "story_v_out_121481.awb")
					end

					arg_287_1:RecordHistoryTalkVoice("story_v_out_121481", "121481071", "story_v_out_121481.awb")
				end

				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_12 = math.max(var_290_3, arg_287_1.talkMaxDuration)

			if var_290_2 <= arg_287_1.time_ and arg_287_1.time_ < var_290_2 + var_290_12 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_2) / var_290_12

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_2 + var_290_12 and arg_287_1.time_ < var_290_2 + var_290_12 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play121481072 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 121481072
		arg_291_1.duration_ = 9.766

		local var_291_0 = {
			ja = 9.766,
			ko = 4.566,
			zh = 4.566
		}
		local var_291_1 = manager.audio:GetLocalizationFlag()

		if var_291_0[var_291_1] ~= nil then
			arg_291_1.duration_ = var_291_0[var_291_1]
		end

		SetActive(arg_291_1.tipsGo_, false)

		function arg_291_1.onSingleLineFinish_()
			arg_291_1.onSingleLineUpdate_ = nil
			arg_291_1.onSingleLineFinish_ = nil
			arg_291_1.state_ = "waiting"
		end

		function arg_291_1.playNext_(arg_293_0)
			if arg_293_0 == 1 then
				arg_291_0:Play121481073(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = arg_291_1.actors_["1084ui_story"]
			local var_294_1 = 0

			if var_294_1 < arg_291_1.time_ and arg_291_1.time_ <= var_294_1 + arg_294_0 and arg_291_1.var_.characterEffect1084ui_story == nil then
				arg_291_1.var_.characterEffect1084ui_story = var_294_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_294_2 = 0.200000002980232

			if var_294_1 <= arg_291_1.time_ and arg_291_1.time_ < var_294_1 + var_294_2 then
				local var_294_3 = (arg_291_1.time_ - var_294_1) / var_294_2

				if arg_291_1.var_.characterEffect1084ui_story then
					arg_291_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_291_1.time_ >= var_294_1 + var_294_2 and arg_291_1.time_ < var_294_1 + var_294_2 + arg_294_0 and arg_291_1.var_.characterEffect1084ui_story then
				arg_291_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_294_4 = 0

			if var_294_4 < arg_291_1.time_ and arg_291_1.time_ <= var_294_4 + arg_294_0 then
				arg_291_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_294_5 = 0

			if var_294_5 < arg_291_1.time_ and arg_291_1.time_ <= var_294_5 + arg_294_0 then
				arg_291_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_294_6 = arg_291_1.actors_["1069ui_story"]
			local var_294_7 = 0

			if var_294_7 < arg_291_1.time_ and arg_291_1.time_ <= var_294_7 + arg_294_0 and arg_291_1.var_.characterEffect1069ui_story == nil then
				arg_291_1.var_.characterEffect1069ui_story = var_294_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_294_8 = 0.200000002980232

			if var_294_7 <= arg_291_1.time_ and arg_291_1.time_ < var_294_7 + var_294_8 then
				local var_294_9 = (arg_291_1.time_ - var_294_7) / var_294_8

				if arg_291_1.var_.characterEffect1069ui_story then
					local var_294_10 = Mathf.Lerp(0, 0.5, var_294_9)

					arg_291_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_291_1.var_.characterEffect1069ui_story.fillRatio = var_294_10
				end
			end

			if arg_291_1.time_ >= var_294_7 + var_294_8 and arg_291_1.time_ < var_294_7 + var_294_8 + arg_294_0 and arg_291_1.var_.characterEffect1069ui_story then
				local var_294_11 = 0.5

				arg_291_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_291_1.var_.characterEffect1069ui_story.fillRatio = var_294_11
			end

			local var_294_12 = 0
			local var_294_13 = 0.45

			if var_294_12 < arg_291_1.time_ and arg_291_1.time_ <= var_294_12 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, true)

				local var_294_14 = arg_291_1:FormatText(StoryNameCfg[6].name)

				arg_291_1.leftNameTxt_.text = var_294_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_291_1.leftNameTxt_.transform)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1.leftNameTxt_.text)
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_15 = arg_291_1:GetWordFromCfg(121481072)
				local var_294_16 = arg_291_1:FormatText(var_294_15.content)

				arg_291_1.text_.text = var_294_16

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_17 = 18
				local var_294_18 = utf8.len(var_294_16)
				local var_294_19 = var_294_17 <= 0 and var_294_13 or var_294_13 * (var_294_18 / var_294_17)

				if var_294_19 > 0 and var_294_13 < var_294_19 then
					arg_291_1.talkMaxDuration = var_294_19

					if var_294_19 + var_294_12 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_19 + var_294_12
					end
				end

				arg_291_1.text_.text = var_294_16
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481072", "story_v_out_121481.awb") ~= 0 then
					local var_294_20 = manager.audio:GetVoiceLength("story_v_out_121481", "121481072", "story_v_out_121481.awb") / 1000

					if var_294_20 + var_294_12 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_20 + var_294_12
					end

					if var_294_15.prefab_name ~= "" and arg_291_1.actors_[var_294_15.prefab_name] ~= nil then
						local var_294_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_291_1.actors_[var_294_15.prefab_name].transform, "story_v_out_121481", "121481072", "story_v_out_121481.awb")

						arg_291_1:RecordAudio("121481072", var_294_21)
						arg_291_1:RecordAudio("121481072", var_294_21)
					else
						arg_291_1:AudioAction("play", "voice", "story_v_out_121481", "121481072", "story_v_out_121481.awb")
					end

					arg_291_1:RecordHistoryTalkVoice("story_v_out_121481", "121481072", "story_v_out_121481.awb")
				end

				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_22 = math.max(var_294_13, arg_291_1.talkMaxDuration)

			if var_294_12 <= arg_291_1.time_ and arg_291_1.time_ < var_294_12 + var_294_22 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_12) / var_294_22

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_12 + var_294_22 and arg_291_1.time_ < var_294_12 + var_294_22 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play121481073 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 121481073
		arg_295_1.duration_ = 7.633

		local var_295_0 = {
			ja = 7.633,
			ko = 5.466,
			zh = 5.466
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
				arg_295_0:Play121481074(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = arg_295_1.actors_["1084ui_story"]
			local var_298_1 = 0

			if var_298_1 < arg_295_1.time_ and arg_295_1.time_ <= var_298_1 + arg_298_0 and arg_295_1.var_.characterEffect1084ui_story == nil then
				arg_295_1.var_.characterEffect1084ui_story = var_298_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_298_2 = 0.200000002980232

			if var_298_1 <= arg_295_1.time_ and arg_295_1.time_ < var_298_1 + var_298_2 then
				local var_298_3 = (arg_295_1.time_ - var_298_1) / var_298_2

				if arg_295_1.var_.characterEffect1084ui_story then
					local var_298_4 = Mathf.Lerp(0, 0.5, var_298_3)

					arg_295_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_295_1.var_.characterEffect1084ui_story.fillRatio = var_298_4
				end
			end

			if arg_295_1.time_ >= var_298_1 + var_298_2 and arg_295_1.time_ < var_298_1 + var_298_2 + arg_298_0 and arg_295_1.var_.characterEffect1084ui_story then
				local var_298_5 = 0.5

				arg_295_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_295_1.var_.characterEffect1084ui_story.fillRatio = var_298_5
			end

			local var_298_6 = arg_295_1.actors_["1069ui_story"]
			local var_298_7 = 0

			if var_298_7 < arg_295_1.time_ and arg_295_1.time_ <= var_298_7 + arg_298_0 and arg_295_1.var_.characterEffect1069ui_story == nil then
				arg_295_1.var_.characterEffect1069ui_story = var_298_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_298_8 = 0.200000002980232

			if var_298_7 <= arg_295_1.time_ and arg_295_1.time_ < var_298_7 + var_298_8 then
				local var_298_9 = (arg_295_1.time_ - var_298_7) / var_298_8

				if arg_295_1.var_.characterEffect1069ui_story then
					arg_295_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_295_1.time_ >= var_298_7 + var_298_8 and arg_295_1.time_ < var_298_7 + var_298_8 + arg_298_0 and arg_295_1.var_.characterEffect1069ui_story then
				arg_295_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_298_10 = 0
			local var_298_11 = 0.675

			if var_298_10 < arg_295_1.time_ and arg_295_1.time_ <= var_298_10 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, true)

				local var_298_12 = arg_295_1:FormatText(StoryNameCfg[378].name)

				arg_295_1.leftNameTxt_.text = var_298_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_295_1.leftNameTxt_.transform)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1.leftNameTxt_.text)
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_13 = arg_295_1:GetWordFromCfg(121481073)
				local var_298_14 = arg_295_1:FormatText(var_298_13.content)

				arg_295_1.text_.text = var_298_14

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_15 = 27
				local var_298_16 = utf8.len(var_298_14)
				local var_298_17 = var_298_15 <= 0 and var_298_11 or var_298_11 * (var_298_16 / var_298_15)

				if var_298_17 > 0 and var_298_11 < var_298_17 then
					arg_295_1.talkMaxDuration = var_298_17

					if var_298_17 + var_298_10 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_17 + var_298_10
					end
				end

				arg_295_1.text_.text = var_298_14
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481073", "story_v_out_121481.awb") ~= 0 then
					local var_298_18 = manager.audio:GetVoiceLength("story_v_out_121481", "121481073", "story_v_out_121481.awb") / 1000

					if var_298_18 + var_298_10 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_18 + var_298_10
					end

					if var_298_13.prefab_name ~= "" and arg_295_1.actors_[var_298_13.prefab_name] ~= nil then
						local var_298_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_295_1.actors_[var_298_13.prefab_name].transform, "story_v_out_121481", "121481073", "story_v_out_121481.awb")

						arg_295_1:RecordAudio("121481073", var_298_19)
						arg_295_1:RecordAudio("121481073", var_298_19)
					else
						arg_295_1:AudioAction("play", "voice", "story_v_out_121481", "121481073", "story_v_out_121481.awb")
					end

					arg_295_1:RecordHistoryTalkVoice("story_v_out_121481", "121481073", "story_v_out_121481.awb")
				end

				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_20 = math.max(var_298_11, arg_295_1.talkMaxDuration)

			if var_298_10 <= arg_295_1.time_ and arg_295_1.time_ < var_298_10 + var_298_20 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_10) / var_298_20

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_10 + var_298_20 and arg_295_1.time_ < var_298_10 + var_298_20 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play121481074 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 121481074
		arg_299_1.duration_ = 9.166

		local var_299_0 = {
			ja = 9.166,
			ko = 3.933,
			zh = 3.933
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
				arg_299_0:Play121481075(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = 0
			local var_302_1 = 0.55

			if var_302_0 < arg_299_1.time_ and arg_299_1.time_ <= var_302_0 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_2 = arg_299_1:FormatText(StoryNameCfg[378].name)

				arg_299_1.leftNameTxt_.text = var_302_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_3 = arg_299_1:GetWordFromCfg(121481074)
				local var_302_4 = arg_299_1:FormatText(var_302_3.content)

				arg_299_1.text_.text = var_302_4

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_5 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481074", "story_v_out_121481.awb") ~= 0 then
					local var_302_8 = manager.audio:GetVoiceLength("story_v_out_121481", "121481074", "story_v_out_121481.awb") / 1000

					if var_302_8 + var_302_0 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_8 + var_302_0
					end

					if var_302_3.prefab_name ~= "" and arg_299_1.actors_[var_302_3.prefab_name] ~= nil then
						local var_302_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_299_1.actors_[var_302_3.prefab_name].transform, "story_v_out_121481", "121481074", "story_v_out_121481.awb")

						arg_299_1:RecordAudio("121481074", var_302_9)
						arg_299_1:RecordAudio("121481074", var_302_9)
					else
						arg_299_1:AudioAction("play", "voice", "story_v_out_121481", "121481074", "story_v_out_121481.awb")
					end

					arg_299_1:RecordHistoryTalkVoice("story_v_out_121481", "121481074", "story_v_out_121481.awb")
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
	Play121481075 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 121481075
		arg_303_1.duration_ = 5

		SetActive(arg_303_1.tipsGo_, false)

		function arg_303_1.onSingleLineFinish_()
			arg_303_1.onSingleLineUpdate_ = nil
			arg_303_1.onSingleLineFinish_ = nil
			arg_303_1.state_ = "waiting"
		end

		function arg_303_1.playNext_(arg_305_0)
			if arg_305_0 == 1 then
				arg_303_0:Play121481076(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = arg_303_1.actors_["1069ui_story"]
			local var_306_1 = 0

			if var_306_1 < arg_303_1.time_ and arg_303_1.time_ <= var_306_1 + arg_306_0 and arg_303_1.var_.characterEffect1069ui_story == nil then
				arg_303_1.var_.characterEffect1069ui_story = var_306_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_306_2 = 0.200000002980232

			if var_306_1 <= arg_303_1.time_ and arg_303_1.time_ < var_306_1 + var_306_2 then
				local var_306_3 = (arg_303_1.time_ - var_306_1) / var_306_2

				if arg_303_1.var_.characterEffect1069ui_story then
					local var_306_4 = Mathf.Lerp(0, 0.5, var_306_3)

					arg_303_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_303_1.var_.characterEffect1069ui_story.fillRatio = var_306_4
				end
			end

			if arg_303_1.time_ >= var_306_1 + var_306_2 and arg_303_1.time_ < var_306_1 + var_306_2 + arg_306_0 and arg_303_1.var_.characterEffect1069ui_story then
				local var_306_5 = 0.5

				arg_303_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_303_1.var_.characterEffect1069ui_story.fillRatio = var_306_5
			end

			local var_306_6 = 0
			local var_306_7 = 0.2

			if var_306_6 < arg_303_1.time_ and arg_303_1.time_ <= var_306_6 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, true)

				local var_306_8 = arg_303_1:FormatText(StoryNameCfg[7].name)

				arg_303_1.leftNameTxt_.text = var_306_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_303_1.leftNameTxt_.transform)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1.leftNameTxt_.text)
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_9 = arg_303_1:GetWordFromCfg(121481075)
				local var_306_10 = arg_303_1:FormatText(var_306_9.content)

				arg_303_1.text_.text = var_306_10

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_11 = 8
				local var_306_12 = utf8.len(var_306_10)
				local var_306_13 = var_306_11 <= 0 and var_306_7 or var_306_7 * (var_306_12 / var_306_11)

				if var_306_13 > 0 and var_306_7 < var_306_13 then
					arg_303_1.talkMaxDuration = var_306_13

					if var_306_13 + var_306_6 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_13 + var_306_6
					end
				end

				arg_303_1.text_.text = var_306_10
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)
				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_14 = math.max(var_306_7, arg_303_1.talkMaxDuration)

			if var_306_6 <= arg_303_1.time_ and arg_303_1.time_ < var_306_6 + var_306_14 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_6) / var_306_14

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_6 + var_306_14 and arg_303_1.time_ < var_306_6 + var_306_14 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play121481076 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 121481076
		arg_307_1.duration_ = 5

		SetActive(arg_307_1.tipsGo_, false)

		function arg_307_1.onSingleLineFinish_()
			arg_307_1.onSingleLineUpdate_ = nil
			arg_307_1.onSingleLineFinish_ = nil
			arg_307_1.state_ = "waiting"
		end

		function arg_307_1.playNext_(arg_309_0)
			if arg_309_0 == 1 then
				arg_307_0:Play121481077(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = arg_307_1.actors_["1084ui_story"].transform
			local var_310_1 = 0

			if var_310_1 < arg_307_1.time_ and arg_307_1.time_ <= var_310_1 + arg_310_0 then
				arg_307_1.var_.moveOldPos1084ui_story = var_310_0.localPosition
			end

			local var_310_2 = 0.001

			if var_310_1 <= arg_307_1.time_ and arg_307_1.time_ < var_310_1 + var_310_2 then
				local var_310_3 = (arg_307_1.time_ - var_310_1) / var_310_2
				local var_310_4 = Vector3.New(0, 100, 0)

				var_310_0.localPosition = Vector3.Lerp(arg_307_1.var_.moveOldPos1084ui_story, var_310_4, var_310_3)

				local var_310_5 = manager.ui.mainCamera.transform.position - var_310_0.position

				var_310_0.forward = Vector3.New(var_310_5.x, var_310_5.y, var_310_5.z)

				local var_310_6 = var_310_0.localEulerAngles

				var_310_6.z = 0
				var_310_6.x = 0
				var_310_0.localEulerAngles = var_310_6
			end

			if arg_307_1.time_ >= var_310_1 + var_310_2 and arg_307_1.time_ < var_310_1 + var_310_2 + arg_310_0 then
				var_310_0.localPosition = Vector3.New(0, 100, 0)

				local var_310_7 = manager.ui.mainCamera.transform.position - var_310_0.position

				var_310_0.forward = Vector3.New(var_310_7.x, var_310_7.y, var_310_7.z)

				local var_310_8 = var_310_0.localEulerAngles

				var_310_8.z = 0
				var_310_8.x = 0
				var_310_0.localEulerAngles = var_310_8
			end

			local var_310_9 = arg_307_1.actors_["1084ui_story"]
			local var_310_10 = 0

			if var_310_10 < arg_307_1.time_ and arg_307_1.time_ <= var_310_10 + arg_310_0 and arg_307_1.var_.characterEffect1084ui_story == nil then
				arg_307_1.var_.characterEffect1084ui_story = var_310_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_310_11 = 0.200000002980232

			if var_310_10 <= arg_307_1.time_ and arg_307_1.time_ < var_310_10 + var_310_11 then
				local var_310_12 = (arg_307_1.time_ - var_310_10) / var_310_11

				if arg_307_1.var_.characterEffect1084ui_story then
					local var_310_13 = Mathf.Lerp(0, 0.5, var_310_12)

					arg_307_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_307_1.var_.characterEffect1084ui_story.fillRatio = var_310_13
				end
			end

			if arg_307_1.time_ >= var_310_10 + var_310_11 and arg_307_1.time_ < var_310_10 + var_310_11 + arg_310_0 and arg_307_1.var_.characterEffect1084ui_story then
				local var_310_14 = 0.5

				arg_307_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_307_1.var_.characterEffect1084ui_story.fillRatio = var_310_14
			end

			local var_310_15 = arg_307_1.actors_["1069ui_story"].transform
			local var_310_16 = 0

			if var_310_16 < arg_307_1.time_ and arg_307_1.time_ <= var_310_16 + arg_310_0 then
				arg_307_1.var_.moveOldPos1069ui_story = var_310_15.localPosition
			end

			local var_310_17 = 0.001

			if var_310_16 <= arg_307_1.time_ and arg_307_1.time_ < var_310_16 + var_310_17 then
				local var_310_18 = (arg_307_1.time_ - var_310_16) / var_310_17
				local var_310_19 = Vector3.New(0, 100, 0)

				var_310_15.localPosition = Vector3.Lerp(arg_307_1.var_.moveOldPos1069ui_story, var_310_19, var_310_18)

				local var_310_20 = manager.ui.mainCamera.transform.position - var_310_15.position

				var_310_15.forward = Vector3.New(var_310_20.x, var_310_20.y, var_310_20.z)

				local var_310_21 = var_310_15.localEulerAngles

				var_310_21.z = 0
				var_310_21.x = 0
				var_310_15.localEulerAngles = var_310_21
			end

			if arg_307_1.time_ >= var_310_16 + var_310_17 and arg_307_1.time_ < var_310_16 + var_310_17 + arg_310_0 then
				var_310_15.localPosition = Vector3.New(0, 100, 0)

				local var_310_22 = manager.ui.mainCamera.transform.position - var_310_15.position

				var_310_15.forward = Vector3.New(var_310_22.x, var_310_22.y, var_310_22.z)

				local var_310_23 = var_310_15.localEulerAngles

				var_310_23.z = 0
				var_310_23.x = 0
				var_310_15.localEulerAngles = var_310_23
			end

			local var_310_24 = arg_307_1.actors_["1069ui_story"]
			local var_310_25 = 0

			if var_310_25 < arg_307_1.time_ and arg_307_1.time_ <= var_310_25 + arg_310_0 and arg_307_1.var_.characterEffect1069ui_story == nil then
				arg_307_1.var_.characterEffect1069ui_story = var_310_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_310_26 = 0.200000002980232

			if var_310_25 <= arg_307_1.time_ and arg_307_1.time_ < var_310_25 + var_310_26 then
				local var_310_27 = (arg_307_1.time_ - var_310_25) / var_310_26

				if arg_307_1.var_.characterEffect1069ui_story then
					local var_310_28 = Mathf.Lerp(0, 0.5, var_310_27)

					arg_307_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_307_1.var_.characterEffect1069ui_story.fillRatio = var_310_28
				end
			end

			if arg_307_1.time_ >= var_310_25 + var_310_26 and arg_307_1.time_ < var_310_25 + var_310_26 + arg_310_0 and arg_307_1.var_.characterEffect1069ui_story then
				local var_310_29 = 0.5

				arg_307_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_307_1.var_.characterEffect1069ui_story.fillRatio = var_310_29
			end

			local var_310_30 = 0
			local var_310_31 = 0.65

			if var_310_30 < arg_307_1.time_ and arg_307_1.time_ <= var_310_30 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, false)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_32 = arg_307_1:GetWordFromCfg(121481076)
				local var_310_33 = arg_307_1:FormatText(var_310_32.content)

				arg_307_1.text_.text = var_310_33

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_34 = 26
				local var_310_35 = utf8.len(var_310_33)
				local var_310_36 = var_310_34 <= 0 and var_310_31 or var_310_31 * (var_310_35 / var_310_34)

				if var_310_36 > 0 and var_310_31 < var_310_36 then
					arg_307_1.talkMaxDuration = var_310_36

					if var_310_36 + var_310_30 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_36 + var_310_30
					end
				end

				arg_307_1.text_.text = var_310_33
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)
				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_37 = math.max(var_310_31, arg_307_1.talkMaxDuration)

			if var_310_30 <= arg_307_1.time_ and arg_307_1.time_ < var_310_30 + var_310_37 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_30) / var_310_37

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_30 + var_310_37 and arg_307_1.time_ < var_310_30 + var_310_37 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play121481077 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 121481077
		arg_311_1.duration_ = 15.865999999999

		local var_311_0 = {
			ja = 15.865999999999,
			ko = 14.432999999999,
			zh = 14.432999999999
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
				arg_311_0:Play121481078(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = "ST42"

			if arg_311_1.bgs_[var_314_0] == nil then
				local var_314_1 = Object.Instantiate(arg_311_1.paintGo_)

				var_314_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_314_0)
				var_314_1.name = var_314_0
				var_314_1.transform.parent = arg_311_1.stage_.transform
				var_314_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_311_1.bgs_[var_314_0] = var_314_1
			end

			local var_314_2 = 1.999999999999

			if var_314_2 < arg_311_1.time_ and arg_311_1.time_ <= var_314_2 + arg_314_0 then
				local var_314_3 = manager.ui.mainCamera.transform.localPosition
				local var_314_4 = Vector3.New(0, 0, 10) + Vector3.New(var_314_3.x, var_314_3.y, 0)
				local var_314_5 = arg_311_1.bgs_.ST42

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
					if iter_314_0 ~= "ST42" then
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

			local var_314_21 = 1.999999999999

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

			local var_314_27 = 0
			local var_314_28 = 0.2

			if var_314_27 < arg_311_1.time_ and arg_311_1.time_ <= var_314_27 + arg_314_0 then
				local var_314_29 = "play"
				local var_314_30 = "effect"

				arg_311_1:AudioAction(var_314_29, var_314_30, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_314_31 = 0.3
			local var_314_32 = 1

			if var_314_31 < arg_311_1.time_ and arg_311_1.time_ <= var_314_31 + arg_314_0 then
				local var_314_33 = "play"
				local var_314_34 = "music"

				arg_311_1:AudioAction(var_314_33, var_314_34, "bgm_story_scheme", "bgm_story_scheme", "bgm_story_scheme.awb")
			end

			local var_314_35 = 2

			if var_314_35 < arg_311_1.time_ and arg_311_1.time_ <= var_314_35 + arg_314_0 then
				arg_311_1.screenFilterGo_:SetActive(true)

				arg_311_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
			end

			local var_314_36 = 0.1

			if var_314_35 <= arg_311_1.time_ and arg_311_1.time_ < var_314_35 + var_314_36 then
				local var_314_37 = (arg_311_1.time_ - var_314_35) / var_314_36

				arg_311_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_314_37)
			end

			if arg_311_1.time_ >= var_314_35 + var_314_36 and arg_311_1.time_ < var_314_35 + var_314_36 + arg_314_0 then
				arg_311_1.screenFilterEffect_.weight = 1
			end

			if arg_311_1.frameCnt_ <= 1 then
				arg_311_1.dialog_:SetActive(false)
			end

			local var_314_38 = 3.999999999999
			local var_314_39 = 1.225

			if var_314_38 < arg_311_1.time_ and arg_311_1.time_ <= var_314_38 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0

				arg_311_1.dialog_:SetActive(true)

				local var_314_40 = LeanTween.value(arg_311_1.dialog_, 0, 1, 0.3)

				var_314_40:setOnUpdate(LuaHelper.FloatAction(function(arg_315_0)
					arg_311_1.dialogCg_.alpha = arg_315_0
				end))
				var_314_40:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_311_1.dialog_)
					var_314_40:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_311_1.duration_ = arg_311_1.duration_ + 0.3

				SetActive(arg_311_1.leftNameGo_, true)

				local var_314_41 = arg_311_1:FormatText(StoryNameCfg[379].name)

				arg_311_1.leftNameTxt_.text = var_314_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_311_1.leftNameTxt_.transform)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1.leftNameTxt_.text)
				SetActive(arg_311_1.iconTrs_.gameObject, true)
				arg_311_1.iconController_:SetSelectedState("hero")

				arg_311_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1072")

				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_42 = arg_311_1:GetWordFromCfg(121481077)
				local var_314_43 = arg_311_1:FormatText(var_314_42.content)

				arg_311_1.text_.text = var_314_43

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_44 = 49
				local var_314_45 = utf8.len(var_314_43)
				local var_314_46 = var_314_44 <= 0 and var_314_39 or var_314_39 * (var_314_45 / var_314_44)

				if var_314_46 > 0 and var_314_39 < var_314_46 then
					arg_311_1.talkMaxDuration = var_314_46
					var_314_38 = var_314_38 + 0.3

					if var_314_46 + var_314_38 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_46 + var_314_38
					end
				end

				arg_311_1.text_.text = var_314_43
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481077", "story_v_out_121481.awb") ~= 0 then
					local var_314_47 = manager.audio:GetVoiceLength("story_v_out_121481", "121481077", "story_v_out_121481.awb") / 1000

					if var_314_47 + var_314_38 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_47 + var_314_38
					end

					if var_314_42.prefab_name ~= "" and arg_311_1.actors_[var_314_42.prefab_name] ~= nil then
						local var_314_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_311_1.actors_[var_314_42.prefab_name].transform, "story_v_out_121481", "121481077", "story_v_out_121481.awb")

						arg_311_1:RecordAudio("121481077", var_314_48)
						arg_311_1:RecordAudio("121481077", var_314_48)
					else
						arg_311_1:AudioAction("play", "voice", "story_v_out_121481", "121481077", "story_v_out_121481.awb")
					end

					arg_311_1:RecordHistoryTalkVoice("story_v_out_121481", "121481077", "story_v_out_121481.awb")
				end

				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_49 = var_314_38 + 0.3
			local var_314_50 = math.max(var_314_39, arg_311_1.talkMaxDuration)

			if var_314_49 <= arg_311_1.time_ and arg_311_1.time_ < var_314_49 + var_314_50 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_49) / var_314_50

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_49 + var_314_50 and arg_311_1.time_ < var_314_49 + var_314_50 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play121481078 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 121481078
		arg_317_1.duration_ = 2.8

		local var_317_0 = {
			ja = 2.8,
			ko = 1.7,
			zh = 1.7
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
				arg_317_0:Play121481079(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = 0
			local var_320_1 = 0.225

			if var_320_0 < arg_317_1.time_ and arg_317_1.time_ <= var_320_0 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, true)

				local var_320_2 = arg_317_1:FormatText(StoryNameCfg[378].name)

				arg_317_1.leftNameTxt_.text = var_320_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_317_1.leftNameTxt_.transform)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1.leftNameTxt_.text)
				SetActive(arg_317_1.iconTrs_.gameObject, true)
				arg_317_1.iconController_:SetSelectedState("hero")

				arg_317_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1069")

				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_3 = arg_317_1:GetWordFromCfg(121481078)
				local var_320_4 = arg_317_1:FormatText(var_320_3.content)

				arg_317_1.text_.text = var_320_4

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_5 = 9
				local var_320_6 = utf8.len(var_320_4)
				local var_320_7 = var_320_5 <= 0 and var_320_1 or var_320_1 * (var_320_6 / var_320_5)

				if var_320_7 > 0 and var_320_1 < var_320_7 then
					arg_317_1.talkMaxDuration = var_320_7

					if var_320_7 + var_320_0 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_7 + var_320_0
					end
				end

				arg_317_1.text_.text = var_320_4
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481078", "story_v_out_121481.awb") ~= 0 then
					local var_320_8 = manager.audio:GetVoiceLength("story_v_out_121481", "121481078", "story_v_out_121481.awb") / 1000

					if var_320_8 + var_320_0 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_8 + var_320_0
					end

					if var_320_3.prefab_name ~= "" and arg_317_1.actors_[var_320_3.prefab_name] ~= nil then
						local var_320_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_317_1.actors_[var_320_3.prefab_name].transform, "story_v_out_121481", "121481078", "story_v_out_121481.awb")

						arg_317_1:RecordAudio("121481078", var_320_9)
						arg_317_1:RecordAudio("121481078", var_320_9)
					else
						arg_317_1:AudioAction("play", "voice", "story_v_out_121481", "121481078", "story_v_out_121481.awb")
					end

					arg_317_1:RecordHistoryTalkVoice("story_v_out_121481", "121481078", "story_v_out_121481.awb")
				end

				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_10 = math.max(var_320_1, arg_317_1.talkMaxDuration)

			if var_320_0 <= arg_317_1.time_ and arg_317_1.time_ < var_320_0 + var_320_10 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_0) / var_320_10

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_0 + var_320_10 and arg_317_1.time_ < var_320_0 + var_320_10 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play121481079 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 121481079
		arg_321_1.duration_ = 10.8

		local var_321_0 = {
			ja = 10.8,
			ko = 10.4,
			zh = 10.4
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
				arg_321_0:Play121481080(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = 0
			local var_324_1 = 1.35

			if var_324_0 < arg_321_1.time_ and arg_321_1.time_ <= var_324_0 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, true)

				local var_324_2 = arg_321_1:FormatText(StoryNameCfg[379].name)

				arg_321_1.leftNameTxt_.text = var_324_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_321_1.leftNameTxt_.transform)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1.leftNameTxt_.text)
				SetActive(arg_321_1.iconTrs_.gameObject, true)
				arg_321_1.iconController_:SetSelectedState("hero")

				arg_321_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1072")

				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_3 = arg_321_1:GetWordFromCfg(121481079)
				local var_324_4 = arg_321_1:FormatText(var_324_3.content)

				arg_321_1.text_.text = var_324_4

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_5 = 54
				local var_324_6 = utf8.len(var_324_4)
				local var_324_7 = var_324_5 <= 0 and var_324_1 or var_324_1 * (var_324_6 / var_324_5)

				if var_324_7 > 0 and var_324_1 < var_324_7 then
					arg_321_1.talkMaxDuration = var_324_7

					if var_324_7 + var_324_0 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_7 + var_324_0
					end
				end

				arg_321_1.text_.text = var_324_4
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481079", "story_v_out_121481.awb") ~= 0 then
					local var_324_8 = manager.audio:GetVoiceLength("story_v_out_121481", "121481079", "story_v_out_121481.awb") / 1000

					if var_324_8 + var_324_0 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_8 + var_324_0
					end

					if var_324_3.prefab_name ~= "" and arg_321_1.actors_[var_324_3.prefab_name] ~= nil then
						local var_324_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_321_1.actors_[var_324_3.prefab_name].transform, "story_v_out_121481", "121481079", "story_v_out_121481.awb")

						arg_321_1:RecordAudio("121481079", var_324_9)
						arg_321_1:RecordAudio("121481079", var_324_9)
					else
						arg_321_1:AudioAction("play", "voice", "story_v_out_121481", "121481079", "story_v_out_121481.awb")
					end

					arg_321_1:RecordHistoryTalkVoice("story_v_out_121481", "121481079", "story_v_out_121481.awb")
				end

				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_10 = math.max(var_324_1, arg_321_1.talkMaxDuration)

			if var_324_0 <= arg_321_1.time_ and arg_321_1.time_ < var_324_0 + var_324_10 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_0) / var_324_10

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_0 + var_324_10 and arg_321_1.time_ < var_324_0 + var_324_10 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play121481080 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 121481080
		arg_325_1.duration_ = 1.566

		local var_325_0 = {
			ja = 1.566,
			ko = 0.999999999999,
			zh = 0.999999999999
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
				arg_325_0:Play121481081(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = 0
			local var_328_1 = 0.05

			if var_328_0 < arg_325_1.time_ and arg_325_1.time_ <= var_328_0 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, true)

				local var_328_2 = arg_325_1:FormatText(StoryNameCfg[378].name)

				arg_325_1.leftNameTxt_.text = var_328_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_325_1.leftNameTxt_.transform)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1.leftNameTxt_.text)
				SetActive(arg_325_1.iconTrs_.gameObject, true)
				arg_325_1.iconController_:SetSelectedState("hero")

				arg_325_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1069")

				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_3 = arg_325_1:GetWordFromCfg(121481080)
				local var_328_4 = arg_325_1:FormatText(var_328_3.content)

				arg_325_1.text_.text = var_328_4

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_5 = 2
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

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481080", "story_v_out_121481.awb") ~= 0 then
					local var_328_8 = manager.audio:GetVoiceLength("story_v_out_121481", "121481080", "story_v_out_121481.awb") / 1000

					if var_328_8 + var_328_0 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_8 + var_328_0
					end

					if var_328_3.prefab_name ~= "" and arg_325_1.actors_[var_328_3.prefab_name] ~= nil then
						local var_328_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_325_1.actors_[var_328_3.prefab_name].transform, "story_v_out_121481", "121481080", "story_v_out_121481.awb")

						arg_325_1:RecordAudio("121481080", var_328_9)
						arg_325_1:RecordAudio("121481080", var_328_9)
					else
						arg_325_1:AudioAction("play", "voice", "story_v_out_121481", "121481080", "story_v_out_121481.awb")
					end

					arg_325_1:RecordHistoryTalkVoice("story_v_out_121481", "121481080", "story_v_out_121481.awb")
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
	Play121481081 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 121481081
		arg_329_1.duration_ = 10.3

		local var_329_0 = {
			ja = 10.3,
			ko = 8.2,
			zh = 8.2
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
				arg_329_0:Play121481082(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = "J02h"

			if arg_329_1.bgs_[var_332_0] == nil then
				local var_332_1 = Object.Instantiate(arg_329_1.paintGo_)

				var_332_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_332_0)
				var_332_1.name = var_332_0
				var_332_1.transform.parent = arg_329_1.stage_.transform
				var_332_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_329_1.bgs_[var_332_0] = var_332_1
			end

			local var_332_2 = 2

			if var_332_2 < arg_329_1.time_ and arg_329_1.time_ <= var_332_2 + arg_332_0 then
				local var_332_3 = manager.ui.mainCamera.transform.localPosition
				local var_332_4 = Vector3.New(0, 0, 10) + Vector3.New(var_332_3.x, var_332_3.y, 0)
				local var_332_5 = arg_329_1.bgs_.J02h

				var_332_5.transform.localPosition = var_332_4
				var_332_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_332_6 = var_332_5:GetComponent("SpriteRenderer")

				if var_332_6 and var_332_6.sprite then
					local var_332_7 = (var_332_5.transform.localPosition - var_332_3).z
					local var_332_8 = manager.ui.mainCameraCom_
					local var_332_9 = 2 * var_332_7 * Mathf.Tan(var_332_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_332_10 = var_332_9 * var_332_8.aspect
					local var_332_11 = var_332_6.sprite.bounds.size.x
					local var_332_12 = var_332_6.sprite.bounds.size.y
					local var_332_13 = var_332_10 / var_332_11
					local var_332_14 = var_332_9 / var_332_12
					local var_332_15 = var_332_14 < var_332_13 and var_332_13 or var_332_14

					var_332_5.transform.localScale = Vector3.New(var_332_15, var_332_15, 0)
				end

				for iter_332_0, iter_332_1 in pairs(arg_329_1.bgs_) do
					if iter_332_0 ~= "J02h" then
						iter_332_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_332_16 = 0

			if var_332_16 < arg_329_1.time_ and arg_329_1.time_ <= var_332_16 + arg_332_0 then
				arg_329_1.mask_.enabled = true
				arg_329_1.mask_.raycastTarget = true

				arg_329_1:SetGaussion(false)
			end

			local var_332_17 = 2

			if var_332_16 <= arg_329_1.time_ and arg_329_1.time_ < var_332_16 + var_332_17 then
				local var_332_18 = (arg_329_1.time_ - var_332_16) / var_332_17
				local var_332_19 = Color.New(0, 0, 0)

				var_332_19.a = Mathf.Lerp(0, 1, var_332_18)
				arg_329_1.mask_.color = var_332_19
			end

			if arg_329_1.time_ >= var_332_16 + var_332_17 and arg_329_1.time_ < var_332_16 + var_332_17 + arg_332_0 then
				local var_332_20 = Color.New(0, 0, 0)

				var_332_20.a = 1
				arg_329_1.mask_.color = var_332_20
			end

			local var_332_21 = 2.00000000298023

			if var_332_21 < arg_329_1.time_ and arg_329_1.time_ <= var_332_21 + arg_332_0 then
				arg_329_1.mask_.enabled = true
				arg_329_1.mask_.raycastTarget = true

				arg_329_1:SetGaussion(false)
			end

			local var_332_22 = 2

			if var_332_21 <= arg_329_1.time_ and arg_329_1.time_ < var_332_21 + var_332_22 then
				local var_332_23 = (arg_329_1.time_ - var_332_21) / var_332_22
				local var_332_24 = Color.New(0, 0, 0)

				var_332_24.a = Mathf.Lerp(1, 0, var_332_23)
				arg_329_1.mask_.color = var_332_24
			end

			if arg_329_1.time_ >= var_332_21 + var_332_22 and arg_329_1.time_ < var_332_21 + var_332_22 + arg_332_0 then
				local var_332_25 = Color.New(0, 0, 0)
				local var_332_26 = 0

				arg_329_1.mask_.enabled = false
				var_332_25.a = var_332_26
				arg_329_1.mask_.color = var_332_25
			end

			local var_332_27 = arg_329_1.actors_["1069ui_story"].transform
			local var_332_28 = 3.8

			if var_332_28 < arg_329_1.time_ and arg_329_1.time_ <= var_332_28 + arg_332_0 then
				arg_329_1.var_.moveOldPos1069ui_story = var_332_27.localPosition
			end

			local var_332_29 = 0.001

			if var_332_28 <= arg_329_1.time_ and arg_329_1.time_ < var_332_28 + var_332_29 then
				local var_332_30 = (arg_329_1.time_ - var_332_28) / var_332_29
				local var_332_31 = Vector3.New(0, -1, -6)

				var_332_27.localPosition = Vector3.Lerp(arg_329_1.var_.moveOldPos1069ui_story, var_332_31, var_332_30)

				local var_332_32 = manager.ui.mainCamera.transform.position - var_332_27.position

				var_332_27.forward = Vector3.New(var_332_32.x, var_332_32.y, var_332_32.z)

				local var_332_33 = var_332_27.localEulerAngles

				var_332_33.z = 0
				var_332_33.x = 0
				var_332_27.localEulerAngles = var_332_33
			end

			if arg_329_1.time_ >= var_332_28 + var_332_29 and arg_329_1.time_ < var_332_28 + var_332_29 + arg_332_0 then
				var_332_27.localPosition = Vector3.New(0, -1, -6)

				local var_332_34 = manager.ui.mainCamera.transform.position - var_332_27.position

				var_332_27.forward = Vector3.New(var_332_34.x, var_332_34.y, var_332_34.z)

				local var_332_35 = var_332_27.localEulerAngles

				var_332_35.z = 0
				var_332_35.x = 0
				var_332_27.localEulerAngles = var_332_35
			end

			local var_332_36 = arg_329_1.actors_["1069ui_story"]
			local var_332_37 = 3.8

			if var_332_37 < arg_329_1.time_ and arg_329_1.time_ <= var_332_37 + arg_332_0 and arg_329_1.var_.characterEffect1069ui_story == nil then
				arg_329_1.var_.characterEffect1069ui_story = var_332_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_332_38 = 0.200000002980232

			if var_332_37 <= arg_329_1.time_ and arg_329_1.time_ < var_332_37 + var_332_38 then
				local var_332_39 = (arg_329_1.time_ - var_332_37) / var_332_38

				if arg_329_1.var_.characterEffect1069ui_story then
					arg_329_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_329_1.time_ >= var_332_37 + var_332_38 and arg_329_1.time_ < var_332_37 + var_332_38 + arg_332_0 and arg_329_1.var_.characterEffect1069ui_story then
				arg_329_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_332_40 = 3.8

			if var_332_40 < arg_329_1.time_ and arg_329_1.time_ <= var_332_40 + arg_332_0 then
				arg_329_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action2_1")
			end

			local var_332_41 = 3.8

			if var_332_41 < arg_329_1.time_ and arg_329_1.time_ <= var_332_41 + arg_332_0 then
				arg_329_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_332_42 = 2

			if var_332_42 < arg_329_1.time_ and arg_329_1.time_ <= var_332_42 + arg_332_0 then
				arg_329_1.screenFilterGo_:SetActive(false)
			end

			local var_332_43 = 0.1

			if var_332_42 <= arg_329_1.time_ and arg_329_1.time_ < var_332_42 + var_332_43 then
				local var_332_44 = (arg_329_1.time_ - var_332_42) / var_332_43

				arg_329_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_332_44)
			end

			if arg_329_1.time_ >= var_332_42 + var_332_43 and arg_329_1.time_ < var_332_42 + var_332_43 + arg_332_0 then
				arg_329_1.screenFilterEffect_.weight = 0
			end

			if arg_329_1.frameCnt_ <= 1 then
				arg_329_1.dialog_:SetActive(false)
			end

			local var_332_45 = 4
			local var_332_46 = 0.275

			if var_332_45 < arg_329_1.time_ and arg_329_1.time_ <= var_332_45 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0

				arg_329_1.dialog_:SetActive(true)

				local var_332_47 = LeanTween.value(arg_329_1.dialog_, 0, 1, 0.3)

				var_332_47:setOnUpdate(LuaHelper.FloatAction(function(arg_333_0)
					arg_329_1.dialogCg_.alpha = arg_333_0
				end))
				var_332_47:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_329_1.dialog_)
					var_332_47:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_329_1.duration_ = arg_329_1.duration_ + 0.3

				SetActive(arg_329_1.leftNameGo_, true)

				local var_332_48 = arg_329_1:FormatText(StoryNameCfg[378].name)

				arg_329_1.leftNameTxt_.text = var_332_48

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_329_1.leftNameTxt_.transform)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1.leftNameTxt_.text)
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_49 = arg_329_1:GetWordFromCfg(121481081)
				local var_332_50 = arg_329_1:FormatText(var_332_49.content)

				arg_329_1.text_.text = var_332_50

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_51 = 11
				local var_332_52 = utf8.len(var_332_50)
				local var_332_53 = var_332_51 <= 0 and var_332_46 or var_332_46 * (var_332_52 / var_332_51)

				if var_332_53 > 0 and var_332_46 < var_332_53 then
					arg_329_1.talkMaxDuration = var_332_53
					var_332_45 = var_332_45 + 0.3

					if var_332_53 + var_332_45 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_53 + var_332_45
					end
				end

				arg_329_1.text_.text = var_332_50
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481081", "story_v_out_121481.awb") ~= 0 then
					local var_332_54 = manager.audio:GetVoiceLength("story_v_out_121481", "121481081", "story_v_out_121481.awb") / 1000

					if var_332_54 + var_332_45 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_54 + var_332_45
					end

					if var_332_49.prefab_name ~= "" and arg_329_1.actors_[var_332_49.prefab_name] ~= nil then
						local var_332_55 = LuaForUtil.PlayVoiceWithCriLipsync(arg_329_1.actors_[var_332_49.prefab_name].transform, "story_v_out_121481", "121481081", "story_v_out_121481.awb")

						arg_329_1:RecordAudio("121481081", var_332_55)
						arg_329_1:RecordAudio("121481081", var_332_55)
					else
						arg_329_1:AudioAction("play", "voice", "story_v_out_121481", "121481081", "story_v_out_121481.awb")
					end

					arg_329_1:RecordHistoryTalkVoice("story_v_out_121481", "121481081", "story_v_out_121481.awb")
				end

				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_56 = var_332_45 + 0.3
			local var_332_57 = math.max(var_332_46, arg_329_1.talkMaxDuration)

			if var_332_56 <= arg_329_1.time_ and arg_329_1.time_ < var_332_56 + var_332_57 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_56) / var_332_57

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_56 + var_332_57 and arg_329_1.time_ < var_332_56 + var_332_57 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play121481082 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 121481082
		arg_335_1.duration_ = 9.8

		local var_335_0 = {
			ja = 9.766,
			ko = 9.8,
			zh = 9.8
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
				arg_335_0:Play121481083(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = 0
			local var_338_1 = 1

			if var_338_0 < arg_335_1.time_ and arg_335_1.time_ <= var_338_0 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0
				arg_335_1.dialogCg_.alpha = 1

				arg_335_1.dialog_:SetActive(true)
				SetActive(arg_335_1.leftNameGo_, true)

				local var_338_2 = arg_335_1:FormatText(StoryNameCfg[378].name)

				arg_335_1.leftNameTxt_.text = var_338_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_335_1.leftNameTxt_.transform)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1.leftNameTxt_.text)
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_3 = arg_335_1:GetWordFromCfg(121481082)
				local var_338_4 = arg_335_1:FormatText(var_338_3.content)

				arg_335_1.text_.text = var_338_4

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_5 = 40
				local var_338_6 = utf8.len(var_338_4)
				local var_338_7 = var_338_5 <= 0 and var_338_1 or var_338_1 * (var_338_6 / var_338_5)

				if var_338_7 > 0 and var_338_1 < var_338_7 then
					arg_335_1.talkMaxDuration = var_338_7

					if var_338_7 + var_338_0 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_7 + var_338_0
					end
				end

				arg_335_1.text_.text = var_338_4
				arg_335_1.typewritter.percent = 0

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481082", "story_v_out_121481.awb") ~= 0 then
					local var_338_8 = manager.audio:GetVoiceLength("story_v_out_121481", "121481082", "story_v_out_121481.awb") / 1000

					if var_338_8 + var_338_0 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_8 + var_338_0
					end

					if var_338_3.prefab_name ~= "" and arg_335_1.actors_[var_338_3.prefab_name] ~= nil then
						local var_338_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_335_1.actors_[var_338_3.prefab_name].transform, "story_v_out_121481", "121481082", "story_v_out_121481.awb")

						arg_335_1:RecordAudio("121481082", var_338_9)
						arg_335_1:RecordAudio("121481082", var_338_9)
					else
						arg_335_1:AudioAction("play", "voice", "story_v_out_121481", "121481082", "story_v_out_121481.awb")
					end

					arg_335_1:RecordHistoryTalkVoice("story_v_out_121481", "121481082", "story_v_out_121481.awb")
				end

				arg_335_1:RecordContent(arg_335_1.text_.text)
			end

			local var_338_10 = math.max(var_338_1, arg_335_1.talkMaxDuration)

			if var_338_0 <= arg_335_1.time_ and arg_335_1.time_ < var_338_0 + var_338_10 then
				arg_335_1.typewritter.percent = (arg_335_1.time_ - var_338_0) / var_338_10

				arg_335_1.typewritter:SetDirty()
			end

			if arg_335_1.time_ >= var_338_0 + var_338_10 and arg_335_1.time_ < var_338_0 + var_338_10 + arg_338_0 then
				arg_335_1.typewritter.percent = 1

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(true)
			end
		end
	end,
	Play121481083 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 121481083
		arg_339_1.duration_ = 5

		SetActive(arg_339_1.tipsGo_, false)

		function arg_339_1.onSingleLineFinish_()
			arg_339_1.onSingleLineUpdate_ = nil
			arg_339_1.onSingleLineFinish_ = nil
			arg_339_1.state_ = "waiting"
		end

		function arg_339_1.playNext_(arg_341_0)
			if arg_341_0 == 1 then
				arg_339_0:Play121481084(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = 0
			local var_342_1 = 0.633333333333333

			if var_342_0 < arg_339_1.time_ and arg_339_1.time_ <= var_342_0 + arg_342_0 then
				local var_342_2 = "play"
				local var_342_3 = "music"

				arg_339_1:AudioAction(var_342_2, var_342_3, "bgm_story_scheme", "bgm_story_scheme", "bgm_story_scheme.awb")
			end

			local var_342_4 = arg_339_1.actors_["1069ui_story"].transform
			local var_342_5 = 0

			if var_342_5 < arg_339_1.time_ and arg_339_1.time_ <= var_342_5 + arg_342_0 then
				arg_339_1.var_.moveOldPos1069ui_story = var_342_4.localPosition
			end

			local var_342_6 = 0.001

			if var_342_5 <= arg_339_1.time_ and arg_339_1.time_ < var_342_5 + var_342_6 then
				local var_342_7 = (arg_339_1.time_ - var_342_5) / var_342_6
				local var_342_8 = Vector3.New(0, 100, 0)

				var_342_4.localPosition = Vector3.Lerp(arg_339_1.var_.moveOldPos1069ui_story, var_342_8, var_342_7)

				local var_342_9 = manager.ui.mainCamera.transform.position - var_342_4.position

				var_342_4.forward = Vector3.New(var_342_9.x, var_342_9.y, var_342_9.z)

				local var_342_10 = var_342_4.localEulerAngles

				var_342_10.z = 0
				var_342_10.x = 0
				var_342_4.localEulerAngles = var_342_10
			end

			if arg_339_1.time_ >= var_342_5 + var_342_6 and arg_339_1.time_ < var_342_5 + var_342_6 + arg_342_0 then
				var_342_4.localPosition = Vector3.New(0, 100, 0)

				local var_342_11 = manager.ui.mainCamera.transform.position - var_342_4.position

				var_342_4.forward = Vector3.New(var_342_11.x, var_342_11.y, var_342_11.z)

				local var_342_12 = var_342_4.localEulerAngles

				var_342_12.z = 0
				var_342_12.x = 0
				var_342_4.localEulerAngles = var_342_12
			end

			local var_342_13 = 0
			local var_342_14 = 0.75

			if var_342_13 < arg_339_1.time_ and arg_339_1.time_ <= var_342_13 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, false)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_339_1.iconTrs_.gameObject, false)
				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_15 = arg_339_1:GetWordFromCfg(121481083)
				local var_342_16 = arg_339_1:FormatText(var_342_15.content)

				arg_339_1.text_.text = var_342_16

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_17 = 30
				local var_342_18 = utf8.len(var_342_16)
				local var_342_19 = var_342_17 <= 0 and var_342_14 or var_342_14 * (var_342_18 / var_342_17)

				if var_342_19 > 0 and var_342_14 < var_342_19 then
					arg_339_1.talkMaxDuration = var_342_19

					if var_342_19 + var_342_13 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_19 + var_342_13
					end
				end

				arg_339_1.text_.text = var_342_16
				arg_339_1.typewritter.percent = 0

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(false)
				arg_339_1:RecordContent(arg_339_1.text_.text)
			end

			local var_342_20 = math.max(var_342_14, arg_339_1.talkMaxDuration)

			if var_342_13 <= arg_339_1.time_ and arg_339_1.time_ < var_342_13 + var_342_20 then
				arg_339_1.typewritter.percent = (arg_339_1.time_ - var_342_13) / var_342_20

				arg_339_1.typewritter:SetDirty()
			end

			if arg_339_1.time_ >= var_342_13 + var_342_20 and arg_339_1.time_ < var_342_13 + var_342_20 + arg_342_0 then
				arg_339_1.typewritter.percent = 1

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(true)
			end
		end
	end,
	Play121481084 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 121481084
		arg_343_1.duration_ = 5

		SetActive(arg_343_1.tipsGo_, false)

		function arg_343_1.onSingleLineFinish_()
			arg_343_1.onSingleLineUpdate_ = nil
			arg_343_1.onSingleLineFinish_ = nil
			arg_343_1.state_ = "waiting"
		end

		function arg_343_1.playNext_(arg_345_0)
			if arg_345_0 == 1 then
				arg_343_0:Play121481085(arg_343_1)
			end
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = arg_343_1.actors_["1069ui_story"]
			local var_346_1 = 0

			if var_346_1 < arg_343_1.time_ and arg_343_1.time_ <= var_346_1 + arg_346_0 and arg_343_1.var_.characterEffect1069ui_story == nil then
				arg_343_1.var_.characterEffect1069ui_story = var_346_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_346_2 = 0.200000002980232

			if var_346_1 <= arg_343_1.time_ and arg_343_1.time_ < var_346_1 + var_346_2 then
				local var_346_3 = (arg_343_1.time_ - var_346_1) / var_346_2

				if arg_343_1.var_.characterEffect1069ui_story then
					local var_346_4 = Mathf.Lerp(0, 0.5, var_346_3)

					arg_343_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_343_1.var_.characterEffect1069ui_story.fillRatio = var_346_4
				end
			end

			if arg_343_1.time_ >= var_346_1 + var_346_2 and arg_343_1.time_ < var_346_1 + var_346_2 + arg_346_0 and arg_343_1.var_.characterEffect1069ui_story then
				local var_346_5 = 0.5

				arg_343_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_343_1.var_.characterEffect1069ui_story.fillRatio = var_346_5
			end

			local var_346_6 = 0
			local var_346_7 = 1.05

			if var_346_6 < arg_343_1.time_ and arg_343_1.time_ <= var_346_6 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0
				arg_343_1.dialogCg_.alpha = 1

				arg_343_1.dialog_:SetActive(true)
				SetActive(arg_343_1.leftNameGo_, false)

				arg_343_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_343_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_343_1:RecordName(arg_343_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_343_1.iconTrs_.gameObject, false)
				arg_343_1.callingController_:SetSelectedState("normal")

				local var_346_8 = arg_343_1:GetWordFromCfg(121481084)
				local var_346_9 = arg_343_1:FormatText(var_346_8.content)

				arg_343_1.text_.text = var_346_9

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_10 = 42
				local var_346_11 = utf8.len(var_346_9)
				local var_346_12 = var_346_10 <= 0 and var_346_7 or var_346_7 * (var_346_11 / var_346_10)

				if var_346_12 > 0 and var_346_7 < var_346_12 then
					arg_343_1.talkMaxDuration = var_346_12

					if var_346_12 + var_346_6 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_12 + var_346_6
					end
				end

				arg_343_1.text_.text = var_346_9
				arg_343_1.typewritter.percent = 0

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(false)
				arg_343_1:RecordContent(arg_343_1.text_.text)
			end

			local var_346_13 = math.max(var_346_7, arg_343_1.talkMaxDuration)

			if var_346_6 <= arg_343_1.time_ and arg_343_1.time_ < var_346_6 + var_346_13 then
				arg_343_1.typewritter.percent = (arg_343_1.time_ - var_346_6) / var_346_13

				arg_343_1.typewritter:SetDirty()
			end

			if arg_343_1.time_ >= var_346_6 + var_346_13 and arg_343_1.time_ < var_346_6 + var_346_13 + arg_346_0 then
				arg_343_1.typewritter.percent = 1

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(true)
			end
		end
	end,
	Play121481085 = function(arg_347_0, arg_347_1)
		arg_347_1.time_ = 0
		arg_347_1.frameCnt_ = 0
		arg_347_1.state_ = "playing"
		arg_347_1.curTalkId_ = 121481085
		arg_347_1.duration_ = 4.966

		local var_347_0 = {
			ja = 4.966,
			ko = 3.566,
			zh = 3.566
		}
		local var_347_1 = manager.audio:GetLocalizationFlag()

		if var_347_0[var_347_1] ~= nil then
			arg_347_1.duration_ = var_347_0[var_347_1]
		end

		SetActive(arg_347_1.tipsGo_, false)

		function arg_347_1.onSingleLineFinish_()
			arg_347_1.onSingleLineUpdate_ = nil
			arg_347_1.onSingleLineFinish_ = nil
			arg_347_1.state_ = "waiting"
		end

		function arg_347_1.playNext_(arg_349_0)
			if arg_349_0 == 1 then
				arg_347_0:Play121481086(arg_347_1)
			end
		end

		function arg_347_1.onSingleLineUpdate_(arg_350_0)
			local var_350_0 = 0

			if var_350_0 < arg_347_1.time_ and arg_347_1.time_ <= var_350_0 + arg_350_0 then
				arg_347_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069actionlink/1069action424")
			end

			local var_350_1 = arg_347_1.actors_["1069ui_story"].transform
			local var_350_2 = 0

			if var_350_2 < arg_347_1.time_ and arg_347_1.time_ <= var_350_2 + arg_350_0 then
				arg_347_1.var_.moveOldPos1069ui_story = var_350_1.localPosition
			end

			local var_350_3 = 0.001

			if var_350_2 <= arg_347_1.time_ and arg_347_1.time_ < var_350_2 + var_350_3 then
				local var_350_4 = (arg_347_1.time_ - var_350_2) / var_350_3
				local var_350_5 = Vector3.New(0, -1, -6)

				var_350_1.localPosition = Vector3.Lerp(arg_347_1.var_.moveOldPos1069ui_story, var_350_5, var_350_4)

				local var_350_6 = manager.ui.mainCamera.transform.position - var_350_1.position

				var_350_1.forward = Vector3.New(var_350_6.x, var_350_6.y, var_350_6.z)

				local var_350_7 = var_350_1.localEulerAngles

				var_350_7.z = 0
				var_350_7.x = 0
				var_350_1.localEulerAngles = var_350_7
			end

			if arg_347_1.time_ >= var_350_2 + var_350_3 and arg_347_1.time_ < var_350_2 + var_350_3 + arg_350_0 then
				var_350_1.localPosition = Vector3.New(0, -1, -6)

				local var_350_8 = manager.ui.mainCamera.transform.position - var_350_1.position

				var_350_1.forward = Vector3.New(var_350_8.x, var_350_8.y, var_350_8.z)

				local var_350_9 = var_350_1.localEulerAngles

				var_350_9.z = 0
				var_350_9.x = 0
				var_350_1.localEulerAngles = var_350_9
			end

			local var_350_10 = arg_347_1.actors_["1069ui_story"]
			local var_350_11 = 0

			if var_350_11 < arg_347_1.time_ and arg_347_1.time_ <= var_350_11 + arg_350_0 and arg_347_1.var_.characterEffect1069ui_story == nil then
				arg_347_1.var_.characterEffect1069ui_story = var_350_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_350_12 = 0.200000002980232

			if var_350_11 <= arg_347_1.time_ and arg_347_1.time_ < var_350_11 + var_350_12 then
				local var_350_13 = (arg_347_1.time_ - var_350_11) / var_350_12

				if arg_347_1.var_.characterEffect1069ui_story then
					arg_347_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_347_1.time_ >= var_350_11 + var_350_12 and arg_347_1.time_ < var_350_11 + var_350_12 + arg_350_0 and arg_347_1.var_.characterEffect1069ui_story then
				arg_347_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_350_14 = 0
			local var_350_15 = 0.325

			if var_350_14 < arg_347_1.time_ and arg_347_1.time_ <= var_350_14 + arg_350_0 then
				arg_347_1.talkMaxDuration = 0
				arg_347_1.dialogCg_.alpha = 1

				arg_347_1.dialog_:SetActive(true)
				SetActive(arg_347_1.leftNameGo_, true)

				local var_350_16 = arg_347_1:FormatText(StoryNameCfg[378].name)

				arg_347_1.leftNameTxt_.text = var_350_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_347_1.leftNameTxt_.transform)

				arg_347_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_347_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_347_1:RecordName(arg_347_1.leftNameTxt_.text)
				SetActive(arg_347_1.iconTrs_.gameObject, false)
				arg_347_1.callingController_:SetSelectedState("normal")

				local var_350_17 = arg_347_1:GetWordFromCfg(121481085)
				local var_350_18 = arg_347_1:FormatText(var_350_17.content)

				arg_347_1.text_.text = var_350_18

				LuaForUtil.ClearLinePrefixSymbol(arg_347_1.text_)

				local var_350_19 = 13
				local var_350_20 = utf8.len(var_350_18)
				local var_350_21 = var_350_19 <= 0 and var_350_15 or var_350_15 * (var_350_20 / var_350_19)

				if var_350_21 > 0 and var_350_15 < var_350_21 then
					arg_347_1.talkMaxDuration = var_350_21

					if var_350_21 + var_350_14 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_21 + var_350_14
					end
				end

				arg_347_1.text_.text = var_350_18
				arg_347_1.typewritter.percent = 0

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481085", "story_v_out_121481.awb") ~= 0 then
					local var_350_22 = manager.audio:GetVoiceLength("story_v_out_121481", "121481085", "story_v_out_121481.awb") / 1000

					if var_350_22 + var_350_14 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_22 + var_350_14
					end

					if var_350_17.prefab_name ~= "" and arg_347_1.actors_[var_350_17.prefab_name] ~= nil then
						local var_350_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_347_1.actors_[var_350_17.prefab_name].transform, "story_v_out_121481", "121481085", "story_v_out_121481.awb")

						arg_347_1:RecordAudio("121481085", var_350_23)
						arg_347_1:RecordAudio("121481085", var_350_23)
					else
						arg_347_1:AudioAction("play", "voice", "story_v_out_121481", "121481085", "story_v_out_121481.awb")
					end

					arg_347_1:RecordHistoryTalkVoice("story_v_out_121481", "121481085", "story_v_out_121481.awb")
				end

				arg_347_1:RecordContent(arg_347_1.text_.text)
			end

			local var_350_24 = math.max(var_350_15, arg_347_1.talkMaxDuration)

			if var_350_14 <= arg_347_1.time_ and arg_347_1.time_ < var_350_14 + var_350_24 then
				arg_347_1.typewritter.percent = (arg_347_1.time_ - var_350_14) / var_350_24

				arg_347_1.typewritter:SetDirty()
			end

			if arg_347_1.time_ >= var_350_14 + var_350_24 and arg_347_1.time_ < var_350_14 + var_350_24 + arg_350_0 then
				arg_347_1.typewritter.percent = 1

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(true)
			end
		end
	end,
	Play121481086 = function(arg_351_0, arg_351_1)
		arg_351_1.time_ = 0
		arg_351_1.frameCnt_ = 0
		arg_351_1.state_ = "playing"
		arg_351_1.curTalkId_ = 121481086
		arg_351_1.duration_ = 11.233

		local var_351_0 = {
			ja = 11.233,
			ko = 9.266,
			zh = 9.266
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
				arg_351_0:Play121481087(arg_351_1)
			end
		end

		function arg_351_1.onSingleLineUpdate_(arg_354_0)
			local var_354_0 = 0

			if var_354_0 < arg_351_1.time_ and arg_351_1.time_ <= var_354_0 + arg_354_0 then
				arg_351_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_354_1 = 0
			local var_354_2 = 0.75

			if var_354_1 < arg_351_1.time_ and arg_351_1.time_ <= var_354_1 + arg_354_0 then
				arg_351_1.talkMaxDuration = 0
				arg_351_1.dialogCg_.alpha = 1

				arg_351_1.dialog_:SetActive(true)
				SetActive(arg_351_1.leftNameGo_, true)

				local var_354_3 = arg_351_1:FormatText(StoryNameCfg[378].name)

				arg_351_1.leftNameTxt_.text = var_354_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_351_1.leftNameTxt_.transform)

				arg_351_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_351_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_351_1:RecordName(arg_351_1.leftNameTxt_.text)
				SetActive(arg_351_1.iconTrs_.gameObject, false)
				arg_351_1.callingController_:SetSelectedState("normal")

				local var_354_4 = arg_351_1:GetWordFromCfg(121481086)
				local var_354_5 = arg_351_1:FormatText(var_354_4.content)

				arg_351_1.text_.text = var_354_5

				LuaForUtil.ClearLinePrefixSymbol(arg_351_1.text_)

				local var_354_6 = 30
				local var_354_7 = utf8.len(var_354_5)
				local var_354_8 = var_354_6 <= 0 and var_354_2 or var_354_2 * (var_354_7 / var_354_6)

				if var_354_8 > 0 and var_354_2 < var_354_8 then
					arg_351_1.talkMaxDuration = var_354_8

					if var_354_8 + var_354_1 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_8 + var_354_1
					end
				end

				arg_351_1.text_.text = var_354_5
				arg_351_1.typewritter.percent = 0

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481086", "story_v_out_121481.awb") ~= 0 then
					local var_354_9 = manager.audio:GetVoiceLength("story_v_out_121481", "121481086", "story_v_out_121481.awb") / 1000

					if var_354_9 + var_354_1 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_9 + var_354_1
					end

					if var_354_4.prefab_name ~= "" and arg_351_1.actors_[var_354_4.prefab_name] ~= nil then
						local var_354_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_351_1.actors_[var_354_4.prefab_name].transform, "story_v_out_121481", "121481086", "story_v_out_121481.awb")

						arg_351_1:RecordAudio("121481086", var_354_10)
						arg_351_1:RecordAudio("121481086", var_354_10)
					else
						arg_351_1:AudioAction("play", "voice", "story_v_out_121481", "121481086", "story_v_out_121481.awb")
					end

					arg_351_1:RecordHistoryTalkVoice("story_v_out_121481", "121481086", "story_v_out_121481.awb")
				end

				arg_351_1:RecordContent(arg_351_1.text_.text)
			end

			local var_354_11 = math.max(var_354_2, arg_351_1.talkMaxDuration)

			if var_354_1 <= arg_351_1.time_ and arg_351_1.time_ < var_354_1 + var_354_11 then
				arg_351_1.typewritter.percent = (arg_351_1.time_ - var_354_1) / var_354_11

				arg_351_1.typewritter:SetDirty()
			end

			if arg_351_1.time_ >= var_354_1 + var_354_11 and arg_351_1.time_ < var_354_1 + var_354_11 + arg_354_0 then
				arg_351_1.typewritter.percent = 1

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(true)
			end
		end
	end,
	Play121481087 = function(arg_355_0, arg_355_1)
		arg_355_1.time_ = 0
		arg_355_1.frameCnt_ = 0
		arg_355_1.state_ = "playing"
		arg_355_1.curTalkId_ = 121481087
		arg_355_1.duration_ = 5

		SetActive(arg_355_1.tipsGo_, false)

		function arg_355_1.onSingleLineFinish_()
			arg_355_1.onSingleLineUpdate_ = nil
			arg_355_1.onSingleLineFinish_ = nil
			arg_355_1.state_ = "waiting"
		end

		function arg_355_1.playNext_(arg_357_0)
			if arg_357_0 == 1 then
				arg_355_0:Play121481088(arg_355_1)
			end
		end

		function arg_355_1.onSingleLineUpdate_(arg_358_0)
			local var_358_0 = arg_355_1.actors_["1069ui_story"].transform
			local var_358_1 = 0

			if var_358_1 < arg_355_1.time_ and arg_355_1.time_ <= var_358_1 + arg_358_0 then
				arg_355_1.var_.moveOldPos1069ui_story = var_358_0.localPosition
			end

			local var_358_2 = 0.001

			if var_358_1 <= arg_355_1.time_ and arg_355_1.time_ < var_358_1 + var_358_2 then
				local var_358_3 = (arg_355_1.time_ - var_358_1) / var_358_2
				local var_358_4 = Vector3.New(0, 100, 0)

				var_358_0.localPosition = Vector3.Lerp(arg_355_1.var_.moveOldPos1069ui_story, var_358_4, var_358_3)

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

			local var_358_9 = arg_355_1.actors_["1069ui_story"]
			local var_358_10 = 0

			if var_358_10 < arg_355_1.time_ and arg_355_1.time_ <= var_358_10 + arg_358_0 and arg_355_1.var_.characterEffect1069ui_story == nil then
				arg_355_1.var_.characterEffect1069ui_story = var_358_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_358_11 = 0.200000002980232

			if var_358_10 <= arg_355_1.time_ and arg_355_1.time_ < var_358_10 + var_358_11 then
				local var_358_12 = (arg_355_1.time_ - var_358_10) / var_358_11

				if arg_355_1.var_.characterEffect1069ui_story then
					local var_358_13 = Mathf.Lerp(0, 0.5, var_358_12)

					arg_355_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_355_1.var_.characterEffect1069ui_story.fillRatio = var_358_13
				end
			end

			if arg_355_1.time_ >= var_358_10 + var_358_11 and arg_355_1.time_ < var_358_10 + var_358_11 + arg_358_0 and arg_355_1.var_.characterEffect1069ui_story then
				local var_358_14 = 0.5

				arg_355_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_355_1.var_.characterEffect1069ui_story.fillRatio = var_358_14
			end

			local var_358_15 = 0
			local var_358_16 = 0.633333333333333

			if var_358_15 < arg_355_1.time_ and arg_355_1.time_ <= var_358_15 + arg_358_0 then
				local var_358_17 = "play"
				local var_358_18 = "effect"

				arg_355_1:AudioAction(var_358_17, var_358_18, "se_story_121_04", "se_story_121_04_jump2", "")
			end

			local var_358_19 = 0
			local var_358_20 = 1.425

			if var_358_19 < arg_355_1.time_ and arg_355_1.time_ <= var_358_19 + arg_358_0 then
				arg_355_1.talkMaxDuration = 0
				arg_355_1.dialogCg_.alpha = 1

				arg_355_1.dialog_:SetActive(true)
				SetActive(arg_355_1.leftNameGo_, false)

				arg_355_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_355_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_355_1:RecordName(arg_355_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_355_1.iconTrs_.gameObject, false)
				arg_355_1.callingController_:SetSelectedState("normal")

				local var_358_21 = arg_355_1:GetWordFromCfg(121481087)
				local var_358_22 = arg_355_1:FormatText(var_358_21.content)

				arg_355_1.text_.text = var_358_22

				LuaForUtil.ClearLinePrefixSymbol(arg_355_1.text_)

				local var_358_23 = 57
				local var_358_24 = utf8.len(var_358_22)
				local var_358_25 = var_358_23 <= 0 and var_358_20 or var_358_20 * (var_358_24 / var_358_23)

				if var_358_25 > 0 and var_358_20 < var_358_25 then
					arg_355_1.talkMaxDuration = var_358_25

					if var_358_25 + var_358_19 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_25 + var_358_19
					end
				end

				arg_355_1.text_.text = var_358_22
				arg_355_1.typewritter.percent = 0

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(false)
				arg_355_1:RecordContent(arg_355_1.text_.text)
			end

			local var_358_26 = math.max(var_358_20, arg_355_1.talkMaxDuration)

			if var_358_19 <= arg_355_1.time_ and arg_355_1.time_ < var_358_19 + var_358_26 then
				arg_355_1.typewritter.percent = (arg_355_1.time_ - var_358_19) / var_358_26

				arg_355_1.typewritter:SetDirty()
			end

			if arg_355_1.time_ >= var_358_19 + var_358_26 and arg_355_1.time_ < var_358_19 + var_358_26 + arg_358_0 then
				arg_355_1.typewritter.percent = 1

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(true)
			end
		end
	end,
	Play121481088 = function(arg_359_0, arg_359_1)
		arg_359_1.time_ = 0
		arg_359_1.frameCnt_ = 0
		arg_359_1.state_ = "playing"
		arg_359_1.curTalkId_ = 121481088
		arg_359_1.duration_ = 5

		SetActive(arg_359_1.tipsGo_, false)

		function arg_359_1.onSingleLineFinish_()
			arg_359_1.onSingleLineUpdate_ = nil
			arg_359_1.onSingleLineFinish_ = nil
			arg_359_1.state_ = "waiting"
		end

		function arg_359_1.playNext_(arg_361_0)
			if arg_361_0 == 1 then
				arg_359_0:Play121481089(arg_359_1)
			end
		end

		function arg_359_1.onSingleLineUpdate_(arg_362_0)
			local var_362_0 = 0.133333333333333
			local var_362_1 = 0.266666666666667

			if var_362_0 < arg_359_1.time_ and arg_359_1.time_ <= var_362_0 + arg_362_0 then
				local var_362_2 = "play"
				local var_362_3 = "effect"

				arg_359_1:AudioAction(var_362_2, var_362_3, "se_story_121_04", "se_story_121_04_drill_loop", "")
			end

			local var_362_4 = 0
			local var_362_5 = 0.0666666666666667

			if var_362_4 < arg_359_1.time_ and arg_359_1.time_ <= var_362_4 + arg_362_0 then
				local var_362_6 = "stop"
				local var_362_7 = "effect"

				arg_359_1:AudioAction(var_362_6, var_362_7, "se_story_121_04", "se_story_121_04_jump2", "")
			end

			local var_362_8 = 0
			local var_362_9 = 0.2

			if var_362_8 < arg_359_1.time_ and arg_359_1.time_ <= var_362_8 + arg_362_0 then
				arg_359_1.talkMaxDuration = 0
				arg_359_1.dialogCg_.alpha = 1

				arg_359_1.dialog_:SetActive(true)
				SetActive(arg_359_1.leftNameGo_, false)

				arg_359_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_359_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_359_1:RecordName(arg_359_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_359_1.iconTrs_.gameObject, false)
				arg_359_1.callingController_:SetSelectedState("normal")

				local var_362_10 = arg_359_1:GetWordFromCfg(121481088)
				local var_362_11 = arg_359_1:FormatText(var_362_10.content)

				arg_359_1.text_.text = var_362_11

				LuaForUtil.ClearLinePrefixSymbol(arg_359_1.text_)

				local var_362_12 = 8
				local var_362_13 = utf8.len(var_362_11)
				local var_362_14 = var_362_12 <= 0 and var_362_9 or var_362_9 * (var_362_13 / var_362_12)

				if var_362_14 > 0 and var_362_9 < var_362_14 then
					arg_359_1.talkMaxDuration = var_362_14

					if var_362_14 + var_362_8 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_14 + var_362_8
					end
				end

				arg_359_1.text_.text = var_362_11
				arg_359_1.typewritter.percent = 0

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(false)
				arg_359_1:RecordContent(arg_359_1.text_.text)
			end

			local var_362_15 = math.max(var_362_9, arg_359_1.talkMaxDuration)

			if var_362_8 <= arg_359_1.time_ and arg_359_1.time_ < var_362_8 + var_362_15 then
				arg_359_1.typewritter.percent = (arg_359_1.time_ - var_362_8) / var_362_15

				arg_359_1.typewritter:SetDirty()
			end

			if arg_359_1.time_ >= var_362_8 + var_362_15 and arg_359_1.time_ < var_362_8 + var_362_15 + arg_362_0 then
				arg_359_1.typewritter.percent = 1

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(true)
			end
		end
	end,
	Play121481089 = function(arg_363_0, arg_363_1)
		arg_363_1.time_ = 0
		arg_363_1.frameCnt_ = 0
		arg_363_1.state_ = "playing"
		arg_363_1.curTalkId_ = 121481089
		arg_363_1.duration_ = 5

		SetActive(arg_363_1.tipsGo_, false)

		function arg_363_1.onSingleLineFinish_()
			arg_363_1.onSingleLineUpdate_ = nil
			arg_363_1.onSingleLineFinish_ = nil
			arg_363_1.state_ = "waiting"
		end

		function arg_363_1.playNext_(arg_365_0)
			if arg_365_0 == 1 then
				arg_363_0:Play121481090(arg_363_1)
			end
		end

		function arg_363_1.onSingleLineUpdate_(arg_366_0)
			local var_366_0 = 0
			local var_366_1 = 1.1

			if var_366_0 < arg_363_1.time_ and arg_363_1.time_ <= var_366_0 + arg_366_0 then
				arg_363_1.talkMaxDuration = 0
				arg_363_1.dialogCg_.alpha = 1

				arg_363_1.dialog_:SetActive(true)
				SetActive(arg_363_1.leftNameGo_, false)

				arg_363_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_363_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_363_1:RecordName(arg_363_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_363_1.iconTrs_.gameObject, false)
				arg_363_1.callingController_:SetSelectedState("normal")

				local var_366_2 = arg_363_1:GetWordFromCfg(121481089)
				local var_366_3 = arg_363_1:FormatText(var_366_2.content)

				arg_363_1.text_.text = var_366_3

				LuaForUtil.ClearLinePrefixSymbol(arg_363_1.text_)

				local var_366_4 = 44
				local var_366_5 = utf8.len(var_366_3)
				local var_366_6 = var_366_4 <= 0 and var_366_1 or var_366_1 * (var_366_5 / var_366_4)

				if var_366_6 > 0 and var_366_1 < var_366_6 then
					arg_363_1.talkMaxDuration = var_366_6

					if var_366_6 + var_366_0 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_6 + var_366_0
					end
				end

				arg_363_1.text_.text = var_366_3
				arg_363_1.typewritter.percent = 0

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(false)
				arg_363_1:RecordContent(arg_363_1.text_.text)
			end

			local var_366_7 = math.max(var_366_1, arg_363_1.talkMaxDuration)

			if var_366_0 <= arg_363_1.time_ and arg_363_1.time_ < var_366_0 + var_366_7 then
				arg_363_1.typewritter.percent = (arg_363_1.time_ - var_366_0) / var_366_7

				arg_363_1.typewritter:SetDirty()
			end

			if arg_363_1.time_ >= var_366_0 + var_366_7 and arg_363_1.time_ < var_366_0 + var_366_7 + arg_366_0 then
				arg_363_1.typewritter.percent = 1

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(true)
			end
		end
	end,
	Play121481090 = function(arg_367_0, arg_367_1)
		arg_367_1.time_ = 0
		arg_367_1.frameCnt_ = 0
		arg_367_1.state_ = "playing"
		arg_367_1.curTalkId_ = 121481090
		arg_367_1.duration_ = 2.833

		local var_367_0 = {
			ja = 2.833,
			ko = 1.999999999999,
			zh = 1.999999999999
		}
		local var_367_1 = manager.audio:GetLocalizationFlag()

		if var_367_0[var_367_1] ~= nil then
			arg_367_1.duration_ = var_367_0[var_367_1]
		end

		SetActive(arg_367_1.tipsGo_, false)

		function arg_367_1.onSingleLineFinish_()
			arg_367_1.onSingleLineUpdate_ = nil
			arg_367_1.onSingleLineFinish_ = nil
			arg_367_1.state_ = "waiting"
		end

		function arg_367_1.playNext_(arg_369_0)
			if arg_369_0 == 1 then
				arg_367_0:Play121481091(arg_367_1)
			end
		end

		function arg_367_1.onSingleLineUpdate_(arg_370_0)
			local var_370_0 = arg_367_1.actors_["1069ui_story"].transform
			local var_370_1 = 0

			if var_370_1 < arg_367_1.time_ and arg_367_1.time_ <= var_370_1 + arg_370_0 then
				arg_367_1.var_.moveOldPos1069ui_story = var_370_0.localPosition
			end

			local var_370_2 = 0.001

			if var_370_1 <= arg_367_1.time_ and arg_367_1.time_ < var_370_1 + var_370_2 then
				local var_370_3 = (arg_367_1.time_ - var_370_1) / var_370_2
				local var_370_4 = Vector3.New(0, -1, -6)

				var_370_0.localPosition = Vector3.Lerp(arg_367_1.var_.moveOldPos1069ui_story, var_370_4, var_370_3)

				local var_370_5 = manager.ui.mainCamera.transform.position - var_370_0.position

				var_370_0.forward = Vector3.New(var_370_5.x, var_370_5.y, var_370_5.z)

				local var_370_6 = var_370_0.localEulerAngles

				var_370_6.z = 0
				var_370_6.x = 0
				var_370_0.localEulerAngles = var_370_6
			end

			if arg_367_1.time_ >= var_370_1 + var_370_2 and arg_367_1.time_ < var_370_1 + var_370_2 + arg_370_0 then
				var_370_0.localPosition = Vector3.New(0, -1, -6)

				local var_370_7 = manager.ui.mainCamera.transform.position - var_370_0.position

				var_370_0.forward = Vector3.New(var_370_7.x, var_370_7.y, var_370_7.z)

				local var_370_8 = var_370_0.localEulerAngles

				var_370_8.z = 0
				var_370_8.x = 0
				var_370_0.localEulerAngles = var_370_8
			end

			local var_370_9 = arg_367_1.actors_["1069ui_story"]
			local var_370_10 = 0

			if var_370_10 < arg_367_1.time_ and arg_367_1.time_ <= var_370_10 + arg_370_0 and arg_367_1.var_.characterEffect1069ui_story == nil then
				arg_367_1.var_.characterEffect1069ui_story = var_370_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_370_11 = 0.200000002980232

			if var_370_10 <= arg_367_1.time_ and arg_367_1.time_ < var_370_10 + var_370_11 then
				local var_370_12 = (arg_367_1.time_ - var_370_10) / var_370_11

				if arg_367_1.var_.characterEffect1069ui_story then
					arg_367_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_367_1.time_ >= var_370_10 + var_370_11 and arg_367_1.time_ < var_370_10 + var_370_11 + arg_370_0 and arg_367_1.var_.characterEffect1069ui_story then
				arg_367_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_370_13 = 0

			if var_370_13 < arg_367_1.time_ and arg_367_1.time_ <= var_370_13 + arg_370_0 then
				arg_367_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action1_1")
			end

			local var_370_14 = 0

			if var_370_14 < arg_367_1.time_ and arg_367_1.time_ <= var_370_14 + arg_370_0 then
				arg_367_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_370_15 = 0
			local var_370_16 = 0.225

			if var_370_15 < arg_367_1.time_ and arg_367_1.time_ <= var_370_15 + arg_370_0 then
				arg_367_1.talkMaxDuration = 0
				arg_367_1.dialogCg_.alpha = 1

				arg_367_1.dialog_:SetActive(true)
				SetActive(arg_367_1.leftNameGo_, true)

				local var_370_17 = arg_367_1:FormatText(StoryNameCfg[378].name)

				arg_367_1.leftNameTxt_.text = var_370_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_367_1.leftNameTxt_.transform)

				arg_367_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_367_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_367_1:RecordName(arg_367_1.leftNameTxt_.text)
				SetActive(arg_367_1.iconTrs_.gameObject, false)
				arg_367_1.callingController_:SetSelectedState("normal")

				local var_370_18 = arg_367_1:GetWordFromCfg(121481090)
				local var_370_19 = arg_367_1:FormatText(var_370_18.content)

				arg_367_1.text_.text = var_370_19

				LuaForUtil.ClearLinePrefixSymbol(arg_367_1.text_)

				local var_370_20 = 9
				local var_370_21 = utf8.len(var_370_19)
				local var_370_22 = var_370_20 <= 0 and var_370_16 or var_370_16 * (var_370_21 / var_370_20)

				if var_370_22 > 0 and var_370_16 < var_370_22 then
					arg_367_1.talkMaxDuration = var_370_22

					if var_370_22 + var_370_15 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_22 + var_370_15
					end
				end

				arg_367_1.text_.text = var_370_19
				arg_367_1.typewritter.percent = 0

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481090", "story_v_out_121481.awb") ~= 0 then
					local var_370_23 = manager.audio:GetVoiceLength("story_v_out_121481", "121481090", "story_v_out_121481.awb") / 1000

					if var_370_23 + var_370_15 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_23 + var_370_15
					end

					if var_370_18.prefab_name ~= "" and arg_367_1.actors_[var_370_18.prefab_name] ~= nil then
						local var_370_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_367_1.actors_[var_370_18.prefab_name].transform, "story_v_out_121481", "121481090", "story_v_out_121481.awb")

						arg_367_1:RecordAudio("121481090", var_370_24)
						arg_367_1:RecordAudio("121481090", var_370_24)
					else
						arg_367_1:AudioAction("play", "voice", "story_v_out_121481", "121481090", "story_v_out_121481.awb")
					end

					arg_367_1:RecordHistoryTalkVoice("story_v_out_121481", "121481090", "story_v_out_121481.awb")
				end

				arg_367_1:RecordContent(arg_367_1.text_.text)
			end

			local var_370_25 = math.max(var_370_16, arg_367_1.talkMaxDuration)

			if var_370_15 <= arg_367_1.time_ and arg_367_1.time_ < var_370_15 + var_370_25 then
				arg_367_1.typewritter.percent = (arg_367_1.time_ - var_370_15) / var_370_25

				arg_367_1.typewritter:SetDirty()
			end

			if arg_367_1.time_ >= var_370_15 + var_370_25 and arg_367_1.time_ < var_370_15 + var_370_25 + arg_370_0 then
				arg_367_1.typewritter.percent = 1

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(true)
			end
		end
	end,
	Play121481091 = function(arg_371_0, arg_371_1)
		arg_371_1.time_ = 0
		arg_371_1.frameCnt_ = 0
		arg_371_1.state_ = "playing"
		arg_371_1.curTalkId_ = 121481091
		arg_371_1.duration_ = 5

		SetActive(arg_371_1.tipsGo_, false)

		function arg_371_1.onSingleLineFinish_()
			arg_371_1.onSingleLineUpdate_ = nil
			arg_371_1.onSingleLineFinish_ = nil
			arg_371_1.state_ = "waiting"
		end

		function arg_371_1.playNext_(arg_373_0)
			if arg_373_0 == 1 then
				arg_371_0:Play121481092(arg_371_1)
			end
		end

		function arg_371_1.onSingleLineUpdate_(arg_374_0)
			local var_374_0 = arg_371_1.actors_["1069ui_story"]
			local var_374_1 = 0

			if var_374_1 < arg_371_1.time_ and arg_371_1.time_ <= var_374_1 + arg_374_0 and arg_371_1.var_.characterEffect1069ui_story == nil then
				arg_371_1.var_.characterEffect1069ui_story = var_374_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_374_2 = 0.200000002980232

			if var_374_1 <= arg_371_1.time_ and arg_371_1.time_ < var_374_1 + var_374_2 then
				local var_374_3 = (arg_371_1.time_ - var_374_1) / var_374_2

				if arg_371_1.var_.characterEffect1069ui_story then
					local var_374_4 = Mathf.Lerp(0, 0.5, var_374_3)

					arg_371_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_371_1.var_.characterEffect1069ui_story.fillRatio = var_374_4
				end
			end

			if arg_371_1.time_ >= var_374_1 + var_374_2 and arg_371_1.time_ < var_374_1 + var_374_2 + arg_374_0 and arg_371_1.var_.characterEffect1069ui_story then
				local var_374_5 = 0.5

				arg_371_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_371_1.var_.characterEffect1069ui_story.fillRatio = var_374_5
			end

			local var_374_6 = 0
			local var_374_7 = 1.4

			if var_374_6 < arg_371_1.time_ and arg_371_1.time_ <= var_374_6 + arg_374_0 then
				arg_371_1.talkMaxDuration = 0
				arg_371_1.dialogCg_.alpha = 1

				arg_371_1.dialog_:SetActive(true)
				SetActive(arg_371_1.leftNameGo_, false)

				arg_371_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_371_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_371_1:RecordName(arg_371_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_371_1.iconTrs_.gameObject, false)
				arg_371_1.callingController_:SetSelectedState("normal")

				local var_374_8 = arg_371_1:GetWordFromCfg(121481091)
				local var_374_9 = arg_371_1:FormatText(var_374_8.content)

				arg_371_1.text_.text = var_374_9

				LuaForUtil.ClearLinePrefixSymbol(arg_371_1.text_)

				local var_374_10 = 56
				local var_374_11 = utf8.len(var_374_9)
				local var_374_12 = var_374_10 <= 0 and var_374_7 or var_374_7 * (var_374_11 / var_374_10)

				if var_374_12 > 0 and var_374_7 < var_374_12 then
					arg_371_1.talkMaxDuration = var_374_12

					if var_374_12 + var_374_6 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_12 + var_374_6
					end
				end

				arg_371_1.text_.text = var_374_9
				arg_371_1.typewritter.percent = 0

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(false)
				arg_371_1:RecordContent(arg_371_1.text_.text)
			end

			local var_374_13 = math.max(var_374_7, arg_371_1.talkMaxDuration)

			if var_374_6 <= arg_371_1.time_ and arg_371_1.time_ < var_374_6 + var_374_13 then
				arg_371_1.typewritter.percent = (arg_371_1.time_ - var_374_6) / var_374_13

				arg_371_1.typewritter:SetDirty()
			end

			if arg_371_1.time_ >= var_374_6 + var_374_13 and arg_371_1.time_ < var_374_6 + var_374_13 + arg_374_0 then
				arg_371_1.typewritter.percent = 1

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(true)
			end
		end
	end,
	Play121481092 = function(arg_375_0, arg_375_1)
		arg_375_1.time_ = 0
		arg_375_1.frameCnt_ = 0
		arg_375_1.state_ = "playing"
		arg_375_1.curTalkId_ = 121481092
		arg_375_1.duration_ = 9.9

		local var_375_0 = {
			ja = 5.433,
			ko = 9.9,
			zh = 9.9
		}
		local var_375_1 = manager.audio:GetLocalizationFlag()

		if var_375_0[var_375_1] ~= nil then
			arg_375_1.duration_ = var_375_0[var_375_1]
		end

		SetActive(arg_375_1.tipsGo_, false)

		function arg_375_1.onSingleLineFinish_()
			arg_375_1.onSingleLineUpdate_ = nil
			arg_375_1.onSingleLineFinish_ = nil
			arg_375_1.state_ = "waiting"
		end

		function arg_375_1.playNext_(arg_377_0)
			if arg_377_0 == 1 then
				arg_375_0:Play121481093(arg_375_1)
			end
		end

		function arg_375_1.onSingleLineUpdate_(arg_378_0)
			local var_378_0 = arg_375_1.actors_["1069ui_story"].transform
			local var_378_1 = 0

			if var_378_1 < arg_375_1.time_ and arg_375_1.time_ <= var_378_1 + arg_378_0 then
				arg_375_1.var_.moveOldPos1069ui_story = var_378_0.localPosition
			end

			local var_378_2 = 0.001

			if var_378_1 <= arg_375_1.time_ and arg_375_1.time_ < var_378_1 + var_378_2 then
				local var_378_3 = (arg_375_1.time_ - var_378_1) / var_378_2
				local var_378_4 = Vector3.New(0, -1, -6)

				var_378_0.localPosition = Vector3.Lerp(arg_375_1.var_.moveOldPos1069ui_story, var_378_4, var_378_3)

				local var_378_5 = manager.ui.mainCamera.transform.position - var_378_0.position

				var_378_0.forward = Vector3.New(var_378_5.x, var_378_5.y, var_378_5.z)

				local var_378_6 = var_378_0.localEulerAngles

				var_378_6.z = 0
				var_378_6.x = 0
				var_378_0.localEulerAngles = var_378_6
			end

			if arg_375_1.time_ >= var_378_1 + var_378_2 and arg_375_1.time_ < var_378_1 + var_378_2 + arg_378_0 then
				var_378_0.localPosition = Vector3.New(0, -1, -6)

				local var_378_7 = manager.ui.mainCamera.transform.position - var_378_0.position

				var_378_0.forward = Vector3.New(var_378_7.x, var_378_7.y, var_378_7.z)

				local var_378_8 = var_378_0.localEulerAngles

				var_378_8.z = 0
				var_378_8.x = 0
				var_378_0.localEulerAngles = var_378_8
			end

			local var_378_9 = arg_375_1.actors_["1069ui_story"]
			local var_378_10 = 0

			if var_378_10 < arg_375_1.time_ and arg_375_1.time_ <= var_378_10 + arg_378_0 and arg_375_1.var_.characterEffect1069ui_story == nil then
				arg_375_1.var_.characterEffect1069ui_story = var_378_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_378_11 = 0.200000002980232

			if var_378_10 <= arg_375_1.time_ and arg_375_1.time_ < var_378_10 + var_378_11 then
				local var_378_12 = (arg_375_1.time_ - var_378_10) / var_378_11

				if arg_375_1.var_.characterEffect1069ui_story then
					arg_375_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_375_1.time_ >= var_378_10 + var_378_11 and arg_375_1.time_ < var_378_10 + var_378_11 + arg_378_0 and arg_375_1.var_.characterEffect1069ui_story then
				arg_375_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_378_13 = 0

			if var_378_13 < arg_375_1.time_ and arg_375_1.time_ <= var_378_13 + arg_378_0 then
				arg_375_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action4_1")
			end

			local var_378_14 = 0

			if var_378_14 < arg_375_1.time_ and arg_375_1.time_ <= var_378_14 + arg_378_0 then
				arg_375_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_378_15 = 0
			local var_378_16 = 0.034000001847744

			if var_378_15 < arg_375_1.time_ and arg_375_1.time_ <= var_378_15 + arg_378_0 then
				local var_378_17 = "play"
				local var_378_18 = "music"

				arg_375_1:AudioAction(var_378_17, var_378_18, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_378_19 = 0.133333333333333
			local var_378_20 = 1

			if var_378_19 < arg_375_1.time_ and arg_375_1.time_ <= var_378_19 + arg_378_0 then
				local var_378_21 = "play"
				local var_378_22 = "music"

				arg_375_1:AudioAction(var_378_21, var_378_22, "bgm_story_v0_battleground", "bgm_story_v0_battleground", "bgm_story_v0_battleground.awb")
			end

			local var_378_23 = 0
			local var_378_24 = 0.75

			if var_378_23 < arg_375_1.time_ and arg_375_1.time_ <= var_378_23 + arg_378_0 then
				arg_375_1.talkMaxDuration = 0
				arg_375_1.dialogCg_.alpha = 1

				arg_375_1.dialog_:SetActive(true)
				SetActive(arg_375_1.leftNameGo_, true)

				local var_378_25 = arg_375_1:FormatText(StoryNameCfg[378].name)

				arg_375_1.leftNameTxt_.text = var_378_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_375_1.leftNameTxt_.transform)

				arg_375_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_375_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_375_1:RecordName(arg_375_1.leftNameTxt_.text)
				SetActive(arg_375_1.iconTrs_.gameObject, false)
				arg_375_1.callingController_:SetSelectedState("normal")

				local var_378_26 = arg_375_1:GetWordFromCfg(121481092)
				local var_378_27 = arg_375_1:FormatText(var_378_26.content)

				arg_375_1.text_.text = var_378_27

				LuaForUtil.ClearLinePrefixSymbol(arg_375_1.text_)

				local var_378_28 = 30
				local var_378_29 = utf8.len(var_378_27)
				local var_378_30 = var_378_28 <= 0 and var_378_24 or var_378_24 * (var_378_29 / var_378_28)

				if var_378_30 > 0 and var_378_24 < var_378_30 then
					arg_375_1.talkMaxDuration = var_378_30

					if var_378_30 + var_378_23 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_30 + var_378_23
					end
				end

				arg_375_1.text_.text = var_378_27
				arg_375_1.typewritter.percent = 0

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481092", "story_v_out_121481.awb") ~= 0 then
					local var_378_31 = manager.audio:GetVoiceLength("story_v_out_121481", "121481092", "story_v_out_121481.awb") / 1000

					if var_378_31 + var_378_23 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_31 + var_378_23
					end

					if var_378_26.prefab_name ~= "" and arg_375_1.actors_[var_378_26.prefab_name] ~= nil then
						local var_378_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_375_1.actors_[var_378_26.prefab_name].transform, "story_v_out_121481", "121481092", "story_v_out_121481.awb")

						arg_375_1:RecordAudio("121481092", var_378_32)
						arg_375_1:RecordAudio("121481092", var_378_32)
					else
						arg_375_1:AudioAction("play", "voice", "story_v_out_121481", "121481092", "story_v_out_121481.awb")
					end

					arg_375_1:RecordHistoryTalkVoice("story_v_out_121481", "121481092", "story_v_out_121481.awb")
				end

				arg_375_1:RecordContent(arg_375_1.text_.text)
			end

			local var_378_33 = math.max(var_378_24, arg_375_1.talkMaxDuration)

			if var_378_23 <= arg_375_1.time_ and arg_375_1.time_ < var_378_23 + var_378_33 then
				arg_375_1.typewritter.percent = (arg_375_1.time_ - var_378_23) / var_378_33

				arg_375_1.typewritter:SetDirty()
			end

			if arg_375_1.time_ >= var_378_23 + var_378_33 and arg_375_1.time_ < var_378_23 + var_378_33 + arg_378_0 then
				arg_375_1.typewritter.percent = 1

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(true)
			end
		end
	end,
	Play121481093 = function(arg_379_0, arg_379_1)
		arg_379_1.time_ = 0
		arg_379_1.frameCnt_ = 0
		arg_379_1.state_ = "playing"
		arg_379_1.curTalkId_ = 121481093
		arg_379_1.duration_ = 5

		SetActive(arg_379_1.tipsGo_, false)

		function arg_379_1.onSingleLineFinish_()
			arg_379_1.onSingleLineUpdate_ = nil
			arg_379_1.onSingleLineFinish_ = nil
			arg_379_1.state_ = "waiting"
		end

		function arg_379_1.playNext_(arg_381_0)
			if arg_381_0 == 1 then
				arg_379_0:Play121481094(arg_379_1)
			end
		end

		function arg_379_1.onSingleLineUpdate_(arg_382_0)
			local var_382_0 = arg_379_1.actors_["1069ui_story"].transform
			local var_382_1 = 0

			if var_382_1 < arg_379_1.time_ and arg_379_1.time_ <= var_382_1 + arg_382_0 then
				arg_379_1.var_.moveOldPos1069ui_story = var_382_0.localPosition
			end

			local var_382_2 = 0.001

			if var_382_1 <= arg_379_1.time_ and arg_379_1.time_ < var_382_1 + var_382_2 then
				local var_382_3 = (arg_379_1.time_ - var_382_1) / var_382_2
				local var_382_4 = Vector3.New(0, 100, 0)

				var_382_0.localPosition = Vector3.Lerp(arg_379_1.var_.moveOldPos1069ui_story, var_382_4, var_382_3)

				local var_382_5 = manager.ui.mainCamera.transform.position - var_382_0.position

				var_382_0.forward = Vector3.New(var_382_5.x, var_382_5.y, var_382_5.z)

				local var_382_6 = var_382_0.localEulerAngles

				var_382_6.z = 0
				var_382_6.x = 0
				var_382_0.localEulerAngles = var_382_6
			end

			if arg_379_1.time_ >= var_382_1 + var_382_2 and arg_379_1.time_ < var_382_1 + var_382_2 + arg_382_0 then
				var_382_0.localPosition = Vector3.New(0, 100, 0)

				local var_382_7 = manager.ui.mainCamera.transform.position - var_382_0.position

				var_382_0.forward = Vector3.New(var_382_7.x, var_382_7.y, var_382_7.z)

				local var_382_8 = var_382_0.localEulerAngles

				var_382_8.z = 0
				var_382_8.x = 0
				var_382_0.localEulerAngles = var_382_8
			end

			local var_382_9 = 0
			local var_382_10 = 0.633333333333333

			if var_382_9 < arg_379_1.time_ and arg_379_1.time_ <= var_382_9 + arg_382_0 then
				local var_382_11 = "play"
				local var_382_12 = "effect"

				arg_379_1:AudioAction(var_382_11, var_382_12, "se_story_121_04", "se_story_121_04_deformation", "")
			end

			local var_382_13 = 0
			local var_382_14 = 0.433333333333333

			if var_382_13 < arg_379_1.time_ and arg_379_1.time_ <= var_382_13 + arg_382_0 then
				local var_382_15 = "stop"
				local var_382_16 = "effect"

				arg_379_1:AudioAction(var_382_15, var_382_16, "se_story_121_04", "se_story_121_04_drill_loop", "")
			end

			local var_382_17 = 0
			local var_382_18 = 1.75

			if var_382_17 < arg_379_1.time_ and arg_379_1.time_ <= var_382_17 + arg_382_0 then
				arg_379_1.talkMaxDuration = 0
				arg_379_1.dialogCg_.alpha = 1

				arg_379_1.dialog_:SetActive(true)
				SetActive(arg_379_1.leftNameGo_, false)

				arg_379_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_379_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_379_1:RecordName(arg_379_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_379_1.iconTrs_.gameObject, false)
				arg_379_1.callingController_:SetSelectedState("normal")

				local var_382_19 = arg_379_1:GetWordFromCfg(121481093)
				local var_382_20 = arg_379_1:FormatText(var_382_19.content)

				arg_379_1.text_.text = var_382_20

				LuaForUtil.ClearLinePrefixSymbol(arg_379_1.text_)

				local var_382_21 = 70
				local var_382_22 = utf8.len(var_382_20)
				local var_382_23 = var_382_21 <= 0 and var_382_18 or var_382_18 * (var_382_22 / var_382_21)

				if var_382_23 > 0 and var_382_18 < var_382_23 then
					arg_379_1.talkMaxDuration = var_382_23

					if var_382_23 + var_382_17 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_23 + var_382_17
					end
				end

				arg_379_1.text_.text = var_382_20
				arg_379_1.typewritter.percent = 0

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(false)
				arg_379_1:RecordContent(arg_379_1.text_.text)
			end

			local var_382_24 = math.max(var_382_18, arg_379_1.talkMaxDuration)

			if var_382_17 <= arg_379_1.time_ and arg_379_1.time_ < var_382_17 + var_382_24 then
				arg_379_1.typewritter.percent = (arg_379_1.time_ - var_382_17) / var_382_24

				arg_379_1.typewritter:SetDirty()
			end

			if arg_379_1.time_ >= var_382_17 + var_382_24 and arg_379_1.time_ < var_382_17 + var_382_24 + arg_382_0 then
				arg_379_1.typewritter.percent = 1

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(true)
			end
		end
	end,
	Play121481094 = function(arg_383_0, arg_383_1)
		arg_383_1.time_ = 0
		arg_383_1.frameCnt_ = 0
		arg_383_1.state_ = "playing"
		arg_383_1.curTalkId_ = 121481094
		arg_383_1.duration_ = 5

		SetActive(arg_383_1.tipsGo_, false)

		function arg_383_1.onSingleLineFinish_()
			arg_383_1.onSingleLineUpdate_ = nil
			arg_383_1.onSingleLineFinish_ = nil
			arg_383_1.state_ = "waiting"
		end

		function arg_383_1.playNext_(arg_385_0)
			if arg_385_0 == 1 then
				arg_383_0:Play121481095(arg_383_1)
			end
		end

		function arg_383_1.onSingleLineUpdate_(arg_386_0)
			local var_386_0 = 0.2
			local var_386_1 = 0.533333333333333

			if var_386_0 < arg_383_1.time_ and arg_383_1.time_ <= var_386_0 + arg_386_0 then
				local var_386_2 = "play"
				local var_386_3 = "effect"

				arg_383_1:AudioAction(var_386_2, var_386_3, "se_story_121_04", "se_story_121_04_bow", "")
			end

			local var_386_4 = 0
			local var_386_5 = 0.1

			if var_386_4 < arg_383_1.time_ and arg_383_1.time_ <= var_386_4 + arg_386_0 then
				local var_386_6 = "stop"
				local var_386_7 = "effect"

				arg_383_1:AudioAction(var_386_6, var_386_7, "se_story_121_04", "se_story_121_04_deformation", "")
			end

			local var_386_8 = 0
			local var_386_9 = 1.575

			if var_386_8 < arg_383_1.time_ and arg_383_1.time_ <= var_386_8 + arg_386_0 then
				arg_383_1.talkMaxDuration = 0
				arg_383_1.dialogCg_.alpha = 1

				arg_383_1.dialog_:SetActive(true)
				SetActive(arg_383_1.leftNameGo_, false)

				arg_383_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_383_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_383_1:RecordName(arg_383_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_383_1.iconTrs_.gameObject, false)
				arg_383_1.callingController_:SetSelectedState("normal")

				local var_386_10 = arg_383_1:GetWordFromCfg(121481094)
				local var_386_11 = arg_383_1:FormatText(var_386_10.content)

				arg_383_1.text_.text = var_386_11

				LuaForUtil.ClearLinePrefixSymbol(arg_383_1.text_)

				local var_386_12 = 63
				local var_386_13 = utf8.len(var_386_11)
				local var_386_14 = var_386_12 <= 0 and var_386_9 or var_386_9 * (var_386_13 / var_386_12)

				if var_386_14 > 0 and var_386_9 < var_386_14 then
					arg_383_1.talkMaxDuration = var_386_14

					if var_386_14 + var_386_8 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_14 + var_386_8
					end
				end

				arg_383_1.text_.text = var_386_11
				arg_383_1.typewritter.percent = 0

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(false)
				arg_383_1:RecordContent(arg_383_1.text_.text)
			end

			local var_386_15 = math.max(var_386_9, arg_383_1.talkMaxDuration)

			if var_386_8 <= arg_383_1.time_ and arg_383_1.time_ < var_386_8 + var_386_15 then
				arg_383_1.typewritter.percent = (arg_383_1.time_ - var_386_8) / var_386_15

				arg_383_1.typewritter:SetDirty()
			end

			if arg_383_1.time_ >= var_386_8 + var_386_15 and arg_383_1.time_ < var_386_8 + var_386_15 + arg_386_0 then
				arg_383_1.typewritter.percent = 1

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(true)
			end
		end
	end,
	Play121481095 = function(arg_387_0, arg_387_1)
		arg_387_1.time_ = 0
		arg_387_1.frameCnt_ = 0
		arg_387_1.state_ = "playing"
		arg_387_1.curTalkId_ = 121481095
		arg_387_1.duration_ = 4.833

		local var_387_0 = {
			ja = 4.833,
			ko = 3.033,
			zh = 3.033
		}
		local var_387_1 = manager.audio:GetLocalizationFlag()

		if var_387_0[var_387_1] ~= nil then
			arg_387_1.duration_ = var_387_0[var_387_1]
		end

		SetActive(arg_387_1.tipsGo_, false)

		function arg_387_1.onSingleLineFinish_()
			arg_387_1.onSingleLineUpdate_ = nil
			arg_387_1.onSingleLineFinish_ = nil
			arg_387_1.state_ = "waiting"
		end

		function arg_387_1.playNext_(arg_389_0)
			if arg_389_0 == 1 then
				arg_387_0:Play121481096(arg_387_1)
			end
		end

		function arg_387_1.onSingleLineUpdate_(arg_390_0)
			local var_390_0 = 0
			local var_390_1 = 0.35

			if var_390_0 < arg_387_1.time_ and arg_387_1.time_ <= var_390_0 + arg_390_0 then
				arg_387_1.talkMaxDuration = 0
				arg_387_1.dialogCg_.alpha = 1

				arg_387_1.dialog_:SetActive(true)
				SetActive(arg_387_1.leftNameGo_, true)

				local var_390_2 = arg_387_1:FormatText(StoryNameCfg[378].name)

				arg_387_1.leftNameTxt_.text = var_390_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_387_1.leftNameTxt_.transform)

				arg_387_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_387_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_387_1:RecordName(arg_387_1.leftNameTxt_.text)
				SetActive(arg_387_1.iconTrs_.gameObject, true)
				arg_387_1.iconController_:SetSelectedState("hero")

				arg_387_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1069")

				arg_387_1.callingController_:SetSelectedState("normal")

				local var_390_3 = arg_387_1:GetWordFromCfg(121481095)
				local var_390_4 = arg_387_1:FormatText(var_390_3.content)

				arg_387_1.text_.text = var_390_4

				LuaForUtil.ClearLinePrefixSymbol(arg_387_1.text_)

				local var_390_5 = 14
				local var_390_6 = utf8.len(var_390_4)
				local var_390_7 = var_390_5 <= 0 and var_390_1 or var_390_1 * (var_390_6 / var_390_5)

				if var_390_7 > 0 and var_390_1 < var_390_7 then
					arg_387_1.talkMaxDuration = var_390_7

					if var_390_7 + var_390_0 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_7 + var_390_0
					end
				end

				arg_387_1.text_.text = var_390_4
				arg_387_1.typewritter.percent = 0

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481095", "story_v_out_121481.awb") ~= 0 then
					local var_390_8 = manager.audio:GetVoiceLength("story_v_out_121481", "121481095", "story_v_out_121481.awb") / 1000

					if var_390_8 + var_390_0 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_8 + var_390_0
					end

					if var_390_3.prefab_name ~= "" and arg_387_1.actors_[var_390_3.prefab_name] ~= nil then
						local var_390_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_387_1.actors_[var_390_3.prefab_name].transform, "story_v_out_121481", "121481095", "story_v_out_121481.awb")

						arg_387_1:RecordAudio("121481095", var_390_9)
						arg_387_1:RecordAudio("121481095", var_390_9)
					else
						arg_387_1:AudioAction("play", "voice", "story_v_out_121481", "121481095", "story_v_out_121481.awb")
					end

					arg_387_1:RecordHistoryTalkVoice("story_v_out_121481", "121481095", "story_v_out_121481.awb")
				end

				arg_387_1:RecordContent(arg_387_1.text_.text)
			end

			local var_390_10 = math.max(var_390_1, arg_387_1.talkMaxDuration)

			if var_390_0 <= arg_387_1.time_ and arg_387_1.time_ < var_390_0 + var_390_10 then
				arg_387_1.typewritter.percent = (arg_387_1.time_ - var_390_0) / var_390_10

				arg_387_1.typewritter:SetDirty()
			end

			if arg_387_1.time_ >= var_390_0 + var_390_10 and arg_387_1.time_ < var_390_0 + var_390_10 + arg_390_0 then
				arg_387_1.typewritter.percent = 1

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(true)
			end
		end
	end,
	Play121481096 = function(arg_391_0, arg_391_1)
		arg_391_1.time_ = 0
		arg_391_1.frameCnt_ = 0
		arg_391_1.state_ = "playing"
		arg_391_1.curTalkId_ = 121481096
		arg_391_1.duration_ = 6.36666666666667

		SetActive(arg_391_1.tipsGo_, false)

		function arg_391_1.onSingleLineFinish_()
			arg_391_1.onSingleLineUpdate_ = nil
			arg_391_1.onSingleLineFinish_ = nil
			arg_391_1.state_ = "waiting"
		end

		function arg_391_1.playNext_(arg_393_0)
			if arg_393_0 == 1 then
				arg_391_0:Play121481097(arg_391_1)
			end
		end

		function arg_391_1.onSingleLineUpdate_(arg_394_0)
			local var_394_0 = 0
			local var_394_1 = 0.0666666666666667

			if var_394_0 < arg_391_1.time_ and arg_391_1.time_ <= var_394_0 + arg_394_0 then
				local var_394_2 = "stop"
				local var_394_3 = "music"

				arg_391_1:AudioAction(var_394_2, var_394_3, "se_story_121_04", "se_story_121_04_bow", "")
			end

			local var_394_4 = 0.0999999999999999
			local var_394_5 = 0.633333333333333

			if var_394_4 < arg_391_1.time_ and arg_391_1.time_ <= var_394_4 + arg_394_0 then
				local var_394_6 = "play"
				local var_394_7 = "effect"

				arg_391_1:AudioAction(var_394_6, var_394_7, "se_story_121_04", "se_story_121_04_bowhit1", "")
			end

			local var_394_8 = 0

			if var_394_8 < arg_391_1.time_ and arg_391_1.time_ <= var_394_8 + arg_394_0 then
				arg_391_1.mask_.enabled = true
				arg_391_1.mask_.raycastTarget = true

				arg_391_1:SetGaussion(false)
			end

			local var_394_9 = 2

			if var_394_8 <= arg_391_1.time_ and arg_391_1.time_ < var_394_8 + var_394_9 then
				local var_394_10 = (arg_391_1.time_ - var_394_8) / var_394_9
				local var_394_11 = Color.New(1, 1, 1)

				var_394_11.a = Mathf.Lerp(1, 0, var_394_10)
				arg_391_1.mask_.color = var_394_11
			end

			if arg_391_1.time_ >= var_394_8 + var_394_9 and arg_391_1.time_ < var_394_8 + var_394_9 + arg_394_0 then
				local var_394_12 = Color.New(1, 1, 1)
				local var_394_13 = 0

				arg_391_1.mask_.enabled = false
				var_394_12.a = var_394_13
				arg_391_1.mask_.color = var_394_12
			end

			local var_394_14 = manager.ui.mainCamera.transform
			local var_394_15 = 0

			if var_394_15 < arg_391_1.time_ and arg_391_1.time_ <= var_394_15 + arg_394_0 then
				arg_391_1.var_.shakeOldPos = var_394_14.localPosition
			end

			local var_394_16 = 1

			if var_394_15 <= arg_391_1.time_ and arg_391_1.time_ < var_394_15 + var_394_16 then
				local var_394_17 = (arg_391_1.time_ - var_394_15) / 0.066
				local var_394_18, var_394_19 = math.modf(var_394_17)

				var_394_14.localPosition = Vector3.New(var_394_19 * 0.13, var_394_19 * 0.13, var_394_19 * 0.13) + arg_391_1.var_.shakeOldPos
			end

			if arg_391_1.time_ >= var_394_15 + var_394_16 and arg_391_1.time_ < var_394_15 + var_394_16 + arg_394_0 then
				var_394_14.localPosition = arg_391_1.var_.shakeOldPos
			end

			if arg_391_1.frameCnt_ <= 1 then
				arg_391_1.dialog_:SetActive(false)
			end

			local var_394_20 = 1.36666666666667
			local var_394_21 = 1.375

			if var_394_20 < arg_391_1.time_ and arg_391_1.time_ <= var_394_20 + arg_394_0 then
				arg_391_1.talkMaxDuration = 0

				arg_391_1.dialog_:SetActive(true)

				local var_394_22 = LeanTween.value(arg_391_1.dialog_, 0, 1, 0.3)

				var_394_22:setOnUpdate(LuaHelper.FloatAction(function(arg_395_0)
					arg_391_1.dialogCg_.alpha = arg_395_0
				end))
				var_394_22:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_391_1.dialog_)
					var_394_22:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_391_1.duration_ = arg_391_1.duration_ + 0.3

				SetActive(arg_391_1.leftNameGo_, false)

				arg_391_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_391_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_391_1:RecordName(arg_391_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_391_1.iconTrs_.gameObject, false)
				arg_391_1.callingController_:SetSelectedState("normal")

				local var_394_23 = arg_391_1:GetWordFromCfg(121481096)
				local var_394_24 = arg_391_1:FormatText(var_394_23.content)

				arg_391_1.text_.text = var_394_24

				LuaForUtil.ClearLinePrefixSymbol(arg_391_1.text_)

				local var_394_25 = 55
				local var_394_26 = utf8.len(var_394_24)
				local var_394_27 = var_394_25 <= 0 and var_394_21 or var_394_21 * (var_394_26 / var_394_25)

				if var_394_27 > 0 and var_394_21 < var_394_27 then
					arg_391_1.talkMaxDuration = var_394_27
					var_394_20 = var_394_20 + 0.3

					if var_394_27 + var_394_20 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_27 + var_394_20
					end
				end

				arg_391_1.text_.text = var_394_24
				arg_391_1.typewritter.percent = 0

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(false)
				arg_391_1:RecordContent(arg_391_1.text_.text)
			end

			local var_394_28 = var_394_20 + 0.3
			local var_394_29 = math.max(var_394_21, arg_391_1.talkMaxDuration)

			if var_394_28 <= arg_391_1.time_ and arg_391_1.time_ < var_394_28 + var_394_29 then
				arg_391_1.typewritter.percent = (arg_391_1.time_ - var_394_28) / var_394_29

				arg_391_1.typewritter:SetDirty()
			end

			if arg_391_1.time_ >= var_394_28 + var_394_29 and arg_391_1.time_ < var_394_28 + var_394_29 + arg_394_0 then
				arg_391_1.typewritter.percent = 1

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(true)
			end
		end
	end,
	Play121481097 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 121481097
		arg_397_1.duration_ = 5

		SetActive(arg_397_1.tipsGo_, false)

		function arg_397_1.onSingleLineFinish_()
			arg_397_1.onSingleLineUpdate_ = nil
			arg_397_1.onSingleLineFinish_ = nil
			arg_397_1.state_ = "waiting"
		end

		function arg_397_1.playNext_(arg_399_0)
			if arg_399_0 == 1 then
				arg_397_0:Play121481098(arg_397_1)
			end
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = 0.133333333333333
			local var_400_1 = 0.633333333333333

			if var_400_0 < arg_397_1.time_ and arg_397_1.time_ <= var_400_0 + arg_400_0 then
				local var_400_2 = "play"
				local var_400_3 = "effect"

				arg_397_1:AudioAction(var_400_2, var_400_3, "se_story_121_04", "se_story_121_04_weaponstart", "")
			end

			local var_400_4 = 0
			local var_400_5 = 1.225

			if var_400_4 < arg_397_1.time_ and arg_397_1.time_ <= var_400_4 + arg_400_0 then
				arg_397_1.talkMaxDuration = 0
				arg_397_1.dialogCg_.alpha = 1

				arg_397_1.dialog_:SetActive(true)
				SetActive(arg_397_1.leftNameGo_, false)

				arg_397_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_397_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_397_1:RecordName(arg_397_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_397_1.iconTrs_.gameObject, false)
				arg_397_1.callingController_:SetSelectedState("normal")

				local var_400_6 = arg_397_1:GetWordFromCfg(121481097)
				local var_400_7 = arg_397_1:FormatText(var_400_6.content)

				arg_397_1.text_.text = var_400_7

				LuaForUtil.ClearLinePrefixSymbol(arg_397_1.text_)

				local var_400_8 = 49
				local var_400_9 = utf8.len(var_400_7)
				local var_400_10 = var_400_8 <= 0 and var_400_5 or var_400_5 * (var_400_9 / var_400_8)

				if var_400_10 > 0 and var_400_5 < var_400_10 then
					arg_397_1.talkMaxDuration = var_400_10

					if var_400_10 + var_400_4 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_10 + var_400_4
					end
				end

				arg_397_1.text_.text = var_400_7
				arg_397_1.typewritter.percent = 0

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(false)
				arg_397_1:RecordContent(arg_397_1.text_.text)
			end

			local var_400_11 = math.max(var_400_5, arg_397_1.talkMaxDuration)

			if var_400_4 <= arg_397_1.time_ and arg_397_1.time_ < var_400_4 + var_400_11 then
				arg_397_1.typewritter.percent = (arg_397_1.time_ - var_400_4) / var_400_11

				arg_397_1.typewritter:SetDirty()
			end

			if arg_397_1.time_ >= var_400_4 + var_400_11 and arg_397_1.time_ < var_400_4 + var_400_11 + arg_400_0 then
				arg_397_1.typewritter.percent = 1

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(true)
			end
		end
	end,
	Play121481098 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 121481098
		arg_401_1.duration_ = 5

		SetActive(arg_401_1.tipsGo_, false)

		function arg_401_1.onSingleLineFinish_()
			arg_401_1.onSingleLineUpdate_ = nil
			arg_401_1.onSingleLineFinish_ = nil
			arg_401_1.state_ = "waiting"
		end

		function arg_401_1.playNext_(arg_403_0)
			if arg_403_0 == 1 then
				arg_401_0:Play121481099(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = 0
			local var_404_1 = 0.925

			if var_404_0 < arg_401_1.time_ and arg_401_1.time_ <= var_404_0 + arg_404_0 then
				arg_401_1.talkMaxDuration = 0
				arg_401_1.dialogCg_.alpha = 1

				arg_401_1.dialog_:SetActive(true)
				SetActive(arg_401_1.leftNameGo_, false)

				arg_401_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_401_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_401_1:RecordName(arg_401_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_401_1.iconTrs_.gameObject, false)
				arg_401_1.callingController_:SetSelectedState("normal")

				local var_404_2 = arg_401_1:GetWordFromCfg(121481098)
				local var_404_3 = arg_401_1:FormatText(var_404_2.content)

				arg_401_1.text_.text = var_404_3

				LuaForUtil.ClearLinePrefixSymbol(arg_401_1.text_)

				local var_404_4 = 37
				local var_404_5 = utf8.len(var_404_3)
				local var_404_6 = var_404_4 <= 0 and var_404_1 or var_404_1 * (var_404_5 / var_404_4)

				if var_404_6 > 0 and var_404_1 < var_404_6 then
					arg_401_1.talkMaxDuration = var_404_6

					if var_404_6 + var_404_0 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_6 + var_404_0
					end
				end

				arg_401_1.text_.text = var_404_3
				arg_401_1.typewritter.percent = 0

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(false)
				arg_401_1:RecordContent(arg_401_1.text_.text)
			end

			local var_404_7 = math.max(var_404_1, arg_401_1.talkMaxDuration)

			if var_404_0 <= arg_401_1.time_ and arg_401_1.time_ < var_404_0 + var_404_7 then
				arg_401_1.typewritter.percent = (arg_401_1.time_ - var_404_0) / var_404_7

				arg_401_1.typewritter:SetDirty()
			end

			if arg_401_1.time_ >= var_404_0 + var_404_7 and arg_401_1.time_ < var_404_0 + var_404_7 + arg_404_0 then
				arg_401_1.typewritter.percent = 1

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(true)
			end
		end
	end,
	Play121481099 = function(arg_405_0, arg_405_1)
		arg_405_1.time_ = 0
		arg_405_1.frameCnt_ = 0
		arg_405_1.state_ = "playing"
		arg_405_1.curTalkId_ = 121481099
		arg_405_1.duration_ = 4.833

		local var_405_0 = {
			ja = 4.833,
			ko = 2.8,
			zh = 2.8
		}
		local var_405_1 = manager.audio:GetLocalizationFlag()

		if var_405_0[var_405_1] ~= nil then
			arg_405_1.duration_ = var_405_0[var_405_1]
		end

		SetActive(arg_405_1.tipsGo_, false)

		function arg_405_1.onSingleLineFinish_()
			arg_405_1.onSingleLineUpdate_ = nil
			arg_405_1.onSingleLineFinish_ = nil
			arg_405_1.state_ = "waiting"
		end

		function arg_405_1.playNext_(arg_407_0)
			if arg_407_0 == 1 then
				arg_405_0:Play121481100(arg_405_1)
			end
		end

		function arg_405_1.onSingleLineUpdate_(arg_408_0)
			local var_408_0 = "10045ui_story"

			if arg_405_1.actors_[var_408_0] == nil then
				local var_408_1 = Object.Instantiate(Asset.Load("Char/" .. var_408_0), arg_405_1.stage_.transform)

				var_408_1.name = var_408_0
				var_408_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_405_1.actors_[var_408_0] = var_408_1

				local var_408_2 = var_408_1:GetComponentInChildren(typeof(CharacterEffect))

				var_408_2.enabled = true

				local var_408_3 = GameObjectTools.GetOrAddComponent(var_408_1, typeof(DynamicBoneHelper))

				if var_408_3 then
					var_408_3:EnableDynamicBone(false)
				end

				arg_405_1:ShowWeapon(var_408_2.transform, false)

				arg_405_1.var_[var_408_0 .. "Animator"] = var_408_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_405_1.var_[var_408_0 .. "Animator"].applyRootMotion = true
				arg_405_1.var_[var_408_0 .. "LipSync"] = var_408_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_408_4 = arg_405_1.actors_["10045ui_story"].transform
			local var_408_5 = 0

			if var_408_5 < arg_405_1.time_ and arg_405_1.time_ <= var_408_5 + arg_408_0 then
				arg_405_1.var_.moveOldPos10045ui_story = var_408_4.localPosition
			end

			local var_408_6 = 0.001

			if var_408_5 <= arg_405_1.time_ and arg_405_1.time_ < var_408_5 + var_408_6 then
				local var_408_7 = (arg_405_1.time_ - var_408_5) / var_408_6
				local var_408_8 = Vector3.New(0, -1.18, -6.05)

				var_408_4.localPosition = Vector3.Lerp(arg_405_1.var_.moveOldPos10045ui_story, var_408_8, var_408_7)

				local var_408_9 = manager.ui.mainCamera.transform.position - var_408_4.position

				var_408_4.forward = Vector3.New(var_408_9.x, var_408_9.y, var_408_9.z)

				local var_408_10 = var_408_4.localEulerAngles

				var_408_10.z = 0
				var_408_10.x = 0
				var_408_4.localEulerAngles = var_408_10
			end

			if arg_405_1.time_ >= var_408_5 + var_408_6 and arg_405_1.time_ < var_408_5 + var_408_6 + arg_408_0 then
				var_408_4.localPosition = Vector3.New(0, -1.18, -6.05)

				local var_408_11 = manager.ui.mainCamera.transform.position - var_408_4.position

				var_408_4.forward = Vector3.New(var_408_11.x, var_408_11.y, var_408_11.z)

				local var_408_12 = var_408_4.localEulerAngles

				var_408_12.z = 0
				var_408_12.x = 0
				var_408_4.localEulerAngles = var_408_12
			end

			local var_408_13 = arg_405_1.actors_["10045ui_story"]
			local var_408_14 = 0

			if var_408_14 < arg_405_1.time_ and arg_405_1.time_ <= var_408_14 + arg_408_0 and arg_405_1.var_.characterEffect10045ui_story == nil then
				arg_405_1.var_.characterEffect10045ui_story = var_408_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_408_15 = 0.200000002980232

			if var_408_14 <= arg_405_1.time_ and arg_405_1.time_ < var_408_14 + var_408_15 then
				local var_408_16 = (arg_405_1.time_ - var_408_14) / var_408_15

				if arg_405_1.var_.characterEffect10045ui_story then
					arg_405_1.var_.characterEffect10045ui_story.fillFlat = false
				end
			end

			if arg_405_1.time_ >= var_408_14 + var_408_15 and arg_405_1.time_ < var_408_14 + var_408_15 + arg_408_0 and arg_405_1.var_.characterEffect10045ui_story then
				arg_405_1.var_.characterEffect10045ui_story.fillFlat = false
			end

			local var_408_17 = 0

			if var_408_17 < arg_405_1.time_ and arg_405_1.time_ <= var_408_17 + arg_408_0 then
				arg_405_1:PlayTimeline("10045ui_story", "StoryTimeline/CharAction/story10045/story10045action/10045action2_1")
			end

			local var_408_18 = 0

			if var_408_18 < arg_405_1.time_ and arg_405_1.time_ <= var_408_18 + arg_408_0 then
				arg_405_1:PlayTimeline("10045ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_408_19 = 0
			local var_408_20 = 0.325

			if var_408_19 < arg_405_1.time_ and arg_405_1.time_ <= var_408_19 + arg_408_0 then
				arg_405_1.talkMaxDuration = 0
				arg_405_1.dialogCg_.alpha = 1

				arg_405_1.dialog_:SetActive(true)
				SetActive(arg_405_1.leftNameGo_, true)

				local var_408_21 = arg_405_1:FormatText(StoryNameCfg[412].name)

				arg_405_1.leftNameTxt_.text = var_408_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_405_1.leftNameTxt_.transform)

				arg_405_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_405_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_405_1:RecordName(arg_405_1.leftNameTxt_.text)
				SetActive(arg_405_1.iconTrs_.gameObject, false)
				arg_405_1.callingController_:SetSelectedState("normal")

				local var_408_22 = arg_405_1:GetWordFromCfg(121481099)
				local var_408_23 = arg_405_1:FormatText(var_408_22.content)

				arg_405_1.text_.text = var_408_23

				LuaForUtil.ClearLinePrefixSymbol(arg_405_1.text_)

				local var_408_24 = 13
				local var_408_25 = utf8.len(var_408_23)
				local var_408_26 = var_408_24 <= 0 and var_408_20 or var_408_20 * (var_408_25 / var_408_24)

				if var_408_26 > 0 and var_408_20 < var_408_26 then
					arg_405_1.talkMaxDuration = var_408_26

					if var_408_26 + var_408_19 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_26 + var_408_19
					end
				end

				arg_405_1.text_.text = var_408_23
				arg_405_1.typewritter.percent = 0

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481099", "story_v_out_121481.awb") ~= 0 then
					local var_408_27 = manager.audio:GetVoiceLength("story_v_out_121481", "121481099", "story_v_out_121481.awb") / 1000

					if var_408_27 + var_408_19 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_27 + var_408_19
					end

					if var_408_22.prefab_name ~= "" and arg_405_1.actors_[var_408_22.prefab_name] ~= nil then
						local var_408_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_405_1.actors_[var_408_22.prefab_name].transform, "story_v_out_121481", "121481099", "story_v_out_121481.awb")

						arg_405_1:RecordAudio("121481099", var_408_28)
						arg_405_1:RecordAudio("121481099", var_408_28)
					else
						arg_405_1:AudioAction("play", "voice", "story_v_out_121481", "121481099", "story_v_out_121481.awb")
					end

					arg_405_1:RecordHistoryTalkVoice("story_v_out_121481", "121481099", "story_v_out_121481.awb")
				end

				arg_405_1:RecordContent(arg_405_1.text_.text)
			end

			local var_408_29 = math.max(var_408_20, arg_405_1.talkMaxDuration)

			if var_408_19 <= arg_405_1.time_ and arg_405_1.time_ < var_408_19 + var_408_29 then
				arg_405_1.typewritter.percent = (arg_405_1.time_ - var_408_19) / var_408_29

				arg_405_1.typewritter:SetDirty()
			end

			if arg_405_1.time_ >= var_408_19 + var_408_29 and arg_405_1.time_ < var_408_19 + var_408_29 + arg_408_0 then
				arg_405_1.typewritter.percent = 1

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(true)
			end
		end
	end,
	Play121481100 = function(arg_409_0, arg_409_1)
		arg_409_1.time_ = 0
		arg_409_1.frameCnt_ = 0
		arg_409_1.state_ = "playing"
		arg_409_1.curTalkId_ = 121481100
		arg_409_1.duration_ = 3.666

		local var_409_0 = {
			ja = 3.166,
			ko = 3.666,
			zh = 3.666
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
				arg_409_0:Play121481101(arg_409_1)
			end
		end

		function arg_409_1.onSingleLineUpdate_(arg_412_0)
			local var_412_0 = arg_409_1.actors_["10045ui_story"].transform
			local var_412_1 = 0

			if var_412_1 < arg_409_1.time_ and arg_409_1.time_ <= var_412_1 + arg_412_0 then
				arg_409_1.var_.moveOldPos10045ui_story = var_412_0.localPosition
			end

			local var_412_2 = 0.001

			if var_412_1 <= arg_409_1.time_ and arg_409_1.time_ < var_412_1 + var_412_2 then
				local var_412_3 = (arg_409_1.time_ - var_412_1) / var_412_2
				local var_412_4 = Vector3.New(0, -1.18, -6.05)

				var_412_0.localPosition = Vector3.Lerp(arg_409_1.var_.moveOldPos10045ui_story, var_412_4, var_412_3)

				local var_412_5 = manager.ui.mainCamera.transform.position - var_412_0.position

				var_412_0.forward = Vector3.New(var_412_5.x, var_412_5.y, var_412_5.z)

				local var_412_6 = var_412_0.localEulerAngles

				var_412_6.z = 0
				var_412_6.x = 0
				var_412_0.localEulerAngles = var_412_6
			end

			if arg_409_1.time_ >= var_412_1 + var_412_2 and arg_409_1.time_ < var_412_1 + var_412_2 + arg_412_0 then
				var_412_0.localPosition = Vector3.New(0, -1.18, -6.05)

				local var_412_7 = manager.ui.mainCamera.transform.position - var_412_0.position

				var_412_0.forward = Vector3.New(var_412_7.x, var_412_7.y, var_412_7.z)

				local var_412_8 = var_412_0.localEulerAngles

				var_412_8.z = 0
				var_412_8.x = 0
				var_412_0.localEulerAngles = var_412_8
			end

			local var_412_9 = arg_409_1.actors_["10045ui_story"]
			local var_412_10 = 0

			if var_412_10 < arg_409_1.time_ and arg_409_1.time_ <= var_412_10 + arg_412_0 and arg_409_1.var_.characterEffect10045ui_story == nil then
				arg_409_1.var_.characterEffect10045ui_story = var_412_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_412_11 = 0.200000002980232

			if var_412_10 <= arg_409_1.time_ and arg_409_1.time_ < var_412_10 + var_412_11 then
				local var_412_12 = (arg_409_1.time_ - var_412_10) / var_412_11

				if arg_409_1.var_.characterEffect10045ui_story then
					arg_409_1.var_.characterEffect10045ui_story.fillFlat = false
				end
			end

			if arg_409_1.time_ >= var_412_10 + var_412_11 and arg_409_1.time_ < var_412_10 + var_412_11 + arg_412_0 and arg_409_1.var_.characterEffect10045ui_story then
				arg_409_1.var_.characterEffect10045ui_story.fillFlat = false
			end

			local var_412_13 = 0

			if var_412_13 < arg_409_1.time_ and arg_409_1.time_ <= var_412_13 + arg_412_0 then
				arg_409_1:PlayTimeline("10045ui_story", "StoryTimeline/CharAction/story10045/story10045action/10045action2_2")
			end

			local var_412_14 = 0

			if var_412_14 < arg_409_1.time_ and arg_409_1.time_ <= var_412_14 + arg_412_0 then
				arg_409_1:PlayTimeline("10045ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_412_15 = 0
			local var_412_16 = 0.4

			if var_412_15 < arg_409_1.time_ and arg_409_1.time_ <= var_412_15 + arg_412_0 then
				arg_409_1.talkMaxDuration = 0
				arg_409_1.dialogCg_.alpha = 1

				arg_409_1.dialog_:SetActive(true)
				SetActive(arg_409_1.leftNameGo_, true)

				local var_412_17 = arg_409_1:FormatText(StoryNameCfg[412].name)

				arg_409_1.leftNameTxt_.text = var_412_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_409_1.leftNameTxt_.transform)

				arg_409_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_409_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_409_1:RecordName(arg_409_1.leftNameTxt_.text)
				SetActive(arg_409_1.iconTrs_.gameObject, false)
				arg_409_1.callingController_:SetSelectedState("normal")

				local var_412_18 = arg_409_1:GetWordFromCfg(121481100)
				local var_412_19 = arg_409_1:FormatText(var_412_18.content)

				arg_409_1.text_.text = var_412_19

				LuaForUtil.ClearLinePrefixSymbol(arg_409_1.text_)

				local var_412_20 = 16
				local var_412_21 = utf8.len(var_412_19)
				local var_412_22 = var_412_20 <= 0 and var_412_16 or var_412_16 * (var_412_21 / var_412_20)

				if var_412_22 > 0 and var_412_16 < var_412_22 then
					arg_409_1.talkMaxDuration = var_412_22

					if var_412_22 + var_412_15 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_22 + var_412_15
					end
				end

				arg_409_1.text_.text = var_412_19
				arg_409_1.typewritter.percent = 0

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481100", "story_v_out_121481.awb") ~= 0 then
					local var_412_23 = manager.audio:GetVoiceLength("story_v_out_121481", "121481100", "story_v_out_121481.awb") / 1000

					if var_412_23 + var_412_15 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_23 + var_412_15
					end

					if var_412_18.prefab_name ~= "" and arg_409_1.actors_[var_412_18.prefab_name] ~= nil then
						local var_412_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_409_1.actors_[var_412_18.prefab_name].transform, "story_v_out_121481", "121481100", "story_v_out_121481.awb")

						arg_409_1:RecordAudio("121481100", var_412_24)
						arg_409_1:RecordAudio("121481100", var_412_24)
					else
						arg_409_1:AudioAction("play", "voice", "story_v_out_121481", "121481100", "story_v_out_121481.awb")
					end

					arg_409_1:RecordHistoryTalkVoice("story_v_out_121481", "121481100", "story_v_out_121481.awb")
				end

				arg_409_1:RecordContent(arg_409_1.text_.text)
			end

			local var_412_25 = math.max(var_412_16, arg_409_1.talkMaxDuration)

			if var_412_15 <= arg_409_1.time_ and arg_409_1.time_ < var_412_15 + var_412_25 then
				arg_409_1.typewritter.percent = (arg_409_1.time_ - var_412_15) / var_412_25

				arg_409_1.typewritter:SetDirty()
			end

			if arg_409_1.time_ >= var_412_15 + var_412_25 and arg_409_1.time_ < var_412_15 + var_412_25 + arg_412_0 then
				arg_409_1.typewritter.percent = 1

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(true)
			end
		end
	end,
	Play121481101 = function(arg_413_0, arg_413_1)
		arg_413_1.time_ = 0
		arg_413_1.frameCnt_ = 0
		arg_413_1.state_ = "playing"
		arg_413_1.curTalkId_ = 121481101
		arg_413_1.duration_ = 5

		SetActive(arg_413_1.tipsGo_, false)

		function arg_413_1.onSingleLineFinish_()
			arg_413_1.onSingleLineUpdate_ = nil
			arg_413_1.onSingleLineFinish_ = nil
			arg_413_1.state_ = "waiting"
		end

		function arg_413_1.playNext_(arg_415_0)
			if arg_415_0 == 1 then
				arg_413_0:Play121481102(arg_413_1)
			end
		end

		function arg_413_1.onSingleLineUpdate_(arg_416_0)
			local var_416_0 = arg_413_1.actors_["10045ui_story"]
			local var_416_1 = 0

			if var_416_1 < arg_413_1.time_ and arg_413_1.time_ <= var_416_1 + arg_416_0 and arg_413_1.var_.characterEffect10045ui_story == nil then
				arg_413_1.var_.characterEffect10045ui_story = var_416_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_416_2 = 0.200000002980232

			if var_416_1 <= arg_413_1.time_ and arg_413_1.time_ < var_416_1 + var_416_2 then
				local var_416_3 = (arg_413_1.time_ - var_416_1) / var_416_2

				if arg_413_1.var_.characterEffect10045ui_story then
					local var_416_4 = Mathf.Lerp(0, 0.5, var_416_3)

					arg_413_1.var_.characterEffect10045ui_story.fillFlat = true
					arg_413_1.var_.characterEffect10045ui_story.fillRatio = var_416_4
				end
			end

			if arg_413_1.time_ >= var_416_1 + var_416_2 and arg_413_1.time_ < var_416_1 + var_416_2 + arg_416_0 and arg_413_1.var_.characterEffect10045ui_story then
				local var_416_5 = 0.5

				arg_413_1.var_.characterEffect10045ui_story.fillFlat = true
				arg_413_1.var_.characterEffect10045ui_story.fillRatio = var_416_5
			end

			local var_416_6 = 0
			local var_416_7 = 0.975

			if var_416_6 < arg_413_1.time_ and arg_413_1.time_ <= var_416_6 + arg_416_0 then
				arg_413_1.talkMaxDuration = 0
				arg_413_1.dialogCg_.alpha = 1

				arg_413_1.dialog_:SetActive(true)
				SetActive(arg_413_1.leftNameGo_, false)

				arg_413_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_413_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_413_1:RecordName(arg_413_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_413_1.iconTrs_.gameObject, false)
				arg_413_1.callingController_:SetSelectedState("normal")

				local var_416_8 = arg_413_1:GetWordFromCfg(121481101)
				local var_416_9 = arg_413_1:FormatText(var_416_8.content)

				arg_413_1.text_.text = var_416_9

				LuaForUtil.ClearLinePrefixSymbol(arg_413_1.text_)

				local var_416_10 = 39
				local var_416_11 = utf8.len(var_416_9)
				local var_416_12 = var_416_10 <= 0 and var_416_7 or var_416_7 * (var_416_11 / var_416_10)

				if var_416_12 > 0 and var_416_7 < var_416_12 then
					arg_413_1.talkMaxDuration = var_416_12

					if var_416_12 + var_416_6 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_12 + var_416_6
					end
				end

				arg_413_1.text_.text = var_416_9
				arg_413_1.typewritter.percent = 0

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(false)
				arg_413_1:RecordContent(arg_413_1.text_.text)
			end

			local var_416_13 = math.max(var_416_7, arg_413_1.talkMaxDuration)

			if var_416_6 <= arg_413_1.time_ and arg_413_1.time_ < var_416_6 + var_416_13 then
				arg_413_1.typewritter.percent = (arg_413_1.time_ - var_416_6) / var_416_13

				arg_413_1.typewritter:SetDirty()
			end

			if arg_413_1.time_ >= var_416_6 + var_416_13 and arg_413_1.time_ < var_416_6 + var_416_13 + arg_416_0 then
				arg_413_1.typewritter.percent = 1

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(true)
			end
		end
	end,
	Play121481102 = function(arg_417_0, arg_417_1)
		arg_417_1.time_ = 0
		arg_417_1.frameCnt_ = 0
		arg_417_1.state_ = "playing"
		arg_417_1.curTalkId_ = 121481102
		arg_417_1.duration_ = 4.066

		local var_417_0 = {
			ja = 4.066,
			ko = 3.366,
			zh = 3.366
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
				arg_417_0:Play121481103(arg_417_1)
			end
		end

		function arg_417_1.onSingleLineUpdate_(arg_420_0)
			local var_420_0 = arg_417_1.actors_["10045ui_story"]
			local var_420_1 = 0

			if var_420_1 < arg_417_1.time_ and arg_417_1.time_ <= var_420_1 + arg_420_0 and arg_417_1.var_.characterEffect10045ui_story == nil then
				arg_417_1.var_.characterEffect10045ui_story = var_420_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_420_2 = 0.200000002980232

			if var_420_1 <= arg_417_1.time_ and arg_417_1.time_ < var_420_1 + var_420_2 then
				local var_420_3 = (arg_417_1.time_ - var_420_1) / var_420_2

				if arg_417_1.var_.characterEffect10045ui_story then
					arg_417_1.var_.characterEffect10045ui_story.fillFlat = false
				end
			end

			if arg_417_1.time_ >= var_420_1 + var_420_2 and arg_417_1.time_ < var_420_1 + var_420_2 + arg_420_0 and arg_417_1.var_.characterEffect10045ui_story then
				arg_417_1.var_.characterEffect10045ui_story.fillFlat = false
			end

			local var_420_4 = 0

			if var_420_4 < arg_417_1.time_ and arg_417_1.time_ <= var_420_4 + arg_420_0 then
				arg_417_1:PlayTimeline("10045ui_story", "StoryTimeline/CharAction/story10045/story10045action/10045action4_1")
			end

			local var_420_5 = 0

			if var_420_5 < arg_417_1.time_ and arg_417_1.time_ <= var_420_5 + arg_420_0 then
				arg_417_1:PlayTimeline("10045ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_420_6 = 0
			local var_420_7 = 0.225

			if var_420_6 < arg_417_1.time_ and arg_417_1.time_ <= var_420_6 + arg_420_0 then
				arg_417_1.talkMaxDuration = 0
				arg_417_1.dialogCg_.alpha = 1

				arg_417_1.dialog_:SetActive(true)
				SetActive(arg_417_1.leftNameGo_, true)

				local var_420_8 = arg_417_1:FormatText(StoryNameCfg[412].name)

				arg_417_1.leftNameTxt_.text = var_420_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_417_1.leftNameTxt_.transform)

				arg_417_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_417_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_417_1:RecordName(arg_417_1.leftNameTxt_.text)
				SetActive(arg_417_1.iconTrs_.gameObject, false)
				arg_417_1.callingController_:SetSelectedState("normal")

				local var_420_9 = arg_417_1:GetWordFromCfg(121481102)
				local var_420_10 = arg_417_1:FormatText(var_420_9.content)

				arg_417_1.text_.text = var_420_10

				LuaForUtil.ClearLinePrefixSymbol(arg_417_1.text_)

				local var_420_11 = 9
				local var_420_12 = utf8.len(var_420_10)
				local var_420_13 = var_420_11 <= 0 and var_420_7 or var_420_7 * (var_420_12 / var_420_11)

				if var_420_13 > 0 and var_420_7 < var_420_13 then
					arg_417_1.talkMaxDuration = var_420_13

					if var_420_13 + var_420_6 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_13 + var_420_6
					end
				end

				arg_417_1.text_.text = var_420_10
				arg_417_1.typewritter.percent = 0

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481102", "story_v_out_121481.awb") ~= 0 then
					local var_420_14 = manager.audio:GetVoiceLength("story_v_out_121481", "121481102", "story_v_out_121481.awb") / 1000

					if var_420_14 + var_420_6 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_14 + var_420_6
					end

					if var_420_9.prefab_name ~= "" and arg_417_1.actors_[var_420_9.prefab_name] ~= nil then
						local var_420_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_417_1.actors_[var_420_9.prefab_name].transform, "story_v_out_121481", "121481102", "story_v_out_121481.awb")

						arg_417_1:RecordAudio("121481102", var_420_15)
						arg_417_1:RecordAudio("121481102", var_420_15)
					else
						arg_417_1:AudioAction("play", "voice", "story_v_out_121481", "121481102", "story_v_out_121481.awb")
					end

					arg_417_1:RecordHistoryTalkVoice("story_v_out_121481", "121481102", "story_v_out_121481.awb")
				end

				arg_417_1:RecordContent(arg_417_1.text_.text)
			end

			local var_420_16 = math.max(var_420_7, arg_417_1.talkMaxDuration)

			if var_420_6 <= arg_417_1.time_ and arg_417_1.time_ < var_420_6 + var_420_16 then
				arg_417_1.typewritter.percent = (arg_417_1.time_ - var_420_6) / var_420_16

				arg_417_1.typewritter:SetDirty()
			end

			if arg_417_1.time_ >= var_420_6 + var_420_16 and arg_417_1.time_ < var_420_6 + var_420_16 + arg_420_0 then
				arg_417_1.typewritter.percent = 1

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(true)
			end
		end
	end,
	Play121481103 = function(arg_421_0, arg_421_1)
		arg_421_1.time_ = 0
		arg_421_1.frameCnt_ = 0
		arg_421_1.state_ = "playing"
		arg_421_1.curTalkId_ = 121481103
		arg_421_1.duration_ = 5

		SetActive(arg_421_1.tipsGo_, false)

		function arg_421_1.onSingleLineFinish_()
			arg_421_1.onSingleLineUpdate_ = nil
			arg_421_1.onSingleLineFinish_ = nil
			arg_421_1.state_ = "waiting"
		end

		function arg_421_1.playNext_(arg_423_0)
			if arg_423_0 == 1 then
				arg_421_0:Play121481104(arg_421_1)
			end
		end

		function arg_421_1.onSingleLineUpdate_(arg_424_0)
			local var_424_0 = arg_421_1.actors_["10045ui_story"].transform
			local var_424_1 = 0

			if var_424_1 < arg_421_1.time_ and arg_421_1.time_ <= var_424_1 + arg_424_0 then
				arg_421_1.var_.moveOldPos10045ui_story = var_424_0.localPosition
			end

			local var_424_2 = 0.001

			if var_424_1 <= arg_421_1.time_ and arg_421_1.time_ < var_424_1 + var_424_2 then
				local var_424_3 = (arg_421_1.time_ - var_424_1) / var_424_2
				local var_424_4 = Vector3.New(0, 100, 0)

				var_424_0.localPosition = Vector3.Lerp(arg_421_1.var_.moveOldPos10045ui_story, var_424_4, var_424_3)

				local var_424_5 = manager.ui.mainCamera.transform.position - var_424_0.position

				var_424_0.forward = Vector3.New(var_424_5.x, var_424_5.y, var_424_5.z)

				local var_424_6 = var_424_0.localEulerAngles

				var_424_6.z = 0
				var_424_6.x = 0
				var_424_0.localEulerAngles = var_424_6
			end

			if arg_421_1.time_ >= var_424_1 + var_424_2 and arg_421_1.time_ < var_424_1 + var_424_2 + arg_424_0 then
				var_424_0.localPosition = Vector3.New(0, 100, 0)

				local var_424_7 = manager.ui.mainCamera.transform.position - var_424_0.position

				var_424_0.forward = Vector3.New(var_424_7.x, var_424_7.y, var_424_7.z)

				local var_424_8 = var_424_0.localEulerAngles

				var_424_8.z = 0
				var_424_8.x = 0
				var_424_0.localEulerAngles = var_424_8
			end

			local var_424_9 = arg_421_1.actors_["10045ui_story"]
			local var_424_10 = 0

			if var_424_10 < arg_421_1.time_ and arg_421_1.time_ <= var_424_10 + arg_424_0 and arg_421_1.var_.characterEffect10045ui_story == nil then
				arg_421_1.var_.characterEffect10045ui_story = var_424_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_424_11 = 0.200000002980232

			if var_424_10 <= arg_421_1.time_ and arg_421_1.time_ < var_424_10 + var_424_11 then
				local var_424_12 = (arg_421_1.time_ - var_424_10) / var_424_11

				if arg_421_1.var_.characterEffect10045ui_story then
					local var_424_13 = Mathf.Lerp(0, 0.5, var_424_12)

					arg_421_1.var_.characterEffect10045ui_story.fillFlat = true
					arg_421_1.var_.characterEffect10045ui_story.fillRatio = var_424_13
				end
			end

			if arg_421_1.time_ >= var_424_10 + var_424_11 and arg_421_1.time_ < var_424_10 + var_424_11 + arg_424_0 and arg_421_1.var_.characterEffect10045ui_story then
				local var_424_14 = 0.5

				arg_421_1.var_.characterEffect10045ui_story.fillFlat = true
				arg_421_1.var_.characterEffect10045ui_story.fillRatio = var_424_14
			end

			local var_424_15 = 0
			local var_424_16 = 1.1

			if var_424_15 < arg_421_1.time_ and arg_421_1.time_ <= var_424_15 + arg_424_0 then
				arg_421_1.talkMaxDuration = 0
				arg_421_1.dialogCg_.alpha = 1

				arg_421_1.dialog_:SetActive(true)
				SetActive(arg_421_1.leftNameGo_, false)

				arg_421_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_421_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_421_1:RecordName(arg_421_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_421_1.iconTrs_.gameObject, false)
				arg_421_1.callingController_:SetSelectedState("normal")

				local var_424_17 = arg_421_1:GetWordFromCfg(121481103)
				local var_424_18 = arg_421_1:FormatText(var_424_17.content)

				arg_421_1.text_.text = var_424_18

				LuaForUtil.ClearLinePrefixSymbol(arg_421_1.text_)

				local var_424_19 = 44
				local var_424_20 = utf8.len(var_424_18)
				local var_424_21 = var_424_19 <= 0 and var_424_16 or var_424_16 * (var_424_20 / var_424_19)

				if var_424_21 > 0 and var_424_16 < var_424_21 then
					arg_421_1.talkMaxDuration = var_424_21

					if var_424_21 + var_424_15 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_21 + var_424_15
					end
				end

				arg_421_1.text_.text = var_424_18
				arg_421_1.typewritter.percent = 0

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(false)
				arg_421_1:RecordContent(arg_421_1.text_.text)
			end

			local var_424_22 = math.max(var_424_16, arg_421_1.talkMaxDuration)

			if var_424_15 <= arg_421_1.time_ and arg_421_1.time_ < var_424_15 + var_424_22 then
				arg_421_1.typewritter.percent = (arg_421_1.time_ - var_424_15) / var_424_22

				arg_421_1.typewritter:SetDirty()
			end

			if arg_421_1.time_ >= var_424_15 + var_424_22 and arg_421_1.time_ < var_424_15 + var_424_22 + arg_424_0 then
				arg_421_1.typewritter.percent = 1

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(true)
			end
		end
	end,
	Play121481104 = function(arg_425_0, arg_425_1)
		arg_425_1.time_ = 0
		arg_425_1.frameCnt_ = 0
		arg_425_1.state_ = "playing"
		arg_425_1.curTalkId_ = 121481104
		arg_425_1.duration_ = 5

		SetActive(arg_425_1.tipsGo_, false)

		function arg_425_1.onSingleLineFinish_()
			arg_425_1.onSingleLineUpdate_ = nil
			arg_425_1.onSingleLineFinish_ = nil
			arg_425_1.state_ = "waiting"
		end

		function arg_425_1.playNext_(arg_427_0)
			if arg_427_0 == 1 then
				arg_425_0:Play121481105(arg_425_1)
			end
		end

		function arg_425_1.onSingleLineUpdate_(arg_428_0)
			local var_428_0 = 0
			local var_428_1 = 0.633333333333333

			if var_428_0 < arg_425_1.time_ and arg_425_1.time_ <= var_428_0 + arg_428_0 then
				local var_428_2 = "play"
				local var_428_3 = "effect"

				arg_425_1:AudioAction(var_428_2, var_428_3, "se_story_16", "se_story_16_thunder", "")
			end

			local var_428_4 = 0
			local var_428_5 = 1.1

			if var_428_4 < arg_425_1.time_ and arg_425_1.time_ <= var_428_4 + arg_428_0 then
				arg_425_1.talkMaxDuration = 0

				arg_425_1.dialog_:SetActive(true)

				local var_428_6 = LeanTween.value(arg_425_1.dialog_, 0, 1, 0.3)

				var_428_6:setOnUpdate(LuaHelper.FloatAction(function(arg_429_0)
					arg_425_1.dialogCg_.alpha = arg_429_0
				end))
				var_428_6:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_425_1.dialog_)
					var_428_6:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_425_1.duration_ = arg_425_1.duration_ + 0.3

				SetActive(arg_425_1.leftNameGo_, false)

				arg_425_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_425_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_425_1:RecordName(arg_425_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_425_1.iconTrs_.gameObject, false)
				arg_425_1.callingController_:SetSelectedState("normal")

				local var_428_7 = arg_425_1:GetWordFromCfg(121481104)
				local var_428_8 = arg_425_1:FormatText(var_428_7.content)

				arg_425_1.text_.text = var_428_8

				LuaForUtil.ClearLinePrefixSymbol(arg_425_1.text_)

				local var_428_9 = 44
				local var_428_10 = utf8.len(var_428_8)
				local var_428_11 = var_428_9 <= 0 and var_428_5 or var_428_5 * (var_428_10 / var_428_9)

				if var_428_11 > 0 and var_428_5 < var_428_11 then
					arg_425_1.talkMaxDuration = var_428_11
					var_428_4 = var_428_4 + 0.3

					if var_428_11 + var_428_4 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_11 + var_428_4
					end
				end

				arg_425_1.text_.text = var_428_8
				arg_425_1.typewritter.percent = 0

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(false)
				arg_425_1:RecordContent(arg_425_1.text_.text)
			end

			local var_428_12 = var_428_4 + 0.3
			local var_428_13 = math.max(var_428_5, arg_425_1.talkMaxDuration)

			if var_428_12 <= arg_425_1.time_ and arg_425_1.time_ < var_428_12 + var_428_13 then
				arg_425_1.typewritter.percent = (arg_425_1.time_ - var_428_12) / var_428_13

				arg_425_1.typewritter:SetDirty()
			end

			if arg_425_1.time_ >= var_428_12 + var_428_13 and arg_425_1.time_ < var_428_12 + var_428_13 + arg_428_0 then
				arg_425_1.typewritter.percent = 1

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(true)
			end
		end
	end,
	Play121481105 = function(arg_431_0, arg_431_1)
		arg_431_1.time_ = 0
		arg_431_1.frameCnt_ = 0
		arg_431_1.state_ = "playing"
		arg_431_1.curTalkId_ = 121481105
		arg_431_1.duration_ = 7

		SetActive(arg_431_1.tipsGo_, false)

		function arg_431_1.onSingleLineFinish_()
			arg_431_1.onSingleLineUpdate_ = nil
			arg_431_1.onSingleLineFinish_ = nil
			arg_431_1.state_ = "waiting"
		end

		function arg_431_1.playNext_(arg_433_0)
			if arg_433_0 == 1 then
				arg_431_0:Play121481106(arg_431_1)
			end
		end

		function arg_431_1.onSingleLineUpdate_(arg_434_0)
			local var_434_0 = manager.ui.mainCamera.transform
			local var_434_1 = 0

			if var_434_1 < arg_431_1.time_ and arg_431_1.time_ <= var_434_1 + arg_434_0 then
				arg_431_1.var_.shakeOldPos = var_434_0.localPosition
			end

			local var_434_2 = 2

			if var_434_1 <= arg_431_1.time_ and arg_431_1.time_ < var_434_1 + var_434_2 then
				local var_434_3 = (arg_431_1.time_ - var_434_1) / 0.066
				local var_434_4, var_434_5 = math.modf(var_434_3)

				var_434_0.localPosition = Vector3.New(var_434_5 * 0.13, var_434_5 * 0.13, var_434_5 * 0.13) + arg_431_1.var_.shakeOldPos
			end

			if arg_431_1.time_ >= var_434_1 + var_434_2 and arg_431_1.time_ < var_434_1 + var_434_2 + arg_434_0 then
				var_434_0.localPosition = arg_431_1.var_.shakeOldPos
			end

			local var_434_6 = 0

			if var_434_6 < arg_431_1.time_ and arg_431_1.time_ <= var_434_6 + arg_434_0 then
				arg_431_1.mask_.enabled = true
				arg_431_1.mask_.raycastTarget = false

				arg_431_1:SetGaussion(false)
			end

			local var_434_7 = 2

			if var_434_6 <= arg_431_1.time_ and arg_431_1.time_ < var_434_6 + var_434_7 then
				local var_434_8 = (arg_431_1.time_ - var_434_6) / var_434_7
				local var_434_9 = Color.New(1, 1, 1)

				var_434_9.a = Mathf.Lerp(1, 0, var_434_8)
				arg_431_1.mask_.color = var_434_9
			end

			if arg_431_1.time_ >= var_434_6 + var_434_7 and arg_431_1.time_ < var_434_6 + var_434_7 + arg_434_0 then
				local var_434_10 = Color.New(1, 1, 1)
				local var_434_11 = 0

				arg_431_1.mask_.enabled = false
				var_434_10.a = var_434_11
				arg_431_1.mask_.color = var_434_10
			end

			local var_434_12 = "J02h_blur"

			if arg_431_1.bgs_[var_434_12] == nil then
				local var_434_13 = Object.Instantiate(arg_431_1.blurPaintGo_)
				local var_434_14 = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_434_12)

				var_434_13:GetComponent("SpriteRenderer").sprite = var_434_14
				var_434_13.name = var_434_12
				var_434_13.transform.parent = arg_431_1.stage_.transform
				var_434_13.transform.localPosition = Vector3.New(0, 100, 0)
				arg_431_1.bgs_[var_434_12] = var_434_13
			end

			local var_434_15 = 0
			local var_434_16 = arg_431_1.bgs_[var_434_12]

			if var_434_15 < arg_431_1.time_ and arg_431_1.time_ <= var_434_15 + arg_434_0 then
				local var_434_17 = manager.ui.mainCamera.transform.localPosition
				local var_434_18 = Vector3.New(0, 0, 10) + Vector3.New(var_434_17.x, var_434_17.y, 0)

				var_434_16.transform.localPosition = var_434_18
				var_434_16.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_434_19 = var_434_16:GetComponent("SpriteRenderer")

				if var_434_19 and var_434_19.sprite then
					local var_434_20 = (var_434_16.transform.localPosition - var_434_17).z
					local var_434_21 = manager.ui.mainCameraCom_
					local var_434_22 = 2 * var_434_20 * Mathf.Tan(var_434_21.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_434_23 = var_434_22 * var_434_21.aspect
					local var_434_24 = var_434_19.sprite.bounds.size.x
					local var_434_25 = var_434_19.sprite.bounds.size.y
					local var_434_26 = var_434_23 / var_434_24
					local var_434_27 = var_434_22 / var_434_25
					local var_434_28 = var_434_27 < var_434_26 and var_434_26 or var_434_27

					var_434_16.transform.localScale = Vector3.New(var_434_28, var_434_28, 0)
				end
			end

			local var_434_29 = 3

			if var_434_15 <= arg_431_1.time_ and arg_431_1.time_ < var_434_15 + var_434_29 then
				local var_434_30 = (arg_431_1.time_ - var_434_15) / var_434_29
				local var_434_31 = Color.New(1, 1, 1)

				var_434_31.a = Mathf.Lerp(0, 1, var_434_30)

				var_434_16:GetComponent("SpriteRenderer").material:SetColor("_Color", var_434_31)
			end

			local var_434_32 = 0.333333333333333
			local var_434_33 = 0.633333333333333

			if var_434_32 < arg_431_1.time_ and arg_431_1.time_ <= var_434_32 + arg_434_0 then
				local var_434_34 = "play"
				local var_434_35 = "effect"

				arg_431_1:AudioAction(var_434_34, var_434_35, "se_story_16", "se_story_16_hit", "")
			end

			if arg_431_1.frameCnt_ <= 1 then
				arg_431_1.dialog_:SetActive(false)
			end

			local var_434_36 = 2
			local var_434_37 = 1.8

			if var_434_36 < arg_431_1.time_ and arg_431_1.time_ <= var_434_36 + arg_434_0 then
				arg_431_1.talkMaxDuration = 0

				arg_431_1.dialog_:SetActive(true)

				local var_434_38 = LeanTween.value(arg_431_1.dialog_, 0, 1, 0.3)

				var_434_38:setOnUpdate(LuaHelper.FloatAction(function(arg_435_0)
					arg_431_1.dialogCg_.alpha = arg_435_0
				end))
				var_434_38:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_431_1.dialog_)
					var_434_38:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_431_1.duration_ = arg_431_1.duration_ + 0.3

				SetActive(arg_431_1.leftNameGo_, false)

				arg_431_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_431_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_431_1:RecordName(arg_431_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_431_1.iconTrs_.gameObject, false)
				arg_431_1.callingController_:SetSelectedState("normal")

				local var_434_39 = arg_431_1:GetWordFromCfg(121481105)
				local var_434_40 = arg_431_1:FormatText(var_434_39.content)

				arg_431_1.text_.text = var_434_40

				LuaForUtil.ClearLinePrefixSymbol(arg_431_1.text_)

				local var_434_41 = 72
				local var_434_42 = utf8.len(var_434_40)
				local var_434_43 = var_434_41 <= 0 and var_434_37 or var_434_37 * (var_434_42 / var_434_41)

				if var_434_43 > 0 and var_434_37 < var_434_43 then
					arg_431_1.talkMaxDuration = var_434_43
					var_434_36 = var_434_36 + 0.3

					if var_434_43 + var_434_36 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_43 + var_434_36
					end
				end

				arg_431_1.text_.text = var_434_40
				arg_431_1.typewritter.percent = 0

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(false)
				arg_431_1:RecordContent(arg_431_1.text_.text)
			end

			local var_434_44 = var_434_36 + 0.3
			local var_434_45 = math.max(var_434_37, arg_431_1.talkMaxDuration)

			if var_434_44 <= arg_431_1.time_ and arg_431_1.time_ < var_434_44 + var_434_45 then
				arg_431_1.typewritter.percent = (arg_431_1.time_ - var_434_44) / var_434_45

				arg_431_1.typewritter:SetDirty()
			end

			if arg_431_1.time_ >= var_434_44 + var_434_45 and arg_431_1.time_ < var_434_44 + var_434_45 + arg_434_0 then
				arg_431_1.typewritter.percent = 1

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(true)
			end
		end
	end,
	Play121481106 = function(arg_437_0, arg_437_1)
		arg_437_1.time_ = 0
		arg_437_1.frameCnt_ = 0
		arg_437_1.state_ = "playing"
		arg_437_1.curTalkId_ = 121481106
		arg_437_1.duration_ = 6.8

		local var_437_0 = {
			ja = 3.7,
			ko = 6.8,
			zh = 6.8
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
				arg_437_0:Play121481107(arg_437_1)
			end
		end

		function arg_437_1.onSingleLineUpdate_(arg_440_0)
			local var_440_0 = 0
			local var_440_1 = 0.2

			if var_440_0 < arg_437_1.time_ and arg_437_1.time_ <= var_440_0 + arg_440_0 then
				arg_437_1.talkMaxDuration = 0
				arg_437_1.dialogCg_.alpha = 1

				arg_437_1.dialog_:SetActive(true)
				SetActive(arg_437_1.leftNameGo_, true)

				local var_440_2 = arg_437_1:FormatText(StoryNameCfg[412].name)

				arg_437_1.leftNameTxt_.text = var_440_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_437_1.leftNameTxt_.transform)

				arg_437_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_437_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_437_1:RecordName(arg_437_1.leftNameTxt_.text)
				SetActive(arg_437_1.iconTrs_.gameObject, true)
				arg_437_1.iconController_:SetSelectedState("hero")

				arg_437_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10045")

				arg_437_1.callingController_:SetSelectedState("normal")

				local var_440_3 = arg_437_1:GetWordFromCfg(121481106)
				local var_440_4 = arg_437_1:FormatText(var_440_3.content)

				arg_437_1.text_.text = var_440_4

				LuaForUtil.ClearLinePrefixSymbol(arg_437_1.text_)

				local var_440_5 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481106", "story_v_out_121481.awb") ~= 0 then
					local var_440_8 = manager.audio:GetVoiceLength("story_v_out_121481", "121481106", "story_v_out_121481.awb") / 1000

					if var_440_8 + var_440_0 > arg_437_1.duration_ then
						arg_437_1.duration_ = var_440_8 + var_440_0
					end

					if var_440_3.prefab_name ~= "" and arg_437_1.actors_[var_440_3.prefab_name] ~= nil then
						local var_440_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_437_1.actors_[var_440_3.prefab_name].transform, "story_v_out_121481", "121481106", "story_v_out_121481.awb")

						arg_437_1:RecordAudio("121481106", var_440_9)
						arg_437_1:RecordAudio("121481106", var_440_9)
					else
						arg_437_1:AudioAction("play", "voice", "story_v_out_121481", "121481106", "story_v_out_121481.awb")
					end

					arg_437_1:RecordHistoryTalkVoice("story_v_out_121481", "121481106", "story_v_out_121481.awb")
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
	Play121481107 = function(arg_441_0, arg_441_1)
		arg_441_1.time_ = 0
		arg_441_1.frameCnt_ = 0
		arg_441_1.state_ = "playing"
		arg_441_1.curTalkId_ = 121481107
		arg_441_1.duration_ = 5

		SetActive(arg_441_1.tipsGo_, false)

		function arg_441_1.onSingleLineFinish_()
			arg_441_1.onSingleLineUpdate_ = nil
			arg_441_1.onSingleLineFinish_ = nil
			arg_441_1.state_ = "waiting"
		end

		function arg_441_1.playNext_(arg_443_0)
			if arg_443_0 == 1 then
				arg_441_0:Play121481108(arg_441_1)
			end
		end

		function arg_441_1.onSingleLineUpdate_(arg_444_0)
			local var_444_0 = 0
			local var_444_1 = 1.3

			if var_444_0 < arg_441_1.time_ and arg_441_1.time_ <= var_444_0 + arg_444_0 then
				arg_441_1.talkMaxDuration = 0
				arg_441_1.dialogCg_.alpha = 1

				arg_441_1.dialog_:SetActive(true)
				SetActive(arg_441_1.leftNameGo_, false)

				arg_441_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_441_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_441_1:RecordName(arg_441_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_441_1.iconTrs_.gameObject, false)
				arg_441_1.callingController_:SetSelectedState("normal")

				local var_444_2 = arg_441_1:GetWordFromCfg(121481107)
				local var_444_3 = arg_441_1:FormatText(var_444_2.content)

				arg_441_1.text_.text = var_444_3

				LuaForUtil.ClearLinePrefixSymbol(arg_441_1.text_)

				local var_444_4 = 52
				local var_444_5 = utf8.len(var_444_3)
				local var_444_6 = var_444_4 <= 0 and var_444_1 or var_444_1 * (var_444_5 / var_444_4)

				if var_444_6 > 0 and var_444_1 < var_444_6 then
					arg_441_1.talkMaxDuration = var_444_6

					if var_444_6 + var_444_0 > arg_441_1.duration_ then
						arg_441_1.duration_ = var_444_6 + var_444_0
					end
				end

				arg_441_1.text_.text = var_444_3
				arg_441_1.typewritter.percent = 0

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(false)
				arg_441_1:RecordContent(arg_441_1.text_.text)
			end

			local var_444_7 = math.max(var_444_1, arg_441_1.talkMaxDuration)

			if var_444_0 <= arg_441_1.time_ and arg_441_1.time_ < var_444_0 + var_444_7 then
				arg_441_1.typewritter.percent = (arg_441_1.time_ - var_444_0) / var_444_7

				arg_441_1.typewritter:SetDirty()
			end

			if arg_441_1.time_ >= var_444_0 + var_444_7 and arg_441_1.time_ < var_444_0 + var_444_7 + arg_444_0 then
				arg_441_1.typewritter.percent = 1

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(true)
			end
		end
	end,
	Play121481108 = function(arg_445_0, arg_445_1)
		arg_445_1.time_ = 0
		arg_445_1.frameCnt_ = 0
		arg_445_1.state_ = "playing"
		arg_445_1.curTalkId_ = 121481108
		arg_445_1.duration_ = 7.7

		local var_445_0 = {
			ja = 4.333,
			ko = 7.7,
			zh = 7.7
		}
		local var_445_1 = manager.audio:GetLocalizationFlag()

		if var_445_0[var_445_1] ~= nil then
			arg_445_1.duration_ = var_445_0[var_445_1]
		end

		SetActive(arg_445_1.tipsGo_, false)

		function arg_445_1.onSingleLineFinish_()
			arg_445_1.onSingleLineUpdate_ = nil
			arg_445_1.onSingleLineFinish_ = nil
			arg_445_1.state_ = "waiting"
		end

		function arg_445_1.playNext_(arg_447_0)
			if arg_447_0 == 1 then
				arg_445_0:Play121481109(arg_445_1)
			end
		end

		function arg_445_1.onSingleLineUpdate_(arg_448_0)
			local var_448_0 = 0
			local var_448_1 = 0.775

			if var_448_0 < arg_445_1.time_ and arg_445_1.time_ <= var_448_0 + arg_448_0 then
				arg_445_1.talkMaxDuration = 0
				arg_445_1.dialogCg_.alpha = 1

				arg_445_1.dialog_:SetActive(true)
				SetActive(arg_445_1.leftNameGo_, true)

				local var_448_2 = arg_445_1:FormatText(StoryNameCfg[378].name)

				arg_445_1.leftNameTxt_.text = var_448_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_445_1.leftNameTxt_.transform)

				arg_445_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_445_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_445_1:RecordName(arg_445_1.leftNameTxt_.text)
				SetActive(arg_445_1.iconTrs_.gameObject, true)
				arg_445_1.iconController_:SetSelectedState("hero")

				arg_445_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1069")

				arg_445_1.callingController_:SetSelectedState("normal")

				local var_448_3 = arg_445_1:GetWordFromCfg(121481108)
				local var_448_4 = arg_445_1:FormatText(var_448_3.content)

				arg_445_1.text_.text = var_448_4

				LuaForUtil.ClearLinePrefixSymbol(arg_445_1.text_)

				local var_448_5 = 31
				local var_448_6 = utf8.len(var_448_4)
				local var_448_7 = var_448_5 <= 0 and var_448_1 or var_448_1 * (var_448_6 / var_448_5)

				if var_448_7 > 0 and var_448_1 < var_448_7 then
					arg_445_1.talkMaxDuration = var_448_7

					if var_448_7 + var_448_0 > arg_445_1.duration_ then
						arg_445_1.duration_ = var_448_7 + var_448_0
					end
				end

				arg_445_1.text_.text = var_448_4
				arg_445_1.typewritter.percent = 0

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481108", "story_v_out_121481.awb") ~= 0 then
					local var_448_8 = manager.audio:GetVoiceLength("story_v_out_121481", "121481108", "story_v_out_121481.awb") / 1000

					if var_448_8 + var_448_0 > arg_445_1.duration_ then
						arg_445_1.duration_ = var_448_8 + var_448_0
					end

					if var_448_3.prefab_name ~= "" and arg_445_1.actors_[var_448_3.prefab_name] ~= nil then
						local var_448_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_445_1.actors_[var_448_3.prefab_name].transform, "story_v_out_121481", "121481108", "story_v_out_121481.awb")

						arg_445_1:RecordAudio("121481108", var_448_9)
						arg_445_1:RecordAudio("121481108", var_448_9)
					else
						arg_445_1:AudioAction("play", "voice", "story_v_out_121481", "121481108", "story_v_out_121481.awb")
					end

					arg_445_1:RecordHistoryTalkVoice("story_v_out_121481", "121481108", "story_v_out_121481.awb")
				end

				arg_445_1:RecordContent(arg_445_1.text_.text)
			end

			local var_448_10 = math.max(var_448_1, arg_445_1.talkMaxDuration)

			if var_448_0 <= arg_445_1.time_ and arg_445_1.time_ < var_448_0 + var_448_10 then
				arg_445_1.typewritter.percent = (arg_445_1.time_ - var_448_0) / var_448_10

				arg_445_1.typewritter:SetDirty()
			end

			if arg_445_1.time_ >= var_448_0 + var_448_10 and arg_445_1.time_ < var_448_0 + var_448_10 + arg_448_0 then
				arg_445_1.typewritter.percent = 1

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(true)
			end
		end
	end,
	Play121481109 = function(arg_449_0, arg_449_1)
		arg_449_1.time_ = 0
		arg_449_1.frameCnt_ = 0
		arg_449_1.state_ = "playing"
		arg_449_1.curTalkId_ = 121481109
		arg_449_1.duration_ = 3.166

		local var_449_0 = {
			ja = 2.766666666666,
			ko = 3.166,
			zh = 3.166
		}
		local var_449_1 = manager.audio:GetLocalizationFlag()

		if var_449_0[var_449_1] ~= nil then
			arg_449_1.duration_ = var_449_0[var_449_1]
		end

		SetActive(arg_449_1.tipsGo_, false)

		function arg_449_1.onSingleLineFinish_()
			arg_449_1.onSingleLineUpdate_ = nil
			arg_449_1.onSingleLineFinish_ = nil
			arg_449_1.state_ = "waiting"
		end

		function arg_449_1.playNext_(arg_451_0)
			if arg_451_0 == 1 then
				arg_449_0:Play121481110(arg_449_1)
			end
		end

		function arg_449_1.onSingleLineUpdate_(arg_452_0)
			local var_452_0 = arg_449_1.actors_["10045ui_story"].transform
			local var_452_1 = 0

			if var_452_1 < arg_449_1.time_ and arg_449_1.time_ <= var_452_1 + arg_452_0 then
				arg_449_1.var_.moveOldPos10045ui_story = var_452_0.localPosition
			end

			local var_452_2 = 0.001

			if var_452_1 <= arg_449_1.time_ and arg_449_1.time_ < var_452_1 + var_452_2 then
				local var_452_3 = (arg_449_1.time_ - var_452_1) / var_452_2
				local var_452_4 = Vector3.New(-0.7, -1.18, -6.05)

				var_452_0.localPosition = Vector3.Lerp(arg_449_1.var_.moveOldPos10045ui_story, var_452_4, var_452_3)

				local var_452_5 = manager.ui.mainCamera.transform.position - var_452_0.position

				var_452_0.forward = Vector3.New(var_452_5.x, var_452_5.y, var_452_5.z)

				local var_452_6 = var_452_0.localEulerAngles

				var_452_6.z = 0
				var_452_6.x = 0
				var_452_0.localEulerAngles = var_452_6
			end

			if arg_449_1.time_ >= var_452_1 + var_452_2 and arg_449_1.time_ < var_452_1 + var_452_2 + arg_452_0 then
				var_452_0.localPosition = Vector3.New(-0.7, -1.18, -6.05)

				local var_452_7 = manager.ui.mainCamera.transform.position - var_452_0.position

				var_452_0.forward = Vector3.New(var_452_7.x, var_452_7.y, var_452_7.z)

				local var_452_8 = var_452_0.localEulerAngles

				var_452_8.z = 0
				var_452_8.x = 0
				var_452_0.localEulerAngles = var_452_8
			end

			local var_452_9 = arg_449_1.actors_["10045ui_story"]
			local var_452_10 = 0

			if var_452_10 < arg_449_1.time_ and arg_449_1.time_ <= var_452_10 + arg_452_0 and arg_449_1.var_.characterEffect10045ui_story == nil then
				arg_449_1.var_.characterEffect10045ui_story = var_452_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_452_11 = 0.200000002980232

			if var_452_10 <= arg_449_1.time_ and arg_449_1.time_ < var_452_10 + var_452_11 then
				local var_452_12 = (arg_449_1.time_ - var_452_10) / var_452_11

				if arg_449_1.var_.characterEffect10045ui_story then
					arg_449_1.var_.characterEffect10045ui_story.fillFlat = false
				end
			end

			if arg_449_1.time_ >= var_452_10 + var_452_11 and arg_449_1.time_ < var_452_10 + var_452_11 + arg_452_0 and arg_449_1.var_.characterEffect10045ui_story then
				arg_449_1.var_.characterEffect10045ui_story.fillFlat = false
			end

			local var_452_13 = 0

			if var_452_13 < arg_449_1.time_ and arg_449_1.time_ <= var_452_13 + arg_452_0 then
				arg_449_1:PlayTimeline("10045ui_story", "StoryTimeline/CharAction/story10045/story10045action/10045action1_1")
			end

			local var_452_14 = 0

			if var_452_14 < arg_449_1.time_ and arg_449_1.time_ <= var_452_14 + arg_452_0 then
				arg_449_1:PlayTimeline("10045ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_452_15 = arg_449_1.actors_["1069ui_story"].transform
			local var_452_16 = 0

			if var_452_16 < arg_449_1.time_ and arg_449_1.time_ <= var_452_16 + arg_452_0 then
				arg_449_1.var_.moveOldPos1069ui_story = var_452_15.localPosition
			end

			local var_452_17 = 0.001

			if var_452_16 <= arg_449_1.time_ and arg_449_1.time_ < var_452_16 + var_452_17 then
				local var_452_18 = (arg_449_1.time_ - var_452_16) / var_452_17
				local var_452_19 = Vector3.New(0.7, -1, -6)

				var_452_15.localPosition = Vector3.Lerp(arg_449_1.var_.moveOldPos1069ui_story, var_452_19, var_452_18)

				local var_452_20 = manager.ui.mainCamera.transform.position - var_452_15.position

				var_452_15.forward = Vector3.New(var_452_20.x, var_452_20.y, var_452_20.z)

				local var_452_21 = var_452_15.localEulerAngles

				var_452_21.z = 0
				var_452_21.x = 0
				var_452_15.localEulerAngles = var_452_21
			end

			if arg_449_1.time_ >= var_452_16 + var_452_17 and arg_449_1.time_ < var_452_16 + var_452_17 + arg_452_0 then
				var_452_15.localPosition = Vector3.New(0.7, -1, -6)

				local var_452_22 = manager.ui.mainCamera.transform.position - var_452_15.position

				var_452_15.forward = Vector3.New(var_452_22.x, var_452_22.y, var_452_22.z)

				local var_452_23 = var_452_15.localEulerAngles

				var_452_23.z = 0
				var_452_23.x = 0
				var_452_15.localEulerAngles = var_452_23
			end

			local var_452_24 = arg_449_1.actors_["1069ui_story"]
			local var_452_25 = 0

			if var_452_25 < arg_449_1.time_ and arg_449_1.time_ <= var_452_25 + arg_452_0 and arg_449_1.var_.characterEffect1069ui_story == nil then
				arg_449_1.var_.characterEffect1069ui_story = var_452_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_452_26 = 0.200000002980232

			if var_452_25 <= arg_449_1.time_ and arg_449_1.time_ < var_452_25 + var_452_26 then
				local var_452_27 = (arg_449_1.time_ - var_452_25) / var_452_26

				if arg_449_1.var_.characterEffect1069ui_story then
					local var_452_28 = Mathf.Lerp(0, 0.5, var_452_27)

					arg_449_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_449_1.var_.characterEffect1069ui_story.fillRatio = var_452_28
				end
			end

			if arg_449_1.time_ >= var_452_25 + var_452_26 and arg_449_1.time_ < var_452_25 + var_452_26 + arg_452_0 and arg_449_1.var_.characterEffect1069ui_story then
				local var_452_29 = 0.5

				arg_449_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_449_1.var_.characterEffect1069ui_story.fillRatio = var_452_29
			end

			local var_452_30 = "J02h_blur"

			if arg_449_1.bgs_[var_452_30] == nil then
				local var_452_31 = Object.Instantiate(arg_449_1.blurPaintGo_)
				local var_452_32 = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_452_30)

				var_452_31:GetComponent("SpriteRenderer").sprite = var_452_32
				var_452_31.name = var_452_30
				var_452_31.transform.parent = arg_449_1.stage_.transform
				var_452_31.transform.localPosition = Vector3.New(0, 100, 0)
				arg_449_1.bgs_[var_452_30] = var_452_31
			end

			local var_452_33 = 0
			local var_452_34 = arg_449_1.bgs_[var_452_30]

			if var_452_33 < arg_449_1.time_ and arg_449_1.time_ <= var_452_33 + arg_452_0 then
				local var_452_35 = manager.ui.mainCamera.transform.localPosition
				local var_452_36 = Vector3.New(0, 0, 10) + Vector3.New(var_452_35.x, var_452_35.y, 0)

				var_452_34.transform.localPosition = var_452_36
				var_452_34.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_452_37 = var_452_34:GetComponent("SpriteRenderer")

				if var_452_37 and var_452_37.sprite then
					local var_452_38 = (var_452_34.transform.localPosition - var_452_35).z
					local var_452_39 = manager.ui.mainCameraCom_
					local var_452_40 = 2 * var_452_38 * Mathf.Tan(var_452_39.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_452_41 = var_452_40 * var_452_39.aspect
					local var_452_42 = var_452_37.sprite.bounds.size.x
					local var_452_43 = var_452_37.sprite.bounds.size.y
					local var_452_44 = var_452_41 / var_452_42
					local var_452_45 = var_452_40 / var_452_43
					local var_452_46 = var_452_45 < var_452_44 and var_452_44 or var_452_45

					var_452_34.transform.localScale = Vector3.New(var_452_46, var_452_46, 0)
				end
			end

			local var_452_47 = 0.5

			if var_452_33 <= arg_449_1.time_ and arg_449_1.time_ < var_452_33 + var_452_47 then
				local var_452_48 = (arg_449_1.time_ - var_452_33) / var_452_47
				local var_452_49 = Color.New(1, 1, 1)

				var_452_49.a = Mathf.Lerp(1, 0, var_452_48)

				var_452_34:GetComponent("SpriteRenderer").material:SetColor("_Color", var_452_49)
			end

			local var_452_50 = 0

			if var_452_50 < arg_449_1.time_ and arg_449_1.time_ <= var_452_50 + arg_452_0 then
				arg_449_1.allBtn_.enabled = false
			end

			local var_452_51 = 0.5

			if arg_449_1.time_ >= var_452_50 + var_452_51 and arg_449_1.time_ < var_452_50 + var_452_51 + arg_452_0 then
				arg_449_1.allBtn_.enabled = true
			end

			local var_452_52 = 0
			local var_452_53 = 0.225

			if var_452_52 < arg_449_1.time_ and arg_449_1.time_ <= var_452_52 + arg_452_0 then
				arg_449_1.talkMaxDuration = 0
				arg_449_1.dialogCg_.alpha = 1

				arg_449_1.dialog_:SetActive(true)
				SetActive(arg_449_1.leftNameGo_, true)

				local var_452_54 = arg_449_1:FormatText(StoryNameCfg[412].name)

				arg_449_1.leftNameTxt_.text = var_452_54

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_449_1.leftNameTxt_.transform)

				arg_449_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_449_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_449_1:RecordName(arg_449_1.leftNameTxt_.text)
				SetActive(arg_449_1.iconTrs_.gameObject, false)
				arg_449_1.callingController_:SetSelectedState("normal")

				local var_452_55 = arg_449_1:GetWordFromCfg(121481109)
				local var_452_56 = arg_449_1:FormatText(var_452_55.content)

				arg_449_1.text_.text = var_452_56

				LuaForUtil.ClearLinePrefixSymbol(arg_449_1.text_)

				local var_452_57 = 9
				local var_452_58 = utf8.len(var_452_56)
				local var_452_59 = var_452_57 <= 0 and var_452_53 or var_452_53 * (var_452_58 / var_452_57)

				if var_452_59 > 0 and var_452_53 < var_452_59 then
					arg_449_1.talkMaxDuration = var_452_59

					if var_452_59 + var_452_52 > arg_449_1.duration_ then
						arg_449_1.duration_ = var_452_59 + var_452_52
					end
				end

				arg_449_1.text_.text = var_452_56
				arg_449_1.typewritter.percent = 0

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481109", "story_v_out_121481.awb") ~= 0 then
					local var_452_60 = manager.audio:GetVoiceLength("story_v_out_121481", "121481109", "story_v_out_121481.awb") / 1000

					if var_452_60 + var_452_52 > arg_449_1.duration_ then
						arg_449_1.duration_ = var_452_60 + var_452_52
					end

					if var_452_55.prefab_name ~= "" and arg_449_1.actors_[var_452_55.prefab_name] ~= nil then
						local var_452_61 = LuaForUtil.PlayVoiceWithCriLipsync(arg_449_1.actors_[var_452_55.prefab_name].transform, "story_v_out_121481", "121481109", "story_v_out_121481.awb")

						arg_449_1:RecordAudio("121481109", var_452_61)
						arg_449_1:RecordAudio("121481109", var_452_61)
					else
						arg_449_1:AudioAction("play", "voice", "story_v_out_121481", "121481109", "story_v_out_121481.awb")
					end

					arg_449_1:RecordHistoryTalkVoice("story_v_out_121481", "121481109", "story_v_out_121481.awb")
				end

				arg_449_1:RecordContent(arg_449_1.text_.text)
			end

			local var_452_62 = math.max(var_452_53, arg_449_1.talkMaxDuration)

			if var_452_52 <= arg_449_1.time_ and arg_449_1.time_ < var_452_52 + var_452_62 then
				arg_449_1.typewritter.percent = (arg_449_1.time_ - var_452_52) / var_452_62

				arg_449_1.typewritter:SetDirty()
			end

			if arg_449_1.time_ >= var_452_52 + var_452_62 and arg_449_1.time_ < var_452_52 + var_452_62 + arg_452_0 then
				arg_449_1.typewritter.percent = 1

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(true)
			end
		end
	end,
	Play121481110 = function(arg_453_0, arg_453_1)
		arg_453_1.time_ = 0
		arg_453_1.frameCnt_ = 0
		arg_453_1.state_ = "playing"
		arg_453_1.curTalkId_ = 121481110
		arg_453_1.duration_ = 4.9

		local var_453_0 = {
			ja = 4.133,
			ko = 4.9,
			zh = 4.9
		}
		local var_453_1 = manager.audio:GetLocalizationFlag()

		if var_453_0[var_453_1] ~= nil then
			arg_453_1.duration_ = var_453_0[var_453_1]
		end

		SetActive(arg_453_1.tipsGo_, false)

		function arg_453_1.onSingleLineFinish_()
			arg_453_1.onSingleLineUpdate_ = nil
			arg_453_1.onSingleLineFinish_ = nil
			arg_453_1.state_ = "waiting"
		end

		function arg_453_1.playNext_(arg_455_0)
			if arg_455_0 == 1 then
				arg_453_0:Play121481111(arg_453_1)
			end
		end

		function arg_453_1.onSingleLineUpdate_(arg_456_0)
			local var_456_0 = arg_453_1.actors_["10045ui_story"]
			local var_456_1 = 0

			if var_456_1 < arg_453_1.time_ and arg_453_1.time_ <= var_456_1 + arg_456_0 and arg_453_1.var_.characterEffect10045ui_story == nil then
				arg_453_1.var_.characterEffect10045ui_story = var_456_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_456_2 = 0.200000002980232

			if var_456_1 <= arg_453_1.time_ and arg_453_1.time_ < var_456_1 + var_456_2 then
				local var_456_3 = (arg_453_1.time_ - var_456_1) / var_456_2

				if arg_453_1.var_.characterEffect10045ui_story then
					local var_456_4 = Mathf.Lerp(0, 0.5, var_456_3)

					arg_453_1.var_.characterEffect10045ui_story.fillFlat = true
					arg_453_1.var_.characterEffect10045ui_story.fillRatio = var_456_4
				end
			end

			if arg_453_1.time_ >= var_456_1 + var_456_2 and arg_453_1.time_ < var_456_1 + var_456_2 + arg_456_0 and arg_453_1.var_.characterEffect10045ui_story then
				local var_456_5 = 0.5

				arg_453_1.var_.characterEffect10045ui_story.fillFlat = true
				arg_453_1.var_.characterEffect10045ui_story.fillRatio = var_456_5
			end

			local var_456_6 = arg_453_1.actors_["1069ui_story"]
			local var_456_7 = 0

			if var_456_7 < arg_453_1.time_ and arg_453_1.time_ <= var_456_7 + arg_456_0 and arg_453_1.var_.characterEffect1069ui_story == nil then
				arg_453_1.var_.characterEffect1069ui_story = var_456_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_456_8 = 0.200000002980232

			if var_456_7 <= arg_453_1.time_ and arg_453_1.time_ < var_456_7 + var_456_8 then
				local var_456_9 = (arg_453_1.time_ - var_456_7) / var_456_8

				if arg_453_1.var_.characterEffect1069ui_story then
					arg_453_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_453_1.time_ >= var_456_7 + var_456_8 and arg_453_1.time_ < var_456_7 + var_456_8 + arg_456_0 and arg_453_1.var_.characterEffect1069ui_story then
				arg_453_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_456_10 = 0
			local var_456_11 = 0.5

			if var_456_10 < arg_453_1.time_ and arg_453_1.time_ <= var_456_10 + arg_456_0 then
				arg_453_1.talkMaxDuration = 0
				arg_453_1.dialogCg_.alpha = 1

				arg_453_1.dialog_:SetActive(true)
				SetActive(arg_453_1.leftNameGo_, true)

				local var_456_12 = arg_453_1:FormatText(StoryNameCfg[378].name)

				arg_453_1.leftNameTxt_.text = var_456_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_453_1.leftNameTxt_.transform)

				arg_453_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_453_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_453_1:RecordName(arg_453_1.leftNameTxt_.text)
				SetActive(arg_453_1.iconTrs_.gameObject, false)
				arg_453_1.callingController_:SetSelectedState("normal")

				local var_456_13 = arg_453_1:GetWordFromCfg(121481110)
				local var_456_14 = arg_453_1:FormatText(var_456_13.content)

				arg_453_1.text_.text = var_456_14

				LuaForUtil.ClearLinePrefixSymbol(arg_453_1.text_)

				local var_456_15 = 20
				local var_456_16 = utf8.len(var_456_14)
				local var_456_17 = var_456_15 <= 0 and var_456_11 or var_456_11 * (var_456_16 / var_456_15)

				if var_456_17 > 0 and var_456_11 < var_456_17 then
					arg_453_1.talkMaxDuration = var_456_17

					if var_456_17 + var_456_10 > arg_453_1.duration_ then
						arg_453_1.duration_ = var_456_17 + var_456_10
					end
				end

				arg_453_1.text_.text = var_456_14
				arg_453_1.typewritter.percent = 0

				arg_453_1.typewritter:SetDirty()
				arg_453_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481110", "story_v_out_121481.awb") ~= 0 then
					local var_456_18 = manager.audio:GetVoiceLength("story_v_out_121481", "121481110", "story_v_out_121481.awb") / 1000

					if var_456_18 + var_456_10 > arg_453_1.duration_ then
						arg_453_1.duration_ = var_456_18 + var_456_10
					end

					if var_456_13.prefab_name ~= "" and arg_453_1.actors_[var_456_13.prefab_name] ~= nil then
						local var_456_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_453_1.actors_[var_456_13.prefab_name].transform, "story_v_out_121481", "121481110", "story_v_out_121481.awb")

						arg_453_1:RecordAudio("121481110", var_456_19)
						arg_453_1:RecordAudio("121481110", var_456_19)
					else
						arg_453_1:AudioAction("play", "voice", "story_v_out_121481", "121481110", "story_v_out_121481.awb")
					end

					arg_453_1:RecordHistoryTalkVoice("story_v_out_121481", "121481110", "story_v_out_121481.awb")
				end

				arg_453_1:RecordContent(arg_453_1.text_.text)
			end

			local var_456_20 = math.max(var_456_11, arg_453_1.talkMaxDuration)

			if var_456_10 <= arg_453_1.time_ and arg_453_1.time_ < var_456_10 + var_456_20 then
				arg_453_1.typewritter.percent = (arg_453_1.time_ - var_456_10) / var_456_20

				arg_453_1.typewritter:SetDirty()
			end

			if arg_453_1.time_ >= var_456_10 + var_456_20 and arg_453_1.time_ < var_456_10 + var_456_20 + arg_456_0 then
				arg_453_1.typewritter.percent = 1

				arg_453_1.typewritter:SetDirty()
				arg_453_1:ShowNextGo(true)
			end
		end
	end,
	Play121481111 = function(arg_457_0, arg_457_1)
		arg_457_1.time_ = 0
		arg_457_1.frameCnt_ = 0
		arg_457_1.state_ = "playing"
		arg_457_1.curTalkId_ = 121481111
		arg_457_1.duration_ = 5

		SetActive(arg_457_1.tipsGo_, false)

		function arg_457_1.onSingleLineFinish_()
			arg_457_1.onSingleLineUpdate_ = nil
			arg_457_1.onSingleLineFinish_ = nil
			arg_457_1.state_ = "waiting"
		end

		function arg_457_1.playNext_(arg_459_0)
			if arg_459_0 == 1 then
				arg_457_0:Play121481112(arg_457_1)
			end
		end

		function arg_457_1.onSingleLineUpdate_(arg_460_0)
			local var_460_0 = arg_457_1.actors_["1069ui_story"]
			local var_460_1 = 0

			if var_460_1 < arg_457_1.time_ and arg_457_1.time_ <= var_460_1 + arg_460_0 and arg_457_1.var_.characterEffect1069ui_story == nil then
				arg_457_1.var_.characterEffect1069ui_story = var_460_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_460_2 = 0.200000002980232

			if var_460_1 <= arg_457_1.time_ and arg_457_1.time_ < var_460_1 + var_460_2 then
				local var_460_3 = (arg_457_1.time_ - var_460_1) / var_460_2

				if arg_457_1.var_.characterEffect1069ui_story then
					local var_460_4 = Mathf.Lerp(0, 0.5, var_460_3)

					arg_457_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_457_1.var_.characterEffect1069ui_story.fillRatio = var_460_4
				end
			end

			if arg_457_1.time_ >= var_460_1 + var_460_2 and arg_457_1.time_ < var_460_1 + var_460_2 + arg_460_0 and arg_457_1.var_.characterEffect1069ui_story then
				local var_460_5 = 0.5

				arg_457_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_457_1.var_.characterEffect1069ui_story.fillRatio = var_460_5
			end

			local var_460_6 = 0
			local var_460_7 = 1.15

			if var_460_6 < arg_457_1.time_ and arg_457_1.time_ <= var_460_6 + arg_460_0 then
				arg_457_1.talkMaxDuration = 0
				arg_457_1.dialogCg_.alpha = 1

				arg_457_1.dialog_:SetActive(true)
				SetActive(arg_457_1.leftNameGo_, false)

				arg_457_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_457_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_457_1:RecordName(arg_457_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_457_1.iconTrs_.gameObject, false)
				arg_457_1.callingController_:SetSelectedState("normal")

				local var_460_8 = arg_457_1:GetWordFromCfg(121481111)
				local var_460_9 = arg_457_1:FormatText(var_460_8.content)

				arg_457_1.text_.text = var_460_9

				LuaForUtil.ClearLinePrefixSymbol(arg_457_1.text_)

				local var_460_10 = 46
				local var_460_11 = utf8.len(var_460_9)
				local var_460_12 = var_460_10 <= 0 and var_460_7 or var_460_7 * (var_460_11 / var_460_10)

				if var_460_12 > 0 and var_460_7 < var_460_12 then
					arg_457_1.talkMaxDuration = var_460_12

					if var_460_12 + var_460_6 > arg_457_1.duration_ then
						arg_457_1.duration_ = var_460_12 + var_460_6
					end
				end

				arg_457_1.text_.text = var_460_9
				arg_457_1.typewritter.percent = 0

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(false)
				arg_457_1:RecordContent(arg_457_1.text_.text)
			end

			local var_460_13 = math.max(var_460_7, arg_457_1.talkMaxDuration)

			if var_460_6 <= arg_457_1.time_ and arg_457_1.time_ < var_460_6 + var_460_13 then
				arg_457_1.typewritter.percent = (arg_457_1.time_ - var_460_6) / var_460_13

				arg_457_1.typewritter:SetDirty()
			end

			if arg_457_1.time_ >= var_460_6 + var_460_13 and arg_457_1.time_ < var_460_6 + var_460_13 + arg_460_0 then
				arg_457_1.typewritter.percent = 1

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(true)
			end
		end
	end,
	Play121481112 = function(arg_461_0, arg_461_1)
		arg_461_1.time_ = 0
		arg_461_1.frameCnt_ = 0
		arg_461_1.state_ = "playing"
		arg_461_1.curTalkId_ = 121481112
		arg_461_1.duration_ = 4.6

		local var_461_0 = {
			ja = 4.6,
			ko = 4,
			zh = 4
		}
		local var_461_1 = manager.audio:GetLocalizationFlag()

		if var_461_0[var_461_1] ~= nil then
			arg_461_1.duration_ = var_461_0[var_461_1]
		end

		SetActive(arg_461_1.tipsGo_, false)

		function arg_461_1.onSingleLineFinish_()
			arg_461_1.onSingleLineUpdate_ = nil
			arg_461_1.onSingleLineFinish_ = nil
			arg_461_1.state_ = "waiting"
		end

		function arg_461_1.playNext_(arg_463_0)
			if arg_463_0 == 1 then
				arg_461_0:Play121481113(arg_461_1)
			end
		end

		function arg_461_1.onSingleLineUpdate_(arg_464_0)
			local var_464_0 = arg_461_1.actors_["1069ui_story"]
			local var_464_1 = 0

			if var_464_1 < arg_461_1.time_ and arg_461_1.time_ <= var_464_1 + arg_464_0 and arg_461_1.var_.characterEffect1069ui_story == nil then
				arg_461_1.var_.characterEffect1069ui_story = var_464_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_464_2 = 0.200000002980232

			if var_464_1 <= arg_461_1.time_ and arg_461_1.time_ < var_464_1 + var_464_2 then
				local var_464_3 = (arg_461_1.time_ - var_464_1) / var_464_2

				if arg_461_1.var_.characterEffect1069ui_story then
					arg_461_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_461_1.time_ >= var_464_1 + var_464_2 and arg_461_1.time_ < var_464_1 + var_464_2 + arg_464_0 and arg_461_1.var_.characterEffect1069ui_story then
				arg_461_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_464_4 = 0
			local var_464_5 = 0.35

			if var_464_4 < arg_461_1.time_ and arg_461_1.time_ <= var_464_4 + arg_464_0 then
				arg_461_1.talkMaxDuration = 0
				arg_461_1.dialogCg_.alpha = 1

				arg_461_1.dialog_:SetActive(true)
				SetActive(arg_461_1.leftNameGo_, true)

				local var_464_6 = arg_461_1:FormatText(StoryNameCfg[378].name)

				arg_461_1.leftNameTxt_.text = var_464_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_461_1.leftNameTxt_.transform)

				arg_461_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_461_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_461_1:RecordName(arg_461_1.leftNameTxt_.text)
				SetActive(arg_461_1.iconTrs_.gameObject, false)
				arg_461_1.callingController_:SetSelectedState("normal")

				local var_464_7 = arg_461_1:GetWordFromCfg(121481112)
				local var_464_8 = arg_461_1:FormatText(var_464_7.content)

				arg_461_1.text_.text = var_464_8

				LuaForUtil.ClearLinePrefixSymbol(arg_461_1.text_)

				local var_464_9 = 14
				local var_464_10 = utf8.len(var_464_8)
				local var_464_11 = var_464_9 <= 0 and var_464_5 or var_464_5 * (var_464_10 / var_464_9)

				if var_464_11 > 0 and var_464_5 < var_464_11 then
					arg_461_1.talkMaxDuration = var_464_11

					if var_464_11 + var_464_4 > arg_461_1.duration_ then
						arg_461_1.duration_ = var_464_11 + var_464_4
					end
				end

				arg_461_1.text_.text = var_464_8
				arg_461_1.typewritter.percent = 0

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481112", "story_v_out_121481.awb") ~= 0 then
					local var_464_12 = manager.audio:GetVoiceLength("story_v_out_121481", "121481112", "story_v_out_121481.awb") / 1000

					if var_464_12 + var_464_4 > arg_461_1.duration_ then
						arg_461_1.duration_ = var_464_12 + var_464_4
					end

					if var_464_7.prefab_name ~= "" and arg_461_1.actors_[var_464_7.prefab_name] ~= nil then
						local var_464_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_461_1.actors_[var_464_7.prefab_name].transform, "story_v_out_121481", "121481112", "story_v_out_121481.awb")

						arg_461_1:RecordAudio("121481112", var_464_13)
						arg_461_1:RecordAudio("121481112", var_464_13)
					else
						arg_461_1:AudioAction("play", "voice", "story_v_out_121481", "121481112", "story_v_out_121481.awb")
					end

					arg_461_1:RecordHistoryTalkVoice("story_v_out_121481", "121481112", "story_v_out_121481.awb")
				end

				arg_461_1:RecordContent(arg_461_1.text_.text)
			end

			local var_464_14 = math.max(var_464_5, arg_461_1.talkMaxDuration)

			if var_464_4 <= arg_461_1.time_ and arg_461_1.time_ < var_464_4 + var_464_14 then
				arg_461_1.typewritter.percent = (arg_461_1.time_ - var_464_4) / var_464_14

				arg_461_1.typewritter:SetDirty()
			end

			if arg_461_1.time_ >= var_464_4 + var_464_14 and arg_461_1.time_ < var_464_4 + var_464_14 + arg_464_0 then
				arg_461_1.typewritter.percent = 1

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(true)
			end
		end
	end,
	Play121481113 = function(arg_465_0, arg_465_1)
		arg_465_1.time_ = 0
		arg_465_1.frameCnt_ = 0
		arg_465_1.state_ = "playing"
		arg_465_1.curTalkId_ = 121481113
		arg_465_1.duration_ = 4.666

		local var_465_0 = {
			ja = 4.3,
			ko = 4.666,
			zh = 4.666
		}
		local var_465_1 = manager.audio:GetLocalizationFlag()

		if var_465_0[var_465_1] ~= nil then
			arg_465_1.duration_ = var_465_0[var_465_1]
		end

		SetActive(arg_465_1.tipsGo_, false)

		function arg_465_1.onSingleLineFinish_()
			arg_465_1.onSingleLineUpdate_ = nil
			arg_465_1.onSingleLineFinish_ = nil
			arg_465_1.state_ = "waiting"
		end

		function arg_465_1.playNext_(arg_467_0)
			if arg_467_0 == 1 then
				arg_465_0:Play121481114(arg_465_1)
			end
		end

		function arg_465_1.onSingleLineUpdate_(arg_468_0)
			local var_468_0 = arg_465_1.actors_["10045ui_story"]
			local var_468_1 = 0

			if var_468_1 < arg_465_1.time_ and arg_465_1.time_ <= var_468_1 + arg_468_0 and arg_465_1.var_.characterEffect10045ui_story == nil then
				arg_465_1.var_.characterEffect10045ui_story = var_468_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_468_2 = 0.200000002980232

			if var_468_1 <= arg_465_1.time_ and arg_465_1.time_ < var_468_1 + var_468_2 then
				local var_468_3 = (arg_465_1.time_ - var_468_1) / var_468_2

				if arg_465_1.var_.characterEffect10045ui_story then
					arg_465_1.var_.characterEffect10045ui_story.fillFlat = false
				end
			end

			if arg_465_1.time_ >= var_468_1 + var_468_2 and arg_465_1.time_ < var_468_1 + var_468_2 + arg_468_0 and arg_465_1.var_.characterEffect10045ui_story then
				arg_465_1.var_.characterEffect10045ui_story.fillFlat = false
			end

			local var_468_4 = arg_465_1.actors_["1069ui_story"]
			local var_468_5 = 0

			if var_468_5 < arg_465_1.time_ and arg_465_1.time_ <= var_468_5 + arg_468_0 and arg_465_1.var_.characterEffect1069ui_story == nil then
				arg_465_1.var_.characterEffect1069ui_story = var_468_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_468_6 = 0.200000002980232

			if var_468_5 <= arg_465_1.time_ and arg_465_1.time_ < var_468_5 + var_468_6 then
				local var_468_7 = (arg_465_1.time_ - var_468_5) / var_468_6

				if arg_465_1.var_.characterEffect1069ui_story then
					local var_468_8 = Mathf.Lerp(0, 0.5, var_468_7)

					arg_465_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_465_1.var_.characterEffect1069ui_story.fillRatio = var_468_8
				end
			end

			if arg_465_1.time_ >= var_468_5 + var_468_6 and arg_465_1.time_ < var_468_5 + var_468_6 + arg_468_0 and arg_465_1.var_.characterEffect1069ui_story then
				local var_468_9 = 0.5

				arg_465_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_465_1.var_.characterEffect1069ui_story.fillRatio = var_468_9
			end

			local var_468_10 = 0

			if var_468_10 < arg_465_1.time_ and arg_465_1.time_ <= var_468_10 + arg_468_0 then
				arg_465_1:PlayTimeline("10045ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_468_11 = 0
			local var_468_12 = 0.25

			if var_468_11 < arg_465_1.time_ and arg_465_1.time_ <= var_468_11 + arg_468_0 then
				arg_465_1.talkMaxDuration = 0
				arg_465_1.dialogCg_.alpha = 1

				arg_465_1.dialog_:SetActive(true)
				SetActive(arg_465_1.leftNameGo_, true)

				local var_468_13 = arg_465_1:FormatText(StoryNameCfg[412].name)

				arg_465_1.leftNameTxt_.text = var_468_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_465_1.leftNameTxt_.transform)

				arg_465_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_465_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_465_1:RecordName(arg_465_1.leftNameTxt_.text)
				SetActive(arg_465_1.iconTrs_.gameObject, false)
				arg_465_1.callingController_:SetSelectedState("normal")

				local var_468_14 = arg_465_1:GetWordFromCfg(121481113)
				local var_468_15 = arg_465_1:FormatText(var_468_14.content)

				arg_465_1.text_.text = var_468_15

				LuaForUtil.ClearLinePrefixSymbol(arg_465_1.text_)

				local var_468_16 = 10
				local var_468_17 = utf8.len(var_468_15)
				local var_468_18 = var_468_16 <= 0 and var_468_12 or var_468_12 * (var_468_17 / var_468_16)

				if var_468_18 > 0 and var_468_12 < var_468_18 then
					arg_465_1.talkMaxDuration = var_468_18

					if var_468_18 + var_468_11 > arg_465_1.duration_ then
						arg_465_1.duration_ = var_468_18 + var_468_11
					end
				end

				arg_465_1.text_.text = var_468_15
				arg_465_1.typewritter.percent = 0

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481113", "story_v_out_121481.awb") ~= 0 then
					local var_468_19 = manager.audio:GetVoiceLength("story_v_out_121481", "121481113", "story_v_out_121481.awb") / 1000

					if var_468_19 + var_468_11 > arg_465_1.duration_ then
						arg_465_1.duration_ = var_468_19 + var_468_11
					end

					if var_468_14.prefab_name ~= "" and arg_465_1.actors_[var_468_14.prefab_name] ~= nil then
						local var_468_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_465_1.actors_[var_468_14.prefab_name].transform, "story_v_out_121481", "121481113", "story_v_out_121481.awb")

						arg_465_1:RecordAudio("121481113", var_468_20)
						arg_465_1:RecordAudio("121481113", var_468_20)
					else
						arg_465_1:AudioAction("play", "voice", "story_v_out_121481", "121481113", "story_v_out_121481.awb")
					end

					arg_465_1:RecordHistoryTalkVoice("story_v_out_121481", "121481113", "story_v_out_121481.awb")
				end

				arg_465_1:RecordContent(arg_465_1.text_.text)
			end

			local var_468_21 = math.max(var_468_12, arg_465_1.talkMaxDuration)

			if var_468_11 <= arg_465_1.time_ and arg_465_1.time_ < var_468_11 + var_468_21 then
				arg_465_1.typewritter.percent = (arg_465_1.time_ - var_468_11) / var_468_21

				arg_465_1.typewritter:SetDirty()
			end

			if arg_465_1.time_ >= var_468_11 + var_468_21 and arg_465_1.time_ < var_468_11 + var_468_21 + arg_468_0 then
				arg_465_1.typewritter.percent = 1

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(true)
			end
		end
	end,
	Play121481114 = function(arg_469_0, arg_469_1)
		arg_469_1.time_ = 0
		arg_469_1.frameCnt_ = 0
		arg_469_1.state_ = "playing"
		arg_469_1.curTalkId_ = 121481114
		arg_469_1.duration_ = 5.166

		local var_469_0 = {
			ja = 5.166,
			ko = 3.2,
			zh = 3.2
		}
		local var_469_1 = manager.audio:GetLocalizationFlag()

		if var_469_0[var_469_1] ~= nil then
			arg_469_1.duration_ = var_469_0[var_469_1]
		end

		SetActive(arg_469_1.tipsGo_, false)

		function arg_469_1.onSingleLineFinish_()
			arg_469_1.onSingleLineUpdate_ = nil
			arg_469_1.onSingleLineFinish_ = nil
			arg_469_1.state_ = "waiting"
		end

		function arg_469_1.playNext_(arg_471_0)
			if arg_471_0 == 1 then
				arg_469_0:Play121481115(arg_469_1)
			end
		end

		function arg_469_1.onSingleLineUpdate_(arg_472_0)
			local var_472_0 = arg_469_1.actors_["10045ui_story"]
			local var_472_1 = 0

			if var_472_1 < arg_469_1.time_ and arg_469_1.time_ <= var_472_1 + arg_472_0 and arg_469_1.var_.characterEffect10045ui_story == nil then
				arg_469_1.var_.characterEffect10045ui_story = var_472_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_472_2 = 0.200000002980232

			if var_472_1 <= arg_469_1.time_ and arg_469_1.time_ < var_472_1 + var_472_2 then
				local var_472_3 = (arg_469_1.time_ - var_472_1) / var_472_2

				if arg_469_1.var_.characterEffect10045ui_story then
					local var_472_4 = Mathf.Lerp(0, 0.5, var_472_3)

					arg_469_1.var_.characterEffect10045ui_story.fillFlat = true
					arg_469_1.var_.characterEffect10045ui_story.fillRatio = var_472_4
				end
			end

			if arg_469_1.time_ >= var_472_1 + var_472_2 and arg_469_1.time_ < var_472_1 + var_472_2 + arg_472_0 and arg_469_1.var_.characterEffect10045ui_story then
				local var_472_5 = 0.5

				arg_469_1.var_.characterEffect10045ui_story.fillFlat = true
				arg_469_1.var_.characterEffect10045ui_story.fillRatio = var_472_5
			end

			local var_472_6 = arg_469_1.actors_["1069ui_story"]
			local var_472_7 = 0

			if var_472_7 < arg_469_1.time_ and arg_469_1.time_ <= var_472_7 + arg_472_0 and arg_469_1.var_.characterEffect1069ui_story == nil then
				arg_469_1.var_.characterEffect1069ui_story = var_472_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_472_8 = 0.200000002980232

			if var_472_7 <= arg_469_1.time_ and arg_469_1.time_ < var_472_7 + var_472_8 then
				local var_472_9 = (arg_469_1.time_ - var_472_7) / var_472_8

				if arg_469_1.var_.characterEffect1069ui_story then
					arg_469_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_469_1.time_ >= var_472_7 + var_472_8 and arg_469_1.time_ < var_472_7 + var_472_8 + arg_472_0 and arg_469_1.var_.characterEffect1069ui_story then
				arg_469_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_472_10 = 0
			local var_472_11 = 0.325

			if var_472_10 < arg_469_1.time_ and arg_469_1.time_ <= var_472_10 + arg_472_0 then
				arg_469_1.talkMaxDuration = 0
				arg_469_1.dialogCg_.alpha = 1

				arg_469_1.dialog_:SetActive(true)
				SetActive(arg_469_1.leftNameGo_, true)

				local var_472_12 = arg_469_1:FormatText(StoryNameCfg[378].name)

				arg_469_1.leftNameTxt_.text = var_472_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_469_1.leftNameTxt_.transform)

				arg_469_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_469_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_469_1:RecordName(arg_469_1.leftNameTxt_.text)
				SetActive(arg_469_1.iconTrs_.gameObject, false)
				arg_469_1.callingController_:SetSelectedState("normal")

				local var_472_13 = arg_469_1:GetWordFromCfg(121481114)
				local var_472_14 = arg_469_1:FormatText(var_472_13.content)

				arg_469_1.text_.text = var_472_14

				LuaForUtil.ClearLinePrefixSymbol(arg_469_1.text_)

				local var_472_15 = 13
				local var_472_16 = utf8.len(var_472_14)
				local var_472_17 = var_472_15 <= 0 and var_472_11 or var_472_11 * (var_472_16 / var_472_15)

				if var_472_17 > 0 and var_472_11 < var_472_17 then
					arg_469_1.talkMaxDuration = var_472_17

					if var_472_17 + var_472_10 > arg_469_1.duration_ then
						arg_469_1.duration_ = var_472_17 + var_472_10
					end
				end

				arg_469_1.text_.text = var_472_14
				arg_469_1.typewritter.percent = 0

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481114", "story_v_out_121481.awb") ~= 0 then
					local var_472_18 = manager.audio:GetVoiceLength("story_v_out_121481", "121481114", "story_v_out_121481.awb") / 1000

					if var_472_18 + var_472_10 > arg_469_1.duration_ then
						arg_469_1.duration_ = var_472_18 + var_472_10
					end

					if var_472_13.prefab_name ~= "" and arg_469_1.actors_[var_472_13.prefab_name] ~= nil then
						local var_472_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_469_1.actors_[var_472_13.prefab_name].transform, "story_v_out_121481", "121481114", "story_v_out_121481.awb")

						arg_469_1:RecordAudio("121481114", var_472_19)
						arg_469_1:RecordAudio("121481114", var_472_19)
					else
						arg_469_1:AudioAction("play", "voice", "story_v_out_121481", "121481114", "story_v_out_121481.awb")
					end

					arg_469_1:RecordHistoryTalkVoice("story_v_out_121481", "121481114", "story_v_out_121481.awb")
				end

				arg_469_1:RecordContent(arg_469_1.text_.text)
			end

			local var_472_20 = math.max(var_472_11, arg_469_1.talkMaxDuration)

			if var_472_10 <= arg_469_1.time_ and arg_469_1.time_ < var_472_10 + var_472_20 then
				arg_469_1.typewritter.percent = (arg_469_1.time_ - var_472_10) / var_472_20

				arg_469_1.typewritter:SetDirty()
			end

			if arg_469_1.time_ >= var_472_10 + var_472_20 and arg_469_1.time_ < var_472_10 + var_472_20 + arg_472_0 then
				arg_469_1.typewritter.percent = 1

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(true)
			end
		end
	end,
	Play121481115 = function(arg_473_0, arg_473_1)
		arg_473_1.time_ = 0
		arg_473_1.frameCnt_ = 0
		arg_473_1.state_ = "playing"
		arg_473_1.curTalkId_ = 121481115
		arg_473_1.duration_ = 5

		SetActive(arg_473_1.tipsGo_, false)

		function arg_473_1.onSingleLineFinish_()
			arg_473_1.onSingleLineUpdate_ = nil
			arg_473_1.onSingleLineFinish_ = nil
			arg_473_1.state_ = "waiting"
		end

		function arg_473_1.playNext_(arg_475_0)
			if arg_475_0 == 1 then
				arg_473_0:Play121481116(arg_473_1)
			end
		end

		function arg_473_1.onSingleLineUpdate_(arg_476_0)
			local var_476_0 = arg_473_1.actors_["10045ui_story"].transform
			local var_476_1 = 0

			if var_476_1 < arg_473_1.time_ and arg_473_1.time_ <= var_476_1 + arg_476_0 then
				arg_473_1.var_.moveOldPos10045ui_story = var_476_0.localPosition
			end

			local var_476_2 = 0.001

			if var_476_1 <= arg_473_1.time_ and arg_473_1.time_ < var_476_1 + var_476_2 then
				local var_476_3 = (arg_473_1.time_ - var_476_1) / var_476_2
				local var_476_4 = Vector3.New(0, 100, 0)

				var_476_0.localPosition = Vector3.Lerp(arg_473_1.var_.moveOldPos10045ui_story, var_476_4, var_476_3)

				local var_476_5 = manager.ui.mainCamera.transform.position - var_476_0.position

				var_476_0.forward = Vector3.New(var_476_5.x, var_476_5.y, var_476_5.z)

				local var_476_6 = var_476_0.localEulerAngles

				var_476_6.z = 0
				var_476_6.x = 0
				var_476_0.localEulerAngles = var_476_6
			end

			if arg_473_1.time_ >= var_476_1 + var_476_2 and arg_473_1.time_ < var_476_1 + var_476_2 + arg_476_0 then
				var_476_0.localPosition = Vector3.New(0, 100, 0)

				local var_476_7 = manager.ui.mainCamera.transform.position - var_476_0.position

				var_476_0.forward = Vector3.New(var_476_7.x, var_476_7.y, var_476_7.z)

				local var_476_8 = var_476_0.localEulerAngles

				var_476_8.z = 0
				var_476_8.x = 0
				var_476_0.localEulerAngles = var_476_8
			end

			local var_476_9 = arg_473_1.actors_["1069ui_story"].transform
			local var_476_10 = 0

			if var_476_10 < arg_473_1.time_ and arg_473_1.time_ <= var_476_10 + arg_476_0 then
				arg_473_1.var_.moveOldPos1069ui_story = var_476_9.localPosition
			end

			local var_476_11 = 0.001

			if var_476_10 <= arg_473_1.time_ and arg_473_1.time_ < var_476_10 + var_476_11 then
				local var_476_12 = (arg_473_1.time_ - var_476_10) / var_476_11
				local var_476_13 = Vector3.New(0, 100, 0)

				var_476_9.localPosition = Vector3.Lerp(arg_473_1.var_.moveOldPos1069ui_story, var_476_13, var_476_12)

				local var_476_14 = manager.ui.mainCamera.transform.position - var_476_9.position

				var_476_9.forward = Vector3.New(var_476_14.x, var_476_14.y, var_476_14.z)

				local var_476_15 = var_476_9.localEulerAngles

				var_476_15.z = 0
				var_476_15.x = 0
				var_476_9.localEulerAngles = var_476_15
			end

			if arg_473_1.time_ >= var_476_10 + var_476_11 and arg_473_1.time_ < var_476_10 + var_476_11 + arg_476_0 then
				var_476_9.localPosition = Vector3.New(0, 100, 0)

				local var_476_16 = manager.ui.mainCamera.transform.position - var_476_9.position

				var_476_9.forward = Vector3.New(var_476_16.x, var_476_16.y, var_476_16.z)

				local var_476_17 = var_476_9.localEulerAngles

				var_476_17.z = 0
				var_476_17.x = 0
				var_476_9.localEulerAngles = var_476_17
			end

			local var_476_18 = 0
			local var_476_19 = 0.633333333333333

			if var_476_18 < arg_473_1.time_ and arg_473_1.time_ <= var_476_18 + arg_476_0 then
				local var_476_20 = "play"
				local var_476_21 = "effect"

				arg_473_1:AudioAction(var_476_20, var_476_21, "se_story_121_04", "se_story_121_04_bonebreak1", "")
			end

			local var_476_22 = 0
			local var_476_23 = 1.3

			if var_476_22 < arg_473_1.time_ and arg_473_1.time_ <= var_476_22 + arg_476_0 then
				arg_473_1.talkMaxDuration = 0
				arg_473_1.dialogCg_.alpha = 1

				arg_473_1.dialog_:SetActive(true)
				SetActive(arg_473_1.leftNameGo_, false)

				arg_473_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_473_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_473_1:RecordName(arg_473_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_473_1.iconTrs_.gameObject, false)
				arg_473_1.callingController_:SetSelectedState("normal")

				local var_476_24 = arg_473_1:GetWordFromCfg(121481115)
				local var_476_25 = arg_473_1:FormatText(var_476_24.content)

				arg_473_1.text_.text = var_476_25

				LuaForUtil.ClearLinePrefixSymbol(arg_473_1.text_)

				local var_476_26 = 52
				local var_476_27 = utf8.len(var_476_25)
				local var_476_28 = var_476_26 <= 0 and var_476_23 or var_476_23 * (var_476_27 / var_476_26)

				if var_476_28 > 0 and var_476_23 < var_476_28 then
					arg_473_1.talkMaxDuration = var_476_28

					if var_476_28 + var_476_22 > arg_473_1.duration_ then
						arg_473_1.duration_ = var_476_28 + var_476_22
					end
				end

				arg_473_1.text_.text = var_476_25
				arg_473_1.typewritter.percent = 0

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(false)
				arg_473_1:RecordContent(arg_473_1.text_.text)
			end

			local var_476_29 = math.max(var_476_23, arg_473_1.talkMaxDuration)

			if var_476_22 <= arg_473_1.time_ and arg_473_1.time_ < var_476_22 + var_476_29 then
				arg_473_1.typewritter.percent = (arg_473_1.time_ - var_476_22) / var_476_29

				arg_473_1.typewritter:SetDirty()
			end

			if arg_473_1.time_ >= var_476_22 + var_476_29 and arg_473_1.time_ < var_476_22 + var_476_29 + arg_476_0 then
				arg_473_1.typewritter.percent = 1

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(true)
			end
		end
	end,
	Play121481116 = function(arg_477_0, arg_477_1)
		arg_477_1.time_ = 0
		arg_477_1.frameCnt_ = 0
		arg_477_1.state_ = "playing"
		arg_477_1.curTalkId_ = 121481116
		arg_477_1.duration_ = 3.166

		local var_477_0 = {
			ja = 2.766,
			ko = 3.166,
			zh = 3.166
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
				arg_477_0:Play121481117(arg_477_1)
			end
		end

		function arg_477_1.onSingleLineUpdate_(arg_480_0)
			local var_480_0 = manager.ui.mainCamera.transform
			local var_480_1 = 0

			if var_480_1 < arg_477_1.time_ and arg_477_1.time_ <= var_480_1 + arg_480_0 then
				arg_477_1.var_.shakeOldPos = var_480_0.localPosition
			end

			local var_480_2 = 0.6

			if var_480_1 <= arg_477_1.time_ and arg_477_1.time_ < var_480_1 + var_480_2 then
				local var_480_3 = (arg_477_1.time_ - var_480_1) / 0.066
				local var_480_4, var_480_5 = math.modf(var_480_3)

				var_480_0.localPosition = Vector3.New(var_480_5 * 0.13, var_480_5 * 0.13, var_480_5 * 0.13) + arg_477_1.var_.shakeOldPos
			end

			if arg_477_1.time_ >= var_480_1 + var_480_2 and arg_477_1.time_ < var_480_1 + var_480_2 + arg_480_0 then
				var_480_0.localPosition = arg_477_1.var_.shakeOldPos
			end

			local var_480_6 = 0

			if var_480_6 < arg_477_1.time_ and arg_477_1.time_ <= var_480_6 + arg_480_0 then
				arg_477_1.allBtn_.enabled = false
			end

			local var_480_7 = 0.6

			if arg_477_1.time_ >= var_480_6 + var_480_7 and arg_477_1.time_ < var_480_6 + var_480_7 + arg_480_0 then
				arg_477_1.allBtn_.enabled = true
			end

			local var_480_8 = 0
			local var_480_9 = 0.225

			if var_480_8 < arg_477_1.time_ and arg_477_1.time_ <= var_480_8 + arg_480_0 then
				arg_477_1.talkMaxDuration = 0
				arg_477_1.dialogCg_.alpha = 1

				arg_477_1.dialog_:SetActive(true)
				SetActive(arg_477_1.leftNameGo_, true)

				local var_480_10 = arg_477_1:FormatText(StoryNameCfg[412].name)

				arg_477_1.leftNameTxt_.text = var_480_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_477_1.leftNameTxt_.transform)

				arg_477_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_477_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_477_1:RecordName(arg_477_1.leftNameTxt_.text)
				SetActive(arg_477_1.iconTrs_.gameObject, true)
				arg_477_1.iconController_:SetSelectedState("hero")

				arg_477_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10045")

				arg_477_1.callingController_:SetSelectedState("normal")

				local var_480_11 = arg_477_1:GetWordFromCfg(121481116)
				local var_480_12 = arg_477_1:FormatText(var_480_11.content)

				arg_477_1.text_.text = var_480_12

				LuaForUtil.ClearLinePrefixSymbol(arg_477_1.text_)

				local var_480_13 = 9
				local var_480_14 = utf8.len(var_480_12)
				local var_480_15 = var_480_13 <= 0 and var_480_9 or var_480_9 * (var_480_14 / var_480_13)

				if var_480_15 > 0 and var_480_9 < var_480_15 then
					arg_477_1.talkMaxDuration = var_480_15

					if var_480_15 + var_480_8 > arg_477_1.duration_ then
						arg_477_1.duration_ = var_480_15 + var_480_8
					end
				end

				arg_477_1.text_.text = var_480_12
				arg_477_1.typewritter.percent = 0

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481116", "story_v_out_121481.awb") ~= 0 then
					local var_480_16 = manager.audio:GetVoiceLength("story_v_out_121481", "121481116", "story_v_out_121481.awb") / 1000

					if var_480_16 + var_480_8 > arg_477_1.duration_ then
						arg_477_1.duration_ = var_480_16 + var_480_8
					end

					if var_480_11.prefab_name ~= "" and arg_477_1.actors_[var_480_11.prefab_name] ~= nil then
						local var_480_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_477_1.actors_[var_480_11.prefab_name].transform, "story_v_out_121481", "121481116", "story_v_out_121481.awb")

						arg_477_1:RecordAudio("121481116", var_480_17)
						arg_477_1:RecordAudio("121481116", var_480_17)
					else
						arg_477_1:AudioAction("play", "voice", "story_v_out_121481", "121481116", "story_v_out_121481.awb")
					end

					arg_477_1:RecordHistoryTalkVoice("story_v_out_121481", "121481116", "story_v_out_121481.awb")
				end

				arg_477_1:RecordContent(arg_477_1.text_.text)
			end

			local var_480_18 = math.max(var_480_9, arg_477_1.talkMaxDuration)

			if var_480_8 <= arg_477_1.time_ and arg_477_1.time_ < var_480_8 + var_480_18 then
				arg_477_1.typewritter.percent = (arg_477_1.time_ - var_480_8) / var_480_18

				arg_477_1.typewritter:SetDirty()
			end

			if arg_477_1.time_ >= var_480_8 + var_480_18 and arg_477_1.time_ < var_480_8 + var_480_18 + arg_480_0 then
				arg_477_1.typewritter.percent = 1

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(true)
			end
		end
	end,
	Play121481117 = function(arg_481_0, arg_481_1)
		arg_481_1.time_ = 0
		arg_481_1.frameCnt_ = 0
		arg_481_1.state_ = "playing"
		arg_481_1.curTalkId_ = 121481117
		arg_481_1.duration_ = 4.766

		local var_481_0 = {
			ja = 4.766,
			ko = 4.466,
			zh = 4.466
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
				arg_481_0:Play121481118(arg_481_1)
			end
		end

		function arg_481_1.onSingleLineUpdate_(arg_484_0)
			local var_484_0 = arg_481_1.actors_["1069ui_story"].transform
			local var_484_1 = 0

			if var_484_1 < arg_481_1.time_ and arg_481_1.time_ <= var_484_1 + arg_484_0 then
				arg_481_1.var_.moveOldPos1069ui_story = var_484_0.localPosition
			end

			local var_484_2 = 0.001

			if var_484_1 <= arg_481_1.time_ and arg_481_1.time_ < var_484_1 + var_484_2 then
				local var_484_3 = (arg_481_1.time_ - var_484_1) / var_484_2
				local var_484_4 = Vector3.New(0, -1, -6)

				var_484_0.localPosition = Vector3.Lerp(arg_481_1.var_.moveOldPos1069ui_story, var_484_4, var_484_3)

				local var_484_5 = manager.ui.mainCamera.transform.position - var_484_0.position

				var_484_0.forward = Vector3.New(var_484_5.x, var_484_5.y, var_484_5.z)

				local var_484_6 = var_484_0.localEulerAngles

				var_484_6.z = 0
				var_484_6.x = 0
				var_484_0.localEulerAngles = var_484_6
			end

			if arg_481_1.time_ >= var_484_1 + var_484_2 and arg_481_1.time_ < var_484_1 + var_484_2 + arg_484_0 then
				var_484_0.localPosition = Vector3.New(0, -1, -6)

				local var_484_7 = manager.ui.mainCamera.transform.position - var_484_0.position

				var_484_0.forward = Vector3.New(var_484_7.x, var_484_7.y, var_484_7.z)

				local var_484_8 = var_484_0.localEulerAngles

				var_484_8.z = 0
				var_484_8.x = 0
				var_484_0.localEulerAngles = var_484_8
			end

			local var_484_9 = 0

			if var_484_9 < arg_481_1.time_ and arg_481_1.time_ <= var_484_9 + arg_484_0 then
				arg_481_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_484_10 = 0

			if var_484_10 < arg_481_1.time_ and arg_481_1.time_ <= var_484_10 + arg_484_0 then
				arg_481_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action2_1")
			end

			local var_484_11 = arg_481_1.actors_["1069ui_story"]
			local var_484_12 = 0

			if var_484_12 < arg_481_1.time_ and arg_481_1.time_ <= var_484_12 + arg_484_0 and arg_481_1.var_.characterEffect1069ui_story == nil then
				arg_481_1.var_.characterEffect1069ui_story = var_484_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_484_13 = 0.2

			if var_484_12 <= arg_481_1.time_ and arg_481_1.time_ < var_484_12 + var_484_13 then
				local var_484_14 = (arg_481_1.time_ - var_484_12) / var_484_13

				if arg_481_1.var_.characterEffect1069ui_story then
					arg_481_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_481_1.time_ >= var_484_12 + var_484_13 and arg_481_1.time_ < var_484_12 + var_484_13 + arg_484_0 and arg_481_1.var_.characterEffect1069ui_story then
				arg_481_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_484_15 = 0
			local var_484_16 = 0.475

			if var_484_15 < arg_481_1.time_ and arg_481_1.time_ <= var_484_15 + arg_484_0 then
				arg_481_1.talkMaxDuration = 0
				arg_481_1.dialogCg_.alpha = 1

				arg_481_1.dialog_:SetActive(true)
				SetActive(arg_481_1.leftNameGo_, true)

				local var_484_17 = arg_481_1:FormatText(StoryNameCfg[378].name)

				arg_481_1.leftNameTxt_.text = var_484_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_481_1.leftNameTxt_.transform)

				arg_481_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_481_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_481_1:RecordName(arg_481_1.leftNameTxt_.text)
				SetActive(arg_481_1.iconTrs_.gameObject, false)
				arg_481_1.callingController_:SetSelectedState("normal")

				local var_484_18 = arg_481_1:GetWordFromCfg(121481117)
				local var_484_19 = arg_481_1:FormatText(var_484_18.content)

				arg_481_1.text_.text = var_484_19

				LuaForUtil.ClearLinePrefixSymbol(arg_481_1.text_)

				local var_484_20 = 19
				local var_484_21 = utf8.len(var_484_19)
				local var_484_22 = var_484_20 <= 0 and var_484_16 or var_484_16 * (var_484_21 / var_484_20)

				if var_484_22 > 0 and var_484_16 < var_484_22 then
					arg_481_1.talkMaxDuration = var_484_22

					if var_484_22 + var_484_15 > arg_481_1.duration_ then
						arg_481_1.duration_ = var_484_22 + var_484_15
					end
				end

				arg_481_1.text_.text = var_484_19
				arg_481_1.typewritter.percent = 0

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481117", "story_v_out_121481.awb") ~= 0 then
					local var_484_23 = manager.audio:GetVoiceLength("story_v_out_121481", "121481117", "story_v_out_121481.awb") / 1000

					if var_484_23 + var_484_15 > arg_481_1.duration_ then
						arg_481_1.duration_ = var_484_23 + var_484_15
					end

					if var_484_18.prefab_name ~= "" and arg_481_1.actors_[var_484_18.prefab_name] ~= nil then
						local var_484_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_481_1.actors_[var_484_18.prefab_name].transform, "story_v_out_121481", "121481117", "story_v_out_121481.awb")

						arg_481_1:RecordAudio("121481117", var_484_24)
						arg_481_1:RecordAudio("121481117", var_484_24)
					else
						arg_481_1:AudioAction("play", "voice", "story_v_out_121481", "121481117", "story_v_out_121481.awb")
					end

					arg_481_1:RecordHistoryTalkVoice("story_v_out_121481", "121481117", "story_v_out_121481.awb")
				end

				arg_481_1:RecordContent(arg_481_1.text_.text)
			end

			local var_484_25 = math.max(var_484_16, arg_481_1.talkMaxDuration)

			if var_484_15 <= arg_481_1.time_ and arg_481_1.time_ < var_484_15 + var_484_25 then
				arg_481_1.typewritter.percent = (arg_481_1.time_ - var_484_15) / var_484_25

				arg_481_1.typewritter:SetDirty()
			end

			if arg_481_1.time_ >= var_484_15 + var_484_25 and arg_481_1.time_ < var_484_15 + var_484_25 + arg_484_0 then
				arg_481_1.typewritter.percent = 1

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(true)
			end
		end
	end,
	Play121481118 = function(arg_485_0, arg_485_1)
		arg_485_1.time_ = 0
		arg_485_1.frameCnt_ = 0
		arg_485_1.state_ = "playing"
		arg_485_1.curTalkId_ = 121481118
		arg_485_1.duration_ = 3.1

		local var_485_0 = {
			ja = 2,
			ko = 3.1,
			zh = 3.1
		}
		local var_485_1 = manager.audio:GetLocalizationFlag()

		if var_485_0[var_485_1] ~= nil then
			arg_485_1.duration_ = var_485_0[var_485_1]
		end

		SetActive(arg_485_1.tipsGo_, false)

		function arg_485_1.onSingleLineFinish_()
			arg_485_1.onSingleLineUpdate_ = nil
			arg_485_1.onSingleLineFinish_ = nil
			arg_485_1.state_ = "waiting"
		end

		function arg_485_1.playNext_(arg_487_0)
			if arg_487_0 == 1 then
				arg_485_0:Play121481119(arg_485_1)
			end
		end

		function arg_485_1.onSingleLineUpdate_(arg_488_0)
			local var_488_0 = 0
			local var_488_1 = 0.3

			if var_488_0 < arg_485_1.time_ and arg_485_1.time_ <= var_488_0 + arg_488_0 then
				arg_485_1.talkMaxDuration = 0
				arg_485_1.dialogCg_.alpha = 1

				arg_485_1.dialog_:SetActive(true)
				SetActive(arg_485_1.leftNameGo_, true)

				local var_488_2 = arg_485_1:FormatText(StoryNameCfg[378].name)

				arg_485_1.leftNameTxt_.text = var_488_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_485_1.leftNameTxt_.transform)

				arg_485_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_485_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_485_1:RecordName(arg_485_1.leftNameTxt_.text)
				SetActive(arg_485_1.iconTrs_.gameObject, false)
				arg_485_1.callingController_:SetSelectedState("normal")

				local var_488_3 = arg_485_1:GetWordFromCfg(121481118)
				local var_488_4 = arg_485_1:FormatText(var_488_3.content)

				arg_485_1.text_.text = var_488_4

				LuaForUtil.ClearLinePrefixSymbol(arg_485_1.text_)

				local var_488_5 = 12
				local var_488_6 = utf8.len(var_488_4)
				local var_488_7 = var_488_5 <= 0 and var_488_1 or var_488_1 * (var_488_6 / var_488_5)

				if var_488_7 > 0 and var_488_1 < var_488_7 then
					arg_485_1.talkMaxDuration = var_488_7

					if var_488_7 + var_488_0 > arg_485_1.duration_ then
						arg_485_1.duration_ = var_488_7 + var_488_0
					end
				end

				arg_485_1.text_.text = var_488_4
				arg_485_1.typewritter.percent = 0

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481118", "story_v_out_121481.awb") ~= 0 then
					local var_488_8 = manager.audio:GetVoiceLength("story_v_out_121481", "121481118", "story_v_out_121481.awb") / 1000

					if var_488_8 + var_488_0 > arg_485_1.duration_ then
						arg_485_1.duration_ = var_488_8 + var_488_0
					end

					if var_488_3.prefab_name ~= "" and arg_485_1.actors_[var_488_3.prefab_name] ~= nil then
						local var_488_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_485_1.actors_[var_488_3.prefab_name].transform, "story_v_out_121481", "121481118", "story_v_out_121481.awb")

						arg_485_1:RecordAudio("121481118", var_488_9)
						arg_485_1:RecordAudio("121481118", var_488_9)
					else
						arg_485_1:AudioAction("play", "voice", "story_v_out_121481", "121481118", "story_v_out_121481.awb")
					end

					arg_485_1:RecordHistoryTalkVoice("story_v_out_121481", "121481118", "story_v_out_121481.awb")
				end

				arg_485_1:RecordContent(arg_485_1.text_.text)
			end

			local var_488_10 = math.max(var_488_1, arg_485_1.talkMaxDuration)

			if var_488_0 <= arg_485_1.time_ and arg_485_1.time_ < var_488_0 + var_488_10 then
				arg_485_1.typewritter.percent = (arg_485_1.time_ - var_488_0) / var_488_10

				arg_485_1.typewritter:SetDirty()
			end

			if arg_485_1.time_ >= var_488_0 + var_488_10 and arg_485_1.time_ < var_488_0 + var_488_10 + arg_488_0 then
				arg_485_1.typewritter.percent = 1

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(true)
			end
		end
	end,
	Play121481119 = function(arg_489_0, arg_489_1)
		arg_489_1.time_ = 0
		arg_489_1.frameCnt_ = 0
		arg_489_1.state_ = "playing"
		arg_489_1.curTalkId_ = 121481119
		arg_489_1.duration_ = 12.233

		local var_489_0 = {
			ja = 12.233,
			ko = 11.433,
			zh = 11.433
		}
		local var_489_1 = manager.audio:GetLocalizationFlag()

		if var_489_0[var_489_1] ~= nil then
			arg_489_1.duration_ = var_489_0[var_489_1]
		end

		SetActive(arg_489_1.tipsGo_, false)

		function arg_489_1.onSingleLineFinish_()
			arg_489_1.onSingleLineUpdate_ = nil
			arg_489_1.onSingleLineFinish_ = nil
			arg_489_1.state_ = "waiting"
		end

		function arg_489_1.playNext_(arg_491_0)
			if arg_491_0 == 1 then
				arg_489_0:Play121481120(arg_489_1)
			end
		end

		function arg_489_1.onSingleLineUpdate_(arg_492_0)
			local var_492_0 = arg_489_1.actors_["1069ui_story"].transform
			local var_492_1 = 0

			if var_492_1 < arg_489_1.time_ and arg_489_1.time_ <= var_492_1 + arg_492_0 then
				arg_489_1.var_.moveOldPos1069ui_story = var_492_0.localPosition
			end

			local var_492_2 = 0.001

			if var_492_1 <= arg_489_1.time_ and arg_489_1.time_ < var_492_1 + var_492_2 then
				local var_492_3 = (arg_489_1.time_ - var_492_1) / var_492_2
				local var_492_4 = Vector3.New(0, 100, 0)

				var_492_0.localPosition = Vector3.Lerp(arg_489_1.var_.moveOldPos1069ui_story, var_492_4, var_492_3)

				local var_492_5 = manager.ui.mainCamera.transform.position - var_492_0.position

				var_492_0.forward = Vector3.New(var_492_5.x, var_492_5.y, var_492_5.z)

				local var_492_6 = var_492_0.localEulerAngles

				var_492_6.z = 0
				var_492_6.x = 0
				var_492_0.localEulerAngles = var_492_6
			end

			if arg_489_1.time_ >= var_492_1 + var_492_2 and arg_489_1.time_ < var_492_1 + var_492_2 + arg_492_0 then
				var_492_0.localPosition = Vector3.New(0, 100, 0)

				local var_492_7 = manager.ui.mainCamera.transform.position - var_492_0.position

				var_492_0.forward = Vector3.New(var_492_7.x, var_492_7.y, var_492_7.z)

				local var_492_8 = var_492_0.localEulerAngles

				var_492_8.z = 0
				var_492_8.x = 0
				var_492_0.localEulerAngles = var_492_8
			end

			local var_492_9 = manager.ui.mainCamera.transform
			local var_492_10 = 0.733333333333333

			if var_492_10 < arg_489_1.time_ and arg_489_1.time_ <= var_492_10 + arg_492_0 then
				arg_489_1.var_.shakeOldPos = var_492_9.localPosition
			end

			local var_492_11 = 0.6

			if var_492_10 <= arg_489_1.time_ and arg_489_1.time_ < var_492_10 + var_492_11 then
				local var_492_12 = (arg_489_1.time_ - var_492_10) / 0.066
				local var_492_13, var_492_14 = math.modf(var_492_12)

				var_492_9.localPosition = Vector3.New(var_492_14 * 0.13, var_492_14 * 0.13, var_492_14 * 0.13) + arg_489_1.var_.shakeOldPos
			end

			if arg_489_1.time_ >= var_492_10 + var_492_11 and arg_489_1.time_ < var_492_10 + var_492_11 + arg_492_0 then
				var_492_9.localPosition = arg_489_1.var_.shakeOldPos
			end

			local var_492_15 = 0

			if var_492_15 < arg_489_1.time_ and arg_489_1.time_ <= var_492_15 + arg_492_0 then
				arg_489_1.allBtn_.enabled = false
			end

			local var_492_16 = 1.33333333333333

			if arg_489_1.time_ >= var_492_15 + var_492_16 and arg_489_1.time_ < var_492_15 + var_492_16 + arg_492_0 then
				arg_489_1.allBtn_.enabled = true
			end

			local var_492_17 = 1.1
			local var_492_18 = 0.433333333333333

			if var_492_17 < arg_489_1.time_ and arg_489_1.time_ <= var_492_17 + arg_492_0 then
				local var_492_19 = "play"
				local var_492_20 = "effect"

				arg_489_1:AudioAction(var_492_19, var_492_20, "se_story_121_04", "se_story_121_04_hitdown", "")
			end

			local var_492_21 = 0
			local var_492_22 = 0.85

			if var_492_21 < arg_489_1.time_ and arg_489_1.time_ <= var_492_21 + arg_492_0 then
				arg_489_1.talkMaxDuration = 0
				arg_489_1.dialogCg_.alpha = 1

				arg_489_1.dialog_:SetActive(true)
				SetActive(arg_489_1.leftNameGo_, true)

				local var_492_23 = arg_489_1:FormatText(StoryNameCfg[412].name)

				arg_489_1.leftNameTxt_.text = var_492_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_489_1.leftNameTxt_.transform)

				arg_489_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_489_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_489_1:RecordName(arg_489_1.leftNameTxt_.text)
				SetActive(arg_489_1.iconTrs_.gameObject, true)
				arg_489_1.iconController_:SetSelectedState("hero")

				arg_489_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10045")

				arg_489_1.callingController_:SetSelectedState("normal")

				local var_492_24 = arg_489_1:GetWordFromCfg(121481119)
				local var_492_25 = arg_489_1:FormatText(var_492_24.content)

				arg_489_1.text_.text = var_492_25

				LuaForUtil.ClearLinePrefixSymbol(arg_489_1.text_)

				local var_492_26 = 34
				local var_492_27 = utf8.len(var_492_25)
				local var_492_28 = var_492_26 <= 0 and var_492_22 or var_492_22 * (var_492_27 / var_492_26)

				if var_492_28 > 0 and var_492_22 < var_492_28 then
					arg_489_1.talkMaxDuration = var_492_28

					if var_492_28 + var_492_21 > arg_489_1.duration_ then
						arg_489_1.duration_ = var_492_28 + var_492_21
					end
				end

				arg_489_1.text_.text = var_492_25
				arg_489_1.typewritter.percent = 0

				arg_489_1.typewritter:SetDirty()
				arg_489_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481119", "story_v_out_121481.awb") ~= 0 then
					local var_492_29 = manager.audio:GetVoiceLength("story_v_out_121481", "121481119", "story_v_out_121481.awb") / 1000

					if var_492_29 + var_492_21 > arg_489_1.duration_ then
						arg_489_1.duration_ = var_492_29 + var_492_21
					end

					if var_492_24.prefab_name ~= "" and arg_489_1.actors_[var_492_24.prefab_name] ~= nil then
						local var_492_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_489_1.actors_[var_492_24.prefab_name].transform, "story_v_out_121481", "121481119", "story_v_out_121481.awb")

						arg_489_1:RecordAudio("121481119", var_492_30)
						arg_489_1:RecordAudio("121481119", var_492_30)
					else
						arg_489_1:AudioAction("play", "voice", "story_v_out_121481", "121481119", "story_v_out_121481.awb")
					end

					arg_489_1:RecordHistoryTalkVoice("story_v_out_121481", "121481119", "story_v_out_121481.awb")
				end

				arg_489_1:RecordContent(arg_489_1.text_.text)
			end

			local var_492_31 = math.max(var_492_22, arg_489_1.talkMaxDuration)

			if var_492_21 <= arg_489_1.time_ and arg_489_1.time_ < var_492_21 + var_492_31 then
				arg_489_1.typewritter.percent = (arg_489_1.time_ - var_492_21) / var_492_31

				arg_489_1.typewritter:SetDirty()
			end

			if arg_489_1.time_ >= var_492_21 + var_492_31 and arg_489_1.time_ < var_492_21 + var_492_31 + arg_492_0 then
				arg_489_1.typewritter.percent = 1

				arg_489_1.typewritter:SetDirty()
				arg_489_1:ShowNextGo(true)
			end
		end
	end,
	Play121481120 = function(arg_493_0, arg_493_1)
		arg_493_1.time_ = 0
		arg_493_1.frameCnt_ = 0
		arg_493_1.state_ = "playing"
		arg_493_1.curTalkId_ = 121481120
		arg_493_1.duration_ = 5

		SetActive(arg_493_1.tipsGo_, false)

		function arg_493_1.onSingleLineFinish_()
			arg_493_1.onSingleLineUpdate_ = nil
			arg_493_1.onSingleLineFinish_ = nil
			arg_493_1.state_ = "waiting"
		end

		function arg_493_1.playNext_(arg_495_0)
			if arg_495_0 == 1 then
				arg_493_0:Play121481121(arg_493_1)
			end
		end

		function arg_493_1.onSingleLineUpdate_(arg_496_0)
			local var_496_0 = arg_493_1.actors_["10045ui_story"]
			local var_496_1 = 0

			if var_496_1 < arg_493_1.time_ and arg_493_1.time_ <= var_496_1 + arg_496_0 and arg_493_1.var_.characterEffect10045ui_story == nil then
				arg_493_1.var_.characterEffect10045ui_story = var_496_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_496_2 = 0.200000002980232

			if var_496_1 <= arg_493_1.time_ and arg_493_1.time_ < var_496_1 + var_496_2 then
				local var_496_3 = (arg_493_1.time_ - var_496_1) / var_496_2

				if arg_493_1.var_.characterEffect10045ui_story then
					local var_496_4 = Mathf.Lerp(0, 0.5, var_496_3)

					arg_493_1.var_.characterEffect10045ui_story.fillFlat = true
					arg_493_1.var_.characterEffect10045ui_story.fillRatio = var_496_4
				end
			end

			if arg_493_1.time_ >= var_496_1 + var_496_2 and arg_493_1.time_ < var_496_1 + var_496_2 + arg_496_0 and arg_493_1.var_.characterEffect10045ui_story then
				local var_496_5 = 0.5

				arg_493_1.var_.characterEffect10045ui_story.fillFlat = true
				arg_493_1.var_.characterEffect10045ui_story.fillRatio = var_496_5
			end

			local var_496_6 = 0
			local var_496_7 = 0.825

			if var_496_6 < arg_493_1.time_ and arg_493_1.time_ <= var_496_6 + arg_496_0 then
				arg_493_1.talkMaxDuration = 0
				arg_493_1.dialogCg_.alpha = 1

				arg_493_1.dialog_:SetActive(true)
				SetActive(arg_493_1.leftNameGo_, false)

				arg_493_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_493_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_493_1:RecordName(arg_493_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_493_1.iconTrs_.gameObject, false)
				arg_493_1.callingController_:SetSelectedState("normal")

				local var_496_8 = arg_493_1:GetWordFromCfg(121481120)
				local var_496_9 = arg_493_1:FormatText(var_496_8.content)

				arg_493_1.text_.text = var_496_9

				LuaForUtil.ClearLinePrefixSymbol(arg_493_1.text_)

				local var_496_10 = 33
				local var_496_11 = utf8.len(var_496_9)
				local var_496_12 = var_496_10 <= 0 and var_496_7 or var_496_7 * (var_496_11 / var_496_10)

				if var_496_12 > 0 and var_496_7 < var_496_12 then
					arg_493_1.talkMaxDuration = var_496_12

					if var_496_12 + var_496_6 > arg_493_1.duration_ then
						arg_493_1.duration_ = var_496_12 + var_496_6
					end
				end

				arg_493_1.text_.text = var_496_9
				arg_493_1.typewritter.percent = 0

				arg_493_1.typewritter:SetDirty()
				arg_493_1:ShowNextGo(false)
				arg_493_1:RecordContent(arg_493_1.text_.text)
			end

			local var_496_13 = math.max(var_496_7, arg_493_1.talkMaxDuration)

			if var_496_6 <= arg_493_1.time_ and arg_493_1.time_ < var_496_6 + var_496_13 then
				arg_493_1.typewritter.percent = (arg_493_1.time_ - var_496_6) / var_496_13

				arg_493_1.typewritter:SetDirty()
			end

			if arg_493_1.time_ >= var_496_6 + var_496_13 and arg_493_1.time_ < var_496_6 + var_496_13 + arg_496_0 then
				arg_493_1.typewritter.percent = 1

				arg_493_1.typewritter:SetDirty()
				arg_493_1:ShowNextGo(true)
			end
		end
	end,
	Play121481121 = function(arg_497_0, arg_497_1)
		arg_497_1.time_ = 0
		arg_497_1.frameCnt_ = 0
		arg_497_1.state_ = "playing"
		arg_497_1.curTalkId_ = 121481121
		arg_497_1.duration_ = 5

		SetActive(arg_497_1.tipsGo_, false)

		function arg_497_1.onSingleLineFinish_()
			arg_497_1.onSingleLineUpdate_ = nil
			arg_497_1.onSingleLineFinish_ = nil
			arg_497_1.state_ = "waiting"
		end

		function arg_497_1.playNext_(arg_499_0)
			if arg_499_0 == 1 then
				arg_497_0:Play121481122(arg_497_1)
			end
		end

		function arg_497_1.onSingleLineUpdate_(arg_500_0)
			local var_500_0 = 0
			local var_500_1 = 1.15

			if var_500_0 < arg_497_1.time_ and arg_497_1.time_ <= var_500_0 + arg_500_0 then
				arg_497_1.talkMaxDuration = 0
				arg_497_1.dialogCg_.alpha = 1

				arg_497_1.dialog_:SetActive(true)
				SetActive(arg_497_1.leftNameGo_, false)

				arg_497_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_497_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_497_1:RecordName(arg_497_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_497_1.iconTrs_.gameObject, false)
				arg_497_1.callingController_:SetSelectedState("normal")

				local var_500_2 = arg_497_1:GetWordFromCfg(121481121)
				local var_500_3 = arg_497_1:FormatText(var_500_2.content)

				arg_497_1.text_.text = var_500_3

				LuaForUtil.ClearLinePrefixSymbol(arg_497_1.text_)

				local var_500_4 = 46
				local var_500_5 = utf8.len(var_500_3)
				local var_500_6 = var_500_4 <= 0 and var_500_1 or var_500_1 * (var_500_5 / var_500_4)

				if var_500_6 > 0 and var_500_1 < var_500_6 then
					arg_497_1.talkMaxDuration = var_500_6

					if var_500_6 + var_500_0 > arg_497_1.duration_ then
						arg_497_1.duration_ = var_500_6 + var_500_0
					end
				end

				arg_497_1.text_.text = var_500_3
				arg_497_1.typewritter.percent = 0

				arg_497_1.typewritter:SetDirty()
				arg_497_1:ShowNextGo(false)
				arg_497_1:RecordContent(arg_497_1.text_.text)
			end

			local var_500_7 = math.max(var_500_1, arg_497_1.talkMaxDuration)

			if var_500_0 <= arg_497_1.time_ and arg_497_1.time_ < var_500_0 + var_500_7 then
				arg_497_1.typewritter.percent = (arg_497_1.time_ - var_500_0) / var_500_7

				arg_497_1.typewritter:SetDirty()
			end

			if arg_497_1.time_ >= var_500_0 + var_500_7 and arg_497_1.time_ < var_500_0 + var_500_7 + arg_500_0 then
				arg_497_1.typewritter.percent = 1

				arg_497_1.typewritter:SetDirty()
				arg_497_1:ShowNextGo(true)
			end
		end
	end,
	Play121481122 = function(arg_501_0, arg_501_1)
		arg_501_1.time_ = 0
		arg_501_1.frameCnt_ = 0
		arg_501_1.state_ = "playing"
		arg_501_1.curTalkId_ = 121481122
		arg_501_1.duration_ = 4.766

		local var_501_0 = {
			ja = 4.766,
			ko = 1.999999999999,
			zh = 1.999999999999
		}
		local var_501_1 = manager.audio:GetLocalizationFlag()

		if var_501_0[var_501_1] ~= nil then
			arg_501_1.duration_ = var_501_0[var_501_1]
		end

		SetActive(arg_501_1.tipsGo_, false)

		function arg_501_1.onSingleLineFinish_()
			arg_501_1.onSingleLineUpdate_ = nil
			arg_501_1.onSingleLineFinish_ = nil
			arg_501_1.state_ = "waiting"
		end

		function arg_501_1.playNext_(arg_503_0)
			if arg_503_0 == 1 then
				arg_501_0:Play121481123(arg_501_1)
			end
		end

		function arg_501_1.onSingleLineUpdate_(arg_504_0)
			local var_504_0 = arg_501_1.actors_["1069ui_story"].transform
			local var_504_1 = 0

			if var_504_1 < arg_501_1.time_ and arg_501_1.time_ <= var_504_1 + arg_504_0 then
				arg_501_1.var_.moveOldPos1069ui_story = var_504_0.localPosition
			end

			local var_504_2 = 0.001

			if var_504_1 <= arg_501_1.time_ and arg_501_1.time_ < var_504_1 + var_504_2 then
				local var_504_3 = (arg_501_1.time_ - var_504_1) / var_504_2
				local var_504_4 = Vector3.New(0, -1, -6)

				var_504_0.localPosition = Vector3.Lerp(arg_501_1.var_.moveOldPos1069ui_story, var_504_4, var_504_3)

				local var_504_5 = manager.ui.mainCamera.transform.position - var_504_0.position

				var_504_0.forward = Vector3.New(var_504_5.x, var_504_5.y, var_504_5.z)

				local var_504_6 = var_504_0.localEulerAngles

				var_504_6.z = 0
				var_504_6.x = 0
				var_504_0.localEulerAngles = var_504_6
			end

			if arg_501_1.time_ >= var_504_1 + var_504_2 and arg_501_1.time_ < var_504_1 + var_504_2 + arg_504_0 then
				var_504_0.localPosition = Vector3.New(0, -1, -6)

				local var_504_7 = manager.ui.mainCamera.transform.position - var_504_0.position

				var_504_0.forward = Vector3.New(var_504_7.x, var_504_7.y, var_504_7.z)

				local var_504_8 = var_504_0.localEulerAngles

				var_504_8.z = 0
				var_504_8.x = 0
				var_504_0.localEulerAngles = var_504_8
			end

			local var_504_9 = arg_501_1.actors_["1069ui_story"]
			local var_504_10 = 0

			if var_504_10 < arg_501_1.time_ and arg_501_1.time_ <= var_504_10 + arg_504_0 and arg_501_1.var_.characterEffect1069ui_story == nil then
				arg_501_1.var_.characterEffect1069ui_story = var_504_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_504_11 = 0.200000002980232

			if var_504_10 <= arg_501_1.time_ and arg_501_1.time_ < var_504_10 + var_504_11 then
				local var_504_12 = (arg_501_1.time_ - var_504_10) / var_504_11

				if arg_501_1.var_.characterEffect1069ui_story then
					arg_501_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_501_1.time_ >= var_504_10 + var_504_11 and arg_501_1.time_ < var_504_10 + var_504_11 + arg_504_0 and arg_501_1.var_.characterEffect1069ui_story then
				arg_501_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_504_13 = 0

			if var_504_13 < arg_501_1.time_ and arg_501_1.time_ <= var_504_13 + arg_504_0 then
				arg_501_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action3_1")
			end

			local var_504_14 = 0

			if var_504_14 < arg_501_1.time_ and arg_501_1.time_ <= var_504_14 + arg_504_0 then
				arg_501_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_504_15 = 0
			local var_504_16 = 0.125

			if var_504_15 < arg_501_1.time_ and arg_501_1.time_ <= var_504_15 + arg_504_0 then
				arg_501_1.talkMaxDuration = 0
				arg_501_1.dialogCg_.alpha = 1

				arg_501_1.dialog_:SetActive(true)
				SetActive(arg_501_1.leftNameGo_, true)

				local var_504_17 = arg_501_1:FormatText(StoryNameCfg[378].name)

				arg_501_1.leftNameTxt_.text = var_504_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_501_1.leftNameTxt_.transform)

				arg_501_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_501_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_501_1:RecordName(arg_501_1.leftNameTxt_.text)
				SetActive(arg_501_1.iconTrs_.gameObject, false)
				arg_501_1.callingController_:SetSelectedState("normal")

				local var_504_18 = arg_501_1:GetWordFromCfg(121481122)
				local var_504_19 = arg_501_1:FormatText(var_504_18.content)

				arg_501_1.text_.text = var_504_19

				LuaForUtil.ClearLinePrefixSymbol(arg_501_1.text_)

				local var_504_20 = 5
				local var_504_21 = utf8.len(var_504_19)
				local var_504_22 = var_504_20 <= 0 and var_504_16 or var_504_16 * (var_504_21 / var_504_20)

				if var_504_22 > 0 and var_504_16 < var_504_22 then
					arg_501_1.talkMaxDuration = var_504_22

					if var_504_22 + var_504_15 > arg_501_1.duration_ then
						arg_501_1.duration_ = var_504_22 + var_504_15
					end
				end

				arg_501_1.text_.text = var_504_19
				arg_501_1.typewritter.percent = 0

				arg_501_1.typewritter:SetDirty()
				arg_501_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481122", "story_v_out_121481.awb") ~= 0 then
					local var_504_23 = manager.audio:GetVoiceLength("story_v_out_121481", "121481122", "story_v_out_121481.awb") / 1000

					if var_504_23 + var_504_15 > arg_501_1.duration_ then
						arg_501_1.duration_ = var_504_23 + var_504_15
					end

					if var_504_18.prefab_name ~= "" and arg_501_1.actors_[var_504_18.prefab_name] ~= nil then
						local var_504_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_501_1.actors_[var_504_18.prefab_name].transform, "story_v_out_121481", "121481122", "story_v_out_121481.awb")

						arg_501_1:RecordAudio("121481122", var_504_24)
						arg_501_1:RecordAudio("121481122", var_504_24)
					else
						arg_501_1:AudioAction("play", "voice", "story_v_out_121481", "121481122", "story_v_out_121481.awb")
					end

					arg_501_1:RecordHistoryTalkVoice("story_v_out_121481", "121481122", "story_v_out_121481.awb")
				end

				arg_501_1:RecordContent(arg_501_1.text_.text)
			end

			local var_504_25 = math.max(var_504_16, arg_501_1.talkMaxDuration)

			if var_504_15 <= arg_501_1.time_ and arg_501_1.time_ < var_504_15 + var_504_25 then
				arg_501_1.typewritter.percent = (arg_501_1.time_ - var_504_15) / var_504_25

				arg_501_1.typewritter:SetDirty()
			end

			if arg_501_1.time_ >= var_504_15 + var_504_25 and arg_501_1.time_ < var_504_15 + var_504_25 + arg_504_0 then
				arg_501_1.typewritter.percent = 1

				arg_501_1.typewritter:SetDirty()
				arg_501_1:ShowNextGo(true)
			end
		end
	end,
	Play121481123 = function(arg_505_0, arg_505_1)
		arg_505_1.time_ = 0
		arg_505_1.frameCnt_ = 0
		arg_505_1.state_ = "playing"
		arg_505_1.curTalkId_ = 121481123
		arg_505_1.duration_ = 5

		SetActive(arg_505_1.tipsGo_, false)

		function arg_505_1.onSingleLineFinish_()
			arg_505_1.onSingleLineUpdate_ = nil
			arg_505_1.onSingleLineFinish_ = nil
			arg_505_1.state_ = "waiting"
		end

		function arg_505_1.playNext_(arg_507_0)
			if arg_507_0 == 1 then
				arg_505_0:Play121481124(arg_505_1)
			end
		end

		function arg_505_1.onSingleLineUpdate_(arg_508_0)
			local var_508_0 = arg_505_1.actors_["1069ui_story"].transform
			local var_508_1 = 0

			if var_508_1 < arg_505_1.time_ and arg_505_1.time_ <= var_508_1 + arg_508_0 then
				arg_505_1.var_.moveOldPos1069ui_story = var_508_0.localPosition
			end

			local var_508_2 = 0.001

			if var_508_1 <= arg_505_1.time_ and arg_505_1.time_ < var_508_1 + var_508_2 then
				local var_508_3 = (arg_505_1.time_ - var_508_1) / var_508_2
				local var_508_4 = Vector3.New(0, 100, 0)

				var_508_0.localPosition = Vector3.Lerp(arg_505_1.var_.moveOldPos1069ui_story, var_508_4, var_508_3)

				local var_508_5 = manager.ui.mainCamera.transform.position - var_508_0.position

				var_508_0.forward = Vector3.New(var_508_5.x, var_508_5.y, var_508_5.z)

				local var_508_6 = var_508_0.localEulerAngles

				var_508_6.z = 0
				var_508_6.x = 0
				var_508_0.localEulerAngles = var_508_6
			end

			if arg_505_1.time_ >= var_508_1 + var_508_2 and arg_505_1.time_ < var_508_1 + var_508_2 + arg_508_0 then
				var_508_0.localPosition = Vector3.New(0, 100, 0)

				local var_508_7 = manager.ui.mainCamera.transform.position - var_508_0.position

				var_508_0.forward = Vector3.New(var_508_7.x, var_508_7.y, var_508_7.z)

				local var_508_8 = var_508_0.localEulerAngles

				var_508_8.z = 0
				var_508_8.x = 0
				var_508_0.localEulerAngles = var_508_8
			end

			local var_508_9 = arg_505_1.actors_["1069ui_story"]
			local var_508_10 = 0

			if var_508_10 < arg_505_1.time_ and arg_505_1.time_ <= var_508_10 + arg_508_0 and arg_505_1.var_.characterEffect1069ui_story == nil then
				arg_505_1.var_.characterEffect1069ui_story = var_508_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_508_11 = 0.200000002980232

			if var_508_10 <= arg_505_1.time_ and arg_505_1.time_ < var_508_10 + var_508_11 then
				local var_508_12 = (arg_505_1.time_ - var_508_10) / var_508_11

				if arg_505_1.var_.characterEffect1069ui_story then
					local var_508_13 = Mathf.Lerp(0, 0.5, var_508_12)

					arg_505_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_505_1.var_.characterEffect1069ui_story.fillRatio = var_508_13
				end
			end

			if arg_505_1.time_ >= var_508_10 + var_508_11 and arg_505_1.time_ < var_508_10 + var_508_11 + arg_508_0 and arg_505_1.var_.characterEffect1069ui_story then
				local var_508_14 = 0.5

				arg_505_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_505_1.var_.characterEffect1069ui_story.fillRatio = var_508_14
			end

			local var_508_15 = 0
			local var_508_16 = 0.775

			if var_508_15 < arg_505_1.time_ and arg_505_1.time_ <= var_508_15 + arg_508_0 then
				arg_505_1.talkMaxDuration = 0
				arg_505_1.dialogCg_.alpha = 1

				arg_505_1.dialog_:SetActive(true)
				SetActive(arg_505_1.leftNameGo_, false)

				arg_505_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_505_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_505_1:RecordName(arg_505_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_505_1.iconTrs_.gameObject, false)
				arg_505_1.callingController_:SetSelectedState("normal")

				local var_508_17 = arg_505_1:GetWordFromCfg(121481123)
				local var_508_18 = arg_505_1:FormatText(var_508_17.content)

				arg_505_1.text_.text = var_508_18

				LuaForUtil.ClearLinePrefixSymbol(arg_505_1.text_)

				local var_508_19 = 31
				local var_508_20 = utf8.len(var_508_18)
				local var_508_21 = var_508_19 <= 0 and var_508_16 or var_508_16 * (var_508_20 / var_508_19)

				if var_508_21 > 0 and var_508_16 < var_508_21 then
					arg_505_1.talkMaxDuration = var_508_21

					if var_508_21 + var_508_15 > arg_505_1.duration_ then
						arg_505_1.duration_ = var_508_21 + var_508_15
					end
				end

				arg_505_1.text_.text = var_508_18
				arg_505_1.typewritter.percent = 0

				arg_505_1.typewritter:SetDirty()
				arg_505_1:ShowNextGo(false)
				arg_505_1:RecordContent(arg_505_1.text_.text)
			end

			local var_508_22 = math.max(var_508_16, arg_505_1.talkMaxDuration)

			if var_508_15 <= arg_505_1.time_ and arg_505_1.time_ < var_508_15 + var_508_22 then
				arg_505_1.typewritter.percent = (arg_505_1.time_ - var_508_15) / var_508_22

				arg_505_1.typewritter:SetDirty()
			end

			if arg_505_1.time_ >= var_508_15 + var_508_22 and arg_505_1.time_ < var_508_15 + var_508_22 + arg_508_0 then
				arg_505_1.typewritter.percent = 1

				arg_505_1.typewritter:SetDirty()
				arg_505_1:ShowNextGo(true)
			end
		end
	end,
	Play121481124 = function(arg_509_0, arg_509_1)
		arg_509_1.time_ = 0
		arg_509_1.frameCnt_ = 0
		arg_509_1.state_ = "playing"
		arg_509_1.curTalkId_ = 121481124
		arg_509_1.duration_ = 9.866

		local var_509_0 = {
			ja = 5.633,
			ko = 9.866,
			zh = 9.866
		}
		local var_509_1 = manager.audio:GetLocalizationFlag()

		if var_509_0[var_509_1] ~= nil then
			arg_509_1.duration_ = var_509_0[var_509_1]
		end

		SetActive(arg_509_1.tipsGo_, false)

		function arg_509_1.onSingleLineFinish_()
			arg_509_1.onSingleLineUpdate_ = nil
			arg_509_1.onSingleLineFinish_ = nil
			arg_509_1.state_ = "waiting"
		end

		function arg_509_1.playNext_(arg_511_0)
			if arg_511_0 == 1 then
				arg_509_0:Play121481125(arg_509_1)
			end
		end

		function arg_509_1.onSingleLineUpdate_(arg_512_0)
			local var_512_0 = arg_509_1.actors_["1069ui_story"].transform
			local var_512_1 = 0

			if var_512_1 < arg_509_1.time_ and arg_509_1.time_ <= var_512_1 + arg_512_0 then
				arg_509_1.var_.moveOldPos1069ui_story = var_512_0.localPosition
			end

			local var_512_2 = 0.001

			if var_512_1 <= arg_509_1.time_ and arg_509_1.time_ < var_512_1 + var_512_2 then
				local var_512_3 = (arg_509_1.time_ - var_512_1) / var_512_2
				local var_512_4 = Vector3.New(0.7, -1, -6)

				var_512_0.localPosition = Vector3.Lerp(arg_509_1.var_.moveOldPos1069ui_story, var_512_4, var_512_3)

				local var_512_5 = manager.ui.mainCamera.transform.position - var_512_0.position

				var_512_0.forward = Vector3.New(var_512_5.x, var_512_5.y, var_512_5.z)

				local var_512_6 = var_512_0.localEulerAngles

				var_512_6.z = 0
				var_512_6.x = 0
				var_512_0.localEulerAngles = var_512_6
			end

			if arg_509_1.time_ >= var_512_1 + var_512_2 and arg_509_1.time_ < var_512_1 + var_512_2 + arg_512_0 then
				var_512_0.localPosition = Vector3.New(0.7, -1, -6)

				local var_512_7 = manager.ui.mainCamera.transform.position - var_512_0.position

				var_512_0.forward = Vector3.New(var_512_7.x, var_512_7.y, var_512_7.z)

				local var_512_8 = var_512_0.localEulerAngles

				var_512_8.z = 0
				var_512_8.x = 0
				var_512_0.localEulerAngles = var_512_8
			end

			local var_512_9 = arg_509_1.actors_["1069ui_story"]
			local var_512_10 = 0

			if var_512_10 < arg_509_1.time_ and arg_509_1.time_ <= var_512_10 + arg_512_0 and arg_509_1.var_.characterEffect1069ui_story == nil then
				arg_509_1.var_.characterEffect1069ui_story = var_512_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_512_11 = 0.200000002980232

			if var_512_10 <= arg_509_1.time_ and arg_509_1.time_ < var_512_10 + var_512_11 then
				local var_512_12 = (arg_509_1.time_ - var_512_10) / var_512_11

				if arg_509_1.var_.characterEffect1069ui_story then
					arg_509_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_509_1.time_ >= var_512_10 + var_512_11 and arg_509_1.time_ < var_512_10 + var_512_11 + arg_512_0 and arg_509_1.var_.characterEffect1069ui_story then
				arg_509_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_512_13 = 0

			if var_512_13 < arg_509_1.time_ and arg_509_1.time_ <= var_512_13 + arg_512_0 then
				arg_509_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action2_1")
			end

			local var_512_14 = 0

			if var_512_14 < arg_509_1.time_ and arg_509_1.time_ <= var_512_14 + arg_512_0 then
				arg_509_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_512_15 = arg_509_1.actors_["10045ui_story"].transform
			local var_512_16 = 0

			if var_512_16 < arg_509_1.time_ and arg_509_1.time_ <= var_512_16 + arg_512_0 then
				arg_509_1.var_.moveOldPos10045ui_story = var_512_15.localPosition
			end

			local var_512_17 = 0.001

			if var_512_16 <= arg_509_1.time_ and arg_509_1.time_ < var_512_16 + var_512_17 then
				local var_512_18 = (arg_509_1.time_ - var_512_16) / var_512_17
				local var_512_19 = Vector3.New(-0.7, -1.18, -6.05)

				var_512_15.localPosition = Vector3.Lerp(arg_509_1.var_.moveOldPos10045ui_story, var_512_19, var_512_18)

				local var_512_20 = manager.ui.mainCamera.transform.position - var_512_15.position

				var_512_15.forward = Vector3.New(var_512_20.x, var_512_20.y, var_512_20.z)

				local var_512_21 = var_512_15.localEulerAngles

				var_512_21.z = 0
				var_512_21.x = 0
				var_512_15.localEulerAngles = var_512_21
			end

			if arg_509_1.time_ >= var_512_16 + var_512_17 and arg_509_1.time_ < var_512_16 + var_512_17 + arg_512_0 then
				var_512_15.localPosition = Vector3.New(-0.7, -1.18, -6.05)

				local var_512_22 = manager.ui.mainCamera.transform.position - var_512_15.position

				var_512_15.forward = Vector3.New(var_512_22.x, var_512_22.y, var_512_22.z)

				local var_512_23 = var_512_15.localEulerAngles

				var_512_23.z = 0
				var_512_23.x = 0
				var_512_15.localEulerAngles = var_512_23
			end

			local var_512_24 = arg_509_1.actors_["10045ui_story"]
			local var_512_25 = 0

			if var_512_25 < arg_509_1.time_ and arg_509_1.time_ <= var_512_25 + arg_512_0 and arg_509_1.var_.characterEffect10045ui_story == nil then
				arg_509_1.var_.characterEffect10045ui_story = var_512_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_512_26 = 0.200000002980232

			if var_512_25 <= arg_509_1.time_ and arg_509_1.time_ < var_512_25 + var_512_26 then
				local var_512_27 = (arg_509_1.time_ - var_512_25) / var_512_26

				if arg_509_1.var_.characterEffect10045ui_story then
					local var_512_28 = Mathf.Lerp(0, 0.5, var_512_27)

					arg_509_1.var_.characterEffect10045ui_story.fillFlat = true
					arg_509_1.var_.characterEffect10045ui_story.fillRatio = var_512_28
				end
			end

			if arg_509_1.time_ >= var_512_25 + var_512_26 and arg_509_1.time_ < var_512_25 + var_512_26 + arg_512_0 and arg_509_1.var_.characterEffect10045ui_story then
				local var_512_29 = 0.5

				arg_509_1.var_.characterEffect10045ui_story.fillFlat = true
				arg_509_1.var_.characterEffect10045ui_story.fillRatio = var_512_29
			end

			local var_512_30 = 0

			if var_512_30 < arg_509_1.time_ and arg_509_1.time_ <= var_512_30 + arg_512_0 then
				arg_509_1:PlayTimeline("10045ui_story", "StoryTimeline/CharAction/story10045/story10045action/10045action7_2")
			end

			local var_512_31 = 0
			local var_512_32 = 1.05

			if var_512_31 < arg_509_1.time_ and arg_509_1.time_ <= var_512_31 + arg_512_0 then
				arg_509_1.talkMaxDuration = 0
				arg_509_1.dialogCg_.alpha = 1

				arg_509_1.dialog_:SetActive(true)
				SetActive(arg_509_1.leftNameGo_, true)

				local var_512_33 = arg_509_1:FormatText(StoryNameCfg[378].name)

				arg_509_1.leftNameTxt_.text = var_512_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_509_1.leftNameTxt_.transform)

				arg_509_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_509_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_509_1:RecordName(arg_509_1.leftNameTxt_.text)
				SetActive(arg_509_1.iconTrs_.gameObject, false)
				arg_509_1.callingController_:SetSelectedState("normal")

				local var_512_34 = arg_509_1:GetWordFromCfg(121481124)
				local var_512_35 = arg_509_1:FormatText(var_512_34.content)

				arg_509_1.text_.text = var_512_35

				LuaForUtil.ClearLinePrefixSymbol(arg_509_1.text_)

				local var_512_36 = 42
				local var_512_37 = utf8.len(var_512_35)
				local var_512_38 = var_512_36 <= 0 and var_512_32 or var_512_32 * (var_512_37 / var_512_36)

				if var_512_38 > 0 and var_512_32 < var_512_38 then
					arg_509_1.talkMaxDuration = var_512_38

					if var_512_38 + var_512_31 > arg_509_1.duration_ then
						arg_509_1.duration_ = var_512_38 + var_512_31
					end
				end

				arg_509_1.text_.text = var_512_35
				arg_509_1.typewritter.percent = 0

				arg_509_1.typewritter:SetDirty()
				arg_509_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481124", "story_v_out_121481.awb") ~= 0 then
					local var_512_39 = manager.audio:GetVoiceLength("story_v_out_121481", "121481124", "story_v_out_121481.awb") / 1000

					if var_512_39 + var_512_31 > arg_509_1.duration_ then
						arg_509_1.duration_ = var_512_39 + var_512_31
					end

					if var_512_34.prefab_name ~= "" and arg_509_1.actors_[var_512_34.prefab_name] ~= nil then
						local var_512_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_509_1.actors_[var_512_34.prefab_name].transform, "story_v_out_121481", "121481124", "story_v_out_121481.awb")

						arg_509_1:RecordAudio("121481124", var_512_40)
						arg_509_1:RecordAudio("121481124", var_512_40)
					else
						arg_509_1:AudioAction("play", "voice", "story_v_out_121481", "121481124", "story_v_out_121481.awb")
					end

					arg_509_1:RecordHistoryTalkVoice("story_v_out_121481", "121481124", "story_v_out_121481.awb")
				end

				arg_509_1:RecordContent(arg_509_1.text_.text)
			end

			local var_512_41 = math.max(var_512_32, arg_509_1.talkMaxDuration)

			if var_512_31 <= arg_509_1.time_ and arg_509_1.time_ < var_512_31 + var_512_41 then
				arg_509_1.typewritter.percent = (arg_509_1.time_ - var_512_31) / var_512_41

				arg_509_1.typewritter:SetDirty()
			end

			if arg_509_1.time_ >= var_512_31 + var_512_41 and arg_509_1.time_ < var_512_31 + var_512_41 + arg_512_0 then
				arg_509_1.typewritter.percent = 1

				arg_509_1.typewritter:SetDirty()
				arg_509_1:ShowNextGo(true)
			end
		end
	end,
	Play121481125 = function(arg_513_0, arg_513_1)
		arg_513_1.time_ = 0
		arg_513_1.frameCnt_ = 0
		arg_513_1.state_ = "playing"
		arg_513_1.curTalkId_ = 121481125
		arg_513_1.duration_ = 7.5

		local var_513_0 = {
			ja = 5.366,
			ko = 7.5,
			zh = 7.5
		}
		local var_513_1 = manager.audio:GetLocalizationFlag()

		if var_513_0[var_513_1] ~= nil then
			arg_513_1.duration_ = var_513_0[var_513_1]
		end

		SetActive(arg_513_1.tipsGo_, false)

		function arg_513_1.onSingleLineFinish_()
			arg_513_1.onSingleLineUpdate_ = nil
			arg_513_1.onSingleLineFinish_ = nil
			arg_513_1.state_ = "waiting"
		end

		function arg_513_1.playNext_(arg_515_0)
			if arg_515_0 == 1 then
				arg_513_0:Play121481126(arg_513_1)
			end
		end

		function arg_513_1.onSingleLineUpdate_(arg_516_0)
			local var_516_0 = 0
			local var_516_1 = 0.8

			if var_516_0 < arg_513_1.time_ and arg_513_1.time_ <= var_516_0 + arg_516_0 then
				arg_513_1.talkMaxDuration = 0
				arg_513_1.dialogCg_.alpha = 1

				arg_513_1.dialog_:SetActive(true)
				SetActive(arg_513_1.leftNameGo_, true)

				local var_516_2 = arg_513_1:FormatText(StoryNameCfg[378].name)

				arg_513_1.leftNameTxt_.text = var_516_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_513_1.leftNameTxt_.transform)

				arg_513_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_513_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_513_1:RecordName(arg_513_1.leftNameTxt_.text)
				SetActive(arg_513_1.iconTrs_.gameObject, false)
				arg_513_1.callingController_:SetSelectedState("normal")

				local var_516_3 = arg_513_1:GetWordFromCfg(121481125)
				local var_516_4 = arg_513_1:FormatText(var_516_3.content)

				arg_513_1.text_.text = var_516_4

				LuaForUtil.ClearLinePrefixSymbol(arg_513_1.text_)

				local var_516_5 = 32
				local var_516_6 = utf8.len(var_516_4)
				local var_516_7 = var_516_5 <= 0 and var_516_1 or var_516_1 * (var_516_6 / var_516_5)

				if var_516_7 > 0 and var_516_1 < var_516_7 then
					arg_513_1.talkMaxDuration = var_516_7

					if var_516_7 + var_516_0 > arg_513_1.duration_ then
						arg_513_1.duration_ = var_516_7 + var_516_0
					end
				end

				arg_513_1.text_.text = var_516_4
				arg_513_1.typewritter.percent = 0

				arg_513_1.typewritter:SetDirty()
				arg_513_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481125", "story_v_out_121481.awb") ~= 0 then
					local var_516_8 = manager.audio:GetVoiceLength("story_v_out_121481", "121481125", "story_v_out_121481.awb") / 1000

					if var_516_8 + var_516_0 > arg_513_1.duration_ then
						arg_513_1.duration_ = var_516_8 + var_516_0
					end

					if var_516_3.prefab_name ~= "" and arg_513_1.actors_[var_516_3.prefab_name] ~= nil then
						local var_516_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_513_1.actors_[var_516_3.prefab_name].transform, "story_v_out_121481", "121481125", "story_v_out_121481.awb")

						arg_513_1:RecordAudio("121481125", var_516_9)
						arg_513_1:RecordAudio("121481125", var_516_9)
					else
						arg_513_1:AudioAction("play", "voice", "story_v_out_121481", "121481125", "story_v_out_121481.awb")
					end

					arg_513_1:RecordHistoryTalkVoice("story_v_out_121481", "121481125", "story_v_out_121481.awb")
				end

				arg_513_1:RecordContent(arg_513_1.text_.text)
			end

			local var_516_10 = math.max(var_516_1, arg_513_1.talkMaxDuration)

			if var_516_0 <= arg_513_1.time_ and arg_513_1.time_ < var_516_0 + var_516_10 then
				arg_513_1.typewritter.percent = (arg_513_1.time_ - var_516_0) / var_516_10

				arg_513_1.typewritter:SetDirty()
			end

			if arg_513_1.time_ >= var_516_0 + var_516_10 and arg_513_1.time_ < var_516_0 + var_516_10 + arg_516_0 then
				arg_513_1.typewritter.percent = 1

				arg_513_1.typewritter:SetDirty()
				arg_513_1:ShowNextGo(true)
			end
		end
	end,
	Play121481126 = function(arg_517_0, arg_517_1)
		arg_517_1.time_ = 0
		arg_517_1.frameCnt_ = 0
		arg_517_1.state_ = "playing"
		arg_517_1.curTalkId_ = 121481126
		arg_517_1.duration_ = 7.366

		local var_517_0 = {
			ja = 4.366,
			ko = 7.366,
			zh = 7.366
		}
		local var_517_1 = manager.audio:GetLocalizationFlag()

		if var_517_0[var_517_1] ~= nil then
			arg_517_1.duration_ = var_517_0[var_517_1]
		end

		SetActive(arg_517_1.tipsGo_, false)

		function arg_517_1.onSingleLineFinish_()
			arg_517_1.onSingleLineUpdate_ = nil
			arg_517_1.onSingleLineFinish_ = nil
			arg_517_1.state_ = "waiting"
		end

		function arg_517_1.playNext_(arg_519_0)
			if arg_519_0 == 1 then
				arg_517_0:Play121481127(arg_517_1)
			end
		end

		function arg_517_1.onSingleLineUpdate_(arg_520_0)
			local var_520_0 = arg_517_1.actors_["1069ui_story"]
			local var_520_1 = 0

			if var_520_1 < arg_517_1.time_ and arg_517_1.time_ <= var_520_1 + arg_520_0 and arg_517_1.var_.characterEffect1069ui_story == nil then
				arg_517_1.var_.characterEffect1069ui_story = var_520_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_520_2 = 0.200000002980232

			if var_520_1 <= arg_517_1.time_ and arg_517_1.time_ < var_520_1 + var_520_2 then
				local var_520_3 = (arg_517_1.time_ - var_520_1) / var_520_2

				if arg_517_1.var_.characterEffect1069ui_story then
					local var_520_4 = Mathf.Lerp(0, 0.5, var_520_3)

					arg_517_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_517_1.var_.characterEffect1069ui_story.fillRatio = var_520_4
				end
			end

			if arg_517_1.time_ >= var_520_1 + var_520_2 and arg_517_1.time_ < var_520_1 + var_520_2 + arg_520_0 and arg_517_1.var_.characterEffect1069ui_story then
				local var_520_5 = 0.5

				arg_517_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_517_1.var_.characterEffect1069ui_story.fillRatio = var_520_5
			end

			local var_520_6 = arg_517_1.actors_["10045ui_story"]
			local var_520_7 = 0

			if var_520_7 < arg_517_1.time_ and arg_517_1.time_ <= var_520_7 + arg_520_0 and arg_517_1.var_.characterEffect10045ui_story == nil then
				arg_517_1.var_.characterEffect10045ui_story = var_520_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_520_8 = 0.200000002980232

			if var_520_7 <= arg_517_1.time_ and arg_517_1.time_ < var_520_7 + var_520_8 then
				local var_520_9 = (arg_517_1.time_ - var_520_7) / var_520_8

				if arg_517_1.var_.characterEffect10045ui_story then
					arg_517_1.var_.characterEffect10045ui_story.fillFlat = false
				end
			end

			if arg_517_1.time_ >= var_520_7 + var_520_8 and arg_517_1.time_ < var_520_7 + var_520_8 + arg_520_0 and arg_517_1.var_.characterEffect10045ui_story then
				arg_517_1.var_.characterEffect10045ui_story.fillFlat = false
			end

			local var_520_10 = 0
			local var_520_11 = 0.275

			if var_520_10 < arg_517_1.time_ and arg_517_1.time_ <= var_520_10 + arg_520_0 then
				arg_517_1.talkMaxDuration = 0
				arg_517_1.dialogCg_.alpha = 1

				arg_517_1.dialog_:SetActive(true)
				SetActive(arg_517_1.leftNameGo_, true)

				local var_520_12 = arg_517_1:FormatText(StoryNameCfg[412].name)

				arg_517_1.leftNameTxt_.text = var_520_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_517_1.leftNameTxt_.transform)

				arg_517_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_517_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_517_1:RecordName(arg_517_1.leftNameTxt_.text)
				SetActive(arg_517_1.iconTrs_.gameObject, false)
				arg_517_1.callingController_:SetSelectedState("normal")

				local var_520_13 = arg_517_1:GetWordFromCfg(121481126)
				local var_520_14 = arg_517_1:FormatText(var_520_13.content)

				arg_517_1.text_.text = var_520_14

				LuaForUtil.ClearLinePrefixSymbol(arg_517_1.text_)

				local var_520_15 = 11
				local var_520_16 = utf8.len(var_520_14)
				local var_520_17 = var_520_15 <= 0 and var_520_11 or var_520_11 * (var_520_16 / var_520_15)

				if var_520_17 > 0 and var_520_11 < var_520_17 then
					arg_517_1.talkMaxDuration = var_520_17

					if var_520_17 + var_520_10 > arg_517_1.duration_ then
						arg_517_1.duration_ = var_520_17 + var_520_10
					end
				end

				arg_517_1.text_.text = var_520_14
				arg_517_1.typewritter.percent = 0

				arg_517_1.typewritter:SetDirty()
				arg_517_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481126", "story_v_out_121481.awb") ~= 0 then
					local var_520_18 = manager.audio:GetVoiceLength("story_v_out_121481", "121481126", "story_v_out_121481.awb") / 1000

					if var_520_18 + var_520_10 > arg_517_1.duration_ then
						arg_517_1.duration_ = var_520_18 + var_520_10
					end

					if var_520_13.prefab_name ~= "" and arg_517_1.actors_[var_520_13.prefab_name] ~= nil then
						local var_520_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_517_1.actors_[var_520_13.prefab_name].transform, "story_v_out_121481", "121481126", "story_v_out_121481.awb")

						arg_517_1:RecordAudio("121481126", var_520_19)
						arg_517_1:RecordAudio("121481126", var_520_19)
					else
						arg_517_1:AudioAction("play", "voice", "story_v_out_121481", "121481126", "story_v_out_121481.awb")
					end

					arg_517_1:RecordHistoryTalkVoice("story_v_out_121481", "121481126", "story_v_out_121481.awb")
				end

				arg_517_1:RecordContent(arg_517_1.text_.text)
			end

			local var_520_20 = math.max(var_520_11, arg_517_1.talkMaxDuration)

			if var_520_10 <= arg_517_1.time_ and arg_517_1.time_ < var_520_10 + var_520_20 then
				arg_517_1.typewritter.percent = (arg_517_1.time_ - var_520_10) / var_520_20

				arg_517_1.typewritter:SetDirty()
			end

			if arg_517_1.time_ >= var_520_10 + var_520_20 and arg_517_1.time_ < var_520_10 + var_520_20 + arg_520_0 then
				arg_517_1.typewritter.percent = 1

				arg_517_1.typewritter:SetDirty()
				arg_517_1:ShowNextGo(true)
			end
		end
	end,
	Play121481127 = function(arg_521_0, arg_521_1)
		arg_521_1.time_ = 0
		arg_521_1.frameCnt_ = 0
		arg_521_1.state_ = "playing"
		arg_521_1.curTalkId_ = 121481127
		arg_521_1.duration_ = 11.466

		local var_521_0 = {
			ja = 11.466,
			ko = 6.5,
			zh = 6.5
		}
		local var_521_1 = manager.audio:GetLocalizationFlag()

		if var_521_0[var_521_1] ~= nil then
			arg_521_1.duration_ = var_521_0[var_521_1]
		end

		SetActive(arg_521_1.tipsGo_, false)

		function arg_521_1.onSingleLineFinish_()
			arg_521_1.onSingleLineUpdate_ = nil
			arg_521_1.onSingleLineFinish_ = nil
			arg_521_1.state_ = "waiting"
		end

		function arg_521_1.playNext_(arg_523_0)
			if arg_523_0 == 1 then
				arg_521_0:Play121481128(arg_521_1)
			end
		end

		function arg_521_1.onSingleLineUpdate_(arg_524_0)
			local var_524_0 = arg_521_1.actors_["1069ui_story"]
			local var_524_1 = 0

			if var_524_1 < arg_521_1.time_ and arg_521_1.time_ <= var_524_1 + arg_524_0 and arg_521_1.var_.characterEffect1069ui_story == nil then
				arg_521_1.var_.characterEffect1069ui_story = var_524_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_524_2 = 0.200000002980232

			if var_524_1 <= arg_521_1.time_ and arg_521_1.time_ < var_524_1 + var_524_2 then
				local var_524_3 = (arg_521_1.time_ - var_524_1) / var_524_2

				if arg_521_1.var_.characterEffect1069ui_story then
					arg_521_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_521_1.time_ >= var_524_1 + var_524_2 and arg_521_1.time_ < var_524_1 + var_524_2 + arg_524_0 and arg_521_1.var_.characterEffect1069ui_story then
				arg_521_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_524_4 = arg_521_1.actors_["10045ui_story"]
			local var_524_5 = 0

			if var_524_5 < arg_521_1.time_ and arg_521_1.time_ <= var_524_5 + arg_524_0 and arg_521_1.var_.characterEffect10045ui_story == nil then
				arg_521_1.var_.characterEffect10045ui_story = var_524_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_524_6 = 0.200000002980232

			if var_524_5 <= arg_521_1.time_ and arg_521_1.time_ < var_524_5 + var_524_6 then
				local var_524_7 = (arg_521_1.time_ - var_524_5) / var_524_6

				if arg_521_1.var_.characterEffect10045ui_story then
					local var_524_8 = Mathf.Lerp(0, 0.5, var_524_7)

					arg_521_1.var_.characterEffect10045ui_story.fillFlat = true
					arg_521_1.var_.characterEffect10045ui_story.fillRatio = var_524_8
				end
			end

			if arg_521_1.time_ >= var_524_5 + var_524_6 and arg_521_1.time_ < var_524_5 + var_524_6 + arg_524_0 and arg_521_1.var_.characterEffect10045ui_story then
				local var_524_9 = 0.5

				arg_521_1.var_.characterEffect10045ui_story.fillFlat = true
				arg_521_1.var_.characterEffect10045ui_story.fillRatio = var_524_9
			end

			local var_524_10 = 0
			local var_524_11 = 0.725

			if var_524_10 < arg_521_1.time_ and arg_521_1.time_ <= var_524_10 + arg_524_0 then
				arg_521_1.talkMaxDuration = 0
				arg_521_1.dialogCg_.alpha = 1

				arg_521_1.dialog_:SetActive(true)
				SetActive(arg_521_1.leftNameGo_, true)

				local var_524_12 = arg_521_1:FormatText(StoryNameCfg[378].name)

				arg_521_1.leftNameTxt_.text = var_524_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_521_1.leftNameTxt_.transform)

				arg_521_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_521_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_521_1:RecordName(arg_521_1.leftNameTxt_.text)
				SetActive(arg_521_1.iconTrs_.gameObject, false)
				arg_521_1.callingController_:SetSelectedState("normal")

				local var_524_13 = arg_521_1:GetWordFromCfg(121481127)
				local var_524_14 = arg_521_1:FormatText(var_524_13.content)

				arg_521_1.text_.text = var_524_14

				LuaForUtil.ClearLinePrefixSymbol(arg_521_1.text_)

				local var_524_15 = 29
				local var_524_16 = utf8.len(var_524_14)
				local var_524_17 = var_524_15 <= 0 and var_524_11 or var_524_11 * (var_524_16 / var_524_15)

				if var_524_17 > 0 and var_524_11 < var_524_17 then
					arg_521_1.talkMaxDuration = var_524_17

					if var_524_17 + var_524_10 > arg_521_1.duration_ then
						arg_521_1.duration_ = var_524_17 + var_524_10
					end
				end

				arg_521_1.text_.text = var_524_14
				arg_521_1.typewritter.percent = 0

				arg_521_1.typewritter:SetDirty()
				arg_521_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481127", "story_v_out_121481.awb") ~= 0 then
					local var_524_18 = manager.audio:GetVoiceLength("story_v_out_121481", "121481127", "story_v_out_121481.awb") / 1000

					if var_524_18 + var_524_10 > arg_521_1.duration_ then
						arg_521_1.duration_ = var_524_18 + var_524_10
					end

					if var_524_13.prefab_name ~= "" and arg_521_1.actors_[var_524_13.prefab_name] ~= nil then
						local var_524_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_521_1.actors_[var_524_13.prefab_name].transform, "story_v_out_121481", "121481127", "story_v_out_121481.awb")

						arg_521_1:RecordAudio("121481127", var_524_19)
						arg_521_1:RecordAudio("121481127", var_524_19)
					else
						arg_521_1:AudioAction("play", "voice", "story_v_out_121481", "121481127", "story_v_out_121481.awb")
					end

					arg_521_1:RecordHistoryTalkVoice("story_v_out_121481", "121481127", "story_v_out_121481.awb")
				end

				arg_521_1:RecordContent(arg_521_1.text_.text)
			end

			local var_524_20 = math.max(var_524_11, arg_521_1.talkMaxDuration)

			if var_524_10 <= arg_521_1.time_ and arg_521_1.time_ < var_524_10 + var_524_20 then
				arg_521_1.typewritter.percent = (arg_521_1.time_ - var_524_10) / var_524_20

				arg_521_1.typewritter:SetDirty()
			end

			if arg_521_1.time_ >= var_524_10 + var_524_20 and arg_521_1.time_ < var_524_10 + var_524_20 + arg_524_0 then
				arg_521_1.typewritter.percent = 1

				arg_521_1.typewritter:SetDirty()
				arg_521_1:ShowNextGo(true)
			end
		end
	end,
	Play121481128 = function(arg_525_0, arg_525_1)
		arg_525_1.time_ = 0
		arg_525_1.frameCnt_ = 0
		arg_525_1.state_ = "playing"
		arg_525_1.curTalkId_ = 121481128
		arg_525_1.duration_ = 5.4

		local var_525_0 = {
			ja = 5.033,
			ko = 5.4,
			zh = 5.4
		}
		local var_525_1 = manager.audio:GetLocalizationFlag()

		if var_525_0[var_525_1] ~= nil then
			arg_525_1.duration_ = var_525_0[var_525_1]
		end

		SetActive(arg_525_1.tipsGo_, false)

		function arg_525_1.onSingleLineFinish_()
			arg_525_1.onSingleLineUpdate_ = nil
			arg_525_1.onSingleLineFinish_ = nil
			arg_525_1.state_ = "waiting"
		end

		function arg_525_1.playNext_(arg_527_0)
			if arg_527_0 == 1 then
				arg_525_0:Play121481129(arg_525_1)
			end
		end

		function arg_525_1.onSingleLineUpdate_(arg_528_0)
			local var_528_0 = arg_525_1.actors_["10045ui_story"].transform
			local var_528_1 = 0

			if var_528_1 < arg_525_1.time_ and arg_525_1.time_ <= var_528_1 + arg_528_0 then
				arg_525_1.var_.moveOldPos10045ui_story = var_528_0.localPosition
			end

			local var_528_2 = 0.001

			if var_528_1 <= arg_525_1.time_ and arg_525_1.time_ < var_528_1 + var_528_2 then
				local var_528_3 = (arg_525_1.time_ - var_528_1) / var_528_2
				local var_528_4 = Vector3.New(0, 100, 0)

				var_528_0.localPosition = Vector3.Lerp(arg_525_1.var_.moveOldPos10045ui_story, var_528_4, var_528_3)

				local var_528_5 = manager.ui.mainCamera.transform.position - var_528_0.position

				var_528_0.forward = Vector3.New(var_528_5.x, var_528_5.y, var_528_5.z)

				local var_528_6 = var_528_0.localEulerAngles

				var_528_6.z = 0
				var_528_6.x = 0
				var_528_0.localEulerAngles = var_528_6
			end

			if arg_525_1.time_ >= var_528_1 + var_528_2 and arg_525_1.time_ < var_528_1 + var_528_2 + arg_528_0 then
				var_528_0.localPosition = Vector3.New(0, 100, 0)

				local var_528_7 = manager.ui.mainCamera.transform.position - var_528_0.position

				var_528_0.forward = Vector3.New(var_528_7.x, var_528_7.y, var_528_7.z)

				local var_528_8 = var_528_0.localEulerAngles

				var_528_8.z = 0
				var_528_8.x = 0
				var_528_0.localEulerAngles = var_528_8
			end

			local var_528_9 = arg_525_1.actors_["1069ui_story"].transform
			local var_528_10 = 0

			if var_528_10 < arg_525_1.time_ and arg_525_1.time_ <= var_528_10 + arg_528_0 then
				arg_525_1.var_.moveOldPos1069ui_story = var_528_9.localPosition
			end

			local var_528_11 = 0.001

			if var_528_10 <= arg_525_1.time_ and arg_525_1.time_ < var_528_10 + var_528_11 then
				local var_528_12 = (arg_525_1.time_ - var_528_10) / var_528_11
				local var_528_13 = Vector3.New(0, 100, 0)

				var_528_9.localPosition = Vector3.Lerp(arg_525_1.var_.moveOldPos1069ui_story, var_528_13, var_528_12)

				local var_528_14 = manager.ui.mainCamera.transform.position - var_528_9.position

				var_528_9.forward = Vector3.New(var_528_14.x, var_528_14.y, var_528_14.z)

				local var_528_15 = var_528_9.localEulerAngles

				var_528_15.z = 0
				var_528_15.x = 0
				var_528_9.localEulerAngles = var_528_15
			end

			if arg_525_1.time_ >= var_528_10 + var_528_11 and arg_525_1.time_ < var_528_10 + var_528_11 + arg_528_0 then
				var_528_9.localPosition = Vector3.New(0, 100, 0)

				local var_528_16 = manager.ui.mainCamera.transform.position - var_528_9.position

				var_528_9.forward = Vector3.New(var_528_16.x, var_528_16.y, var_528_16.z)

				local var_528_17 = var_528_9.localEulerAngles

				var_528_17.z = 0
				var_528_17.x = 0
				var_528_9.localEulerAngles = var_528_17
			end

			local var_528_18 = 0.225
			local var_528_19 = 0.408333333333333

			if var_528_18 < arg_525_1.time_ and arg_525_1.time_ <= var_528_18 + arg_528_0 then
				local var_528_20 = "play"
				local var_528_21 = "effect"

				arg_525_1:AudioAction(var_528_20, var_528_21, "se_story_121_04", "se_story_121_04_bonebreak2", "")
			end

			local var_528_22 = 0
			local var_528_23 = 0.225

			if var_528_22 < arg_525_1.time_ and arg_525_1.time_ <= var_528_22 + arg_528_0 then
				arg_525_1.talkMaxDuration = 0
				arg_525_1.dialogCg_.alpha = 1

				arg_525_1.dialog_:SetActive(true)
				SetActive(arg_525_1.leftNameGo_, true)

				local var_528_24 = arg_525_1:FormatText(StoryNameCfg[412].name)

				arg_525_1.leftNameTxt_.text = var_528_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_525_1.leftNameTxt_.transform)

				arg_525_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_525_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_525_1:RecordName(arg_525_1.leftNameTxt_.text)
				SetActive(arg_525_1.iconTrs_.gameObject, true)
				arg_525_1.iconController_:SetSelectedState("hero")

				arg_525_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10045")

				arg_525_1.callingController_:SetSelectedState("normal")

				local var_528_25 = arg_525_1:GetWordFromCfg(121481128)
				local var_528_26 = arg_525_1:FormatText(var_528_25.content)

				arg_525_1.text_.text = var_528_26

				LuaForUtil.ClearLinePrefixSymbol(arg_525_1.text_)

				local var_528_27 = 9
				local var_528_28 = utf8.len(var_528_26)
				local var_528_29 = var_528_27 <= 0 and var_528_23 or var_528_23 * (var_528_28 / var_528_27)

				if var_528_29 > 0 and var_528_23 < var_528_29 then
					arg_525_1.talkMaxDuration = var_528_29

					if var_528_29 + var_528_22 > arg_525_1.duration_ then
						arg_525_1.duration_ = var_528_29 + var_528_22
					end
				end

				arg_525_1.text_.text = var_528_26
				arg_525_1.typewritter.percent = 0

				arg_525_1.typewritter:SetDirty()
				arg_525_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481128", "story_v_out_121481.awb") ~= 0 then
					local var_528_30 = manager.audio:GetVoiceLength("story_v_out_121481", "121481128", "story_v_out_121481.awb") / 1000

					if var_528_30 + var_528_22 > arg_525_1.duration_ then
						arg_525_1.duration_ = var_528_30 + var_528_22
					end

					if var_528_25.prefab_name ~= "" and arg_525_1.actors_[var_528_25.prefab_name] ~= nil then
						local var_528_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_525_1.actors_[var_528_25.prefab_name].transform, "story_v_out_121481", "121481128", "story_v_out_121481.awb")

						arg_525_1:RecordAudio("121481128", var_528_31)
						arg_525_1:RecordAudio("121481128", var_528_31)
					else
						arg_525_1:AudioAction("play", "voice", "story_v_out_121481", "121481128", "story_v_out_121481.awb")
					end

					arg_525_1:RecordHistoryTalkVoice("story_v_out_121481", "121481128", "story_v_out_121481.awb")
				end

				arg_525_1:RecordContent(arg_525_1.text_.text)
			end

			local var_528_32 = math.max(var_528_23, arg_525_1.talkMaxDuration)

			if var_528_22 <= arg_525_1.time_ and arg_525_1.time_ < var_528_22 + var_528_32 then
				arg_525_1.typewritter.percent = (arg_525_1.time_ - var_528_22) / var_528_32

				arg_525_1.typewritter:SetDirty()
			end

			if arg_525_1.time_ >= var_528_22 + var_528_32 and arg_525_1.time_ < var_528_22 + var_528_32 + arg_528_0 then
				arg_525_1.typewritter.percent = 1

				arg_525_1.typewritter:SetDirty()
				arg_525_1:ShowNextGo(true)
			end
		end
	end,
	Play121481129 = function(arg_529_0, arg_529_1)
		arg_529_1.time_ = 0
		arg_529_1.frameCnt_ = 0
		arg_529_1.state_ = "playing"
		arg_529_1.curTalkId_ = 121481129
		arg_529_1.duration_ = 5

		SetActive(arg_529_1.tipsGo_, false)

		function arg_529_1.onSingleLineFinish_()
			arg_529_1.onSingleLineUpdate_ = nil
			arg_529_1.onSingleLineFinish_ = nil
			arg_529_1.state_ = "waiting"
		end

		function arg_529_1.playNext_(arg_531_0)
			if arg_531_0 == 1 then
				arg_529_0:Play121481130(arg_529_1)
			end
		end

		function arg_529_1.onSingleLineUpdate_(arg_532_0)
			local var_532_0 = 0
			local var_532_1 = 0.475

			if var_532_0 < arg_529_1.time_ and arg_529_1.time_ <= var_532_0 + arg_532_0 then
				arg_529_1.talkMaxDuration = 0
				arg_529_1.dialogCg_.alpha = 1

				arg_529_1.dialog_:SetActive(true)
				SetActive(arg_529_1.leftNameGo_, false)

				arg_529_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_529_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_529_1:RecordName(arg_529_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_529_1.iconTrs_.gameObject, false)
				arg_529_1.callingController_:SetSelectedState("normal")

				local var_532_2 = arg_529_1:GetWordFromCfg(121481129)
				local var_532_3 = arg_529_1:FormatText(var_532_2.content)

				arg_529_1.text_.text = var_532_3

				LuaForUtil.ClearLinePrefixSymbol(arg_529_1.text_)

				local var_532_4 = 19
				local var_532_5 = utf8.len(var_532_3)
				local var_532_6 = var_532_4 <= 0 and var_532_1 or var_532_1 * (var_532_5 / var_532_4)

				if var_532_6 > 0 and var_532_1 < var_532_6 then
					arg_529_1.talkMaxDuration = var_532_6

					if var_532_6 + var_532_0 > arg_529_1.duration_ then
						arg_529_1.duration_ = var_532_6 + var_532_0
					end
				end

				arg_529_1.text_.text = var_532_3
				arg_529_1.typewritter.percent = 0

				arg_529_1.typewritter:SetDirty()
				arg_529_1:ShowNextGo(false)
				arg_529_1:RecordContent(arg_529_1.text_.text)
			end

			local var_532_7 = math.max(var_532_1, arg_529_1.talkMaxDuration)

			if var_532_0 <= arg_529_1.time_ and arg_529_1.time_ < var_532_0 + var_532_7 then
				arg_529_1.typewritter.percent = (arg_529_1.time_ - var_532_0) / var_532_7

				arg_529_1.typewritter:SetDirty()
			end

			if arg_529_1.time_ >= var_532_0 + var_532_7 and arg_529_1.time_ < var_532_0 + var_532_7 + arg_532_0 then
				arg_529_1.typewritter.percent = 1

				arg_529_1.typewritter:SetDirty()
				arg_529_1:ShowNextGo(true)
			end
		end
	end,
	Play121481130 = function(arg_533_0, arg_533_1)
		arg_533_1.time_ = 0
		arg_533_1.frameCnt_ = 0
		arg_533_1.state_ = "playing"
		arg_533_1.curTalkId_ = 121481130
		arg_533_1.duration_ = 8.166

		local var_533_0 = {
			ja = 5.7,
			ko = 8.166,
			zh = 8.166
		}
		local var_533_1 = manager.audio:GetLocalizationFlag()

		if var_533_0[var_533_1] ~= nil then
			arg_533_1.duration_ = var_533_0[var_533_1]
		end

		SetActive(arg_533_1.tipsGo_, false)

		function arg_533_1.onSingleLineFinish_()
			arg_533_1.onSingleLineUpdate_ = nil
			arg_533_1.onSingleLineFinish_ = nil
			arg_533_1.state_ = "waiting"
		end

		function arg_533_1.playNext_(arg_535_0)
			if arg_535_0 == 1 then
				arg_533_0:Play121481131(arg_533_1)
			end
		end

		function arg_533_1.onSingleLineUpdate_(arg_536_0)
			local var_536_0 = arg_533_1.actors_["1069ui_story"].transform
			local var_536_1 = 0

			if var_536_1 < arg_533_1.time_ and arg_533_1.time_ <= var_536_1 + arg_536_0 then
				arg_533_1.var_.moveOldPos1069ui_story = var_536_0.localPosition
			end

			local var_536_2 = 0.001

			if var_536_1 <= arg_533_1.time_ and arg_533_1.time_ < var_536_1 + var_536_2 then
				local var_536_3 = (arg_533_1.time_ - var_536_1) / var_536_2
				local var_536_4 = Vector3.New(0.7, -1, -6)

				var_536_0.localPosition = Vector3.Lerp(arg_533_1.var_.moveOldPos1069ui_story, var_536_4, var_536_3)

				local var_536_5 = manager.ui.mainCamera.transform.position - var_536_0.position

				var_536_0.forward = Vector3.New(var_536_5.x, var_536_5.y, var_536_5.z)

				local var_536_6 = var_536_0.localEulerAngles

				var_536_6.z = 0
				var_536_6.x = 0
				var_536_0.localEulerAngles = var_536_6
			end

			if arg_533_1.time_ >= var_536_1 + var_536_2 and arg_533_1.time_ < var_536_1 + var_536_2 + arg_536_0 then
				var_536_0.localPosition = Vector3.New(0.7, -1, -6)

				local var_536_7 = manager.ui.mainCamera.transform.position - var_536_0.position

				var_536_0.forward = Vector3.New(var_536_7.x, var_536_7.y, var_536_7.z)

				local var_536_8 = var_536_0.localEulerAngles

				var_536_8.z = 0
				var_536_8.x = 0
				var_536_0.localEulerAngles = var_536_8
			end

			local var_536_9 = arg_533_1.actors_["1069ui_story"]
			local var_536_10 = 0

			if var_536_10 < arg_533_1.time_ and arg_533_1.time_ <= var_536_10 + arg_536_0 and arg_533_1.var_.characterEffect1069ui_story == nil then
				arg_533_1.var_.characterEffect1069ui_story = var_536_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_536_11 = 0.200000002980232

			if var_536_10 <= arg_533_1.time_ and arg_533_1.time_ < var_536_10 + var_536_11 then
				local var_536_12 = (arg_533_1.time_ - var_536_10) / var_536_11

				if arg_533_1.var_.characterEffect1069ui_story then
					arg_533_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_533_1.time_ >= var_536_10 + var_536_11 and arg_533_1.time_ < var_536_10 + var_536_11 + arg_536_0 and arg_533_1.var_.characterEffect1069ui_story then
				arg_533_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_536_13 = 0

			if var_536_13 < arg_533_1.time_ and arg_533_1.time_ <= var_536_13 + arg_536_0 then
				arg_533_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069actionlink/1069action423")
			end

			local var_536_14 = 0

			if var_536_14 < arg_533_1.time_ and arg_533_1.time_ <= var_536_14 + arg_536_0 then
				arg_533_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_536_15 = arg_533_1.actors_["10045ui_story"].transform
			local var_536_16 = 0

			if var_536_16 < arg_533_1.time_ and arg_533_1.time_ <= var_536_16 + arg_536_0 then
				arg_533_1.var_.moveOldPos10045ui_story = var_536_15.localPosition
			end

			local var_536_17 = 0.001

			if var_536_16 <= arg_533_1.time_ and arg_533_1.time_ < var_536_16 + var_536_17 then
				local var_536_18 = (arg_533_1.time_ - var_536_16) / var_536_17
				local var_536_19 = Vector3.New(-0.7, -1.18, -6.05)

				var_536_15.localPosition = Vector3.Lerp(arg_533_1.var_.moveOldPos10045ui_story, var_536_19, var_536_18)

				local var_536_20 = manager.ui.mainCamera.transform.position - var_536_15.position

				var_536_15.forward = Vector3.New(var_536_20.x, var_536_20.y, var_536_20.z)

				local var_536_21 = var_536_15.localEulerAngles

				var_536_21.z = 0
				var_536_21.x = 0
				var_536_15.localEulerAngles = var_536_21
			end

			if arg_533_1.time_ >= var_536_16 + var_536_17 and arg_533_1.time_ < var_536_16 + var_536_17 + arg_536_0 then
				var_536_15.localPosition = Vector3.New(-0.7, -1.18, -6.05)

				local var_536_22 = manager.ui.mainCamera.transform.position - var_536_15.position

				var_536_15.forward = Vector3.New(var_536_22.x, var_536_22.y, var_536_22.z)

				local var_536_23 = var_536_15.localEulerAngles

				var_536_23.z = 0
				var_536_23.x = 0
				var_536_15.localEulerAngles = var_536_23
			end

			local var_536_24 = arg_533_1.actors_["10045ui_story"]
			local var_536_25 = 0

			if var_536_25 < arg_533_1.time_ and arg_533_1.time_ <= var_536_25 + arg_536_0 and arg_533_1.var_.characterEffect10045ui_story == nil then
				arg_533_1.var_.characterEffect10045ui_story = var_536_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_536_26 = 0.200000002980232

			if var_536_25 <= arg_533_1.time_ and arg_533_1.time_ < var_536_25 + var_536_26 then
				local var_536_27 = (arg_533_1.time_ - var_536_25) / var_536_26

				if arg_533_1.var_.characterEffect10045ui_story then
					local var_536_28 = Mathf.Lerp(0, 0.5, var_536_27)

					arg_533_1.var_.characterEffect10045ui_story.fillFlat = true
					arg_533_1.var_.characterEffect10045ui_story.fillRatio = var_536_28
				end
			end

			if arg_533_1.time_ >= var_536_25 + var_536_26 and arg_533_1.time_ < var_536_25 + var_536_26 + arg_536_0 and arg_533_1.var_.characterEffect10045ui_story then
				local var_536_29 = 0.5

				arg_533_1.var_.characterEffect10045ui_story.fillFlat = true
				arg_533_1.var_.characterEffect10045ui_story.fillRatio = var_536_29
			end

			local var_536_30 = 0

			if var_536_30 < arg_533_1.time_ and arg_533_1.time_ <= var_536_30 + arg_536_0 then
				arg_533_1:PlayTimeline("10045ui_story", "StoryTimeline/CharAction/story10045/story10045action/10045action7_2")
			end

			local var_536_31 = 0
			local var_536_32 = 0.925

			if var_536_31 < arg_533_1.time_ and arg_533_1.time_ <= var_536_31 + arg_536_0 then
				arg_533_1.talkMaxDuration = 0
				arg_533_1.dialogCg_.alpha = 1

				arg_533_1.dialog_:SetActive(true)
				SetActive(arg_533_1.leftNameGo_, true)

				local var_536_33 = arg_533_1:FormatText(StoryNameCfg[378].name)

				arg_533_1.leftNameTxt_.text = var_536_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_533_1.leftNameTxt_.transform)

				arg_533_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_533_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_533_1:RecordName(arg_533_1.leftNameTxt_.text)
				SetActive(arg_533_1.iconTrs_.gameObject, false)
				arg_533_1.callingController_:SetSelectedState("normal")

				local var_536_34 = arg_533_1:GetWordFromCfg(121481130)
				local var_536_35 = arg_533_1:FormatText(var_536_34.content)

				arg_533_1.text_.text = var_536_35

				LuaForUtil.ClearLinePrefixSymbol(arg_533_1.text_)

				local var_536_36 = 37
				local var_536_37 = utf8.len(var_536_35)
				local var_536_38 = var_536_36 <= 0 and var_536_32 or var_536_32 * (var_536_37 / var_536_36)

				if var_536_38 > 0 and var_536_32 < var_536_38 then
					arg_533_1.talkMaxDuration = var_536_38

					if var_536_38 + var_536_31 > arg_533_1.duration_ then
						arg_533_1.duration_ = var_536_38 + var_536_31
					end
				end

				arg_533_1.text_.text = var_536_35
				arg_533_1.typewritter.percent = 0

				arg_533_1.typewritter:SetDirty()
				arg_533_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481130", "story_v_out_121481.awb") ~= 0 then
					local var_536_39 = manager.audio:GetVoiceLength("story_v_out_121481", "121481130", "story_v_out_121481.awb") / 1000

					if var_536_39 + var_536_31 > arg_533_1.duration_ then
						arg_533_1.duration_ = var_536_39 + var_536_31
					end

					if var_536_34.prefab_name ~= "" and arg_533_1.actors_[var_536_34.prefab_name] ~= nil then
						local var_536_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_533_1.actors_[var_536_34.prefab_name].transform, "story_v_out_121481", "121481130", "story_v_out_121481.awb")

						arg_533_1:RecordAudio("121481130", var_536_40)
						arg_533_1:RecordAudio("121481130", var_536_40)
					else
						arg_533_1:AudioAction("play", "voice", "story_v_out_121481", "121481130", "story_v_out_121481.awb")
					end

					arg_533_1:RecordHistoryTalkVoice("story_v_out_121481", "121481130", "story_v_out_121481.awb")
				end

				arg_533_1:RecordContent(arg_533_1.text_.text)
			end

			local var_536_41 = math.max(var_536_32, arg_533_1.talkMaxDuration)

			if var_536_31 <= arg_533_1.time_ and arg_533_1.time_ < var_536_31 + var_536_41 then
				arg_533_1.typewritter.percent = (arg_533_1.time_ - var_536_31) / var_536_41

				arg_533_1.typewritter:SetDirty()
			end

			if arg_533_1.time_ >= var_536_31 + var_536_41 and arg_533_1.time_ < var_536_31 + var_536_41 + arg_536_0 then
				arg_533_1.typewritter.percent = 1

				arg_533_1.typewritter:SetDirty()
				arg_533_1:ShowNextGo(true)
			end
		end
	end,
	Play121481131 = function(arg_537_0, arg_537_1)
		arg_537_1.time_ = 0
		arg_537_1.frameCnt_ = 0
		arg_537_1.state_ = "playing"
		arg_537_1.curTalkId_ = 121481131
		arg_537_1.duration_ = 11.266

		local var_537_0 = {
			ja = 9.533,
			ko = 11.266,
			zh = 11.266
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
				arg_537_0:Play121481132(arg_537_1)
			end
		end

		function arg_537_1.onSingleLineUpdate_(arg_540_0)
			local var_540_0 = 0
			local var_540_1 = 1.075

			if var_540_0 < arg_537_1.time_ and arg_537_1.time_ <= var_540_0 + arg_540_0 then
				arg_537_1.talkMaxDuration = 0
				arg_537_1.dialogCg_.alpha = 1

				arg_537_1.dialog_:SetActive(true)
				SetActive(arg_537_1.leftNameGo_, true)

				local var_540_2 = arg_537_1:FormatText(StoryNameCfg[378].name)

				arg_537_1.leftNameTxt_.text = var_540_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_537_1.leftNameTxt_.transform)

				arg_537_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_537_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_537_1:RecordName(arg_537_1.leftNameTxt_.text)
				SetActive(arg_537_1.iconTrs_.gameObject, false)
				arg_537_1.callingController_:SetSelectedState("normal")

				local var_540_3 = arg_537_1:GetWordFromCfg(121481131)
				local var_540_4 = arg_537_1:FormatText(var_540_3.content)

				arg_537_1.text_.text = var_540_4

				LuaForUtil.ClearLinePrefixSymbol(arg_537_1.text_)

				local var_540_5 = 43
				local var_540_6 = utf8.len(var_540_4)
				local var_540_7 = var_540_5 <= 0 and var_540_1 or var_540_1 * (var_540_6 / var_540_5)

				if var_540_7 > 0 and var_540_1 < var_540_7 then
					arg_537_1.talkMaxDuration = var_540_7

					if var_540_7 + var_540_0 > arg_537_1.duration_ then
						arg_537_1.duration_ = var_540_7 + var_540_0
					end
				end

				arg_537_1.text_.text = var_540_4
				arg_537_1.typewritter.percent = 0

				arg_537_1.typewritter:SetDirty()
				arg_537_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481131", "story_v_out_121481.awb") ~= 0 then
					local var_540_8 = manager.audio:GetVoiceLength("story_v_out_121481", "121481131", "story_v_out_121481.awb") / 1000

					if var_540_8 + var_540_0 > arg_537_1.duration_ then
						arg_537_1.duration_ = var_540_8 + var_540_0
					end

					if var_540_3.prefab_name ~= "" and arg_537_1.actors_[var_540_3.prefab_name] ~= nil then
						local var_540_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_537_1.actors_[var_540_3.prefab_name].transform, "story_v_out_121481", "121481131", "story_v_out_121481.awb")

						arg_537_1:RecordAudio("121481131", var_540_9)
						arg_537_1:RecordAudio("121481131", var_540_9)
					else
						arg_537_1:AudioAction("play", "voice", "story_v_out_121481", "121481131", "story_v_out_121481.awb")
					end

					arg_537_1:RecordHistoryTalkVoice("story_v_out_121481", "121481131", "story_v_out_121481.awb")
				end

				arg_537_1:RecordContent(arg_537_1.text_.text)
			end

			local var_540_10 = math.max(var_540_1, arg_537_1.talkMaxDuration)

			if var_540_0 <= arg_537_1.time_ and arg_537_1.time_ < var_540_0 + var_540_10 then
				arg_537_1.typewritter.percent = (arg_537_1.time_ - var_540_0) / var_540_10

				arg_537_1.typewritter:SetDirty()
			end

			if arg_537_1.time_ >= var_540_0 + var_540_10 and arg_537_1.time_ < var_540_0 + var_540_10 + arg_540_0 then
				arg_537_1.typewritter.percent = 1

				arg_537_1.typewritter:SetDirty()
				arg_537_1:ShowNextGo(true)
			end
		end
	end,
	Play121481132 = function(arg_541_0, arg_541_1)
		arg_541_1.time_ = 0
		arg_541_1.frameCnt_ = 0
		arg_541_1.state_ = "playing"
		arg_541_1.curTalkId_ = 121481132
		arg_541_1.duration_ = 8

		local var_541_0 = {
			ja = 7.3,
			ko = 8,
			zh = 8
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
				arg_541_0:Play121481133(arg_541_1)
			end
		end

		function arg_541_1.onSingleLineUpdate_(arg_544_0)
			local var_544_0 = arg_541_1.actors_["1069ui_story"]
			local var_544_1 = 0

			if var_544_1 < arg_541_1.time_ and arg_541_1.time_ <= var_544_1 + arg_544_0 and arg_541_1.var_.characterEffect1069ui_story == nil then
				arg_541_1.var_.characterEffect1069ui_story = var_544_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_544_2 = 0.200000002980232

			if var_544_1 <= arg_541_1.time_ and arg_541_1.time_ < var_544_1 + var_544_2 then
				local var_544_3 = (arg_541_1.time_ - var_544_1) / var_544_2

				if arg_541_1.var_.characterEffect1069ui_story then
					local var_544_4 = Mathf.Lerp(0, 0.5, var_544_3)

					arg_541_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_541_1.var_.characterEffect1069ui_story.fillRatio = var_544_4
				end
			end

			if arg_541_1.time_ >= var_544_1 + var_544_2 and arg_541_1.time_ < var_544_1 + var_544_2 + arg_544_0 and arg_541_1.var_.characterEffect1069ui_story then
				local var_544_5 = 0.5

				arg_541_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_541_1.var_.characterEffect1069ui_story.fillRatio = var_544_5
			end

			local var_544_6 = arg_541_1.actors_["10045ui_story"]
			local var_544_7 = 0

			if var_544_7 < arg_541_1.time_ and arg_541_1.time_ <= var_544_7 + arg_544_0 and arg_541_1.var_.characterEffect10045ui_story == nil then
				arg_541_1.var_.characterEffect10045ui_story = var_544_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_544_8 = 0.200000002980232

			if var_544_7 <= arg_541_1.time_ and arg_541_1.time_ < var_544_7 + var_544_8 then
				local var_544_9 = (arg_541_1.time_ - var_544_7) / var_544_8

				if arg_541_1.var_.characterEffect10045ui_story then
					arg_541_1.var_.characterEffect10045ui_story.fillFlat = false
				end
			end

			if arg_541_1.time_ >= var_544_7 + var_544_8 and arg_541_1.time_ < var_544_7 + var_544_8 + arg_544_0 and arg_541_1.var_.characterEffect10045ui_story then
				arg_541_1.var_.characterEffect10045ui_story.fillFlat = false
			end

			local var_544_10 = 0
			local var_544_11 = 0.375

			if var_544_10 < arg_541_1.time_ and arg_541_1.time_ <= var_544_10 + arg_544_0 then
				arg_541_1.talkMaxDuration = 0
				arg_541_1.dialogCg_.alpha = 1

				arg_541_1.dialog_:SetActive(true)
				SetActive(arg_541_1.leftNameGo_, true)

				local var_544_12 = arg_541_1:FormatText(StoryNameCfg[412].name)

				arg_541_1.leftNameTxt_.text = var_544_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_541_1.leftNameTxt_.transform)

				arg_541_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_541_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_541_1:RecordName(arg_541_1.leftNameTxt_.text)
				SetActive(arg_541_1.iconTrs_.gameObject, false)
				arg_541_1.callingController_:SetSelectedState("normal")

				local var_544_13 = arg_541_1:GetWordFromCfg(121481132)
				local var_544_14 = arg_541_1:FormatText(var_544_13.content)

				arg_541_1.text_.text = var_544_14

				LuaForUtil.ClearLinePrefixSymbol(arg_541_1.text_)

				local var_544_15 = 15
				local var_544_16 = utf8.len(var_544_14)
				local var_544_17 = var_544_15 <= 0 and var_544_11 or var_544_11 * (var_544_16 / var_544_15)

				if var_544_17 > 0 and var_544_11 < var_544_17 then
					arg_541_1.talkMaxDuration = var_544_17

					if var_544_17 + var_544_10 > arg_541_1.duration_ then
						arg_541_1.duration_ = var_544_17 + var_544_10
					end
				end

				arg_541_1.text_.text = var_544_14
				arg_541_1.typewritter.percent = 0

				arg_541_1.typewritter:SetDirty()
				arg_541_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481132", "story_v_out_121481.awb") ~= 0 then
					local var_544_18 = manager.audio:GetVoiceLength("story_v_out_121481", "121481132", "story_v_out_121481.awb") / 1000

					if var_544_18 + var_544_10 > arg_541_1.duration_ then
						arg_541_1.duration_ = var_544_18 + var_544_10
					end

					if var_544_13.prefab_name ~= "" and arg_541_1.actors_[var_544_13.prefab_name] ~= nil then
						local var_544_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_541_1.actors_[var_544_13.prefab_name].transform, "story_v_out_121481", "121481132", "story_v_out_121481.awb")

						arg_541_1:RecordAudio("121481132", var_544_19)
						arg_541_1:RecordAudio("121481132", var_544_19)
					else
						arg_541_1:AudioAction("play", "voice", "story_v_out_121481", "121481132", "story_v_out_121481.awb")
					end

					arg_541_1:RecordHistoryTalkVoice("story_v_out_121481", "121481132", "story_v_out_121481.awb")
				end

				arg_541_1:RecordContent(arg_541_1.text_.text)
			end

			local var_544_20 = math.max(var_544_11, arg_541_1.talkMaxDuration)

			if var_544_10 <= arg_541_1.time_ and arg_541_1.time_ < var_544_10 + var_544_20 then
				arg_541_1.typewritter.percent = (arg_541_1.time_ - var_544_10) / var_544_20

				arg_541_1.typewritter:SetDirty()
			end

			if arg_541_1.time_ >= var_544_10 + var_544_20 and arg_541_1.time_ < var_544_10 + var_544_20 + arg_544_0 then
				arg_541_1.typewritter.percent = 1

				arg_541_1.typewritter:SetDirty()
				arg_541_1:ShowNextGo(true)
			end
		end
	end,
	Play121481133 = function(arg_545_0, arg_545_1)
		arg_545_1.time_ = 0
		arg_545_1.frameCnt_ = 0
		arg_545_1.state_ = "playing"
		arg_545_1.curTalkId_ = 121481133
		arg_545_1.duration_ = 7.966

		local var_545_0 = {
			ja = 7.966,
			ko = 5.9,
			zh = 5.9
		}
		local var_545_1 = manager.audio:GetLocalizationFlag()

		if var_545_0[var_545_1] ~= nil then
			arg_545_1.duration_ = var_545_0[var_545_1]
		end

		SetActive(arg_545_1.tipsGo_, false)

		function arg_545_1.onSingleLineFinish_()
			arg_545_1.onSingleLineUpdate_ = nil
			arg_545_1.onSingleLineFinish_ = nil
			arg_545_1.state_ = "waiting"
		end

		function arg_545_1.playNext_(arg_547_0)
			if arg_547_0 == 1 then
				arg_545_0:Play121481134(arg_545_1)
			end
		end

		function arg_545_1.onSingleLineUpdate_(arg_548_0)
			local var_548_0 = arg_545_1.actors_["1069ui_story"]
			local var_548_1 = 0

			if var_548_1 < arg_545_1.time_ and arg_545_1.time_ <= var_548_1 + arg_548_0 and arg_545_1.var_.characterEffect1069ui_story == nil then
				arg_545_1.var_.characterEffect1069ui_story = var_548_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_548_2 = 0.200000002980232

			if var_548_1 <= arg_545_1.time_ and arg_545_1.time_ < var_548_1 + var_548_2 then
				local var_548_3 = (arg_545_1.time_ - var_548_1) / var_548_2

				if arg_545_1.var_.characterEffect1069ui_story then
					arg_545_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_545_1.time_ >= var_548_1 + var_548_2 and arg_545_1.time_ < var_548_1 + var_548_2 + arg_548_0 and arg_545_1.var_.characterEffect1069ui_story then
				arg_545_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_548_4 = arg_545_1.actors_["10045ui_story"]
			local var_548_5 = 0

			if var_548_5 < arg_545_1.time_ and arg_545_1.time_ <= var_548_5 + arg_548_0 and arg_545_1.var_.characterEffect10045ui_story == nil then
				arg_545_1.var_.characterEffect10045ui_story = var_548_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_548_6 = 0.200000002980232

			if var_548_5 <= arg_545_1.time_ and arg_545_1.time_ < var_548_5 + var_548_6 then
				local var_548_7 = (arg_545_1.time_ - var_548_5) / var_548_6

				if arg_545_1.var_.characterEffect10045ui_story then
					local var_548_8 = Mathf.Lerp(0, 0.5, var_548_7)

					arg_545_1.var_.characterEffect10045ui_story.fillFlat = true
					arg_545_1.var_.characterEffect10045ui_story.fillRatio = var_548_8
				end
			end

			if arg_545_1.time_ >= var_548_5 + var_548_6 and arg_545_1.time_ < var_548_5 + var_548_6 + arg_548_0 and arg_545_1.var_.characterEffect10045ui_story then
				local var_548_9 = 0.5

				arg_545_1.var_.characterEffect10045ui_story.fillFlat = true
				arg_545_1.var_.characterEffect10045ui_story.fillRatio = var_548_9
			end

			local var_548_10 = 0

			if var_548_10 < arg_545_1.time_ and arg_545_1.time_ <= var_548_10 + arg_548_0 then
				arg_545_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_548_11 = 0

			if var_548_11 < arg_545_1.time_ and arg_545_1.time_ <= var_548_11 + arg_548_0 then
				arg_545_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069actionlink/1069action432")
			end

			local var_548_12 = 0
			local var_548_13 = 0.5

			if var_548_12 < arg_545_1.time_ and arg_545_1.time_ <= var_548_12 + arg_548_0 then
				arg_545_1.talkMaxDuration = 0
				arg_545_1.dialogCg_.alpha = 1

				arg_545_1.dialog_:SetActive(true)
				SetActive(arg_545_1.leftNameGo_, true)

				local var_548_14 = arg_545_1:FormatText(StoryNameCfg[378].name)

				arg_545_1.leftNameTxt_.text = var_548_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_545_1.leftNameTxt_.transform)

				arg_545_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_545_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_545_1:RecordName(arg_545_1.leftNameTxt_.text)
				SetActive(arg_545_1.iconTrs_.gameObject, false)
				arg_545_1.callingController_:SetSelectedState("normal")

				local var_548_15 = arg_545_1:GetWordFromCfg(121481133)
				local var_548_16 = arg_545_1:FormatText(var_548_15.content)

				arg_545_1.text_.text = var_548_16

				LuaForUtil.ClearLinePrefixSymbol(arg_545_1.text_)

				local var_548_17 = 20
				local var_548_18 = utf8.len(var_548_16)
				local var_548_19 = var_548_17 <= 0 and var_548_13 or var_548_13 * (var_548_18 / var_548_17)

				if var_548_19 > 0 and var_548_13 < var_548_19 then
					arg_545_1.talkMaxDuration = var_548_19

					if var_548_19 + var_548_12 > arg_545_1.duration_ then
						arg_545_1.duration_ = var_548_19 + var_548_12
					end
				end

				arg_545_1.text_.text = var_548_16
				arg_545_1.typewritter.percent = 0

				arg_545_1.typewritter:SetDirty()
				arg_545_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481133", "story_v_out_121481.awb") ~= 0 then
					local var_548_20 = manager.audio:GetVoiceLength("story_v_out_121481", "121481133", "story_v_out_121481.awb") / 1000

					if var_548_20 + var_548_12 > arg_545_1.duration_ then
						arg_545_1.duration_ = var_548_20 + var_548_12
					end

					if var_548_15.prefab_name ~= "" and arg_545_1.actors_[var_548_15.prefab_name] ~= nil then
						local var_548_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_545_1.actors_[var_548_15.prefab_name].transform, "story_v_out_121481", "121481133", "story_v_out_121481.awb")

						arg_545_1:RecordAudio("121481133", var_548_21)
						arg_545_1:RecordAudio("121481133", var_548_21)
					else
						arg_545_1:AudioAction("play", "voice", "story_v_out_121481", "121481133", "story_v_out_121481.awb")
					end

					arg_545_1:RecordHistoryTalkVoice("story_v_out_121481", "121481133", "story_v_out_121481.awb")
				end

				arg_545_1:RecordContent(arg_545_1.text_.text)
			end

			local var_548_22 = math.max(var_548_13, arg_545_1.talkMaxDuration)

			if var_548_12 <= arg_545_1.time_ and arg_545_1.time_ < var_548_12 + var_548_22 then
				arg_545_1.typewritter.percent = (arg_545_1.time_ - var_548_12) / var_548_22

				arg_545_1.typewritter:SetDirty()
			end

			if arg_545_1.time_ >= var_548_12 + var_548_22 and arg_545_1.time_ < var_548_12 + var_548_22 + arg_548_0 then
				arg_545_1.typewritter.percent = 1

				arg_545_1.typewritter:SetDirty()
				arg_545_1:ShowNextGo(true)
			end
		end
	end,
	Play121481134 = function(arg_549_0, arg_549_1)
		arg_549_1.time_ = 0
		arg_549_1.frameCnt_ = 0
		arg_549_1.state_ = "playing"
		arg_549_1.curTalkId_ = 121481134
		arg_549_1.duration_ = 8.233

		local var_549_0 = {
			ja = 5.6,
			ko = 8.233,
			zh = 8.233
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
				arg_549_0:Play121481135(arg_549_1)
			end
		end

		function arg_549_1.onSingleLineUpdate_(arg_552_0)
			local var_552_0 = arg_549_1.actors_["10045ui_story"]
			local var_552_1 = 0

			if var_552_1 < arg_549_1.time_ and arg_549_1.time_ <= var_552_1 + arg_552_0 and arg_549_1.var_.characterEffect10045ui_story == nil then
				arg_549_1.var_.characterEffect10045ui_story = var_552_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_552_2 = 0.200000002980232

			if var_552_1 <= arg_549_1.time_ and arg_549_1.time_ < var_552_1 + var_552_2 then
				local var_552_3 = (arg_549_1.time_ - var_552_1) / var_552_2

				if arg_549_1.var_.characterEffect10045ui_story then
					arg_549_1.var_.characterEffect10045ui_story.fillFlat = false
				end
			end

			if arg_549_1.time_ >= var_552_1 + var_552_2 and arg_549_1.time_ < var_552_1 + var_552_2 + arg_552_0 and arg_549_1.var_.characterEffect10045ui_story then
				arg_549_1.var_.characterEffect10045ui_story.fillFlat = false
			end

			local var_552_4 = arg_549_1.actors_["1069ui_story"]
			local var_552_5 = 0

			if var_552_5 < arg_549_1.time_ and arg_549_1.time_ <= var_552_5 + arg_552_0 and arg_549_1.var_.characterEffect1069ui_story == nil then
				arg_549_1.var_.characterEffect1069ui_story = var_552_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_552_6 = 0.200000002980232

			if var_552_5 <= arg_549_1.time_ and arg_549_1.time_ < var_552_5 + var_552_6 then
				local var_552_7 = (arg_549_1.time_ - var_552_5) / var_552_6

				if arg_549_1.var_.characterEffect1069ui_story then
					local var_552_8 = Mathf.Lerp(0, 0.5, var_552_7)

					arg_549_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_549_1.var_.characterEffect1069ui_story.fillRatio = var_552_8
				end
			end

			if arg_549_1.time_ >= var_552_5 + var_552_6 and arg_549_1.time_ < var_552_5 + var_552_6 + arg_552_0 and arg_549_1.var_.characterEffect1069ui_story then
				local var_552_9 = 0.5

				arg_549_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_549_1.var_.characterEffect1069ui_story.fillRatio = var_552_9
			end

			local var_552_10 = 0
			local var_552_11 = 0.525

			if var_552_10 < arg_549_1.time_ and arg_549_1.time_ <= var_552_10 + arg_552_0 then
				arg_549_1.talkMaxDuration = 0
				arg_549_1.dialogCg_.alpha = 1

				arg_549_1.dialog_:SetActive(true)
				SetActive(arg_549_1.leftNameGo_, true)

				local var_552_12 = arg_549_1:FormatText(StoryNameCfg[412].name)

				arg_549_1.leftNameTxt_.text = var_552_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_549_1.leftNameTxt_.transform)

				arg_549_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_549_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_549_1:RecordName(arg_549_1.leftNameTxt_.text)
				SetActive(arg_549_1.iconTrs_.gameObject, false)
				arg_549_1.callingController_:SetSelectedState("normal")

				local var_552_13 = arg_549_1:GetWordFromCfg(121481134)
				local var_552_14 = arg_549_1:FormatText(var_552_13.content)

				arg_549_1.text_.text = var_552_14

				LuaForUtil.ClearLinePrefixSymbol(arg_549_1.text_)

				local var_552_15 = 21
				local var_552_16 = utf8.len(var_552_14)
				local var_552_17 = var_552_15 <= 0 and var_552_11 or var_552_11 * (var_552_16 / var_552_15)

				if var_552_17 > 0 and var_552_11 < var_552_17 then
					arg_549_1.talkMaxDuration = var_552_17

					if var_552_17 + var_552_10 > arg_549_1.duration_ then
						arg_549_1.duration_ = var_552_17 + var_552_10
					end
				end

				arg_549_1.text_.text = var_552_14
				arg_549_1.typewritter.percent = 0

				arg_549_1.typewritter:SetDirty()
				arg_549_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_121481", "121481134", "story_v_out_121481.awb") ~= 0 then
					local var_552_18 = manager.audio:GetVoiceLength("story_v_out_121481", "121481134", "story_v_out_121481.awb") / 1000

					if var_552_18 + var_552_10 > arg_549_1.duration_ then
						arg_549_1.duration_ = var_552_18 + var_552_10
					end

					if var_552_13.prefab_name ~= "" and arg_549_1.actors_[var_552_13.prefab_name] ~= nil then
						local var_552_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_549_1.actors_[var_552_13.prefab_name].transform, "story_v_out_121481", "121481134", "story_v_out_121481.awb")

						arg_549_1:RecordAudio("121481134", var_552_19)
						arg_549_1:RecordAudio("121481134", var_552_19)
					else
						arg_549_1:AudioAction("play", "voice", "story_v_out_121481", "121481134", "story_v_out_121481.awb")
					end

					arg_549_1:RecordHistoryTalkVoice("story_v_out_121481", "121481134", "story_v_out_121481.awb")
				end

				arg_549_1:RecordContent(arg_549_1.text_.text)
			end

			local var_552_20 = math.max(var_552_11, arg_549_1.talkMaxDuration)

			if var_552_10 <= arg_549_1.time_ and arg_549_1.time_ < var_552_10 + var_552_20 then
				arg_549_1.typewritter.percent = (arg_549_1.time_ - var_552_10) / var_552_20

				arg_549_1.typewritter:SetDirty()
			end

			if arg_549_1.time_ >= var_552_10 + var_552_20 and arg_549_1.time_ < var_552_10 + var_552_20 + arg_552_0 then
				arg_549_1.typewritter.percent = 1

				arg_549_1.typewritter:SetDirty()
				arg_549_1:ShowNextGo(true)
			end
		end
	end,
	Play121481135 = function(arg_553_0, arg_553_1)
		arg_553_1.time_ = 0
		arg_553_1.frameCnt_ = 0
		arg_553_1.state_ = "playing"
		arg_553_1.curTalkId_ = 121481135
		arg_553_1.duration_ = 7

		SetActive(arg_553_1.tipsGo_, false)

		function arg_553_1.onSingleLineFinish_()
			arg_553_1.onSingleLineUpdate_ = nil
			arg_553_1.onSingleLineFinish_ = nil
			arg_553_1.state_ = "waiting"
		end

		function arg_553_1.playNext_(arg_555_0)
			if arg_555_0 == 1 then
				arg_553_0:Play121481136(arg_553_1)
			end
		end

		function arg_553_1.onSingleLineUpdate_(arg_556_0)
			local var_556_0 = arg_553_1.actors_["1069ui_story"].transform
			local var_556_1 = 0

			if var_556_1 < arg_553_1.time_ and arg_553_1.time_ <= var_556_1 + arg_556_0 then
				arg_553_1.var_.moveOldPos1069ui_story = var_556_0.localPosition
			end

			local var_556_2 = 0.001

			if var_556_1 <= arg_553_1.time_ and arg_553_1.time_ < var_556_1 + var_556_2 then
				local var_556_3 = (arg_553_1.time_ - var_556_1) / var_556_2
				local var_556_4 = Vector3.New(0, 100, 0)

				var_556_0.localPosition = Vector3.Lerp(arg_553_1.var_.moveOldPos1069ui_story, var_556_4, var_556_3)

				local var_556_5 = manager.ui.mainCamera.transform.position - var_556_0.position

				var_556_0.forward = Vector3.New(var_556_5.x, var_556_5.y, var_556_5.z)

				local var_556_6 = var_556_0.localEulerAngles

				var_556_6.z = 0
				var_556_6.x = 0
				var_556_0.localEulerAngles = var_556_6
			end

			if arg_553_1.time_ >= var_556_1 + var_556_2 and arg_553_1.time_ < var_556_1 + var_556_2 + arg_556_0 then
				var_556_0.localPosition = Vector3.New(0, 100, 0)

				local var_556_7 = manager.ui.mainCamera.transform.position - var_556_0.position

				var_556_0.forward = Vector3.New(var_556_7.x, var_556_7.y, var_556_7.z)

				local var_556_8 = var_556_0.localEulerAngles

				var_556_8.z = 0
				var_556_8.x = 0
				var_556_0.localEulerAngles = var_556_8
			end

			local var_556_9 = arg_553_1.actors_["1069ui_story"]
			local var_556_10 = 0

			if var_556_10 < arg_553_1.time_ and arg_553_1.time_ <= var_556_10 + arg_556_0 and arg_553_1.var_.characterEffect1069ui_story == nil then
				arg_553_1.var_.characterEffect1069ui_story = var_556_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_556_11 = 0.200000002980232

			if var_556_10 <= arg_553_1.time_ and arg_553_1.time_ < var_556_10 + var_556_11 then
				local var_556_12 = (arg_553_1.time_ - var_556_10) / var_556_11

				if arg_553_1.var_.characterEffect1069ui_story then
					local var_556_13 = Mathf.Lerp(0, 0.5, var_556_12)

					arg_553_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_553_1.var_.characterEffect1069ui_story.fillRatio = var_556_13
				end
			end

			if arg_553_1.time_ >= var_556_10 + var_556_11 and arg_553_1.time_ < var_556_10 + var_556_11 + arg_556_0 and arg_553_1.var_.characterEffect1069ui_story then
				local var_556_14 = 0.5

				arg_553_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_553_1.var_.characterEffect1069ui_story.fillRatio = var_556_14
			end

			local var_556_15 = arg_553_1.actors_["10045ui_story"].transform
			local var_556_16 = 0

			if var_556_16 < arg_553_1.time_ and arg_553_1.time_ <= var_556_16 + arg_556_0 then
				arg_553_1.var_.moveOldPos10045ui_story = var_556_15.localPosition
			end

			local var_556_17 = 0.001

			if var_556_16 <= arg_553_1.time_ and arg_553_1.time_ < var_556_16 + var_556_17 then
				local var_556_18 = (arg_553_1.time_ - var_556_16) / var_556_17
				local var_556_19 = Vector3.New(0, 100, 0)

				var_556_15.localPosition = Vector3.Lerp(arg_553_1.var_.moveOldPos10045ui_story, var_556_19, var_556_18)

				local var_556_20 = manager.ui.mainCamera.transform.position - var_556_15.position

				var_556_15.forward = Vector3.New(var_556_20.x, var_556_20.y, var_556_20.z)

				local var_556_21 = var_556_15.localEulerAngles

				var_556_21.z = 0
				var_556_21.x = 0
				var_556_15.localEulerAngles = var_556_21
			end

			if arg_553_1.time_ >= var_556_16 + var_556_17 and arg_553_1.time_ < var_556_16 + var_556_17 + arg_556_0 then
				var_556_15.localPosition = Vector3.New(0, 100, 0)

				local var_556_22 = manager.ui.mainCamera.transform.position - var_556_15.position

				var_556_15.forward = Vector3.New(var_556_22.x, var_556_22.y, var_556_22.z)

				local var_556_23 = var_556_15.localEulerAngles

				var_556_23.z = 0
				var_556_23.x = 0
				var_556_15.localEulerAngles = var_556_23
			end

			local var_556_24 = arg_553_1.actors_["10045ui_story"]
			local var_556_25 = 0

			if var_556_25 < arg_553_1.time_ and arg_553_1.time_ <= var_556_25 + arg_556_0 and arg_553_1.var_.characterEffect10045ui_story == nil then
				arg_553_1.var_.characterEffect10045ui_story = var_556_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_556_26 = 0.200000002980232

			if var_556_25 <= arg_553_1.time_ and arg_553_1.time_ < var_556_25 + var_556_26 then
				local var_556_27 = (arg_553_1.time_ - var_556_25) / var_556_26

				if arg_553_1.var_.characterEffect10045ui_story then
					local var_556_28 = Mathf.Lerp(0, 0.5, var_556_27)

					arg_553_1.var_.characterEffect10045ui_story.fillFlat = true
					arg_553_1.var_.characterEffect10045ui_story.fillRatio = var_556_28
				end
			end

			if arg_553_1.time_ >= var_556_25 + var_556_26 and arg_553_1.time_ < var_556_25 + var_556_26 + arg_556_0 and arg_553_1.var_.characterEffect10045ui_story then
				local var_556_29 = 0.5

				arg_553_1.var_.characterEffect10045ui_story.fillFlat = true
				arg_553_1.var_.characterEffect10045ui_story.fillRatio = var_556_29
			end

			local var_556_30 = 0

			if var_556_30 < arg_553_1.time_ and arg_553_1.time_ <= var_556_30 + arg_556_0 then
				arg_553_1.mask_.enabled = true
				arg_553_1.mask_.raycastTarget = true

				arg_553_1:SetGaussion(false)
			end

			local var_556_31 = 2

			if var_556_30 <= arg_553_1.time_ and arg_553_1.time_ < var_556_30 + var_556_31 then
				local var_556_32 = (arg_553_1.time_ - var_556_30) / var_556_31
				local var_556_33 = Color.New(1, 1, 1)

				var_556_33.a = Mathf.Lerp(1, 0, var_556_32)
				arg_553_1.mask_.color = var_556_33
			end

			if arg_553_1.time_ >= var_556_30 + var_556_31 and arg_553_1.time_ < var_556_30 + var_556_31 + arg_556_0 then
				local var_556_34 = Color.New(1, 1, 1)
				local var_556_35 = 0

				arg_553_1.mask_.enabled = false
				var_556_34.a = var_556_35
				arg_553_1.mask_.color = var_556_34
			end

			local var_556_36 = manager.ui.mainCamera.transform
			local var_556_37 = 0.9

			if var_556_37 < arg_553_1.time_ and arg_553_1.time_ <= var_556_37 + arg_556_0 then
				arg_553_1.var_.shakeOldPos = var_556_36.localPosition
			end

			local var_556_38 = 1.1

			if var_556_37 <= arg_553_1.time_ and arg_553_1.time_ < var_556_37 + var_556_38 then
				local var_556_39 = (arg_553_1.time_ - var_556_37) / 0.066
				local var_556_40, var_556_41 = math.modf(var_556_39)

				var_556_36.localPosition = Vector3.New(var_556_41 * 0.13, var_556_41 * 0.13, var_556_41 * 0.13) + arg_553_1.var_.shakeOldPos
			end

			if arg_553_1.time_ >= var_556_37 + var_556_38 and arg_553_1.time_ < var_556_37 + var_556_38 + arg_556_0 then
				var_556_36.localPosition = arg_553_1.var_.shakeOldPos
			end

			local var_556_42 = 0.5
			local var_556_43 = 0.633333333333333

			if var_556_42 < arg_553_1.time_ and arg_553_1.time_ <= var_556_42 + arg_556_0 then
				local var_556_44 = "play"
				local var_556_45 = "effect"

				arg_553_1:AudioAction(var_556_44, var_556_45, "se_story_121_04", "se_story_121_04_headbreak", "")
			end

			if arg_553_1.frameCnt_ <= 1 then
				arg_553_1.dialog_:SetActive(false)
			end

			local var_556_46 = 2
			local var_556_47 = 1.325

			if var_556_46 < arg_553_1.time_ and arg_553_1.time_ <= var_556_46 + arg_556_0 then
				arg_553_1.talkMaxDuration = 0

				arg_553_1.dialog_:SetActive(true)

				local var_556_48 = LeanTween.value(arg_553_1.dialog_, 0, 1, 0.3)

				var_556_48:setOnUpdate(LuaHelper.FloatAction(function(arg_557_0)
					arg_553_1.dialogCg_.alpha = arg_557_0
				end))
				var_556_48:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_553_1.dialog_)
					var_556_48:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_553_1.duration_ = arg_553_1.duration_ + 0.3

				SetActive(arg_553_1.leftNameGo_, false)

				arg_553_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_553_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_553_1:RecordName(arg_553_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_553_1.iconTrs_.gameObject, false)
				arg_553_1.callingController_:SetSelectedState("normal")

				local var_556_49 = arg_553_1:GetWordFromCfg(121481135)
				local var_556_50 = arg_553_1:FormatText(var_556_49.content)

				arg_553_1.text_.text = var_556_50

				LuaForUtil.ClearLinePrefixSymbol(arg_553_1.text_)

				local var_556_51 = 53
				local var_556_52 = utf8.len(var_556_50)
				local var_556_53 = var_556_51 <= 0 and var_556_47 or var_556_47 * (var_556_52 / var_556_51)

				if var_556_53 > 0 and var_556_47 < var_556_53 then
					arg_553_1.talkMaxDuration = var_556_53
					var_556_46 = var_556_46 + 0.3

					if var_556_53 + var_556_46 > arg_553_1.duration_ then
						arg_553_1.duration_ = var_556_53 + var_556_46
					end
				end

				arg_553_1.text_.text = var_556_50
				arg_553_1.typewritter.percent = 0

				arg_553_1.typewritter:SetDirty()
				arg_553_1:ShowNextGo(false)
				arg_553_1:RecordContent(arg_553_1.text_.text)
			end

			local var_556_54 = var_556_46 + 0.3
			local var_556_55 = math.max(var_556_47, arg_553_1.talkMaxDuration)

			if var_556_54 <= arg_553_1.time_ and arg_553_1.time_ < var_556_54 + var_556_55 then
				arg_553_1.typewritter.percent = (arg_553_1.time_ - var_556_54) / var_556_55

				arg_553_1.typewritter:SetDirty()
			end

			if arg_553_1.time_ >= var_556_54 + var_556_55 and arg_553_1.time_ < var_556_54 + var_556_55 + arg_556_0 then
				arg_553_1.typewritter.percent = 1

				arg_553_1.typewritter:SetDirty()
				arg_553_1:ShowNextGo(true)
			end
		end
	end,
	Play121481136 = function(arg_559_0, arg_559_1)
		arg_559_1.time_ = 0
		arg_559_1.frameCnt_ = 0
		arg_559_1.state_ = "playing"
		arg_559_1.curTalkId_ = 121481136
		arg_559_1.duration_ = 5

		SetActive(arg_559_1.tipsGo_, false)

		function arg_559_1.onSingleLineFinish_()
			arg_559_1.onSingleLineUpdate_ = nil
			arg_559_1.onSingleLineFinish_ = nil
			arg_559_1.state_ = "waiting"
		end

		function arg_559_1.playNext_(arg_561_0)
			if arg_561_0 == 1 then
				arg_559_0:Play121481137(arg_559_1)
			end
		end

		function arg_559_1.onSingleLineUpdate_(arg_562_0)
			local var_562_0 = 0
			local var_562_1 = 0.633333333333333

			if var_562_0 < arg_559_1.time_ and arg_559_1.time_ <= var_562_0 + arg_562_0 then
				local var_562_2 = "play"
				local var_562_3 = "effect"

				arg_559_1:AudioAction(var_562_2, var_562_3, "se_story_121_04", "se_story_121_04_monsteranergy", "")
			end

			local var_562_4 = 0
			local var_562_5 = 1.425

			if var_562_4 < arg_559_1.time_ and arg_559_1.time_ <= var_562_4 + arg_562_0 then
				arg_559_1.talkMaxDuration = 0
				arg_559_1.dialogCg_.alpha = 1

				arg_559_1.dialog_:SetActive(true)
				SetActive(arg_559_1.leftNameGo_, false)

				arg_559_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_559_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_559_1:RecordName(arg_559_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_559_1.iconTrs_.gameObject, false)
				arg_559_1.callingController_:SetSelectedState("normal")

				local var_562_6 = arg_559_1:GetWordFromCfg(121481136)
				local var_562_7 = arg_559_1:FormatText(var_562_6.content)

				arg_559_1.text_.text = var_562_7

				LuaForUtil.ClearLinePrefixSymbol(arg_559_1.text_)

				local var_562_8 = 57
				local var_562_9 = utf8.len(var_562_7)
				local var_562_10 = var_562_8 <= 0 and var_562_5 or var_562_5 * (var_562_9 / var_562_8)

				if var_562_10 > 0 and var_562_5 < var_562_10 then
					arg_559_1.talkMaxDuration = var_562_10

					if var_562_10 + var_562_4 > arg_559_1.duration_ then
						arg_559_1.duration_ = var_562_10 + var_562_4
					end
				end

				arg_559_1.text_.text = var_562_7
				arg_559_1.typewritter.percent = 0

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(false)
				arg_559_1:RecordContent(arg_559_1.text_.text)
			end

			local var_562_11 = math.max(var_562_5, arg_559_1.talkMaxDuration)

			if var_562_4 <= arg_559_1.time_ and arg_559_1.time_ < var_562_4 + var_562_11 then
				arg_559_1.typewritter.percent = (arg_559_1.time_ - var_562_4) / var_562_11

				arg_559_1.typewritter:SetDirty()
			end

			if arg_559_1.time_ >= var_562_4 + var_562_11 and arg_559_1.time_ < var_562_4 + var_562_11 + arg_562_0 then
				arg_559_1.typewritter.percent = 1

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(true)
			end
		end
	end,
	Play121481137 = function(arg_563_0, arg_563_1)
		arg_563_1.time_ = 0
		arg_563_1.frameCnt_ = 0
		arg_563_1.state_ = "playing"
		arg_563_1.curTalkId_ = 121481137
		arg_563_1.duration_ = 5

		SetActive(arg_563_1.tipsGo_, false)

		function arg_563_1.onSingleLineFinish_()
			arg_563_1.onSingleLineUpdate_ = nil
			arg_563_1.onSingleLineFinish_ = nil
			arg_563_1.state_ = "waiting"
			arg_563_1.auto_ = false
		end

		function arg_563_1.playNext_(arg_565_0)
			arg_563_1.onStoryFinished_()
		end

		function arg_563_1.onSingleLineUpdate_(arg_566_0)
			local var_566_0 = 0
			local var_566_1 = 1.4

			if var_566_0 < arg_563_1.time_ and arg_563_1.time_ <= var_566_0 + arg_566_0 then
				arg_563_1.talkMaxDuration = 0
				arg_563_1.dialogCg_.alpha = 1

				arg_563_1.dialog_:SetActive(true)
				SetActive(arg_563_1.leftNameGo_, false)

				arg_563_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_563_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_563_1:RecordName(arg_563_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_563_1.iconTrs_.gameObject, false)
				arg_563_1.callingController_:SetSelectedState("normal")

				local var_566_2 = arg_563_1:GetWordFromCfg(121481137)
				local var_566_3 = arg_563_1:FormatText(var_566_2.content)

				arg_563_1.text_.text = var_566_3

				LuaForUtil.ClearLinePrefixSymbol(arg_563_1.text_)

				local var_566_4 = 56
				local var_566_5 = utf8.len(var_566_3)
				local var_566_6 = var_566_4 <= 0 and var_566_1 or var_566_1 * (var_566_5 / var_566_4)

				if var_566_6 > 0 and var_566_1 < var_566_6 then
					arg_563_1.talkMaxDuration = var_566_6

					if var_566_6 + var_566_0 > arg_563_1.duration_ then
						arg_563_1.duration_ = var_566_6 + var_566_0
					end
				end

				arg_563_1.text_.text = var_566_3
				arg_563_1.typewritter.percent = 0

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(false)
				arg_563_1:RecordContent(arg_563_1.text_.text)
			end

			local var_566_7 = math.max(var_566_1, arg_563_1.talkMaxDuration)

			if var_566_0 <= arg_563_1.time_ and arg_563_1.time_ < var_566_0 + var_566_7 then
				arg_563_1.typewritter.percent = (arg_563_1.time_ - var_566_0) / var_566_7

				arg_563_1.typewritter:SetDirty()
			end

			if arg_563_1.time_ >= var_566_0 + var_566_7 and arg_563_1.time_ < var_566_0 + var_566_7 + arg_566_0 then
				arg_563_1.typewritter.percent = 1

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST41",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST31",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST42",
		"Assets/UIResources/UI_AB/TextureConfig/Background/J02h"
	},
	voices = {
		"story_v_out_121481.awb"
	}
}
