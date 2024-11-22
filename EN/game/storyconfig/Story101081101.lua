return {
	Play108111001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 108111001
		arg_1_1.duration_ = 13.066

		local var_1_0 = {
			ja = 12.666,
			ko = 11.533,
			zh = 13.066,
			en = 9.1
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
				arg_1_0:Play108111002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "S0805"

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
				local var_4_5 = arg_1_1.bgs_.S0805

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
					if iter_4_0 ~= "S0805" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = arg_1_1.bgs_.S0805
			local var_4_17 = 0

			if var_4_17 < arg_1_1.time_ and arg_1_1.time_ <= var_4_17 + arg_4_0 then
				local var_4_18 = var_4_16:GetComponent("SpriteRenderer")

				if var_4_18 then
					var_4_18.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_19 = var_4_18.material
					local var_4_20 = var_4_19:GetColor("_Color")

					arg_1_1.var_.alphaOldValueS0805 = var_4_20.a
					arg_1_1.var_.alphaMatValueS0805 = var_4_19
				end

				arg_1_1.var_.alphaOldValueS0805 = 0
			end

			local var_4_21 = 1.5

			if var_4_17 <= arg_1_1.time_ and arg_1_1.time_ < var_4_17 + var_4_21 then
				local var_4_22 = (arg_1_1.time_ - var_4_17) / var_4_21
				local var_4_23 = Mathf.Lerp(arg_1_1.var_.alphaOldValueS0805, 1, var_4_22)

				if arg_1_1.var_.alphaMatValueS0805 then
					local var_4_24 = arg_1_1.var_.alphaMatValueS0805
					local var_4_25 = var_4_24:GetColor("_Color")

					var_4_25.a = var_4_23

					var_4_24:SetColor("_Color", var_4_25)
				end
			end

			if arg_1_1.time_ >= var_4_17 + var_4_21 and arg_1_1.time_ < var_4_17 + var_4_21 + arg_4_0 and arg_1_1.var_.alphaMatValueS0805 then
				local var_4_26 = arg_1_1.var_.alphaMatValueS0805
				local var_4_27 = var_4_26:GetColor("_Color")

				var_4_27.a = 1

				var_4_26:SetColor("_Color", var_4_27)
			end

			local var_4_28 = arg_1_1.bgs_.S0805.transform
			local var_4_29 = 0

			if var_4_29 < arg_1_1.time_ and arg_1_1.time_ <= var_4_29 + arg_4_0 then
				arg_1_1.var_.moveOldPosS0805 = var_4_28.localPosition
			end

			local var_4_30 = 6

			if var_4_29 <= arg_1_1.time_ and arg_1_1.time_ < var_4_29 + var_4_30 then
				local var_4_31 = (arg_1_1.time_ - var_4_29) / var_4_30
				local var_4_32 = Vector3.New(0, 1, 9.5)

				var_4_28.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPosS0805, var_4_32, var_4_31)
			end

			if arg_1_1.time_ >= var_4_29 + var_4_30 and arg_1_1.time_ < var_4_29 + var_4_30 + arg_4_0 then
				var_4_28.localPosition = Vector3.New(0, 1, 9.5)
			end

			local var_4_33 = 0
			local var_4_34 = 1

			if var_4_33 < arg_1_1.time_ and arg_1_1.time_ <= var_4_33 + arg_4_0 then
				local var_4_35 = "play"
				local var_4_36 = "music"

				arg_1_1:AudioAction(var_4_35, var_4_36, "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_37 = 2
			local var_4_38 = 0.975

			if var_4_37 < arg_1_1.time_ and arg_1_1.time_ <= var_4_37 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_39 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_39:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_39:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_39:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_40 = arg_1_1:FormatText(StoryNameCfg[80].name)

				arg_1_1.leftNameTxt_.text = var_4_40

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_41 = arg_1_1:GetWordFromCfg(108111001)
				local var_4_42 = arg_1_1:FormatText(var_4_41.content)

				arg_1_1.text_.text = var_4_42

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_43 = 39
				local var_4_44 = utf8.len(var_4_42)
				local var_4_45 = var_4_43 <= 0 and var_4_38 or var_4_38 * (var_4_44 / var_4_43)

				if var_4_45 > 0 and var_4_38 < var_4_45 then
					arg_1_1.talkMaxDuration = var_4_45
					var_4_37 = var_4_37 + 0.3

					if var_4_45 + var_4_37 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_45 + var_4_37
					end
				end

				arg_1_1.text_.text = var_4_42
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_108111", "108111001", "story_v_out_108111.awb") ~= 0 then
					local var_4_46 = manager.audio:GetVoiceLength("story_v_out_108111", "108111001", "story_v_out_108111.awb") / 1000

					if var_4_46 + var_4_37 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_46 + var_4_37
					end

					if var_4_41.prefab_name ~= "" and arg_1_1.actors_[var_4_41.prefab_name] ~= nil then
						local var_4_47 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_41.prefab_name].transform, "story_v_out_108111", "108111001", "story_v_out_108111.awb")

						arg_1_1:RecordAudio("108111001", var_4_47)
						arg_1_1:RecordAudio("108111001", var_4_47)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_108111", "108111001", "story_v_out_108111.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_108111", "108111001", "story_v_out_108111.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_48 = var_4_37 + 0.3
			local var_4_49 = math.max(var_4_38, arg_1_1.talkMaxDuration)

			if var_4_48 <= arg_1_1.time_ and arg_1_1.time_ < var_4_48 + var_4_49 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_48) / var_4_49

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_48 + var_4_49 and arg_1_1.time_ < var_4_48 + var_4_49 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play108111002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 108111002
		arg_7_1.duration_ = 6.9

		local var_7_0 = {
			ja = 6.766,
			ko = 3.866,
			zh = 5.9,
			en = 6.9
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
				arg_7_0:Play108111003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.7

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_2 = arg_7_1:FormatText(StoryNameCfg[80].name)

				arg_7_1.leftNameTxt_.text = var_10_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_3 = arg_7_1:GetWordFromCfg(108111002)
				local var_10_4 = arg_7_1:FormatText(var_10_3.content)

				arg_7_1.text_.text = var_10_4

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_5 = 28
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

				if manager.audio:GetVoiceLength("story_v_out_108111", "108111002", "story_v_out_108111.awb") ~= 0 then
					local var_10_8 = manager.audio:GetVoiceLength("story_v_out_108111", "108111002", "story_v_out_108111.awb") / 1000

					if var_10_8 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_8 + var_10_0
					end

					if var_10_3.prefab_name ~= "" and arg_7_1.actors_[var_10_3.prefab_name] ~= nil then
						local var_10_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_3.prefab_name].transform, "story_v_out_108111", "108111002", "story_v_out_108111.awb")

						arg_7_1:RecordAudio("108111002", var_10_9)
						arg_7_1:RecordAudio("108111002", var_10_9)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_108111", "108111002", "story_v_out_108111.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_108111", "108111002", "story_v_out_108111.awb")
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
	Play108111003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 108111003
		arg_11_1.duration_ = 9.466

		local var_11_0 = {
			ja = 8.2,
			ko = 9.466,
			zh = 6.4,
			en = 6.2
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
				arg_11_0:Play108111004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 0.575

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_2 = arg_11_1:FormatText(StoryNameCfg[161].name)

				arg_11_1.leftNameTxt_.text = var_14_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_3 = arg_11_1:GetWordFromCfg(108111003)
				local var_14_4 = arg_11_1:FormatText(var_14_3.content)

				arg_11_1.text_.text = var_14_4

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_5 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_108111", "108111003", "story_v_out_108111.awb") ~= 0 then
					local var_14_8 = manager.audio:GetVoiceLength("story_v_out_108111", "108111003", "story_v_out_108111.awb") / 1000

					if var_14_8 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_8 + var_14_0
					end

					if var_14_3.prefab_name ~= "" and arg_11_1.actors_[var_14_3.prefab_name] ~= nil then
						local var_14_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_3.prefab_name].transform, "story_v_out_108111", "108111003", "story_v_out_108111.awb")

						arg_11_1:RecordAudio("108111003", var_14_9)
						arg_11_1:RecordAudio("108111003", var_14_9)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_108111", "108111003", "story_v_out_108111.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_108111", "108111003", "story_v_out_108111.awb")
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
	Play108111004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 108111004
		arg_15_1.duration_ = 6.433

		local var_15_0 = {
			ja = 6.433,
			ko = 5.6,
			zh = 6.333,
			en = 3.766
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
				arg_15_0:Play108111005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 0.65

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_2 = arg_15_1:FormatText(StoryNameCfg[161].name)

				arg_15_1.leftNameTxt_.text = var_18_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_3 = arg_15_1:GetWordFromCfg(108111004)
				local var_18_4 = arg_15_1:FormatText(var_18_3.content)

				arg_15_1.text_.text = var_18_4

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_5 = 26
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

				if manager.audio:GetVoiceLength("story_v_out_108111", "108111004", "story_v_out_108111.awb") ~= 0 then
					local var_18_8 = manager.audio:GetVoiceLength("story_v_out_108111", "108111004", "story_v_out_108111.awb") / 1000

					if var_18_8 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_8 + var_18_0
					end

					if var_18_3.prefab_name ~= "" and arg_15_1.actors_[var_18_3.prefab_name] ~= nil then
						local var_18_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_3.prefab_name].transform, "story_v_out_108111", "108111004", "story_v_out_108111.awb")

						arg_15_1:RecordAudio("108111004", var_18_9)
						arg_15_1:RecordAudio("108111004", var_18_9)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_108111", "108111004", "story_v_out_108111.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_108111", "108111004", "story_v_out_108111.awb")
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
	Play108111005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 108111005
		arg_19_1.duration_ = 4.433

		local var_19_0 = {
			ja = 0.833,
			ko = 0.6,
			zh = 4.433,
			en = 1
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
				arg_19_0:Play108111006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 0.05

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_2 = arg_19_1:FormatText(StoryNameCfg[80].name)

				arg_19_1.leftNameTxt_.text = var_22_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_3 = arg_19_1:GetWordFromCfg(108111005)
				local var_22_4 = arg_19_1:FormatText(var_22_3.content)

				arg_19_1.text_.text = var_22_4

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_5 = 2
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

				if manager.audio:GetVoiceLength("story_v_out_108111", "108111005", "story_v_out_108111.awb") ~= 0 then
					local var_22_8 = manager.audio:GetVoiceLength("story_v_out_108111", "108111005", "story_v_out_108111.awb") / 1000

					if var_22_8 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_8 + var_22_0
					end

					if var_22_3.prefab_name ~= "" and arg_19_1.actors_[var_22_3.prefab_name] ~= nil then
						local var_22_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_3.prefab_name].transform, "story_v_out_108111", "108111005", "story_v_out_108111.awb")

						arg_19_1:RecordAudio("108111005", var_22_9)
						arg_19_1:RecordAudio("108111005", var_22_9)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_108111", "108111005", "story_v_out_108111.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_108111", "108111005", "story_v_out_108111.awb")
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
	Play108111006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 108111006
		arg_23_1.duration_ = 5.633

		local var_23_0 = {
			ja = 5.233,
			ko = 5.633,
			zh = 5.6,
			en = 5.566
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
				arg_23_0:Play108111007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 0.625

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_2 = arg_23_1:FormatText(StoryNameCfg[80].name)

				arg_23_1.leftNameTxt_.text = var_26_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_3 = arg_23_1:GetWordFromCfg(108111006)
				local var_26_4 = arg_23_1:FormatText(var_26_3.content)

				arg_23_1.text_.text = var_26_4

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_5 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_108111", "108111006", "story_v_out_108111.awb") ~= 0 then
					local var_26_8 = manager.audio:GetVoiceLength("story_v_out_108111", "108111006", "story_v_out_108111.awb") / 1000

					if var_26_8 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_8 + var_26_0
					end

					if var_26_3.prefab_name ~= "" and arg_23_1.actors_[var_26_3.prefab_name] ~= nil then
						local var_26_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_3.prefab_name].transform, "story_v_out_108111", "108111006", "story_v_out_108111.awb")

						arg_23_1:RecordAudio("108111006", var_26_9)
						arg_23_1:RecordAudio("108111006", var_26_9)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_108111", "108111006", "story_v_out_108111.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_108111", "108111006", "story_v_out_108111.awb")
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
	Play108111007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 108111007
		arg_27_1.duration_ = 2.1

		local var_27_0 = {
			ja = 2.1,
			ko = 1.1,
			zh = 1.4,
			en = 1.233
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
				arg_27_0:Play108111008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0
			local var_30_1 = 0.075

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_2 = arg_27_1:FormatText(StoryNameCfg[161].name)

				arg_27_1.leftNameTxt_.text = var_30_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_3 = arg_27_1:GetWordFromCfg(108111007)
				local var_30_4 = arg_27_1:FormatText(var_30_3.content)

				arg_27_1.text_.text = var_30_4

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_5 = 3
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

				if manager.audio:GetVoiceLength("story_v_out_108111", "108111007", "story_v_out_108111.awb") ~= 0 then
					local var_30_8 = manager.audio:GetVoiceLength("story_v_out_108111", "108111007", "story_v_out_108111.awb") / 1000

					if var_30_8 + var_30_0 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_8 + var_30_0
					end

					if var_30_3.prefab_name ~= "" and arg_27_1.actors_[var_30_3.prefab_name] ~= nil then
						local var_30_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_3.prefab_name].transform, "story_v_out_108111", "108111007", "story_v_out_108111.awb")

						arg_27_1:RecordAudio("108111007", var_30_9)
						arg_27_1:RecordAudio("108111007", var_30_9)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_108111", "108111007", "story_v_out_108111.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_108111", "108111007", "story_v_out_108111.awb")
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
	Play108111008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 108111008
		arg_31_1.duration_ = 13.066

		local var_31_0 = {
			ja = 13.066,
			ko = 9.1,
			zh = 10.1,
			en = 12.4
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
				arg_31_0:Play108111009(arg_31_1)
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

				local var_34_2 = arg_31_1:FormatText(StoryNameCfg[161].name)

				arg_31_1.leftNameTxt_.text = var_34_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_3 = arg_31_1:GetWordFromCfg(108111008)
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

				if manager.audio:GetVoiceLength("story_v_out_108111", "108111008", "story_v_out_108111.awb") ~= 0 then
					local var_34_8 = manager.audio:GetVoiceLength("story_v_out_108111", "108111008", "story_v_out_108111.awb") / 1000

					if var_34_8 + var_34_0 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_8 + var_34_0
					end

					if var_34_3.prefab_name ~= "" and arg_31_1.actors_[var_34_3.prefab_name] ~= nil then
						local var_34_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_3.prefab_name].transform, "story_v_out_108111", "108111008", "story_v_out_108111.awb")

						arg_31_1:RecordAudio("108111008", var_34_9)
						arg_31_1:RecordAudio("108111008", var_34_9)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_108111", "108111008", "story_v_out_108111.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_108111", "108111008", "story_v_out_108111.awb")
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
	Play108111009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 108111009
		arg_35_1.duration_ = 4.433

		local var_35_0 = {
			ja = 1.6,
			ko = 0.6,
			zh = 4.433,
			en = 2.833
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
				arg_35_0:Play108111010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 0.05

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_2 = arg_35_1:FormatText(StoryNameCfg[80].name)

				arg_35_1.leftNameTxt_.text = var_38_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_3 = arg_35_1:GetWordFromCfg(108111009)
				local var_38_4 = arg_35_1:FormatText(var_38_3.content)

				arg_35_1.text_.text = var_38_4

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_5 = 2
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

				if manager.audio:GetVoiceLength("story_v_out_108111", "108111009", "story_v_out_108111.awb") ~= 0 then
					local var_38_8 = manager.audio:GetVoiceLength("story_v_out_108111", "108111009", "story_v_out_108111.awb") / 1000

					if var_38_8 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_8 + var_38_0
					end

					if var_38_3.prefab_name ~= "" and arg_35_1.actors_[var_38_3.prefab_name] ~= nil then
						local var_38_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_3.prefab_name].transform, "story_v_out_108111", "108111009", "story_v_out_108111.awb")

						arg_35_1:RecordAudio("108111009", var_38_9)
						arg_35_1:RecordAudio("108111009", var_38_9)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_108111", "108111009", "story_v_out_108111.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_108111", "108111009", "story_v_out_108111.awb")
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
	Play108111010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 108111010
		arg_39_1.duration_ = 2.8

		local var_39_0 = {
			ja = 1.7,
			ko = 2.466,
			zh = 2.333,
			en = 2.8
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
				arg_39_0:Play108111011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0
			local var_42_1 = 0.2

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_2 = arg_39_1:FormatText(StoryNameCfg[80].name)

				arg_39_1.leftNameTxt_.text = var_42_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_3 = arg_39_1:GetWordFromCfg(108111010)
				local var_42_4 = arg_39_1:FormatText(var_42_3.content)

				arg_39_1.text_.text = var_42_4

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_5 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_108111", "108111010", "story_v_out_108111.awb") ~= 0 then
					local var_42_8 = manager.audio:GetVoiceLength("story_v_out_108111", "108111010", "story_v_out_108111.awb") / 1000

					if var_42_8 + var_42_0 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_8 + var_42_0
					end

					if var_42_3.prefab_name ~= "" and arg_39_1.actors_[var_42_3.prefab_name] ~= nil then
						local var_42_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_3.prefab_name].transform, "story_v_out_108111", "108111010", "story_v_out_108111.awb")

						arg_39_1:RecordAudio("108111010", var_42_9)
						arg_39_1:RecordAudio("108111010", var_42_9)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_108111", "108111010", "story_v_out_108111.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_108111", "108111010", "story_v_out_108111.awb")
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
	Play108111011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 108111011
		arg_43_1.duration_ = 16.9

		local var_43_0 = {
			ja = 16.9,
			ko = 9.233,
			zh = 9.466,
			en = 7.3
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
				arg_43_0:Play108111012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0
			local var_46_1 = 0.625

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_2 = arg_43_1:FormatText(StoryNameCfg[161].name)

				arg_43_1.leftNameTxt_.text = var_46_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_3 = arg_43_1:GetWordFromCfg(108111011)
				local var_46_4 = arg_43_1:FormatText(var_46_3.content)

				arg_43_1.text_.text = var_46_4

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_5 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_108111", "108111011", "story_v_out_108111.awb") ~= 0 then
					local var_46_8 = manager.audio:GetVoiceLength("story_v_out_108111", "108111011", "story_v_out_108111.awb") / 1000

					if var_46_8 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_8 + var_46_0
					end

					if var_46_3.prefab_name ~= "" and arg_43_1.actors_[var_46_3.prefab_name] ~= nil then
						local var_46_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_3.prefab_name].transform, "story_v_out_108111", "108111011", "story_v_out_108111.awb")

						arg_43_1:RecordAudio("108111011", var_46_9)
						arg_43_1:RecordAudio("108111011", var_46_9)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_108111", "108111011", "story_v_out_108111.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_108111", "108111011", "story_v_out_108111.awb")
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
	Play108111012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 108111012
		arg_47_1.duration_ = 7.333

		local var_47_0 = {
			ja = 6.366,
			ko = 6.1,
			zh = 6.566,
			en = 7.333
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
				arg_47_0:Play108111013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0
			local var_50_1 = 0.575

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_2 = arg_47_1:FormatText(StoryNameCfg[161].name)

				arg_47_1.leftNameTxt_.text = var_50_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_3 = arg_47_1:GetWordFromCfg(108111012)
				local var_50_4 = arg_47_1:FormatText(var_50_3.content)

				arg_47_1.text_.text = var_50_4

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_5 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_108111", "108111012", "story_v_out_108111.awb") ~= 0 then
					local var_50_8 = manager.audio:GetVoiceLength("story_v_out_108111", "108111012", "story_v_out_108111.awb") / 1000

					if var_50_8 + var_50_0 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_8 + var_50_0
					end

					if var_50_3.prefab_name ~= "" and arg_47_1.actors_[var_50_3.prefab_name] ~= nil then
						local var_50_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_3.prefab_name].transform, "story_v_out_108111", "108111012", "story_v_out_108111.awb")

						arg_47_1:RecordAudio("108111012", var_50_9)
						arg_47_1:RecordAudio("108111012", var_50_9)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_108111", "108111012", "story_v_out_108111.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_108111", "108111012", "story_v_out_108111.awb")
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
	Play108111013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 108111013
		arg_51_1.duration_ = 5.366

		local var_51_0 = {
			ja = 5.366,
			ko = 2.966,
			zh = 5.1,
			en = 5.2
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
				arg_51_0:Play108111014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0
			local var_54_1 = 0.45

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_2 = arg_51_1:FormatText(StoryNameCfg[80].name)

				arg_51_1.leftNameTxt_.text = var_54_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_3 = arg_51_1:GetWordFromCfg(108111013)
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

				if manager.audio:GetVoiceLength("story_v_out_108111", "108111013", "story_v_out_108111.awb") ~= 0 then
					local var_54_8 = manager.audio:GetVoiceLength("story_v_out_108111", "108111013", "story_v_out_108111.awb") / 1000

					if var_54_8 + var_54_0 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_8 + var_54_0
					end

					if var_54_3.prefab_name ~= "" and arg_51_1.actors_[var_54_3.prefab_name] ~= nil then
						local var_54_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_3.prefab_name].transform, "story_v_out_108111", "108111013", "story_v_out_108111.awb")

						arg_51_1:RecordAudio("108111013", var_54_9)
						arg_51_1:RecordAudio("108111013", var_54_9)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_108111", "108111013", "story_v_out_108111.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_108111", "108111013", "story_v_out_108111.awb")
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
	Play108111014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 108111014
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play108111015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 0.100000001490116

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				local var_58_2 = "play"
				local var_58_3 = "effect"

				arg_55_1:AudioAction(var_58_2, var_58_3, "se_story_8", "se_story_8_door", "")
			end

			local var_58_4 = 0
			local var_58_5 = 0.35

			if var_58_4 < arg_55_1.time_ and arg_55_1.time_ <= var_58_4 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, false)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_6 = arg_55_1:GetWordFromCfg(108111014)
				local var_58_7 = arg_55_1:FormatText(var_58_6.content)

				arg_55_1.text_.text = var_58_7

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_8 = 14
				local var_58_9 = utf8.len(var_58_7)
				local var_58_10 = var_58_8 <= 0 and var_58_5 or var_58_5 * (var_58_9 / var_58_8)

				if var_58_10 > 0 and var_58_5 < var_58_10 then
					arg_55_1.talkMaxDuration = var_58_10

					if var_58_10 + var_58_4 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_10 + var_58_4
					end
				end

				arg_55_1.text_.text = var_58_7
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_11 = math.max(var_58_5, arg_55_1.talkMaxDuration)

			if var_58_4 <= arg_55_1.time_ and arg_55_1.time_ < var_58_4 + var_58_11 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_4) / var_58_11

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_4 + var_58_11 and arg_55_1.time_ < var_58_4 + var_58_11 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play108111015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 108111015
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play108111016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 0.775

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

				local var_62_2 = arg_59_1:GetWordFromCfg(108111015)
				local var_62_3 = arg_59_1:FormatText(var_62_2.content)

				arg_59_1.text_.text = var_62_3

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_4 = 31
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
	Play108111016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 108111016
		arg_63_1.duration_ = 5

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play108111017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 0
			local var_66_1 = 1.25

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

				local var_66_2 = arg_63_1:GetWordFromCfg(108111016)
				local var_66_3 = arg_63_1:FormatText(var_66_2.content)

				arg_63_1.text_.text = var_66_3

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_4 = 50
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
	Play108111017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 108111017
		arg_67_1.duration_ = 5

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play108111018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = 0
			local var_70_1 = 0.525

			if var_70_0 < arg_67_1.time_ and arg_67_1.time_ <= var_70_0 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, false)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_2 = arg_67_1:GetWordFromCfg(108111017)
				local var_70_3 = arg_67_1:FormatText(var_70_2.content)

				arg_67_1.text_.text = var_70_3

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_4 = 21
				local var_70_5 = utf8.len(var_70_3)
				local var_70_6 = var_70_4 <= 0 and var_70_1 or var_70_1 * (var_70_5 / var_70_4)

				if var_70_6 > 0 and var_70_1 < var_70_6 then
					arg_67_1.talkMaxDuration = var_70_6

					if var_70_6 + var_70_0 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_6 + var_70_0
					end
				end

				arg_67_1.text_.text = var_70_3
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)
				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_7 = math.max(var_70_1, arg_67_1.talkMaxDuration)

			if var_70_0 <= arg_67_1.time_ and arg_67_1.time_ < var_70_0 + var_70_7 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_0) / var_70_7

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_0 + var_70_7 and arg_67_1.time_ < var_70_0 + var_70_7 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play108111018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 108111018
		arg_71_1.duration_ = 13.1663333333333

		local var_71_0 = {
			ja = 12.6333333333333,
			ko = 9.83333333333333,
			zh = 13.1663333333333,
			en = 12.7333333333333
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
				arg_71_0:Play108111019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.bgs_.S0805
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				local var_74_2 = var_74_0:GetComponent("SpriteRenderer")

				if var_74_2 then
					var_74_2.material = arg_71_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_74_3 = var_74_2.material
					local var_74_4 = var_74_3:GetColor("_Color")

					arg_71_1.var_.alphaOldValueS0805 = var_74_4.a
					arg_71_1.var_.alphaMatValueS0805 = var_74_3
				end

				arg_71_1.var_.alphaOldValueS0805 = 1
			end

			local var_74_5 = 1.5

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_5 then
				local var_74_6 = (arg_71_1.time_ - var_74_1) / var_74_5
				local var_74_7 = Mathf.Lerp(arg_71_1.var_.alphaOldValueS0805, 0, var_74_6)

				if arg_71_1.var_.alphaMatValueS0805 then
					local var_74_8 = arg_71_1.var_.alphaMatValueS0805
					local var_74_9 = var_74_8:GetColor("_Color")

					var_74_9.a = var_74_7

					var_74_8:SetColor("_Color", var_74_9)
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_5 and arg_71_1.time_ < var_74_1 + var_74_5 + arg_74_0 and arg_71_1.var_.alphaMatValueS0805 then
				local var_74_10 = arg_71_1.var_.alphaMatValueS0805
				local var_74_11 = var_74_10:GetColor("_Color")

				var_74_11.a = 0

				var_74_10:SetColor("_Color", var_74_11)
			end

			local var_74_12 = 1.33333333333333
			local var_74_13 = 0.85

			if var_74_12 < arg_71_1.time_ and arg_71_1.time_ <= var_74_12 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, false)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_14 = arg_71_1:GetWordFromCfg(108111018)
				local var_74_15 = arg_71_1:FormatText(var_74_14.content)

				arg_71_1.text_.text = var_74_15

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_16 = 32
				local var_74_17 = utf8.len(var_74_15)
				local var_74_18 = var_74_16 <= 0 and var_74_13 or var_74_13 * (var_74_17 / var_74_16)

				if var_74_18 > 0 and var_74_13 < var_74_18 then
					arg_71_1.talkMaxDuration = var_74_18

					if var_74_18 + var_74_12 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_18 + var_74_12
					end
				end

				arg_71_1.text_.text = var_74_15
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_108111", "108111018", "story_v_out_108111.awb") ~= 0 then
					local var_74_19 = manager.audio:GetVoiceLength("story_v_out_108111", "108111018", "story_v_out_108111.awb") / 1000

					if var_74_19 + var_74_12 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_19 + var_74_12
					end

					if var_74_14.prefab_name ~= "" and arg_71_1.actors_[var_74_14.prefab_name] ~= nil then
						local var_74_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_14.prefab_name].transform, "story_v_out_108111", "108111018", "story_v_out_108111.awb")

						arg_71_1:RecordAudio("108111018", var_74_20)
						arg_71_1:RecordAudio("108111018", var_74_20)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_108111", "108111018", "story_v_out_108111.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_108111", "108111018", "story_v_out_108111.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_21 = math.max(var_74_13, arg_71_1.talkMaxDuration)

			if var_74_12 <= arg_71_1.time_ and arg_71_1.time_ < var_74_12 + var_74_21 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_12) / var_74_21

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_12 + var_74_21 and arg_71_1.time_ < var_74_12 + var_74_21 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play108111019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 108111019
		arg_75_1.duration_ = 6.066

		local var_75_0 = {
			ja = 6.066,
			ko = 3.366,
			zh = 5.5,
			en = 5.2
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
				arg_75_0:Play108111020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = "C05b"

			if arg_75_1.bgs_[var_78_0] == nil then
				local var_78_1 = Object.Instantiate(arg_75_1.paintGo_)

				var_78_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_78_0)
				var_78_1.name = var_78_0
				var_78_1.transform.parent = arg_75_1.stage_.transform
				var_78_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_75_1.bgs_[var_78_0] = var_78_1
			end

			local var_78_2 = 0

			if var_78_2 < arg_75_1.time_ and arg_75_1.time_ <= var_78_2 + arg_78_0 then
				local var_78_3 = manager.ui.mainCamera.transform.localPosition
				local var_78_4 = Vector3.New(0, 0, 10) + Vector3.New(var_78_3.x, var_78_3.y, 0)
				local var_78_5 = arg_75_1.bgs_.C05b

				var_78_5.transform.localPosition = var_78_4
				var_78_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_78_6 = var_78_5:GetComponent("SpriteRenderer")

				if var_78_6 and var_78_6.sprite then
					local var_78_7 = (var_78_5.transform.localPosition - var_78_3).z
					local var_78_8 = manager.ui.mainCameraCom_
					local var_78_9 = 2 * var_78_7 * Mathf.Tan(var_78_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_78_10 = var_78_9 * var_78_8.aspect
					local var_78_11 = var_78_6.sprite.bounds.size.x
					local var_78_12 = var_78_6.sprite.bounds.size.y
					local var_78_13 = var_78_10 / var_78_11
					local var_78_14 = var_78_9 / var_78_12
					local var_78_15 = var_78_14 < var_78_13 and var_78_13 or var_78_14

					var_78_5.transform.localScale = Vector3.New(var_78_15, var_78_15, 0)
				end

				for iter_78_0, iter_78_1 in pairs(arg_75_1.bgs_) do
					if iter_78_0 ~= "C05b" then
						iter_78_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_78_16 = arg_75_1.bgs_.C05b
			local var_78_17 = 0

			if var_78_17 < arg_75_1.time_ and arg_75_1.time_ <= var_78_17 + arg_78_0 then
				local var_78_18 = var_78_16:GetComponent("SpriteRenderer")

				if var_78_18 then
					var_78_18.material = arg_75_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_78_19 = var_78_18.material
					local var_78_20 = var_78_19:GetColor("_Color")

					arg_75_1.var_.alphaOldValueC05b = var_78_20.a
					arg_75_1.var_.alphaMatValueC05b = var_78_19
				end

				arg_75_1.var_.alphaOldValueC05b = 0
			end

			local var_78_21 = 1.5

			if var_78_17 <= arg_75_1.time_ and arg_75_1.time_ < var_78_17 + var_78_21 then
				local var_78_22 = (arg_75_1.time_ - var_78_17) / var_78_21
				local var_78_23 = Mathf.Lerp(arg_75_1.var_.alphaOldValueC05b, 1, var_78_22)

				if arg_75_1.var_.alphaMatValueC05b then
					local var_78_24 = arg_75_1.var_.alphaMatValueC05b
					local var_78_25 = var_78_24:GetColor("_Color")

					var_78_25.a = var_78_23

					var_78_24:SetColor("_Color", var_78_25)
				end
			end

			if arg_75_1.time_ >= var_78_17 + var_78_21 and arg_75_1.time_ < var_78_17 + var_78_21 + arg_78_0 and arg_75_1.var_.alphaMatValueC05b then
				local var_78_26 = arg_75_1.var_.alphaMatValueC05b
				local var_78_27 = var_78_26:GetColor("_Color")

				var_78_27.a = 1

				var_78_26:SetColor("_Color", var_78_27)
			end

			local var_78_28 = "4015_tpose"

			if arg_75_1.actors_[var_78_28] == nil then
				local var_78_29 = Object.Instantiate(Asset.Load("Char/" .. var_78_28), arg_75_1.stage_.transform)

				var_78_29.name = var_78_28
				var_78_29.transform.localPosition = Vector3.New(0, 100, 0)
				arg_75_1.actors_[var_78_28] = var_78_29

				local var_78_30 = var_78_29:GetComponentInChildren(typeof(CharacterEffect))

				var_78_30.enabled = true

				local var_78_31 = GameObjectTools.GetOrAddComponent(var_78_29, typeof(DynamicBoneHelper))

				if var_78_31 then
					var_78_31:EnableDynamicBone(false)
				end

				arg_75_1:ShowWeapon(var_78_30.transform, false)

				arg_75_1.var_[var_78_28 .. "Animator"] = var_78_30.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_75_1.var_[var_78_28 .. "Animator"].applyRootMotion = true
				arg_75_1.var_[var_78_28 .. "LipSync"] = var_78_30.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_78_32 = arg_75_1.actors_["4015_tpose"].transform
			local var_78_33 = 2

			if var_78_33 < arg_75_1.time_ and arg_75_1.time_ <= var_78_33 + arg_78_0 then
				arg_75_1.var_.moveOldPos4015_tpose = var_78_32.localPosition
			end

			local var_78_34 = 0.001

			if var_78_33 <= arg_75_1.time_ and arg_75_1.time_ < var_78_33 + var_78_34 then
				local var_78_35 = (arg_75_1.time_ - var_78_33) / var_78_34
				local var_78_36 = Vector3.New(0, -2.65, -2)

				var_78_32.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos4015_tpose, var_78_36, var_78_35)

				local var_78_37 = manager.ui.mainCamera.transform.position - var_78_32.position

				var_78_32.forward = Vector3.New(var_78_37.x, var_78_37.y, var_78_37.z)

				local var_78_38 = var_78_32.localEulerAngles

				var_78_38.z = 0
				var_78_38.x = 0
				var_78_32.localEulerAngles = var_78_38
			end

			if arg_75_1.time_ >= var_78_33 + var_78_34 and arg_75_1.time_ < var_78_33 + var_78_34 + arg_78_0 then
				var_78_32.localPosition = Vector3.New(0, -2.65, -2)

				local var_78_39 = manager.ui.mainCamera.transform.position - var_78_32.position

				var_78_32.forward = Vector3.New(var_78_39.x, var_78_39.y, var_78_39.z)

				local var_78_40 = var_78_32.localEulerAngles

				var_78_40.z = 0
				var_78_40.x = 0
				var_78_32.localEulerAngles = var_78_40
			end

			local var_78_41 = arg_75_1.actors_["4015_tpose"]
			local var_78_42 = 2

			if var_78_42 < arg_75_1.time_ and arg_75_1.time_ <= var_78_42 + arg_78_0 and arg_75_1.var_.characterEffect4015_tpose == nil then
				arg_75_1.var_.characterEffect4015_tpose = var_78_41:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_43 = 0.2

			if var_78_42 <= arg_75_1.time_ and arg_75_1.time_ < var_78_42 + var_78_43 then
				local var_78_44 = (arg_75_1.time_ - var_78_42) / var_78_43

				if arg_75_1.var_.characterEffect4015_tpose then
					arg_75_1.var_.characterEffect4015_tpose.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_42 + var_78_43 and arg_75_1.time_ < var_78_42 + var_78_43 + arg_78_0 and arg_75_1.var_.characterEffect4015_tpose then
				arg_75_1.var_.characterEffect4015_tpose.fillFlat = false
			end

			local var_78_45 = 2

			if var_78_45 < arg_75_1.time_ and arg_75_1.time_ <= var_78_45 + arg_78_0 then
				arg_75_1:PlayTimeline("4015_tpose", "StoryTimeline/CharAction/story4015/story4015action/4015action1_1")
			end

			if arg_75_1.frameCnt_ <= 1 then
				arg_75_1.dialog_:SetActive(false)
			end

			local var_78_46 = 2
			local var_78_47 = 0.175

			if var_78_46 < arg_75_1.time_ and arg_75_1.time_ <= var_78_46 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0

				arg_75_1.dialog_:SetActive(true)

				local var_78_48 = LeanTween.value(arg_75_1.dialog_, 0, 1, 0.3)

				var_78_48:setOnUpdate(LuaHelper.FloatAction(function(arg_79_0)
					arg_75_1.dialogCg_.alpha = arg_79_0
				end))
				var_78_48:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_75_1.dialog_)
					var_78_48:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_75_1.duration_ = arg_75_1.duration_ + 0.3

				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_49 = arg_75_1:FormatText(StoryNameCfg[156].name)

				arg_75_1.leftNameTxt_.text = var_78_49

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_50 = arg_75_1:GetWordFromCfg(108111019)
				local var_78_51 = arg_75_1:FormatText(var_78_50.content)

				arg_75_1.text_.text = var_78_51

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_52 = 7
				local var_78_53 = utf8.len(var_78_51)
				local var_78_54 = var_78_52 <= 0 and var_78_47 or var_78_47 * (var_78_53 / var_78_52)

				if var_78_54 > 0 and var_78_47 < var_78_54 then
					arg_75_1.talkMaxDuration = var_78_54
					var_78_46 = var_78_46 + 0.3

					if var_78_54 + var_78_46 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_54 + var_78_46
					end
				end

				arg_75_1.text_.text = var_78_51
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_108111", "108111019", "story_v_out_108111.awb") ~= 0 then
					local var_78_55 = manager.audio:GetVoiceLength("story_v_out_108111", "108111019", "story_v_out_108111.awb") / 1000

					if var_78_55 + var_78_46 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_55 + var_78_46
					end

					if var_78_50.prefab_name ~= "" and arg_75_1.actors_[var_78_50.prefab_name] ~= nil then
						local var_78_56 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_50.prefab_name].transform, "story_v_out_108111", "108111019", "story_v_out_108111.awb")

						arg_75_1:RecordAudio("108111019", var_78_56)
						arg_75_1:RecordAudio("108111019", var_78_56)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_108111", "108111019", "story_v_out_108111.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_108111", "108111019", "story_v_out_108111.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_57 = var_78_46 + 0.3
			local var_78_58 = math.max(var_78_47, arg_75_1.talkMaxDuration)

			if var_78_57 <= arg_75_1.time_ and arg_75_1.time_ < var_78_57 + var_78_58 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_57) / var_78_58

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_57 + var_78_58 and arg_75_1.time_ < var_78_57 + var_78_58 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play108111020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 108111020
		arg_81_1.duration_ = 5

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play108111021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["4015_tpose"].transform
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 then
				arg_81_1.var_.moveOldPos4015_tpose = var_84_0.localPosition
			end

			local var_84_2 = 0.001

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_2 then
				local var_84_3 = (arg_81_1.time_ - var_84_1) / var_84_2
				local var_84_4 = Vector3.New(0, 100, 0)

				var_84_0.localPosition = Vector3.Lerp(arg_81_1.var_.moveOldPos4015_tpose, var_84_4, var_84_3)

				local var_84_5 = manager.ui.mainCamera.transform.position - var_84_0.position

				var_84_0.forward = Vector3.New(var_84_5.x, var_84_5.y, var_84_5.z)

				local var_84_6 = var_84_0.localEulerAngles

				var_84_6.z = 0
				var_84_6.x = 0
				var_84_0.localEulerAngles = var_84_6
			end

			if arg_81_1.time_ >= var_84_1 + var_84_2 and arg_81_1.time_ < var_84_1 + var_84_2 + arg_84_0 then
				var_84_0.localPosition = Vector3.New(0, 100, 0)

				local var_84_7 = manager.ui.mainCamera.transform.position - var_84_0.position

				var_84_0.forward = Vector3.New(var_84_7.x, var_84_7.y, var_84_7.z)

				local var_84_8 = var_84_0.localEulerAngles

				var_84_8.z = 0
				var_84_8.x = 0
				var_84_0.localEulerAngles = var_84_8
			end

			local var_84_9 = 0
			local var_84_10 = 0.825

			if var_84_9 < arg_81_1.time_ and arg_81_1.time_ <= var_84_9 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, false)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_11 = arg_81_1:GetWordFromCfg(108111020)
				local var_84_12 = arg_81_1:FormatText(var_84_11.content)

				arg_81_1.text_.text = var_84_12

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_13 = 33
				local var_84_14 = utf8.len(var_84_12)
				local var_84_15 = var_84_13 <= 0 and var_84_10 or var_84_10 * (var_84_14 / var_84_13)

				if var_84_15 > 0 and var_84_10 < var_84_15 then
					arg_81_1.talkMaxDuration = var_84_15

					if var_84_15 + var_84_9 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_15 + var_84_9
					end
				end

				arg_81_1.text_.text = var_84_12
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)
				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_16 = math.max(var_84_10, arg_81_1.talkMaxDuration)

			if var_84_9 <= arg_81_1.time_ and arg_81_1.time_ < var_84_9 + var_84_16 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_9) / var_84_16

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_9 + var_84_16 and arg_81_1.time_ < var_84_9 + var_84_16 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play108111021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 108111021
		arg_85_1.duration_ = 5

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play108111022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 0
			local var_88_1 = 1

			if var_88_0 < arg_85_1.time_ and arg_85_1.time_ <= var_88_0 + arg_88_0 then
				local var_88_2 = "play"
				local var_88_3 = "effect"

				arg_85_1:AudioAction(var_88_2, var_88_3, "se_story_8", "se_story_8_jingyu", "")
			end

			local var_88_4 = 0
			local var_88_5 = 1.075

			if var_88_4 < arg_85_1.time_ and arg_85_1.time_ <= var_88_4 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, false)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_6 = arg_85_1:GetWordFromCfg(108111021)
				local var_88_7 = arg_85_1:FormatText(var_88_6.content)

				arg_85_1.text_.text = var_88_7

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_8 = 43
				local var_88_9 = utf8.len(var_88_7)
				local var_88_10 = var_88_8 <= 0 and var_88_5 or var_88_5 * (var_88_9 / var_88_8)

				if var_88_10 > 0 and var_88_5 < var_88_10 then
					arg_85_1.talkMaxDuration = var_88_10

					if var_88_10 + var_88_4 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_10 + var_88_4
					end
				end

				arg_85_1.text_.text = var_88_7
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)
				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_11 = math.max(var_88_5, arg_85_1.talkMaxDuration)

			if var_88_4 <= arg_85_1.time_ and arg_85_1.time_ < var_88_4 + var_88_11 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_4) / var_88_11

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_4 + var_88_11 and arg_85_1.time_ < var_88_4 + var_88_11 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play108111022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 108111022
		arg_89_1.duration_ = 5

		SetActive(arg_89_1.tipsGo_, false)

		function arg_89_1.onSingleLineFinish_()
			arg_89_1.onSingleLineUpdate_ = nil
			arg_89_1.onSingleLineFinish_ = nil
			arg_89_1.state_ = "waiting"
		end

		function arg_89_1.playNext_(arg_91_0)
			if arg_91_0 == 1 then
				arg_89_0:Play108111023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = 0
			local var_92_1 = 0.825

			if var_92_0 < arg_89_1.time_ and arg_89_1.time_ <= var_92_0 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, false)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_2 = arg_89_1:GetWordFromCfg(108111022)
				local var_92_3 = arg_89_1:FormatText(var_92_2.content)

				arg_89_1.text_.text = var_92_3

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_4 = 33
				local var_92_5 = utf8.len(var_92_3)
				local var_92_6 = var_92_4 <= 0 and var_92_1 or var_92_1 * (var_92_5 / var_92_4)

				if var_92_6 > 0 and var_92_1 < var_92_6 then
					arg_89_1.talkMaxDuration = var_92_6

					if var_92_6 + var_92_0 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_6 + var_92_0
					end
				end

				arg_89_1.text_.text = var_92_3
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)
				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_7 = math.max(var_92_1, arg_89_1.talkMaxDuration)

			if var_92_0 <= arg_89_1.time_ and arg_89_1.time_ < var_92_0 + var_92_7 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_0) / var_92_7

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_0 + var_92_7 and arg_89_1.time_ < var_92_0 + var_92_7 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play108111023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 108111023
		arg_93_1.duration_ = 2.4

		local var_93_0 = {
			ja = 2.4,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 1.999999999999
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
				arg_93_0:Play108111024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = "1084ui_story"

			if arg_93_1.actors_[var_96_0] == nil then
				local var_96_1 = Object.Instantiate(Asset.Load("Char/" .. var_96_0), arg_93_1.stage_.transform)

				var_96_1.name = var_96_0
				var_96_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_93_1.actors_[var_96_0] = var_96_1

				local var_96_2 = var_96_1:GetComponentInChildren(typeof(CharacterEffect))

				var_96_2.enabled = true

				local var_96_3 = GameObjectTools.GetOrAddComponent(var_96_1, typeof(DynamicBoneHelper))

				if var_96_3 then
					var_96_3:EnableDynamicBone(false)
				end

				arg_93_1:ShowWeapon(var_96_2.transform, false)

				arg_93_1.var_[var_96_0 .. "Animator"] = var_96_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_93_1.var_[var_96_0 .. "Animator"].applyRootMotion = true
				arg_93_1.var_[var_96_0 .. "LipSync"] = var_96_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_96_4 = arg_93_1.actors_["1084ui_story"].transform
			local var_96_5 = 0

			if var_96_5 < arg_93_1.time_ and arg_93_1.time_ <= var_96_5 + arg_96_0 then
				arg_93_1.var_.moveOldPos1084ui_story = var_96_4.localPosition
			end

			local var_96_6 = 0.001

			if var_96_5 <= arg_93_1.time_ and arg_93_1.time_ < var_96_5 + var_96_6 then
				local var_96_7 = (arg_93_1.time_ - var_96_5) / var_96_6
				local var_96_8 = Vector3.New(-0.7, -0.97, -6)

				var_96_4.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos1084ui_story, var_96_8, var_96_7)

				local var_96_9 = manager.ui.mainCamera.transform.position - var_96_4.position

				var_96_4.forward = Vector3.New(var_96_9.x, var_96_9.y, var_96_9.z)

				local var_96_10 = var_96_4.localEulerAngles

				var_96_10.z = 0
				var_96_10.x = 0
				var_96_4.localEulerAngles = var_96_10
			end

			if arg_93_1.time_ >= var_96_5 + var_96_6 and arg_93_1.time_ < var_96_5 + var_96_6 + arg_96_0 then
				var_96_4.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_96_11 = manager.ui.mainCamera.transform.position - var_96_4.position

				var_96_4.forward = Vector3.New(var_96_11.x, var_96_11.y, var_96_11.z)

				local var_96_12 = var_96_4.localEulerAngles

				var_96_12.z = 0
				var_96_12.x = 0
				var_96_4.localEulerAngles = var_96_12
			end

			local var_96_13 = arg_93_1.actors_["1084ui_story"]
			local var_96_14 = 0

			if var_96_14 < arg_93_1.time_ and arg_93_1.time_ <= var_96_14 + arg_96_0 and arg_93_1.var_.characterEffect1084ui_story == nil then
				arg_93_1.var_.characterEffect1084ui_story = var_96_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_15 = 0.2

			if var_96_14 <= arg_93_1.time_ and arg_93_1.time_ < var_96_14 + var_96_15 then
				local var_96_16 = (arg_93_1.time_ - var_96_14) / var_96_15

				if arg_93_1.var_.characterEffect1084ui_story then
					arg_93_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_93_1.time_ >= var_96_14 + var_96_15 and arg_93_1.time_ < var_96_14 + var_96_15 + arg_96_0 and arg_93_1.var_.characterEffect1084ui_story then
				arg_93_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_96_17 = 0

			if var_96_17 < arg_93_1.time_ and arg_93_1.time_ <= var_96_17 + arg_96_0 then
				arg_93_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_96_18 = 0

			if var_96_18 < arg_93_1.time_ and arg_93_1.time_ <= var_96_18 + arg_96_0 then
				arg_93_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_96_19 = 0
			local var_96_20 = 0.15

			if var_96_19 < arg_93_1.time_ and arg_93_1.time_ <= var_96_19 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_21 = arg_93_1:FormatText(StoryNameCfg[6].name)

				arg_93_1.leftNameTxt_.text = var_96_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_22 = arg_93_1:GetWordFromCfg(108111023)
				local var_96_23 = arg_93_1:FormatText(var_96_22.content)

				arg_93_1.text_.text = var_96_23

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_24 = 6
				local var_96_25 = utf8.len(var_96_23)
				local var_96_26 = var_96_24 <= 0 and var_96_20 or var_96_20 * (var_96_25 / var_96_24)

				if var_96_26 > 0 and var_96_20 < var_96_26 then
					arg_93_1.talkMaxDuration = var_96_26

					if var_96_26 + var_96_19 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_26 + var_96_19
					end
				end

				arg_93_1.text_.text = var_96_23
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_108111", "108111023", "story_v_out_108111.awb") ~= 0 then
					local var_96_27 = manager.audio:GetVoiceLength("story_v_out_108111", "108111023", "story_v_out_108111.awb") / 1000

					if var_96_27 + var_96_19 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_27 + var_96_19
					end

					if var_96_22.prefab_name ~= "" and arg_93_1.actors_[var_96_22.prefab_name] ~= nil then
						local var_96_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_22.prefab_name].transform, "story_v_out_108111", "108111023", "story_v_out_108111.awb")

						arg_93_1:RecordAudio("108111023", var_96_28)
						arg_93_1:RecordAudio("108111023", var_96_28)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_108111", "108111023", "story_v_out_108111.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_108111", "108111023", "story_v_out_108111.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_29 = math.max(var_96_20, arg_93_1.talkMaxDuration)

			if var_96_19 <= arg_93_1.time_ and arg_93_1.time_ < var_96_19 + var_96_29 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_19) / var_96_29

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_19 + var_96_29 and arg_93_1.time_ < var_96_19 + var_96_29 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play108111024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 108111024
		arg_97_1.duration_ = 8.966

		local var_97_0 = {
			ja = 7.466,
			ko = 8.966,
			zh = 7.6,
			en = 6.466
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
				arg_97_0:Play108111025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = "1038ui_story"

			if arg_97_1.actors_[var_100_0] == nil then
				local var_100_1 = Object.Instantiate(Asset.Load("Char/" .. var_100_0), arg_97_1.stage_.transform)

				var_100_1.name = var_100_0
				var_100_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_97_1.actors_[var_100_0] = var_100_1

				local var_100_2 = var_100_1:GetComponentInChildren(typeof(CharacterEffect))

				var_100_2.enabled = true

				local var_100_3 = GameObjectTools.GetOrAddComponent(var_100_1, typeof(DynamicBoneHelper))

				if var_100_3 then
					var_100_3:EnableDynamicBone(false)
				end

				arg_97_1:ShowWeapon(var_100_2.transform, false)

				arg_97_1.var_[var_100_0 .. "Animator"] = var_100_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_97_1.var_[var_100_0 .. "Animator"].applyRootMotion = true
				arg_97_1.var_[var_100_0 .. "LipSync"] = var_100_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_100_4 = arg_97_1.actors_["1038ui_story"].transform
			local var_100_5 = 0

			if var_100_5 < arg_97_1.time_ and arg_97_1.time_ <= var_100_5 + arg_100_0 then
				arg_97_1.var_.moveOldPos1038ui_story = var_100_4.localPosition
			end

			local var_100_6 = 0.001

			if var_100_5 <= arg_97_1.time_ and arg_97_1.time_ < var_100_5 + var_100_6 then
				local var_100_7 = (arg_97_1.time_ - var_100_5) / var_100_6
				local var_100_8 = Vector3.New(0.7, -1.11, -5.9)

				var_100_4.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos1038ui_story, var_100_8, var_100_7)

				local var_100_9 = manager.ui.mainCamera.transform.position - var_100_4.position

				var_100_4.forward = Vector3.New(var_100_9.x, var_100_9.y, var_100_9.z)

				local var_100_10 = var_100_4.localEulerAngles

				var_100_10.z = 0
				var_100_10.x = 0
				var_100_4.localEulerAngles = var_100_10
			end

			if arg_97_1.time_ >= var_100_5 + var_100_6 and arg_97_1.time_ < var_100_5 + var_100_6 + arg_100_0 then
				var_100_4.localPosition = Vector3.New(0.7, -1.11, -5.9)

				local var_100_11 = manager.ui.mainCamera.transform.position - var_100_4.position

				var_100_4.forward = Vector3.New(var_100_11.x, var_100_11.y, var_100_11.z)

				local var_100_12 = var_100_4.localEulerAngles

				var_100_12.z = 0
				var_100_12.x = 0
				var_100_4.localEulerAngles = var_100_12
			end

			local var_100_13 = arg_97_1.actors_["1038ui_story"]
			local var_100_14 = 0

			if var_100_14 < arg_97_1.time_ and arg_97_1.time_ <= var_100_14 + arg_100_0 and arg_97_1.var_.characterEffect1038ui_story == nil then
				arg_97_1.var_.characterEffect1038ui_story = var_100_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_15 = 0.2

			if var_100_14 <= arg_97_1.time_ and arg_97_1.time_ < var_100_14 + var_100_15 then
				local var_100_16 = (arg_97_1.time_ - var_100_14) / var_100_15

				if arg_97_1.var_.characterEffect1038ui_story then
					arg_97_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_97_1.time_ >= var_100_14 + var_100_15 and arg_97_1.time_ < var_100_14 + var_100_15 + arg_100_0 and arg_97_1.var_.characterEffect1038ui_story then
				arg_97_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_100_17 = arg_97_1.actors_["1084ui_story"]
			local var_100_18 = 0

			if var_100_18 < arg_97_1.time_ and arg_97_1.time_ <= var_100_18 + arg_100_0 and arg_97_1.var_.characterEffect1084ui_story == nil then
				arg_97_1.var_.characterEffect1084ui_story = var_100_17:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_19 = 0.2

			if var_100_18 <= arg_97_1.time_ and arg_97_1.time_ < var_100_18 + var_100_19 then
				local var_100_20 = (arg_97_1.time_ - var_100_18) / var_100_19

				if arg_97_1.var_.characterEffect1084ui_story then
					local var_100_21 = Mathf.Lerp(0, 0.5, var_100_20)

					arg_97_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_97_1.var_.characterEffect1084ui_story.fillRatio = var_100_21
				end
			end

			if arg_97_1.time_ >= var_100_18 + var_100_19 and arg_97_1.time_ < var_100_18 + var_100_19 + arg_100_0 and arg_97_1.var_.characterEffect1084ui_story then
				local var_100_22 = 0.5

				arg_97_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_97_1.var_.characterEffect1084ui_story.fillRatio = var_100_22
			end

			local var_100_23 = 0

			if var_100_23 < arg_97_1.time_ and arg_97_1.time_ <= var_100_23 + arg_100_0 then
				arg_97_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action5_1")
			end

			local var_100_24 = 0

			if var_100_24 < arg_97_1.time_ and arg_97_1.time_ <= var_100_24 + arg_100_0 then
				arg_97_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_100_25 = 0
			local var_100_26 = 0.8

			if var_100_25 < arg_97_1.time_ and arg_97_1.time_ <= var_100_25 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_27 = arg_97_1:FormatText(StoryNameCfg[94].name)

				arg_97_1.leftNameTxt_.text = var_100_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_28 = arg_97_1:GetWordFromCfg(108111024)
				local var_100_29 = arg_97_1:FormatText(var_100_28.content)

				arg_97_1.text_.text = var_100_29

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_30 = 32
				local var_100_31 = utf8.len(var_100_29)
				local var_100_32 = var_100_30 <= 0 and var_100_26 or var_100_26 * (var_100_31 / var_100_30)

				if var_100_32 > 0 and var_100_26 < var_100_32 then
					arg_97_1.talkMaxDuration = var_100_32

					if var_100_32 + var_100_25 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_32 + var_100_25
					end
				end

				arg_97_1.text_.text = var_100_29
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_108111", "108111024", "story_v_out_108111.awb") ~= 0 then
					local var_100_33 = manager.audio:GetVoiceLength("story_v_out_108111", "108111024", "story_v_out_108111.awb") / 1000

					if var_100_33 + var_100_25 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_33 + var_100_25
					end

					if var_100_28.prefab_name ~= "" and arg_97_1.actors_[var_100_28.prefab_name] ~= nil then
						local var_100_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_28.prefab_name].transform, "story_v_out_108111", "108111024", "story_v_out_108111.awb")

						arg_97_1:RecordAudio("108111024", var_100_34)
						arg_97_1:RecordAudio("108111024", var_100_34)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_108111", "108111024", "story_v_out_108111.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_108111", "108111024", "story_v_out_108111.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_35 = math.max(var_100_26, arg_97_1.talkMaxDuration)

			if var_100_25 <= arg_97_1.time_ and arg_97_1.time_ < var_100_25 + var_100_35 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_25) / var_100_35

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_25 + var_100_35 and arg_97_1.time_ < var_100_25 + var_100_35 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play108111025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 108111025
		arg_101_1.duration_ = 5

		SetActive(arg_101_1.tipsGo_, false)

		function arg_101_1.onSingleLineFinish_()
			arg_101_1.onSingleLineUpdate_ = nil
			arg_101_1.onSingleLineFinish_ = nil
			arg_101_1.state_ = "waiting"
		end

		function arg_101_1.playNext_(arg_103_0)
			if arg_103_0 == 1 then
				arg_101_0:Play108111026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["1084ui_story"].transform
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 then
				arg_101_1.var_.moveOldPos1084ui_story = var_104_0.localPosition
			end

			local var_104_2 = 0.001

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2
				local var_104_4 = Vector3.New(0, 100, 0)

				var_104_0.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos1084ui_story, var_104_4, var_104_3)

				local var_104_5 = manager.ui.mainCamera.transform.position - var_104_0.position

				var_104_0.forward = Vector3.New(var_104_5.x, var_104_5.y, var_104_5.z)

				local var_104_6 = var_104_0.localEulerAngles

				var_104_6.z = 0
				var_104_6.x = 0
				var_104_0.localEulerAngles = var_104_6
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 then
				var_104_0.localPosition = Vector3.New(0, 100, 0)

				local var_104_7 = manager.ui.mainCamera.transform.position - var_104_0.position

				var_104_0.forward = Vector3.New(var_104_7.x, var_104_7.y, var_104_7.z)

				local var_104_8 = var_104_0.localEulerAngles

				var_104_8.z = 0
				var_104_8.x = 0
				var_104_0.localEulerAngles = var_104_8
			end

			local var_104_9 = arg_101_1.actors_["1038ui_story"].transform
			local var_104_10 = 0

			if var_104_10 < arg_101_1.time_ and arg_101_1.time_ <= var_104_10 + arg_104_0 then
				arg_101_1.var_.moveOldPos1038ui_story = var_104_9.localPosition
			end

			local var_104_11 = 0.001

			if var_104_10 <= arg_101_1.time_ and arg_101_1.time_ < var_104_10 + var_104_11 then
				local var_104_12 = (arg_101_1.time_ - var_104_10) / var_104_11
				local var_104_13 = Vector3.New(0, 100, 0)

				var_104_9.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos1038ui_story, var_104_13, var_104_12)

				local var_104_14 = manager.ui.mainCamera.transform.position - var_104_9.position

				var_104_9.forward = Vector3.New(var_104_14.x, var_104_14.y, var_104_14.z)

				local var_104_15 = var_104_9.localEulerAngles

				var_104_15.z = 0
				var_104_15.x = 0
				var_104_9.localEulerAngles = var_104_15
			end

			if arg_101_1.time_ >= var_104_10 + var_104_11 and arg_101_1.time_ < var_104_10 + var_104_11 + arg_104_0 then
				var_104_9.localPosition = Vector3.New(0, 100, 0)

				local var_104_16 = manager.ui.mainCamera.transform.position - var_104_9.position

				var_104_9.forward = Vector3.New(var_104_16.x, var_104_16.y, var_104_16.z)

				local var_104_17 = var_104_9.localEulerAngles

				var_104_17.z = 0
				var_104_17.x = 0
				var_104_9.localEulerAngles = var_104_17
			end

			local var_104_18 = 0
			local var_104_19 = 0.775

			if var_104_18 < arg_101_1.time_ and arg_101_1.time_ <= var_104_18 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, false)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_20 = arg_101_1:GetWordFromCfg(108111025)
				local var_104_21 = arg_101_1:FormatText(var_104_20.content)

				arg_101_1.text_.text = var_104_21

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_22 = 31
				local var_104_23 = utf8.len(var_104_21)
				local var_104_24 = var_104_22 <= 0 and var_104_19 or var_104_19 * (var_104_23 / var_104_22)

				if var_104_24 > 0 and var_104_19 < var_104_24 then
					arg_101_1.talkMaxDuration = var_104_24

					if var_104_24 + var_104_18 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_24 + var_104_18
					end
				end

				arg_101_1.text_.text = var_104_21
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)
				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_25 = math.max(var_104_19, arg_101_1.talkMaxDuration)

			if var_104_18 <= arg_101_1.time_ and arg_101_1.time_ < var_104_18 + var_104_25 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_18) / var_104_25

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_18 + var_104_25 and arg_101_1.time_ < var_104_18 + var_104_25 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play108111026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 108111026
		arg_105_1.duration_ = 7

		local var_105_0 = {
			ja = 7,
			ko = 4.4,
			zh = 5,
			en = 6.433
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
				arg_105_0:Play108111027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["1084ui_story"].transform
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 then
				arg_105_1.var_.moveOldPos1084ui_story = var_108_0.localPosition
			end

			local var_108_2 = 0.001

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2
				local var_108_4 = Vector3.New(-0.7, -0.97, -6)

				var_108_0.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos1084ui_story, var_108_4, var_108_3)

				local var_108_5 = manager.ui.mainCamera.transform.position - var_108_0.position

				var_108_0.forward = Vector3.New(var_108_5.x, var_108_5.y, var_108_5.z)

				local var_108_6 = var_108_0.localEulerAngles

				var_108_6.z = 0
				var_108_6.x = 0
				var_108_0.localEulerAngles = var_108_6
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 then
				var_108_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_108_7 = manager.ui.mainCamera.transform.position - var_108_0.position

				var_108_0.forward = Vector3.New(var_108_7.x, var_108_7.y, var_108_7.z)

				local var_108_8 = var_108_0.localEulerAngles

				var_108_8.z = 0
				var_108_8.x = 0
				var_108_0.localEulerAngles = var_108_8
			end

			local var_108_9 = arg_105_1.actors_["1084ui_story"]
			local var_108_10 = 0

			if var_108_10 < arg_105_1.time_ and arg_105_1.time_ <= var_108_10 + arg_108_0 and arg_105_1.var_.characterEffect1084ui_story == nil then
				arg_105_1.var_.characterEffect1084ui_story = var_108_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_11 = 0.2

			if var_108_10 <= arg_105_1.time_ and arg_105_1.time_ < var_108_10 + var_108_11 then
				local var_108_12 = (arg_105_1.time_ - var_108_10) / var_108_11

				if arg_105_1.var_.characterEffect1084ui_story then
					arg_105_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_105_1.time_ >= var_108_10 + var_108_11 and arg_105_1.time_ < var_108_10 + var_108_11 + arg_108_0 and arg_105_1.var_.characterEffect1084ui_story then
				arg_105_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_108_13 = 0

			if var_108_13 < arg_105_1.time_ and arg_105_1.time_ <= var_108_13 + arg_108_0 then
				arg_105_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_108_14 = 5.89805981832114e-17

			if var_108_14 < arg_105_1.time_ and arg_105_1.time_ <= var_108_14 + arg_108_0 then
				arg_105_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_108_15 = 0
			local var_108_16 = 0.35

			if var_108_15 < arg_105_1.time_ and arg_105_1.time_ <= var_108_15 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_17 = arg_105_1:FormatText(StoryNameCfg[6].name)

				arg_105_1.leftNameTxt_.text = var_108_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_18 = arg_105_1:GetWordFromCfg(108111026)
				local var_108_19 = arg_105_1:FormatText(var_108_18.content)

				arg_105_1.text_.text = var_108_19

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_20 = 14
				local var_108_21 = utf8.len(var_108_19)
				local var_108_22 = var_108_20 <= 0 and var_108_16 or var_108_16 * (var_108_21 / var_108_20)

				if var_108_22 > 0 and var_108_16 < var_108_22 then
					arg_105_1.talkMaxDuration = var_108_22

					if var_108_22 + var_108_15 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_22 + var_108_15
					end
				end

				arg_105_1.text_.text = var_108_19
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_108111", "108111026", "story_v_out_108111.awb") ~= 0 then
					local var_108_23 = manager.audio:GetVoiceLength("story_v_out_108111", "108111026", "story_v_out_108111.awb") / 1000

					if var_108_23 + var_108_15 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_23 + var_108_15
					end

					if var_108_18.prefab_name ~= "" and arg_105_1.actors_[var_108_18.prefab_name] ~= nil then
						local var_108_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_18.prefab_name].transform, "story_v_out_108111", "108111026", "story_v_out_108111.awb")

						arg_105_1:RecordAudio("108111026", var_108_24)
						arg_105_1:RecordAudio("108111026", var_108_24)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_108111", "108111026", "story_v_out_108111.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_108111", "108111026", "story_v_out_108111.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_25 = math.max(var_108_16, arg_105_1.talkMaxDuration)

			if var_108_15 <= arg_105_1.time_ and arg_105_1.time_ < var_108_15 + var_108_25 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_15) / var_108_25

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_15 + var_108_25 and arg_105_1.time_ < var_108_15 + var_108_25 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play108111027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 108111027
		arg_109_1.duration_ = 12.833

		local var_109_0 = {
			ja = 12.833,
			ko = 8.066,
			zh = 6.5,
			en = 7.466
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
				arg_109_0:Play108111028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["1038ui_story"].transform
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 then
				arg_109_1.var_.moveOldPos1038ui_story = var_112_0.localPosition
			end

			local var_112_2 = 0.001

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_2 then
				local var_112_3 = (arg_109_1.time_ - var_112_1) / var_112_2
				local var_112_4 = Vector3.New(0.7, -1.11, -5.9)

				var_112_0.localPosition = Vector3.Lerp(arg_109_1.var_.moveOldPos1038ui_story, var_112_4, var_112_3)

				local var_112_5 = manager.ui.mainCamera.transform.position - var_112_0.position

				var_112_0.forward = Vector3.New(var_112_5.x, var_112_5.y, var_112_5.z)

				local var_112_6 = var_112_0.localEulerAngles

				var_112_6.z = 0
				var_112_6.x = 0
				var_112_0.localEulerAngles = var_112_6
			end

			if arg_109_1.time_ >= var_112_1 + var_112_2 and arg_109_1.time_ < var_112_1 + var_112_2 + arg_112_0 then
				var_112_0.localPosition = Vector3.New(0.7, -1.11, -5.9)

				local var_112_7 = manager.ui.mainCamera.transform.position - var_112_0.position

				var_112_0.forward = Vector3.New(var_112_7.x, var_112_7.y, var_112_7.z)

				local var_112_8 = var_112_0.localEulerAngles

				var_112_8.z = 0
				var_112_8.x = 0
				var_112_0.localEulerAngles = var_112_8
			end

			local var_112_9 = arg_109_1.actors_["1038ui_story"]
			local var_112_10 = 0

			if var_112_10 < arg_109_1.time_ and arg_109_1.time_ <= var_112_10 + arg_112_0 and arg_109_1.var_.characterEffect1038ui_story == nil then
				arg_109_1.var_.characterEffect1038ui_story = var_112_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_11 = 0.2

			if var_112_10 <= arg_109_1.time_ and arg_109_1.time_ < var_112_10 + var_112_11 then
				local var_112_12 = (arg_109_1.time_ - var_112_10) / var_112_11

				if arg_109_1.var_.characterEffect1038ui_story then
					arg_109_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_109_1.time_ >= var_112_10 + var_112_11 and arg_109_1.time_ < var_112_10 + var_112_11 + arg_112_0 and arg_109_1.var_.characterEffect1038ui_story then
				arg_109_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_112_13 = arg_109_1.actors_["1084ui_story"]
			local var_112_14 = 0

			if var_112_14 < arg_109_1.time_ and arg_109_1.time_ <= var_112_14 + arg_112_0 and arg_109_1.var_.characterEffect1084ui_story == nil then
				arg_109_1.var_.characterEffect1084ui_story = var_112_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_15 = 0.2

			if var_112_14 <= arg_109_1.time_ and arg_109_1.time_ < var_112_14 + var_112_15 then
				local var_112_16 = (arg_109_1.time_ - var_112_14) / var_112_15

				if arg_109_1.var_.characterEffect1084ui_story then
					local var_112_17 = Mathf.Lerp(0, 0.5, var_112_16)

					arg_109_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_109_1.var_.characterEffect1084ui_story.fillRatio = var_112_17
				end
			end

			if arg_109_1.time_ >= var_112_14 + var_112_15 and arg_109_1.time_ < var_112_14 + var_112_15 + arg_112_0 and arg_109_1.var_.characterEffect1084ui_story then
				local var_112_18 = 0.5

				arg_109_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_109_1.var_.characterEffect1084ui_story.fillRatio = var_112_18
			end

			local var_112_19 = 0

			if var_112_19 < arg_109_1.time_ and arg_109_1.time_ <= var_112_19 + arg_112_0 then
				arg_109_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action7_1")
			end

			local var_112_20 = 0

			if var_112_20 < arg_109_1.time_ and arg_109_1.time_ <= var_112_20 + arg_112_0 then
				arg_109_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_112_21 = 0
			local var_112_22 = 0.8

			if var_112_21 < arg_109_1.time_ and arg_109_1.time_ <= var_112_21 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_23 = arg_109_1:FormatText(StoryNameCfg[94].name)

				arg_109_1.leftNameTxt_.text = var_112_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_24 = arg_109_1:GetWordFromCfg(108111027)
				local var_112_25 = arg_109_1:FormatText(var_112_24.content)

				arg_109_1.text_.text = var_112_25

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_26 = 32
				local var_112_27 = utf8.len(var_112_25)
				local var_112_28 = var_112_26 <= 0 and var_112_22 or var_112_22 * (var_112_27 / var_112_26)

				if var_112_28 > 0 and var_112_22 < var_112_28 then
					arg_109_1.talkMaxDuration = var_112_28

					if var_112_28 + var_112_21 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_28 + var_112_21
					end
				end

				arg_109_1.text_.text = var_112_25
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_108111", "108111027", "story_v_out_108111.awb") ~= 0 then
					local var_112_29 = manager.audio:GetVoiceLength("story_v_out_108111", "108111027", "story_v_out_108111.awb") / 1000

					if var_112_29 + var_112_21 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_29 + var_112_21
					end

					if var_112_24.prefab_name ~= "" and arg_109_1.actors_[var_112_24.prefab_name] ~= nil then
						local var_112_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_24.prefab_name].transform, "story_v_out_108111", "108111027", "story_v_out_108111.awb")

						arg_109_1:RecordAudio("108111027", var_112_30)
						arg_109_1:RecordAudio("108111027", var_112_30)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_108111", "108111027", "story_v_out_108111.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_108111", "108111027", "story_v_out_108111.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_31 = math.max(var_112_22, arg_109_1.talkMaxDuration)

			if var_112_21 <= arg_109_1.time_ and arg_109_1.time_ < var_112_21 + var_112_31 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_21) / var_112_31

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_21 + var_112_31 and arg_109_1.time_ < var_112_21 + var_112_31 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play108111028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 108111028
		arg_113_1.duration_ = 7.733

		local var_113_0 = {
			ja = 7.733,
			ko = 6.1,
			zh = 5.8,
			en = 5.566
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
				arg_113_0:Play108111029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				arg_113_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_116_1 = 0
			local var_116_2 = 0.6

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_3 = arg_113_1:FormatText(StoryNameCfg[94].name)

				arg_113_1.leftNameTxt_.text = var_116_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_4 = arg_113_1:GetWordFromCfg(108111028)
				local var_116_5 = arg_113_1:FormatText(var_116_4.content)

				arg_113_1.text_.text = var_116_5

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_6 = 24
				local var_116_7 = utf8.len(var_116_5)
				local var_116_8 = var_116_6 <= 0 and var_116_2 or var_116_2 * (var_116_7 / var_116_6)

				if var_116_8 > 0 and var_116_2 < var_116_8 then
					arg_113_1.talkMaxDuration = var_116_8

					if var_116_8 + var_116_1 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_8 + var_116_1
					end
				end

				arg_113_1.text_.text = var_116_5
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_108111", "108111028", "story_v_out_108111.awb") ~= 0 then
					local var_116_9 = manager.audio:GetVoiceLength("story_v_out_108111", "108111028", "story_v_out_108111.awb") / 1000

					if var_116_9 + var_116_1 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_9 + var_116_1
					end

					if var_116_4.prefab_name ~= "" and arg_113_1.actors_[var_116_4.prefab_name] ~= nil then
						local var_116_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_4.prefab_name].transform, "story_v_out_108111", "108111028", "story_v_out_108111.awb")

						arg_113_1:RecordAudio("108111028", var_116_10)
						arg_113_1:RecordAudio("108111028", var_116_10)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_108111", "108111028", "story_v_out_108111.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_108111", "108111028", "story_v_out_108111.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_11 = math.max(var_116_2, arg_113_1.talkMaxDuration)

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_11 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_1) / var_116_11

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_1 + var_116_11 and arg_113_1.time_ < var_116_1 + var_116_11 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play108111029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 108111029
		arg_117_1.duration_ = 5.633

		local var_117_0 = {
			ja = 5.633,
			ko = 4.566,
			zh = 3.566,
			en = 4.366
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
				arg_117_0:Play108111030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["1038ui_story"].transform
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 then
				arg_117_1.var_.moveOldPos1038ui_story = var_120_0.localPosition
			end

			local var_120_2 = 0.001

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2
				local var_120_4 = Vector3.New(0, 100, 0)

				var_120_0.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos1038ui_story, var_120_4, var_120_3)

				local var_120_5 = manager.ui.mainCamera.transform.position - var_120_0.position

				var_120_0.forward = Vector3.New(var_120_5.x, var_120_5.y, var_120_5.z)

				local var_120_6 = var_120_0.localEulerAngles

				var_120_6.z = 0
				var_120_6.x = 0
				var_120_0.localEulerAngles = var_120_6
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 then
				var_120_0.localPosition = Vector3.New(0, 100, 0)

				local var_120_7 = manager.ui.mainCamera.transform.position - var_120_0.position

				var_120_0.forward = Vector3.New(var_120_7.x, var_120_7.y, var_120_7.z)

				local var_120_8 = var_120_0.localEulerAngles

				var_120_8.z = 0
				var_120_8.x = 0
				var_120_0.localEulerAngles = var_120_8
			end

			local var_120_9 = "1050ui_story"

			if arg_117_1.actors_[var_120_9] == nil then
				local var_120_10 = Object.Instantiate(Asset.Load("Char/" .. var_120_9), arg_117_1.stage_.transform)

				var_120_10.name = var_120_9
				var_120_10.transform.localPosition = Vector3.New(0, 100, 0)
				arg_117_1.actors_[var_120_9] = var_120_10

				local var_120_11 = var_120_10:GetComponentInChildren(typeof(CharacterEffect))

				var_120_11.enabled = true

				local var_120_12 = GameObjectTools.GetOrAddComponent(var_120_10, typeof(DynamicBoneHelper))

				if var_120_12 then
					var_120_12:EnableDynamicBone(false)
				end

				arg_117_1:ShowWeapon(var_120_11.transform, false)

				arg_117_1.var_[var_120_9 .. "Animator"] = var_120_11.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_117_1.var_[var_120_9 .. "Animator"].applyRootMotion = true
				arg_117_1.var_[var_120_9 .. "LipSync"] = var_120_11.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_120_13 = arg_117_1.actors_["1050ui_story"].transform
			local var_120_14 = 0

			if var_120_14 < arg_117_1.time_ and arg_117_1.time_ <= var_120_14 + arg_120_0 then
				arg_117_1.var_.moveOldPos1050ui_story = var_120_13.localPosition
			end

			local var_120_15 = 0.001

			if var_120_14 <= arg_117_1.time_ and arg_117_1.time_ < var_120_14 + var_120_15 then
				local var_120_16 = (arg_117_1.time_ - var_120_14) / var_120_15
				local var_120_17 = Vector3.New(0, -1, -6.1)

				var_120_13.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos1050ui_story, var_120_17, var_120_16)

				local var_120_18 = manager.ui.mainCamera.transform.position - var_120_13.position

				var_120_13.forward = Vector3.New(var_120_18.x, var_120_18.y, var_120_18.z)

				local var_120_19 = var_120_13.localEulerAngles

				var_120_19.z = 0
				var_120_19.x = 0
				var_120_13.localEulerAngles = var_120_19
			end

			if arg_117_1.time_ >= var_120_14 + var_120_15 and arg_117_1.time_ < var_120_14 + var_120_15 + arg_120_0 then
				var_120_13.localPosition = Vector3.New(0, -1, -6.1)

				local var_120_20 = manager.ui.mainCamera.transform.position - var_120_13.position

				var_120_13.forward = Vector3.New(var_120_20.x, var_120_20.y, var_120_20.z)

				local var_120_21 = var_120_13.localEulerAngles

				var_120_21.z = 0
				var_120_21.x = 0
				var_120_13.localEulerAngles = var_120_21
			end

			local var_120_22 = arg_117_1.actors_["1050ui_story"]
			local var_120_23 = 0

			if var_120_23 < arg_117_1.time_ and arg_117_1.time_ <= var_120_23 + arg_120_0 and arg_117_1.var_.characterEffect1050ui_story == nil then
				arg_117_1.var_.characterEffect1050ui_story = var_120_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_24 = 0.2

			if var_120_23 <= arg_117_1.time_ and arg_117_1.time_ < var_120_23 + var_120_24 then
				local var_120_25 = (arg_117_1.time_ - var_120_23) / var_120_24

				if arg_117_1.var_.characterEffect1050ui_story then
					arg_117_1.var_.characterEffect1050ui_story.fillFlat = false
				end
			end

			if arg_117_1.time_ >= var_120_23 + var_120_24 and arg_117_1.time_ < var_120_23 + var_120_24 + arg_120_0 and arg_117_1.var_.characterEffect1050ui_story then
				arg_117_1.var_.characterEffect1050ui_story.fillFlat = false
			end

			local var_120_26 = 0

			if var_120_26 < arg_117_1.time_ and arg_117_1.time_ <= var_120_26 + arg_120_0 then
				arg_117_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/1050/1050action/1050action3_1")
			end

			local var_120_27 = 0

			if var_120_27 < arg_117_1.time_ and arg_117_1.time_ <= var_120_27 + arg_120_0 then
				arg_117_1:PlayTimeline("1050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_120_28 = arg_117_1.actors_["1084ui_story"].transform
			local var_120_29 = 0

			if var_120_29 < arg_117_1.time_ and arg_117_1.time_ <= var_120_29 + arg_120_0 then
				arg_117_1.var_.moveOldPos1084ui_story = var_120_28.localPosition
			end

			local var_120_30 = 0.001

			if var_120_29 <= arg_117_1.time_ and arg_117_1.time_ < var_120_29 + var_120_30 then
				local var_120_31 = (arg_117_1.time_ - var_120_29) / var_120_30
				local var_120_32 = Vector3.New(0, 100, 0)

				var_120_28.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos1084ui_story, var_120_32, var_120_31)

				local var_120_33 = manager.ui.mainCamera.transform.position - var_120_28.position

				var_120_28.forward = Vector3.New(var_120_33.x, var_120_33.y, var_120_33.z)

				local var_120_34 = var_120_28.localEulerAngles

				var_120_34.z = 0
				var_120_34.x = 0
				var_120_28.localEulerAngles = var_120_34
			end

			if arg_117_1.time_ >= var_120_29 + var_120_30 and arg_117_1.time_ < var_120_29 + var_120_30 + arg_120_0 then
				var_120_28.localPosition = Vector3.New(0, 100, 0)

				local var_120_35 = manager.ui.mainCamera.transform.position - var_120_28.position

				var_120_28.forward = Vector3.New(var_120_35.x, var_120_35.y, var_120_35.z)

				local var_120_36 = var_120_28.localEulerAngles

				var_120_36.z = 0
				var_120_36.x = 0
				var_120_28.localEulerAngles = var_120_36
			end

			local var_120_37 = 0
			local var_120_38 = 0.425

			if var_120_37 < arg_117_1.time_ and arg_117_1.time_ <= var_120_37 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_39 = arg_117_1:FormatText(StoryNameCfg[74].name)

				arg_117_1.leftNameTxt_.text = var_120_39

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_40 = arg_117_1:GetWordFromCfg(108111029)
				local var_120_41 = arg_117_1:FormatText(var_120_40.content)

				arg_117_1.text_.text = var_120_41

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_42 = 17
				local var_120_43 = utf8.len(var_120_41)
				local var_120_44 = var_120_42 <= 0 and var_120_38 or var_120_38 * (var_120_43 / var_120_42)

				if var_120_44 > 0 and var_120_38 < var_120_44 then
					arg_117_1.talkMaxDuration = var_120_44

					if var_120_44 + var_120_37 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_44 + var_120_37
					end
				end

				arg_117_1.text_.text = var_120_41
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_108111", "108111029", "story_v_out_108111.awb") ~= 0 then
					local var_120_45 = manager.audio:GetVoiceLength("story_v_out_108111", "108111029", "story_v_out_108111.awb") / 1000

					if var_120_45 + var_120_37 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_45 + var_120_37
					end

					if var_120_40.prefab_name ~= "" and arg_117_1.actors_[var_120_40.prefab_name] ~= nil then
						local var_120_46 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_40.prefab_name].transform, "story_v_out_108111", "108111029", "story_v_out_108111.awb")

						arg_117_1:RecordAudio("108111029", var_120_46)
						arg_117_1:RecordAudio("108111029", var_120_46)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_108111", "108111029", "story_v_out_108111.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_108111", "108111029", "story_v_out_108111.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_47 = math.max(var_120_38, arg_117_1.talkMaxDuration)

			if var_120_37 <= arg_117_1.time_ and arg_117_1.time_ < var_120_37 + var_120_47 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_37) / var_120_47

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_37 + var_120_47 and arg_117_1.time_ < var_120_37 + var_120_47 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play108111030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 108111030
		arg_121_1.duration_ = 4.833

		local var_121_0 = {
			ja = 4.233,
			ko = 3.666,
			zh = 3.6,
			en = 4.833
		}
		local var_121_1 = manager.audio:GetLocalizationFlag()

		if var_121_0[var_121_1] ~= nil then
			arg_121_1.duration_ = var_121_0[var_121_1]
		end

		SetActive(arg_121_1.tipsGo_, false)

		function arg_121_1.onSingleLineFinish_()
			arg_121_1.onSingleLineUpdate_ = nil
			arg_121_1.onSingleLineFinish_ = nil
			arg_121_1.state_ = "waiting"
			arg_121_1.auto_ = false
		end

		function arg_121_1.playNext_(arg_123_0)
			arg_121_1.onStoryFinished_()
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["1084ui_story"]
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 and arg_121_1.var_.characterEffect1084ui_story == nil then
				arg_121_1.var_.characterEffect1084ui_story = var_124_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_2 = 0.2

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_2 then
				local var_124_3 = (arg_121_1.time_ - var_124_1) / var_124_2

				if arg_121_1.var_.characterEffect1084ui_story then
					arg_121_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_121_1.time_ >= var_124_1 + var_124_2 and arg_121_1.time_ < var_124_1 + var_124_2 + arg_124_0 and arg_121_1.var_.characterEffect1084ui_story then
				arg_121_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_124_4 = 0

			if var_124_4 < arg_121_1.time_ and arg_121_1.time_ <= var_124_4 + arg_124_0 then
				arg_121_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_1")
			end

			local var_124_5 = 0

			if var_124_5 < arg_121_1.time_ and arg_121_1.time_ <= var_124_5 + arg_124_0 then
				arg_121_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_124_6 = arg_121_1.actors_["1050ui_story"].transform
			local var_124_7 = 0

			if var_124_7 < arg_121_1.time_ and arg_121_1.time_ <= var_124_7 + arg_124_0 then
				arg_121_1.var_.moveOldPos1050ui_story = var_124_6.localPosition
			end

			local var_124_8 = 0.001

			if var_124_7 <= arg_121_1.time_ and arg_121_1.time_ < var_124_7 + var_124_8 then
				local var_124_9 = (arg_121_1.time_ - var_124_7) / var_124_8
				local var_124_10 = Vector3.New(0, 100, 0)

				var_124_6.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos1050ui_story, var_124_10, var_124_9)

				local var_124_11 = manager.ui.mainCamera.transform.position - var_124_6.position

				var_124_6.forward = Vector3.New(var_124_11.x, var_124_11.y, var_124_11.z)

				local var_124_12 = var_124_6.localEulerAngles

				var_124_12.z = 0
				var_124_12.x = 0
				var_124_6.localEulerAngles = var_124_12
			end

			if arg_121_1.time_ >= var_124_7 + var_124_8 and arg_121_1.time_ < var_124_7 + var_124_8 + arg_124_0 then
				var_124_6.localPosition = Vector3.New(0, 100, 0)

				local var_124_13 = manager.ui.mainCamera.transform.position - var_124_6.position

				var_124_6.forward = Vector3.New(var_124_13.x, var_124_13.y, var_124_13.z)

				local var_124_14 = var_124_6.localEulerAngles

				var_124_14.z = 0
				var_124_14.x = 0
				var_124_6.localEulerAngles = var_124_14
			end

			local var_124_15 = arg_121_1.actors_["1084ui_story"].transform
			local var_124_16 = 0

			if var_124_16 < arg_121_1.time_ and arg_121_1.time_ <= var_124_16 + arg_124_0 then
				arg_121_1.var_.moveOldPos1084ui_story = var_124_15.localPosition
			end

			local var_124_17 = 0.001

			if var_124_16 <= arg_121_1.time_ and arg_121_1.time_ < var_124_16 + var_124_17 then
				local var_124_18 = (arg_121_1.time_ - var_124_16) / var_124_17
				local var_124_19 = Vector3.New(0, -0.97, -6)

				var_124_15.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos1084ui_story, var_124_19, var_124_18)

				local var_124_20 = manager.ui.mainCamera.transform.position - var_124_15.position

				var_124_15.forward = Vector3.New(var_124_20.x, var_124_20.y, var_124_20.z)

				local var_124_21 = var_124_15.localEulerAngles

				var_124_21.z = 0
				var_124_21.x = 0
				var_124_15.localEulerAngles = var_124_21
			end

			if arg_121_1.time_ >= var_124_16 + var_124_17 and arg_121_1.time_ < var_124_16 + var_124_17 + arg_124_0 then
				var_124_15.localPosition = Vector3.New(0, -0.97, -6)

				local var_124_22 = manager.ui.mainCamera.transform.position - var_124_15.position

				var_124_15.forward = Vector3.New(var_124_22.x, var_124_22.y, var_124_22.z)

				local var_124_23 = var_124_15.localEulerAngles

				var_124_23.z = 0
				var_124_23.x = 0
				var_124_15.localEulerAngles = var_124_23
			end

			local var_124_24 = 0
			local var_124_25 = 0.35

			if var_124_24 < arg_121_1.time_ and arg_121_1.time_ <= var_124_24 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_26 = arg_121_1:FormatText(StoryNameCfg[6].name)

				arg_121_1.leftNameTxt_.text = var_124_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_27 = arg_121_1:GetWordFromCfg(108111030)
				local var_124_28 = arg_121_1:FormatText(var_124_27.content)

				arg_121_1.text_.text = var_124_28

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_29 = 14
				local var_124_30 = utf8.len(var_124_28)
				local var_124_31 = var_124_29 <= 0 and var_124_25 or var_124_25 * (var_124_30 / var_124_29)

				if var_124_31 > 0 and var_124_25 < var_124_31 then
					arg_121_1.talkMaxDuration = var_124_31

					if var_124_31 + var_124_24 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_31 + var_124_24
					end
				end

				arg_121_1.text_.text = var_124_28
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_108111", "108111030", "story_v_out_108111.awb") ~= 0 then
					local var_124_32 = manager.audio:GetVoiceLength("story_v_out_108111", "108111030", "story_v_out_108111.awb") / 1000

					if var_124_32 + var_124_24 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_32 + var_124_24
					end

					if var_124_27.prefab_name ~= "" and arg_121_1.actors_[var_124_27.prefab_name] ~= nil then
						local var_124_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_27.prefab_name].transform, "story_v_out_108111", "108111030", "story_v_out_108111.awb")

						arg_121_1:RecordAudio("108111030", var_124_33)
						arg_121_1:RecordAudio("108111030", var_124_33)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_108111", "108111030", "story_v_out_108111.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_108111", "108111030", "story_v_out_108111.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_34 = math.max(var_124_25, arg_121_1.talkMaxDuration)

			if var_124_24 <= arg_121_1.time_ and arg_121_1.time_ < var_124_24 + var_124_34 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_24) / var_124_34

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_24 + var_124_34 and arg_121_1.time_ < var_124_24 + var_124_34 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/S0805",
		"Assets/UIResources/UI_AB/TextureConfig/Background/C05b"
	},
	voices = {
		"story_v_out_108111.awb"
	}
}
